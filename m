Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7C7EDF83
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263CD10E051;
	Thu, 16 Nov 2023 11:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8FA10E051
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8RsLfmhKYjSX9s9PH+GNbIuCBv5vJih1o7ZPbFBEs0b5aBA7UcIPcxLBj6kcdl/vRhoDxiRLgBbl59+Wt4OS7LfQfPDYLbYJL9FTtELBc/lX3KJXFL4SgxRSFcO6CyoRnzhnfxaBpRmEOOL+k8fWW7EKIsuvLNgR946V5ymHeS6l806GyA3/H3kzgxIsdmB3UdzIiqIbC7xT1a+J4Gewp+kbYKf1epg98Qxzcld4rFzq8WkenGzyExaLdSbFQxA2nPz3o4axX4/9Lvx0HWP/2jZuTPWkV9rJ1o1ubMKbvWJtZBYSDV5wppN3bGN34EN2nWcMqf2F8Uf/9YUIsXMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5BWOEHgHishyEy8gL24X7nie/Q6kz5aDNTwZVa2G9E=;
 b=R06o6jZ/e2rd6ZBj2Y0u29hUqA9tiIjpwf+StSAM4qQ0A8xXzJXtfAgCBeu04AGJhrg1d0Xbv9XnqaIsj7R1KuEGwfEq4c0OaVRqjGmfcej6ZNb9ZuNi1y5T5E2/Ho31NyERSqk3K9q1zzVBrDbOIrKVwqhRH4+8W3nbKpn4vQ6L8s4tLAlYd8ARjuc9S1llzxEg6ofJ0x/WOUl2edY4JA6l4+MH9Tded4J6+O2+Pvb1AN4JiPC1pr4cA5zKPvZMheYfeYk6zlnGREc3NE/yrpKpprIxHvOTbxUaoDw5k/Yg7GK05m4NCKJOJFL2fVKAuIj+tF/iXSulnnFaHDrQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5BWOEHgHishyEy8gL24X7nie/Q6kz5aDNTwZVa2G9E=;
 b=m88ezrukU+GVnStE9gm2NLlV4GWiaUYerLAbPl6DS9C5cgJV+HFfN4q0+Cs6Oqo7JmF/0IFWrNo1RDrRJn/wYlLkLFeTQh1FZvMmhUS9smwVO0DqRCGnoLzsBwDsVixjciEw0ALlJeeC7+sw9Jvrp0g7Xu+4D1i5MsHECCtO6a4=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY3PR01MB9983.jpnprd01.prod.outlook.com
 (2603:1096:400:1dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 11:19:59 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 11:19:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Topic: [PATCH] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Index: AQHaF9XD+kjIDpQWrEeYyotVLHznYbB8J72AgACl6bA=
Date: Thu, 16 Nov 2023 11:19:59 +0000
Message-ID: <TYCPR01MB1126959F8FAD57D0BBC02E11886B0A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231115150932.107796-1-biju.das.jz@bp.renesas.com>
 <20231116012455.GA20846@pendragon.ideasonboard.com>
In-Reply-To: <20231116012455.GA20846@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY3PR01MB9983:EE_
x-ms-office365-filtering-correlation-id: 4532d121-ff22-4386-b285-08dbe695f835
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /MIXhk9aGwbxbWsNUJy+DiFEV6DvLdw9hnNAtWJcRMaKWdzIQXerOqPigeyHkuvg/jLkGvlAmicCw7OMzhOpFIWz7SLGyN3kz7kVNNcQHqBP7KH2BF9lFNfP0kkYtEucCh44NJjjFGLg9Iyh3iteYwc135uGcD05JNabPVdkx58yP4J1ZvnTZonTFR60uLmSNUdo7RMj7CiuPXHholSAlKdQNIisD+5orhEIlTBpuEpKHgQwDROtKKOHnAvhnAezItjfIhLBd7ZH/VofDcQOs+AQSqkWEv6sUZH/uqXM7qNdNZ2wJGOf9j7BEqb4A0iHVS2T4gp9erQxJRKlogCUCppRKqXDeUTMn6gVTQLgruhcH6asPC8qbXgi9+b1KCn2nyYPIHUc2CIgBpfW65Uldit5Iy/26UFgahWPwq1/udm0yt6U5psOj5ouuKVsSELSqNh1aWqnVfB0BgOQX6wdukPq1Rgyyucu3oEuo27yYFxutPNop+PX3/8qwWqH8AJgFbRi/lotmgMwzhXGS52G7FcqxyrSUlFibxbSldm4Y+xUQBGSWYYaEtjvmKxg5ucAYb0p0Z9iR9o6vdKSSo8vLbm3mFUGixgAejtR+jVijiXZSVDiC00iqyrcJJcjvQBY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(478600001)(9686003)(71200400001)(53546011)(6506007)(7696005)(76116006)(64756008)(316002)(6916009)(66476007)(66446008)(66556008)(66946007)(54906003)(52536014)(4326008)(8676002)(8936002)(38070700009)(55016003)(83380400001)(2906002)(41300700001)(38100700002)(33656002)(26005)(86362001)(5660300002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blhrcHZRQXpiTzJibzRteHR4cXpjWFFKZng5M1c4QmxUc3VpbVJwWjgvdkFM?=
 =?utf-8?B?SS9sSzNPTzVaZ1NBMW9MYmZKbDhmdEhpanJSL2tWZXB0cW43THRRMU5IU2ha?=
 =?utf-8?B?MCt5bU9kTDEwMmNnN3IzKzVXck1qU0RnQk9pZ0xrT3J3Ykx1Tkcrc25xaDRu?=
 =?utf-8?B?dlZPdE56UGpEbjQvYVB2cFE4dHZQRFNoT1c1eWxkaXgrQ0p0OGJWeURCZkdO?=
 =?utf-8?B?RG5tcTBqa0laYjlVYmlTc1RpRnI3Zk9Cd2dLdnBQQWMwb2JaREFoS2tiNThv?=
 =?utf-8?B?STNpNGJSMDhJb0x4bWcyK0Y1Zjc1ZU5JV2d5dFNmZ29rWGtCUUxUNmFtUENJ?=
 =?utf-8?B?ald1ekVtWWtvbXhUcFcwc0xVbGhlL3R0dm9IZXNRczVEQWNTN2ZzN1BiQnUx?=
 =?utf-8?B?QkFGZlBteHZQL0E5NEltbEFLVGZuRUhHL3YzU0U4N2JRWm9TTGIxUTJCTWZx?=
 =?utf-8?B?Zk9xMnZza01RSytTRHJxQUZZWFVXZGZZUm4vQm5LMDFjUzkzVmo2T00zbE5m?=
 =?utf-8?B?ZW1RbFNWWlZwbTM0SzVPUnExNE1PMmxGL2lDVDk4RUVVTTEvbkYwS2NWSWx4?=
 =?utf-8?B?eE5QQVhVVVl5aW96ZkRVcEpRTENPbDdHQU9ZRElHS3lQVzVjU0ZKRFFMTlA5?=
 =?utf-8?B?cXMxUVJtSVNHb2lENnpRVGRwaG9rRXNST1VoUzRqWWZyY05Zb1BYWE5QRzNa?=
 =?utf-8?B?bk96ZHdmQ0Z1NWpJc1UwbVlBcERLL1pDVTB1ZlpaK2ZGeHJHUElHcW1nK2hz?=
 =?utf-8?B?aWRDK0xOa0t0Zi9pQ2ZtK0FId3VwK1ZRS1Y1aVNqdUNMcDNCeGt1aGIrUGhT?=
 =?utf-8?B?STd6TDZHckUwdXlqODliRXREaDY3WnJDK3B5VDFEUWluTUZSTWFEV2YyUjN5?=
 =?utf-8?B?ZlZETHNQc1FlL0tuWkg3K0cvenlXeG1yd0VITU9sQ28vS2lzY0NDQ0MxUUo5?=
 =?utf-8?B?c0xYZjZRazVmUkxjMHA4U2RjRlE5SGM0bUZWR3lXR3NsMXJPOGFoOGd1NTUw?=
 =?utf-8?B?TkZwZkU2cGZZUWdvUkhaZUtsWFRHdkNWeXArMU9pcGpHTHFlSFpuakJtbUNZ?=
 =?utf-8?B?bThXeGkxZ3l3Yi9WQW1vemltaFZlNzJJc0NsYzNqdU9hRXgrV2Nydno0ZFlx?=
 =?utf-8?B?czVvM0lwNEs5N1dsTHI3RktKbERrK0VwL0ZDL2JucENac0E3NDNTTnl6VGFr?=
 =?utf-8?B?ZjA2RDE1Q05HakpFS0ZNM0g2MlRZVkM5VVl2QmtEelkyZ0U0dDl3dytWbWFz?=
 =?utf-8?B?MlNSUVBMMFV3dURmRklyRERvT1RVQ2phSTVPSCtKeE5aSnI5WkF1MEljYmU0?=
 =?utf-8?B?KzhGYUxvSW1kdmROV1FEeGUvcGdaUFl4em0rOXhxTDdRU2ZONWIvQmxZY2xW?=
 =?utf-8?B?KzMrbEx6V0w1QWppNjkvajNJdlRtZVFvTFcyL2dsSDF6M3FPTkdxazNURnky?=
 =?utf-8?B?eVYzWlVZeUNFM2FiWjVNQlQwdWZJOXc0YzV5VUxZdlMvMVcvV1E5UVRUTUQ5?=
 =?utf-8?B?WE1yaHo5MUZXb0g0NjQ4cXhFRFI5WGJHZmlZdUl5Y0tEZ1UyeU5mTXNsbnpH?=
 =?utf-8?B?Wk5PUk0wQ1VWMGkwUmdRRDdYR1V0eWhaNDVZZXkyR3A1YURKc3pNSmRkeDNh?=
 =?utf-8?B?eFEvd09XOUhiQno0YnJFZ1NPZXp5SE4zYTdTWWRKZnB6WEZWck1iUXVCSUxO?=
 =?utf-8?B?WFcyN1ZZMFpIZzNtQklTWGxxdExwd1NrZ1VJOXJZayswemRuVm92NkFZako1?=
 =?utf-8?B?QVg4TnZEczlwclQ3aXV2MnhvbE5keVNVcXVqNTBpOEl0SXdiQVVWaW5SUk1z?=
 =?utf-8?B?L0xzMS83d1VyQ0g0b0p0NUNpRmxhV29pS1lTbTJ0amoyRFpsTWJZeU9mZ3VU?=
 =?utf-8?B?NlIzdUZOQXpLR2lsK3MzRUY0cjVvMlI2N05QL1lLNWQ5LzlVQWJ4QlhkUjdz?=
 =?utf-8?B?cWdGYVRPamhGMWxJV1lJV3AzL2Zac2pWVzhIQjRFNmswemZ2c2NJdllpMi9p?=
 =?utf-8?B?WkMwVll0UFhzb3JvTGZqZ3FNY3dkM3Q0aWRnaDFZSGs3aytkSXRNLzdKVXJN?=
 =?utf-8?B?QmRDQ2VhVGo4WmpWVWR2K1B0SjVHZUtYYnpDVEs0VG5jYllZT0lIQllZRnRz?=
 =?utf-8?B?QjdWbG95VjdmTWQyVEZhdHRRckRvZ3BKc0RiUFpES0RWNDhGNk1zTzBUQlpT?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4532d121-ff22-4386-b285-08dbe695f835
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 11:19:59.1333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: baaF+JRTXDi91WjtwvqOHiBY5LrgWTuxj+ZdWBY2o9Fa7MALO5r1h8BB3509ggdwIsH56TcwdwWZ5rN8ldtBJR/S0eJ4LPSQinS1qSqlEDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9983
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
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTYsIDIwMjMg
MToyNSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm06IHJjYXItZHU6IEZpeCBtZW1vcnkg
bGVhayBpbiByY2FyX2R1X3ZzcHNfaW5pdCgpDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBXZWQsIE5vdiAxNSwgMjAyMyBhdCAwMzowOToz
MlBNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBUaGUgcmNhcl9kdV92c3BzX2luaXQoKSBk
b2Vzbid0IGZyZWUgdGhlIG5wIGFsbG9jYXRlZCBieQ0KPiA+IG9mX3BhcnNlX3BoYW5kbGVfd2l0
aF9maXhlZF9hcmdzKCkgZm9yIHRoZSBub24tZXJyb3IgY2FzZS4NCj4gPg0KPiA+IEZpeCBtZW1v
cnkgbGVhayBmb3IgdGhlIG5vbi1lcnJvciBjYXNlLg0KPiANCj4gR29vZCBjYXRjaC4NCj4gDQo+
ID4gRml4ZXM6IDNlODEzNzRlMjAxNCAoImRybTogcmNhci1kdTogU3VwcG9ydCBtdWx0aXBsZSBz
b3VyY2VzIGZyb20gdGhlDQo+ID4gc2FtZSBWU1AiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2R1X2ttcy5jIHwgMiAtLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfa21zLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+IGluZGV4IDcwZDhhZDA2NWJmYS4u
NWNkNTRlYTMzMzEzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3Jj
YXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3Jj
YXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+IEBAIC03NDcsOCArNzQ3LDYgQEAgc3RhdGljIGludCBy
Y2FyX2R1X3ZzcHNfaW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UNCj4gKnJjZHUpDQo+ID4gIAkJ
CWdvdG8gZXJyb3I7DQo+ID4gIAl9DQo+ID4NCj4gPiAtCXJldHVybiAwOw0KPiA+IC0NCj4gPiAg
ZXJyb3I6DQo+IA0KPiBJZiB0aGUgY29kZSBwYXRoIGlzIHVzZWQgaW4gbm9uLWVycm9yIGNhc2Vz
IGFzIHdlbGwsIEknZCBwcmVmZXIgcmVuYW1pbmcNCj4gaXQgdG8gImRvbmUiLg0KPiANCj4gPiAg
CWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZzcHMpOyArK2kpDQo+ID4gIAkJb2Zfbm9kZV9w
dXQodnNwc1tpXS5ucCk7DQo+IA0KPiBUaGUgbmV4dCBsaW5lIGlzDQo+IA0KPiAJcmV0dXJuIHJl
dDsNCj4gDQo+IFdoZW4gcmVhY2hlZCBpbiB0aGUgbm9uLWVycm9yIGNhc2UsIHJldCBpcyBndWFy
YW50ZWVkIHRvIGJlIG5vbi1uZWdhdGl2ZSwNCj4gYXMgaXQgaGFzIGJlZW4gYXNzaWduZWQgdG8g
dGhlIHJldHVybiB2YWx1ZSBvZiByY2FyX2R1X3ZzcF9pbml0KCksIHdpdGggYW4NCj4gDQo+IAlp
ZiAocmV0IDwgMCkNCj4gDQo+IGVycm9yIGNoZWNrIGZvbGxvd2luZyBpdC4gV2hpbGUgcmNhcl9k
dV92c3BfaW5pdCgpIGRvZXNuJ3QgcmV0dXJuIGENCj4gcG9zaXRpdmUgdmFsdWUgdG9kYXksIHRo
ZSBjb2RlIGhlcmUgd291bGQgYnJlYWsgaW4gYSB3YXkgdGhhdCBtYXkgbm90IGJlDQo+IGltbWVk
aWF0ZWx5IHZpc2libGUgZHVyaW5nIHJldmlldyBpZiB0aGlzIGNoYW5nZWQuIEkgdGh1cyByZWNv
bW1lbmQgZWl0aGVyDQo+IGFzc2lnbmluZw0KPiANCj4gCXJldCA9IDA7DQo+IA0KPiBpbiB0aGUg
c3VjY2VzcyBjYXNlLCBqdXN0IGJlZm9yZSB0aGUgImRvbmUiIGxhYmVsLCBvciBjaGFuZ2luZyB0
aGUNCj4gDQo+IAlpZiAocmV0IDwgMCkNCj4gDQo+IHRlc3Qgd2l0aA0KPiANCj4gCWlmIChyZXQp
DQo+IA0KPiBhZnRlciB0aGUgY2FsbCB0byByY2FyX2R1X3ZzcF9pbml0KCkuIEkgdGhpbmsgSSBo
YXZlIGEgcHJlZmVyZW5jZSBmb3IgdGhlDQo+IGxhdHRlci4NCg0KQWdyZWVkLCB3aWxsIHNlbmQg
djIgZm9yIGNoYW5naW5nIGVycm9yLT5kb25lIGFuZCBpZiAocmV0KSBjb25kaXRpb24uDQoNCkNo
ZWVycywNCkJpanUNCg==
