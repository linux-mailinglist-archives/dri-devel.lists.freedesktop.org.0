Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D89B26C0B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D0910E8AF;
	Thu, 14 Aug 2025 16:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="c0+a11b0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBC710E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:11:00 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EGAokI1916355;
 Thu, 14 Aug 2025 11:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755187850;
 bh=LpgToupgEg8P8EBDABiEqZQeCDsv8DH/034a0fs0cvQ=;
 h=From:To:CC:Subject:Date;
 b=c0+a11b0yLEg+ccD8HKj+/j0zFUIHqh9owudS+mB9eqhfIKaS3T7ekVztpa7JcDjK
 w0q6bS0Z7zigiTFxe5WJ7nZpzZYs795fC2KacWctqRII1sRFo0twdVU3bM2Z2RHWBV
 oO0YCuP2gI10SD1zeNkyjSdQUWQY7edb6W8UC+jc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EGAoBo1823421
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 14 Aug 2025 11:10:50 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 11:10:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 11:10:50 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EGAndk4172380;
 Thu, 14 Aug 2025 11:10:50 -0500
From: Andrew Davis <afd@ti.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>, Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 0/3] udmabuf: Sync to attached devices
Date: Thu, 14 Aug 2025 11:10:46 -0500
Message-ID: <20250814161049.678672-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello all,

This series makes it so the udmabuf will sync the backing buffer
with the set of attached devices as required for DMA-BUFs when
doing {begin,end}_cpu_access.

Thanks
Andrew

Changes for v2:
 - fix attachment table use-after-free
 - rebased on v6.17-rc1

Andrew Davis (3):
  udmabuf: Keep track current device mappings
  udmabuf: Sync buffer mappings for attached devices
  udmabuf: Use module_misc_device() to register this device

 drivers/dma-buf/udmabuf.c | 133 +++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 66 deletions(-)

-- 
2.39.2

