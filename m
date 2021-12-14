Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4874E47423A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 13:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E6B10E424;
	Tue, 14 Dec 2021 12:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300099.outbound.protection.outlook.com [40.107.130.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C17310E424
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 12:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyRMP9V12UmPNcnf2FOAXFsr/BEx95e9wLx2F6x3zSeVqikPOqu6ewKU+beoN8B+UuTcY9f92HLXNG7m9bbjq1hYTqTyu4/cRRNxhIFinLE9VcGq8Oa0/+1P9bAcIAl2RDB98W1/kJn2HK7Q/v6LKVZ8a7xwcnOL+qsVG9bTX1Yyy9E4F3BRd7KCR0QGAkNBxO9aZhnHoqEFI8MdWPkknDX8pzOyhdt34vDEwSExYFabFCrtpAj7uPRBE8j/rqaohHtpw/GBWWe20zmDKSXf5HB6TPq6puv7tzgxkHg3JlOnA4lRSMY09/FDq6OeyEIBmzpOJBJC84BPiEW1yR47Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLtmXAm3mxZ0AGcLP2vMe72z9yuF4hyiIB8zb1krezo=;
 b=kK5Yyaunv7DZi30wVHB74dceSsX6DJ/Cqnt0uPis1aBlYGQOTvbL7H7OGCOfWiC9YUZ0RUCZvFFtTtkH3iFA0eoPzwb+3dcg++76Unz5+j68BxKbuTO7brH85SDaHAypwqEfnVioPJIj0F9drLTNNNEspGiYgNcAfi5py+8ttDg8G5GUBEkKFZ1olrNzA/XBDdK5xeppNdwcGWTJLNeqrdVTikZmGNOc19lDYofIALCMK+mEYzGbKANhdMX4fMr06MCDKaBHr20WtG7Zs5fvXaxF2GyDdl3x/fNEqseNIDGijZqwAnEZuOGGKnPWW2SOXwQtau16qMEcsN8bZmDFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLtmXAm3mxZ0AGcLP2vMe72z9yuF4hyiIB8zb1krezo=;
 b=mf/urcGot1UluSEYvvXY7nTPsflQUkWE8rPPODTiGWDSaDym7qALTApGIYiVz3/lWmwjVfYGLK+nEi2uDmAVz1enf9F0O7xN6mFMEmVs4pS55CNmF2JZuROzeEC2aI/TX6tNlXV1hLe9c0yJ98miww2aDrzal31VLSc1SyEb+IU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3003.apcprd06.prod.outlook.com (2603:1096:100:33::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Tue, 14 Dec
 2021 12:18:25 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:18:25 +0000
From: Qing Wang <wangqing@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: tegra: use vmemdup_user instead of kvmalloc and
 copy_from_user
Date: Tue, 14 Dec 2021 04:18:17 -0800
Message-Id: <1639484297-75825-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:202::34) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 845116a9-f26a-43e3-adc1-08d9befbd3ba
X-MS-TrafficTypeDiagnostic: SL2PR06MB3003:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB300318039C425BFF978EAC74BD759@SL2PR06MB3003.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IvNtfFRum87YvCTlqfw4HEInIdCkNNvvPMEGQdcfx+mpr7uXk12fqgePfScdrpuqlORuYHRK1GzY73nUj34WVBbtFFQ1WPH6SK7OwNP++qQz19iehm8edmHK0lCcLup6XcA/Svy99NXqnFXUnrvfC7nMQ3zbxAJzmT4Qtp94PaVa1tz1jPbj6OoH7DLSHnmtK6ijglPSgh9wAyb7RWmm5B6/kz6RiufPOzMZZFPfj1B2ru4wEg/xZ279wtvEoNvEJJ4H4IVLfwzfAqeWu/z6B9rwc1uPZyAljKQqtFS6vf2AOGjgIBu8AvBjRDsFPlK0hkHm+SFULxyh+nEhIeeTjnVUhTwIb/6/RO/v8rtZL7HyqZQpA6tGtBEQ0yiDqxkJ0EYM48ILF64EVhlzYUNSMaKGxnOAPXbxgxTCiP9YirXz/nhnCD8vGqInnykmG6pwWF59zmwDmEv0RBSYbLxiiZmSgdSnE55r57sABPYEoCwPSG2/u9VrkAFh+jE2pm/OswOpBa7iEbVd/ctQQdFb8lZ9da7dIXmfdnnWsfh2wwsLFsSvzwjkRgkOXJWRhDPMVwm8v+50uaF8O5z2Fj3TqsVcDIxGPpF/d0jcQViqUsmIIF+N4Z5m3yzb6iJtzUAykPbGWj0PvSaTZIzbGj/zCCsyCK21UccVIAUsM1hlClyoAUobxD1ELB/776vIXZ07xsGu847Exkd08rlNSiQziw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(186003)(6506007)(83380400001)(6666004)(66946007)(6486002)(2616005)(4744005)(66556008)(66476007)(316002)(110136005)(8676002)(86362001)(5660300002)(8936002)(508600001)(6512007)(4326008)(2906002)(36756003)(52116002)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jQUAKx8DzUIZGY2T+tF8TP0dJT+vXZ8Ut4YLaraFo+qrmlumQ1ToBgvg669u?=
 =?us-ascii?Q?iV3wi443xnO9g7G1pP+UmL6brX58/YEeYLTaQsxckzLeHVJ67Wl0VrNqpJlR?=
 =?us-ascii?Q?3IsTwHstDa80P0H9f6Wx9KiVfNA8p24wAx9Xepj2nkcRvl+9BZcbahyTk/6g?=
 =?us-ascii?Q?FztXu7sVgl8WRzveCqEawxzh7uHUKIuWCT+kKeaQACiw7f2kV97bcX/hH3ao?=
 =?us-ascii?Q?mMS0nB4nWaGq4E8zIGhkpi9B7wtgjJbd/iyEgUOb8gGTJV39PYl7T9YtnC+l?=
 =?us-ascii?Q?GcrdsbVcaO/Uy1aA9OBLfPqE3xDGwSxn8BBK2CWgS/RWWMT+zm8vCOdKnIpS?=
 =?us-ascii?Q?/++jpZFyNGgzOyzjUw3aoqO5Q57ya8rqslbehYDC5DiMt+KDWhxcgZVm3n1h?=
 =?us-ascii?Q?b5F8uPFTdz7RjkwGpicGPMwjJQkJZPNjW84ltvOiJRXvZM3yDqdGJB+m3kgp?=
 =?us-ascii?Q?URmJScxLSCp6b4iRfyenWdnPAwondaxqNqpIHzF2gBHQXpyXGVBp7+ArhIV+?=
 =?us-ascii?Q?AY5EFigupz2pOfF9h0oERECls1/LpxQ1iZlRbpb8GsYZrAl8AWsHOBwFBPDZ?=
 =?us-ascii?Q?GP4v+FsS3AKiayVENycn73Tg1/PqDLIWginoVa7tJ/2JLdYlUhnCmMOk9/z4?=
 =?us-ascii?Q?wt6DtPIo58vivw1z3AkMZaW62//iCBB/KT4uUMzjan4ZAMLgKdcPZPwi0quN?=
 =?us-ascii?Q?HGvg9ucypbyIIckWNPFUYXPzFCNUpwMmbzhWQV+DI+eZkdGy5L32fVGTWcSo?=
 =?us-ascii?Q?9TZk64yU0ahqJj8huA0+zcYmaBaeB/ru+Ezw5Vtv0m8qSnwiSY0YwCUz5jzd?=
 =?us-ascii?Q?xp6+iRKhqONaYKvz+qnxquhyqJ5vC/MVZRA6xEthwFTXMT7d7yCCBzdD+CPF?=
 =?us-ascii?Q?cOp3A6LbyXOR3+iVFh1edr+/oBfJu7i43CSmtkw+viDehD8aKw6zNJaIkoGg?=
 =?us-ascii?Q?zBsJ6zYqQ1fanx3oQPtmjdLtOlY8bLKP2O/tLejVWrdywKo8Mt5HsuZ4tsrO?=
 =?us-ascii?Q?jf8eROk+uFTfv8uOPfbB6GcekyatL766KYvNi+KJKBNQG0GuY7ynNz0x7mdr?=
 =?us-ascii?Q?AEumoKq+sb3LIqgh68MuKML5iaDF1EFv94znmd9Ut5dJki2s8NBOFnOdNKAl?=
 =?us-ascii?Q?8pYDzBsZji2DU+A5uefIulPY3p6PSf+mYU9K23aNOGPHKGWVAy6YVuLLT+Yx?=
 =?us-ascii?Q?OjIrUMliFRVVBGm2OG8N88Z6ABLCi9DFNtmS3Wsf1Bbz+x54j9JCFbF7bgKV?=
 =?us-ascii?Q?qfeOzlyDoarvXUbON8sk5Wnz9Pj+LSNyyDyy603MgcpZB5oJWeWgVkj6kgrc?=
 =?us-ascii?Q?/nOuVbJU5Bf0jZjC+z/EacRF/58sEDjWnYb2MEpusCDiEGYe9YNHk0NG8uPM?=
 =?us-ascii?Q?nSVHDnzPgLRuPu2DdPBgeN7QGq82gCz72ALnW37wPuR0qU2quM3BQDBFUzXV?=
 =?us-ascii?Q?EgwrdHaNrObCJipE4PHkJNqBmnqlRymHJR7zbunbZJR8bj2qIHEvlWiEOEiP?=
 =?us-ascii?Q?TFzuu8kn6jt01EsmPWtIR3xsJ5ZOKVjKWLi90tYqixzGODcksVCCm8mjVmzv?=
 =?us-ascii?Q?SAcOcnp/0sYKUEKUw2PzvIgBbLNTpkznVJOhJ5e814pxzxYGiHqqxFMmpBxF?=
 =?us-ascii?Q?8YivY02qoERldMjiJznbR38=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845116a9-f26a-43e3-adc1-08d9befbd3ba
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 12:18:24.9850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSwBVtAej4rmw7WJoYeywqKe+AAS1w2Nt1djhZKuAx5Mq74R5sKWY2tSIiUxyBL+Vncts1HQW5vAsRAovDHfTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3003
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

fix memdup_user.cocci warning:
gpu/drm/tegra/submit.c:172:8-16: WARNING opportunity for vmemdup_user

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/tegra/submit.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index c326984..842a2d3
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -169,16 +169,7 @@ static void *alloc_copy_user_array(void __user *from, size_t count, size_t size)
 	if (copy_len > 0x4000)
 		return ERR_PTR(-E2BIG);
 
-	data = kvmalloc(copy_len, GFP_KERNEL);
-	if (!data)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(data, from, copy_len)) {
-		kvfree(data);
-		return ERR_PTR(-EFAULT);
-	}
-
-	return data;
+	return vmemdup_user(from, copy_len);
 }
 
 static int submit_copy_gather_data(struct gather_bo **pbo, struct device *dev,
-- 
2.7.4

