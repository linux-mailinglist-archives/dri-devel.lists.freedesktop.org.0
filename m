Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556F6747821
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 20:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503EF10E30F;
	Tue,  4 Jul 2023 18:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2128.outbound.protection.outlook.com [40.107.215.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB4F10E0D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 09:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD3ptZbLSRgoTa3pSnxhoyZp60Tqm2dyy9motq4/pdVS44YBtBGM4nE46OBGt70TKkPGpk4BDh0huXkeHbNeFk4c4N9PzNgOotyNuGCH0NnfXEQSNQqtbugj8vWT4LCuVeW2JMWbUej2OISw3UJ7mwvzocNdAauL8eh7QNW7cfK7jD8Fh7+ErtsfXBIOcddyAwV+PLMZL8Uo3sniuOAHD6OX1Va8NOEq3AdoTgsV+YP/i/ROB1nzJcxE5ql0AFoQKFsl2L+ckdgvMHRVsfnFGe4KgmABoFOBYqHv48+vbGrGuCw9rdEhl75O71VNI7Jay+zSnVrKr4iW5D3vyTH8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czZggQmv9oQ7vK3K20QsgpSOBgFoVIKa2AxRU9FHdoU=;
 b=PZcAQXVmTlh64qHSYSrefqP8nL528M324F0kmlDMzGxO56vKKG+OiUws2kR9fbhAbJzYcQn9NfjuwF8dFF7CRWblulHcAPJ5eNG3DKDaV/8ewvXQMKG9cMsJZ71cU9FRW/UNWQ6QyYotoWa6wyciTdjgVN3SNB3Fh2vOxllpMF4cuxz6JrmrL4Atyi4def61cw6V+uwR9hK+t1Kprpw9cDr4zklGhVRviCOCfuafGdgTain14U0EK5W1WX3PA5QL7ji5vMf/i7bMR77lbj6AYUNStOe7v/mhabincWrwH656qpzrWV8K7VGVsqI5DrBKUPbKhT4PUcVDvjPdZz8xIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czZggQmv9oQ7vK3K20QsgpSOBgFoVIKa2AxRU9FHdoU=;
 b=Ebfdag2G+7NRzmuVDWXQRUNPAbFOS5VtjmsJCsOzzP7/+3c0IOziWLwj/2kuWmUco3DUbVjT3ztDU/bKFlkNwASApJ0zIMTY+E96KjHPEnlDp7+A80xhHRYnxBHIOgVOKkHIbqydry9phTtpB1y8FMPasumslMvEBgQ6rmxVWdedDtwIT0W8tdcEZRy0ZIo3jcolTz+BqNUsJ3HJnp0rbavGkyXXyZd+SCRbwdUT1C7jF3AU4RNQUDi9hCNKO7av3vQIHZpOztNSHD89AnrkI1Kj9jMol8wMPXo44whBWrJotpTzbITPf3Dg2s1PmyoMNOYQRZ+ZYFGkGdG110TFWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5565.apcprd06.prod.outlook.com (2603:1096:820:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 09:37:08 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 09:37:07 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Helge Deller <deller@gmx.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] fbdev: imxfb: Convert to devm_platform_ioremap_resource()
Date: Tue,  4 Jul 2023 17:36:52 +0800
Message-Id: <20230704093652.18191-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0153.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5565:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db4ad79-dc31-4a45-ef33-08db7c723bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dGefYTqL1LfiVIWrbAAuD8TL1p+thE5qXvmr42luJX1F8Ae0RzQI6WsJJWibgd2VT1lqzpFpyhQKXDYiqaZUSQukLgggVL+f2MQeZnbV9Lc2e6LXZhsmtshNQ7TCXa9xdWoZQsWui7u9bKMyxpYoRWXCedDuhtCimOg32rFx1Tktu8u3qWXWdCiA9L8vozgkgLSgPTRH8z8e/RDii2dewN6OO2TqA1sW9Yk+ILIXhm1cjB/7/OaaoQFGFtyk91ijy8qLwY1wXVzH5QPDl1TGP051k8sxkU+UsZwhXDTY/C6Zkq4dYwE1NbGWx/lRDwcc9zCIeEfl0F8dCX4hObazISeiv+xzoNM3uoexlAgf/uiXbmHVFCJS2lvMPXhL4gSIW9Vfa6ba7XXnJfgG3w0Jpfbzm3Aopi3ObeZ/g75pT/hMqUYjEM971I/IjocRXm2xikL2Yk5eme0Ivri9ww8zz1BhrWOWa5GxK26mqo9gjI8+oRggUIQjsmCg48CMK5p3Mk+ErUymHQQE2sSyJCvWw4iKwaXJTUq4Nvylm8eE6ZlmUt/apQTD9x8iJqA9sQxYh6rCeBRfJpok12YVMRLSBDxsYEErMRxFG+nPH7bqKKa6c0g3KeQFrimKktfY6tu0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(38350700002)(478600001)(110136005)(6666004)(5660300002)(7416002)(8676002)(36756003)(8936002)(86362001)(2906002)(38100700002)(66476007)(4326008)(66946007)(66556008)(316002)(41300700001)(83380400001)(26005)(186003)(1076003)(6506007)(2616005)(6486002)(52116002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFyLGIWqcM1mdT9PvfNOWAmhFGeNeowqoSZevXQ+MvcL0gHZsfUsA8f0yNS8?=
 =?us-ascii?Q?BiNS9IDVQSnQLJ4cuqOwtWAKN2BF52360ydqKfnsnIX+Ce2/W2Bbp+PdrY45?=
 =?us-ascii?Q?eP5pMWbE0hCqTvFp/8QltJQ3EH00pxJrhLJFo7Go0DnmxlcNN6NFcLgBx543?=
 =?us-ascii?Q?l9Cdoc+K3tHw835GWEyee+Zsqu5R+UkPmm1Od2rXj1rTu3BNPF5Bxh+ByJGo?=
 =?us-ascii?Q?e++LTDlq3M4pqmohJe+1Q9K5XEHFp+iTaqjK2Yr5S4pj3h28EEUWAXWhtru1?=
 =?us-ascii?Q?0QaFIqV2UZEMgtVyT5Sqzao9zM6/0w1xmkq8E/2K2f5bHmvAwcXd6EMSx1n6?=
 =?us-ascii?Q?wcoJ9yD/pJdKdK17CrasFRJV+zA2jjqk4uHPSd3Hc342AgbWQiyVAkQI1C3c?=
 =?us-ascii?Q?Nxz2b9SSVMwaKtC5fmTQI6w+HeBU3tTKygRjffGlpjJLygbVX+954QhiniEQ?=
 =?us-ascii?Q?cLYvHIdFp8Y1rsfVxphlAQiYxEwjs1TAHCK/cFaCx5lDMYZfAI/h+dI4Omrk?=
 =?us-ascii?Q?2cf88I7zHYt4MQgI1XoYyxTHwO+kaWQuzT+OqqQZzEXZLFh4CL4yuKuv8wJe?=
 =?us-ascii?Q?PyEU5WED7mlY7sxSIKU+R8Mcbo0U3oj+cqC6qvdQiMGMZ5rbTuq4SkltXwyy?=
 =?us-ascii?Q?Igc8C2otbpv4BSKNk2rUDanQW0ir3QdTFF5fo68+q0lVPrMxJT9NG21faTxc?=
 =?us-ascii?Q?PC6FZPVTifMPsOsA8Y5mo6uxlfCDPlIEJf/jc8RFU7JweAJZogiCl5K+M7/E?=
 =?us-ascii?Q?cfMKtX9W2VQACZfOjUXTWlB5mxS7vKiYeQWna9/o8TkoYheuP5D5+qAz0EKu?=
 =?us-ascii?Q?KGhcf+LRmUNuOdFUHYuofUgenc0NRBDg/W1JFEDUiU/nRCgBIxYcoP1otClO?=
 =?us-ascii?Q?/e9DTRXQPOczSpP+4niT3Q99YmAyp9KTfQDwZqqaZTJmqs8thj91y9Wuvh9Y?=
 =?us-ascii?Q?2Wk7QH8RmMslosx7AxJtyzHMD3JsC203R5Al6aPS6KQh8gjXoSyD1X5lKsr+?=
 =?us-ascii?Q?EYaNCYCcJgIPZihhC3qBwG1dF0A6c4Y3mVbYqtVYwbcXoPuyj9K3oOJ/TAqa?=
 =?us-ascii?Q?36YU2cQX22+LpP/wyyIJHAl25XtJoV10V2VVZ2hcxfgsZ/W8UgT7BqEYmKih?=
 =?us-ascii?Q?+HwEhNXOgGy4Wo7aTZo0VrR5T92DpFej8qpavgPd9QLdCCFKAK//KX4MjyVF?=
 =?us-ascii?Q?g6fwWSa5AP5kWdossCDCcDr3MdshIK0EgzVFVUVvTx2gWr4uEia6BoGlsVYo?=
 =?us-ascii?Q?lYOu2XNtNS+sIMtZfzWWiUP2xhYf9mXu4UcBCcJni6MRlYiNsAsRs9donkaC?=
 =?us-ascii?Q?XypBVHN1DwE/sQR1BHiK8jBXS4N+8acm4xGFOKHTJCKF66uspuQbwSClSXYV?=
 =?us-ascii?Q?I4QJLVjFY63ZicLZbb2U2JsfSV/PH6Jwv9PAblDpKcsxpIf/50YajSP1drbD?=
 =?us-ascii?Q?Nf4CovDfoXGSeohhf+2ZNtFf/pLgjoy485CMWHN4SBiqOzP45AE2sG9jlk14?=
 =?us-ascii?Q?0JkmXQi9TtJ8WJDhmFQjr85Xadlg3xeEYhLUN7LLtXp6k2CP+5SLMAJgy9j9?=
 =?us-ascii?Q?ZSzzio5HCuRASx5or5BrR95g04NqdzpltUhyZAbu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db4ad79-dc31-4a45-ef33-08db7c723bf9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 09:37:07.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXMfePyIfciwW6M3kiMx2C7450yCVbENLe2Tu9v/BW7reFpTSKAGNgaknofJwYkI26k8HSA0wFI8YnoPsxVlWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5565
X-Mailman-Approved-At: Tue, 04 Jul 2023 18:05:31 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/video/fbdev/imxfb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index adf36690c342..517eb65bbaa6 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -868,7 +868,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	struct imxfb_info *fbi;
 	struct lcd_device *lcd;
 	struct fb_info *info;
-	struct resource *res;
 	struct imx_fb_videomode *m;
 	const struct of_device_id *of_id;
 	struct device_node *display_np;
@@ -885,10 +884,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (of_id)
 		pdev->id_entry = of_id->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
 	info = framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev);
 	if (!info)
 		return -ENOMEM;
@@ -970,7 +965,7 @@ static int imxfb_probe(struct platform_device *pdev)
 		goto failed_getclock;
 	}
 
-	fbi->regs = devm_ioremap_resource(&pdev->dev, res);
+	fbi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fbi->regs)) {
 		ret = PTR_ERR(fbi->regs);
 		goto failed_ioremap;
@@ -1043,7 +1038,6 @@ static int imxfb_probe(struct platform_device *pdev)
 failed_map:
 failed_ioremap:
 failed_getclock:
-	release_mem_region(res->start, resource_size(res));
 failed_of_parse:
 	kfree(info->pseudo_palette);
 failed_init:
-- 
2.39.0

