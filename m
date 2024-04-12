Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A08A332B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 18:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D2E10F76A;
	Fri, 12 Apr 2024 16:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsvyYlYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7AA10F752;
 Fri, 12 Apr 2024 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712938102; x=1744474102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rjoq9JZ9aRAI5Vdj5iblad5chcAyzYh2XtJfo9AP85U=;
 b=SsvyYlYbVvPmutuSMRd15c1bYHoubb/eK0t/mbOUj2zhdQN7F9VQf+AM
 yV8hpBTmmEHB4flCKFLN2g+9f7FvxNTfx3Q0H4okPFB94nS71uvqvHnYH
 bk7oJEIjwCsq3C//lbyzynGugzm4ynw0qqJzQ479p5+1dDq6FHS9HP+/0
 9yVIbtKLV90sKzei7HWacoqprjAu+tOoJRNuWuO04S7tlaz3MDUqcYb0m
 1hHHKOhCJRzfmsnZfvVSmSIO2Nb1AoWWScVJrWgrf8Uru3WJARsgZvl4/
 d2mpmqQe6fs5Wx1D2QYyihaycQeysHNS8HivclvT4OYBj714kPMnwlYjz g==;
X-CSE-ConnectionGUID: glXNnlyORHiA8dF/7oaGag==
X-CSE-MsgGUID: 41F4QPrKQuWONNjumG5ciw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8256923"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8256923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:08:22 -0700
X-CSE-ConnectionGUID: GmG0Lf4CRHy3hYdJIYQYCQ==
X-CSE-MsgGUID: 769bdcL3SYyqzHd4hPieiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25964127"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 12 Apr 2024 09:08:21 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Date: Fri, 12 Apr 2024 21:22:42 +0530
Message-Id: <20240412155243.2891996-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240412155243.2891996-1-animesh.manna@intel.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
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

Set the Link Off Between Frames Enable bit in ALPM_CTL register.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c          | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 699f2f051766..ae894c85233c 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -325,6 +325,11 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp)
 			   ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
 	}
 
+	if (intel_dp->lobf_supported) {
+		alpm_ctl |= ALPM_CTL_LOBF_ENABLE;
+		intel_dp->lobf_enabled = true;
+	}
+
 	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp->alpm_parameters.check_entry_lines);
 
 	intel_de_write(dev_priv, ALPM_CTL(cpu_transcoder), alpm_ctl);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6116c383b543..f61ba582429b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1884,6 +1884,7 @@ struct intel_dp {
 
 	/* LOBF flags*/
 	bool lobf_supported;
+	bool lobf_enabled;
 };
 
 enum lspcon_vendor {
-- 
2.29.0

