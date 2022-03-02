Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1834C9FFB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B5710EE6F;
	Wed,  2 Mar 2022 08:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300135.outbound.protection.outlook.com [40.107.130.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C9B10E2A6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 03:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck2pIdQSyZq9TRiYnSstEP2Osxnib/sdMs8dYQrtPGtfDlTA0QhMGe2i20LfDuygyFnGK/9o68vmpgRbmd8z/4/vTA03vLwVijW5PEBr1cCh+KIacqefSMSw3V74l3ePV44+R1RSY+oYc0aDXB0t+VSk+WSBSph39iBL+594GDelJl3O4/U4/T9VL3Du+gKAGCKE9gSDJ+6BQ8QpWvmgS7KgEN+5hHYI3BlG1MWplyOYUPTJPGQA3c3jn2ao0CUXjfDeyPe9LR+5aABv5MMzXTcY09D38Knv6/BlKTPrzYDhS6Fo3tWSsYZ3EE0oYhcxngNYiTU3lyMpBl37qBnJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IV+OL3vzi6rIEDvi8v40fpd2Zvt22IpdTp/OWFlkbHY=;
 b=AcLV7OOsxGSwBb+kMuwj4aCiu/bExKV2SO/OG1GuY8YE8lgibL0/B7CbbgZBbPYcC0CpUdw0iGGuspoo+RIPRXqTxMNmJqW7bseZnQ7vGTTnn3im7NYWdD7E7rHp5IbODAfg7q+jxqlxF7PGaKVi32kkXM2KAbu94qf5hbnGtYHlBObY0tvwAeIz3YWvklk3wQtXAXNHOQykTBPmUhiwTfWU+rKbLwroTJLUOGyJ5BhayiIA6rhU661BzntRz02rgE2lYOeWgynSc65PV47NF3Rb9GwyAwGY9GuCvwhPcPoAYeqRlnD9bSiN3cJLbS1VhCWmQ/NEADeAuYTjt2il9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IV+OL3vzi6rIEDvi8v40fpd2Zvt22IpdTp/OWFlkbHY=;
 b=BIXAPFOeSdZEu5YcK6pMlQEouDviMC6QACMe1qIVRNMnV+zLBSsBaNIAfape2hFzap2TL40fcRgwK4WyzjEUHRuzXc9eA237X2NGykbhFmPPzrRNCMCKx1g3Bevw5jH7meDaOJapPGZ2XRjzPZQQGx9C+SzfQ4oEj/fBqIBsKSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by SI2PR06MB4058.apcprd06.prod.outlook.com (2603:1096:4:fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 03:44:22 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::30ce:609e:c8e8:8a06]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::30ce:609e:c8e8:8a06%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 03:44:22 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: s3c-fb: fix platform_get_irq.cocci warning
Date: Tue,  1 Mar 2022 19:44:08 -0800
Message-Id: <20220302034408.5990-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0143.apcprd02.prod.outlook.com
 (2603:1096:202:16::27) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71a777d3-d2f2-402a-7a9f-08d9fbfef057
X-MS-TrafficTypeDiagnostic: SI2PR06MB4058:EE_
X-Microsoft-Antispam-PRVS: <SI2PR06MB40584D2A147640CA6039821FA2039@SI2PR06MB4058.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M34YJa3Zso2XCYipJnJhERXrGOYOwKPMSqazCtnLjXvqW3eD+qyL91VtOSGCInW3yGd95VPF5cIw7bTgP72WAgyzL2qNI/1i68xnhZB3bnL/2zqSrbl5wrHwcbQuiYHRIKzOEqAbtLFbVD/3ezbKjske6GuhDarAY5zcoF1VYFMcCxqvzbyJPZG05To5UTAXqzwaZ687m9pvyc/jTk5RjJP0CL3m37l8bYj4yKa1fGz4+XpLOnB4GhIcTiDKWCH3OJins7ilyYnpnp3Xjl0tdVeg/hz1SvrZw1p0/eLdPvM5EqX0T6ee0KEeO7ECqzjDs67C/kg1B7SW7JeyPpPIdXt64vO5uftvtEuttSjzrY/g+xrwFCcesra+YUvSWALFFE+IkfYEzN99IHhXtLcJ0Okm2wxOlwIYjSmove8AbdbEV9F2h3krpOwPNWgXnI2jphd3IE8M6ScO5DYq49aI9Bjx09auJm8tfeOi/jHspgfpy6kCCZhe9xsfmVVcO7TtAx/97Izi/kexOSMwPjc1/oUAqNkOR10C92SJ3Yqc7wUn+4ahsbfuDzpSMy3lucN0+Mp43PIvEFPQAGaYV+x0ukMdn7YYLNMbQeAdQ05I4ryhoSCOq0yE8DkgojzFZS2kxgpaQGE38BBI2PZOrrq9ZQi4UDjaErP18Xwp/6P+xONtMGZ3t1pSqIVTFap305sGfTXSRO8jEsSzp0o8BR1e9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2616005)(1076003)(26005)(107886003)(8936002)(4744005)(52116002)(6506007)(6666004)(6512007)(36756003)(508600001)(83380400001)(6486002)(66556008)(38100700002)(38350700002)(86362001)(110136005)(4326008)(5660300002)(316002)(8676002)(66946007)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UH6dRLZ+Y1TPjk3cZRl1uoDevTmh46C9svXGjjVl7sGLdFrnBG6Qwz04qVVA?=
 =?us-ascii?Q?q/CCbDs+08ShCQX10Nncr5OgptgtyvJguq1LmZ5RsWjjahkgWgDtcpIn8MRq?=
 =?us-ascii?Q?/lW7zUvtSVrvMLglDhUBX4/tMyLya1eJs56K2QoR2ruZt5ownMEAPkMzHQU3?=
 =?us-ascii?Q?dCjOHjbZXVmD4vNHVA40qf/JfLLcAsQIN4kaZ/+UURU6ogek8kvxR0d2VarK?=
 =?us-ascii?Q?YnI4zwW96Aq+Uoe9uJXsXp7XgBAJWT/MW2SFSu/m0GKL2XVnkZiDLb9/lpeO?=
 =?us-ascii?Q?8ck2YIrZnsaCkOBOCPuGajCLI3yBZ/72zLAljrQQFk3VOmnyvWio1Bs7/EWN?=
 =?us-ascii?Q?wqhzeWGzrSIqoWGm7ISHXcS0/aoy74S2frjEoxvCA5VBo5PlcCsLnV+Tb5Yx?=
 =?us-ascii?Q?6qbNN/kAOyFHXisS2iucVMZZ+b7BAUYUqWRg5STryHBI4WwunD+j09/avOgL?=
 =?us-ascii?Q?4VhvSKMRU9Dm8hl2z3rSjUe+pWPPB+HUN2VBwrg4iZzMQ1RrkBJmpckqpJZC?=
 =?us-ascii?Q?46dT0CTCUcdwWTmc9QniWgk/ffSdKXmU8oWaTIXW4g97LQnYQEmMKwNIH8LP?=
 =?us-ascii?Q?8BSzJi/roiNGQO4hiQ1bEruSadEbeFTAYLwsTeVGUGpY7827c7W04TmmYUCm?=
 =?us-ascii?Q?iPqp/Fmv9YISDN1XaPtLhBSTazIV2YP8Xmsd8HwL1F6hb5h3JZPqeRmo1lsc?=
 =?us-ascii?Q?or9L1bHtZibrpw4dzQ0IXqh4TVokOMM40rIdU0845Gy3dgeevAwOMvex523Z?=
 =?us-ascii?Q?qitMnvLlNLsPQ8p6myifMNiWo4pPbfWUOX9MScKhLUNeAm1NbVZSm7zdaT9d?=
 =?us-ascii?Q?jBPC5lVwCukVJ+wZ2EOckwP4r8GaZHZElDq73UgJSHkq7y32qhBq8zgf2C7M?=
 =?us-ascii?Q?XMCHw2BJrEwuORPCSvppzcDKfBtB87B609H/OvkB3kjTKgaqCoKGER1OYpcb?=
 =?us-ascii?Q?Vg+0fzZgIMTJMyIOR1eL5qaZvntFZ5vkF6Vp3cpRlAJIiov7Uh2ani4oKMYI?=
 =?us-ascii?Q?PktDTVXPafC5CFjupLguaJ+8eb6DNbcw6EgZeuBQfvTjF4jJylXHchSX3L/t?=
 =?us-ascii?Q?hRWgb2QvDkJniWv/2Pkv2oixrBcZDYxxHjy5BvDQw9HtT5l3KPrnlRJBLdXf?=
 =?us-ascii?Q?OvdxhDPIJ5A6ApNNmO2HLwahaIb4ofRxY/WH3gh/wF4v34MybBGR3WNwNpnL?=
 =?us-ascii?Q?D295HE/bsgfyXrU5ikFNOzwd9DuajfjkfZjd6fEJFIN5YRvw87HbRAXt+UVR?=
 =?us-ascii?Q?JlBD9EIeKC6M7cckMxUsc9vDgYx6dc74NORIt8J9pZjYyisxtX3CO8YMBPUI?=
 =?us-ascii?Q?1iWbGD8MODpwozo1ONoTVVGXfcrBbiaM8geTbyPWguFZ+GmApAav6/keiEK8?=
 =?us-ascii?Q?Vfm/7I683XzXXUD0RyzoRsYkLdM7oNYGPRqZmbds+kqdDe8CTRUuww6wWkc1?=
 =?us-ascii?Q?ZdhskKXdPsIQLr8B/DpvMahbpML7AuXWDezsMovJBtQUrSV3TSgWtW6vBZ8N?=
 =?us-ascii?Q?xrcEL8m9K5s9lu5ENidocFnVy2uMUcPjvcJghhD4RBXVEhG9PDq59I7j9VWN?=
 =?us-ascii?Q?NtP/lpAQCrEI/VxebfeeCCuW8FLlf7iezOawmOHJ+LbbIVNsK6SPbuYrfpVH?=
 =?us-ascii?Q?/lNC6FCHDVuzr6nCQk3XV9M=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a777d3-d2f2-402a-7a9f-08d9fbfef057
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 03:44:22.4018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9Bh/gloQ0NQ8KK+M/9eSR7eXkrolm8jv6QudQVAxM7+l8RJx4vrXq5ExpCp6sSvaLKH8iQM1rM4YKwbtoK2gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4058
X-Mailman-Approved-At: Wed, 02 Mar 2022 08:54:41 +0000
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
Cc: kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove dev_err() messages after platform_get_irq*() failures.
platform_get_irq() already prints an error.

Generated by: scripts/coccinelle/api/platform_get_irq.cocci

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/video/fbdev/s3c-fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 208514054c23..3abbc5737c3b 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1418,7 +1418,6 @@ static int s3c_fb_probe(struct platform_device *pdev)
 
 	sfb->irq_no = platform_get_irq(pdev, 0);
 	if (sfb->irq_no < 0) {
-		dev_err(dev, "failed to acquire irq resource\n");
 		ret = -ENOENT;
 		goto err_lcd_clk;
 	}
-- 
2.17.1

