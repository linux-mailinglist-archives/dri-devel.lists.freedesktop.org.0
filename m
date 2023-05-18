Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DA7082D9
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B1A10E519;
	Thu, 18 May 2023 13:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF75010E519
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684416946; x=1715952946;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P+ObpnXh1eM+yCdKSkhEyptzB170rfyd9I4WtRJLyjc=;
 b=UYRo5RhzRwjTfLSzMZ0z+zHU9YmQYbV8UQOTcfWNtXZffj/MXY/5YFVh
 6p7SzgHvGRWRaOGdb5lx0TnWZrUACAp1skM4102d94jOPusZP5vVEBSb0
 GJFVJ7j0XFcFSK9xg2cJpF4mOdBvwqDEhIPx7ZBA+3rCqeprPNU6VJYeM
 u6+0l80ZQSTfAVV8/HUQ4CjlsYoBvuA2rRJnCZtGSoyFH0KKrVvDhRujQ
 ugcLaQ+PVZZex1HGWQn/KdkUew7yCQMZilfVostB0qJD60OjJXRJ0upra
 ee4gDJhsIYdnN+tmg0cTXYnmMvSe0TM6H96N3O5aCzoCngqbWt0LHS58r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355264240"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="355264240"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="767203983"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="767203983"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:34 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] accel/ivpu: Update MMU code
Date: Thu, 18 May 2023 15:16:00 +0200
Message-Id: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update MMU code in order to support future generations of hardware.

Karol Wachowski (5):
  accel/ivpu: Remove configuration of MMU TBU1 and TBU3
  accel/ivpu: Add MMU support for 4 level page mappings
  accel/ivpu: Make DMA bit mask HW specific
  accel/ivpu: Rename and cleanup MMU600 page tables
  accel/ivpu: Mark 64 kB contiguous areas as contiguous in PTEs

 drivers/accel/ivpu/ivpu_drv.c         |   8 +-
 drivers/accel/ivpu/ivpu_drv.h         |   1 +
 drivers/accel/ivpu/ivpu_hw.h          |   1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c      |  19 +-
 drivers/accel/ivpu/ivpu_mmu.c         |  14 +-
 drivers/accel/ivpu/ivpu_mmu_context.c | 294 ++++++++++++++++++--------
 drivers/accel/ivpu/ivpu_mmu_context.h |   9 +-
 7 files changed, 235 insertions(+), 111 deletions(-)

-- 
2.25.1

