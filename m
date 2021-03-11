Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B1336AB1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 04:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987C16EA79;
	Thu, 11 Mar 2021 03:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5C36E49A;
 Thu, 11 Mar 2021 03:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQVdqbFmvuxOSuwTsgmjRuw2dIOvWntXKSaAsTM2V+qiEEuo7j9EReVXD2JsAPuiiobKz2dCW+NDQt4VST28ekz7XZUiUtOl68HRefDGK3d/oD/y4PZrWuOcOqwBjV194G3NEASmGfw7DLIkNYeITWJQOUAQvUSYsJYj8YSzl1vrkL5rQYQv0oc8Os+IBOq3SVWvJwa9gr8WYHNGGfgOR4fz1+rtOKIJPuO79SfuF58oC62oyGZcIVhfWthq3X5iiTsZASAXwhe+1CFx7ckmhaYacWEx4x7VpzWywLZLJlD2ix44HW8jgyUHXUAmr17Bh467eyldlFsh9ay9YUd/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyrCNjmtxX5ClRE1dbTLlbII8uRvwy+zRwQNzK57SZU=;
 b=Q16x9GRJN+iQZ9hq045JJ/BBt+E995OxK50DoC9unDcAeVsE4yFoOZh77uKgTfn/sx3ib+R0ZXah0NFEzjE7s9S8DYjh8FF+1yx7dQG/EzPS/j6IilOKiiSw08s1XwJP1520eEC724NPhuJlL6C6Lj1PnkI3PBjQ92mxnleZJ7R9pptkes117fKPzgr/UNaQMls+8rnE5FuUTWMq1QUnYPfkV9SkvtGfq4L9ZDDb1vfw8WAkhR13HAT3k8pJ+adw+pru+GQXaGbZ4+WGenByzKNukK4AZPmHZMkB7J0YssdSgddOL/G0oKQRQFIkAnMm7JMxhNDZbyvCMnDLrYP2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyrCNjmtxX5ClRE1dbTLlbII8uRvwy+zRwQNzK57SZU=;
 b=GbDDFKA7t70512Ho1EbwkNJyf8NUWAiqaFXJHe2RcktARdw7spXex6q1zoGVSE+ydEEmSs6xhh1asCF96DjzIaMn1K7rB/c0efihFvH2uUmeW2gu90bzpTda3VJDQDKHmT8sJ7v4jJb1pjCwrzW3RPzrv++6YUkxi9xV11tZqmU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM6PR12MB3436.namprd12.prod.outlook.com (2603:10b6:5:11b::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.27; Thu, 11 Mar 2021 03:29:12 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.041; Thu, 11 Mar 2021
 03:29:12 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: fix compile error on architecture s390
Date: Wed, 10 Mar 2021 21:29:03 -0600
Message-Id: <1615433344-16267-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To DM6PR12MB4732.namprd12.prod.outlook.com
 (2603:10b6:5:32::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.26 via Frontend
 Transport; Thu, 11 Mar 2021 03:29:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7bcd0ac-d1a1-4f28-739a-08d8e43dd6dd
X-MS-TrafficTypeDiagnostic: DM6PR12MB3436:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3436B06A06AD76A0CDCAF27780909@DM6PR12MB3436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: liKi8H5AmRL4zF3x0MEfXXtHl2213LG+1u5sWEYPv7kU0PzZhaLwdSZow0f516ZQx3fx6fPz9cQzNzwlCfvzSAvUhQIHi/A7uL4T+TtMJYYQWKo3HvAYa7C95y/sEOkOUScLPSOPowLZSEWzJIM1JTtfH9HRUmrI4Q8sqZ2AUB69Vgden78lYms8TBUCx9XkgcVZ/c8kRD97n+K9qhnEwOLm1vyhoRYBlMjmN2SFeluJLXuWT8yN/dRx+2ftFWMHVOyyNFL4qN+njtiM1Uq4e8pKhlt6Ej3PMMGKX+pgwBmJ7osg7JIVB3bCeTfatB4bB3a8D3+nvWUOigTrgw2h6kdN9i9nB8CxUGbiTFf8E09ULeKP1OqZZ1pYtRO00qEXtKZHW/q2xwqgo0lobDTpIUcoRZ+07zPFyg7eBSdbD5/oQrjPG3GXgGXcA0qDc7E8INwF5gFoivMo9pPQwN9oqG0+T+PFhKEMdrY0P7v9WrY+q4fhaMAiy9VzFxdkGS+YgJzGboTzdKVH/0wb1zuCzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(450100002)(16526019)(316002)(186003)(8936002)(5660300002)(2906002)(4744005)(6486002)(83380400001)(7696005)(52116002)(86362001)(26005)(478600001)(66946007)(66476007)(66556008)(36756003)(6666004)(4326008)(956004)(2616005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jSWJx26N5H20mpvJwQu1CtK9Bnw3MKLreAK4/+mYuTPKmjJuDeUTGLtgtWN+?=
 =?us-ascii?Q?TQWAL8pi0m7DEfG3DARz89tLFyLx0Khm0qiV1V0oQ3wx0ZqHTh8fFnTgihEl?=
 =?us-ascii?Q?maWz7kB8JIp7HI9lynonRW8tVmzwLS3o4akTF70BGI1pWMwffM/O6GJF3sZv?=
 =?us-ascii?Q?m9XxEZttkfR8N2hl3FHrM4CUxSMmvQ9LVoj8KTSjMUQivJKvH6A73E+pfCpN?=
 =?us-ascii?Q?tvowseAuUCbXbPT0XUEhTZmADVX4G+Q7a7BIK8nbN7FM3dz00witbqna/AjJ?=
 =?us-ascii?Q?DgG6xwe1LQLJOU9CnEDs0EXIjT34e+JGcRQXWwxxbRXAUcmq+thEThH5yC64?=
 =?us-ascii?Q?acz4VUqLRy1S/z3/5wUSTycp8k2UZKL5RVR95iy52jlXJqgfY4pH4imV+2zj?=
 =?us-ascii?Q?XCwP+BLxqYFhmwBQ4qO36i1rryjw6Fq8EOKGYaoGNBfv1sD8KIe29kyihlrP?=
 =?us-ascii?Q?CFa9AAcRGnG6JAdkARv7UMMOkmqCE07EyCAZ75p4Es3kSDNDoupjMdL81dCN?=
 =?us-ascii?Q?o3jN7dQc0aWBXTChMr8znvMhuAWajYJ0m9kb9K3lsgsKBfRZDLsOGa8drWk0?=
 =?us-ascii?Q?NzMZFtyFWvNW06XbvGIujZQPdIrlNxJjpgYiGn/vPDn2PRXwWIlVqw0o8CG5?=
 =?us-ascii?Q?lkflG3j4p6F65KxsmY+NOBlU92UOqmfPdJlwxUMd5yk3xbOdTqi27kfhvDC7?=
 =?us-ascii?Q?RU6vC/STwMIgXzQ5e+hT0IL0R4ZmwyITAwJiOJe9NG7YAbtJoDteG4yoh5gK?=
 =?us-ascii?Q?eKsGPAbMmUCnvUGje+RfoR1xt6hYSX0teLX5UgOxTnnh9QmmMeMKf1L03/k8?=
 =?us-ascii?Q?4trxdovheR7+SB5U15mso8tkb2keKnwQ5+zWZKJGAeh402SHmKmOgno+PAQ6?=
 =?us-ascii?Q?LNYF6IAzL05bsENGUpwZWgWQKLOovqBykxvUmXFLP3kf8WlDygtxMU/ztYce?=
 =?us-ascii?Q?ZJXd+SSJkQ83wvs9MknwQrsuWEW2hV2Ut/dtd4iJ06jYCcYqr5UNrxoo+aKR?=
 =?us-ascii?Q?VcdyFyc/gF8R8BphT2QgsHfNOgz8VDGq2q1guOPgzpPrX0ecs/slzP/q6tZ5?=
 =?us-ascii?Q?hKxeZCJUKYmQUjW8+YCZ33UsDSzvErsDIYoeNoY1ymtLa9ClhXpl6KteQwqS?=
 =?us-ascii?Q?dEKu0wnHulW15krM30iuwaJ8BWkPbVHHm+YcU5Ol3W/lBsFekbVdayaOhq9p?=
 =?us-ascii?Q?WhnSwPhOxgiVCI44437EUA+8a5XpS+Jx2LsAl1Tzb2Qzn7wnCJccmGtZuAV2?=
 =?us-ascii?Q?b6TrRogmpCv+FGVfDJOi3PHy8a4jekNxP1mxS/IAf/f/BXMBcoUQFV1AB92t?=
 =?us-ascii?Q?0xVRooTQ1AaZq5sw9mjsF/tn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bcd0ac-d1a1-4f28-739a-08d8e43dd6dd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 03:29:12.3649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMZG/TIr0bGIsnzSilXM6aSNkOEETuKoLa9zUwU0DGkifM6zXed+XUwkl8lQayX9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3436
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
Cc: Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ioremap_cache is not supported on some architecture
such as s390. Put the codes into a #ifdef to fix
some compile error reported by test robot.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reported-by: Kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 37751e7..1091585 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1817,7 +1817,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 
 	/* Change the size here instead of the init above so only lpfn is affected */
 	amdgpu_ttm_set_buffer_funcs_status(adev, false);
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_X86
 	if (adev->gmc.xgmi.connected_to_cpu)
 		adev->mman.aper_base_kaddr = ioremap_cache(adev->gmc.aper_base,
 				adev->gmc.visible_vram_size);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
