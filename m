Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAF98EDEA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23D110E7FB;
	Thu,  3 Oct 2024 11:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FW5Xfm6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A81910E7FB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954339; x=1759490339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFSQkDU7n3AoDPGiSS39/NcFfP2oNvOgc4qn76rWwBc=;
 b=FW5Xfm6faZ9/rTwm6zWrJDcYsPdYOeSzu8bX/7lS9WdgC59euQZiNaY5
 RJs789PGlwg+2FV9XMMAiOcmHJpmXV+WokqqnJI0Fw8t4aTSY9zHY0Mhj
 dm7G027u6K5Ay3tZUPgDLgW7nL+cdijO3SHOITvgA43O3zwn8sWE5hpOQ
 qpPFXPkTFfaqt6epF3hlO8YKdlVV35rM9SO7YdtCmqr0vApLvchABX1Lv
 RFNEJHnmrgDPAKffETjfpf3rFz+hdZPa3mVRsCEGk8S440aICFsN2meQQ
 7yEwk0XHK96LchMcSwAsbhVMqyUnNLBStl09VcJ/E0Hz84kjFoCDVXU1f A==;
X-CSE-ConnectionGUID: 9na5Uv5zTFatZO/nMwtcjA==
X-CSE-MsgGUID: vcvev/PTR4u6WoldxcYTUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012954"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:18:59 -0700
X-CSE-ConnectionGUID: jtKyp9ZcSnyVFyQOh97zJQ==
X-CSE-MsgGUID: 15C7rz0fQD+zYqzCtez8fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423694"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:18:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:18:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Subject: [PATCH v2 01/10] drm/tilcdc: Allow build without __iowmb()
Date: Thu,  3 Oct 2024 14:18:42 +0300
Message-ID: <20241003111851.10453-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

__iowmb() isn't available on most architectures. Make
its use optional so that the driver can be built on
other architectures with COMPILE_TEST=y.

v2: Add a comment stating this is for COMPILE_TEST (Tomi)

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Acked-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_regs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
index f90e2dc3457c..332b24327386 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
@@ -125,7 +125,10 @@ static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
 	iowrite64(data, addr);
 #else
+	/* allow compilation without __iowmb() for COMPILE_TEST */
+#ifdef __iowmb
 	__iowmb();
+#endif
 	/* This compiles to strd (=64-bit write) on ARM7 */
 	*(volatile u64 __force *)addr = __cpu_to_le64(data);
 #endif
-- 
2.45.2

