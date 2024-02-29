Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C1886C399
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995DC10E2B8;
	Thu, 29 Feb 2024 08:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="qOq0r3/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2110.outbound.protection.outlook.com [40.107.22.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D17910E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU51AVVeSEUD1IjxvVwDZIiHVKUFWMo4JheXKF38aYp0LEWaIESKPY27EZUO4wykv/cLSiz1ZlATa5V8Nc3qs3IpOuBwA2fTSgPgbUR7CQ5Yt3KpqDjl9dxGQp5T6W+i6+uS6A4ikocNaCptoqmrwQ9OUaRVNrLZKrxc7JQeXuyVVKCV9OSWUkrcYdRIwSzO9e3T7tLoCbI+spfr7CqPRPAFhK0GG4g9j5ekIp4yTJV0rfpMJkrUU6Q+W8NIiiMAHCPy8iLM06A4WfGcqRTaXhSv9FdEt/u7prT/gVviQzAA2y8GTG/XRQKCTHhy+BPgA60g6N6auWmJxkx82TulsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZfA5n0Ada87GjUe9hHZJhuSDnEQvVQEnbg2Q8h+LYA=;
 b=TsfzjYs/BdTLcKINuGMJx31HbeDm0yB3CGyjV1uyQtqDfuMaDUHJKEfiVsahoXbRRmK88bC8wVbNEeKQ98W/nF1c6rotnVvPXFcjriSKfBck47Vcwrlm8B4UqmkE/KwQWzjBhuuJWycpcqzzPOoztRWPK/P9EldnOtQSpT8RDma5DgSaSpNy39nq4HQLmYRed67uJsozSTJ1pjnVwAVvCa4v4FtRQo3a5XWrv1ImJR2CyoikYf57Q2jAMF7tuElnbnArfG5RG8qostFgeCsmJ7G8dNqHxYaOPoENlrlXpMOX7MhpvQ0Rfay50Ahts50yOvE0dCXMmEUZGiHS6oBYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZfA5n0Ada87GjUe9hHZJhuSDnEQvVQEnbg2Q8h+LYA=;
 b=qOq0r3/+NwwSqeMCCUp83jk+0RwMyblk4jJaS0BtKufu95B+2k6OHA252M+9HRl1ggucNWSo+v1gnbN6t5sTxweMh0x2CEOtKR45mtFm2hGPJ9O/1ZAP5y3IV3H+KBz0Xx0p3eEx4SsbBdO3AUc6iJ4Rf5pLg3WbK50UIVjDBUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:34:53 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:34:52 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: [PATCH v6 0/9] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Date: Thu, 29 Feb 2024 09:34:43 +0100
Message-Id: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKNB4GUC/3XOzarCMBAF4FeRrG9kpkmmua58DxFp/jQgjaQSF
 em7G3Wh0Lo8A/Odc2eDz9EPbLW4s+xLHGLqa6C/BbOHrt97Hl3NrIFGAgrgqTepy253LUEoAE4
 WfKsdYoeG1a9T9iFeX+JmW/MhDueUb6+Cgs/rb6sgB67QKPGvJZA160s6hveoZe/P7AkW8UEao
 CkiKhK0MiARibSeReQX0swskRVxFglba5VzchZR34ieIqoiLRkNKjgRPE2QcRwfpr0vFIIBAAA
 =
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=6390;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=Pp28OTxcmYOQO4q65XW6Z69VSkriW1xDu3yJGmG0pN0=;
 b=F7QujYNZLm+DVGrkUoq8Zcem5+XrX5iKNhaimbTGYa9ZFhXhkdX8NEBmRIl4KZR4xUnC2vday
 h63N0sG+44JBCa1oEcJfH9ftzjxqsOxuPx/vm7XvkDAhXQKwUJk/rqD
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e34c75-c1ba-406d-05e3-08dc39014cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n259osFWy98o9uAmfg91CnPWoVZVVQK77HEBKUe2v7dRRnATmZd2CM2YKBon2WTog6zF8efl3ojl9PCCJRtq98borBBWIu++2CWImZMja4k+Dow4n2R6C1BE4F0joPF4qVcXIvbSHAhAt08U+0o7+oyAUarZW5zTjhLFevnMfmq2QnZN9rSTbm6OnElaOo/8aY3pinR20eCsWdSRrcl3mf1TFaqRruS8BlhPPVYel+gXzosMbnfgUK95wnkX+QhMMhpZdhTlUcuEc2j8sgTr6bkYqtJOJsER54fxuF5tqH4XuytACMuqtMIAOFiDRQTZDEZFsbUJU+laIpcyJY58RBflfqncpByjIk4H25ZsmVJgCL46yu3oYwXyizjqxDzTyX7bo/4bpCEl1nACSXkjWhyf5cfRazUH8VH7PWqoxDU18635VRQM5aa184O6WR0p6XnyyEVAzAMTXaVET7XvkIphsSMn5/mHGvazvOdX5YZBHpn8vfXr8ohCh8sJB1aPeWfRrlZcf1gk8t35jKxvTboHLav3PBQvuvYiKkcCw2O09GhpkyJkzza6LwxL+M3RwJVOqToPySR7MTck6dUBCSMYY9kZY6cGa7zmK5pwxO1NGn3if1pNQqq63XfmjAmu1FwGODO8jjnjS+veYl9TOMHqo5dT+bFeDhZN/yehI/+/rDj6LsMUEd0tL103NkulTQI9Vaj4CLqqblivUnpLRYbgHuOVdncI8NnHDJz5ZHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2J1Qnd2cTVEcDRGNERhZmJyZVVaeDhqRXExbHdRZUp2OXVDLzFsSW5oeEhY?=
 =?utf-8?B?ZG1LbFBpQzlyaFJSc2xTd2RxWXludGE3YlFpMHQ0cWY1cU9QdUlvTlRLMTNp?=
 =?utf-8?B?Nk1rakpCQ2JGTFBnaElPRUhObU1ZNWI3UXN2ZzRhcnpJNGNBRkUxdnRUbjBN?=
 =?utf-8?B?RnJ0dVp0bGdOSmhWeDlaVS9KdENrVlRBb1hyRGlWYlVHRXVwSEt0ODN2NnI0?=
 =?utf-8?B?ZG4yU3hOUStmeHRVZXdEUWRKaHpRckMzL25uTFRRSVd4c2hPaCtFMXNkWHJE?=
 =?utf-8?B?UFU5RDF5RFdTZ05RbWVZVXhIbW44Wjd2dTFzQ09TSkNuSloyU0Z4RlZaZzRY?=
 =?utf-8?B?YWxhL1I1SGhPbGdDem5odVJsaTBMYlpnWGFoWFIzN01IcDV5c2l1blJHdThU?=
 =?utf-8?B?MXh0dFhNM0txS0JCYjNHRVlHUThjMThrN0c4SGdFREdieHo4bWJ3STBMNkYx?=
 =?utf-8?B?azhnS3lDS0k2MmdxZ0ZwUkFRbDI5Q0twV0JqUmpCRlpxS3lWU0JIY2t5SE0v?=
 =?utf-8?B?UlRUcVhRMFMzM095enRZeUxneUQ1MHJPSHpGcExzc2FLTS94bTBudXg4eXcw?=
 =?utf-8?B?ZWkvOUw0bzJTSUlGZVlydFo3RGJnVnVpVHE3RmpiZXBYN0V6N0JWeGxGeWhE?=
 =?utf-8?B?L3JXQXFYNGtXNDBCTWV0NEhQU212ZFNVSUFJbVgyZzc4bWJyQk5BYlhtWkR3?=
 =?utf-8?B?UGdDZnpoMTFiSk81cUR3TjU0cUNwbncwc0RFMUdLQ1QrK0lSUGdURWozSnVk?=
 =?utf-8?B?c2xac0Vvc3ZWZHkvSkFwRmhyYitCdHNFa0FycWVSaXN4cVNGSTBiUGNZOU4x?=
 =?utf-8?B?OVhrcFJGZ1JHVit0VzllWkxsd2p6cU9rajhXQWNRSUtCYmJFSTV1cHkySURU?=
 =?utf-8?B?OEJXYjdudVBwQzNUK3daOGxma0k4RUVoYXFKY2IrZzJaVEg3ZFN2Znlzek1M?=
 =?utf-8?B?UTRCWTVSSjhLcmFHbGRDdlBxNzdSNTJ0WWNyYVFIam9PUmJRcEFjVHNCbk5a?=
 =?utf-8?B?QWJsczg0T2drN1o4V2svSEw2VnZsSFdRT21FaC81NUNsWDVZOGo5TE16bkZM?=
 =?utf-8?B?dVBvM043UCtmc0g2SnR3OGc2QVNIU29yNm1CSE9kakl2ZlRXV0oyR0FnbW96?=
 =?utf-8?B?ZnR2aGVuU2xaRXdnSno5K2sxOUFJdFBaQS8rL0FDMHNLb0diRENXb216b3da?=
 =?utf-8?B?R09IUWRaZ3RTSFljZDRwN01ZRmJLRHRRWGI0Z0t1ditDRThiSnl5aEE4NzI2?=
 =?utf-8?B?S05GK2ZtQUw2cUQvbzRRQW01UFZBT3dGQUZaQ1pDM2x5TU02SkIxcG9Cakc3?=
 =?utf-8?B?clV6UVhjN3U1dFFRYVJsVzZCamJ4YjcweFhiOS8zek5WaTM4dEtMaHA5NU9Q?=
 =?utf-8?B?ZnMvY08vNEVkRW51bFJ3U1hQNkhmNkJOY25PSzhJNTNYNTBTeG5aWVpIaWpF?=
 =?utf-8?B?VUxiRzc0dTBuWlh3MXgxeDJ0Z0hsdEFGWWs4TDQwc3lmQnA5KzM1YWhCa2Fo?=
 =?utf-8?B?UGFhVFl2d0VVdm5WWUljVnFvS2h5YjNaTmNyRWtvb2tsMmFBZVJQYklOMC82?=
 =?utf-8?B?QkxLMUR0VHI0RjhzWWMxdVlWVFBtZXE1cXBudnE4Q3ZmN2tMQXFHQzBEMUlS?=
 =?utf-8?B?Q2ZEUk9IbWplbHFaNVhqSHl0dm81Tm9DRzJUcmFEcXZETkJCY2J4d2hwR3lR?=
 =?utf-8?B?d3ZEN2RtOXRIdmRYSWUrVEVnSUJCQTVPbmN6cnR2UGl3MFpxYW44WWh3QVox?=
 =?utf-8?B?bGFTQTVqSGF5NjN6d0ZldHRVeDNocU5Ed3hvQzM2OHpyWmdLMjhLcDk1SHlO?=
 =?utf-8?B?TFlBMVFYbjdjWWJXM0tpT1RIdG1acm5SS2pIS3VoUUt0Vm9VbXpiSTZOMC9K?=
 =?utf-8?B?ekdIRUlEazlvb1llaDV5b3dWK051eU91RFVVWXluZXdiRE5jMml0dW5hK2ti?=
 =?utf-8?B?aUlDSXl6MldUK1hIUmJNeVM1UDU0WVY5em1Gbi9BUm93SWxOUmhDdFFDbmVk?=
 =?utf-8?B?Z29VenpPQnlTamNheERKODRlemJuWmtoR3Nqd1ZCWit0eUlUUm9sUXNRVXNn?=
 =?utf-8?B?QzBSSnJGaHBjbXBwU0JRb0VJamVYTkgvYWg0czBlQjRPWkJ5UU1YY01ad2hx?=
 =?utf-8?B?NHVzV1VFbzNva2pCaUFzOXQ2ekFxS1lCUlNQNFI3THdudmowL1RiQSt3Z2d3?=
 =?utf-8?Q?U1Z6wLt4IOnivhIFC1Zu6jI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e34c75-c1ba-406d-05e3-08dc39014cb2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:34:52.5422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xovr3czNLk+v5uB639wyCsoNAUXfJhJUUqS3nhqagzJRmT1xTh+LAt/eOV278RIl/uGkC3F4ifGzczfEvIEPOw0wYcaY3rTpIIq5YgXGQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9727
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

This series adds support for the XMOS XVF3500 VocalFusion Voice
Processor[1], a low-latency, 32-bit multicore controller for voice
processing.

The XVF3500 requires a specific power sequence, which consists of
enabling the regulators that control the 3V3 and 1V0 device supplies,
and a reset de-assertion after a delay of at least 100ns. Once in normal
operation, the XVF3500 registers itself as a regular USB device and no
device-specific management is required.

The power management provided by onboard_usb_hub is not specific for hubs
and any other USB device with the same power sequence could profit from
that driver, provided that the device does not have any specific
requirements beyond the power management. To account for non-hub devices,
the driver has been renamed and an extra flag has been added to identify
hubs and provide their specific functionality.

Support for device-specific power suply names has also been added, keeping
generic names for already supported devices to keep backwards
compatibility.

The references to onboard_usb_hub in the core and config files have been
updated as well.

The diff is way much bulkier than the actual code addition because of the
file renaming, so in order to ease reviews and catch hub-specific code
that might still affect non-hub devices, the complete renaming was moved
to a single commit.

This series has been tested with a Rockchip-based SoC and an XMOS
XVF3500-FB167-C.

[1] https://www.xmos.com/xvf3500/

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helen Koike <helen.koike@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Changes in v6:
- onboard_usb_hub.c: use dev pointer in probe consistently (new patch).
- onboard_usb_hub.c: rename get_regulator_bulk function to
  get_regulators and only pass onboard_hub (hub in probe) as argument.
- onboard_usb_hub.c: drop file after renaming.
- onboard_usb_dev.c: improve device descriptions in usb_device_id table.
- onboard_usb_dev.c: keep non-hub devices powered on in suspend.
- General: update commit messages (use usb_hub_dev after renaming).
- Link to v5: https://lore.kernel.org/r/20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net

Changes in v5:
- onboard_usb_dev: move device suppy names handling to [1/8].
- onboard_usb_dev.c: make always_powered_in_suspend not visible for
  non-hub devices.
- onboard_usb_dev.c: move is_hub check in suspend() to functio entry.
- onboard_usb_dev_pdevs.c: comment rephrasing to account for
  hub-specific attribute.
- Link to v4: https://lore.kernel.org/r/20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net

Changes in v4:
- General: use device supply names and generics as fallback.
- onbord_usb_dev.c: fix suspend callback for non-hub devices.
- onboard_usb_dev.c: fix typos.

- Link to v3: https://lore.kernel.org/r/20240206-onboard_xvf3500-v3-0-f85b04116688@wolfvision.net

Changes in v3:
- onboard_usb_hub: rename to onboard_usb_dev to include non-hub devices.
- onboard_hub_dev: add flag to identify hubs and provide their extra
  functionality.
- dt-bindings: add reference to usb-device.yaml and usb node in the
  example.
- dt-bindings: generic node name.
- Link to v2: https://lore.kernel.org/r/20240130-onboard_xvf3500-v1-0-51b5398406cb@wolfvision.net

Changes in v2:
- general: add support in onboard_usb_hub instead of using a dedicated
  driver.
- dt-bindings: use generic usb-device compatible ("usbVID,PID").
- Link to v1: https://lore.kernel.org/all/20240115-feature-xvf3500_driver-v1-0-ed9cfb48bb85@wolfvision.net/

---
Javier Carrasco (9):
      usb: misc: onboard_hub: use pointer consistently in the probe function
      usb: misc: onboard_hub: use device supply names
      usb: misc: onboard_hub: rename to onboard_dev
      drm: ci: arm64.config: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      arm64: defconfig: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      ARM: multi_v7_defconfig: update ONBOARD_USB_HUB to ONBOAD_USB_DEV
      usb: misc: onboard_dev: add support for non-hub devices
      ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500 voice processor
      usb: misc: onboard_dev: add support for XMOS XVF3500

 ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   3 +-
 .../devicetree/bindings/sound/xmos,xvf3500.yaml    |  63 +++
 MAINTAINERS                                        |   4 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/gpu/drm/ci/arm64.config                    |   4 +-
 drivers/usb/core/Makefile                          |   4 +-
 drivers/usb/core/hub.c                             |   8 +-
 drivers/usb/core/hub.h                             |   2 +-
 drivers/usb/misc/Kconfig                           |  16 +-
 drivers/usb/misc/Makefile                          |   2 +-
 drivers/usb/misc/onboard_usb_dev.c                 | 544 +++++++++++++++++++++
 .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  58 ++-
 ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
 drivers/usb/misc/onboard_usb_hub.c                 | 501 -------------------
 include/linux/usb/onboard_dev.h                    |  18 +
 include/linux/usb/onboard_hub.h                    |  18 -
 17 files changed, 717 insertions(+), 579 deletions(-)
---
base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
change-id: 20240130-onboard_xvf3500-6c0e78d11a1b

Best regards,
-- 
Javier Carrasco <javier.carrasco@wolfvision.net>

