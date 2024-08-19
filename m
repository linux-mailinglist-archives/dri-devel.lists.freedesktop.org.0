Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E1956B75
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 15:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A1B10E25F;
	Mon, 19 Aug 2024 13:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KN994FjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA2B10E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 13:04:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Df2ME5F4eyCzlxwIk7HiBATLKv1E6zO6GL3pOyDBRwLsW8SKX5NGVKFAEWQa1wYafLEX5mGhZa/NO5nql95cOTW9hVnlBEzhd1WPTSdBOEnWD7/7Eajpt2wIbEJ/ppp7T4L1l2S99yW//sbfcWwk2hZNmh0xSJeWlyZsIlobKGnmfBPbbXPVJwisxd5UzydrF7gYUDwsR5R9zHtLc5audEXny4RrVHMT0C2RkGCXajALS1hNr5xisMF2qVrMW5tlQoH9oSg1DRUzl2OROF1FonBEZftxE3/szNnnpJDYXqEc4i7ovwWBIiK+gNmIrIlbw9FGVhZHKma8SfjKlQZ/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t05r+CAL3pz6/dpEja/NJ/dt5b+SbJMdrL+dc5u2Dbc=;
 b=GC3BnskPBH8Rpboh76V9DKelIK2jGWadXlUHCYJkraFwBcu5MFjUDAu5x/lzMyQ1H/wDnCPFqXmP/x49EKA9Txcpaegq3rJDOaThkltZEWrHpnOJ53wwQFMIJf0NMy60SecDbaMvEvb3puuof8mSj5e5zYEHlfmbKf6/OvzzZEXCPt5UfIrOM1Hk3RgKR82nKsm/FZEYVdAoLhzV5rdNiO2gw6vXsQDzQ361j7MoFWfbQg5cFkTZeYpfzABXoeEFUK9EPKbSfyz21cMKOhkqm9SenIYA2UxVLi7KfDwdjtPK2Noi3pyAfBXnBgqtp6JqIhaNauT4MGJ/i105/LYASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t05r+CAL3pz6/dpEja/NJ/dt5b+SbJMdrL+dc5u2Dbc=;
 b=KN994FjSG9mcbsE8CKVWoEf6upljZV1mfUS2hvDuXswfdtheo5OoON6bhB1sYX4wqVb0lsYgtKhoY4E4DQj/pFPM0q6jcii5nNpj7tpfCWm2Gcx4Y4TC/TqUG2G7CLf2hrhPY6KcSENt5libDBZRCJUCDZNc+V1kSPmfjQHoipM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6766.jpnprd01.prod.outlook.com (2603:1096:604:131::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 13:04:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 13:04:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Thread-Topic: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Thread-Index: AQHa51OiM5PSXaeUbUywn0dig27zKbIlpQaAgAj6hgA=
Date: Mon, 19 Aug 2024 13:04:10 +0000
Message-ID: <TY3PR01MB1134681586094C52C8533BC4B868C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
 <20240813194859.GI24634@pendragon.ideasonboard.com>
In-Reply-To: <20240813194859.GI24634@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6766:EE_
x-ms-office365-filtering-correlation-id: e4b36999-4c8a-4244-d6f9-08dcc04f6b00
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OTBaZGZOaURvMHEwSG9WTW12c29YREZqc1dFTndvckxkTGwwZ0dYalF5VFJP?=
 =?utf-8?B?ZUpUQk44dVo5NHFuQjlkVUU5K2RRMFZNM0dUSURwS3dhR25IcDNOMG04RWhh?=
 =?utf-8?B?ZytLRmVtdXZVeWVCLzBjU3UzZmFIM0lSbTREYldIVXRXeXNRSTdvNFcxa2hK?=
 =?utf-8?B?bGh1Y1RucGladVhBMFV2UkFCYkxNbExKd2xkM2hzeUlsUXVPU3JUczhzVWhN?=
 =?utf-8?B?Y3ZpdTU2QzFBUDFXQjRNSlNUbjBnT283cmNjVGVMODVlR3lkTmVRNDR6M2h5?=
 =?utf-8?B?WjJmRHJZYkE2SU9BVjd1ZGpxVTBuTmcvYkhPaFRLY1lCWm5VcmNOUk1LUFhY?=
 =?utf-8?B?UE12R3J2ZEZENzhqODY0NGpJa09PWjFqOTN4RXlBM0wvb0EzYmozb3BlR1lo?=
 =?utf-8?B?UEpCRXpNZlZubTNmZEdQdUVVNDJ5VkljeWQ5SXpVckNnUlhHVXJGKy9PRmdy?=
 =?utf-8?B?anhUNVZSUGY0ZjVkV2tWRktESkxwbjNydFlQT2dvYVM0WEw1aWkzemk2SEV3?=
 =?utf-8?B?dTZQVzlKZFF2SmNjOVIyNkpDeFBrcjVnWnFIbW9SS1JBb0krQTJQZ25aV3Q4?=
 =?utf-8?B?MWVLd3RHN1RpRmx6VlcxUWQwdFNFV21IRFozT1c3ekdWZU9mUmwwbTVHdE5j?=
 =?utf-8?B?NDg0SytKYkt1eW1QTFJLc2pZNGpvQWZmTS8xU3AwaElHNzUyR2xzWE9ZVXg1?=
 =?utf-8?B?RVJRbzZYUHowdmhMdkQ1NVc4Y1B6NHNiZWxRSXEyUjlIK2xLME91OXBSc0xC?=
 =?utf-8?B?QWp1T0ozdEVKRU5ONEZjUkRZVmJZTCsxMU5VNEc3WUpTMkQ4VlVaUDVXYWtC?=
 =?utf-8?B?RFI1VnRIZU1WSEN1WWFKc2FnN3p1UUo2NDdpSUUvWVBZOVowUFMxWGp1VDFy?=
 =?utf-8?B?UVBNMEdHNzdqaXBrTERhN0pLM2ZlcmE0czY2V3lvdGVtZUE2Tng4NHNFVTUy?=
 =?utf-8?B?cEFJWTRjbEdkTnhGU21TdExUdzdvSVd2emdxSFJWdzBKN3l3dnFNc3BSWkdw?=
 =?utf-8?B?S3Zwb3RMVktrSzNlZnZsUU4yazEwSnFUbElUMXFNTUJYZDdmMXpqRWRtOFRT?=
 =?utf-8?B?blFZUWlYS1FKSUc4WnFUTTBtZkJzRi95WlJpWTBhOFpGUHBWcFk4eW5WN0Rk?=
 =?utf-8?B?cFo2MDFEeUlRaFlCb0VQbStRZGRTWEhkOTF6amUvN0RIN1VYTmE5bi9Uamxo?=
 =?utf-8?B?WHlldUsyZGFtdk5UWitrZHM2cWJrbS9FRzVqeUN1Vm93RmJRMllYSndudGlW?=
 =?utf-8?B?YmJKTUt5bldvSXN2YnFRSTlOMy9UcTErM2ppVkhZNUcxYUUyS0lqeUhjRkc0?=
 =?utf-8?B?WHNhdHh3UFFzUWFOTGl3dDVrOUpsandQcXFvTGN3aTBGRmJWTkFKclZSMGN1?=
 =?utf-8?B?OTNkODNGM25wYjZ5MVRmM3REbHBYYVZVZXlSMzNWYll3RmFNSDdQSG1UVUxl?=
 =?utf-8?B?Z2dYekc4emNRc0dXamtNcG1QdjdrMzdvd0RSdUR1MHlrV09tZmgyQzhRUXl2?=
 =?utf-8?B?UThqclBEdlBLUW9QbysyY3FGcXFuZFBDWm1JUzQ5L0ZHZkxpeWRxd0sxeXc0?=
 =?utf-8?B?VEcwUUUycExlWDFZSXo1SXJCV1ZvSTU3MTVPQkRsc1pHbVdyOTd0THBvWkVz?=
 =?utf-8?B?dVVybmh1U3ltdDErU3drRmN3TGJSbGRNVzY2dHFsK3o3UWN3cDlYUm5oZjBO?=
 =?utf-8?B?a2RiVHBhcnNkM2kvR0FQb1UraUJEUEV5TmNTSEhDc1RjeDArenJmOVJobjVK?=
 =?utf-8?B?Sk56dy9ERVZtQlBXMzBXNG1QVE0xaVdWWlJISkJMc1ZtekkzWTNXT1dTcnEz?=
 =?utf-8?B?eVJtMDE2TDRiYVJxa1dQZ2RkdlE2Y0gyWHZROUZ6b3NZMmtEbkNZaHZQRDlM?=
 =?utf-8?B?UDZBR3kvK2pjQVdWRWdoWUFoa0F0S2EybXBpOTV0Sk9rekE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1E4aTVNeFZ2MEZ0aHNwZVFOcVVwVVFrZ0QzaE9WWGYrUUhWWWFTbDVsakI3?=
 =?utf-8?B?Wm1mYVJsWlZocUVxai8wOXdBcWh5KzZWTHZJMDhXN3prRGUzQnVVSHRoS3gz?=
 =?utf-8?B?R2dHK2VWdWt6ZDk0Q3pjRFdua2VwRWpUVTdNQkdDRFVtNCtMeVpTeitJYUFM?=
 =?utf-8?B?bktCd2tZTFlPd1RzalVRSUVYUUJqbUcyelM5dVF6czhOZDB0c0tiQ1FNbmxy?=
 =?utf-8?B?TkZyVTBuYWNnZ1dDbFJka1RYTnRheHY4b1BWTVRsOWIyRjhSdzVtbzAyVm1M?=
 =?utf-8?B?a2tiSExZbWs1UjkxVEhOSzB0MTRpdnE3MmlVRXF4aWtiYWxVcU5zeDhuNHNO?=
 =?utf-8?B?SHhvOXJmWVo0bDlaL3ovZnFka2lVNzlTTXlTV2d2L283akdaUmtuWUhGQ0wy?=
 =?utf-8?B?bDJuTEdFNUN4MDlMcG03ZU9ZK2pHZ2M4T0o0aE9yZ0N3NlJuQnV2Nk51V05o?=
 =?utf-8?B?K3g0NHdyM3dqQXB5anYrN2hWNkRZeEQxYWVveVE5YkQ1MUpjWURFSGc2TzVW?=
 =?utf-8?B?ZFFrUnNDVGtraElHT0lya1dKZGxLZUNvMFBESnorTnl4NHdNTFRlSWRzbmFn?=
 =?utf-8?B?dndLR250TXkza1N0d0lJSFJ0VXh4ZUhQczl1Y0xpUjRZbFdGVkpId3BrTk1h?=
 =?utf-8?B?SWxCYnI0RjJ5cHRhR21iZTFHUEswL3c2a0lpdmplYXFWUmRpN1F0cFkwOUhB?=
 =?utf-8?B?VWNUa1J2QWxrcWpKTGpmRWQxYlppQW91SExsY1FMUVZ0MldyVndQUngxRGRp?=
 =?utf-8?B?eEJpek1yb2wxdkJPT3dneGpWZkRjVk9kKzN2dmJFYkx0eTdQRUJ3c2ZpeWc1?=
 =?utf-8?B?Q1llcEtzWGd5Q0g1NlRlbi95MjkwazFHTFBXR25oaTh2dlB0YVI0Ly9Va1VV?=
 =?utf-8?B?ZTMzVUt4cXdyd0lLNzJIa3V2aFRnRzNvREs2MWpyS2cxTGlsWlNxOERZd1ZX?=
 =?utf-8?B?dGozc2tEQTZNV1NKNFhkMStUMWU4Q0JJSzBLV2JReXVxalV2QjNSQkIxTDgz?=
 =?utf-8?B?VC9HT0Y2QTR5MEhiTG5SYW5KM0VnZkduOFNMKzl1RHJpalkzZ0hPUXpzZXZk?=
 =?utf-8?B?RnZYajBOTGpnc1RaNXdObXQrODRZcEZ5KzhCVld1T1JaMkhOYWkyQ0NGNUJV?=
 =?utf-8?B?RHQzVy96WElBSXdrclhiMkhBV281SytDWndXQXdzbWxEY2NiUTNXRVp5WXJi?=
 =?utf-8?B?UWRESUV2T0MrMTV1cEdmZUtZNElWSmlJckk5VGdxMFZ4dk4xMENJN1NWcHQ5?=
 =?utf-8?B?TzFUYWN2UXhxZ09Bb0IyQ01xQ2pLZTBtbGdYcFJRTUw0VEdiNDY2Wldoankw?=
 =?utf-8?B?c1hXWGZhQUE2bVEyK1BpeFVTT0pmL1dobFZrV0lxT3JHRXpkRFkvWDlqYWM4?=
 =?utf-8?B?WVJuNmg3UllPbVo3WGNSRUp0VEVYQzlDNVZQN3dTand0WHU3d3JEWFZ6QXRy?=
 =?utf-8?B?RjNaUTg4VGwxR0RFNTh6T2RaUEFoT283dEMyMHJrNTNVOHJTUG9Ic2pGVDdr?=
 =?utf-8?B?WUEyVURDQ25jdXdkcy9CZDd1OElDV1hDTFpqQ0dlQWczanBzQnpLOGJYUlN6?=
 =?utf-8?B?T0VUdDdzOVlWMWpJSERQNFpyNlRidDRUdm5ldU93V29xc3EwNlEwMzNXanVn?=
 =?utf-8?B?SnVEQ0lYY1BYdWhiZmN1OXR1MEN4U0NwMjJzUnQ5NXAvemhrMnM2RWVOeVRL?=
 =?utf-8?B?RzB6SUxucUJKdGt2RVhGNkptanB1a0YwNys4Qkp1djVnN1Vrc3F6RGE0NTMr?=
 =?utf-8?B?OG5EdFVUT0c3aktqN1RoR2NEOEJMNWc1LzFCcCt3L0lVV2kzdHVUb3U3L2M0?=
 =?utf-8?B?S3Zxck01RjlENzViUldoYUs1NDVJOGRVQkY5VEFHVHdPZy94YVhkYU5vUDZ6?=
 =?utf-8?B?ZmN0b2U3VE02NFFTUzhjakhEUndhQWoxZUk4WVNZWUFEMkk1bFlCbGNXMjRM?=
 =?utf-8?B?azB3aC9ZaUQ4SUYzZUFYdk1FZ2tjeE5raUZZRC9qV1dFVzBzWW5icStrcSsw?=
 =?utf-8?B?OWwzUlVTK3Y0ODBzU0R3WSsxSGUyQ2d5c3pqdyt6Y3JxcDFUWWlvN2IyWk5u?=
 =?utf-8?B?VE44TFVWckNjN2xuNS9UWmx5eFZEcG44OWJqa1kvdVhXaHFNZjZUVEc2OXJM?=
 =?utf-8?B?eFU0VkFDTnlYL3JrWWNuVFJaSTRJR1p5Y2Y3akJsaVQzbjNoelRoTW0yeVhB?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b36999-4c8a-4244-d6f9-08dcc04f6b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 13:04:10.9547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WyQ50FT8906AC5zT+38jQXonRaGXGrXLfZQmuo44w+Xee3G7IN75CEUbjqrFKT0ZKzQppuzJsFFVf+Eqbb21+GSA2+3ZXusbkX99kfWeKBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6766
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
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMTMsIDIwMjQgODo0
OSBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvNF0gZHJtOiByZW5lc2FzOiByei1kdTog
QWRkIFJaL0cyVUwgRFUgU3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLg0KPiANCj4gT24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMDQ6NTI6MzZQTSAr
MDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gVGhlIExDRCBjb250cm9sbGVyIGlzIGNvbXBvc2Vk
IG9mIEZyYW1lIENvbXByZXNzaW9uIFByb2Nlc3NvciAoRkNQVkQpLA0KPiA+IFZpZGVvIFNpZ25h
bCBQcm9jZXNzb3IgKFZTUEQpLCBhbmQgRGlzcGxheSBVbml0IChEVSkuDQo+ID4NCj4gPiBJdCBo
YXMgRFBJIGludGVyZmFjZSBhbmQgc3VwcG9ydHMgYSBtYXhpbXVtIHJlc29sdXRpb24gb2YgV1hH
QSBhbG9uZw0KPiA+IHdpdGggMiBSUEZzIHRvIHN1cHBvcnQgdGhlIGJsZW5kaW5nIG9mIHR3byBw
aWN0dXJlIGxheWVycyBhbmQgcmFzdGVyDQo+ID4gb3BlcmF0aW9ucyAoUk9QcykuDQo+ID4NCj4g
PiBUaGUgRFUgbW9kdWxlIGlzIGNvbm5lY3RlZCB0byBWU1BELiBBZGQgUlovRzJVTCBEVSBzdXBw
b3J0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAgKiBBdm9pZGVkIHRoZSBsaW5l
IGJyZWFrIGluIHJ6ZzJsX2R1X3N0YXJ0X3N0b3AoKSBmb3IgcnN0YXRlLg0KPiA+ICAqIFJlcGxh
Y2VkIHBvcnQtPmR1X291dHB1dCBpbiAgc3RydWN0IHJ6ZzJsX2R1X291dHB1dF9yb3V0aW5nIGFu
ZA0KPiA+ICAgIGRyb3BwZWQgdXNpbmcgdGhlIHBvcnQgbnVtYmVyIHRvIGluZGljYXRlIHRoZSBv
dXRwdXQgdHlwZSBpbg0KPiA+ICAgIHJ6ZzJsX2R1X2VuY29kZXJzX2luaXQoKS4NCj4gPiAgKiBV
cGRhdGVkIHJ6ZzJsX2R1X3I5YTA3ZzA0M3VfaW5mbyBhbmQgcnpnMmxfZHVfcjlhMDdnMDQ0X2lu
Zm8NCj4gPiB2MS0+djI6DQo+ID4gICogTm8gY2hhbmdlLg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9jcnRjLmMgfCAgOCArKysrKysrLQ0KPiA+
IGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5jICB8IDE4ICsrKysr
KysrKysrKysrKystLQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1
X2Rydi5oICB8ICA1ICsrKy0tDQo+ID4gZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpn
MmxfZHVfa21zLmMgIHwgIDQgKystLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yei1kdS9yemcybF9kdV9jcnRjLmMNCj4gPiBpbmRleCA2ZTdhYWM2MjE5YmUuLmZk
NzY3NWM3ZjE4MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9kdV9jcnRjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9kdV9jcnRjLmMNCj4gPiBAQCAtMjgsNiArMjgsNyBAQA0KPiA+ICAjaW5jbHVkZSAi
cnpnMmxfZHVfdnNwLmgiDQo+ID4NCj4gPiAgI2RlZmluZSBEVV9NQ1IwCQkJMHgwMA0KPiA+ICsj
ZGVmaW5lIERVX01DUjBfRFBJX09FCQlCSVQoMCkNCj4gPiAgI2RlZmluZSBEVV9NQ1IwX0RJX0VO
CQlCSVQoOCkNCj4gPg0KPiA+ICAjZGVmaW5lIERVX0RJVFIwCQkweDEwDQo+ID4gQEAgLTIxNiw5
ICsyMTcsMTQgQEAgc3RhdGljIHZvaWQgcnpnMmxfZHVfY3J0Y19wdXQoc3RydWN0DQo+ID4gcnpn
MmxfZHVfY3J0YyAqcmNydGMpDQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgcnpnMmxfZHVfc3RhcnRf
c3RvcChzdHJ1Y3QgcnpnMmxfZHVfY3J0YyAqcmNydGMsIGJvb2wNCj4gPiBzdGFydCkgIHsNCj4g
PiArCXN0cnVjdCByemcybF9kdV9jcnRjX3N0YXRlICpyc3RhdGUgPQ0KPiA+ICt0b19yemcybF9j
cnRjX3N0YXRlKHJjcnRjLT5jcnRjLnN0YXRlKTsNCj4gPiAgCXN0cnVjdCByemcybF9kdV9kZXZp
Y2UgKnJjZHUgPSByY3J0Yy0+ZGV2Ow0KPiA+ICsJdTMyIHZhbCA9IERVX01DUjBfRElfRU47DQo+
ID4NCj4gPiAtCXdyaXRlbChzdGFydCA/IERVX01DUjBfRElfRU4gOiAwLCByY2R1LT5tbWlvICsg
RFVfTUNSMCk7DQo+ID4gKwlpZiAocnN0YXRlLT5vdXRwdXRzID09IEJJVChSWkcyTF9EVV9PVVRQ
VVRfRFBBRDApKQ0KPiANCj4gSXMgb3V0cHV0IHN1cHBvc2VkIHRvIGNvbnRhaW4gYSBzaW5nbGUg
Yml0LCBvciBjYW4gaXQgY29udGFpbiBtdWx0aXBsZSBiaXRzID8gSW4gdGhlIGZpcnN0IGNhc2Ug
SQ0KPiB3b3VsZCByZW5hbWUgaXQgdG8gb3V0cHV0LCBpbiB0aGUgc2Vjb25kIGNhc2UgeW91IHNo
b3VsZCBwcm9iYWJseSB1c2UgJyYnIGluc3RlYWQgb2YgJz09Jy4NCg0KSXQgbWF5IGNvbnRhaW4g
bXVsdGlwbGUgYml0cyBmb3IgdGhlIGZ1dHVyZSBTb0NzLiBTbywgSSB3aWxsIHVzZSAnJicgaW5z
dGVhZC4NCg0KPiANCj4gPiArCQl2YWwgfD0gRFVfTUNSMF9EUElfT0U7DQo+ID4gKw0KPiA+ICsJ
d3JpdGVsKHN0YXJ0ID8gdmFsIDogMCwgcmNkdS0+bW1pbyArIERVX01DUjApOw0KPiA+ICB9DQo+
ID4NCj4gPiAgc3RhdGljIHZvaWQgcnpnMmxfZHVfY3J0Y19zdGFydChzdHJ1Y3QgcnpnMmxfZHVf
Y3J0YyAqcmNydGMpIGRpZmYNCj4gPiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6
LWR1L3J6ZzJsX2R1X2Rydi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9y
emcybF9kdV9kcnYuYw0KPiA+IGluZGV4IGU1ZWNhODY5MWEzMy4uNjliOGUyMTZlZTFhIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2Rydi5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2LmMN
Cj4gPiBAQCAtMjUsMjEgKzI1LDM1IEBADQo+ID4gICAqIERldmljZSBJbmZvcm1hdGlvbg0KPiA+
ICAgKi8NCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX2R1X2RldmljZV9pbmZv
IHJ6ZzJsX2R1X3I5YTA3ZzA0M3VfaW5mbyA9IHsNCj4gPiArCS5jaGFubmVsc19tYXNrID0gQklU
KDApLA0KPiA+ICsJLnJvdXRlcyA9IHsNCj4gPiArCQlbUlpHMkxfRFVfT1VUUFVUX0RTSTBdID0g
ew0KPiA+ICsJCQkuZHVfb3V0cHV0ID0gUlpHMkxfRFVfT1VUUFVUX0lOVkFMSUQsDQo+ID4gKwkJ
fSwNCj4gDQo+IFlvdSBjYW4gZHJvcCB0aGlzIGVudHJ5LCBhcyB3ZWxsIGFzIHRoZSBSWkcyTF9E
VV9PVVRQVVRfSU5WQUxJRCBtYWNyby4NCj4gU2VlIGJlbG93Lg0KT0suDQo+IA0KPiA+ICsJCVtS
WkcyTF9EVV9PVVRQVVRfRFBBRDBdID0gew0KPiA+ICsJCQkucG9zc2libGVfb3V0cHV0cyA9IEJJ
VCgwKSwNCj4gPiArCQkJLmR1X291dHB1dCA9IFJaRzJMX0RVX09VVFBVVF9EUEFEMCwNCj4gPiAr
CQl9LA0KPiA+ICsJfSwNCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cnpnMmxfZHVfZGV2aWNlX2luZm8gcnpnMmxfZHVfcjlhMDdnMDQ0X2luZm8gPSB7DQo+ID4gIAku
Y2hhbm5lbHNfbWFzayA9IEJJVCgwKSwNCj4gPiAgCS5yb3V0ZXMgPSB7DQo+ID4gIAkJW1JaRzJM
X0RVX09VVFBVVF9EU0kwXSA9IHsNCj4gPiAgCQkJLnBvc3NpYmxlX291dHB1dHMgPSBCSVQoMCks
DQo+ID4gLQkJCS5wb3J0ID0gMCwNCj4gPiArCQkJLmR1X291dHB1dCA9IFJaRzJMX0RVX09VVFBV
VF9EU0kwLA0KPiA+ICAJCX0sDQo+ID4gIAkJW1JaRzJMX0RVX09VVFBVVF9EUEFEMF0gPSB7DQo+
ID4gIAkJCS5wb3NzaWJsZV9vdXRwdXRzID0gQklUKDApLA0KPiA+IC0JCQkucG9ydCA9IDEsDQo+
ID4gKwkJCS5kdV9vdXRwdXQgPSBSWkcyTF9EVV9PVVRQVVRfRFBBRDAsDQo+ID4gIAkJfQ0KPiA+
ICAJfQ0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHJ6ZzJsX2R1X29mX3RhYmxlW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMs
cjlhMDdnMDQzdS1kdSIsIC5kYXRhID0NCj4gPiArJnJ6ZzJsX2R1X3I5YTA3ZzA0M3VfaW5mbyB9
LA0KPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA0NC1kdSIsIC5kYXRhID0g
JnJ6ZzJsX2R1X3I5YTA3ZzA0NF9pbmZvIH0sDQo+ID4gIAl7IC8qIHNlbnRpbmVsICovIH0NCj4g
PiAgfTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpn
MmxfZHVfZHJ2LmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1
X2Rydi5oDQo+ID4gaW5kZXggNTg4MDZjMmE4ZjJiLi5hYjgyYjVjODZkNmUgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfZHJ2LmgNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9kcnYuaA0KPiA+IEBA
IC0yOSw3ICsyOSw3IEBAIGVudW0gcnpnMmxfZHVfb3V0cHV0IHsNCj4gPiAgLyoNCj4gPiAgICog
c3RydWN0IHJ6ZzJsX2R1X291dHB1dF9yb3V0aW5nIC0gT3V0cHV0IHJvdXRpbmcgc3BlY2lmaWNh
dGlvbg0KPiA+ICAgKiBAcG9zc2libGVfb3V0cHV0czogYml0bWFzayBvZiBwb3NzaWJsZSBvdXRw
dXRzDQo+ID4gLSAqIEBwb3J0OiBkZXZpY2UgdHJlZSBwb3J0IG51bWJlciBjb3JyZXNwb25kaW5n
IHRvIHRoaXMgb3V0cHV0IHJvdXRlDQo+ID4gKyAqIEBkdV9vdXRwdXQ6IERVIG91dHB1dA0KPiA+
ICAgKg0KPiA+ICAgKiBUaGUgRFUgaGFzIDIgcG9zc2libGUgb3V0cHV0cyAoRFBBRDAsIERTSTAp
LiBPdXRwdXQgcm91dGluZyBkYXRhDQo+ID4gICAqIHNwZWNpZnkgdGhlIHZhbGlkIFNvQyBvdXRw
dXRzLCB3aGljaCBDUlRDIGNhbiBkcml2ZSB0aGUgb3V0cHV0LA0KPiA+IGFuZCB0aGUgdHlwZSBA
QCAtMzcsNyArMzcsNyBAQCBlbnVtIHJ6ZzJsX2R1X291dHB1dCB7DQo+ID4gICAqLw0KPiA+ICBz
dHJ1Y3QgcnpnMmxfZHVfb3V0cHV0X3JvdXRpbmcgew0KPiA+ICAJdW5zaWduZWQgaW50IHBvc3Np
YmxlX291dHB1dHM7DQo+ID4gLQl1bnNpZ25lZCBpbnQgcG9ydDsNCj4gPiArCXVuc2lnbmVkIGlu
dCBkdV9vdXRwdXQ7DQo+ID4gIH07DQo+ID4NCj4gPiAgLyoNCj4gPiBAQCAtNTMsNiArNTMsNyBA
QCBzdHJ1Y3QgcnpnMmxfZHVfZGV2aWNlX2luZm8gew0KPiA+ICAjZGVmaW5lIFJaRzJMX0RVX01B
WF9DUlRDUwkJMQ0KPiA+ICAjZGVmaW5lIFJaRzJMX0RVX01BWF9WU1BTCQkxDQo+ID4gICNkZWZp
bmUgUlpHMkxfRFVfTUFYX0RTSQkJMQ0KPiA+ICsjZGVmaW5lIFJaRzJMX0RVX09VVFBVVF9JTlZB
TElECQktMQ0KPiA+DQo+ID4gIHN0cnVjdCByemcybF9kdV9kZXZpY2Ugew0KPiA+ICAJc3RydWN0
IGRldmljZSAqZGV2Ow0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9y
ei1kdS9yemcybF9kdV9rbXMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUv
cnpnMmxfZHVfa21zLmMNCj4gPiBpbmRleCAwN2IzMTJiNmY4MWUuLjM2MTM1MGYyOTk5ZSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9rbXMu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2ttcy5j
DQo+ID4gQEAgLTE4Myw4ICsxODMsOCBAQCBzdGF0aWMgaW50IHJ6ZzJsX2R1X2VuY29kZXJzX2lu
aXQoc3RydWN0DQo+ID4gcnpnMmxfZHVfZGV2aWNlICpyY2R1KQ0KPiA+DQo+ID4gIAkJLyogRmlu
ZCB0aGUgb3V0cHV0IHJvdXRlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIHBvcnQgbnVtYmVyLiAqLw0K
PiA+ICAJCWZvciAoaSA9IDA7IGkgPCBSWkcyTF9EVV9PVVRQVVRfTUFYOyArK2kpIHsNCj4gPiAt
CQkJaWYgKHJjZHUtPmluZm8tPnJvdXRlc1tpXS5wb3J0ID09IGVwLnBvcnQpIHsNCj4gPiAtCQkJ
CW91dHB1dCA9IGk7DQo+ID4gKwkJCWlmIChpID09IHJjZHUtPmluZm8tPnJvdXRlc1tpXS5kdV9v
dXRwdXQpIHsNCj4gDQo+IElmIEkgdW5kZXJzdGFuZCB0aGUgY29kZSBjb3JyZWN0bHksIHRoaXMg
d2lsbCBhbHdheXMgYmUgdHJ1ZSBleGNlcHQgZm9yIHRoZSByb3V0ZXMgbWFya2VkIHdpdGgNCj4g
UlpHMkxfRFVfT1VUUFVUX0lOVkFMSUQsIHNvIHlvdSB3aWxsIG1hdGNoIHRoZSBmaXJzdCB2YWxp
ZCByb3V0ZSwgcmVnYXJkbGVzcyBvZiB0aGUgdmFsdWUgb2YgZXAucG9ydC4NCj4gSSBkb24ndCB0
aGluayB0aGF0J3MgY29ycmVjdC4NCj4gDQo+IEkgd291bGQga2VlcCB0aGUgcG9ydCBmaWVsZCBp
biB0aGUgcnpnMmxfZHVfb3V0cHV0X3JvdXRpbmcsIGRyb3AgdGhlIG5ld2x5IGFkZGVkIGR1X291
dHB1dCBmaWVsZCwgYW5kDQo+IHVzZSB0aGUgZm9sbG93aW5nIGxvZ2ljOg0KPiANCj4gCQlmb3Ig
KGkgPSAwOyBpIDwgUlpHMkxfRFVfT1VUUFVUX01BWDsgKytpKSB7DQo+IAkJCWlmIChyY2R1LT5p
bmZvLT5yb3V0ZXNbaV0ucG9zc2libGVfb3V0cHV0cyAmJg0KPiAJCQkgICAgcmNkdS0+aW5mby0+
cm91dGVzW2ldLnBvcnQgPT0gZXAucG9ydCkgew0KPiAJCQkJb3V0cHV0ID0gaTsNCj4gCQkJCWJy
ZWFrOw0KPiAJCQl9DQo+IAkJfQ0KPiANCj4gVGVzdGluZyBwb3NzaWJsZV9vdXRwdXRzIHNraXBz
IHRoZSByb3V0ZXMgdGhhdCBkb24ndCBleGlzdCBmb3IgdGhlIGRldmljZSwgYW5kIHRoZSBlcC5w
b3J0IGNvbXBhcmlzb24NCj4gcGlja3MgdGhlIHJvdXRlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIHBv
cnQuDQoNClRoYW5rcywgdGhpcyB3aWxsIHdvcmsuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4g
PiArCQkJCW91dHB1dCA9IHJjZHUtPmluZm8tPnJvdXRlc1tpXS5kdV9vdXRwdXQ7DQo+ID4gIAkJ
CQlicmVhazsNCj4gPiAgCQkJfQ0KPiA+ICAJCX0NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0K
PiBMYXVyZW50IFBpbmNoYXJ0DQo=
