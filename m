Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B1972A55
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8584410E715;
	Tue, 10 Sep 2024 07:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="gCjWGfSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2089.outbound.protection.outlook.com [40.107.255.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DFA10E2B7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 08:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J69YG6mQz5lmktMPtEW7nPW7j17bgEOBg+80h9jIA7J0QfR7f5TeyZUK9ajnMHfVPOuEcqwov8B3f7PPv4oYMIMx+6aFn2YU0U4S2SQ49Zfq81lhWqAvQkM7JkBxy0O8saD2eJTaIfAb+Q97CxxXSRq+wfVX4cFghPmbyytR0dMAOh7fqyiDtU5xr+pD3g71zQ/VGDUuPINUOT1rTPTuqlYxQoWAhOuldDbyt+Uzu299n5FI8xfQvzQ49Oj2U9PbCCzOZ8f8aZfUYrcXkioH3M8qES7ku9B9T7+OG7K7Urzs+nc3zi/cLM3Fj6/LTy+NoWXUIu82yj+1k0N/iGAkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEl0d5Yp1LoVDmRqwC18nPJtFWOQ0PO2uavKQK+hIfs=;
 b=gGReZg8AgHjCN2C7Z6GCn8yibcYndTEMvwg2BJSxiXbj+VulpojRlHKQXhW64RnmTWWvyxumHMC+s0d8N798ggLERNNSSZqgZf5dszm4PSiAxFL5i2HBrXuNTPRAi04IXkA2AMs2hlCnfcqXjFkklbE7CRH/xO+Sc5BvbQZrwyMZaJ+28oRzMO/jQo5prKN8n2ozjL2DTighW0WjEetAWlJda+Z7n5Kv/W3OOkcBdqeLpgL8iSDkD4afmgCUrkbrm6/HdZV4U0cfskbAr3i5kRjCAte2Nc+e3ZoU1BqW8WpJ/ciGShcv7zNeOU9c6f+N5AqV86WVMhgHtxQg4zMy9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEl0d5Yp1LoVDmRqwC18nPJtFWOQ0PO2uavKQK+hIfs=;
 b=gCjWGfSGZDafx+7qDo7lNxpHpAriWFiE1FULrzGYRJYsZPiirVliTKkICta+cmtxe/ijQW+7KAWOM7BV6AmM23VGssLnJmvvQq2oizc8yOXkTlxJErIs05E2iT2vgVlcY9RXfY0YgQvj2I+zP1ZAHDFG3lxj9/WG9eLCmne5lavGwUbqtW4DBcM5gutBhB223DOtB3Ox398yPvJWtwhq6dWY0lwW835mwus+ah6yoGLotkTtbajaueqDinmwgcfj/VbjBVx/enkcKWg9pER63EoScztKcSb/fUeu29PH2MadXt0nWSxJR7C4I6QfX0IMP9WwgBS5tQPotQsDPeyJsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by TYZPR06MB6328.apcprd06.prod.outlook.com (2603:1096:400:363::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Mon, 9 Sep
 2024 08:06:32 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 08:06:32 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, simona@ffwll.ch, krzk@kernel.org
Cc: alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
 Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] drm/exynos: gsc: Fix typo in comment
Date: Mon,  9 Sep 2024 16:06:20 +0800
Message-Id: <20240909080620.35245-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|TYZPR06MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: b7434ca5-e3e3-4983-0ca7-08dcd0a65119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hpuMStoWGVaTDlNqkDyGdge4TiAJ60hFDWXku2kqvU2WTpgvahYuph4u7w4m?=
 =?us-ascii?Q?0jnZVrgD8Q6FYl95++gwSgLpQRXC5lhdYNGOLwv9UTYSVY37wYBLioTbw7Ip?=
 =?us-ascii?Q?aJchLH+nSkDFl3RQzqxmWcnwx6zofL6onjyn898sECArojfJXs3sOIO7T4Yv?=
 =?us-ascii?Q?B9ONLW4hM6r5GMojoUMeOrPuQpSidra2vqYypbwk4t1MtHBfu0rlEBGP50zZ?=
 =?us-ascii?Q?fpeQMawXL7KRld7acdbzIc5O5SDjK1Llw6PbdMWC+5itIlPJKxjossVCj8w+?=
 =?us-ascii?Q?7L8LR596I1q39f0jrS7Eo9JFNYLOgcGJpNWOuDI0YtaRTjXgarXcat1CoL5s?=
 =?us-ascii?Q?buRm7ILOdX3xFT+HmO9xYGVvLOPJ2NjfzTWYG2IyhXer3bFj7KWFKXCHwwee?=
 =?us-ascii?Q?gT7a/PROmbTwXjQRVnfjERv8Q+xvvLBTCdPc2WHZzsFjmaMa954yll6xlYFa?=
 =?us-ascii?Q?JVqmzfpgBMnVupeqI4ENmbo6YW3eIb7kTcemfUARX5zWBHKrBxSqI2edJnpA?=
 =?us-ascii?Q?4m4biH/p6GQaXlbusIMg/SEiQRwQx4eOaBchAhiySV+A5k7A7HkOeriU5h9x?=
 =?us-ascii?Q?2Rn+X6nKXCyBAFferPIK2BicBQF7M60grciyg6Z5xGvoDNYN/IwxHYZjZlyx?=
 =?us-ascii?Q?guduFhArJrbSgdfau6XlYn5AJBQwcCLx/S26fIBrnjJiyc9KSGFZD9CBT936?=
 =?us-ascii?Q?gN+0uzciqsFBvqTxAUiTVHIoNGvt8WnpnhmqWkWOlS8Z6km7iSwmh6zjdi35?=
 =?us-ascii?Q?UhP1JSqC4y/af0Yc8UoZO6R+Lfph6htRln/YWauD9SxuLph90L48or/O/xUG?=
 =?us-ascii?Q?E9gmQOmjVzES2rbEal+pfooxKjuW5uzyjPeJ/Q8dK8uuE/ym7blJdLEelNRR?=
 =?us-ascii?Q?PBgWvuVrnxGTWWQX9DL0ZAnW5oh6DUTTgddqWTb4odKX8dt2Cd0dTZQF90HZ?=
 =?us-ascii?Q?XVv4OGT+TrZTNbrMb1r2mJB8bHYU7FXIpsmNkM6gCiD3MoAsfxQIc3sfF5Qe?=
 =?us-ascii?Q?E6GRTgT9ruy5qO0rx97vIVzACk1+z1NuQejEigTVFaV1rcHm/+qcQUoGnXJt?=
 =?us-ascii?Q?Ad3aZI9MEP1Gb5Dl98YQArsx5smoHj/Kcgn5pa6C4jN2gxmOZR0kXlL2BHVa?=
 =?us-ascii?Q?LR/jw1eLAoBEFEdjSt24XYNzSO6w9TGJ4u7O5cRMsPfWuybL0MQkXXli2OvL?=
 =?us-ascii?Q?NnAJG+ZO9GGoB2T23k/u7iXqkGfbL+nc+7E0ecf2hM2JxQ9Bansucujtr7z0?=
 =?us-ascii?Q?p7m1MaiLW+W+vK03cuooL8sVZ4OMYgXVubr9DpXCteu73EbcmUeOcaTl6Y8b?=
 =?us-ascii?Q?vCVXME58hekRch6e5nQ6/yl+ZV0nudHnb0mMnQtZ+qM3GMy9Rw172MyVo1HG?=
 =?us-ascii?Q?urcLNCYo9CmhvYB0rl0G1aAjC5ZZyEtLhaVhN0FNWxkY0LPdRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5899.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JZ4eW/NxY/14DzqhY8T0Y+OJnsiSob0XOiegdmynq46ohy0vVM2SSI0AEhrm?=
 =?us-ascii?Q?XCmQAFWtIPdkDoSMMeQv4HRx5LQp5xKe0tZpib+NCC3LT3Om9s1FRi1yi+ub?=
 =?us-ascii?Q?k7ZsDdWY3+tsZ+kZ/7y0hjQwbnUDSbCiEOq6rExk4XhSYofBMOK6vpnzaAFl?=
 =?us-ascii?Q?+eyPmYOt1VRRh9eFeaxIo6cHcWgPoTjphd4xB2LrJ4RwhSS57Ls4Xc0OidnN?=
 =?us-ascii?Q?dTN7nCNUGKBOqJ79ItLXol+YZ4XLQfezdaVCdzQByvFfUWWIY7rw4NzUEpTr?=
 =?us-ascii?Q?8lcudQeUJp6QWmSoPgif0/OZIQDaDUc6+bQiWpYCI+ONpy8DxPotPBbDF3Am?=
 =?us-ascii?Q?AJHFxLNiBDU8qVF9Vu0XhBkbhqvp72Fkhmf14YTWkXVE7Jhjuw9olpMVvZYw?=
 =?us-ascii?Q?zrfOHrM9rRlGH1G/EGpcINhH1LJBVWQDdxgkF5SCni8w7Tb7dm38x1Ivfdjh?=
 =?us-ascii?Q?benRfGptXE6TF5+bsPbpdw5SsPJzgJWhTx853vZFklFK4RucpcNzTX2DTl6h?=
 =?us-ascii?Q?nbRtQpX8sWQ6W3vfoJwuIj99d6SFSVarcbH8Js/A/fz1pM63Vfg2RUBhLQph?=
 =?us-ascii?Q?dcya9CuaitJCtdLtzTdC1Ny5h9vxxWsroXz3OlQpm1KQRJVCHqqa1sl3zb4x?=
 =?us-ascii?Q?Qv0qGTzmUpQl6ymA1iV0taiL16LN60Xd0/JXNqZnFv1xT79UmbpKFA6gLxGL?=
 =?us-ascii?Q?t7F5EKzjdKaEoq1VZzp2w28US4rPCWk/lBj2A0fAujAUmQtozYs9iNq+lpM5?=
 =?us-ascii?Q?JDx9zZpgwM1Kdb74ukdaz5lNvrwVhyv9sveKs4GPFy5nk6FbZ5NZiI6HRHul?=
 =?us-ascii?Q?RPjMargV2gXubLjuhyNn/HAMh7rCSA6+s58mxpQuTBeMbJFGc5/e8wu6HpaU?=
 =?us-ascii?Q?f9qWtrFo+rXxAkRMwgsWox2+Hd8Ghs5nhyy2xBuld16eA6ptNO+P/CgRLk53?=
 =?us-ascii?Q?ThPKeQWusKv2WSuQZPnIvLIHpXA11nu4RCDEYfubHhwEjILHI2u0k9rvtWCq?=
 =?us-ascii?Q?jgx/Lz+f2xq39EAHk6oNaGw3K6YX0cwwjBEgg87FCqMjh7knPscyeXc4dEiC?=
 =?us-ascii?Q?UbOWEyzgEbkcxYuwUItxk7NFYwlskC56FN1WEv3Cjic3+fux/UxOxF2xu7Rh?=
 =?us-ascii?Q?IO+Wn1g6C+AkFRXk1FsZGobFtzMRyFD63jkGxnLcoj/14BB7fGNbJPLtftIX?=
 =?us-ascii?Q?z5K2XBvsxvOgNP0s0HQeXQxmYqgBC1kjKWfYXtYjkEa+ILMhp5FOWuceUp7b?=
 =?us-ascii?Q?HRylJP9HdINMn7oNqOYJ0kKtLqtefOGKuFII01zX5MI6Dqo9OfRICUyc1N+8?=
 =?us-ascii?Q?WKGDXgfzfI1KJyOhfnUS1k6R/YQ0K7j/WkolNfhNFJc/aD3N6fsnk3IgT0pb?=
 =?us-ascii?Q?GzBRAv5CWVjLqtYwEhRbri9EUYBSC3tThlzh6LbgPKVEvwzqgHd/AE03+ADw?=
 =?us-ascii?Q?aK2F4WCZvpGkrIfxxkmWdU5JpyqmcdD/rt8RkH/gQ816Ask1q2hZDZtfrHB3?=
 =?us-ascii?Q?BinmQVBC+yVGXb7CXAFCTomMe9AMXWynQuujwaXZwdzGce4QhKfRm3AN0ZAW?=
 =?us-ascii?Q?RYZUnVk6Hn2eej6+3XONg+LymEyecIRI5qPJ83de?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7434ca5-e3e3-4983-0ca7-08dcd0a65119
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 08:06:32.5774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny0kVSDai1DHscvRezT1iZA2BDslt4JnovkyFAhJOOh2NdnebRk8NWeDI0PqrfNQf/fbMrhQr3+lkyf4tlocRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6328
X-Mailman-Approved-At: Tue, 10 Sep 2024 07:14:50 +0000
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

Replace 'initailization' with 'initialization' in the comment.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 1b111e2c3347..fc5fc65823c6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1286,7 +1286,7 @@ static int gsc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* context initailization */
+	/* context initialization */
 	ctx->id = pdev->id;
 
 	platform_set_drvdata(pdev, ctx);
-- 
2.17.1

