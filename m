Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE5C4AE5EF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA0310E5F6;
	Wed,  9 Feb 2022 00:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82CA10E5D2;
 Wed,  9 Feb 2022 00:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaqW/6TIAdOFpp0pABQb+PLHxggqg6GQ3kB+yWFvdG+km6ralETxts95IcfbZcg+mtHWxaXv/5a00Z0zpaDK3KZTomGMTzIoF4u+R3uqiDGaHw4tO3814B5U+ZC6t9t6jEdWRPMaW6XcZCNCWpzYfIwkRExXlrwjdmg9hnwg2/hqtjJi7qRKCS8qExfEyTXSlr+OxAZ9jrMP90UKf7ZZ1BzQwwUwoUdQzC88fSpIgey13xGvDC11+RMdh0Yck/uullkoS0o9qZqU4+mAAA/9UfSJR1adz1StJ4YY4JcQO/5Ea0e8T4ic7zaumlRhjG31ShQo/ayiMa3xnGnGjpG1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa//RqIOGwWZvrPvUaBPXsOIPW1kc/QZvKqQNzQ6Bzo=;
 b=CyEC1ioMU2hbggVvCQ5e6q68UfZBW1l84cF7F9gdRfvrbHo7fLrr6ql/DdmkDuWIbWjY8OsaqpqJ/QmBfExolJ6Tg4+Ey8us/qLEv1JFYYz06p5L9lOLnfbWpmE5UJ3BbJdheTjA0LugTu33d3v/XEOd9/MKtNRBpVykr43zJWxDlSZidjbhWOyeFOkk4vOUt9xR0eq0Ln20epI3WFzlk66elf2BLtEY+r5exK+dKHxEU/DphW/ceTI5kvslsZ2QYiMUpcxmScaZN/RPi/XloZ+7aghXV6gTzEiFGXpZYKNFC1C5QAt8P4PrM6qHOdznmYKR3/NSDu/5DLbxI8rBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oa//RqIOGwWZvrPvUaBPXsOIPW1kc/QZvKqQNzQ6Bzo=;
 b=1cTgjbXSBjASlyEsFlENUlmus+DgfkwDsWFf+QawR1u3kmcgtGFIdcfx53tj2p73YGGOaft5uDSIWq3aAYc+bjZkGXtBJ+xppZkzS2Jz6+BQ+2brZgJwy73Uh8KTnbxFejOi/ZMCrtH3rfV1znjUYmDTKPun++XNgSV2aRTmORQ=
Received: from MWHPR10CA0062.namprd10.prod.outlook.com (2603:10b6:300:2c::24)
 by BYAPR12MB2600.namprd12.prod.outlook.com (2603:10b6:a03:69::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 00:23:59 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::a4) by MWHPR10CA0062.outlook.office365.com
 (2603:10b6:300:2c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:58 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:55 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 09/11] drm/amdgpu: Move in_gpu_reset into reset_domain
Date: Tue, 8 Feb 2022 19:23:18 -0500
Message-ID: <20220209002320.6077-10-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb07dcc2-25a3-44ed-58e0-08d9eb6276ed
X-MS-TrafficTypeDiagnostic: BYAPR12MB2600:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB260074C8EADA2817B967F320EA2E9@BYAPR12MB2600.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VF0as23geo8n1zUs/N0P/F5rnSJN7AyE/MG35eaqkr41lgQCnSNgJQZ9YXilzLDllvAoxW7/zc5NaFWPQgWjhTSxWeF1x0ePrXz9kMMexVrl9oChpRCF/HExDUeWPL9tLE9nwC8AzeTbSI0jnLDCGgcMzbLqlxvuVL6JZmMWi6wp9SB4Xo3oEen2SN+cK8u9+PLqAr1nGZk+hJUgSoKuEUWC49WvRNwtVgbLEeAoUMZKf792blOAJflWlCiLq6+QAxP70DMM3dX54qBPFGQS7JzLMZnK1Cb8L8vyuNmZuLSQmN/vekBGj6rR2cAk2Yh3O0J/y2Q3Ue7BjCKYzyZj6HCjzeNb8V0GjkmsPuxwPHymSJHmor/T/Td9dOkrf+UtnC5GuCE53DERJ+90zAPYHO/0PtRIqziIAKXMDiPnHBcRndkLWJ8ZSAZzM9hAu9wdRje+KEJoKWok1CB1kaOtr6vcqtL7okZVUEkxhvykYvzX55vHotJCZYlp+fJKbPUvuVDCegqdSQsBjMtVkZ6n+fAAMu3GmNL1zJ4l+a4AJnlD+iPP1XRZaKFXHP9KSgnzyA0+sBpHrIisf+WSiyL1VyAbSyYm2rvfCahYPD6kq2cpQATaFHWnb70BqmEmIk4PewOi93bTo0ewj6JL7UyRVZJ23mMJO/z07OBo7pVlCGb+6Sq9qR+YCKEJr0P8+NiD4tq5QSYu655zybFY+9c++w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(4326008)(83380400001)(70206006)(2616005)(8936002)(70586007)(82310400004)(81166007)(508600001)(356005)(36756003)(8676002)(336012)(426003)(6666004)(7696005)(26005)(40460700003)(54906003)(16526019)(110136005)(186003)(1076003)(316002)(36860700001)(2906002)(44832011)(86362001)(5660300002)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:58.2349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb07dcc2-25a3-44ed-58e0-08d9eb6276ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2600
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

We should have a single instance per entrire reset domain.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 ++--
 6 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index ddfbcc8fd3d3..b89406b01694 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1056,7 +1056,6 @@ struct amdgpu_device {
 	bool				in_s4;
 	bool				in_s0ix;
 
-	atomic_t 			in_gpu_reset;
 	enum pp_mp1_state               mp1_state;
 	struct amdgpu_doorbell_index doorbell_index;
 
@@ -1463,8 +1462,6 @@ static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
        return adev->gmc.tmz_enabled;
 }
 
-static inline int amdgpu_in_reset(struct amdgpu_device *adev)
-{
-	return atomic_read(&adev->in_gpu_reset);
-}
+int amdgpu_in_reset(struct amdgpu_device *adev);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index dcbb175d336f..e05d7cbefd2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3554,7 +3554,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->mn_lock);
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
-	atomic_set(&adev->in_gpu_reset, 0);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
 
@@ -4829,7 +4828,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 				struct amdgpu_hive_info *hive)
 {
-	atomic_set(&adev->in_gpu_reset, 1);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
 
 	if (hive) {
 		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
@@ -4854,7 +4853,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 {
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
-	atomic_set(&adev->in_gpu_reset, 0);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
 	up_write(&adev->reset_domain->sem);
 }
 
@@ -5699,6 +5698,11 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
 	amdgpu_asic_invalidate_hdp(adev, ring);
 }
 
+int amdgpu_in_reset(struct amdgpu_device *adev)
+{
+	return atomic_read(&adev->reset_domain->in_gpu_reset);
+	}
+	
 /**
  * amdgpu_device_halt() - bring hardware to some kind of halt state
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index c0988c804459..5ab72c3bfbda 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -131,6 +131,7 @@ struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_d
 
 	}
 
+	atomic_set(&reset_domain->in_gpu_reset, 0);
 	init_rwsem(&reset_domain->sem);
 
 	return reset_domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index 80f918e87d4f..ea6fc98ea927 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -81,6 +81,7 @@ struct amdgpu_reset_domain {
 	struct workqueue_struct *wq;
 	enum amdgpu_reset_domain_type type;
 	struct rw_semaphore sem;
+	atomic_t in_gpu_reset;
 };
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 4e23c29e665c..b81acf59870c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -259,7 +259,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	 * otherwise the mailbox msg will be ruined/reseted by
 	 * the VF FLR.
 	 */
-	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
+	if (atomic_cmpxchg(&adev->reset_domain->in_gpu_reset, 0, 1) != 0)
 		return;
 
 	down_write(&adev->reset_domain->sem);
@@ -277,7 +277,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	} while (timeout > 1);
 
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
 	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index f715780f7d20..22c10b97ea81 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -283,7 +283,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	 * otherwise the mailbox msg will be ruined/reseted by
 	 * the VF FLR.
 	 */
-	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
+	if (atomic_cmpxchg(&adev->reset_domain->in_gpu_reset, 0, 1) != 0)
 		return;
 
 	down_write(&adev->reset_domain->sem);
@@ -301,7 +301,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	} while (timeout > 1);
 
 flr_done:
-	atomic_set(&adev->in_gpu_reset, 0);
+	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
 	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
-- 
2.25.1

