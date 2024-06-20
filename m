Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FE6910733
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4E410EA0B;
	Thu, 20 Jun 2024 14:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnNif9xc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106D310EA1E;
 Thu, 20 Jun 2024 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718892121; x=1750428121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g4oe8TLRgM/ZOHROorBtmguw2K/iW4w4CSTV4T64RC0=;
 b=HnNif9xc/sfP67s4Tdbe5Z/9MMKdbvRGN0yEa5ANe37al9l1zBJIBS/i
 ZOHviHNjUZi/c3ZdCn9pIN3wafsii88p/oPxJ0QwZJy2FXrseVtzCmktY
 Tpt1UgqS6GyosIV7592jC7iN41oeEC80KXUM6ElPQy43h8Kf3RSVcHBWy
 mAC2FlJEwGL1lAR8jA7Y84/WSMRVUKTNWlCcvxVo2x2nZAByBL3Ke4lyo
 biBlzVvKP0QmcAVq+zBXfZGCf6FBlGe/0yPKWZEvqMs9C7lb11CrOT8nG
 2hZj1E7xC7Dk9a8TSbMcmgAKbD1qpHzORWonNrcn8P/81szDo3OQryxFw A==;
X-CSE-ConnectionGUID: 0YaedzNgQpm+VBvUsXzVDw==
X-CSE-MsgGUID: qDFjO0W8Sl688MX6+VXa4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="16010273"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="16010273"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:02:01 -0700
X-CSE-ConnectionGUID: CrKTDnr1TRaEydsKEBdbMg==
X-CSE-MsgGUID: Rbc5wRN7Se+Z7OtiEs2Zhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42147645"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:01:59 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [RFC PATCH 0/2] Clear system pages with GPU
Date: Thu, 20 Jun 2024 15:46:50 +0200
Message-ID: <20240620134656.14380-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

TTM does clear on free for pooled pages and clear on alloc for
non pooled pages using CPU this can have large latency for large
buffer objects.                                                            =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                         GPU can clear page=
s much faster but mostly for larger buffers as gpu
clearing requires a gpu job submission which can make latency worse.       =
                                                                           =
                                                                           =
                                                                  XE driver=
 on device with flat CCS clears CCS meta data with a clear                 =
                                                                           =
                                                                           =
                                                         job submission for=
 all buffers. This series extend that clear job to
also clear system pages using GPU to improve job submission latency.       =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                         To test the series=
 I created a small test that tries to submit a job                         =
                                                                           =
                                                                           =
                                                after binding various sizes=
 of buffer.                                                                =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                              Without the series:                          =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
            sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-sto=
re-benchmark
IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)
Using IGT_SRANDOM=3D1718889799 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
Time taken for size SZ_4K: 4882 us
Time taken for size SZ_2M: 3679 us
Time taken for size SZ_64M: 13367 us
Time taken for size SZ_128M: 21034 us
Time taken for size SZ_256M: 32940 us
Time taken for size SZ_1G: 116261 us
Starting dynamic subtest: WB
Dynamic subtest WB: SUCCESS (0.000s)
Time taken for size SZ_4K: 5417 us
Time taken for size SZ_2M: 5711 us
Time taken for size SZ_64M: 15718 us
Time taken for size SZ_128M: 26170 us
Time taken for size SZ_256M: 50529 us
Time taken for size SZ_1G: 177933 us
Subtest basic-store-benchmark: SUCCESS (0.504s)

With the series:                                                           =
                                                                           =
                                                                           =
                                                                  ~/igt-gpu=
-tools/build/tests/xe_exec_store --run basic-store-benchmark               =
                                                                           =
                                                                           =
                                                         IGT-Version: 1.28-=
g2ed908c0b (x86_64) (Linux: 6.9.0-xe+ x86_64)                              =
                                                                           =
                                                                           =
                                                Using IGT_SRANDOM=3D1718889=
593 for randomisation                                                      =
                                                                           =
                                                                           =
                                         Opened device: /dev/dri/card0     =
                                                                           =
                                                                           =
                                                                           =
                                Starting subtest: basic-store-benchmark    =
                                                                           =
                                                                           =
                                                                           =
                       Starting dynamic subtest: WC                        =
                                                                           =
                                                                           =
                                                                           =
              Dynamic subtest WC: SUCCESS (0.000s)                         =
                                                                           =
                                                                           =
                                                                           =
     Time taken for size SZ_4K: 4479 us                                    =
                                                                           =
                                                                           =
                                                                       Time=
 taken for size SZ_2M: 3291 us                                             =
                                                                           =
                                                                           =
                                                              Time taken fo=
r size SZ_64M: 6595 us                                                     =
                                                                           =
                                                                           =
                                                     Time taken for size SZ=
_128M: 9069 us                                                             =
                                                                           =
                                                                           =
                                            Time taken for size SZ_256M: 12=
681 us                                                                     =
                                                                           =
                                                                           =
                                   Time taken for size SZ_1G: 41806 us     =
                                                                           =
                                                                           =
                                                                           =
                          Starting dynamic subtest: WB                     =
                                                                           =
                                                                           =
                                                                           =
                 Dynamic subtest WB: SUCCESS (0.000s)                      =
                                                                           =
                                                                           =
                                                                           =
        Time taken for size SZ_4K: 3317 us                                 =
                                                                           =
                                                                           =
                                                                          T=
ime taken for size SZ_2M: 6458 us                                          =
                                                                           =
                                                                           =
                                                                 Time taken=
 for size SZ_64M: 12802 us                                                 =
                                                                           =
                                                                           =
                                                        Time taken for size=
 SZ_128M: 19579 us                                                         =
                                                                           =
                                                                           =
                                               Time taken for size SZ_256M:=
 38768 us                                                                  =
                                                                           =
                                                                           =
                                      Time taken for size SZ_1G: 143250 us =
                                                                           =
                                                                           =
                                                                           =
                             Subtest basic-store-benchmark: SUCCESS (0.328s)

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Nirmoy Das (2):
  drm/ttm/pool: Introduce a way to skip clear on free
  drm/xe/lnl: Offload system clear page activity to GPU

 drivers/gpu/drm/ttm/ttm_device.c     | 42 +++++++++++++++++++++---
 drivers/gpu/drm/ttm/ttm_pool.c       | 49 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_bo.c           |  4 +++
 drivers/gpu/drm/xe/xe_device.c       | 38 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c      |  6 ++--
 include/drm/ttm/ttm_device.h         |  8 +++++
 include/drm/ttm/ttm_pool.h           | 11 +++++++
 8 files changed, 133 insertions(+), 27 deletions(-)

--=20
2.42.0

