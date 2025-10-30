Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB49C21451
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FDC10E295;
	Thu, 30 Oct 2025 16:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="oPvtwcYI";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="oPvtwcYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023089.outbound.protection.outlook.com [52.101.72.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271610E295
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:44:59 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eYUn9Kgvl+l1g4Y6NHtu8aE+JEt1F+UuyULOmUWpIHRgxGzTLf304A3Z8gywoijlrt8TpZLeT8pJtolmRsSLK5B0ZT53VIUIt1S9lKmVI+tJsuppVAyRahvNiLst43R21tPBA/K0VHxKJv/DTMEe/X68ci/Ka/1VCNIpJ1UtrC+vPKdE3GZXaZx/T9UmibEcAsQYyv1Bywo/coeYTa13wbmjlndRzq6kmwtht+lQdhuXv0k9WP1xeat2D/OiduHFTQvJ5brUJox8RpVmqWZHdIMbHzb2efpp+xONSul12G7gsMznjuoDdQhYWa6vkGRkoznZ/HfcgzPrrqdO0f+rYA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6f51gci/YLjwAYlGh9x15zFLj7UddGk0CmcmCRVEYM=;
 b=JsrDqpGy9OcoAXDkt9Fpkimz44+vRPy8BHmWjHMY31rnL86cYmh/P+WA0/j3UivxgaElbI8E9r352C3vOyqsxQeXoI6z08x/uUypM+Xy4olUMCmOVtLQdfrnWealmvYLwShcjyzd5nWkv1q1b5p3CKCUIJFxY++oQtTSPCY9ICC/KGodWAydWW9s7zopvdcsBibPNaL93BKwcOoJhXzp/qHtKKQl1dT2WmVOtGPx/kTH3kbZbOoaorfrWFEK1Wte/dCx1Eugjvl1qbar/yQHjejm7oA32vNqUXXgH9VXnz5Tg761pdl3t3NrofOC5oZmyK/sUmcpDvfBekkHEdOToQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6f51gci/YLjwAYlGh9x15zFLj7UddGk0CmcmCRVEYM=;
 b=oPvtwcYIiVG98jGlIgroKl+Of0U0Zo3WoAEgMxO8imVNgN45tYrVqbI1eLkcwckf1r8EDphkyQkMtgnkj+UHM7li9tnMAFwBzZ68nz0dpriSc0+wJoe+XBIJ9u98C5xlVJ7gCsc+a6UId7npZKPk+iQLz5vqGfC2NecT5ZxYDAg=
Received: from AM0PR03CA0031.eurprd03.prod.outlook.com (2603:10a6:208:14::44)
 by GV2PR04MB11445.eurprd04.prod.outlook.com (2603:10a6:150:2af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 16:44:54 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::be) by AM0PR03CA0031.outlook.office365.com
 (2603:10a6:208:14::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 16:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 16:44:53 +0000
Received: from emails-6747688-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id A27297FF69; Thu, 30 Oct 2025 16:44:53 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761842693; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=v6f51gci/YLjwAYlGh9x15zFLj7UddGk0CmcmCRVEYM=;
 b=OLVRDq80V6f+al8/7TeYz2TcQNAfJT+yboIfazpH8Dfw1EvpZOT66Jt3zirpM3Fei0VEc
 JiNNq2hs45y7rPx2aemnYeep0wutIBxEp6h8FpWZOvg4XRsyTfKV3LZx+Dq/eugC5JO4U4c
 jAGFIUjfVrMbpwoyMs5/Hk9/GNwnXfg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761842693;
 b=LXK40lJ/3rJZ7JFrw9ORdNHgb5DYXArtWWj50oZYeBnRqOWyCRcwip3RSQ0Dufha8CYfE
 MOGLa50ESPiV2NPEPbYsIsVVCMGpgSbMFhVjSsH80Svoz46IDZHy+IEB6fxBAzBcaO7sNnk
 Ywsf8tWCkTxcDvvMDo8PKJS4Mo6ojDw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YK7Weepg074bZhcPDLPu0QhdZ7wKtTNBuvvAYB4zONlDaey5jJwLLDqbZM9NXrCsmmPZMOHiJX09lyDbT4WIBsTJqkQrYtYIPc7opZCn/mQ6HKWyavokhWjLCxf4TladhSRTsp9okQdqACS1gbCUxriahrWDEOd1Ni++pdha0tqsmNq1YqXVBaU1yfk22tnRVa9QNKwqcoSF+ci88vbFyErWA6tJEJNZtJ+YTjqlky5pnZ1szNSHwqRvCUwoDBeuYKirQ12jFxrUB3KrDMQEm1SOhv8OQJJwhpHh8GfYMNOc3GD3kfuxmk9Iy7/LOgSekok/ZXEmmhPuUfMTrNtVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6f51gci/YLjwAYlGh9x15zFLj7UddGk0CmcmCRVEYM=;
 b=KR7Yfn1K6oqhkJ99G3PrbsyMn+1S4Imh7rUOySnTRkZqZzxesGNAx4nCQ/OfhPtuHOU1POR3RssOgPWkRGIijnmWkC15N0KZoIKg2fnQHuGtcGbGKExhlwrYMkMYFhNKkey/w0GlRcLtt+pMPm9OCSiPeTQXhCA1HfHsF1ynW/O4XYFnXLgFD0oUoYSyZM3Ywbev5s/i0SIbknVn8lvP/IvKoa4KTpbZW330YZLMF96+vYE4n1eLm1bZteCPDCgXwYhll5q60n1q4rtcmCDPb2S6Vnu1vjzOuK1ZakW8Ds/xskXtAUxypBkJz6V6kV6rLlArv2PYTyzE1BeMYhg2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6f51gci/YLjwAYlGh9x15zFLj7UddGk0CmcmCRVEYM=;
 b=oPvtwcYIiVG98jGlIgroKl+Of0U0Zo3WoAEgMxO8imVNgN45tYrVqbI1eLkcwckf1r8EDphkyQkMtgnkj+UHM7li9tnMAFwBzZ68nz0dpriSc0+wJoe+XBIJ9u98C5xlVJ7gCsc+a6UId7npZKPk+iQLz5vqGfC2NecT5ZxYDAg=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GVXPR04MB11654.eurprd04.prod.outlook.com (2603:10a6:150:2c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 16:44:40 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 16:44:40 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-leds@vger.kernel.org"
 <linux-leds@vger.kernel.org>
Subject: Re: [PATCH 08/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Topic: [PATCH 08/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Index: AQHcR2nlqzlGSPiPPkOwWeKJPAELf7TXfNEAgAFfrICAAg2nAA==
Date: Thu, 30 Oct 2025 16:44:40 +0000
Message-ID: <054eecb5-1296-4c41-ae86-1779abe0360c@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
 <2c54b7b7-4eb4-44a0-8025-8da16a28efd4@solid-run.com>
 <20251029-jittery-ambiguity-14e03ad2f0df@thorsis.com>
In-Reply-To: <20251029-jittery-ambiguity-14e03ad2f0df@thorsis.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|GVXPR04MB11654:EE_|AMS0EPF000001A4:EE_|GV2PR04MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb4ab96-0dde-4d31-2833-08de17d3a6f2
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dkFqeUc0V3pTbmR3VlBGU29ETGZwWWhLcy81cHM2WHBLV0pINExxUEsvc1Qv?=
 =?utf-8?B?ZGdzOXhwd0t5VDRQYWN0aUVtSjVEZXFEL1ZpbTd3dFdpbkxRNEtZOXcveXl3?=
 =?utf-8?B?dnMyUFpYRlJlc0p3amtnL05zeTVGU2swVW1FOFV4ODZJbXNXSjQ2SEtDK1BI?=
 =?utf-8?B?cW01VzNSZG5mRlhxbDFWWExlOHBTeEo2MzdrMjVFOTZlNzJ6bnI4UkRudzdk?=
 =?utf-8?B?N0JSbko3UUxoK2xQRm1mOHQ4d1NNWkc1cHRxZi81cHkwNGVLd1pxZTJmRElT?=
 =?utf-8?B?N3d0UHVDYlBrc1RlUGZLZnRGT0RYb1ppUXkxRVhLNEUvQlJJR2M1Ym5YSTYr?=
 =?utf-8?B?TlFnaFRCRlBYMVBFQVg0Z0s1V013RXpQRU9TTm5NMURYSytsRGxGU3VnVU1y?=
 =?utf-8?B?dTYxUDBMTzRpOVEyNTAxdTZzakxQRFNxNG9SeWt1WEZaZ3E2Q08rNnBlblEv?=
 =?utf-8?B?bENFRUNsL3E2Wnk5UDNSS1R3bEdtRG1vWEg5dGFHbktqc3BISllsdDgxdkl6?=
 =?utf-8?B?NGdEbTRITjNHalRDcTNzOWdEUDlyOW1VRzY5VGtSNWVMcTdsU0MvKzBIRTJi?=
 =?utf-8?B?TFNsWHg3eWNVTDMyRElsT0tEUkhHMWJGZnhZOEhwMTg1WVM3Z09ZUWt4Tjgy?=
 =?utf-8?B?ZmlrSVlhWnEvbVNrK2tuZVVodDByVkYvRkVNNXhOYVNrQjAzUmdxOEgxWjVo?=
 =?utf-8?B?WDBMMENnL0hKQWJCQkkyeGFuY3F0S2dEU0tRTVNuRGtoSzIyZFRqbkRLQmkw?=
 =?utf-8?B?MkgwU1l6dUVPbHI4dVZVQVp1N29kWEcvQTU1VlZpS3BBTDNmZzdWS2Y2elhp?=
 =?utf-8?B?a2c3ZGFnbCtNNHc1YllQUGhDN1JhTzNXeEtDaHBSSjViMGRyZW5yU0hEZlY2?=
 =?utf-8?B?V3Yxbjg0M2pQU2dKZm1sY3k5c3RkMVN1NkFEbCtUVWg3K1IyRHNZUys0SzNX?=
 =?utf-8?B?TUwxc2dWaHFhS1RPcnUvYSt1MmZwcmpPVFFWMExwdXRZZ0ZwMXhDbm51K0F0?=
 =?utf-8?B?NGZFenlsSU4xVGpvbllCQngvemtsOVFMVis5Z0Nrbm5TSUhGd012NHJIM1VD?=
 =?utf-8?B?ZDBwZnl5SkZFN3FKbTFqa1gvSmRDcFg3RWZzUVRNaDJTK0wzZGE1UjhjenNG?=
 =?utf-8?B?TTNJc29kNi82UkdHc2RpTGZzSWJmU09PYmozVFpXZ3Vvc2twL3laVlFTOVpK?=
 =?utf-8?B?OE0vcytPUWo5MlFJb3hQbWxGZTdKVkZjdVhqd1BqRGwzb1hsODlSRkRsUlZK?=
 =?utf-8?B?WHl5YWxidytSeWs3VXg2YVpsV1l0MW4zUElkbDI4UTJUTmdUVExlc0FQcWx6?=
 =?utf-8?B?aHVWa2xiWXM4RHRwYUNnK0kvNWJreFZFU3gwa2Y3Q2lVYzRpYTVNRFZhbUxU?=
 =?utf-8?B?VTZ1dXRPVFhrT3JZSE5iMnlObUEyYzZ0czAwdWtUdHlCYTM1V1U2M2V3L1F5?=
 =?utf-8?B?OXNiOVk3N3VBUHRIMllLeTVQRkxjcXN2TVd5MFpzcHM0YTcyRDA1N05xNXpT?=
 =?utf-8?B?TVNmbExHeGFML0dOS0VTcHl5eGV1Ny91Q0ZsVys2WnI2TVFOemNuempGTkNa?=
 =?utf-8?B?SkJoVHZIOGRsMEFLSVJKV3BENlRmOUhpMUZIQUlQNTNjbllzMXg2QXlTOEMv?=
 =?utf-8?B?NmhvNm16TDZQL3k5VEJKdEdmKzJIOHcrNVBJcXVhNm1MaHhIVm9SQnVHbVdt?=
 =?utf-8?B?Y0pWTGloRTJsWkttWWVnbFJMR0xNSmtIQnBXV3hCRDBpUTZVMzZ1dWhQcTl1?=
 =?utf-8?B?SzFmemdHTUd6MlpFRmNMWDh4Rjl2Tlppb3BKRVFYMW9YQ0toZzVKNDdiNTlJ?=
 =?utf-8?B?Wkc4djFKQTI4ZUp0L1RySHBvR3BQQUxjaFJSWjVWRXgyNmpGckU4a1d5WWpR?=
 =?utf-8?B?OGZycUFLc2FGMEpmTStiSFAwQ0ExWWlaZmZUZERmYjdLUjJkRE41Q2I2Z0xB?=
 =?utf-8?B?RXRjTFlDZEdrczJISk5Ca3o5anlUSVBlWjc3enp2YXJudkFNNUttTDI1QXha?=
 =?utf-8?B?Mk1zd3d4VXp2OWFxMVZ0NjhxOFJDUkNERlpWVVA2d0lKR3ZRbU9PZXk3SnlB?=
 =?utf-8?B?V3FuMExJVEEvTWFzMkhFSXkrRUFobWkxNzhzQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F9AD27851498B4EBB82756F0D42F9FA@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11654
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c24ea82747fc48079c924b540f2da90f:solidrun,
 office365_emails, sent, inline:916b537bd87bc327f3dadf17d50d2a0b
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0d1da059-d9d2-4df2-55c6-08de17d39ecc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|36860700013|35042699022|1800799024|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnZyZml3dHF6MDRVbkQ5QkhiL1MwcnhWdHEvQk5GQnUzc3BLcWN5U3E4b3Rm?=
 =?utf-8?B?M0c2RHdqVHlUdWZCWXkydmVFNnM1TU5Ib3lvcDVYY0tRM1ZtU2x3UGZIK1d6?=
 =?utf-8?B?dk02SGk1eFl3ZGJtYTF1bUUyYnJPY3VXOGs0OWFmQkI0TEFsYmxyR1QyMXho?=
 =?utf-8?B?NW9naU9NSWJVdFI5Ri9jbFJmZk1uQ1NtV091VE95RVZ5WjVXUk5LVi9VRnpM?=
 =?utf-8?B?a2NrQnRGSjZqcUpHV0EvUzFpMEFQWXFEMGYrdDR3a0hGNlBIRzhXRUdodjhx?=
 =?utf-8?B?c3hvRkR2NXVpcUhaeGRzSUVEVndWU1JNeDNLQTVGK1pHMm9Td25uTWNDWkNN?=
 =?utf-8?B?T2RwV3pVN2R0SHR3cUhPTkxFcC9SQXRXS3o5WEFOdVpxMGRiWXRpSE92QWIx?=
 =?utf-8?B?TUhVTThVem12eXRKNnNEMHl1ZjhDQXJ1dHozWFlIQ2N0M2pRdXREMlZoS2J5?=
 =?utf-8?B?Szh5bGdGMzFjVGFCeG5IUVZVNjZGNVJVU2lsak92dzllanYvUmxEZjJxelov?=
 =?utf-8?B?L1hHR2xNeU5mNCt2UGZsaG5aWC90WkVtWnZUNDNyVy8rMHBWaDRuWk5jUmZB?=
 =?utf-8?B?SHdnd3NSenJZamhOOW1NUENFb0QzbnlNbW10TnB2eFlmT3UzbVF4SEVsa2Fx?=
 =?utf-8?B?eFJPVFR3bUFkUEU2a0JjUUZneEdVRUpDVVJDeFc0L1pIZVk4Zi9SL3lPY1JZ?=
 =?utf-8?B?NkZpRUhLNzd2K041NFZINVA4MmtJekFqQ2NteUpuM3VabDQ4TURObE5rOEtr?=
 =?utf-8?B?RWVJRGZ6dFZQd3BxSkRIMlh4M2xSNTkrWVhiK0ZncENRL0E1SEZKUmFGMUVx?=
 =?utf-8?B?ZXViUDlNVW1mNE9yM2RhRklvSW90MjVrUnNRN2ZGbUV1SGhQZ2toQ3VVcWN6?=
 =?utf-8?B?aGx4aXpVTHA3UzNaaitvMmJ2d2FrdnROMWl0UzFnT1RJcjdBdEVxWG9ONWRU?=
 =?utf-8?B?WnMvd0x4M3JLNmd4cXZhL0ZWcWU5bk42dWNvZ0JyVHUrcGRLSHZIKzdaUGo3?=
 =?utf-8?B?Z0RMMmhpVHp0bVRJMTlKTFU4dmpqaXY1TDdYaWZNYmFaWnhmcDBUbmR3ZGhF?=
 =?utf-8?B?ZTlabUlSNUtzK3JOeG1heHVnelQyQXFyS2pLMmI3UFFXZUlBbk9nVWlRaGF4?=
 =?utf-8?B?RytMNllneGxUSytLbDRBUUxWSjArNGVqVCtTUEd5aTIyYlB2WVQ4cS9DZmYx?=
 =?utf-8?B?RUZrbkhLc1R0MHYyZ2Z1cWxDaDdVZEVwYUorekZITHBtRGtRbEtSQzk0aTJB?=
 =?utf-8?B?a3Joc1Y1a2VpQWtmdjMwWU05MnlqWU90elplZS8vNkg5ZjZUYmJWSmhjc3FV?=
 =?utf-8?B?ZjdjMXU4bnhnSG5lZU5vNzQxQ0VRcFRhVVFRWnQ1V1RRVkRiU1dQdEpmSnV2?=
 =?utf-8?B?cktBWk9pN0pKWDhiVDlQY0pibWR0UWtpY2wyQTBTdlZuSnBhWDZPV2ZMWDhI?=
 =?utf-8?B?U3YwZjZlZWpOb0RpMlNrVDFFVVdaQnJnUkFKYkdTWGwycEVoVVRVajhpZ2I2?=
 =?utf-8?B?RFpsTTJpaGFxU0NXazZoeUJwUlhzNE8wMnp0c2QrT2h3T0xuSzg1SmpITnNX?=
 =?utf-8?B?SGY0SkJ6L3k1NGNybFVLa2R2R3pmcWhPU0V5TlM3dmgwS3ZrMTZEMEIrZXN2?=
 =?utf-8?B?bWRGRWlmVHY0QUtFSForSGoxV2g4Z0pjWjJxUVhwNk8rTDRMeUJ2dHZ5ZWtn?=
 =?utf-8?B?Y0JLVERRVUFxV2sxK2tMOU9CWVRheDUvVERjU1lLTnNKMDNqb1BUL0pCazBN?=
 =?utf-8?B?bGp3M1V2cEhmM2JFcGcrNTdYdWN5VmVIWW9LdUtEb3hQRVEyZGdMOUxYd0lL?=
 =?utf-8?B?Njc2Qm92ODNjUHJxUHB0ME9oelAvRllQQ0xxSHJsZ0JYUVI3RWdabmFCWVRX?=
 =?utf-8?B?YjlvQWgwVWxibDZVSEZHWUtsdncwQ2I4UnRlTDBvd3BIaEJraCtNaEtTTk9F?=
 =?utf-8?B?bVEyblhNb0tldVlWNFpVWGNuTlN0Y1FLL2gzMUgva3NPNjVEaEQrejNCUVNi?=
 =?utf-8?B?WU5ZMXpLNG9DdjNCTlBwVkdwT25sYjVlWC9FUFNEcSt1WGdLejl0YVd2ODND?=
 =?utf-8?B?d1MwZnFkMEgzYmVBbjBYOE5ZNzN1Q1VIZW9pV3JLejlUZmI5NnYyZW51a3pV?=
 =?utf-8?Q?p9amrJYU1LPJ/F41wFM28ShUP?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(35042699022)(1800799024)(14060799003)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 16:44:53.8687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb4ab96-0dde-4d31-2833-08de17d3a6f2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11445
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

SGkgQWxleCwNCg0KQW0gMjkuMTAuMjUgdW0gMTA6MjMgc2NocmllYiBBbGV4YW5kZXIgRGFobDoN
Cj4gSGVsbG8gSm9zdWEsDQo+DQo+IEFtIFR1ZSwgT2N0IDI4LCAyMDI1IGF0IDEyOjI0OjM2UE0g
KzAwMDAgc2NocmllYiBKb3N1YSBNYXllcjoNCj4+IEFtIDI3LjEwLjI1IHVtIDE4OjQ4IHNjaHJp
ZWIgSm9zdWEgTWF5ZXI6DQo+Pg0KPj4+IEFkZCBkZXNjcmlwdGlvbiBmb3IgdGhlIFNvbGlkUnVu
IGkuTVg4TVAgSHVtbWluZ0JvYXJkIElJb1QuDQo+Pj4gVGhlIGJvYXJkIGlzIGEgbmV3IGRlc2ln
biBhcm91bmQgdGhlIGkuTVg4TVAgU3lzdGVtIG9uIE1vZHVsZSwgbm90DQo+Pj4gc2hhcmluZyBt
dWNoIHdpdGggcHJldmlvdXMgSHVtbWluZ0JvYXJkcy4NCj4+Pg0KPj4+IEl0IGNvbWVzIHdpdGgg
c29tZSBjb21tb24gZmVhdHVyZXM6DQo+Pj4gLSAzeCBVU0ItMy4wIFR5cGUgQSBjb25uZWN0b3IN
Cj4+PiAtIDJ4IDFHYnBzIFJKNDUgRXRoZXJuZXQNCj4+PiAtIFVTQiBUeXBlLUMgQ29uc29sZSBQ
b3J0DQo+Pj4gLSBtaWNyb1NEIGNvbm5lY3Rvcg0KPj4+IC0gUlRDIHdpdGggYmFja3VwIGJhdHRl
cnkNCj4+PiAtIFJHQiBTdGF0dXMgTEVEDQo+Pj4gLSAxeCBNLjIgTS1LZXkgY29ubmVjdG9yIHdp
dGggUENJLUUgR2VuLiAzIHgxDQo+Pj4gLSAxeCBNLjIgQi1LZXkgY29ubmVjdG9yIHdpdGggVVNC
LTIuMC8zLjAgKyBTSU0gY2FyZCBob2xkZXINCj4+PiAtIDF4IExWRFMgRGlzcGxheSBDb25uZWN0
b3INCj4+PiAtIDF4IERTSSBEaXNwbGF5IENvbm5lY3Rvcg0KPj4+IC0gR1BJTyBoZWFkZXINCj4+
PiAtIDJ4IFJTMjMyL1JTNDg1IHBvcnRzIChjb25maWd1cmFibGUpDQo+Pj4gLSAyeCBDQU4NCj4+
Pg0KPj4+IEluIGFkZGl0aW9uIHRoZXJlIGlzIGEgYm9hcmQtdG8tYm9hcmQgZXhwYW5zaW9uIGNv
bm5lY3RvciB0byBzdXBwb3J0DQo+Pj4gY3VzdG9tIGRhdWdodGVyIGJvYXJkcyB3aXRoIGFjY2Vz
cyB0byBTUEksIGEgcmFuZ2Ugb2YgR1BJT3MgYW5kIC0NCj4+PiBub3RhYmx5IC0gQ0FOIGFuZCBV
QVJULiBCb3RoIDJ4IENBTiBhbmQgMnggVUFSVCBjYW4gYmUgbXV4ZWQgZWl0aGVyDQo+Pj4gdG8g
dGhpcyBiMmIgY29ubmVjdG9yLCBvciBhIHRlcm1pYW5sIGJsb2NrIGNvbm5lY3RvciBvbiB0aGUg
YmFzZSBib2FyZC4NCj4+Pg0KPj4+IFRoZSByb3V0aW5nIGNob2ljZSBmb3IgVUFSVCBhbmQgQ0FO
IGlzIGV4cHJlc3NlZCB0aHJvdWdoIGdwaW8NCj4+PiBtdXgtY29udHJvbGxlcnMgaW4gRFQgYW5k
IGNhbiBiZSBjaGFuZ2VkIGJ5IGFwcGx5aW5nIGR0YiBhZGRvbnMuDQo+Pj4NCj4+PiBGb3VyIGR0
YiBhZGRvbnMgYXJlIHByb3ZpZGVkOg0KPj4+DQo+Pj4gLSBkc2kgcGFuZWwgV2luc3RhciBXSjcw
TjNUWUpITU5HMA0KPj4+IC0gbHZkcyBwYW5lbCBXaW5zdGFyIFdGNzBBOFNZSkhMTkdBDQo+Pj4g
LSBSUzQ4NSBvbiBVQVJUIHBvcnQgIkEiIChkZWZhdWx0IHJzMjMyKQ0KPj4+IC0gUlM0ODUgb24g
VUFSVCBwb3J0ICJCIiAoZGVmYXVsdCByczIzMikNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEpv
c3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4+IC0tLQ0KPj4+ICBhcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgNiArDQo+Pj4gIC4u
Lmh1bW1pbmdib2FyZC1paW90LXBhbmVsLWRzaS1XSjcwTjNUWUpITU5HMC5kdHNvIHwgIDcwICsr
DQo+Pj4gIC4uLnVtbWluZ2JvYXJkLWlpb3QtcGFuZWwtbHZkcy1XRjcwQThTWUpITE5HQS5kdHNv
IHwgMTA1ICsrKw0KPj4+ICAuLi4vaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWEuZHRz
byAgICAgICAgICB8ICAxOCArDQo+Pj4gIC4uLi9pbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QtcnM0
ODUtYi5kdHNvICAgICAgICAgIHwgIDE4ICsNCj4+PiAgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1w
LWh1bW1pbmdib2FyZC1paW90LmR0cyAgICAgfCA3MTAgKysrKysrKysrKysrKysrKysrKysrDQo+
Pj4gIDYgZmlsZXMgY2hhbmdlZCwgOTI3IGluc2VydGlvbnMoKykNCj4+IGN1dA0KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtaHVtbWluZ2JvYXJk
LWlpb3QuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdi
b2FyZC1paW90LmR0cw0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwMC4uMmU0Y2I2NzZiYzlkYQ0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QuZHRzDQo+
PiBjdXQNCj4+PiArCWxlZC1jb250cm9sbGVyQDMwIHsNCj4+PiArCQljb21wYXRpYmxlID0gInRp
LGxwNTU2MiI7DQo+Pj4gKwkJcmVnID0gPDB4MzA+Ow0KPj4+ICsJCS8qIHVzZSBpbnRlcm5hbCBj
bG9jaywgY291bGQgdXNlIGV4dGVybmFsIGdlbmVyYXRlZCBieSBydGMgKi8NCj4+PiArCQljbG9j
ay1tb2RlID0gL2JpdHMvIDggPDE+Ow0KPj4+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4+
ICsJCSNzaXplLWNlbGxzID0gPDA+Ow0KPj4+ICsNCj4+PiArCQltdWx0aS1sZWRAMCB7DQo+Pj4g
KwkJCXJlZyA9IDwweDA+Ow0KPj4+ICsJCQljb2xvciA9IDxMRURfQ09MT1JfSURfUkdCPjsNCj4+
PiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+Pj4gKwkJCSNzaXplLWNlbGxzID0gPDA+Ow0K
Pj4+ICsNCj4+PiArCQkJbGVkQDAgew0KPj4+ICsJCQkJcmVnID0gPDB4MD47DQo+Pj4gKwkJCQlj
b2xvciA9IDxMRURfQ09MT1JfSURfUkVEPjsNCj4+PiArCQkJCWxlZC1jdXIgPSAvYml0cy8gOCA8
MHgzMj47DQo+Pj4gKwkJCQltYXgtY3VyID0gL2JpdHMvIDggPDB4NjQ+Ow0KPj4+ICsJCQl9Ow0K
Pj4+ICsNCj4+PiArCQkJbGVkQDEgew0KPj4+ICsJCQkJcmVnID0gPDB4MT47DQo+Pj4gKwkJCQlj
b2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+Ow0KPj4+ICsJCQkJbGVkLWN1ciA9IC9iaXRzLyA4
IDwweDE5PjsNCj4+PiArCQkJCW1heC1jdXIgPSAvYml0cy8gOCA8MHgzMj47DQo+Pj4gKwkJCX07
DQo+Pj4gKw0KPj4+ICsJCQlsZWRAMiB7DQo+Pj4gKwkJCQlyZWcgPSA8MHgyPjsNCj4+PiArCQkJ
CWNvbG9yID0gPExFRF9DT0xPUl9JRF9CTFVFPjsNCj4+PiArCQkJCWxlZC1jdXIgPSAvYml0cy8g
OCA8MHgxOT47DQo+Pj4gKwkJCQltYXgtY3VyID0gL2JpdHMvIDggPDB4MzI+Ow0KPj4+ICsJCQl9
Ow0KPj4+ICsJCX07DQo+Pj4gKw0KPj4+ICsJCWxlZEAzIHsNCj4+PiArCQkJcmVnID0gPDM+Ow0K
Pj4+ICsJCQljaGFuLW5hbWUgPSAiRDgiOw0KPj4gY2hhbi1uYW1lIGdpdmVzIHRoZSBsZWQgdGhl
IG5hbWUgRDYgaW4gc3lzZnMuDQo+Pg0KPj4gVGhlIGJpbmRpbmdzIGRvIG5vdCBhbGxvdyBob3dl
dmVyIHNldHRpbmcgY2hhbi1uYW1lIG9uDQo+PiB0aGUgbXVsdGktbGVkLCBhbmQgaXQgaGFzIGFu
IGF1dG8tZ2VuZXJhdGVkIG5hbWUgaW4gc3lzZnMuDQo+Pg0KPj4gQW0gSSBtaXNzaW5nIHNvbWV0
aGluZz8gQ2FuIG11bHRpLWxlZHMgaGF2ZSBhIGN1c3RvbSBuYW1lPw0KPiBUaGUgc3lzZnMgbmFt
ZXMgYXJlIGF1dG8tZ2VuZXJhdGVkIGJhc2VkIG9uIHRoZSBhdHRyaWJ1dGVzICJjb2xvciIsDQo+
ICJmdW5jdGlvbiIsIGFuZCAibGFiZWwiIHdpdGggdGhlIGxhc3QgYmVpbmcgZGlzY291cmFnZWQg
Zm9yIG5ldw0KPiBkZXNpZ25zLg0KVGhhbmsgeW91IGZvciByZW1pbmRpbmcgbWUgb2YgdGhpcyBv
bmUhDQo+IElmIHRoZSAidGksbHA1NTYyIiBkcml2ZXIgZG9lcyBub3RoaW5nIHNwZWNpYWwseW91
IGNvdWxkDQo+IGFkZCAiZnVuY3Rpb24iIHRvIHRoZSBtdWx0aS1sZWQgbm9kZSBhbmQgc2VlIGlm
IHRoYXQgZml0cyB5b3VyIG5lZWRzLg0KVGhlIGJvYXJkIGlzIG5vdCBhIGNvbXBsZXRlIHByb2R1
Y3QgYnkgaXRzZWxmIHNvIHdlIGhhdmUgbm90IGNob3Nlbg0KYSBzcGVjaWZpYyBmdW5jdGlvbiBm
b3IgZWFjaCBsZWQuDQpUaGVyZWZvcmUgb25seSBjb2xvciBhbmQgbGFiZWwgYXJlIGFjdHVhbGx5
IGFwcGxpY2FibGUuDQoNCkFmdGVyIHRlc3Rpbmcgb24gdjYuMTgtcmMxIEkgY2FuIHN0YXRlIHRo
YXQgbGVkcy1scDU1NjIgZHJpdmVyIGRvZXMNCnNvbWV0aGluZyBzcGVjaWFsIC0gZnVuY3Rpb24g
YW5kIGxhYmVsIHByb3BlcnRpZXMgZG8gbm90IGhhdmUgYW55DQppbXBhY3Qgb24gdGhlIG5hbWVz
IGluIHN5c2ZzLg0KDQpIb3dldmVyIEkgY291bGQgc2V0IGxhYmVsIG9uIGJvdGggTEVEcyByZWdh
cmRsZXNzPw0KDQo+DQo+IEFkZGluZyBsaW51eC1sZWRzIHRvIENjLCBiZWNhdXNlIHRoaXMgaXMg
YSBMRUQgcmVsYXRlZCBxdWVzdGlvbi4NCj4NCj4gR3JlZXRzDQo+IEFsZXgNCj4NCj4+IEluIHY2
LjYgbGVkcy1scDU1NjIgZHJpdmVyIGlmIEkgc2V0IGluIGVhY2ggbXVsdGktbGVkIGxlZEBbMC0y
XSBzdWItbm9kZQ0KPj4gY2hhbi1uYW1lIHRvIHRoZSBzYW1lIHN0cmluZyAiRDciIC0gdGhlbiB0
aGUgc3lzZnMgbmFtZSBiZWNvbWVzIEQ3Lg0KPj4NCj4+PiArCQkJY29sb3IgPSA8TEVEX0NPTE9S
X0lEX0dSRUVOPjsNCj4+PiArCQkJbGVkLWN1ciA9IC9iaXRzLyA4IDwweDE5PjsNCj4+PiArCQkJ
bWF4LWN1ciA9IC9iaXRzLyA4IDwweDY0PjsNCj4+PiArCQl9Ow0KPj4+ICsJfTsNCg==
