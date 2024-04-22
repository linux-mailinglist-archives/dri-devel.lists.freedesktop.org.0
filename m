Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905F8ACEF2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1198112B20;
	Mon, 22 Apr 2024 14:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="XJENXlb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2051.outbound.protection.outlook.com [40.107.6.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE3D112B23
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta+WY3aD0+XM1+XJ+hMMRvQ2K2Hsw9hy+4xj7NNH75HgZYa8PXDXP2mpTApFhzx0ujoGA/ZrQGhyzy634ZjdDgkYil+8DAtziwDZAn1D9pDezNR+CX9sA3i5VU+4LstcLmI2nCPNxqSIpnch01wtYcX+/vuY+w4E2nfpPDhb9TEATAPKvEz3ingt8YuukdY6vp4LhP24LbN4Fr0ypL5eI3X7uRHeKEk1cAuOxb9DxbqQUoRJ/OhgdufH3+By0Zeeuv/lt3VgO1SxmX8qcv0Shayss1EUmwfO1C+y1aUABkHNl0TaclQrbwpV67RTSrdsOIovMpQ4XCHIU29v8x4HLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdmqwtQtSk9UIbTumldS94XyQBl2ogwVUoPeuBlp6gY=;
 b=Dy1NWOvC38KSVoCxnAbCKzuIF1FlTcP7chsdf/xTeKSP+5R4lJH+JKF/+pxie1+4LCRzpXRY2Uc+lpLqfU6ZYudhGZG4dO1AIZ8QNokrScjsdEsx722sVMkDHpWF1QlIcOmd9VQbteNtQAp+oEB8K28eTjo1IA5ErwJkpVXNxQOHFWAucZ3/Y9JoftBjp5Ui8M0w5HkOTdTU6J+rwhzY0jkOWj476CHv/Um9sRJJh9e74OOvywpzYQpesY+nToD+sxWLLR2/FgcdEEb2P7fFEgAJrOVjWkbotzZtunSm/3DeKP+uZ7PFIsk8SZxmm03oGMz7krT+QKBKnJyP2gMW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdmqwtQtSk9UIbTumldS94XyQBl2ogwVUoPeuBlp6gY=;
 b=XJENXlb5UB1yIggC3qfvJfZEnzm1bwFcbQW50EK6Gog77iNFcQtC8MdZ+wGe3xhm4EGMDV4caBg4RhRqmtsPbRaMw2UFtbJIsVS8uEwqBeu1Nsahp7Z6vjZVKOiiONYUVUQYJFy8r5gJYLx/CyPUmyF96Wb+2ctO9HoowwqnFnQ=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by GV1PR02MB10574.eurprd02.prod.outlook.com (2603:10a6:150:16b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 14:05:01 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::a909:d7c8:d64d:8c1a]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::a909:d7c8:d64d:8c1a%4]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 14:05:01 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel
 <kernel@axis.com>, Johan Adolfsson <Johan.Adolfsson@axis.com>
Subject: RE: [PATCH 1/2] drm/panel: panel-simple: Add generic panel-dsi driver
Thread-Topic: [PATCH 1/2] drm/panel: panel-simple: Add generic panel-dsi driver
Thread-Index: AQHakZjq7n98NUz4o0KggV8Zt5+IcrFuptmAgAWuf1A=
Date: Mon, 22 Apr 2024 14:05:01 +0000
Message-ID: <PAWPR02MB9281557BDDA960812412E0D59B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-1-461bcc8f5976@axis.com>
 <76b46467-6a27-4f07-8a3e-cdd51e2e28bb@linaro.org>
In-Reply-To: <76b46467-6a27-4f07-8a3e-cdd51e2e28bb@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|GV1PR02MB10574:EE_
x-ms-office365-filtering-correlation-id: 0a0fb4c9-21b7-404a-e8fd-08dc62d533ce
x-ld-processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?UlhZVGxwYWxxOFFIR1lqMXhvc3l4TkJ6QVRVUE5VbG5HQkVpQmZSdDBxc2pT?=
 =?utf-8?B?WEdTWkNpY3lvdCs4cElGUVU1cG44NC9yTTl2aG53N3hCMkRRa2lsRDFpeHBB?=
 =?utf-8?B?blJ6ZHhuNE1YK1ZHazMzNVplS09ERTBTT0VNbENFeUJhb1JWd01Oc3hzWkt6?=
 =?utf-8?B?YnlKbU9DclpnYWF6RTBUVmhwNUZVckllUldMaEc0eW5GRDVPSTNncEwzemY1?=
 =?utf-8?B?WVVWenlQYjhpV25rS3lCU085dUZ5NDJ5V1o5amJLT3NmaU1HMXRYQ25Tbkl6?=
 =?utf-8?B?TjRkVU9hOTVBNXFWMDN4aEUxUG5kRVBvNkVaVmUxTXpCeUFDU0toNmx4SG5z?=
 =?utf-8?B?eEM0aGF1dXh6eko5MXZmN2pvcGlVSUpvR3JWRkN5RDFKRFNNZmhvRGhTSUlM?=
 =?utf-8?B?OWJDN1dCbGJUSC9WRmpuUTIrcHNJYVRBaVZJOFl2Y3ViUHJ2RXlQa1lIOGZG?=
 =?utf-8?B?c1ZEcFFidVovMWo5V1kvOEpETTJFdm5JY2xkbW5OTG5aZndRNUVCSVhIcmd4?=
 =?utf-8?B?bkhYalBLcHpJeDRQQStTempFZnB2cFhRdjV2R1A0djhqN1Z4eFNES0I2cDNM?=
 =?utf-8?B?Q3N6MUl2VzgrdUExNmNNbm9wQ1dkbXRYS29WQXZkS096V2NhV0hSYUdwSE5V?=
 =?utf-8?B?SnRHWU14MTkwblhuT1k3VnNjVm44UUlDTmdEbzV2VU1SUWxDeDF2eU9zY1A1?=
 =?utf-8?B?ZnloaFhOcm5zQlNUaGFIeW4vbC9sdnZ2VnpVODZOTkUyb3lneVZDcGxvZ0J0?=
 =?utf-8?B?SE9obCtaZ2dIdktUNWwxQk5LVDVUeG56ZENYNjNFL0lTMEtJVWxSbDZhT0RM?=
 =?utf-8?B?WHhMUHlmT2l5bEJFYTJjNDF4eHNmcGZvcjFqNXVjTFNvaW5JNVlPS3dHZGZu?=
 =?utf-8?B?L0laZnV5eEVublBVN3NqMDNFSTR6L0svT3grbUZrOHpUM0UvMHlWWHppOGhJ?=
 =?utf-8?B?RFJ0b1QvOWNtOURwSzBhYXNJdDNGYlNUTFVDV2xvSC9tVW9vRkFFdnM5TURw?=
 =?utf-8?B?dVdrZjNHQjlseVJuNE1Jc3MxZWZ6OWlZN1RwVkxiTjRLb3JmNWs5TXk2ajVX?=
 =?utf-8?B?TnBUTjJ5SUl6eGdodWdwa2Z0Wi9hK1NNbnk4VGpaVkRUaFl6ZkhtRjVidW1q?=
 =?utf-8?B?Z0FYcHhHelNoNjhCVkdEOVEyNVBKY1Rpemtzc2tMcUFjaEwza1pWRGlHcWlF?=
 =?utf-8?B?b0xidUR0OGJxdlNNeWR4OGZtVHAwQ2RoRTVCTFlodXlseFRtaG1ONndrNDli?=
 =?utf-8?B?Y2UreHQybW4xUC9jWStySmRRSzIvcVh2ekVHUTgxM0RibkpFdWRkU2t0Y1Ar?=
 =?utf-8?B?ampDU2xydDdjc0d1cTc5bDJ3WU1UVmdkcDM3VHVlMjhpWU9FV2ZNNkh4WERB?=
 =?utf-8?B?czA3dDBTakU2aWpjNTMweEs3Ulg1Sm9zRVo5WEtoVWIvNGlLOEtZdkZxVWJn?=
 =?utf-8?B?SEI4WVpmdmlHclUzcjFQMjJWdkVuTzFBWDc5VlY4VTQyeHNPbFVhUDVZVFpV?=
 =?utf-8?B?SEhpWUg3eEx0ZVpDYTVJdEgzbEtqMHhpa1RTS1B3QXBaTmZ3QW9jbUhpTTMx?=
 =?utf-8?B?Ky9QOHZJUi8zSWZmcVlVUmNVenk2TDlXakNEOW93Q2hJd2lRN1lOVjgvc0F4?=
 =?utf-8?B?bUdLSkw0RWZwZXRBUU9ZcXNyTytvWnBMV0FNR2NoQSsrRTJXMlY3UjNhZEI0?=
 =?utf-8?B?Q1hXR0xxMkhPR09UNVFzaG1DQ2kza0lIaVVLMklDNDBVdk1Jd3RnVHkwZDlz?=
 =?utf-8?B?RUpZcTlSNmRRVjROWFRubVZQNzNZSmt2NTAwTWRnL2RQaThZNTNRclByMGR5?=
 =?utf-8?B?WXBqR1FRQUJLMDZwUjVqdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9281.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(1800799015)(376005)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2xuQ3h6TzdCdGluTFIydnpWeGd0VXI0NWdoVk1RejY3bGZuTUlLeGNJODVN?=
 =?utf-8?B?MmZQRVg2SDNOeFEwZUhnaGs4Vkl2SFg3V3dJT0xRTEdtQmNsMGJjVzFwMUMv?=
 =?utf-8?B?eXlZcEpZWWlCRkYrN0JWenNBV3h3R3UxU0R2VUVJK09xY2lkd0tsY0g4Nmcv?=
 =?utf-8?B?ZTdUK0hNM2Z4dlJtbXFJK2Z1TGNzNVV3U1pWelpkNlNyUjdGM1ZJbTlmTGdj?=
 =?utf-8?B?WEJBRlV2NmFOcDBuSXZHWGdsYjMwUndFRGE4SzhxZ3YrZWtIZ09WTko0alJJ?=
 =?utf-8?B?OFR1OUd1aHE2ZXdOSWtYWjBPbDhvVWZDcjgrb25BY1hja3h5dDR3cUpsZE5q?=
 =?utf-8?B?TEwwd2drMC9sUWI0U1VFcFBPV3BCbnFpbHFLcC9FV3lPMVJvaTdJNzRkdkIx?=
 =?utf-8?B?MDgvYUY0SmlaT0huUjVPRnJyWloxTmI4ZmdWd3NXQzlwUTJLbDN2Z0FiWFli?=
 =?utf-8?B?Y1g3UVZwb2wyVGJpa3dabTRNQ2VkNkl6a1k3YXRBU3RBaitYOGJ1ZHh2d0R4?=
 =?utf-8?B?NVppQlJDYW1JaTdxS2Z2V2FWWm8rWEZIQndUT2FsUG1wZlNXam44bTJYbW8y?=
 =?utf-8?B?aEZ0NEVJaFNMdXB5R1ZnditYMzV0Rk9EMlg5SU94Rk4ySGlXTEhHK1A0Z0tX?=
 =?utf-8?B?UHpaZGIvbkdVUXNiR0ZLZVkzb0J0aktWZm1zcXpvWSs2WkRQenArM3ZwYkhE?=
 =?utf-8?B?QnQzNFNIQkgyZkJFS1U0SmxCMWFPL20zMk1la2FQLy9SR2lveWZBNU1xZENY?=
 =?utf-8?B?OEZqV3ZodGttRWxySitvUTJ0RXh0Vi9xMWNGWFhJL2QzS2ZFdDkwTStReHVp?=
 =?utf-8?B?cTd4T3VMMFlnQmpLT1NhaWRNK2ZiVTY1dzg4bENBSVZWcGV3U0NHTTFYVWYv?=
 =?utf-8?B?MUJ4SVNTY29oSmtNcGVUK0t0MDMzQXphMWVIQmFBa3owSk9UcVhscU1LdnBk?=
 =?utf-8?B?OHVyOVBLeWhjenpVaEFWTkhFWnowZXdjOHB6Zk5HQ3lCWUVwSng3MThDRXRJ?=
 =?utf-8?B?NG9nTzFnWm1qWGZCY3A3S3VUSXVOSkJzSWQvNGJZZno5MzdqUENUTzJZbWRh?=
 =?utf-8?B?bkhGUkRNeERmVmJ0eUhETmNxaUoxUHkyVjY3Wnljbm1EbTU3UWJXR3N2MHAr?=
 =?utf-8?B?R3NYM3hSVEtYNTQ0Vm9udWFiZ0FQNzZ3UkJLbEhsM1FlaU9rYlFDS0dwaUNv?=
 =?utf-8?B?dW93WjMrWmdWVVk5YldtSHYwVlloem0xcmRkS1Fzc0ZBYVJxc3B1MllLQkUr?=
 =?utf-8?B?ZXYzbU5mRzlPU2tPcERvQVpaa3lBUUV6NklKN1FNMGZwcGdHZHJ0eFVXKzdE?=
 =?utf-8?B?STlkVlJ0T2ZqZWRJa2Iwa24rSGYraGExc1hCMGl4d1dmazEwbGdnU293YUFn?=
 =?utf-8?B?UUFYbVJxZVpTYzhVenczTy9rbnRtR3dTU3VMOUw3TWpSU3BkdDNOcmljb3ZX?=
 =?utf-8?B?TzZXa1pYV3JhV2NPMWlKeXU1aUNidWtXSnBFUlUrU21Za1pSMTBjL0w0TXRJ?=
 =?utf-8?B?elN3T1NRQ2FuVW9ob3c4NExnUXVXM3FCMlY2dGdpbnJLdXdOSUtCeHdrWEcr?=
 =?utf-8?B?UE52NVFYcnRRSFhyREVqRmU5KzVTT1k2bVYzZk1oYU53WWM2eWx6NVQvU3BU?=
 =?utf-8?B?RHlVOHFvTmJXRGhzc2JlN1FhT256bjljMHpML1VBWFp2b09vc3Q2c005NWRy?=
 =?utf-8?B?QVFUMUkreEw3WWxwenhrSnh3c3JPZ1ArY3laaHNBNExqb1VEQTVJRktJb0Z0?=
 =?utf-8?B?T1lVUjY1aFJ2b3UzSXdTM0p5eWUvNW1HUUpncHRwNzZkM1VpMzkxb2I1UGdw?=
 =?utf-8?B?NUVHdkZaRUlLTGUrb2NRTjFsN2w2eUJJcWtsMFRXWFEvRVE0WFdkenFvbzRO?=
 =?utf-8?B?R0JOSVVRYmZSM2FLOGdkdThXZ0tWT3ROR0UvTFZwazhIMFNvVkVSYTFyL2dR?=
 =?utf-8?B?TnFsUDdxaEFaa2J4dUh1QXk1SXNja2dXbnh0eVVQN283UjUyTXFIbkVGbStJ?=
 =?utf-8?B?OWt3YlRWRkhOcUg1TzltckI2bjFtQkphazhmOFU0UGpJMGhWR1NJWkxsK1B4?=
 =?utf-8?B?ckczNzZLOHI2b2ZpMmVFbWpSaWhBMzVETlJ6aEFza2wyNm1DdThXQkkxdmI4?=
 =?utf-8?Q?5k1k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0fb4c9-21b7-404a-e8fd-08dc62d533ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 14:05:01.5964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xK3oWTBKcBt6CjH6W3HPmE0a8Lcn4gr8R2BU0IDd6djCVw1jTWJsrq1gfqKmDfhd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10574
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

SGksDQpTb3JyeSBmb3IgZGVsYXllZCByZXNwb25zZSwgc3RpbGwgaW52ZXN0aWdhdGluZyB3aHkg
dGhlc2UgbWFpbHMgZGlkbid0IHJlYWNoIG15IGluYm94IGFzIGV4cGVjdGVkLi4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4gDQpTZW50OiBkZW4gMTkgYXByaWwgMjAyNCAwMTowNg0K
VG86IEpvaGFuIEFkb2xmc3NvbiA8Sm9oYW4uQWRvbGZzc29uQGF4aXMuY29tPjsgTmVpbCBBcm1z
dHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBKZXNzaWNhIFpoYW5nIDxxdWljX2pl
c3N6aGFuQHF1aWNpbmMuY29tPjsgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPjsgTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGlt
ZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+
OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+
OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBUaGllcnJ5IFJlZGluZyA8dGhp
ZXJyeS5yZWRpbmdAZ21haWwuY29tPg0KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBrZXJuZWwgPGtlcm5lbEBheGlzLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBk
cm0vcGFuZWw6IHBhbmVsLXNpbXBsZTogQWRkIGdlbmVyaWMgcGFuZWwtZHNpIGRyaXZlcg0KDQpP
biAxOC8wNC8yMDI0IDE2OjAxLCBKb2hhbiBBZG9sZnNzb24gd3JvdGU6DQo+IEFkZCBnZW5lcmlj
IHBhbmVsLWRzaSBwYW5lbCwgc2ltaWxhciB0byBwYW5lbC1kcGkgdGhhdCBjYW4gaGF2ZSBpdCdz
IA0KPiB0aW1pbmcsIGxhbmVzIGFuZCBmbGFncyBvdmVycmlkZGVuIGJ5IGRldmljZXRyZWUuDQo+
IEFkZCBzb21lIGRldl9lcnIoKSBhbmQgZGV2X3dhcm4oKSBjYWxscy4NCj4gDQoNCi4uLg0KDQo+
PiAgCQkvKiBzZW50aW5lbCAqLw0KPj4gIAl9DQo+PiBAQCAtNDk5MiwxNyArNTA1MSwyOCBAQCBz
dGF0aWMgaW50IHBhbmVsX3NpbXBsZV9kc2lfcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAq
ZHNpKQ0KPj4gIAkJcmV0dXJuIC1FTk9ERVY7DQo+PiAgDQo+PiAgCWVyciA9IHBhbmVsX3NpbXBs
ZV9wcm9iZSgmZHNpLT5kZXYsICZkZXNjLT5kZXNjKTsNCj4+ICsJaWYgKGVycikNCj4+ICsJCWRl
dl9lcnIoJmRzaS0+ZGV2LCAiJXM6IGVyciAlaVxuIiwgX19mdW5jX18sIGVycik7DQoNCj5UaGlz
IGxvb2tzIGxpa2UgZGVidWdnaW5nIGNvZGUuDQpJIGFkZGVkIGl0IHNpbmNlIHlvdSBkb24ndCBy
ZWFsbHkgZ2V0IGFueSBnb29kIGhpbnRzIG9uIHdoZXJlIHRoaW5ncyBmYWlscyBpZiB0aGV5IGRv
IGl0Lg0KRGVidWdnaW5nIGNvZGUgb3Igbm90IGRlcGVuZHMgb24gdGhlIGRlZmluaXRpb24gSSBn
dWVzcyAtIGl0IGhlbHBzIHRoZSB1c2VyIHRyYWNrIGRvd24gYSBmYXVsdHkgZGV2aWNldHJlZSwN
Cm9yIGFzIGluIHRoZSBjYXNlIGJlbG93IG1pc21hdGNoIHdpdGggdGhlIERTSSBkcml2ZXIuDQoN
Ci4uLg0KPj4gIAlkc2ktPmZvcm1hdCA9IGRlc2MtPmZvcm1hdDsNCj4+ICAJZHNpLT5sYW5lcyA9
IGRlc2MtPmxhbmVzOw0KPj4gKwlvZl9wcm9wZXJ0eV9yZWFkX3UzMihkc2ktPmRldi5vZl9ub2Rl
LCAibGFuZXMiLCAmZHNpLT5sYW5lcyk7DQo+DQo+SXMgdGhpcyBkZWZpbmVkIGluIHRoZSBiaW5k
aW5nPw0KDQpBcHBhcmVudGx5IG5vdCB3aGljaCBJIGFzc3VtZWQuIE90aGVyIGJpbmRpbmdzIG1l
bnRpb25zIGRzaS1sYW5lcywgYnV0IEkgZ3Vlc3MgIm51bS1kc2ktbGFuZXMiIHdvdWxkIGJlIG1v
cmUgY29ycmVjdC4NCg0KPj4gIAllcnIgPSBtaXBpX2RzaV9hdHRhY2goZHNpKTsNCj4+ICAJaWYg
KGVycikgew0KPj4gIAkJc3RydWN0IHBhbmVsX3NpbXBsZSAqcGFuZWwgPSBtaXBpX2RzaV9nZXRf
ZHJ2ZGF0YShkc2kpOw0KPj4gIA0KPj4gKwkJZGV2X2VycigmZHNpLT5kZXYsICJwcm9iZSBhdHRh
Y2ggZXJyOiAlaSIsIGVycik7DQo+DQo+RG8gbm90IGludHJvZHVjZSB1bnJlbGF0ZWQgY29kZSBj
aGFuZ2VzLg0KDQpBcyBiZWZvcmUsIGl0IGhlbHBzIHRoZSB1c2VyIHdobyBoYXMgYSBtZXNzZWQg
dXAgZGV2aWNldHJlZSBmaW5kIG91dCwgc2luY2Ugd2Ugbm93IGdldHMgc29tZSBtb3JlIGNvbmZp
Z3VyYWJpbGl0eSB1c2luZyBkZXZpY2V0cmVlLg0KV291bGQgaXQgYmUgYWNjZXB0YWJsZSBhcyBh
IHNlcGFyYXRlIGNvbW1pdCwgb3Igc2hvdWxkIEkgc2ltcGx5IHNraXAgdGhpcz8NCg0KDQo+QmVz
dCByZWdhcmRzLA0KPktyenlzenRvZg0KDQpUaGFua3MhDQoNCkJlc3QgcmVnYXJkcw0KL0pvaGFu
DQoNCg0K
