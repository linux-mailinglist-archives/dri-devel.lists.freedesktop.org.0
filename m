Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50432EBBA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 13:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D124A6E201;
	Fri,  5 Mar 2021 12:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C089DC9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 12:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDxyWBVnHJ9so3VQbruHvWYS3YjjTpU1I3XRn5xfs8uHe0gkmiVs9mssLoxPh0JjSUJDHy+AD+LZNmnhHBEvSMW4QjZLuj0vekRdknrZC8sbIgHIwtWofe3ImMPiMa2ZgSKyMTiUbgzfuYQAs74O53JWbyWDY5ZbcIRAvFa5Pbxc1+5Dq1V5Bqu+qTyk5Fk0nhzPYfNr+VNh1Y6jJWXtWQISYoUhEXfkWgoJkiI4moDDLe452CIsap06pexq31iDeFj6U5LvQTRQVnVBxZzYbe8FoscdvpqiucZZaNFsVMcSgrI7Z9F7ghqVB5aZG/dJtDurhU0FA6z1+bfmODRL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90ycKuKEsdwgNFQnQsCNGNZsvc7Yr9HMh2zVdj/59vQ=;
 b=Exctmw3LVWvuNysjBmau8HuJfSbuUWdRaGYlxZTGSkeBUq4z8ols9kyyienyapHtTEFlFy51WcuUQYdYrDLwPgylUpGnWjFFdOVFET1Y0jLSMSDTG2SxqiPuIYzmUOlyE5ZvlwYyLei0VAOiKAp78Fs7rsAHdJisFXwiI+ziXlzVzlXZ7IijoaKbtBwQ8su4ryznhoOBesaaYPlvdVQdjPqeLKbTe5cyUpkcMzuvKw9BPO0GK6KJFoampR/SA28JwWnCcVxwOt2fEaERzrnZooEpmPcF628BPamqQX4kFM6im6UZXNLWMNizpe1Ww0QABOpddQkpwxRtM21i7uX1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90ycKuKEsdwgNFQnQsCNGNZsvc7Yr9HMh2zVdj/59vQ=;
 b=BZvABXtvqViFtdeR6dH2gXOeGEuUj/9P5pBSkvBdWL99GB+ujaKHt6IPt2uX46lG/nlXN9xBXd0iaAGw+YYihde2RVd6BfjzdoypkhU25dgqa+s5HK+GllDygRDs3fn9nKdmwMyQugCfQ+0ST5yg9ff7shwIWvfzhZeLb55WgL0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0232.namprd12.prod.outlook.com (2603:10b6:910:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 5 Mar
 2021 12:57:12 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3890.030; Fri, 5 Mar 2021
 12:57:12 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: Christian.Koenig@amd.com
Subject: [PATCH 2/3] drm/amdgpu: use amdgpu_bo_create_user() for gem object
Date: Fri,  5 Mar 2021 13:56:58 +0100
Message-Id: <20210305125659.9923-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305125659.9923-1-nirmoy.das@amd.com>
References: <20210305125659.9923-1-nirmoy.das@amd.com>
X-Originating-IP: [217.86.122.77]
X-ClientProxiedBy: AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::40) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.122.77) by
 AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 12:57:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4175b670-0a54-4b1c-76b2-08d8dfd63197
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0232:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02326ABAEA4A650FF5DC50A98B969@CY4PR1201MB0232.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6CHZ96WRda9eRSU6loeYeg4t9YB+Lgaf48Vu84uT/w54g5LtZo2DPUXmGKCtFumv+CdUP5uY/J2DpIPDF94rw27fHjVAyJzTJOTnMoZSyWbZwGrwCfr5Q7LcvLPv7hbam3PZ89EoN7C42inGqgUrpXb8ZkK9UeDW0pt5OsAwyvS8daL4sbZhfxabUJaaX0rZuOu/ot7Hi12ydocJSsdcTkziuZjozu8vHA0bd5QYbccyhBir7C+WT8+xElsYfWcCLmtbzDdRG8Q2Dn87qu0vnlr6w/8NHKX7lmkeiU8fByHoo4a2t3TI5IWdqyg1jF/4fxt4k/CVd4ON9aoiIBA0OGH3g35RLvN0Sb+5TUfVRqvBE/kSHhcDxy+kcy9XB3IFTUroWO3SbHhCJM/3VnBmZB28lwTumQjNBFDOqWKyU2tWFRqSiuPTQfj0zU017XrPF7M21Sme3qpejvvSj/18fDlbVZaOGMdaP10oZdF8jS47ofc1cKa8GLREmzX6FcN5U3vIkN8aVUnytASFGba8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(16526019)(6486002)(6636002)(26005)(36756003)(2616005)(5660300002)(37006003)(52116002)(66556008)(186003)(66476007)(6506007)(956004)(6666004)(66946007)(34206002)(6512007)(1076003)(478600001)(4326008)(8676002)(316002)(2906002)(86362001)(8936002)(83380400001)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?InmiiM6itAP2AOLesl3NH4vLWTKIYgJznLWiSPa0hihicEUsDc/PpzqW4Elc?=
 =?us-ascii?Q?9Mx4JD8DpdvZ9fPvRXeTv8w16DdM0DeBa04I28moNFdbk0Gb86d95xPdmo0W?=
 =?us-ascii?Q?3iFYxI6DXodNLe6m/yKfItC9C/TohhGU7qrqbZCfSJP9nudxJkFV1JCJ+5PE?=
 =?us-ascii?Q?j1krpux00xB5lRuLS59DjDYK0ykBrFb1boyhpZURh/22EEK1WxFKEC2PIMdJ?=
 =?us-ascii?Q?u3OZgaSE0Owk08IrHQW1ghNR2paskyOagIF5wTMeGZf2amGpcJHJR/xXeBmh?=
 =?us-ascii?Q?z2aWcWlXsJwafgunRN8UyS7X5MyKWmPKSsuifQAc5dhsxTC7aarR3dz86t88?=
 =?us-ascii?Q?IfTLu21uCnMVEtQOKy70DP8y+pxKduLXvC13ZVA3eaGGn1Ap3T8NfeVhmGBF?=
 =?us-ascii?Q?rajvfFY8tWgAszVtPT/aRzkAySj+snKWvX1aj4houZnGusnFkb01O9AV6g52?=
 =?us-ascii?Q?8N16i9uKqf7/3zmHPDuTwJ7Ccu7IxNAo4vZXF+sCx3Zt/FFe/fJI8T3buNDk?=
 =?us-ascii?Q?na5QzKtAoZTFxHHBiRDQc/Rs6kop6JbR9dZfM3CEyV7ehg9QBy6sA5X12V6T?=
 =?us-ascii?Q?E7fNiZGeP1J+zSslVSJKgk4FOSYySk17pbSjMSqJ+EJeH13Br2Z6HGFrs0bx?=
 =?us-ascii?Q?EQg8CDdjp0sM6H5T8NNTLZTdPHgMcCOibwaaZn0esVgvc4rBLRVIXFobwCJu?=
 =?us-ascii?Q?r92ib4aB6WWL/KdGQfb1Z0drZm2o40T/UtBMXoNMj5JD2bdhyaxdr8n7paeQ?=
 =?us-ascii?Q?VUezNyDqM121bNzZRaZk8uJW8el0RV71+qYGoBDgHB1xjCCoOH2Gsn3Yk+fM?=
 =?us-ascii?Q?FCr74/4laOcv4X3c0IxgB6eApegmZ44culB26Aa0AA4UZn5Q3PYqJwvLXdZe?=
 =?us-ascii?Q?fWbprYQ/F74I3PxzpGrBPNIoUgPCjcvmgMukQoSD+3FWF2InXmqc86q8gnvR?=
 =?us-ascii?Q?wQHpNpT33dxAxhZBIyHtosWeMEIRkepl1qZQUyaRnLhcMNaTQJ/zM3fBQlMX?=
 =?us-ascii?Q?8h7w735ekM8wLIpPj8sr0KuJLqNMh7GJHD049Z71xW7YQB1VcjMH9yxdpPu8?=
 =?us-ascii?Q?tnBeJNvQVDsupeG0nLqEx1t98SJCKH4aMyRBQ1trEfbHwITcyFLa8m/49Fjl?=
 =?us-ascii?Q?/QnY3b3SHXia3u0/RyqmTH7Ksqj0SdCYelsuSpoQaVjmSA1Uh11G8bdXtKg7?=
 =?us-ascii?Q?QLD9qsL4D/zZdwiPaecPS2mm7ZA5VJgHfojuqZHE5nv3bSkPpmTzZP47k3Qd?=
 =?us-ascii?Q?4RIJ3KY9VokIRB0ZSTjxewSQBI70uNf7thfovH9NBhBULD3WiR1vNG3ruBVy?=
 =?us-ascii?Q?P86w0zuLNlHQ0jwztsaWCxyg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4175b670-0a54-4b1c-76b2-08d8dfd63197
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 12:57:12.4369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l82Su43ESGJxPo5rISWn9/mYZzMOX3Qb+qtgdUlp949NSB/KLNtZ8iBoPfFntlBiKR6AmboWcjifqxzE/mlNVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0232
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GEM objects encapsulate amdgpu_bo for userspace applications.
Now that we have a new amdgpu_bo_user subclass for that purpose,
let's use that instead.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 8e9b8a6e6ef0..9d2b55eb31c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -54,6 +54,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 			     struct drm_gem_object **obj)
 {
 	struct amdgpu_bo *bo;
+	struct amdgpu_bo_user *ubo;
 	struct amdgpu_bo_param bp;
 	int r;
 
@@ -68,7 +69,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 retry:
 	bp.flags = flags;
 	bp.domain = initial_domain;
-	r = amdgpu_bo_create(adev, &bp, &bo);
+	r = amdgpu_bo_create_user(adev, &bp, &ubo);
 	if (r) {
 		if (r != -ERESTARTSYS) {
 			if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
@@ -85,6 +86,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 		}
 		return r;
 	}
+	bo = &ubo->bo;
 	*obj = &bo->tbo.base;
 
 	return 0;
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
