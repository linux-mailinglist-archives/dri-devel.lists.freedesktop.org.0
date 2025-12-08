Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FF1CADFE2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 19:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB45710E4CB;
	Mon,  8 Dec 2025 18:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmXlkG45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C965010E4CC;
 Mon,  8 Dec 2025 18:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765218458; x=1796754458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W1ZXOT3hNZJb6E/5NbQJ/DcPJqLVuLRf6vJkSTtXdX8=;
 b=TmXlkG45UUb5UI976NxnygPS4bUKVOdpccQBYJkz+h5hK1xdJLB61c6A
 vbL0WjPezW+eo63L0z/f16/xBE/cCmEbram3xspw1ufHQKEzZP1F/YvnS
 7UMcMnROuCrE4HCo8eke9M0l+Noe4W5yqV++65DGkQbEm69YB+TPDX67O
 XcV5WqlcWDlxU3B99NkSZvzacsTNdl5YFo3STAaF7KX28XLBAdoteGEYc
 mC9q9UzC+ltttBGIiNZ7bPJ6zEr0NusqobFCBF0qvF65AfqUrFl4tLjOG
 DnopM/r//PrCSID7Uiygl35feCfZZjVpMb/SmIglyHxAOJXaqizG+UmNS g==;
X-CSE-ConnectionGUID: CiEGqp8LQHmTQgLyMZ/Ktw==
X-CSE-MsgGUID: S92Itn4GR4u7rUTtiksA7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67129564"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67129564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:27:38 -0800
X-CSE-ConnectionGUID: K3Kxe0ayTcuUhj0/3+JLhw==
X-CSE-MsgGUID: 8wqRL96lQcSJ9mcooBIg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="196014503"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:27:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 14/19] video/vga: Add VGA_IS0_R
Date: Mon,  8 Dec 2025 20:26:32 +0200
Message-ID: <20251208182637.334-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251208182637.334-1-ville.syrjala@linux.intel.com>
References: <20251208182637.334-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a proper name for the "Input status register 0" IO address.
Currently we have some code that does read addressed using the
aliasing VGA_MSR_W define, making it unclear what register we're
actually reading.

Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/video/vga.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/video/vga.h b/include/video/vga.h
index 468764d6727a..d83c5f153253 100644
--- a/include/video/vga.h
+++ b/include/video/vga.h
@@ -46,6 +46,7 @@
 #define VGA_MIS_R   	0x3CC	/* Misc Output Read Register */
 #define VGA_MIS_W   	0x3C2	/* Misc Output Write Register */
 #define VGA_FTC_R	0x3CA	/* Feature Control Read Register */
+#define VGA_IS0_R	0x3C2	/* Input Status Register 0 */
 #define VGA_IS1_RC  	0x3DA	/* Input Status Register 1 - color emulation */
 #define VGA_IS1_RM  	0x3BA	/* Input Status Register 1 - mono emulation */
 #define VGA_PEL_D   	0x3C9	/* PEL Data Register */
@@ -485,3 +486,4 @@ static inline void vga_mm_wattr (void __iomem *regbase, unsigned char reg, unsig
 }
 
 #endif /* __linux_video_vga_h__ */
+?
-- 
2.51.2

