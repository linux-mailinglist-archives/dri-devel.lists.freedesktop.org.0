Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKJXH5o8qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4F20D5AE
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D2110EB77;
	Thu,  5 Mar 2026 08:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBxnK2bC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B748D10E24A;
 Thu,  5 Mar 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772698774; x=1804234774;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=uKtBRzT/bxkBxZXQRdCqUEN6co7JIaVdUDbDJvtgRpM=;
 b=IBxnK2bChJihnHoHbVFwzbghJAVpa5deK2MyxD+/wtuTfTd1Lk53vC9G
 8te2klv15zJmJk9cKVrh4hzYn4arTv9gIXQMNEhdYNaOsMLXPWWFWj+AV
 ZNCr6oD4wQaD0CV+zUC1/r7JFYqJmCsuuc9TqKDjDx08UYmTqvDcaR4RW
 CtR3AZAkDbzarYYk+KhzRyg9bZcD2A2B3Vs8+YVwxYUD7WuyCrbma8SaB
 CkU2ikXko9HdLWTJW3TVPab24pWK+JteLAzUEKvtCPUvcd8O5JdWpFVqL
 kHU8QRxVI8rliXftNYD7g2u6QrziNIA8cWDWV9RgRlROzsTmdDfHTslg1 g==;
X-CSE-ConnectionGUID: dh4oYDawTCOQ2H1WgH3/sw==
X-CSE-MsgGUID: UHAY3YuXQ3mcZSJuamJK4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91349130"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="91349130"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:19:33 -0800
X-CSE-ConnectionGUID: e+XpawZnS6OiWC9M3RAsRg==
X-CSE-MsgGUID: W+bMnBI7THOdA0X5+ZsTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="256492847"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 00:19:31 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH RFC 0/4] DP: Read LTTPR caps followed by DPRX caps
Date: Thu, 05 Mar 2026 13:48:10 +0530
Message-Id: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEM8qWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3ZSC+MTSCl3DVCNzU0vLVAOzZAsloOKCotS0zAqwQdFKQW7OSrG
 1tQByYzKfXQAAAA==
X-Change-ID: 20260305-dp_aux-1e27599e06c8
To: Imre Deak <imre.deak@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
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
X-Rspamd-Queue-Id: 18F4F20D5AE
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
	NEURAL_HAM(-0.00)[-1.000];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

As per the spec  DP2.1 section 3.6.8.6.1, section 2.12.1,
section 2.12.3 (Link Policy) the LTTPR caps is to be read first
followed by the DPRX capability.

Git log shows that initially drm dp helper exposed function to read
lttpr caps. Driver reads the lttpr caps and then the dprx caps.
For a particular issue 
https://gitlab.freedesktop.org/drm/intel/-/issues/3415
as a workaround reading dprx caps was done first to know if the panel is
< DP1.4 and then read 1 block at a time for lttpr caps.

This can be handled in a better way and two such ways is what I see.
1. Read LTTPR caps followed by DPRX caps as per the spec. Then on
reading dprx caps if revision < 1.4 then re-read the lttpr caps one
block at a time.

2. Read LTTPR caps and if 8b/10b check for correctness of the link rate
supported(lttpr caps 0xf0001), if some corrupted value is read then read
one block at a time.

I am open for either of the two or you have any other options as well I
am open.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (4):
      drm/display/dp: Read LTTPR caps without DPRX caps
      drm/i915/dp: Read LTTPR caps followed by DPRX caps
      drm/i915/dp: On HPD read LTTPR caps followed by DPRX caps
      drm/i915/dp: DPRX/LTTPR caps for DP should be read once

 drivers/gpu/drm/display/drm_dp_helper.c            | 63 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c            |  3 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 40 +++++++-------
 .../gpu/drm/i915/display/intel_dp_link_training.h  |  1 -
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |  3 +-
 include/drm/display/drm_dp_helper.h                |  2 +
 6 files changed, 86 insertions(+), 26 deletions(-)
---
base-commit: cfc20c776480fda8c1b0517b187bb71ec0781cd4
change-id: 20260305-dp_aux-1e27599e06c8

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

