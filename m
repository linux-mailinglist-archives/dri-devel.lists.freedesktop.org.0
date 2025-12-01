Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C0C95DFB
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719FD10E2AB;
	Mon,  1 Dec 2025 06:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfI6VXlu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C0810E0FE;
 Mon,  1 Dec 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570952; x=1796106952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUTdsmcWH9SUMAIl1srrZz9ziKWRPpDdI06sB9PAJDk=;
 b=RfI6VXluMJeEZ5z2ouehgLckHirmA78xnsmoDdxiyR2LnoQgqxifps6w
 nM+x3YggXsvoKIcXnWQNnxAwhydKnhix8LOycpWpDUPjLEhkxhc6BMmnq
 ttdDMbjJC9sMymMLKvAzbZbNMXMu2OA/lDdsk5pNaMqEfaKlQmcHrk0Gk
 SHQ3N+lEWIBAHa1WvnMSmI9Ut6+D1If5J9GCZHu2Dz5aYBB0JNbWLsHO+
 qFRdAyNLYZfwKViY6IIo9RQkroSKzJWfo8a+LSa6gpbgEC33uXLey7I2c
 6KjpgfOx0bLwC7y+dIARmpM/jw+wAgRO9Mo4oTA0NMc+eXeDEWloW9L4J Q==;
X-CSE-ConnectionGUID: sYoFRLn1RzCAxM6QWEvntA==
X-CSE-MsgGUID: W8LagyAzQjqLfYqKni6Zaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663198"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663198"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:51 -0800
X-CSE-ConnectionGUID: LIVsdadDTAmpWSjPtvs2Hw==
X-CSE-MsgGUID: /kiPVWAySzi/bQcMWuMk7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806067"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:31 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 06/15] drm/i915/color: Preserve sign bit when int_bits is Zero
Date: Mon,  1 Dec 2025 12:16:46 +0530
Message-ID: <20251201064655.3579280-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
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

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 33fe5c9b4663..81b87fed8878 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -613,6 +613,8 @@ static u16 ctm_to_twos_complement(u64 coeff, int int_bits, int frac_bits)
 	if (CTM_COEFF_NEGATIVE(coeff))
 		c = -c;
 
+	int_bits = max(int_bits, 1);
+
 	c = clamp(c, -(s64)BIT(int_bits + frac_bits - 1),
 		  (s64)(BIT(int_bits + frac_bits - 1) - 1));
 
-- 
2.50.1

