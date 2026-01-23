Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J3cA+3mc2nhzQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:23:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8090F7ADF4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA37110EBDB;
	Fri, 23 Jan 2026 21:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ftHaiD7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20A10EBDB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 21:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769203430;
 bh=5vEB8La44c65tSqwIyVz7t+cLWCUK5V0O5nicgmnpOY=;
 h=From:To:Cc:Subject:Date:From;
 b=ftHaiD7G11je8jAJXxhw7MKYwyXNiLL/j3buQSvck3S8mvSrLYe4R/SXgHYf0nYKg
 5JQ/I7hV5o0SNBQlPRF4QKPNAvehJIvdRgmE1H2K3H7XII1EEIN51Jj/5OD5WcfQ5k
 ukI56fldWUtJGosxBYW9EQUxMCvLPJA+kYTWRSIFFtlBcaJ+gLde1m/V13P83KEEVu
 eUQHRkJQrsBP6i9Q8m9NvRZGbqueZTKy+NCD9/zj4tE9qopda1FaEcbQ5LGlbYBUsq
 hVGOASEVROXYRUP8K7yzXYhdvn71jPqIGTNQix0LGCrJn/qe6JoSmDutbg1tVkfXyJ
 H6RIs5DthJj6g==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nanokatze)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BB69B17E0E3D;
 Fri, 23 Jan 2026 22:23:49 +0100 (CET)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Caterina Shablia <caterina.shablia@collabora.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm: add ARM interleaved 64k modifier
Date: Fri, 23 Jan 2026 21:23:25 +0000
Message-ID: <20260123212327.83064-1-caterina.shablia@collabora.com>
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:caterina.shablia@collabora.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[caterina.shablia@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[caterina.shablia@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.843];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8090F7ADF4
X-Rspamd-Action: no action

This modifier is intended to be used by panvk to implement sparse
partially-resident images with better map and unmap performance,
and no worse access performance, compared to implementing them in
terms of U-interleaved.

With this modifier, the arrangement of texel blocks is very similar
to block U-interleaved. Tiles are laid out linearly. Tiles are
always 64k bytes in size and are 1:1-sided rectangles when texel
block is 1 byte or a multiple of 4 bytes, and 2:1-sided otherwise.
Only power of two byte texel blocks can be used with this modifier.
Within a single tile, texels are arranged according to U-interleaving.

Unlike block U-interleaved, the layout depends solely on texel block
size and doesn't change depending on whether the image format is
compressed or not.

The hardware features corresponding to this modifier are available
starting with v10 (second gen Valhall.)

The corresponding panvk MR can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38986

Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e527b24bd824..0da2c880e08c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1422,6 +1422,16 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
 	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
 
+/*
+ * ARM 64k interleaved modifier
+ *
+ * This is used by ARM Mali v10+ GPUs. It's basically the same as 16x16 block
+ * U-interleaved, but within 64k-byte 1:1 or 2:1 -sided tiles. Tiles themselves
+ * are laid out linearly.
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

