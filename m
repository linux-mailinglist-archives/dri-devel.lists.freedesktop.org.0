Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82472C38C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F35F10E219;
	Mon, 12 Jun 2023 11:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::705])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D6210E206;
 Mon, 12 Jun 2023 11:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4upBKEgE8N+Zg3EubxxdoGCFwUTxCRdAIrAyA7yHulXL/ckrNl8VdZSV6kD2I5JfjHmAqiZhknuzC31D3JtPrralT0PTjnn49PSTMOzRFhqyvVXfRrOiwX/VKPXz5EQXewi3zeJJvH6ohdhEJnJrIwdctC4q+wd/O496s1fYvfxvQ42Cr1LmeuDft3JJGO19w4OLGnxk00uzcDN6Fauj96rpTQQXRjsLE6+CUHqXe6iThlkE3uY0244qPSwK/GXAmpQnDh9WYvZske6Fgyvl7gE7iQOLeo2xMge7cLGYwI4mqQj77/FAIHA7ITkhlSCSSYUxBdkSugIGNnEARCJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlUKyOggtSIaeAHVd7ZMPIfXcPXaRQ7R1DMi4Xu8CvI=;
 b=nPkv/KrSc85YFS5uQs7MeN7CvGFQswKsml/7fcDxApH/x699IprdxC4Z64E1WBgXgtZt/xp6PFc3yyfEa1WsFFOwRaoQh/CN+lTtY56YwHCCalowe/WTmevMTR+IzWXVqX1VWKQqI8VHkhT0R14P8dGd0z0cbUa9YEG/9uvBTRR+DqpTYQEw+GKexIWf1tPG4LaWfMyurt1GBHJD64IpYPO1nYJZ7P4TGjtcFMCE5LLN/otlmT7TsdfyMXDetWvLZARSim4d31sIDAQWVOMYi+61y/1s+n83AXFoTq/ftdZCznJMA0s0gQ0wjbrzXXNHDG0grO6eeHAsY3nrsxAAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlUKyOggtSIaeAHVd7ZMPIfXcPXaRQ7R1DMi4Xu8CvI=;
 b=VJoeMmKBCWD5nCZJ2oDokarrXEuOfujlTwU3cjqsCSuAF37TzWewCSV+xHM+r9+3U5eo1LYuBc2Gu17Ub9jTSe90VCnpi7+qRyxOKEjeAGdBWctUXYcUa7bSSbQUqmO+vc8R4SS+Vhh0Ls53pLUm2tP23a3BARWVvFCtb3KcfJpgJcMeOlDS/HNAXzsVizyzYKUCOm1mNUPgedhafmiA73z88GNkD7O9X+zpAWP2JVcCj+WO+OGuG12Besbp0aef92RFvZYzK0WYznIZqiYrMCeD6X1EQiEH9ibwLqD0Uo+it80LiNyoPq2WoZ9z0gsUH7yjGBKXZrDog20x8z9o0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by SG2PR06MB5129.apcprd06.prod.outlook.com (2603:1096:4:1cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 11:58:59 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 11:58:59 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD KFD),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] gpu: drm/amd: Remove the redundant null pointer check in
 list_for_each_entry() loops
Date: Mon, 12 Jun 2023 19:58:48 +0800
Message-Id: <20230612115848.8739-1-luhongfei@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::20) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6697:EE_|SG2PR06MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: df9f21f8-187b-4910-74cb-08db6b3c67f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /aiJVAQhc6dJAVMXcOPM3bcVsXW2iX1nEm1N+6l1BTboHObGiNjRpOhKPuBM+0I6r0a/mUVPBzRPhwAdI+1YrqTi/JgUMJIqJD+iNPOFr7UXZB79ysiL5FGOa1pGnufwlJzJLe7gBy5BvMrVHbcY4HIPEHSVe1clYP53NfKdZk1P0u5D2IK09jtbNqf89zj6sRyB/SdKDup9yAiafOcWICppDlW3dv7r2fZx4s80A1zU60nul4TSd1/ISTxSAni/GfKMBUT7hpyY1E4ZaY/5mNgco9tqBnaRfKxgIodyzWz7x5EgZIKV+GAwSK6JDUcBeOHTSny4E3zqmHeUO0sDA7LwrocKbzO735b77sx/gFTeBV9kds1s8rEFkxmEaT4wottvauiYJspq3EwsdsFQO01zkTYjj+6UtL5WjGygiLkmxz7svPdz7IGWC6KcwwOt8j01nrB1XD6ekReB+FAmVRpKRDI4xrZhcGE0Cxm+A+++AECy8Ox+SymtUXeI7+D83/DalvwCYzeHbkFr30UxycubHGUt2//rokD/fCd4DewvCwi/j7vZAxawRGYAQgSJKQGJmc84UM8R25h/4qxn/68HuCt+GfvJANeoUYIw//k0IWNPQEGapgHfRV5P639M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6697.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(83380400001)(2906002)(2616005)(36756003)(86362001)(38350700002)(38100700002)(921005)(6486002)(316002)(52116002)(41300700001)(5660300002)(6666004)(107886003)(110136005)(8936002)(8676002)(478600001)(66476007)(4326008)(66946007)(26005)(1076003)(6512007)(66556008)(6506007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zeJl8jHf+lau8aBsrV13Zr5C+/PL4oJMzh+l3OlOCSOk1K3r2WdAWA0eylUO?=
 =?us-ascii?Q?5syKp+NMf8DdaudFzZJh7u9W9rD/xpZihKzIi6e451QD8Wa3JoKrNksDcnjT?=
 =?us-ascii?Q?RLyV7EwDv/VTGLtULdOgkZRFHx4QAo7oo+tO+C0qKqip8ggFPx1bnSl1Zhqa?=
 =?us-ascii?Q?AwAf2gNvWNko2lvS3/HZCzgE9OvZR/Dyi7mCp7X/HIY19TRmW9vPMHcJSupC?=
 =?us-ascii?Q?ivLHkaRzVpjPllGM6KlVlOS4qeJNu0Mfol7HStPGLCr9hS8A3GWhUS6MiUmW?=
 =?us-ascii?Q?Acd696k3Wd8RtwHthLoRQKPYqq7WKSFWrTLxI61WH3+/Gwz9N+p4y8zqTKvF?=
 =?us-ascii?Q?sQTBE7ZilTi3iFz26u58MGrkYMykU9Rtpycoquz788gYVMfmoaomMo+XF7+a?=
 =?us-ascii?Q?plcV9b/O+Gv8WIlHpFSnGGPYQzGrfTM0l4M45vPO9oJcVZYfU2/mF0oWEX9a?=
 =?us-ascii?Q?0ftusXohK0N89qcz1ZDbTy+jbuHl96sv9PqgDKPoK2KigHZdhzGhfLn6t0iR?=
 =?us-ascii?Q?20q//Ahbc/DhV4FhckHH0c2R7KaK82rgM7FyvQwHTY0cYe2aaSLP/5HiztUv?=
 =?us-ascii?Q?q41A5BQDWsUNePFVwv3aOdog5slYg7uPsuNtpqmSYeOgczyjdalInfdAomw6?=
 =?us-ascii?Q?hpFVx+UvUkoIb6KZIVAp1VGC6qzMREbnwhYlS719k0ggFqSWLHL/f0fPsOFq?=
 =?us-ascii?Q?V8Z9vcYfa3AkE1urhBoVQ8oo0F6G5Fze5X8x+n0zg8oO37PoCu6DS0SrYCzA?=
 =?us-ascii?Q?GJGaXnPIzNi1RkCVb0FS6HOhTwM0Z51WaKJ41s3FVfNLU+c7zvHr+IlwIKTe?=
 =?us-ascii?Q?bdHdZyc2B2MGdqbOeI22ipPHPSSH5otAGAIfiZIVuoAjenH8fJobe7fjNIao?=
 =?us-ascii?Q?Bdz1qzmlt3LAPXb1bNW5SNV6OfgMFgraxMreXMRE1UXj1hyMS0s/mftGB5OB?=
 =?us-ascii?Q?NdHwZsiaEcT9AHcwzcjELIVU59dYVQHvIfgQBD5sDmH6KsJyWMqQNwdJT4x7?=
 =?us-ascii?Q?aGRaf4tLGz3sn0xm57ahprFzznHD55YxrC5n+JpHPb3p/BhIwEaXjQJGr2cG?=
 =?us-ascii?Q?FKn+xYlmV90TLYOUW4aGWxifOpTi2VP0M3X/tZ3tDFwG3LX9zh9d8AZ5hu8e?=
 =?us-ascii?Q?xGxRDIalHq3mzby0p2in4r8a+S+qrdf1vOp33D9e12kkyrO3pTWwjrqrBrbc?=
 =?us-ascii?Q?R6CTjbV9CKLBnxQS35VD6lj8/6V4QnKV3Dnn7hUG3dlAM+LwE7dxfhGonjDr?=
 =?us-ascii?Q?dliDAqaSetWLjo5E3AZ2AMKs5HCIrsee8q5LjWtpX+9xNw/uY9IRSQvj1qnc?=
 =?us-ascii?Q?S6/gVtPgWMLZglVoiLkmmoNo9Ctfb5yOqQ7/FSvoxRLaBrK5p2dN9Igspvqc?=
 =?us-ascii?Q?UfVYw9hJ3p4k1aX2sTJvUnASHqnM1OpOK0ZTReMmIPzjv/uzvPt0jO3jjHaV?=
 =?us-ascii?Q?W3JE/Mjbtjidqx6G9VbGeLnjHBC10axeqN3RLwIHqQXD8PF9bIFDD4rtuZaB?=
 =?us-ascii?Q?7BIZQC0sGA3fW5lKipQKwazr6F2hXizoFRpcVmTy4CMK9XKCm1nvQwWGr1Xz?=
 =?us-ascii?Q?VldfhscljPCcdLcaUaMbGqLOPrqEDqC664D1mM6O?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9f21f8-187b-4910-74cb-08db6b3c67f5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:58:59.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2eyIV1FkFlw+9jW2Dd47KnPki/InRjecMNA52Qhk6RUFDblDB9OE8Wvi4KAf3xAi2Hk19jmzZTOZc/a0Afflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5129
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
Cc: opensource.kernel@vivo.com, luhongfei@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pqn bound in list_for_each_entry loop will not be null, so there is
no need to check whether pqn is NULL or not.
Thus remove a redundant null pointer check.

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
---
The filename of the previous version was:
0001-gpu-drm-amd-Fix-the-bug-in-list_for_each_entry-loops.patch

The modifications made compared to the previous version are as follows:
1. Modified the patch title
2. "Thus remove a redundant null pointer check." is used instead of
   "We could remove this check."

 drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index cd34e7aaead4..10d0cef844f0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -1097,9 +1097,6 @@ void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 
 	pqm = &target->pqm;
 	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
-		if (!pqn)
-			continue;
-
 		found_mask |= pqn->q->properties.exception_status;
 	}
 
-- 
2.39.0

