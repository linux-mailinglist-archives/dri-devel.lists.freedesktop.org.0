Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J21MUNtl2nxyQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:06:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC7162398
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67B610E751;
	Thu, 19 Feb 2026 20:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="vzls+yU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7760D10E744
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 20:06:18 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-8946e0884afso24098426d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 12:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771531577;
 x=1772136377; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LXWvhKY40NwAh0sJpltiG5AWknO8aVooYAaWfER0QVg=;
 b=vzls+yU4Q2gVX9+r1teBY4Xj0xBVGOumLh1V04M+Cgizk1vtoXezLsHe8VWO8GnpGO
 XlI3da/wfoKVrv7mBXdc+zTjqzyH1AdEcxFWGd1bfZY7MPArXqLbfnEwbfWqqy8a33Z/
 sxm8W7ESEp9B4FHKwG8cbkdZgdouxB+BQ5kZEy/SFnXCPcccjTiaLaLZGdB7ch/+CfMe
 J+magnT5Qy1WwhFHHGKq3kfU2vo+Q/SH6UHw6dtaLkr7qk1H+erONalXguhoYD3HTu+s
 qC8JP7w4f8jGEaaNENg6FMVM3DYtxFOkt5NKidRDPWnrmnj/0VxAZqFkUIV+ICKWPGNp
 CcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771531577; x=1772136377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LXWvhKY40NwAh0sJpltiG5AWknO8aVooYAaWfER0QVg=;
 b=Cg3AC9djf6DQtXkqfqhY8DQL2bFc853jTYm6VwIQGiq6JqsigxfPISCW7ISBOARtSA
 h2F2mjFb9aY2IH2nHqNN1NIQb4+6tGRtbgyLwjTJHovhEZ3tWC5Thgnfu94cIfGFb3XO
 QEUmhasv4u3Ko5wLXhRruNmxhdSeZAjN5R1MMymCmk6qFkePOYSIqeyCKnWVjMOYFVM5
 wWc3RVHGzdYL6boYEvLXZlc6yIG7Ls5CEAT8Lb9modB0znsBODdjfLxb7RlWuHxXLdj4
 jJAvRbap3shwCXAvnuoai6wHxVGe7Uw5CoVR5gvepwT94iroxslA92E4RnEqiGg/HOhT
 /vXw==
X-Gm-Message-State: AOJu0Yz5N7Du0jWBQ9YbEj1EWbLmWP+dp+fgVFFu0uzN5domobRPBigr
 kFbu/35RKOipmGtMz1WthDo5JgUorT9/8n/gGHDFXWleLk9aXB767A5Iutp0UrZgvqc=
X-Gm-Gg: AZuq6aJmRDXul5niyprPeDj2VamqGToW696tVqqvWTX0PRTxE1jDzwSQQpfJaraTjOl
 AWeL1GB9I+TDkfVJqGUsUMX2kzDKO2HUDb/IwLvlWfoXv2kS7isPCi1PwhU2Rwgmmqu/I1r3EA3
 U2FCSYyU1nKBl0pe2HYBuOXD72mrifxsVDs9fXZ4cX+xcOuQclyq3lmQhjjNh1vLSxYe7WtxT2f
 NR84E1ew/H8vVSn2+BUgfXVYIdPuYZHiU7hF5E7upoCPkYyZtl1Su1bN8ANwcJAWWjl5lKNeLtG
 ep0Iptu9rdNSsgC4QZeJvX73Wa8HWebQrLfE1qBAKlCZeUmTSldxr+IrNDGFsf1aSIOie12ZDyh
 KaZsOO+rUL7YKEg4M+sjggK6HhkvcyQJBtoqC5EdmpYB/oAI17VeF3tCLd+qjZg0ACE0iyxKcdY
 WE1yWCFYNgKiXfe6w7jq5pdP6X3oScTOyPdu4m6YPrd4ixvmDk9ehGuCtjZ46lREeTlrR5c034d
 8ataVoJMw==
X-Received: by 2002:ad4:5d66:0:b0:894:68fa:37e6 with SMTP id
 6a1803df08f44-897404c9f34mr300821276d6.58.1771531577432; 
 Thu, 19 Feb 2026 12:06:17 -0800 (PST)
Received: from [96.232.40.90] (pool-96-232-40-90.nycmny.fios.verizon.net.
 [96.232.40.90]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971c8e60a0sm216675066d6.0.2026.02.19.12.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 12:06:16 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Thu, 19 Feb 2026 15:05:54 -0500
Subject: [PATCH v3 2/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-zcull3-v3-2-dbe6a716f104@darkrefraction.com>
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
X-Rspamd-Queue-Id: 3CAC7162398
X-Rspamd-Action: no action

Add kernel-side support for using the zcull hardware in nvidia gpus.
zcull aims to improve memory bandwidth by using an early approximate
depth test, similar to hierarchical Z on an AMD card.

Add a new ioctl that exposes zcull information that has been read
from the hardware. Userspace uses each of these parameters either
in a heuristic for determining zcull region parameters or in the
calculation of a buffer size.

It appears the hardware hasn't changed its structure for these
values since FERMI_C (circa 2011), so the assumption is that it
won't change on us too quickly, and is therefore reasonable to
include in UAPI.

This bypasses the nvif layer and instead accesses nvkm_gr directly,
which mirrors existing usage of nvkm_gr_units(). There is no nvif
object for nvkm_gr yet, and adding one is not trivial.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 29 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 +
 include/uapi/drm/nouveau_drm.h          | 66 +++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a3ba07fc48a0..5f3e7560a84e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -333,6 +333,35 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 	return 0;
 }
 
+int
+nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nvkm_gr *gr = nvxx_gr(drm);
+	struct drm_nouveau_get_zcull_info *out = data;
+
+	if (gr->has_zcull_info) {
+		const struct nvkm_gr_zcull_info *i = &gr->zcull_info;
+
+		out->width_align_pixels = i->width_align_pixels;
+		out->height_align_pixels = i->height_align_pixels;
+		out->pixel_squares_by_aliquots = i->pixel_squares_by_aliquots;
+		out->aliquot_total = i->aliquot_total;
+		out->zcull_region_byte_multiplier = i->zcull_region_byte_multiplier;
+		out->zcull_region_header_size = i->zcull_region_header_size;
+		out->zcull_subregion_header_size = i->zcull_subregion_header_size;
+		out->subregion_count = i->subregion_count;
+		out->subregion_width_align_pixels = i->subregion_width_align_pixels;
+		out->subregion_height_align_pixels = i->subregion_height_align_pixels;
+		out->ctxsw_size = i->ctxsw_size;
+		out->ctxsw_align = i->ctxsw_align;
+
+		return 0;
+	} else {
+		return -ENOTTY;
+	}
+}
+
 int
 nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index af6b4e1cefd2..134b3ab58719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -6,6 +6,7 @@
 	struct drm_device *dev, void *data, struct drm_file *file_priv
 
 int nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS);
+int nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..b698ac38e947 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1272,6 +1272,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GROBJ_ALLOC, nouveau_abi16_ioctl_grobj_alloc, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_NOTIFIEROBJ_ALLOC, nouveau_abi16_ioctl_notifierobj_alloc, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj_free, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_GET_ZCULL_INFO, nouveau_abi16_ioctl_get_zcull_info, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_INIT, nouveau_svmm_init, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_BIND, nouveau_svmm_bind, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_RENDER_ALLOW),
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index dd87f8f30793..1fa82fa6af38 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -432,6 +432,69 @@ struct drm_nouveau_exec {
 	__u64 push_ptr;
 };
 
+struct drm_nouveau_get_zcull_info {
+	/**
+	 * @width_align_pixels: required alignment for region widths, in pixels
+	 * (typically #TPC's * 16).
+	 */
+	__u32 width_align_pixels;
+	/**
+	 * @height_align_pixels: required alignment for region heights, in
+	 * pixels (typically 32).
+	 */
+	__u32 height_align_pixels;
+	/**
+	 * @pixel_squares_by_aliquots: the pixel area covered by an aliquot
+	 * (typically #Zcull_banks * 16 * 16).
+	 */
+	__u32 pixel_squares_by_aliquots;
+	/**
+	 * @aliquot_total: the total aliquot pool available in hardware
+	 */
+	__u32 aliquot_total;
+	/**
+	 * @zcull_region_byte_multiplier: the size of an aliquot in bytes, which
+	 * is used for save/restore operations on a region
+	 */
+	__u32 zcull_region_byte_multiplier;
+	/**
+	 * @zcull_region_header_size: the region header size in bytes, which is
+	 * used for save/restore operations on a region
+	 */
+	__u32 zcull_region_header_size;
+	/**
+	 * @zcull_subregion_header_size: the subregion header size in bytes,
+	 * which is used for save/restore operations on a region
+	 */
+	__u32 zcull_subregion_header_size;
+	/**
+	 * @subregion_count: the total number of subregions the hardware
+	 * supports
+	 */
+	__u32 subregion_count;
+	/**
+	 * @subregion_width_align_pixels: required alignment for subregion
+	 * widths, in pixels (typically #TPC's * 16).
+	 */
+	__u32 subregion_width_align_pixels;
+	/**
+	 * @subregion_height_align_pixels: required alignment for subregion
+	 * heights, in pixels
+	 */
+	__u32 subregion_height_align_pixels;
+
+	/**
+	 * @ctxsw_size: the size, in bytes, of a zcull context switching region.
+	 * Will be zero if the kernel does not support zcull context switching.
+	 */
+	__u32 ctxsw_size;
+	/**
+	 * @ctxsw_align: the alignment, in bytes, of a zcull context switching
+	 * region
+	 */
+	__u32 ctxsw_align;
+};
+
 #define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
@@ -445,6 +508,7 @@ struct drm_nouveau_exec {
 #define DRM_NOUVEAU_VM_INIT            0x10
 #define DRM_NOUVEAU_VM_BIND            0x11
 #define DRM_NOUVEAU_EXEC               0x12
+#define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
 #define DRM_NOUVEAU_GEM_NEW            0x40
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
@@ -513,6 +577,8 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
 #define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
 #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
+
+#define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
 #if defined(__cplusplus)
 }
 #endif

-- 
2.53.0

