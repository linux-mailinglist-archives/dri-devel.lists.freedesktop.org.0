Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN9RHpp3rmliFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:32:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46460234CF9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D8D10E0D8;
	Mon,  9 Mar 2026 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VL+l0wRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C786510E0D8;
 Mon,  9 Mar 2026 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773041556; x=1804577556;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=VauP1ROV92pNMZ/iiYucSS+d65dDT5JM4Zbi/ebIsaY=;
 b=VL+l0wRXFHVwXDxuL54IqiSSrrtBfuiV8i9nKP7o8kycQKUbK67IRlWF
 +IFvSzY7DFoo+aX43vLGFoh96PMabieoeouZhpUe2oszgqxefA7JYYrTw
 pLJegFczLfpzJUniooXRxFWL3GvfBpASVdGxNTHDGVEVw6HsQ8uMYjsSu
 NixWB3V6hXPXkJ89KXlFefpUjwi+kSWzfyjSnQnB8ZNF0MxEpthPFURvy
 4HoYd+LfgeRUklkASzJyatsqWmgQufpjD/9J4WnZmJbSgeTAy7yQg4GY1
 LteJYsRWve/9QggNAHq/ro7IKP/17tgg3Xs7lOnr1D06h4Om6RE92y4Fo A==;
X-CSE-ConnectionGUID: oC2vMM/cQqe3c38kBXaJ2A==
X-CSE-MsgGUID: wRhjnGSySlONFbvr3+8caw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77935630"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77935630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 00:31:01 -0700
X-CSE-ConnectionGUID: KGrwCQIyT+OAq4NdDxzGsw==
X-CSE-MsgGUID: fGf5GSr+TVmxPWcb6SulNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217286703"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 00:30:58 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH RFC 0/3] Some updates over DP AUX Transactions
Date: Mon, 09 Mar 2026 12:59:23 +0530
Message-Id: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANN2rmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNL3ZSC+MTSiviSzNzU/NISXcsU0yTDJGPTRIMUCyWgpoKi1LTMCrC
 B0UpBbs5KsbW1AJR6yNFlAAAA
X-Change-ID: 20260309-dp_aux_timeout-9d5b1b35a0d8
To: Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, ville.syrjala@linux.intel.com, 
 suraj.kandpal@intel.com, imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
X-Rspamd-Queue-Id: 46460234CF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

Based on the discussions/comments on the patch
https://lore.kernel.org/intel-xe/aaVWbdt1vOFxGAb1@ideak-desk.lan/
in order to address the real HW(DPTX) generated timeout and adress the
fix, this series is targetted.
Along with this it was noticed that the the AUX power request bit in the
port control register is being touched outside the power well framework.
The limitation due to the way aux port control register was programmed.
Replacing the aux control register write to read/mask/write thereby
writing only the required bits.

Note: This is RFC and full round of testing the pending.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (3):
      drm/display/dp: Export function to wake the sink AUX_CH
      drm/i915/dp: On AUX_CH tx timeout, wake up the sink
      drm/i915/dp: Configure PORT_AUX_CTL and then trigger the tx

 drivers/gpu/drm/display/drm_dp_helper.c            | 36 +++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |  6 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 94 +++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_psr.c           | 29 ++++---
 include/drm/display/drm_dp_helper.h                |  1 +
 5 files changed, 123 insertions(+), 43 deletions(-)
---
base-commit: 6884fe03ff2bc5a2f501ba4710f950dd4933ac84
change-id: 20260309-dp_aux_timeout-9d5b1b35a0d8

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

