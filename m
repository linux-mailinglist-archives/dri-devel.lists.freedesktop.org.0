Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLooDRLohGlf6QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:57:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED8F69F7
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BB010E013;
	Thu,  5 Feb 2026 18:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="DdGC+Lry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1391A10E013
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 18:57:17 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-88fca7bce90so15324506d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 10:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770317836;
 x=1770922636; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kvSUwRHSCkNMTFJp38fcjS4kvstVy5F/PlPk1IzJJCI=;
 b=DdGC+LrygDok+MXlzbUPDttt4ohjliv1szBk+fhwVlQZvoXo3K8LwZMTdGs2RvelTD
 erMSUS7W+niSVFAmRaXZ0eWtsTzTNvlMRVR5n4x5GtBsiyxoNshasiTBWvzCmysoOx7y
 GoQzdUtkpDAthm1/mmX2oJHTs58TVNmes6FOuk003Pqq9VHTL1wIdN59HJrQhyXH9X4X
 mpLLI2AihPgOC5lVtpayjw7ByS2MIrz+565mCbG9ys1Xqnqt6SSYzeVwLajRaH+MZY9N
 1IxNwWsov8uJNh9O+7WD9qsQ1XMwxg5VzVj1+jaO0axvCUnl3ZQVCL5kEpnOdrzBGm26
 ZswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770317836; x=1770922636;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kvSUwRHSCkNMTFJp38fcjS4kvstVy5F/PlPk1IzJJCI=;
 b=Y0IQooTPt/vDz/aQQFUGjpqRUktFNJ5R7/dardtuIBu3ZX+yD436VAeIbmmJ434bbA
 J6+JSnK/E3iX5c/pp8nXQ0kbyMlM1O8fV3UljOw9i31Rl85DJhYXFU263bm9WZ9sXsJ4
 i+XjZnWrkkRv49R8AByN1XbFM1387CJuJ9CdWOUqUXoOHW/n38XeHX51DYNTVX+mdEQo
 dAFkMzDZSEyPYFfJ4MvLjth877hnXLh/Y456JDrPY8sK6GX57/RAdv5dr7gojJFbXZqS
 IxIvAcWRNvucB/qxLtN52kdwr4cD9TIgpZLedHSnOlqIbstoxFZg0lv83mVCs2M2i7Sh
 +OCA==
X-Gm-Message-State: AOJu0YwdpfZtvEwHMpnNBdK5ps8+VwqkOQIBvFZiI3FcO49QTQahy2dW
 i77Nk56iiG22Hwn/c/fxMtPfsISRcaJUW+lIZqyRSTSednA51bPjI9J8O9ubajR00t4=
X-Gm-Gg: AZuq6aKr1CED9gXSO+RMpuR9q3DNJkcqPXF3mxSWtqaCGDNwrlLtjCaVWhCQWv0E5Sf
 zJ1mFNItysugA24ONyCrEp3h4wtCrI03SAangzvNcmd/RpJ5jRD6spvvxot9idG5c//E759om3x
 fEcNH5Ho9zYN3ODcdkVktPo9ERg1h2gZdGqUBX2tgYN0y+Xdv9X8deqK9aANnq1CMptGOk3RbGY
 YLvyTw7X8JXJKM2dPpfeCk3Yoo2Sw7zV656CjoHSmgns0mq5dKP55EHwkG0ZUY46LgfQDZQZinm
 +ITUyjJ08DfFJFm1E5tv497uHXTe5bnusnsVS4ECc/+9EIHHmtkbXZCj9qHxXOsetC1Sa1YxIbD
 PsayoV5MSKYv9cWfq46UtRxV7l3zhdAm9/ShvEBSPOxFd5tPR1KQqmuzAoHzXo3BTW7D+g5RGv1
 CYO14uADRMWRCUPnsESrfCe7dIj5pj
X-Received: by 2002:a05:6214:da5:b0:890:8c65:c67a with SMTP id
 6a1803df08f44-8953c7eac04mr1910056d6.3.1770317836045; 
 Thu, 05 Feb 2026 10:57:16 -0800 (PST)
Received: from [108.27.160.201] ([108.27.160.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506392902f9sm1678331cf.18.2026.02.05.10.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 10:57:15 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Thu, 05 Feb 2026 13:56:10 -0500
Subject: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
In-Reply-To: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darkrefraction.com:mid,darkrefraction.com:email]
X-Rspamd-Queue-Id: 5EED8F69F7
X-Rspamd-Action: no action

This information will be exposed to userspace in the following commit.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 32 ++++++++++++++++++++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 5 files changed, 75 insertions(+), 6 deletions(-)

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
index b6cced9b8aa1..3e7af2ffece9 100644
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
 
@@ -179,13 +180,40 @@ r570_gr_get_ctxbufs_info(struct r535_gr *gr)
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
+	if (WARN_ON(IS_ERR(zcull_info)))
+		return PTR_ERR(zcull_info);
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
2.52.0

