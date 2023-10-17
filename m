Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77B7CCEFE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2906F10E33F;
	Tue, 17 Oct 2023 21:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF4E10E34B;
 Tue, 17 Oct 2023 21:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bINwgYcktmYkGp7J0h8ofJ8nrH8rYDpHEdCHhcgVvhyAHDTsrUVODa/bWtBrZm1hnG6mHzAdLznaSUUVKuYaK5lz3RIkpb3HptnvFXXuYHX2+gn825JShNUavkdgrttffLUFf+FwirTiiurREree4D542HprBOirsUUkQi77TFuVqnGRsfME/m55EKcy3uHp+43EAQ78dmDN61tml+crdH+Hl1Kg//JIn3/tpqkNC09DIH54ahN+DjpUWXwBfaA84vZLuKEzsjalHAvgE1Solyf4o5s/vWWNsbb0XMTB9cFO4DywVuMSADMxWncIIjxq03Yg2ca6QVpuloxlglIByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybSQ5oCn8Zm6aBUJ8GvK4Sp4Cf/hYG179lNhSGon098=;
 b=HovVEJWIG65W/a5tagLdw6lBpC7k2Yd6oHbKJCIdYsZ+q2nqnq+SlS/z+uTaf7VtkduLAYEo5kq1vba8dxy5F17l7IAD/eWcKPQjRp9DSzpJExqP65jzsfx+TCh4ZYfhgIAswEiUhcLtYbh14t/9n4mMKiMdUxGEv7V02Be1igmuRZ5uzMvBiXcoKVj+JwyQbOyHuyRNo9UYCWTnUfX6+8UZPmUJv/VRskD8Z8Iy1CY9I+xn09TpXSZSsF+gIUz9KULdOz+edu7omF7ph5tHr+n79kJ88KashP5Ao7W8lDI4zao6EhieT64zLD8vXf3/7DrZERRfLiFJZldPkL2Esw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybSQ5oCn8Zm6aBUJ8GvK4Sp4Cf/hYG179lNhSGon098=;
 b=D4f3QwZ5hShX4Ju9DhyEaNquKolScTcbcibAwGZhqa3gbsq3NAqgqly5mKldDUzt94rmJwoiqEuEVpcqWMQFlMhIDOE5FKo7Wg7ONgZBWLHDxukU0r6F9pFEnglnv6gLVmw0Rt//q0w+ljWsBeFDprSddmeQi6uHJLA+uZWcbQk=
Received: from BL0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:207:3c::42)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 21:14:26 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::85) by BL0PR02CA0029.outlook.office365.com
 (2603:10b6:207:3c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:25 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:24 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/11] drm/amdgpu: New VM state for evicted user BOs
Date: Tue, 17 Oct 2023 17:13:33 -0400
Message-ID: <20231017211337.1593869-8-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 755a6d6d-7cc9-445e-bb03-08dbcf560acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JS3vj1BcVCloW0CAj2OHkb09ed8bMDmefVLPRpMt5IqbP58uMJK/8ZKKgqUTkJmzRsMXOH0EDb9Sd264jS0RGTprS52V4Unk1ZACEXwsxm8yANN5V/rQwIT99x5UtHssr+8ZPLikUoZN3LrXP6ney66UMv+UzjACdTIa7Nk68VUf/TAs7OKo6LTXD6krrML3ebsYuWSjwHBhqaFIL+1dgaYsN3PFPO6xMi6DNabTsCFg8LCBzY4fnSE+WQ41fWFdWqu8meDArpWltWzUJ/IDR7V2PdMZz02h3UjTzxi2BCjqC7h5fupMlJVghMvb1OscPLJ7mrapqf9PFak9TiqmDfmrKulOEvBlPvLgtilGn7/pSDGxGAwQ5eB/cDgqtCn+ui7w1MyRZjAtI7rKrBvDD1aQ2CQ4ZAIMRrHPvZ7kE6HDmY8nErfsyfnFuJR5uiydKwg8pJKY4uaY05GTdpTtDw4zydbGeRB/fLUC6KGykoHxQepierVwyzm8t8XQBeqRxg42EJzb77Eh6WSs5GMydeIIdiEkQhhsW3A8efE9vsccY69njOrP9Q8QfrZwNNF4pJ/gihfCJGGzwupJOhYj39nHgBX9x3pKT1qfXkUrxL9h+xNnGg6tJRbpxrx9n77QxleRj2jAnyR1OKfY41B8sMKH2NZ6MfYcgOpF1FGEw9ciJtfEZZHZDcs1NFW01Idx1eAL4QBaSP05Tg/Obc3S9yLn3rNU8LB6zFTKcO19Fu3UT/1r/D3xagQqejl8TnJKVqZyuu2J6qN2Lh0HFmBDNA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(40460700003)(6666004)(36860700001)(70586007)(70206006)(316002)(110136005)(54906003)(2616005)(1076003)(16526019)(478600001)(26005)(82740400003)(81166007)(8936002)(47076005)(8676002)(356005)(7696005)(426003)(4326008)(83380400001)(336012)(450100002)(40480700001)(86362001)(5660300002)(2906002)(36756003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:25.7980 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 755a6d6d-7cc9-445e-bb03-08dbcf560acd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com, Christian.Koenig@amd.com
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
index 3307c5765787..76a8a7fd3fde 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -232,6 +232,22 @@ static void amdgpu_vm_bo_invalidated(struct amdgpu_vm_bo_base *vm_bo)
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
@@ -2105,6 +2121,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp
 	for (i = 0; i < AMDGPU_MAX_VMHUBS; i++)
 		vm->reserved_vmid[i] = NULL;
 	INIT_LIST_HEAD(&vm->evicted);
+	INIT_LIST_HEAD(&vm->evicted_user);
 	INIT_LIST_HEAD(&vm->relocated);
 	INIT_LIST_HEAD(&vm->moved);
 	INIT_LIST_HEAD(&vm->idle);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 577cdb6d1649..914e6753a6d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -280,9 +280,12 @@ struct amdgpu_vm {
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

