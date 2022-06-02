Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39053BCEA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 18:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5FC1131F5;
	Thu,  2 Jun 2022 16:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2093.outbound.protection.outlook.com [40.107.255.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDEC112C90
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 09:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea1VzQnzoZEYR8Xo2bKW95+qPpk37s6jP/Pe9mfPpgxb1Ehyi8Lm9u3gmuahWilRefQzne6NmMn/9kXYu1HsbWSZK8telYm5WkpXsW2qXR0HZZF0n/BSXavUUiLVtUmpqMmMVtQY4RmWC+ZV4eW5x/seZMU84OorXrUxcoRGaHMR1pOdsqv9BbXc1aS2cEevoXZhqvdeHPnRDo3m5jXhbL45WkQo4RPv3OjzqO906pVmBF1/eHeF1bP4R9BbXnRCXIbyaHJU3h/t5A+AX0WFrb4APd+Fo9rmXSp33HvU8Hi2+K47RKUba7rNW7hwsyJRtYoRqh114u/2JL2H9HjkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmFQTQ4pQcjHlySgG2/GWhbvEOMT3P7YmUTQJgkB4AI=;
 b=Gw80xbifDIZxmHZf5mS1wUlVlvy9VSUs+++ycKQU9IjzgOERTzzmaeQisflbk0JeH07Wr9YplqnI/JipOzx7mG+bAkXOD7Gn5FsxfSyAHYhSz4Q3YANgAJmurGqckB8ygYa9wFCC6lIize8dSOlZBAdzAoHGIIptvqlCekxOwhczQ72ie75JD9AXHYRpaENB8p+LOI8j4KSp5PQx/8tzRWINlAH1ghpjA5gerd9Lap7UTghhB9sxnRZ9zr3AhKVIgrIr4Ns9soxAKermNlL2KSA0AgGQlztEfAy8NQqh14P5tHaydUzdEPPRU4M9p0IGyqcvBJ6kQ7wc30vJFmleWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmFQTQ4pQcjHlySgG2/GWhbvEOMT3P7YmUTQJgkB4AI=;
 b=qF218vCHyKAZNB7Py1ZAmWKVLH7I28Co8ufUmHz4jt1UdIu0I95wgC/1nEJFCZMT1UFokl4vNAFZKDl8IBcFuPyekY2cpXxRuTxoaTUCkPJXxFcBZf50fkZOEDJG9CrLa9Y68uxp2vQx5QRvfZ+KqCmFO/EeI6ewRHxB80LA21c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by KL1PR0601MB4323.apcprd06.prod.outlook.com (2603:1096:820:75::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:42:33 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb%9]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:42:33 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: simplefb: Check before clk_put() not needed
Date: Thu,  2 Jun 2022 02:42:18 -0700
Message-Id: <20220602094219.13024-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8504cf-5519-45b3-9451-08da447c37df
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4323:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB4323DC27EC9420D930F13036A2DE9@KL1PR0601MB4323.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nuCOCUg2L2CnHVkruBPw7sxiZxxTJFZEzfCA1Yq+p4f6HbyRxz7mXgGUu7i0AF4sAn3GWpDOpDkMeM6bhu7IaVjbQp31sRDXMhqxrcHpvDCkpRVozdEJCr8COzcXs69If5ldbhjcnpoy53Z8VbYlNLWuMJ7p6/AMEsM8iPpvArqSzxaN+6LKJnPy20xNdh0O39uS8dnO5LrJKVSU5rjbbSlM/iiYLx3QexPRpMcO5iXBNQzMYMWVFPgNBKgj9AGkQA/Y44T7QfJg/Y17cVPI5aUjj5QT7euYZm9ozheMLk2YEfoDDh52vuLFCEOo24Df3WC91/UEoqqNvHQ7udN2OoELtIjWdShOGJJweCfuehZydt4xhZ0gcv8/ZyGy5W/9G3RRDb3R3GGk0z8OUHo87dwMQqw1SA8Dy6KSsTp4/Vsui8ChU6O81ZPVlQa1bXdCzpGjhLbiiX6+lfJBQDI8KLGAkJWjoHdu/G2im942s8hpNIOBwprpe4hWw3d6vgPvwcGuY1/aBo0EXrcjZmCmbdRm0QjzZlgZYGQCNmUmjVjMyj0zmHLlU6P7nCi5ILungv49Gm2Lg/fLRezfTkK+VBzvvvZRdaz43T/X1a6acLtITLTDiSFlJ2K9LyUR0htlJGvwerrvuCr6F1E9GjarZAWv/GR6QkCHJzIv4viicLPeV9o+t9sCdkEyPeqEWK7gwOHjmS/YPO9syZCidSr6XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(4326008)(66556008)(508600001)(66946007)(66476007)(8676002)(86362001)(110136005)(316002)(83380400001)(38350700002)(38100700002)(2616005)(186003)(52116002)(107886003)(6506007)(6666004)(26005)(1076003)(6512007)(4744005)(8936002)(2906002)(36756003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VNr1WvJpETFGkk6/nDe50RELnVifupDVsnjtQ8ut/V5vXVrb1OkYwpYMcUkD?=
 =?us-ascii?Q?nozalz4Qsv1NwP7opxzTllXjxewlTapTxyjTrGHXmLeju/SvVkwMQ0/oKiTA?=
 =?us-ascii?Q?YuMAiFcaCqUTlRivqa1bjXdVY1YeweFuiV9Er7LjS+Mo5RmopuNUXfgbt2dS?=
 =?us-ascii?Q?Zn7A1qilhH9WOlvy5W67/MSsTnqpjnok1TjTukN9Rzkpe9LrUeTiWNcMy3nL?=
 =?us-ascii?Q?KvIA2n01DcmLuXb+1u0NIDTk61pqXEkmSkyEuQ75QRpIe/XsY8mVvnq2zVDa?=
 =?us-ascii?Q?JE74tQjGH0rz2enFi8jXyi8zH80J2ynwj1fGegsx3sxun9IloQ4Bj4FB5Vhn?=
 =?us-ascii?Q?w5+HxAEQ2tS3tO0+RQ65SSG97+GPCaBRkJlNmwiaAjRoaxhmDC+J9FTK2tQZ?=
 =?us-ascii?Q?alc2YtSqKZ6j8kL95jOwZftkdztxcOMLlPhxVg7UZVChkK/wBm26NuJ0TRLX?=
 =?us-ascii?Q?aySdufQY6jpLMpZD1zGn0cN3CfRy6FFUB4w+pzfvzXz/vbtpWzfsub3M616a?=
 =?us-ascii?Q?/+V/554vLUHdRUcPp2HbGpORTt8k+bEhrYZ7bWrKDDOkxB0hoc9RuZxbDoqf?=
 =?us-ascii?Q?eGOPzPPsjTPe1ZOBE2IAj6aB+l+/27uCVqvEirJH8p7lMUNbnSVhu5TC380z?=
 =?us-ascii?Q?Wii1wxdin1/jdh/h7OmB6zNHPius4WRrMQ2xJprfKMZdsKCXdX0JpzdBGYxI?=
 =?us-ascii?Q?b85hmDK3xnLaQCqmGsxqsHWeSZEyMYgtUk993kJVdZdyXY/Z0zj88EAYMHqN?=
 =?us-ascii?Q?Hgv+6bInYZfBJR5qTWlHTSzcLlmKfNjRG8L5v6xfwb5QpMCkc/iuILU69HkB?=
 =?us-ascii?Q?GzWsMM0sGgKDG13WD/DsQvCMGccmRiSnji0dIs+oDS90IC5lvhJIw1h/XQbq?=
 =?us-ascii?Q?Ax/WUn31xtESlmRRVV9wIXnGj1W6RGOyfzlKb2kbdFGB0sE0a1RzlPjPS5y7?=
 =?us-ascii?Q?4LITGRwbkGUftg5mj7XvqXdR3WKijg0PKOoBT+koLKJ2tENncULnolitnLts?=
 =?us-ascii?Q?/xkwDPUlEA6/5dVDey0XzxoEHQbN5wxuMDVrMxawmH7293oSJGy2BkgznxNY?=
 =?us-ascii?Q?xHjpw/nU/ISgQHP1aDqTOGtE6nLdLc4n/GKRI9hmZ+i6s9ps5vfMa3jj2HTB?=
 =?us-ascii?Q?RZM3QxeEyED6f3KmMBizWX1Jwh5OAkXY4oTyCVC+ViVfwl82MpaHprjH1BA3?=
 =?us-ascii?Q?KHEYFAk0D14I1rySCO3MxdaYLJF5gCZ6+KtPUPBENfQokjMb9GyQldSBVSLF?=
 =?us-ascii?Q?bF7JGHSP/G2Ax+kRA2XGIWuJyR2AEHZE2/CYBsQQH72YeeM9H5FXWqGDNFIU?=
 =?us-ascii?Q?NUNyhnJtR+QX2JaeZzk/yhdzd+PCcoImJLDk0fuCQ0DbCHBaBDob257prsef?=
 =?us-ascii?Q?t5wQKBz22rHOBHrqjSuecWy0EfnuYSKmRWzqufTuymhG7KRVhWM60eiUuRwm?=
 =?us-ascii?Q?k6OJd1w3VIbCEUKsCj72NoVQKx7oQ1K9VV91t48c9mEM1yBLKqeWr2sKuqtk?=
 =?us-ascii?Q?8c9p0I4UePimOQJlBvZ/5oYuHzzRRJcoBNRNcFuZN9IuTkd0dmnp5ceT3st/?=
 =?us-ascii?Q?MgdlMB01R39Wc4aOgtd0nQaz9fO1OFJbQSSZUSuogzA572MsDPmEeKmzuyYi?=
 =?us-ascii?Q?eLrLRAJ6UNkGkW/g901ApDMhXVFy7qKTbt2gULZqQHIEXl5yopMxhxrXuXTK?=
 =?us-ascii?Q?3tUw/NQxLyP6z6ar2Cp1wHkrY4eBB24vw4THsrCj/wQeVZynoNdbzJGGHrnD?=
 =?us-ascii?Q?fuQZmY86jA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8504cf-5519-45b3-9451-08da447c37df
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:42:33.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJcU3aaSpLxFGoB8LlLNMoM+JkcKIOOVuWkyeUMbeRSRuM79F1ONF50LXJ/CnnTRtPJU89sd/bLTOprEnLyTJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4323
X-Mailman-Approved-At: Thu, 02 Jun 2022 16:56:21 +0000
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
Cc: Yihao Han <hanyihao@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clk_put() already checks the clk ptr using !clk and IS_ERR()
so there is no need to check it again before calling it.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/video/fbdev/simplefb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 2c198561c338..f96ce8801be4 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -237,8 +237,7 @@ static int simplefb_clocks_get(struct simplefb_par *par,
 		if (IS_ERR(clock)) {
 			if (PTR_ERR(clock) == -EPROBE_DEFER) {
 				while (--i >= 0) {
-					if (par->clks[i])
-						clk_put(par->clks[i]);
+					clk_put(par->clks[i]);
 				}
 				kfree(par->clks);
 				return -EPROBE_DEFER;
-- 
2.17.1

