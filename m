Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1019FEBB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 22:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8456E4C7;
	Mon,  6 Apr 2020 20:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C210C6E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586203629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQKxuqrjVuHJtGH+sCPXmBiaDbPaY/tOH+9DlgGPE98=;
 b=cRVcCXUBltW2ep2vcQH80HDqH2GxMiPbszvdKpBf+Jw4mianHsw4rNjn6VBNFUcOscm9/F
 kv8O8xAKLruRY0PttbJvz0B11m7Em2nd/XyaxVx2IUgrefCSNi9+U4y6zsvgZhNmbJykAt
 gf9klFlFkEv406YqSCOQAWYTW+AVQB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-3BULVlrANSCd6rg4Ub9CMA-1; Mon, 06 Apr 2020 16:07:08 -0400
X-MC-Unique: 3BULVlrANSCd6rg4Ub9CMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 866F28017CE;
 Mon,  6 Apr 2020 20:07:05 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-117-12.rdu2.redhat.com [10.10.117.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0DAD6EF97;
 Mon,  6 Apr 2020 20:07:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/dp_mst: Remove drm_dp_mst_has_audio()
Date: Mon,  6 Apr 2020 16:06:42 -0400
Message-Id: <20200406200646.1263435-2-lyude@redhat.com>
In-Reply-To: <20200406200646.1263435-1-lyude@redhat.com>
References: <20200406200646.1263435-1-lyude@redhat.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, David Airlie <airlied@linux.ie>,
 "Lee, Shawn C" <shawn.c.lee@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drive-by fix I noticed the other day - drm_dp_mst_has_audio() only ever
made sense back when we still had to validate ports before accessing
them in order to (attempt to) avoid NULL dereferences. Since we have
proper reference counting that guarantees we always can safely access
the MST port, there's no use in keeping this function around as all it
does is validate the port pointer before checking the audio status.

Note - drm_dp_mst_port->has_audio is technically protected by
drm_device->mode_config.connection_mutex, since it's only ever updated
from drm_dp_mst_get_edid(). Additionally, we change the declaration for
port in struct intel_connector to be properly typed, so we can directly
access it.

Changes since v1:
* Change type of intel_connector->port in a separate patch - Sean Paul

Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>
Reviewed-by: Sean Paul <sean@poorly.run>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c         | 21 -------------------
 .../drm/i915/display/intel_display_debugfs.c  | 10 ++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +--
 include/drm/drm_dp_mst_helper.h               |  2 --
 4 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 5b205aea58d4..8289d59b62da 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4063,27 +4063,6 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_dp_mst_detect_port);
 
-/**
- * drm_dp_mst_port_has_audio() - Check whether port has audio capability or not
- * @mgr: manager for this port
- * @port: unverified pointer to a port.
- *
- * This returns whether the port supports audio or not.
- */
-bool drm_dp_mst_port_has_audio(struct drm_dp_mst_topology_mgr *mgr,
-					struct drm_dp_mst_port *port)
-{
-	bool ret = false;
-
-	port = drm_dp_mst_topology_get_port_validated(mgr, port);
-	if (!port)
-		return ret;
-	ret = port->has_audio;
-	drm_dp_mst_topology_put_port(port);
-	return ret;
-}
-EXPORT_SYMBOL(drm_dp_mst_port_has_audio);
-
 /**
  * drm_dp_mst_get_edid() - get EDID for an MST port
  * @connector: toplevel connector to get EDID for
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 424f4e52f783..9f736420d83f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -631,15 +631,9 @@ static void intel_dp_info(struct seq_file *m,
 }
 
 static void intel_dp_mst_info(struct seq_file *m,
-			  struct intel_connector *intel_connector)
+			      struct intel_connector *intel_connector)
 {
-	struct intel_encoder *intel_encoder = intel_attached_encoder(intel_connector);
-	struct intel_dp_mst_encoder *intel_mst =
-		enc_to_mst(intel_encoder);
-	struct intel_digital_port *intel_dig_port = intel_mst->primary;
-	struct intel_dp *intel_dp = &intel_dig_port->dp;
-	bool has_audio = drm_dp_mst_port_has_audio(&intel_dp->mst_mgr,
-					intel_connector->port);
+	bool has_audio = intel_connector->port->has_audio;
 
 	seq_printf(m, "\taudio support: %s\n", yesno(has_audio));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 61605eb8c2af..c35efc9e628d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -114,8 +114,7 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 	if (intel_conn_state->force_audio == HDMI_AUDIO_AUTO)
 		pipe_config->has_audio =
-			drm_dp_mst_port_has_audio(&intel_dp->mst_mgr,
-						  connector->port);
+			connector->port->has_audio;
 	else
 		pipe_config->has_audio =
 			intel_conn_state->force_audio == HDMI_AUDIO_ON;
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 7af51c947b81..2d7c26592c05 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -732,8 +732,6 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		       struct drm_dp_mst_topology_mgr *mgr,
 		       struct drm_dp_mst_port *port);
 
-bool drm_dp_mst_port_has_audio(struct drm_dp_mst_topology_mgr *mgr,
-					struct drm_dp_mst_port *port);
 struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
