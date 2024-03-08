Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D8E8763CA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61026113897;
	Fri,  8 Mar 2024 11:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI4WC5e2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C9411388D;
 Fri,  8 Mar 2024 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899023; x=1741435023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yw2AQU+xKWtINom5CX+Xoavf7lFYsBroDjnW8m3JRh8=;
 b=gI4WC5e2Y4NeO8CiLeDuGi08FrHYwWOPnfbX/0FMrp1qK66IZ1iA+XaI
 Wbbo71YOABFS8nwIlIkFtZGYYasSnv0vBuaw9VKEj7a52PGv/9wamGHJ4
 FMmTD6CIy9QE4QL2UcJFgSt65bD7CWzIKadePLhtXfyvhaMmSKRzV38go
 Ef4qsN+nt8h5QFcBBVlEMVyFyx65auHwWOoJWlhYqJTuu/Pks5X+ae5zr
 AWRByaYaavbUbI7ZLT7z50BSnvSqMkOnJNLDUWb2Ln4bv+20x4IcXnLAD
 LZHS+qPVQIU7YgMD5IWfAPw1NCbsIIgy2guQyX4gAOdkOAQLXOwRzvtqb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794545"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378578"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 08/16] m68k: pgtable: Add missing #include <asm/page.h>
Date: Fri,  8 Mar 2024 13:55:46 +0200
Message-Id: <af9e22b878f59223adb593f5bbd5b61432120010.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

When just including <linux/pgtable.h>:

    include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name ‘pgd_t’
	9 | typedef struct { pgd_t pgd; } p4d_t;
	  |                  ^~~~~

Make <asm/pgtable.h> self-contained by including <asm/page.h>.

Reported-by: Jani Nikula <jani.nikula@intel.com>
Closes: https://lore.kernel.org/r/878r2uxwha.fsf@intel.com
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 arch/m68k/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/pgtable.h b/arch/m68k/include/asm/pgtable.h
index 27525c6a12fd..49fcfd734860 100644
--- a/arch/m68k/include/asm/pgtable.h
+++ b/arch/m68k/include/asm/pgtable.h
@@ -2,6 +2,8 @@
 #ifndef __M68K_PGTABLE_H
 #define __M68K_PGTABLE_H
 
+#include <asm/page.h>
+
 #ifdef __uClinux__
 #include <asm/pgtable_no.h>
 #else
-- 
2.39.2

