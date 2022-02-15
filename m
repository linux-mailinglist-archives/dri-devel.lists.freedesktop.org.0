Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB234B6090
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9628C10E3DB;
	Tue, 15 Feb 2022 01:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2109.outbound.protection.outlook.com [40.107.215.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4537310E3DB;
 Tue, 15 Feb 2022 01:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOEsEjMnZUdHIVJozAC9HEAL892/IpiZs78f5TEX/db3+4sFfvZVFd/Soddb9zaURSO4IvCp/fypiKVrWaK2wyshrNf+dBSLQbK+GqHYC3lhocj+EihstlMne7BBagjGXFFJSZYBdq45hP2NUfgN2+pMt38agVJW1N2rXTGZ0GY3hdyqNMdAj5IgJcVSr8eyPgv4YrtyVyBurWsn6m+5i7o70nUMNYuSkTUiyJW0lJto335bVC6paGijeIkskyAceLd7KiAvo3ff8AqOOPHT0+//Mp2NFzTw+dDeo4onHyfXe8nr5RyQgmWamuzhDv/HG3nRuTp2+bjTOEsA43e3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEgS2l7JwvLEYxVw0xhJ0CQANs4fwijmiVoB0ViRTJI=;
 b=g+vuSdnGqz1g2QGukRYlia5hP2fYu7GZ8Ok1OeJFGqlEumsFGDTUEdtoJyBxMC0QmCa3JkDV7LxxNSaUksLhl2ubaLJ1X5b/qe6k4f1tvPrg8TLvdhPWjJ0KdKDaiMtFvh4EHut5igPkt02u+UuPozSSrrVkCnbmX+VUcFP3vzFMVRwx44bl3eCRFc1OaFIMhscvmUb6GMfe8RUwaLbjSKXELFA9uw52wSwaqOrBzQbU7ZzzxsBnfLRmdapj013z0b5bXDxj2Rl5mvr8tfFguzjL2K3EDJpEbBI73/GyczW8hMAoEZWLrerTJHQOaXYSGXy9Td88an4AhKec7/ZTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEgS2l7JwvLEYxVw0xhJ0CQANs4fwijmiVoB0ViRTJI=;
 b=PxOzwk0DixU0eXeynXLjhUuBUERUNqNnUBRi2xvq2TV2w5N84S6TmD4Gb/Fno5HTqLMO4Xn3Rk5uUZRsDw5gv8+vNOcdEJvcIHa4Y3ndpOEHRDFnwwAV8Pt1T4LQlx4/bYf/pgcxOt9xMIAfmMSjQe6xyjCl9yEeC+p1UHZBam8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SG2PR06MB5240.apcprd06.prod.outlook.com (2603:1096:4:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 01:59:40 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:59:40 +0000
From: Qing Wang <wangqing@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] amdgpu: assign adev after null check
Date: Mon, 14 Feb 2022 17:59:21 -0800
Message-Id: <1644890361-65071-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::20) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33efb96c-39b3-4e48-413e-08d9f026d3bf
X-MS-TrafficTypeDiagnostic: SG2PR06MB5240:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB52403DEF16547A00435FE1B1BD349@SG2PR06MB5240.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mwyb7IC2tPOXkXuWftZFRcsm0PK5gygtlh4L7U0EyFQpUVUh/W/y9NSfWuztG05bwS6ervdC8yjsthHH/yGgZC11yXoV9V+TD6ot4hgUK9cpjYcIRACVQKClVnODsD0ai5F/Lmw6nDC0aYHXQR3HX3HfPz18S4rQRKByYSNkUlIPaA6Apz1tAbJKWJiXjKdbCAt92oTuS9XuF+vSIQ+45iDv4USH219+tDVoERR4TU8Ian6Fg9qT8ed/hzt1eAFdtSjh74hyIZrD+wVloHgqHInSrFbRjBbhzppPNyoFXOSRWG/V+YZ1dZKB949OYpJvSuRQGh02n26NSrp88819AR6+Wx+v0ekeexr712ZjJHz7kakamo+SOpT6uiyA+V39Z1WAB8JjG5YlEiJAwqkmsRjYc/Gw72MObjK61aosk78gpIY56CVfe/5o6t/fqL1Kh5eIAgViU5rls1iwWXiMu/KBpOcF36qLLENiwtQWuM9G9m8m5IdL30Bsyhjw1bw5VRb/NhlQSZszqpft17Pum8OfQda8dgU+61ebgBlmnjTLxcCiGNDK0Yg9y2nerM//GbdmwzYeh2qcHcCw57w266Oy0luUTVLYfzgNqYzkfOjSzfaTsJd2j+TFkOdJmgVlpLN78/+ZbpfuCw4ZNzvBqDCP6wwSh3pUTMP40BX8iYZ+2z4Qj8oP9ERvdDkntQVmFQMZWy/EW754aOaVMKP0TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(36756003)(66946007)(38100700002)(316002)(2616005)(6486002)(66476007)(4326008)(66556008)(107886003)(186003)(26005)(6666004)(8676002)(2906002)(6512007)(86362001)(110136005)(508600001)(5660300002)(8936002)(83380400001)(52116002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fFHBWhIPFbckyobrPcevvMI15p8tuQKf++rjKnHfVcAZ13t6i1SGBykNL2I+?=
 =?us-ascii?Q?gon4+9Gh8kV3j2A1FOPFxt/dhTZZDOS9DktamzpNCLEKAPRupoiWzHYdng0Y?=
 =?us-ascii?Q?I03yDkGhqSaYom0aQgrQT3+biRrSDIlQ16+kv9fvNdNIvOkIlW8bQASyODwu?=
 =?us-ascii?Q?AFLh4tlgm48yL0HcGHPR/X4WaeFb8hzTihgAio5ZgkWAWc7AdGFX2SAyTOzi?=
 =?us-ascii?Q?n5Gh6Zm2jh+xcSlbCT5oeKGhepuQ7FwAiSDhFOXa8c/8uVi/SvcKs/mSZRHj?=
 =?us-ascii?Q?JDAheEBl39JRkCaLh5BwrvdOBOVGfe25psaYdcfAYPTD589sKjGhtcjidMiP?=
 =?us-ascii?Q?jMTEJXIDizRFGi00mwENTG518HPWX97yts9WujkO+ksNMpTnIjtp1ente9H/?=
 =?us-ascii?Q?5rC4dqr6P2xms66t1fs5FSLPaskmNEql6xBN4iAB8vevj7DOYfCJfaN0N0a0?=
 =?us-ascii?Q?NaiukAFbZgO+Tz4yEehQXHrpDvKDoxHx2kEJzVx92uICh3m+VJreYuu3ukHq?=
 =?us-ascii?Q?qfUkgpSt/bk2fzii9Ig9ybaNE3hK1fkQvgRWtvrskurvNTSImfpYcC6Q20No?=
 =?us-ascii?Q?gF8gzvsyeaGu95AEvdrmjQvgCaueBO9QGRTvYx8gRiMFbIldaumB66HAGXD0?=
 =?us-ascii?Q?tGTqjXDlkFOhBXR0EijJf+KojBdK0jQ2qbA38lbYm9i015wOrBsz9hyUedqk?=
 =?us-ascii?Q?kOGbHALgzWEgk/G+8xZozVoOPVj98lPMkIE5bUt5JFzuvQx1eheFfm/y2zXA?=
 =?us-ascii?Q?TVBFWaABN3kGVQDdJ5zyuNFhP65Pl4yTGIaUZ0t1pUmNGOcNQgx7IQUUYS1M?=
 =?us-ascii?Q?WyWLdHDVwoSAGn53BMQQmg6vU9Dbg8xOBu9vgXejLhgFV4OswbTLDrU60fC6?=
 =?us-ascii?Q?1+YbY40m0Zmpcbs+CLBvaODf4HXawVgsRRILgUI1qkjg5nYCT1VZ+xtLkBwW?=
 =?us-ascii?Q?o3iQObWbkGwM4PIb0sEx4M+BSTSn7ZCBRcQP7f2HNzbGoMkT9YQk+DcKFgJV?=
 =?us-ascii?Q?BiseV10l6UsQS7EJC1I/vy4+0+AwCR84jpKzg3EzwDXhdkVddugCpiDRZFza?=
 =?us-ascii?Q?HRrL3kL1p/rLMhu3X9nacxg4JFOqwqyZKJOD2B6ky0o5HR8eGAJndZojBirl?=
 =?us-ascii?Q?vZ0ZJwBjiyB/i3dTpYggpDbdFqyb8t0LxDY0X/7niYnD9IFZbXAXGoLlvrDw?=
 =?us-ascii?Q?fyXov5QI68KuAMprh5Udo1PKvKmb+vXuVUbEM7uS9Rn3rZuqjAhcxQY0OSDW?=
 =?us-ascii?Q?7wVs+fh1dylkTUmuMcwTj8kXYoakV8/YYigippX3cJ/GXCApfKXnVy7UNhSA?=
 =?us-ascii?Q?Yh5enOzknKq++UlWC/am+h/4xnuNQjxSZpUj0OE30zbWhQPJjKYfdwagljp4?=
 =?us-ascii?Q?pflgQUpN4Xsj9zwQ9CGoBDgOivV11diD4orLtHOJnmS1q5FIftwYzF7PDx9B?=
 =?us-ascii?Q?sBE8Dv0Ah7pM+wje9S4WSw6VWhla3ApOhBrylqAWqPUPv/3toEmkfa06n/w8?=
 =?us-ascii?Q?xOPLkHLl9oQmr0j8Qb39iKyQifxWH+tJXwaXWYgXlqH72mPPAjjnboAPfZpz?=
 =?us-ascii?Q?ezHk+b+9z1aaEUwmUHUSPIE0a+gM0FK24P0st8Eg0MJ/AYfDcFlEnH5dXtuR?=
 =?us-ascii?Q?93NixRACXCWEGvBjhDG6JKI=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33efb96c-39b3-4e48-413e-08d9f026d3bf
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:59:40.2992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl9el+svImp7Ta6odRpLkKDhZK3HlnkVmjRvExjrO9dhQ7M1qe0LNxvfLW4jcuS/cfLlBRyeR0HjjpVJ54lsvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5240
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

adev should be assigned after a null check

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 2c929fa..da114f7
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -259,12 +259,13 @@ static void amdgpu_ctx_fini_entity(struct amdgpu_ctx_entity *entity)
 static int amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,
 					u32 *stable_pstate)
 {
-	struct amdgpu_device *adev = ctx->adev;
+	struct amdgpu_device *adev;
 	enum amd_dpm_forced_level current_level;
 
 	if (!ctx)
 		return -EINVAL;
 
+	adev = ctx->adev;
 	current_level = amdgpu_dpm_get_performance_level(adev);
 
 	switch (current_level) {
@@ -290,13 +291,14 @@ static int amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,
 static int amdgpu_ctx_set_stable_pstate(struct amdgpu_ctx *ctx,
 					u32 stable_pstate)
 {
-	struct amdgpu_device *adev = ctx->adev;
+	struct amdgpu_device *adev;
 	enum amd_dpm_forced_level level;
 	int r;
 
 	if (!ctx)
 		return -EINVAL;
 
+	adev = ctx->adev;
 	mutex_lock(&adev->pm.stable_pstate_ctx_lock);
 	if (adev->pm.stable_pstate_ctx && adev->pm.stable_pstate_ctx != ctx) {
 		r = -EBUSY;
-- 
2.7.4

