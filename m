Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB295B538
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 14:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663EF10E068;
	Thu, 22 Aug 2024 12:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pLhacZy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E6B10E068
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 12:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGVrdny2U/9Otrc/LyoruQacBjRQ2h7oSt61oPjMSv9sHHx280emofgpxF0XnXjjB4wtR4Zutc72mzDIvrtsVMBkTh6tf2vF9ad1SGZTvuv1mFNgc9BtXYyh9L8iorcxU0iVCgcLJYqopAmwj0mssxAUrKykYjypy2J9t6gddqwQhBfUHgLkRXQtloWndQ3N/SnwETd9h3iVhddJ85DHlPQkWv8KpDAiCsfwqG2MaxZeh/wyOsqd8FzXCyIxBBGzEA2H6b1j/sun9JfhGUoS8Z7iYQXy/O3EbEKNae3Vc9t+3mLwqftPREnpCXrzFZSkiJZeSp8t3KFI2igiiWJ9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTAWvfw5Kov6M8mxMZzkggcPiaW86JMPPfbqKPcArak=;
 b=F86c9Ovg7uBZ2hFcI3T9SAeFow79fZoYPhXEmT1hwadFGTO2esOIjnQKQpct535p/d0OcSh4IV9K7q7QuqYZcBbKSOpsRosJ2UUG93TVadzujDUpu5IV3KSseisj5P0hszW6WNb0UXxyasrk7CvQDmDx7KBNHywun1Nd32sChCSh86lVkcrLMI52WhYkjFypfE0RVJo3miZJA8EMm46qjD5UTyXp35pXzhLs4QRCZiGAUkS/S3Nay1Vecyk2WMamApV4NcF8Mgq8OnOKI87MniqdqHOqwYwCaZkQrqoHgOcooPrhjPN39G9fC97aoSyPAacw7wiJpoHH4MFVbpVTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTAWvfw5Kov6M8mxMZzkggcPiaW86JMPPfbqKPcArak=;
 b=pLhacZy3ewj3JSW46jK60HFIWPli5ypT5E4+hm9eJ8VP8zMG3nlgRiJFPhzI86tnGhmEm6QEjKr+cb/7QyvwR6gLQXXedP57nRVBg4LHUcXmFLsj55gVZjNGC+J6qzzpIwskb4f4yrAAmxVJGYlTQ7GkSZULrLapRN+V3qGyJtw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10742.jpnprd01.prod.outlook.com (2603:1096:400:2a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 12:44:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 12:44:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm
 <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Thread-Topic: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Thread-Index: AQHa51OiM5PSXaeUbUywn0dig27zKbIzT5qAgAACLIA=
Date: Thu, 22 Aug 2024 12:44:15 +0000
Message-ID: <TY3PR01MB11346A7D4FC8D5D2D62E32FED868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXAG=x0DeDtp8y792E6o5vnFsFPt72JXaRePO2rkSvwdQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXAG=x0DeDtp8y792E6o5vnFsFPt72JXaRePO2rkSvwdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10742:EE_
x-ms-office365-filtering-correlation-id: dcfd13e0-1cac-43de-1ab1-08dcc2a82195
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SkVGRWdSVmo2R2tTVVlWckpzWEUydTR6K2NnczA5MTV6Tjh5dTRRN3Q5M2JK?=
 =?utf-8?B?T3IxZXNkUk5UVlJ0QVFuWkphWFJrTHEyb0RUcklPNXk2ZGFKaFVpTVVtS2U0?=
 =?utf-8?B?OGQ0YzFPOW1xeTdzQVFscVRGdkNDTlRQVFV2djdoY0MxQWZrcUxjMmVobm9D?=
 =?utf-8?B?NlZjVWRYS2E1a0lRTDNIcHRielBseDJjREE2YkZpWk51ZTRsUCtORUpWc2JH?=
 =?utf-8?B?K003L242VWdKcll2SFMvZnc2ZG00aE1sUHBkTHcyRkZrQko4NjZrTjJVemJl?=
 =?utf-8?B?WXNlOG1zUXBseGUxOEkzeTFOdUp6UzZrcDVScy93TEN3YlU4a0wvb05LbU4r?=
 =?utf-8?B?UUlmRGhBWUxYWWV3cSs0a2dydEZ2RjNqTHBNajNpdmlGNlBROUxNek1UMU5S?=
 =?utf-8?B?T2czN1NEU2ZBYkxZb2wySWw4amdGTWYzTGFCM3Bjb2ZHbVY3cWZWdCtuOTlB?=
 =?utf-8?B?VzdBalRHYlhCcUROWjQrMFhOV2lWc1phS0JIeXVBZXpHRW9mQXRjV0Z4UGdF?=
 =?utf-8?B?YVl4ZUw4NWpDWVplNmIwVmRKRGxyRTFDRGVjRmJvRXloWWR1bTYwM2I4Snkv?=
 =?utf-8?B?anA2MDNXQkp4U2MxdHNlZEY4UFdtOFpwdkFDVUFPZTNwWStFUllwREpnb3BR?=
 =?utf-8?B?ODJCaHArc0tnYVlmb2xHUXptNlN5YUp2dWZpY2JNa1JveHpDd2NxcmZQaSsr?=
 =?utf-8?B?YzZGTEZmaDJaUUQ4Y1BjQXc2R0RMR1ZHcmVUUWFSak5GTmxDd0NmQ01xVGdo?=
 =?utf-8?B?R1ZKQnNxRXVOWmNkUEl0WTZlaGtNT3BXMFFMaHFDVFU0U2RwZFk3dEhZYlRh?=
 =?utf-8?B?NEF0aXVzYzM4QWJXVGNjL2J6V1ZtRTdUb01wTjFSUHpZZ1V3MVdwbnlvQ3kw?=
 =?utf-8?B?RzVFZWtDL3FlZEZLU0pvaVcyTmVYUnFHZnphN0ZlVVFpQ2pNQm1EV1F5eHdv?=
 =?utf-8?B?Y09PM2V1enMvVG90bGpvUndkMDdzbTFFNVdEMDdwOVVUUzllOEQ1WlY1cEtE?=
 =?utf-8?B?WFg2RWVQKzZoVSt4SndsYVRhUmlpOWR0MjlEK2o5Q2dkMVR1TG9ac2dzamFi?=
 =?utf-8?B?ZUgxaHdNRG9uSU1EL2pYcjRuRTBIYXZhcmQxeE5FTWhFUzM4TDJBU0xUSjVi?=
 =?utf-8?B?enpmZEJnd0JaVVBic3d3eTBEbzk2Sk1DT01UNW9OTExUU1Nndzk1eStRNlVi?=
 =?utf-8?B?ejArTjV6VFp0VFI5bjJ2eHBKOEhLbFB4eFJQZGIzVnp2OXJicjdFQmV3Mitt?=
 =?utf-8?B?cnJ5VlUyZGpZYklKaXhNaEMxYVBsbFBETlNwUG8rZVRmc1BFMkE2VExJRVRM?=
 =?utf-8?B?S3pRK1hRYUlTbUEyNFF2dEdMbEx1ZEFqMjZsYm9uTDROVVJLWTU4bFgwSUJZ?=
 =?utf-8?B?YjNta3dmNkRIQkRFUTdPeGJTR002OWdoeGFEdzlweDVQYy9CSTZsZFZkY3ND?=
 =?utf-8?B?aDF3b0J0NVorUHMwRGJ6Tm9RMFFheW1oWkJ4UDJYQXdZWndzenhHNFBQWkkx?=
 =?utf-8?B?Tys0RXRQejdVNzBpTTk4bFBVdCtudEVPWkxsZjlXOEI3R3Jpc1BNVVV5ekNE?=
 =?utf-8?B?QmYyWTZFWmF5YXR4RmMwcndlK0d3enZxQ0d6WFlPTE55Nit5SkxzS04rWlhq?=
 =?utf-8?B?Y0lZYXJWUGhSb3l0WVh3QVpyZjZkVTM4emVXRkw3KzB2T2sxYm83UDdJVkdR?=
 =?utf-8?B?Q0RGTmloR20wL3hXWWRyQ2wyYnZ6eGdHdWlDMEhQVFBCZHM3SjVTZXUzdDZw?=
 =?utf-8?B?Qnlhb08wM3NsemwvTit0STRURkJtVnVnQ01yUEhaa25leDB5N1hSZzdBbnpQ?=
 =?utf-8?B?SDJRRzhQQjNHUUN5YXlaRGFBZEZwNVI1ZEx1anZWRGJ0R1N4V2IvUGg3blNG?=
 =?utf-8?B?bnJ6cXpSdHBncitpajBqVUNZUkViNHFHNE5mRmdEbnRVblE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1hyeXB0dnRuc3pOaDZUK3lTOFdKRzhTbDlVWHlZYWtUMjlNVk93UjFkTzBF?=
 =?utf-8?B?U2dkSWNHRE1iNGdxU3VaYy9mQ0dRalRWdDNpVm03S3pIajR1T25VeVZjYjRl?=
 =?utf-8?B?MXpLczExdDBPNk1qNEoxelJSeWhhWDJVaDlZNWh4V2RHNjd4S2NoQk9iYTZO?=
 =?utf-8?B?N3BLL0Q1NzN4VkhuRmxqQ0ZScmdIZVg3ME5TRGZnb3d5NkRCYW1pTC9ST00w?=
 =?utf-8?B?RzZyNEtlOXIwRTZoajY1RGhWUTZYZXM2eXpIdDRYNldGNE5RckRiQVFWcHhB?=
 =?utf-8?B?cXhUTms3WmdxcjFuOHdtV3d0TEd2Q0tmOW5idmwrQmRlV01SUDZrQVUwTXQ4?=
 =?utf-8?B?emFJZ3VBdlVUNmlHWnJrMEFuc2xzS3htYzd2enpUZUVUaHMxSEdRak1EbGY4?=
 =?utf-8?B?aHhxUGJiRWFITTFBKzN6MTc5VU9MMk9oSXZDTlpMaW9FMzJxbWpPeW93em4r?=
 =?utf-8?B?alYzcUtuVUlYaGpmWG85dVVtSmxvMXdwcXU0blFucnZMbWorZDFhekNkMklm?=
 =?utf-8?B?TXdFQlFsZlBBbSt1UFFUaG5kOWxacGQ4VVlGTW1aVk5oUWZoV1pRRjlhbi9S?=
 =?utf-8?B?bStGUFRiVDNnMjIrSW1EY2R0UHdxL0EwRkVoazVYN3hzamtXYUNyNDJFZHAw?=
 =?utf-8?B?bmJ1czFWb1pORS9aaE0yVm41b2haa2ltS3VNSW9La3hscGRvQWxmWGhTUGwy?=
 =?utf-8?B?K3UwUW9mWjRybDZqcnJQN3BCeEx2c0pjdFViQnRTZ3BGZ0p3UDBwL2t2VGNo?=
 =?utf-8?B?L2VTNklXQmxnZ3crdWREWm5iWFNLV3NEcVlHTUhLNzlPNVV5cmJUc0VxdXpL?=
 =?utf-8?B?Tm5rSlMzdEhGL1huM1hGdloxZnhqZU5Oam5tVXcwZ3d4bzRZbUNwNi9hTEZ5?=
 =?utf-8?B?OWpFVS9HZmtaUDBJYmY1TzNlUVdsVWROQk4zU0loMUNNZzJqbjNzMSs2RTNt?=
 =?utf-8?B?aEdHWUJJQWVPc1VkdlNCODNqc25RTVovbU4zM2FFQlBsTVprSjVCcGhUNG16?=
 =?utf-8?B?QVRDQkxDNCthb3lJNkxoNEZVK0xCekdWMGxzZzF1VG02SVA2dVhKYm9sZmcy?=
 =?utf-8?B?MXhqK3FLRmExam1sUVZNWDVBQU0ySklVVEpxUHFOTTFmaGZTcFFka3hZWXhE?=
 =?utf-8?B?ZlBmNTQ3R3Q2UVBraW03c2h5Q3VTcGREUHBVUFRHNHhjSjRmSnQwZGMvRU1t?=
 =?utf-8?B?VVZXOEVwL3cxZitxU0gxVm5DbTFMTDN6RVF6UUhEOHNnTTJ3eTZiT3lNdnJO?=
 =?utf-8?B?UXNYWXVZbmEzTlpSMFZjM3VMN3RoN0srSjhFaXNYUllwTklHYUpzNmttU1B3?=
 =?utf-8?B?TlRON2xOTkVtTjBIU1dlMG9FWTYvQ0k1dmJmT2RjeGtvekp1S3ZBWE9wNWli?=
 =?utf-8?B?SXdrTUJJK0dSajlRc3Y1OHdpVkZrNVBRVzQwR1d6TzhUZ3VlQU5BNFFwL01n?=
 =?utf-8?B?eUhQRkVyczVUeXl6cHVvNGxFSXBhU2ZHUGZCUHNEUnZvRzl5WFpWblBBcGFT?=
 =?utf-8?B?a29pMUw4MGVYL3dqSVhmSm44b1A0SlBjT0tGV3Y2b0JlQllXeVhIM3pabHlL?=
 =?utf-8?B?ZGtLRFVMak1sMWxnaUcvRGh4MmErZWQ0Skx0M2ZjV2l5RDBIbVRVM3p3ZGRN?=
 =?utf-8?B?b2MwSWJkNmloa3JXYlJnRWdqRzI4QUlyMlNLMVlMZVZlUmROWkZINmRqN0FR?=
 =?utf-8?B?dmQ5dDVGMzExOE4wdEs1dzdJUTB4cTVWNG5rcHBHZXY4ZlNoTGIyc3k1cEo5?=
 =?utf-8?B?ZVN0S05Fdisrd0hUeTU1cG9WTHBtMmh0bjB3RGhMcTB3ZFNlTW1nV2xjQlZo?=
 =?utf-8?B?YlQzMCsrQzRXRyt4QzFZU2VvYU84SW93VmcvVlhRbVNWQnErVXpuT0N2c0Jx?=
 =?utf-8?B?RXFxd1ZsUHpTK2tFeDVUVCtBamxCbTZZUTluemwwWWJrWU1DZ0F1UTZhZC9C?=
 =?utf-8?B?QVhUakFoQ2tDUFdLRG1VRUNoZDBOOC9kekJiRkp2VDlET3FmMEFVZmZUUloz?=
 =?utf-8?B?cGN2QmpZTm5JMTRqV1lCM0xlejdwYVhCaVNvYmw0V0lNRVlQNktYWW5FZGJH?=
 =?utf-8?B?MmIwbVdnWG0rOEgvTFJjaEhBV2xDRTFWS2VHazg5MEF2aEl0bzZJZnQrdU12?=
 =?utf-8?B?M0tONDNsakxzbGhLc0Q1QVdEb1EzRXF6VERlWjRNeC9KemNjVzBqcnIrdU5B?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfd13e0-1cac-43de-1ab1-08dcc2a82195
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 12:44:15.3381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhybKDfHw/kZSDF4Vo2/vixvHhHF1LO600Yld0CoTDAPQy08Z3df5P9i0PwAtSnPYlQtyY2pJYMrHt8cVfr4VGB0SSuDS3xh9l/nU6sNyns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10742
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

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDIyLCAyMDI0IDE6
MzEgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzRdIGRybTogcmVuZXNhczogcnotZHU6
IEFkZCBSWi9HMlVMIERVIFN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEF1
ZyA1LCAyMDI0IGF0IDY6MjLigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+IFRoZSBMQ0QgY29udHJvbGxlciBpcyBjb21wb3NlZCBvZiBGcmFtZSBD
b21wcmVzc2lvbiBQcm9jZXNzb3IgKEZDUFZEKSwNCj4gPiBWaWRlbyBTaWduYWwgUHJvY2Vzc29y
IChWU1BEKSwgYW5kIERpc3BsYXkgVW5pdCAoRFUpLg0KPiA+DQo+ID4gSXQgaGFzIERQSSBpbnRl
cmZhY2UgYW5kIHN1cHBvcnRzIGEgbWF4aW11bSByZXNvbHV0aW9uIG9mIFdYR0EgYWxvbmcNCj4g
PiB3aXRoIDIgUlBGcyB0byBzdXBwb3J0IHRoZSBibGVuZGluZyBvZiB0d28gcGljdHVyZSBsYXll
cnMgYW5kIHJhc3Rlcg0KPiA+IG9wZXJhdGlvbnMgKFJPUHMpLg0KPiA+DQo+ID4gVGhlIERVIG1v
ZHVsZSBpcyBjb25uZWN0ZWQgdG8gVlNQRC4gQWRkIFJaL0cyVUwgRFUgc3VwcG9ydC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogQXZvaWRlZCB0aGUgbGluZSBicmVhayBpbiBy
emcybF9kdV9zdGFydF9zdG9wKCkgZm9yIHJzdGF0ZS4NCj4gPiAgKiBSZXBsYWNlZCBwb3J0LT5k
dV9vdXRwdXQgaW4gIHN0cnVjdCByemcybF9kdV9vdXRwdXRfcm91dGluZyBhbmQNCj4gPiAgICBk
cm9wcGVkIHVzaW5nIHRoZSBwb3J0IG51bWJlciB0byBpbmRpY2F0ZSB0aGUgb3V0cHV0IHR5cGUg
aW4NCj4gPiAgICByemcybF9kdV9lbmNvZGVyc19pbml0KCkuDQo+ID4gICogVXBkYXRlZCByemcy
bF9kdV9yOWEwN2cwNDN1X2luZm8gYW5kIHJ6ZzJsX2R1X3I5YTA3ZzA0NF9pbmZvDQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX2R1X2ttcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVz
YXMvcnotZHUvcnpnMmxfZHVfa21zLmMNCj4gPiBAQCAtMTgzLDggKzE4Myw4IEBAIHN0YXRpYyBp
bnQgcnpnMmxfZHVfZW5jb2RlcnNfaW5pdChzdHJ1Y3QNCj4gPiByemcybF9kdV9kZXZpY2UgKnJj
ZHUpDQo+ID4NCj4gPiAgICAgICAgICAgICAgICAgLyogRmluZCB0aGUgb3V0cHV0IHJvdXRlIGNv
cnJlc3BvbmRpbmcgdG8gdGhlIHBvcnQgbnVtYmVyLiAqLw0KPiA+ICAgICAgICAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgUlpHMkxfRFVfT1VUUFVUX01BWDsgKytpKSB7DQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKHJjZHUtPmluZm8tPnJvdXRlc1tpXS5wb3J0ID09IGVwLnBvcnQp
IHsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG91dHB1dCA9IGk7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGkgPT0gcmNkdS0+aW5mby0+cm91dGVzW2ldLmR1
X291dHB1dCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0ID0N
Cj4gPiArIHJjZHUtPmluZm8tPnJvdXRlc1tpXS5kdV9vdXRwdXQ7DQo+IA0KPiBOb3R3aXRoc3Rh
bmRpbmcgTGF1cmVudCdzIGNvbW1lbnQsIHRoZSBhYm92ZSByZXBsYWNlbWVudCBpcyBlcXVpdmFs
ZW50IHRvIHRoZSBvcmlnaW5hbCAib3V0cHV0ID0gaTsiLA0KPiBzbyB0aGVyZSBpcyBubyBuZWVk
IHRvIGNoYW5nZSB0aGlzIGxpbmUuDQoNCkFncmVlZC4gSSBtaXNzZWQgdGhhdC4NCg0KQ2hlZXJz
LA0KQmlqdQ0KDQo+IA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgICAgICAgICB9DQo+
IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
