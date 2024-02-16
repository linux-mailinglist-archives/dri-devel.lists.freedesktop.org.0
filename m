Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2879885789B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F2410EA92;
	Fri, 16 Feb 2024 09:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Zn84cvk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2073.outbound.protection.outlook.com [40.107.113.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3E510EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 09:13:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8CcbMttNHELT7/gv4noNTF2BdSAAna07wqGP38MkUWzy2ZxbsrFE7eBzqpmmMVPnagQOBlkszm6ZG98g0MSgMaNIf/QUmTNkqv4FN0foNRdNfgNZaufKzbrdebXTA8dL/9jv5iZglxRuzfBetuUc3aVhleyPqDM6BmEmvbs+tRIE/GWznYl3CBY3taptu1Z5+f8POaVl2OzZ4wzNi9o2Y8lX2H2180u9XoHrQsM7DNV0Jg3WlyPSWq/qVjtNrUDSEiRVRxvX8Oa4f2mdFzidKAJySLuU4hQCntKPEmCbh7lyOH9Cf7Diu1O9Xqhf6FJbvqcEVTGTDnRi8LODWAD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHlJ1wFhqO599bg6UHZPVt7fsKgmFlJx0/BWZ5wApdI=;
 b=HKdXpIIlf57iXfdbAO24q7eJ0lN+clbBSyMKsiaYrRCo7zNs5oR+yK2ulr+2e3CoBPFk0Hpf5U8vjlmcd7Z2zVRn8LKpBuG39NPhK/gD30Dl+qglwUrYYt7Hr8XnpJ902tGzso79nVVanHkgiIrwAifFYVLn+cLYR+lleCS3WTstX2vyUEYL88BzrGwxMPyz4kcEIgTWSG4sRVry4f0RsRoitBdPvqlgdXLVxWkrmE6EiqcDAaGr8wezg5Wpl3AmlK93TtZ0iv+SxPeqhD7hRcjG6DG1dE4vQ4s+4YIO9i7iXJmbXRwY0g77YVDNamjffF/3OankNTVbRhWdWQMx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHlJ1wFhqO599bg6UHZPVt7fsKgmFlJx0/BWZ5wApdI=;
 b=Zn84cvk8DGFoPe3l2kTxbj0bPM+RCYJDpsph+fNfRo+mw+oZfv095HxjeM4ErpuAbRgOzQ7MyiIVeQLV8Ju9BNbRDn0cP5FPe+zC6QULzz6CE966uOwyITXKAc+pp0qWWQsRnrA/UtpKUM54zY4gZlkPWRb8R44aNm9iashr6xA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYVPR01MB11260.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 09:13:14 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 09:13:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Adam Ford <aford173@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier
 Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>, Marek
 Vasut <marek.vasut@mailbox.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: RE: [PATCH v2] drm/imagination: DRM_POWERVR should depend on
 ARCH_K3
Thread-Topic: RE: [PATCH v2] drm/imagination: DRM_POWERVR should depend on
 ARCH_K3
Thread-Index: AQHaYDAOR2pL22/lvECLyWXYf8dUVbELo4AAgAADRQCAAGhqgIAAl7DAgAAHUYCAAAHtYA==
Date: Fri, 16 Feb 2024 09:13:14 +0000
Message-ID: <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
In-Reply-To: <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYVPR01MB11260:EE_
x-ms-office365-filtering-correlation-id: 5bd581ed-f117-425e-c820-08dc2ecf819b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XKT8FuKPGIRtErZ1JoOoU/hrRwVH0ULOuVIf5EAE+cypl7qdxkmWQI2iqdhYEwXqeLiETmTArgHXqgLGbtrp7FOLL93WoRnB7M5hg7dsodnQ7D1cPHtuPTEgf07cWNHqRdbkQ2mIjBfj5TXsFmpx0OpPe2XoMadzlEBhqeuoA/+Xw202VZXSpAa7DjDyR0iYT7R7kYw/GQcMtEFEMRMaVaeYxFR8gNi6AswoHqhPq2A0GpTZyWZIr84JcvSqO81ZWuXnsDI/jDuthLxH98bj1KJtf/DB3wMNDIR0wQ49oGehqURcZ3gNGN4P7L2Yy1euPIZcCuI7dGJwSbgn7xFSW+JFX6DxsyV8T9HOsxRLZRQJblwIWB8ekbi6/BZfSlwiJRNg255op/lUijtotUdVBjOCeTqDmoiqy4ZdHDBjoDnm/14oiKWoqrY48OMFNB/vXGEJlMB4evtzvKaFH7f8Cl00IYhOvzjKJ5UczHFmG16VcJXyhvTUvQPlPKj1Dk0l7csO5b7sMaG7eOFSCQGvpkmsagHpOchvwcONBvM1Wx9u1q62/xhynqjIwotuQ6fPmacFj6ac1uJkJgHmE0xVVxiQ/kdQrx102p09nsec9VT4aZSFLwqa2U5+uahPJj7w
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(64756008)(7416002)(8676002)(8936002)(66946007)(52536014)(66446008)(76116006)(66556008)(66476007)(6916009)(4326008)(2906002)(83380400001)(38070700009)(33656002)(122000001)(86362001)(38100700002)(26005)(7696005)(6506007)(71200400001)(316002)(54906003)(9686003)(41300700001)(53546011)(478600001)(55236004)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cURUNE9VS0hiVyt0elFrQ2RCZGdBWnFiNzJhd2U4WXJWc2dpUjR1WTFlSmNH?=
 =?utf-8?B?MUR5aDJRd1ZUcnlkZU0wQzBtQlNOSFdockE4QmdhblpMbC9GVHdVSWlnZkhB?=
 =?utf-8?B?aFlMbkNOMEdzYVc0RzE3YW9LdzVaWVRNRWxuSk41YmVJT0M5a001VWJoQU5H?=
 =?utf-8?B?KytwbmpmL0lUMVpNaGtBZmpxcm1wbUZZN3pvS1o2aUs4SHV0QU1sVmVXajE4?=
 =?utf-8?B?ZDRuM3Fxa2hyUzl5aFROQWo3L213Z0RsSjZSaklNUmx2di9BTng2WnpKU2Z3?=
 =?utf-8?B?TE5LeTFkVXgvYW9aNmlBdVFRajd2U2xZUUlHZUt6WjhnVFhaN0V4c1Jtck1S?=
 =?utf-8?B?VFhFMHhDMGhqd3hkMXNmZTNKV1JiTkovcm5hRDZQb2pGdG9rSVArSFVIK2Qz?=
 =?utf-8?B?SUV0UXJPS3FuV3RrK2IwN1F6V2hreGJFUlpCNnFIMkJQMGdPU1dVRDFpQUpq?=
 =?utf-8?B?ZE9FUGpFblQyYWZwU1krU3JDMDY3Sk5ieG5jc3JUWDd5NFFXcHU4amI1V3lO?=
 =?utf-8?B?cUdVVSs0QzZQUVhtSWh6ZWpzY2ppYXZSUWVkeDVxZ3hjZFVMa1dWMnExaC8w?=
 =?utf-8?B?bHNWYkFuTThuN0kyMzl6V2t5Z2tJWFNkbkJRVFRKaElnVC8wQUY1NXdQNmxy?=
 =?utf-8?B?VWJ1QjZTVjFqSE5OOEZQY3d0Z2xHVmVHMlhLWjk0cFRjTTBLdk02ZFZ6ZTNK?=
 =?utf-8?B?Q3hmSTBpTEpKeTc5QXphWHpDMjVlc0IrTGI2dExrSWdlQ0x2YW1WRFRBanlx?=
 =?utf-8?B?QmFpNzhrUFk4VXJrc0Fjd3RTN2JFNlIwUUx0TTZOdlZPVTVVcXJoeWo2dzUx?=
 =?utf-8?B?TkR0OXBYV0I1QXBPVmJVS0ZDT0h0d1JNSVM5Nk9mcWZraXUvamJlSDk4RWlX?=
 =?utf-8?B?U1dBVWdReHl2MzBvUjJLZnpoRmwybDAxb0xXb244Z0U5OEg4aTlyM0JuanNI?=
 =?utf-8?B?QkJKRngwelEvWHRvOTlLb3FralkwYTJRTG1MTXk4RWlQVDA4c0o5c2xqQnNU?=
 =?utf-8?B?NGFYd3JwZm41Q0lQRmg0Z0hzaGNSa0h4dndGZ2I1M2dpd1IvS3UzSkhxNTRm?=
 =?utf-8?B?VXBmVFgyS0FhbHU1K2FMeXoyWnQ1K2JqTWMvQ2FYdmxWNHhEdzZmOTlqNGdI?=
 =?utf-8?B?VXdCbGZodnkvNFZtbzE1RHFBYXZJS2JzNzR1Q2MyU2lMWHdaZithS0VqSjA4?=
 =?utf-8?B?Uk9KcnRNV3NMbzk0eGRZZjJjY1k1RHREbGtxY21kcmY0bnFSQ05LbmUzZWd0?=
 =?utf-8?B?NWYzQ1JNRnJWMzZ5QzFoYm9EQ0xKZ3NWUkNBbytscUFOcGVWOUZ1RFJmWkhL?=
 =?utf-8?B?eXRvL1QwQXFxWHdyZ0dzYkd2S1VhbnhvU0FhcTlYbVhXemJiOGRuanlKRlpn?=
 =?utf-8?B?ZlZXZHlOY0JhdUhNcGNBUXRLK3liMG1MRVErRkVxRlh5bCtMeCtoUmJMVm9B?=
 =?utf-8?B?Z3RKOVU2SzFxeHIxRnNvZXEvbi96S2ZsRThwYk1KQVlFa1BHclBBZDhwYktp?=
 =?utf-8?B?WFpIa24xTXBIVnk2RjE5ci9jbkgvZFlRank1bGI2R0hCZHNLVFhrWXd3RU5a?=
 =?utf-8?B?cE1DdEVzVXVtU0Vjcnk2YkhwSEhrWDhqOFBWYktHK3Uyb0JrSUR0OUxLeEN2?=
 =?utf-8?B?ajNBM1FPL0hPMnVpTWhGaW9PQXZ3a2xMaGZ1MVRQVXE2MWJ1MjU0ckxoV0pU?=
 =?utf-8?B?YjQ3dFhCTlkvRHZIM1k5anErdEwvRS9uczk3ZEIxb0JrRndDaUFwWHdjMzFW?=
 =?utf-8?B?N3JLdFg1emhLZ0ljOThsWFJ4NUMxcS9VaFZ2RjBoZ1F0SFVQUWZ1YWlPanpE?=
 =?utf-8?B?WUZNcFV1QWhOMWZ3aExtZmJ6cEpaL2RGQWdEVklLajh0TFlRcmdjbVJhbWcx?=
 =?utf-8?B?SjJONVJOZ2RWYzFmeGNlSkc4cnY3QWhJNTVWUWFCZWJQbjJIVE0yV0IyZlVP?=
 =?utf-8?B?N2prZGVCUDBHOGlrWkhJeVNiZExRWktBTFR2QnRVS2EwOWZUR2dFeHd6cGdx?=
 =?utf-8?B?eVd5WEQybTF1aHhOTm9EVlEwRCtHQkRSb2pRd2QyZ04vK2NydHd4YjJMYkE0?=
 =?utf-8?B?UkdoQmF5cWxoMGZnUW5RenU2amdPTFhSblpwVFBXVUpBUHo5Sndzd1oxNlAw?=
 =?utf-8?B?djI0YlNUK3dacEdDY1VZa3hxWnNRK0JmVGZ4ZjhkdHNJaC95L0FXbU9Kb01x?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd581ed-f117-425e-c820-08dc2ecf819b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 09:13:14.6792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTG6Sme/6C+74cS+eR6nMFCSqNTZoQa3KW13PVBR0dyJapPucFE4yzbVkRQm70ATJCefsMZUYYgafhUI3tLzq6TXuixUdx9dzFBnI+yckBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11260
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

SGkgTWF4aW1lIFJpcGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVi
cnVhcnkgMTYsIDIwMjQgOTowNSBBTQ0KPiBTdWJqZWN0OiBSZTogUkU6IFtQQVRDSCB2Ml0gZHJt
L2ltYWdpbmF0aW9uOiBEUk1fUE9XRVJWUiBzaG91bGQgZGVwZW5kIG9uDQo+IEFSQ0hfSzMNCj4g
DQo+IE9uIEZyaSwgRmViIDE2LCAyMDI0IGF0IDA4OjQ3OjQ2QU0gKzAwMDAsIEJpanUgRGFzIHdy
b3RlOg0KPiA+IEhpIEFkYW0gRm9yZCwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPg0KPiA+ID4g
U2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDE1LCAyMDI0IDExOjM2IFBNDQo+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyXSBkcm0vaW1hZ2luYXRpb246IERSTV9QT1dFUlZSIHNob3VsZCBkZXBl
bmQNCj4gPiA+IG9uDQo+ID4gPiBBUkNIX0szDQo+ID4gPg0KPiA+ID4gT24gVGh1LCBGZWIgMTUs
IDIwMjQgYXQgMTE6MjLigK9BTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6
DQo+ID4gPiA+DQo+ID4gPiA+IE9uIFRodSwgRmViIDE1LCAyMDI0IGF0IDExOjEw4oCvQU0gQWRh
bSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gT24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMTA6NTTigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4N
Cj4gPiA+ID4gPiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IEhpIE1heGltZSwNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBUaHUsIEZl
YiAxNSwgMjAyNCBhdCA1OjE44oCvUE0gTWF4aW1lIFJpcGFyZA0KPiA+ID4gPiA+ID4gPG1yaXBh
cmRAa2VybmVsLm9yZz4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBUaHUsIEZlYiAx
NSwgMjAyNCBhdCAwMTo1MDowOVBNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPiA+IHdy
b3RlOg0KPiA+ID4gPiA+ID4gPiA+IFVzaW5nIHRoZSBJbWFnaW5hdGlvbiBUZWNobm9sb2dpZXMg
UG93ZXJWUiBTZXJpZXMgNiBHUFUNCj4gPiA+ID4gPiA+ID4gPiByZXF1aXJlcyBhIHByb3ByaWV0
YXJ5IGZpcm13YXJlIGltYWdlLCB3aGljaCBpcyBjdXJyZW50bHkNCj4gPiA+ID4gPiA+ID4gPiBv
bmx5IGF2YWlsYWJsZSBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgSzMgQU02MnggU29Dcy4gIEhlbmNl
DQo+ID4gPiA+ID4gPiA+ID4gYWRkIGEgZGVwZW5kZW5jeSBvbiBBUkNIX0szLCB0byBwcmV2ZW50
IGFza2luZyB0aGUgdXNlcg0KPiA+ID4gPiA+ID4gPiA+IGFib3V0IHRoaXMgZHJpdmVyIHdoZW4g
Y29uZmlndXJpbmcgYSBrZXJuZWwgd2l0aG91dCBUZXhhcw0KPiA+ID4gPiA+ID4gPiA+IEluc3Ry
dW1lbnRzIEszDQo+ID4gPiBNdWx0aWNvcmUgU29DIHN1cHBvcnQuDQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IFRoaXMgd2Fzbid0IG1ha2luZyBzZW5zZSB0aGUgZmlyc3QgdGltZSB5b3Ug
c2VudCBpdCwgYW5kIG5vdw0KPiA+ID4gPiA+ID4gPiB0aGF0IGNvbW1pdCBsb2cgaXMganVzdCBw
bGFpbiB3cm9uZy4gV2UgaGF2ZSBmaXJtd2FyZXMgZm9yDQo+ID4gPiA+ID4gPiA+IHRoZSBHNjEx
MCwgR1g2MjUwLCBHWDY2NTAsIEJYRS00LTMyLCBhbmQgQlhTLTQtNjQgbW9kZWxzLA0KPiA+ID4g
PiA+ID4gPiB3aGljaCBjYW4gYmUgZm91bmQgb24gKGF0IGxlYXN0KSBSZW5lc2FzLCBNZWRpYXRl
aywNCj4gPiA+ID4gPiA+ID4gUm9ja2NoaXAsIFRJIGFuZCBTdGFyRml2ZSwgc28gYWNyb3NzIHRo
cmVlDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSSBhbSBzbyBoYXBweSB0byBiZSBwcm92ZW4g
d3JvbmchDQo+ID4gPiA+ID4gPiBZZWFoLCBHWDY2NTAgaXMgZm91bmQgb24gZS5nLiBSLUNhciBI
MywgYW5kIEdYNjI1MCBvbiBlLmcuDQo+ID4gPiA+ID4gPiBSLUNhciBNMy0NCj4gPiA+IFcuDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBhcmNoaXRlY3R1cmVzIGFuZCA1IHBsYXRmb3Jtcy4g
SW4gdHdvIG1vbnRocy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGF0IHNvdW5kcyBsaWtl
IGdyZWF0IHByb2dyZXNzLCB0aGFua3MgYSBsb3QhDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+IEdl
ZXJ0LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBXaGVyZSBjYW4gSSBmaW5kIHRoZXNlIGZpcm13
YXJlcz8gTGludXgtZmlybXdhcmVbMV0gc2VlbXMgdG8NCj4gPiA+ID4gPiA+IGxhY2sgYWxsIGJ1
dCB0aGUgb3JpZ2luYWwgSzMgQU02Mnggb25lLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSB0aGlu
ayBQb3dlclZSIGhhcyBhIHJlcG8gWzFdLCBidXQgdGhlIGxhc3QgdGltZSBJIGNoZWNrZWQgaXQs
DQo+ID4gPiA+ID4gdGhlIEJWTkMgZm9yIHRoZSBmaXJtd2FyZSBkaWRuJ3QgbWF0Y2ggd2hhdCB3
YXMgbmVjZXNzYXJ5IGZvcg0KPiA+ID4gPiA+IHRoZSBHWDYyNTAgb24gdGhlIFJaL0cyTS4gIEkg
Y2FuJ3QgcmVtZW1iZXIgd2hhdCB0aGUNCj4gPiA+ID4gPiBjb3JyZXNwb25kaW5nIFItQ2FyMyBt
b2RlbCBpcy4gIEkgaGF2ZW4ndCB0cmllZCByZWNlbnRseSBiZWNhdXNlDQo+ID4gPiA+ID4gSSB3
YXMgdG9sZCBtb3JlIGRvY3VtZW50YXRpb24gZm9yIGZpcm13YXJlIHBvcnRpbmcgd291bGQgYmUN
Cj4gPiA+ID4gPiBkZWxheWVkIHVudGlsIGV2ZXJ5dGhpbmcgd2FzIHB1c2hlZCBpbnRvIHRoZSBr
ZXJuZWwgYW5kIE1lc2EuDQo+ID4gPiA+ID4gTWF5YmUgdGhlcmUgaXMgYSBiZXR0ZXIgcmVwbyBh
bmQvb3IgbmV3ZXIgZmlybXdhcmUgc29tZXdoZXJlIGVsc2UuDQo+ID4gPiA+ID4NCj4gPiA+ID4g
SSBzaG91bGQgaGF2ZSBkb3VibGVkIGNoZWNrZWQgdGhlIHJlcG8gY29udGVudHMgYmVmb3JlIEkg
c2VudCBteQ0KPiA+ID4gPiBsYXN0IGUtbWFpbCAsIGJ1dCBpdCBhcHBlYXJzIHRoZSBmaXJtd2Fy
ZSAgWzJdIGZvciB0aGUgUlovRzJNLA0KPiA+ID4gPiBtaWdodCBiZSBwcmVzZW50IG5vdy4gSSBk
b24ndCBrbm93IGlmIHRoZXJlIGFyZSBkcml2ZXIgdXBkYXRlcw0KPiA+ID4gPiBuZWNlc3Nhcnku
IEkgY2hlY2tlZCBteSBlLW1haWxzLCBidXQgSSBkaWRuJ3Qgc2VlIGFueQ0KPiA+ID4gPiBub3Rp
ZmljYXRpb24sIG9yIEkgd291bGQgaGF2ZSB0cmllZCBpdCBlYXJsaWVyLiAgRWl0aGVyIHdheSwg
dGhhbmsNCj4gPiA+ID4geW91IEZyYW5rIGZvciBhZGRpbmcgaXQuICBJJ2xsIHRyeSB0byB0ZXN0
IHdoZW4gSSBoYXZlIHNvbWUgdGltZS4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBJIGRvbid0IGhh
dmUgdGhlIHByb3BlciB2ZXJzaW9uIG9mIE1lc2Egc2V0dXAgeWV0LCBidXQgZm9yIHdoYXQgaXQn
cw0KPiA+ID4gd29ydGgsIHRoZSBmaXJtd2FyZSBsb2FkcyB3aXRob3V0IGVycm9yLCBhbmQgaXQg
ZG9lc24ndCBoYW5nLg0KPiA+DQo+ID4gQmFzZWQgb24gWzFdIGFuZCBbMl0sDQo+ID4NCj4gPiBr
bXNjdWJlIHNob3VsZCB3b3JrIG9uIFItQ2FyIGFzIGl0IHdvcmtzIG9uIFJaL0cyTCB3aXRoIHBh
bmZyb3N0IGFzDQo+ID4gZWFybGllciB2ZXJzaW9uIG9mIFJaL0cyTCB3aGljaCB1c2VzIGRybSBi
YXNlZCBvbiBSQ2FyLUR1LCBsYXRlciBjaGFuZ2VkDQo+IHRvIHJ6ZzJsLWR1Lg0KPiANCj4gSUlS
QywgdGhlIG1lc2Egc3VwcG9ydCBpc24ndCB0aGVyZSB5ZXQgZm9yIGttc2N1YmUgdG8gc3RhcnQu
DQoNCldoYXQgYWJvdXQgZ2xtYXJrMj8gSSB0ZXN0ZWQgZ2xtYXJrMiBhcyB3ZWxsLg0KDQpDaGVl
cnMsDQpCaWp1DQo=
