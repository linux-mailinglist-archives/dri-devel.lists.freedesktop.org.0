Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACC9A1021E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C93010E44F;
	Tue, 14 Jan 2025 08:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="pkmlNMw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2121.outbound.protection.outlook.com [40.107.223.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B7110E6E4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHq/B1wM9Ao6XUGf6tk4hH/i2UnMh1p4s5jcU71O3Y6qyDZ2+DMIpdARv9A/ZDG2ZQArDV+7OY+cLNzWQhj8munTZAw1Tn/tvsmWjKfYVBcTSair5webN37RZuOX0cCRZodTZHaVeOjc1Mwo7NPzDnjxDp/4zgCCbVKpE44NqJ3nb4U8g2d+ZHq5RYU+zGW1g8/U+g3dCHChagZof8c5gRh2kiSdBxXgTuXBE/FltQPPLuTYIlgMTe3Hz2EnvlAPbVZJhQNdax290F4aJmYe2+T6vVYv/bVDyHC55kxd97oZ8tpKCjnDF2d/1k98mkv1EWexFvT7p+do8h5YzGI/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HmXYG6KzB2LXMi1FXhlbVbARRyoGFr8t6RBSwFgVeM=;
 b=v5LqnZldfsXH6Hn7gYMbOlbvYgAL66+3t+la8109Dd4y1lZGi11fOOPA+6sUAYnWj0pFQemgMdNOrmBHbdBWH8fg0kBeB9biLkw7ja+sGqcTmqhh2reIpkxSdduW+JobFF6yrjXDuMCWN+vZsMWJpyGgu2hamGq4RYSQP21wvJGMEKhBb9OCrodBh4zqacAuQ+cuAPrUrDtWHmpbArDL3fJx5W03/XaaWRcPvjUmANvrPObubX2Wj9DXuzWObtabo31fa7FsYmqLE7aJKZLewYW8pbcqSFGkkv9bWIoPpFPZ60JXqA9NeJGepJzpGO81RVl+0zoLApRT45aavJKZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HmXYG6KzB2LXMi1FXhlbVbARRyoGFr8t6RBSwFgVeM=;
 b=pkmlNMw2GFujrK6JEid/dY9kt9kSOCQJNwWsMgK3n3dNvJLSv2IzC6s6X+AKLqFW/yKW8uAHBYnLC62mwpg1Qv0t2gcmqhbb+ZgySAOnARUTnghjVZAsz/wzQ6XIizHzoDGOanTMOpZvshYvnPWzBSDp2SzWRoKjkTsn6SPdTMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH3PR08MB9065.namprd08.prod.outlook.com (2603:10b6:610:1c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:28:05 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 15:28:05 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/ssd130x: some small ssd132x fixes
Date: Mon, 13 Jan 2025 15:27:48 +0000
Message-ID: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::20) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH3PR08MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: ee77445e-7c41-44d0-8bc9-08dd33e6e022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PG6UQAvKU0rsbkFf/PmztWvb4vYTGYv5WUcAeXr6vHF40Nq80xsVs1iKYNUe?=
 =?us-ascii?Q?QIMpeRSnDL0sxY274IAjJnmRcuBAmLvBkuT7Mugx8YxsaAK029U5UWX//e7g?=
 =?us-ascii?Q?nKcs2XA73u0nnJv023WNimqUQ6uwEYPvFJgzoaJxcCCF62PMoEcaOZdl70FM?=
 =?us-ascii?Q?30mwIZx7V8M/F8mKhD8C2hbqCd7xf+v26+1cV/J2fa6exGsFAcm5HIBHMxjH?=
 =?us-ascii?Q?8bnVVjsiviv66tfag+WnALNHEUtSSo05UPqPCpFfC1YwYCUwYgBm4tVhtESM?=
 =?us-ascii?Q?PH7g6NFvAdt8PSWiqC6eJQSb1rsOeGBoUw6a/krGNwIobH/B8wQ02vSLdecU?=
 =?us-ascii?Q?plCg96nw8u7+7NedwyyZo4+HRgQf0ddoWZU6Lc9z4FgMYHomgMTKKeF+/RHa?=
 =?us-ascii?Q?ss7M9gEQEw0TnNB6jkh3YDrz5zI4S+EADn5fTe63yJb3G20ZLwsx6Ocm2JqL?=
 =?us-ascii?Q?GMkW0sFEtbMT3TtTOkuBoZBs0fSx4XPOfixFTxmlTFk+qGob8MravQh68v0Z?=
 =?us-ascii?Q?s44w97rrCxDKcN+i8sZ28yHWPlIz73BfqtYO+1X+3dHuU75Vo8Tmt8GJmdov?=
 =?us-ascii?Q?Vex9OzL9wkbLclEyIrWhPIgk2oM33wRa7A7KshPw7jnBJFSjJwrFWd/L9cz1?=
 =?us-ascii?Q?/nzpghBYVEMt9cBtl0MoW7Qbim89xQY2scTmFg0zc51o5udVXpaJg2OkbxTl?=
 =?us-ascii?Q?q8LjG8lIe+COLz9Cas0xOWkn5uXYjq3G2Mmn6vifEwDV8MdYqIiSW47N7s5L?=
 =?us-ascii?Q?8EzPA7D9ztHeUw5MXyJsNCyteoC2HkUPong62gJhPF4mFQ5zZabgze++i5QS?=
 =?us-ascii?Q?aKpkgw7yicGZZ7gtN6LuALsCHQ+Wg30PlBptayQ1fAFJb8QLPp/Ou8NFNwRO?=
 =?us-ascii?Q?6/knFPey0getj8qWQI9ovx8gB0UIgm14OVciRHhq9mic1PjinPriArnec+wn?=
 =?us-ascii?Q?sQ6vNQAYyFbx23Sj1IbTfoTWI+iPyqeGheXzEblAZTLc6rsmpDfKxUjgkj6C?=
 =?us-ascii?Q?tpRc7OeoS8K1roYcKvQRuNd3DItTocyMypFJImVgnchQs+EVSXw7HN5UUPfh?=
 =?us-ascii?Q?JUuVSeaQ1+jqlgeKFSzafV7lZg6QJvNc011OfzD6syYeTRTzOdNZzvmMsNCb?=
 =?us-ascii?Q?4bBkoJUv++WqCM4OmruxMPLvtd5hTL2fyb44l/eClRB/TZsjsUYUGE2DhftX?=
 =?us-ascii?Q?0u8Bhw9cegMFP2TTEjj/EGvg8+yG9N5S62XSZ2yZsIkhJbPOr39hnKiGwjtf?=
 =?us-ascii?Q?+8Q/1w1gaPWG4ErAacrpUlrLny9GNNeubgQxR1Rb0AIgLMrHz4Dw2GYcyK8K?=
 =?us-ascii?Q?J28tIrq7McFACgbt3quNJzw9W8Qb/7G1fXrzLJSwo9DlOs8DlL9IJ8/7TlXa?=
 =?us-ascii?Q?AvoQpE4E6E6WflrzUOKmtcoernI+i2smw7cJ6pPrHM9LDdTMIJD2+NXhc6HC?=
 =?us-ascii?Q?rZHgx1LH8x1smt/doOz8lh6E9hBnpRc3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZMoJ/LXoO1OwW1n0vrpiHv4BXHm5mkFREyhzPGFBVEpXx4nHkyx6iyarduJu?=
 =?us-ascii?Q?mW598d1e5s1UH7Lfe5OfFVUBCUSurX9FnXF5ECtt7NT5ITKvQnt7XNevfYks?=
 =?us-ascii?Q?lhOC/TTlXblms/X9IhAkNK7ehKb3fGIKCOZHi0V9U1AlXzSiezKvEZCpE7uM?=
 =?us-ascii?Q?g1uLdBfuaCQMerFMlutjV+xGl7FzR2ARy6u0rFTYxwstak+KgO6/fq5Pv8eT?=
 =?us-ascii?Q?zfUBatw6lysYe9VcjStk7hyTlcsA3OJCUbJdPcqEsYnfjsIiYXplAZfpVosJ?=
 =?us-ascii?Q?OKDq0q/1gnvgjiH01cl2p+fO5XgACmkiHSeK+jnivHqyLgVfaPhfEuCx7adc?=
 =?us-ascii?Q?OntTSpLGcl9lLgad0qjKZQZk+WdcxQ8VKfKOSBlYNg5Op24nnGTzzFDssLvN?=
 =?us-ascii?Q?PPoZ7roRKnwauV6UUxJRHfbqV3b+xmf9ZoJwbaZ4z0BxlLrwi9PjMqYmswFN?=
 =?us-ascii?Q?mfK07VHoP426ElTK1Tcwnqvhkspg7WewS8CXzUy208US1C9nyOGbT9UAive/?=
 =?us-ascii?Q?t31oXJFJTOOH2La5ZXm9C8XLpzBj8yw7MrH947N8tVXCbCEbKTaFs4XbNJvg?=
 =?us-ascii?Q?sxh+iii7UPqZ1gr4h0DegGw34inYYmtCv8CeTyfqODakEcVwrHBT37MFTmt8?=
 =?us-ascii?Q?z48rlgCs4PLui6f+scsh5pUbWVpJyMpeQ6qmoq/nx1paXGkOFOCHDQ4sDgZ6?=
 =?us-ascii?Q?i5O7wXLaaDVDlfT42UX7HvdGTjhs3Riyo/KOpq+3cqFpPsmR08NJxz2IER9l?=
 =?us-ascii?Q?0I6NeGQYd98guLhoCEBsRd538GHH8A3WhYCpV1Ut7g04VEKOF06pbDHB6+vf?=
 =?us-ascii?Q?RUgLphA112EmU+9w1tmkFWBSJZWNoVJGMDEWKg3p+mpCe/TIkEFoH8RdePgB?=
 =?us-ascii?Q?TELmEp7OA4PNu4SgBKVuphnNNEJxuX03qLZQ88AopqEFp/A4dDDM7RIzq79H?=
 =?us-ascii?Q?ZekeCCH0jF6P0+8jbp6bDhNDroHVvKbyXTDuhS38vTXDNZXhgTe60XuNLygB?=
 =?us-ascii?Q?zW1rZeM1D6MpCWpQQTor/hbUYWDn6UfSk6RVVnB9S1I3CWhjfxmDi7IWNDGV?=
 =?us-ascii?Q?HL8ZeN1Exyd+cAzmTerscpd8waEbA19g0EJx/pMuQlheb9SylS61dJNG97e+?=
 =?us-ascii?Q?QrxCx+C2qehBziFUzCIHK855gKYeloOr1o6lDa8JmsXrev66iN+6+wr9XTPb?=
 =?us-ascii?Q?SIhKE1uXgtpTC3DJx4KBnKS42/w8+ezFTFETP7eNPvY4T7071XtUMYWexrv4?=
 =?us-ascii?Q?68o4DjSApJrawhin5OLdOjJXqg4hjXxoYyBt5yCRcZGytvFRuZTT2Qt4fG8X?=
 =?us-ascii?Q?UpZqK7uhvq2kWp1nQgKVZP5Jf8kCFlrICgFeNuv5RJxFRTGD7QROgtLEhF7F?=
 =?us-ascii?Q?2W+o6noQ9Dm+zYx5ji128F0jhMN2rj1VORluTBLTDzk8JyaK4e39MgfcS6dr?=
 =?us-ascii?Q?Y3a3GFr5frA9hpF9TCZ8T6ZZh5ue/Jh61MI1Q48Vx4LoY6S27AMUm9HpCTJv?=
 =?us-ascii?Q?Sc81uaCWhZCXDGIupE2D6t66wnOUhaMzFxJaDsmgPzw0CACJj1mI0smKbCod?=
 =?us-ascii?Q?fp/j1NaLhoukZbrNNsu4UGqHj6koFd/qhP509WypuvxH68B1WzbrbSIVyC77?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee77445e-7c41-44d0-8bc9-08dd33e6e022
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:28:05.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7Q6KFwMcSKXQAKlZLaLssUiqmgqRPnHtFcgNIJxtxNWJkw8Fjhgci7sgN8WQp83+1kiidc8z16UrWn0954TS7qjbX/loFUY9AOCC1lspto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9065
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:33:59 +0000
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

Three small fixes for ssd132x family chips in the ssd130x driver.

Details are in the patches.

John Keeping (3):
  drm/ssd130x: Fix reset timing for ssd132x
  drm/ssd130x: fix ssd132x encoding
  drm/ssd130x: ensure ssd132x pitch is correct

 drivers/gpu/drm/solomon/ssd130x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.47.1

