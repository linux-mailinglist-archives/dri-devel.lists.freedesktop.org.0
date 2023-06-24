Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E9273CC08
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 19:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9642410E1BB;
	Sat, 24 Jun 2023 17:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB88B10E009;
 Sat, 24 Jun 2023 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687627080; x=1719163080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/exRLLCCIJ+SCYmv1qZD/7JAXfhDLR/kzhGGpYwNrSQ=;
 b=T542cwk9og0vFXUL6YsUKFW7+2SAGkVfGrVaQXEANmdVNIksAtCPG5WM
 XCa2BC4nwIDSHa6nisHWZ34S1idrpNSm+nhrB+SNKE4DzS0sRDI42kZwK
 tLDDgvwMYmuYuagXxauZVMscg1wFJlFKIU/mfnDnI2kRoEvp6enKTujaX
 jZ5MfJf92CRBXIqi2tb2dufqLqebYpc0knB71jFAs7lnecblKfaB1XrLE
 R658n1KWjv9BscmkcvaDdKrGokTotFw7SeoOen0RJtoe4H5cx2/5UeMO2
 BdRnuOZosHBXR4sFv8LvPUOFzxy0r0z6bLoGitl2a3a6jrUOnB13sxuyg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="340557478"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="340557478"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045977430"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; d="scan'208";a="1045977430"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2023 10:18:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/i915/gt: Remove bogus comment on
 IVB_FBC_RT_BASE_UPPER
Date: Sat, 24 Jun 2023 10:17:57 -0700
Message-Id: <20230624171757.3906095-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624171757.3906095-1-lucas.demarchi@intel.com>
References: <20230624171757.3906095-1-lucas.demarchi@intel.com>
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
apply as this is not a call to wa_mcr_add(), but rather to
wa_mcr_clr_set(). So, this register is actually checked and it's
according to the Bspec that the register is RW, not RO.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 848519b58e45..5fe85fad91c1 100644
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

