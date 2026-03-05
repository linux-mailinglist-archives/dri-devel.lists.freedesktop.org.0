Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLgLIGZPqWk14AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:39:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66520EAF6
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8AD10E290;
	Thu,  5 Mar 2026 09:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTWrFkFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A2710E290;
 Thu,  5 Mar 2026 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703587; x=1804239587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bpL7MiGzLlgeJDkxUeNpB6VxlUDAZkq+QvjkG45XU8o=;
 b=mTWrFkFe3EgtkPcKybwaKMiE2PXXf2s7afgdt9SqmzpCS55Hd3A9ZPjr
 pX46IuA6cv80Pd7sBo11y2UNeHCkXreuTVmhxZCX0IOfcNIk0rjjuY56M
 YsZ0p0oL6eFv7imVbYVZlyGVMcZRatBh2lCu+3oXVEG6RgT3izg2pX1DR
 KMJVVx3dq4KM9Xn59K5OpjnMZIIT+j1xBHPK4LKAEBaBj8YDElDOGzwwa
 l9zGEWqgPlmCBpShyJuYjyX9gje6HS7hCoTmuGo4WCIw/5xkUmgqa5Dv4
 tPkBWdi+8IeN6tT0nlf6QzUlUzjW9G795lw1tA7ff+etUROjXSvoiecLH w==;
X-CSE-ConnectionGUID: zRrPzUjNS/i+ejUayhfkqg==
X-CSE-MsgGUID: a6bLR/SqQCKbT6wy4C5rlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84870944"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="84870944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:39:44 -0800
X-CSE-ConnectionGUID: XlUf5igBRuegKqAZriXKgQ==
X-CSE-MsgGUID: kIk+aQ3GRXqvHx1gbHabNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="214684973"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.71])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:39:40 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Two-pass MMU interval notifiers
Date: Thu,  5 Mar 2026 10:39:05 +0100
Message-ID: <20260305093909.43623-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: DE66520EAF6
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,kernel.org,oracle.com,google.com,suse.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,lists.freedesktop.org,kvack.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
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

v4:
- Extend to wider audience and add R-Bs on the xe patches.
- Address documentation review comments from David Hildenbrand

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
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
 include/linux/mmu_notifier.h            |  42 +++++++
 mm/mmu_notifier.c                       |  65 ++++++++--
 12 files changed, 416 insertions(+), 104 deletions(-)

-- 
2.53.0

