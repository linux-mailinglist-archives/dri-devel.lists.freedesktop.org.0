Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2169F692
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 15:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4380E10E9D7;
	Wed, 22 Feb 2023 14:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA85410E9D3;
 Wed, 22 Feb 2023 14:25:19 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 6E47FC800A5;
 Wed, 22 Feb 2023 15:18:02 +0100 (CET)
Authentication-Results: srv6.fidu.org (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)"
 header.d=tuxedocomputers.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 tuxedocomputers.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from; s=default; t=1677075482; x=1678889883; bh=D3
 I1kLODPKL0LKI3DL3UiMVU0H7ABoanUSeYpcT2TB0=; b=uIVQqKBZ0WTwd+JgUn
 hbLFIMfmYcW350S5ujyXLx7UXgYpiohWMvru4OYsEERBgaU8i8CS8bTrIC3VWnwY
 0OJh1NZiF7IehCRlIuplrrWx53E0Fk/FiqMJ2isDtJ8yJ8Ufh3UtAN5aXdR08ieW
 NjidBTFHMAf+WGz5SgDLImv5w=
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id eif2nOs781h2; Wed, 22 Feb 2023 15:18:02 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box
 (host-88-217-226-44.customer.m-online.net [88.217.226.44])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 73504C800A2;
 Wed, 22 Feb 2023 15:18:01 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, jose.souza@intel.com, jouni.hogander@intel.com,
 mika.kahola@intel.com, ville.syrjala@linux.intel.com,
 lucas.demarchi@intel.com, Diego.SantaCruz@spinetix.com,
 wse@tuxedocomputers.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Apply quirk to disable PSR 2 on Tongfang PHxTxX1 and
 PHxTQx1
Date: Wed, 22 Feb 2023 15:17:55 +0100
Message-Id: <20230222141755.1060162-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222141755.1060162-1-wse@tuxedocomputers.com>
References: <20230222141755.1060162-1-wse@tuxedocomputers.com>
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

On these Barebones PSR 2 is recognized as supported but is very buggy:
- Upper third of screen does sometimes not updated, resulting in
disappearing cursors or ghosts of already closed Windows saying behind.
- Approximately 40 px from the bottom edge a 3 pixel wide strip of randomly
colored pixels is flickering.

PSR 1 is working fine however.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index ce6d0fe6448f5..eeb32d3189f5c 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -65,6 +65,10 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
 	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
 }
 
+/*
+ * Tongfang PHxTxX1 and PHxTQx1 devices have support for PSR 2 but it is broken
+ * on Linux. PSR 1 however works just fine.
+ */
 static void quirk_no_psr2(struct drm_i915_private *i915)
 {
 	intel_set_quirk(i915, QUIRK_NO_PSR2);
@@ -205,6 +209,10 @@ static struct intel_quirk intel_quirks[] = {
 	/* ECS Liva Q2 */
 	{ 0x3185, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
 	{ 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
+
+	/* Tongfang PHxTxX1 and PHxTQx1/TUXEDO InfinityBook 14 Gen6 */
+	{ 0x9a49, 0x1d05, 0x1105, quirk_no_psr2 },
+	{ 0x9a49, 0x1d05, 0x114c, quirk_no_psr2 },
 };
 
 void intel_init_quirks(struct drm_i915_private *i915)
-- 
2.34.1

