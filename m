Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C92A4417
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A196E85B;
	Tue,  3 Nov 2020 11:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CED36E85B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3D5f6Wn8DjeMRy/dDUz1Tl7fInb4jb1wTuk3lTnOQwXgfXt5ErHp72CErQcHS22VUcZAx/vr0xkSWvIla28B4EpMpesL9pyvMG2uCfe6VJGUcGQPAuLHregkk7kO542vuaIyo1lvErW1l+T+W4LNmIFXKVZOFfR7vyWn0owN3GsaFQU+FEiTKR2AN/ycBE5O6wdXv0zel3d10bUZpaB3R+y17pjBgcglY5zyjIoV9tgjmaApSWvTc3m5KNoN712ED4keYeXKo/Ctd681tlicwt1T+LRCWjw827gw0QpeUuqiiia/1E7w67ZD+N/g/8BmgwIrklxNLPwjtzBdP7CXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTLtXMiKepwEYIONlNK6W9QMcTIdDKgpXmSofxh+jig=;
 b=XJCCjk70o7KYkP8LvqvDehFLXcdnCA5zPchmkVISvqBFJwpci656CBIIa3SbguIz3wp1cxF66A1PGb/Lo0+JxdbpV5Fo1r+HHcNfxKrkHE9BBGZj4L2ncc13xMx/eJdpoFWXbYWdCVPlgtIi4j1dBBpaEfpi1j3Wmw9lqvxzcYE+8jtLmsLHfx8+O9eMCWql/WackZ1G67LDyYT8nZw4qcbT8Bh91lzFDDjOlzjMUL3g2rLdf55ONrc7KkLJUChaP04RwV84hmecSXgwZI3bLAWhEHJDufsdXm9hYheJmtZby2kdnzMR1Z7bQJFrs7/jwwZ/IIzN/h+I0onUX3nOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTLtXMiKepwEYIONlNK6W9QMcTIdDKgpXmSofxh+jig=;
 b=IorS8Y5S5XThjN7swiFkrRdBPZt9ADxkv6jes+XdGASYAdP4iJCJaTRZE8pNpgvgRJvOqHtyhH9lRHR5NQ8hNrmfJ9Mn7x8BDvWIa6LRT6V7d25ic0bgBrJHCbTMLMNGs+wDLkgzTB5KB471e7b+CD/iof2R/jEY2QOjuO4sJlk=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4562.namprd12.prod.outlook.com (2603:10b6:5:2aa::15)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 3 Nov
 2020 11:20:58 +0000
Received: from DM6PR12MB4562.namprd12.prod.outlook.com
 ([fe80::1dba:fb7a:e505:c97f]) by DM6PR12MB4562.namprd12.prod.outlook.com
 ([fe80::1dba:fb7a:e505:c97f%9]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 11:20:57 +0000
From: rajib.mahapatra@amd.com
To: airlied@linux.ie
Subject: [PATCH] amdgpu/test: Enable deadlock test for CZ family (gfx8)
Date: Tue,  3 Nov 2020 16:50:35 +0530
Message-Id: <20201103112035.7644-1-rajib.mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR0101CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::34) To DM6PR12MB4562.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MAXPR0101CA0072.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Tue, 3 Nov 2020 11:20:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15532e97-93da-4a80-c491-08d87fea8911
X-MS-TrafficTypeDiagnostic: DM6PR12MB4188:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4188ED1AB65873D0E70029D4F2110@DM6PR12MB4188.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0w3fuFN0+tyt6KpplbI6+0V2PpBdPLnPGIPXNbgcf7g8SjXt2xxfuWAgsn4mnfqQGvk+YSEAfFKKhU0fIoj2u0wAS0L73Qib8CGwGyiWpd8HnvlpRrOxKbn+/g1rRYqMm4mEQb5M+YPHBoiDF+ZD4Eku/OJo+5HNN2fFGBokgsE9VuNHIy2Q98FLBsFBssRKm/XLWAtUcDr8nPzeIJNWU6kJiOtAnTWMQo34gxoZqPiS3cusG1dMqvNxiGaNJ4YmgAwuaTdugRRNu1WWBHJ7Lk/e0cPiU72jyOT5t5hsqqJyNz8LqkzH7hTYm9uEaUx8z+uRPMJ3bhpH1g8Iw6iGyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4562.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(66556008)(6486002)(36756003)(478600001)(26005)(956004)(4744005)(66476007)(66946007)(83380400001)(2616005)(9686003)(86362001)(4326008)(2906002)(5660300002)(186003)(6666004)(52116002)(16526019)(7696005)(6916009)(8676002)(316002)(8936002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zoHkLaTXqhdw3H1JtEZ/akwA+a/9/kQ/N/8NtYuOnOiyDz4mpVUyZKbLZiavmA9JbXmxURfDk0kWG0GFWL1ZmF/qx0vZjnAxDvlmAKNodXt6GvaQb2X/lAM1z47o85R8LxQazkDxV8iwZjfUYKlNWTWixOrHkxLkYftErSbJaStAD89wHrYvGzYDmsYBsFaC3CzDXD8TTEx6RncOZlKakZEgmizh9J0/eIhV2yyL2vW6KJLtVKgxQSCKwJwOOI4HF8x9b3BHOyci+e4oCzvfI2mzfvkB3DyaZXEBTLR8FnyYbJv/7HKnBM6+p1OGX4kt0VayCNP57+kLFc1uZ6dy0PCk0AhWnzzPgNg/XTtPkaxSls2MkJYsqqqmRu7wP0ZiJ4VryaZGebs8Fy5jZlDK2ePxq2pt6xSoIK73Mg8V38gZUiaFVcvPbMTHGa2AJTfqkUqmfTLG4iJZbZFzUMraVBuzdUbV5pGb3eg4RTYN8kHP77q6uaYc/Rz+JlYr6C8/QCZxV9R9qMSn1i6GQWCUaN9QKr+AesyH3VJgiSgfzjn2QhAes5O/+UxV90TMs5m6Qd2f2ddWaR35+SgF9i4aXENFL4vjd7K3aQ2cinELHCDM54g8OPpuciEIBUTzMzohE4lNWYNDv9P/BPqbT4dU0Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15532e97-93da-4a80-c491-08d87fea8911
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4562.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 11:20:57.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mDJRukOOnPYdmxpwaQzS0dWG38IVNBqrCZg/NzGGkbe4Pl9wfrAGA7wlRuXJfIO/5OFqGaG9yWROCL1fQZGrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188
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
Cc: dri-devel@lists.freedesktop.org, Rajib Mahapatra <Rajib.Mahapatra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajib Mahapatra <Rajib.Mahapatra@amd.com>

It is enabling the test for Stoney ASIC.

Signed-off-by: Rajib Mahapatra <Rajib.Mahapatra@amd.com>
---
 tests/amdgpu/deadlock_tests.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/deadlock_tests.c b/tests/amdgpu/deadlock_tests.c
index 248cc339..c89e51d9 100644
--- a/tests/amdgpu/deadlock_tests.c
+++ b/tests/amdgpu/deadlock_tests.c
@@ -136,7 +136,8 @@ CU_BOOL suite_deadlock_tests_enable(void)
 	 */
 	if (device_handle->info.family_id != AMDGPU_FAMILY_VI &&
 	    device_handle->info.family_id != AMDGPU_FAMILY_AI &&
-	    device_handle->info.family_id != AMDGPU_FAMILY_CI) {
+	    device_handle->info.family_id != AMDGPU_FAMILY_CI &&
+	    device_handle->info.family_id != AMDGPU_FAMILY_CZ) {
 		printf("\n\nGPU reset is not enabled for the ASIC, deadlock suite disabled\n");
 		enable = CU_FALSE;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
