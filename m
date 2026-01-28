Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AjfJkhYeml55QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:41:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB823A7D66
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B976110E2D9;
	Wed, 28 Jan 2026 18:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jilUuVNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB63110E2D9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 18:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769625666;
 bh=KXBKAefjXLnCeIRtDbsLkwaE9hss80vfcm2Jgufhkys=;
 h=From:To:Cc:Subject:Date:From;
 b=jilUuVNtv7ad2UNQOmNxQDEGnJ6H91CCIzH/Fx3eQJ1guFrewkxXYIMCiNc31kviE
 pMsI/0Q8Vyc9w05pJq2Auu2XoVbk3javBd2A7ZO508129BnXNfe5LG0McnLjClAL1z
 YHf5bb0Y/VvRLMJ85wnLzE5btRviN0Zh9ugpE0ORP8GcJtEGKPvmlNBo9FDA1992XG
 lf7jH+3wnnPcNcfoXKq90TFA98qZ1aENat1XfmPj249Kh1a7YqD7mKxIH5C19dy5G7
 GTvInqa4NN5CrDaCxq2lgJ/Uway9W2Ml/OtdLcFzZ5EMm0IXI3DQ/Yc8FLr5sgYFLr
 nemAq09PDfc3A==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nanokatze)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E6AC17E0699;
 Wed, 28 Jan 2026 19:41:05 +0100 (CET)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Caterina Shablia <caterina.shablia@collabora.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm: add ARM interleaved 64k modifier
Date: Wed, 28 Jan 2026 18:40:57 +0000
Message-ID: <20260128184058.807213-1-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[caterina.shablia@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:caterina.shablia@collabora.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[caterina.shablia@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:url]
X-Rspamd-Queue-Id: BB823A7D66
X-Rspamd-Action: no action

This modifier is primarily intended to be used by panvk to implement
sparse partially-resident images with better map and unmap
performance, and no worse access performance, compared to
implementing them in terms of U-interleaved.

With this modifier, the plane is divided into 64k byte 1:1 or 2:1
-sided tiles. The 64k tiles are laid out linearly. Each 64k tile
is divided into blocks of 16x16 texel blocks each, which themselves
are laid out linearly within a 64k tile. Then within each such
16x16 block, texel blocks are laid out according to U order,
similar to 16X16_BLOCK_U_INTERLEAVED.

Unlike 16X16_BLOCK_U_INTERLEAVED, the layout does not depend on
whether a format is compressed or not.

The hardware features corresponding to this modifier are available
starting with v10 (second gen Valhall.)

The corresponding panvk MR can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38986

Previous version:
https://lists.freedesktop.org/archives/dri-devel/2026-January/547072.html

No changes since v2

Changes since v1:

* Rewrite the description of the modifier to be hopefully unambiguous.

Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 include/uapi/drm/drm_fourcc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e527b24bd824..452f901513ad 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1422,6 +1422,22 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
 	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
 
+/*
+ * ARM 64k interleaved modifier
+ *
+ * This is used by ARM Mali v10+ GPUs. With this modifier, the plane is divided
+ * into 64k byte 1:1 or 2:1 -sided tiles. The 64k tiles are laid out linearly.
+ * Each 64k tile is divided into blocks of 16x16 texel blocks, which are
+ * themselves laid out linearly within a 64k tile. Then within each 16x16
+ * block, texel blocks are laid out according to U order, similar to
+ * 16X16_BLOCK_U_INTERLEAVED.
+ *
+ * Note that unlike 16X16_BLOCK_U_INTERLEAVED, the layout does not change
+ * depending on whether a format is compressed or not.
+ */
+#define DRM_FORMAT_MOD_ARM_INTERLEAVED_64K \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 2ULL)
+
 /*
  * Allwinner tiled modifier
  *

base-commit: f08f665f8cda9520d98ee24545d306a92f386616
-- 
2.47.3

