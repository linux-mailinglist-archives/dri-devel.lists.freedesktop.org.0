Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B1F17C906
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 00:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A799C6EDA7;
	Fri,  6 Mar 2020 23:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC9D6EDA6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 23:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583538572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77mV7dMChSrLWq5rIbMFOAlvL63d0ZbvZ9seihNouTU=;
 b=JQIXSOMhPJgYyH558fmTXQI6gBk4bVfqnCZ5KRYOK+mPzl6t8ht+Rdd1T7RyncyOj5eSwZ
 dxyvF5rv/yTJzhi+kaMQOURlDCljNfj9oWlD+bLyLeRCaMgkJGGzM9QGWL+2hywoGCpGRD
 aLAqtCSHdJ6iH7srJpA3vabWjU2U1/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-G7T3Kw1sPsy-SN61B098Vw-1; Fri, 06 Mar 2020 18:49:30 -0500
X-MC-Unique: G7T3Kw1sPsy-SN61B098Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FBA51005509;
 Fri,  6 Mar 2020 23:49:29 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D58591D9D;
 Fri,  6 Mar 2020 23:49:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/dp_mst: Fix drm_dp_check_mstb_guid() return code
Date: Fri,  6 Mar 2020 18:49:22 -0500
Message-Id: <20200306234923.547873-3-lyude@redhat.com>
In-Reply-To: <20200306234923.547873-1-lyude@redhat.com>
References: <20200306234923.547873-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We actually expect this to return a 0 on success, or negative error code
on failure. In order to do that, we check whether or not we managed to
write the whole GUID and then return 0 if so, otherwise return a
negative error code. Also, let's add an error message here so it's a
little more obvious when this fails in the middle of a link address
probe.

This should fix issues with certain MST hubs seemingly stopping for no
reason in the middle of the link address probe process.

Fixes: cb897542c6d2 ("drm/dp_mst: Fix W=1 warnings")
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index e421c2d13267..b2ec6e8634ed 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2092,7 +2092,10 @@ static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, u8 *guid)
 		}
 	}
 
-	return ret;
+	if (ret < 16 && ret > 0)
+		return -EPROTO;
+
+	return ret == 16 ? 0 : ret;
 }
 
 static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
@@ -2907,8 +2910,14 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	drm_dp_dump_link_address(reply);
 
 	ret = drm_dp_check_mstb_guid(mstb, reply->guid);
-	if (ret)
+	if (ret) {
+		char buf[64];
+
+		drm_dp_mst_rad_to_str(mstb->rad, mstb->lct, buf, sizeof(buf));
+		DRM_ERROR("GUID check on %s failed: %d\n",
+			  buf, ret);
 		goto out;
+	}
 
 	for (i = 0; i < reply->nports; i++) {
 		port_mask |= BIT(reply->ports[i].port_number);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
