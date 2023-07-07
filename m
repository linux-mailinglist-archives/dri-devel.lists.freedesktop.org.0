Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5FA74AE7B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93ED10E54F;
	Fri,  7 Jul 2023 10:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2136.outbound.protection.outlook.com [40.107.215.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96D210E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCsjv7e/4dmohNc7CNFqXvZuoXtQ1U1SFsgpBYDIwr86ggZ7Ynf4EonxXufxWPO8joavUGENcGDE6T3B7PF4zDkKYtp2TRXCWt4ZKkCHZNL4omTwPLY6MRnxwd/Zj4ntxTlHg3scIe7owu2/5LyU/SphAO0eb/hhZr7TItXqiLOrXYmz7CpAGOum1IlpntKIZsuqx1dJj7UlKE+W4ZUCKkHXqSHE53hHivY9SeA5UtioCvf75+Hf8gdzK41zQlfwJxxsHA8ttYKHu93KL38oPQHAnyu3Pc921nXp1D4HD5R2J3cONwRfQcP+TZPHybQnhhMd0NudgI96av6uaKTQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jehaJjYBcWJh3UI/btKH4h5bBwUKDuoQfyuspv1XyA=;
 b=m8w+XOjpWtiAQG2I8AMNPmtmZ1kx9CcQBkxDAsG9JAWfj2lh/hnJjfpSz9qYOyVY5kopFQgZtWmV4FNBxvcdOc0qN0K4biZSkcGgHhY+qpdEWERxUjr87fFwRM8QJmZHEKko0Fet5q9PsPrJDLqyv3U0u7nV4mLW+M+DZCNUHIyUGjOcQU20qJF2A0syz8YxBskWMpHSRt05bmPoLaU5uh7UYrm42cu/Ba9mIIjQ8QN51vrvfbYNa75x0guNZ7vL2GSfqylJ9PtAv/c9DnEHgBY9e18y2n9RFbGudc/M9mrP8Yb8+c5Z9ISlyZze1jh+rCNk2fRfzFYzPvjS3z322g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jehaJjYBcWJh3UI/btKH4h5bBwUKDuoQfyuspv1XyA=;
 b=C1b75g53oCnrcuswle+ke6Np22dkUZDOef1RRB0LxQgo5q24QzS9XrubC8VP5TbfaAiR57D7nY3hydn8KDi4G7qCKl5+4J9YvEEs92IXWIoZIiTqMYFM4cSndoAprpaXUOwDc2KkHaANxAHrfYzbEx5zDpdRD0X7oVxmXmopO4PW8n0NqcNQFe2UeW5WWSdr+HYmrNTGvA3Osxwh3FIJ3uDpbWIROc26yBDRNLJ1YvJJ6xve/J7CB5P+1yeJ5g6e3G8ssqGEVCuUEDHMNFzmew1pJsk8Qfpymtrgb/TGAva4gwQVrfepHftHIkV/3EHcofHvum0AeWHIh/P5+0mldA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB6704.apcprd06.prod.outlook.com (2603:1096:990:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:20:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:20:49 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 03/18] drm/rockchip: dsi: Use
 devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:19 +0800
Message-Id: <20230707072034.48977-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|JH0PR06MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8e4c58-229b-42ef-232c-08db7ebab097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4efoazTjiPW/9Uw80GfNShkTo4RfmY2YPnZCa/fhmJw8g9fXchN9xuprtMFcu84mqZa0Aw9bDj66vSKPFDHxRYXmJxauJTFtSbzzvRv0vEhnj63NbJiuC9HpkC86H1DtTYgmt6dhmPnxAphlJwjSDrdUY29Fdg2lBiBbDcsbdIeF//p4JxX2p0ayim415ySE4m3WzeNKSjmg0VNM8bZxGLZgJUQtjVI5MNkzrlWSMP72C1snGZxEQYWMtRMAWAdzT5epNSXPXqgDigL9gh88U5XiVnEDultzXLXmYzlD8UA2sUQVjOkkTtEGvu1tfR/Nx34Qc2SwYaj68k9OvL+rZRMY/6bxNg9KnRreraaVQes3tHtLI/LdWF/HEmVQzR2de+EYbEpiGch32931iRWiuYEdiL4ikavSAGunzGyOZQL6S+eENPVTD5kqO40ilW5FmUHRHBsg6EpaIemigczAhz07kZKpkbZSWHRHXepwflGoZ2QN8Nsn4pT/CxT1Gkd4rnDVuI3iVNo5rGPuLqqfDDKoOH/RpYV6sEQIHQhi9q65UBInXN6QHxxaT7XVHYioXqQjkPMTmBaOSMGqxvbI6UK3FcUnDpZqOna3OGUGGtTjYHJyPm7ojcS5LP1OoOV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(8936002)(8676002)(41300700001)(4744005)(2906002)(316002)(478600001)(6666004)(110136005)(6512007)(52116002)(6486002)(66946007)(66556008)(4326008)(66476007)(38350700002)(38100700002)(5660300002)(2616005)(83380400001)(186003)(86362001)(36756003)(6506007)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z3a3J8K5/8u5gxTti7VPTYe3STyvp5AVClI7gPaxd9Od/HVeCA+uZlCWqQVN?=
 =?us-ascii?Q?KptksGLtIQHxgi18MIy4P9mYbeVLUBIG0LscDNmkpQJDcphTtPOH/x2yNA8N?=
 =?us-ascii?Q?WKnl6sfVfniNoLX6P85ogMCS7dNjGn4SkIJqLCT7D3mFAL1xzZnPTN4GvTQI?=
 =?us-ascii?Q?ak9sepGMBESTtZpLaiACZa5TUTq4JoCeMd4H9noZPPpH+v5ELKn+wCKRr4dE?=
 =?us-ascii?Q?iB9s0cW0q64pvLF7TR8LFSEc58T3WZqlalzHceNghVthIX3eF9Sjowc1LOrR?=
 =?us-ascii?Q?Ck7NYVOk0pGhlA17oLgW0sUw+CFVPzq/pddpiyMlBGprPzfwqC0PX0YxfiyZ?=
 =?us-ascii?Q?Oi6w+nB/ycn8o1WViWN3CekUa8i4MewUvpkoKbLzkBpuC8efGANQCSYRrm9l?=
 =?us-ascii?Q?k9+OTP+KcO4TT0dPxoKnu8RXXskU6lT08i+/xJd6Tp6tS5GHOM9iiwPb2O7v?=
 =?us-ascii?Q?mrzFU57o1p8F/ibUodTwndd4yqFGHYFN+WTbMLAuyWkCQvGlAUdjK/BYBngz?=
 =?us-ascii?Q?g6mLZ/An9bTlAxwvai6SMQ62HpinT93gpacsK/GVirAkj/MHip6MUd4lKLck?=
 =?us-ascii?Q?C8A4otJUTFUofWZQ5nxNNJG3Wr1oOjVqj6osHDWuRQg+B9TxNwnezu0mhH6Z?=
 =?us-ascii?Q?15DHQsUGslwCxk6b0dLlVL7bb9dBqNcg4iQSTPuy7E+DlvQoZMkwtYnrpZft?=
 =?us-ascii?Q?Ig5SV8Xby5r3JjaMIDYnUO2kbVX3Jtk9+xBndpNMZDn1tSsmp//QA4s3dbGU?=
 =?us-ascii?Q?+I7lj73reo97AIZKkUzO+ZysTEZT26VwrB3n++nuiVZdTf4S7sG0luoVCCvH?=
 =?us-ascii?Q?nH9J7hPmSgzCFO2tOHpvzr/lVflvZtvhDf8/vmlm3XvNFTe4e81PMG83m/YT?=
 =?us-ascii?Q?PPDC8eDC75KIWljKZy++39yuneJmVJc1RCSweadID9/wPrqbImQc6dN/z208?=
 =?us-ascii?Q?2KpKDqLEyZ+O7BrNZIs3sN+NRtjgdnzz3AmRz9Xd/qT3JWuGXyeloIwmCMiw?=
 =?us-ascii?Q?UtUuobWi3OQOS+DR22Uyf5mcSA65a3e0VuWuKPSKZl38zcv7foat7lpE1Yca?=
 =?us-ascii?Q?/VnSI1597ub3X8nPqzMKtuzsv+WGm35dJoUWSI+URBcBpLs8zmmXaQpqjedC?=
 =?us-ascii?Q?u42M1u5ZfgnnvX5FVk8QOcHv2DBQqcTJoRwWQ82XYPP9fABlhXM43vpIXdcH?=
 =?us-ascii?Q?B1+9e8TM93IvFypjtEw6hR5q0OUniWCM0DKWCrDHhjospj5UA14mxKD/9stF?=
 =?us-ascii?Q?L82lFbDfejCL6dKlg3ukQnxj0zMBZqZDisah5g6LSMZv0HRSfZWhAyPhvtSv?=
 =?us-ascii?Q?61SthYKZx51EL+UCqnksB5voU7jT7mmfyChfqJBuEVkl/WY+WsQu4omZwTzR?=
 =?us-ascii?Q?nhzNjL3xaTK2hoHf1aFYvPN7B9ZBXtO5FqCRf4A/Lr6mSFvjYjopBdnXJLQd?=
 =?us-ascii?Q?aSqI3KziZJxS+cSFORVhjse268NF7eKvaOxhMENyPRvomFRjY7tIQBST5cSl?=
 =?us-ascii?Q?R3qJnJ7eQ5oD9a5cPp2HCQLTtdL+FVyYMZPsIuBwSyxWgA9fTOL/dpnXAecB?=
 =?us-ascii?Q?DRa/5czmPLQdFYde6KWNj3VTQtUG7TYZ1+acD3aL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8e4c58-229b-42ef-232c-08db7ebab097
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:20:49.6774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VT/nuP5sWpW6LNVis5bATFb7m0R99s6CgJQtMbzXatH4gOXAdVddS7nt0LcNXklN8KU5hocIJu/kunDcwgIYew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6704
X-Mailman-Approved-At: Fri, 07 Jul 2023 10:06:28 +0000
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 917e79951aac..ab57df7c6eab 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1351,8 +1351,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->base = devm_ioremap_resource(dev, res);
+	dsi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dsi->base)) {
 		DRM_DEV_ERROR(dev, "Unable to get dsi registers\n");
 		return PTR_ERR(dsi->base);
-- 
2.39.0

