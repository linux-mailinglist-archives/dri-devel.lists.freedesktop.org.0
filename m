Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9249C0425
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 12:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D2A10E809;
	Thu,  7 Nov 2024 11:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XyX/YL4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C83810E807
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:34:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBlAOvfjGo2qikz7K60kbe6ACrTNmeYNhVCGLeIKpRpm328/7ZGe2VUVztj5FeuMjz+zP9VeVvviM7sZGMwbRgiZV0jFpqbyWuk1uIfBdhmgaa2hf5gUGjmjre9T3DhjFkfmAKvpcNMFlfN9mONNpkwF5aU0CoX8vXb+9CMfDt6k0/HAbk4SYsclOBb5BTSPpWJNhaogCZtDQXXPFH/rSh70++uCTx4Fyd/JlIIo8yjWc2neZySuZBKnfs0mQD6Mcqpl0X7eC67MkIiqy/Ve+5EHu/AXgn8oIqSIEgcHsj/KPzE0DfP1Q45qYd9czZfMCw2D3xTdvBrctxCeEUaEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maeqV8jfjnyp1um9XBFQgl//A6F/CR1upcnVgQczFGE=;
 b=KImZe4X3eel6r7s05lHx9B6tGX3R/ThloQLg3X2rgUfE9bZrPawXPLyQjiBqKhJZNi2wLA6Xr0cctqYOKvrqIsBFAXEt7rD71E7QG0TUBx8tqcJyewSmEC9yj7ttOuHU8C2Li5UrYk4C+XiFBMWvN2uRYk2G36UJWHckWVAVPOA6iI3FMfYLY0hD/GUSRf1ANO/AEFMrkeDVUKITrovASKDvfSrrDPFATsPsTODIpiYgi0jtBdiDnP0njvf72/bbROhBSaTdfzi8A+vSkLy97Fof3ZeZLsJKwxCk58Dj8SWvicKoxnsmJuRCmCuGfv54Es0TrZhYxxMl9ehIK/VA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maeqV8jfjnyp1um9XBFQgl//A6F/CR1upcnVgQczFGE=;
 b=XyX/YL4XU99CkSeOH6I8DuxZKzhphCD6NU/KehgJeT9KCpgZgzosu6ViYcltGu0rLoBYbI9IJfNPv27EhoQ6yYlyq6N8j9N1789U6R58suABpLycystXPhmDy4Xlgg2HNFAbKdTIwrCF3CC/Gl7RXS8XYPaUbVkx4Rl8In3pexs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8161.jpnprd01.prod.outlook.com (2603:1096:604:173::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 11:34:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 11:34:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
Thread-Topic: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
Thread-Index: AQHbMHyssRJlYpgFi0mhWOO1KBseZLKqnQ+AgAETcoA=
Date: Thu, 7 Nov 2024 11:34:26 +0000
Message-ID: <TY3PR01MB113461669E3AD282356A77EFF865C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWwf4iqUsOA+XajoAcN081GG95muA3m_ZxRp-BemSmajQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWwf4iqUsOA+XajoAcN081GG95muA3m_ZxRp-BemSmajQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8161:EE_
x-ms-office365-filtering-correlation-id: 07e2301e-7c50-4a77-59e7-08dcff202278
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Q1hTL0Urc2cwbjB1Vi9WQktsb1NGamhYNlMyM01BWDdzQ3BsbDFOR2VGZ0o2?=
 =?utf-8?B?b2lHM0lVaTBFUUtTZkhtZXpQK3N0aE5Ra1FQZkp4N2hjRGJwWVpOMnZKTE1t?=
 =?utf-8?B?UUZ1SVh3MENlMDhyWFcxZWZkVmhTV0NTR1kzaXI3MXI0UENFaWR5SlBEcHU0?=
 =?utf-8?B?K1I1aC9XQ1FsZG5jSkR4UjZwTUFOWVFzWmQ0MW4vWjUxRmVWM2dTcUJFOFFU?=
 =?utf-8?B?dG5UUzRianZyeFhxZ3FNRkhYbElVRUVZd01ScDBIYWVTUTR1SS9RR3BQcFVB?=
 =?utf-8?B?Z0xuTDRGRm5ENzdEekxtOUtCZ2JVSE9kckdHYnUxenBaVW11dE9FazBLVWZu?=
 =?utf-8?B?MUprc09rUlg5WTdybThrdkM4WFMvMERTbW90M1NJTEdYTDliRkMxam5DMzF2?=
 =?utf-8?B?bGdKYllZZFI1ZnQvYXpnS2s3ZGxsVGxkZHU2SCtJRVdQMW5uV3JSV1BtdXcw?=
 =?utf-8?B?cmlpd1RFN1I1RnJOTXNYaTBVZDU4b1U2R3RHaUJWSFZPVXUxUStyNm5vM0Vl?=
 =?utf-8?B?Q1dMSG9kcmpLVnZCaC9zRDBMS1VpR1JwSWhsRWh6d1VZZFNGRXNkc21sbTF3?=
 =?utf-8?B?THA3ajEzT0xzY3lndkRObkk1T0tsUUMwTkJOUHBKUHJlTzlTNm1idUxmSjV3?=
 =?utf-8?B?K21wOTZIVDdkYnJ0a3ZOcStlbUp4bVY0ZUg1M3BBNGxBb3pobE9IeU9jYnlN?=
 =?utf-8?B?Y1g2RlhwWEdDVlNOemdaMWgvSndFOFUrSnYxdXZmSTh4Q0RZUXVjSUx4SkNK?=
 =?utf-8?B?QUxKM2pwVERMUHM4czRoTUlIZVVrSmx0clRuaVFDb3lWdTNJZGZGcjcwcVBh?=
 =?utf-8?B?NUEvZ3htMGRMRkFiMDFIYXVBdHNwZUZ2cVc2YUd5WkwyN2daMjl3Vi9RM2lu?=
 =?utf-8?B?NGprd2hQTnEwU2Y0dncvVkN2Y3lqWmwvd1g0Qm4xUXBXcDhPY2ZteThrc1NN?=
 =?utf-8?B?QmZwUFpHa2cwczhjdEYyVVlqVXdyNjI2SEloZkNlN0pEUjFhZXV4a0oyc0Rq?=
 =?utf-8?B?T1hiODM4V2xNUWNvNmR0dE5KdjBmNUhaL1Q4S2ZEd3NPWnFQY0pRbzFmeUhz?=
 =?utf-8?B?dHdBeWFQYVlHUVE5bi9nS3hWWldVZ2taVzEwOG8yV1RzaFZiNTFPOUlJdnZy?=
 =?utf-8?B?YUZ3NFVNOWpDYm9RdW9EalhweCszSGFUOVhsVkJmYVQ1S2ltd1RRdTIxYU8y?=
 =?utf-8?B?aUU5TmNzaGRNdXVlV2lpQ08rK3RERTRPekJqSWtScjZoUXJsUTh5TXJtOVk0?=
 =?utf-8?B?OTdyd1MzazlndDFuNytGMzkzanNVc2VUOW55NWdKL0pTOTJCT2F6Sis1SHdX?=
 =?utf-8?B?MVdHeWdZUDBqSHdOT1plL1hhWVJZdUI4eE9EWUIzaVVCamVQUE1oazNFR2Ux?=
 =?utf-8?B?Y05nRGROemZ1bXBjeWFEWTFvcEk3SkE2c1BjVEcyeGc4L2Zlb2Z3UXZXRHda?=
 =?utf-8?B?WU1zV3I1WnorSkptL21aeGxlQS9Ec3dEZjFjWmRSSnJVZzViUjRuR2RIeTNm?=
 =?utf-8?B?VkdZdVEvTEhnZjdzc05ucElWSXA5YU9ZSUFiM0ZzbXJ5UGx6TldYVG9KUkFx?=
 =?utf-8?B?ckVtM05sZ2NEWHNwMnFRZ2JDbjErWERzT3VuMHZwU3RaTDNtS0ZlWUlZY28w?=
 =?utf-8?B?NXJmS3pEeFdDSW9oMDJmcFV0Y2U5cmRxNFRsbVB5ZDRjUG9RTnFHWC92SGto?=
 =?utf-8?B?ZmtHV0JOZFY4b0tEVXhIMUUrdHp6clJlMW1RYzUrZGdEcFMrd0VMdzZmVU9s?=
 =?utf-8?B?UzRHWHBYbzN6SW41UTErbythVzdoVzB1L0RrbmFxbU04SzdwV0ZsejVYd0tP?=
 =?utf-8?B?Q0YwODlrZ2hOUS80Mk5nbHVPUXdybXdrSnlzZ3d2SmsvdnduVXdVbGJ4cWUw?=
 =?utf-8?Q?1DlbclQ3yXRpM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnBhMXZxSzI1NjY1c2RpQVVLQTlmTmxab2hMVTRBa3RPRjYzbzN1T2hWbnBp?=
 =?utf-8?B?STNtb2VybFJWNEpJTzd4TFhFK0JUcU1ncGdkb0ovTHVCOGZRRzh6S3VFL1Fn?=
 =?utf-8?B?aGM4aXhtaUg3a0d6TEtDM2hWWTVFZi8xT2pBVEhzRy9OZFBRZnFCdENydi82?=
 =?utf-8?B?bFFQalY5MlhDYXNzVWNHWXkvN21Ta2hVNThPYm8xRWJZajFMWjU0anFiWHRp?=
 =?utf-8?B?c01JNEJsUHk2eGpWY3FvTnhtdWJsc2wvNGFxaEIyQkJ5ZnpvSDNycmFzWm1p?=
 =?utf-8?B?TjZvVnNMZG5seEtlS3FQUU4vYWN2eGpnSTdpWUdrcGdtMGptMDdzT1FPRms5?=
 =?utf-8?B?VEo2RnhJM0tGQitrdytrUXJHWjJ0dUxYa1UySE40c3pTNzM5S2ZhVTR3OEMr?=
 =?utf-8?B?aWY4dmJTUWRmblk3emYyb1k1eWNUZVBXSUpCN1Y2RHY0d1VTSjNFdEhrRlNT?=
 =?utf-8?B?K1lZakgrY0lEajM4bGJVcmY5MFFoK0I2NW9XNTJYUmVhVXhFZnVWeGxMbTI1?=
 =?utf-8?B?UEZtNlFPbHpiRlpmN2ZCaGx4WFVSY1VzbHFCWllvNnZhbVNMM0NnbHVQcld5?=
 =?utf-8?B?QWN3eXJRZHdnWmRwUzN1bkt5aXlkTGQxYTZUSHBTVkZUWlBhazZ6bTZJc3N1?=
 =?utf-8?B?TzRsYjdpbk1WUDdHNG55Q3ZEd212dVdPZE5qZ014OGdjaVptQ1doZXBBUS9W?=
 =?utf-8?B?bmtkdHo1cHc3bVY3c012Tm15M2JiKzRhZ2RkZElGU1ZiNzR1MFVCUXBianJE?=
 =?utf-8?B?eEgwRW5ieElxakVncWdTSFpzZDcwWVpFdHRKU3lPMzEwbFNneG5ULzBxTWFB?=
 =?utf-8?B?bm92cUNqMmlHSXpaRDlZQW9XNWY2OVVxV3RmSU45cHhxRlFMN3pLYitRTVZE?=
 =?utf-8?B?dVJoWndlZWxBR3JnN2ZRMjluS0xWOUcwdHQ0cUF5RkJBb3A1akZCSHNoODlm?=
 =?utf-8?B?OFc3Y1Iyc0ZWOXFNMkdmd3BwR3FCeEIwUTVGajJNWE9pVGJ5WnFBa3Y0Ynpo?=
 =?utf-8?B?a2ZWTmFHZkxkcmhNYXJPMk1xZmM2TFdTdVg1QldFRkMxMmJITnNVNzB5a1ht?=
 =?utf-8?B?TlBmQTlhOUtpRXNaWVJtWmJpTXNFTzY5Mm51UVpZdE40Yk5hZzFvc1p4a3lr?=
 =?utf-8?B?WUJXb3pFMXRhUWEwcjd0QnFFeSs5TUZmSnNXdXFGUHRSOGJlclhhTzFwWFRs?=
 =?utf-8?B?N2dJSHpxb3dac2h2UEZ5Z2czSkE1MmtMM2UyM0F4OFpCQkhaQSs1T3BaTGNy?=
 =?utf-8?B?OC9adVArQ0ZlMzNrTEFjQ0Q5WDVRUzlZRWtUWDgvb1haSWNVamlrN1Q5eFY2?=
 =?utf-8?B?L2YxR2lqV2pHOVJqVHlTZk8veE1tWjRRcDVCeVRHWTNQUktwUXB5UytEVGZR?=
 =?utf-8?B?eWdnM0VUcnZ2SlZ4V3I0aTl0TWp5a0F4WTh4NFBlc0dSLy80VlRxbEQ3OUth?=
 =?utf-8?B?SEcweGdnclhHMFQvaHZQY2dNOVpMdUozTkpJbGx5QnpJYjJ3NlVUQk9vM2p2?=
 =?utf-8?B?QkhhR2Q3L1JmbHpYMmFnT3BmQUVyaGRzQ1ltb0hnTERhV3AzdkxUR2FaNjRu?=
 =?utf-8?B?SEtFQXVQV0pPSGVXeGk5WlZUeHd6UU5zRkVxTXNGbFl0NXZiRjFRZVk0SlJs?=
 =?utf-8?B?dFdJbVZSaDAzR1dPVVZTczdEK0hqTWxnYi9Vd1c2TUVwdEdOc1RzRmVCQWMr?=
 =?utf-8?B?OVltb09ZdUVCbXhyV0lSOWZEeGQ2M0d6Y2dvUkhZTTVHNDJCWGNGSzNhRDRl?=
 =?utf-8?B?VW15RVUzbzRmRXZyUkJOb21QRytiZ0ZaRml3SGdjTDl2WlhFNnpRdXZ0eDdV?=
 =?utf-8?B?YmFwWU5oQnR2MVh3eWw1Wk5lWkpkYm9NMXZHblVTUW1EaExhRlBhZ3NQS3d0?=
 =?utf-8?B?US9oK2MvOTdPVkxZUkYyV20wN0ZNdDNWNHdCWm5pS2paa3ZIUWZTczduTlZo?=
 =?utf-8?B?UXdaT1N6cUlYY3RlYzI2STExVTJPV3p1ODBjT0JjUSsyNnZkSEFWbkx3eWN0?=
 =?utf-8?B?d01iZFVHTlV1cllkVDR1TXJWOG12d2JWVEcwZnoybVR6ZENGTjdSTXVKSith?=
 =?utf-8?B?WWwxUnIxd1VXSzQ3NmlkSXVRY0xHVjVjUTQ0WVI1L1NrZ1JwK0w2elpmejVQ?=
 =?utf-8?B?RytxTVA1Y25NSWpkeVk2U0JGeS9vVmlRdTU1Skg0Smdjb1ZGQ1JVMEJ3UU9E?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e2301e-7c50-4a77-59e7-08dcff202278
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 11:34:26.1994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+EdICm2ckgFIA4g2Y04HJGMINVKMLLIynPrJg0l4XfOC/SW8Tk/W5o0JUmNq9NGT3Mxgb6mOHO//hJDfziOnTVve/4zTkrqLodpRF209NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8161
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

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IE5vdmVtYmVyIDIwMjQgMTk6MDcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAyLzNdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBhZGksYWR2NzUzMzogRHJvcCBzaW5n
bGUgbGFuZSBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBOb3YgNiwgMjAy
NCBhdCA3OjQ54oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiBBcyBwZXIgWzFdLCBBRFY3NTM1Lzc1MzMgc3VwcG9ydCBvbmx5IDItLCAzLSwgb3Ig
NC1sYW5lLiBEcm9wDQo+ID4gdW5zdXBwb3J0ZWQgMS1sYW5lIGZyb20gYmluZGluZ3MuDQo+ID4N
Cj4gPiBbMV0NCj4gPiBodHRwczovL3d3dy5hbmFsb2cuY29tL21lZGlhL2VuL3RlY2huaWNhbC1k
b2N1bWVudGF0aW9uL2RhdGEtc2hlZXRzL0FEDQo+ID4gVjc1MzUucGRmDQo+IA0KPiBUaGUgYWJv
dmUgaXMgZm9yIEFEVjc1MzUuIEZvcnR1bmF0ZWx5DQo+IGh0dHBzOi8vd3d3LmFuYWxvZy5jb20v
bWVkaWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24vZGF0YS1zaGVldHMvQURWNzUzMy5wZGYN
Cj4gYWdyZWVzIDstKQ0KPiANCj4gPiBGaXhlczogMWU0ZDU4Y2Q3Zjg4ICgiZHJtL2JyaWRnZTog
YWR2NzUzMzogQ3JlYXRlIGEgTUlQSSBEU0kgZGV2aWNlIikNCj4gPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZw0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gDQo+IFdpdGggdGhlIGRlc2NyaXB0aW9uIHVwZGF0ZWQ6DQoNCk9LLCBJ
IHdpbGwgYWRkIHRoZSBsaW5rcyB0byBib3RoIGRldmljZXMgaW4gdGhlIGVzY3JpcHRpb24uDQoN
CkNoZWVycywNCkJpanUNCg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0KPiBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
