Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F079B439F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D83110E5C9;
	Tue, 29 Oct 2024 08:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RQle4OfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FBD10E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRlVvsgXM2U0x4f2wYrlGi8caE4KvLWrI8X18vW0QOnEw/bLB2LwoEUlu06NYJSsK17t66YP7UpIIs80n7ICflte9Pj/0tbjxK97bYip9N7c5e0m22u/9BBABE2JWgtnkCTnI/7WXkrmV8z5yAzhCs8M3v+1HnH9s981MYCPPbrGOxUCfnQ+fqHu8tUwc1D1G060Bkeq1gVozy0SbQ9ZN2xPGi28mx3VAPKZtzIeQtgyjMz7OjUYzikGw0JtgHbt7vOpdcsxvdcNg5+6q3vAey1oXDaoTxYGh7d1hLcHJWzJSMBJZPMDno1T/UuLboCiXYP9oxEtTzKq95P1dvWy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McXZpMH3TRJYhTsAbgj2DFFlts3hrdtt9Jw3sx9KEjg=;
 b=j76kb5cbwp5L7lgdego7zi0VlhAuxefOn0fEq1/I0VvnqQEAxpAdZ1ADk28SMBCJLL3QZPMkn2MfFbxifqZwSWgf2VYlioYMxhafO82JCffdHEKgVxld4FFs+pvh1RoIcJVH9hj9C07tJG27rPSUrFJvK3UGJhbCYyLSrLuETZkw3IYM1r9/nUBQICl0z1mQVOI4tiYeyUCdUZJsGi/0L5XyXXRZ90je2Q/bT/IHP0Et5g0RI/qXrQ4Q3eLXrqbbbm+iuDCiOtWTV76RaS0n3pgobItbPEboUbxQlhAH+cbqaqzhtB9g/ZelW0DkSrID9Snv8WQDiFk1rhVZATxqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McXZpMH3TRJYhTsAbgj2DFFlts3hrdtt9Jw3sx9KEjg=;
 b=RQle4OfSXh2IxkAmjqxJwFXeDuV/CBXan6rahjg6A2WiymoZ0I+BQHBkR6a03gSO5AyG/Fa7ReoQOhhocJTxbJE22rpFeZ/1ALz2SAe/hKjbT/nA1uLJM/AWhKwvenXDVRZmqWZZ0eGGJZZyZnCReE1OXBiuRsKA6rbeJLtZIUXfCKR0fFsz4TH+DRg8yxJXf13rxlTBa+kwAUediBv8HAXWqrNvrQn/7hfOPx7P8Z846Inc2pI25JNey9AvslcBAh+Xs0K+pf0GLV034hpaT7rR93/FJ6+90L0LXj4vlyibPo0h7xysotDTwYJAQV+1RnwB/Tz7QOG5zEgfrSNgFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Tue, 29 Oct
 2024 08:01:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 08:01:21 +0000
Message-ID: <69cfeb75-696e-43c4-ad27-aaf9ad3c6c78@nxp.com>
Date: Tue, 29 Oct 2024 16:01:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <TY3PR01MB11346FDF74840ADF7273A218D864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346FDF74840ADF7273A218D864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2441e7-8a55-4ae7-f605-08dcf7efe00a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0w2RDlES1JMNU9XekU0N2IyTHEySHppbmpJZ1lKUUduNDRRZ2RrWFQzNWFL?=
 =?utf-8?B?cGh3SW13OGNwTFpJZFJKZG4xNWpKTVhnY2VSbmUzNEp1RTh4QkwyZ2p4UVJ3?=
 =?utf-8?B?TnZFMDBRNEtDVHRJOEFJVGhmZEp0NU16WnIxR3JxQ1dxd1lTQ3pxVTB6QXNT?=
 =?utf-8?B?Nm5jQXZXeWJmczdEb2hCdUloKzE2UkJhKzlOMi9DaU5BVWtzZXd1ZVlqaWVp?=
 =?utf-8?B?dlZYZXQ5MU5RZ1BXT3VKalhVaGtCNWwwU0dYZDNGcU9lV1J0cmhLYzBYYVlF?=
 =?utf-8?B?WGFrWHFWUWtVUVViOUFWZXk3WWo2enlLdVk1RndKT3EyL0hqcnJjMEppM3hC?=
 =?utf-8?B?RlJzMUFLVW01WldTbmJDTDIrRXZQR01tR1BVSUR1bXBQZWdPQThSTDlwWnl5?=
 =?utf-8?B?ZEtLVTRYd1lEQnZpMFFnNkhSamFSR0V1cGRsS1IyYUV6UWhyNmFocWMxWHBD?=
 =?utf-8?B?c1loSjFOZTZySDBxUUVTeDM4Z3E5SHE4WU9pZUJGckFzY1hlaXZRbTUvNEd4?=
 =?utf-8?B?dWVWNUZtbDREL29ldllDMkF5a0ZmZTFId1gycjRLQ2ozM1psZEhjQitvaEYw?=
 =?utf-8?B?UmoxbUdGMEZ4amdrM1FzRFdRNk9xcWNEUHZlckJaR0hvblMzanZDNS9USGYz?=
 =?utf-8?B?cGxUdnQ5WnRXNU9UUVBPRmFnY2NLTzczR2N6Q0VIZllXMWZHVVJWSWdVaHUx?=
 =?utf-8?B?ZXBabG1IM0dsQmlMTjR1RWRrR09NV2lVSVR3azZrcWJsZjBlUUlvaklZc2tk?=
 =?utf-8?B?d0k0KzhERVJpaEVKbXNUR0tZSVZSNEJ3a0VFWmxxZGthVGxDZmlmbHhwREZj?=
 =?utf-8?B?T1NFY3NqQVIwTFUvUXRJN0o1Q2laSUkwbEFJNFNtRGM3dTNTdnhyUmRSRFNT?=
 =?utf-8?B?Rm1kOWlhai9xRVFXOUNDVHptRWJ3K1loZzhMR2JwZkxmOEpzZm1FazhNT3NJ?=
 =?utf-8?B?ay9iTmpIK0dsakhVVlJHcG9nNVg1eE9IQWNmZng4MTh4dEJNbkhUTnBuMkFw?=
 =?utf-8?B?Znh4b3ZlbzUydWhvdFNyL2dPTDEwWk9tUWhYOU1kUHVYbFJzU2xEZGFoRTRv?=
 =?utf-8?B?NkMvSVJhdkUyUGYxRDRDVEdiai9wRjVCTEVSWkVXbjBkRlozN1l0eURETjA2?=
 =?utf-8?B?MlNyVXNQYy9MVFR3N0t2THl6bEErWUpRVUhiR1MzVVU0SnlIbFA0YUhKQTRP?=
 =?utf-8?B?YWplSUMxamI3blZQOFBPSG0zV0NRVTNzTzVQMUJzbnBCUDU2cTQycnpEa0E5?=
 =?utf-8?B?WTV0Y0E0L3R4R21UQk1vY3BtMElsVTNEdUtyZnI4N3Jndjd1NVFTV1hGZzFy?=
 =?utf-8?B?M0Y2bTBDTE1HWEora1Z2WjFvUUZnazJsT093aTYva3dBbE11VDJDaEFGMFRv?=
 =?utf-8?B?ZlFZOGZCbG85dkF4SStUaFZjeWxPaTBrblpqNEtaMm5ldTh2Y1lZYWNtNjQr?=
 =?utf-8?B?VWxTM0trV25XNXdKUWtOUjAwM3dlQjIrOThPT096Sit2MFErdk95ZS9uNEZp?=
 =?utf-8?B?S2lxbS9kNVI0UTV1aEVkdWwwaTI0dEdTNERqbXFWME1zUGZyQ01vVTI2Q21J?=
 =?utf-8?B?OUNVOGlrVEU2dW9JM3BXRE1TejJpeVJpMy9lYm9GeXpIMzJmbUNHckc0WGZ4?=
 =?utf-8?B?dDdLbDV5TFRMNlVEbXpXbHVsczBLZnZZVkw1MzhCa2ZxWWNsQ1h3dmRwclBk?=
 =?utf-8?Q?E0AdYBYvmybS9v2PPFKs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU0xUWVrbmZ3dlRKT2ljUmFqZmh4eFBoWEQ1Rk9RRElQV1ZjbGtSd3ZuRkhY?=
 =?utf-8?B?L05oK1ZVaUowWmVsZmUwdkhoOFQ1K0N3cWR2RlFOdmYvN3I3dkFwZHFOdlJP?=
 =?utf-8?B?L3g5KzNTNm8wQU0ycDFVeXprcG1OcGozZkZROWRoSE9QcVJ4emVzc1d1bzFm?=
 =?utf-8?B?V0NyMFg1QWpNbk04QzIxUkZMQ1RzaXhSOVRQV3FYUEUybHRacmJSV3hIQ1E1?=
 =?utf-8?B?RHpWMzduWUdETEJ6YmdLZ0o2Ym1od3M4Q3h6c1hDSGJKaXNDays3MWc1eXg2?=
 =?utf-8?B?MzVCZlVNUVFKVU84MTFBSHQ2MEFwZGlEL3ROOUlMWmJzOUdDL0xnV2h4Yzc5?=
 =?utf-8?B?UFNqbjhFNmhzY1R3VEUwcDBjVnRMd29qVnR2YVl3UlExWjBMU1ZaVzlQMnYy?=
 =?utf-8?B?T2JjQkNxYXFIcHdET1IxVWxPT0lDSTZVZ1VuVWtmd0F4MkJvYkMxOEJpMjFR?=
 =?utf-8?B?Wm16T3FVSXpBRzFBV3dDeEVDVE9Qb21SS2hrSG0zZ1huUjlLMHRMTmdMcEpY?=
 =?utf-8?B?eG52VW90QXVmSm1yWXBEbFRBYTJFN0p0aCtNak5OVkM5RVg4RkRQckhRYTV0?=
 =?utf-8?B?UWNLL0RucElBZzU0WlRZdm0rSVdJdU1aUVBLZStLbnM2UGNEQVRGUFBYbm45?=
 =?utf-8?B?bW85WnEybTg5YXpuZ2NzZlA2aHlTK1Uxa0djekdOSzlnUnp2cTlOS3U5MHdq?=
 =?utf-8?B?MkxpUEZmZnJvakZlekpHYXd5U0Fwc2h0cG9EYzFlVlZwSjBEZUZ5eGpQLzJl?=
 =?utf-8?B?LzVyWjBuaVkrZ053NWZHRC9VWEQrS0RVVVMydTBlakp6a0dYWDRqWFVmUTQv?=
 =?utf-8?B?S2pGVXhrNVUxdlVHUjFaWGpwR2N0b0I0L0kzckpnb0JLZnJrbkttOGI5Z0Yz?=
 =?utf-8?B?aFRhMFFBZTMwZ3VqVUxWNzRxN2hDMDRoV2VHdDIyYmFrektrTEpzeHQvdWYz?=
 =?utf-8?B?OXJMY3Q2UlNUdDVTZ1hNVWNjbE4wWUUrb0gxK1dPNGhjT2JKQTZZb3dUOXNP?=
 =?utf-8?B?RDhMcGthY0NZcFhtTkFiMU9GQWo1U295YzZHVzNrVTM3MXhzTlg4NmkvSkE1?=
 =?utf-8?B?L1l0NW41aExMTkRLRENXaXUyQ1FkSkRScHlwUCtubXFleFJpZFNhbDJhMVRu?=
 =?utf-8?B?ZjdnQ2tHc0syVEkrSEJhRDdXTjVwcUkxWE9naUZNVldNN3ZUR2JLTFZBK0FJ?=
 =?utf-8?B?TzYvU3lEc1RmYmoxTEF4NGNJSHFvOElSa0xiTC8zR3FKT2tzQkN2eCtaWTFz?=
 =?utf-8?B?b05pcUZERVhUc1BnRzlQYmhPSHZLamhnc2pCV2E2Wjc3NWhuZlFiekdOdXZy?=
 =?utf-8?B?Y2daSkdDZmtIN2pPSnczZjhHMnRMNXh0S290NjNnWHFTMVJ4WFVXNlQ0V2cw?=
 =?utf-8?B?dmpiYzhnN1NBaUZFTS9HUmpsQ0ZBSDZUZldsaTI5Rk1ycUcvcUVTQ0xOK0lK?=
 =?utf-8?B?emxUQUVBN2RFbEovWUxFQ3RxdkVPTFV2czBhT3BEZnNVenVSVjdoVnUvS2hy?=
 =?utf-8?B?YTgvWWMrbm9uZmVPeS9DeUMrZVJTb0RDMkozRC9XbmVjWG5uclpqVVVnK1dh?=
 =?utf-8?B?K2JESEd4MFRWbldHNGFlRGhQRHZyZUcxSnlzczZtWE1yTUFybkVjNGFjcWN1?=
 =?utf-8?B?b3Z2S25qMlFVa0RpT0QvK0twWndnQTJ2aDI1QlpJZkhBbytUSWhFSHNkRjJN?=
 =?utf-8?B?OG03ZVlEZjV0RlRLQW1MT3N4RjRjMEtLenRPUytwOTU4VTR0eGlvbUNpWk16?=
 =?utf-8?B?d0h2MXdXTjFBRE9TUnBnb1NOWjRhbHcrcHFvYXRUYjVRSlVDQ0pkZVlTT1Zm?=
 =?utf-8?B?bmtvQll6OThYVnFMemJQTmZ4Y01xOGMydWR0aVZyNE9wNitOTktFajhhOFBJ?=
 =?utf-8?B?TjVOWjJTVEYzWDhpejFHVTJEL2czWklMSHIwNmFGS2lVemVqWG1tRDZIbDhw?=
 =?utf-8?B?ODVZZGxuRDFKUmVPSEFGZEIrTzhNWDU5NmxZZTh3UjdKSWc4dEc1bVpMVTZF?=
 =?utf-8?B?czlnaTNDRVVyWTc4UEwyR1RZamhJRURoYXZBMzNmZ25MdjlJOTUzcmNEV2xK?=
 =?utf-8?B?WGllT2JXei80dUxBbEY3S0NLZXhadWRyQWR4bHY5VmFMNmpMVkJ1VmlOTTRH?=
 =?utf-8?Q?BKytABARulDlJ+aabOt7vy4iP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2441e7-8a55-4ae7-f605-08dcf7efe00a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 08:01:20.9489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbNGPoPI4kZ+q6n/nmhMLz1kXVfVhtSQuZV3BbxWRKhqh57t7RHOQiLZhb/is845h1+7NO2bv8FWRUX8lkw85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010
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

On 10/29/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: 28 October 2024 02:38
>> Subject: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS display common properties
>>
>> Dual-link LVDS displays receive odd pixels and even pixels separately from dual LVDS links.  One link
>> receives odd pixels and the other receives even pixels.  Some of those displays may also use only one
>> LVDS link to receive all pixels, being odd and even agnostic.  Document common properties for those
>> displays by extending LVDS display common properties defined in lvds.yaml.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v4:
>> * Squash change for advantech,idk-2121wr.yaml and
>>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
>> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
>>
>> v3:
>> * New patch.  (Dmitry)
>>
>>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
>>  3 files changed, 78 insertions(+), 32 deletions(-)  create mode 100644
>> Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>> b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>> new file mode 100644
>> index 000000000000..5f7a30640404
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Dual-link LVDS Display Common Properties
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +description: |
>> +  Common properties for LVDS displays with dual LVDS links. Extend LVDS
>> +display
>> +  common properties defined in lvds.yaml.
>> +
>> +  Dual-link LVDS displays receive odd pixels and even pixels separately
>> + from  the dual LVDS links. One link receives odd pixels and the other
>> + receives  even pixels. Some of those displays may also use only one
>> + LVDS link to  receive all pixels, being odd and even agnostic.
>> +
>> +allOf:
>> +  - $ref: lvds.yaml#
>> +
>> +properties:
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: the first LVDS input link
>> +
>> +        properties:
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +            description: the first LVDS input link for odd pixels
>> +
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +            description: the first LVDS input link for even pixels
> 
> 
> port@0 we know it is first link
> port@1 we know it is second link.
> dual-lvds-odd-pixels: We know it is for odd pixels.
> dual-lvds-even-pixels: We know it is for odd pixels.
> 
> Not sure, whether we can give common description and avoid the duplicate
> from port@1 ??

Yes, it'd better to use patternProperties. Thanks.

--8<--
    patternProperties:                                                           
      '^port@[01]$':                                                             
        $ref: /schemas/graph.yaml#/$defs/port-base                               
        unevaluatedProperties: false                                             
        description: |                                                           
          port@0 is for the first LVDS input link.                               
          port@1 is for the second LVDS input link.                              
                                                                                 
        properties:                                                              
          dual-lvds-odd-pixels:                                                  
            type: boolean                                                        
            description: LVDS input link for odd pixels                          
                                                                                 
          dual-lvds-even-pixels:                                                 
            type: boolean                                                        
            description: LVDS input link for even pixels                         
                                                                                 
        oneOf:                                                                   
          - required: [dual-lvds-odd-pixels]                                     
          - required: [dual-lvds-even-pixels]                                    
          - properties:                                                          
              dual-lvds-odd-pixels: false                                        
              dual-lvds-even-pixels: false                                       
                                                                                 
    anyOf:                                                                       
      - required:                                                                
          - port@0                                                               
      - required:                                                                
          - port@1
--8<--

> 
> 
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-odd-pixels]
>> +          - required: [dual-lvds-even-pixels]
>> +          - properties:
>> +              dual-lvds-odd-pixels: false
>> +              dual-lvds-even-pixels: false
> 
> Why this is false here? oneOf is not sufficient?

The 'false' is used when this LVDS link works alone
as a single LVDS link, being odd and even agnostic.

The 'oneOf' allows a LVDS link to be defined as a single
LVDS link or one link of dual LVDS links.

> 
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: the second LVDS input link
>> +
>> +        properties:
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +            description: the second LVDS input link for odd pixels
>> +
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +            description: the second LVDS input link for even pixels
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-odd-pixels]
>> +          - required: [dual-lvds-even-pixels]
>> +          - properties:
>> +              dual-lvds-odd-pixels: false
>> +              dual-lvds-even-pixels: false
> 
> Same as above??
> 
> Cheers,
> Biju
> 
>> +
>> +required:
>> +  - ports
>> +
>> +additionalProperties: true
>> +
>> +...
>> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
>> b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
>> index 2e8dbdb5a3d5..05ca3b2385f8 100644
>> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121
>> +++ wr.yaml
>> @@ -20,6 +20,7 @@ description: |
>>    dual-lvds-odd-pixels or dual-lvds-even-pixels).
>>
>>  allOf:
>> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
>>    - $ref: panel-common.yaml#
>>
>>  properties:
>> @@ -44,22 +45,10 @@ properties:
>>
>>      properties:
>>        port@0:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> -        description: The sink for odd pixels.
>> -        properties:
>> -          dual-lvds-odd-pixels: true
>> -
>>          required:
>>            - dual-lvds-odd-pixels
>>
>>        port@1:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> -        description: The sink for even pixels.
>> -        properties:
>> -          dual-lvds-even-pixels: true
>> -
>>          required:
>>            - dual-lvds-even-pixels
>>
>> @@ -75,7 +64,6 @@ required:
>>    - height-mm
>>    - data-mapping
>>    - panel-timing
>> -  - ports
>>
>>  examples:
>>    - |+
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> index 10ed4b57232b..e80fc7006984 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-
>> +++ dual-ports.yaml
>> @@ -22,6 +22,7 @@ description: |
>>    If the panel is more advanced a dedicated binding file is required.
>>
>>  allOf:
>> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
>>    - $ref: panel-common.yaml#
>>
>>  properties:
>> @@ -55,28 +56,10 @@ properties:
>>
>>      properties:
>>        port@0:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> -        description: The first sink port.
>> -
>> -        properties:
>> -          dual-lvds-odd-pixels:
>> -            type: boolean
>> -            description: The first sink port for odd pixels.
>> -
>>          required:
>>            - dual-lvds-odd-pixels
>>
>>        port@1:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> -        description: The second sink port.
>> -
>> -        properties:
>> -          dual-lvds-even-pixels:
>> -            type: boolean
>> -            description: The second sink port for even pixels.
>> -
>>          required:
>>            - dual-lvds-even-pixels
>>
>> @@ -88,7 +71,6 @@ unevaluatedProperties: false
>>
>>  required:
>>    - compatible
>> -  - ports
>>    - power-supply
>>
>>  examples:
>> --
>> 2.34.1
> 

-- 
Regards,
Liu Ying

