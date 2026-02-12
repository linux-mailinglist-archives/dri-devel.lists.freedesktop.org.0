Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMzNH3edjWmD5QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:29:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5601712BDEB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A90D10E709;
	Thu, 12 Feb 2026 09:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSezEQSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB7C10E707;
 Thu, 12 Feb 2026 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770888561; x=1802424561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IWTn8nVmQ472W5LXCogO9LWCuOK+CLTGN7M1CtrV4u8=;
 b=PSezEQSZ96YbCsIrB4dcRKwA+1VYjfCM6xNKOWksTvvUSCzQGkMvEMfI
 IsNeksyCmpDGwnmQJ6lOndpNV9FGfsrs0AiYYaaa+DjIB2fLXCkQf3Ska
 RP5xREZblq6cdOa22tlgJSCP6sghhupS+WI57rs05PpmF00WxwkntTbvn
 QfKRQNbPzLt0TALJ+bS9dHfMbeZ5WpBvgoDtYOCkiPUmxlV8b0oMXSDDr
 FTcZDwHJJ6uzt+PYdOikfR7anvyEXmLtUgQANeXgmB5z/jmcj/X1mi14b
 vvB/QzydiGp0MV7rdedGZDq7dAFWS64Tt6k5goHhJ5DF01WC1YJuy7Q9k g==;
X-CSE-ConnectionGUID: PmIzq48DTzCKwtnMeZAv7Q==
X-CSE-MsgGUID: jgUuGV6eRsCtBmKH6ZlbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89463836"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89463836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:29:21 -0800
X-CSE-ConnectionGUID: odDR3fOZRQiIqHzlTDW84w==
X-CSE-MsgGUID: 83EnXtRWRVWAP9YPTopJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="217016783"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:29:19 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/buddy: Documentation and internal helper cleanup
Date: Thu, 12 Feb 2026 14:55:28 +0530
Message-ID: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 5601712BDEB
X-Rspamd-Action: no action

This series improves the GPU buddy allocator by adding missing
documentation and cleaning up internal helpers.

It adds kernel-doc for the allocator structures and flags, covering
gpu_buddy, gpu_buddy_block, and the allocation flags (RANGE, TOPDOWN,
CONTIGUOUS, CLEAR, TRIM_DISABLE) to make the allocator’s design and usage
clearer for readers and contributors.

It also reduces the header surface by moving internal helpers from
gpu_buddy.h into buddy.c as static functions, since they have no
external users, and removes gpu_get_buddy(), an unused exported wrapper
around the internal __get_buddy() helper. This clarifies the intended API
and avoids exporting unused symbols.

No functional changes.

v2:
- Rebased after DRM buddy allocator moved to drivers/gpu/
- Keep gpu_buddy_block_is_free() in header since it's now
  used by drm_buddy.c
- Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index
  values (Arun)
- Updated commit message and cover letter to reflect changes

v3:
- Document reserved bits 8:6 in header layout (Arun)
- Fix checkpatch warning

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>

Sanjay Yadav (2):
  drm/buddy: Add kernel-doc for allocator structures and flags
  drm/buddy: Move internal helpers to buddy.c

 drivers/gpu/buddy.c       |  35 ++++-----
 include/linux/gpu_buddy.h | 148 +++++++++++++++++++++++++++-----------
 2 files changed, 123 insertions(+), 60 deletions(-)

-- 
2.52.0

