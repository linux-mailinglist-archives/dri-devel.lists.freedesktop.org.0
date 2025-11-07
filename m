Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58505C3FC94
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595A110EAA4;
	Fri,  7 Nov 2025 11:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="YnxS/noP";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="YnxS/noP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023079.outbound.protection.outlook.com [52.101.72.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6910EA9F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:51 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RRU3EEYJeV7QvoCPsshDyEH3aA+7vXwKTRQ8nooJ0g23GuSy43r+H9PRC0xdiBXBNnoJ5Sddb2gMnxUuSGHsWnSRFOwT4ibv307tV2tv8/g7s8P5+QnWQYKv+cWScv7HPH10VTMuUW1JPxp2aAzNRkXHMUr5gSa1r9wzh9LquSSDt0Zqx60DoMVuc1lcVrp4xwIA07LgnXYJa6NDnDjsH4c8/mis8UkCMCh9971UG3aCqQf0zAr2YDLAecY6br4BxrQ5V7gs4OLZQ7P8PPOBAbUqIVEabDkEzMlMcUhYohyH1uDLb/g3GuL6giOIWKvTB5jLOrxhxU8Fs59aOxTrug==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0hcDJNxZitgwtgDqeEApEj8tI26USWBPAui/fFOz8A=;
 b=QXOwcH0e56/1OE7wgPDQtA6O0J0cwfMRRd4vJz8za0l5TJXMbhVdefyg2cnhjjfwZQgfuKVRt/n0hml3WgUlcNeNCLkk2tiKi/w+Wbqa1zmkR5UopRyWzqnfDFemR/fefwlZkQjL/5W/0rRf8aASDglmj+k1DPRvYAugbcUnmveIooV9tgTLvxx1Mf0N4lnySBCi85T/72YqyEfauY5+GFSSS6awOTubNLGcLrF93Q0sqiBCydFdeMlBnIj0htuFsGLZSlsFrL5iDCEfVLcMQtr8WoXnvE/qUUDVbtJIbc/D6bvO4aQMxfsAyoiLS+Tb2Q77U3uzByvGilm3D3uuuw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0hcDJNxZitgwtgDqeEApEj8tI26USWBPAui/fFOz8A=;
 b=YnxS/noP6t3gDkrtv7te6fhhBLhCBy1tCH+uN5YDnlDV2Xz7NSROFw1mt8rQ6PZib9140BP4zifoNSf3FOJjioW25EwHyiM9N2NfW0Fny9yaq4wIvlMjlWjCOxPTtuuwdgKbHVtjshRpXrs6BG0W7Pnf6lVuwEyjPQoGhkOLxcI=
Received: from AS4P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::20)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:48 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::ae) by AS4P190CA0030.outlook.office365.com
 (2603:10a6:20b:5d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:47 +0000
Received: from emails-5026392-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-176.eu-west-1.compute.internal [10.20.6.176])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id A7AED7FF02; Fri,  7 Nov 2025 11:46:47 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516007; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=C0hcDJNxZitgwtgDqeEApEj8tI26USWBPAui/fFOz8A=;
 b=iCo0cWGT2nNdRA2dSQEZSiRgV0Luou4+M14FeBC6VBJlfkaKUqkABkx428xE0DA2MIgDY
 Slqr8Tae2TwYs70Yupw4BDVRiscTG/YuflB3688WpW6SxwRDTIh4lIYxDjyJWluCRYoXNNV
 pPVYeUlIuZMu8N19Gs587ybJMMWyk9Q=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516007;
 b=JgwzdpjoztvYlw4hfUwFNbfzHVirixsSClwhb0BVf98+YtBfiITDdruI2zrgCfKDOjq7x
 I+6kcLDXyiTsXO7aFhA45DLTHYLz59C94R3lNCEDcewFHzDEIkF+pvBJOGZEle9i5kMOW55
 Hkpn67SXDgfxqwW9soqzsuYX3LDQXw0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7kznX4RqluD2ZJ6R25FXOhLFvbIgZ4WjvKXoUpC2uqynDCv7nScMDrNNjn90duKzWcp3r9p5LHmRTLpwPBFln+cukvXURX0T2nZREshf7+0qfD+ISb2gwlhgOBCxv0jYDHewGnuxFNEqR4eB5lpzQYcqfdYr7BG7y1OFAp6ELen66oSP2qqXXtWfMOVe1lj4ac79hBoO/BUH3C9KT3h4+JOBRfa4SVwtYLo4/t3gQeibIuzHVyHq7257ALKRELQKzWMrDSsBx+XftX1n3oBs+i+Q3uxLFK0wI1Lpq3YYj6U1GjwvJ8WoOZtJLCEiZRimYbuRw2pzbu/06UZJPCDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0hcDJNxZitgwtgDqeEApEj8tI26USWBPAui/fFOz8A=;
 b=lTOZCyrXEELkNtderAcLYDjM1hPCRMBHPBx0qfDdGf3HkAmVW/07xgQJZA4ogSgUDyWVT5Sn67V8cgov3mmBeNbggQnItqUnS9msOlJ6X1nRATwjYMrBGS6DvRKz5Eq0uAXay97ZUgxoTuTDCGoSsZRIh0a+AA3jHUw3VPQ6WAvZJi3Skr3UUBMbO9bcPvsT5g9gL9iLLfLVDZtYSEvfcdw6W0ukYWjwIFGrO3/u8+jjBrZToVVh+RC56lTqZddMvKHja6JIH3FmFEzSceoQHew92ePXVjYpsUe9vC5IJ9UDZ7Eo82VYc0oKc0HmLZ2SJeImWAPfTjYk8LZmcRp4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0hcDJNxZitgwtgDqeEApEj8tI26USWBPAui/fFOz8A=;
 b=YnxS/noP6t3gDkrtv7te6fhhBLhCBy1tCH+uN5YDnlDV2Xz7NSROFw1mt8rQ6PZib9140BP4zifoNSf3FOJjioW25EwHyiM9N2NfW0Fny9yaq4wIvlMjlWjCOxPTtuuwdgKbHVtjshRpXrs6BG0W7Pnf6lVuwEyjPQoGhkOLxcI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:38 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:38 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:16 +0100
Subject: [PATCH v2 09/11] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-9-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AM1PEPF000252DF:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 5759095e-4ea7-4bba-217b-08de1df35564
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dk9UUVBKbFY0WUNRQ21uaVR1OSsyK1hNdlhlVkJxVjB2Nkh0SWlUVFJXTnhO?=
 =?utf-8?B?cUY1cTdiREgxMHl5ODhHQnY0M2ZwVytHZk1ySW9KSXAyZXNOTFRxZ3pSaEd5?=
 =?utf-8?B?T0hINTBOTXA2NnRhQ0N6T0hPc0crSFVjRUJEVmJnZ3d0RkZ2OHNGTk5lWUMr?=
 =?utf-8?B?M3BOY3dDTHZnTjZwVkMzdjU5Qmh6R05lSDJoYWtqNzEvYTFLLzh3SlNIV2tR?=
 =?utf-8?B?VDFBU0ZSVHUzVU4vS1ZWcUxkeTk3WWpWeWdSYWN0eHRDM1BrWE1lekpqelJB?=
 =?utf-8?B?V0FUVDlTREw1bnB5WWZYTkVPUXBYZUtFSkVaaFNhem9qVHFXdnpRbkN2MVln?=
 =?utf-8?B?VHJFNndWbFE0RktkQkNzbGZqQVN5N1BTMWNORDcwR0dFOFh1aUpsbUltVm8z?=
 =?utf-8?B?SFdyeldPM0V6QWtGN2pxbEU3YURqcnRkNWxWdkpyMzg3ME9FUEpWTytxdUdt?=
 =?utf-8?B?TXRCS0x4cVNMZm51RnVMQnZyclR5YnVXL01FenNHUVRTL2lNVCs1NksvZThB?=
 =?utf-8?B?cE9uRHkrVzlqd2NGRDdhWDRCS2NxNVd5MzJ5UDNxVlVGMm1hVVlmaVZ1UXph?=
 =?utf-8?B?ajlFeHpZVi9xNTI5eW96ODZIZHZDeEthQ2UzSXBJdUhSVVl3OGFyNkFydEE3?=
 =?utf-8?B?SUN1NlJaMDQzMXdjVkllVEVZZzRzNDFXa3E5ekRaaTRQOWFuTytVbHZzTG45?=
 =?utf-8?B?L1hkb0VwVS8rdmEyV01Bd01ycGdxcVpjZUVqKzM1allhYkV4emUxeCtaUnpQ?=
 =?utf-8?B?alk4QmpTZGd5ZmJXS1AzL2R6SThVd3g0eWxmZ3hUUUI0SDFZWUF1d1o0Q3hr?=
 =?utf-8?B?MjhibGwyNS8wclF5dHZrR1NQNDRqTG1jRWNpaUpaeXdxVFFobGRmNGFLOHpI?=
 =?utf-8?B?TjhwTW5XMTc0elFNK3NHZGU0ZVpmMHlsSDNsWFJWUFJUZm5LblpLcmNzUXRa?=
 =?utf-8?B?UERrc3JMQTRxLzA2WTBLMFFTcEtaSFkyUGJBMzNrTzVZYTl0YjFwSmxSaEVR?=
 =?utf-8?B?clcvWlRvL0ZtUlpDL0I4eW1vSDBwa3F6Tm83ZXFZMTNKTFg1Ulkwbm9WcjFJ?=
 =?utf-8?B?bHNsY3lpU0k1K0IvMXRoTHZnQ1lYZHhhWmR2blZuSVcrc1hKL3F2ZjZFdzVP?=
 =?utf-8?B?N2FwNkdoZGdGMUppVWVIRVJ5QTlsZ2hDNUowTktzUzBaMGZQa3JSYTh3VWpv?=
 =?utf-8?B?V2Y1LzF1aHNWaGd0RnVveHRFRUdvTTRSSU9reENNbkl0NVF4VGp5U2IzUW5i?=
 =?utf-8?B?WkZrSTB0WGR2RHo1YjN3Unp5dVlUcitVc25zUFJBOTlKSVBkUDhBYmNkYlJS?=
 =?utf-8?B?OGRPQkhuZDcySk1jVmNSUDJUdEptTFdxUHFBSUVFN0djSWgrK0EzdFBnblc2?=
 =?utf-8?B?bm1uc1JNdzlSaVo5Y0RyZG1BWnRjTzloSEhIY0thMTNWMFVuUUJpbTVLY0RK?=
 =?utf-8?B?N3VST0FYekNqeWpFbFVTektpYTJ5clhIcXEwVTh3Qk1hSGNxRGlveFBDNXlI?=
 =?utf-8?B?aFFyZm9LS2l5MzhEQi9FdkllejUzcGl0cXJSck5URzNPZmxETzVENHJtZ2FL?=
 =?utf-8?B?dEU3VnIyMXA3K3hMVVdFZVgxbGlSLzRVMmFDa0V5WExtRzdJUUZWOFlyenlk?=
 =?utf-8?B?ay9QbzZHZTc5UjVwMXNneHdzVC85YjFhK2JET3NEZGtYRDNSa1h4Y1ZKZll5?=
 =?utf-8?B?RmQ1K3pFS1pQaStPVFA3TThqWWhnUzV4OUxtejVDSFA0MXRJei9NNmlBSnVU?=
 =?utf-8?B?RldYdDM5TjBpN054TG5SVko3dDF5WTdQZWozcFY3aTRTcjNZbFVLUWdtMU82?=
 =?utf-8?B?ODRJV2Z2TkVFaFdyMi84WVVaV3lkdEVHdlBPU2RuNTFzWUdSekJkNzRXT2h1?=
 =?utf-8?B?WUlGL0xDcDV4cDRxWCs3S2JZSGZ6UDIvaXZseEFVcXphOUc2MjBidTlZOEFm?=
 =?utf-8?B?V1dyVEt2cStWSHExRW5uUFl5OXY2RnBTUmZVM0RVVjY5KzhJN2pzM0lEWjVr?=
 =?utf-8?B?SFc5ai9XSW5YM2FZanhzdkpSZnFNWjhkem4xOHdLV2YrUzU1MHZvRmwvc05H?=
 =?utf-8?B?bWtZN1RRSlRneVJSRm1DZHR3cFl3VjRibzEwUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7924aa2a9d414a47af408fac34ee8209:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ba886a2-0421-40de-dfea-08de1df34fa0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|14060799003|7416014|376014|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3k1Mzh3MHdFVkppcDUvQWVrU213VDd5VklOSFNtQ2hiMkRWOG5xUXN4UDFH?=
 =?utf-8?B?aEZONlRhbkNuVHkvbXl3MDNmL1NGOTJhczFUMzlrYisrbU03WXhYOWtFQjdj?=
 =?utf-8?B?NHd3SlJxSVdGT3p6NEcwaVNYenhLR2NDR3IrRldnZ3VsL3NKdjlEczV1aGpY?=
 =?utf-8?B?MlVUOThVQVZyNmg3UCtKdmdndzd4VUlOd0NCcHVXK1ZsamVENHJrc21SSkk3?=
 =?utf-8?B?dnNTazQraGd0MDIxZnVwNjRZQmoxTWVUT3RVdEc0U2xZMHVDblA0OTNhSklr?=
 =?utf-8?B?TUV4NXpmQUlKNVZ5NThtLy9HZFY0UUdxcVdWVDZ3WXlpK3FyQTJPZGZabTF5?=
 =?utf-8?B?THNtRTlRTXVMaG9UNjdBVm1sL3pwMzJCKzAzOWVSRmp3SGNKaHVmalpBVWhW?=
 =?utf-8?B?ZXhRSHVSTlpNUkt2VEs1U1FuK0YrdW1DbHFaeDQ3QjNZd1ZiQlRqQ21Pbzds?=
 =?utf-8?B?RHJJODJLZnJabUhnUTlEMEFyQ3VnU3oxMmVqdm9oa0JqMklxa2hLbHVaTGJG?=
 =?utf-8?B?YjRabjQwYkNDQ1YzK0RoZUI5TWduQms5SWQvWmlMdXJzRTB0aHltZWVPRXAz?=
 =?utf-8?B?ZU9kRXBaYXVxYllMbmlTK0RQajZqRC82SDdDdElXOW1zNkhwRlpabzB0akl6?=
 =?utf-8?B?dnptQ0JXS1EzU1YvRSttU0lkd3R2S3I2eE9XVGRIUzdJc3NiYUNoOWVLZU1m?=
 =?utf-8?B?c3JtdFo1d283cUNNcmtFK1B1YTJWN0d2ckt4aUZpNEdZMVg2eUF5U1pQNUM0?=
 =?utf-8?B?d0FHd2hleVgvNHBjYkJGbzZkL1hjZlFzZjRkUHZoQWY5ZFI5dUgwOTlBanNl?=
 =?utf-8?B?YzZ3b05KdjAzRTBQYTNMdWVRWjNoSndMM25xcGNVS05BOEtwYjBkVVNLZDFi?=
 =?utf-8?B?L1VqdjF6Nkp5TDhwSGFUZ3VUTGNDOG5OQ0UzN2FTOFk0VGFaSXFUNVVBNXhh?=
 =?utf-8?B?V2VTeFcvc1dKK1QyRlB0Mi8vSkV5MFdkL1RTT2hNSFVHZFlLUzE1cjZkTURr?=
 =?utf-8?B?OG1vNy9oME5LZW9zNkxxVkRFQWMzNm5KSGtINk5hZ09ua2xrdUQ3OVUrWUU3?=
 =?utf-8?B?eVJidTBBR1p6Z211M3grNUFWUzNvVlp6TTlUM2lMYXZrM2w1SDRpeFlJNk9H?=
 =?utf-8?B?c1RoMWhFbzIrd3NGQ3pmRzFGclRPYSttejg0VzFaOE1HdzBYNis4TG4vODRC?=
 =?utf-8?B?ZnhrOUIydGxweXQzZFVJK280TGcrZzZvTExibVgwTS9zRCtZMW4rbEVINWRQ?=
 =?utf-8?B?RWdjRnYwdUJrc2xob1FtQ1hneXpUZmQ1dS90MGh3QitiZTU4L1F6ZnM4cEZn?=
 =?utf-8?B?YnJUcmg0KzMvb1dtUVI1bHkrZXBqWE1DMVNVQVVmREViNU1pUjRKKzZTWW11?=
 =?utf-8?B?bmorUjRvbUFUUWxYSmF2Nmk1R3cxYXg0R3daMnorakV0QmlVSTdDd0lWajM5?=
 =?utf-8?B?R3dNL2NSVWFwQUttNThPRThwZ1dzRFZ3SEI0SVZ0aytLbHVWZ2t0TzF3bWYz?=
 =?utf-8?B?UURCTTFzVmhVeUxvOG5UNVZKMmsxYlUxVUg5a3VFSVhVWUNKMlJxSjdxR2tI?=
 =?utf-8?B?ekxsRUtGcThYWGQ1bHVFYzFCQ0s1anZiNDBEZXJiVVppMFRSNVJ6cVNSbWFX?=
 =?utf-8?B?SFpSdXgrTWpKaXNTakxYMXFmd2kvanltbVlHeWs3Rm5vWVJpWE5yNndwUGlS?=
 =?utf-8?B?cW1Gc1o2M0pDbEY3OVpMYUFhNllxVVM2QkhhdHczd3hnZ2pQbUlUa1d3NXVD?=
 =?utf-8?B?UTcxSG55cEpHUGZwVU1NbWNNZjZoNHhTZnltVC9kcHRGRmlPeGFXSTBaRHN1?=
 =?utf-8?B?QjZZaWovNmQvQWl4SHlUMndGc1JEMmtvQ0JEOGRMVWZIZFhLTUp2b09hMmpQ?=
 =?utf-8?B?V1lUWEpFNHg0NFZDeVJpK1duSDFRdXJtNWQ5bUMvNi9tT293RGVKZWwyeGVh?=
 =?utf-8?B?TDdYYzVtcHNoVDJZVnJRdzd1RllCK3VteU04WTFXbGhWMWhNQlRGbXVUSysv?=
 =?utf-8?B?elF6K1dJTk1JZHpldzBPTHdlRDN3TVJBS1VOaldFRXV1RmJpb2dHZXF2clBi?=
 =?utf-8?B?TXVzcEVPYVN1YlNqWjhsQmN5bjdrSlBqUzErNS96ajVVR3ZCdG9Oekhyckl4?=
 =?utf-8?Q?ojS5IDMDY8K7gDBDYlUglimlm?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(14060799003)(7416014)(376014)(36860700013)(35042699022)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:47.8987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5759095e-4ea7-4bba-217b-08de1df35564
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978
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

Add description for the SolidRun i.MX8MP HummingBoard IIoT.
The board is a new design around the i.MX8MP System on Module, not
sharing much with previous HummingBoards.

It comes with some common features:
- 3x USB-3.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 M-Key connector with PCI-E Gen. 3 x1
- 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
- 1x LVDS Display Connector
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

In addition there is a board-to-board expansion connector to support
custom daughter boards with access to SPI, a range of GPIOs and -
notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
to this b2b connector, or a termianl block connector on the base board.

The routing choice for UART and CAN is expressed through gpio
mux-controllers in DT and can be changed by applying dtb addons.

Four dtb addons are provided:

- dsi panel Winstar WJ70N3TYJHMNG0
- lvds panel Winstar WF70A8SYJHLNGA
- RS485 on UART port "A" (default rs232)
- RS485 on UART port "B" (default rs232)

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   6 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 712 +++++++++++++++++++++
 6 files changed, 928 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8bda6fb0ff9c1..d414d0efe5e74 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -207,6 +207,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
+DTC_FLAGS_imx8mp-hummingboard-iiot := -@
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 0000000000000..e66ee2ce69d8d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		backlight = <&dsi_backlight>;
+
+		port {
+			panel_from_dsim: endpoint {
+				remote-endpoint = <&dsim_to_panel>;
+			};
+		};
+	};
+
+	port@1 {
+		dsim_to_panel: endpoint {
+			remote-endpoint = <&panel_from_dsim>;
+			data-lanes = <1 2 3 4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
new file mode 100644
index 0000000000000..f8fb7fd0e4e49
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT LVDS connector
+ * with Winstar WF70A8SYJHLNGA panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	lvds_backlight: lvds-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u37 3 GPIO_ACTIVE_LOW>;
+	};
+
+	panel-lvds {
+		compatible = "winstar,wf70a8syjhlnga", "panel-lvds";
+		backlight = <&lvds_backlight>;
+		power-supply = <&reg_dsi_panel>;
+		enable-gpios = <&tca6408_u37 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tca6408_u37 1 GPIO_ACTIVE_HIGH>;
+		data-mapping = "vesa-24";
+		width-mm = <154>;
+		height-mm = <86>;
+
+		panel-timing {
+			/*
+			 * Note: NXP BSP hard-codes 74MHz clock in ldb driver:
+			 * drivers/gpu/drm/imx/imx8mp-ldb.c
+			 * SolidRun BSP carries patch.
+			 */
+			clock-frequency = <49500000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <40>;
+			hback-porch = <144>;
+			hsync-len = <104>;
+			hsync-active = <0>;
+			vfront-porch = <3>;
+			vback-porch = <11>;
+			vsync-len = <10>;
+			vsync-active = <1>;
+			de-active = <1>;
+		};
+
+		port {
+			panel_from_lvds: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+	};
+};
+
+&i2c_lvds {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u37 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		port@1 {
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_from_lvds>;
+			};
+		};
+	};
+};
+
+&tca6408_u37 {
+	lvds-lr-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-l/r";
+	};
+
+	lvds-ud-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-u/d";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 0000000000000..7bbf800b78fb1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart3 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 0000000000000..d4bfea886ad12
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart4_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart4 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..486314c2b9780
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
@@ -0,0 +1,712 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Yazan Shhady <yazan.shhady@solid-run.com>
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mp-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard IIoT";
+	compatible = "solidrun,imx8mp-hummingboard-iiot",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos; /* J10 */
+		ethernet1 = &fec; /* J11 */
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+		gpio5 = &tca6408_u48;
+		gpio6 = &tca6408_u37;
+		gpio7 = &tca6416_u20;
+		gpio8 = &tca6416_u21;
+		i2c6 = &i2c_exp;
+		i2c7 = &i2c_csi;
+		i2c8 = &i2c_dsi;
+		i2c9 = &i2c_lvds;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "dsi-panel";
+		regulator-min-microvolt = <11200000>;
+		regulator-max-microvolt = <11200000>;
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-b";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-m";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+		startup-delay-us = <250>;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus3";
+		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		label = "m2-b gnss";
+		radio-type = "gps";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		label = "m2-b radio";
+		radio-type = "wwan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	flexcan1_flexcan2_b2b_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both flexcan1 and flexcan2 tx/rx between
+		 * expansion connector (J22) and on-board transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches can bus between different SoM board-to-board
+		 * connector pins which is used to support different SoMs.
+		 * i.MX8M Plus uses J7-12/16 and J9-54/56 for 2x flexcan.
+		 */
+		mux-gpios = <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+	};
+
+	spi_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_uart4_b2b_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both uart3 and uart4 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	uart4_rs_232_485_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart4 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup-event {
+			label = "m2-m-wakeup";
+			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	num-cs = <1>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	ecspi2_muxed: spi@0 {
+		compatible = "spi-mux";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* mux bandwidth is 2GHz, soc max. spi clock is 166MHz */
+		spi-max-frequency = <166000000>;
+		mux-controls = <&spi_mux>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			spi-max-frequency = <43000000>;
+			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can2_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&i2c2 {
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		/*
+		 * This reset is open drain,
+		 * but reset core does not support GPIO_OPEN_DRAIN flag.
+		 */
+		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* channel 0 routed to expansion connector (J22) */
+		i2c_exp: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 1 routed to mipi-csi connector (J23) */
+		i2c_csi: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 2 routed to mipi-dsi connector (J25) */
+		i2c_dsi: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u48: gpio@21 {
+				compatible = "ti,tca6408";
+				reg = <0x21>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "CAM_RST#", "DSI_RESET",
+						  "DSI_STBYB", "DSI_PWM_BL",
+						  "DSI_L/R", "DSI_U/D",
+						  "DSI_CTP_/RST", "CAM_TRIG";
+			};
+		};
+
+		/* channel 2 routed to lvds connector (J24) */
+		i2c_lvds: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u37: gpio@20 {
+				compatible = "ti,tca6408";
+				reg = <0x20>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "SELB", "LVDS_RESET",
+						  "LVDS_STBYB", "LVDS_PWM_BL",
+						  "LVDS_L/R", "LVDS_U/D",
+						  "LVDS_CTP_/RST", "";
+			};
+		};
+	};
+};
+
+&i2c3 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+	clock-frequency = <400000>;
+
+	tca6416_u20: gpio@20 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
+				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
+				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
+				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
+				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
+				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
+				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
+				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
+
+		m2-b-reset-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "m2-b-reset";
+		};
+	};
+
+	tca6416_u21: gpio@21 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tca6416_u21_int_pins>;
+		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
+				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
+				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
+				  "TCA_bDIG_IN1", "TCA_SENS_INT",
+				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
+				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
+				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
+				  "", "TCA_POE_AT";
+
+		rs232_shutdown: rs232-shutdown-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "rs232-shutdown";
+		};
+
+		lcd-i2c-reset-hog {
+			/*
+			 * reset shared between U37 and U48, to be
+			 * supported once gpio-pca953x switches to
+			 * reset framework.
+			 */
+			gpio-hog;
+			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+			output-low;
+			line-name = "lcd-i2c-reset";
+		};
+
+		m2-m-clkreq-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "m2-m-clkreq";
+		};
+	};
+
+	led-controller@30 {
+		compatible = "ti,lp5562";
+		reg = <0x30>;
+		/* use internal clock, could use external generated by rtc */
+		clock-mode = /bits/ 8 <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0x0>;
+			label = "D7";
+			color = <LED_COLOR_ID_RGB>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0x0>;
+				color = <LED_COLOR_ID_RED>;
+				led-cur = /bits/ 8 <0x32>;
+				max-cur = /bits/ 8 <0x64>;
+			};
+
+			led@1 {
+				reg = <0x1>;
+				color = <LED_COLOR_ID_GREEN>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+
+			led@2 {
+				reg = <0x2>;
+				color = <LED_COLOR_ID_BLUE>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+		};
+
+		led@3 {
+			reg = <3>;
+			chan-name = "D8";
+			label = "D8";
+			color = <LED_COLOR_ID_GREEN>;
+			led-cur = /bits/ 8 <0x19>;
+			max-cur = /bits/ 8 <0x64>;
+		};
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <8>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&iomuxc {
+	can1_pins: pinctrl-can1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
+		>;
+	};
+
+	can2_pins: pinctrl-can2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
+		>;
+	};
+
+	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
+		>;
+	};
+
+	/* UARTA */
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
+		>;
+	};
+
+	/* UARTB */
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_DATA00__UART4_DCE_RX		0x140
+			MX8MP_IOMUXC_NAND_DATA01__UART4_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
+		>;
+	};
+};
+
+&pcie {
+	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* M.2 M-Key (J4) */
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins>;
+	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus1>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "host";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	cap-power-off-card;
+	full-pwr-cycle;
+	status = "okay";
+};

-- 
2.51.0

