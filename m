Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109CB8724EC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7F710E513;
	Tue,  5 Mar 2024 16:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KVSOk2PB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2080.outbound.protection.outlook.com [40.107.114.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFF210E513
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrO9pkgB9xo+l8is0XOJIOWU0UGD8ghqyidjI3B8YwUKp4iAqEPcTUwumNVQzJVZTCqmpV8GIKkGo8Su66nfaSmKEANXDHNBtfVMfSQOwH2GiAaEKlcp1QDIachOccRmyp0IvlaEegEuA6dlAv5K2nfoU+j7qP36IpzrGd+Vgxff+0098sszterVJY548sNgn8PQc4wEZ1fbWBg61ZYyrMiEvjol/grB0HwZoyP3q+IeUK47SMz3BF+q/S38+cb5Erp+4igel+KuMk0eerlVQfXu0fJQEXBVyL1g39+ejxleYd97kkgzeZadeU1CylourIqiTizUoHXa20jGfRGaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML1J6hkg5GixvlWzw5LtthjwpUPkd78KYMelPCfPmt0=;
 b=MVDpq1Dhq0W0Epxr2iZ23L+au/pCzzJRgQ4Bs3SmzABb59xjsl1jcpYzPeMowDXUhHH3wr9MABbABUIiZ/VM7slQYVKaCA8QFoRWN5GljyoXVQWrLI8hT612LCYD1c4KRAHH8NXB1cFuuqMsN7loXY7RXfz4KBdJYkyFQEg1UzTGs22jUqvwqOSXTXpL6qKFIBtfkY4rhOUf+n2b9FXUCLI/Zsucf+OfU45eh5UFIREwD6IS3CFatxUt9jSbH7w5peejPLM9kP1ljwXzGG+2GPL1aGHWib7DWI+jhPqpFaCbymi8faG3n8hYACXuW7Ql1ck35BjguBwfkAkV7YSMYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML1J6hkg5GixvlWzw5LtthjwpUPkd78KYMelPCfPmt0=;
 b=KVSOk2PB21R8j4DQvbzc3DPDYr4wq3YtGHnwIPBFa7Bb/j8sVSeesIGqeQRDhsvgX5mS4P6l0Rv+aB4VtwZYxnuo+C1C19FifsXNcub0dxcytaqDGhEbmtGJfX6B1Nrs65V2cFZuaiFdwv6fGdjSMQ7zvCEDiBQuMiVMJEAKOt8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB7728.jpnprd01.prod.outlook.com
 (2603:1096:400:181::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 16:55:28 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::9013:d19:4845:e226]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::9013:d19:4845:e226%4]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 16:55:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Frank Binns <Frank.Binns@imgtec.com>, "aford173@gmail.com"
 <aford173@gmail.com>
CC: "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Matt Coster <Matt.Coster@imgtec.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "nm@ti.com" <nm@ti.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Sarah Walker <Sarah.Walker@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: RE: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Topic: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Index: AQHaYDAOR2pL22/lvECLyWXYf8dUVbELo4AAgAADRQCAHYGtAIAAHnkAgAAw+ACAAAL1oA==
Date: Tue, 5 Mar 2024 16:55:28 +0000
Message-ID: <TYCPR01MB11269ABEBC065C9A637F10EDB86222@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <76065296ad514898e2b8c29cd921c104b3692ae0.camel@imgtec.com>
 <CAHCN7xJ6uEghqDcUTKKQg7Lcg8uF55rz=vEHF=1xHRYfsDNGsA@mail.gmail.com>
 <9515180b63a41a419c2f7561feebde1da93a11ad.camel@imgtec.com>
In-Reply-To: <9515180b63a41a419c2f7561feebde1da93a11ad.camel@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB7728:EE_
x-ms-office365-filtering-correlation-id: 5cc18a1f-f2f4-4786-6aec-08dc3d350fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yxfvbPXceKM4MbUCo34E73QoGycsrHswWP7zciYCQM9knOx/CojESsu3Ec/Q7SzqVhEGjv/2DgjW/VHX2uUuNTTICYexV1+dOC4Bq50u8CaYiPsUQM4hUCND6VS54Orce60/8v31DDDmzloROo7tNdBGeMPdwkeUy19yhx+66loAVizVfBSYsTOIDefHZobU3l05gF/r4mJS4XWsIILxjRj91n9cFL+KXoiKPnmT22ahHzjPgLdl++x26/GnVyFF9xGRHWVGdv+IHIOkQ3x8a0jf870HlGzldxmrUSK77FdXX4712GHOvSFzi6ciBfN02QtwYf6cmghvRvsd+4op26r8TCSLvtLtSbC0JVNlTLDDOV5f1GdDE3/ucSBHa/R3U0fVOmk/wH3E18azw9iCJDKNiv7qQ+45X6GEGQg9b+yuw2c5Ztwl2mcG1WSFQnnzc45CX36OQx9pyWKbkexylFFfLbkpvWf35lHqm1Ir/jZomU745IZw64lNymvXBJJnXtWkTYXaTfqvk3yfLUv25XPzk0ck+hTTB6XlXnmjfAwThjAdl3/YYX3vx4+jHurPKwMNtqp7lXcEEWc/T/jdNARX1Er/FtlWjXKxCbuz+HB3pmnOruDIoQxcB27y/fDe3rZaqc6AWev18VOb6jezyiNZGcnktceQithRPAJNsc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGVaa3AyUEYrR0dMZ2U2a213MVZZYzg5RmRJcTVEOTUwR2t0Q1IyM29PK1VM?=
 =?utf-8?B?eXdtL1VSdHByaDc4N2RpdE00WEF1U28rVk9lWHdEQ3hEQ0JGN3hQVzFwZHVD?=
 =?utf-8?B?MjErM1NtSnN0QWtIM3RFbGJBK203VGhaQnNuN2xzcFpHdUlRSlpIQWlnTkZi?=
 =?utf-8?B?Ri9zdURXNGlZcE02S3dqNGdaYmxPcm9YK0NXMFNpcmJhUHBaTnhUTTV4dFZu?=
 =?utf-8?B?UVdWdmJHTW41SkZGallnZkNWZUhRMXgzeVUva3drZ0JUbmNUbDNOdXFDTThB?=
 =?utf-8?B?bnRVVWozdXZHSVlMNSs0NGNlRFpDdmVCVUV3V3VJam51MFRJOFJrbS9UdEl0?=
 =?utf-8?B?Sm9VMnJwUlFCKzBLU0dDNlRTUStFdmhnbWFPZGNreWhqd0NaY1p5TE8wOFZr?=
 =?utf-8?B?MTJzeHFheS9CRFVHUlhlbmNWaHArc3FMSTJwZ1dGMTB4dVVPL28va0ROSDlY?=
 =?utf-8?B?Um1OQ3FuaE9KVnQ2aFJzVk82MFlHTGNienVJaXlHbExUM01OZW14K1VUem5s?=
 =?utf-8?B?dWFVTVhiY2tINjFNMHV6ckxtalJmUTk2ZmRCalJQUldIclM2ZkthTHdrOXI1?=
 =?utf-8?B?bE9iTmgrSnIyalEvZUhaZ2h1eFdSRS9jTVNlN3ZjclBoUHpVZisxdkxkMWhS?=
 =?utf-8?B?NDFBa0tlNDJ3WUsrRHAvbnErR2MzV0FCZE4yNkJhRllYLzM5MHBXUnM4T04y?=
 =?utf-8?B?Uzk2NnE2TDhlZmpnRDN6VTlob3lvS0FRSzZXTjYzOHBhYndEZDZDMnRLOEhy?=
 =?utf-8?B?RjFncExHMnVSZU5BNzNabUl2cGRObG45TW5VV1NRMjdkcUVsYklEUzY4SnZJ?=
 =?utf-8?B?L1dxcnVrUURwZnRxMk9rR1VseU9ENzVBREI5KzIra1dUOWE0cFdaNDF6UUp3?=
 =?utf-8?B?Z3V0ZXNER2RmemZTWGJsaVUyN2hKV1IzS1dWakNTdWRCRC82OTYxTy9WK29M?=
 =?utf-8?B?S3VQeWh5ait0ZjVuWTNJRExXRHIzcmR0c25RSGF3THRkOHUreUFBMytoUUZR?=
 =?utf-8?B?SmtuK2hCQ3I5TVQ3R1FYdk1FaHdDR0x0UVpFMldjRlZLdXpwdWM0V3BoOWds?=
 =?utf-8?B?WFJ6UC9JdXN2d2RKdlVUVlBYWHlQOGxDWnZZWjVYT0Erc2FwU0NUVlBSdmRS?=
 =?utf-8?B?V3hQQ1k2SndHQXhwOG5YRnR5UWRseGV6WWxYeEpCNGJTZFE1MXY1aksyYTF6?=
 =?utf-8?B?OEZ3UDVNTEdETHpuQ2F1TTdac1oyUXQvcmFyUU1ONFV6MTFaNXR4M05IdnF0?=
 =?utf-8?B?TkpEV0tkamxsYlBLcjdvaGg3MVd0K2R3NXRLMzJVSzFOQVF4Z2ErQjkyakJO?=
 =?utf-8?B?ZVR3Nm5FalUza3pDb29tS2JkNGNORTl2N2Y1OGRIaGhvclRCMUZYQkEreFhO?=
 =?utf-8?B?T081VEQ2NE0wYTBSUitQTE10ZEJwZDZZQStqcEFZQTUwRnNVTEdmSWtxc0Fq?=
 =?utf-8?B?eXZXcXkxRFR1L0xhd0IzWXRPcFlmZWpoNVNiV3VLMVFwODk3cGcvM29zY0wv?=
 =?utf-8?B?VzYrM2kzOXVRbTZmQXBaa2FHemhxVzlLVXZJNWxkazVyenR1VzM5cGc3QnE3?=
 =?utf-8?B?cjZSRy80UFZGNG9XQml0NXNBNTRMS2FxU0l0K1FtT3hYRlMremZvMFA0UVla?=
 =?utf-8?B?M08wWjVISGF4dUNtVXM3VTRCRDlNRmdnOFRrcVlDSEtHZENaakxPRUVWZE52?=
 =?utf-8?B?UHErcnVUYTIrM0VVSzNwUmFseWYyTGUvNTFPWS9jbThuNlVJdTF4cDFJVHMr?=
 =?utf-8?B?MWtBdmFTcG1NckpRMWQyMXhoOUE3WS9iZW1BYVQ5KzJmdlcrY0pQenVKV2tn?=
 =?utf-8?B?a1JUODBuL2U1TXhReksva2dyZS9CVCtXMk8vTlpEVTZiMllzU1ZpKyt1UWNQ?=
 =?utf-8?B?SmVKVFlPQWRYdGtiVzBLQUNzbGV6V1JZbnRpM1YrNUQvcFRoMnNJZE9xc3Rm?=
 =?utf-8?B?bGZubGFHSjBJZzQ0RnBPRnBEbWdYQnZobmkrWWJVNlUwYUdFVmVlU3pRYVB6?=
 =?utf-8?B?Q0Yzb1JOZElwcXRscExPNGNidGdJV0Y1eEM0WXZNNXBZT3lrWHNWS096NDNU?=
 =?utf-8?B?VERnaEpJdlgvSGNqM3hoemxvMFFtSTFKTzMvYlowdDBWaDQydXlUYjFWYlo4?=
 =?utf-8?B?WnVrc2xxOXRvSjh1NlV6YURpczBpOTlPa1ZEcnJMNngxUU5WYmRQSGVzRFph?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc18a1f-f2f4-4786-6aec-08dc3d350fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 16:55:28.4853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQdm1dWqQTBzrmzES4PyWPJ/s/uixejUnfGYyHjYcfqHzAbxB8rgLimccFOh21QJADiW9mQ2110q8DnQyhDRpMnsdxXB7NwLR9Vmw9NQx3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7728
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

SGkgRnJhbmssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsg
QmlubnMgPEZyYW5rLkJpbm5zQGltZ3RlYy5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDUs
IDIwMjQgNDo0MyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0vaW1hZ2luYXRpb246
IERSTV9QT1dFUlZSIHNob3VsZCBkZXBlbmQgb24gQVJDSF9LMw0KPiANCj4gT24gVHVlLCAyMDI0
LTAzLTA1IGF0IDA3OjQ3IC0wNjAwLCBBZGFtIEZvcmQgd3JvdGU6DQo+ID4gT24gVHVlLCBNYXIg
NSwgMjAyNCBhdCA1OjU44oCvQU0gRnJhbmsgQmlubnMgPEZyYW5rLkJpbm5zQGltZ3RlYy5jb20+
IHdyb3RlOg0KPiA+ID4gSGkgQWRhbSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIG9mZmVyLCB0
aGF0IGlzIHZlcnkgbXVjaCBhcHByZWNpYXRlZCENCj4gDQo+IERvIHlvdSBoYXBwZW4gdG8ga25v
dyBpZiB0aG9zZSBwbGF0Zm9ybXMgKG9yIG9uZXMgd2l0aCB0aGUgc2FtZSBTb0MgaW4pIGFyZSBh
dmFpbGFibGUgZm9yIHB1cmNoYXNlPw0KDQpPbmUgc3VjaCBwbGF0Zm9ybSBhdmFpbGFibGUgaGVy
ZVsxXQ0KDQpbMV0NCmh0dHBzOi8vd3d3LmFtYXpvbi5kZS9MSU1FTkFNSUNTLUhvY2hsZWlzdHVu
Z3MtQm9hcmQtaG9jaGF1ZmwlQzMlQjZzZW5kZS1mb3J0c2Nocml0dGxpY2hlci1HZW5lcmF0aW9u
L2RwL0IwOFJOTVNEWTMvcmVmP3RoPTENCg0KQ2hlZXJzLA0KQmlqdQ0K
