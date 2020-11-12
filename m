Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57272B087D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 16:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097D56E30F;
	Thu, 12 Nov 2020 15:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1E6E323
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 15:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpZ+4UeMQ5uIHiu95WR+V86zh1EI1tnPubsr1wIV8FSsCp6YHrTemBlj03JgHIHRNUP7kqX8ZJhVWSLwzll3oi178nxnDtRzjyqQ9PTm6VUXeXU6BoP+92nfqE2sixe6FcYyvpKloGEU3AW91JHUG8DZyZ7z43W1NE3fDsX8DVd47JsGUUqw4La63v3u68ceZb5ydb7MHiOl5o+rJanfg5FwkgagGY6kDLW+HGQhzqeF1YZgOv/St1bo06DkMCSs3Hhp8zsWDcUiZbIQoj2jLzOO8Oj0BlUO4IBu0tu8PUCNRJxoEgmpDaQkWCmRdEMNu++yh1nrZGpiYBXG2zmQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSBr8cve7uk02V+QG6Lrtv713bn1D4p5/eEWeLPmqOU=;
 b=a1nJxm1COmcOHPjQx9x7txbsvSg5Cg2+bgE9uxmhkLkE76QUWqF5zL0cgk4RFvwabPZj3S1XXA41vxFModE7308v/s2V3u9jaHjElpEYmTUkNgL0R4MwKB4OjbVfRCJsBFNIhQ/91rplXXI1TSBI/VyCGlFkVz/NwzNBh74N0SAW7lOBGQNOTc78NijzTPdeFcucSCRifHYT/0aOLreXB96c8Bq5AIgdzrjwzp/+fKXxJmewCXJ6s4b11nm1ik5y6z7CGmX+9X0dOAEdFVRLV45AdPYLjcroPDQCmLvEcf5JlHenpwAHv73Uz/KaODaZT44M+ydre9zMQn27faFIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSBr8cve7uk02V+QG6Lrtv713bn1D4p5/eEWeLPmqOU=;
 b=ZP5giool31UcDr9USoxU++z9WmbAhpXnyRhgI4nkwuJhn3MAQ/vaaGVY1pFDwAVhvyGrei+3IamMcowFLthQa+NAat9p+532vslBtWxJBMUc6LB/V6hMs1zOkjEfyYOEOWhcpULZJFVTlAI/leqJx9VtZKp/Tv6Rq3kP/b+TShk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4562.namprd12.prod.outlook.com (2603:10b6:5:2aa::15)
 by DM5PR12MB2534.namprd12.prod.outlook.com (2603:10b6:4:b4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Thu, 12 Nov
 2020 15:36:08 +0000
Received: from DM6PR12MB4562.namprd12.prod.outlook.com
 ([fe80::1dba:fb7a:e505:c97f]) by DM6PR12MB4562.namprd12.prod.outlook.com
 ([fe80::1dba:fb7a:e505:c97f%9]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 15:36:08 +0000
From: rajib.mahapatra@amd.com
To: andrey.grodzovsky@amd.com,
	Alexander.Deucher@amd.com
Subject: [PATCH] amdgpu/test: deadlock test for CZ family and RV family
Date: Thu, 12 Nov 2020 21:05:36 +0530
Message-Id: <20201112153536.85696-1-rajib.mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR0101CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::33) To DM6PR12MB4562.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MAXPR0101CA0023.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 15:36:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 594d29a8-8069-4d1d-cb7b-08d88720ad10
X-MS-TrafficTypeDiagnostic: DM5PR12MB2534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2534A897997610630DC745A1F2E70@DM5PR12MB2534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4la3wrbu6BJ3aV7EQJiyRR6hDRmh/5BCvSPMOdOaKEPt4xB5WUNzsXttU7+8IA3O1VKIDRNXD/pzopJlab5+NVAatPmRmEEAMxeId7VFvYTlAaB9tThWvDpjAHpVOj0MgoCHTE98iqEv+l/ZzX1GiKl1zZkwTBW6OYZMGPK+Ut3shdDdn0B/OjHS2kUvO2XeoUNnn8WYkaLD07wexO6yxdck+AjGNPLLa+U++GuFP4j/9tKri1hZcudtt6fNAMP7vd8TO34P8us6M/9ZeX9OLfSg+vXwNSFzT/hQW2DOzkiaJGXTZolBYLQlQY6zz7p9/+GUWuRQK1jyI0EHW4E/vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4562.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(316002)(83380400001)(66556008)(66476007)(66946007)(956004)(26005)(2906002)(4326008)(1076003)(7696005)(9686003)(186003)(52116002)(16526019)(478600001)(6666004)(8936002)(8676002)(2616005)(6486002)(86362001)(36756003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 2EFSG7aHCg13cc05wU1TLwTtTttrlXq4u97tRVZYIbAD1FcN5Vwr5iP1/WLl6BFLzWG13E7o08fYrTkDCpxfrV2pAjyZiozA8quXPv+qbFCVkIENCqdztobc/GuS409kccNRhta+k2IlQRPawr7LRI/Le7xQ36iPledskBW+6WMM/vWY9cG4WHLMWZixRNekWwbZN4WoKJ3jPcgl8sD2CmNOajdBrMJaZcSXHmv4LWmzS9KCNTM/LzMXNUg1ui8M03wbLUsZ9kbvRc08gQ9RGEkmc7lbXKkKcEv278zHExXawzKGRqZYB38ras/6CmF5lzS0CLgYSEpsk8/I/Mf61rR5OZU7MTyoAeQIUFdJwwfmvmPniS5E2lfVUx/xOgZljtIIvP/z+I+uf/p8B9oisJ5FPRqkhFhHFeHxdl9qRwd4tqCE6UNYO7q+v1Oa2rlCV//+iujV2m+NNEF8Hx3tiSh9LWVd/oXly3yeWy/lBmBUh9aCi4QxEFwv7gfyq5rxm7glASz5YKNfhC0DzgQuXvOKFlHnus3RSMGnPMlRdKVujaxXC+DKNiBmeI0ih4UEZ7OOWDQRMBYG7Y0pH2d0W+ClgdJM/LaxgEiy0Ao8yxMJTjh+lD1wN03X0RYPrenD/sq8lq36/fqQJDndslf9qA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594d29a8-8069-4d1d-cb7b-08d88720ad10
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4562.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 15:36:08.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjB2CFH49sfIAsFsiKa8E7Nb7KImPLgWAVa222x/p9MXuMBgnDm862Yb/laXCbJFoy0bTpt0HqzvdrDDbuZ1vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2534
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
Cc: Rajib Mahapatra <Rajib.Mahapatra@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajib Mahapatra <Rajib.Mahapatra@amd.com>

It enables the test for RV2 and PCO, whole GPU reset is not supported
for others.

Signed-off-by: Rajib Mahapatra <Rajib.Mahapatra@amd.com>
Change-Id: Id51605d07b334ecea7a88b3c95fdd57008a4458d
---
 include/drm/amdgpu_drm.h      | 15 +++++++++++++++
 tests/amdgpu/deadlock_tests.c | 18 ++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/drm/amdgpu_drm.h b/include/drm/amdgpu_drm.h
index be84e43c..bb7ded25 100644
--- a/include/drm/amdgpu_drm.h
+++ b/include/drm/amdgpu_drm.h
@@ -995,6 +995,21 @@ struct drm_amdgpu_info_vce_clock_table {
 #define AMDGPU_FAMILY_AI			141 /* Vega10 */
 #define AMDGPU_FAMILY_RV			142 /* Raven */
 
+/*
+ * Asic Rev
+ */
+#define RAVEN_A0 0x01
+#define PICASSO_A0 0x41
+
+#define RAVEN2_A0 0x81
+#define RAVEN_UNKNOWN 0xFF
+
+#define PICASSO_15D8_REV_E3 0xE3
+
+#define ASICREV_IS_RAVEN(eChipRev) ((eChipRev >= RAVEN_A0) && eChipRev < RAVEN_UNKNOWN)
+#define ASICREV_IS_PICASSO(eChipRev) ((eChipRev >= PICASSO_A0) && (eChipRev < RAVEN2_A0))
+#define ASICREV_IS_RAVEN2(eChipRev) ((eChipRev >= RAVEN2_A0) && (eChipRev < PICASSO_15D8_REV_E3))
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/amdgpu/deadlock_tests.c b/tests/amdgpu/deadlock_tests.c
index a6c2635d..3be99dc8 100644
--- a/tests/amdgpu/deadlock_tests.c
+++ b/tests/amdgpu/deadlock_tests.c
@@ -126,8 +126,22 @@ CU_BOOL suite_deadlock_tests_enable(void)
 	if (device_handle->info.family_id != AMDGPU_FAMILY_VI &&
 	    device_handle->info.family_id != AMDGPU_FAMILY_AI &&
 	    device_handle->info.family_id != AMDGPU_FAMILY_CI) {
-		printf("\n\nGPU reset is not enabled for the ASIC, deadlock suite disabled\n");
-		enable = CU_FALSE;
+		if (device_handle->info.family_id == AMDGPU_FAMILY_CZ) {
+			printf("\n\nWhole GPU reset is not supported for the ASIC, deadlock suite disabled\n");
+			enable = CU_FALSE;
+		} else if (device_handle->info.family_id == AMDGPU_FAMILY_RV) {
+			if (ASICREV_IS_RAVEN2(device_handle->info.chip_external_rev)) {
+				enable = CU_TRUE;
+			} else if (ASICREV_IS_PICASSO(device_handle->info.chip_external_rev)) {
+				enable = CU_TRUE;
+			} else {
+				printf("\n\nWhole GPU reset is not supported for the ASIC, deadlock suite disabled\n");
+				enable = CU_FALSE;
+			}
+		} else {
+			printf("\n\nGPU reset is not enabled for the ASIC, deadlock suite disabled\n");
+			enable = CU_FALSE;
+		}
 	}
 
 	if (device_handle->info.family_id >= AMDGPU_FAMILY_AI)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
