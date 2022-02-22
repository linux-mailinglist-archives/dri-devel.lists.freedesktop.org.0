Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8E4BEFA7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 03:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7327E10E268;
	Tue, 22 Feb 2022 02:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195DB10E199;
 Tue, 22 Feb 2022 02:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+9o80hrclCcWoPIh8/14jM3MprD1LgXT7WWWWXhqj+b3WGS28oXdMQSGiBU/64YJ6QlCjhASJeBvShVzpXDW321DFtu2rsvdO5zG31UIL2alLs64dBA3DQ4uTH6y8FCtDMBfdpyvQWCwybFW+0VCmjZwIzQ4Vmm44rWDMe9nyL9ZGzON7QLDQ0tHLA8b9BDAHxyN7zAvlycW93XfFr9+k3j3o+ap2eTyRXDapcDjTVmcC+ZGnhrYILJMJL8WxaqLMy6dzC0l3Qwmu4y/JjN6E2s/ktaggsWobozuTpPm8rXfS5mdyc1BqXkJdp+Hl/iBSUxrLTCQPGi4oc2tI1RuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pmWNc8QOsXfYETEHYGcHO6QApX7Cineg4Ma2gNd4QE=;
 b=fhhwzICMiHWF4N8aJcX23fXp6COxF9IYIsv4JZKkFMHNlcmSE3INJASZvW3wuKS6QeD1KTeEpB7j43z2kY2VsttIL+9ItxR9Vn+5qZm7NowGNYME+igUqfRjGngxT+y2SlzlmC3dnIxMuF8qvTjx8Qp652TaDfwx7hQ+k7BUGdOuGGng8cdHskxhM2xsZwCzKB/WuQyshx5QFKVsvotom/vFY9nmcnMgYVIq3Ki3laOZAh2nB8I2l3mZW5IMHKMkJocoAoUeY9LOXKlPc/gn2V1ZbxesR1PYQ6csR9y6ELEyQvcT6iYmSAHDgmGo7L/9AQQEAuns4crkBlUIxsmb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=molgen.mpg.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pmWNc8QOsXfYETEHYGcHO6QApX7Cineg4Ma2gNd4QE=;
 b=wK+le8unoKuUK17X6OImY0aD7BGfS15P+1ijR6iLE5AXAbmttFG6l4pMWli2DQE3K/heFky2HoURJqacffl9TtAoaCRFXTrSc5iToB28xi9X7J/R54BjOW16JG7DvbuovXImqUi2Hoa8ekaZe+UpI4Rs9RHIQXFShRz6TQemjkY=
Received: from MWHPR08CA0057.namprd08.prod.outlook.com (2603:10b6:300:c0::31)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 02:48:19 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::74) by MWHPR08CA0057.outlook.office365.com
 (2603:10b6:300:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Tue, 22 Feb 2022 02:48:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 02:48:17 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 20:48:13 -0600
From: Qiang Yu <qiang.yu@amd.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/amdgpu: check vm ready by amdgpu_vm->evicting flag
Date: Tue, 22 Feb 2022 10:46:51 +0800
Message-ID: <20220222024651.36675-1-qiang.yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbf406cb-3f4e-4663-d9f2-08d9f5adc7aa
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5273B9E93848CEB788EA40848F3B9@BN9PR12MB5273.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zkRYxU6JV507QFuffcqS8FOVx9Iet9En0tXPSws5n4JxhHkNJVjl2HrQNrjY4jjBNUXQI+qD5ElFw+Zp5lqp7ucFe7qZKlyzexa87RmLaJMAW8VL+vk4ai5un9IEQI1vvku0DxLOWIOb5wqnqewBJbymGy9yhiU4nSwRjxRtm0VcP5N1ilhHUNy5vdOj2M+tBSFeHpS7H/PqJufrYdch4+/LH44rVJIHv9DLzTkb9MAoUOaEVjsuVLBN6skQPAkHbRy8Tv3OVGor9KXY3tAu05/tBhEAhTb7d9b4WG/Ppn7u5CfhGpnB5CU47GomEcezjTJdjlYiSeMrO9eTQGSk833D2FvvYizrpUH1Bi4PemLbV7hi0hggBFWSh2Ed19a276a+GH6Ior3z9/+TnoA7ecbaIYA6H45pGPA/vQEMw8NiYH8Fb0+vV9MRuhZCtXIhutXwPHzcbvpGjo2vMFq6d1o1epiurcHhNsQFyYIAFP39LY/rNr4or2Yyb8hkj29Uws00/3ArnObfoZbFFpm4wgidQY0WbmbBnuT585w5FzRF+5y+zJu9YaSnrCcuYJ6NdoiiTTAurjuyajmYYpBouzvLgvaWWxf6WoL8zFT1Wm2NnfV5TpZVJDVUrOl/GH3v/isrgBZ1Cf33hxUmkkynsT8XejQtEFKGU2gBPFW2tCGt4cx8dUW/0zecjoGBxIpdZFGsienPfSp7Ws5HRhRKfw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(2616005)(1076003)(54906003)(82310400004)(86362001)(508600001)(110136005)(316002)(6666004)(8676002)(4326008)(70206006)(336012)(36756003)(70586007)(40460700003)(47076005)(36860700001)(83380400001)(66574015)(16526019)(81166007)(2906002)(26005)(44832011)(356005)(186003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 02:48:17.4989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf406cb-3f4e-4663-d9f2-08d9f5adc7aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273
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
Cc: Qiang Yu <qiang.yu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Workstation application ANSA/META v21.1.4 get this error dmesg when
running CI test suite provided by ANSA/META:
[drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)

This is caused by:
1. create a 256MB buffer in invisible VRAM
2. CPU map the buffer and access it causes vm_fault and try to move
   it to visible VRAM
3. force visible VRAM space and traverse all VRAM bos to check if
   evicting this bo is valuable
4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
   will set amdgpu_vm->evicting, but latter due to not in visible
   VRAM, won't really evict it so not add it to amdgpu_vm->evicted
5. before next CS to clear the amdgpu_vm->evicting, user VM ops
   ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
   but fail in amdgpu_vm_bo_update_mapping() (check
   amdgpu_vm->evicting) and get this error log

This error won't affect functionality as next CS will finish the
waiting VM ops. But we'd better clear the error log by checking
the amdgpu_vm->evicting flag in amdgpu_vm_ready() to stop calling
amdgpu_vm_bo_update_mapping() latter.

Another reason is amdgpu_vm->evicted list holds all BOs (both
user buffer and page table), but only page table BOs' eviction
prevent VM ops. amdgpu_vm->evicting flag is set only for page
table BOs, so we should use evicting flag instead of evicted list
in amdgpu_vm_ready().

The side effect of This change is: previously blocked VM op (user
buffer in "evicted" list but no page table in it) gets done
immediately.

v2: update commit comments.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Qiang Yu <qiang.yu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 37acd8911168..2cd9f1a2e5fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -770,11 +770,16 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
  * Check if all VM PDs/PTs are ready for updates
  *
  * Returns:
- * True if eviction list is empty.
+ * True if VM is not evicting.
  */
 bool amdgpu_vm_ready(struct amdgpu_vm *vm)
 {
-	return list_empty(&vm->evicted);
+	bool ret;
+
+	amdgpu_vm_eviction_lock(vm);
+	ret = !vm->evicting;
+	amdgpu_vm_eviction_unlock(vm);
+	return ret;
 }
 
 /**
-- 
2.25.1

