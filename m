Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2537038E
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 00:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C996F5FC;
	Fri, 30 Apr 2021 22:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAE66F5FA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619822090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpm0s98PPk+LRziQ39f8+GcKnbjyOFaJ1uQAUz/hEno=;
 b=V4Q93o0ZmO54XEfy7RWVbgozjl46j1OoG14eOUa0M985tfSQCvN/cO6/Uqz26TQjWcSiCV
 y3jtZZeG7+ZWkOeAyIoFGjwClp1bEkD05Kvkcp/ya5sdBIOfJby4M4MuCbNbxGHKFNgxUz
 5E8Dx+4nT5sg2jODNFOo3yHJI3xW98A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-qEtSHmXMMH6ql5ukG17RhA-1; Fri, 30 Apr 2021 18:34:47 -0400
X-MC-Unique: qEtSHmXMMH6ql5ukG17RhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3352107ACCA;
 Fri, 30 Apr 2021 22:34:45 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-36.rdu2.redhat.com
 [10.10.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF1E85D719;
 Fri, 30 Apr 2021 22:34:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/dp: Drop open-coded drm_dp_is_branch() in
 drm_dp_read_downstream_info()
Date: Fri, 30 Apr 2021 18:34:28 -0400
Message-Id: <20210430223428.10514-2-lyude@redhat.com>
In-Reply-To: <20210430223428.10514-1-lyude@redhat.com>
References: <20210430223428.10514-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed this while fixing another issue in drm_dp_read_downstream_info(),
the open coded DP_DOWNSTREAMPORT_PRESENT check here just duplicates what we
already do in drm_dp_is_branch(), so just get rid of it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 27c8c5bdf7d9..0f84df8798ab 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -677,9 +677,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
 	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
 
 	/* No downstream info to read */
-	if (!drm_dp_is_branch(dpcd) ||
-	    dpcd[DP_DPCD_REV] < DP_DPCD_REV_10 ||
-	    !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
+	if (!drm_dp_is_branch(dpcd) || dpcd[DP_DPCD_REV] < DP_DPCD_REV_10)
 		return 0;
 
 	/* Some branches advertise having 0 downstream ports, despite also advertising they have a
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
