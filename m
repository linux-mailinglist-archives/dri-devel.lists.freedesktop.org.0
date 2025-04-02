Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD34A797E6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 23:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B3B10E8E1;
	Wed,  2 Apr 2025 21:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hJJ3Qkza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1056110E8E3;
 Wed,  2 Apr 2025 21:59:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9838A43B9C;
 Wed,  2 Apr 2025 21:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D46C4CEE7;
 Wed,  2 Apr 2025 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743631142;
 bh=0BXP9Sttv9k8REO+ljfXfz32urOtrGdhguS+/WAW0jA=;
 h=Date:From:To:Cc:Subject:From;
 b=hJJ3QkzafMZCUvkyswDqA/xuoQh8r0ItuHa0MzoW9hLNxLeHxMNOLepDMEvRbuFjK
 dzXruQbPrWwfVhR5i7NbG4yFlAGY5DIPQVgjAHJs53QufguQk3K5e/09zZIAXh8FlH
 40yg3pn5v2t2640k760GjlbyhPmc9LqTsgkjLb4LzjQUfeb7jJx7w+fpiyvzCIj3To
 JzDzg+uUg7aNOXzPWwxPqgmYgKCAcQVWmb8D7y2yMBGp5SKFKQwotMloIxi2yCNVr3
 /4+gxZntVCiUCrgU87AxoAcxtc3aN81LwpQkffEgrkWk7QLx9mdEwmYb9NmbScgw+A
 m81lgmgcuhN6Q==
Date: Wed, 2 Apr 2025 15:58:59 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] drm/nouveau: disp: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-2zI55Qf88jTfNK@kspp>
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/gpu/drm/nouveau/dispnv50/disp.c:779:47: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Calculate the size of `data[]` using ` __struct_size(args) - sizeof(*args)`.

v1:
 - Link: https://lore.kernel.org/linux-hardening/ZsZLFS1CsHkKjw+C@elsanto/

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 504cb3f2054b..725331638a15 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -775,10 +775,8 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	union hdmi_infoframe infoframe = { 0 };
 	const u8 rekey = 56; /* binary driver, and tegra, constant */
 	u32 max_ac_packet;
-	struct {
-		struct nvif_outp_infoframe_v0 infoframe;
-		u8 data[17];
-	} args = { 0 };
+	DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, 17);
+	const u8 data_len = __struct_size(args) - sizeof(*args);
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
2.43.0

