Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D68FADF6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 10:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED4D10E43E;
	Tue,  4 Jun 2024 08:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZZcSL5hW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDBA10E43E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 08:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDrkprOFIJFENd9gizaXd/fSvPgoA2R464iRYh6L9JopmSV55zJ6uADx6/KzXbMTb8oLRDBWlf+ZCkoZ/s5Ff9CrHL6H7VqDRx8wSEcom5LSQEHpjRs6BNVGUdmi8cpij0HzV7Cn+x8TOZTGPOmeDc7rbeVh/jYjwUxJoKeGxZ8pGHo1SRVsS4tqUUztjlOsyo4rhRP0qNgCEM9G/etx/7rC23a2nfNN9kmBzAynLGkFHPHOIR3a40q8MOqYJcKrno30LADcR778hvIJkKrC++aiHVIDb29IrFj+MgA7ph2vnUCHOpVj67sICjZIGZze+6dyfjMjGOHeATZkK5xoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcardX/barFXsQre7jP18jO6jywnSpNPXEVQ0ZmzrA4=;
 b=fWo38+SE9gJng8SJlx7yKPw2StDLCZhmFtyCEgV8FGkIMh68rOacI9TW/5F+f+kh4JuaUh7rWCacZE/KlWM6LFNrtnJt9vtMH6sB+DXoHSvMeq7ylltcjpH86VLRU+kvbB9Cu22Kzvtv1EYHMfqxpb9dSPuFkQsbyfkdTN+/nc50oFqsv2jmlsl4vR5b67anm3CItiSbWZsVi12Egmr85TPZsfNqNR43/gFBlLHi6+wzOZCngM5FXNq0BCZVwkP9MV3lvz0Mce21hk5eJGMCpil3erg5TetBhh37BedTD+NiJTFA9xr+N3l8bx0vAsGtMKmnPsL0udNiSzR558cCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcardX/barFXsQre7jP18jO6jywnSpNPXEVQ0ZmzrA4=;
 b=ZZcSL5hWMG8yy9jRslH0D74KlMHLkKtMXSWWa2OAyWiqHWuP/N4G41gRBvjPZfQbo3xQ/xtqGumjNMO+f/T1PHS7rUhWHFGdGmFTj+Qr6QEC1OtSxUWLbFUnM+Wy8EtlzCSrqMb+b6j3vz1m1obzyxG+mihQlH8kl8hlmjOc4W0=
Received: from SJ0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:a03:39e::35)
 by DS0PR12MB8413.namprd12.prod.outlook.com (2603:10b6:8:f9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.30; Tue, 4 Jun 2024 08:49:51 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::3f) by SJ0PR03CA0300.outlook.office365.com
 (2603:10b6:a03:39e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 4 Jun 2024 08:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 08:49:51 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 03:49:48 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <ray.huang@amd.com>, <christian.koenig@amd.com>
CC: <alexander.deucher@amd.com>, <dri-devel@lists.freedesktop.org>, "Zhu
 Lingshan" <lingshan.zhu@amd.com>, Li Jingxiang <jingxiang.li@ecarxgroup.com>
Subject: [PATCH V2] drm/ttm: increase ttm pre-fault value to PMD size
Date: Tue, 4 Jun 2024 16:49:34 +0800
Message-ID: <20240604084934.225738-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|DS0PR12MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf40a51-8f72-455a-d6c1-08dc84734c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|82310400017|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xKbKFBN5InXl/ttHNJH1T+q9RBxJK8e4XpQ34bg2VUmJyVWqHNxNraqVhjXZ?=
 =?us-ascii?Q?xk5Ck48S4GcIGyY2UbV++DIU9mSzWZkS1VzmCcXYAkK8NiahdYmTeNhySf4N?=
 =?us-ascii?Q?Pp1JzHOW7QJcRDA4ELK5ZnVZCzJgPbpTzhxz/ihcDH4rZ1XnMHBrgWl30Pgt?=
 =?us-ascii?Q?1JGYSLnX5ZeKDwf3UQ8BGtF461NNX0crFNh4vZuGZbS9XilMGy0FuJLKfS2A?=
 =?us-ascii?Q?QGsxWhkf7APRzgm/qx5EMN61OZ/naPX9Fxs0xG2+/uvBn7Pu3Ig5wPUTbOHM?=
 =?us-ascii?Q?RyQiuKA7RY+dDrcryr2A9oX3LkgGkf3MsmnNwFTSuAfN/3S0sfcsFluYS1r5?=
 =?us-ascii?Q?8YJPh3Or7J/CxAb/nh2F49zWcGWhILurQIRPxXuYexLcWjc+Wm1ihknFlb61?=
 =?us-ascii?Q?MyuiiJlAAju3G2Aslf0An+KezQmc0QWwo+eWi43K5AVtrG5GVwm/WPR4otXx?=
 =?us-ascii?Q?qvz/+Jewqyp/CUppQ9YzjzAC3uHKVATapVFHQCq6snZU83g4ATg8IoNM1VDD?=
 =?us-ascii?Q?szUaqcKqjmvI6ZzNm9SwAlc6IoXTj/T6btpvH7232ep+O4zPy39rZDzbLh+h?=
 =?us-ascii?Q?g/ddXKaqPfv+MkU2VKAOYLAX5lAUYwO/UD1/wzhdRdTkuvQ69c7YklY2P3fK?=
 =?us-ascii?Q?Og+EbKF1I47AqiRT/DodIVj+eDiEQTPiGZZOesna2crJO+31pwJzBkWGVUtT?=
 =?us-ascii?Q?6DqoMHFnGuMoJeLHIlB615xFDhGzO0flx2cyG7hPISLSusxMGeYvd41T4eUB?=
 =?us-ascii?Q?yd4IOOurRhTZEKuxOhrn4eFNY0gcR8ccHtzqebRmrU5xsMsQpo1YZ0E2I7Ej?=
 =?us-ascii?Q?eoQ9mkBHZACsQRzBfcy5U1jVoEvZEqQRBqrh+/Mp9K+ujd7veNzxlVXd42+y?=
 =?us-ascii?Q?vCxPMfS5tvkx8iUDiPmObKE6HxHE4hULqlDJZs0UfpoUkjwQQaRtxNYnFryg?=
 =?us-ascii?Q?0ZNeYOf2gZvPBrgAe7UK9SLk32uWTAmC27JttC8aOmgwxwlWe7XACvHP669b?=
 =?us-ascii?Q?clCZPTN+FEDykIqThDi1gX94e4XaUBLGajbL6PBKBIxXcvSTr85//fK+CU2D?=
 =?us-ascii?Q?nnJOrN9tH4KoES9Vz52ifhimrdj/rTuBP43TO4k/Pg9aHcJcbNAOxa/7rlkJ?=
 =?us-ascii?Q?QGB9aIENPHIxHHIickqyu8tbsBNEZUy+2glckkSgLm9aPfjguIb3DEgcL1MW?=
 =?us-ascii?Q?e6YuItaBt8wXJiIIASUfJ59NcdKOfveS0fl4NHg+xZ875GuT5vf0yfP59jqq?=
 =?us-ascii?Q?U6q4LuHhdtWVJYGaI2JVBdyf4IgxJiaclCpwOFefaY0VQlK9iUl0DL25JFgL?=
 =?us-ascii?Q?MrKgL6KdhszrLyID+mzHhJU1O0e98zxRvnsKNiwt3XdNbMGNWpCiExsg5c2F?=
 =?us-ascii?Q?a+4NKD9HSKaBTBsqp2ZMADiGmPv0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 08:49:51.2957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf40a51-8f72-455a-d6c1-08dc84734c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8413
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

ttm page fault handler ttm_bo_vm_fault_reserved() maps
TTM_BO_VM_NUM_PREFAULT more pages beforehand
due to the principle of locality.

However, on some platform the page faults are more costly, this
patch intends to increase the number of ttm pre-fault to relieve
the number of page faults.

When multiple levels of page table is supported, the new default
value would be the PMD size, similar to huge page.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Reported-and-tested-by: Li Jingxiang <jingxiang.li@ecarxgroup.com>
---
 include/drm/ttm/ttm_bo.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6ccf96c91f3a..ef0f52f56ebc 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -39,7 +39,11 @@
 #include "ttm_device.h"
 
 /* Default number of pre-faulted pages in the TTM fault handler */
+#if CONFIG_PGTABLE_LEVELS > 2
+#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
+#else
 #define TTM_BO_VM_NUM_PREFAULT 16
+#endif
 
 struct iosys_map;
 
-- 
2.45.1

