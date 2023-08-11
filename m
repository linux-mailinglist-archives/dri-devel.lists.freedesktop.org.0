Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68141779D86
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 08:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8271210E135;
	Sat, 12 Aug 2023 06:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1045 seconds by postgrey-1.36 at gabe;
 Fri, 11 Aug 2023 10:31:19 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E36110E686;
 Fri, 11 Aug 2023 10:31:19 +0000 (UTC)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RMfjw1ZyGz1GDS3;
 Fri, 11 Aug 2023 18:12:36 +0800 (CST)
Received: from huawei.com (10.175.113.25) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 18:13:49 +0800
From: Zheng Zengkai <zhengzengkai@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] drm/radeon: Use pci_dev_id() to simplify the code
Date: Fri, 11 Aug 2023 18:25:49 +0800
Message-ID: <20230811102549.18492-1-zhengzengkai@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 12 Aug 2023 06:10:23 +0000
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
Cc: zhengzengkai@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wangxiongfeng2@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PCI core API pci_dev_id() can be used to get the BDF number for a pci
device. We don't need to compose it mannually. Use pci_dev_id() to
simplify the code a little bit.

Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
---
 drivers/gpu/drm/radeon/radeon_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 5771d1fcb073..603a78e41ba5 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -618,7 +618,7 @@ int radeon_acpi_pcie_performance_request(struct radeon_device *rdev,
 
 	atcs_input.size = sizeof(struct atcs_pref_req_input);
 	/* client id (bit 2-0: func num, 7-3: dev num, 15-8: bus num) */
-	atcs_input.client_id = rdev->pdev->devfn | (rdev->pdev->bus->number << 8);
+	atcs_input.client_id = pci_dev_id(rdev->pdev);
 	atcs_input.valid_flags_mask = ATCS_VALID_FLAGS_MASK;
 	atcs_input.flags = ATCS_WAIT_FOR_COMPLETION;
 	if (advertise)
-- 
2.20.1

