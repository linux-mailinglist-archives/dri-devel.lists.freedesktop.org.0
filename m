Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70A41EACB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01746EDD1;
	Fri,  1 Oct 2021 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300117.outbound.protection.outlook.com [40.107.130.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685196EDD1;
 Fri,  1 Oct 2021 10:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPSLqe3CUoMQed1kyvrNgXwx0LAXhSzXMMWc6Bff6L1WJnLR3nw0+n7pr2tqZP6XaUnLZX0W8fmGBRaY/Mkt6f9ihJXtWG2K90Ilm1p6kivfJBYUhLePLxziRCssZtTNaYsuAZh/dmDxZZ6IqinWLFfS2rNWWFlkTPf+5YFYDX/xWKchYrxN+fXjl+aWEGUBmbhg6T01rAugPqrQib2LmYmAoyYcG7qIRkaBwYDyOfBppCpa7oZKsxGNOEu0Smza4cmJFKoKZeMNjdOW9WYN3u8EBDlbze06QxwwAiZ6O/upUYfNEE193oE5T1vAyaeJpPdXoT6ODS34gWXhxYgqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vjjbrk3Dkt07k5uuLs55ymnVXx4CNk6wXyW+UiIUpiU=;
 b=JzEMp7TwNgyzqb7S3Ndu+jVwU9ISsLF+dKJwmGiJ6ewkwLEtIuGsHAsctO2vs9oDtFuYM/zeqx8fUgv/Hn5Rmzg4L18mjw1HAmG2iqLiHJi+wb22KQ027NN7ZTsWTO+zoFVu41UFAmntcvYW/aEd7+jRIy3krEiX7jOn3lytq7B3TFU6oWUUbrgdPxr609YVciILjaORUTOCZmFi6zoxvmBnMn0HXoG0VZnhoHp7/vIa0hgX82gXkMk72YvcFhv7izF0QW6cvxd3/Tl2NIp2oC0zG/bDhLv+J2teEeyWXJvmpC0Frs0VhDo17CXOrZU3QNgvSsyC20bZZTqg5Fl+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjjbrk3Dkt07k5uuLs55ymnVXx4CNk6wXyW+UiIUpiU=;
 b=niQQm4lQSNZWZTY+W80QWsnNb5Rl2IlQfn1Jsb7m5iTBYuf68knqWbjmQgrkGcJjytsEHKsmLGdT2vQZmpfyhk4daa3lxYnnLKk5MDEHWtAbCadXs9ASp9wJyYQgpeM7zOdw0AJRzLR8zXsp92aVYEhI47JC2fJ7W4Outk9crQI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK0PR06MB2881.apcprd06.prod.outlook.com (2603:1096:203:5d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 10:14:41 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156%5]) with mapi id 15.20.4544.023; Fri, 1 Oct 2021
 10:14:41 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Guchun Chen <guchun.chen@amd.com>,
 Peng Ju Zhou <PengJu.Zhou@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Likun GAO <Likun.Gao@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: kernel@vivo.com,
	Guo Zhengkui <guozhengkui@vivo.com>
Subject: [PATCH] drm/amdgpu: remove some repeated includings
Date: Fri,  1 Oct 2021 18:13:46 +0800
Message-Id: <20211001101348.1279-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from localhost.localdomain (114.100.157.9) by
 HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 10:14:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9e6fca7-4a3a-4050-80d9-08d984c4480e
X-MS-TrafficTypeDiagnostic: HK0PR06MB2881:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR06MB2881FF64ABD54306B1BE7A2DC7AB9@HK0PR06MB2881.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kdBM+R7b9SYspuT+JtMaZTbuBrHowMQEMMTk49bg92XNewXb2BDoqL0RPu0p67BPlAL7NL85NOEJCs6WlQ9XgMuGWnIaXLuU7XgeYpk76ThljiGDuA3Sk7XVHR8JMjuaMAWLzHexhZe60OhP20WZ4DvrKgolrpW+dLudQOVPy2KyD7+ZVCN29luRDmgulgPyp7/2WdlPPWS7CAhEu7RnA+kjoJAjXbRS6VDMPLMiA7xhU5xiCUyizX0Vr8cx7Ia4l4cWeYvV1Mb466ETDfbfNjEfVop1Drr9KXpBVZU5xRxLkMjpAXcLkQqQcyx8C0Bi0Bf6TEE62iSW8D9VQhuZp+kCdDYbUEld12WCjCotrGStMEwigGjsDiXqDrXPmTPI+VuqpVG2OahZN39yGIDMFBZTz8oJM/pv5EzoSdnISrUFBeIWhjHLNpDhluBclUOS/1PChlyStJTZe7ngnb9ET3kfTIgCILUSZ1NpSvtUaOiKFd8yQhPRKA+AUyjw6qpTLKk60wbUl4MjCUTTYik6PCH2ob49zBjP/eNg0T2H6QYujOmQTwK7LUSHYkvLv4ZKGZi0e4X1bRka5ATWIP1aTfar9hzMn+VMcXRy+mJLELcAn7U5UNmacUbdSMY6O/CsdVDqDZVLOGgMHA6u30N9Jqlt/hmDKOepR3h/aW91MDiiPQneregmnoZlHUa5IJlVz3KGlMSM62/cIYxrcB4AArwsALkTpGFtkEYno/JqOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(38350700002)(83380400001)(6512007)(5660300002)(6506007)(4326008)(38100700002)(921005)(186003)(8676002)(2906002)(107886003)(86362001)(26005)(2616005)(66946007)(508600001)(36756003)(66556008)(1076003)(316002)(110136005)(66476007)(956004)(7416002)(6486002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBnTSd7Mn3VQOBNZTnnmJCFJ/c0wLQ6k5VTMAxLgdL+HypEMjvmj1aZIaJSU?=
 =?us-ascii?Q?SvfOk+Z+jCuXu0yNysl5PrLiONGPOYTeHLeuxyQ1jnseGXoRdmn0Oj9mfTt7?=
 =?us-ascii?Q?rPsG4FpJVFJIi1qUMrKzQIQAj7ZgK6j2zwof39nnTlu6Sx8BeAMKBgxLnt3u?=
 =?us-ascii?Q?oEpvbc/U71VwxEP2hrMnleNkE9grzvnRGybFExMkpnsdJtZzEZRBnJS0dFSb?=
 =?us-ascii?Q?7TuQJUcMOKGCta7Ol6tv0sF233CJk3tGdKq+LSa/kgJGS76dsBvz23rZSQOS?=
 =?us-ascii?Q?IQ4ITYzqZYxIEckXm346yrzAPNEyWTC4vkABsmVtNY26uHbdhXxn3rnGXMM8?=
 =?us-ascii?Q?Zoq5pxq3o4DstGXIvAWNONNzfHSabpDnNvSky57TW0pi6EkkSTYyTxs7oo4B?=
 =?us-ascii?Q?17pf2/TreLPjaX96xubRONAqXoPi0Et77fKDcM/OSA9HU2gIcrPUBIUxIk7G?=
 =?us-ascii?Q?QpmYu6X4JTH3yqCKCJN9kEuf0sFf4UzHF4n2wokcrgY1IuinAzKEYVhsjfFo?=
 =?us-ascii?Q?Ga6dJgSJ3ntkaKk7ZWvjTagS5ezcphULDq58I044l0m93VVOSrNXzOWuNEUG?=
 =?us-ascii?Q?mw9InjVeR4VkGSpMgyFGddz2IhtS2YGYS1mBkoJm5PRETwyg+F6Lcxq3HZ/c?=
 =?us-ascii?Q?BBHVwoA9f5tB436lxqrjCt9sB0Uzl7LYrw9rz+NfRiQNS8+6uJgrvZbPyPZr?=
 =?us-ascii?Q?Whu1VNW7taqoMX7W81GsfvbOQAGZeYfto+SoSqEBRDdCZRb4YvGzgMuL8kEL?=
 =?us-ascii?Q?RgjfDsrWwY9rZGEQ0b1c0pkxPWI42uKJvVEKKYpVMYF6HYUKZZPgstzqE55x?=
 =?us-ascii?Q?1Oh0j5M07dLyasKn62yowOEBS6tlHAsAH3YvRIreHRuXHwiOmzHGOqDrxtko?=
 =?us-ascii?Q?8a06NeRtpHjrLN5NrUSwvngLZiZYJ8KOALbkdrQxJL74vj8qfCaDbBJzHkZq?=
 =?us-ascii?Q?PTgrLWhGOXNibbfiZRXpwEelpnXFujSv1FAJh7WODuiQz9vQMwVoLh+gBddo?=
 =?us-ascii?Q?WqISzQv+9oKPVad3vU5rPKw418CYZwFARZCwytlrk0aYDj/eo4hHWRj7Jc38?=
 =?us-ascii?Q?Q7at7FD+/feNpb8kS0yprFbO4iCzKKIUY1eLxcTtBdqF+JN0iahbhMaj0BsC?=
 =?us-ascii?Q?pHX518ZtznR25ZwGM4wk6ejiNa8ww3r57N5f4//YEVjnmxYc0c/XMAZvOQuq?=
 =?us-ascii?Q?sL7sjledlPVCOeJRMcN0X5BlIVY+JX9esF9kzNMVeQNVKQf2A+6iSh/W0soP?=
 =?us-ascii?Q?wDUAZnAYY02mYh60rqKsnLs7Bc9wY2kyjtmShwIBoCmi/B6OiyK1LvtPkwCl?=
 =?us-ascii?Q?hhCvibPuO838oTxwX6u0wQyu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e6fca7-4a3a-4050-80d9-08d984c4480e
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 10:14:41.1459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx4FxAUO4wr70RsQC/Jib1MYjEIavaW61H81B/EV9Cg64AAP08gkTqGf2j/0tkY/AJ6UWYKV3nadTP9FbnorTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2881
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

Remove two repeated includings in line 46 and 47.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 291a47f7992a..daa798c5b882 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -30,34 +30,32 @@
 
 #include "soc15.h"
 #include "gfx_v9_0.h"
 #include "gmc_v9_0.h"
 #include "df_v1_7.h"
 #include "df_v3_6.h"
 #include "nbio_v6_1.h"
 #include "nbio_v7_0.h"
 #include "nbio_v7_4.h"
 #include "hdp_v4_0.h"
 #include "vega10_ih.h"
 #include "vega20_ih.h"
 #include "sdma_v4_0.h"
 #include "uvd_v7_0.h"
 #include "vce_v4_0.h"
 #include "vcn_v1_0.h"
-#include "vcn_v2_0.h"
-#include "jpeg_v2_0.h"
 #include "vcn_v2_5.h"
 #include "jpeg_v2_5.h"
 #include "smuio_v9_0.h"
 #include "gmc_v10_0.h"
 #include "gfxhub_v2_0.h"
 #include "mmhub_v2_0.h"
 #include "nbio_v2_3.h"
 #include "nbio_v7_2.h"
 #include "hdp_v5_0.h"
 #include "nv.h"
 #include "navi10_ih.h"
 #include "gfx_v10_0.h"
 #include "sdma_v5_0.h"
 #include "sdma_v5_2.h"
 #include "vcn_v2_0.h"
 #include "jpeg_v2_0.h"
-- 
2.20.1

