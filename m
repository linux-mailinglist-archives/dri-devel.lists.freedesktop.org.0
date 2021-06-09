Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091E3A1672
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 16:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E3B6E3F2;
	Wed,  9 Jun 2021 14:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F04D6E3F4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 14:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOfHF//d4V/Kuy23zdlzSn1+BO3i6PHOIVfqWzSHuDhVrQHuGXcVB7cdaB0MXzzK/RPDsDB7E3fj7EeSf4XjiLjdYR6i3jUXMZhr5XYgMqLB2aSMUCJNni5UnTB9mzCoguVI3rJ25t8x8EGUWfmdVa5Bi7NTToB+62W/4KZEMkoro6DuIIHne0ImJrJdmrpns8faWy3y8Ox5SQLSNlV6XhNJIzmWF1AplPFC695FpjsdYUWuH33KfBtKkb5bQNh/43VUeXk+qlNg2SIfiof0ULPIYr8feJC4WcRsB/+RHt0jbgF1aQsViesjixRLwp5QyxBEt4uYBmX572aCan5Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuT0/rF8MgwP/pvy4QkN3prUxcs61FTEs674CgbctHI=;
 b=aHUm7drdXTnDQ62uaHXYlSUDAeBeRUaHdihN22yuhKYHrxAxlT5vU5qqnw+YOj7AHsOFtdLsvWxarYawkMNwF+itrahUZ1uhgcCVlhBFK142OiTIV06DSB9FVMQCiFYuu/WAsUwRQ7UI6YUrMKYL5AV6aMtcbYiltsjqnrbSdAFE3RR93e9LkIYvIIrEwDG8fk4u94845I+8oP56vSzGpHj8xVZFuGjb5O3+M4h+SoTgXLk5alcIE81X6EGV1BPNjsB9j3ZJoymSncpRCCRfJd8HCBf1RbWiBAWgTPjK5WjV9z4Agej66cGPTjWM+7na1kcjiYGUmWn2Pl2tyQOcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuT0/rF8MgwP/pvy4QkN3prUxcs61FTEs674CgbctHI=;
 b=XXv7jlmXKr+TahaIEhz2sLVd5BKNdPqQRVWd3x67IQaPyyOVpHKtM/urSNrz4gkO4YVG9svVPADp2QqYLrpZmJOihWwleBQaHBp4fN5rcqmVEKTaK3to5+iZ/lGgwN7G59w/rnwwKmPuqluHpmrz3oxYsnZNDj8sMya8AZitk2Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5134.namprd12.prod.outlook.com (2603:10b6:5:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 14:02:56 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Wed, 9 Jun 2021
 14:02:54 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/radeon: fix a null-ptr-deref error
Date: Wed,  9 Jun 2021 16:02:38 +0200
Message-Id: <20210609140238.5393-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [217.86.101.175]
X-ClientProxiedBy: AM0PR04CA0078.eurprd04.prod.outlook.com
 (2603:10a6:208:be::19) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.101.175) by
 AM0PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:208:be::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 14:02:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 611aee18-ee7d-430c-efc1-08d92b4f46d3
X-MS-TrafficTypeDiagnostic: DM4PR12MB5134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB51348ABAFF5C09D22994C55B8B369@DM4PR12MB5134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FKvE7ZCFuVpy6vP5l34OSEZZMRX5t1dvpShhHIQdmJfNLbwflZSrHeRULXjit6zc/5TxwsEod1R4OEvdc0tkKZxyABALCMroH/FKPGYABdHWnTTfeTU9ij/WGnEvtdl4FKFyr6i6sL4zg0PMB5/+0m+r0lRFYmlDxOt3bftkkofU7OfdGiufOuv0k1/j/JT51ChvyWSBp+j4V2rIW12JcSbbwJq7LLu63WZycgqqAOVJBf4IG+WvAeJQeEVrPSQIa6q+Y5ReahxDZIb0SghNS11fUbgHnBrQKbqiNQXQwCsXhDJ56gO9P013UDnW0tJ80qZWsovoRg9KJVCU48ghLrDSevRe+u4koG57mlSNrPcZ98suiBt7AA/rQ9DwywzfBNGtpGJ0LRGCS7XDuxjzNXEj1xYVXu9HOdyAwIBBx9QMgnSK/sONf/Rv5AXkK64NacHYZPxf3EUCyifKF5a5X6aTHe9As/H3HT2PHTQmG06iLZJcPH19CPR+5xvbp+pJS7hZ4HmPbAAVaxag7xzmlIYRxin9NOhfCz5+Kx4uT4t9KNgvS4R2Sc22D8CPTGzQvSIW0l5OKKt6KRhOAb+N4QuovYcmCTL7PgsWJGqFz3M25DwIeGVV2k07KApTJWcLsDAnV+eeQcMd3SvQwdvzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(16526019)(186003)(6512007)(6486002)(316002)(2906002)(44832011)(52116002)(2616005)(83380400001)(6506007)(38350700002)(26005)(38100700002)(6916009)(4326008)(4744005)(66946007)(66556008)(66476007)(478600001)(36756003)(1076003)(6666004)(5660300002)(956004)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CYAmgKzmEWgQMNutIfPu39Gh6h6oaUVHvSU5sFpFMqEFuGTx3UlHgXUBxnIk?=
 =?us-ascii?Q?O5oWKf46J9EbXzbU8td5JEhl8VlAjv17W6BB212jjajoUk3SytN0/2rcKmQ+?=
 =?us-ascii?Q?1kAatQbz66GG7r83KAAwyttcXXV94DgMLeZAcYbU9TU3jJxXPUQ2SEKFrDBx?=
 =?us-ascii?Q?dqQ+fKgxZmA/7s/o3Us5GEocxw7Gyai8h1ENOw2BG6diaDEnonvr3hdOp3+a?=
 =?us-ascii?Q?AgQ8pTx6i3RHHseRS+RLawjAWv2EGwQWLPMk3PWH8p1ADdtxJf9dXO1vaT10?=
 =?us-ascii?Q?csuCJFtLelFACiurWoZfRhygMys03WYL+Cyd4bhIzTNxJ41m4w1u/XiviPuQ?=
 =?us-ascii?Q?FdK8+vqRRZDH/FX0PhT3zXNpBSHT3PJCdnqUqdAa+rxN4B2+mz3Z5hGY5R8H?=
 =?us-ascii?Q?Hv4LZfDUoPKJOprKw6wfXGbEkXQOW/BoqX4iSCH/zD2FbTWSWp2BX5z+xreg?=
 =?us-ascii?Q?NSQ2xQhrsxYeAg6IKS/tXiOxCX0Yg5WS7t4FMZkByytWtbu8Bo9+0vLkg8Cf?=
 =?us-ascii?Q?YbsvD0rBWjvOTj7L+z+YBpnakOpnMF0osa7plJNhOcn4o9x2Q+Mxh34VSXzX?=
 =?us-ascii?Q?ctwNSold/s2/2r8zz+liXD16uNEUvofa09yqM1sHxQoQnJpSFkjiHjJAie4/?=
 =?us-ascii?Q?43YJ2LWde7BKEgqBSNU1nL6VCJNMcAw4OsLHntBD/cwZatWV2YWg8hEyMFP9?=
 =?us-ascii?Q?9GBjhngFMKkSM78ITUi5Rp6fPGXHRM1TBpQy7oBdD925rABPAgTqGqKqGD88?=
 =?us-ascii?Q?ZiTveedK8u0pyA4FXvDAXX8xIsFpU3OiqnHjwTjtN8Fk5B9k+AyWxwrP1YTn?=
 =?us-ascii?Q?SqhTXavr13WQR/PlZc+6OEfEiE0O0z7O8JnfIFPHbb3xX4j631jOwO+Tordg?=
 =?us-ascii?Q?3CREYzumtuKX78ZpUCbas5LaTWFs0mWFLehYn+pNYJZcZJgvcW4ZwukfZXas?=
 =?us-ascii?Q?swk4t4wXSzjiznqfmIDa0ZVIPvZbSm4QHtL+Ha62G+TRCmrw9Ivmy6uVkbdJ?=
 =?us-ascii?Q?mpgV37b5Vt3Ad4IrRygNcw6lBydCnImjvXXCI36kzlvRRi+BcgAlIfCRwr++?=
 =?us-ascii?Q?mqxFfMfyAJH+nPVGCv2J3nKcnBX77EaBKEQDZjEmcOgI5C7Z/FvEqmWPtWHf?=
 =?us-ascii?Q?TBYYlvQQO0gNtSetg4Um467hH30Woffm6KKSvz5mElGI54Voqxa/23kZCsXX?=
 =?us-ascii?Q?jdC3P2SrNQgl8UdOqpfcJrD050U1EFttaUeJOfz35mxlw6zjjC2RCDR0Q7IX?=
 =?us-ascii?Q?s6GCONR3cmX6rmyPvlJr5t3uvOWNYZsRPc5yjZ+z761HT3F6XgeuAz86ZxH4?=
 =?us-ascii?Q?heiLHdaSDmSeDh/m/MBCCMKc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611aee18-ee7d-430c-efc1-08d92b4f46d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 14:02:54.3547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X01wQopXlCqC+c67PPxRshRGN5WfSsubKF7zV6sTk6TaNMwT4pkFUdxidxv1JoSr4mD98cfEF6gfJnwfv6JV5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5134
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
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 Nirmoy Das <nirmoy.das@amd.com>, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check for NULL value in ttm resource before passing.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index bfaaa3c969a3..6e01eef169b7 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -76,7 +76,8 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 
 	bo = container_of(tbo, struct radeon_bo, tbo);
 
-	radeon_update_memory_usage(bo, bo->tbo.resource->mem_type, -1);
+	if (bo->tbo.resource)
+		radeon_update_memory_usage(bo, bo->tbo.resource->mem_type, -1);
 
 	mutex_lock(&bo->rdev->gem.mutex);
 	list_del_init(&bo->list);
-- 
2.31.1

