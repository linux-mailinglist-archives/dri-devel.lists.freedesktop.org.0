Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9B44FF00
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 08:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCFD89A32;
	Mon, 15 Nov 2021 07:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300099.outbound.protection.outlook.com [40.107.130.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E7889A32;
 Mon, 15 Nov 2021 07:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCgeeSxCp5OpiAj9Fy2Q0K1i/j1C+8W6TwWB8DSdjjqLBclMHwteW5lutmC2u2tNruR2aSoUifMaEHhqGMZe6ztjUncNuA0yq5oqLpgnv6bGlS+PUiU0MHn3/4qzYBJfiUxcbGS7HbL9c9lCHKh+S34RiMavTYDtB5FBM93xB9BliTdTTOZgO0nyVdisDyprcv65a3MB4lEl1H985rjmc75+u1S2jleX2yrhVfqu+qAzhfM1aiNytR3WxWJnHEcdvFdIDYrekIBkGjpwqTTrGygAvSZT+fds42g1PGb7E9xMAKik81kSFwCgQSFqi9jRFNvNcrtAqa7D6afRUk0B+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ev06kKeLkQlZCYMUy34dc5rWev/UorD/7OuOxL9vepo=;
 b=bFbIBNkgTvsTQB9uW0Eb1pLlW4bHHuEiBeSLip92L2qVTC/yQMQBVklb/TZ1xs8sFi5fpZaHw6sETutndAjk9HXxLZRE2ITJfExBPUABaH3B0Ol+W9xc0pav9dQz6CGX4oRxm5ZGJLgDg5+h5vMD8CY8tUCgG47e7gdMWl4mrp3lmL0Agb2ww4IJkHuUOirx79PCLuS67gMJamMBq9DfvBdlWKe86bmHNuRRLfd3GTJYFkXnyODYYpTMp3oJDd0+P2MKNEu0us3cV6jYSsh0mBaZmC5xrvrtXu2A4WOdfpYczIjTyxQG4GLqOYcUBp5XgvINSxqgGCI8Z1f44SZ1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ev06kKeLkQlZCYMUy34dc5rWev/UorD/7OuOxL9vepo=;
 b=dTRLx7pjor4AzCclgzId4Ib1tEmZ+SSmXfYzZbnYcRCC2bVFdvUsULN8mdzB57LjTjIh9wfAm/73yBh3p0rnTpqLm3uWhYpK8juH11BKfM8CX28SJ9aanue/ealYzg3iIC9N60QeYz/LVPcWeCVQwP6YSYqHIKUfd15fgo/ZpBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PU1PR06MB2360.apcprd06.prod.outlook.com (2603:1096:803:3b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 07:07:26 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 07:07:26 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Candice Li <candice.li@amd.com>, John Clements <john.clements@amd.com>,
 Monk liu <monk.liu@amd.com>, Peng Ju Zhou <PengJu.Zhou@amd.com>,
 Bernard Zhao <bernard@vivo.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 Bokun Zhang <bokun.zhang@amd.com>, Zhigang Luo <zhigang.luo@amd.com>,
 Lee Jones <lee.jones@linaro.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/amdgpu: cleanup the code style a bit
Date: Sun, 14 Nov 2021 23:07:08 -0800
Message-Id: <20211115070714.7007-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2PR02CA0133.apcprd02.prod.outlook.com (2603:1096:202:16::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 07:07:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22fd5543-cac2-4f24-ab57-08d9a8069453
X-MS-TrafficTypeDiagnostic: PU1PR06MB2360:
X-Microsoft-Antispam-PRVS: <PU1PR06MB23607E79230E8A1BD1D3AD1BDF989@PU1PR06MB2360.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BaDyV22EFyVlROmusQ0+IGbspy02isNez0mhghsc6BnnbkmUgistNLI4u36EYHr7uMI1r/qXDdeaCvbTzXGoGzvzJ5CcCB7SqZodLDF1S44L+8QLGoVY74VvnvyK6VuD6Ex9TRmcLzSDqMZ9/I6jUy3J56KvT8zY/DHer1MzP+wwA8HIft6/wBU8CvIam3iSlFYnZNOLsUh0RQt/6qHWs6P3WafvuNSouumHhU0K0RNKll3JU9Fn3pgUvsBHLRdiStrGtiKmVpYvJoMplNFRGjLpcaGhUlhaMjhgw4f5dXD/l90DB0wDLSRqeOorvx4RRRDcS602KLSmLrEUHS2iiHn4zbdd6o/XdW5/tnPu7ytIvSVA3tW6NBZK6bPfwz+S6gOonZDTZ4BuXVoNIrzLPoxGT0v5etaiubBA/qzFDU5xMlqfh8QgpVJQV/jsJDgMJ9Jcz7Q/JSkYhPjvF3szxmgCkxYx/ohKe3UWQgRg38ahUKp7XCkDiasFAiycCtiNdrMW9j+75HLFI7gQCDp8tROu64eEsnoyetYXS8SzMH+0l2pcjtwRimfbwVV8FKhw5opvUT1lSk1UqiDbxBTguk3Vf4LMLQMeDRCV+eWf10ue5I8c4pvLG72ZtufqZ0fkGmbAUKZTIkdQ0kZ3C3MB0wd5fynj2AcsFd0lrECX1z2eAptyzghJ+Vn/uxxXIcWKXnqEG+AT9qWDXG7BV7Cf+lH+70U/0qpdp6/R7jz5egs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6512007)(1076003)(86362001)(66556008)(66476007)(8676002)(83380400001)(6506007)(7416002)(5660300002)(52116002)(2906002)(508600001)(6486002)(4744005)(66946007)(6666004)(921005)(8936002)(38100700002)(316002)(26005)(38350700002)(2616005)(956004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ul1/6tZrEO7ovvDl74ImVhZzb0+pNVka9DXrrM16PT8Es1AzHPiUJCeP3dY5?=
 =?us-ascii?Q?/GTybKpUiA2CH5eiKvnYm0oQnZ9F8OV5I5jJ27KaotI/nnZ6CqZQCxZST5Tz?=
 =?us-ascii?Q?IooJuIxud49+sfsLwz+VaSHlDs7IMK4Mm+wXG9W80Sfs5fuXZ1Qv9mh3gdQU?=
 =?us-ascii?Q?owGviA/peUM4dgNsWw6MzPZFW6bJFdc8zhYkzdzPT6mdwO2lwp8DWEdgd8xC?=
 =?us-ascii?Q?QpXh0hfJcDK1BDFUCF2n3Rq1VtY5g1iqCmGfeIyPKJjYXPH2Y7+PfU/2tM/x?=
 =?us-ascii?Q?2gxDyBtQ0ur+U5hBuVqUSrz80KaGQX33Gj1e1/Dz6hKdOUY+WWEgCPJcARj3?=
 =?us-ascii?Q?OvKD8fegVqVmBJ04ob8KBnrjO5TmdghXgy4ZDp/YDsxUFD+hob+Sj8Jxfail?=
 =?us-ascii?Q?JibuTHPgl0cXhAgJQUyfMzQzwmbi1/KwnYAjCutwdYN9gk8dSrmq2NIZYknN?=
 =?us-ascii?Q?6CgI62JM/jcz6+fXg5PZohOJU6bEszGaa52hNr5ApzugizhLEKqapM1rWzpY?=
 =?us-ascii?Q?nqtgUayb72lfYobvrM9QJWquDjI5HLCiJ4gPTkqVxLKiQflYtCLZYekx4zB0?=
 =?us-ascii?Q?XPR3N1p4eO5p6KZcbp9vt0UP9jLcxw3+LJDM2cRyTYdRhK+eKb4bAXSF6O27?=
 =?us-ascii?Q?D4JhTeGQltTRfnO+oJcGEYwb7FomiHOtWt7T9FPT8bx6u4XqISnwMWb/DW+I?=
 =?us-ascii?Q?f4yA4K/oHg1v4QqbCRPNvzJtKYsJ1IUTP+sRAFIwuxtx4/Sg4cOqFeXHIxzC?=
 =?us-ascii?Q?TlUBGnt852Vc/mVgGfkDt56roj8HS22Sqfb8yeqVi7SnscIGZ9GGzbQMxMZW?=
 =?us-ascii?Q?3eekL13lC1t9GzAvDzjKCW7w7bRDrKpbeMnojguAKPur+LQTCAoiWrATYNNK?=
 =?us-ascii?Q?DhS4raPvdnLxnkxTg1wG0wRaeNFNHrQv5eH58y8n10iSwQModO+sL+bhN4WN?=
 =?us-ascii?Q?400ArRf/VPf5U9K+p+DJOSMRZ9MncBYqgCdH31sPfiZfMWMj41t7gX4qPW2h?=
 =?us-ascii?Q?fEtROaI+szZp2uv/3ckVsm1m4EJ7UTOAVWByjV8mTgSgpTN8qtZQmwHZLXjc?=
 =?us-ascii?Q?vlsDzHFIJIIKBeJLGGxy/+Fg/WXTzxuIu53+xqYtzXCfxyNLmzWsd5DZUpS5?=
 =?us-ascii?Q?ZLZZiw/HeoKSEgs4OBQE4t4gmXEZIaP5PtVYjc+Qx1K2XXvrn153m8zW6M9n?=
 =?us-ascii?Q?85U2RZTuFAuWu9LyuDdqHwm+7hu4zDGiYDXZUL3xFPs6mnxL3+JSJz1w1x7I?=
 =?us-ascii?Q?jTZPJdz3oc2Tuqf3UaYKZjL5xICwHIVzuwvs5ybls7LY0PkVnoqt029aoko7?=
 =?us-ascii?Q?W03fU8M5ZlxtA8+WcF2iusmH4tfmO7kC8JMpJGVbbAAVzJZ14TNRC3zvsm/4?=
 =?us-ascii?Q?wmsPhkO8AGEI11N7R38StPkwDFv85PByAC/aJUNhEIK0qsCdX7aeyecTK8B9?=
 =?us-ascii?Q?O+ZGSTWWiaP6X0dLHqRrgewf2/ytKOVB0GWIm6ADkwBaaWTDRs+M+DPdELBy?=
 =?us-ascii?Q?K/BQrpYoPsdFsps9saZOOeKBo3TsTRxgqGju+rw12xn79GRYHyNYYHclsTaB?=
 =?us-ascii?Q?LaaEd+aJrJAi6ZAy9Qu6qOmBuKHaJruXvrMVd9uLy0S/Pt6C/cU8U1FJAZdI?=
 =?us-ascii?Q?ROv5p3H6ts6/8y9UHBBRITE=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fd5543-cac2-4f24-ab57-08d9a8069453
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 07:07:26.4921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBC7jJBHu4yF5OvNp0Cr1utNx3sVRz6Xlj3jnZ4BLP/IrZrW8m0DrgCU758gZy3fm22HXkKyjOL9omW+kppK5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2360
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 04cf9b207e62..90070b41136a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -286,12 +286,14 @@ static int amdgpu_virt_init_ras_err_handler_data(struct amdgpu_device *adev)
 		return -ENOMEM;
 
 	bps = kmalloc_array(align_space, sizeof((*data)->bps), GFP_KERNEL);
+	if (!bps) {
+		kfree(*data);
+		return -ENOMEM;
+	}
 	bps_bo = kmalloc_array(align_space, sizeof((*data)->bps_bo), GFP_KERNEL);
-
-	if (!bps || !bps_bo) {
-		kfree(bps);
-		kfree(bps_bo);
+	if (!bps_bo) {
 		kfree(*data);
+		kfree(bps);
 		return -ENOMEM;
 	}
 
-- 
2.33.1

