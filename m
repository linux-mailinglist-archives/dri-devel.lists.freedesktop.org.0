Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPxXO37jpmnpYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:34:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A01F0599
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7B110E806;
	Tue,  3 Mar 2026 13:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IieOtqI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4391F10E01F;
 Tue,  3 Mar 2026 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772544887; x=1804080887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1GaiZTuDfVhGhx6tbOxiTmG3pWXdz7+ENfgkY3MPElM=;
 b=IieOtqI6MQbR6l0wDf2jn+BfJ6YSg83Mvgo1hwbEKnVIe8gU1tyIjAvk
 7iiNMaCjg25AWM11N3mTFgumMXYzab6c718SY6Qrf7leTDRgsobPl7sCO
 RTC87iehf0V7b/cf0ZV/h2gcHNHtVeYEO/Ng/hu1ozO9unc7nV7WLtOyP
 TAnaOOqfpL8zP6YqPIwT6Zfvwek3BluIfire506HimYvki8cBXBbFxC5L
 NGC7a9IeAdirK2w6PWIDsax/r0oHDKx9pEEuOpXzmPZLKNgRbTw2QAorL
 VkQgD1gX1bFXlsllwbq0kKJz7l/sKzNfMMp8RVVLwMKTj4bnqGiRPMk12 A==;
X-CSE-ConnectionGUID: WMvwvDX2QZqdY6Q4sjZOig==
X-CSE-MsgGUID: 8ZS+7I+mR6afYrmXMTPKCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76179718"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76179718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:34:43 -0800
X-CSE-ConnectionGUID: HGe6hFJdSSOzeCRHBtNHNA==
X-CSE-MsgGUID: PxND/fVURbyfhiOrm2gSog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217947861"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.243])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:34:38 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3 0/4] Two-pass MMU interval notifiers
Date: Tue,  3 Mar 2026 14:34:05 +0100
Message-ID: <20260303133409.11609-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: 883A01F0599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,lists.freedesktop.org,kvack.org,vger.kernel.org,amd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_DNSFAIL(0.00)[intel.com : server fail];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:?];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_TEMPFAIL(0.00)[intel.com:s=Intel];
	NEURAL_SPAM(0.00)[0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ziepe.ca:email,linux-foundation.org:email,intel.com:email]
X-Rspamd-Action: no action

GPU use-cases for mmu_interval_notifiers with hmm often involve
starting a gpu operation and then waiting for it to complete.
These operations are typically context preemption or TLB flushing.
    
With single-pass notifiers per GPU this doesn't scale in
multi-gpu scenarios. In those scenarios we'd want to first start
preemption- or TLB flushing on all GPUs and as a second pass wait
for them to complete.

This also applies in non-recoverable page-fault scenarios to
starting a preemption requests on GPUs and waiting for the GPUs 
to preempt so that system pages they access can be reclaimed.
    
One can do this on per-driver basis multiplexing per-driver
notifiers but that would mean sharing the notifier "user" lock
across all GPUs and that doesn't scale well either, so adding support
for two-pass in the core appears like the right choice.

So this series does that, with pach 1 implementing the core support
and also describes the choices made.

The rest of the patches implements a POC with xeKMD userptr
invalidation and potential TLB-flushing. A follow-up series
will extend to drm_gpusvm.

v2 hightlights:
- Refactor the core mm patch to use the struct
  mmu_interval_notifier_ops for the invalidate_finish() callback.
- Rebase on xe driver tlb invalidation changes.
- Provide an initial implementation for userptr instead of drm_gpusvm.
  The intent is to handle drm_gpusvm in a follow-up series.

v3:
- Address review comments from Matt Brost: Code formatting,
  documentation, additional asserts and removal of
  unnecessary waits, as specified in each patch.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linux-mm@kvack.org>
Cc: <linux-kernel@vger.kernel.org>

Thomas Hellström (4):
  mm/mmu_notifier: Allow two-pass struct mmu_interval_notifiers
  drm/xe/userptr: Convert invalidation to two-pass MMU notifier
  drm/xe: Split TLB invalidation into submit and wait steps
  drm/xe/userptr: Defer Waiting for TLB invalidation to the second pass
    if possible

 drivers/gpu/drm/xe/xe_svm.c             |   8 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c       |  84 +++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |   6 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  14 +++
 drivers/gpu/drm/xe/xe_userptr.c         | 155 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_userptr.h         |  31 ++++-
 drivers/gpu/drm/xe/xe_vm.c              |  99 +++++----------
 drivers/gpu/drm/xe/xe_vm.h              |   5 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  10 +-
 drivers/gpu/drm/xe/xe_vm_types.h        |   1 +
 include/linux/mmu_notifier.h            |  38 ++++++
 mm/mmu_notifier.c                       |  65 ++++++++--
 12 files changed, 412 insertions(+), 104 deletions(-)

-- 
2.53.0

