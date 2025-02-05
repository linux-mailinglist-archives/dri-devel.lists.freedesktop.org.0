Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D46A287F9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 11:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CE9899E9;
	Wed,  5 Feb 2025 10:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jh69+0yL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C744710E770
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 10:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=up0YhE694NuSlqry3z886fQb88pQSeUr2Ju2zI/GkoNe1uTLXobAIBikRlZQAaN/v43bDDecTOSKVOltQgCX7iNYx9E0tw1CJav+ZvKTv3tG6p+5pao/Aei1Ds5KUjIYYfWNBKw0v9cK2/A3SiMVET32OYdVmapwceqJidfuMCUDV30gk71jvL53RKqRWYiCxdTtPUIfbUyF0wGxMkpEJpKUjN5ubwrLni9ZXlBbuaPsfZIuwZL77735NrUZU7ai4bsHSWoj2/0bnYgpQ/xOc6fTRd7VnbkeKMxQjdOBpXSLDoYW/ONll7O1Tzi/59YrJd75v13jlPhVfz2XKoiQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Df1AmFIQC2PUDO4cZ8UeQfGm/4VRTAkpGU9XlgVFzYs=;
 b=Bbt/ZliERizMrfPb1mXGsN1NjF98YPAp3R1/Lus4Xldg2QtIx1OM9J88nY7dafUeNWveXUY5JcE4CcGl4ukh5LvGzAWhCSIuUmMR1HniZiWPgo/S4yDYSuFux0P8Xr6jP+LgeOdyR4ytXLI8RQSg03H3lZM9qbwQyXSSQZQ19aa73eDzU1oPPQl27/xRKfaurNzfQpguEhU2wno4rT/veoAW0+itajmU5c8K2TDbW11cShSc2e5MBiI2Wr1YmNs8C3R8LNvXqvSqTDSwubCwQI2zaf5ddpvuU7Lh5eAxJkDicRFmXqsCRjqYB5LlUvqih8Qsnn5WDndPvaRxcAbXtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df1AmFIQC2PUDO4cZ8UeQfGm/4VRTAkpGU9XlgVFzYs=;
 b=jh69+0yLSdnlEGGF3x8aK1nqIx3Qnz3dwqvlIlu1evyEooJFzREY8lSnyKP/WFQd+ZgFSoSFOoIqR/x+zMIhNUHMGD3q8gfWsYATcVVa9b9MsxojCw18pB7ENxU0TjCheJiU8jo26PBbZcaJ16xnxSPT8nPJC9QbmgBCSztlweI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11396.jpnprd01.prod.outlook.com (2603:1096:400:401::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 10:26:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 10:26:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Thread-Topic: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Thread-Index: AQHbdJgP9S/z2tVCcU2bggWheT9O97M1bgOAgAFv+jCAAGrLgIAAAF2AgAAre4CAAQPygIAADqQAgAAARrA=
Date: Wed, 5 Feb 2025 10:26:26 +0000
Message-ID: <TY3PR01MB11346EADFF643B8F71799AF6786F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
 <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <wdxol4ua2zjzepvbdqrsybizl6ocpppjb2dmql62rbcmjjyqeb@5z4i2g7hf5vn>
 <TY3PR01MB11346E21DC023B3972A7A380686F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdXAe1bNqv2dSeS_7dtEjPy2-P6wY6BcC-uXyhKnO3vU8A@mail.gmail.com>
In-Reply-To: <CAMuHMdXAe1bNqv2dSeS_7dtEjPy2-P6wY6BcC-uXyhKnO3vU8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11396:EE_
x-ms-office365-filtering-correlation-id: 471c806e-5cd5-4086-35e9-08dd45cf8bfa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VTE0VTZFaC8xTDV2bzZVYlF3ejIyVjhDUGVYVzVwc1JpTFFHR3ozeElWR3VS?=
 =?utf-8?B?SGhWRU5MdW9oMVZ0N0pSRDlLMXJSczY3b3BPNVZ2RUcwSGRXczhMSC9XdCtR?=
 =?utf-8?B?c1NOWXowMnhZb29MOFdKK2RKNE1VeFIvVnFza2xEazhZNFljaXJDU25PMEEz?=
 =?utf-8?B?TkRmTStrVHZpQmhhcHV2dERVYnBscElhSTQ4OXE3a1NPL0ZDRGFnZEZ4UUZh?=
 =?utf-8?B?OWl3cHFIQ3FRQTFZSUE0L1B4akZoWVZ3dmFWL3E3K0svc0VSaFNoMTJmcU90?=
 =?utf-8?B?eFlwTXkyU1NBdEVNYjUwZWx1Qmh5U2VqQURobVdHUUEyN2VWT1RHR1pBaDk5?=
 =?utf-8?B?R0o0a3AwOFJsaGdCNlNxdk9yZVh4S0V0R2g3Z0MvMVJtMWFDR0FOOEYrRDJY?=
 =?utf-8?B?dk84WmtZd3Q4V252SkhLSDA2bkwyZnVybzVPYWM4Y3NvUklGQXdCZ3lqQzBY?=
 =?utf-8?B?Tm1IZGNBcGlDd2dwSDU3bkVxelF1SmlTaW1acjFKWlhON2QvcnJhdjZTaEZV?=
 =?utf-8?B?M21EVG9mQkpWWVk1NXBtd1pRSG0zUkpyd1BqVlM3VXRxcUdzL3liOGxUUWFq?=
 =?utf-8?B?eHRHVlFFMEVIWERXOHEyb2R5QkhlVEJHMi8ydCtUMG12Sk5yOEg5RGNuSFBH?=
 =?utf-8?B?d0ZEN2pFcFJmZTRMRGp3bFphWEg1enNhTThwMW1idE5WKzBseUwwTTRhdUtH?=
 =?utf-8?B?UUxDN1lxU0FXTStpNlNyZWZnZ3ZNa3dPYXN6K3lncDU2VFdncHo1cGlwWU9X?=
 =?utf-8?B?Zy9BTzM5Y1FHMndwRHplTUtCdTZxVmNRV2xHVXlscGhxUVJMSjkyY3IzMFZK?=
 =?utf-8?B?emJGZnBUUTNFV0tld3hwRnZzZksrUEJMMjNBRHpqVTB6dVgvWkpZV3IzZ1Jy?=
 =?utf-8?B?SUJ4dTRNdDlaVCtJajdvMzE1UG1sNlFBOHJUYkl6bDNEV1hNM2FtdXk5Uy9F?=
 =?utf-8?B?bkhvRWpHNlpSalBOck1aSGlicTloQWF6K01PQTZpRzNHZ05XYS9aWXg1OFVL?=
 =?utf-8?B?Wk56WGlJRWhTS1hCM2Z3NEFSdXRlbzNuRlo5bnZ1dVZ5QVBnUXNIMmU1Yis0?=
 =?utf-8?B?UE5keCtISDY1MkZlUnpNNXF0L2hsRWZ3cjJEc0J3TThjdi9WWDVMME1hSCtZ?=
 =?utf-8?B?cG4vR0RzOUh3cEt0eURrN2hNMW01Y2hpa2xGZEVVMU16YmU0NHdyQS80bjUw?=
 =?utf-8?B?QzhKYUJ3dTNwdE5rT3U5WGcvbHQrZFgvWTdleWVuWnY3NEhqS2NHYjNQZUJJ?=
 =?utf-8?B?M2lkSEppYWI2S1NNajV2R2Z4Zm5ZdHkyMEFld0VoejNRYzdvM1E3N0dxMHlX?=
 =?utf-8?B?T1d0L0pJaE16b3FBNW9YcjBJK081d1drSkdpYW1ZdUpYd092UzM5cnhGSk5P?=
 =?utf-8?B?bFdYTklpc0xSdjJYMzJHbTlOTy9hL3I5TlNrVnh2ZzEzRGdtUllENmRiQTRN?=
 =?utf-8?B?K3ZaNWNtNnlKczJRZTd1VkN4bDRrQmpWc09mWXlTOXYrRi9YWkNpK1h5RTJi?=
 =?utf-8?B?NlBlNG1TSXc5RTlObFhtb0M5YlNXYUZhUnB6MU1KcHNXTlQ5djhvM0FOaXh0?=
 =?utf-8?B?ZmJ4NXZEd3Jjam5McnFiNkE0cGdZOUx2U0dUd0VDbUhaV2tUNEJMSm9wekdX?=
 =?utf-8?B?N2xHT21WelJpd2FqSGJGdEh6ZWovdFhEb3RScHBBYSt5T0JsVFRZNEVpMTVT?=
 =?utf-8?B?Mk5xQUk2cml0aldjbm5mOVdFWWN3SEhramhZWGwyMWEzOHhweFlqOWt3eGtX?=
 =?utf-8?B?ckZ6aXBSRTNSL3kxc0ErZFY5N1c1S3ZRVGVJVnFJMkk3VUVJNUVOQkU2c3hn?=
 =?utf-8?B?aFQ5QWR3dXZXbFZxVG5WdFZTSW5rd0lpNFRma0RnNFFLcDN5QTU1SVFnaHlo?=
 =?utf-8?B?b2ZhampEVzZJMWxLcityVnVyL3JwZTJwNWg2Z0labXFpMjJBVzNWbGZpak40?=
 =?utf-8?Q?QM326BIs44VAIvhsK+hijnwwenAcrwRF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTJpRXc2YUM2NGlyRDY0MGE0ZytmY0xBc3NvVHYxY040YmRjd3VFaHM4MytE?=
 =?utf-8?B?RmhSY0Izc2FpS2tSbVhyQ1JOc1Rzd0ZqV3VJc2tDdEZHclFMb1ZzUndrYmZS?=
 =?utf-8?B?dGYzckhDVkQ4MnJqRktOWnFFNzJ2MzVWcUYwWmRodThMZi9VWTdtY3ZJcC9F?=
 =?utf-8?B?aERMUXNFSmNKMzRyczFQNHdZTFlTWTlUYlhTOW9OT1FTQUtqaTFNMzBVVTBV?=
 =?utf-8?B?eWFLSWwrdEtlS1JUZ3AwM2kwTEZ3WlI1UWVRdWUrMFhnOTNTS2dUdG1HaTNH?=
 =?utf-8?B?Mi9BZ2pZdXJsZGU1eEFWbjEvVFkwSUxoZWc2Qzk1NzlTR0dybmQ5WjJHZUtY?=
 =?utf-8?B?QldMZ2l5U0xjT3RISThSdTZrWjU5WlVQOHNoanNmNEdJODBYaXRWdkhGWVZq?=
 =?utf-8?B?UjRId1N2WkV6VmMyRld5UlRSYzA4RzN4Q21YTDV5V1o0VEppOVh5cTZXUXcy?=
 =?utf-8?B?eC9JOFpqdUpTYWpoWEhOTnRCQVVPUlYrNGdRS0ZScUMrWjFaU3pKWWRPMEY4?=
 =?utf-8?B?aHFlcEtGQklWUGEzUnl0bjZMZjJUZUdrWTR3MVJtYkwvcVpwVFUwTDIzSk54?=
 =?utf-8?B?cHNuUjJXdXJydEF4QkRyZFB0VSs2SktST0NiMkllNGthNEVRQ1dES25qYXhH?=
 =?utf-8?B?c0FsMjRyNEZVdFQ1UUFQUW1INHp0ajV3NGhqemVGU1BacnBHUTVDbWFRaysz?=
 =?utf-8?B?ZkF0SEhMS3VUOXI2d0xlRFovM0JCSWplQWgrTHdKRmgzTDJoaHV2YXNOcGNI?=
 =?utf-8?B?T0pqWmV3QklHN3ZSZjlzRnpsdG1oOEt4YVB2TWdONHMxSUlWRVpyVTBrUE5C?=
 =?utf-8?B?dG1XeXg0MTNqN2I3c1FCWU1OMUxFNXU1VG00aHpGMVduMG0xSVJoQ3BTeFEx?=
 =?utf-8?B?VHlDUXhxZUxRUlpQdUpmYmkyZ1VNbFNlZ1puRjFaaFdmU0E5NjlFL0VNZnNz?=
 =?utf-8?B?Wkl2YWl0UThJL1NaeFRrRk0zYVNsa25FOEVyTkxIcWx3bGZsSHVqc2xHNkJQ?=
 =?utf-8?B?L0JyRTlGbkxyZlJuZ21mdU1oL09IalFQVmhhNUFpQy8xSmJKV2o5T0lpSFFL?=
 =?utf-8?B?TjhxcmRRWkVYMGxsdTRtUGNWRitpeHZvUk1lYVFKdEFaSStnREdockNDQzJ0?=
 =?utf-8?B?MjVzZW0rODY0VGMvOEl1MG5CM3VERDlPVGMrWDRGbVh4Z2tBRFUzNG1lZWRv?=
 =?utf-8?B?dHhDZGxQcW11a0dqRnQ3czNMNEc5UExlMHVpNVFaV3JWVGx0TXRQbEJ5WGdz?=
 =?utf-8?B?R1FxWDRVdUd1UnRFTnRJM0g2bExXZXoydi9Id3RkQlFFc2ZlS3Ruai9nMTV3?=
 =?utf-8?B?WVZlRzVqd3IxcjBTUmJvcExsNlhwbC83ekpOS0FScmNZNW5BREM1WVJ4NFRM?=
 =?utf-8?B?OFpXOFZnTm1TY0dCbUEzcjlVUlFoNFkzV3JxdWpUelBZbmxCampoWmFFNkVJ?=
 =?utf-8?B?TENaajdac0JLSkdhWnV5ZkllOWJDM2NWRk5ranl2R3F3S0xvTENIdTRUWHkx?=
 =?utf-8?B?akNWeUJoby9UU2p6bGpBRzNXQ1Zqai9sS3ZtbGVqOEVPci9RTlRLRnhiUnp0?=
 =?utf-8?B?cmE1cUpiQUVpUVJkM08yZ244VnEySkRIZ1BST2VqUjE1RTlxaGtnR2NnTmJM?=
 =?utf-8?B?OHpRUU9ZK25qbnRtQkhyVGVKVjhUWFJhbmlIUmtSMGtsMmtjMlJjdXN1MFBp?=
 =?utf-8?B?Q096R3JCL05DcTNaM2Myc1dMa0Z5SjFFOGFtREkxL2kyTURhWEpPaGN0cjJl?=
 =?utf-8?B?Y3Z3eHRSRGJzb2tORUhrVG1ERHVhOTJmdXRodVMrOG5KUzNhWU52bm8xUmNW?=
 =?utf-8?B?ZDlXWlVEZHU3ZnA0eDNIeFROdUJqS1ovazYzM01YbW5FOEQ5TjNEd2hncWdW?=
 =?utf-8?B?TitoRno1VHB6c3E0eUl6V1dqdytPWDM2ZDR5cDJCcVlRY2ovUGVlWGw3WEMw?=
 =?utf-8?B?RElxdmhya1huQW9sNTc5TmpodXh5ZlNtTHdja1c1Y25KWG5JZ2FYZThNS1ZI?=
 =?utf-8?B?c2tUaHpENEI0R1Bna1VvR093RlRZaHlqMlBTVjR6eDVBbXhHaFBzUGNDa2h0?=
 =?utf-8?B?RmszK2JYVGV5RUZ3M0V1cUZwM1ZsbzRJRld0QzhTTlBuY2FveEg4c2gzeE14?=
 =?utf-8?B?bXB4eEVTTVRZcTVwL0xSN1NwUkpWZmdaU2xNMnRuMUE3TU1FZ0p5cmtOb29F?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471c806e-5cd5-4086-35e9-08dd45cf8bfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 10:26:26.5278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h2UUoAqZkicu75LaCOL3HzYMNK49p/5mmznz/rAPipnOa7vcn2X5drSmFNDymU0xc2o+qU2tWe9kfTHO0j4/lvWCUQpCLNo2jzl7aDcC7eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11396
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

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDUgRmVicnVhcnkg
MjAyNSAxMDoyNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vdGVncmE6IHJnYjogU2ltcGxp
ZnkgdGVncmFfZGNfcmdiX3Byb2JlKCkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIDUg
RmViIDIwMjUgYXQgMTE6MjAsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogVGhp
ZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4gT24gVHVlLCBGZWIgMDQsIDIw
MjUNCj4gPiA+IGF0IDAzOjMzOjUzUE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4gT24gVHVlLCBGZWIgMDQsDQo+ID4gPiA+ID4g
MjAyNSBhdCAwOTowNzowNUFNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiA+ID4gRnJvbTogZHJpLWRldmVs
IDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uDQo+ID4gPiA+ID4g
PiA+IEJlaGFsZiBPZiBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPiA+ID4gPiA+ID4gU2VudDogMDMg
RmVicnVhcnkgMjAyNSAxMTowNg0KPiA+ID4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBk
cm0vdGVncmE6IHJnYjogU2ltcGxpZnkNCj4gPiA+ID4gPiA+ID4gdGVncmFfZGNfcmdiX3Byb2Jl
KCkNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gT24gU2F0LCAxIEZlYiAyMDI1IGF0IDEx
OjU3LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
PiA+ID4gPiA+IFNpbXBsaWZ5IHRlZ3JhX2RjX3JnYl9wcm9iZSgpIGJ5IHVzaW5nIG9mX2dldF9h
dmFpbGFibGVfY2hpbGRfYnlfbmFtZSgpLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBU
aGF0J3Mgbm90IHRoZSBvbmx5IHRoaW5nIHRoaXMgcGF0Y2ggZG9lcy4uLg0KPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvcmdiLmMNCj4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvcmdiLmMNCj4gPiA+ID4gPiA+ID4gPiBAQCAtMjAyLDEyICsyMDIsMTIgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdA0KPiA+ID4gPiA+ID4gPiA+IGRybV9lbmNvZGVyX2hlbHBlcl9m
dW5jcyB0ZWdyYV9yZ2JfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPQ0KPiA+ID4gPiA+ID4gPiA+IHsN
Cj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ICBpbnQgdGVncmFfZGNfcmdiX3Byb2Jl
KHN0cnVjdCB0ZWdyYV9kYyAqZGMpICB7DQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgc3RydWN0IGRldmljZV9u
b2RlICpucCBfZnJlZShkZXZpY2Vfbm9kZSkgPQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBBZGRpbmcgdGhlIF9mcmVlKCkuLi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBZZXMgaXQg
Zml4ZXMgYSBtZW1vcnkgbGVhayBhc3dlbGwuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+
ICsgb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1lKGRjLT5kZXYtPm9mX25vZGUsDQo+ID4g
PiA+ID4gPiA+ID4gKyAicmdiIik7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgdGVn
cmFfcmdiICpyZ2I7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICBpbnQgZXJyOw0KPiA+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBucCA9IG9mX2dldF9jaGlsZF9ieV9uYW1l
KGRjLT5kZXYtPm9mX25vZGUsICJyZ2IiKTsNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIGlmICgh
bnAgfHwgIW9mX2RldmljZV9pc19hdmFpbGFibGUobnApKQ0KPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgaWYgKCFucCkNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9E
RVY7DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IC4uLiBmaXhlcyB0aGUgcmVmZXJlbmNl
IGNvdW50IGluIGNhc2Ugb2YgYW4gdW5hdmFpbGFibGUgbm9kZS4uLg0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+ICAgICAgICAgcmdiID0gZGV2bV9remFsbG9jKGRjLT5kZXYsIHNpemVv
ZigqcmdiKSwNCj4gPiA+ID4gPiA+ID4gPiBHRlBfS0VSTkVMKTsNCj4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gLi4uIGJ1dCBhcyBucCBpcyBzdG9yZWQgYmVsb3csIGl0IG11c3Qgbm90IGJl
IGZyZWVkIHdoZW4gaXQgZ29lcyBvdXQgb2YgY29udGV4dD8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBPSywgQnV0IGl0IGlzIHVzZWQgaW4gdGVncmFfb3V0cHV0X3Byb2JlKCkgYW5kIG5ldmVy
IGZyZWVkLg0KPiA+ID4gPiA+ID4gTWF5YmUgcmVtb3ZlIHNob3VsZCBmcmVlIGl0Pz8NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IEl0J3Mgbm90IHF1aXRlIGFzIHNpbXBsZSBhcyB0aGF0LiB0ZWdyYV9v
dXRwdXRfcHJvYmUoKSBjYW4gYWxzbw0KPiA+ID4gPiA+IHN0b3JlDQo+ID4gPiA+ID4gb3V0cHV0
LT5kZXYtPm9mX25vZGUgaW4gb3V0cHV0LT5vZl9ub2RlLCBzbyB3ZSdkIGFsc28gbmVlZCB0bw0K
PiA+ID4gPiA+IG91dHB1dC0+ZGV2LT50cmFjayBhDQo+ID4gPiA+ID4gZmxhZyBvZiBzb21lIHNv
cnQgdG8gZGVub3RlIHRoYXQgdGhpcyBuZWVkcyB0byBiZSBmcmVlZC4NCj4gPiA+ID4NCj4gPiA+
ID4gT0suDQo+ID4gPiA+DQo+ID4gPiA+ID4gVWx0aW1hdGVseSBJJ20gbm90IHN1cmUgaWYgaXQn
cyByZWFsbHkgd29ydGggaXQuIERvIHdlIHJlYWxseQ0KPiA+ID4gPiA+IGV4cGVjdCB0aGVzZSBu
b2RlcyB0byBldmVyIGJlIGZyZWVkIChpbiB3aGljaCBjYXNlIHRoaXMgbWlnaHQgbGVhayBtZW1v
cnkpPw0KPiA+ID4gPiA+IFRoZXNlIGFyZSBidWlsdC1pbiBkZXZpY2VzIGFuZCB0aGVyZSdzIG5v
IGNvZGUgYW55d2hlcmUgdG8gcmVtb3ZlIGFueSBzdWNoIG5vZGVzLg0KPiA+ID4gPg0KPiA+ID4g
PiBJZiB0aGVyZSBpcyBubyB1c2UgY2FzZSBmb3IgYmluZC9yZWJpbmQgZm9yIHRoZSBidWlsdC1p
biBkZXZpY2UgdGhlbiBubyBpc3N1ZS4NCj4gPiA+ID4gT3IgaW4gLnJlbW92ZSgpIGZyZWUgdGhl
IG5vZGUgb3IgdXNlIGRldl9hY3Rpb25fcmVzZXQoKT8/DQo+ID4gPg0KPiA+ID4gQmluZC9yZWJp
bmQgaXMgcG9zc2libGUsIGJ1dCB0aGF0J3Mgbm90IGV2ZW4gYSBwcm9ibGVtLiBXb3JzdCBjYXNl
DQo+ID4gPiB0aGUgcmVmZXJlbmNlIGNvdW50IG9uIHRoZSBkZXZpY2Ugbm9kZSB3aWxsIGtlZXAg
aW5jcmVhc2luZywgc28NCj4gPiA+IHdlJ2xsIGp1c3Qga2VlcCBsZWFraW5nIHRoZSBzYW1lIG5v
ZGUgb3ZlciBhbmQgb3ZlciBhZ2Fpbi4gSSBndWVzcw0KPiA+ID4gcG90ZW50aWFsbHkgdGhlcmUn
cyBhIHByb2JsZW0gd2hlbiB3ZSByZWJpbmQgZm9yIHRoZSAyXjMyLXRoIHRpbWUsIGJ1dCBJJ20g
bm90IHN1cmUgdGhhdCdzDQo+IHNvbWV0aGluZyB3ZSBuZWVkIHRvIGNvbnNpZGVyLg0KPiA+DQo+
ID4gQWdyZWVkLg0KPiA+DQo+ID4gPg0KPiA+ID4gVGhhdCBzYWlkLCBkZXZtX2FkZF9hY3Rpb25f
b3JfcmVzZXQoKSBzb3VuZHMgbGlrZSBhIGdvb2Qgc29sdXRpb24gaWYNCj4gPiA+IHdlIHJlYWxs
eSB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHRoaXMgZG9lc24ndCBsZWFrLCBzbyB5ZWFoLCBJJ20g
aW4gZmF2b3VyIG9mIHRoYXQuDQo+ID4NCj4gPiBPSywgV2lsbCBzZW5kIGEgcGF0Y2ggYWZ0ZXIg
b2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1lKCkgWzFdIGhpdCBvbiBtYWlubGluZS4NCj4g
DQo+IENhbid0IHlvdSBhbHJlYWR5IGZpeCB0aGUgdW5ib3VuZCByZWZlcmVuY2UgY291bnQgbm93
LCBhcyBpdCBpcyBvcnRob2dvbmFsIHRvIHRoZSBjb252ZXJzaW9uIHRvDQo+IG9mX2dldF9hdmFp
bGFibGVfY2hpbGRfYnlfbmFtZSgpPw0KDQpTdXJlLCBXaWxsIHNlbmQgbm93Lg0KDQpDaGVlcnMs
DQpCaWp1DQo=
