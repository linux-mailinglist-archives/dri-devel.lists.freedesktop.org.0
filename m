Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA26CA76D3
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF07110EADB;
	Fri,  5 Dec 2025 11:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KbHCMCrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3263A10EAD4;
 Fri,  5 Dec 2025 11:35:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4564E60138;
 Fri,  5 Dec 2025 11:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FB8C4CEF1;
 Fri,  5 Dec 2025 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764934506;
 bh=RVtaNUETYVgmpQ0EhWEMCf9T407Tq7AbLmecK05zQ4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=KbHCMCrGUE79SkrgwHCEMOkeNJzhA6hJUJj5AjI35JETrIe9WYmM/70/93uhzbvxO
 LvflnnG18QjoInD1bKtPObFu1lFexVCewDpsDzl1CXD4uEogdwhTxnL2a+qw/R9Yl5
 ooltVR08iMCw4p7KF2bchUcPr5PiS9XKbh1WDlIoqfo2j9v+xP2ttwKn04eV0OI1ez
 JpEvhgfZbvHbwbbl0SnMdRDzEnavW4kf6H95IfZJ4XY0NTgX1DElc+DF1fgy8EA8et
 HpXbE61scMeMSH9ONlwsw+San61+xnx6y6zohhJT2ECA9vm8dCL6zviH46M5qoT5gc
 KoZsvfn0sPb4w==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Fix format string truncation warning
Date: Fri,  5 Dec 2025 12:35:01 +0100
Message-ID: <20251205113500.684286-2-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=ardb@kernel.org;
 h=from:subject; bh=RVtaNUETYVgmpQ0EhWEMCf9T407Tq7AbLmecK05zQ4Y=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIdPocGr+aetlnRqrZitPf1p10fuC4EWfc4vOCOqeETuY1
 Lmg8uDVjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRF2oM/8MNqvM8myP+p3A4
 pAev3hH5+8GO+uuLvgVw3ThzMiF+4TFGhr+fbUWe3y0Mk3A/IiSWtXfDbut1Ggpr16y29Vzso/L
 yFzsA
X-Developer-Key: i=ardb@kernel.org; a=openpgp;
 fpr=F43D03328115A198C90016883D200E9CA6329909
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

GCC notices that the 16-byte uabi_name field could theoretically be too
small for the formatted string if the instance number exceeds 100.

So grow the field to 20 bytes.

drivers/gpu/drm/i915/intel_memory_region.c: In function ‘intel_memory_region_create’:
drivers/gpu/drm/i915/intel_memory_region.c:273:61: error: ‘%u’ directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Werror=format-truncation=]
  273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
      |                                                             ^~
drivers/gpu/drm/i915/intel_memory_region.c:273:58: note: directive argument in the range [0, 65535]
  273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
      |                                                          ^~~~~~
drivers/gpu/drm/i915/intel_memory_region.c:273:9: note: ‘snprintf’ output between 7 and 19 bytes into a destination of size 16
  273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  274 |                  intel_memory_type_str(type), instance);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2: grow buffer instead of changing the output

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

 drivers/gpu/drm/i915/intel_memory_region.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index b3b75be9ced5..e9a4e6090fe0 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -72,7 +72,7 @@ struct intel_memory_region {
 	u16 instance;
 	enum intel_region_id id;
 	char name[16];
-	char uabi_name[16];
+	char uabi_name[20];
 	bool private; /* not for userspace */
 
 	struct {
-- 
2.47.3

