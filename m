Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2E47D939
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1035110E387;
	Wed, 22 Dec 2021 22:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF3F10E37D;
 Wed, 22 Dec 2021 22:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhaDuc953YReVDGSpG+l0P3XG+JUVOJNSh2a5rJ4dff3QUdeoGFOfNZY/NXggRWgsl2dZLSHppXsFuWUbqC9Dt7kU/rFUq5HDq3GNOYWfsBkCXYANdyIqxYl85GpIvcbv5YK6dA07ssEW8Y2VEWDUiehBQllL4HYxn9H5DnZdcM40Jbrb6ls+VHezGl/XhfJoD4dV47bvtTQqvsH6tosJLxYh33pocjNhkF723mEcHIAeuUO4RN/TRy0dx+e00BQlE5s/+ze2Q6d+MLA3E5ErutOYAMWI8e5q81ZSRts+1ciexqs2uhHVrHIcB0CYih4cXMAGnzywbDl4E7Q5dCMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L7bKImYxTZpxJq1PyrTqr8pgBHKUKiAZaILq3hHEo0=;
 b=gWdfuAzQRsoHUY6ly9jt9CwNeSNvuB63ua8VFqQqRTxaxXUSdeJGVaS+8SDBtms1ezqBT480sQO/lbxRVqCirZXHAQoZNy0LTySWcMOdAA17bhEAzhjRg5lmqp1osntBSELS6LHaDr7pZzkL6NZoqLINzzCYsTRM9TIH5esqmvb8Uhq8RgOFgGRggKsAwxFvFOzIOkzIEJayKs7HHZANeXOOOIGe/omWvZTXDj8qhMb2z9p04ZsVdGWsgl4cwyIwYDqD4AY/ruDUdPC+psIHilTbCF+xKjqkAxBz4oqopWlP6htmw8LB8wmhcYC1qL37/+/V6lrccjw75nhHqRuorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L7bKImYxTZpxJq1PyrTqr8pgBHKUKiAZaILq3hHEo0=;
 b=zYUY86WZ3LzyHNvgH7F0AZ4ShxIOQXtLzczqwlNkD9tuR7/wnd4eU/bm46yMW9igih/8fp8eKamliSVrdXtMwnAjm+iU6vyjAJK5NXJACAvNTjAdDk0ckEvbeWTUxpOXpyBW5En2q1HmBrdfj8twfU2gzfrJHssLtS2DnP5mLg4=
Received: from MW2PR16CA0047.namprd16.prod.outlook.com (2603:10b6:907:1::24)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 22:14:22 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::c1) by MW2PR16CA0047.outlook.office365.com
 (2603:10b6:907:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 22 Dec 2021 22:14:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:14:21 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:14:20 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for
 SRIOV
Date: Wed, 22 Dec 2021 17:14:00 -0500
Message-ID: <20211222221400.790842-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222221400.790842-1-andrey.grodzovsky@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a0e10fc-8d9d-4818-2b15-08d9c59867bd
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB494625A25FDB39CEC05EFDADEA7D9@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QEzW3UFuagRhsk5awsjnq2p0ZS/VsCgfU0ZY4EljywqfvmQmYGfcGyEOVZZ6bEAB15BLITOepWVI/9MDUM3MAjvUzBZ0Z40MMK+nlUtxTP5pFoA4zFu1ox9wbUvC663S5C48za3PPpBZxqyT5BKmmaTr+rv+387dBRsREeBWijRORLg6RJpx0f3sWFsfiQd6eIWXDFo2O184H0qnIc30I6w9nEDDMkv3PbnTweRjN/PDNVSVl4v+HW5PU8FLMhvYV0u/5NljBQXinkh5TfvutQo8Rc36nO0kKCuRnca8cTmWVclL6wylcpyM3Bt4Hy/8t+KUAiB/nBX0aDrfQMMfqBExXf0Ps578B7k9ePBTw1q0Aax6N93hbmbonjv4G6bteyRVpWG4Dl6nA+ye7xzrS1deWh5k2jhKgixKlfbrB2z6TFSKKD7NAJAjO0vOOK9RCanQ2cJfZjdQL0OF+vlV9342Spp/4fYL+VwcuZBbGaizQNmZngd6UT5fewj68gYeGBDBeVNJv+cAokf8pivcnF8+EVHIdhu29Gna7a1ywjOkhUDCKYRkHbgpnYdYJaVIgzGZ8Bjx2kL0FfqYD09nHBJ3K9Wg4qjiwqgkxK0r7uyRf8aIs/Vcnn5K/bpu8LANfqKIsNMMIUGtyC8bVPKntOixS0J0vQnsrBai6A4zYC31YHP4zF1GQV/ZaDYl/41kQvi2C5QA67WE2I8hRoI4P4BeQqy6PABhAkU79Z8c5yB/mvQNry1Zyxr8xnK6Kbcz3RMkMkz5nprGG0KWSsQWn0c3mnxy2C2vUHR4u1FbXg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(70206006)(47076005)(336012)(356005)(4326008)(8936002)(5660300002)(16526019)(81166007)(36860700001)(82310400004)(70586007)(7696005)(6666004)(426003)(508600001)(2616005)(2906002)(86362001)(316002)(26005)(36756003)(186003)(83380400001)(1076003)(54906003)(8676002)(110136005)(40460700001)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:14:21.4224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0e10fc-8d9d-4818-2b15-08d9c59867bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since now flr work is serialized against  GPU resets
there is no need for this.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 487cd654b69e..7d59a66e3988 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	struct amdgpu_device *adev = container_of(virt, struct amdgpu_device, virt);
 	int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
 
-	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
-	 * otherwise the mailbox msg will be ruined/reseted by
-	 * the VF FLR.
-	 */
-	if (!down_write_trylock(&adev->reset_sem))
-		return;
-
 	amdgpu_virt_fini_data_exchange(adev);
-	atomic_set(&adev->in_gpu_reset, 1);
 
 	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
 
@@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	} while (timeout > 1);
 
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
-
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index e3869067a31d..f82c066c8e8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	struct amdgpu_device *adev = container_of(virt, struct amdgpu_device, virt);
 	int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
 
-	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
-	 * otherwise the mailbox msg will be ruined/reseted by
-	 * the VF FLR.
-	 */
-	if (!down_write_trylock(&adev->reset_sem))
-		return;
-
 	amdgpu_virt_fini_data_exchange(adev);
-	atomic_set(&adev->in_gpu_reset, 1);
 
 	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
 
@@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	} while (timeout > 1);
 
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
-
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
-- 
2.25.1

