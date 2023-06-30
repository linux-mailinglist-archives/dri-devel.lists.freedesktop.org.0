Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82D744341
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D89910E4EE;
	Fri, 30 Jun 2023 20:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB0410E4D8;
 Fri, 30 Jun 2023 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688157332; x=1719693332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lAFFQ+EfYN2M9/OpcUC0NCnPSP2/TeRDgmSUqNFdOlQ=;
 b=dkhEM2FpJWh1TjXxGCMNTyFvEGQyy/Y/+UL935Lfo7tpUSRFnTFnTIzV
 5BvjDXghEOIgczJJyj9xEVxauW9hR5/R99Pd/+4pj5V6GOy3UO52oeObL
 o/A7gR51c/6DD5m+CRPGKS0CEBgIkOID26th+cEFc6uJPkkhw2AuWHKTC
 O9AsB6EP1dezgYa176AWSBOWqV4ieTneZiOxvt67cmX8iddOEfOWV0F3t
 vB7l7T1IwyCGP9V/OGZVwOrByRhClDMSXXZlpo9ZS16t2rwK6ctf/mJqy
 3NKz8qxzPQWNHguPW3wWd5tpb9YMVc/EL4W5H00sMYj6uDK48w0/3djIV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393213919"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="393213919"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807904264"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="807904264"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/i915/gt: Remove bogus comment on
 IVB_FBC_RT_BASE_UPPER
Date: Fri, 30 Jun 2023 13:35:08 -0700
Message-Id: <20230630203509.1635216-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The comment on the parameter being 0 to avoid the read back doesn't
apply as this is not a call to wa_add(), but rather to
wa_write_clr_set(). So, this register is actually checked and it's
according to the Bspec that the register is RW, not RO.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index e2025c363949..a6f3f160ebe2 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -666,7 +666,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 	/* Wa_1604278689:icl,ehl */
 	wa_write(wal, IVB_FBC_RT_BASE, 0xFFFFFFFF & ~ILK_FBC_RT_VALID);
 	wa_write_clr_set(wal, IVB_FBC_RT_BASE_UPPER,
-			 0, /* write-only register; skip validation */
+			 0,
 			 0xFFFFFFFF);
 
 	/* Wa_1406306137:icl,ehl */
-- 
2.40.1

