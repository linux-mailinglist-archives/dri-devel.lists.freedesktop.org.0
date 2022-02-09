Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2274AE5F4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521110E5FD;
	Wed,  9 Feb 2022 00:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049D10E5FD;
 Wed,  9 Feb 2022 00:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiLVFySXbpEInkTI7IOFc7kjH29K5dT8jz7p8TYu0yfCQsorpXynjAwRMcY8O9vN/2IDoz3G+/+h+qv3dJDsf792L6pGHaLShIxbvxBVkStRL3ArgIHVBrdyWtlUbS/Mr71GT8VBgM4cdQWsieVofJgmol0ke9Mz+3Bc/AQ5gMz5xVvErO5vm+SfECuKPFNdDwijKr6+/PWsnxTwa9nqu58WEZjsqWldIBGBwwIi6cIzyUkA+OO60uRpfmUY9lid9qRH4Z05qrIStHKrMd4JjZbTX1J7nIFWCgGg0MUktYpCho6vNlaNg32FmI2LT/ma9KsI0DOm+sYIOzsTfk7Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRUZid1Im4c5oW3R6OnbYNDfsL0EFQDh/ActXC9aHk0=;
 b=N/a9KKz4udPKnNwdg3CKmn1a0hSi4ceUkGcPXnON6anNK8Hl4Qc84qEv0YcmDYp37HweH7ZuQhoxzFgw1btMrRtqOT9aO3aLSTgh+Be9im7ZGNmbD754ea9jup+IrIq1eS2BMZ4S/JcD8i3I2qOpQ9oSzA/NUxJgU2EwRNxVpKUGnAifH9ZNu8L4XXnHfUTPTANflyS5KEBzmdn9658re8llwEXGSd9EuBYw9kSQd7ZSq41ZE8o+W1Tf1MOXcQhjMo2OH+y9nLBokvOLCWxR5kIt5j80oUgMv2ZmXYZa413+FrR9c0nzjFODKfJ6AvLDVBjj9HKmKX3v/CEtNybVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRUZid1Im4c5oW3R6OnbYNDfsL0EFQDh/ActXC9aHk0=;
 b=CsfF/y4/nFk9WdRY9xxsQNEyiFj5txd0ipG9WbFb8RLvYrZV1WJAah/xAb2I43EfqHGAZr8IVWr/pYSkvxJohB3zQJbEWGARGWPpRMf2NmRkTq68vkl+d6IrWyBK8+ZnE/+O+2LcO0ZSHGqfPIG1SmoDXAEizyxMMuJ1q1g35eA=
Received: from MWHPR10CA0064.namprd10.prod.outlook.com (2603:10b6:300:2c::26)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 00:24:01 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::a9) by MWHPR10CA0064.outlook.office365.com
 (2603:10b6:300:2c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 00:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:24:00 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:58 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 11/11] Revert 'drm/amdgpu: annotate a false positive
 recursive locking'
Date: Tue, 8 Feb 2022 19:23:20 -0500
Message-ID: <20220209002320.6077-12-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36d0b0d0-690a-473c-f330-08d9eb627852
X-MS-TrafficTypeDiagnostic: SA0PR12MB4461:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB44613EDC22CE0F4BB9FACB6AEA2E9@SA0PR12MB4461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jbUUhjuDnbHPzfaGoayHFEspAcgb57mElBxKFZkTovy9Dmk62aJlQ491SvJnpHAr343dzAeAhVbUUfNb9T678/6NPYfLZPSh9KNuzTXE0yUv4RzIF7jafc9PpUMEQqhuTL9t9yPTRzHT5lat5MXXdTwB2faFYOssUWr7M7XRFVhWdq8hut3lwrz5dr1r0Dh6hNmXbvYIRP0Tu6R1dgM7K9ffoHcijXHcYSFMA3a4nL6QDPF62wn9jz2By1Rw2khD8tr7J8B3YYCvWkdQi51SdfPmEkntbqQ7qkCrLO3wMGyNNF0A1sPFSvMPEN1s1cNd5YIzxLUC44ZhKKYvNj0mMV3/pTlfvI0i/pMi1LsxwDjmXMTAG0l3GxaOODk/iNE/LvjgyBOip6Lpaj1psJL8FOIZk/svDWuD+q4oMU9vhh5RY+0JzrbJek+iGW3meP5o1as+owwbdd65QyO4B8nUfQhNtVDqMnyCnXZACAvDCFdKUyKAkFnKGbDWg6FZ9j+ZAa6U7bQhm/PPSR8eDveA3qsgJ5Rw3Le6LjuL9x6EkHJwfer3F/qHwypuxH/0oCkZD6HY8qhxi+yJb7YGUqprTkSqoaQr7hm+UGDNmlBXbF71nxK4Whkk+Nze1/4v3v0TlW5zfzDuClHBhJe2KRkDMxD1f/wyB5V+3sNa/89z0KT7zeXO5Hng2kNxxjfnyqEC1mK+5VF7TiZ1QJAeFZbB5Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(316002)(426003)(356005)(81166007)(6666004)(44832011)(110136005)(82310400004)(86362001)(336012)(40460700003)(2616005)(36860700001)(47076005)(508600001)(5660300002)(8676002)(2906002)(26005)(4326008)(186003)(1076003)(8936002)(83380400001)(70586007)(54906003)(70206006)(7696005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:24:00.5785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d0b0d0-690a-473c-f330-08d9eb627852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we have a single instance of reset semaphore which we
lock only once even for XGMI hive we don't need the nested
locking hint anymore.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index aaecf0797484..75d0dd289023 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4825,16 +4825,10 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	return r;
 }
 
-static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
-					    struct amdgpu_hive_info *hive)
+static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain)
 {
 	atomic_set(&reset_domain->in_gpu_reset, 1);
-
-	if (hive) {
-		down_write_nest_lock(&reset_domain->sem, &hive->hive_lock);
-	} else {
-		down_write(&reset_domain->sem);
-	}
+	down_write(&reset_domain->sem);
 }
 
 static void amdgpu_device_set_mp1_state(struct amdgpu_device *adev)
@@ -5072,7 +5066,7 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	/* We need to lock reset domain only once both for XGMI and single device */
 	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
 				    reset_list);
-	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain, hive);
+	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain);
 
 	/* block all schedulers and reset given job's ring */
 	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
@@ -5496,7 +5490,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		 * Locking adev->reset_domain->sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
-		amdgpu_device_lock_reset_domain(adev->reset_domain, NULL);
+		amdgpu_device_lock_reset_domain(adev->reset_domain);
 		amdgpu_device_set_mp1_state(adev);
 
 		/*
-- 
2.25.1

