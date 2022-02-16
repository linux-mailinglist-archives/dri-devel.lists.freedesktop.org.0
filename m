Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E64B8F59
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6906210E659;
	Wed, 16 Feb 2022 17:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88BC10E6EC;
 Wed, 16 Feb 2022 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033251; x=1676569251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pyIoVRN8++7oRug/siRQt3WhGGOKaIEWMAd12oFQ2fo=;
 b=APNCMHlxSDv9av6WbD3iap2XkrNViP9ZK/NJAglUXOnqucz0+giuDNwB
 2lGoU/IcKQe2d6nVNpwAwQS8SmjemSblfPC98/jSfFfPHU4AthdaNzpDd
 MCa5ylejjRN+i3O0sCNyvgXvdKvVxQ/exaGjIPMkNTpEkFz158Itm0jAt
 1ZZ1cPlCazrwCpinZCRt9qVncTCDmZSnDwWhGXvnsOc8JAijTCGwtTHqb
 KSBJ5ic9FnLms6TxI8P5+pBxfVdKAhk2Zs5hSjdLDBQxl+EmdPqM9AqDi
 +qLRcJ9xqxm0eZSYq6ZGt4xa7U2nIggrD2JxkNogpumE2tbcxVArlYYco g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641925"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641925"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226575"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:51 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/16] drm/i915/guc: Refactor ADS access to use iosys_map
Date: Wed, 16 Feb 2022 09:41:31 -0800
Message-Id: <20220216174147.3073235-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

original: https://patchwork.freedesktop.org/series/99378/
v2: https://patchwork.freedesktop.org/series/99711/#rev1,
    https://patchwork.freedesktop.org/series/99711/#rev2

Main changes from previous version:

	- Unrelated patches to iosys-map conversion have landed
	- Remove unecessary kernel.h include from iosys-map.h
	- Rebase on latest drm-tip

Original cover letter:

While porting i915 to arm64 we noticed some issues accessing lmem.
Some writes were getting corrupted and the final state of the buffer
didn't have exactly what we wrote. This became evident when enabling
GuC submission: depending on the number of engines the ADS struct was
being corrupted and GuC would reject it, refusin to initialize.

From Documentation/core-api/bus-virt-phys-mapping.rst:

	This memory is called "PCI memory" or "shared memory" or "IO memory" or
	whatever, and there is only one way to access it: the readb/writeb and
	related functions. You should never take the address of such memory, because
	there is really nothing you can do with such an address: it's not
	conceptually in the same memory space as "real memory" at all, so you cannot
	just dereference a pointer. (Sadly, on x86 it **is** in the same memory space,
	so on x86 it actually works to just deference a pointer, but it's not
	portable).

When reading or writing words directly to IO memory, in order to be portable
the Linux kernel provides the abstraction detailed in section "Differences
between I/O access functions" of Documentation/driver-api/device-io.rst.

This limits our ability to simply overlay our structs on top a buffer
and directly access it since that buffer may come from IO memory rather than
system memory. Hence the approach taken in intel_guc_ads.c needs to be
refactored. This is not the only place in i915 that need to be changed, but
the one causing the most problems, with a real reproducer. This first set of
patch focuses on fixing the gem object to pass the ADS

After the addition of a few helpers in the dma_buf_map API, most of
intel_guc_ads.c can be converted to use it. The exception is the regset
initialization: we'd incur into a lot of extra indirection when
reading/writing each register. So the regset is converted to use a
temporary buffer allocated on probe, which is then copied to its
final location when finishing the initialization or on gt reset.
[v3: the part unrelated to iosys-map has already landed]

Testing on some discrete cards, after this change we can correctly pass the
ADS struct to GuC and have it initialized correctly.

thanks
Lucas De Marchi

Lucas De Marchi (16):
  iosys-map: Add offset to iosys_map_memcpy_to()
  iosys-map: Add a few more helpers
  drm/i915/gt: Add helper for shmem copy to iosys_map
  drm/i915/guc: Keep iosys_map of ads_blob around
  drm/i915/guc: Add read/write helpers for ADS blob
  drm/i915/guc: Convert golden context init to iosys_map
  drm/i915/guc: Convert policies update to iosys_map
  drm/i915/guc: Convert engine record to iosys_map
  drm/i915/guc: Convert guc_ads_private_data_reset to iosys_map
  drm/i915/guc: Convert golden context prep to iosys_map
  drm/i915/guc: Replace check for golden context size
  drm/i915/guc: Convert mapping table to iosys_map
  drm/i915/guc: Convert capture list to iosys_map
  drm/i915/guc: Convert guc_mmio_reg_state_init to iosys_map
  drm/i915/guc: Convert __guc_ads_init to iosys_map
  drm/i915/guc: Remove plain ads_blob pointer

 drivers/gpu/drm/drm_cache.c                   |   2 +-
 drivers/gpu/drm/drm_fb_helper.c               |   2 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c         |  32 +++
 drivers/gpu/drm/i915/gt/shmem_utils.h         |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 233 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   3 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  17 +-
 include/linux/iosys-map.h                     | 218 +++++++++++++++-
 9 files changed, 396 insertions(+), 121 deletions(-)

-- 
2.35.1

