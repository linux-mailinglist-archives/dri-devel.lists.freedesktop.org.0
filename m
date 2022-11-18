Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E126304AF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 00:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E71110E82B;
	Fri, 18 Nov 2022 23:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3647910E830;
 Fri, 18 Nov 2022 23:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eytDtat5RKZnYKL1Sc4xVOhDGPF/zB5ci32IVls+jGaqgqc0+ULf05VartTML3oBbzGhsWh38qTx0H36aJ3ZJNjYmy5leCDzA/sCVkz3ycslE9HPE4GbbFVFNtngff0a8tEpJo89b0/2n0eDb7pJxXZdyxgjGV6k+CiOQHYUW935oiNanN6k5Vjf2tgL5pWSu72GqjLKzAhNhHnF/UEPz9CVHwYNVYal583PQ9zp5X22Hwbe2hdrgizHXxeE6isHQ8uPsE699KmuY1sRHqbAlhO7f7cUg6d+xn4rfjqZW2t5Dz3PrtiqN1mD9YtaI5r1igSW1ZrdsATEduZCxwnKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw+N8ccGpl3r9CmoFwme8QjBDbux2qwPzymG3gYVcbU=;
 b=YhoJBTEVUiXPH4AAOFtBi44kqBe/ioJYtBpyQdYrxoKNg32Jf96ZWq4qHHOK0lavAEF26b1Io8pjfmiICNBd08iVimSuxoH+Low8qlOkQPYLqd/IsTBzGIfYxAo4J8JZaTFcWsun6mdkMLuGZzIVauNHQ3m3b8ID+K6ydbR/FUxpwm5VDhAVF1imcbw6wMtRSkjpjkWaHAcgboxszqM2BzsOaqld+l16I6tr+zpI4XXqSp9+b6YkGYfi7wrNKpRTOUEXgfTjmMBbIKnlPi8hgAq0NEYVHmcG7/HxXJcDkkWDVYouf+X7AdEhmfbPCxg/XUU0iMG2kcZ/MCDndrTV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw+N8ccGpl3r9CmoFwme8QjBDbux2qwPzymG3gYVcbU=;
 b=zZFS8mEx+Ee/MhhUmOV5gjv44zIU0fmKHNTEuIKT9i6+7NNDcKjX7yc7XPcBeyDB5YcCvcwbpdxgs4WkuX/LzGN0GTaU5mRNL3GdIRIz5+CCFvD6qHQjBTW7/tToxK077+HtrbAP6cCR6YY+dQRIxfZjVm8lUMEfhhdmYD+es6E=
Received: from DM6PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:100::22)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 23:44:37 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::6d) by DM6PR03CA0045.outlook.office365.com
 (2603:10b6:5:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 23:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 23:44:37 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 17:44:36 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/amdkfd: Improve amdgpu_vm_handle_moved
Date: Fri, 18 Nov 2022 18:44:19 -0500
Message-ID: <20221118234422.1468806-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
References: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 6066de2b-efbd-4802-8d40-08dac9beda73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +efgX6aM7/sSVniOzl2HBDEpj3CHl5hG6hCFh1VIq6wanNiIEZvRRvXhZKVRDnPdORh8yg2cE/8taWSX08cyU6Xk7u9b11aq1CQ1vxxOQ6Z80yOvOaeqWfsMmzueAGtIAlpXaNEP0WyZegU+A6BaKh3ufppWQNT0nS802hjEP2LNF2oOy/6Tb3K7EPwiHPpt18W0eyk2QEW8rvw1t5dPjEO+dXch8M6VZ2x/tbjSDByX46ccusIWlRktvJMI6IyAc9CJC0Rs1DyPxS4ke5NF8uAwWzCDCT52ZhCp9nA/BuYRQ9N3Z1l085AMOQ6j92EZ+05RC99xjn9m+EhYb6EVBl1wXx51MJtNNXLHeXgSVdU3vt48f+A/vL/Fj2fV8UwUZXDurfBwllTpuT8I8DsSillal3PLCJM+spBnwboqKkLc+4rbsFOpJlPPlbID/EC7ED06G5g/rOKdrh/sqappPuojccqP8YDpGuzMM5dNoq279KsMLjrzMzlQACyuVU/oP2GmALv3Lnr0FLJdRujfMrdOobJaDS3DzwcMOe9HL431KUyl0rOWU3mqZDqt53T62pB8a/FE2/bX4CAaWl5OBUuggTWPGEajY4hsg/Z9YUO+no27cDyqB/akWtgmLYMkvfHpocKsMR35wWUMdPXQRpUFH4zAq9jMToUI3vn+2tPURnqCCo9FSfCRWYs6GHIOSXQEnSg7DtcnzQvyIweDGgguq0CdG35EnTSzvoUm5/k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(86362001)(82310400005)(40480700001)(36756003)(41300700001)(40460700003)(1076003)(2616005)(70586007)(70206006)(450100002)(4326008)(8676002)(426003)(66574015)(8936002)(16526019)(186003)(5660300002)(47076005)(336012)(6666004)(478600001)(26005)(316002)(82740400003)(110136005)(356005)(7696005)(81166007)(2906002)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 23:44:37.1540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6066de2b-efbd-4802-8d40-08dac9beda73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
the caller. This will be useful for handling extra BO VA mappings in
KFD VMs that are managed through the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 275da612cd87..a80d2557edb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1121,6 +1121,10 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
+	/* TODO: Is this loop still needed, or could this be handled by
+	 * amdgpu_vm_handle_moved, now that it can handle all BOs that are
+	 * reserved under p->ticket?
+	 */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		/* ignore duplicates */
 		bo = ttm_to_amdgpu_bo(e->tv.bo);
@@ -1140,7 +1144,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	r = amdgpu_vm_handle_moved(adev, vm);
+	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 271e30e34d93..23a213e4ab2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -404,7 +404,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 
 		r = amdgpu_vm_clear_freed(adev, vm, NULL);
 		if (!r)
-			r = amdgpu_vm_handle_moved(adev, vm);
+			r = amdgpu_vm_handle_moved(adev, vm, ticket);
 
 		if (r && r != -EBUSY)
 			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 003aa9e47085..b61eb2e575d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1278,11 +1278,12 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
  * PTs have to be reserved!
  */
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm)
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket)
 {
 	struct amdgpu_bo_va *bo_va;
 	struct dma_resv *resv;
-	bool clear;
+	bool clear, unlock;
 	int r;
 
 	spin_lock(&vm->status_lock);
@@ -1305,17 +1306,24 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		spin_unlock(&vm->status_lock);
 
 		/* Try to reserve the BO to avoid clearing its ptes */
-		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
+		if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
 			clear = false;
+			unlock = true;
+		/* The caller is already holding the reservation lock */
+		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
+			clear = false;
+			unlock = false;
 		/* Somebody else is using the BO right now */
-		else
+		} else {
 			clear = true;
+			unlock = false;
+		}
 
 		r = amdgpu_vm_bo_update(adev, bo_va, clear);
 		if (r)
 			return r;
 
-		if (!clear)
+		if (unlock)
 			dma_resv_unlock(resv);
 		spin_lock(&vm->status_lock);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 6546e786bf00..53d1ac4b69db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -404,7 +404,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct amdgpu_vm *vm,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm);
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket);
 void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.32.0

