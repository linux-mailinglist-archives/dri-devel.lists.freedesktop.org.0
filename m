Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A0522C06
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF86010E4E4;
	Wed, 11 May 2022 06:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B20C10E450;
 Wed, 11 May 2022 06:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652248959; x=1683784959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tuJUJGDYENAMjN2cIdCYuXVg26Q9snwiWfd88zMmZCA=;
 b=lfx1Sed4+F+G8k4KUhBDLJFTbW3eZpQtimUphIZeu4d0l3z1xqjdrWrT
 bIH2AHZSRwKL+c6qzu2RIUyhfCk9NyFPq8KjCNjOW4myluaEBXH2UYqVF
 QS5DDKhY/Fz4nB4XwDQsShLbWIZnPCN7G5DXuyuurzI4WUcZqIgututqr
 CnJ2S98EJoTY73vwnp+RcWHeUA9oCNg1FyfHPhPEB6hvDHP6zFN9kml43
 zw4ozCba+C0tCAgVaYNUh9VzXIVhHi9Hno/gSEngLt/TJROxpjYMoBJda
 bzJe6YEDj+yKw/BbUf3nHelu9KLXywUjnvgf+XWCZmmUHodfIqMzvnX/V Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332633561"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="332633561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520375223"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/i915/guc: XEHPSDV and PVC do not use HuC
Date: Tue, 10 May 2022 23:02:28 -0700
Message-Id: <20220511060228.1179450-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511060228.1179450-1-matthew.d.roper@intel.com>
References: <20220511060228.1179450-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Disable HuC loading since it is not used on these platforms.

Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index ecf149c5fdb0..55e1eb8f3612 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -45,6 +45,10 @@ static void uc_expand_default_options(struct intel_uc *uc)
 
 	/* Default: enable HuC authentication and GuC submission */
 	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
+
+	/* XEHPSDV and PVC do not use HuC */
+	if (IS_XEHPSDV(i915) || IS_PONTEVECCHIO(i915))
+		i915->params.enable_guc &= ~ENABLE_GUC_LOAD_HUC;
 }
 
 /* Reset GuC providing us with fresh state for both GuC and HuC.
-- 
2.35.1

