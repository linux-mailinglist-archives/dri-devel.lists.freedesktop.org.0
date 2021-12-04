Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B96469368
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063EC73E0A;
	Mon,  6 Dec 2021 10:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71B6E8A0;
 Sat,  4 Dec 2021 10:55:41 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e11so11079700ljo.13;
 Sat, 04 Dec 2021 02:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ruXRve/GlUdLdEDYaUOifA1lUCUJXWdxTJEvuumUifQ=;
 b=MIJDV/2eWWclyWyD6qEyVllFzvqSaBiUOIOyQlKbG/3fqBQb5vAXWpp4ZoZEeSFs+W
 Xk+yE3Jgw8yvSn9ndrXnrAlq9CKep+C5cjraC+zzwf9Eus8GKi9N7mer8KF93E/aOej3
 IUu7ocsIcDYu5yqNOwt98008LSHrk8YeUmY6w5HG3zY6JD6R2vCkUVBPJquKZnoszsUX
 +sSrCMK5UEmUe0VajerYj0LtNMlqYq59TC5o0WtG1qXid1OyCIpVy/pUSJlgWCcdmQmo
 LdF+Rv2eUgR+ljhBHIYCBdKoqhXWB0h++GQTlLaHM0UfsQEUUwNxgbJMbEOlyUEtTXcQ
 D3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ruXRve/GlUdLdEDYaUOifA1lUCUJXWdxTJEvuumUifQ=;
 b=5h1w9HWBNroSydcU8zwWxWY/tzibbUZq9QwrwTc+wfg37ERxwgYzDWFsYmJOGXrvGr
 2sdQaD0o3vzmPEFuPv7TWHbAOMFmgV4cHnzYo9TKtO9ALtQqOVO/hzegMfXsS3NbGQAx
 ZCLzFsOLb3/Mik3t8cSwyTv29vdsxzWIRPtKYG4Qg/5iMCjAfKIorp0usmt+39PmRZsh
 jeo5S1OE9z+121OWYutngoUxPHmO0wutfT4NKU3MmyN1b1gbti2+2Kr/TN49CjNXnHaL
 pplL9Fv5AfhHaDf00P8/VpktLc7i5n7Cx04R6gaBZciOaSn6V/sGGDXeiM6NoZJ7eoTb
 ghfA==
X-Gm-Message-State: AOAM532ixGqIHB/zZ/wthzh7KnS0B6MInKVlxZo1xPjvYCXBQJ2S4dFL
 bnVoo+vkFPychNH+UVl20Dg=
X-Google-Smtp-Source: ABdhPJy2El7rztlBv1liaSflPNwardluUjHPPvs5OMe3GdnrapbiU7s49r3lY3D5gJcm/qDK3WPveA==
X-Received: by 2002:a05:651c:111:: with SMTP id
 a17mr24987306ljb.456.1638615339927; 
 Sat, 04 Dec 2021 02:55:39 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:39 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/9] drm/i915/gvt: Constify gvt_mmio_block
Date: Sat,  4 Dec 2021 11:55:23 +0100
Message-Id: <20211204105527.15741-6-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are never modified, so make them const to allow the compiler to
put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h      |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 0c0615602343..0ebffc327528 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -272,7 +272,7 @@ struct intel_gvt_mmio {
 /* Value of command write of this reg needs to be patched */
 #define F_CMD_WRITE_PATCH	(1 << 8)
 
-	struct gvt_mmio_block *mmio_block;
+	const struct gvt_mmio_block *mmio_block;
 	unsigned int num_mmio_block;
 
 	DECLARE_HASHTABLE(mmio_info_table, INTEL_GVT_MMIO_HASH_BITS);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cde0a477fb49..5e85a77da257 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3627,11 +3627,11 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
 	return 0;
 }
 
-static struct gvt_mmio_block *find_mmio_block(struct intel_gvt *gvt,
-					      unsigned int offset)
+static const struct gvt_mmio_block *find_mmio_block(struct intel_gvt *gvt,
+						    unsigned int offset)
 {
 	unsigned long device = intel_gvt_get_device_type(gvt);
-	struct gvt_mmio_block *block = gvt->mmio.mmio_block;
+	const struct gvt_mmio_block *block = gvt->mmio.mmio_block;
 	int num = gvt->mmio.num_mmio_block;
 	int i;
 
@@ -3670,7 +3670,7 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
  * accessible (should have no F_CMD_ACCESS flag).
  * otherwise, need to update cmd_reg_handler in cmd_parser.c
  */
-static struct gvt_mmio_block mmio_blocks[] = {
+static const struct gvt_mmio_block mmio_blocks[] = {
 	{D_SKL_PLUS, _MMIO(DMC_MMIO_START_RANGE), 0x3000, NULL, NULL},
 	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
 	{D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
@@ -3753,7 +3753,7 @@ int intel_gvt_for_each_tracked_mmio(struct intel_gvt *gvt,
 	int (*handler)(struct intel_gvt *gvt, u32 offset, void *data),
 	void *data)
 {
-	struct gvt_mmio_block *block = gvt->mmio.mmio_block;
+	const struct gvt_mmio_block *block = gvt->mmio.mmio_block;
 	struct intel_gvt_mmio_info *e;
 	int i, j, ret;
 
@@ -3871,7 +3871,7 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_gvt_mmio_info *mmio_info;
-	struct gvt_mmio_block *mmio_block;
+	const struct gvt_mmio_block *mmio_block;
 	gvt_mmio_func func;
 	int ret;
 
-- 
2.34.1

