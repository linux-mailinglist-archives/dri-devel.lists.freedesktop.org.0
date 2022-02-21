Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDCD4BD8F5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3F10E837;
	Mon, 21 Feb 2022 10:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17B10E7C2;
 Mon, 21 Feb 2022 10:13:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YF2lamQPWaYpuewhY2laRfsa49ZZ+FxgCvdbqtkNY8cfuqpwtUpOIGLYfYCXabX6q9OsVbpkpFOVPJAu32U8P+HWFeV0ba+noRyrBfUndSu3nmMxWDQppQhk+s5h3FomSsjcVWXd5E46DXJXy1FV5xDCtQ46m+GE7EZQVo823xk272TPkMaFKd0sdudcUCSw2D1Wyj7co3qBZtidTwlsVrL5dE5TzGOnbuHgFYPKtP/pOZ/hgqcio7IFWT7QN+icI4tcbfNpkIq9ruK8ynwTLImamxTuz1qd+sKP9NkuA8TqWWcZ3rvxasO0XdxPfPeITgAC7MUyKZtm58OhHWq9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFvjvBPo0KeGxdb3dtgdf2/eI01KkNsEtmpJlQ59fPI=;
 b=DILEPKcBKv4tKpSPKa612I/0aBMDsXRZ/NBVVPRekRTlTDWwBGSfKhtjmxV9qvslIRWVbF5T//SANp8HXflkjD1p/6aF/vK3Acwj9enp/AgqOs6LBsZfhVBwegk22ArLf8K6eyuyjHzlMImfmZUEJK6ZH2I1F9OxmpnXXMpbU3YxDMiXhSiPvfL5Zm2AUpMqKHctH/avXVOV/h0NPoRQRS7LLXhXHWfb8YHqzDrkWI7g0VEsUNOXc04/1n+9pjSAW7X+3eUW097cUlpzWxVtHzyNMyNnQQgFJJrY0xzkh2/3qPyWFlS//3uk87gQ6lyKZx20+Z2IMSZlDDHBH24QWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFvjvBPo0KeGxdb3dtgdf2/eI01KkNsEtmpJlQ59fPI=;
 b=kuhaXe7oxsiFxbfnsL2QrAwj2dl8nVbYEP6CxPrIsr1qfnUTEFnToYGsmGEjWI6KxK8Doovsx2+VNn4jn4z9mmtLQBu2dOU2UWLUgKs112m9UVUNngAMaVmIP/fVWlc8JzEfskuvmf0fktHEtq5EsZerSQHD2IyNY+AAgwwX4EA=
Received: from CO1PR15CA0055.namprd15.prod.outlook.com (2603:10b6:101:1f::23)
 by MWHPR1201MB0111.namprd12.prod.outlook.com (2603:10b6:301:55::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 10:13:17 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::a9) by CO1PR15CA0055.outlook.office365.com
 (2603:10b6:101:1f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 21 Feb 2022 10:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Mon, 21 Feb 2022 10:13:16 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 04:13:13 -0600
From: Qiang Yu <qiang.yu@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: check vm ready by evicting
Date: Mon, 21 Feb 2022 18:12:35 +0800
Message-ID: <20220221101239.2863-1-qiang.yu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4750c9a3-e121-4e88-a6c8-08d9f522c72d
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0111:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB011145A5444FF9A0C0BCA26D8F3A9@MWHPR1201MB0111.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: abT/Yf2+1eCZcvLUVhc8ozKefnp6n8Xw0jbqtewzL7ROqbeCp0dRz+BJ9AP9yGyCOBOfMYrR4IEG/s7TC/nTNrQcBSCTEcSIhoY+KF/RlDgDLVX13xwqsUOdFOp0kJl7/9uiLCp8uPhAzZ+igLNrC/pfb+GWVXyaWbIzX0FX3+2173GP7q+3sOW+v4T2wST1MUPgReKyEq3O0PPvpKImhTzwODFKdcwSDIRlrBxmUfpPQQp///cNJJrYp7IIfwtix6LuQ9tNTlJ4VsjoecQoVswiSAnZxX3AHwWXPpLaHNawdXv2oAXOxs+yC8568G3jkBHtZC+XlnlTcYFR/+TYbarG3Td3rvF9lBAtTr7saE2VttdAlc6Md8AXk1X0WxG48W2mUuOJDcTV+PGGK4m7QvI2Ssjl2GOyGJ7M9bROAWdLScSOWubzAae3w3oLSOpoQ2KmatWnFnf58nGFj1hwxV3cj1yV6rFr2SR/4XGp2sV4Yizwk1OZxE53hEYChXQ0q2L9y6dlU2JETtdxVRxC1QIXNTHE1INLEw0sJg8NdyBAZgfECinNcgoy3G3N+PQMddhwtjCUVbO6+/ecZ/2P9UZ9aak7biNInSHSn3NNH6WnaAOlA1kWeVESOLiN0vHNLPYNDc9h8TUs181xl1pZr5ATNshDZ+H94e1dT9AUGjpHoqN5oT1ZEXGrm9ZH83xh8RpMmoSebBepuD+IwGqlfg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8936002)(6666004)(336012)(26005)(40460700003)(508600001)(186003)(81166007)(5660300002)(2616005)(86362001)(1076003)(70586007)(70206006)(8676002)(4326008)(16526019)(82310400004)(356005)(2906002)(110136005)(54906003)(47076005)(36860700001)(83380400001)(316002)(44832011)(36756003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 10:13:16.7111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4750c9a3-e121-4e88-a6c8-08d9f522c72d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0111
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

Workstation application ANSA/META get this error dmesg:
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
waiting VM ops. But we'd better clear the error log by check the
evicting flag which really stop VM ops latter.

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

