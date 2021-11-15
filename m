Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60945041C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E098D6E9E1;
	Mon, 15 Nov 2021 12:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300118.outbound.protection.outlook.com [40.107.130.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126256E9E1;
 Mon, 15 Nov 2021 12:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UejDCJB87yitNlC0Q/khqr2IwnO8VnZ0ra25SsOJ6uTkB8Z5l9FzH/tF3tHZx4ZC8LRnnhfAWkMEfozRAGGNuboHTYMn7JJ+1RTWiwUkbSGlRSOX3XRiMrVvFy7iJ+hd0D8ZjlOH41jgAl+Q+w4f4l+k5ceJC2As0izJfac/I4XkZ8ku5qsYIxWI0x53ZKqgf2AF4QZQ/6fT9+VT8Dh38UyRx9IGM0CQzS95LbgHEN3zMIjOwpYEFD0M7SFUMYYwZmsI/fyMW+1X1Zk5DJXa4UUqScDkO7SerRfEBb4NNUiXxHYWf6BZ140R6F6Dy5rNQjcHKmHdk2owB4XG9uGgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4VC75bxeyiIUkxtQ+JLtMpA2c7e6tVKSTAwPLrKPWs=;
 b=XbnwNd08xZ2ye5fs8WTWrOf9EgZgFof04ufmoBTieYDW+/uyssfSls0cKNvmdmfQjgVvNhPsFaNX2PbDV8fe1E7CX64SOEzoNCY5B4S9q8IEzp2TGE81E9mbCKrg654vE273ZblqFAoQTlEUhyx0E3/8un+q85cxeic3pVUzy6BfNVGxQcSbJSeGQ222kJ3SsIVm8p4bs58kA0AnsmpTqUtf43iXKkQ1ZVlwA2P2gQuCcx/PdcSXLi1DTdDugYGydI/+iLh6BVaWibMrJ3OYKRNES368fEfbVCy5HK2q8IHClKhP4EAliNq1hpvJGymbMk7SVv0gTFUYpyJd0D5pOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4VC75bxeyiIUkxtQ+JLtMpA2c7e6tVKSTAwPLrKPWs=;
 b=C070eVkdz0BCHjE5+ce9F1tjn3fASflDjz+nYdhMFpzn8OpIEy5WCVHrS1teLewHWY4pbrJAmvkm2bZj+d+FQ5huc+/Rq0C+n+VVZK/sA/bnz/o53lK18QluvH8y75iZWi4rd4y6rSLzJ5/ST8aG+FpdDoeBo55iOkoJfDv7P4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PSAPR06MB4199.apcprd06.prod.outlook.com (2603:1096:301:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 12:09:20 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 12:09:20 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Candice Li <candice.li@amd.com>,
 Monk liu <monk.liu@amd.com>, John Clements <john.clements@amd.com>,
 Jingwen Chen <Jingwen.Chen2@amd.com>, Bernard Zhao <bernard@vivo.com>,
 Peng Ju Zhou <PengJu.Zhou@amd.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 Bokun Zhang <bokun.zhang@amd.com>, Zhigang Luo <zhigang.luo@amd.com>,
 Lee Jones <lee.jones@linaro.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd/amdgpu: cleanup the code style a bit
Date: Mon, 15 Nov 2021 04:09:06 -0800
Message-Id: <20211115120910.10318-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2PR04CA0059.apcprd04.prod.outlook.com (2603:1096:202:14::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 12:09:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90b01482-82d4-4fc9-0562-08d9a830c139
X-MS-TrafficTypeDiagnostic: PSAPR06MB4199:
X-Microsoft-Antispam-PRVS: <PSAPR06MB419926C60302B099F1161C0BDF989@PSAPR06MB4199.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmtXRv9yW6EqUpaXMf3pl5qM0xTJTbJxGN1b7ngQIwU0CABqdBZRjRGKwKTTAEfQ/hupLiHEwrxs2d0i1JlxrmqvKjFFBQKV64awnQNq7IlAWa0TiRZqM4ctg75loupHD5lsQsgU6X2jKXcbh4xb+5hhlZBgRAa8G+HzrdmdTIdObJzjvR+GK4SKwJSC2wwB8QJ5PQsci7oNQbE2m0AiCBLmdWYsyrKEGhMd43pdVjEFIw5bYiDZ/VCbwXWDiSc8oGsGRpbAOrrLD5D6a93dWu8EzX4MVDqAC4nfTlwwYfbdsvwNSz7ju38zn0ydejmYQ+9azUAZfSx6VRWcmLLkbXB96cFj1Lf1zNj3CxiX9mbgkxttmX3XsshfdoZ43+OUAxxaL2o+l/WmEn2SddCuGRNPBQ5kkUBxok//8swG0ILsTvtWBXh9si2RD0RsI9doLvW2/bAIzeWL5oGgwJXGf9rSxJuOVl0fj0I/oxpQbHyNBCTDORb5TlMv+Pi9udfA+EqN1on1nrC671ug0SzL7Y8cmfQMwmLMHRZeAmbonZ6cAFWKz3EKemqImX1WXC4EvS8NTVV/trgE3W1JCcGBXyCixQ4rsXXKRuw2zU9BPX5ln98R+QrHlmGq0q/FTfh6xMRftdV5iwVwVZr5ta1nlFm5lMGRfqrvNmT/9J6FZUtPEcUV+WuipTHr6nuLuBBxVaTc8Jn0WPWOecVQ24MJvDTGvfwyC/MUOVf88QSK96E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(508600001)(52116002)(66556008)(83380400001)(7416002)(66476007)(8936002)(36756003)(66946007)(6486002)(956004)(38350700002)(921005)(6512007)(38100700002)(6506007)(5660300002)(26005)(2906002)(6666004)(316002)(86362001)(186003)(8676002)(1076003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wawszkg05A9HJmNnoppocE7tK3gsZ7ZkdrpEZz57+zE7TL7evjnawIRSy6D6?=
 =?us-ascii?Q?eIC7m/UMkS7A7Ej7qE7piysPpuQ59gB65diRF3Z8yiZT4jJ75s+9BfmdQJWI?=
 =?us-ascii?Q?JK7nFSX31ItyKu9WQ5Lp8d1yPpndIzmRwC4ysCz3ZMXNfiM12eJoQs4qTUQJ?=
 =?us-ascii?Q?h+HYk6hPJWo8sWUpXYHuOeKK9m6j2QJeYVdGjeZPu6UstLiMkfc9AzLgm2KT?=
 =?us-ascii?Q?db6wYEiQMH272AZjhSd5iPAtSd53sfnANIr0OgrTfQigbpZRTKPHTEZQTJHa?=
 =?us-ascii?Q?dY8OVaJvcSE0jyVTn8oGuIjK4S6YyWWdd9lRy0vRssVoRGHkeWWTZuPbJWYT?=
 =?us-ascii?Q?8+FTsEgiO7WBhn4/3+WC4RMp65kZuoZdaFsATrYXtakqgVGkH89iNuTD01Ju?=
 =?us-ascii?Q?eK3PXX+P+WRC34SBcY/OrSoxRvj9TvSukRQdskWzEIxzBRcjGTppE/DBRPqz?=
 =?us-ascii?Q?C8NN+phGjsLiTE1UhfWXNh+IlcILuhVOPWGda8Kjl2JkrSRf7k7yvfkN/GwG?=
 =?us-ascii?Q?pmqfp6VCJpF2m1gyPxGXQKWKCDChpxCEzPm0O9UOlxyVB8glysNU0hI4l+4/?=
 =?us-ascii?Q?D42yt8ClPhDZc/6BIIfBoGEO+JKgrA5qp61GH7G0AvWZXaKQADofxEH2VBXM?=
 =?us-ascii?Q?DfTInp7Sb5N5IAwhCVDWEP4aJNyRH2+qcdztIierixiOY7/ofqAtoqNcdGyF?=
 =?us-ascii?Q?eliSl/EEPWQhA9DIr0W1DFVx40Hv+V/CoPu45577PqO34ePjMNylQQjyuM0V?=
 =?us-ascii?Q?7NsCldXD53umNSO1O1y1vQSeid5Mq5/KNZk/1YACCHbwQqi4+xfB2nlunn6V?=
 =?us-ascii?Q?3eWW8IjgSbCCde/n0mbSzNyLqCUNwMxq4eWcO2+WF85XJT9YeSDKxQ2cUBTM?=
 =?us-ascii?Q?6rcHhsY+p/iyWB/nNuaw5q6gye63Iks46gjUgG4nRxV2Orv2bvNVAKzGQaF4?=
 =?us-ascii?Q?7vVvqTahNYJ/P1yeTMnK3gX7mEsZiFf5M3fBgQJPmO/UBMS/fZPAt9rRq3Dl?=
 =?us-ascii?Q?JHaZjQVkmcxNpA3XW9Sbdqk84o5PG1YpKu8nZZ0NHm7tIwhWnK7Im0pZaIFE?=
 =?us-ascii?Q?zy6fApSzeSl9Bae8qPgeygJLsnBq14xsViPFRH8LNv7ziR2Q5kVezAsPSqiR?=
 =?us-ascii?Q?DU6Rp3e5ygoVRr1ytkwyqo5+OXr55HKDokx8gSexQVZn9xc6XNCLSsfq6/OU?=
 =?us-ascii?Q?2vdf8hAJ2xh6Ey3ds1QZyFi4Z6rdLkES/dX1E45pI10g55K1e4vJ3FEqE8Tv?=
 =?us-ascii?Q?E4nqq0vsYO1VHJEViNJxZnn5RgLDkxwkmJ1flLYeVLQsHzx2guzr4jh7CRwi?=
 =?us-ascii?Q?eJkTFUjsoGBbDuquTjLurFKFx36Zj48GnA4+3o13usmEjeNBug6BOjhLgBdi?=
 =?us-ascii?Q?7iiRABK1Pk7Lu9+vIR2N/2tMaC07hYQkbJDRu2VK2el0OEKEbo657NCtYtR4?=
 =?us-ascii?Q?Ugr/fsN2Nu8jJn7r6KfHTdGiq5t5WQv0IDaLbfq8rPxklYrvBavQ3EWZ5MQP?=
 =?us-ascii?Q?4kl976aQJ5wqUj+C1CcwBPTvbzdAR81a4qqcKmzOemrHeqs4TWx09DBbClPv?=
 =?us-ascii?Q?M+k9o/Ja6z+7HA+upYfx4lX8I2qZSGYvqyiCOfEl7BXzi2i4+8YT2oMzcU4L?=
 =?us-ascii?Q?FPzR0KDjWdl7tjWFal6oqsk=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b01482-82d4-4fc9-0562-08d9a830c139
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:09:20.5313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zcMYS9//lNa7Sc4FS+TmyCz84SUGBV3bxnLQDBbM27/Zha5INis+dSx4pJ2voXh7gEhO2XqiGBv6Znw7QOryA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4199
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

This change is to cleanup the code style a bit.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 04cf9b207e62..3fc49823f527 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -283,17 +283,15 @@ static int amdgpu_virt_init_ras_err_handler_data(struct amdgpu_device *adev)
 
 	*data = kmalloc(sizeof(struct amdgpu_virt_ras_err_handler_data), GFP_KERNEL);
 	if (!*data)
-		return -ENOMEM;
+		goto data_failure;
 
 	bps = kmalloc_array(align_space, sizeof((*data)->bps), GFP_KERNEL);
-	bps_bo = kmalloc_array(align_space, sizeof((*data)->bps_bo), GFP_KERNEL);
+	if (!bps)
+		goto bps_failure;
 
-	if (!bps || !bps_bo) {
-		kfree(bps);
-		kfree(bps_bo);
-		kfree(*data);
-		return -ENOMEM;
-	}
+	bps_bo = kmalloc_array(align_space, sizeof((*data)->bps_bo), GFP_KERNEL);
+	if (!bps_bo)
+		goto bps_bo_failure;
 
 	(*data)->bps = bps;
 	(*data)->bps_bo = bps_bo;
@@ -303,6 +301,13 @@ static int amdgpu_virt_init_ras_err_handler_data(struct amdgpu_device *adev)
 	virt->ras_init_done = true;
 
 	return 0;
+
+bps_bo_failure:
+	kfree(bps);
+bps_failure:
+	kfree(*data);
+data_failure:
+	return -ENOMEM;
 }
 
 static void amdgpu_virt_ras_release_bp(struct amdgpu_device *adev)
-- 
2.33.1

