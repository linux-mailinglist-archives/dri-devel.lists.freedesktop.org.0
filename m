Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH/2ECbjrmmoJgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:11:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA923B612
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1F410E53D;
	Mon,  9 Mar 2026 15:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pNYGUDE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB9F10E531
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773069089;
 bh=w27TMdRFJpx6CB/hnSGjitr+y+Qx5oP+4mBmfM6vXY0=;
 h=From:To:Cc:Subject:Date:From;
 b=pNYGUDE7pgmY1yBo3ctOk4BsihwJhRpTNTywpne/L0u24YE8XWDCm+Zxe9fr/Xbqd
 FF1I8EtO2Nm241ulkFgFLN4B68+lEB+fceMrjw8c4DfyyJn0HSbnw2rmnPO8H4uobF
 0wx1T53lOtUwl1UKhWhko+ireWjNhajyXIGQeSEHQueAjliQQ97Bw9YEWrCzmC5h78
 aMyuhEgIRcvpLNRxsw/y9k9bzbnpwoXAmP24vPdfgp1GiOiASplo85lChoolgAN0m/
 kGgjDMzp0VdpgFyt9gVHAzU5ndH+SemekYXcIX+ZJ7CCJVGg8FR/3k+IpWHwVPtKs2
 ttgeyP/i1yN+g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C54117E0FDB;
 Mon,  9 Mar 2026 16:11:29 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v5 0/9] drm/panthor: Add a GEM shrinker
Date: Mon,  9 Mar 2026 16:11:10 +0100
Message-ID: <20260309151119.290217-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: AAFA923B612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Action: no action

Hello,

This is an attempt at adding a GEM shrinker to panthor so the system
can finally reclaim GPU memory.

This implementation is losely based on the MSM shrinker (which is why
I added the MSM maintainers in Cc), and it's relying on the drm_gpuvm
eviction/validation infrastructure.

I've only done very basic IGT-based [1] and chromium-based (opening
a lot of tabs on Aquarium until the system starts reclaiming+swapping
out GPU buffers) testing, but I'm posting this early so I can get
preliminary feedback on the implementation. If someone knows about
better tools/ways to test the shrinker, please let me know.

A few words about some design/implementation choices:
- No MADVISE support because I want to see if we can live with just
  transparent reclaim
- We considered basing this implementation on the generic shrinker work
  started by Dmitry [2], but
  1. with the activeness/idleness tracking happening at the VM
     granularity, having per-BO LRUs would caused a lot of
     list_move()s that are not really needed (the VM as a whole
     become active/idle, we can track individual BOs)
  2. Thomas Zimmermann recently suggested that we should have our
     own GEM implementation instead of trying to add this extra reclaim
     complexity to gem-shmem. There are some plans to create a
     gem-uma (Unified Memory Architecture) lib that would do more
     than gem-shmem but in a way that doesn't force all its users
     to pay the overhead (size overhead of the gem object, mostly)
     for features they don't use. Patch "Part ways with
     drm_gem_shmem_object" is showing what this component-based lib
     API could look like if it were to be extracted
- At the moment we only support swapout, but we could add an
  extra flag to specify when buffer content doesn't need to be
  preserved to avoid the swapout/swapin dance. First candidate for
  this DISCARD_ON_RECLAIM flag would probably be the tiler heap chunks.
- Reclaim uses _try_lock() all the way because of the various lock order
  inversions between the reclaim path and submission paths. That means
  we don't try very hard to reclaim hot GPU buffers, but the locking is
  such a mess that I don't really see a better option to be honest.


Changes in v2:
- No fundamental changes in this v2, since the feedback I got were more
  focused on bugs than the overall approach. Check the changelog in each
  patch for more details.

Changes in v3:
- Mostly fixes (see the changelog in each patch)

Changes in v4:
- Only fixes (see the changelog in each patch)

Changes in v5:
- Only fixes (see the changelog in each patch)

Regards,

Boris

[1]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/commit/fc76934a5579767d2aabe787d40e38a17c3f4ea4
[2]https://lkml.org/lkml/2024/1/5/665

Akash Goel (1):
  drm/panthor: Add a GEM shrinker

Boris Brezillon (8):
  drm/gem: Consider GEM object reclaimable if shrinking fails
  drm/panthor: Move panthor_gems_debugfs_init() to panthor_gem.c
  drm/panthor: Group panthor_kernel_bo_xxx() helpers
  drm/panthor: Don't call drm_gpuvm_bo_extobj_add() if the object is
    private
  drm/panthor: Part ways with drm_gem_shmem_object
  drm/panthor: Lazily allocate pages on mmap()
  drm/panthor: Split panthor_vm_prepare_map_op_ctx() to prepare for
    reclaim
  drm/panthor: Track the number of mmap on a BO

 drivers/gpu/drm/drm_gem.c                |   10 +
 drivers/gpu/drm/panthor/Kconfig          |    1 -
 drivers/gpu/drm/panthor/panthor_device.c |   11 +-
 drivers/gpu/drm/panthor/panthor_device.h |   73 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |   33 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   16 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 1421 ++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_gem.h    |  136 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  475 ++++++--
 drivers/gpu/drm/panthor/panthor_mmu.h    |    8 +
 drivers/gpu/drm/panthor/panthor_sched.c  |    9 +-
 11 files changed, 1858 insertions(+), 335 deletions(-)

-- 
2.53.0

