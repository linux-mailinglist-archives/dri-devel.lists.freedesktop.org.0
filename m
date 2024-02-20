Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC085D21F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DA110E638;
	Wed, 21 Feb 2024 08:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="jGqh0OPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EB810E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6606DLnU3ylE/qJCg2JjUnN7FnOkP/XJ2AxNowEaMs5ERI+exMMQLxmZmEse6uzz/cu5zuw7SWdqEVjYGoXemxE2Hgbg5gH+he/gpmYrK14t+yJezk77ztOPos323fXqdAnfjwa6PPQ7L9alY+VKTEHDGx3DwjgqkmlaXgerniT3iEatDPRSD6S0gKwiSkN8A6fmP9NXcXYt5et+JeyyRI3AomMIwkaHnr9YMrvKaL7dLd9E/8qcuj9e4SBnhgzo/dmrZAyf4jJ8/dLYQbNNh5RIIbVb/S00MGa8XmIW4jeAQCKy7fbgs6pwgX6jd816HTIBI6/a17es9WBLlAYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQUZ7W2K186J8L3PALviohDuY4ptDhjOTS9QqxugLm0=;
 b=n6Nroc+YdmuD53HY8TkEEGOo5IgdFhK6+aEWgkwBzq9jTI/gNgHU9RhntOe5ZvKnKa9VbztGd7d/rppPL6MF5O72KRhldOvNp1fo8xRCgJkLPdqq7ruNz5f8dRX+bjXa5nJDI60lrbI6ybH0dcsfhYRDIBi2yWizTbADvCuLFULtTHuG06tEJF169rNJ2geZcTPKxkrSqn1Mk0AN1J8rcNtZBNfAR+0gBxInX4sSARlJUxMEIXQy3mGMiLPp48LhQumbaS3ao+2SZlQ1d6PfAPd6Bv+E+nwVXRA7losbJXnxeyvEmHZZ2q92XT7PZ2cVlZCurtmKwWGk2PrK3FG+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQUZ7W2K186J8L3PALviohDuY4ptDhjOTS9QqxugLm0=;
 b=jGqh0OPlkquDgnHg6WbCP+gEdZMY2r2KYJk9j21ZfmqpSDMxrLCe+9H8KmHqtMc5b6J+ES6l463Mp/fDsLhhrBqNNM+4wkKtx42WFB6Vc3UvbGihujOQihBhyJ2QsR47LTjazSkIvHCAr8+zgs+Q9VTmqLWtAMecep4oYohb5jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:52 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:52 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:45 +0100
Subject: [PATCH v4 1/8] usb: misc: onboard_hub: rename to onboard_dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-1-dc1617cc5dd4@wolfvision.net>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
In-Reply-To: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
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
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Matthias Kaehlcke <matthias@kaehlcke.net>
X-Mailer: b4 0.14-dev-8b532
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=45541;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=+iGxgLnKT3ZGZ58BzBVIYLY+vC7H0hLL4aXex3Qapp8=;
 b=tsna4YBcZNlM9ngCzQfHNb3csfJ/3JCulB8BE06/VRCgY+EedLTShxBZ48JoOLoD5EE5aYdhc
 5hKEiguSeYCBvm8KjK5AOD3aNmCuY0tjHvFWKMm0C1CK50mrVqTnoaN
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 62376ac6-3910-47cb-14e5-08dc321d0c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oF8+LTM6WKMLm0sgmgK3MhsELb8w6EGWNV4mQMXY6M0NFuIKzrhwPV6euo3aPmE1wNUX6EmljinDWRappznf4kUn19CDnCeTp6Eyv07FoQ+XH8v7toMarVEnELLqGOVtm1TSLJSoJv0hYInzculH1NcHkUgXunI2ipEY25+n4D9wnAyAgSjwvBqFh45mqlCA6UBPWGjtVmCu7ZCN0Brfq89s5c89g72fkcwIppNmKNpHWrwOxqbfJ8oKgmoPvuUpKXxWbEcbQZHCKCXjvjdc7RIAth2n0I7tWYgqM0hxHMhi3y55wgD7M0YEA0sM6FYJiBpS2WfNfqDVNFMcCos8bzyvpQtMAWse/RnD2KyVuWlXdMT9oZKLeV+NxzIrTOVIwE+F+SX3h9SrvYjRKVvhkNBpqNm6jkLZRzX5BRvRDZNTGZJPkDVMcqmd2OghigvN+sCAq1KElbq4RcmFshFvmhmkRvqIQOXlgX9SRUoei3ecFVSF4egqy+QlwFD0wmBM98v1d42COD7FCATWG4dtJZnl/7MuMkgeM4YUu38YpI2iPJMH2ZZAuJO2RqT661ph/WR6kAD1PtsWBCrQ4dAZU34kgTIQmEMVLWl00jfn4jgchADcOse4oLPQQYrGSy7FnD2qUwuA5M7ZXlRMbTnekA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUlRVXRBSDc5czE4dDVtVWhYOUFRT2JwazRrOW9HcG1OZjd2Q0k2cUxzWURU?=
 =?utf-8?B?bjlQRWJCWFlLMnMrK2lDQzVrZDJCYkMvalA5cUJWb3ZpMWhOcmVuQUJ2dDJm?=
 =?utf-8?B?U3JsVnk5dGowYTdXbE0zN0lrU2RoOUEzTXRCTTBxSXpIT1BFSUFCdk45YWJr?=
 =?utf-8?B?VEIveCtvTHoxa1FTcjFWOUFSOENraldHN25uTHJGSE91QjdnLzRWbHUzZTZP?=
 =?utf-8?B?Rnk1TXZPR1ptYjVEVzZvUnRNblhKczdHanQ1VUV1cDJMWFg2THUyWklZRDJM?=
 =?utf-8?B?QzhnNnVwL3VJTGpORUNNS2hMVS9XaTlnb29pVEZYUmFSOFhsMkMvUTRTM2x5?=
 =?utf-8?B?SDg5MUJxS1lHaTAxcDlOcWYyTkh0Umo0WkpUaE5rYlZoQ1ZPM0x0S0tBRC9R?=
 =?utf-8?B?cTFuQktqTnZ6S0RRMlBzNkhFVUUwNEVFTnJUUmNpcXJOWjJ0WGFjSFE2U2cy?=
 =?utf-8?B?R1lRS0ZMK2ZJUE9Kend3a0s3WEovOXlxMElkemllQ1JPcVhRSHY3TEtVRWZQ?=
 =?utf-8?B?K2wwRmd1S3ppcjdyL3FYZzd2SkMvWnpwQzc1dVg2eFpTQ2VPVVdMYnFmaEli?=
 =?utf-8?B?NE9iRHUvakZMMUc0OEwxQ0NBSHNDeGZtTEdhMmhZR00rbnF4c3R4WGdpejZT?=
 =?utf-8?B?VWlDV0Qyc0pESytQRlpwSTZ1eHFLTFcxaEd6RXRBNUFuRVFZL1J3UWFCbTh0?=
 =?utf-8?B?ckpXVmpTK2JZWm1OVE9Cd2J4ZU96TThtaDFMbTVnaUx6a0ZhSFpjK01jQ3M0?=
 =?utf-8?B?QUZQSUMvb0h3QkJaME5sZktSQ1lYckd1aWhldHR6aXJ1TXBtWkttcnhDdjBk?=
 =?utf-8?B?RTg0djlzUHZqZzdlUC9OUTJhN08yMGNXdURDVlVSQVlkTTNMY2FWQklKajdm?=
 =?utf-8?B?ZGtJRkV2dlBsY1BmTklTdmVuQWRIMVdzL1FrL2l3V2RaTW1UUHBEdWpOY0Jo?=
 =?utf-8?B?RGl0MHByOVdZQ2JrMmg5RnpyWFZqclpFNkhYandmMCtWL3dQSEd6Nkpob1pD?=
 =?utf-8?B?SFdEa0xXenA1NytQRDVmY003ZTVBZGJjNXJJQVZnM2Y2UUpzR2dkVVhnUnlP?=
 =?utf-8?B?RkFhY2pyQWNkbEdGdFZnd2FHWm02elVyR3pnOThNNTZTQTdMZ2xUZnhwUUtI?=
 =?utf-8?B?V2pxTGNRMjFQYmt0UnRwL0tJbzNzL2tFdGhURmtHOVROeHJYYmVTVlBSTGJR?=
 =?utf-8?B?LzNkL0YrVVBLV3JYbThWbXVIYmpYSnd2cFlnRFZzWjhqVnBKdFZJYVF3S2Z2?=
 =?utf-8?B?Ui91RFh2M01uTWR1ZW1JYXVPTTBmRTFVcUFtMHJoVVhMOEhCdTRvYk1taXd0?=
 =?utf-8?B?YVJMRW4vUHNoT09neDFleGtOTzErTmpjS3BRZ0lwU1pJN3psRlowWHVhVk5q?=
 =?utf-8?B?UEYzRnJhUGpWQXBXS0thNUZISE9QNUc4Y1Z0dDZZeDRYNVNoWjNMZkVvQ2tl?=
 =?utf-8?B?SGI1aWNodDQ3UWIzUEU4Q2dOTXF0cStCT1BpczJqOTlGaFhrbWZuLzVOLzZp?=
 =?utf-8?B?cWQ2OFhhcENyYXRLVXRaazJhdlNwNnVsM1RJSUpzVzM0VDdaZDFSQW5SOXY4?=
 =?utf-8?B?ZlNHN2dxeDh5Rmp6a0sxeFIxUDRhVGsvaXYvUEV4c0piUE1GbExhL05NNE9x?=
 =?utf-8?B?a0hROFFTd2U4NGl4ZXNjRXNJS1k5bFBjZ05QbmJlcXBrV2c0em9VeHhHUnNC?=
 =?utf-8?B?N2YwR25SRkJSemwrWnVvL1NiS0pkUkRiQ2l5cU1LRmtId3lTdTJVcFNFWkNC?=
 =?utf-8?B?NUxUVExsVTNTaG1CMEg3Ry95ZVo3OFVDKzdNbzFnWWwyUXR6NG5rdGJRUkdE?=
 =?utf-8?B?RHoxdWlJelZZdEpZS2IrQ01UZXBjenV5eE5YdHlxd1BBT0VDMGpEVlRTMEhO?=
 =?utf-8?B?VVJaQWw5ekIwQU9GVDlCNVVDQnN3a1lOTGdIN25wemxzUzRRekdCR1VaUm5k?=
 =?utf-8?B?K0lLaVBoTzgxbTVCMGQ2NUVBMldzcnRtdlhrcDFQTFdiaHFuYkc1T2dpTDZu?=
 =?utf-8?B?a2E3dmMvTTJhY3BkVnU1bUtnQ0JScGMvYXNBd1FtYjU0c1JzUmVZY2NGQ0hk?=
 =?utf-8?B?bUVrZlZUWDR1dHBwcEtPRGdMNnFySnFFa2h2b2NtOUUyWmlEdVl0NVpvbG1p?=
 =?utf-8?B?SnRhTFdzWUVVd2pJSkM0ODBDbHVjQThrV0JWSHhSYldkc081ZWswcEZoL3gz?=
 =?utf-8?Q?38gA00f+QS4aGwwTF6ZtXxM=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 62376ac6-3910-47cb-14e5-08dc321d0c39
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:52.2260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgxSa4MIRa0AhSzQDAYCvKq0eEMxrtY3Meb4hKQA4vrn8UxwohPl7M1TMwgSCWFHMZDTtB/huga+7dqUtQFPUonNFxmn3XnlAFCDHg62PPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5577
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:08:40 +0000
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

This patch prepares onboad_hub to support non-hub devices by renaming
the driver files and their content, the headers and their references.

The comments and descriptions have been slightly modified to keep
coherence and account for the specific cases that only affect onboard
hubs (e.g. peer-hub).

The "hub" variables in functions where "dev" (and similar names) variables
already exist have been renamed to onboard_dev for clarity, which adds a
few lines in cases where more than 80 characters are used.

No new functionality has been added.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   4 +-
 MAINTAINERS                                        |   4 +-
 drivers/usb/core/Makefile                          |   4 +-
 drivers/usb/core/hub.c                             |   8 +-
 drivers/usb/core/hub.h                             |   2 +-
 drivers/usb/misc/Kconfig                           |  16 +-
 drivers/usb/misc/Makefile                          |   2 +-
 drivers/usb/misc/onboard_usb_dev.c                 | 518 +++++++++++++++++++++
 .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  28 +-
 ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
 drivers/usb/misc/onboard_usb_hub.c                 | 501 --------------------
 include/linux/usb/onboard_dev.h                    |  18 +
 include/linux/usb/onboard_hub.h                    |  18 -
 13 files changed, 594 insertions(+), 576 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
similarity index 67%
rename from Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
rename to Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
index 42deb0552065..cd31f76362e7 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
+++ b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
@@ -4,5 +4,5 @@ KernelVersion:	5.20
 Contact:	Matthias Kaehlcke <matthias@kaehlcke.net>
 		linux-usb@vger.kernel.org
 Description:
-		(RW) Controls whether the USB hub remains always powered
-		during system suspend or not.
\ No newline at end of file
+		(RW) Controls whether the USB device remains always powered
+		during system suspend or not.
diff --git a/MAINTAINERS b/MAINTAINERS
index 8999497011a2..7ad556ecca40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16297,8 +16297,8 @@ ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
-F:	drivers/usb/misc/onboard_usb_hub.c
+F:	Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
+F:	drivers/usb/misc/onboard_usb_dev.c
 
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
index 7d338e9c0657..ac006abd13b3 100644
--- a/drivers/usb/core/Makefile
+++ b/drivers/usb/core/Makefile
@@ -12,8 +12,8 @@ usbcore-$(CONFIG_OF)		+= of.o
 usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
 usbcore-$(CONFIG_ACPI)		+= usb-acpi.o
 
-ifdef CONFIG_USB_ONBOARD_HUB
-usbcore-y			+= ../misc/onboard_usb_hub_pdevs.o
+ifdef CONFIG_USB_ONBOARD_DEV
+usbcore-y			+= ../misc/onboard_usb_dev_pdevs.o
 endif
 
 obj-$(CONFIG_USB)		+= usbcore.o
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index ffd7c99e24a3..f85b3e928a35 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -23,7 +23,7 @@
 #include <linux/usb.h>
 #include <linux/usbdevice_fs.h>
 #include <linux/usb/hcd.h>
-#include <linux/usb/onboard_hub.h>
+#include <linux/usb/onboard_dev.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/quirks.h>
 #include <linux/workqueue.h>
@@ -1776,7 +1776,7 @@ static void hub_disconnect(struct usb_interface *intf)
 	if (hub->quirk_disable_autosuspend)
 		usb_autopm_put_interface(intf);
 
-	onboard_hub_destroy_pdevs(&hub->onboard_hub_devs);
+	onboard_dev_destroy_pdevs(&hub->onboard_devs);
 
 	kref_put(&hub->kref, hub_release);
 }
@@ -1895,7 +1895,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	INIT_DELAYED_WORK(&hub->leds, led_work);
 	INIT_DELAYED_WORK(&hub->init_work, NULL);
 	INIT_WORK(&hub->events, hub_event);
-	INIT_LIST_HEAD(&hub->onboard_hub_devs);
+	INIT_LIST_HEAD(&hub->onboard_devs);
 	spin_lock_init(&hub->irq_urb_lock);
 	timer_setup(&hub->irq_urb_retry, hub_retry_irq_urb, 0);
 	usb_get_intf(intf);
@@ -1925,7 +1925,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	}
 
 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_hub_create_pdevs(hdev, &hub->onboard_hub_devs);
+		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 43ce21c96a51..3820703b11d8 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -74,7 +74,7 @@ struct usb_hub {
 	spinlock_t		irq_urb_lock;
 	struct timer_list	irq_urb_retry;
 	struct usb_port		**ports;
-	struct list_head        onboard_hub_devs;
+	struct list_head        onboard_devs;
 };
 
 /**
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index c510af7baa0d..50b86d531701 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -316,18 +316,18 @@ config BRCM_USB_PINMAP
 	  signals, which are typically on dedicated pins on the chip,
 	  to any gpio.
 
-config USB_ONBOARD_HUB
-	tristate "Onboard USB hub support"
+config USB_ONBOARD_DEV
+	tristate "Onboard USB device support"
 	depends on OF
 	help
-	  Say Y here if you want to support discrete onboard USB hubs that
-	  don't require an additional control bus for initialization, but
-	  need some non-trivial form of initialization, such as enabling a
-	  power regulator. An example for such a hub is the Realtek
-	  RTS5411.
+	  Say Y here if you want to support discrete onboard USB devices
+	  that don't require an additional control bus for initialization,
+	  but need some non-trivial form of initialization, such as
+	  enabling a power regulator. An example for such device is the
+	  Realtek RTS5411 hub.
 
 	  This driver can be used as a module but its state (module vs
 	  builtin) must match the state of the USB subsystem. Enabling
 	  this config will enable the driver and it will automatically
 	  match the state of the USB subsystem. If this driver is a
-	  module it will be called onboard_usb_hub.
+	  module it will be called onboard_usb_dev.
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 0bc732bcb162..0cd5bc8f52fe 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -33,4 +33,4 @@ obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
 obj-$(CONFIG_USB_SISUSBVGA)		+= sisusbvga/
 obj-$(CONFIG_USB_LINK_LAYER_TEST)	+= lvstest.o
 obj-$(CONFIG_BRCM_USB_PINMAP)		+= brcmstb-usb-pinmap.o
-obj-$(CONFIG_USB_ONBOARD_HUB)		+= onboard_usb_hub.o
+obj-$(CONFIG_USB_ONBOARD_DEV)		+= onboard_usb_dev.o
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
new file mode 100644
index 000000000000..2103af2cb2a6
--- /dev/null
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -0,0 +1,518 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for onboard USB devices
+ *
+ * Copyright (c) 2022, Google LLC
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/suspend.h>
+#include <linux/sysfs.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/onboard_dev.h>
+#include <linux/workqueue.h>
+
+#include "onboard_usb_dev.h"
+
+/*
+ * Use generic names, as the actual names might differ between devices. If a new
+ * device requires more than the currently supported supplies, add a new one
+ * here.
+ */
+static const char * const supply_names[] = {
+	"vdd",
+	"vdd2",
+};
+
+#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
+
+static void onboard_dev_attach_usb_driver(struct work_struct *work);
+
+static struct usb_device_driver onboard_dev_usbdev_driver;
+static DECLARE_WORK(attach_usb_driver_work, onboard_dev_attach_usb_driver);
+
+/************************** Platform driver **************************/
+
+struct usbdev_node {
+	struct usb_device *udev;
+	struct list_head list;
+};
+
+struct onboard_dev {
+	struct regulator_bulk_data supplies[MAX_SUPPLIES];
+	struct device *dev;
+	const struct onboard_dev_pdata *pdata;
+	struct gpio_desc *reset_gpio;
+	bool always_powered_in_suspend;
+	bool is_powered_on;
+	bool going_away;
+	struct list_head udev_list;
+	struct mutex lock;
+	struct clk *clk;
+};
+
+static int onboard_dev_power_on(struct onboard_dev *onboard_dev)
+{
+	int err;
+
+	err = clk_prepare_enable(onboard_dev->clk);
+	if (err) {
+		dev_err(onboard_dev->dev, "failed to enable clock: %pe\n",
+			ERR_PTR(err));
+		return err;
+	}
+
+	err = regulator_bulk_enable(onboard_dev->pdata->num_supplies,
+				    onboard_dev->supplies);
+	if (err) {
+		dev_err(onboard_dev->dev, "failed to enable supplies: %pe\n",
+			ERR_PTR(err));
+		return err;
+	}
+
+	fsleep(onboard_dev->pdata->reset_us);
+	gpiod_set_value_cansleep(onboard_dev->reset_gpio, 0);
+
+	onboard_dev->is_powered_on = true;
+
+	return 0;
+}
+
+static int onboard_dev_power_off(struct onboard_dev *onboard_dev)
+{
+	int err;
+
+	gpiod_set_value_cansleep(onboard_dev->reset_gpio, 1);
+
+	err = regulator_bulk_disable(onboard_dev->pdata->num_supplies,
+				     onboard_dev->supplies);
+	if (err) {
+		dev_err(onboard_dev->dev, "failed to disable supplies: %pe\n",
+			ERR_PTR(err));
+		return err;
+	}
+
+	clk_disable_unprepare(onboard_dev->clk);
+
+	onboard_dev->is_powered_on = false;
+
+	return 0;
+}
+
+static int __maybe_unused onboard_dev_suspend(struct device *dev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+	struct usbdev_node *node;
+	bool power_off = true;
+
+	if (onboard_dev->always_powered_in_suspend)
+		return 0;
+
+	mutex_lock(&onboard_dev->lock);
+
+	list_for_each_entry(node, &onboard_dev->udev_list, list) {
+		if (!device_may_wakeup(node->udev->bus->controller))
+			continue;
+
+		if (usb_wakeup_enabled_descendants(node->udev)) {
+			power_off = false;
+			break;
+		}
+	}
+
+	mutex_unlock(&onboard_dev->lock);
+
+	if (!power_off)
+		return 0;
+
+	return onboard_dev_power_off(onboard_dev);
+}
+
+static int __maybe_unused onboard_dev_resume(struct device *dev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+
+	if (onboard_dev->is_powered_on)
+		return 0;
+
+	return onboard_dev_power_on(onboard_dev);
+}
+
+static inline void get_udev_link_name(const struct usb_device *udev, char *buf,
+				      size_t size)
+{
+	snprintf(buf, size, "usb_dev.%s", dev_name(&udev->dev));
+}
+
+static int onboard_dev_add_usbdev(struct onboard_dev *onboard_dev,
+				  struct usb_device *udev)
+{
+	struct usbdev_node *node;
+	char link_name[64];
+	int err;
+
+	mutex_lock(&onboard_dev->lock);
+
+	if (onboard_dev->going_away) {
+		err = -EINVAL;
+		goto error;
+	}
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node) {
+		err = -ENOMEM;
+		goto error;
+	}
+
+	node->udev = udev;
+
+	list_add(&node->list, &onboard_dev->udev_list);
+
+	mutex_unlock(&onboard_dev->lock);
+
+	get_udev_link_name(udev, link_name, sizeof(link_name));
+	WARN_ON(sysfs_create_link(&onboard_dev->dev->kobj, &udev->dev.kobj,
+				  link_name));
+
+	return 0;
+
+error:
+	mutex_unlock(&onboard_dev->lock);
+
+	return err;
+}
+
+static void onboard_dev_remove_usbdev(struct onboard_dev *onboard_dev,
+				      const struct usb_device *udev)
+{
+	struct usbdev_node *node;
+	char link_name[64];
+
+	get_udev_link_name(udev, link_name, sizeof(link_name));
+	sysfs_remove_link(&onboard_dev->dev->kobj, link_name);
+
+	mutex_lock(&onboard_dev->lock);
+
+	list_for_each_entry(node, &onboard_dev->udev_list, list) {
+		if (node->udev == udev) {
+			list_del(&node->list);
+			kfree(node);
+			break;
+		}
+	}
+
+	mutex_unlock(&onboard_dev->lock);
+}
+
+static ssize_t always_powered_in_suspend_show(struct device *dev,
+					      struct device_attribute *attr,
+					      char *buf)
+{
+	const struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", onboard_dev->always_powered_in_suspend);
+}
+
+static ssize_t always_powered_in_suspend_store(struct device *dev,
+					       struct device_attribute *attr,
+					       const char *buf, size_t count)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret < 0)
+		return ret;
+
+	onboard_dev->always_powered_in_suspend = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(always_powered_in_suspend);
+
+static struct attribute *onboard_dev_attrs[] = {
+	&dev_attr_always_powered_in_suspend.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(onboard_dev);
+
+static void onboard_dev_attach_usb_driver(struct work_struct *work)
+{
+	int err;
+
+	err = driver_attach(&onboard_dev_usbdev_driver.driver);
+	if (err)
+		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
+}
+
+static int onboard_dev_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct onboard_dev *onboard_dev;
+	unsigned int i;
+	int err;
+
+	onboard_dev = devm_kzalloc(dev, sizeof(*onboard_dev), GFP_KERNEL);
+	if (!onboard_dev)
+		return -ENOMEM;
+
+	onboard_dev->pdata = device_get_match_data(&pdev->dev);
+	if (!onboard_dev->pdata)
+		return -EINVAL;
+
+	if (onboard_dev->pdata->num_supplies > MAX_SUPPLIES)
+		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
+				     MAX_SUPPLIES);
+
+	for (i = 0; i < onboard_dev->pdata->num_supplies; i++)
+		onboard_dev->supplies[i].supply = supply_names[i];
+
+	err = devm_regulator_bulk_get(dev, onboard_dev->pdata->num_supplies,
+				      onboard_dev->supplies);
+	if (err) {
+		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
+		return err;
+	}
+
+	onboard_dev->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(onboard_dev->clk))
+		return dev_err_probe(dev, PTR_ERR(onboard_dev->clk),
+				     "failed to get clock\n");
+
+	onboard_dev->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+							  GPIOD_OUT_HIGH);
+	if (IS_ERR(onboard_dev->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(onboard_dev->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	onboard_dev->dev = dev;
+	mutex_init(&onboard_dev->lock);
+	INIT_LIST_HEAD(&onboard_dev->udev_list);
+
+	dev_set_drvdata(dev, onboard_dev);
+
+	err = onboard_dev_power_on(onboard_dev);
+	if (err)
+		return err;
+
+	/*
+	 * The USB driver might have been detached from the USB devices by
+	 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
+	 * make sure to re-attach it if needed.
+	 *
+	 * This needs to be done deferred to avoid self-deadlocks on systems
+	 * with nested onboard hubs.
+	 */
+	schedule_work(&attach_usb_driver_work);
+
+	return 0;
+}
+
+static void onboard_dev_remove(struct platform_device *pdev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(&pdev->dev);
+	struct usbdev_node *node;
+	struct usb_device *udev;
+
+	onboard_dev->going_away = true;
+
+	mutex_lock(&onboard_dev->lock);
+
+	/* unbind the USB devices to avoid dangling references to this device */
+	while (!list_empty(&onboard_dev->udev_list)) {
+		node = list_first_entry(&onboard_dev->udev_list,
+					struct usbdev_node, list);
+		udev = node->udev;
+
+		/*
+		 * Unbinding the driver will call onboard_dev_remove_usbdev(),
+		 * which acquires onboard_dev->lock. We must release the lock
+		 * first.
+		 */
+		get_device(&udev->dev);
+		mutex_unlock(&onboard_dev->lock);
+		device_release_driver(&udev->dev);
+		put_device(&udev->dev);
+		mutex_lock(&onboard_dev->lock);
+	}
+
+	mutex_unlock(&onboard_dev->lock);
+
+	onboard_dev_power_off(onboard_dev);
+}
+
+MODULE_DEVICE_TABLE(of, onboard_dev_match);
+
+static const struct dev_pm_ops __maybe_unused onboard_dev_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(onboard_dev_suspend, onboard_dev_resume)
+};
+
+static struct platform_driver onboard_dev_driver = {
+	.probe = onboard_dev_probe,
+	.remove_new = onboard_dev_remove,
+
+	.driver = {
+		.name = "onboard-usb-dev",
+		.of_match_table = onboard_dev_match,
+		.pm = pm_ptr(&onboard_dev_pm_ops),
+		.dev_groups = onboard_dev_groups,
+	},
+};
+
+/************************** USB driver **************************/
+
+#define VENDOR_ID_CYPRESS	0x04b4
+#define VENDOR_ID_GENESYS	0x05e3
+#define VENDOR_ID_MICROCHIP	0x0424
+#define VENDOR_ID_REALTEK	0x0bda
+#define VENDOR_ID_TI		0x0451
+#define VENDOR_ID_VIA		0x2109
+
+/*
+ * Returns the onboard_dev platform device that is associated with the USB
+ * device passed as parameter.
+ */
+static struct onboard_dev *_find_onboard_dev(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct onboard_dev *onboard_dev;
+
+	pdev = of_find_device_by_node(dev->of_node);
+	if (!pdev) {
+		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
+		if (!np) {
+			dev_err(dev, "failed to find device node for peer hub\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+
+		if (!pdev)
+			return ERR_PTR(-ENODEV);
+	}
+
+	onboard_dev = dev_get_drvdata(&pdev->dev);
+	put_device(&pdev->dev);
+
+	/*
+	 * The presence of drvdata ('hub') indicates that the platform driver
+	 * finished probing. This handles the case where (conceivably) we could
+	 * be running at the exact same time as the platform driver's probe. If
+	 * we detect the race we request probe deferral and we'll come back and
+	 * try again.
+	 */
+	if (!onboard_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return onboard_dev;
+}
+
+static int onboard_dev_usbdev_probe(struct usb_device *udev)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev;
+	int err;
+
+	/* ignore supported devices without device tree node */
+	if (!dev->of_node)
+		return -ENODEV;
+
+	onboard_dev = _find_onboard_dev(dev);
+	if (IS_ERR(onboard_dev))
+		return PTR_ERR(onboard_dev);
+
+	dev_set_drvdata(dev, onboard_dev);
+
+	err = onboard_dev_add_usbdev(onboard_dev, udev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
+
+	onboard_dev_remove_usbdev(onboard_dev, udev);
+}
+
+static const struct usb_device_id onboard_dev_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB33{0,1,2}x/CYUSB230x 3.0 */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB33{0,1,2}x/CYUSB230x 2.0 */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6570) }, /* CY7C6563x 2.0 */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
+	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
+	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
+	{}
+};
+MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
+
+static struct usb_device_driver onboard_dev_usbdev_driver = {
+	.name = "onboard-usb-dev",
+	.probe = onboard_dev_usbdev_probe,
+	.disconnect = onboard_dev_usbdev_disconnect,
+	.generic_subclass = 1,
+	.supports_autosuspend =	1,
+	.id_table = onboard_dev_id_table,
+};
+
+static int __init onboard_dev_init(void)
+{
+	int ret;
+
+	ret = usb_register_device_driver(&onboard_dev_usbdev_driver, THIS_MODULE);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&onboard_dev_driver);
+	if (ret)
+		usb_deregister_device_driver(&onboard_dev_usbdev_driver);
+
+	return ret;
+}
+module_init(onboard_dev_init);
+
+static void __exit onboard_dev_exit(void)
+{
+	usb_deregister_device_driver(&onboard_dev_usbdev_driver);
+	platform_driver_unregister(&onboard_dev_driver);
+
+	cancel_work_sync(&attach_usb_driver_work);
+}
+module_exit(onboard_dev_exit);
+
+MODULE_AUTHOR("Matthias Kaehlcke <mka@chromium.org>");
+MODULE_DESCRIPTION("Driver for discrete onboard USB devices");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_dev.h
similarity index 71%
rename from drivers/usb/misc/onboard_usb_hub.h
rename to drivers/usb/misc/onboard_usb_dev.h
index f360d5cf8d8a..f13d11a84371 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -3,60 +3,60 @@
  * Copyright (c) 2022, Google LLC
  */
 
-#ifndef _USB_MISC_ONBOARD_USB_HUB_H
-#define _USB_MISC_ONBOARD_USB_HUB_H
+#ifndef _USB_MISC_ONBOARD_USB_DEV_H
+#define _USB_MISC_ONBOARD_USB_DEV_H
 
-struct onboard_hub_pdata {
+struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
 };
 
-static const struct onboard_hub_pdata microchip_usb424_data = {
+static const struct onboard_dev_pdata microchip_usb424_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
 };
 
-static const struct onboard_hub_pdata microchip_usb5744_data = {
+static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.num_supplies = 2,
 };
 
-static const struct onboard_hub_pdata realtek_rts5411_data = {
+static const struct onboard_dev_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
 };
 
-static const struct onboard_hub_pdata ti_tusb8041_data = {
+static const struct onboard_dev_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
 };
 
-static const struct onboard_hub_pdata cypress_hx3_data = {
+static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
 };
 
-static const struct onboard_hub_pdata cypress_hx2vl_data = {
+static const struct onboard_dev_pdata cypress_hx2vl_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
 };
 
-static const struct onboard_hub_pdata genesys_gl850g_data = {
+static const struct onboard_dev_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
 };
 
-static const struct onboard_hub_pdata genesys_gl852g_data = {
+static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.reset_us = 50,
 	.num_supplies = 1,
 };
 
-static const struct onboard_hub_pdata vialab_vl817_data = {
+static const struct onboard_dev_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
 };
 
-static const struct of_device_id onboard_hub_match[] = {
+static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2517", .data = &microchip_usb424_data, },
@@ -80,4 +80,4 @@ static const struct of_device_id onboard_hub_match[] = {
 	{}
 };
 
-#endif /* _USB_MISC_ONBOARD_USB_HUB_H */
+#endif /* _USB_MISC_ONBOARD_USB_DEV_H */
diff --git a/drivers/usb/misc/onboard_usb_hub_pdevs.c b/drivers/usb/misc/onboard_usb_dev_pdevs.c
similarity index 69%
rename from drivers/usb/misc/onboard_usb_hub_pdevs.c
rename to drivers/usb/misc/onboard_usb_dev_pdevs.c
index ed22a18f4ab7..ca56f67393f1 100644
--- a/drivers/usb/misc/onboard_usb_hub_pdevs.c
+++ b/drivers/usb/misc/onboard_usb_dev_pdevs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * API for creating and destroying USB onboard hub platform devices
+ * API for creating and destroying USB onboard platform devices
  *
  * Copyright (c) 2022, Google LLC
  */
@@ -15,29 +15,30 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/of.h>
-#include <linux/usb/onboard_hub.h>
+#include <linux/usb/onboard_dev.h>
 
-#include "onboard_usb_hub.h"
+#include "onboard_usb_dev.h"
 
 struct pdev_list_entry {
 	struct platform_device *pdev;
 	struct list_head node;
 };
 
-static bool of_is_onboard_usb_hub(const struct device_node *np)
+static bool of_is_onboard_usb_dev(struct device_node *np)
 {
-	return !!of_match_node(onboard_hub_match, np);
+	return !!of_match_node(onboard_dev_match, np);
 }
 
 /**
- * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
- * @parent_hub	: parent hub to scan for connected onboard hubs
- * @pdev_list	: list of onboard hub platform devices owned by the parent hub
+ * onboard_dev_create_pdevs -- create platform devices for onboard USB devices
+ * @parent_hub	: parent hub to scan for connected onboard devices
+ * @pdev_list	: list of onboard platform devices owned by the parent hub
  *
- * Creates a platform device for each supported onboard hub that is connected to
- * the given parent hub. The platform device is in charge of initializing the
- * hub (enable regulators, take the hub out of reset, ...) and can optionally
- * control whether the hub remains powered during system suspend or not.
+ * Creates a platform device for each supported onboard device that is connected
+ * to the given parent hub. The platform device is in charge of initializing the
+ * device (enable regulators, take the device out of reset, ...) and can
+ * optionally control whether the device remains powered during system suspend
+ * or not.
  *
  * To keep track of the platform devices they are added to a list that is owned
  * by the parent hub.
@@ -50,9 +51,9 @@ static bool of_is_onboard_usb_hub(const struct device_node *np)
  * node. That means the root hubs of the primary and secondary HCD share the
  * same device tree node (the HCD node). As a result this function can be called
  * twice with the same DT node for root hubs. We only want to create a single
- * platform device for each physical onboard hub, hence for root hubs the loop
- * is only executed for the root hub of the primary HCD. Since the function
- * scans through all child nodes it still creates pdevs for onboard hubs
+ * platform device for each physical onboard device, hence for root hubs the
+ * loop is only executed for the root hub of the primary HCD. Since the function
+ * scans through all child nodes it still creates pdevs for onboard devices
  * connected to the root hub of the secondary HCD if needed.
  *
  * Further there must be only one platform device for onboard hubs with a peer
@@ -63,7 +64,7 @@ static bool of_is_onboard_usb_hub(const struct device_node *np)
  * the function processes the nodes of both peers. A platform device is only
  * created if the peer hub doesn't have one already.
  */
-void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
+void onboard_dev_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
 {
 	int i;
 	struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
@@ -82,7 +83,7 @@ void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *p
 		if (!np)
 			continue;
 
-		if (!of_is_onboard_usb_hub(np))
+		if (!of_is_onboard_usb_dev(np))
 			goto node_put;
 
 		npc = of_parse_phandle(np, "peer-hub", 0);
@@ -104,7 +105,7 @@ void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *p
 		pdev = of_platform_device_create(np, NULL, &parent_hub->dev);
 		if (!pdev) {
 			dev_err(&parent_hub->dev,
-				"failed to create platform device for onboard hub '%pOF'\n", np);
+				"failed to create platform device for onboard dev '%pOF'\n", np);
 			goto node_put;
 		}
 
@@ -121,16 +122,16 @@ void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *p
 		of_node_put(np);
 	}
 }
-EXPORT_SYMBOL_GPL(onboard_hub_create_pdevs);
+EXPORT_SYMBOL_GPL(onboard_dev_create_pdevs);
 
 /**
- * onboard_hub_destroy_pdevs -- free resources of onboard hub platform devices
- * @pdev_list	: list of onboard hub platform devices
+ * onboard_dev_destroy_pdevs -- free resources of onboard platform devices
+ * @pdev_list	: list of onboard platform devices
  *
  * Destroys the platform devices in the given list and frees the memory associated
  * with the list entry.
  */
-void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
+void onboard_dev_destroy_pdevs(struct list_head *pdev_list)
 {
 	struct pdev_list_entry *pdle, *tmp;
 
@@ -140,4 +141,4 @@ void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
 		kfree(pdle);
 	}
 }
-EXPORT_SYMBOL_GPL(onboard_hub_destroy_pdevs);
+EXPORT_SYMBOL_GPL(onboard_dev_destroy_pdevs);
diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
deleted file mode 100644
index 0dd2b032c90b..000000000000
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ /dev/null
@@ -1,501 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for onboard USB hubs
- *
- * Copyright (c) 2022, Google LLC
- */
-
-#include <linux/clk.h>
-#include <linux/device.h>
-#include <linux/export.h>
-#include <linux/err.h>
-#include <linux/gpio/consumer.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/list.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-#include <linux/slab.h>
-#include <linux/suspend.h>
-#include <linux/sysfs.h>
-#include <linux/usb.h>
-#include <linux/usb/hcd.h>
-#include <linux/usb/onboard_hub.h>
-#include <linux/workqueue.h>
-
-#include "onboard_usb_hub.h"
-
-/*
- * Use generic names, as the actual names might differ between hubs. If a new
- * hub requires more than the currently supported supplies, add a new one here.
- */
-static const char * const supply_names[] = {
-	"vdd",
-	"vdd2",
-};
-
-#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
-
-static void onboard_hub_attach_usb_driver(struct work_struct *work);
-
-static struct usb_device_driver onboard_hub_usbdev_driver;
-static DECLARE_WORK(attach_usb_driver_work, onboard_hub_attach_usb_driver);
-
-/************************** Platform driver **************************/
-
-struct usbdev_node {
-	struct usb_device *udev;
-	struct list_head list;
-};
-
-struct onboard_hub {
-	struct regulator_bulk_data supplies[MAX_SUPPLIES];
-	struct device *dev;
-	const struct onboard_hub_pdata *pdata;
-	struct gpio_desc *reset_gpio;
-	bool always_powered_in_suspend;
-	bool is_powered_on;
-	bool going_away;
-	struct list_head udev_list;
-	struct mutex lock;
-	struct clk *clk;
-};
-
-static int onboard_hub_power_on(struct onboard_hub *hub)
-{
-	int err;
-
-	err = clk_prepare_enable(hub->clk);
-	if (err) {
-		dev_err(hub->dev, "failed to enable clock: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	err = regulator_bulk_enable(hub->pdata->num_supplies, hub->supplies);
-	if (err) {
-		dev_err(hub->dev, "failed to enable supplies: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	fsleep(hub->pdata->reset_us);
-	gpiod_set_value_cansleep(hub->reset_gpio, 0);
-
-	hub->is_powered_on = true;
-
-	return 0;
-}
-
-static int onboard_hub_power_off(struct onboard_hub *hub)
-{
-	int err;
-
-	gpiod_set_value_cansleep(hub->reset_gpio, 1);
-
-	err = regulator_bulk_disable(hub->pdata->num_supplies, hub->supplies);
-	if (err) {
-		dev_err(hub->dev, "failed to disable supplies: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	clk_disable_unprepare(hub->clk);
-
-	hub->is_powered_on = false;
-
-	return 0;
-}
-
-static int __maybe_unused onboard_hub_suspend(struct device *dev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(dev);
-	struct usbdev_node *node;
-	bool power_off = true;
-
-	if (hub->always_powered_in_suspend)
-		return 0;
-
-	mutex_lock(&hub->lock);
-
-	list_for_each_entry(node, &hub->udev_list, list) {
-		if (!device_may_wakeup(node->udev->bus->controller))
-			continue;
-
-		if (usb_wakeup_enabled_descendants(node->udev)) {
-			power_off = false;
-			break;
-		}
-	}
-
-	mutex_unlock(&hub->lock);
-
-	if (!power_off)
-		return 0;
-
-	return onboard_hub_power_off(hub);
-}
-
-static int __maybe_unused onboard_hub_resume(struct device *dev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(dev);
-
-	if (hub->is_powered_on)
-		return 0;
-
-	return onboard_hub_power_on(hub);
-}
-
-static inline void get_udev_link_name(const struct usb_device *udev, char *buf, size_t size)
-{
-	snprintf(buf, size, "usb_dev.%s", dev_name(&udev->dev));
-}
-
-static int onboard_hub_add_usbdev(struct onboard_hub *hub, struct usb_device *udev)
-{
-	struct usbdev_node *node;
-	char link_name[64];
-	int err;
-
-	mutex_lock(&hub->lock);
-
-	if (hub->going_away) {
-		err = -EINVAL;
-		goto error;
-	}
-
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
-	if (!node) {
-		err = -ENOMEM;
-		goto error;
-	}
-
-	node->udev = udev;
-
-	list_add(&node->list, &hub->udev_list);
-
-	mutex_unlock(&hub->lock);
-
-	get_udev_link_name(udev, link_name, sizeof(link_name));
-	WARN_ON(sysfs_create_link(&hub->dev->kobj, &udev->dev.kobj, link_name));
-
-	return 0;
-
-error:
-	mutex_unlock(&hub->lock);
-
-	return err;
-}
-
-static void onboard_hub_remove_usbdev(struct onboard_hub *hub, const struct usb_device *udev)
-{
-	struct usbdev_node *node;
-	char link_name[64];
-
-	get_udev_link_name(udev, link_name, sizeof(link_name));
-	sysfs_remove_link(&hub->dev->kobj, link_name);
-
-	mutex_lock(&hub->lock);
-
-	list_for_each_entry(node, &hub->udev_list, list) {
-		if (node->udev == udev) {
-			list_del(&node->list);
-			kfree(node);
-			break;
-		}
-	}
-
-	mutex_unlock(&hub->lock);
-}
-
-static ssize_t always_powered_in_suspend_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	const struct onboard_hub *hub = dev_get_drvdata(dev);
-
-	return sysfs_emit(buf, "%d\n", hub->always_powered_in_suspend);
-}
-
-static ssize_t always_powered_in_suspend_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
-{
-	struct onboard_hub *hub = dev_get_drvdata(dev);
-	bool val;
-	int ret;
-
-	ret = kstrtobool(buf, &val);
-	if (ret < 0)
-		return ret;
-
-	hub->always_powered_in_suspend = val;
-
-	return count;
-}
-static DEVICE_ATTR_RW(always_powered_in_suspend);
-
-static struct attribute *onboard_hub_attrs[] = {
-	&dev_attr_always_powered_in_suspend.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(onboard_hub);
-
-static void onboard_hub_attach_usb_driver(struct work_struct *work)
-{
-	int err;
-
-	err = driver_attach(&onboard_hub_usbdev_driver.driver);
-	if (err)
-		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
-}
-
-static int onboard_hub_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct onboard_hub *hub;
-	unsigned int i;
-	int err;
-
-	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
-	if (!hub)
-		return -ENOMEM;
-
-	hub->pdata = device_get_match_data(&pdev->dev);
-	if (!hub->pdata)
-		return -EINVAL;
-
-	if (hub->pdata->num_supplies > MAX_SUPPLIES)
-		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
-				     MAX_SUPPLIES);
-
-	for (i = 0; i < hub->pdata->num_supplies; i++)
-		hub->supplies[i].supply = supply_names[i];
-
-	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
-	if (err) {
-		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	hub->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(hub->clk))
-		return dev_err_probe(dev, PTR_ERR(hub->clk), "failed to get clock\n");
-
-	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						  GPIOD_OUT_HIGH);
-	if (IS_ERR(hub->reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
-
-	hub->dev = dev;
-	mutex_init(&hub->lock);
-	INIT_LIST_HEAD(&hub->udev_list);
-
-	dev_set_drvdata(dev, hub);
-
-	err = onboard_hub_power_on(hub);
-	if (err)
-		return err;
-
-	/*
-	 * The USB driver might have been detached from the USB devices by
-	 * onboard_hub_remove() (e.g. through an 'unbind' by userspace),
-	 * make sure to re-attach it if needed.
-	 *
-	 * This needs to be done deferred to avoid self-deadlocks on systems
-	 * with nested onboard hubs.
-	 */
-	schedule_work(&attach_usb_driver_work);
-
-	return 0;
-}
-
-static void onboard_hub_remove(struct platform_device *pdev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(&pdev->dev);
-	struct usbdev_node *node;
-	struct usb_device *udev;
-
-	hub->going_away = true;
-
-	mutex_lock(&hub->lock);
-
-	/* unbind the USB devices to avoid dangling references to this device */
-	while (!list_empty(&hub->udev_list)) {
-		node = list_first_entry(&hub->udev_list, struct usbdev_node, list);
-		udev = node->udev;
-
-		/*
-		 * Unbinding the driver will call onboard_hub_remove_usbdev(),
-		 * which acquires hub->lock.  We must release the lock first.
-		 */
-		get_device(&udev->dev);
-		mutex_unlock(&hub->lock);
-		device_release_driver(&udev->dev);
-		put_device(&udev->dev);
-		mutex_lock(&hub->lock);
-	}
-
-	mutex_unlock(&hub->lock);
-
-	onboard_hub_power_off(hub);
-}
-
-MODULE_DEVICE_TABLE(of, onboard_hub_match);
-
-static const struct dev_pm_ops __maybe_unused onboard_hub_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(onboard_hub_suspend, onboard_hub_resume)
-};
-
-static struct platform_driver onboard_hub_driver = {
-	.probe = onboard_hub_probe,
-	.remove_new = onboard_hub_remove,
-
-	.driver = {
-		.name = "onboard-usb-hub",
-		.of_match_table = onboard_hub_match,
-		.pm = pm_ptr(&onboard_hub_pm_ops),
-		.dev_groups = onboard_hub_groups,
-	},
-};
-
-/************************** USB driver **************************/
-
-#define VENDOR_ID_CYPRESS	0x04b4
-#define VENDOR_ID_GENESYS	0x05e3
-#define VENDOR_ID_MICROCHIP	0x0424
-#define VENDOR_ID_REALTEK	0x0bda
-#define VENDOR_ID_TI		0x0451
-#define VENDOR_ID_VIA		0x2109
-
-/*
- * Returns the onboard_hub platform device that is associated with the USB
- * device passed as parameter.
- */
-static struct onboard_hub *_find_onboard_hub(struct device *dev)
-{
-	struct platform_device *pdev;
-	struct device_node *np;
-	struct onboard_hub *hub;
-
-	pdev = of_find_device_by_node(dev->of_node);
-	if (!pdev) {
-		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
-		if (!np) {
-			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
-		}
-
-		pdev = of_find_device_by_node(np);
-		of_node_put(np);
-
-		if (!pdev)
-			return ERR_PTR(-ENODEV);
-	}
-
-	hub = dev_get_drvdata(&pdev->dev);
-	put_device(&pdev->dev);
-
-	/*
-	 * The presence of drvdata ('hub') indicates that the platform driver
-	 * finished probing. This handles the case where (conceivably) we could
-	 * be running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
-	 */
-	if (!hub)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	return hub;
-}
-
-static int onboard_hub_usbdev_probe(struct usb_device *udev)
-{
-	struct device *dev = &udev->dev;
-	struct onboard_hub *hub;
-	int err;
-
-	/* ignore supported hubs without device tree node */
-	if (!dev->of_node)
-		return -ENODEV;
-
-	hub = _find_onboard_hub(dev);
-	if (IS_ERR(hub))
-		return PTR_ERR(hub);
-
-	dev_set_drvdata(dev, hub);
-
-	err = onboard_hub_add_usbdev(hub, udev);
-	if (err)
-		return err;
-
-	return 0;
-}
-
-static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(&udev->dev);
-
-	onboard_hub_remove_usbdev(hub, udev);
-}
-
-static const struct usb_device_id onboard_hub_id_table[] = {
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB33{0,1,2}x/CYUSB230x 3.0 */
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB33{0,1,2}x/CYUSB230x 2.0 */
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6570) }, /* CY7C6563x 2.0 */
-	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
-	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
-	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
-	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
-	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
-	{}
-};
-MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
-
-static struct usb_device_driver onboard_hub_usbdev_driver = {
-	.name = "onboard-usb-hub",
-	.probe = onboard_hub_usbdev_probe,
-	.disconnect = onboard_hub_usbdev_disconnect,
-	.generic_subclass = 1,
-	.supports_autosuspend =	1,
-	.id_table = onboard_hub_id_table,
-};
-
-static int __init onboard_hub_init(void)
-{
-	int ret;
-
-	ret = usb_register_device_driver(&onboard_hub_usbdev_driver, THIS_MODULE);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&onboard_hub_driver);
-	if (ret)
-		usb_deregister_device_driver(&onboard_hub_usbdev_driver);
-
-	return ret;
-}
-module_init(onboard_hub_init);
-
-static void __exit onboard_hub_exit(void)
-{
-	usb_deregister_device_driver(&onboard_hub_usbdev_driver);
-	platform_driver_unregister(&onboard_hub_driver);
-
-	cancel_work_sync(&attach_usb_driver_work);
-}
-module_exit(onboard_hub_exit);
-
-MODULE_AUTHOR("Matthias Kaehlcke <mka@chromium.org>");
-MODULE_DESCRIPTION("Driver for discrete onboard USB hubs");
-MODULE_LICENSE("GPL v2");
diff --git a/include/linux/usb/onboard_dev.h b/include/linux/usb/onboard_dev.h
new file mode 100644
index 000000000000..b79db6d193c8
--- /dev/null
+++ b/include/linux/usb/onboard_dev.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_USB_ONBOARD_DEV_H
+#define __LINUX_USB_ONBOARD_DEV_H
+
+struct usb_device;
+struct list_head;
+
+#if IS_ENABLED(CONFIG_USB_ONBOARD_DEV)
+void onboard_dev_create_pdevs(struct usb_device *parent_dev, struct list_head *pdev_list);
+void onboard_dev_destroy_pdevs(struct list_head *pdev_list);
+#else
+static inline void onboard_dev_create_pdevs(struct usb_device *parent_dev,
+					    struct list_head *pdev_list) {}
+static inline void onboard_dev_destroy_pdevs(struct list_head *pdev_list) {}
+#endif
+
+#endif /* __LINUX_USB_ONBOARD_DEV_H */
diff --git a/include/linux/usb/onboard_hub.h b/include/linux/usb/onboard_hub.h
deleted file mode 100644
index d9373230556e..000000000000
--- a/include/linux/usb/onboard_hub.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __LINUX_USB_ONBOARD_HUB_H
-#define __LINUX_USB_ONBOARD_HUB_H
-
-struct usb_device;
-struct list_head;
-
-#if IS_ENABLED(CONFIG_USB_ONBOARD_HUB)
-void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list);
-void onboard_hub_destroy_pdevs(struct list_head *pdev_list);
-#else
-static inline void onboard_hub_create_pdevs(struct usb_device *parent_hub,
-					    struct list_head *pdev_list) {}
-static inline void onboard_hub_destroy_pdevs(struct list_head *pdev_list) {}
-#endif
-
-#endif /* __LINUX_USB_ONBOARD_HUB_H */

-- 
2.40.1

