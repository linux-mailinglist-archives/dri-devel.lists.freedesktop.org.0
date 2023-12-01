Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FA8017D0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAD610E992;
	Fri,  1 Dec 2023 23:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0D10E97D;
 Fri,  1 Dec 2023 23:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6ilWp12fkMwQ9EPLImImbawu6xx9FA9HaWZbWOotJgk1zAhXfkfwoMXgEhfXBy+z9GXkEwwjoc+9n3SwI/Y1/kjXJ4fh8i1csFFtcC5aYvZ2qpC1c74hZVYbIGWkh3NXjxFDqpMFaNKflhfEbrruHBl2HrkmXEWZYfVVW2l8IgbfYt4CZpQfvs48zSDCgSJgM/4aW/0AmtuCmy53iL5Er8c+7wXQeotH+AHL8iv6g2BtnfrhObEC9avOAI3uzPdfOZtBoIRb67lcYKYPW0JNU77SMn16APMo/acs2fFsjwIb8HurLfpMxm14akPAT39rLinLiOZaCow4IlpeuNOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEw+B9AhJqQoV5SyDpWCqRekxSl3Mz6MaOfwtjHai44=;
 b=XwZYP00L1UTl8PAFskBKn2JLbConyRmqC3VAT2MrIgDzi/CnpqKlpWgEYr9W8rKxbB3UoMi6C+Fed6UQIxBDf8yYCe6R/Og9Y7Hv2bZEx3Tewe9ztYKf+dxUo9qm4R0LgVDruFqcoiYZuei5LteTJVQCT9O+jG6dZqAYXSuj/Hp8uZGtOFpKPAtLF8GnFMMEj8sHM8owJPUyyam/j9bsRcYETbjgwZZYTnhASMjT9DXYmGUO4JZuT9C5yP86QbWjhLMburPS92sFN2N13W+L4kgQO8ar31mEDt+Nagyw9c1gd0yJUyOs6a0LH3otUr+m63H2FF6sKhIKqxxw2SNWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEw+B9AhJqQoV5SyDpWCqRekxSl3Mz6MaOfwtjHai44=;
 b=n1bht0caSt56dsxv8dDxFLQv1g5SMuqkAxhpWyAvbx01i20yp5vHXtCTsEk+GEeQdutU9m4HTF4B1jJg6eSaKXsMkwIXsdXvdPzNzuIVN4gVYgMNsWtR3YBdlKO14vGDI1Zcgl52K0Ew9VdciWTSlQXX02Ji8hvEvg8IAXxNN0w=
Received: from BL1PR13CA0029.namprd13.prod.outlook.com (2603:10b6:208:256::34)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:36:06 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::b1) by BL1PR13CA0029.outlook.office365.com
 (2603:10b6:208:256::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13 via Frontend
 Transport; Fri, 1 Dec 2023 23:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 23:36:06 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 17:36:05 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/amdgpu: New VM state for evicted user BOs
Date: Fri, 1 Dec 2023 18:34:36 -0500
Message-ID: <20231201233438.1709981-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
References: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ed97a0-ad5e-4026-ad9a-08dbf2c649fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bU+m0sK+ChkPs1LDb0N8ezIZf9JBr81eiQefzOOnQtQCd8N435x3ETiAjQ6oPJrH1mlIbRR6rt4zCsk5QEuH2RKZUw7m+DO9SuhnZ7O9ycwRMlTnf376l0/9UDpAGmQxiz0ZRAIVsnFHmrrEQpedPlkCf24Ok+zL2TUsJsO8UH9F2EXuCRTdIKkjOJiR+07dhJRHxPrI9POxEJxiNyiV09PCS7qkp+M4X2xvnCfzp7cHh/bCl0k5W2apZv76nO/xBgiESwuANif+hlHRbIk4Se15qEG+ppyA2ZmO1lLTFCu0oh92HHkscFBilzpRCJezsiajCLQbh+lplpI6tYgdMAastWzgMuBD29rMPligDyNPjHXg+n9bxU/7aJhogOVwrMHKqTr/E62K/94H6mQaNYikrTu4CpBuJusQKnJzgizs5SZCrIP39vsemBEC4HCECCyrOm+5Y8Ok+IsT9Ygj/oyIGJN6I9BIEoe+qGhTC73dOIsQWNuV1rf9D9owSRBdmRM/7idccKhsFuF/LciE9+IzMWpPyfxuyE5yeEU9o3N4nHtGqRMzIY9QVLx/G8ck609+ApmDGWyvNlBsAJ0dzrSsXF+slZNm8OwKdDbpD+xAo3GN8g3LLDLkb7zUVW0zlnTgkFvsFLkFux0UwQE1WXvEBu7NPWJMPqyV6BDL4/6/+o/qckciqRHAVNPbkQArkV54mlVKQQAEVGUT+G0Q23DBMbz4Rmt8u3InYCtADkj42I35KyKpZXlPiHtayCXGzS13mVq7GhA+kA6sP+8iGw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(40460700003)(336012)(83380400001)(426003)(82740400003)(356005)(36756003)(86362001)(81166007)(47076005)(36860700001)(8676002)(110136005)(70586007)(70206006)(8936002)(450100002)(316002)(40480700001)(5660300002)(1076003)(2906002)(2616005)(16526019)(478600001)(7696005)(26005)(6666004)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:36:06.1265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ed97a0-ad5e-4026-ad9a-08dbf2c649fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310
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

Create a new VM state to track user BOs that are in the system domain.
In the next patch this will be used do conditionally re-validate them in
amdgpu_vm_handle_moved.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 17 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  5 ++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 7da71b6a9dc6..a748e17ff031 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -233,6 +233,22 @@ static void amdgpu_vm_bo_invalidated(struct amdgpu_vm_bo_base *vm_bo)
 	spin_unlock(&vm_bo->vm->status_lock);
 }
 
+/**
+ * amdgpu_vm_bo_evicted_user - vm_bo is evicted
+ *
+ * @vm_bo: vm_bo which is evicted
+ *
+ * State for BOs used by user mode queues which are not at the location they
+ * should be.
+ */
+static void amdgpu_vm_bo_evicted_user(struct amdgpu_vm_bo_base *vm_bo)
+{
+	vm_bo->moved = true;
+	spin_lock(&vm_bo->vm->status_lock);
+	list_move(&vm_bo->vm_status, &vm_bo->vm->evicted_user);
+	spin_unlock(&vm_bo->vm->status_lock);
+}
+
 /**
  * amdgpu_vm_bo_relocated - vm_bo is reloacted
  *
@@ -2195,6 +2211,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	for (i = 0; i < AMDGPU_MAX_VMHUBS; i++)
 		vm->reserved_vmid[i] = NULL;
 	INIT_LIST_HEAD(&vm->evicted);
+	INIT_LIST_HEAD(&vm->evicted_user);
 	INIT_LIST_HEAD(&vm->relocated);
 	INIT_LIST_HEAD(&vm->moved);
 	INIT_LIST_HEAD(&vm->idle);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index b6cd565562ad..9156ed22abe7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -288,9 +288,12 @@ struct amdgpu_vm {
 	/* Lock to protect vm_bo add/del/move on all lists of vm */
 	spinlock_t		status_lock;
 
-	/* BOs who needs a validation */
+	/* Per VM and PT BOs who needs a validation */
 	struct list_head	evicted;
 
+	/* BOs for user mode queues that need a validation */
+	struct list_head	evicted_user;
+
 	/* PT BOs which relocated and their parent need an update */
 	struct list_head	relocated;
 
-- 
2.34.1

