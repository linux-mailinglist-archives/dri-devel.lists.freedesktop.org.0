Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A776344A4F6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 03:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046D6E81B;
	Tue,  9 Nov 2021 02:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2113.outbound.protection.outlook.com [40.107.223.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369D6E81B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 02:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeVHxKtxr4PSmb6Dv812Uw98FRUxGgXSyo6qmr+HEolJfWbipMSv1rLpxJ12hh4GieuQ6j6+uJBPftBeCswCkK48X6+4a6fczv40LbFbe5xTf7DyNYQF5YmjMIYSiTsaCkbNQctWt2ZGRchfWMa1fdfdsGJeNJF8QacSXiwGd9GuYmL5AA5KeSqE2w+na/nVlXMUIlcL3ZJWrBHPf7hsva8AJcPO3PiQVv7oJ7isnLi5ds8dEFY62thL3P4VflMysMFqDDT7uUVuM745euHvcahNSJaHNmZ80/yxvb9NKayeJGdkPcgeHZk34ASNufrpibsJfPOdOfj36HVZ9CJnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTFouN/x+LWbEbpDhb587BfVESPpzBDSBOgW6yVE1OY=;
 b=KiqsOBny4YDFD2mRy06MYhsOOAc1QZXvEz6+j1bBVo2tIoyfr7RnELvLJHIXj+X+tRqoQSP1T3FJxhZx4Qia1Jf+ArvO9Y7+XSGzdS5+NjRrrL5rKFnFAEqdAxy0szck64kO96K2intTLm9ZVixWZZLPbtb7miKUn44mwsp32vslJF3IzLYlQ1sf4c3w997NNbTbQIpSdEK8KCRAR0mbD9YwlEHe6g0zLPUWXXedLZChHKBgiSMmq5MFrInz2GmCUh8V37VsWKTiFX7dGiVMB8MBijMimjc2oivd8n/te3nWiuPkmexS2HTQqY5q6JzlrATAo/Ggo7QwhHvx/5Ws/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTFouN/x+LWbEbpDhb587BfVESPpzBDSBOgW6yVE1OY=;
 b=Mr3G0iDQJKcJH62+ZRq+ivcTKyFqo0a1+paO1aQsXGlxixsggy1kYJfwdZ0cBPKLHLUC6K5Mlp8g1vKThDHSla1jDm8SSNIxENod+odrOxXt1mZHc2cmFM+WESGzzNfV4ia8O81kSyYj8LzHvHVOU8GK5H525Gb0b7A8umSQC2k=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6566.namprd04.prod.outlook.com (2603:10b6:a03:1d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 02:43:38 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%4]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 02:43:38 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH 2/2] drm/bridge: anx7625: add audio codec .get_eld support
Date: Tue,  9 Nov 2021 10:42:37 +0800
Message-Id: <20211109024237.3354741-2-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109024237.3354741-1-xji@analogixsemi.com>
References: <20211109024237.3354741-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0179.apcprd02.prod.outlook.com
 (2603:1096:201:21::15) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0179.apcprd02.prod.outlook.com (2603:1096:201:21::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 9 Nov 2021 02:43:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f2c897f-5862-45ef-ebde-08d9a32abba7
X-MS-TrafficTypeDiagnostic: BY5PR04MB6566:
X-Microsoft-Antispam-PRVS: <BY5PR04MB6566F2913FE947431342A764C7929@BY5PR04MB6566.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlBE79xPyS2NzikXOQE8tAWstFTjskXQzZSai2ntFMaWTyykRmrTUYLHYa7rbne/HPXHYc/YXEIUY+PQ+vumXd0GvM61BsaRQb+19YEEUJi28P/oTtctk8ynoMc+cP3KXewHgFwRjKpTlPr5cS3gLi6g+GrLph8C8jYSm0uxK/kL5BlqwFmDSeMOrJ4DvfHtIByIV8MclAf/Xt9kqIXP8FXGCduu4e4xiwv9TnwMzTlv63clqP3mS5mA9x9yaXHHsToAcNg5nT+3XvkmSvw8mP7J52TpAO7OjrP8jsW9cUs4VFwWYScl8lxRud9JYQawQaSAPGFfgoHXesx1kiYg9RS7VmT7Ni4a0g98nHwYCJUS4OAoTVEndzVynTFVGj5QgfBQbN5G8ZgGQ2aLNvj3TUDu1RVjDVRvpl595iAlxk8h59KZyM71F4RvWUHgZkBcggHUJVh8hmpEUYs1B/ykyqrOYZ/L4MBWEYz2er6B3cslRsr7Yq+zgrDafM+t7BPqjqolkAiobwrIGS54S82DAPiuk7XU88yH0cfJdkRT61FEmJ3Zm+3jnlqZw1xg7URndVG/ezic94UzJyxGv+pIN9OtMEH5/LJb8hMbCK/MUfMvGOr9pOwn4Xvwk5AFRGXKQGYICG2nT+xTWPY7CUo7DP+e6wDoFqDvU40/hJ1Za2GSA4imLVMkfjXKkf1uI3b7YbNgMOILNQFPw4o2Seu83hWDeTBlES5S0MysZeWPeRAVc9WDU3b22pvwITAq+27u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(1076003)(956004)(7416002)(38350700002)(6496006)(508600001)(38100700002)(26005)(86362001)(6486002)(36756003)(52116002)(186003)(2616005)(2906002)(66556008)(66476007)(5660300002)(6636002)(8936002)(55236004)(921005)(4326008)(8676002)(316002)(107886003)(66946007)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GzKQdLlPV6dU93o1zINQG3kDoTSI6jO8Cf7IQ6koKpyJ/NBuItCMeCslBuB+?=
 =?us-ascii?Q?8mnRLjV6zbH32h/VvP+ze1Xt8DnNFJVkFzXvX+fe0rpLozAR117DbXfAU6lO?=
 =?us-ascii?Q?/gVLHFcdF4GRgWgG7Ex85bBu2VOb1X94s4d2Y0tbNqX1OvCiwAykCIY/u6Nh?=
 =?us-ascii?Q?prMDEZE+WYyU28Q2IhCNUBrMgoLK5QZctq3GYYgU4Izsygf5dslM8sd+SdqH?=
 =?us-ascii?Q?PYeg4L05naJKCr0dR2NHI0LJbh/TGnaMKSMEiErI/Q3/TYDaf6pkLxDIqT+w?=
 =?us-ascii?Q?GPofYHTl4KoU6RLgnHxmNgqNTfPrrpbgD4MZQhvQjVVn6vPBTW11swewCjJt?=
 =?us-ascii?Q?htLTzJ8qbtei87AhajPPpGeqZQx7X62/imdT2d6fgt2DU0RNTYT8vAsLmEaU?=
 =?us-ascii?Q?ddHMjLrL4QngaZ3v6o8UCPiceVeNXiBqBJi2MWgCSpxiCE7avd+1HECppeih?=
 =?us-ascii?Q?wsojxw3Cqdr2kVbsN0JA6CWJStBqiAn6tjA/7jsI0oWnqovF9FLFdX7NiJ1I?=
 =?us-ascii?Q?NGXuBNKDq96jzpL7X/MG1vyRUBb9IFGHRG8ew7SX1plYX3yib/NqwoDQTBCs?=
 =?us-ascii?Q?EO1x4FkxO34W4WLUJE/n9sdEu5vdaVKzJDnIoFhZwZRgxwP7VubuOcUhhgwG?=
 =?us-ascii?Q?lKi5pPhsRGlBNoPtisWyDr7TAAs04CvXnKOpmStc1TPrzvz/9X9HLThXVGRa?=
 =?us-ascii?Q?oTaJnFgx3NplBkg0IBK7yL40kGD5IaCytEhROcgaTIfy+mn68UWUpSya7GpE?=
 =?us-ascii?Q?Y89bxbUZqT4UrJANTPNZxcig6egkJ7JsHnQ1COcz9dBA90udlrX5g03j1wVB?=
 =?us-ascii?Q?JLLg0V1bNz0MxuYyBTbgo97oTgWUkWy//v4rf9ZIkphLsM1oFQj0U9l2Q84k?=
 =?us-ascii?Q?cCftHALAcvFHK+eCQK7pYEh4Sf1TccXI8paexFDv9QD26eAMEzCcqr2vX5cb?=
 =?us-ascii?Q?HADkajsQEfZSiGxwip8dPG1cphOjTZFuXRDOfqdiSxNtm8Mnyj/jvp6u/xFD?=
 =?us-ascii?Q?yX1maoCqaIwNfWF2VIPEprFd0qcutiTazGWLaP05yZUY+LVNqqkvC+uRtMau?=
 =?us-ascii?Q?Qv/SniFhTAaBiNXx3AzPTLIzQsZ++yj+Hl2pjDdcStomSCi8ZnRlWZO7VsXN?=
 =?us-ascii?Q?eCYuVyjgB9Afj7EqPBpMpRAD3ssiVm1gf2ZRPEDfS5jvliGEvfzOVl+/u6Ri?=
 =?us-ascii?Q?svt1uuSwymGmV9AOX8P2pZ0p7tPXXZxIm88ATRuzEVhAvIkO/1xDeujqPQoo?=
 =?us-ascii?Q?npdiCQK3smtD8qvr2hDVMyc3wiqAXpT+R0foEcPQOIqzVk9azIVlhtKAYS8f?=
 =?us-ascii?Q?T2O0U90cYfzzclbkp60bhzyP7bWymD6wYoandL7MIqADtEA57wFcp/0p6gIV?=
 =?us-ascii?Q?Sh9pK/x5DChIOp1nH8joaUxbBRDVa+mbGXbleSgWDEMtA0/TmoKQKunnQJj8?=
 =?us-ascii?Q?urOHXQBBzyFxsS2+S+Hh7BFP+kZxX2onLnaAs4V4BDVXX+9XCP/1FthlJLow?=
 =?us-ascii?Q?CxkEc7n+MKTJbX1zZgftMVBFwrj5t0KQh7i087WiR7HZx8AC79GwZmOreqaJ?=
 =?us-ascii?Q?2jXQ4UplcNl80WH46/9j23Xa+NIfnkBT+YERKVf+d/fvK91j79y0aQnlALoc?=
 =?us-ascii?Q?56ZZPEnJUriKh53qLl743qo=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2c897f-5862-45ef-ebde-08d9a32abba7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 02:43:38.4592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSFljnRyRdhOZhcyQCg1l9HnY1citvzQB2pxecqh07FdJ/gO6d6XV5mTYIslFV+EojGgybydj4esCW65TfATRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6566
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide .get_eld interface in hdmi_codec_ops for hdmi-codec driver.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6d93026c2999..67a87d21b0ba 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1821,9 +1821,27 @@ static int anx7625_audio_hook_plugged_cb(struct device *dev, void *data,
 	return 0;
 }
 
+static int anx7625_audio_get_eld(struct device *dev, void *data,
+				 u8 *buf, size_t len)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->connector) {
+		DRM_DEV_DEBUG_DRIVER(dev, "connector not initial\n");
+		return -EINVAL;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "audio copy eld\n");
+	memcpy(buf, ctx->connector->eld,
+	       min(sizeof(ctx->connector->eld), len));
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops anx7625_codec_ops = {
 	.hw_params	= anx7625_audio_hw_params,
 	.audio_shutdown = anx7625_audio_shutdown,
+	.get_eld	= anx7625_audio_get_eld,
 	.get_dai_id	= anx7625_hdmi_i2s_get_dai_id,
 	.hook_plugged_cb = anx7625_audio_hook_plugged_cb,
 };
-- 
2.25.1

