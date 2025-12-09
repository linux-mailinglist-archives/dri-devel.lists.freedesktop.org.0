Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F2CAF389
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 08:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927E10E130;
	Tue,  9 Dec 2025 07:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n69H1H8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1CD10E130;
 Tue,  9 Dec 2025 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765266954; x=1796802954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A1HIcdmWtfzAS7KpurWrGbFWv6G4WU0ghfbCpDlh3hE=;
 b=n69H1H8nMQc/mJKo3C78x3jnm7qppTIdXfQmz+GN0vBFRY9JWfXP2D1o
 /LVtE95ZtFppqAz51x3vEMEgAQ1h9RSw4z1rRQW+Qda4lZXfgTpJfoDtX
 8RR6t0oz7hbPsE7pjD5eQ+w03/svXTVe5laX9D6qZCpQC0CEYUW9DV9ns
 mIYAWveSWgpXLZimE2e1ILLwES1VVBAu7bmjMnt/PSjEDscm5GwMTG2cB
 16AsA3y50NVtC0jXSiZAuzHQqNZmH/Svbb92Sit7x9s3oNnWHMz91aCX8
 e51EpML/uBoE0Na7oyyKLwKoa1I3In79qEWmQ/2DYedB/QoZuxHBbgMKF w==;
X-CSE-ConnectionGUID: awHbVfwKTVm8/2Z/RWNynQ==
X-CSE-MsgGUID: 6nzwv2eTRCiNCvbkb7hisQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54760899"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="54760899"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 23:55:53 -0800
X-CSE-ConnectionGUID: PJkouwWZSJSPp2YwcBQ0nw==
X-CSE-MsgGUID: XkInklW/RQSPyvXaLOQBYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196449741"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 23:55:51 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/19] video/vga: Add VGA_IS0_R
Date: Tue,  9 Dec 2025 09:55:49 +0200
Message-ID: <20251209075549.14051-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251208182637.334-15-ville.syrjala@linux.intel.com>
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
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

v2: Remove stray '?'

Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/video/vga.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/video/vga.h b/include/video/vga.h
index 468764d6727a..2f13c371800b 100644
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
-- 
2.51.2

