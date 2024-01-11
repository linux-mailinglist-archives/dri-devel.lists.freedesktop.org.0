Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0082AAF7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40AC10E03C;
	Thu, 11 Jan 2024 09:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264A710E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 09:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atbwimm3RBbr0NHvzxl11BfWgGDA6neQFVfRiZQTXqU5Q1HxCMYW3BOcREPNUr2UcyfYnrYfIFy+wVAwNWRY09RhLOsDQMY5j4rZ/HmxriMQWmpi9EsRxTGZEo6eL+syLQQhwSQ8RekV5XNnxpHDQKCMiPyR9N2NRbgysLXPhMEPNABJ9ZuflJ6CiI8qkbb9BUx++ALqaDohvrA/y0kce60v4FLYpv1J9N0AHqyTaNqqkqYpi0OYZX78Z8zxIyRoVYEWmLCV3KZ++1rTBC4WrBM0KM92khh7KPV2vsJKsMeZm9HsjXbDQQCsWbLB93lUQqXB99LYz1GxIdEfRqEfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EEiAmtVwrIQvNc2wSK2bK4Z8bXjg88q0wlg+0DBrNU=;
 b=RnbCwpANnbTmSUsiIfR+SeTS3RNAFhi+Mg61/C14ijsJqsQFvJcOIyz52jsURWTDFhpt4lfqkpQDmOfbPiZdpfnMGkjlwl3lA2Vo1XrJGTqDCZLFSQUUBH8/OKqUP3mJrlHer8ypUAHdoprcjLc2n3cHcx3FjofpeANmsKjQvlq7jJxhElAa93S5uXdgBZKx/8nVBFdpk/+w/5BcMI6wvf/ZXFlI4JW0irBLOU5tssJ+h34C6yVqWz4KxzwAMKiLv4tcMTA3FrldFElQymJ0WbLWANRgf42NyGjstNA1lEbtgrlCVWtHV+jBntmvwORuZh5uR7QdD0ud/asz1PwyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EEiAmtVwrIQvNc2wSK2bK4Z8bXjg88q0wlg+0DBrNU=;
 b=qlxgP7pSlpNwHem+c8qKWmsyG/PrKz1UzBVzfAkSDZn6KvSwF0h/NjOakUcol6/M/qOJzG+Fb8dznlIlkIJMwXqGPP7QhgNTlyhSBC8L3WYTiegd08Oz7jg69cqN2NVhZ3UOorKjIsToLUFIlziLYzG1bo3C1PtWLRni0t6fPV0=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB8703.jpnprd01.prod.outlook.com
 (2603:1096:604:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 09:31:33 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 09:31:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXwwgAAZsoCAAANogIAAEt4AgAADUYCAH1ohsIAJ2M8AgADjuFA=
Date: Thu, 11 Jan 2024 09:31:33 +0000
Message-ID: <TYCPR01MB11269FEAC33F53C8D8DF3180786682@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <g4uqcavglw2md4ojiw7yxequy37ttozjazr3b4ypqzznlrsinv@zm6mvzaempwp>
 <TYCPR01MB11269BCE6CAEE3C5063C4D1728693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269726F051D0F497597F28A86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20240110193852.GF23633@pendragon.ideasonboard.com>
In-Reply-To: <20240110193852.GF23633@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB8703:EE_
x-ms-office365-filtering-correlation-id: 24de06b6-3a65-4253-c147-08dc128819d2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lo2e4nvZXubIlJuT7XTOrNDq7SYrsXCyS3mE5lvxmvpM7nzPBXgFNdcBbPqI7HSnj1jJguXNPi56JTLMQBV1y/0LmX/5O3w4Ghqqbec9NuPuGgfximeKDHuqvNbBmuyRLiJ6y4xwLYmStY6d4EtcKMonkbj71LXbEd6d/ZD9A1aDZLU9MU2Kazq/E1j/MH+ShVzO8u+8yfJzDg1Fg0VD7hzKdWuCmtdaMfLCE1YBttfPTtBU2JNTPaHAHh+S6J41rMALKWHcFupa58qN2FHrFrf/tEbwPtKJq2JYIO8peMOdgZnpAD0cuKGnF4zyA+ZNY1p9fj18ze5DfhTEHE8rDdGWjJ0NXgJL1zznb5tLB4xwivdm2gPGWndxOMB/TTMtMZuS4cB9d9wkOVpikv1MIFrZnEs8MhBuC7FaL7CPVwRGj4xkTts6oEVGjaqlUEB/hWRS6Fer2mh+4OR5AggTO0JGFVXgQ/Qe9jsAfeOtWKf7sebus08BslVCrmhlOZcVUbYiX9bHvX/EGxhuQTOYJ4L/PxrkReYmDX9P3E0Sie43PyrRRRh6anb9eKpDlcwHopJP4H7yViGWWK4iPZn0XsvYXxxlenqQijmTDr/oqWlwXa+kmJIA9ZSzCB5Pssxl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(38070700009)(33656002)(53546011)(4326008)(52536014)(26005)(54906003)(6506007)(8676002)(55016003)(8936002)(2906002)(9686003)(83380400001)(7416002)(478600001)(5660300002)(7696005)(64756008)(316002)(76116006)(66476007)(66556008)(66446008)(66946007)(6916009)(71200400001)(86362001)(38100700002)(41300700001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UllnRktReEJ0ZTBlUnZZT1Z2K2cyeDQ1Q3JyakQyV3BDaHBHcDFqNUQ1RnlY?=
 =?utf-8?B?KzBDUzEySVZsb20zVVVHNkpXbngxaHA4U1A2UkFVb2dYL29HVHliTFgyUENp?=
 =?utf-8?B?bjBEdE1uRktVTVRFU0RGaWh1aSthM2tBbmJ2S3h6dyt3M0p3YVdwL0ladkUw?=
 =?utf-8?B?ei9BelJFWjRGWFk3R1BrT3RCbDFubDVsY0pWT1dnd0FXUHV6bWhSQldRamc1?=
 =?utf-8?B?eDF3MWluSGU4enVUKzBVUHB0YklPcUNRSjJ0cWQ4YXRSYjJjVnBSR2RVY0xK?=
 =?utf-8?B?Yk1aekpPcEdrU0k1VFRkK3FVY29BSHBqeG1Eem1MZHVRZkhiZ2FvaEMxcko3?=
 =?utf-8?B?THdvOFFlRXhKT0dSc0N4YnFING51M3YvOEY1YURHeVVSbEYxU2RqU0t6UElR?=
 =?utf-8?B?a1hmNzAyWTVFTDh5OVIyVGJZWTZkcnpQcHNlRE1iaFlnSmthQzhOQVRqa28x?=
 =?utf-8?B?M0pSZXcwQk9iczF6M1pqQXpNTlYzU01EZDFtV3d0RUxJcTBMWHFySjFTenUr?=
 =?utf-8?B?YWdJZWRrc0Z0aklJMkRVNGtPeDVGTitIMGhOUTZ6YjM0RUlpa0hWVVVBNTFx?=
 =?utf-8?B?aWx0NXRvc3ZBV25UenpNVlJEWUIrMmRHaVdleFF0YnRBZGRUM0YzZWYwb0du?=
 =?utf-8?B?ZS9KQXBqMTkxOTRvK1VRN2N0ZytZcUNFK0toRjYrOG9EZlRLNSt5SmxFeDMx?=
 =?utf-8?B?S0svZGw4Rno4dVVwQ0JzY1YzYSt3N29JZzNVcThTRVN2K1phRk1NODZiTkU0?=
 =?utf-8?B?Y055YXdpbTVZNnlaWnVRYVdmc01RL0p2Z3ZDSGIyVG9CM1E5SEtpK2ttZk1U?=
 =?utf-8?B?WTJJUUlHdy9ZNks0ajN0UjFKMjBrV1BaejJtVkZTMzJkUzRFRnZmTm1xSy9Y?=
 =?utf-8?B?MVh2ZCtXcWVFV1hBRWtQc0szQ0Y3cExkZjhub05ibWJkZ2l1QUFESFlFUHdh?=
 =?utf-8?B?OHE5eHJSbndMVTUwbEs3UTJqbU5SWEYzck4zWlZ6eE4vQ05xSnB3ZDdEVGR4?=
 =?utf-8?B?NHhmOVUramE1Q1BiQ3N0YzVTTkNyL09pbldSNFNVT01KUVQxOWZhOW1VTldT?=
 =?utf-8?B?RGkvM1liaVV2QUQvS1hMWUpZU1U4dEtmRytqM3poU0FBbXh4SXN3QWZlUksw?=
 =?utf-8?B?SVhwOVgwQUFCcEV4ekJCdFkvSEJkR3BFNmsxTSsxWXk3T3lVMG1VVkRMVHR2?=
 =?utf-8?B?bCtBT2tORTl3enkxQlppUDg2Z3N2Y0lVWEVtL2pnUCtEcG8vSVg5NWdxUExV?=
 =?utf-8?B?VE1QMWVrK0FtdDRqWDAvQ3FUWC9HYS9VVDYzKzlIcEFKRldlSkVkeVNTU09r?=
 =?utf-8?B?VjFUb01YamlzN2ZESTNPTDc3a28yZVJJZ1BPUTE5QWN0MEIyc3R0MUZoRFBN?=
 =?utf-8?B?RDNMQ0lpVXMvejA3MGxoTHpiajVjQWFjK3NVcllyOXdSdmpZMnFXNnJxM09M?=
 =?utf-8?B?Tnp2c1IxUWRGODZOdG1reE5HaUxBL1B3cUVBM0NMS3EzMThUSkJhTFd0Q3Bt?=
 =?utf-8?B?SFJ6WUZya3pnS3VNcnhRVFBSdkd1c2NGN1lrR25YdDZIVmNPcXZrOHhFT25S?=
 =?utf-8?B?TGlaT1NHQ1FsdU5rOFZESXpteXFsU1ZtbUZlUHRQcVZHNG1vTWVSajRReHI3?=
 =?utf-8?B?MUx1WWRFMXU3aGUzSnpyOCtXWVlJTUZlVUkzbjRiUWpNNHBGNGpvb3RYcDdv?=
 =?utf-8?B?c1pBY3V6LzI2U2lJbXhLNWhNelEyUjdQTzBCVWEwL244NWNmd3RVdGFUeTRW?=
 =?utf-8?B?UHNQMHVIYVUrV3VwUjdsTEkrNjVuT1dDdytMZDc3RlRmcjdmWjNXMXpPZ2dq?=
 =?utf-8?B?Q0laS3RnU1ZUSDRFMjFkekdRWkZNRENqN0VyTHVCR2ppT3k3VzdXOHVXb3ZV?=
 =?utf-8?B?QlJuWkE1Mk00Qlc5S0ZMaEFjUUIvYzdSUkdKWm1JKzJnb09zcHByVW9ub3VS?=
 =?utf-8?B?UlhGb3FlQnZGeVo5SjdqZjZBZTZLNXBJNzhlb3VmT1IzTURRMnNDVFpPUklk?=
 =?utf-8?B?ajFraHluNHk5QTlyclpxTWt6REVjb1hpcG0zYTMwdEZiRWR2Q0xQWkpCdVhX?=
 =?utf-8?B?ZjdhajhqUExXcm1BbkhYTXFkWjc5YnRKdkhPa0RPb2pJb3IzUm82WmJiM3pF?=
 =?utf-8?B?UVlXU2svRmNqbzR0UVMzb2o3STVXM09yNExsRzZBZUk0ZUYvN3VMUlVzekZs?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24de06b6-3a65-4253-c147-08dc128819d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 09:31:33.7254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xnY9snR9m6fGPFSkZeudc7mytQvqBRQTDbdGM4kaT9nLIC71KUykzLaa2xFL8wAkARH8F1aSKlKKdgox3P7IYEKjEKE+zitjU4nGtEEnP6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8703
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
 Maxime Ripard <mripard@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMTAsIDIwMjQg
NzozOSBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNSAzLzVdIGRybTogcmVuZXNhczogQWRk
IFJaL0cyTCBEVSBTdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBKYW4gMDQs
IDIwMjQgYXQgMDI6MTc6MzlQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gT24gRnJpZGF5
LCBEZWNlbWJlciAxNSwgMjAyMyAyOjU2IFBNLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+IE9uIEZy
aWRheSwgRGVjZW1iZXIgMTUsIDIwMjMgMjoxOCBQTSwgTWF4aW1lIFJpcGFyZCB3cm90ZToNCj4g
PiA+ID4gT24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMDE6NTI6MjhQTSArMDAwMCwgQmlqdSBEYXMg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgcnpnMmxfZHVfY3J0Y19l
bmFibGVfdmJsYW5rKHN0cnVjdA0KPiBkcm1fY3J0YyAqY3J0Yykgew0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ICsJc3RydWN0IHJ6ZzJsX2R1X2NydGMgKnJjcnRjID0gdG9fcnpnMmxfY3J0YyhjcnRj
KTsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKwlyY3J0
Yy0+dmJsYW5rX2VuYWJsZSA9IHRydWU7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gK30NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyB2b2lk
IHJ6ZzJsX2R1X2NydGNfZGlzYWJsZV92Ymxhbmsoc3RydWN0DQo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gK2RybV9jcnRjICpjcnRjKSB7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKwlzdHJ1Y3Qgcnpn
MmxfZHVfY3J0YyAqcmNydGMgPSB0b19yemcybF9jcnRjKGNydGMpOw0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArCXJjcnRjLT52YmxhbmtfZW5hYmxlID0g
ZmFsc2U7IH0NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gWW91IHNo
b3VsZCBlbmFibGUgLyBkaXNhYmxlIHlvdXIgaW50ZXJydXB0cyBoZXJlDQo+ID4gPiA+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gV2UgZG9uJ3QgaGF2ZSBkZWRpY2F0ZWQgdmJsYW5rIElS
USBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nDQo+IHZibGFuay4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiB2YmxhbmsgaXMgaGFuZGxlZCBieSB2c3BkLg0KPiA+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IHZzcGQgaXMgZGlyZWN0bHkgcmVuZGVyaW5nIGltYWdl
cyB0byBkaXNwbGF5LA0KPiA+ID4gPiA+ID4gPiA+ID4gcmNhcl9kdV9jcnRjX2ZpbmlzaF9wYWdl
X2ZsaXAoKSBhbmQNCj4gPiA+ID4gPiA+ID4gPiA+IGRybV9jcnRjX2hhbmRsZV92YmxhbmsoKSBj
YWxsZWQgaW4gdnNwZCdzIHBhZ2VmbGlwDQo+IGNvbnRleHQuDQo+ID4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+ID4gU2VlIHJ6ZzJsX2R1X3ZzcF9jb21wbGV0ZSgpaW4gcnpnMmxfZHVf
dnNwLmMNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFNvcnJ5LCBJIGNvdWxkbid0
IHJlYWxseSBnZXQgaG93IHRoZSBpbnRlcnJ1cHQgZmxvdyAvDQo+ID4gPiA+ID4gPiA+ID4gdmJs
YW5rIHJlcG9ydGluZyBpcyBnb2luZyB0byB3b3JrLiBDb3VsZCB5b3UgZXhwbGFpbiBpdCBhDQo+
IGJpdCBtb3JlPw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBXZSBqdXN0IG5lZWQgdG8g
aGFuZGxlIHZlcnRpY2FsIGJsYW5raW5nIGluIHRoZSBWU1AgZnJhbWUgZW5kDQo+IGhhbmRsZXIu
DQo+ID4gPiA+ID4gPiA+IFNlZSB0aGUgY29kZSBiZWxvdy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gc3RhdGljIHZvaWQgcnpnMmxfZHVfdnNwX2NvbXBsZXRlKHZvaWQgKnByaXZhdGUs
IHVuc2lnbmVkDQo+ID4gPiA+ID4gPiA+IGludCBzdGF0dXMsDQo+ID4gPiA+ID4gPiA+IHUzMiBj
cmMpIHsNCj4gPiA+ID4gPiA+ID4gCXN0cnVjdCByemcybF9kdV9jcnRjICpjcnRjID0gcHJpdmF0
ZTsNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gCWlmIChjcnRjLT52YmxhbmtfZW5hYmxl
KQ0KPiA+ID4gPiA+ID4gPiAJCWRybV9jcnRjX2hhbmRsZV92YmxhbmsoJmNydGMtPmNydGMpOw0K
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAJaWYgKHN0YXR1cyAmIFZTUDFfRFVfU1RBVFVT
X0NPTVBMRVRFKQ0KPiA+ID4gPiA+ID4gPiAJCXJ6ZzJsX2R1X2NydGNfZmluaXNoX3BhZ2VfZmxp
cChjcnRjKTsNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gCWRybV9jcnRjX2FkZF9jcmNf
ZW50cnkoJmNydGMtPmNydGMsIGZhbHNlLCAwLCAmY3JjKTsgfQ0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IFRoZW4gd2UncmUgYmFjayB0byB0aGUgc2FtZSBxdWVzdGlvbiA6KQ0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IFdoeSBjYW4ndCB5b3UgbWFzayB0aGUgZnJhbWUgZW5kIGludGVycnVw
dD8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdlIGFyZSBtYXNraW5nIGludGVycnVwdHMuDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBbICAgNzAuNjM5MTM5XSAjIyMjIyMjcnpnMmxfZHVfY3J0Y19kaXNh
YmxlX3ZibGFuayMjIyMjIyMNCj4gPiA+ID4gPiBbICAgNzAuNjUwMjQzXSAjIyMjIyMjIyNyemcy
bF9kdV92c3BfZGlzYWJsZSAjIyMjIyMjIyMjIyMNCj4gPiA+ID4gPiBbICAgNzAuNjUyMDAzXSAj
IyMjIyMjIyMjIHZzcDFfd3BmX3N0b3AjIyMNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFVubWFzayBp
cywNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFsgMTc2LjM1NDUyMF0gIyMjIyMjI3J6ZzJsX2R1X2Ny
dGNfZW5hYmxlX3ZibGFuayMjIyMjIyMNCj4gPiA+ID4gPiBbIDE3Ni4zNTQ5MjJdICMjIyMjIyMj
I3J6ZzJsX2R1X3ZzcF9hdG9taWNfZmx1c2ggIyMjIyMjIyMjIyMjIFsNCj4gPiA+ID4gPiAxNzYu
MzU1MTk4XSAjIyMjIyMjIyMjIHdwZl9jb25maWd1cmVfc3RyZWFtIyMjDQo+ID4gPiA+DQo+ID4g
PiA+IFNvcnJ5LCBteSBxdWVzdGlvbiB3YXMgd2h5IGFyZW4ndCB5b3UgdW5tYXNraW5nIGFuZCBt
YXNraW5nIHRoZW0NCj4gPiA+ID4gaW4gdGhlIGVuYWJsZS9kaXNhYmxlX3ZibGFuayBob29rcyBv
ZiB0aGUgQ1JUQy4NCj4gPiA+DQo+ID4gPiBJIGhhdmUgbid0IHRyaWVkIHRoYXQuIFdpbGwgdHJ5
IGFuZCBwcm92aWRlIGZlZWRiYWNrLg0KPiA+ID4NCj4gPiA+IEN1cnJlbnRseSB0aGUgSVJRIHNv
dXJjZSBiZWxvbmdzIHRvIFZTUEQgaW4gbWVkaWEgc3Vic3lzdGVtLg0KPiA+ID4gU28gSSBuZWVk
IHRvIGV4cG9ydCBhbiBBUEkgdGhvdWdoIHZzcDFfZHJtIGFuZCB0ZXN0IGl0Lg0KPiA+DQo+ID4g
KyBsaW51eC1tZWRpYQ0KPiA+DQo+ID4gTGF1cmVudCwgYXJlIHlvdSBvayB3aXRoIHRoZSBiZWxv
dyBSWi9HMkwgc3BlY2lmaWMgcGF0Y2hbMV0gZm9yDQo+ID4gZW5hYmxpbmcvZGlzYWJsaW5nIGZy
YW1lIGVuZCBpbnRlcnJ1cHQgaW4gVlNQIGRyaXZlcj8NCj4gPiBOb3RlOg0KPiA+IEkgbmVlZCB0
byBhZGQgYSBxdWlyayBmb3IgaGFuZGxpbmcgdGhpcyBvbmx5IGZvciBSWi9HMkwgZmFtaWx5IGFz
DQo+ID4gb3RoZXIgU29DcyBoYXZlIFZibGFuayBzcGVjaWZpYyBpbnRlcnJ1cHQgYXZhaWxhYmxl
IGluIERVLg0KPiANCj4gVGhlIERVIGRyaXZlciBvbiBHZW4zIGhhbmRsZXMgdmJsYW5rIGV4YWN0
bHkgYXMgaW4geW91ciBwYXRjaC4gV2hhdCdzIHRoZQ0KPiBwcm9ibGVtIHdpdGggdGhhdCA/DQoN
ClRoZXJlIGlzIG5vIGlzc3VlLiBNYXhpbWUgUmlwYXJkIGlzIGNoZWNraW5nIHdoZXRoZXIgaXMg
aXQgcG9zc2libGUgdG8gbWFzay91bm1hc2sNCkludGVycnVwdCBhc3NvY2lhdGVkIHdpdGggdmJs
YW5rIHJlcG9ydGluZyBkdXJpbmcgdmJsYW5re2VuYWJsZSwgZGlzYWJsZX0/DQoNClRoYXQgaXMg
dGhlIHJlYXNvbiBJIHByb2R1Y2VkIHRoZSBiZWxvdyBwYXRjaFsxXSBmb3Igc3VnZ2VzdGlvbnMu
DQoNCj4gDQo+ID4gWzFdDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3ZzcDEvdnNwMV9kcm0uYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9yZW5lc2FzL3ZzcDEvdnNwMV9kcm0uYw0KPiA+IGluZGV4IDliMDg3YmQ4ZGY3ZC4uMzkzNDdj
MTZiYjI3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92
c3AxL3ZzcDFfZHJtLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
dnNwMS92c3AxX2RybS5jDQo+ID4gQEAgLTkzNiw2ICs5MzYsMTQgQEAgdm9pZCB2c3AxX2R1X3Vu
bWFwX3NnKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0DQo+ID4gc2dfdGFibGUgKnNndCkgIH0g
IEVYUE9SVF9TWU1CT0xfR1BMKHZzcDFfZHVfdW5tYXBfc2cpOw0KPiA+DQo+ID4gK3ZvaWQgdnNw
MV9kdV9tYXNrX2ZyYW1lX2VuZF9pbnRlcnJ1cHQoc3RydWN0IGRldmljZSAqZGV2LCBib29sIG1h
c2spDQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVjdCB2c3AxX2RldmljZSAqdnNwMSA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsNCj4gPiArICAgICAgIHZzcDFfd3JpdGUodnNwMSwgVkk2
X1dQRl9JUlFfRU5CKDApLCBtYXNrID8gMCA6DQo+ID4gKyBWSTZfV1BGX0lSUV9FTkJfREZFRSk7
DQo+IA0KPiBUaGF0IHdpbGwgYnJlYWsgZXZlcnl0aGluZy4gQXMgc29vbiBhcyB5b3UgdHVybiBv
ZiB2YmxhbmsgcmVwb3J0aW5nLCB0aGUNCj4gVlNQIHdpbGwgc3RvcCBwcm9jZXNzaW5nIGZyYW1l
cyBhbmQgdGhlIGRpc3BsYXkgd2lsbCBmcmVlemUuDQoNCk9LLiBJIGFtIG5vdCBhYmxlIHRvIHJl
cHJvZHVjZSB0aGlzIGlzc3VlIG9uIFJaL0cyTCB3aXRoIGxpbWl0ZWQgdGVzdGluZyBjb21wYXJl
ZCB0bw0KUi1DYXIuIEFzIHBlciB5b3VyIHN1Z2dlc3Rpb24sIEkgd2lsbCBkcm9wIHRoaXMgY2hh
bmdlLiBJIGhvcGUgaXQgaXMgb2sgZm9yDQpldmVyeW9uZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHZzcDFfZHVfbWFza19mcmFtZV9lbmRf
aW50ZXJydXB0KTsNCj4gPiArDQo+ID4gIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0tLS0tLS0tLQ0KPiA+
ICAgKiBJbml0aWFsaXphdGlvbg0KPiA+ICAgKi8NCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9t
ZWRpYS92c3AxLmggYi9pbmNsdWRlL21lZGlhL3ZzcDEuaCBpbmRleA0KPiA+IDQ4ZjRhNTAyM2Q4
MS4uY2NhYzQ4YTZiZGQyIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvbWVkaWEvdnNwMS5oDQo+
ID4gKysrIGIvaW5jbHVkZS9tZWRpYS92c3AxLmgNCj4gPiBAQCAtMTE3LDQgKzExNyw2IEBAIHZv
aWQgdnNwMV9kdV9hdG9taWNfZmx1c2goc3RydWN0IGRldmljZSAqZGV2LA0KPiA+IHVuc2lnbmVk
IGludCBwaXBlX2luZGV4LCAgaW50IHZzcDFfZHVfbWFwX3NnKHN0cnVjdCBkZXZpY2UgKmRldiwN
Cj4gPiBzdHJ1Y3Qgc2dfdGFibGUgKnNndCk7ICB2b2lkIHZzcDFfZHVfdW5tYXBfc2coc3RydWN0
IGRldmljZSAqZGV2LA0KPiA+IHN0cnVjdCBzZ190YWJsZSAqc2d0KTsNCj4gPg0KPiA+ICt2b2lk
IHZzcDFfZHVfbWFza19mcmFtZV9lbmRfaW50ZXJydXB0KHN0cnVjdCBkZXZpY2UgKmRldiwgYm9v
bCBtYXNrKTsNCj4gPiArDQo+ID4gICNlbmRpZiAvKiBfX01FRElBX1ZTUDFfSF9fICovDQo+IA0K
PiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
