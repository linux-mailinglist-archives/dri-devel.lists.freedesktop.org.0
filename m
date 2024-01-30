Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A43842A5B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC76010F4CA;
	Tue, 30 Jan 2024 17:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B161131EC;
 Tue, 30 Jan 2024 17:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQKx6q2sfbjEUO5avuf42QdFJ/FTOtaNS4zXWtWtgveyUmEaMG3Oh++N+YM6gmkXxtEHePjenqBjXdEPYxJidf/ueSm7q1DZpb2SmgbtME2cE3CnRT6KJ3JjIm+vVXou0JYCX9eud36LBG+A6fcJB7J3CtFw2IpisgY5IT/Z3+ZEv3faYuFnx/P8aULC3hsu7g+K1issEMfQGnTBTBhSwY67Ftzjym4nkY2LSAcegDtP2VgFvM3/kjyIRBxHYRH9Vdpr3WnD6HklBXznUiFzgNKbYqJM9mTKGCcGT5+pXU4vV1Bnkwj+keTGyZGd+3IHyJPXiefwoddSWp+FdqbfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRtM1wsUyneTByH711abrNxiqsruk/2WT67jRGs7CKc=;
 b=E7lx/XK7SYf6ktC3g0/Jad+pqX0LPUP+3DSBTXmo8b0kpr2nEpG+7p6cbl74p87LJNNdwxc6OU29GL4JtnPVhrGjyVmZrS97WedNLU9gR0LnSXEUniKaGHgz4op5SwLR2zpkdruqe0uuUu8QbNjhjCmrApQEXXUV19F3LQ3Y7JRjOndD4Ufmy1xGuQYGcxRjyP+HL9Wl7Dm9DQ5r/gcASeguOljXgzHbCr1Qq8NaRfSOVyzEYreXxflS4P08TvmjGqG9FBS2MQebHPEthA8rPnZUJNmQa7tnaXngiCWqWHBgKCD3xtOLV6ZawraXIqGVrJP1r83JMoO8BwzhiDrnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRtM1wsUyneTByH711abrNxiqsruk/2WT67jRGs7CKc=;
 b=Pf4AHUyaUSOdf4wXZ351vrD81LfYrdPq+EFtMxO/X2qb0ZagWJdAmUoteJ4U/fD0eA3QsbgMjtXHKTvcJzVsq201WUF9/WGIz9TJs9rpnD5uMm8IgwCCumoB2AJ3bjV050s9IQy71HBr9tBPBS52+M8+bxFCoeXkuUnNm9hjhqU=
Received: from CH0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:610:11a::22)
 by SN7PR12MB8433.namprd12.prod.outlook.com (2603:10b6:806:2e5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 16:14:09 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::a1) by CH0PR03CA0331.outlook.office365.com
 (2603:10b6:610:11a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 16:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 16:14:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 10:13:29 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
Subject: [PATCH 6/6] drm/xe: Update shared stats to use the new gem helper
Date: Tue, 30 Jan 2024 11:12:35 -0500
Message-ID: <20240130161235.3237122-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130161235.3237122-1-alexander.deucher@amd.com>
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SN7PR12MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 2053418d-3287-45bd-8456-08dc21ae7d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dcfG1E8Jsea48BTopxar8YlNFkz2BwhOV1Nqbz86gVQnhZSo3YMg8VjZtQUnSQdQHWAl8ufb5BL8iNoaOsOcGkycjqwZubIbiovn+KExAM0KCB2Y3cg8/asLzXiRcQgkgNRiBJvQdO4S+MIr7RD6s0PU5dgXGUnizEv/dS52kh+hbx48jyr6bEoAWf3SUhaOi1VJ4o9TesAeSBbX1h6h41B5wcOtylIMQ8vgJ/M37Fd0AdtvFppmvKJXjF7F49lGoInxV55KqjdMO8N6Bhwu8Nn/IR0XbXfFnTqU5gYNhrYjMObOj/Kg0RrmGPMrDGDbhbwm2erHDvoQRF5HNDzfpwUe/Ngks7AQSsvfGagDuTg/378BarQns4m8M1ASbVvsVb4dH+ju9c3nmQFo3v0HSklIa4yUHXzs1HvR9BrFnXgAzPsgHWFXFtznnpcKMvEIua53THBnBBKXnpHfP7TlTbASeTd3Sz4b2Hw2UCB/fBLsaVqSOAVQK0L3Yn4XmOwOUqqDiToyH103MDyakrIeQ6wuaw6K3FjlXrQoBaBREOMqNYL65IXdyrTHvm0s4KtjbzVK9201w4WBETiw5p7xXeXoquz7E8tFAm1MjEY38RDyggb5xGk/q2iiXpZRpqKdeVw55LwCNekj2MR3dy3T1fi4S2i7qKZtiQH0zvJspa8khULCm9I642WyoajtqlAbddfvjn4QmY9eRtqw0nsU+r78coHG5FIcuPAuYWAkFMaBhZXnY0B4C9zby7ikg9n9bA0Bkys3esY4zvF4Bm3+iQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(36860700001)(47076005)(110136005)(316002)(83380400001)(7696005)(70586007)(70206006)(8936002)(966005)(8676002)(26005)(4326008)(478600001)(2906002)(36756003)(1076003)(6666004)(16526019)(4744005)(336012)(426003)(86362001)(5660300002)(2616005)(41300700001)(40480700001)(40460700003)(81166007)(82740400003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:14:08.6663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2053418d-3287-45bd-8456-08dc21ae7d28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8433
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to using the new gem shared memory stats helper
rather than hand rolling it.

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 82d1305e831f..ecf2eb67d310 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -113,7 +113,7 @@ static void bo_meminfo(struct xe_bo *bo,
 	else
 		mem_type = XE_PL_TT;
 
-	if (bo->ttm.base.handle_count > 1)
+	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
 		stats[mem_type].shared += sz;
 	else
 		stats[mem_type].private += sz;
-- 
2.42.0

