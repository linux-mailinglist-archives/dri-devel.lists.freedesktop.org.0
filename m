Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20395ADEE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7010E774;
	Thu, 22 Aug 2024 06:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Zdnxzj8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2069.outbound.protection.outlook.com [40.107.117.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A8210E774
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYv1c/aOCa7v1PxowGrcKFR856SCOD0H9qMwsSyI7218zhlXpGxwiZl6PTNN6kNaqyU1aiIZQTDeWFqc1QGZW/R84yMr+H45xoaBe5cKPDs3WZK44rCmYfm6v6QhG7gcP/Lw3qqH9ouLflraweXAp042wJ3tvo7Oas2AdNmvTTTSI4IiHBabwRhsf+inG7qk2GVoDKpZVZj6dsEnxoWKVxvitb4WheobvS6i06bS+omgf29UniABR+qt2YlJdMtr/pLj4EoCmLOvUIoJkRMJx2Uf/2NbNlePRKzX6LPZktgqVaOjify3MVpCxX8je/6IEpBMOFNkf4NA9f/4Je4Gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xrncj7DkdCML+vqfjdRbsv1WMrQxmfprpgCNYjLPfY4=;
 b=VcJHQrRWVC1YtsYp1C/ZY88Gis3CLMynDsL58eZAoEWwemiWS9O+MXfnbRhhDNcvMHBkxT1CTDfri4pN/m6ybipao2q08ugtcUA1og0613jTRURjSqJaSpLYuSy/Rm3TOSq+jm2KBHUUaPnqrns2FwwEgZZC20JZ758SE0bknxfvz5OhYO0XAdVR1K3MIMBpOZoqEJbtuvF0A6PE2Vj49oGHnNUQ9OQh46yyLJAuwq/IrEK+tdJKjy/xtCk+8I0CutX0lnR8sAKOva/oQZaOKwihodyqx3oISlRliknZ2mYe0rvGGu8zXPQN3HXYvJf/LLS7u1XxZICjFjZX8+iw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrncj7DkdCML+vqfjdRbsv1WMrQxmfprpgCNYjLPfY4=;
 b=Zdnxzj8COU/W3CN8ndCSGHP72VDdnTdGd+L3IKWha/uffJWgIMm6V9cTBEyN3eYTvRwvlNSsW76pNTDVsJ2ljDzeo43S6rWvOoJEQJV5JgtR8MjoCFFp/KKguZs81w66IVS1xl62OeG/IhbsRrLh0+OHzsFl2KPS0WuUjYvwHc1LP7f8JYnVC3Q/gwbzpwdsfUvdycNg++L5ZDW2hH0qhzfe1V5Ad3O5i6WP6ANWRPVZl+5Ggk7SfNbE3zZ43J2pvFUk73rhf5Q2FDYphLouyG9czeoUjKI8gTNV1CO1598yZDuXSLsdw+F2L0eUhoSUhKjDgaTKW8Q3Qunt6P7lLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB6440.apcprd06.prod.outlook.com (2603:1096:990:3f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.22; Thu, 22 Aug 2024 06:47:32 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:47:31 +0000
Message-ID: <f4c41561-7faf-4455-a748-8fc43b866011@vivo.com>
Date: Thu, 22 Aug 2024 14:47:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Anand Moon <linux.amoon@gmail.com>, Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, opensource.kernel@vivo.com
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
 <CANAwSgR8i2BbNkQtDXTWi+kOfWtxwHe9E=sLa_8ZSU2bvTO-Yg@mail.gmail.com>
Content-Language: en-US
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <CANAwSgR8i2BbNkQtDXTWi+kOfWtxwHe9E=sLa_8ZSU2bvTO-Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: e864e268-89e8-4a41-0c44-08dcc2764bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|81742002; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0ZJLy9WMW9USzBVa2NLSmp6YUF4STkrWVFXV3NENHBSOE5UVFdnUzN1aUJh?=
 =?utf-8?B?WG9SR1NzQU1aSzZvTXVGa3FaUUpFSzVTdWJ3Y0g4NVdNckcyKy8zbnhTTUlX?=
 =?utf-8?B?cEFEN3hWT3p0c2l5aU5aR1hoUGUwOHF0WHVTeVBrRERIaGNxNEJ2K3pVUTVa?=
 =?utf-8?B?elgvaXRtVFJoL1Rmemh5ZGQyaFFmbXVTa1pkOGp5REhrVzhOcXEzSU5TVVBt?=
 =?utf-8?B?YU9TZHovcVUySzdrQzAyRG1uRGxpT29MWU1TU1BiRkdxYXc1WHI3cytCM2VY?=
 =?utf-8?B?Q2d1M2VIUklxcmtNWlRwNEtWUFhOM3BpNUhzVTMxaTJwcGcyRGQ3Zjk2cU9S?=
 =?utf-8?B?b1FxWlJjSUkrZW5Vbzd1SHpZQ0wyN1dkVXRYOE9VTWhUUXZHRUV4UXFLV1Y4?=
 =?utf-8?B?MTA4N1h3aHJpdUNoaWZCc3owdUhpQnJJVjVjY2oza1ovSkowTTI4VGlRUllI?=
 =?utf-8?B?TENOKzZYWGtocHY4SGx0VzMrdFI5V3hwVHloRUkvV2tLNlI2dm90ZUZyWXV6?=
 =?utf-8?B?UXBKYk1kQzdPOWp2SDZHTkRFUGdEQ3V1Mno2NTBCOU1rUXZ4WUlNeEdraVlz?=
 =?utf-8?B?WGx5TUZWUzU3VWxPOCsyZXBpN3JvYmZnVkhDSjd1eFVzM01sY3cyVXZ0c29w?=
 =?utf-8?B?V3MyUFlYYm9zODF6dDBrSFo0YklkRXdlb0VRMjd3WndSQnFoMFA5ajRzTWpW?=
 =?utf-8?B?VGp0b0lRMEZ2SEI5c09KaHZvK1I3V1EvdjZ2YjA4b0tFQURzdURwT3RrV29L?=
 =?utf-8?B?TmEyN3Y4OGhxOTlMZENFOG9WN3UyRFlORFYvRjNzd3dVTURvcmdUd1JjUDQx?=
 =?utf-8?B?eVRtOU42Ums3b3QxVTBLNnVGb2ZZd1QzcUhTU2gwcW15V3A3M051ZFI3bTJC?=
 =?utf-8?B?MUZTaUthYlNPSlFGdHEzRXNURWs5aEFydTcyZEtMN0xlUWpsOVYyM3MvR0pF?=
 =?utf-8?B?MzU2UUlUNmc5Y1Z1b0VqUnBGNUY3a1FVbnIrZHJoNlY2TXBKUVJFUVpLaFEr?=
 =?utf-8?B?eEUweDNEKzVpUnliQWVoYURBVnhYMnpaOHNJQ3ZvdElUcDlRMU5TWG9wTlI2?=
 =?utf-8?B?SE1ENll0Z01uNHBXVTdpMlJYU3dxRGZibFA4eDVZVHNGVmJOTU9NMW90a1Jn?=
 =?utf-8?B?VzhOcTFlaXZueXAwNUt4Y2VtaGkrbXZ4QnBkU09wZ1VldHZxTkx5aVFOZ1dE?=
 =?utf-8?B?Q2JVREY3VGdXbVZ1aG9jRG5jU2h2cFpGUHp0Nks5OEFiaFdicmpxVy9SejVj?=
 =?utf-8?B?bmxkbGpDUWNudkFEbTdRdzI2ajQ3M0tKdS93NS9nY1ZYaGlnRnpBVTJUalFy?=
 =?utf-8?B?RlV4clZCZjdORjFxQy9LSTltbmpoTjd3dFRxZWlKNlRZZUQ5T3ZnSXMzbzFv?=
 =?utf-8?B?MjlpdU4rZlVQRTZ5UFJaNHZuUWk5Ym5TT2x2dnFIOFFmNm1Xamp6OEE3RGln?=
 =?utf-8?B?ZDFGUi9abEVtYm4yUm12N3QzdWVCY3lyMUZ5d2tGdFpCNjZZYnFOUzcvcTY3?=
 =?utf-8?B?MXc5eDVXZm1MamtXcWEzSHd4SktvRkFFM1VOMVp2a2VyU256alNRQTFzSnBo?=
 =?utf-8?B?ZzVnRVdLanRkK08yWU9ZSEx1Vjk3WXFZRkYySFhxa3FtYVNaMXhLRXVuUlM3?=
 =?utf-8?B?WFRLQjIwSHZFK1lPdVRiQnVsY2FTMUExNVpyQ1V0bTh0QVc1Q2tFdGduYXc1?=
 =?utf-8?B?OUljcG9aRUdOZTErdklmSGVFT0k2aWFZR1BKbUFuZ3FSeGtkZWFrSDVwY0ZE?=
 =?utf-8?B?OWZYeklWWjNWQmI5RS9Pc085VSt5RmozTW9MbHV2MjVBL056TnlUM2pzMnIz?=
 =?utf-8?B?ODBQRW9SWEl6NG9pNk1KbDNHT3RRNzNRdXAxVXBjMHk1di92R0IxZFFOSGdY?=
 =?utf-8?B?TWpMWlZaREhzTkNlTG5JWUQyOWdYUm12NXBSQUtId1lyL1hkd210RXhJS255?=
 =?utf-8?Q?/RH3LJYpV8c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2NCR0haQUFYSyt2SlBlZ0t0QkFCNlhXRTZyd3NrTDBCdlhnNFQ1dWJ5MXdR?=
 =?utf-8?B?SDF0dGJJTWVyZFBLM2EwTW5iWVJQU3BMYU5VN3owYSt6KzUrYWs2cHhCOTdt?=
 =?utf-8?B?bHRxQ0czeUkwZms3YkhrT1ozTnVPaUNtQnVYMDZxcWc5RUxIeVJIVTdpOXVr?=
 =?utf-8?B?amphOGMzK3pmaFBpZHFmV0F6N1pRYXVua2x1NnZTREVGUi9hNng5VURBWG54?=
 =?utf-8?B?SC9yMFI0T0tFbUtta1NmVVRNZ1pwVWExWU9KRFdZZ3ZUcEFqeEczOThidTR0?=
 =?utf-8?B?RHBvYVg5dU9IQWxHMUpOTnFiSFB3bVVLanNiWXdVZGsvaXUreHFvZlQ3S25M?=
 =?utf-8?B?SzZISUNDYU5MbTJjUDJ5UlJEZitFMjdNSkNLb1lLcWVHNEJUcjZNbzJQOGZl?=
 =?utf-8?B?dzFqUVJ2SVZOd1F1UmNCaUNNTFRtVlV6SlZ5bGx2SUtzeS8yZE1Va0J0V2V1?=
 =?utf-8?B?b1FuOVZodlVONHNSUW94YmlhODNuN0VxVnFmaHNaL0Nsc0F1UXNOYmdSYytX?=
 =?utf-8?B?QnZvOHhVR2w0MGV4MXNCVmVVbGpGWjRkU1crNktpbFdCdjcxUlNMZzZhMUVX?=
 =?utf-8?B?NzRoSGV2TkIvVElaWTJyYmhxN2tsUHcybWNEWDloNXp0RFQvbGZJbnpjSDhF?=
 =?utf-8?B?THJiSnArVFlwYjRxOVBwL3ZyVFFUcEp4aFo1b3JuUzM3eWxkd29veURSK25n?=
 =?utf-8?B?N2FkU296ZHlrODc2RVFVTDExTUlvR1Y4dWNiRGdmSGMxNkdjbTIyNGIzbWdq?=
 =?utf-8?B?bkhUSjNNdjM4VGZtNTNLdFFWL3Y2YXZOM3Q4ZG5teExKd1ppVEVlZFRhaEFS?=
 =?utf-8?B?Wm8rYmZYR0JuZmVEcFRzaDZ6dE81WmsxaDcrNjNIWVFHYVlROFNFTDA3cXdV?=
 =?utf-8?B?QUg1VWM4Q3EyRW92Z0JrRUU2bXpsQndhY1dXempjN2JpSDU3VXJZay9mY0kw?=
 =?utf-8?B?THVSRXJhd096dkdFRUczMElNWkQzeGlESzA1RHBIY0kwVnZvQ216dVFGbm15?=
 =?utf-8?B?TkxLd1BJazlScW9LSHlPd3VkM3FpUHNwMFJCNlpYMUdUQTJ2Z2tvZzN3Rm5i?=
 =?utf-8?B?Rk1lUGxBWlUrSUxOYUYwSG8raDdMdlFFcGxFRnZjZXQ0UFZqSlFLU3NCMno1?=
 =?utf-8?B?NWJKTDFaN1M0YmhVaUZlNGJwa1hDWVJXdXNyV1dyTUppVU9ad25KSDNsMU85?=
 =?utf-8?B?NnptTjhqQ1lhYTVsVVdJblBRTDVLUWFOV0VyWHlWbTZ1MGNFdWVkVmRiZHpH?=
 =?utf-8?B?cEd3ZkFXdmtoN084bFRNWUhRWGNOby9HaElER3Q5QUk2L1U1cWwwSmtRb2dX?=
 =?utf-8?B?SEdQTlNJQlA4TUh4WHdnSTVabjNDcUNCWjY4Y0JtYjJUNHJsMnRiOHNKSlhN?=
 =?utf-8?B?NkQrb04yTHU2KzJLa0hlM09KU0tyRUNqZDh6T0F5Q2NLMlJCbVNYalpYeEs4?=
 =?utf-8?B?RGt0QTFsVzB4UmlHVTVNNU1weEd3OFRESnV5THFFUCtiNXBpMHVSbkxib3JP?=
 =?utf-8?B?ZWNCSlFBMUVkbkpjQzR5N0FlRGR5OGFRcmFJTTlnMjljaGhubDBvMlZSRDhE?=
 =?utf-8?B?M3c1bGk3Mm8yWHQydUhNNXNFeG85bkN4R1Zxd2l4R2IreWZ0b1ZTNVUwWDNx?=
 =?utf-8?B?dFAwTC9JMVN3MUF5bmtSaHRBY1BaY1lZemE5TEd3Ti95OVpLc2lTYURaVXF3?=
 =?utf-8?B?aTdJZis4cE9UNSszMmlaQjh2RjF2elJpSy8vR1Bpc2czbUFqM3Rwb20zRW0y?=
 =?utf-8?B?OTR3R2tNT3M1OWFJNmdTM2p6SFpXdFZPOElGaVZ0ZStjRUFJQ1VzcklHZ0JC?=
 =?utf-8?B?UFBiYnhvYmtUOWZRSElyeDVpNGtnME1GZE45OEgvbm1iRmJVUFpxUkViOTVK?=
 =?utf-8?B?Tm5TWUJEbG1ENngwRGIweTJQcldwOU4yRHQyWml1QWNUM25GeWtlZUtPYXB6?=
 =?utf-8?B?RVNwYi84SHZCbG9nRXlOQTRpVWFJSUJCN1dCV2hQSnRLUDBFK3hIOHIwVkVV?=
 =?utf-8?B?aEUyR2crL2Y4SzNkV1hLcExYbi9ZVlBJOE00aitzWlM5ZmlYd3BocE1kQkk4?=
 =?utf-8?B?VVF0YzhwbmozSXI0eW1Qc0tLMklDVitUeUFRSUdqQ0lJa0hsdkR5TzBwOXoz?=
 =?utf-8?Q?QKR5WIOJpFn5W+RpK0rKyj44o?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e864e268-89e8-4a41-0c44-08dcc2764bc0
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:47:31.4124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwmBXaxCQBSx5I1V+A5/oVd9sU26O+nx1qqVKkbqN+fOClox7vUvL9qD7g/GCLils45aEFt2RO+iZXjcVTQ4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6440
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


在 2024/8/22 13:32, Anand Moon 写道:
> [Some people who received this message don't often get email from linux.amoon@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Rong,
>
> On Tue, 20 Aug 2024 at 18:30, Rong Qianfeng <rongqianfeng@vivo.com> wrote:
>> Replace devm_clk_get() and clk_prepare_enable() with
>> devm_clk_get_enabled() that also disables and unprepares it on
>> driver detach.
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> ---
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
>>   drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
>>   drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
>>   3 files changed, 10 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
>> index ab6c0c6cd0e2..057dceaf079e 100644
>> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
>> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
>> @@ -284,16 +284,11 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>>                  return PTR_ERR(fsl_dev->regmap);
>>          }
>>
>> -       fsl_dev->clk = devm_clk_get(dev, "dcu");
>> +       fsl_dev->clk = devm_clk_get_enabled(dev, "dcu");
>>          if (IS_ERR(fsl_dev->clk)) {
>>                  dev_err(dev, "failed to get dcu clock\n");
>>                  return PTR_ERR(fsl_dev->clk);
> You can use dev_err_probe it will be fine in all cases for clocks.to
> get enabled.
>           return dev_err_probe(dev, PTR_ERR(fsl_dev->clk),
>                                  "failed to get duc clock\n");

Good point, Thanks, I'll send v2 shortly.

Best regards,
Qianfeng
>
> Thanks
> -Anand
>>          }
>> -       ret = clk_prepare_enable(fsl_dev->clk);
>> -       if (ret < 0) {
>> -               dev_err(dev, "failed to enable dcu clk\n");
>> -               return ret;
>> -       }
>>
>>          pix_clk_in = devm_clk_get(dev, "pix");
>>          if (IS_ERR(pix_clk_in)) {
>> @@ -311,8 +306,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>>                          div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NULL);
>>          if (IS_ERR(fsl_dev->pix_clk)) {
>>                  dev_err(dev, "failed to register pix clk\n");
>> -               ret = PTR_ERR(fsl_dev->pix_clk);
>> -               goto disable_clk;
>> +               return PTR_ERR(fsl_dev->pix_clk);
>>          }
>>
>>          fsl_dev->tcon = fsl_tcon_init(dev);
>> @@ -341,8 +335,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>>          drm_dev_put(drm);
>>   unregister_pix_clk:
>>          clk_unregister(fsl_dev->pix_clk);
>> -disable_clk:
>> -       clk_disable_unprepare(fsl_dev->clk);
>> +
>>          return ret;
>>   }
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
>> index 0d342f43fa93..f263ad282828 100644
>> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
>> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
>> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
>>                  return ret;
>>          }
>>
>> -       drc->bus_clk = devm_clk_get(dev, "ahb");
>> +       drc->bus_clk = devm_clk_get_enabled(dev, "ahb");
>>          if (IS_ERR(drc->bus_clk)) {
>>                  dev_err(dev, "Couldn't get our bus clock\n");
>>                  ret = PTR_ERR(drc->bus_clk);
>>                  goto err_assert_reset;
>>          }
>> -       clk_prepare_enable(drc->bus_clk);
>>
>> -       drc->mod_clk = devm_clk_get(dev, "mod");
>> +       drc->mod_clk = devm_clk_get_enabled(dev, "mod");
>>          if (IS_ERR(drc->mod_clk)) {
>>                  dev_err(dev, "Couldn't get our mod clock\n");
>>                  ret = PTR_ERR(drc->mod_clk);
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>>          ret = clk_set_rate_exclusive(drc->mod_clk, 300000000);
>>          if (ret) {
>>                  dev_err(dev, "Couldn't set the module clock frequency\n");
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>> -       clk_prepare_enable(drc->mod_clk);
>> -
>>          return 0;
>>
>> -err_disable_bus_clk:
>> -       clk_disable_unprepare(drc->bus_clk);
>>   err_assert_reset:
>>          reset_control_assert(drc->reset);
>>          return ret;
>> @@ -80,8 +75,6 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
>>          struct sun6i_drc *drc = dev_get_drvdata(dev);
>>
>>          clk_rate_exclusive_put(drc->mod_clk);
>> -       clk_disable_unprepare(drc->mod_clk);
>> -       clk_disable_unprepare(drc->bus_clk);
>>          reset_control_assert(drc->reset);
>>   }
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> index bd0fe2c6624e..ebf00676a76d 100644
>> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> @@ -507,19 +507,18 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>>                  return ret;
>>          }
>>
>> -       mixer->bus_clk = devm_clk_get(dev, "bus");
>> +       mixer->bus_clk = devm_clk_get_enabled(dev, "bus");
>>          if (IS_ERR(mixer->bus_clk)) {
>>                  dev_err(dev, "Couldn't get the mixer bus clock\n");
>>                  ret = PTR_ERR(mixer->bus_clk);
>>                  goto err_assert_reset;
>>          }
>> -       clk_prepare_enable(mixer->bus_clk);
>>
>> -       mixer->mod_clk = devm_clk_get(dev, "mod");
>> +       mixer->mod_clk = devm_clk_get_enabled(dev, "mod");
>>          if (IS_ERR(mixer->mod_clk)) {
>>                  dev_err(dev, "Couldn't get the mixer module clock\n");
>>                  ret = PTR_ERR(mixer->mod_clk);
>> -               goto err_disable_bus_clk;
>> +               goto err_assert_reset;
>>          }
>>
>>          /*
>> @@ -530,8 +529,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>>          if (mixer->cfg->mod_rate)
>>                  clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
>>
>> -       clk_prepare_enable(mixer->mod_clk);
>> -
>>          list_add_tail(&mixer->engine.list, &drv->engine_list);
>>
>>          base = sun8i_blender_base(mixer);
>> @@ -592,8 +589,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>>
>>          return 0;
>>
>> -err_disable_bus_clk:
>> -       clk_disable_unprepare(mixer->bus_clk);
>>   err_assert_reset:
>>          reset_control_assert(mixer->reset);
>>          return ret;
>> @@ -606,8 +601,6 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
>>
>>          list_del(&mixer->engine.list);
>>
>> -       clk_disable_unprepare(mixer->mod_clk);
>> -       clk_disable_unprepare(mixer->bus_clk);
>>          reset_control_assert(mixer->reset);
>>   }
>>
>> --
>> 2.39.0
>>
>>
