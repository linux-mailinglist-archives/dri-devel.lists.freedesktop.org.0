Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5EE813C07
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE7D10E99B;
	Thu, 14 Dec 2023 20:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EA310E26A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzZBtfvvcFItGtWWulC7fL+KzM6gzMNn2mKh+H3mC0Tt8uv6uFT7KSpz0vq2NHJ1hwnAcjMpihOVSv6V+lxhSF8thlMdaLc1ZHQU+JNwlNc3aKlcaibg912dvUSQF3FE3Hjs3Jk+zDwmUEH/j00QNKQa1lg9zLiFfuenOygznPsgveBKY8xJgFSMmO2fXhQssopojb17XhmsgizdGHvOLv6Ew9r+mt6QZzwu0j6m2Jg3CnSdWcRf1TQGS7nXDz7uqdoVHGEb6pRPjWbalxqpkxdQDbAVrEu7VfUzh0orU89+Y6GjE24RwxoYPrtL7pNbal+eEcMSb06BVnhTp0nJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PqZ3m+F/qLBPXumnktB0vpIi9M3UF7Bd6HlcrKVQaA=;
 b=aDlBBZ0KPUN+S1V6AqE+LMOIB2eiQg32AMp/sATFXvm1tkOMOMvAI+lIXo5XbbG97D8bDBs+9Y4jC8cl1pkAAicYeW3ejQUa2vaEzCEeKD+l4pmSCnYwoLXCOva2GUOr8J/H6jdifxYWLXZoMbsvzagOOzsEruUB7PDykVQ3BkzSO9Pv/zalkoWsZDGIIpcqXemMxJHfjBpYU3W7V6u9Cyy4kB7FY2aNBOACTQIC2xqWWmiZeYlMoRgKNV5S/dQCxiXzYflcsUPBJSGkTZ6+WiiJ9+MixGqLz0x7bT1lVznTI7Wy8A9zkLunLIpWE2uynuJbxhkw1ZE2ftv7wIUibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PqZ3m+F/qLBPXumnktB0vpIi9M3UF7Bd6HlcrKVQaA=;
 b=XPN271WsSHmfLr6r0seBcEtykkhC2sl/cfRUeUgtPhIka24gUimA0t4vT8zrbKbV9SIAe9zLDxIXYf21kAYTjTURC4ne2YS3WY8HBFTukr3UO33+SKi+uk7f7z/c/nvbJ+TaroQsdKesqAS5wAXfl3aUYACj3thJmycTfuVX1w4=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYCPR01MB8818.jpnprd01.prod.outlook.com
 (2603:1096:400:18e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Thu, 14 Dec
 2023 20:50:17 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::db2e:9e88:68f8:486b]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::db2e:9e88:68f8:486b%4]) with mapi id 15.20.7113.010; Thu, 14 Dec 2023
 20:50:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAIbOgA==
Date: Thu, 14 Dec 2023 20:50:14 +0000
Message-ID: <TYVPR01MB112799FA3028E651D8BC9AA1F868CA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
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
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYCPR01MB8818:EE_
x-ms-office365-filtering-correlation-id: 5d48eed9-1be2-4e4e-260b-08dbfce64570
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UjL5xN09QeS8rQs7CMA9ZsEFtBraCcxVCxqJViOStP0aG7XVEb1uR+aBJLjSpujyLteW3mW6XBFfNMAzGjNIzfd/hF23j+5/0b63ovE/dnPfE590x1fDBdtrXz9iYSRkxx9W7wu3m9r0JHw239ZEDMnHxSsU1I3ckrDd8KJLe0vqWgjfUTU33jTmERsFleaZcRqlm54rObV07W/TV7vgEHzUWTaxz7cdN6Ju7EWIpWHKLeNgzMispcAX3hmmeseRPIWI6xs/9rLXSC1G8ATGAV2REtFjqk4WXoWmSXM9AUckekPAYfwr19dH/r3zAnnWtNVeiE1vG9v0YyOCMdqNs+s7qCMiSscmQ30AGEf65xHEZQ1OWD6rOS+cIJo5rGWtU8kJKg03GtgYGqIUqXcfZjiyZSuz2/00vdOB3x4AK5y+z98WJmXE//9WUZ+Tq22Bcs3F3raa+BnChks4MFQln1bjbKNrDrfC0ghBFxktH5CGjBey4RiRByD+2iFGkXvd4hG9J7+QC5nbwrdIcfbf+1rt93f2bnBnyg0E3QEEvSlPQQvJwBrliQnrJVQ6v+EUgbBPishCjUZDTGb2Zv2sO8u76N2+VifxbunI5JHfXRRfNezclnxqup1mBKDLk+Ie
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYVPR01MB11279.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6506007)(7696005)(71200400001)(53546011)(9686003)(83380400001)(5660300002)(7416002)(52536014)(4326008)(41300700001)(2906002)(478600001)(8676002)(8936002)(76116006)(66946007)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(66556008)(33656002)(86362001)(122000001)(38100700002)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXc3MGRyUS9iQUp2T2cyRmpZdmQvRWJJZzAvMEdOeCtrKzZJcTRhWUtVVEhQ?=
 =?utf-8?B?b1UxS0NZeUVxbFJIT1BVN2xhY0hsbHF0OW1lUGpWQ3lRQng3V2pCUnBlYUtW?=
 =?utf-8?B?aUpjRVA4M3VEYXFDL2lKbEdQb3YwNEpZWlhxb1NLMTRza3Q1NHMyV09sNjZC?=
 =?utf-8?B?OGNFZWpoMXp4aTNYUWlOY2d5SmpGM0txTHpIbG9QZkdmN0tpRXFKSmVqZTZB?=
 =?utf-8?B?Q2dRMUUvMkRJeDlGTGttaWtvV2J6S1hWUDNlYVBYK0FDaUp1WG5iK2ZpbVEz?=
 =?utf-8?B?b2JCVmxvK0xBSXVGVkRFMm1tSDdrYzZpdFRmU1RXb2FKQXFVSEc1QTdDa2tW?=
 =?utf-8?B?c0IvVUh1bFNLSHNSSFJINmxIbXJZbDF5ZWV4MkJVcTBDVUYzbDEwZjc4c2Rt?=
 =?utf-8?B?RDYxTWVEU2J6d0xLWG4yR0ZhNlZWRkh6dFZGOWlBWnFWMVlxRmtsTzRZaWMv?=
 =?utf-8?B?SFBtREpCMGdFeDE5TzJwYlJ2aWE3QzlWa0JSVHhoUkhrNEg5SHFsNUM4U0R6?=
 =?utf-8?B?dHZTdGticjBacS9sYlJQaWt2bmpPNlZ5bFpHWXF1WVgvMEtUWSsyTVdqaGU1?=
 =?utf-8?B?bTNFbXdENHZvazdxUkxJYjVYMDhVaGFTbkVFTnhpQjZLdVJjRHlKY2thRkVX?=
 =?utf-8?B?ZFpBWk5CSW9YM3hPWEhTcjNqSlpjY09MbEJBS2hERTU5Y2hOUUdRem5QdTRa?=
 =?utf-8?B?VWtwaTgxdzNsdVk5Y2ZubzViTUZBbEV6WmFiUXZDUWpvVmRHdDZ1THJCaER3?=
 =?utf-8?B?WnJQeG9nLyt2RVh0Sk10RlpuQlk5MDROd3ZqdkQ1YWRBbmFIVFRiT0t4NVhk?=
 =?utf-8?B?dnUrcUJ2dUVCOXNyYkwxdjJYU2ZzeFhPWERhRS9meXFVTEorMHYzb28wYm9m?=
 =?utf-8?B?NHp4aGhvQmk2Y0hoaExPNzFZLzVXMlRXNE9rVHpqNFdCS29MNmNCTzNNNUV0?=
 =?utf-8?B?Y3BTeldrODNsYVRDQyt1bTgrY2cvSGJHaW9ZenlFV24xdGJ1OWwzNTNob083?=
 =?utf-8?B?WDVKWkc2R2s3VDZwMWltRGJFd05Yd1Fvdit6R1ZBdisyNVl3cXJOVGkyTzRB?=
 =?utf-8?B?cHJsdlVMOVdRdklnMGFQTTloWGJaYnV0TFlYVm1yOGxEVFJaNVkrNkloRERN?=
 =?utf-8?B?QkNKb0NMYlRhRzl6RDlUblhzeTdLZkplY2pEOWdhQ25ZdGR3N2xPR2NXRHYz?=
 =?utf-8?B?SE4wYThWSk9XSkRvY2FaZHZ6NUhoV1RSS3VwZHNTNWxHRjJjYVhQV3VqK3ZP?=
 =?utf-8?B?NmxYYWhiZ0tDcTVKMVYvODFIbml6eWhsdis1SEZWcnd1L1hVQzJKMCs2T1Uy?=
 =?utf-8?B?S1NXeENrdUIrUXRnbEY4Zk81YzhJUjlvOEw0aU5WMjBrNWw4djZXZ1dTRWlz?=
 =?utf-8?B?VDQ4ZXFSOFMvb2VTM2Z1NkZ2c3lqM2tHcFRZUXpoVmtwek5iSXFQM2NWVTJ6?=
 =?utf-8?B?YTJ6RnNDa2xHVWxKSXNLNmRBRWtLWUpWMzBZdHZWNGdEbHVCN083RHhrN003?=
 =?utf-8?B?d090dTVTK1V5T1U5ODA4Vm1ncE9XbmNsSnI5VmpTdHBBeHdxZnpCYUJCNSto?=
 =?utf-8?B?ZmpMd3F0SUNQYWpPeUwySFN6OWIzUHFFZjZoTWViVElGYWZnS3JXbWxHZFpC?=
 =?utf-8?B?QWpmUy9aYnd2bWd6K1VaRW9VaXNaMVVyM3Azc3JNSS9zN3JwYko4Tm1iZ3JJ?=
 =?utf-8?B?aWphZ1ZEU3dNM3FMQ1pjQ09TYjcrUDZXbDV1VnkvQW0rRkptR0RNaHRHV3pw?=
 =?utf-8?B?anl1WmZtOGlLWnkySnVqbUx0c1VhNytqQnR3MlNZTnM5dWFqQ2JmbUtMR3JR?=
 =?utf-8?B?TU14ekdHZUE4c1FkZ0FuQ0g2Qk4zUENVM1RQbDdxaU5XZmhKTDd6Zmxsc0hn?=
 =?utf-8?B?TENFUHVNN1FkVVVxbklCNTZ6MHEvcE43MlRjTmpKcDZaMjdQRVd4SEdNUFZB?=
 =?utf-8?B?d1lBL1dEeW1zVjQybjNlNDNpSlBCNE5GNzF5SjRrN0hOdVNlT3VDQ0NxSDJO?=
 =?utf-8?B?UEdJRnkvTHFUVmU5WWdtV0V2cUorMFdqamVDREZ5UUw1a2lHK256QUpoTDl3?=
 =?utf-8?B?N2hhTkNIQVNVZ3ZSRlpwS0Q2TTJlRU1KWGp6N1JpOUJrTUdCZFBicHI3bHdS?=
 =?utf-8?Q?MeI0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d48eed9-1be2-4e4e-260b-08dbfce64570
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 20:50:14.0565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4jOr2AZ4PCiNFDv2OliCav04RGPf8qE6RGCQvtafUynEkRu0O+kXvfaE+8liHabwaUV2xIzsedMlk/QozpvcbxGbp5lJ7kQ93Jz9tgj5Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8818
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

SGkgTWF4aW1lIFJpcGFyZCwNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEJpanUgRGFzDQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAxNCwgMjAyMyAzOjI0IFBN
DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjE1IDMvNV0gZHJtOiByZW5lc2FzOiBBZGQgUlovRzJM
IERVIFN1cHBvcnQNCj4gDQo+ID4NCj4gPiA+ICsNCj4gPiA+ICsJZm9yIChpID0gMDsgaSA8IG51
bV9wbGFuZXM7ICsraSkgew0KPiA+ID4gKwkJZW51bSBkcm1fcGxhbmVfdHlwZSB0eXBlID0gaSA8
IG51bV9jcnRjcw0KPiA+ID4gKwkJCQkJID8gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWQ0KPiA+ID4g
KwkJCQkJIDogRFJNX1BMQU5FX1RZUEVfT1ZFUkxBWTsNCj4gPiA+ICsJCXN0cnVjdCByemcybF9k
dV92c3BfcGxhbmUgKnBsYW5lID0gJnZzcC0+cGxhbmVzW2ldOw0KPiA+ID4gKw0KPiA+ID4gKwkJ
cGxhbmUtPnZzcCA9IHZzcDsNCj4gPiA+ICsJCXBsYW5lLT5pbmRleCA9IGk7DQo+ID4gPiArCQly
ZXQgPSBkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoJnJjZHUtPmRkZXYsICZwbGFuZS0+cGxhbmUs
DQo+ID4gPiArCQkJCQkgICAgICAgY3J0Y3MsICZyemcybF9kdV92c3BfcGxhbmVfZnVuY3MsDQo+
ID4gPiArCQkJCQkgICAgICAgcnpnMmxfZHVfdnNwX2Zvcm1hdHMsDQo+ID4gPiArCQkJCQkgICAg
ICAgQVJSQVlfU0laRShyemcybF9kdV92c3BfZm9ybWF0cyksDQo+ID4gPiArCQkJCQkgICAgICAg
TlVMTCwgdHlwZSwgTlVMTCk7DQo+ID4gPiArCQlpZiAocmV0IDwgMCkNCj4gPiA+ICsJCQlyZXR1
cm4gcmV0Ow0KPiA+DQo+ID4geW91IG5lZWQgdG8gdXNlIGRybW0gdmFyaWFudCBoZXJlIHRvby4N
Cj4gDQo+IEkgZGlkIHJlYmFzZWQgdG8gbGF0ZXN0IGRybV9taXNjX25leHQgYW5kIEkgZG9uJ3Qg
ZmluZCB0aGUNCj4gZHJtbV91bml2ZXJzYWxfcGxhbmVfaW5pdCgpDQo+IA0KPiBDYW4geW91IHBs
ZWFzZSBwb2ludCBtZSB0byB0aGUgQVBJPw0KDQpXZSBjYW5ub3QgdXNlIGRybW1fdW5pdmVyc2Fs
X3BsYW5lX2FsbG9jKCkgaW4gdGhpcyBhcmNoaXRlY3R1cmUuDQoNCnJ6ZzJsX2R1X3ZzcHNfaW5p
dCgpIHN0b3JlcyB0aGUgVlNQIHBvaW50ZXIgYW5kIHBpcGUgaW5kZXggZnJvbSBEVCBmaXJzdC4N
Cg0KVGhlbiBhbGwgdGhlIHBsYW5lcyBhcmUgY3JlYXRlZCB1c2luZyByemcybF9kdV92c3BfaW5p
dCgpDQoNCkNSVEMgdXNlcyBWU1AgcG9pbnRlciBhbmQgcGlwZV9pbmRleCB0byBzZXQgdGhlIHBs
YW5lKHJ6ZzJsX2R1X2NydGNfY3JlYXRlKCkpLg0KDQpDUlRDLT52c3AtPnBsYW5lc1tyY3J0Yy0+
dnNwX3BpcGVdLnBsYW5lDQoNCkNoZWVycywNCkJpanUNCg==
