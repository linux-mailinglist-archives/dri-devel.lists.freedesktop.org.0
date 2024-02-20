Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7485D230
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964DA10E64F;
	Wed, 21 Feb 2024 08:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="NegOLWrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57A810E423
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5dvelJm+onA4YC9jioq4vcHhtXKM/iCTzWOOrt4wZOolMHg9mRPuDSB4iua5Ymc/tSKI+SYvlTYA3Yc5IBqsgqegWM8pryCT3v/TduYtRpgI6lnqXGYeCB6uY4pG/NxUnynHLEh2XMejHYOlH0POOhjuThEJOP9BaYaQ3HNrCFiJdh9VoYbeMFgxnyz1ZKKrdO20WpQEr71/GxjzOB6cQJ+7PORjIM1b0dsiBDJXRuWT48CunyeBpMsj7rGa5jdmwDKBkrcPc5SVYZfTW/Odoqpkt5oj6cvHqb+XcEjeufWBOj9LipMYiA5NZF63kiOWzz2A+CVCSq5wfwAjBw3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYJSVyaPlm3RaF4FtzmWKDx+gw6kedbjArMLrsS47us=;
 b=XVQXwe44Zs2z+p7X/2stzo1APQJdSeHw0ISjpo9t93OoJmeHmRZJZ11pnN7JbEJRlLjqyHaLO/GdIq6u9OMt2lmBqblfEeYE4pXLf3S+LHit1lzt3kYWpXymz14R5fOw+hBNYy7g/Im6ZAwb3XF536k6YO2pzWU+LJmfvPIohFmIkPiGey3vn4a9QAI29leWO6pttFS0ZzjqRLwlfngj31P2JqhCH5siW7sG87W4/3hLdnhEouX0Sz+r3hnSfkiNjOQ0OdB+vIZvJ40kZKlB9T/ib3jFpEipCJHYCnYwzF8IiQ/JlSe1e1qdGvpJZ4OgM3naD89QV2seKS2dSnSlgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYJSVyaPlm3RaF4FtzmWKDx+gw6kedbjArMLrsS47us=;
 b=NegOLWrJq9sxpjM4SIJ1GR3rFJeKob842ffsbS5CrIsypIBtEf2quKU/a2AQPoeOq+lZaQpqevjhkOws35UndobVIQ2oOisMNoeD3L/FMHfO7FpXyNBbH1L5MZdx/PVF+3+r1wcRLfstOu6gvqBn32yt1+ef993/54x6w11MoYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:51 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:51 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: [PATCH v4 0/8] usb: misc: onboard_hub: add support for XMOS
 XVF3500
Date: Tue, 20 Feb 2024 15:05:44 +0100
Message-Id: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALix1GUC/3XOSwrCMBCA4auUrI3MNA+jK+8hIk2b2IAkkpRYK
 b27aV24KC7/gflmJpJMdCaRUzWRaLJLLvgSfFeRtm/83VDXlSY11ByQAQ1ehyZ2tzFbJgCobME
 cVIfYoCZl6xmNdeMqXq6le5eGEN/rgYzL9L+VkQIVqAU7Kg6y1edXeNjvU3tvBrKAmf2QGuQWY
 QWxSmjgiFIqtUHmef4AGYD/1fgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=5500;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=SHAnYTUFqtrCCn8stJuXEo4JZhrqJsAVYLtm+BK7Iq4=;
 b=lO2JOkdHW8GGrVf8D9Ux1reOo4O8GZFsrpoqdGXyYdfTPB0YBYJGulQ+1suUekXs6tv+AceEz
 Wz9vzDQqppPC8EdSj5MsryX7tGUrWBCKKljsXuC2ORfyiiOqFAxfruX
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c85b2b0-7a9a-4bd1-dc0a-08dc321d0b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeSoSiAyzy29OoAKYNBxN+Ec2PNhZhDGzSs3PuruHt2/c+/j+UrPgKT/+2lZrYSnwihjSPEnx3LzXspl7eB/iep5qJb+0QGudca7F+qBJY2HV1qpqctDDM2KGLhKyFrcVj0REKA0i4Qm2gM2kKtWK00qbwE2Gc6BhxXVih1wg7DsVs6485aiKlS9RNfE06JI3VgjLDjDSM5iPGXdqwqii8Tp+fMGFWKJ7O6faMhgH/eUGg6i/2gZNzh33uBDpp355BJKRBwVtue6khDEcx32g9Segds/nyBVhEQmUCSH2mExf7188nwOA2u5owGxEjnK42k1tnZUKwFlVeCSK1oxmMvKvc2dsYwd0F8ia0UPeOJsl2uPhpuzwVDgbcNyZlTlG2UHRyXRrjhkGwmIyy1Tc0NYo8oJuh8TeEsorKOG3RWF+CzBdMRId7OiNVYReCzJ+9o/WK5lFl0MeiQb/rw1fTpiCgQp3Y3AuHc/aJr5YSOKfVG4T0oCeJBc2UYfQz4cK0p3u4ppL/i0b2u/eQ+Gtz5dB8gIljszCC5+07FTOXJQ9w3yVCuJcWahYtgAMhHyagb8z83yPLVSQPpLKrjI7uirbgzEPe9Hd6EH7+UJ55J1AgQVN14aASbj3EhPIz9E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9Wd3ZaVEQ2RlMxODNHcFJEWml5UWxJTFNmSVR1dnc5blY0YnNOZ0w4eFo1?=
 =?utf-8?B?S25Ea0NHODZpTmQxVGF1clp0eVViMDEwTHREcG0zaStkdzFRZkpvUG9sdjJP?=
 =?utf-8?B?cEZ0a0FVcGcrdUZGbHByRGtzKzFkQ3U2MzFwTEdKU09Xc2dZZU5PNzdRaVgx?=
 =?utf-8?B?bEJsWW1JTlhhSjBnSDRVOE54T1VjK0JqMENZdE1tSmhQaUlsZE1vc0ZkUGYw?=
 =?utf-8?B?MEMvM3FuQ0NTeWpUb0VXNU9yL0FFOUJ2RVlETXpGNTBxS0dyRXIvVVI1Y0Vu?=
 =?utf-8?B?NUc1cEJrYm05SVlUVzZtVnpuZk9hYzVaQlRyKytOLzROVTJvaDZMSUZrRWtF?=
 =?utf-8?B?ci92MkJlejBoaG8rYWswWlk1K3ZuakVJcUorRmMwVmFVYW1jYkhRNFM3UUhP?=
 =?utf-8?B?Z3RQNGZwYXZSRUIvdDJ3ZHg5RWZTZ2VXL0RWV2tOdTl3emlzamRkSTllMlY2?=
 =?utf-8?B?dnB0bFVLMzRnNVdSZDZROGZtYjkvaXR2cWVtMFFVd1ZsRW8xOCtLa0VkNzB4?=
 =?utf-8?B?MkQ4RWlPdXN0emFlMzJQZ2gwekc0RDVhRFVSaUpoU2h6RUhHTWlJMGxuMjlu?=
 =?utf-8?B?azA0RmNYRFZGZGhlT3dsVlFmaUEySXRYdEhMbS83Mm03NXBydnVJUFd5Q3ln?=
 =?utf-8?B?Zm1hMjlteFRTUXNmeTltRTdJZjNvRXdhSTBMYzJua2V3eHpjMEpCQjJlU0ZY?=
 =?utf-8?B?S05zRHFhTVJPMDVZdGtOSkhEbCtVSHdtZTl5NTlFWVNiRzNpSXF4Uk9neHZV?=
 =?utf-8?B?bWJSWXU4OXVjaGZIYnhKMUVQOWYweDQ4UlVqMHNObGpiUnpWdEVyRUN2OXZG?=
 =?utf-8?B?dGIzRkYremkrR0ZuQ1pBVXhzRUtpRDFZeDdWSWFBRUdqSEpNbzZrV0x6aGhK?=
 =?utf-8?B?bHUxS010L0ZVZEsxVEhPZEd6WFoxVVpLL1pwNXNnL1lmUmRCejIyK3M0cVI2?=
 =?utf-8?B?NXg2K3IxWmQzNkZET0ZGNy9zdlp5Tlh4VnpHbkYvZlpXalhhR2ZYU05oWVY0?=
 =?utf-8?B?OHQ5NE9CejJWTk4xTkcvTHNnUUtmeHVlMXZOZU92SDlUbkEzSUZzUWhXc1ZY?=
 =?utf-8?B?T2JQQVJFQlZqdis0cThjRjZremM5Wkw5MVRRaXNubmVoMUpUblFBVlI3YWdS?=
 =?utf-8?B?MXUvUU1OR2EybWR1MzNVNHBJZGpHYkR5UTNLMG10azJGOFRxb05iMWo4Yzg5?=
 =?utf-8?B?NVpqV2NKaUFnU1hOOFRkbU1vQjB3b3pib015N3ZTankxY1AxKy9EQkhlMTR0?=
 =?utf-8?B?UEtlOGZzTy9TZkk3T3JaUHZqRjhuRjQzVU1abTF1OFRYSjZUQkNYSVMrZkZT?=
 =?utf-8?B?QUxreUdraE4xdEF6blhKdVNTaTdYcUQ4MVBDbm55aDJxT3libHYwR1c5WkJT?=
 =?utf-8?B?VE5zeEVuT2hweCsvbkJwNC8wUjNWRnJpQlliakhtZ3NYZm9XbVNVQ2hyMExK?=
 =?utf-8?B?L0R3YUoxYU5CTndybnd2azJ1aENIN2ZsZUtEYU1NSDVIK0FZNlZyVjY3TVVU?=
 =?utf-8?B?VWsrMFpUbUluaVFmWmVzMnVFeGZsTmFyOW5MblpZSTVyRmZ2WW1nQjFsblhW?=
 =?utf-8?B?Z3VPYXdnNjBUdGl6ZHM1RFFCcnNIcllEK2NKaUp5L0p2bmdRbG1XN01MODQx?=
 =?utf-8?B?M0kvOVlHTWRNTmMvaFE1M1hTUjhSOXJJZ2xTdFdjNXlYY3g1eXNEOHJFZW85?=
 =?utf-8?B?ODBaWUFNSmZpVFVSN2RBQlorWDRSQThwd2lDWWhvNjJoNEJzMUd5SW9lbzEy?=
 =?utf-8?B?dEUrQTdlRVNES2lRVElSclp4NDlOd0Q0QkJDSEpaZnlDVlg1M0kza3JjbjBm?=
 =?utf-8?B?RFZ6L0NxdWhMQUFWcUowTEVtRUJNUVVpdjNIRlRFVmpVU21OYllNalByeExE?=
 =?utf-8?B?UzhPd0xlaElmRmRJeEJsNXJSVnFhUXFNY3JBeG54ajhYNk1HYWJnTmxpTk5I?=
 =?utf-8?B?VUh1T2V1d1JMdU85WjFENS8xZGs0RHBLbm5iVy9iUElka1JOVFF3SU5yWmh5?=
 =?utf-8?B?NXdaR3M3aCtialc2RDFtb1h0T3N6cWdmaitQZm1iUW81TERUNDdPR2VIdWdy?=
 =?utf-8?B?S2RIZ3YzeTc2bzVYOFB0Q2pXQmlPK3VmZG8xbmhVdDVWRm9UUnhrV0FwSG9F?=
 =?utf-8?B?c3Z3WUYzRnNRWlFNUUs2NVJEeHZiT29YOVhzMGdUREJWODFaRFgzbytCZmtu?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c85b2b0-7a9a-4bd1-dc0a-08dc321d0b74
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:50.8779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2/8WlNgNJSyRoP3nP0nlYyQPIWZqteXlf+oVpI2jVFMkvCxi6qIHNWR3CjMmpOjKhKtNnqAuZ4yT52uT8GVbRMnhiIUbi7ItIOC5/0Ptww=
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
hubs and provide their specific functionality. Support for
device-specific power suply names has been added, keeping generic names
for backwards compatibility and as a fallback mechanism.

The references to onboard_usb_hub in the core and config files have been
updated as well.

The diff is way much bulkier than the actual code addition because of the
file renaming, so in order to ease reviews and catch hub-specific code
that might still affect non-hub devices, the complete renaming was moved
to a single commit.

The device binding has been added to sound/ because it is the subsystem
that covers its functionality (voice processing) during normal
operation. If it should reside under usb/ instead, it will be moved as
required.

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
      usb: misc: onboard_hub: rename to onboard_dev
      usb: misc: onboard_dev: add support for non-hub devices
      drm: ci: arm64.config: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      arm64: defconfig: update ONBOARD_USB_HUB to ONBOARD_USB_DEV
      ARM: multi_v7_defconfig: update ONBOARD_USB_HUB name
      usb: misc: onboard_dev: use device supply names
      ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500 voice processor
      usb: misc: onboard_hub: add support for XMOS XVF3500

 ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   4 +-
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
 drivers/usb/misc/onboard_usb_dev.c                 | 525 +++++++++++++++++++++
 .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  69 ++-
 ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
 drivers/usb/misc/onboard_usb_hub.c                 | 501 --------------------
 include/linux/usb/onboard_dev.h                    |  18 +
 include/linux/usb/onboard_hub.h                    |  18 -
 17 files changed, 709 insertions(+), 580 deletions(-)
---
base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
change-id: 20240130-onboard_xvf3500-6c0e78d11a1b

Best regards,
-- 
Javier Carrasco <javier.carrasco@wolfvision.net>

