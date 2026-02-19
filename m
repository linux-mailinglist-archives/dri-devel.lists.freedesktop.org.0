Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEqbNwSDl2nozQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:39:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F10162E4A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6678910E340;
	Thu, 19 Feb 2026 21:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsP2maeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C166910E339;
 Thu, 19 Feb 2026 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771537151; x=1803073151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UmkC0nSbdZsZzISnCrTCDLe3XGhzGHF4DZGt9M/fLJ0=;
 b=DsP2maegzucmsvcUWfJsgGcr59TANZRRwvldCum8THzTA50NHMEGMaY3
 cQ4ePPSkz6c7Tqxq9p7pLNVuuDjXlDCiWSjVp5/51PBLWGcwFySGfZLFw
 XKmPRhM2BKz0vYsf4Hn4XGf3V/dHiZudWMuMh4b6bkUJK7h95RTYsJ/Xq
 Kc5HL+SOMlVfUFj+pUjPeCQfpy0up7q93m2UWQspVe/rj/Vuy+nYrbDwX
 ehnUUMXD8P7lSjw2QMaLljMJ3nzoX6JB1H7Ksf8WI5KVqmA/9onnVyPLc
 mRBPf7QHGbBy4Vnuq0rvDEnCLQgmI+r83CBhJI3Hnau31xplisD8GFq2u Q==;
X-CSE-ConnectionGUID: qYAtvgsZSmi7NpTJignZzg==
X-CSE-MsgGUID: g4JLvUfiTq6drRBSR2EYsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90044678"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="90044678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:39:11 -0800
X-CSE-ConnectionGUID: /GnSnybTTo+yTiMEtpn2qA==
X-CSE-MsgGUID: CxDbcYkMSzmBRu/Uf5LTcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212526341"
Received: from vpanait-mobl.ger.corp.intel.com (HELO
 kkoning-desktop.intel.com) ([10.245.244.197])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:39:09 -0800
From: Koen Koning <koen.koning@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Matthew Auld <matthew.auld@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Koen Koning <koen.koning@linux.intel.com>
Subject: [PATCH v3 0/3] gpu: fix module_init() usage
Date: Thu, 19 Feb 2026 22:38:55 +0100
Message-ID: <20260219213858.370675-1-koen.koning@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260216111902.110286-1-koen.koning@linux.intel.com>
References: <20260216111902.110286-1-koen.koning@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[koen.koning@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 28F10162E4A
X-Rspamd-Action: no action

This series fixes several uses of module_init() for subsystem-level code
that can be used by other drivers, and thus must be initialized first.

While this is not a problem for modules, for built-in drivers
module_init() compiles down to a device_initcall(). Between these, the
initialization order depends on the linking order in the Makefiles, but
this behavior should not be depended on.

This series is the result of recent regressions, where moving buddy from
drm to gpu accidentally changed the Makefile linking order, causing NULL
pointer dereferences in drm drivers.

Replacing module_init() with subsys_initcall() resolves these potential
issues for built-ins, while keeping the behavior the same for modules.

While the fixes can be backported, there have never been reports of
issues besides regressions due to refactoring of code. In particular,
the drm_drv module_init() usage predates the git history.

v2->v3: https://lore.kernel.org/dri-devel/20260216111902.110286-1-koen.koning@linux.intel.com/
 - add patches for other uses of module_init() (drm_dev and drm/sched)
 - reword gpu/buddy commit message

v1->v2:
 - use subsys_initcall instead of relying on (fragile) Makefile ordering

Koen Koning (3):
  gpu/buddy: fix module_init() usage
  drm/sched: fix module_init() usage
  drm/drv: fix module_init() usage

 drivers/gpu/buddy.c                     | 2 +-
 drivers/gpu/drm/drm_drv.c               | 2 +-
 drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

--
2.48.1

