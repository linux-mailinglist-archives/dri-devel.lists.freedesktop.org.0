Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD71C48A0F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D835F10E0F5;
	Mon, 10 Nov 2025 18:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGoJh2Bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C382010E0F5;
 Mon, 10 Nov 2025 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762800459; x=1794336459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wAsccoU8w3B4eRMZuq2gxUaDz+Dt38AFte0j5k5tPOM=;
 b=LGoJh2BfuuEOTUk0FiynunvbwgLCHK795YE0dQ/MitEsCtJpwtpHTNiH
 Nj6DYMl0zfgqyZKeLkaIY24F4IrEO/yRszpr2pGlrgkllCR9uwnm+Ad6P
 t82nYcC5sYBsM3u38jMXlH3omlApFSwmhr+bGxDW3c0GIsGsznSIq1Vl/
 prU9QmGB93oR52h+IN8sUUIdWFSOtsVDl1/upJtDsCuargTd1crVycmb7
 s+FgSrUKSzRx6B9/FNN0VMBgC2vv5PHlNXMAIzZWbsk4J9qBNsuspoSjD
 eJsTYEWjytAZvwraGcA8LHnyUUyOAE+gQXStxJ4820FW5AMOL1xxCPDSO A==;
X-CSE-ConnectionGUID: c2gzUAetSgiJKRbFEY7gbw==
X-CSE-MsgGUID: aFwTwbZ5T/qAJ0Fv/LPI3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82484607"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="82484607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:47:38 -0800
X-CSE-ConnectionGUID: i9YCGhVJRUGQcVlTpVIfpg==
X-CSE-MsgGUID: Z0/CCH/BSBOYpkaQrxg0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193749558"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP; 10 Nov 2025 10:47:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id E8E2195; Mon, 10 Nov 2025 19:47:28 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>, Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 00/23] treewide: Introduce %ptS for struct timespec64 and
 convert users
Date: Mon, 10 Nov 2025 19:40:19 +0100
Message-ID: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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


Here is the third part of unification time printing in the kernel.
This time for struct timespec64. The first patch brings support
into printf() implementation (test cases and documentation update
included) followed by the treewide conversion of the current users.

The idea is to have one or a few biggest users included, the rest
can be taken next release cycle on the subsystem basis, but I won't
object if the respective maintainers already give their tags. Depending
on the tags received it may go via dedicated subsystem or via PRINTK
tree.

Note, not everything was compile-tested. Kunit test has been passed, though.

Andy Shevchenko (23):
  lib/vsprintf: Add specifier for printing struct timespec64
  ALSA: seq: Switch to use %ptSp
  ceph: Switch to use %ptSp
  libceph: Switch to use %ptSp
  dma-buf: Switch to use %ptSp
  drm/amdgpu: Switch to use %ptSp
  drm/msm: Switch to use %ptSp
  drm/vblank: Switch to use %ptSp
  drm/xe: Switch to use %ptSp
  e1000e: Switch to use %ptSp
  igb: Switch to use %ptSp
  ipmi: Switch to use %ptSp
  media: av7110: Switch to use %ptSp
  media: v4l2-ioctl: Switch to use %ptSp
  mmc: mmc_test: Switch to use %ptSp
  net: dsa: sja1105: Switch to use %ptSp
  PCI: epf-test: Switch to use %ptSp
  pps: Switch to use %ptSp
  ptp: ocp: Switch to use %ptSp
  s390/dasd: Switch to use %ptSp
  scsi: fnic: Switch to use %ptS
  scsi: snic: Switch to use %ptSp
  tracing: Switch to use %ptSp

 Documentation/core-api/printk-formats.rst     | 11 ++++-
 drivers/char/ipmi/ipmi_si_intf.c              |  3 +-
 drivers/char/ipmi/ipmi_ssif.c                 |  6 +--
 drivers/dma-buf/sync_debug.c                  |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  3 +-
 drivers/gpu/drm/drm_vblank.c                  |  6 +--
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  3 +-
 drivers/gpu/drm/xe/xe_devcoredump.c           |  4 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +-
 drivers/mmc/core/mmc_test.c                   | 18 +++----
 drivers/net/dsa/sja1105/sja1105_tas.c         |  8 ++--
 drivers/net/ethernet/intel/e1000e/ptp.c       |  7 +--
 drivers/net/ethernet/intel/igb/igb_ptp.c      |  7 +--
 drivers/pci/endpoint/functions/pci-epf-test.c |  5 +-
 drivers/pps/generators/pps_gen_parport.c      |  3 +-
 drivers/pps/kapi.c                            |  3 +-
 drivers/ptp/ptp_ocp.c                         | 15 +++---
 drivers/s390/block/dasd.c                     |  3 +-
 drivers/scsi/fnic/fnic_trace.c                | 46 ++++++++----------
 drivers/scsi/snic/snic_debugfs.c              | 10 ++--
 drivers/scsi/snic/snic_trc.c                  |  5 +-
 drivers/staging/media/av7110/av7110.c         |  2 +-
 fs/ceph/dir.c                                 |  5 +-
 fs/ceph/inode.c                               | 47 ++++++-------------
 fs/ceph/xattr.c                               |  6 +--
 kernel/trace/trace_output.c                   |  6 +--
 lib/tests/printf_kunit.c                      |  4 ++
 lib/vsprintf.c                                | 25 ++++++++++
 net/ceph/messenger_v2.c                       |  6 +--
 sound/core/seq/seq_queue.c                    |  2 +-
 sound/core/seq/seq_timer.c                    |  6 +--
 32 files changed, 131 insertions(+), 154 deletions(-)

-- 
2.50.1

