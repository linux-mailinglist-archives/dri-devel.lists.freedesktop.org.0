Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF416B9252
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F9310E173;
	Tue, 14 Mar 2023 11:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1b::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD4110E173
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISsqbUO1W1C6apUrGZ0MqZdEdVk4VxD9x3tXAskZzkP5z5ZPbYA6MR66haRrjre6TUequZJPE15OAhhNg26o3aQ3zeGi3PuHFMIQkgiYli57bYyV4GCQUfoSmdDT/ylPXoDsvxiTb2lMGds78SZloQk3DRfwqp0NgDI/5wrQm1YHpF9SrxOAbIhakIEngK8wY3RTJ/yFtZFTFeoxscEnvMukJh4iQSD5sLyvEYoP6su2URRt4X4D4vtBh0IbyOjjiV65UodiY6QXiULr7Uydps+3ax4EAwSJAwgfr9vX3GsTUcVeEzert8jMCp/09bYoV0D7nJXdxvgZuj3biqTIaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvFJxDx2BTNMkCHs+byRKm/koycBe3mrq1Ljg5MsZPs=;
 b=UaXC9FXRjOOHNgtYLP+PxkMfaDuu1lJc/lrjj6uPOizCIK548nKqtqymkrTccRosoh8Bn1WsqF7wxp1jC0NTChZToSe0c2HI6GpYzpKZWCH03pi/lSPczVj9KDtutTApDZ+U3s1+iOdSXd7SnU2QCx8qais/XZfIFu6mTnFdQ9OyKewClnJW2WKSKqOtVDO+ZFEufkmPVH6bMQGD8bhB0IWkRB85N4wzTaQgTElKnvnee1TT36af+ioIYMdqwOOCrAno1VD0KhRLJ0NVEpd9TdK8dVk0ZTZTyETlkT0htbIk14qKcijTb3EIpJ0+t/ECERblEn7h3kWbGhNVMomWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvFJxDx2BTNMkCHs+byRKm/koycBe3mrq1Ljg5MsZPs=;
 b=QkNLGNLfcXEtUnMSYOad7LLifAfeE8mi4ZsfoNSH7wJwiAd0maITI+GqEG4yz8j6WSgxorZs85/1AjhD6pqk0w71jX7SsBj7HgqgGW5qdlI1Q4vhaO0fl5OOm7CnGv4EwLL16heLTCPHZ5Cnm+8LV7aEfjIforVRwGpxAhIcsSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS8PR08MB6694.eurprd08.prod.outlook.com (2603:10a6:20b:39e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:57:05 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:05 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] drm/panel: sitronix-st7789v: propagate RGB666 format
Date: Tue, 14 Mar 2023 12:56:38 +0100
Message-Id: <20230314115644.3775169-2-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0032.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::18) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|AS8PR08MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 31685555-c8a7-4f3f-67e9-08db24833abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AX5N7+QccJDVhbNcehViku/0jzcOIGGrgizZjZm9TxaXuaRrym2W6hZJH2GIwQo9FqFkAzTHipNxWNLqWn/uY/w1JxEC8Sn454GXvO3N3cNxsXVWaCppx3jexpLQ/lSAJkCEXReoJ3tOh1rlE8T1FevsLHRLW65ZR9Ot8UjsQxV017A3yNPx3v/lI5aokM7TFbV51/3etK8IxrxOauRpZ7TOKbu8kF+HAykEmUAKrH5WAwrQCLZXjYvswIbiWjkMuLM6GFRjNUVqN9uJ3Vo5luAkXRETKUYKS1q5xuhspDEaWu1xj3aM7SGY2zy2iTUU0clpuF+5ak/vAhLgKTqfjTpDcIuQ/jgRLfRhWWvSb0zXQbCiv/m2MtfOAlg9GZE0+A0QmgWSZKy6ZDggeEtMgITNTU5FlOPciulrMXKxDnikOZfQm3gK4YNRA/caLqHu4IqMzkWsl8I6ksCd2K89fvH5+tw1IxXM2Is1IL1OYWCTadqEtrKkjNSHMRG+wCuWjtdnP4ANnqFOfaO5RFC83AZ4JTfNnledsj67pdQZc1RpOVU7XFyNIN3zZ3lNrWY864cblAI4Mv4Db22jSJ9e59eUTAeZR+q99PMJ4I/RIGrLJ6iL1YGc1ibpj9y8cpVVtIkAOxtjeEDTBHWx/L6vxUhliirKGKth/N3G9NP9mv8m0Ze3N5J4zqkNxTUMoOL7Vdp6zZPqSdt9jBfDlncILA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(7416002)(86362001)(478600001)(5660300002)(8676002)(2616005)(6666004)(36756003)(6486002)(186003)(2906002)(52116002)(1076003)(26005)(6512007)(6506007)(107886003)(44832011)(41300700001)(38350700002)(4326008)(66556008)(66946007)(66476007)(38100700002)(8936002)(54906003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SzawIuzz7bNI/tW4E6JfLXnoOVssoCrMTtAl01LV6Vshu4+g/0Qlmu8lFqU9?=
 =?us-ascii?Q?5EFXmpBu3YVztRcVnCCPZDDx0QlcB7P4yoyyfDo39UBmPJmjSOAr2YTDTj4+?=
 =?us-ascii?Q?m4Io/Yg6NJKTcLp+doSHbDbQpVLAQQ3REvBtvjkr1XQx14sa7EZptLxCDeBL?=
 =?us-ascii?Q?xzvs5y63TvACsG9zSawPxqmpM6v+ZfStl/aY1IzSKSQDLTi3Q2zkONi/FJ64?=
 =?us-ascii?Q?QRh6HwPWheAZCojlIoY3gLg1kYTycOTFKJr6s0OJhpnAzT/3v1EGO1PY+DgX?=
 =?us-ascii?Q?hsDNGWCVDPXGDdH+s9jdrG7tnsr5GCto6GAyD805cH8VWOLnIl0cLsh9+LdZ?=
 =?us-ascii?Q?WcSjTbW4ocB8F+FsBVlRAzbAaq1C1STsnfqF69q/jr0iZn//dWHsuAW4frvV?=
 =?us-ascii?Q?AfgrJdxiQEd6XiaMKTd80S7YrDykqXk2S90GW/Gr2n/zpywUmiKq3KzsSSEl?=
 =?us-ascii?Q?AFUA0CUbgz9WVvfJ5T0H6tiEmgcU4xB6t08EymkvUD/fD+YF/twZc8vmSPJ1?=
 =?us-ascii?Q?hMiUkxdLLGQoYCs+HU3pabqe0dd0tsIj1bwSaoyw8yVa/wp6FD2owKJpdLKU?=
 =?us-ascii?Q?jbIAp4xyWngm4+ukfYB8eNumBf8hLQSztqL3WKX/0lUMsc485eJajXfR+QYL?=
 =?us-ascii?Q?zsPJeFnoUvUvYFFgSEIyP/plbLxQtfMKkTzphMX6cvoRE0jEuaqGRPpWFKek?=
 =?us-ascii?Q?+V17W5uJWdIrMGZW5ofu4Dpr/DdfX2gllfpX3V5YG3fjRVYgjuLHA9IL/6Tr?=
 =?us-ascii?Q?SFaiNX1sqmEVI3+uP4oUkckoCrmyfxuxVbl/j16t+Vbb4Nm/P1ftwJC88PZR?=
 =?us-ascii?Q?RIQq5EIgFVUZqE6zJomfxKSo12WyKI88lY8hGusESebeJOkyVGIV/+oskRMj?=
 =?us-ascii?Q?9ee44vFIHoxzvsZkMT/FEJ+P9rvtkIimoIn2s6X3kBfadCUCr2ryrfiiiu+M?=
 =?us-ascii?Q?cr9lrOj252vM3kA823q+FH/InY5hB/w9uaCYyF1wTv5bGXv+om/9X/OfU7pN?=
 =?us-ascii?Q?ej9eRyK/GnD3RUolzP9pg+6cAoK+u0DH5nwPrziIQoj6Y+acxPOmttrDnF/K?=
 =?us-ascii?Q?uHw7R6LZWG4rRHMqceL3uy45I4bBFtl4An6Syj6q2xcJSxzlaSEtDqWc7UpH?=
 =?us-ascii?Q?aOp2YGeXirZxVys8U3u9d2vqake2bcKM31REyNgrOuaoB4ixqfoSAnfWo65W?=
 =?us-ascii?Q?Nx+Xu3aVMAvNIn/Jdfad427M+Ltj4UWPdN7fl6XwEoA8XAunNGDbJNcPCIX3?=
 =?us-ascii?Q?Uzm/qr7OpCJl2InAWlxVmLB9RNMR1yLrtciaAIK12qBvfjOzojduskjrHhWL?=
 =?us-ascii?Q?12SyuHnSAQE1QxPv7a+8Fcv3xu/zr5kDSh6VczY1s5SnCd1drWk3GjiVFX8W?=
 =?us-ascii?Q?Ws+IPVc2pN04tn+IipX5BBf8xjl/svevBW7LhoN/NXvYC5m5wPnVQWC9ZQoy?=
 =?us-ascii?Q?r+6mipcBHPh64A7lap+rRAoklhPIB2boz9GBvKhkTDW9yEL/PLdVsO6gzfiG?=
 =?us-ascii?Q?UPIyGhqeCtkBxhReOep8NxeHx+wCUeCFYHDzgW4jKxPMDMFKjF61oh3YDnvE?=
 =?us-ascii?Q?eAVrdhraoQ+/DfyOGxMCSWJN+SX5w4LVDujyRECmoY5q3MslmIiB4Llaip8z?=
 =?us-ascii?Q?HmwYUYJTxKYKjOM8uTISIzY=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 31685555-c8a7-4f3f-67e9-08db24833abd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:04.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73Q/fCiOW47iRgidFqKbaECPkAIDw5ybf9sJ1nRRWKfAp08FGqHjlVBWLEcidHFebEb6h7MjCkN+J69Q1gm7XgdRxP95MweEsKnRn93dWXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6694
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Riesch <michael.riesch@wolfvision.net>

The ST7789V display is operated in RGB666 (18-bit) mode. Propagate
this format via the display info.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index bbc4569cbcdc..9535437271d3 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -5,6 +5,7 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
@@ -171,6 +172,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
+	u32 bus_format = MEDIA_BUS_FMT_RGB666_1X18;
 
 	mode = drm_mode_duplicate(connector->dev, &default_mode);
 	if (!mode) {
@@ -188,6 +190,9 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = 61;
 	connector->display_info.height_mm = 103;
 
+	drm_display_info_set_bus_formats(&connector->display_info, &bus_format,
+					 1);
+
 	return 1;
 }
 
-- 
2.37.2

