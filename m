Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08FAA26DE6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 10:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079D10E299;
	Tue,  4 Feb 2025 09:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pzDIkSR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6744810E299
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 09:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjhDvWW5dxmml594JR7DdR+kZBBD+rapU4SWwgD/MFTNPN/KnsignzH8ScIzKcgXSjXjoPex6GKt9Q8WWN6DDz+2TyksJJL3yYStF9tszwNtuzkDTJj2eioVPYmHxS6IyLMdmCj2UQ3SN0IvuofWIQgxj1Ag7LcHjSIFsFbZpk/NwpicuaF6k5nZXwgTE2tcTV/N8TtWMSHchAMLisboSkuTncfNI9YBhxrGdxf29KhzoVWXvhCGQewokQB3l/itJXsmusddEF3c+wZ6G1bIyficwX7eNfxhvQG2xloLoadh8aS65tlhbjl0EjhhhH60vzsI1ThVRxl9O3ASfYyXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoK+OFvcNQSuCS2Xz6oTJ+aCC0P6vn3iNa1DaM5FEWk=;
 b=ZG9ThC7bWzDmUHLbqy+9magH0i65iEtE4oo3rkbd3YZwsT17JcF7UUPRz0oiA0RacYSogU6kydi2tzIJL2kt4es9ZvmPM1/RXgX0cAhsGrdzrKJ6PupT3W+69wR8nU6mdAgDwDfDFCKi4uiYlNIy0PNKA+Obq6upu+MGpzVdM/Jb6iSHlDFZ7W8Raof7gWKK+Gg8fDCAdEIJjsBj/uQC+pF0BGu5r5xHP+k5N2DU1acCww51dBnpYuxwJgComTCsXKse8phrwpu6df7iWIjILrK9bvg/IRg6zlF0CqyaIX8T5eyUSHWBBr72EMK9PfAHjiFUzkaYryNA/xU/zShpqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoK+OFvcNQSuCS2Xz6oTJ+aCC0P6vn3iNa1DaM5FEWk=;
 b=pzDIkSR/A1WgFWsWaekqmcyGD02TiomBUPqpjiEdMWxp/X6xpkAChzT8+Q54EQIe6fMyvRd8JXbCbOLdrFIB6ZK4e+uPVA7HeVMYnzGeubhLVcVdE7Ez1ANpJY+tU1cq/YS43yFoPDcLYrsOyesISuriGctNElC2O23TwB1bYTI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8000.jpnprd01.prod.outlook.com (2603:1096:400:f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 09:07:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 09:07:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Thierry
 Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Thread-Topic: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Thread-Index: AQHbdJgP9S/z2tVCcU2bggWheT9O97M1bgOAgAFv+jA=
Date: Tue, 4 Feb 2025 09:07:05 +0000
Message-ID: <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8000:EE_
x-ms-office365-filtering-correlation-id: e968ba4c-a80b-4d47-b32a-08dd44fb4b7d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?b24rVHNUZnVMbXhweUJ1clpXTytCbDdKaDk5WDU5UENsbU1XVjhLU2V6R3hp?=
 =?utf-8?B?TzkzZy93ZmtkMzRkTk1kaGRTV0h2NU1VUDUrNS9sbDJ5M3hLbVNmNXhrTHc3?=
 =?utf-8?B?NUpXM04zQjRTQkZ6R3psTVlkSS9LYUMzRUZjK3ZCNTh5RHdzZjhQM3pMOFA3?=
 =?utf-8?B?Mk1Fd3Y2TmN3UzRFRGhuYnc4ZnluTDh5dlVqUDFhR2FDcTV4SVRYdG9kTDh0?=
 =?utf-8?B?MGxTUXAwWS84QUVjMTdLbDJCWE53dC9TWlFEUjE1MGFINmdqZTZmanl1cGpJ?=
 =?utf-8?B?a2N0TTdId1R4QU1vWk9HV1pEZEpUZi9YdE9IWnN0bnc4cUVzaVdSQXIrekNP?=
 =?utf-8?B?NUVJdGhQQ0YxWFlyejZrakxCWjVEZGNFVVJieFBQVktUTmZtRFpvOFB6QjM2?=
 =?utf-8?B?dmwwM1BSUi9TSjVtRWo0Y3lXZ1A4U0EveS9SWm1IeW9KNmhRdDBrdi9seGho?=
 =?utf-8?B?WTN5Skd2UG16Z3l1ekhsTkhOT1JHSUg0bWRpSzlXUDl5Mk5LVExyZjJUNkRV?=
 =?utf-8?B?N3pPd3ZCZkQzVG5FS2pONkZFNUc2aDBjaDNvYUd3THpqbVpCZlp0UEFOSU84?=
 =?utf-8?B?YkN6ejJNQ0pXS2djTERNd2ZKSVM1MEdkRUwrSXF5V1B0WWdtak9NRGFVNjl6?=
 =?utf-8?B?d2xKeVJsQmY4ejRVSTlmc1lEVjRmMVB3bVFGT0NwQktvVnN5aGFGUU5TOXMz?=
 =?utf-8?B?eU9uUUV1bVM2VTZLWVJyNXlhZll4NVVOc1VrWDNiTHF3dHhQOHNqOU10VGpT?=
 =?utf-8?B?UmtnUTIreWd4Y3g4L0toVUtpQVNwempmamdPTmFIbVUydnlXSWc2Y2phZDAr?=
 =?utf-8?B?VE9HNDduWVVtNldEOGNCcTBJTFVIY1VuWE9uTjdIWHhzTGJqRDlmY095Qkpt?=
 =?utf-8?B?MEk0azQzUm5saVkvcFU3S29YTHptM1I1TUd4Q0xrREc4SDhmeG1xTXFmaVox?=
 =?utf-8?B?a0o5Wi9tUGtmR2dJK0RiNlRUUG9ybWRmb24xMGJkV0thQnRkQnQra3VLTXVY?=
 =?utf-8?B?ejYzWkZBWTI4eXR2NXdBQWs3ZWlFdnlRYVpnNTdkQS9GUDNqSml2V3UxUE9u?=
 =?utf-8?B?YmZUb1IyVjhGeU5MSk5FNTNrWHh0MGF0b2JOb2lSeEVwLzExd3F6dHcwTTBO?=
 =?utf-8?B?RTUvdndEY3pObDU4TDh4L0RRYjZGRjI3cUE1N1ZMaEZHeXhkNjc3QlU4OFo3?=
 =?utf-8?B?Ym1RcHRHT0puUUpQQ2haVnlKSm5IL3dpRzBFYTVTWGc5VjQrM1pNVSs0b2Fs?=
 =?utf-8?B?aXpPMGFEeVg2K1gzTFoyeGViNHJ5YTZkZm9FaHAyS0crS2pnVG1haUw1cmtL?=
 =?utf-8?B?NVRKR2hQMnRTb0g4MVBKOXNrRko2U1BCOW9OTElBUXczcG1kQ3NrRXVpeUVl?=
 =?utf-8?B?YTVHVnZYYjVPTkV3Z05COGkwdFE5K3ZXSTlYQi9SOHhqSHFjU0VsY0s1bWJr?=
 =?utf-8?B?OHA1VTlOeUVhWDRValpRdlNISFlBU3EzYlZqRHAyZnVoRlF3STNzY01DOElI?=
 =?utf-8?B?UVdlakV4TmMyZ0dYZ2FKTGc2NXBJLzVQYUgxaGNib2RWKzk1dTVLMmI5L1NI?=
 =?utf-8?B?bHJMbm95c3ZvSFgzWmpvZWZvQnUrTENxdm9uWlBiaGhPQnNsWkFxSjlZeitu?=
 =?utf-8?B?VmpQdnovTG5wTzM0Um1rWFFmMFdpcUJpVlNzcjh4bk9LSWhMU0p6NHRGdDFx?=
 =?utf-8?B?VUhybGlEbXF6QjRRdUVMY04rRFlDQjdkdXNGeFNYNldpd1pjQ2lEeFRlRHJC?=
 =?utf-8?B?K2djSUR1cnFGbXhRNnpQKzNvL0U5eStnNU9ZaTgxOWtkYmxaTE1OU0NGNTlR?=
 =?utf-8?B?S2Q5OWNDUVpxT2EzTDdTQ1M4WUg5M1Y0MVVNQ3FCbVh6OGFZTWM0S0h6bUNC?=
 =?utf-8?B?eEJRZkFxeC9SQ013OUxRUFlTanpmSVJ0Rm9KdzdJNXBvb3RvVGd1dVpsU1ZE?=
 =?utf-8?Q?ftc9x6Ha/Sd8LUiMwBliEAtSyVd9dOPM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzYzcVZsWjluTENUNHBxUzNGWXVUUGdGK0tMYjJCb2I2RENoR1R2KzBDZ0RV?=
 =?utf-8?B?emVBQWdmQitHMUVnbEZBTGo1WkkrT1JhbnEvSDhBc2ovZkR0TmoyTWZOT0lk?=
 =?utf-8?B?alUwUXN1a215K3Q0NndTekZBMEdHaEpUUEQ5TlF4WHRKcUd2aWFPQldRZy9m?=
 =?utf-8?B?Z0NNOFpkQmczcXAySUJtUmZqWk1GNlc5cFkrWFpMNVJUdTR3Wm45ek8wdUYz?=
 =?utf-8?B?V1BlVW5vbmxVM29ZSEp3MmczUHpFbHpsWHcrcEEzbVpUMzBVRGNSRDYxZ1R5?=
 =?utf-8?B?L3A5VWZ4alF5cWh5anhjR0t5VjRYS3ZZR2RRTzNrQ09OU0R4V2oxTk0xa3lU?=
 =?utf-8?B?dkxWclpPQUVOM2dvT09ka0E2MStwbFN2c0t5dG9jREpIeDNYMXNwaUpvNEJP?=
 =?utf-8?B?ZWdnUGpDOFZWQmFqSFNYb0x3Y29ibGRrdWlJUm5nbHZnMUY4NGQ1OWRDT1pF?=
 =?utf-8?B?OXMzRXhTNmRKYVJEeG5ON3lRUU5RNVpZamdMZVMvZFhrWWtGZU5WeWhhSDdC?=
 =?utf-8?B?WVFFM2JZWkxoWVUvZWNCMW00ZnZjaHJSS2xkRzdLK1NxZldlblhVRmVrV2tF?=
 =?utf-8?B?ajZpTnlvWCthSDZVUzJJWFVBRnhodG93azB4TnFTMWhLajYvT3MrZHRIejh6?=
 =?utf-8?B?d1dva2FKY1hRSUpENGY5dHpyK3RNS25mTWE4WGd0bTgwdmJiQnNMcmxva0xK?=
 =?utf-8?B?RzY2ZHExb0dFMmtkSVFqSEozQ0NFbis4TUN4cS9sR2ZTSmFuV3E3ajVXOGlP?=
 =?utf-8?B?TG92ajYxZnZKL1BhZkgybGdURTJTa2h0dmNhbG54OS9seFh1OWRWcDEwRS9Z?=
 =?utf-8?B?MTMvN1lMV1plMmkxNDk0VWRORG1ick5Zdzg0NThyR3E1ZEs3bTRIcDVxRndl?=
 =?utf-8?B?MUJlVTNaelR6Zll0d2ZYdmxkaEtCWGRxQllER2NvcHhsMjMweU9Za216YVFN?=
 =?utf-8?B?WHJ6YWFTVVRWZkRJdnczVTZmQ2tsdWZMcnU1N0N6bitnZ2ozaFNzNjhTOWdF?=
 =?utf-8?B?M2RPM1YxQXBnMUpPQVlJUXhGdzFoMGgwYW9qampYaDJmaHpwbGNsNUR0alRs?=
 =?utf-8?B?ZmZVSVVteVRENGxGVSs1d0lIQmJleVBaUE0reTFzYkFjTVVlZU5adFFxdzMv?=
 =?utf-8?B?ei9NN2MwSEVjVGZvOWppeFZaM2V1bHFGN3VaQ21QZXRHWUMyY1hNdkZxTTF2?=
 =?utf-8?B?MlV5WXVSOFZqTzJENHhta0JPN0tUM2xlN2kzdlk3U1E1WEkvMFhHVU4xcG9q?=
 =?utf-8?B?L0NXQlVZVG9RQ0JWd0xiR1hrOVdsdnlYUHFtSDNSTGxZaUhubWUxeXJ1dUVU?=
 =?utf-8?B?TDRiaGdYR1JzOXlyUjI3eWdHTjhjTEVvUWE0TS9RbU93MDdFUWNmc3pwR0da?=
 =?utf-8?B?SktzQ3d3ZXZlWEQ5VHpLc1dHOXd3LzhUM1NzQlJNWVZ0YkM5Vjh6c3RwS0ly?=
 =?utf-8?B?ZklXalAyNm1PemxLR2NtN2llcFNrU0hpVWRlc3VQS081YjRDNDFZMTNzOVA0?=
 =?utf-8?B?Unk3NmVaaXB1NTZyTE5EUGg4a293NGhJSTNSdW1tY3VLNStNdGRhdVJscjZn?=
 =?utf-8?B?UGkvWndqSGJyeVVPUDhYQVVYVlNEaitXZHRiMjBEaTBJUkJEL3c1MUdMbHhM?=
 =?utf-8?B?NTdlK0FkNHNZZ0wwbkFmWlpXZWZaa25yMU1DY0w1dGVYZEJnQ3pmNk9ReUYr?=
 =?utf-8?B?S3dmaGtFSGRjdFlOV25NNWEyNXpPVzZoL05FdWZDZG9McU80QTlQd01kTHlR?=
 =?utf-8?B?Znh3ellxTXlJSWlHeHd2bVdhemFobGtEenVOUW8zdk9rcGNydE1Cc0FtcGlr?=
 =?utf-8?B?dHhoYmFiUkI0cGd0MnBHTkxUMVdoVUxLc0FldEtNdXpiS1dtWkc5WXdkWVN5?=
 =?utf-8?B?UVNuT2xqMlBQeWVnS2ZwcVkydEd0Y1lPSVFpQzdndDNNd2VkbzJaWmNieDRX?=
 =?utf-8?B?eEZwbVkrT2VwWGM0d0QyY2tEOGFyNDJuR2J1RittOVdlNzFWckkwRHpFdTk4?=
 =?utf-8?B?b0ZBRnFvenl3NkdzWmRUbE5PUFJGVkN5eDh6bjI2RDVLNlY3MzNGQjVOd0x2?=
 =?utf-8?B?dCttazEzWUlrWng3TVJkV0ttUXJJdG4vSCs4MlNueVhxcUUwQUVkc0ZEWCs1?=
 =?utf-8?B?MTVab1NKaVZlQTEyaHR6VE0yOGxlSDE0T0dZdTl2R3A2c3dOQzVkWFpWNVY1?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e968ba4c-a80b-4d47-b32a-08dd44fb4b7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 09:07:05.0319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31kqHV4jl/4mHQhBO+CHU77FB03XRy2PcaH8vQZnT1hUhOL6UfxCtc8S1FyOvz6EOE6zcGAIIWN6Tl852k6OY3rg/GfRs+PrIX22zjITT+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8000
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
TWVzc2FnZS0tLS0tDQo+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6
IDAzIEZlYnJ1YXJ5IDIwMjUgMTE6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3RlZ3Jh
OiByZ2I6IFNpbXBsaWZ5IHRlZ3JhX2RjX3JnYl9wcm9iZSgpDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gU2F0LCAxIEZlYiAyMDI1IGF0IDEx
OjU3LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFNp
bXBsaWZ5IHRlZ3JhX2RjX3JnYl9wcm9iZSgpIGJ5IHVzaW5nIG9mX2dldF9hdmFpbGFibGVfY2hp
bGRfYnlfbmFtZSgpLg0KPiANCj4gVGhhdCdzIG5vdCB0aGUgb25seSB0aGluZyB0aGlzIHBhdGNo
IGRvZXMuLi4NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9y
Z2IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9yZ2IuYw0KPiA+IEBAIC0yMDIs
MTIgKzIwMiwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5j
cw0KPiA+IHRlZ3JhX3JnYl9lbmNvZGVyX2hlbHBlcl9mdW5jcyA9IHsNCj4gPg0KPiA+ICBpbnQg
dGVncmFfZGNfcmdiX3Byb2JlKHN0cnVjdCB0ZWdyYV9kYyAqZGMpICB7DQo+ID4gLSAgICAgICBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KPiA+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpu
cCBfZnJlZShkZXZpY2Vfbm9kZSkgPQ0KPiANCj4gQWRkaW5nIHRoZSBfZnJlZSgpLi4uDQoNClll
cyBpdCBmaXhlcyBhIG1lbW9yeSBsZWFrIGFzd2VsbC4NCg0KPiANCj4gPiArICAgICAgICAgICAg
ICAgb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1lKGRjLT5kZXYtPm9mX25vZGUsDQo+ID4g
KyAicmdiIik7DQo+ID4gICAgICAgICBzdHJ1Y3QgdGVncmFfcmdiICpyZ2I7DQo+ID4gICAgICAg
ICBpbnQgZXJyOw0KPiA+DQo+ID4gLSAgICAgICBucCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKGRj
LT5kZXYtPm9mX25vZGUsICJyZ2IiKTsNCj4gPiAtICAgICAgIGlmICghbnAgfHwgIW9mX2Rldmlj
ZV9pc19hdmFpbGFibGUobnApKQ0KPiA+ICsgICAgICAgaWYgKCFucCkNCj4gPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+IA0KPiAuLi4gZml4ZXMgdGhlIHJlZmVyZW5jZSBjb3Vu
dCBpbiBjYXNlIG9mIGFuIHVuYXZhaWxhYmxlIG5vZGUuLi4NCj4gDQo+ID4NCj4gPiAgICAgICAg
IHJnYiA9IGRldm1fa3phbGxvYyhkYy0+ZGV2LCBzaXplb2YoKnJnYiksIEdGUF9LRVJORUwpOw0K
PiANCj4gLi4uIGJ1dCBhcyBucCBpcyBzdG9yZWQgYmVsb3csIGl0IG11c3Qgbm90IGJlIGZyZWVk
IHdoZW4gaXQgZ29lcyBvdXQgb2YgY29udGV4dD8NCg0KT0ssIEJ1dCBpdCBpcyB1c2VkIGluIHRl
Z3JhX291dHB1dF9wcm9iZSgpIGFuZCBuZXZlciBmcmVlZC4NCk1heWJlIHJlbW92ZSBzaG91bGQg
ZnJlZSBpdD8/IA0KDQoNCkNoZWVycywNCkJpanUNCg==
