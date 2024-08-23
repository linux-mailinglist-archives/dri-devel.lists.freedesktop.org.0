Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6695CE6F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D308E10E8E4;
	Fri, 23 Aug 2024 13:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Q007ArR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD0610E90F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 13:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgDYwXIKzfsiF185SxUXwf2y9iRXXbV25cKyy42S2TX5C06nntxA8ZBxW3qRb9AsbcSYQ1QkhwGjSNwMr6/Ogi1mRljBrx9SqhF4YLTQYx/QhWmMEL4l0GQlLgkD7zhqiGs7BoO/9ekZO+OSAGa32kZc5e8Z1rTh0KL7Z6Yswmq274Ma2H6iyoj9uQ9px5dRz2nHfM08ZtI5f35M7OunErXDe1fUuNSfeDrPvxenYwzrq4pXhTNCQ2oAKLBiUkVP+yc3UPiUyB/COf1//9RPxhx8edTY/Y/h9M3w4DvtNd/XQCEluiwvHSLrfgOAk3NpWkZ2/WVcLJirZ3CqSwMGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m3kt0TBzO9n1UMQP+ScdkXSO1d8M3YPhRyMGCvtK24=;
 b=lLWXKwvGAl4u2/WcJDY4rGBBKlJoVgOJQu+8HkEFR5YZ3IQnx5nktoD4zpWPpYKwdvrChqeoOmmLAUlWLVWlJUqB7MByTPHsqer5lOJhRo5y5jFNjGuCzIwC1NdNS/Zu+Jg/P19iK96gFeDCA2HTCXXWN7gzYctLo1Dg7vQ6GBjstF2f9u9hyL/aDv6cu3UyI9Eu+GBt71iismUIdsS73U4wbC1z2nGr2Ms0OgYa1hCWXVQeFSYM0xamuaZVBb9MZs5C1njlie6tULUico2v6HWOb/YGfN4S12JNKYhqdo1edTFAQEZ8jB8RAKxzXdSp5+eSRLq94LVvmYzgiumiHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m3kt0TBzO9n1UMQP+ScdkXSO1d8M3YPhRyMGCvtK24=;
 b=Q007ArR4mTA+SumdRM5bC848WVlTICpump2Nwd0fDG4oauO6VtN+l/8AzwWXwqSoGvsGhQkA1HU/xJ7aHSCsJbS9HLJuwsmJ2Xyo3uld8JQT4/0hzZHma9BFWv2O8icfxJTXujY08oZ5UaNWhKPiNV2wQr/qKibk+WZTAdptSKg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9475.jpnprd01.prod.outlook.com (2603:1096:604:1d8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 13:52:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Fri, 23 Aug 2024
 13:52:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Conor Dooley
 <conor+dt@kernel.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Thread-Topic: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Thread-Index: AQHa9K+g3b0qbrJ9gkKCaVY3tzZtn7I0050AgAAG5zA=
Date: Fri, 23 Aug 2024 13:52:14 +0000
Message-ID: <TY3PR01MB11346F4E01D1FA2688D2799F586882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240823131516.GD26098@pendragon.ideasonboard.com>
In-Reply-To: <20240823131516.GD26098@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9475:EE_
x-ms-office365-filtering-correlation-id: 191b55e7-512e-4442-5f80-08dcc37acb68
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WVpqdElMNFI2ZGY2dG5QWCtmUS9aY2dCS01VT2Vmb3crYWxSVXpBeW9tckV3?=
 =?utf-8?B?SWZHemNrcnlLUUFDcFRDTWY0eDFnYy9yaXlsUG9QYkMvWlAzRzMxbTNQOUpn?=
 =?utf-8?B?ZXBGeFdCUEhvd0EzMkttTUVXSUFnZno1RUxReDZ3bGtXTXNJazBkdUZKRDlY?=
 =?utf-8?B?T2w1S3M0T1NzdkdBeWNDOTJteUhGR3dGSjNiOHVSSnNIR3loQmw4MTVuWjgy?=
 =?utf-8?B?dVdwYXRsbjBOdU8zUzdPTkVwWUpNYlVNTFMrM3djZ2pPN1QzVnVWYWZhbXFs?=
 =?utf-8?B?T2dYRTVaNzJTK1EvRnU1cHNOWllKK09RcVZ6Sm1SVjV2NTBPVktGaUxza1ZD?=
 =?utf-8?B?OGF4UWhBdnl3S1p0aEhZMDhrMEJGNElEMlYxT0xQWnRPVnJJeHhwd0pIdkNi?=
 =?utf-8?B?TCsxd1pHMm1vNGltRENZeHpTS3NWTWNzS2ZhY3R2bDBTd3NBbS92N3EwNjQy?=
 =?utf-8?B?b25aQkk5MEg5VXl4VVVUNG9SdGRNSTNNVG5QQWRTWExKa21LRUl2NHpzMnpI?=
 =?utf-8?B?Mk9zZGgwYVMxWTI0bUFKNE5WV25QYkpmRFBNSE4wWFdxMXEvcUdXcHpjbjF3?=
 =?utf-8?B?bklLdjBvL2NkRVFRTEZ5SnhHYWwxNkF6T2hRQzN5dytJT1MrT204NGx2Znh1?=
 =?utf-8?B?UkZoQ3FPT2VNeGF6Q1VjYWpPbG9BVHJFY1U5cG1ibGc0L1lXSWdxWlNZWUFi?=
 =?utf-8?B?Nyt6WmN6VEdRNWNmL0U5dWlSZm5xYUZlSEtDcnhWWncycHRFcjd6M1djTjFO?=
 =?utf-8?B?djNvOWNQRlJaa0tySTUwK1QrSk56WHRtRmFOVEVVL1dTRnY0c1BqV1k3UTFU?=
 =?utf-8?B?Umd1Z3lWeHBQNGJCZm5kb3FTL20wNklQM3ZhTFBycTdFb0NMSlhZVTJhMGd0?=
 =?utf-8?B?RUQrbUFyTlRHWEtlZG51MXFnQzhad2cwRFcxTjRNU0Z5NzU5ZmNvTnptTU1x?=
 =?utf-8?B?S0tXRnFKcXNJQkdJUHRqUXRzVGJQcDJKek12V2Y1QllYcFJLa1VKU2E0QXhU?=
 =?utf-8?B?OS9yNExYQXgxc1FNck9NUE1QdjkzVStFYkRsNlBObXBTeVJkdnNyQ0Q3d3Uw?=
 =?utf-8?B?SmFtWjg2eHdOQm5kb2ZKMlF3bmFmQjQrZGNreTdPYXJVaVk0YzlEL2svRC9t?=
 =?utf-8?B?bStIMHdaZnpHWTA0ODI3aFVzY1RNc29Yd2ZEUjByR2dzM2xtRi8vMyt1Um05?=
 =?utf-8?B?ZkVpMFNrSnJUaHJzVmpuL244bmw1Wk14Um1uaHQxVkdUdTgyNTVCdjk4cTRO?=
 =?utf-8?B?aHR1TmU2TVl2UmtKMlVzT2pBQzZ5S2twSE5xeS9pNU1PSWNWbGE5Y1kwM0Fy?=
 =?utf-8?B?dXJieDhGZzNHamVRODE1ZWVqVXdUaW4ydVNDQ1lHOGRwS1lRdks3NVVlQmQw?=
 =?utf-8?B?Y3ZrQi9QSnpKamRmUGJCSVB6Z0tGVnh6bmRaVU5UYUJUQXlmV1BGTnRvakV4?=
 =?utf-8?B?QTRZaGFWRGFiWU5CblJ2K282bHE5a3U5YjFHMXJZNjNURXBHYUhXRXUwdmRZ?=
 =?utf-8?B?cE9Wdno4djhhMlcvN2lJRVh4TGZEQW5qV3JGVkhJU1RmSUFKWGN1cXNLaFdi?=
 =?utf-8?B?MXR1MmNGdEdKZVdrcUFUVzVrckV1Y3dtUDJ1YjY4eDB3ZVZCN0d0d2lkdlMw?=
 =?utf-8?B?a1p0dzQrUzkwRG5yazBLMTNBbk1FQVc1Vlk2QktsRzQvTnRpRHB4TTByRkxu?=
 =?utf-8?B?MDVVNjkzbzVLamY0aUJLNFV6RDlGMGhhTldpYVpiQlZIYWdTemZsWkZ2Slp1?=
 =?utf-8?B?Sm80amIzTmdlUzlrTk83eXhZekFuZkFYWVd2NUxMSzdhSDFoZW1YWHhMZkVw?=
 =?utf-8?B?QXZPcytrdlNUMThZbWV2V3BVQ0JXSVJhOFBsZXhQOC9IZmhTTHl4ZjhDYjVy?=
 =?utf-8?B?S2dTaWZVdW4rV28wWk41UWluV1ZTcG5kN1R1cHI2VnhIM1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUlzYXB5QVprNU1OcnYzWlUxdlZZTXFkeFZJUG85SElXNnptcFBaTm1YRjl4?=
 =?utf-8?B?a20wUkpjSE44eDF4cEUxdUlseFBSV1Z5d1VabldIUUJtYzlkMi9yVk55MFR5?=
 =?utf-8?B?cVFoRzdjeXJFdDhVZUljR2t5RGxBd1doTFFWVTdDbkk5dXEzUTR0WVMxRWN0?=
 =?utf-8?B?MnEwTzFMbTRQb1VSMy9lWi9FclQ5aEdFS1FocTRsOFdaVUNNYThuUktvQ3Y2?=
 =?utf-8?B?enBJLzVmRk1MVW93RnRUZkJZL21VR1lFTGJlc2RYeGNHZWxRNDhQQU1zOUNN?=
 =?utf-8?B?N1haWE1aTVRhSkpLc201bnJ5UjZUeHVlZXVFZTFjS3Z2eWw5czcrMnpqb3hh?=
 =?utf-8?B?eTlGeVhJZ3d1bTNrVHd0bHp2MWZvV20wMGRoVWtpbGJqQUloSGIzcUliQk1W?=
 =?utf-8?B?YXVROWlidTF4dGxodUxHcHY1Sy9HZ0JUWWtmbFc2STNjRzFaK2RuT3dZRzF4?=
 =?utf-8?B?N0szeUFEUXJjeVpRSnBXMkxKWVZqQ2tBeDgrZk8xa2RvV0RQejBHVXNhdE5I?=
 =?utf-8?B?M0RqQWVxUHdEcFoyTm1tYlhDdWZyOVZoTVBoZ1RsNlZZWDMzclBXS21BcUlz?=
 =?utf-8?B?bFJFVG1oYWFvNHo3UWRrQVAxMVJjVGRFaVpGMFNneVc0b25GVHl1RWo0RkZa?=
 =?utf-8?B?Nml1emxRL3pTc0t6WE5pNEhsUE1Mamw4ajhBc0JYWmJ2Qm9BdUJicGgvaWRV?=
 =?utf-8?B?dTJWVllOSk1NMkxHMWgzdDlWUXBkaWxBRkVXbThkYnhrc2FRNGNxWDMwOVlT?=
 =?utf-8?B?Szg1Sk80OTJuekRqTnlrNW1FdWplVUhmRlRxMkYwZmorNjVIZEU4bUs3Uzd2?=
 =?utf-8?B?MVYyUk0xbmxGN2ZZS0ZzWTFLcS9NTWc0MllzWFhLWnh3eGFHd05nR1JGZ1c1?=
 =?utf-8?B?Yi91SkdVZ0R1K2MrbkJXSGhJNlpmZXVoalZXUGp3SmFFZzNqeEpwK0puNGwz?=
 =?utf-8?B?QkN5a3IzeTB1VTluMUt5LzFUUHAzTUo0SHlRNjNjVmtXeW5USE1aUFJKMk1j?=
 =?utf-8?B?d2ZiNXQ5bEdEWnVHUDExQW1EY2t4UUdTVlY5ZE1EZzk5ZlpucUV6ZjM1bzFE?=
 =?utf-8?B?cTFIMEovaXg0Tm1Rd3RxeEFNbXk2eXB5MmxBRWZYVW5FL2RVK3o2VGtkOVhx?=
 =?utf-8?B?Q1UxTVhaSjV1VnQ0S1VsUTZCWEdFV2FzNXdCRVEwNzBFRXNMdVlMRGJwaU16?=
 =?utf-8?B?bkZtQzI1YzlXU2NMR2NDVmlubXNBcGttYnFudGQxMVNyK0loNDdVSjVaZitu?=
 =?utf-8?B?eXZJMUVhbVJBVmFhd2ZCbVRaRVNqMUhlS3RncW9wZytXUFVIYjVaRVNSM1Ew?=
 =?utf-8?B?REpYQWRxVnMxOXVIQlRsLys1dDRpaU1vc2ZQS25tYVRtK1B4UnNDREozVDc4?=
 =?utf-8?B?TjBjeFk1OWRldlBmSVRUeGRwenRkOVNRTUhVcmwvcjZ1QjIweWt5bE1yUzQ2?=
 =?utf-8?B?bDBDWXRjMGsxZ3RPMjZla3hFVW5maDBjMHFVbjJrbkU0b3F6Q09IaXk4bklI?=
 =?utf-8?B?V1grTk1IZ1c4ZktUMDdwV0duQTJBSzJXZUVWVlliSmJ3R3gxeUp4WlU2SUM5?=
 =?utf-8?B?M1lvZnVoVk1xd0tPM0ZvY2ZRSE5aVFlIRHZmUUJvUHRhVVZmcnVpd1hvblF5?=
 =?utf-8?B?YlRUK3Y0NDgyd2paaFNZS1BJMkIwekdHdk9BT29PTXFiSlNpUlNBUUprdDQx?=
 =?utf-8?B?a1RNOXZIY1VzUFE3KzNLeXBqWTVaMldRemVjcXl1RDloVkU4S0dTTUlTTW9F?=
 =?utf-8?B?LzhicVJobDNTMGl2S2doMloyTVV3UE03aUJQQlNleEhUZGZsU2s1WnN5MjBC?=
 =?utf-8?B?WDFUNjdjMEp3L1dOUjR0Zjh4UzF5NkdkaHVGYnRleHFQbnhRUlR3Q1JDSmZU?=
 =?utf-8?B?UDJLTXQyNnhHZG5HaURkQ2lDSG5waVEyL1ZHR3BFT3J3azBFcWoxc3VDQ2JG?=
 =?utf-8?B?UWQ4eWFXYkViYTBrZ3E0SG5DcExydTlMWXFmdmhQcTNPNWl6cWZqd3VrS3Rt?=
 =?utf-8?B?NktXa1ltclU3ZElDa1dkaUdhdm5aNlJaMmxNMGs5SXh6RGxlQ0RnbDM2Z1h4?=
 =?utf-8?B?UVQ3djUxY3hma3ZLZEhOYmYyc08wWVQ1UWppNTE4eitRbWhqZWJremRSbUEz?=
 =?utf-8?B?bFUreUdKMENIVWpvWUJKRktrOEJseVZUR0RjTW1SU01CZjZIbllDbDVyKzRP?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191b55e7-512e-4442-5f80-08dcc37acb68
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 13:52:14.5177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WR3CmjVRXLwlzNvEkjCla805mGHy+fRICAVnHFUr0JbgUMY+i3QmH9or86YZws915sJNz+vrrwjVmDWgki95Ae7ubODdcKt2eZQwgSQpPPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9475
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

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgQXVndXN0IDIzLCAyMDI0IDI6MTUgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NCAwLzRdIEFkZCBzdXBwb3J0IGZvciBSWi9HMlVMIERpc3BsYXkgVW5pdA0KPiANCj4gSGkgQmlq
dSwNCj4gDQo+IE9uIFRodSwgQXVnIDIyLCAyMDI0IGF0IDA1OjIzOjEzUE0gKzAxMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gYWRkIHN1cHBvcnQgZm9y
IFJaL0cyVUwgRFUuDQo+ID4NCj4gPiBUaGUgTENEIGNvbnRyb2xsZXIgaXMgY29tcG9zZWQgb2Yg
RnJhbWUgQ29tcHJlc3Npb24gUHJvY2Vzc29yIChGQ1BWRCksDQo+ID4gVmlkZW8gU2lnbmFsIFBy
b2Nlc3NvciAoVlNQRCksIGFuZCBEaXNwbGF5IFVuaXQgKERVKS4NCj4gPg0KPiA+IFRoZSBvdXRw
dXQgb2YgTENEQyBpcyBjb25uZWN0ZWQgZGlzcGxheSBwYXJhbGxlbCBpbnRlcmZhY2UgKERQSSkg
YW5kDQo+ID4gc3VwcG9ydHMgYSBtYXhpbXVtIHJlc29sdXRpb24gb2YgV1hHQSBhbG9uZyB3aXRo
IDIgUlBGcyB0byBzdXBwb3J0IHRoZQ0KPiA+IGJsZW5kaW5nIG9mIHR3byBwaWN0dXJlIGxheWVy
cyBhbmQgcmFzdGVyIG9wZXJhdGlvbnMgKFJPUHMpDQo+ID4NCj4gPiBJdCBpcyBzaW1pbGFyIHRv
IExDREMgSVAgb24gUlovRzJMIFNvQ3MsIGJ1dCBkb2VzIG5vdCBoYXZlIERTSSBpbnRlcmZhY2Uu
DQo+ID4NCj4gPiB2My0+djQ6DQo+ID4gICogUmVzdG9yZWQgdGhlIHBvcnRzIHByb3BlcnR5IGZv
ciBSWi9HMlVMIGFuZCBkZXNjcmliZWQgcG9ydEAwIGZvciB0aGUNCj4gPiAgICBEUEkgaW50ZXJm
YWNlIGluIGJpbmRpbmdzIHBhdGNoLg0KPiA+ICAqIFJlc3RvcmVkIHRhZ3MgZnJvbSBHZWVydCBh
bmQgQ29ub3IgYXMgdGhlIGNoYW5nZSBpcyB0cml2aWFsDQo+ID4gICAgKFJlcGxhY2VkIHBvcnQg
MS0+MCBmcm9tIHYyKS4NCj4gPiAgKiBVc2VkICImIiBpbnN0ZWFkIG9mICI9PSIgaW4gcnpnMmxf
ZHVfc3RhcnRfc3RvcCgpIGZvciBzY2FsYWJpbGl0eS4NCj4gPiAgKiBSZXN0b3JlZCBwb3J0IHZh
cmlhYmxlIGluIHN0cnVjdCByemcybF9kdV9vdXRwdXRfcm91dGluZw0KPiA+ICAqIFVwZGF0ZWQg
cnpnMmxfZHVfZW5jb2RlcnNfaW5pdCgpIHRvIGhhbmRsZSBwb3J0IGJhc2VkIG9uIGhhcmR3YXJl
IGluZGljZXMuDQo+ID4gICogUmVzdG9yZWQgcG9ydHMgcHJvcGVydHkgaW4gZHUgbm9kZSBhbmQg
dXNlZCBwb3J0QDAgZm9yIGNvbm5lY3RlZA0KPiA+ICAgIERQSSBpbnRlcmZhY2UuDQo+ID4gdjIt
PnYzOg0KPiA+ICAqIFNwbGl0IHBhdGNoIHNlcmllcyBiYXNlZCBvbiBzdWJzeXN0ZW0gZnJvbSBE
VSBwYXRjaCBzZXJpZXMgWzFdLg0KPiA+ICAqIFJlcGxhY2VkIHBvcnRzLT5wb3J0IHByb3BlcnR5
IGZvciBSWi9HMlVMIGFzIGl0IHN1cHBvcnRzIG9ubHkgRFBJDQo+ID4gICAgYW5kIHJldGFpbmVk
IHBvcnRzIHByb3BlcnR5IGZvciBSWi97RzJMLFYyTH0gYXMgaXQgc3VwcG9ydHMgYm90aCBEU0kN
Cj4gPiAgICBhbmQgRFBJIG91dHB1dCBpbnRlcmZhY2UuDQo+ID4gICogQWRkZWQgbWlzc2luZyBi
bGFuayBsaW5lIGJlZm9yZSBleGFtcGxlLg0KPiA+ICAqIERyb3BwZWQgdGFncyBmcm9tIENvbm9y
IGFuZCBHZWVydCBhcyB0aGVyZSBhcmUgbmV3IGNoYW5nZXMgaW4NCj4gPiBiaW5kaW5ncw0KPiA+
ICAqIEF2b2lkZWQgdGhlIGxpbmUgYnJlYWsgaW4gcnpnMmxfZHVfc3RhcnRfc3RvcCgpIGZvciBy
c3RhdGUuDQo+ID4gICogUmVwbGFjZWQgcG9ydC0+ZHVfb3V0cHV0IGluICBzdHJ1Y3QgcnpnMmxf
ZHVfb3V0cHV0X3JvdXRpbmcgYW5kDQo+ID4gICAgZHJvcHBlZCB1c2luZyB0aGUgcG9ydCBudW1i
ZXIgdG8gaW5kaWNhdGUgdGhlIG91dHB1dCB0eXBlIGluDQo+ID4gICAgcnpnMmxfZHVfZW5jb2Rl
cnNfaW5pdCgpLg0KPiA+ICAqIFVwZGF0ZWQgcnpnMmxfZHVfcjlhMDdnMDQzdV9pbmZvIGFuZCBy
emcybF9kdV9yOWEwN2cwNDRfaW5mby4NCj4gPg0KPiA+ICBbMV0NCj4gPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNDA3MDkxMzUxNTIuMTg1MDQyLTEtYmlqdS5kYXMuanpAYnAucmVu
DQo+ID4gZXNhcy5jb20vDQo+ID4gdjEtPnYyOg0KPiA+ICAqIFVwZGF0ZWQgY292ZXIgbGV0dGVy
IGhlYWRlciAiRFUgSVAtPkRpc3BsYXkgVW5pdCIuDQo+ID4gICogVXBkYXRlZCBjb21taXQgZGVz
Y3JpcHRpb24gcmVsYXRlZCB0byBub24gQUJJIGJyZWFrYWdlIGZvciBwYXRjaCMzLg0KPiA+ICAq
IEFkZGVkIEFjayBmcm9tIENvbm9yIGZvciBiaW5kaW5nIHBhdGNoZXMuDQo+ID4NCj4gPiBCaWp1
IERhcyAoNCk6DQo+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhcyxyemcybC1kdTog
RG9jdW1lbnQgUlovRzJVTCBEVSBiaW5kaW5ncw0KPiA+ICAgZHJtOiByZW5lc2FzOiByei1kdTog
QWRkIFJaL0cyVUwgRFUgU3VwcG9ydA0KPiANCj4gVGhlIGZpcnN0IHR3byBwYXRjaGVzIGxvb2sg
Z29vZCB0byBtZS4gRG8geW91IGhhdmUgYWNjZXNzIHRvIGRybS1taXNjLCB3aWxsIHlvdSBwdXNo
IHRoZW0geW91cnNlbGYsIG9yDQo+IGRvIHlvdSBleHBlY3QgYSBtYWludGFpbmVyIHRvIHBpY2sg
dGhlbSB1cCA/DQoNCkkgZG9u4oCZdCBoYXZlIGFjY2VzcyB0byBkcm0tbWlzYy4gSSBleHBlY3Qg
YSBtYWludGFpbmVyIHRvIHBpY2sgaXQgdXAoTWF5YmUgdmlhIHJjYXItZHUgdHJlZSBvciANCmRy
bS1taXNjIHRyZWUpLCBvciBlbHNlIGlmIGl0IGlzIG9rLCB3aGF0IGlzIHRoZSBwcm9jZWR1cmUg
dG8gZ2V0IGFjY2VzcyBmb3IgZHJtLW1pc2MgdHJlZT8/DQoNCkNoZWVycywNCkJpanUNCg0KDQo+
IA0KPiA+ICAgYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMDQzdTogQWRkIERVIG5vZGUNCj4g
PiAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0M3UxMS1zbWFyYzogRW5hYmxlIERVDQo+
ID4NCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1sICAgIHwg
IDMyICsrKystDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDN1LmR0
c2kgICB8ICAyNSArKysrDQo+ID4gIC4uLi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UxMS1z
bWFyYy5kdHMgICB8IDExMSArKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jIHwgICA4ICstDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jICB8ICAxMSArKw0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9rbXMuYyAgfCAgIDMgKy0NCj4gPiAgNiBm
aWxlcyBjaGFuZ2VkLCAxODUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IC0t
DQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
