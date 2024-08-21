Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35595A5B9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E086C10E236;
	Wed, 21 Aug 2024 20:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qRVO8IqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427D710E236;
 Wed, 21 Aug 2024 20:16:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A5346114E;
 Wed, 21 Aug 2024 20:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62604C32781;
 Wed, 21 Aug 2024 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724271384;
 bh=u4IEyRI7AbwbX+N5Tu/Kt1Y5We5BuarQCzy6U7tDZlU=;
 h=Date:From:To:Cc:Subject:From;
 b=qRVO8IqTr732AA7WyRGGblJ8wkdCOHVdBDiamiZsqxPYHiqfcqRqC4lSbsiuvGB72
 8YdcipZn9BnJV5bOuQkCLbIaKsWV7YeeFgiIv3Nha9eQDfEjY7JHalhyCTHw8y5C3m
 ByBR1zqAQLyrQ7H5OvQjyV7shw4X7xHfIP3NxxlsOTJgSQcxQgn2PjA2rJFhyi5YIA
 Nesg4bxsqMJN4BUJDpVdyhIj+NbDHsjHb4BsYCWOnhk7POsYzEuM4PiL1DO7pCSXDr
 DPLBMrRtTLeJtclKCDccYEDCDcG3y1azWRlfpOF3lub3yda2EntJZfwGhd4cB40Ek+
 veCze51ImXt3w==
Date: Wed, 21 Aug 2024 14:16:21 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/nouveau: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <ZsZLFS1CsHkKjw+C@elsanto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with this, fix the following warning:

drivers/gpu/drm/nouveau/dispnv50/disp.c:779:47: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index eed579a6c858..ddddc69640be 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -774,11 +774,9 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	struct drm_hdmi_info *hdmi = &nv_connector->base.display_info.hdmi;
 	union hdmi_infoframe infoframe = { 0 };
 	const u8 rekey = 56; /* binary driver, and tegra, constant */
+	DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, 17);
+	const u8 data_len = 17; /* same length as in DEFINE_RAW_FLEX above. */
 	u32 max_ac_packet;
-	struct {
-		struct nvif_outp_infoframe_v0 infoframe;
-		u8 data[17];
-	} args = { 0 };
 	int ret, size;
 
 	max_ac_packet  = mode->htotal - mode->hdisplay;
@@ -815,29 +813,29 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 		return;
 
 	/* AVI InfoFrame. */
-	args.infoframe.version = 0;
-	args.infoframe.head = nv_crtc->index;
+	args->version = 0;
+	args->head = nv_crtc->index;
 
 	if (!drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi, &nv_connector->base, mode)) {
 		drm_hdmi_avi_infoframe_quant_range(&infoframe.avi, &nv_connector->base, mode,
 						   HDMI_QUANTIZATION_RANGE_FULL);
 
-		size = hdmi_infoframe_pack(&infoframe, args.data, ARRAY_SIZE(args.data));
+		size = hdmi_infoframe_pack(&infoframe, args->data, data_len);
 	} else {
 		size = 0;
 	}
 
-	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_AVI, &args.infoframe, size);
+	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_AVI, args, size);
 
 	/* Vendor InfoFrame. */
-	memset(&args.data, 0, sizeof(args.data));
+	memset(args->data, 0, data_len);
 	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
 							 &nv_connector->base, mode))
-		size = hdmi_infoframe_pack(&infoframe, args.data, ARRAY_SIZE(args.data));
+		size = hdmi_infoframe_pack(&infoframe, args->data, data_len);
 	else
 		size = 0;
 
-	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
+	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, args, size);
 
 	nv_encoder->hdmi.enabled = true;
 }
-- 
2.34.1

