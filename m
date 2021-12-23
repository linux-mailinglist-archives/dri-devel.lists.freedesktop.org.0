Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634EE47ED27
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45F510E417;
	Fri, 24 Dec 2021 08:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 350 seconds by postgrey-1.36 at gabe;
 Thu, 23 Dec 2021 11:12:39 UTC
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DE610E211
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 11:12:39 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id 270C258980A; Thu, 23 Dec 2021 11:06:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from asheplyakov-rocket.smb.basealt.ru (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id 4FD60589548;
 Thu, 23 Dec 2021 11:06:46 +0000 (UTC)
From: asheplyakov@basealt.ru
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/panfrost: partial support of T628 GPUs
Date: Thu, 23 Dec 2021 15:06:14 +0400
Message-Id: <20211223110616.2589851-1-asheplyakov@basealt.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>,
 Steven Price <steven.price@arm.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexey Sheplyakov <asheplyakov@basealt.ru>

Hello,

these patches address some problems which prevent panfrost from
working with Mali T628 GPUs:

- incomplete/incorrect mmu memory attributes
- wrong jobs affinity on dual core group GPUs

With these patches panfrost is able to drive mali T628 (r1p0) GPU
on some armv8 SoCs (in particular BE-M1000).
r0 GPUs are still not supported [yet] (tested with Exynos 5422).

Alexey Sheplyakov (2):
  drm/panfrost: mmu: improved memory attributes
  drm/panfrost: adjusted job affinity for dual core group GPUs

 drivers/gpu/drm/panfrost/panfrost_device.h |  7 ++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 45 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 14 ++++++-
 drivers/gpu/drm/panfrost/panfrost_mmu.c    |  3 --
 drivers/iommu/io-pgtable-arm.c             | 16 ++++++--
 5 files changed, 76 insertions(+), 9 deletions(-)

-- 
2.30.2

