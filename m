Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1393F0D6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5463510E36A;
	Mon, 29 Jul 2024 09:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e+VOAjbN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622D210E36A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wj7j+NtE/m9jmufJ4ZpB+WmrG0Gg10Q6KRspYJ6fK3s8JphxYQLmNR/2Eh1JxUqvahlIp8KN8LhBem20sf+OiXVNdS6qmvrHAj/E90EdTC9rhPRq2kCCB2rrxIqfxwggBVH+DMMJ5eyipW7zZEGXlKKdI7Cvm+MVyGlYAfjwnLoPm7djvmCrnCOjEt5Ra9ux4ndQ5haBqgUN4tXvsl2foSqmPlRqLazUp4exsdoNEcJCiocdKrzLPWiwejXuQC+zsoeMOO/tAzqqPZ5yvC/TRP7jr3hDX7TefCQTUWzOyxazBF2l+muALnmDCclVpXWpBAYkudIh8YVwTKdIvLHORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vumnBW1lVrFK58/wCamYvb34nyyf0eaMLlq1J6KX8A=;
 b=uhv9lFyWkgUOU+7x4F769yMuLOVkbv5oAC5sxyD7x5Q1oGKwPOLc9PETwa6bM5/lsf8DP3dGp5lWliyqPs9SozqmqaNkBeXJI6YXjhvMJzosKzUraIBJS783ugxxq8eSDzf6IKo/xyaQNiBT20zZyzMEiFt2ZzAcKOOdb1QzztLhvaA2aM/EMLc2S9Y4Juo7m/UnpXqFtiH4Hbc4HCr6IbYWgv2Vh/+7su1D7L0wEw5xFZg0g2yIITsmluw6mhWuK+LM3Yz+Vq6tlBvRke/p1I24Yl2onkaIFsJq40bdhVTimvok+P4mhVUAe++P3oQ0Y/b/mjOTG8S6Pk0Pv/zIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vumnBW1lVrFK58/wCamYvb34nyyf0eaMLlq1J6KX8A=;
 b=e+VOAjbNcdoB0O3aO7wBgoMQqEqNQBWEMwJklZmyfpO0O9oGbnYkW1c7t5f2LenHFVpJiUk5dDh4vp/BsulxYQJSf3KbBX9b+bkrmzwCWmvD3C+pv/WdFQT1TrpVqlR4Ca9PAf2WHcyENrGAwt7xdBwJjbfP/G2P4K8750fQXuA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11848.jpnprd01.prod.outlook.com (2603:1096:400:370::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 09:20:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 09:20:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v2 5/9] drm: renesas: rz-du: Add RZ/G2UL DU Support
Thread-Topic: [PATCH v2 5/9] drm: renesas: rz-du: Add RZ/G2UL DU Support
Thread-Index: AQHa0gc+hmDhx2i2TkCVJWxg09UYArIJ3KeAgAOv/GA=
Date: Mon, 29 Jul 2024 09:20:10 +0000
Message-ID: <TY3PR01MB11346F5377ADB20298CC2E2CE86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-6-biju.das.jz@bp.renesas.com>
 <20240727010021.GG300@pendragon.ideasonboard.com>
In-Reply-To: <20240727010021.GG300@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11848:EE_
x-ms-office365-filtering-correlation-id: a634f78c-92d5-4863-d2b5-08dcafafa541
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V0ExbnljUGZmRllxZGM1RkZWdXkwRlBTeCtnMlhkMFgveHpYV1Q2M1VlWkZ3?=
 =?utf-8?B?NzM3dTk3eStxNDI3eUpjTkRXTTlYejhWSUI0d2prR01IK0gwM05zYTZRWWFj?=
 =?utf-8?B?QWZBZjFxM1d2UlluWlAzdXpWZFRyRSt4THNSb213WUVwaCswZC9aVGRRdUd3?=
 =?utf-8?B?cmgxaHd5NWRwYnVScUVsMEw3UmZkM2w5Z25wVkJCalBqS2RUNnhCSWYraEJG?=
 =?utf-8?B?T3ZsK0YyTis0TGY3ZjE1ZVU4VFY2ektQQUd1c0l3WVc3UlI3Y1RrNWptUEVT?=
 =?utf-8?B?YXg4QXczY3JKVmtFTXd5b0VzUkJjeFF0MktWdUlyVVBnTkhQbzdiR0VZR3Ev?=
 =?utf-8?B?SFNsQlRDc3RTcFlEZVVveWJRb1d2b29jRTJBZ2dPOVMxcy9yZThBK3NkZHpF?=
 =?utf-8?B?RGp3aVcxcGRnRlc2WVZ1U25iQ2o2ejVFYlRnVFdXNzR3YUNvMmlPdk53WDNF?=
 =?utf-8?B?OXBZMVNrSWNtb25ydEZpa3A4eS9wdklJSXl0STZWeXJ2cU1DTDVCSGpJdE9C?=
 =?utf-8?B?NmxXQXl5LzNRR09jaU1XTTREa1dEeWlieTVtL3ppMzNKaEFDY1RGUVFRSWIv?=
 =?utf-8?B?eTdyQXZPSGhWbjZmVHpvZXBMZHBoRlJuNEpKcWxOcnV2a3RhcjdBOUcvbzdE?=
 =?utf-8?B?SE51YnZVWUR0WGdER20rZzF1dXFJZHM5M2I4TVNwK3o5SHJZRnh4T3AxK1Q3?=
 =?utf-8?B?dERUYm1DMmEydzBhQ1JjRHhXbW55c1ZkL003WFlzR3lXSmttRTc0cDkrT1Jo?=
 =?utf-8?B?MGp2SngxOVFtZWtHMmhrTFc2Z2hQYlJiN0plVXlKSVdwN203WU5CRGZNTUJF?=
 =?utf-8?B?THJleWczTW0rOVNreXg0N3VWT09NTDJiaWtXVEgxbXFEdFJoTVEwU25GTVli?=
 =?utf-8?B?d2tURU5VSVBVZDBJUHhXVGVrUVBTd3hVT2VFMCtrVVRHRnd5bUprZlBMRjRP?=
 =?utf-8?B?cFBEZkFsb2pqNFl3OGZySmd0aitsRFJWK0dibjdTcGE4OXhsVUxWTXM3T0FW?=
 =?utf-8?B?OTU5NDAxcmFUdElwSFFHazFPTnc5bFBWRkpzeDQ5WStKRW5wTDJOZVV6SjJK?=
 =?utf-8?B?QTQwV2wxNFNYdjdneURRNE01THgwUW91b1AxNDhUTXpMbEl4L2lCUC9TR3h2?=
 =?utf-8?B?OTg5VUZkUWNNdzZUakZyMVh2NlArdVMxVzJadHFncUM4Rmp0TW42ek81cC9W?=
 =?utf-8?B?NnRGTEprcVBPS2o3ekN0eHQzWEp4bE9ibmN2Nmk5MGhOWEFvWWkvbTIzNmlM?=
 =?utf-8?B?cTByQWV4K0YxV2FQYzJGMjlrUGNud3RYT3hSNjVnMmRJS2tOUFVGWHVCOGZo?=
 =?utf-8?B?RCthWWtWWCtDR29BWHFZaTNIRG1qdTJEeElqb3Y1N1BpYnpXMjBNeUMrUjZk?=
 =?utf-8?B?Vlo1RkV6SzY1Y21XZ2FxTUpmNXZ6b1F4VWl4bmxRZkZ2NGxUcjRMYUx4ei9T?=
 =?utf-8?B?c1lnTUlUbVRRUWhJMFBidTZ0Uzg4bGY1NUlOejVpclRzZkhTSWJDT1ZPdWNl?=
 =?utf-8?B?bUZudE1zUmh3ZzFCSU5rN2pJbXcyOU1xR2VHWXBQdGVXZkE2Tm91cHk3MUVX?=
 =?utf-8?B?RVFQN3lUblc1NkVsVUNxS0pKbCtFWWxVYmFnYVYrZ0s4UG1sczBGUmQ0Vkl6?=
 =?utf-8?B?aGN0U3BLZUI1UitWeTF3VUpxdlNtYmRnT3FUVGY5cGU4aVZaT3YydlVRS3F2?=
 =?utf-8?B?L25qQlMybjNSQ2c0bTQvZUM3eXBXNC9TZXpDT29uRGFIYzFyb2lyMFlrNzd4?=
 =?utf-8?B?RUpIYjNSRUdzY3gwWVpwbUxMT3VYQkhZMk1WbGlQRkhiSEVnQ1k3WDh1N085?=
 =?utf-8?B?eHdqT0lZcThxcGFFYjRaZ2kwaUszZm00QUdKV0lneURpeTRqK0RMOFRrZ1pi?=
 =?utf-8?B?czBYdDBnNkNvN0R1Um1qMVpDN0FvZGFMeHYwZFQwaEk1NHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3NTMXZScGNxNEFxLzJDN0V6ejh0YmJ0aWZOSTV3WDg5Nm4wZEt1Qm41dEx2?=
 =?utf-8?B?a0lEdS92YU5GS3BOK1Ewbms2V1cwd0QrWWU3ZU95aytXbGt3UVNMbCtUODBT?=
 =?utf-8?B?Z2ZlSHdyVkhIRVI3RXRHSEUxdkJMcVg1N1doNkp0Skp5TytKRzlSZ1hNaUpM?=
 =?utf-8?B?dXppTXhpM0RyVVZCL29pR1ErUDZDcDRZSFd3d3NvWnBQUlU3S3dodlN2WUs4?=
 =?utf-8?B?ZmlObTVzdnJxVkxXd3kyZGRzZWJaVllnb0VWRWlvNnl2LzRzNjZ0K3VrcXhB?=
 =?utf-8?B?SkJZTnN2VFlkN3NRM1RHa0d5L01QOWs1WFo2blg4a3U0RnZrYm9kUTZpd1Vk?=
 =?utf-8?B?R0NYU1JzbHhlVzJ5TkUwcDBlUnF2NmVJaXdhLzJNM3R2NzNpNkNCclB5U2Vu?=
 =?utf-8?B?ZTkyN0duR285V3RJQnZtY0xZWE40Y3p5NnFPQXNwRS81ZGdtSjM0Z0xJdkth?=
 =?utf-8?B?Z2FrMkpTaU5DVzJVVHEwdExuTkdkYkdNaDdMSjFPQ29VUGZFamJ0VHR1UWQ2?=
 =?utf-8?B?dWV0MUx4MjZ4c0lwNHU2WVZkMmhaODE0WDhyV1Rkb1NPRmo3UVd3cVlEZnV2?=
 =?utf-8?B?NWl3MDFDWmlkNzNXSVZEOW9XQmwvZlBSdktiWDlSOGJGVnc1b1F3QXpMT0hl?=
 =?utf-8?B?d015MTdxR080Q0ZTemJxUjVWUUhGcVZjY2Fqakw2aUNmbjZtSUVGaG9QOUdG?=
 =?utf-8?B?MVdGTTQxbzJXZWFMVCtFbmVEYndYVWFIMTdsb25GbzV2bU4vc3lSTTl4VzZX?=
 =?utf-8?B?U3Yra1RGMGF1d3JCTmY3eW1HVHhNUHBxRHRWWllBdXZUOEVvZTE3b1BaNXlz?=
 =?utf-8?B?WXhaQzlnSW9aVG1ZN3VDZi9EbjFGblRNUEgxY0pOQmdiQlhVSElCeU4vd2dk?=
 =?utf-8?B?dkFpRXBVcUtHSCt0aDQxbVpnVmdGNGRPVzhvaC9vbnRuWkUyaEhWWFdieDRP?=
 =?utf-8?B?dGRzVGlPdUhoNm1qTXdnbDJ5RHZmQ1BQUnl5cWZPOWtOT1hqbXlWdkJRVWN2?=
 =?utf-8?B?eFFyNjhuUXBXWGpMdEVyakRPcjNJWk5xQWJmeURaOXpnNUtZdkpQSDlUb3Yr?=
 =?utf-8?B?Zk1sZ3Q0dnRPMGRjMlNxd1BwZ1R4MnJ4NzkzNmRvSGdaSFBwZnE0TjYrZUtZ?=
 =?utf-8?B?aGhNbS9YRE1kRHFvR3RoRnRGK2ozRVRRU1lEZmFZSlRBaHFmcjRidGhlN2xR?=
 =?utf-8?B?NDYyZ3puaUFiejFOOHI4d2Z2TzFYWi9za2JqTTcxdHN3VFcwRkVYUmovQ0R6?=
 =?utf-8?B?SEpaaEVPenc4L0x5WVBRVWFxU09OTXZkQ1QydFR1dkhtYmNvWkhna3p5NTM0?=
 =?utf-8?B?M29kS2Rhamt3Z3A4L3UyenBSNGhhNGcxY1dXMlVkRTh6SEZNa3BENndJSmxt?=
 =?utf-8?B?eGlOSzZMU29zMGh1ZnNNQ0hBMzRxRzZsdEZFZlkyZXEyS0xva25XOWN0U0JW?=
 =?utf-8?B?MFFJVWZScmw2QTJLcm96enpPVG9WaW1lczFSdjg2WHYrTHhNOWtTTFlZcnNt?=
 =?utf-8?B?bHc3QmlSUmgrUDQrYk10R0RSclpOV3BaZUExQnNCTHZXSHRVV1N3cmo0WFps?=
 =?utf-8?B?UWRlcFdIaWY3S0d5cHVPLzZzV01udDhyYzhJZW96TGJpcTZxSFBXYlZGSXdp?=
 =?utf-8?B?WExiLzcySUR5cjJRVWxjUllVTlVXTFUvYWRJUmUrVnNGNWRYVUpobUdPVmtU?=
 =?utf-8?B?bXVJaEQya2FqUis2Mzl6YW0yRng4QklkcXZYMVVIM3hsUFR6TFJuUFJrbWFq?=
 =?utf-8?B?b1JpTFZqclBQaEVqYVZXNjlQdEtEaWtJVHlNejRTcFgxMVB3ei9TbjBuU2lI?=
 =?utf-8?B?ak5vN0tRNmJKUTF6RU4rSTdGZVJPNjJkckVaaU83cC9mZ2p1NWN0YnVQT2Ny?=
 =?utf-8?B?aE92cktzVmtJQkROSHdEcWo1M3NTZ1RscWViQlpzODRZdEpBd3Y5aU83Tys5?=
 =?utf-8?B?V2t3SWcxTWpncU9HQmkycG1wVE5sekNEWWFDeVYraWdyczhROFo3cVNtZUNs?=
 =?utf-8?B?a2NWRUVqdUF2OERWM2VwcHlkc0xBNkFvQThOYzQxUm5Vem15TXhCS1Ntc0RJ?=
 =?utf-8?B?cHFBTFdVdVRPVTRVa2xOZXhQV0ZkNXd4ZU9waVdXMkpQY2R1aVJjVWFmOG1U?=
 =?utf-8?Q?g5NHUJPs5uxO7oM6fXXnbSENW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a634f78c-92d5-4863-d2b5-08dcafafa541
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 09:20:10.6393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7mNV3EfuWPL+fdHzeoK+yg1KNC2Jye4AnLaWf/8THO+8FvgfFQORmQwWm+6VWARIUL6PZvUlSREu71UZEHB3+4yB1o2QimMpuFhOpLJRiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11848
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

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAyNywgMjAyNCAyOjAw
IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNS85XSBkcm06IHJlbmVzYXM6IHJ6LWR1OiBB
ZGQgUlovRzJVTCBEVSBTdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZv
ciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUdWUsIEp1bCAwOSwgMjAyNCBhdCAwMjo1MTo0M1BNICsw
MTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBUaGUgTENEIGNvbnRyb2xsZXIgaXMgY29tcG9zZWQg
b2YgRnJhbWUgQ29tcHJlc3Npb24gUHJvY2Vzc29yIChGQ1BWRCksDQo+ID4gVmlkZW8gU2lnbmFs
IFByb2Nlc3NvciAoVlNQRCksIGFuZCBEaXNwbGF5IFVuaXQgKERVKS4NCj4gPg0KPiA+IEl0IGhh
cyBEUEkgaW50ZXJmYWNlIGFuZCBzdXBwb3J0cyBhIG1heGltdW0gcmVzb2x1dGlvbiBvZiBXWEdB
IGFsb25nDQo+ID4gd2l0aCAyIFJQRnMgdG8gc3VwcG9ydCB0aGUgYmxlbmRpbmcgb2YgdHdvIHBp
Y3R1cmUgbGF5ZXJzIGFuZCByYXN0ZXINCj4gPiBvcGVyYXRpb25zIChST1BzKS4NCj4gPg0KPiA+
IFRoZSBEVSBtb2R1bGUgaXMgY29ubmVjdGVkIHRvIFZTUEQuIEFkZCBSWi9HMlVMIERVIHN1cHBv
cnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIE5vIGNoYW5nZS4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jIHwg
IDkgKysrKysrKystDQo+ID4gZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVf
ZHJ2LmMgIHwgMTEgKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yei1kdS9yemcybF9kdV9jcnRjLmMNCj4gPiBpbmRleCA2ZTdhYWM2MjE5YmUuLmIx
ODEyZjk0NzI1MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9kdV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9kdV9jcnRjLmMNCj4gPiBAQCAtMjgsNiArMjgsNyBAQA0KPiA+ICAjaW5jbHVkZSAi
cnpnMmxfZHVfdnNwLmgiDQo+ID4NCj4gPiAgI2RlZmluZSBEVV9NQ1IwCQkJMHgwMA0KPiA+ICsj
ZGVmaW5lIERVX01DUjBfRFBJX09FCQlCSVQoMCkNCj4gPiAgI2RlZmluZSBEVV9NQ1IwX0RJX0VO
CQlCSVQoOCkNCj4gPg0KPiA+ICAjZGVmaW5lIERVX0RJVFIwCQkweDEwDQo+ID4gQEAgLTIxNiw5
ICsyMTcsMTUgQEAgc3RhdGljIHZvaWQgcnpnMmxfZHVfY3J0Y19wdXQoc3RydWN0DQo+ID4gcnpn
MmxfZHVfY3J0YyAqcmNydGMpDQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgcnpnMmxfZHVfc3RhcnRf
c3RvcChzdHJ1Y3QgcnpnMmxfZHVfY3J0YyAqcmNydGMsIGJvb2wNCj4gPiBzdGFydCkgIHsNCj4g
PiArCXN0cnVjdCByemcybF9kdV9jcnRjX3N0YXRlICpyc3RhdGUgPQ0KPiA+ICsJCQkJCXRvX3J6
ZzJsX2NydGNfc3RhdGUocmNydGMtPmNydGMuc3RhdGUpOw0KPiANCj4gSSB0aGluayB5b3UgY2Fu
IGF2b2lkIHRoZSBsaW5lIGJyZWFrIGhlcmUuDQoNCk9LLCBJIHdpbGwgbWFrZSBpdCBpbmxpbmVk
Lg0KDQo+IA0KPiA+ICAJc3RydWN0IHJ6ZzJsX2R1X2RldmljZSAqcmNkdSA9IHJjcnRjLT5kZXY7
DQo+ID4gKwl1MzIgdmFsID0gRFVfTUNSMF9ESV9FTjsNCj4gPg0KPiA+IC0Jd3JpdGVsKHN0YXJ0
ID8gRFVfTUNSMF9ESV9FTiA6IDAsIHJjZHUtPm1taW8gKyBEVV9NQ1IwKTsNCj4gPiArCWlmIChy
c3RhdGUtPm91dHB1dHMgPT0gQklUKFJaRzJMX0RVX09VVFBVVF9EUEFEMCkpDQo+ID4gKwkJdmFs
IHw9IERVX01DUjBfRFBJX09FOw0KPiA+ICsNCj4gPiArCXdyaXRlbChzdGFydCA/IHZhbCA6IDAs
IHJjZHUtPm1taW8gKyBEVV9NQ1IwKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIHJ6
ZzJsX2R1X2NydGNfc3RhcnQoc3RydWN0IHJ6ZzJsX2R1X2NydGMgKnJjcnRjKSBkaWZmDQo+ID4g
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9kcnYuYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2LmMNCj4gPiBpbmRl
eCBlNWVjYTg2OTFhMzMuLjM0NTM0NDQxYjdlYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9kcnYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jDQo+ID4gQEAgLTI1LDYgKzI1LDE2IEBA
DQo+ID4gICAqIERldmljZSBJbmZvcm1hdGlvbg0KPiA+ICAgKi8NCj4gPg0KPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZvIHJ6ZzJsX2R1X3I5YTA3ZzA0M3VfaW5m
byA9IHsNCj4gPiArCS5jaGFubmVsc19tYXNrID0gQklUKDApLA0KPiA+ICsJLnJvdXRlcyA9IHsN
Cj4gPiArCQlbUlpHMkxfRFVfT1VUUFVUX0RQQUQwXSA9IHsNCj4gPiArCQkJLnBvc3NpYmxlX291
dHB1dHMgPSBCSVQoMCksDQo+ID4gKwkJCS5wb3J0ID0gMSwNCj4gDQo+IFRoaXMgbWF5IG5lZWQg
dG8gYmUgcG9ydCAwIGRlcGVuZGluZyBvbiB0aGUgb3V0Y29tZSBvZiB0aGUgZGlzY3Vzc2lvbiBv
biB0aGUgRFQgYmluZGluZ3MuDQoNCkFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0K
