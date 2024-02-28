Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D886B0BD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6EC10E29D;
	Wed, 28 Feb 2024 13:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Q4GDWAVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2109.outbound.protection.outlook.com [40.107.13.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B2A10E295
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmkM4fLiuU3VnjBK8/qw++j3jQmRw8quuHg5eKAqjNWXMMiWAqTVN+arWUE0/pMT5/m+rYOPtkaVODPRIyUONb539mInumO2fsSWkhh3VpgnvUu0itTFI/Mdr5QwKyqpfcKiA0zAl6+59Oibn3o9a7jKvegUkz7GBhh3/32RQtA01JYbhxYmiEMfxzJsHrRThKTFiRvQVs2asuE3hm6vfWaX6xZxy7MmpQRlSqlDU4naedmA6hJ9B3tuAR+8JPwx1QJZpOAE9wyFNQx9KRT2mCftv/N4M5cuREwnT28N1xpt6tz5eyqiojBSNsMGy1egNpRgfrkLwfpBbagFbxeaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e4J6isjYmxQ3WBx/PKvKPzF6f/PfqnmU/HR27bWPkw=;
 b=C11BVanOIlHyNNBJKZN7PnFivtoPJwQobx7AztiVngXkLgze390R1qG39F6OmYT0kJB8h4bCwpmeBbSua3RacIdn6XXNI7SD6oNYkO02u9gO77EMJ4cn56khh66HtQphMCJMRM2+XtQTCNTr++tutOt0/ENqPz3dGbIGp2o7OQORSybTlxLFkOqbEzsAnOz+e2ocmNUyoghekd4iG8OIUMkJSVpN8Z0lvXX19iEebHUwTNP6b4wnYTZKRIrzFWdIjX9+7/28ayyY9MwbC/M16t1/gdvxRVGWU28PK8R6v4aWQuXuZPnrKsvBaEWAWLuCeAIwBKPCm4mndbHC43zWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8e4J6isjYmxQ3WBx/PKvKPzF6f/PfqnmU/HR27bWPkw=;
 b=Q4GDWAVpLoNpQSoWmLk+Y17nna978obpB/yKBX+LL9J0/bJ/Fq9mcBqnt5Ajq2juVVhfBbkER/P8UOpKkZiGscZAeL5+OaZVpkb4y0yO3mvWwqibfbEjD5frRg5nZkZtNtFsFDaBVx06B/1SrlG2ENoCtlwAiheu5jxgSoNXmxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:35 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:35 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: [PATCH v5 0/8] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Date: Wed, 28 Feb 2024 14:51:27 +0100
Message-Id: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8632UC/3XOywrCMBAF0F+RrI3M5GV05X+ISPPSgDSSSlRK/
 920LhSqyzsw596edD5H35HtoifZl9jF1NYglwtiz0178jS6mgkDJgA50NSa1GR3fJTAJQBVFvx
 aO8QGDalf1+xDfEzi/lDzOXa3lJ9TQcHx+t8qSIFKNJJvtABlze6eLuE9atX6GxnBwj8IAzVHe
 EWClgYEolJa/0TEF8J+LBEVcRYVrq2VzokZMgzDCwbDQIE9AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=5716;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=3+bDd9Eb6nBKr15+jzB6ynosxGl2f7RNUGbXPhNhdrs=;
 b=MK5p7NsBW5nbc1NQnerwSDDrZyfNhvflxEObtUKTjcJMSDEEQp0gONL5U3tJ/YyPs73g53TQT
 QM+C5DrGo0aAGKA5+ZSG3aeXRXSa6NJawuTIMLdyXrUPNf2JJRIe+ce
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec24123-bdea-419f-91e7-08dc386460b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2ObBu9GY+4fOAb/pGekB5rVL9DToGK19eYGnZ6ecYpJ49tjGMVnRbjQAm7+h+ixqKMcR/jnxll26CIhtBWL9rQbchvYBFaMmOn9ScFRQlv+nIY654qeJOlE26g/kJ8Tm5MlcZLkBjzcOcNRlapHGTw2AkdHapcBJki2ku0Op1W5ehjaeD/UCsf/0o+fi7wTL6mDlz+EmjZhFMUW8uocH0yBTiLTYPZFZrwUKX1E/ztXO+RumznVC83UnNA0OYg/xO1QXXeb2gueMvXTAVfg8syTtYqrr76gfqqJkq0odR7bekxvtyTH2ABehDj9jMhhCGaXHJMLeADLKy2Oeb0hV52sW57qosLFZu8qxLXLA+KTA6PhpsTSYYyibyXoxbRdV6KMquXNe1pL8TZt/03L2IDBUWoBPEVHq7JFZI5BvDWFN2WcL9p5D1sah+gT4UgTgtWdIOv6f/F9Oh9ArfXywbJMo95gq8EbG6fdMdNODG1CMOfqrHU6dK27HCD4360DP8u7FWtv93szDG5zPe77qHko0pQOgrNHtLf4R6tfYJOzIZPmzhFnazZHFxHp/82dR+jsM7gzxDhZ6StJZqmJMzzn1WY4DijCLCq4DNGS9zzr97DRVOHZ2ZM0PItDuXXMAU0mEk/mKS4e7KYf9cWpLhNSDPaH3QJke5HGOq2Y7xox0mLmn2YlATQ4zKYLzGKOQpWs50r6Vmxr92uIVAe9e6fDDwH9NJaT9443DAJlCfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDlLVTFoZUFHTWkwcllhR1NWZHhjNHk3OGRDWmY0akc5MkprMzRKR0NMZmt2?=
 =?utf-8?B?c3BuaHF4NDJlY0xHY0s0M0E0OEJpVjVZRjhFc1JUVVZlRElHYVA4Q0NtUHNY?=
 =?utf-8?B?TTdoYUR3RHJNb1NnRkRkd3pZbm54b0JhRUF3aFhtcmNqR045NW15WnpNbVcy?=
 =?utf-8?B?UVVWTlUyZ0NXbjhFVHRndFM0QXQvdWNCR2kzYkI1Q3Bsa3ZFNko1bGV5YTdx?=
 =?utf-8?B?YnU4RE1NTXFMZlE0U1J3TThROUMwRjJDbm1VZnFqUE16M0Y2eVRPd2RkQlNL?=
 =?utf-8?B?aEVVeWl3eHZYcmxkenVpMWVKT0VkTUFMRUl4S0h0cnRwWXFXZnVYWGNvOVR5?=
 =?utf-8?B?MCtPL2p5RCtMMkdMUzFGcmRvWUxQajFFNVBEN055OTdOYzhRZU1yQWE2YnVI?=
 =?utf-8?B?R3hMd3lpRUtJd2VNdW9OSlhDTkViN0RLVEJzYXZOUmpBaHJMaHp5MDN5WVAr?=
 =?utf-8?B?czdET3pxNFV1dlVBQTQzbThpOEdCRXNWNXk0cC9RMWZ6bGxkL1FhRjBvTHU3?=
 =?utf-8?B?bUlIZWswNEtrdTlqTkFydzRoUDNyNk9GZnp0SGN4ajNGN1dsYWJhZmtFOENx?=
 =?utf-8?B?M2pDWGNtOHBabWVQbzVSOGlVOUdBZml0TFg1aFdpQWhwakVTNnF1RFB0SzlR?=
 =?utf-8?B?L0oxbDRjNkdjNHZ0S2R6ZnVCWFhYQ2FWcm5RY2U0STR0VXoxQWxDYUUwY1VP?=
 =?utf-8?B?RUF0aTN2eTZmZmJmbHk1UjQzRlZWVjRXcUoya2QxZkhTWUdXMFU5aEVQUE5K?=
 =?utf-8?B?TG5zYytBY3dPN3VDemtwQ3ZiZG9SNDlsSFBobERMS3VRaTNiU3h5TDVudHg0?=
 =?utf-8?B?Q1NITldpQWh2NVc2MGNjM0NUT2JyV2FMMm1JZURRL1h6R1d2SmpnZjFWRWpD?=
 =?utf-8?B?S3JqdFduWG9rV3h4ZVpscVRSbjVUSWZDTDFBTkpyMmxGOVczTWFOSENOMUtI?=
 =?utf-8?B?UlFqTU94Qm5UTlBtWWVYZWJCcm9ESG9kRk8wZWVFUFhjVCttM2gxWHpSRmE3?=
 =?utf-8?B?cGxHelh3cGJUME1rd0lPbGNPTXJiTGxRK2NmRE8rR00yQlFjNlNkU2ZnSHhY?=
 =?utf-8?B?d1U4Y05ESDZKYW1pamU3TVVsUnEwUEVlQUNlR0xBQ01CZXl3TlZsQ1pTcUVT?=
 =?utf-8?B?SlBSQlp6d0wwM0ZWM3kwTzE5akdkK20zT0JZMC9pUmlaeGU5SERzRDdSQ0Z3?=
 =?utf-8?B?S1VUQTVvNjJnN2lFcHpSRnhFQnFUZUFmdU9QRUZFdUkyNWlCWE5lVm13aEhu?=
 =?utf-8?B?RWZ2cVpKWWVYNUtmTGpUSktsVjdUQkVMMnNpVXl5YzN3MWNINUZqbXFCWHNR?=
 =?utf-8?B?UUQ0MUNiVVdPdE8rM1RFUUhDZDBrMkd3TmthN2llMi9aV0FkS1Q3UXZHa1Fm?=
 =?utf-8?B?YlQrWU5IYktoOVRpcTU2blN5OEE0Ris5dkx0ZnhhT2lFbDNBU3dQSENFTDFs?=
 =?utf-8?B?eUtmQVZPUGNkTzZqWTg0clNQVCs0bWxXazI0RHN1ODRlbkJ5OGI1SzZBMVJo?=
 =?utf-8?B?dzRKZWd6eG5MM08vdTIrMG41S01LY3RZMEFBVnJ5Y0FjTkM0ZkV1TzY1U01I?=
 =?utf-8?B?VlZWTHJ2QklCUnhpOGZEMXlDYlNWek1BWHVZNVpsMFlXRGNRVHhGWGhpOUps?=
 =?utf-8?B?OGtMbldYd0Z3L0pHeDF3TXZNbEpuSFlmVVBDZDcvSVN0UERmNGt5bGRIVVFD?=
 =?utf-8?B?aThqaWRzZVJSTEQ4VjlLTFFNeXlMNEZ1TWtwRHBiSjU0em8rRk92RWljc3hS?=
 =?utf-8?B?bmdjVmh6eGhEekxkM3VveVM3ZkVuZ2xRbkszdC9RdmdwTTVkQ2s3RjBSNnMx?=
 =?utf-8?B?NzljZmpaTW9OcnkraENJOUVFczlUbFB1RFNaRHVYNGxKZ3dGaWxzR3ZhVmtB?=
 =?utf-8?B?d2RvczVjYjJYM0pRVUcwS2xFY0tEUmgrRnd4V1FoQTJoNnV0VU1xZUhVWmpM?=
 =?utf-8?B?TDhTQzdzRkozMkxaTHFHVkphbHE5Tnd2a1lMVEU0cEFWYWhPZ3J2U3lRVEF2?=
 =?utf-8?B?ZkRGN3JQYmFkQkFGS3duTlhnWlFZNk1qVHpVbUpxbk54dE04N2c1K0pnZm1T?=
 =?utf-8?B?SnZjNGdiQkVSakhrTHpYRWh6ZlFqYjF0Zzc0RkFwRmVDOFhtOE9iSk9BTkE5?=
 =?utf-8?B?dXhkKzQxeVJERmlOVHNldi9FNmp3TFZyZEEySUZMSVpObFRkcVVCbnRQVWZN?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec24123-bdea-419f-91e7-08dc386460b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:35.1600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1YXguZzxpfCz4ST7tAgofvbe2oTaDAUgff1Mdz7LGzJWCxRmFC4an/C7iBdktw+hUe76Mkp6GPGR8OrnvDbMR9xb3JYbAoh0gJmXK6FBaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10523
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
Javier Carrasco (8):
      usb: misc: onboard_hub: use device supply names
      usb: misc: onboard_hub: rename to onboard_dev
      drm: ci: arm64.config: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      arm64: defconfig: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      ARM: multi_v7_defconfig: update ONBOARD_USB_HUB to ONBOAD_USB_DEV
      usb: misc: onboard_dev: add support for non-hub devices
      ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500 voice processor
      usb: misc: onboard_hub: add support for XMOS XVF3500

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
 drivers/usb/misc/onboard_usb_dev.c                 | 542 +++++++++++++++++++++
 .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  58 ++-
 ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
 drivers/usb/misc/onboard_usb_hub.c                 |  49 +-
 include/linux/usb/onboard_dev.h                    |  18 +
 include/linux/usb/onboard_hub.h                    |  18 -
 17 files changed, 741 insertions(+), 101 deletions(-)
---
base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
change-id: 20240130-onboard_xvf3500-6c0e78d11a1b

Best regards,
-- 
Javier Carrasco <javier.carrasco@wolfvision.net>

