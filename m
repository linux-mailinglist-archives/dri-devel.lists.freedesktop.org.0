Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7307E2CB6D9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058F46EA4E;
	Wed,  2 Dec 2020 08:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41A16E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:55:45 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ClgX42jrnz15Vb1;
 Tue,  1 Dec 2020 19:55:16 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 19:55:36 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>
Subject: [PATCH drm/hisilicon v2 0/4] Add the new api to install irq 
Date: Tue, 1 Dec 2020 19:55:50 +0800
Message-ID: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

patch #1 is code refactorings to use devm_drm_irq_install.
patch #2 add the new api to install irq, patch #3 is hibmc driver uses
the newly added api to register interrupts.

Changes since v1:
Splits the original patch #1 into two patches,rewrite
to_hibmc_drm_private() function in patch #2.Fix the
comment error in patch #3, and use
devm_add_action_or_reset instead of devm_add_action.

Tian Tao (4):
  drm/hisilicon: Assgin local variable to drm_device
  drm/hisilicon: Code refactoring for hibmc_drm_drv
  drm/irq: Add the new api to install irq
  drm/hisilicon: Use the new api devm_drm_irq_install

 drivers/gpu/drm/drm_irq.c                        | 35 ++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 51 ++++++++++--------------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  |  4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  8 ++--
 include/drm/drm_irq.h                            |  2 +-
 7 files changed, 67 insertions(+), 37 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
