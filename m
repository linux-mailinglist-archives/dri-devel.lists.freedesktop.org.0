Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEi8H0Ftl2nxyQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:06:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B116237F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D08510E74A;
	Thu, 19 Feb 2026 20:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="WIg426Cl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDEA10E195
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 20:06:17 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-89473dca8aaso16264356d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 12:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771531576;
 x=1772136376; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7Uncv38UxGm72QGhelQ6NKI/QxXN75cHDpbsTnqtowY=;
 b=WIg426ClXs4sbJALu3+/jlIQTQw1meW4JXfgfyxO4cTbdwhrkkvlEVzE2JswTTXfMh
 njepPOgVmLDk5PV2Y6MezSpbIlpO0+UCHbXVHVrpXszniw5nc8DMgqXy0V9LfOfTE0xj
 oSqS6UPLZ7oPTt9Lmgjas2+LbfH+n2OsrJOFAO8WOG4z1kYfhmYbFlerkcDFRBeAqZGk
 403t2q31WmlOinrkjHx0lVxKKWrVKbYqrhMKI5zxEysWqJ0Zae7PyCFwVnjwfeZcyxRJ
 fJw2JFz1tYnSlTHiiYyZQ6a07+kTKDn6GLwRooK+CWnpbX+tgBM3NIns6nRkJxI0qMBS
 ZUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771531576; x=1772136376;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7Uncv38UxGm72QGhelQ6NKI/QxXN75cHDpbsTnqtowY=;
 b=CQ3qjOhDSAlQgHV+fI0o+v/gZVnBZ65k58Y5yeqhFuTHglRNySUEao1rluKpiLLmra
 1PDlRjuL8sM1N61JO7k7rZVZwAop2SN3+gxOAvuqxM8/zt+scO5gPRWKu/+zPLLRcQRF
 zNXcST/e15EUpkb9corO/lAMDjK++A5yaiEF7Uc8xEP1h7wtFj2ZyjMRnZIb9xsgR521
 GL0bnoyIegDoEyrhKViYkrjJSDeqWIfJEa34Ryi4aN0wHHhe0x8oJGwLfLYAJ32G4Hny
 ctlmtgFOUKsJ/Ua0ThS43foFaTgymhNuBoNFE8sNOmnrmBIiiwg+PWBSLJ6La9yoKFFY
 xYGA==
X-Gm-Message-State: AOJu0YzgC4q+AqugPJJIjcERPej/V9/mgz/hMp2QbBBYEXHxIE/iaMAm
 Hg4AtW3d82sGsaSH1xcQIlclMhMu40mBqVhpSAkWTQub79kaM8oXeWE8RLHbAa75OyM=
X-Gm-Gg: AZuq6aIShjt7JGDxMdgra3yu5u7m+VoQ+fqk3i2Zm00Wk+XfAgmTwp6ckR4GoHCGppP
 s86Ol8FWJl8IC1mhvxDIRu+xfNAeCOQzRdlDkwdepR8CZ1gLDXdjnuK+s1OGnf8TCkos/kyQ4vX
 es6gRWWolORgVxKZdQR+UmEcBj1/bDLNfrn7EZ4Mr8JmeIu0wKxEcvm8r5n06LaQ93Cg6DV0M7P
 q/KbqLDfeackhAwIODf/8/8CEmyI/3DJ8AqO8HqMKVXscEfgwgApX+ycdY1nomMTxdkztjQuPzU
 EPRG4VH6VYMfYb3946/o+NUtrB3saYOZCRsF539PRHVsGuvMG3mXuMRsLcw6FS+LkVkpJeEuU5I
 B9ehdFdw/LJb/155mKyDJ02o07Qd7TDhLw9eAAPEs9wOelbuk/UJ3ffpy0s2VV3GSPZL10axIYC
 D0dmip5PCDJS4ujghc/6MjpKuHSFNHQlUKHce/mO2HvTqdHJEg2x28noyWJgb1IAzqoe/risfyC
 ssvXOgoyA==
X-Received: by 2002:a05:6214:4109:b0:896:f3de:cc29 with SMTP id
 6a1803df08f44-89740302432mr273211576d6.16.1771531576414; 
 Thu, 19 Feb 2026 12:06:16 -0800 (PST)
Received: from [96.232.40.90] (pool-96-232-40-90.nycmny.fios.verizon.net.
 [96.232.40.90]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971c8e60a0sm216675066d6.0.2026.02.19.12.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 12:06:15 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Thu, 19 Feb 2026 15:05:53 -0500
Subject: [PATCH v3 1/2] drm/nouveau: Fetch zcull info from device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-zcull3-v3-1-dbe6a716f104@darkrefraction.com>
References: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
In-Reply-To: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mary Guillemard <mary@mary.zone>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mel Henning <mhenning@darkrefraction.com>
X-Mailer: b4 0.14.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mary@mary.zone,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mhenning@darkrefraction.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[darkrefraction.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,mary.zone];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darkrefraction.com:mid,darkrefraction.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 294B116237F
X-Rspamd-Action: no action

This information will be exposed to userspace in the following commit.

Add struct nvkm_gr_zcull_info, which serves as abstraction layer between
the corresponding uAPI (added in a subsequent patch) and the firmware
structure.

Extend the existing get_ctxbufs callback to also fill in zcull info.
ctxsw_size and ctxsw_align come from
NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO, which is
already called by r570_gr_get_ctxbufs, while the rest of the zcull
info comes from
NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL.
Adding a separate callback for zcull info would require us to either:

1) Call GET_CONTEXT_BUFFERS_INFO twice, once for each callback. This
is a little slower and more verbose than calling it once.
or
2) Fill out zcull_info partially in r570_gr_get_ctxbufs and partially
in the new callback. Since we fill out only some of the info in each
we now need to handle edge cases where one function is called but not
the other as well as them being called in an arbitrary order.

Because of this, it's simplest to combine them in a single call
(get_ctxbufs_and_zcull_info), which avoids repeated rpc calls
to the gpu without the complexity of handling partially complete states.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 34 ++++++++++++++++++++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 ++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 5 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
index a2333cfe6955..490ce410f6cb 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
@@ -3,9 +3,28 @@
 #define __NVKM_GR_H__
 #include <core/engine.h>
 
+struct nvkm_gr_zcull_info {
+	__u32 width_align_pixels;
+	__u32 height_align_pixels;
+	__u32 pixel_squares_by_aliquots;
+	__u32 aliquot_total;
+	__u32 zcull_region_byte_multiplier;
+	__u32 zcull_region_header_size;
+	__u32 zcull_subregion_header_size;
+	__u32 subregion_count;
+	__u32 subregion_width_align_pixels;
+	__u32 subregion_height_align_pixels;
+
+	__u32 ctxsw_size;
+	__u32 ctxsw_align;
+};
+
 struct nvkm_gr {
 	const struct nvkm_gr_func *func;
 	struct nvkm_engine engine;
+
+	struct nvkm_gr_zcull_info zcull_info;
+	bool has_zcull_info;
 };
 
 u64 nvkm_gr_units(struct nvkm_gr *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index ddb57d5e73d6..73844e1e7294 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -249,7 +249,7 @@ r535_gr_get_ctxbuf_info(struct r535_gr *gr, int i,
 }
 
 static int
-r535_gr_get_ctxbufs_info(struct r535_gr *gr)
+r535_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
 {
 	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
@@ -265,6 +265,9 @@ r535_gr_get_ctxbufs_info(struct r535_gr *gr)
 		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engine[i]);
 
 	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
+
+	gr->base.has_zcull_info = false;
+
 	return 0;
 }
 
@@ -312,7 +315,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	 *
 	 * Also build the information that'll be used to create channel contexts.
 	 */
-	ret = rm->api->gr->get_ctxbufs_info(gr);
+	ret = rm->api->gr->get_ctxbufs_and_zcull_info(gr);
 	if (ret)
 		goto done;
 
@@ -352,5 +355,5 @@ r535_gr_dtor(struct nvkm_gr *base)
 
 const struct nvkm_rm_api_gr
 r535_gr = {
-	.get_ctxbufs_info = r535_gr_get_ctxbufs_info,
+	.get_ctxbufs_and_zcull_info = r535_gr_get_ctxbufs_and_zcull_info,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
index b6cced9b8aa1..8dd4552aeaa5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
@@ -164,9 +164,10 @@ r570_gr_scrubber_init(struct r535_gr *gr)
 }
 
 static int
-r570_gr_get_ctxbufs_info(struct r535_gr *gr)
+r570_gr_get_ctxbufs_and_zcull_info(struct r535_gr *gr)
 {
 	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
+	NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
 	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
 	struct nvkm_gsp *gsp = subdev->device->gsp;
 
@@ -179,13 +180,42 @@ r570_gr_get_ctxbufs_info(struct r535_gr *gr)
 	for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++)
 		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engine[i]);
 
+	NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO zcull = info->engineContextBuffersInfo[0]
+		.engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL];
+	gr->base.zcull_info.ctxsw_size = zcull.size;
+	gr->base.zcull_info.ctxsw_align = zcull.alignment;
+
 	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
+
+	zcull_info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+					 NV2080_CTRL_CMD_GR_GET_ZCULL_INFO,
+					 sizeof(*zcull_info));
+	if (IS_ERR(zcull_info)) {
+		nvdev_error(gr->base.engine.subdev.device, "could not fetch zcull info\n");
+		return PTR_ERR(zcull_info);
+	}
+
+	gr->base.zcull_info.width_align_pixels = zcull_info->widthAlignPixels;
+	gr->base.zcull_info.height_align_pixels = zcull_info->heightAlignPixels;
+	gr->base.zcull_info.pixel_squares_by_aliquots = zcull_info->pixelSquaresByAliquots;
+	gr->base.zcull_info.aliquot_total = zcull_info->aliquotTotal;
+	gr->base.zcull_info.zcull_region_byte_multiplier = zcull_info->zcullRegionByteMultiplier;
+	gr->base.zcull_info.zcull_region_header_size = zcull_info->zcullRegionHeaderSize;
+	gr->base.zcull_info.zcull_subregion_header_size = zcull_info->zcullSubregionHeaderSize;
+	gr->base.zcull_info.subregion_count = zcull_info->subregionCount;
+	gr->base.zcull_info.subregion_width_align_pixels = zcull_info->subregionWidthAlignPixels;
+	gr->base.zcull_info.subregion_height_align_pixels = zcull_info->subregionHeightAlignPixels;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info);
+
+	gr->base.has_zcull_info = true;
+
 	return 0;
 }
 
 const struct nvkm_rm_api_gr
 r570_gr = {
-	.get_ctxbufs_info = r570_gr_get_ctxbufs_info,
+	.get_ctxbufs_and_zcull_info = r570_gr_get_ctxbufs_and_zcull_info,
 	.scrubber.init = r570_gr_scrubber_init,
 	.scrubber.fini = r570_gr_scrubber_fini,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
index feed1dabd9d2..a7a15a4de9d5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
@@ -76,4 +76,23 @@ typedef struct NV2080_CTRL_INTERNAL_GR_INIT_BUG4208224_WAR_PARAMS {
 } NV2080_CTRL_INTERNAL_GR_INIT_BUG4208224_WAR_PARAMS;
 
 #define NV2080_CTRL_CMD_INTERNAL_KGR_INIT_BUG4208224_WAR (0x20800a46) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_KGR_INIT_BUG4208224_WAR_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_CMD_GR_GET_ZCULL_INFO            (0x20801206U) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GR_INTERFACE_ID << 8) | NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_SUBREGION_SUPPORTED
+#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID (0x6U)
+
+typedef struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS {
+    NvU32 widthAlignPixels;
+    NvU32 heightAlignPixels;
+    NvU32 pixelSquaresByAliquots;
+    NvU32 aliquotTotal;
+    NvU32 zcullRegionByteMultiplier;
+    NvU32 zcullRegionHeaderSize;
+    NvU32 zcullSubregionHeaderSize;
+    NvU32 subregionCount;
+    NvU32 subregionWidthAlignPixels;
+    NvU32 subregionHeightAlignPixels;
+} NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS;
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 393ea775941f..0fb0e67406c6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -124,7 +124,7 @@ struct nvkm_rm_api {
 	} *ce, *nvdec, *nvenc, *nvjpg, *ofa;
 
 	const struct nvkm_rm_api_gr {
-		int (*get_ctxbufs_info)(struct r535_gr *);
+		int (*get_ctxbufs_and_zcull_info)(struct r535_gr *);
 		struct {
 			int (*init)(struct r535_gr *);
 			void (*fini)(struct r535_gr *);

-- 
2.53.0

