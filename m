Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKiBFry/oWnPwAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 17:01:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF891BA73E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 17:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4D910EBC4;
	Fri, 27 Feb 2026 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDuGSVnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0006A10E1AD;
 Fri, 27 Feb 2026 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772208046; x=1803744046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUu9oJ+sRISpRQKVPUIG38QfS86s5N7QoC4hMppDx5g=;
 b=ZDuGSVnQcovdTa1dFNe+vUIFly/k9HkCQylDJN8WnpcJ70+adYFOSavO
 XlHTqwao40bVdD34fjBL3lD43vkG2jSNWS6vKnIEaC2NhiA12HL7Gxx5b
 5ExHASqDpGJeB93pGtY8ieWlh1oDq/JvWiCdFcST+5FpoFDRX6DizAd7O
 chwVF5dvkaObU8J9ln45V5fCVeZqnmuTW7CnHxRd3Ql2aqCrM6TH3dlph
 WkLmYZuMutWBrniAKBmQowxIbmkNiUELvSDOPSTJCREBJ9+r+rKLyPt58
 GrIREbdRyGyixQQZEJw/9Sp7NzZ9Z8GkkcsZLkf2BcyWdOEM9o0KUHPox g==;
X-CSE-ConnectionGUID: l2CdkDAoRryM3K95DOHzKw==
X-CSE-MsgGUID: SiE8kHtyTAK2KaFlQ/ET3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75895465"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75895465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:45 -0800
X-CSE-ConnectionGUID: MIC7Yg1NQoqG0pfFmd1bxw==
X-CSE-MsgGUID: 7LszxI9vRdiM1v4epPLVMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213791065"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:44 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/ttm: Improve the TTM operation context
 gfp_retry_mayfail behaviour 
Date: Fri, 27 Feb 2026 17:00:10 +0100
Message-ID: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[intel.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0EF891BA73E
X-Rspamd-Action: no action

Two small patches around the gfp_retry_mayfail behaviour:

Patch 1 ensures we don't spam the kernel log on allocation failures.

Patch 2 extends the gfp_retry_mayfail to swap readback.

Thomas Hellström (2):
  drm/ttm: Don't spam the log on buffer object backing store allocation
    failure
  drm/ttm: Avoid invoking the OOM killer when reading back swapped
    content

 drivers/gpu/drm/ttm/ttm_backup.c | 6 ++++--
 drivers/gpu/drm/ttm/ttm_pool.c   | 7 +++++--
 include/drm/ttm/ttm_backup.h     | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.53.0

