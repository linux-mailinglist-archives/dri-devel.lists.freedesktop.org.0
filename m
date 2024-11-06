Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E339BE422
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C853310E00B;
	Wed,  6 Nov 2024 10:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UlWp2kB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357AF10E00B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLgiI2hn/9SiECSRdcBMu4cdFgNdBK9jHQVFIprn/6N9RHyG4dkZiaVk53GccW7JMMC/hdMsI/99YYXZ7h+d0OG+jHppJd4sSfdpwT6Qylg/keJrMEKfvEvpHnvpdYFid/74EJD0SI29EknMeQ3GO5f/iLt6qTiOLF58x2IUEgrlH1aa0ZMMhk+6LxDEw7sEFzjk7Rr3aLlzNFXiZmNfOX/KZsW1va0p+amrDK1z97UytgaG8VS9w+n+hplqESC3ObNVomgEb6jPuNiaNbypLgSYpSHOJNpOI6BceShyihFIFUILRaiXtk1UEyQ9qMIL/U+YEtS/ycovt5kKTO+gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLOHCfNe2xgN6ESqBXuwxlFs8G+P8DWCzXbbq3ErCns=;
 b=MYqsr1vuPhdMkX/O8MM2HvdLL2QS57gj63+fpTg/X4MM27G9zcBhoT6i2iYZk1yXZF+cJu+tAEJhoQJ70G6ZIbr/u7L4isNj8leTUBz2p8m1pUfa7Cz+A0WWCAtfPnUb1P6e+z9QnXIQE3QtSvrn2BmrZTPYY3JMrpiIs0Z+s3RyLo+M2TYOtGkFCKlKHCR31P4Ap8odnwLVNM1cUdEuhvMNpP+f6J8VijbT7/FW13yPkOxUuYtBuP5kUcy3iapZoY8fbfuAnE0srqMJFzOdtTBC3D3+xyfOFymruWAcA5hl3e3ATB+M0zHPr8FuxODP8ibFKkqU0C4MrXuU2ArLSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLOHCfNe2xgN6ESqBXuwxlFs8G+P8DWCzXbbq3ErCns=;
 b=UlWp2kB7mCHLwAnPtSsEvB7Ze/cwCBXdkI47UQ2U9Csj27zjyTbln+MkCtSYhIUaucxjU/4egnZo4Ea38rIGsZbdzez4nhlMGRzplH0E00fmdM5vLWOkrnlVx2JJ5t/c0AnGAwpVdssrXWGxkbtbOGsz0bKfUVibe/VW5ZVmiNs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13092.jpnprd01.prod.outlook.com (2603:1096:405:1df::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 10:20:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 10:20:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Archit Taneja
 <architt@codeaurora.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Thread-Topic: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Thread-Index: AQHbL3OqGwvURGtuf0yMs4E9+5ouCbKo2l0AgAEqGLA=
Date: Wed, 6 Nov 2024 10:20:43 +0000
Message-ID: <TY3PR01MB1134619B30EB1894710AB669D86532@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
 <20241105160612.GC6317@pendragon.ideasonboard.com>
In-Reply-To: <20241105160612.GC6317@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13092:EE_
x-ms-office365-filtering-correlation-id: bd51f2f4-f6ab-4f3c-b361-08dcfe4cabb7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SlA2anFGeDZ0bEl5RUc2L0xVOFdMTWptY3VCYkxDR2JrOW1LNWdEeG1kR0RY?=
 =?utf-8?B?N29heVpQQ3pPbWNaeGRNMFYzS3BPT1owSXNXeE83SjJrTmsxTDlXQzFucDlm?=
 =?utf-8?B?OXhBR1hEZjlrd2I5ZSt4SDV0MzhISjdUdGsrcTZYNHBDRWluODl5cFQ3V1dG?=
 =?utf-8?B?NkYvandvU0g4dlprUVE1RjVFTkN2TW9Vbzc5T1VhQncwcmQyY3RHSk5SZCs0?=
 =?utf-8?B?b0k3M0UzRUI3b0tSK3ZNN05UYmdKbUNrLzRRbVFaQnU5czVjdFg0WDR4YnUw?=
 =?utf-8?B?N2I4NWJFeHBmSVZ6MVZvNTE2bk84MW44azA0aUx2Mlhmbm5MWktxK0xPS2pt?=
 =?utf-8?B?ZUV4bFVhSlFVSWtlekl2RnU2OWViZlRCaVE0Nm1oYjZNekI3bjJ3dHMvT3NM?=
 =?utf-8?B?cGNyYlNkaDRTU2RYZXBUcFZsQkFFUVlaaWRwQmY4VSthRkRjN3NhZ0hnTG15?=
 =?utf-8?B?emtVZEJqY3laamhpSmVUbnVuK3pWNUo4TEM5V1RwVWJUY3MwZDFGNXhadExF?=
 =?utf-8?B?Q3ZUbjhmOG5vazZTNWluUno3cVRqaEUrWXorNHg0dHhxdFA3MVpFTHkwZUJ6?=
 =?utf-8?B?MnpXeFViMHhnbmtmVUYxRDRQWU9GT1dxaWUvanhrRm5uOFlXVzJoWGlqcHht?=
 =?utf-8?B?aENLQS8xaUpHLzVNUzBobDlaQjEwdjZET2Y5QWdEdXJjYlJhcExRM3gvSnZp?=
 =?utf-8?B?NTJDMXhHMTllSVZnRkNmSkM4dC94TVp6M3VLa3psVHhCMDRHZGdsTUEzaDUz?=
 =?utf-8?B?UjlUV3JaOTZlV2w1U294YTZvMkdZRVo0ZWVqeHlFQ1o4Z1VFbktST1c5RCtw?=
 =?utf-8?B?OEdHZnA0Skw0Y1hjc1FUZEtzWkVNYytWMnRNK2VHVjNKajlUUXQvczgybndj?=
 =?utf-8?B?bWpWeVFYNVNFcm9FY0R3Y0duUnFDciswUXZZTG9TTEhhbjdVV0RsK2s1cTdB?=
 =?utf-8?B?RkNNc0x4TGZEVHBxcitYZGZ3dFNJajVTTTBPSkdXdEpQK3FWT3dKT0l1V013?=
 =?utf-8?B?M0xldTdDdm5wTEV0M0RJbVViVVNTVzBNTWhEblZNNkxYRDQ2VXNJcjU0L0du?=
 =?utf-8?B?dTBGWnlBZjQyZFV2ZHcyYnlhSlhNc2hzbW83MVRoaFdBdzM5UDFvaWJYSFhE?=
 =?utf-8?B?RWQ3amZLakZldlo3WHJhQ1AxRmNmQkU0RU5VcmZna0tuemJIMzN4TXFBQ3JI?=
 =?utf-8?B?bHorUVg2aHBSSW56VWlYb2N4b1o5VXNRaVlwYjNyRmlVUndoMCtUbHdMODRP?=
 =?utf-8?B?bFhFWU42NFE1dHdjcVFIc3dlL01LSUpvL1ZSSXE3cmMzZ2dZN1l4SDBXd1pU?=
 =?utf-8?B?bGlzS0xpVHIxNXc0NWlNQXMva1ZkZTFFTEc2S0RGUkp1VzZvd0MzZm9yV1F0?=
 =?utf-8?B?VEtWWHlTcDdObytkWGdRdkVWamQ5WlBzb0JzREhuTkRoYVJyT1NaeGllelVD?=
 =?utf-8?B?aTUrNGZ1ZHlHeWY1TlpmVXUyTTRvdTNtQ0hlWGZmSlNlUmk4ZGF4Z2ZWYy9l?=
 =?utf-8?B?b1FsaXdGZWxkclhvMUNpak5oKzhuTk9aRit6NlFwVTlIeG5mZlgzNmFPSlZ1?=
 =?utf-8?B?dExvZHFGRlJZMFhiMnVHeHd1SzlNMUV3bDRrWU9KYmlTWmVTOFZSWnp0ZGlK?=
 =?utf-8?B?SytVU041WXFIcStqTnNrQUFnMlRtL0UvbzNrR3NwRXNvbllVMGtlNGhraE9m?=
 =?utf-8?B?ZnZ0dFl1V2p3a0t6dmloelpEaUErQjNRNmZDTHhWTEZZUE9ZSmdJMjhSNU90?=
 =?utf-8?Q?Ac1FKuNRZFcTPJwbu0OGodtIv5+EXc+5EJRrSMZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTVaK05sRFFIaDRSUFAvQkhXSFo1YklPMlJkUFFHdWRJeHp1cm50V2FhbFp4?=
 =?utf-8?B?Yk1ybWYzZFRlYU5DUGlNaG4wVnZBYkdvdVVvU3NVL0NoOFN3dUJvZXQ0VDdP?=
 =?utf-8?B?MHlsTWIraDk4QmNjTDF6SzJENGZ3bmxDQi9EMlllb0duZnBjd2x1emN1b2xL?=
 =?utf-8?B?emozOEdVekQ4dVNRTlZDUTFtWE1QbDdmVm1xcGM3M05EWEZjQjl1UCtQYm5B?=
 =?utf-8?B?Q1drQkNRMnFqODNQVTducHFNblRKeHFsbEJyTXJKNGhNeENxMmIzZDZtVlh0?=
 =?utf-8?B?QXpnZkt1dFdWZ1IvRGFYYmErd3ljRnc2M2ZkNVFKWkxvMHZUVnppaXBBSG1L?=
 =?utf-8?B?MGRwRTBRWXkrNEUwcTZSeE5pTFhsdnloSDFxd0tzY0psaDN5Z29tWmNKbDlS?=
 =?utf-8?B?VnVUSE44OC92bHR3OWpmek1VMVNPZG5KZXFxQVlOUi9TS1U5Z3NKdGxFa3h2?=
 =?utf-8?B?MU9MdEx4dFNUZWhpSVN5bUt4M0Nrc0VVVldQbUZFVmhOKzAxQWoyOHlIZjdR?=
 =?utf-8?B?TEU0U20vWTdNdGV6cHFmM1U4bmorQ01IYS84MEtvamhVQVM3Z0p2Tko3QmVr?=
 =?utf-8?B?dUI5Z2NtcFhHazJ5MmdjbmlnOWRuSUUwaFVZZWVLc2IrK0tnSUlvRU9mdTRH?=
 =?utf-8?B?aXQzakxzSGlOU1d6dWZrL0FYREp3L3dXVlEzTk1oOEY5OWdsYWhsN01YU28r?=
 =?utf-8?B?a2JTR0JFMDdnQk1ZbE1lNXMwdmFRYWx4aEl2eld6bXBaM28rL3JIVjNUdlJt?=
 =?utf-8?B?eWpyQlRMa0l5Z2k2LzBSOFRXc1czamNjWlltZmlucGtCbjhJdjFDNkhMZC9N?=
 =?utf-8?B?dmQ1a2Jod1J0LzU1ZGk1MTBrLzRMRnYwQ1pJZnNkdmxNUmtsbGhRWXhneDd0?=
 =?utf-8?B?VFErZGJyQ1R2TFZsdkM0TXkzcmduckFENDEyWFp0M0JlbXorb04rajVDUlZu?=
 =?utf-8?B?b3NJS2FHZDhnam9Xb3pBeWh0YTRKelRnUm0vOVdYL0lRQmVENUwxZ1hlYzVq?=
 =?utf-8?B?ejJkTEJMeUgzdFJWdjd4VDh2ZmZrYVppU1Y0Z0E2RnFOTmVkR29Jb2NXaW1P?=
 =?utf-8?B?SW1KWlhFM1BQMStkNkVPUXczZ1liZzNqM1BYYVpzMUNwdUlhTmdZMGQycnEv?=
 =?utf-8?B?WHlzTWJ0M0U5QkV5NW8xdlRKTXJ3d20rTzF3RGVDOUNGY2dHQUJFNEdxR1VE?=
 =?utf-8?B?OFR1VSsrUDRHVmdhUDE5TXMvODdTZ1FCNzN0NUcweHpNZUI4Ulo1K3lyWFpw?=
 =?utf-8?B?eVA0UitLQ2FVeTl6ZjY2cVBzSHlqZVJlNmF6QmE3UlNQcXlveFo4WCtlNVZQ?=
 =?utf-8?B?N2NFbzlIcy9LNTVCeGFLWS9pVTVCWmxjOVlURDdRSHZDRHBWMWhmUWxSSEU5?=
 =?utf-8?B?TDJ3ZTJ2bVhjR3JreTFuNHhpUFRmR1lid3pLZmpIN2V2NWhOZSszdjhvdnph?=
 =?utf-8?B?Mm0zajdsRXJmMDRYaVhoT1oxQXg0RG1WMTQ3bmovNUV1VkNBV3AvblpvdVdD?=
 =?utf-8?B?VGNVQjVPdW1ra2NVNk1wOE83d2JBemM2ZXlENURwNWw3UENpNFJybmhCeVVp?=
 =?utf-8?B?dC84aCtVVSt6c2Z0dVZzQnZNeWM5dUtKSitBOHp6SXFzYWh2ZEl5VmNYUDd1?=
 =?utf-8?B?RUovSmVmNDd0cEttQXAvWTlEUG1yYVYyZUVkZmw1ZE53ekdPNWVFanBmWnBu?=
 =?utf-8?B?OUdPNGNCY0RsZEwyU2dURzlKTWNvT2tYRGtENDJEbGZVcnBqdWZtQWJObHNi?=
 =?utf-8?B?bHphYUpPQkYvdm5veHUwNTBOQ1p5R1lqZFpMc2dtQndqdklsajV4UUZoMHZp?=
 =?utf-8?B?cGVkUjJ4MEpzT3NVSEpyWkFvRVlUcmxzVGduSVlZeVNTL3R2OXpVdE4zKzZD?=
 =?utf-8?B?a3k1SUdSRVU4UVQvaFRkbW5wTldGZ3djTEtRa21ySlQxS1NKNWVWaUkzU05V?=
 =?utf-8?B?YTZ0aldLZldQSFFTT3pkdTU5UkdQRy96bjlOSEY0UVduTExpUkJRMzI4WjMx?=
 =?utf-8?B?b3lsMUMxZ3pPbEFnQW9HRFpkL1J4S0hNQmZWTVFTTDh4em93ZUVsSm8vMUds?=
 =?utf-8?B?NENJNlZUSmd1Ykt4bUtMT1h5TmczVW9hU0hsSjlvb3AyMnFhTTE1OGdCNzZt?=
 =?utf-8?Q?78RPEauZ/5hDGh+odZoP8+bS/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd51f2f4-f6ab-4f3c-b361-08dcfe4cabb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 10:20:43.1105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mixJpylijEsvqm0LBNMjFPICFxvis6TDgo95q9AiZi+eLxOwnfvPKjy/TGXJrgLXzb/vLegfxiy647rsJjP9E5+UA37qK/DsgWYp3t//2Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13092
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

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAwNSBOb3ZlbWJlciAyMDI0IDE2
OjA2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSBkcm06IGFkdjc1MTE6IEZpeCBvdXQt
b2YtYm91bmRzIGFycmF5IGluIGNsb2NrX2Rpdl9ieV9sYW5lcw0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBOb3YgMDUsIDIwMjQg
YXQgMTE6MTI6MTlBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gRml4IG91dC1vZi1ib3Vu
ZHMgYXJyYXkgaW4gYWR2NzUxMV9kc2lfY29uZmlnX3RpbWluZ19nZW4oKSwgd2hlbiBkc2kNCj4g
PiBsYW5lcyA9IDEuDQo+IA0KPiBEb2VzIHRoZSBoYXJkd2FyZSBzdXBwb3J0IHVzaW5nIHRoZSBp
bnRlcm5hbCB0aW1pbmcgZ2VuZXJhdG9yIHdpdGggYSBzaW5nbGUgbGFuZSA/IElmIHNvDQoNCkFz
IHBlciB0aGUgYmluZGluZyBkb2N1bWVudGF0aW9uIFsxXSwgQURWNzUzNSBzdXBwb3J0cyBzaW5n
bGUgbGFuZS4NCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MzMueWFtbD9oPW5leHQtMjAyNDExMDYNCg0KDQoN
Cj4gYWR2NzUxMV9kc2lfY29uZmlnX3RpbWluZ19nZW4oKSBzaG91bGQgYmUgZml4ZWQsIG90aGVy
d2lzZSB0aGF0IHNob3VsZCBiZSBleHBsYWluZWQgaW4gdGhlIGNvbW1pdA0KDQpPbiBSWi9HMkwg
U01BUkMgRVZLIHBsYXRmb3JtLCBsYW5lcz0yLDMsNCB3b3JrcyBvaywgQnV0IHdpdGggc2V0dGlu
ZyBsYW5lcz0xLCB2aWRlbyBpcyB1bnN0YWJsZQ0KYnkgdHJ5aW5nIHdpdGggY2xvY2tfZGl2aWRl
ciBhcyA2LDcgYW5kIDggYnkgdXBkYXRpbmcgdGhlIGFycmF5IGFuZCBhbHNvIGRpc2FibGluZyBp
bnRlcm5hbCB0aW1pbmcgZ2VuZXJhdG9yLg0KDQoNCj4gbWVzc2FnZSwgYW5kIG1lbnRpb25lZCB3
aXRoIGEgY29tbWVudCBpbiBhZHY3NTMzX3BhcnNlX2R0KCkuIEkgd291bGQgYWxzbyBwcmludCBh
biBlcnJvciBtZXNzYWdlIGluDQo+IHRoYXQgY2FzZS4NCg0KT0ssIHRoaXMgY2FuIGJlIGRvbmUu
DQoNCg0KDQo+IA0KPiBJZiB0aGUgaW50ZXJuYWwgdGltaW5nIGdlbmVyYXRvciBjYW4ndCBiZSB1
c2VkIHdpdGggYSBzaW5nbGUgbGFuZSwgdGhlIERUIGJpbmRpbmdzIHNob3VsZCBhbHNvIGJlDQo+
IHVwZGF0ZWQgdG8gZG9jdW1lbnQgdGhhdC4NCg0KRXZlbiBzaW5nbGUgbGFuZSB3aXRoIG9yIHdp
dGhvdXQgaW50ZXJuYWwgdGltaW5nIGdlbmVyYXRvciBkb2VzIG5vdCB3b3JrIG9uIFJaL0cyTC4N
Cg0KU28sIGFueSB1c2VycyBvZiBBRFYgNzUzNSB0ZXN0ZWQgc2luZ2xlIGxhbmU/Pw0KDQpDaGVl
cnMsDQpCaWp1DQoNCj4gDQo+ID4gRml4ZXM6IDc4ZmE0NzlkNzAzYyAoImRybS9icmlkZ2U6IGFk
djc1MzM6IFVzZSBpbnRlcm5hbCB0aW1pbmcNCj4gPiBnZW5lcmF0b3IiKQ0KPiA+IFJlcG9ydGVk
LWJ5OiBIaWVuIEh1eW5oIDxoaWVuLmh1eW5oLnB4QHJlbmVzYXMuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4g
PiBDaGFuZ2VzIGluIHYyOg0KPiA+ICAtIEFkZGVkIHRoZSB0YWcgIkNjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnIiBpbiB0aGUgc2lnbi1vZmYgYXJlYS4NCj4gPiAgLSBEcm9wcGVkIEFyY2hpdCBU
YW5lamEgaW52YWxpZCBNYWlsIGFkZHJlc3MNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYyB8IDMgKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1
MTEvYWR2NzUzMy5jDQo+ID4gaW5kZXggM2U1N2JhODM4ZTVlLi4wYzIyMzZlNTNhZjUgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiBAQCAt
MTg1LDYgKzE4NSw5IEBAIGludCBhZHY3NTMzX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsIHN0cnVjdCBhZHY3NTExICphZHYpDQo+ID4gIAlhZHYtPnVzZV90aW1pbmdfZ2VuID0gIW9m
X3Byb3BlcnR5X3JlYWRfYm9vbChucCwNCj4gPiAgCQkJCQkJImFkaSxkaXNhYmxlLXRpbWluZy1n
ZW5lcmF0b3IiKTsNCj4gPg0KPiA+ICsJaWYgKGFkdi0+dXNlX3RpbWluZ19nZW4gJiYgbnVtX2xh
bmVzID09IDEpDQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICAJLyogVE9ETzog
Q2hlY2sgaWYgdGhlc2UgbmVlZCB0byBiZSBwYXJzZWQgYnkgRFQgb3Igbm90ICovDQo+ID4gIAlh
ZHYtPnJnYiA9IHRydWU7DQo+ID4gIAlhZHYtPmVtYmVkZGVkX3N5bmMgPSBmYWxzZTsNCj4gDQo+
IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
