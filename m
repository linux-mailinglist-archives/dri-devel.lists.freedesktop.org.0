Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73348871574
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B593111284E;
	Tue,  5 Mar 2024 05:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="q8Oa/HHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD9A11284C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCtXQJWQmwEcjnSrYunne2Wf6AA21jdTkElW1RN7P5axjYpf4d8iwxKaVTwWELU4HR2GSyvNzNx4GiUrftBpjliealPSbuWGd7HATYh6dRVhQRVOWZcJkzoqkU7Q9J+qjik9xTmWKvFYDqN6UveGbDmFrBkqCXq/3/G1S5d23SffghEaBGiwsbT4v1s0Sef1drW8HUj1aAXzT6AuYCxhfZj1XKOAQRSOLKv336VDdZILKPLlmts1UDUNsFYgbO7WEQJeuS6FQwNZzk6jU9EykLIEOXIcuEGCah3hSGJnuDtgPHNvbN8dvKM+bhY8eJi805ACWni7ZsxpoCvZ2WReVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN12tFqugSv2E3O9orPc7CXA4cbnkrg4BHOfHuNmWrA=;
 b=cNVU+ynIFTOyNru0rnVGLoSA6BqTB7M9MPhCqx2keAiGf/StSpr6w56/a/rYesQQs6cm+ti2nRZvnhpcqBcK6qWATCkVBnHgrxQAn3Xj5AR0yfuwNPUorh2/WcBOVmzHOp4tp6Kdn5S5bIhU5/g2h+s+90LP0oSz6LXtB/TPRIXGE0oZQLhsXxE/qeZcGRKBAaUZVsAnkxpj6ayS1ETkU7+u7CsSuFW3pr4RYTn8Y+NA9+t/uPp+iuh8+mZ0lK92J3MlGkbYDvv4CxyvVQ3ArnL6f4p5rLccaVxrZVxPKYuj+Fg8d/q0ZYpG1XG820P98MssBrqmktraLzB25V25TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN12tFqugSv2E3O9orPc7CXA4cbnkrg4BHOfHuNmWrA=;
 b=q8Oa/HHPbQFW6yHrmz42Y3HPKC9dyNQGl+xXi/GpFWmLnEA4YpE1tl92f3Iq1dxo4Qt+uFTL90M+HpMx5aTTEsDXr7gUbidrEGiH4ZJFiqlP7VV9PNz7YIFX69Gzb+l4w+C9B3glxkJq8r1T5LVVhU0D86othp0YdFs0QnbtBN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:10 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:09 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: [PATCH v7 0/9] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Date: Tue, 05 Mar 2024 06:55:00 +0100
Message-Id: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALSz5mUC/3XOy2rDMBAF0F8JWldlRo+x3FX/o4SiZyMoVpGDk
 hL871XSRQ12l3dgzr03Nsea48xeDjdWY8tzLlMPw9OB+ZOdPiLPoWcmQChACbxMrtga3q8tSQ3
 AyUMcTEC06Fj/+qox5etDfDv2fMrzudTvR0HD+/V/qyEHrtFpORoF5N3rpXym31HPUzyzO9jkH
 yKAtojsSDLagUIkMmYXUStE7CxRHQkeCQfvdQhqF9FrxGwR3ZGBnAGdgkyRdhFaI+MWoY5YsCm
 JUQ2gYIMsy/ID06WVKccBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=6560;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=GfGokCZZacCv2ZKIn9cS/Nxnj/AlTeRgV2nRaRLsYEQ=;
 b=cFk7HrzulCkPA4z+U6O2qcwTc4zTBjyVtNEFLdY9G/ofgkr9lNH8DFG4C+SSPZ1WBrqlQwIO4
 qWLZn6NSIn6AAmr8ydOSJqyZHqotNSIjO4ujsjBKxK3yQGYP/8D90az
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: a53aca6d-3267-4efe-57d7-08dc3cd8d0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GRYPgEsrRkaRJ9xHuuW33iLmWU+TNJKYFUsua2Nzt6DANWbpebm80bSsEuhxK1VaywHfsqjU7L1fZ+1WTCdL+1YNwI3qFzD0Mx313vD+7q1F5CIJDGu4Xd3qHhMYcYACRPLU+fgCeJr7QlG/xlrdMfkrSCtpMdr6htaIGl1HTsqlz0hUGx6m2x88LaxC1fqMsG4KAIL7HcR6rFuKq4w3W8vBFGyC7GZFay8C1xD5m5Do8EBhnR2yaruHiHwusDiEH6QG1F8yLuKoBLOaza3DGsqaDv+h+Qcu9uMO/UA8oBb2y/2paNUoL+anVQrCdKVJbRJujYPYMWd7uDpJVyw7PsDhenLyiMfCBOmW95dgI0qJDgR4RTmjVbDIz6i9bRxRu0ADEMuFL+bXAoq5KJ1Ejd0SaUmoVeiCAAmK+4jL/PBB65/Z5Fw9mVyJA3Tsgz+G2bAGaAdEQ9KOPgy4i17U4hY+Gusk8ZDlpLH3DO9sIprrkAh/LsEh4GJigg1fUCdSrLDbY7elFatpwHtefsJRp5pCcFbtwCFQYyJQR6JNE0k5Pg/bOb4/2sYzhdAH3ny9wlQhKZzrTvVOkO/tIWm/chgbGjM7OCy7q+lX6AoCGZcWOk8SerhSYuCtSvqQ7Y6guH5D6fcs1HcOC3InUrB189JgmKO8lvWyHb2j+/FSZXtaXQHxSrplWqQIV4yhBST
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk95N1o1T3NWVmhjUnROSHJlYmIwcXR5cW1RZjRkVm83d2RnMk1odkxmZGta?=
 =?utf-8?B?aGJXUGR0OFlWQVZscTVMSmFFcUVFTk1jUUVXVThub2sxQnZ1TVBiVHkrblZW?=
 =?utf-8?B?VzNkWU03bG9oeEdzMEk4TDBJTFpwZlZXQ0hxU3lwT3NBbzNFcDZQRTFvMnQ3?=
 =?utf-8?B?djZhajBBOFY3VXVFOEcwVjNQR1crRkdnUjNMRWMxTDNYa0tOSjRYU3NBV2Ft?=
 =?utf-8?B?WEZ3NVVPU3dYZHlvUVlNUW5EYzRCSnU0cTlod212MVFQaENYVXFyOEY2a0g1?=
 =?utf-8?B?eS9kVHAzTEFYMDNtUFNFZTZOaUpMU2JRSVNJL2RCVEVxaE9Ha05HUngrNzNS?=
 =?utf-8?B?N3JmQXIrMm1zZ0Yxb2pyTi94L0E2L2QwcnVBa2FJcEFrdUNXM05VVFZzY3hH?=
 =?utf-8?B?RmtNQzNWM0JSZVFpeE5FcElpSC9PY3NGOHZraG5PMlUyZnFxS2JaQjZXaFVa?=
 =?utf-8?B?Qm0xNFVTbDBpaWdIUVpmeldRTTFLZlZsZk1WV3N4VU51RkVPZGt1QXEwVTM3?=
 =?utf-8?B?QWJ1OFNrSytyMms1Ym1ZUHkwTUNWVytCNTRwSkFRVGhCbDJFalphUHhYYlZi?=
 =?utf-8?B?RTd5UG40aTBhcnZnRVU0cE4yQ2h5bHlZMFZ4VFlVa2VrNjQzL1JlVzFjTlN1?=
 =?utf-8?B?NW1QdWVLbWxQanVhY2pRbXYzZlM0RkFXTThzYjk5Z0pqd0ZycEZmTnJBei9S?=
 =?utf-8?B?cDRvWjdUUm9nS3puOW9WK1ZTZ25rdFo4V3NjS3RUbGpqTG5qR0JwNnhuQ0Fv?=
 =?utf-8?B?dTJwVnpZeVgvRnFlYXR2Z25MalV1RXlieXFIWSthbkMweWJEdHpIcGZrZUNv?=
 =?utf-8?B?Q0dFb0h6UzR2UkR1K1VoRjFBbEZEWS82LysxVUVlcitoc2hBQS9IQ2toa0Z6?=
 =?utf-8?B?RFRkdjlUZkdqNFRhNW80K2pqY0l6UUJHMDBQWStCOElIS25udVFjdklJWlVi?=
 =?utf-8?B?M09nMm1QakgwLzc0cmJkV3pMcmRBRjR0Qi80dUFLSzlSNk1mbEs0Q0hYQnpF?=
 =?utf-8?B?VDRGT2NsNitoSGFMVWZMQkFrTERqSmxxdjVpTlQzczNqTnlYNHI1L28wajVn?=
 =?utf-8?B?N1NDVUVjRklpdlI3cS9tWHIvRzVzVXFjQWlQUEpqTFVJemRmTEg1bWdxOEox?=
 =?utf-8?B?NTZhUnZlNzFueGliNzFrNGlzZ1FaaUJNZ0QwQ08xRzNmVWRQdW12bEdTdElS?=
 =?utf-8?B?UnRMUHc1bE9LQU8vM2g2UkR1YnlXcjBhNXFxczNTYWdwWlZVTm1mSXNIWkNp?=
 =?utf-8?B?N0VUWkt5TUFoakdqMzBXU21VRHZvenZVcVpKZDZnNDV2V3ZldUpjMVJadHlZ?=
 =?utf-8?B?eWlzVmJ4OTg2dmZpc0N6cDZ2MHlBMXVvcGcwVHJsK0ExNkZFbmQ0empJK3BR?=
 =?utf-8?B?V0NwUFlhQ1RCOVZwV1l2cGRodlZ3eWIxL2VDMFlRUWRCT2c0eDhmYXQvc0pH?=
 =?utf-8?B?NWhqR1hWaFNac053d0lkSjRFOE9ybXJDdWpURnp1WkJiZnQ3WU45QU43ZnFO?=
 =?utf-8?B?OHNBWHFwdDJZQWlGbW5oUFdRaFJNdk5UVm1KOGxYeEt0ZHBPT1ZGVGNpcC9B?=
 =?utf-8?B?UUhxdThORjdJUi84ZUVCSkdmNlJoMU1OM1R1SVZySmtuK3VVN2lhcjBIV1I0?=
 =?utf-8?B?R1ZldWpXL0hFOEM1R1BDV3NnaW1rcWhoa1FWQThLSDFpakpXUUpwalhBQURC?=
 =?utf-8?B?QnVZVTMxZlNXKzV3LzJBdVFEbWdNNWtOMjJqUkJDa01PaEc0RXBUQXZuYlk4?=
 =?utf-8?B?dm9OZnVhUUo0MmRMMHNyS1hVTXdwWGtpREdnWTF6SFh1RlA0YVBOVjkrMkF2?=
 =?utf-8?B?MnEzaWdzRmU4Umx3SC8wOVZUTXdNdDkxbDRxeU1aOVNSRE9UUEwrekFweUUw?=
 =?utf-8?B?WlEzeWp3d0RZZ3F2T0llUkhKUXdRU0tQTmF4dUtqa0wyUC9sazNxYWFUWlFH?=
 =?utf-8?B?aExXQ1VVOXJDYlRla2Jwem1EYUNqc1ZySFoxblVEZG84MDUxS3ZvTDNUQjVj?=
 =?utf-8?B?bmpQZGhvV2JGWGJ1NEMrR3hseGVtTTQwRHJMdnRSazlFNkg3VjhVZWsvakM0?=
 =?utf-8?B?UFZaRHU3N3lxdmNzQ0h3bWk0NGFON1RBZDFBNnRUdTEvenlyQWEvS0Z5RmNR?=
 =?utf-8?B?eHhUV2V1Q1pVS1RoZnk4WXEzWlMxMFRWa25Na0ROOW9hM2xZcWVqcWFPMU5D?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a53aca6d-3267-4efe-57d7-08dc3cd8d0ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:09.7335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SW8HX3J5ZgVrArA/hrOkWEi+7/fPg3rpBQPHJ+RxFw5+SZ7qMPrDGF/rLv9woVKA6miFhnqczN3yHvkdb3OH1RkClMDNce3uuIYG1FK8tFg=
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

Changes in v7:
- onboard_usb_dev.c: drop comment for is_hub field.
- Link to v6: https://lore.kernel.org/r/20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net

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

