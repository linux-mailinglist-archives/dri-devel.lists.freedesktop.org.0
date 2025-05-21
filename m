Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E2ABF6D2
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EFA10E99C;
	Wed, 21 May 2025 13:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AXWmN5do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993DE14BB2F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 13:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuS3vBx4sf8Y1qbiHg7dEVuxHl/auZNK4RpVzXfaBGbSEBnyJC/OLcplapb8wjF87R2OzBQcOWKVGsLlIjzeYdD3Ntt4NT2iz5wPjNL04PcCnMD2FOukwH08iraI0tl1xE0lVuIZ8kXg53F1jgytcAAVhV6L1QLrKfja21Ds4o9pM2cRfc/mELCv+xsvqypnQY1oVWjBwj4jDApzt0MzTVhy0lQXPTMEIxKy5qwED34xN1hhwPaocIjtqguMNBRX5SUabX17RKApvZt3pwD5OEsmlXaDoZfYM3SWNjkyTtHt6YtMVNo/hEkrfkYP+B0zTPIuvv/tHpWc1tj5QH54bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0IAZUG37GmcF45LCvXdsdHZe4lcS+edTTpSQDuXmsI=;
 b=auvoho1XuA8QmiofqWmnPcXSzxDOhPM6K6Zd/YDh1aiTC5LMKfmh1A1C1Y+uz22/nVdhwcNhHHSjdWPiUEioVqFLMB2+UN+t0OmrdqaopuVnG9QxnBx8+Sgj05H8+lbhG2irC82eI1f/a1n/BKg7ccKu559HFnugx79uGiI1kU+OpbOVyzfMJBWwDej/4ca7+i3HVJWKfOokl1qlPFSn2DahnZKG2P6M95eopsX3lQhGZgyZxGzx0ROPNbrzM+0BMYBkydObqFdvZmQY3dFwtIf+4c3vfBcgmPhDd5rBRyKJN3MpQyXJP71hcUZ5mJDQIfuxJhh/LCxOf4UgvfhSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0IAZUG37GmcF45LCvXdsdHZe4lcS+edTTpSQDuXmsI=;
 b=AXWmN5donizhS/GIK8lBbq7upu2furIXCtBXqOmcaJtbgH0OwsCeLXWTnTvKfByeCx/VAaft2TaY0V7OvM4qQrw23Jjt2pS8yRGWWXjqhDrq8t6YoBwlBZ2mNN59prfKauYoQQzPKw7Bi6X6fZin+Bg+8ZRC9kc0T+B2EcxDYxI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11170.jpnprd01.prod.outlook.com (2603:1096:400:369::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 21 May
 2025 13:09:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 13:09:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
Thread-Topic: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
Thread-Index: AQHbw2sH7JQ3ssFP3U+4Hk6OqDzNc7PbnMuAgAF+YICAAABLgA==
Date: Wed, 21 May 2025 13:09:18 +0000
Message-ID: <TY3PR01MB1134658EF30F722E82266AB20869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250520141645.GE13321@pendragon.ideasonboard.com>
 <CA+V-a8uG_5U_1XHJLQKRn3wgK4VBDJwV9_7uHtGC2j76pEbJ5g@mail.gmail.com>
In-Reply-To: <CA+V-a8uG_5U_1XHJLQKRn3wgK4VBDJwV9_7uHtGC2j76pEbJ5g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11170:EE_
x-ms-office365-filtering-correlation-id: 0bc562a9-1b7d-4978-7387-08dd9868b235
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a0xTQklObGtHTEtidThqdUdxSDBhU3dBSFM2L3RvQlA2ejFUcjFJelN1STUx?=
 =?utf-8?B?RUpSMkVnbjlzVlJWUnI2endBUUw0WUNVYzREbW9oVzlEYWdjME5zeEE4dGt2?=
 =?utf-8?B?OWF1S1N3TVU3TDRnV3YvTVppTmlGRW9BcTZ0Z1FaczJLQ0RrUjBZWFZzRnlN?=
 =?utf-8?B?aElnMnNnQUpqN2VPd0w4QmpDalJCZEdBOEVReDIwbTBPcVBwZ2NLSzhpTGcw?=
 =?utf-8?B?dElDanpjcDZOeDJRK0tKZFcwQUowQ3pmd3J5OTc0VkExTE5NNjNSRmdlZVBT?=
 =?utf-8?B?Y1IvdmM1SEVtNDk5SnlWZm9QRHhQTEN0WW5PM1NqTm5neVhQTXJ4VENVbFlm?=
 =?utf-8?B?SkIxMjVCZ1dYRmRJbktidUhaZ3VGU1JzZ3k4aVR6QnhYQkpNQVJPaVNlQTNz?=
 =?utf-8?B?UnY4Vi9lY2hmKzc3WHRTdjIxSVlrcis5cVVPRERWTGxtZjJRT0F4Mnp4YmlH?=
 =?utf-8?B?U1VYbDhBVFVDWXd0Y1NlME5TcDFvNXFwSGk4R0Uwa0IvVm1rMlczVE1FMFps?=
 =?utf-8?B?T250N3k0T3NIUERjSzJoYzBucFJDSUhRTnpRdVFCNDZsKzdPbi9qVGRrVmw2?=
 =?utf-8?B?dHFWeHRidXpEMGZqcjVOTDBWMGtXNG1WS3ZJazlJa2hReWdTWUxKOGhzNFZN?=
 =?utf-8?B?UkpxRkRsWUdSSVRySU9ya1hoSlZYbVNMQWdFcTNPTTMyUDgydlo0bmFReWVy?=
 =?utf-8?B?aWgvMjViNzFOenBrei92MytlRFFIOVJlZ3F6N3hTNzR4MUUxODFxSGh1aXdN?=
 =?utf-8?B?S1VTeUVCLzY5OEdFVEdranB1UnNjVFVSNDlFVlBQMVlwN1IzY2ZBVVhtV002?=
 =?utf-8?B?ZjZLazdHYU4vWHM0RW1DN1l4K3VtMW9lSlBBYW9sNjVLNnlLWWQzRFFvMG54?=
 =?utf-8?B?V0V5KzdHUHlIaFZkd0RwN29XdTVVMGprcnl3c0lZM05BNWRFcVhwNGpUdjhs?=
 =?utf-8?B?aEh6bk5wdVdSeFM0UGVHNEZzWVNFMlQwdGtyWlRYTkZNUGY5ZFZaQVVHUEhn?=
 =?utf-8?B?S0QvUFY5ZHE3V2twM3hOeHd3dktmYVFKbndrbXZSS3VEV0JiekhRSHZJdDFP?=
 =?utf-8?B?MVMrRlYxNjJhZ0dGOTZPQTFnT3dVekxKMnZhc3FHRnMvOXAzcEpPYi9zY0do?=
 =?utf-8?B?Q3VNU1IrWUN0ZldzVUFnNVBTUkxvV1VPQkNBOU1wTXFGc0ZUWUt5NlRlRVZ6?=
 =?utf-8?B?a0VZdGVZM0YyT3BJTEYvZU8yeS9oOWVHNUQ3VTJldExJTzR6Z3I1RnZGbjJw?=
 =?utf-8?B?dWs3b0REdmpIUVU0aGNVTElIY3Y5dkhCSFhUa2pDRlBOY3NMd2p2dHc1ZlpT?=
 =?utf-8?B?cUVGUXhZZnRyaktpOE0zOTN6QlAyU05RUE1iTm51Z2NvUXRUbDVjVVRFWU1K?=
 =?utf-8?B?MVpTMTlUaWt3WHp0K1pLalRqK0Y3L1RMQjI2WGJYUVIyWUZlWGxYRHJDcGw2?=
 =?utf-8?B?d2ZlQ1phR21ETktSbzBNSkE1NTNETlU0MCthMHJrTEFnbWpySVhxY1BJRCt1?=
 =?utf-8?B?UDFOMU4vdTV0WGl6VlpVZzR2Sk1BTVNFeUhmYWljRWJDUldmT1QyYXNhQUYr?=
 =?utf-8?B?YXIvSHpLU1JIc2VoZURXNUE3dktuK0lJOFlxaEt4MjVWY3VMUnJZcHFlUHZ5?=
 =?utf-8?B?RlhxbERwMm1DM3Y1TzE5SlNxYmwrVGhkTm83V3hFbTd3NzBJTUs3aHhiREhF?=
 =?utf-8?B?d2tHVXZFSVdpTWRtYmNhNWRGTXA2RWFhWHdxK0tRMlovWGp1aUgxMHVSSU5J?=
 =?utf-8?B?eEJBZ1VITTZZSGhHdlFiY3dLVnhraUxCNzJ1Z1FNVWFQVFhJLy80eDRHNWxN?=
 =?utf-8?B?cm1uVjh6S1VIUnk5RVlLbU5UVkF0RFdEQTh1aWtGKzA1dzJPV25nbFMwcFo1?=
 =?utf-8?B?S0hPL0ZJWjBCcS9xVmphbG1MMkRXQllLM3Y1M0RaN3BwNUpCQTJtejNTUHVL?=
 =?utf-8?B?dlRGWEhsV1dzRkx2em1XUkpkSE9QZWJjd3d4MFZScitCWCt6ZGpvOTF5TzVi?=
 =?utf-8?B?VDNudGdJbU9RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1VrRFMwVlBrWmdFUVpPV1NUTGFaV1I4NG43c01uQmNOVkIzTDNjOWtza2lE?=
 =?utf-8?B?T1dOb2o1blU4NWRNOXZIL3pqS2JjRlkyNEJLZDNnQUZQZU8vRUJoenJIKzFB?=
 =?utf-8?B?TVZLTVJUQjBmNHBpVXFIdFZMaktnWGZEOU1NcUJKSXg5MTAxck4yLzBCR215?=
 =?utf-8?B?NTVjeG9yeDdZbjNxc3dJdmpEWFJJRjVid3lUc1NSYnZnZW9jNTRUR1h0d2Iw?=
 =?utf-8?B?M2ZHSjZKUXZMSUx2V1B2akZmdE9kSTE1YzU0L3dRdzZRK0NOeXhnRVd6WlNP?=
 =?utf-8?B?QWpnZk9BKzFYWldYVXdDQmxaV21XQXF4MTd0aVhKTEhmdkhoSHl5WWtuaDVo?=
 =?utf-8?B?dFJUbUdBdjlrcUFsd1oxazIrNXhLL3dGWm9GYWU0N3ZxU0xMenR4aS9ialp4?=
 =?utf-8?B?RTZSWUhSZFRXZm16YjRRVUJMQ3J4SE9GSlZCUjVNdTdpUk5zSHFncGdYcytW?=
 =?utf-8?B?UlptRCt2MDF4em1mNlJtekQzNjFGOVQ0eDYvZ0o5Sko0WC9yNG94RnVJRWFa?=
 =?utf-8?B?Ym9OOEdIY080R0lRTGRNczJPbmowaVI4QTBlTDFST0lTK2xWdiszYkIwR0I0?=
 =?utf-8?B?ZGxvZDl0czhTMXhsRHRJa2VKZXl1WkU1enVEV3h6MWJvWDJzcXNOcDZIL1pN?=
 =?utf-8?B?eVRWQmVMMnJ3OFRVR1RGUkl2RHdtVVRRejNVdWRHZHdWRTlYZXVkdEdsQVpY?=
 =?utf-8?B?aHY1SHgrVkJGOVptalVDcThNK1NvUi9CYjNWelR2N3lPNXVoV2JjamxTUTU5?=
 =?utf-8?B?alRwMEtqWDAzZ2YyOE1taytPVVZ0a0JKaDRLRmpZZGVud2ZJNEQ5TUtQZWE2?=
 =?utf-8?B?UkpCTnE0aXpZR0F2L0VNUExzWUNWNEZIaDVQWEtxb3Y1R1plNUFOVm9ncjBn?=
 =?utf-8?B?OTZMUHp6YmpsSkl3WnQ1YjdBM3lHOERrelpMWFoxVDNWdDIwUTNPRlhtajlY?=
 =?utf-8?B?K2hJYjZrOXROKzRBaTAzWXJjLzQ2YXJZMjRrN2M5N2ZDeU9YSmFZUjFWa1c5?=
 =?utf-8?B?anZHNTgxYmhKVGlYNjkwcWlGeUEraENpWjRkbUU0R2JHZ3k1Qmw3WG5jZnpO?=
 =?utf-8?B?ZjZObmcxVml6ZGhSK2RpRnRuSTl5R2hZamlkSlRBTGIvRHRyWFhsSEpnZDJo?=
 =?utf-8?B?V0hyd3Fndk9HOVUzQjJYSS9Qd09QOXJoUm02WkdrSHNjMjlCMGtkRXVldmdx?=
 =?utf-8?B?dFNITVlCU2NqRmpoUGtuU0JjelNaenVhNCtlZ2p1OE9qdlBVL2FqQnNTQ1Q1?=
 =?utf-8?B?WUR5am05dk1XUmE2aG1XVUJvVzFzRjhvOHo0UUsvRFVNN3VaTHB5TDlqTkpq?=
 =?utf-8?B?UWtnbEQreGVPTlFRV3Iza2RQQ1hmWWFUVVFVUFljWlhvR1UwZ0tkeUFxMXIx?=
 =?utf-8?B?VDJpZXQrdThXR0xESGRuVHRJSXdvZ2hFM1lhdDhoT3AvbUZ2S1NVcjBqNlEz?=
 =?utf-8?B?Y1Q4bVJZb0JHcXB1YTlVekZSRW15SXZGejVsZHY4UHJXcmliMmRnT0Nmc3JH?=
 =?utf-8?B?U3kvMXhYSjVpQXFJbTJxV0IzNGdYSUR1eVd6ZkFsZ2FOeUIxT1FLWXg2dG9i?=
 =?utf-8?B?WnBFOUhEeTVwYWp6TnBNTktvWEFVOHYvKzNwdHUrUVlTVVNIckY1SllVWlFk?=
 =?utf-8?B?NmVJbU1TbTRsNGRSMkFXbmdKUHVDbmNGT2QyaWJ6bGVFNjdyVWptbDRacXlr?=
 =?utf-8?B?UDdmakNVNzBsTXRGSFduMGFWMG5XdnNwNnVRV0U2L204R1V5V0x4VXQ3Wkha?=
 =?utf-8?B?MEtLc1hsTm40UzNuMmoxNEUvRTdtUmVYdk8ydVZnK2QvMVVNUzd0WjliamF0?=
 =?utf-8?B?YXMxajdDQUs0M0wzTHB1NUd3V2xDYi9CanpFZTBFNEdmTFFXYlp0Q1IxRTZ1?=
 =?utf-8?B?MkN3RjFwSzdDV2pHaWJuUkZIdTR1VlU2UUJoSzIvR1M2U3NmdEtwcDFGenZm?=
 =?utf-8?B?Mkp6R2tkZDEzSWpaZFpFRWpEVEo4M2tzMkRGNjFWR3FjazQ4NHMwTTlhVC80?=
 =?utf-8?B?WWR5Rm8rZGJkUzJ3bnVpUitpd0twcXlnOFkvNmpucTN5dXFMMDAwcE5QRVpk?=
 =?utf-8?B?Q3pUOFNEVklzTm1zRWFSVU9idU54NERxOTk0NENLUDNUUmRDVllDZStEbWhD?=
 =?utf-8?B?T3duTTNneVQ0dUhRVDZGYlB2TUtuR3NBV2lsWTdwVk56SElTQU1ZUDFlZ0Jv?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc562a9-1b7d-4978-7387-08dd9868b235
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 13:09:18.9791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSJ6bl9+sLJcic0kEtNHlMexEuVq39sVkstscxMJvhXzF6X1YCmwjUZVK4sHeLtCi9DxRn/Vb/AaKY8LyBbI9Fhbc6tOFk91DkS5r4nX8X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11170
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAyMSwg
MjAyNSAyOjA1IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMDUvMTJdIGRybTogcmVuZXNh
czogcnotZHU6IG1pcGlfZHNpOiBVc2UgVkNMSyBmb3INCj4gSFNGUkVRIGNhbGN1bGF0aW9uDQo+
IA0KPiBIaSBMYXVyZW50LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KPiANCj4g
T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgMzoxNuKAr1BNIExhdXJlbnQgUGluY2hhcnQNCj4gPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQcmFi
aGFrYXIsDQo+ID4NCj4gPiBPbiBNb24sIE1heSAxMiwgMjAyNSBhdCAwNzoyMzoyM1BNICswMTAw
LCBQcmFiaGFrYXIgd3JvdGU6DQo+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gVXBkYXRlIHRoZSBS
Wi9HMkwgTUlQSSBEU0kgZHJpdmVyIHRvIGNhbGN1bGF0ZSBIU0ZSRVEgdXNpbmcgdGhlDQo+ID4g
PiBhY3R1YWwgVkNMSyByYXRlIGluc3RlYWQgb2YgdGhlIG1vZGUgY2xvY2suIFRoZSByZWxhdGlv
bnNoaXAgYmV0d2Vlbg0KPiA+ID4gSFNDTEsgYW5kIFZDTEsgaXM6DQo+ID4gPg0KPiA+ID4gICAg
IHZjbGsgKiBicHAgPD0gaHNjbGsgKiA4ICogbGFuZXMNCj4gPiA+DQo+ID4gPiBSZXRyaWV2ZSB0
aGUgVkNMSyByYXRlIHVzaW5nIGBjbGtfZ2V0X3JhdGUoZHNpLT52Y2xrKWAsIGVuc3VyaW5nDQo+
ID4gPiB0aGF0IEhTRlJFUSBhY2N1cmF0ZWx5IHJlZmxlY3RzIHRoZSBjbG9jayByYXRlIHNldCBp
biBoYXJkd2FyZSwNCj4gPiA+IGxlYWRpbmcgdG8gYmV0dGVyIHByZWNpc2lvbiBpbiBkYXRhIHRy
YW5zbWlzc2lvbi4NCj4gPiA+DQo+ID4gPiBBZGRpdGlvbmFsbHksIHVzZSBgRElWX1JPVU5EX0NM
T1NFU1RfVUxMYCBmb3IgYSBtb3JlIHByZWNpc2UNCj4gPiA+IGRpdmlzaW9uIHdoZW4gY29tcHV0
aW5nIGBoc2ZyZXFgLiBBbHNvLCB1cGRhdGUgdW5pdCBjb252ZXJzaW9ucyB0bw0KPiA+ID4gdXNl
IGNvcnJlY3Qgc2NhbGluZyBmYWN0b3JzIGZvciBiZXR0ZXIgY2xhcml0eSBhbmQgY29ycmVjdG5l
c3MuDQo+ID4gPg0KPiA+ID4gU2luY2UgYGNsa19nZXRfcmF0ZSgpYCByZXR1cm5zIHRoZSBjbG9j
ayByYXRlIGluIEh6LCB1cGRhdGUgdGhlDQo+ID4gPiBIU0ZSRVEgdGhyZXNob2xkIGNvbXBhcmlz
b25zIHRvIHVzZSBIeiBpbnN0ZWFkIG9mIGtIeiB0byBlbnN1cmUNCj4gY29ycmVjdCBiZWhhdmlv
ci4NCj4gPiA+DQo+ID4gPiBDby1kZXZlbG9wZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8g
Q2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjQtPnY1Og0KPiA+ID4gLSBBZGRlZCBkZXZf
aW5mbygpIHRvIHByaW50IHRoZSBWQ0xLIHJhdGUgaWYgaXQgZG9lc24ndCBtYXRjaCB0aGUNCj4g
PiA+ICAgcmVxdWVzdGVkIHJhdGUuDQo+ID4gPiAtIEFkZGVkIFJldmlld2VkLWJ5IHRhZyBmcm9t
IEJpanUNCj4gPiA+DQo+ID4gPiB2My0+djQ6DQo+ID4gPiAtIFVzZWQgTUlMTEkgaW5zdGVhZCBv
ZiBLSUxPDQo+ID4gPg0KPiA+ID4gdjItPnYzOg0KPiA+ID4gLSBObyBjaGFuZ2VzDQo+ID4gPg0K
PiA+ID4gdjEtPnYyOg0KPiA+ID4gLSBObyBjaGFuZ2VzDQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4v
Z3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMgICAgfCAzMCArKysrKysrKysr
Ky0tLS0tLS0NCj4gLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JlbmVzYXMvcnotZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5jDQo+ID4gPiBpbmRleCBjNWY2OThjZDc0ZjEu
LjNmNjk4ODMwM2U2MyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2Fz
L3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiA+IEBAIC04LDYgKzgsNyBAQA0KPiA+ID4g
ICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPg0K
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCj4gPiA+ICsjaW5jbHVkZSA8bGludXgv
bWF0aC5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiA+ICAjaW5jbHVk
ZSA8bGludXgvb2YuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4NCj4gPiA+
IEBAIC0xNSw2ICsxNiw3IEBADQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4N
Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgv
c2xhYi5oPg0KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC91bml0cy5oPg0KPiA+ID4NCj4gPiA+ICAj
aW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4NCj4gPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9t
aWNfaGVscGVyLmg+DQo+ID4gPiBAQCAtMTk5LDcgKzIwMSw3IEBAIHN0YXRpYyBpbnQgcnpnMmxf
bWlwaV9kc2lfZHBoeV9pbml0KHN0cnVjdA0KPiByemcybF9taXBpX2RzaSAqZHNpLA0KPiA+ID4g
ICAgICAgLyogQWxsIERTSSBnbG9iYWwgb3BlcmF0aW9uIHRpbWluZ3MgYXJlIHNldCB3aXRoIHJl
Y29tbWVuZGVkDQo+IHNldHRpbmcgKi8NCj4gPiA+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKHJ6ZzJsX21pcGlfZHNpX2dsb2JhbF90aW1pbmdzKTsgKytpKQ0KPiB7DQo+ID4gPiAg
ICAgICAgICAgICAgIGRwaHlfdGltaW5ncyA9ICZyemcybF9taXBpX2RzaV9nbG9iYWxfdGltaW5n
c1tpXTsNCj4gPiA+IC0gICAgICAgICAgICAgaWYgKGhzZnJlcSA8PSBkcGh5X3RpbWluZ3MtPmhz
ZnJlcV9tYXgpDQo+ID4gPiArICAgICAgICAgICAgIGlmIChoc2ZyZXEgPD0gKGRwaHlfdGltaW5n
cy0+aHNmcmVxX21heCAqIE1JTExJKSkNCj4gPg0KPiA+IE5vIG5lZWQgZm9yIHRoZSBpbm5lciBw
YXJlbnRoZXNlcy4NCj4gPg0KPiBBZ3JlZWQsIEkgd2lsbCBkcm9wIGl0Lg0KPiANCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiA+ICAgICAgIH0NCj4gPiA+DQo+ID4gPiBA
QCAtMjU4LDcgKzI2MCw3IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX21pcGlfZHNpX2RwaHlfZXhpdChz
dHJ1Y3QNCj4gPiA+IHJ6ZzJsX21pcGlfZHNpICpkc2kpICBzdGF0aWMgaW50IHJ6ZzJsX21pcGlf
ZHNpX3N0YXJ0dXAoc3RydWN0DQo+IHJ6ZzJsX21pcGlfZHNpICpkc2ksDQo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlKQ0KPiA+ID4gew0KPiA+ID4gLSAgICAgdW5zaWduZWQgbG9uZyBoc2ZyZXE7DQo+ID4gPiAr
ICAgICB1bnNpZ25lZCBsb25nIGhzZnJlcSwgdmNsa19yYXRlOw0KPiA+ID4gICAgICAgdW5zaWdu
ZWQgaW50IGJwcDsNCj4gPiA+ICAgICAgIHUzMiB0eHNldHI7DQo+ID4gPiAgICAgICB1MzIgY2xz
dHB0c2V0cjsNCj4gPiA+IEBAIC0yNjksNiArMjcxLDEyIEBAIHN0YXRpYyBpbnQgcnpnMmxfbWlw
aV9kc2lfc3RhcnR1cChzdHJ1Y3QNCj4gcnpnMmxfbWlwaV9kc2kgKmRzaSwNCj4gPiA+ICAgICAg
IHUzMiBnb2xwYmt0Ow0KPiA+ID4gICAgICAgaW50IHJldDsNCj4gPiA+DQo+ID4gPiArICAgICBy
ZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRzaS0+ZGV2KTsNCj4gPiA+ICsgICAgIGlm
IChyZXQgPCAwKQ0KPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gKw0KPiA+
ID4gKyAgICAgY2xrX3NldF9yYXRlKGRzaS0+dmNsaywgbW9kZS0+Y2xvY2sgKiBNSUxMSSk7DQo+
ID4gPiArDQo+ID4gPiAgICAgICAvKg0KPiA+ID4gICAgICAgICogUmVsYXRpb25zaGlwIGJldHdl
ZW4gaHNjbGsgYW5kIHZjbGsgbXVzdCBmb2xsb3cNCj4gPiA+ICAgICAgICAqIHZjbGsgKiBicHAg
PSBoc2NsayAqIDggKiBsYW5lcyBAQCAtMjgwLDEzICsyODgsMTEgQEAgc3RhdGljDQo+ID4gPiBp
bnQgcnpnMmxfbWlwaV9kc2lfc3RhcnR1cChzdHJ1Y3QgcnpnMmxfbWlwaV9kc2kgKmRzaSwNCj4g
PiA+ICAgICAgICAqIGhzY2xrKGJpdCkgPSBoc2NsayhieXRlKSAqIDggPSBoc2ZyZXENCj4gPiA+
ICAgICAgICAqLw0KPiA+ID4gICAgICAgYnBwID0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0X3RvX2Jw
cChkc2ktPmZvcm1hdCk7DQo+ID4gPiAtICAgICBoc2ZyZXEgPSAobW9kZS0+Y2xvY2sgKiBicHAp
IC8gZHNpLT5sYW5lczsNCj4gPiA+IC0NCj4gPiA+IC0gICAgIHJldCA9IHBtX3J1bnRpbWVfcmVz
dW1lX2FuZF9nZXQoZHNpLT5kZXYpOw0KPiA+ID4gLSAgICAgaWYgKHJldCA8IDApDQo+ID4gPiAt
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiAtDQo+ID4gPiAtICAgICBjbGtfc2V0X3Jh
dGUoZHNpLT52Y2xrLCBtb2RlLT5jbG9jayAqIDEwMDApOw0KPiA+ID4gKyAgICAgdmNsa19yYXRl
ID0gY2xrX2dldF9yYXRlKGRzaS0+dmNsayk7DQo+ID4gPiArICAgICBpZiAodmNsa19yYXRlICE9
IG1vZGUtPmNsb2NrICogTUlMTEkpDQo+ID4gPiArICAgICAgICAgICAgIGRldl9pbmZvKGRzaS0+
ZGV2LCAiUmVxdWVzdGVkIHZjbGsgcmF0ZSAlbHUsIGFjdHVhbCAlbHUNCj4gbWlzbWF0Y2hcbiIs
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgIG1vZGUtPmNsb2NrICogTUlMTEksIHZjbGtf
cmF0ZSk7DQo+ID4NCj4gPiBUaGVyZSdzIGEgaGlnaCByaXNrIHRoYXQgdGhlIHJlcXVlc3RlZCBy
YXRlIHdvbid0IGJlIGFjaGlldmVkIGV4YWN0bHkuDQo+ID4gRG8gd2UgcmVhbGx5IHdhbnQgdG8g
cHJpbnQgYSBub24tZGVidWcgbWVzc2FnZSB0byB0aGUga2VybmVsIGxvZyBldmVyeQ0KPiA+IHRp
bWUgPw0KPiA+DQo+IEFjdHVhbGx5IEJpanUgcmVxdWVzdGVkIHRoZSBhYm92ZS4NCg0KWWVzLCBJ
IHdhcyBsb29raW5nIGZvciBkZXZfZGJnLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gPiAr
ICAgICBoc2ZyZXEgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwodmNsa19yYXRlICogYnBwLCBkc2kt
PmxhbmVzKTsNCj4gPg0KPiA+IEkgZG91YnQgRElWX1JPVU5EX0NMT1NFU1RfVUxMKCkgd2lsbCBt
YWtlIGFueSBkaWZmZXJlbmNlIGluIHByYWN0aWNlDQo+ID4gZ2l2ZW4gdGhhdCB5b3UgY2FuJ3Qg
aGF2ZSBtb3JlIHRoYW4gNCBsYW5lcywgYnV0IHRoYXQncyBmaW5lLg0KPiA+DQo+IFRoYW5rcywg
SSdsbCBjaGVjayBvbiBpdC4NCj4gDQo+IENoZWVycywNCj4gUHJhYmhha2FyDQo+ID4gPg0KPiA+
ID4gICAgICAgcmV0ID0gcnpnMmxfbWlwaV9kc2lfZHBoeV9pbml0KGRzaSwgaHNmcmVxKTsNCj4g
PiA+ICAgICAgIGlmIChyZXQgPCAwKQ0KPiA+ID4gQEAgLTMwNCwxMiArMzEwLDEyIEBAIHN0YXRp
YyBpbnQgcnpnMmxfbWlwaV9kc2lfc3RhcnR1cChzdHJ1Y3QNCj4gcnpnMmxfbWlwaV9kc2kgKmRz
aSwNCj4gPiA+ICAgICAgICAqIC0gZGF0YSBsYW5lczogbWF4aW11bSA0IGxhbmVzDQo+ID4gPiAg
ICAgICAgKiBUaGVyZWZvcmUgbWF4aW11bSBoc2NsayB3aWxsIGJlIDg5MSBNYnBzLg0KPiA+ID4g
ICAgICAgICovDQo+ID4gPiAtICAgICBpZiAoaHNmcmVxID4gNDQ1NTAwKSB7DQo+ID4gPiArICAg
ICBpZiAoaHNmcmVxID4gNDQ1NTAwMDAwKSB7DQo+ID4gPiAgICAgICAgICAgICAgIGNsa2twdCA9
IDEyOw0KPiA+ID4gICAgICAgICAgICAgICBjbGtiZmh0ID0gMTU7DQo+ID4gPiAgICAgICAgICAg
ICAgIGNsa3N0cHQgPSA0ODsNCj4gPiA+ICAgICAgICAgICAgICAgZ29scGJrdCA9IDc1Ow0KPiA+
ID4gLSAgICAgfSBlbHNlIGlmIChoc2ZyZXEgPiAyNTAwMDApIHsNCj4gPiA+ICsgICAgIH0gZWxz
ZSBpZiAoaHNmcmVxID4gMjUwMDAwMDAwKSB7DQo+ID4gPiAgICAgICAgICAgICAgIGNsa2twdCA9
IDc7DQo+ID4gPiAgICAgICAgICAgICAgIGNsa2JmaHQgPSA4Ow0KPiA+ID4gICAgICAgICAgICAg
ICBjbGtzdHB0ID0gMjc7DQo+ID4gPiBAQCAtNzUzLDcgKzc1OSw3IEBAIHN0YXRpYyBpbnQgcnpn
MmxfbWlwaV9kc2lfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+
ICAgICAgICAqIG1vZGUtPmNsb2NrIGFuZCBmb3JtYXQgYXJlIG5vdCBhdmFpbGFibGUuIFNvIGlu
aXRpYWxpemUgRFBIWQ0KPiB3aXRoDQo+ID4gPiAgICAgICAgKiB0aW1pbmcgcGFyYW1ldGVycyBm
b3IgODBNYnBzLg0KPiA+ID4gICAgICAgICovDQo+ID4gPiAtICAgICByZXQgPSByemcybF9taXBp
X2RzaV9kcGh5X2luaXQoZHNpLCA4MDAwMCk7DQo+ID4gPiArICAgICByZXQgPSByemcybF9taXBp
X2RzaV9kcGh5X2luaXQoZHNpLCA4MDAwMDAwMCk7DQo+ID4gPiAgICAgICBpZiAocmV0IDwgMCkN
Cj4gPiA+ICAgICAgICAgICAgICAgZ290byBlcnJfcGh5Ow0KPiA+ID4NCj4gPg0KPiA+IC0tDQo+
ID4gUmVnYXJkcywNCj4gPg0KPiA+IExhdXJlbnQgUGluY2hhcnQNCg==
