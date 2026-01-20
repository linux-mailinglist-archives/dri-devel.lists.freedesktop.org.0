Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBXRMaGkb2n0DgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECB746C0E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4D510E60B;
	Tue, 20 Jan 2026 14:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezMJ7akP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FD310E60B;
 Tue, 20 Jan 2026 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768919723; x=1800455723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eaKT4Xz/ZevKpD4XLakUK1esrrubU4DecnMyskKFHEY=;
 b=ezMJ7akPhVjBKjPph8LAYFw4go6KyrfSNmJ6EhSOk/xN65ztM8AxtHB1
 CU+GA2PvjJ7niWNoujMNfm+FcrQBPgaxvZ6kQ9VMkJ8ZlTuheQNLk/hmk
 PnRIivf07g1ISkKtEjtmwo4HH9alkkHDG6Fc1kQMsC2hma8dGwSUyPVZr
 Al7NpdNBFgkW99UGNf9YiOsTmD/C4A84vRPIjQl3yUmFoyfVUD7KBy6W2
 CK+BDbbKA3eGPthoT8Vb0ULlX5jY/vMqQLL2tC4vI/Wh5Td6DMFjmPkdv
 BcBnLWTlq/ovHelLKZVad9hes5Z9oFajHYG46XTM6LVlbbWkeg+I3lWSg g==;
X-CSE-ConnectionGUID: oOgCZRyFTRqKiczZX1hLmA==
X-CSE-MsgGUID: AkJsTEaqQ1CLq0kMeXo8zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69327958"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69327958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:35:23 -0800
X-CSE-ConnectionGUID: UY7PaLvfRuePjwhEAihaoA==
X-CSE-MsgGUID: +J4pGCQARSK3UTSF7m6SPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206171953"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.250])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:35:21 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm, drm/xe: Fix xe SVM configs
Date: Tue, 20 Jan 2026 15:34:57 +0100
Message-ID: <20260120143459.9485-1-thomas.hellstrom@linux.intel.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 4ECB746C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The first patch fixes the problem of xe userptr not being enabled if
CONFIG_DEVICE_PRIVATE or CONFIG_ZONE_DEVICE is missing.

Second patch explicitly selects CONFIG_DEVICE_PRIVATE and
CONFIG_ZONE_DEVICE if DRM_XE_GPUSVM is enabled, which is probably what
most distros want. This patch is not Fixes: tags since some configurations
may actively want to exclude CONFIG_DEVICE_PRIVATE / CONFIG_ZONE_DEVICE
and it's undesirable if a stable update breaks those.

v2:
- Also take CONFIG_ZONE_DEVICE into account. (Xe CI)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org

Thomas Hellström (2):
  drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
  drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected

 drivers/gpu/drm/Kconfig    |  2 +-
 drivers/gpu/drm/Makefile   |  4 +++-
 drivers/gpu/drm/xe/Kconfig |  5 +++--
 include/drm/drm_pagemap.h  | 18 ++++++++++++++----
 4 files changed, 21 insertions(+), 8 deletions(-)

-- 
2.52.0

