Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38929813A0E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 19:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E574210E1F2;
	Thu, 14 Dec 2023 18:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47BA8928D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 18:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnxUOk4Ue8jpYnkKCBb+jJqFGQhNUeD5u2wRu2A4Nqa9zNz9ojVEKu6DV7mxW3nh+45ZVs7yynxOMIkofZPMyCGJrOa8h+ZSDkpfg1f9S11cBKUb8UZxCKsrXkQuRVbJEO7s0tv3uhlW9XC5xTgDiwTPb8DfkwpSYb6VXz2/pVSJVwl9KM/+/YONpdRpvTFBgsZ0IkWI97E/Lqj+nCl3pR1mNSN2zDmgsLe1ThK67ujLJgLfygQAs/jqF4jX8eYWuSjjK9xbmaUyC1SZxEinLrhLncgCYEo5nH9cwG4j/sv1X/GXRbqOTOz5lIbOpNg7f45KOnBmDx4TZwpNbJJXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPGgm/yQbBvmLy2z8Z+2el+ylxHOP52ZPmRXhxTO+NI=;
 b=bLn+DKb7JE7wx11xgS7t7J4amWvDhd1PvuS8UqScpdpBZbxUWlm2eWFolIQNu11QLUYmtntRUZkxQzgFK7pQkeQLI2P9SPJco0gk8R6zZ7TZfJSILuAHnCuJjE/J8BB2lptlnt4KOE01GiAiWlTb+MBUHBWxh+bDCgi4FZOy8n/6mixk+3uyT+5HF39VmJ/0kCXpBFyRaY4+Oop9/WmRx0pnVx/w7tUjidXXg3UXD1QL4CTwmHMLzwCBvkB4qWLlFylmbh2H17EUmBcW2AThcf0DnJxh53GgP20YBY8uqp7zxxMEv4lxqdVc3qBwM7CPcyIWpyVNmpEGOwMCa0mkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPGgm/yQbBvmLy2z8Z+2el+ylxHOP52ZPmRXhxTO+NI=;
 b=TiwbWd3rGWSV9XWNz7UX5Nf7p/zGvX79HZdyyGzhnhTuK6Zv3LIXGy9ZdP5V6af82sYuwA4C+2y8TWEEjOYWP958Gg2LKw8HW0b+bM6iRtQWWDL/sej3M9wYzMrIDuKWvFLrPfX+BA2PgfwAdprieoppm+XspXA1Hl4T75TWROo=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB8808.jpnprd01.prod.outlook.com
 (2603:1096:400:167::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.11; Thu, 14 Dec
 2023 18:35:50 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.008; Thu, 14 Dec 2023
 18:35:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAGZCEA==
Date: Thu, 14 Dec 2023 18:35:50 +0000
Message-ID: <TYCPR01MB11269E25F4F41646BF8319B62868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB8808:EE_
x-ms-office365-filtering-correlation-id: 471a66b4-644f-46c9-b5c4-08dbfcd37f29
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oh9qwbqF4W9faH5xPTWGSis7yPqFXnNRje9oSig+9uIw1RSeajERYO0CI9/bzI7sS5/6blQE6o420XWCL0l87TasUXiO/oFq44OzjsLeBBy28r6YpEuS+4hyFTr3nfX5B3zAA6PU5xv3TSYt7R/r2Xol2J2ffNTwa7r09AYCDH4xOLoqvA5nPoRIrUjGMP93sWgsGnlae6nVlsZElw1n5Mzg4JGGaq1BmhGsE5Da5O7A+IoowcdHfTYjrSWc9Qhon5OT63ktB4k20elQkN7EomdFZAXxpqGDF/YzrNCNDTm/bWcd3bL2w4RekUvy/8XAvaq/GF+By9lcJQpsRm1PiqwdLVfcJMOBjCeGhduUESBKL9MS+HwpcsNSKqUOEDrbOu6vw9lItgI8vnu0gX4BqnUZCnzMYsjB0y5suEHN7UL+vqSL1i5YeK4taYJ+R1lu9+GxHJPc4Cu55eKaoTSKyCzWF/w0XskzqtojzpnqsEa8MIcLlulC6CawokN4jmjDH6cfOYSjRctkSqet3PsRtcVYFZzjXsZrqx6VGFtkz7LSISmg/DR4nvlWuyo2lbQWHPcSILOxQC4Mp+glTn9gJvr1HLKYrdvotOArZovZxMlOVrmlREwURZmjz6CQcWBr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(8936002)(8676002)(26005)(4326008)(7416002)(5660300002)(83380400001)(52536014)(122000001)(86362001)(38100700002)(7696005)(6506007)(2906002)(53546011)(71200400001)(33656002)(55016003)(478600001)(41300700001)(2940100002)(4744005)(66946007)(66556008)(76116006)(66476007)(54906003)(66446008)(9686003)(64756008)(316002)(38070700009)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qmp1OWswTEFyb045Rk1IQkVaRkxGb1gyRmhuVTdZOFg1QnFBSDJsaVE3RHA1?=
 =?utf-8?B?Smd6bWVwMitaQjZFc243eEhiNExEWGx4dm5TT2JzSkN3WUhYU3JSWlZ5RGM4?=
 =?utf-8?B?YkIzWGhPaTVnMHBsSGp3MEhxQndqN1RYQVZlQ3lnWmR5ak1LSXczby9qQjNZ?=
 =?utf-8?B?R2syN2FUTGdpRnJaNitGZERKeHhzT1lJOW90Q0U4Zm9CZ0FGZ2ZOR05IcFk0?=
 =?utf-8?B?a1ZUNU5VWlRCa2k0RXlpWUhZZmlMbThFcjZKZ0p2ck82R3Z5VGtNUUMzeWZ4?=
 =?utf-8?B?UFpnSU1JMktUWkRKeWJ5U3REaDg4OUZzQ3FIbUJOQUtUWGVEM2ZySkE3d1l6?=
 =?utf-8?B?TTZ4dUh3ZGw2dWkrNXljN2FqYitYVVRvYWNBU2xzSVk3UWxSUThiUisvdkdQ?=
 =?utf-8?B?dlVSS095RUw5MHdIT0lkTHhuV1kzd0hJSjhDeFNoL056QlhqSUE0UTNHQWR3?=
 =?utf-8?B?eHdWbjZ3dlZRejVkQzU0Y1RSSmVmUzJlR2FTandTWStrMmlzQmxYakU3ditE?=
 =?utf-8?B?cXBZN3VRMStjVjdrT3l0d0NkMWVGMWZmL29QK1lXSVZjM3UvV2dDbDlCV3Zi?=
 =?utf-8?B?MDJ2OW91aVh5WGo3VzhCb0tmajgwQXlPRGZUV0ZkV3pkN0twRkFRdXlrd1RR?=
 =?utf-8?B?Szk2V09rbENraW52VE92TVZDNEw5VHgyZytQdWVNUFFjRERIdlU2TEtscHlx?=
 =?utf-8?B?RzdsZGhnN2g0WitWcm9hVzhRYWZzUkl0TVlyb3NNRmJqdlo3VFJhL0NmUkp4?=
 =?utf-8?B?aFBYelp2eFphMXA5aGcvY0FnajljUitFTlp6TEM0ZFVJVGJySldVYmFVY2Nq?=
 =?utf-8?B?SzZmcllnYjAyL09BU0pWQlNzVXRKMWNHK3RjUHFab2l1RjFzbkQ0Um1OaWpX?=
 =?utf-8?B?WS9ZVTFFaGQ3OWkwQ081NUtPRlRmVWp6K1BYZmhTamlIZDYyZHIxUWtoQlhO?=
 =?utf-8?B?ZG90VEsrUVoyaVo2cjZsbU85TU1kVUpHRmhlRlB3TjJLVjBwSk9jYWc0MUFz?=
 =?utf-8?B?TXFZNGdCekR4T05wKytIQUNSeUtuWHZVN0V2dHVMVG0rb0w5K3U3b0tlb3hT?=
 =?utf-8?B?RGxnVk1UaUNud3c1bmpIY0ZMMXFDSGNKSlA4R0E2bWJQWGtCMUFtM3lUZStw?=
 =?utf-8?B?WEJBSUVvOVY5Q3JaekhBd2FPTlZHcGJkVEVndjVTQ3hVRlRTclpCYjJJejBK?=
 =?utf-8?B?MSthWU12QXIxT0lkTFZpUEg2aDR1Y2JjS0NjZm1ydkdCNUdJNjEzdWJ5TVN5?=
 =?utf-8?B?bElDbWN4eENhVldaSVorWm1VWm1VTXZaSjd1aDhpVTdFOGlnbE9GRG10Vy9q?=
 =?utf-8?B?YnQyMFdIWFB6VjhRV2RZd0JoeE0xYXJpaHFVVTJBT2FNbnBOQ1BRa1VHeTlj?=
 =?utf-8?B?L1Y2UzRIMS8ycHc1S3pBc2xxeEl4eEdYOGR5Y3dhOTRCNVViekQvMkVOZktr?=
 =?utf-8?B?RGo4dTZhWmNjNE1CcFR3ME9MQnUzY0tnYzFoM29oeXNaMkNIVnc2SEhHSE1C?=
 =?utf-8?B?VWwrQkFySFZoc2EraWF0b0pFaGNOOHZuYzZ3MkVLVlhEQmdDVy9ENk14NUFT?=
 =?utf-8?B?M0IzeDUzTWlSbzErMjh5SElGQk1hSmRDMWZTSmRaU3hFTnJaSlUrazNZYXVO?=
 =?utf-8?B?eXhuU0h6ZTZ0RkN3Z1BkK3BndXY0SXFFNlpydXlKNUNIbzZ3MnZmQ21qT212?=
 =?utf-8?B?eWtiYmNBWjRUdU4xNzBPZDZNc1RDL0NxVTNSWlhqVjBOd2lNN1dMUzNydndQ?=
 =?utf-8?B?d3cyQVVvUUJ4Y1ZTeHJCVjBKVjJ1RWNmTkVQQjY1QzlXMWhvLzdQWFNXZjBr?=
 =?utf-8?B?Z3hIZndSVzRWdno3b3dyVSt4bVFkT3dsZFJBMkpYcXhEdktFWTNYOUhDNGV4?=
 =?utf-8?B?VmM0THRaLzNUSWJRM0lzSU03d1NSUElsbS9NeEhOVE1xQVpmemFEdjhRWnlL?=
 =?utf-8?B?VGNJZE5LYSszbzJJZVVnRWkyRndhSW1CYk00ZDlic2htYzdtd1pCZGlNUkdm?=
 =?utf-8?B?M3FoWmlqQmxkVkthNEFod1A0Q2F3alo5clU1TktGSWlnYjlmTDZLaGJaSXFX?=
 =?utf-8?B?Nmt1cjNrSWozcEhMdlVYQ3ZFNlNVOENBRlZrS1BrRys5bjhORkRNeHV3aTlT?=
 =?utf-8?B?bG8zSm82TERPSHlBUVE0dXA4ZkpJMzNxQjVsRC85ZDd2VE5RK3hERzFJWFlj?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471a66b4-644f-46c9-b5c4-08dbfcd37f29
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 18:35:50.4349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDJPorN9KC4Gt0qv8pbsJEU6aoOXIkkx0L9GUMMR/fuwR4ZHQa+XU8Z7rgUGiPIbLz8gCl5intI0W0KMeJ3W50m+lWMASl3FJuIv8Gl7brs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8808
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
OiBCaWp1IERhcw0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTQsIDIwMjMgMzoyNCBQTQ0K
PiBTdWJqZWN0OiBSRTogW1BBVENIIHYxNSAzLzVdIGRybTogcmVuZXNhczogQWRkIFJaL0cyTCBE
VSBTdXBwb3J0DQo+IA0KLg0KPiA+ID4gKw0KPiA+ID4gKwl2c3AtPnBsYW5lcyA9IGtjYWxsb2Mo
bnVtX3BsYW5lcywgc2l6ZW9mKCp2c3AtPnBsYW5lcyksIEdGUF9LRVJORUwpOw0KPiA+ID4gKwlp
ZiAoIXZzcC0+cGxhbmVzKQ0KPiA+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiBkcm1t
X2tjYWxsb2Mgb3IgZHJtbV9rbWFsbG9jX2FycmF5DQo+IA0KPiBJIGdldCBjcmFzaGVzIGF0IHJh
bmRvbSBwbGFjZXMsIGlmIEkgdXNlIGRybW1fa2NhbGxvYygpLg0KPiBOb3Qgc3VyZSBpdCBpcyBy
ZWxhdGVkIHRvIHRoaXM/IFRoZXJlIGlzIG5vIGNyYXNoIGlmIEkgdXNlIGtjYWxsb2MuDQoNClRo
ZSByYW5kb20gY3Jhc2ggaXMgZml4ZWQgaXQgaXMgZHVlIHRvIGRvdWJsZSBmcmVlLiBJIGZvcmdv
dCB0byByZW1vdmUNCmtmcmVlIGluIGNsZWFuIHVwIGZ1bmN0aW9uLg0KDQpDaGVlcnMsDQpCaWp1
DQo=
