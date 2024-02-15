Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910B856470
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 14:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD94710E7BC;
	Thu, 15 Feb 2024 13:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBtNp5uS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD32A10E7BC;
 Thu, 15 Feb 2024 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708003930; x=1739539930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xP2x+0oCU2VUeBJg+acvjjGA26vEwKMDv8882I1yP2E=;
 b=kBtNp5uSGwbXNxDjanMDlmvKMOnyYul6tiGr5QD5Z+nnDMh3ybRMd/7C
 sk9FQI8Rl1qTzWsGM21HK2CubNOz1SZ49zK+NUhi4DjXafY/abMcE2Lxt
 9MlclU+ytUBusu1aQkF3iBdgl+52XLLcCSZcAmAaesIzCOM8eb4gGIHQC
 frC4hqBzdsZ3qcdtwnpmIvZnEV5SSsB4ztp5prmUWbDWO3fVOeU9zjo+l
 IUpqvSt1qAW+LJvkO9uSI0ig1tWGA6t/GTlQV2HaM7WCb7xDf4LXtC8n8
 QnbwO2igKPbFPLixGXX/NwPrtP/GnIGHkxsC3CQNIq9SSVheXlKpsaywa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2000318"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2000318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 05:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3489788"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.246.32.150])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 05:32:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/3] PCI LNKCTL2 RMW Accessor Cleanup
Date: Thu, 15 Feb 2024 15:31:52 +0200
Message-Id: <20240215133155.9198-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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

This series converts open-coded LNKCTL2 RMW accesses to use RMW
accessor. These patches used to be part of PCIe BW controller series
[1] which will require RMW ops to LNKCTL2 be properly locked.

However, since these RMW accessor patches are useful as cleanups on
their own I chose to send them now separately to reduce the size of the
BW controller series.

[1] https://lore.kernel.org/linux-pci/20240105112547.7301-1-ilpo.jarvinen@linux.intel.com/

Ilpo Järvinen (3):
  drm/radeon: Use RMW accessors for changing LNKCTL2
  drm/amdgpu: Use RMW accessors for changing LNKCTL2
  RDMA/hfi1: Use RMW accessors for changing LNKCTL2

 drivers/gpu/drm/amd/amdgpu/cik.c  | 41 +++++++++++--------------------
 drivers/gpu/drm/amd/amdgpu/si.c   | 41 +++++++++++--------------------
 drivers/gpu/drm/radeon/cik.c      | 40 +++++++++++-------------------
 drivers/gpu/drm/radeon/si.c       | 40 +++++++++++-------------------
 drivers/infiniband/hw/hfi1/pcie.c | 30 ++++++----------------
 5 files changed, 68 insertions(+), 124 deletions(-)

-- 
2.39.2

