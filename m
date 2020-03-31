Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E519A04F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 22:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A926E891;
	Tue, 31 Mar 2020 20:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39026E890
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 20:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585688281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPyLCEva4DWYdYHhnQT+EM7KXWL0IAHW//2poJNhujY=;
 b=YQ1Mzh8w44lHx/1Q0Lvt0EzFcIJjs4gCI0WI9NswVrXWx286p/SKFc6Qf/zq8JpEPdRxVs
 5fQHDcyO7aa5saEKt3sNsn6cMi/9BGLI/mtqoDNJl5RQZj7xrOZXc79I2E6kzMFhMUjLia
 fBUsVwgemCWlROmxVHjNbVqDVjFxj1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-NqFd0o_HN22aVI13ZZqAsQ-1; Tue, 31 Mar 2020 16:57:56 -0400
X-MC-Unique: NqFd0o_HN22aVI13ZZqAsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C16D149D0;
 Tue, 31 Mar 2020 20:57:54 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-113-88.rdu2.redhat.com [10.10.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D80F99DE4;
 Tue, 31 Mar 2020 20:57:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amd/amdgpu_dm/mst: Remove ->destroy_connector()
 callback
Date: Tue, 31 Mar 2020 16:57:35 -0400
Message-Id: <20200331205740.135525-3-lyude@redhat.com>
In-Reply-To: <20200331205740.135525-1-lyude@redhat.com>
References: <20200331205740.135525-1-lyude@redhat.com>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Francis <David.Francis@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pankaj Bharadiya started cleaning up the MST connector callbacks a while
ago, as I pointed out that they are the same across every driver and
don't serve much purpose. There was one callback that was left over
though from amdgpu, that we delayed removing due to not being completely
sure as to whether or not it was needed.

So, I've read through said callback and can confirm it's not at all
needed. Pretty much all of the work that is done in
dm_dp_destroy_mst_connector() can be done in
dm_dp_mst_connector_destroy(). Additionally, I've removed some bits that
didn't actually do anything:

* Removed DRM_INFO message we were printing, this shouldn't be info
  level and there's more appropriate drm debugging flags that should be
  used instead
* Removed amdgpu_dm_update_freesync_caps() - reading into this function,
  it doesn't actually do anything important and I'm not sure why it was
  ever being called here
* Stop clearing aconnector->dc_sink - this also doesn't do anything
* Stop clearing link settings in dc_link - this also doesn't do anything
* Also, use shorter variable

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 39 ++++++-------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 7b3303efb1ff..09025ccc68ca 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -136,16 +136,23 @@ static ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 static void
 dm_dp_mst_connector_destroy(struct drm_connector *connector)
 {
-	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
-	struct amdgpu_encoder *amdgpu_encoder = amdgpu_dm_connector->mst_encoder;
+	struct amdgpu_dm_connector *aconnector =
+		to_amdgpu_dm_connector(connector);
+	struct amdgpu_encoder *amdgpu_encoder = aconnector->mst_encoder;
 
-	kfree(amdgpu_dm_connector->edid);
+	if (aconnector->dc_sink) {
+		dc_link_remove_remote_sink(aconnector->dc_link,
+					   aconnector->dc_sink);
+		dc_sink_release(aconnector->dc_sink);
+	}
+
+	kfree(aconnector->edid);
 
 	drm_encoder_cleanup(&amdgpu_encoder->base);
 	kfree(amdgpu_encoder);
 	drm_connector_cleanup(connector);
-	drm_dp_mst_put_port_malloc(amdgpu_dm_connector->port);
-	kfree(amdgpu_dm_connector);
+	drm_dp_mst_put_port_malloc(aconnector->port);
+	kfree(aconnector);
 }
 
 static int
@@ -436,30 +443,8 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return connector;
 }
 
-static void dm_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
-					struct drm_connector *connector)
-{
-	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-
-	DRM_INFO("DM_MST: Disabling connector: %p [id: %d] [master: %p]\n",
-		 aconnector, connector->base.id, aconnector->mst_port);
-
-	if (aconnector->dc_sink) {
-		amdgpu_dm_update_freesync_caps(connector, NULL);
-		dc_link_remove_remote_sink(aconnector->dc_link,
-					   aconnector->dc_sink);
-		dc_sink_release(aconnector->dc_sink);
-		aconnector->dc_sink = NULL;
-		aconnector->dc_link->cur_link_settings.lane_count = 0;
-	}
-
-	drm_connector_unregister(connector);
-	drm_connector_put(connector);
-}
-
 static const struct drm_dp_mst_topology_cbs dm_mst_cbs = {
 	.add_connector = dm_dp_add_mst_connector,
-	.destroy_connector = dm_dp_destroy_mst_connector,
 };
 
 void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
