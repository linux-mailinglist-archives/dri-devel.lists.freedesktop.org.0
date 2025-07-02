Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC46AF0F1D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C7910E68D;
	Wed,  2 Jul 2025 09:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwBklCcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9073810E692;
 Wed,  2 Jul 2025 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447314; x=1782983314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t3jTmME0acXuRvjo9tMBZqSHW7n+vdv71w016cP/RqE=;
 b=MwBklCcmWZbjVL7cV5Y3lS5SRpGsrPoK2A8TC2EpuYI/L6HsXDrSogKs
 98pEG2ClPfzidkvSKeID3EVZMZgNrHvYp+Dkb+v/2Rc2z8sGB6IQrOGVI
 qN+p+Mwopo83cfWDXjBtwqp9XvS9uLvZGLExJCWq0O/qA9WV6SAOFU7hs
 Augmf264PG/6wzTq8unfTq6UWLOpL8i2G9wrT9hrd/Ft1HRuOQLtZI1p9
 727xrROilFA8iW3b30pKGjNEmeJPn+PvQphhNDNBA20NZ5odK8sx2rLY9
 oHgAmd0XAGR4iqeeSYEt8MJZGU1/f88Kgiyy3c+7w/2jKSPSj2WeXj4go g==;
X-CSE-ConnectionGUID: MaMhw9c8RZ6u0fARBb+qIQ==
X-CSE-MsgGUID: YCNx9lSiSbGE5UZVyTXrDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427185"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:34 -0700
X-CSE-ConnectionGUID: O3fjhYYnQa2AMNmV/HMqng==
X-CSE-MsgGUID: YVM803bmSFSAYQfplbEuTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536646"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:30 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 15/24] drm/i915/color: Preserve sign bit when int_bits is Zero
Date: Wed,  2 Jul 2025 14:49:27 +0530
Message-ID: <20250702091936.3004854-16-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

When int_bits == 0, we lose the sign bit when we do the range check
and apply the mask.

Fix this by ensuring a minimum of one integer bit, which guarantees space
for the sign bit in fully fractional representations (e.g. S0.12)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 9684eee96ef9..dcf7cfa722ef 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -618,6 +618,8 @@ static u16 ctm_to_twos_complement(u64 coeff, int int_bits, int frac_bits)
 	if (CTM_COEFF_NEGATIVE(coeff))
 		c = -c;
 
+	int_bits = max(int_bits, 1);
+
 	c = clamp(c, -(s64)BIT(int_bits + frac_bits - 1),
 		  (s64)(BIT(int_bits + frac_bits - 1) - 1));
 
-- 
2.42.0

