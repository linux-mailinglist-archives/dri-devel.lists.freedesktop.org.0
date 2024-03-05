Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C298F871575
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F429112850;
	Tue,  5 Mar 2024 05:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="YMxW3KUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA9511284E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY3Nv7LTloaJcgFEzWf9Tp/2quB6vQ70W71U6tJCqEPXj61hGaFYe7di4SB1vw2S5tIOcvFDIJNnfnVXaGhvGXe3nAy34KqQAY3l0FCOnqDhssHLfIwWgdvxrOSBIFD6urQA0MEBO0lslJUtVLcakd6XfoygDFWAL8Um2banFOmi6HehFmQnCWBURDiNtdrSzspFibQbK5wASg9XW1u30u6Zsrq9d06Lc4e9ZvYwo85VBqRrf90pZbqQyvj7ZnL8gnu2tFR94IK8JdCfUHe/FaG994YC5aTZ8LAInT7sCQpcdzVGqNI6r7a5Mgvo5RD4GyJ/wRB0M1yZAmNMuaHbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndGWV20JFR2FToBa55DUZBTb1fCr/cpmTlYE5JToOjk=;
 b=gCVcNntQJrEYla8eXcS724Kg8bA+bOb6sNd5tmuM4r+NBB5NtA1BS22D9untbUxZ4LbAjtmyG05L+XAlS1hHAE7TbgwP5UGlSoUNtxMGA3wl812l23u9KAxzJoZa9gD7A0nJXsyGhvXNSXtQoq0f5aaSatOuJMxSzNHOiOrc9GnGLAdR2c8ebm+7DxQUJzijRviNpTSqe+d+sg+HeifpqLBnhpRyKayUigL+EbOPcG9HwnMu6W2K3qC77SfHkZc9IkYg+NJPG0TFzAlOAoqvJ+4LqVvXq8dz5x7AFyWui6somoStwuoqJvR6U7nVCIjuA/DbrbOz4rCuAN/wtmgUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndGWV20JFR2FToBa55DUZBTb1fCr/cpmTlYE5JToOjk=;
 b=YMxW3KUyL4rcohXzNVy/Tl1xqNOFzUGu9Dsd3PANgcAawgrVQ4A2khNyRwwsMGtzb32uax71khc4xmcj0q8Y3Cfd7cCJS+sPa3kZSLABVOHffg/lObaqqMTMhEYtPWsSHF2mg3kZN4zzTqtEQC9YZgWUWwaox9///1YR4o1jNt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:11 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:11 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:01 +0100
Subject: [PATCH v7 1/9] usb: misc: onboard_hub: use pointer consistently in
 the probe function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-1-ad3fb50e593b@wolfvision.net>
References: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
In-Reply-To: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=901;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=H+bl57O6VNAflIAl80jQtpYIhodjo8aKPSeOFhW8uQI=;
 b=L/bwN+fxWtNMT/9ln+/ZrlexZ8gxchkg9SqBjS1KV74wiA6PyX8c13gypLcG3+E+383l0bMf5
 ADbKupBmXnFDwtPUU4ZSjqnajJxQHhUemjcihyeLs6fnQV7uLnxEwgm
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 71eb3d3e-8d9e-4697-528e-08dc3cd8d1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6xpFfFfKSdOJGp33kJFbrUlx9IfB4EgitSyCJw2yN8j84OUPrsoVjIkBd2V38PbmAwra0TTpbOOtnVfb1L0zJLFo/wBMvVeGrVFHWd7+SjXV7CrlTKDLq6Z7Wlexj9WnZOHK/tv5teu6zdtQR8zBIDkKEg0OuLJdVdnLM/yQYnFiesVlvUEV3wq/xG641ZGqnnD/Hvrwf0h3yL/bCYYjwRTyrCyN9Ccmn/3A1HaCcYQ2AcvhLyLp6F6SsRSUxiMq88wEm63Q4Bht7dlgp/ykgY+KtRUK9IHQvUY4THcLVAEsSjhLtzXobirL1Ozk1K2XrLwmBiyMHjmk/paLSLMGYuM9dN0OYncp/ldPtbHic4oIRZohx8wO4CMpUF9AjSjVR2hSH5JHOMeDyX1tZd1bDaLyqp1ESBVr01CYueOH2wAQIB2QKF6RrlaWEY/KcpEQPMr4Izr00aMZ8y263Vh9ngjPGhphLdDIlB+IN0nSgi5Vj4RKhVuf1clwCgXHAZYRNbJ9Kdl7z+bLHE/bfkxb9TCj5OaTjOJo5Z37x60naVxyrgId6W4BO1l+4yvEA+t8h4VFQA7YlkfeDru8qawBMHHJnHZwjKrzecnJocXud0sEvwLOVYnugSNKwvtFFEMqeJPmDfS2+FEQ6rGIIoQ4B8xt2NBKmgZ4AqzgkL0yhrzGeua0qpDmlZXWrHhkIDKfebUVdBeXjfzcXibkOZvH5KbUDJ7D7mgJArcEzE3oeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0xlRkxoSmo4K08vKzR1RGRod0UzMDQrcmxaR0RQTHpZbVR5UEpSazlyQkFL?=
 =?utf-8?B?cFZIL1ROejZRL0NwV2dqTGtaQ1NGR28wa0c5VGNHaStmU1FxbTZhZzNxSEFD?=
 =?utf-8?B?b2t6eG84NzBVUmxUS3FqRUVEYnBiZC9JMzVkS1R5c2N4MW94WkdDQllobGNl?=
 =?utf-8?B?Y1BicU1uQzYyTlg5OTFCVnFzQzZydGNzbEJCSFBHQkk1TEVlVGMvWDhXUSs0?=
 =?utf-8?B?SzkrWHloV21tdXVSdTk3TTY5RlBMNyt6QVRYcno1TmdKZkZOS2IxelVISGIx?=
 =?utf-8?B?VzVpSFozTFNXUnZvY2N4TzI2b2FMbFA2T3VyMUFOdm9OV0xoZmMwZzZicEF5?=
 =?utf-8?B?R3I2YlI3ZnIwSWdJbkxhQTMrWGRNWnc0MEI3UnBxVFk2NjZQL2dIMGlCejRz?=
 =?utf-8?B?QnlQRlZmZHdTTER6dy9Pb20rc3dYenFHWHRHTVdiRk9oUHMxbDJ6VmxGa2VP?=
 =?utf-8?B?Z1o4ejErYURGZEVkTDVGOFJBVklTMHlod0xFTzhjYjZtZlJNRElPUy9mbGlw?=
 =?utf-8?B?OHpsSU16RUFROGw1WlBtcDE1MStFYitielNqRmRyWXlmY3BQbUZMQkNxRlNh?=
 =?utf-8?B?Y0xwUjUvN2tybkluTW01Ry84b083bFAyVWtjUUorSFlKS21ERXBmUW9wdURh?=
 =?utf-8?B?WkY4QVI2N3hjTGhIeVUvcWZMOXJMTmhoVVdWdnJkR2NOdWFTK3lCN2RiUzkx?=
 =?utf-8?B?V21ML21FdkNIbTl0enVoTkEwWWk4NDF2WjRFNDExTTEzOTIyN1k3U1FpaTRY?=
 =?utf-8?B?UEpqMFlmdFFLdFZhWjFHM295U1c3Z0VBVnRTN1l1TXZGQy9ZcFFPQ3d3dnNv?=
 =?utf-8?B?aWtZU0lrdmg1aXk2bWtUdHBuaTBHTGg2N0pSSmdhZWxQSnNwRCthUXBDTW85?=
 =?utf-8?B?amZLNFJTZWNEUFpUcFRGWk5uVDFnUkRKN0hISTZMejFvaUYwZ1J2Q3RwN0xP?=
 =?utf-8?B?Y3RPMlE0Tlhjdjl3NFlhN0xBZnJ6YzR5Uzlzck1YankyZWxvZ2YyZElLQkwy?=
 =?utf-8?B?U29tL05XVG1qN1U0QTQ3V1hCSG5OTVRldXRxV3MxSFFsWk5Bc0p4aFRJUWcz?=
 =?utf-8?B?aTRUSU1ZRXVsTVBNVVFITXkzS2Y4cFVpWWdlYlBsbVEySFdUMTNlaU5mYUtQ?=
 =?utf-8?B?TWFGeTUveWNwVU8zd2RJelhhbWVlU05FN3NST0x5MEhsOHJNY3Z6ZDdneWpR?=
 =?utf-8?B?YVpXMGdNUXRGbFdCWGxOUkNKYk9qZVFJM2J3ZkRpcTc0U1lQZk1iREsxRTJo?=
 =?utf-8?B?M2JxTzhOWEtiU2xHVTRvWEZlcDA1UnVudVFCa0VsTlJwU2xvRVVYekl4L3Q1?=
 =?utf-8?B?NEppcHFxemh1MzROSHlmd0VvTkVLQnQ3QVM4TDBIZFZoWU5uWWVzVk0vMDZs?=
 =?utf-8?B?QnRMWkxKbXlOZjNHVURJdWlWaUpXM3JlUDh2YU5wSlFZT1cvTUdkVmFZTTFw?=
 =?utf-8?B?dW1MV2VOOUdFTjZBblpSZWNVZ0xBT2ptNHBNTWVrcDVlYS9kWVhrR3ZCN2lG?=
 =?utf-8?B?NVBUY1RvZXoyTTZmblhTYzZPdEFGYSt1N2pZcTBFdGJCRzA2eGhIVWdQUUNy?=
 =?utf-8?B?QncvNkZPckFvcXowR0F4aDRwL1JPSUR5V051ell3bUFrZG96UWRpeUN5QzhT?=
 =?utf-8?B?Q1FacS9NSjI3endPZGlyN1E2RWxiWkwzTlNxRGxJUkdNK1Z0Sm82TDIrY1RO?=
 =?utf-8?B?dld1SUdhRGQxMVBYemdBN1p5VTBnZkJLbmFKcCtFbDVwTE5iaDlDUDF0MFRm?=
 =?utf-8?B?MmFnTkZ4dHo1VFdTZ21ZVnAzYlJHQ3BtSVhNTThlT1ZPdDVQNUU1TjRhNGxF?=
 =?utf-8?B?dzF5NVlUd2J3S2RVSGRsV01ZT2VWVFhkTE1hUVVCVHNSNm9Xa04yaXZDTW0x?=
 =?utf-8?B?SFpuK1lMTzAzVC8rK2cyZGU2SmRvODRDQXFGTmpEOU1WTlBvT2RVWTNZV0pZ?=
 =?utf-8?B?d05jdDR1RmJTeTZ5OVk0bWxEV3dKRGlWRlQ1WFZraUx5MGZCNUlHR2tMUGZN?=
 =?utf-8?B?dWk1Z1o5U0FIbk0yT3BRZy9NQmxtQUlNQVlQbVJXU0x1dm9YSzlwYWVxZEFn?=
 =?utf-8?B?WW8xejNZYUpTL0VmQ1ZhMlE1aUVOUmhrYU9GNUFOUnkreDc5d0Z3WVZ6VTRq?=
 =?utf-8?B?U3c0N2FOdWU2Rk5RWWF3MDJCU0ptM3VRdTFlRCthM0c3Q2NXTkhyL0FFb2dR?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 71eb3d3e-8d9e-4697-528e-08dc3cd8d1ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:11.1439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZstvgW9HHFWcxe3ZRDfQvJ+LdfKoOry3Vu6kGfjmEAgAmEqAcjeGkaOqVHYq+uBZlqT+cQ1MOFK1Igvzr0Hfew4Seqkvz88dw/BdO9drqBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385
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

Commit 14485de431b0 ("usb: Use device_get_match_data()") overlooked the
already existing pointer to pdev->dev 'dev'.

Use the existing pointer 'dev' in device_get_match_data() to keep code
consistency.

Acked-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/usb/misc/onboard_usb_hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 0dd2b032c90b..81c001fd38c1 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -260,7 +260,7 @@ static int onboard_hub_probe(struct platform_device *pdev)
 	if (!hub)
 		return -ENOMEM;
 
-	hub->pdata = device_get_match_data(&pdev->dev);
+	hub->pdata = device_get_match_data(dev);
 	if (!hub->pdata)
 		return -EINVAL;
 

-- 
2.40.1

