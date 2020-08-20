Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B554A24C58F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EA26E9E6;
	Thu, 20 Aug 2020 18:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4796E9E6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597948323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWAJ2odt9+cPr9n4ZrOhSmp4jyTY1plLU/k2qyEryhs=;
 b=TExGy5IsyM9/W7AECqg3EVaLdxaHjV9qAzg6J/dw3iFUvzV8RkFx15X3eLVXd76QxA6N7W
 Bo2W7TMiwuDQet1LWEb0yMRfntDLBDP4M0K1k1OC4pCuMWfs276exq26feNO9rkaSXuRnX
 LtIBNjV+gtkRFeS/6RhiIKbgp7MHjGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192--w9ZyuS8NemU1EeppZzWGw-1; Thu, 20 Aug 2020 14:30:53 -0400
X-MC-Unique: -w9ZyuS8NemU1EeppZzWGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 311378030A9;
 Thu, 20 Aug 2020 18:30:51 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-42.rdu2.redhat.com
 [10.10.120.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A85EF5DA74;
 Thu, 20 Aug 2020 18:30:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [RFC v2 08/20] drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD
 handling
Date: Thu, 20 Aug 2020 14:30:00 -0400
Message-Id: <20200820183012.288794-9-lyude@redhat.com>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First some backstory here: Currently, we keep track of whether or not
we've enabled MST or not by trying to piggy-back off the MST helpers.
This means that in order to check whether MST is enabled or not, we
actually need to grab drm_dp_mst_topology_mgr.lock.

Back when I originally wrote this, I did this piggy-backing with the
intention that I'd eventually be teaching our MST helpers how to recover
when an MST device has stopped responding, which in turn would require
the MST helpers having a way of disabling MST independently of the
driver. Note that this was before I reworked locking in the MST helpers,
so at the time we were sticking random things under &mgr->lock - which
grabbing this lock was meant to protect against.

This never came to fruition because doing such a reset safely turned out
to be a lot more painful and impossible then it sounds, and also just
risks us working around issues with our MST handlers that should be
properly fixed instead. Even if it did though, simply calling
drm_dp_mst_topology_mgr_set_mst() from the MST helpers (with the
exception of when we're tearing down our MST managers, that's always OK)
wouldn't have been a bad idea, since drivers like nouveau and i915 need
to do their own book keeping immediately after disabling MST.
So-implementing that would likely require adding a hook for
helper-triggered MST disables anyway.

So, fast forward to now - we want to start adding support for all of the
miscellaneous bits of the DP protocol (for both SST and MST) we're
missing before moving on to supporting more complicated features like
supporting different BPP values on MST, DSC, etc. Since many of these
features only exist on SST and make use of DP HPD IRQs, we want to be
able to atomically check whether we're servicing an MST IRQ or SST IRQ
in nouveau_connector_hotplug(). Currently we literally don't do this at
all, and just handle any kind of possible DP IRQ we could get including
ESIs - even if MST isn't actually enabled.

This would be very complicated and difficult to fix if we need to hold
&mgr->lock while handling SST IRQs to ensure that the MST topology
state doesn't change under us. What we really want here is to do our own
tracking of whether MST is enabled or not, similar to drivers like i915,
and define our own locking order to decomplicate things and avoid
hitting locking issues in the future.

So, let's do this by refactoring our MST probing/enabling code to use
our own MST bookkeeping, along with adding a lock for protecting DP
state that needs to be checked outside of our connector probing
functions. While we're at it, we also remove a bunch of unneeded steps
we perform when probing/enabling MST:

* Enabling bits in MSTM_CTRL before calling drm_dp_mst_topology_mgr_set_mst().
  I don't think these ever actually did anything, since the nvif methods
  for enabling MST don't actually do anything DPCD related and merely
  indicate to nvkm that we've turned on MST.
* Checking the MSTM_CTRL bit is intact when checking the state of an
  enabled MST topology in nv50_mstm_detect(). I just added this to be safe
  originally, but now that we try reading the DPCD when probing DP
  connectors it shouldn't be needed as that will abort our hotplug probing
  if the device was removed well before we start checking for MST..
* All of the duplicate DPCD version checks.

This leaves us with much nicer looking code, a much more sensible
locking scheme, and an easy way of checking whether MST is enabled or
not for handling DP HPD IRQs.

v2:
* Get rid of accidental newlines

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 196 +++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_connector.c |  14 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_display.h   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 132 +++++++++++--
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  33 +++-
 7 files changed, 245 insertions(+), 140 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 3f046b917c85c..3ee836dc5058f 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -54,8 +54,9 @@ nv04_encoder_get_connector(struct nouveau_encoder *encoder)
 }
 
 static void
-nv04_display_fini(struct drm_device *dev, bool suspend)
+nv04_display_fini(struct drm_device *dev, bool runtime, bool suspend)
 {
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv04_display *disp = nv04_display(dev);
 	struct drm_crtc *crtc;
 
@@ -67,6 +68,9 @@ nv04_display_fini(struct drm_device *dev, bool suspend)
 	if (nv_two_heads(dev))
 		NVWriteCRTC(dev, 1, NV_PCRTC_INTR_EN_0, 0);
 
+	if (!runtime)
+		cancel_work_sync(&drm->hpd_work);
+
 	if (!suspend)
 		return;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 75005268941b9..0d6879c532bec 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -878,16 +878,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_atomic_state *state,
 #define nv50_mstc(p) container_of((p), struct nv50_mstc, connector)
 #define nv50_msto(p) container_of((p), struct nv50_msto, encoder)
 
-struct nv50_mstm {
-	struct nouveau_encoder *outp;
-
-	struct drm_dp_mst_topology_mgr mgr;
-
-	bool modified;
-	bool disabled;
-	int links;
-};
-
 struct nv50_mstc {
 	struct nv50_mstm *mstm;
 	struct drm_dp_mst_port *port;
@@ -1416,41 +1406,51 @@ nv50_mstm = {
 	.add_connector = nv50_mstm_add_connector,
 };
 
-void
-nv50_mstm_service(struct nv50_mstm *mstm)
+bool
+nv50_mstm_service(struct nouveau_drm *drm,
+		  struct nouveau_connector *nv_connector,
+		  struct nv50_mstm *mstm)
 {
-	struct drm_dp_aux *aux = mstm ? mstm->mgr.aux : NULL;
-	bool handled = true;
-	int ret;
+	struct drm_dp_aux *aux = &nv_connector->aux;
+	bool handled = true, ret = true;
+	int rc;
 	u8 esi[8] = {};
 
-	if (!aux)
-		return;
-
 	while (handled) {
-		ret = drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
-		if (ret != 8) {
-			drm_dp_mst_topology_mgr_set_mst(&mstm->mgr, false);
-			return;
+		rc = drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
+		if (rc != 8) {
+			ret = false;
+			break;
 		}
 
 		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
 		if (!handled)
 			break;
 
-		drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1], 3);
+		rc = drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
+				       3);
+		if (rc != 3) {
+			ret = false;
+			break;
+		}
 	}
+
+	if (!ret)
+		NV_DEBUG(drm, "Failed to handle ESI on %s: %d\n",
+			 nv_connector->base.name, rc);
+
+	return ret;
 }
 
 void
 nv50_mstm_remove(struct nv50_mstm *mstm)
 {
-	if (mstm)
-		drm_dp_mst_topology_mgr_set_mst(&mstm->mgr, false);
+	mstm->is_mst = false;
+	drm_dp_mst_topology_mgr_set_mst(&mstm->mgr, false);
 }
 
 static int
-nv50_mstm_enable(struct nv50_mstm *mstm, u8 dpcd, int state)
+nv50_mstm_enable(struct nv50_mstm *mstm, int state)
 {
 	struct nouveau_encoder *outp = mstm->outp;
 	struct {
@@ -1465,106 +1465,83 @@ nv50_mstm_enable(struct nv50_mstm *mstm, u8 dpcd, int state)
 	};
 	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
 	struct nvif_object *disp = &drm->display->disp.object;
-	int ret;
-
-	if (dpcd >= 0x12) {
-		/* Even if we're enabling MST, start with disabling the
-		 * branching unit to clear any sink-side MST topology state
-		 * that wasn't set by us
-		 */
-		ret = drm_dp_dpcd_writeb(mstm->mgr.aux, DP_MSTM_CTRL, 0);
-		if (ret < 0)
-			return ret;
-
-		if (state) {
-			/* Now, start initializing */
-			ret = drm_dp_dpcd_writeb(mstm->mgr.aux, DP_MSTM_CTRL,
-						 DP_MST_EN);
-			if (ret < 0)
-				return ret;
-		}
-	}
 
 	return nvif_mthd(disp, 0, &args, sizeof(args));
 }
 
 int
-nv50_mstm_detect(struct nv50_mstm *mstm, u8 dpcd[8], int allow)
+nv50_mstm_detect(struct nouveau_encoder *outp)
 {
-	struct drm_dp_aux *aux;
+	struct nv50_mstm *mstm = outp->dp.mstm;
+	struct drm_dp_aux *aux = mstm->mgr.aux;
 	int ret;
-	bool old_state, new_state;
-	u8 mstm_ctrl;
 
-	if (!mstm)
+	if (!mstm || !mstm->can_mst)
 		return 0;
 
-	mutex_lock(&mstm->mgr.lock);
-
-	old_state = mstm->mgr.mst_state;
-	new_state = old_state;
-	aux = mstm->mgr.aux;
-
-	if (old_state) {
-		/* Just check that the MST hub is still as we expect it */
-		ret = drm_dp_dpcd_readb(aux, DP_MSTM_CTRL, &mstm_ctrl);
-		if (ret < 0 || !(mstm_ctrl & DP_MST_EN)) {
-			DRM_DEBUG_KMS("Hub gone, disabling MST topology\n");
-			new_state = false;
-		}
-	} else if (dpcd[0] >= 0x12) {
-		ret = drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &dpcd[1]);
-		if (ret < 0)
-			goto probe_error;
-
-		if (!(dpcd[1] & DP_MST_CAP))
-			dpcd[0] = 0x11;
-		else
-			new_state = allow;
-	}
-
-	if (new_state == old_state) {
-		mutex_unlock(&mstm->mgr.lock);
-		return new_state;
-	}
-
-	ret = nv50_mstm_enable(mstm, dpcd[0], new_state);
-	if (ret)
-		goto probe_error;
-
-	mutex_unlock(&mstm->mgr.lock);
+	/* Clear any leftover MST state we didn't set ourselves by first
+	 * disabling MST if it was already enabled
+	 */
+	ret = drm_dp_dpcd_writeb(aux, DP_MSTM_CTRL, 0);
+	if (ret < 0)
+		return ret;
 
-	ret = drm_dp_mst_topology_mgr_set_mst(&mstm->mgr, new_state);
+	/* And start enabling */
+	ret = nv50_mstm_enable(mstm, true);
 	if (ret)
-		return nv50_mstm_enable(mstm, dpcd[0], 0);
+		return ret;
 
-	return new_state;
+	ret = drm_dp_mst_topology_mgr_set_mst(&mstm->mgr, true);
+	if (ret) {
+		nv50_mstm_enable(mstm, false);
+		return ret;
+	}
 
-probe_error:
-	mutex_unlock(&mstm->mgr.lock);
-	return ret;
+	mstm->is_mst = true;
+	return 1;
 }
 
 static void
-nv50_mstm_fini(struct nv50_mstm *mstm)
+nv50_mstm_fini(struct nouveau_encoder *outp)
 {
-	if (mstm && mstm->mgr.mst_state)
+	struct nv50_mstm *mstm = outp->dp.mstm;
+
+	if (!mstm)
+		return;
+
+	/* Don't change the MST state of this connector until we've finished
+	 * resuming, since we can't safely grab hpd_irq_lock in our resume
+	 * path to protect mstm->is_mst without potentially deadlocking
+	 */
+	mutex_lock(&outp->dp.hpd_irq_lock);
+	mstm->suspended = true;
+	mutex_unlock(&outp->dp.hpd_irq_lock);
+
+	if (mstm->is_mst)
 		drm_dp_mst_topology_mgr_suspend(&mstm->mgr);
 }
 
 static void
-nv50_mstm_init(struct nv50_mstm *mstm, bool runtime)
+nv50_mstm_init(struct nouveau_encoder *outp, bool runtime)
 {
-	int ret;
+	struct nv50_mstm *mstm = outp->dp.mstm;
+	int ret = 0;
 
-	if (!mstm || !mstm->mgr.mst_state)
+	if (!mstm)
 		return;
 
-	ret = drm_dp_mst_topology_mgr_resume(&mstm->mgr, !runtime);
-	if (ret == -1) {
-		drm_dp_mst_topology_mgr_set_mst(&mstm->mgr, false);
-		drm_kms_helper_hotplug_event(mstm->mgr.dev);
+	if (mstm->is_mst) {
+		ret = drm_dp_mst_topology_mgr_resume(&mstm->mgr, !runtime);
+		if (ret == -1)
+			nv50_mstm_remove(mstm);
 	}
+
+	mutex_lock(&outp->dp.hpd_irq_lock);
+	mstm->suspended = false;
+	mutex_unlock(&outp->dp.hpd_irq_lock);
+
+	if (ret == -1)
+		drm_kms_helper_hotplug_event(mstm->mgr.dev);
 }
 
 static void
@@ -1772,6 +1749,10 @@ nv50_sor_destroy(struct drm_encoder *encoder)
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	nv50_mstm_del(&nv_encoder->dp.mstm);
 	drm_encoder_cleanup(encoder);
+
+	if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
+		mutex_destroy(&nv_encoder->dp.hpd_irq_lock);
+
 	kfree(encoder);
 }
 
@@ -1831,6 +1812,8 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 		struct nvkm_i2c_aux *aux =
 			nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
 
+		mutex_init(&nv_encoder->dp.hpd_irq_lock);
+
 		if (aux) {
 			if (disp->disp->object.oclass < GF110_DISP) {
 				/* HW has no support for address-only
@@ -2529,9 +2512,9 @@ nv50_disp_func = {
  *****************************************************************************/
 
 static void
-nv50_display_fini(struct drm_device *dev, bool suspend)
+nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
 {
-	struct nouveau_encoder *nv_encoder;
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_encoder *encoder;
 	struct drm_plane *plane;
 
@@ -2543,11 +2526,12 @@ nv50_display_fini(struct drm_device *dev, bool suspend)
 	}
 
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
-		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
-			nv_encoder = nouveau_encoder(encoder);
-			nv50_mstm_fini(nv_encoder->dp.mstm);
-		}
+		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST)
+			nv50_mstm_fini(nouveau_encoder(encoder));
 	}
+
+	if (!runtime)
+		cancel_work_sync(&drm->hpd_work);
 }
 
 static int
@@ -2564,7 +2548,7 @@ nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
 			struct nouveau_encoder *nv_encoder =
 				nouveau_encoder(encoder);
-			nv50_mstm_init(nv_encoder->dp.mstm, runtime);
+			nv50_mstm_init(nv_encoder, runtime);
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 1d5696c39792a..b90591114faaf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1143,19 +1143,15 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	struct nouveau_connector *nv_connector =
 		container_of(notify, typeof(*nv_connector), hpd);
 	struct drm_connector *connector = &nv_connector->base;
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct drm_device *dev = connector->dev;
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	const struct nvif_notify_conn_rep_v0 *rep = notify->data;
 	const char *name = connector->name;
-	struct nouveau_encoder *nv_encoder;
 	int ret;
 	bool plugged = (rep->mask != NVIF_NOTIFY_CONN_V0_UNPLUG);
 
 	if (rep->mask & NVIF_NOTIFY_CONN_V0_IRQ) {
-		NV_DEBUG(drm, "service %s\n", name);
-		drm_dp_cec_irq(&nv_connector->aux);
-		if ((nv_encoder = find_encoder(connector, DCB_OUTPUT_DP)))
-			nv50_mstm_service(nv_encoder->dp.mstm);
-
+		nouveau_dp_irq(drm, nv_connector);
 		return NVIF_NOTIFY_KEEP;
 	}
 
@@ -1181,10 +1177,6 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	if (!plugged)
 		drm_dp_cec_unset_edid(&nv_connector->aux);
 	NV_DEBUG(drm, "%splugged %s\n", plugged ? "" : "un", name);
-	if ((nv_encoder = find_encoder(connector, DCB_OUTPUT_DP))) {
-		if (!plugged)
-			nv50_mstm_remove(nv_encoder->dp.mstm);
-	}
 
 	drm_helper_hpd_irq_event(connector->dev);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 5f31b11ac2e7e..13016769a194b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -569,7 +569,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
 		cancel_work_sync(&drm->hpd_work);
 
 	drm_kms_helper_poll_disable(dev);
-	disp->fini(dev, suspend);
+	disp->fini(dev, runtime, suspend);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 6e0d900441d69..76ba93e01aff4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -18,7 +18,7 @@ struct nouveau_display {
 	void *priv;
 	void (*dtor)(struct drm_device *);
 	int  (*init)(struct drm_device *, bool resume, bool runtime);
-	void (*fini)(struct drm_device *, bool suspend);
+	void (*fini)(struct drm_device *, bool suspend, bool runtime);
 
 	struct nvif_disp disp;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 4030806e3522b..032afc73e2a33 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -36,19 +36,89 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
 static int nouveau_mst = 1;
 module_param_named(mst, nouveau_mst, int, 0400);
 
+static enum drm_connector_status
+nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
+		      struct nouveau_encoder *outp)
+{
+	struct drm_dp_aux *aux = &nv_connector->aux;
+	struct nv50_mstm *mstm = NULL;
+	int ret;
+	u8 *dpcd = outp->dp.dpcd;
+	u8 tmp;
+
+	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
+	if (ret == DP_RECEIVER_CAP_SIZE && dpcd[DP_DPCD_REV]) {
+		ret = drm_dp_read_desc(aux, &outp->dp.desc,
+				       drm_dp_is_branch(dpcd));
+		if (ret < 0)
+			return connector_status_disconnected;
+	} else {
+		return connector_status_disconnected;
+	}
+
+	if (nouveau_mst)
+		mstm = outp->dp.mstm;
+
+	if (mstm) {
+		if (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_12) {
+			ret = drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &tmp);
+			if (ret < 0)
+				return connector_status_disconnected;
+
+			mstm->can_mst = !!(tmp & DP_MST_CAP);
+		} else {
+			mstm->can_mst = false;
+		}
+	}
+
+	return connector_status_connected;
+}
+
 int
 nouveau_dp_detect(struct nouveau_connector *nv_connector,
 		  struct nouveau_encoder *nv_encoder)
 {
 	struct drm_device *dev = nv_encoder->base.base.dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct drm_dp_aux *aux = &nv_connector->aux;
-	u8 dpcd[DP_RECEIVER_CAP_SIZE];
-	int ret;
+	struct drm_connector *connector = &nv_connector->base;
+	struct nv50_mstm *mstm = nv_encoder->dp.mstm;
+	enum drm_connector_status status;
+	u8 *dpcd = nv_encoder->dp.dpcd;
+	int ret = NOUVEAU_DP_NONE;
+
+	/* If we've already read the DPCD on an eDP device, we don't need to
+	 * reread it as it won't change
+	 */
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    dpcd[DP_DPCD_REV] != 0)
+		return NOUVEAU_DP_SST;
 
-	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
-	if (ret != sizeof(dpcd))
-		return ret;
+	mutex_lock(&nv_encoder->dp.hpd_irq_lock);
+	if (mstm) {
+		/* If we're not ready to handle MST state changes yet, just
+		 * report the last status of the connector. We'll reprobe it
+		 * once we've resumed.
+		 */
+		if (mstm->suspended) {
+			if (mstm->is_mst)
+				ret = NOUVEAU_DP_MST;
+			else if (connector->status ==
+				 connector_status_connected)
+				ret = NOUVEAU_DP_SST;
+
+			goto out;
+		}
+	}
+
+	status = nouveau_dp_probe_dpcd(nv_connector, nv_encoder);
+	if (status == connector_status_disconnected)
+		goto out;
+
+	/* If we're in MST mode, we're done here */
+	if (mstm && mstm->can_mst && mstm->is_mst) {
+		ret = NOUVEAU_DP_MST;
+		goto out;
+	}
 
 	nv_encoder->dp.link_bw = 27000 * dpcd[DP_MAX_LINK_RATE];
 	nv_encoder->dp.link_nr =
@@ -69,22 +139,50 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	NV_DEBUG(drm, "maximum: %dx%d\n",
 		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
 
-	ret = drm_dp_read_desc(&nv_connector->aux, &nv_encoder->dp.desc,
-			       drm_dp_is_branch(dpcd));
-	if (ret) {
-		NV_ERROR(drm, "Failed to read DP descriptor on %s: %d\n",
-			 nv_connector->base.name, ret);
-		return ret;
+	if (mstm && mstm->can_mst) {
+		ret = nv50_mstm_detect(nv_encoder);
+		if (ret == 1) {
+			ret = NOUVEAU_DP_MST;
+			goto out;
+		} else if (ret != 0) {
+			goto out;
+		}
 	}
+	ret = NOUVEAU_DP_SST;
 
-	ret = nv50_mstm_detect(nv_encoder->dp.mstm, dpcd, nouveau_mst);
-	if (ret == 1)
-		return NOUVEAU_DP_MST;
-	if (ret == 0)
-		return NOUVEAU_DP_SST;
+out:
+	if (mstm && !mstm->suspended && ret != NOUVEAU_DP_MST)
+		nv50_mstm_remove(mstm);
+
+	mutex_unlock(&nv_encoder->dp.hpd_irq_lock);
 	return ret;
 }
 
+void nouveau_dp_irq(struct nouveau_drm *drm,
+		    struct nouveau_connector *nv_connector)
+{
+	struct drm_connector *connector = &nv_connector->base;
+	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
+	struct nv50_mstm *mstm;
+
+	if (!outp)
+		return;
+
+	mstm = outp->dp.mstm;
+	NV_DEBUG(drm, "service %s\n", connector->name);
+
+	mutex_lock(&outp->dp.hpd_irq_lock);
+
+	if (mstm && mstm->is_mst) {
+		if (!nv50_mstm_service(drm, nv_connector, mstm))
+			schedule_work(&drm->hpd_work);
+	} else {
+		drm_dp_cec_irq(&nv_connector->aux);
+	}
+
+	mutex_unlock(&outp->dp.hpd_irq_lock);
+}
+
 /* TODO:
  * - Use the minimum possible BPC here, once we add support for the max bpc
  *   property.
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index b0e1dad2367d6..eef4643f5f982 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -65,6 +65,13 @@ struct nouveau_encoder {
 			struct nv50_mstm *mstm;
 			int link_nr;
 			int link_bw;
+
+			/* Protects DP state that needs to be accessed outside
+			 * connector reprobing contexts
+			 */
+			struct mutex hpd_irq_lock;
+
+			u8 dpcd[DP_RECEIVER_CAP_SIZE];
 			struct drm_dp_desc desc;
 		} dp;
 	};
@@ -79,6 +86,21 @@ struct nouveau_encoder {
 		       struct nv50_head_atom *, u8 proto, u8 depth);
 };
 
+struct nv50_mstm {
+	struct nouveau_encoder *outp;
+
+	struct drm_dp_mst_topology_mgr mgr;
+
+	/* Protected under nouveau_encoder->dp.hpd_irq_lock */
+	bool can_mst;
+	bool is_mst;
+	bool suspended;
+
+	bool modified;
+	bool disabled;
+	int links;
+};
+
 struct nouveau_encoder *
 find_encoder(struct drm_connector *connector, int type);
 
@@ -102,11 +124,14 @@ get_slave_funcs(struct drm_encoder *enc)
 
 /* nouveau_dp.c */
 enum nouveau_dp_status {
+	NOUVEAU_DP_NONE,
 	NOUVEAU_DP_SST,
 	NOUVEAU_DP_MST,
 };
 
 int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
+void nouveau_dp_irq(struct nouveau_drm *drm,
+		    struct nouveau_connector *nv_connector);
 enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
 					struct nouveau_encoder *,
 					const struct drm_display_mode *,
@@ -119,7 +144,9 @@ struct nouveau_connector *
 nv50_outp_get_old_connector(struct nouveau_encoder *outp,
 			    struct drm_atomic_state *state);
 
-int nv50_mstm_detect(struct nv50_mstm *, u8 dpcd[8], int allow);
-void nv50_mstm_remove(struct nv50_mstm *);
-void nv50_mstm_service(struct nv50_mstm *);
+int nv50_mstm_detect(struct nouveau_encoder *encoder);
+void nv50_mstm_remove(struct nv50_mstm *mstm);
+bool nv50_mstm_service(struct nouveau_drm *drm,
+		       struct nouveau_connector *nv_connector,
+		       struct nv50_mstm *mstm);
 #endif /* __NOUVEAU_ENCODER_H__ */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
