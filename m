Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22C814926
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5410E9FD;
	Fri, 15 Dec 2023 13:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5418D10E9FD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOE17yzlC6qHLDEDChwUg7cNWvK5KBWsgnWvoJBcyPj5B5shGfUdvHEIvbASQsM7QfLOVVLlvIxbNm+hKs1hUqheO6KVjqqFdP1diiE1xJdBr+lMxV4vLvafQeiLYQ8Hak0n1jw9W0PCFAHc0bQL4kcfrmAKWwVn8Y5lrgU0XJGIqO7fhw13p+4h6LLSwSUJ4w8m/+S8TtylcfPPpRki937wbSs8M746Yza8eTOqp+/1FspfeL4UaIukhbYnSKgUMGIecDYoUNVGvd9j1BdHyyZNAaeLBfFZJWCe3B8K3CiyaZ71CX4Rw4QzbxGtk1S06RlKfq9/2N8raWXPjHkuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPHhfGEW9zGHSVijRhHznEqfgtLXzfTDaywNniI0A2o=;
 b=EIx564HN54e+UeWl63SDVpJ3ShgMFnTTe/6Nn7AgSZz6uIXoS1tC5n0kTlD9ddoPpPIHddKU9jY9tjLDBxiol1Ftm1aEdkzZLzTl8urFPRYYgefmBuMEyqBBRnC/t4Y+qpPCK1tFIZdLupG905yS8BcMt0IR2rN1+A1LAiELJOS/J1PvKDrW9oPVU/4BTmVHuS/RHaWOnw2jQnIuv2eaizQ725j6tIS7Ms1EaqRQZ3hp/5PzFE1802f5IN21ApmBTiSCrcwfX0PbBtwU49AK5Gpav4m+x8ko72hXDaNsUdQV1iw5n6Q4V73db5zq4c+rjVzQy92p5d5OmPxyGLScQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPHhfGEW9zGHSVijRhHznEqfgtLXzfTDaywNniI0A2o=;
 b=W7wHC+xDkYcMJI03FOe/g7UA09uMlG2hsdIdNvy6jBb8SJJB0y4lTWFXBTxV/P6bcpacobydYxO24MCcSBPfLHkXgYW75yggZJZTr7gGEmFp/nA3pR4o13c+joBgWReqrMt1K60OceWqy+1LR2o7NkMDTstYK+1U/uO/zn2WXEw=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB5576.jpnprd01.prod.outlook.com
 (2603:1096:604:b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Fri, 15 Dec
 2023 13:25:48 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 13:25:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAKdWw
Date: Fri, 15 Dec 2023 13:25:48 +0000
Message-ID: <TYCPR01MB1126964899D432355ACAF49D18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
In-Reply-To: <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB5576:EE_
x-ms-office365-filtering-correlation-id: d114b2db-15c1-49f7-15d0-08dbfd7159bb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R8vpRMcuwYN4wIXrAfKMwcm0oeCS78FDneYjPyuqXnkS6bPsZITZoid7NZ1LKzM5TwQTNZIFo6RbWrv6TSsWiIeLWTG8BN1nqgCcGSLk6oDSFNQPnWLytKotKpYpuC8OVRc6Ram90j19fX7OK7vof3oqTaCPKjPgMbZ1XutQWHHs1NAS8PW/ZtNwK+xWp8uILk2F3buzcvmaxvqmBhimBtY1rrDKXRSeJ5YD79scGoBZNr3hWYUfx8Jc76V4T6ax2mUgxyxXiMAAtYts1YW+466QvXj2rVAsbqnmLLRenrEqcdxBIPp32i+7A2UtAE5uCydu1HtbzFkU6x8rJ2QhoCHvJEz1SdBRG/WP0N2D0hR+8GyEx3oKnbfjt4Tw65/pd2MkUob7OosM755EIZIElTUAOEBW4cU/mx8yt59pfnpdvCsc+QlrcXvHdi/wKTX5zPbtpG7auvmoxPzEZDTvbY0r3Et6mdj1hUkkp4su1PZRCOpBBuUfgJjoIcG1qkruPKapjSpKhz5mOarGk+LPiZWH8QVSHBtFsPg05lE8hEkuSv2L84rcswzLziG6D73OrF+yHMl41rPCAXpwFugfCr2/BvR0HfI1zmoX1+hYULM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(478600001)(316002)(71200400001)(55016003)(76116006)(66556008)(66946007)(66476007)(64756008)(54906003)(9686003)(66446008)(6916009)(7416002)(5660300002)(83380400001)(53546011)(7696005)(6506007)(966005)(8936002)(8676002)(4326008)(52536014)(41300700001)(86362001)(2906002)(38070700009)(26005)(33656002)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzQ0b3ljK3RCT3VkdUVlRjBEUk5BVWF2emlRQW9UcEJ3d1R1c240Nk8xZTFk?=
 =?utf-8?B?dXlkL0s0Rms2dHV5dUlPU1ovSVF5aWxlZFQ1Sm5lRVNGTm5XcUNyOTQ3QlhM?=
 =?utf-8?B?dHE2Q3VtREZZYUpRbGJaMVlTcHFhMlZSdXU5RExOYy9GRGt3dHhGcGRJWjZj?=
 =?utf-8?B?cU5XQzdwa3kvYUZha2JtTEZJdXgxeWw3QlVvbVk5clZRRFVVSkVZWUZRaFR4?=
 =?utf-8?B?VzJaYkxPYjlUbG12ZjlJaGZ2L2tHbHozYmdLOUJpSmhFa1VmeVc0ejQ5bUFS?=
 =?utf-8?B?eUJJNnJWRlNHUFpabm9NaW4ydWxJZFJ5RUovMDlHNkM5YmNEeXdwV1o5c2Mr?=
 =?utf-8?B?UEROdTFHdDhvcDJBbGl6RkNKY1hSMEZqUit4U3Y2SkxYdVVnUERFUWw3YXMv?=
 =?utf-8?B?RGNmVC9mZy9xUlRDYmg3SzNzL21VU0h6ZDIwSFpjS3F1eTh0U0FDYVFKdjM4?=
 =?utf-8?B?ZzdWUGsvSG8wdENIUmp1NWsvWjA4Znl4dm1RMGJxdmxiVVZNb29TbVNPN0ND?=
 =?utf-8?B?UFRhMFlibHFHNGQ0UndjSVhTb0pwT29wSkJZMi9nZzJvcEVPeUsrYXd5U2Jo?=
 =?utf-8?B?L0l5dnJpZExjMUF1Qzh3Wkswdkk3ZnJUbXV3UFYwSVFVbWJTOWRjaTZxOHVM?=
 =?utf-8?B?OHl4VUU0dkxSL1QraWVnM0tJZWlOS3FPaUNSL0IxZzZkdEptWkZkU0g1cDFG?=
 =?utf-8?B?TjlJSmJwTVdzSE14dVZJSXpaVzN5QjBBT1V5eTBvU1hhU3d4Q0tnWWYyNmpP?=
 =?utf-8?B?d3JuQ2I1NHlFcWlzV2pLMEk5clFyS2xkYXJ3amczNUFTVVk5ZU5tWGtMaXhG?=
 =?utf-8?B?T0Q4WUExSEdiM2ZSYSt0NlpKR01odWhLaHh2UHhUQVM3aVhVNnB0QW1VaThl?=
 =?utf-8?B?Uld0eDI1cldNZkpGcDA5VjhXdUUwSnBPcHZPZSs2cUxrUno0TmlDcDZtcm1O?=
 =?utf-8?B?R3FFUWh1eGEzTkNCaFVXdmNzWnV6Uk5MNjJQUEN5L2g4MFo0T2phMUVUSDN4?=
 =?utf-8?B?Zit0SzdCSC92TU5tZTVTTUFqRlJ5OXEzbXgwMzg4Q1o2U2NFR1E4UEVyLzVN?=
 =?utf-8?B?ZmZqL2ZYUzRyQm5acXBmbU5aTVREbHIrSjBibWhtd3RwSXo1dkM5UENmcWp3?=
 =?utf-8?B?dFBoTTZxYzhmUGMyMUpDUVQwenk4dHN6b0JhYzJYeUVSaEFMejNMV0pYdTBq?=
 =?utf-8?B?UEhyUnVoK0pNQVFiWTN4Z015QVk3Y0hJT3BuUGtNN09JTVlySEdQUVVlMHY3?=
 =?utf-8?B?TmVRcEVlTWVZR2xReXJ2a3g1TTNMb1NzN3N2OHpBdWV2dVZiSjVHbVJ1SVZG?=
 =?utf-8?B?dHJZNWxLUThxd2Zka042Yk1MeGJwSGxuUkxldU5LbXpPc29jcjNWSWdZOW53?=
 =?utf-8?B?cVBxcmVTbWdON0RNUCtpU0ZtRExibnk2b2JCd1ZVZ3FhM2ZBVVFXUXowZHo1?=
 =?utf-8?B?RGFoaVg1T2JRWE1BRHV4M3pvenJVc0FjMlcrNFN2aFphOE13Z1o3UUxnWnRp?=
 =?utf-8?B?YjdoS3IxOXRYTTBraWc1R1ZCWi9rVHdrN0tQZzRkd2M4SE40Wm00VEIwV2N6?=
 =?utf-8?B?Sk4ybmUxQVFYaFo2U09vM215TkNJaHRyNVJZVWtIMFV1TG9sK05FRXR5bGMy?=
 =?utf-8?B?Wm1WOE5JWE9obTdONTJwS25jV1AyaDNseSs1VVI3cEtpcWs3OC9TM2U4UjJU?=
 =?utf-8?B?c05sVG8xTytJajE3T1Ira0I3amFqcyt6OVNPdTA1MEsrMWphbEkza1ZZdUFz?=
 =?utf-8?B?dk9oQzdUQ3VlazUyeXVxQS81UnZUK0tNMUFYT0RJRCs5K2c4ZENKaWdDNmtt?=
 =?utf-8?B?MmNzczRRekcrc016QVpRdU5BaTl4TUlWeWRGZ1VCWkpFNlhVbFhFMkphcEJt?=
 =?utf-8?B?d2V0Sm9KVEZqMDVhbldFM0s4aVpOOHZBQUJsK2NGSE90RmtFZVFFVGZVMm42?=
 =?utf-8?B?Nk5McDJaMXJZY01sUGs1eEFqcEd1MnBieEl2dVhJSHc5L3k3RU5oWm56cC84?=
 =?utf-8?B?QUtzNEFmSzhxVERzREM3cGNmTkczRmFqR0c5OFVmU2Q5eDhwaEtyWE8xeThP?=
 =?utf-8?B?KzFyZ0o0NWw5RSt3R3RrV2N4ZFRQbjhRZFQ5ajJUYS9KSHhEZzU5aWRJcW9i?=
 =?utf-8?B?Zy9Kbjk3SFNEcndNSkcvRmJoQUVTb1N5WEluWnFCSExBaVRtbzk3WlIzTklz?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d114b2db-15c1-49f7-15d0-08dbfd7159bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 13:25:48.1389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BE2RHxdBDYO9vulcsm1uwY1GSFt2cYgzeLBD39poCX8i7k5KE6cy4s8i70n2C3LSFZ/Kx9zvRyvx9VPufg3awMBj0E9j8KEQ3SZbtEx7B3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5576
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lIFJpcGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVj
ZW1iZXIgMTUsIDIwMjMgMTA6MjQgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTUgMy81XSBk
cm06IHJlbmVzYXM6IEFkZCBSWi9HMkwgRFUgU3VwcG9ydA0KPiANCj4gT24gVGh1LCBEZWMgMTQs
IDIwMjMgYXQgMDM6MjQ6MTdQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgTWF4aW1l
IFJpcGFyZCwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiANCj4gVGhhbmtz
LCB0aGF0J3Mgc3VwZXIgaGVscGZ1bC4gVGhlIGFyY2hpdGVjdHVyZSBpcyB0aHVzIHNpbWlsYXIg
dG8gdmM0DQo+IA0KPiBTb21lIGdlbmVyYWwgcXVlc3Rpb25zIHJlbGF0ZWQgdG8gYnVncyB3ZSBo
YWQgYXQgc29tZSBwb2ludCB3aXRoIHZjNDoNCj4gDQo+ICAgKiBXaGVyZSBpcyB0aGUgZGlzcGxh
eSBsaXN0IHN0b3JlZD8gSW4gUkFNIG9yIGluIGEgZGVkaWNhdGVkIFNSQU0/DQoNClsxXSBJdCBp
cyBpbiBERFIgKFJBTSkuDQoNCj4gDQo+ICAgKiBBcmUgdGhlIHBvaW50ZXIgdG8gdGhlIGN1cnJl
bnQgZGlzcGxheSBsaXN0IGxhdGNoZWQ/DQo+IA0KPiAgICogSXMgdGhlIGRpc3BsYXkgbGlzdCBp
dHNlbGYgbGF0Y2hlZD8gSWYgaXQncyBub3QsIHdoYXQgaGFwcGVucyB3aGVuDQo+ICAgICB0aGUg
ZGlzcGxheSBsaXN0IGlzIGNoYW5nZWQgd2hpbGUgdGhlIGZyYW1lIGlzIGJlaW5nIGdlbmVyYXRl
ZD8NCg0KVGhlcmUgaXMgc29tZSBwcm90b2NvbCBkZWZpbmVkIGZvciBTVyBzaWRlIGFuZCBIVyBz
aWRlIGZvciB1cGRhdGluZyBkaXNwbGF5IGxpc3QNClNlZSBbMV0gMzMuNC44LjEgT3BlcmF0aW9u
IGZsb3cgb2YgVlNQRCBhbmQgRFUuDQoNCkFsbCB0aGUgZGlzcGxheSBsaXN0IG9wZXJhdGlvbnMg
YXJlIG1hbmdlZCBoZXJlWzJdDQoNClsxXSBodHRwczovL3d3dy5yZW5lc2FzLmNvbS91cy9lbi9k
b2N1bWVudC9tYWgvcnpnMmwtZ3JvdXAtcnpnMmxjLWdyb3VwLXVzZXJzLW1hbnVhbC1oYXJkd2Fy
ZS0wDQoNClsyXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni43LXJjNS9zb3Vy
Y2UvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3ZzcDEvdnNwMV9kbC5jI0w4NjMNCg0K
Q2hlZXJzLA0KQmlqdQ0K
