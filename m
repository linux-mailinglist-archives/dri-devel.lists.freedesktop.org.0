Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789E824032
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6043810E082;
	Thu,  4 Jan 2024 11:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B06A10E082
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLc1Yo5uVACALiGBmfjXaow2Z1x4su9deUXRk2ZkV8UfMUTZFDy7YBw41CyVC88cnEXWwXsAM61o76URcJyJQbhr74qmm87lO5fohUIQI7uxt1AmbGcY/7VAX2v8G71+7cog4RnupZMPai5jP5BSjOwP/YpS5ykLLlzwpTrJcBd++W/FS5zXLcvtASq+sXTLjwvP053XOcb5sPrZzzg8yvcis3aP5BLZQMJpldCh8Qj8+WGuhlrDzFz5ykN+oLDLObgOWEI+eYTuyuWefmFjrfN7gtWFOz7RHv7pOPdiJMDmOa4V5+kUoPJlBwnssxJUzeVpShuUqzx5Bwu83P8GAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oId4MaKEr+sSS9v7SAbHq8KO9HmCoMvHr1vLnJ1UT1Y=;
 b=OWX8Nb8rvMNcbFMfGXEbi8gOJqtfndorihj7mR5k66gRL3OmqMMqyiURluSrT1rnRHgOHhig71erNNzoc9qjeFKnJhAgTRLBC9TZykFbis+a7kZo9R4y56ohykA6cnrPmGWz7GjpiYE343mAVxYiTHrM0XUFrJt526fgYjLsmCVmBfYzpJ/hFuGdEzUZxSYvWW2guk0Qf5H7DF1JTR964Y6kdrIC/d3oQWBNTum6jXWAQElcrfHlb3H9f2yKT8tF/pZisFUF04wFMCOR6strxqwHvaMJypVdiz0QDxlEdkOwnmVjMz1powyNocOANiYVfvMXILHuUOkwz9n0r2u9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oId4MaKEr+sSS9v7SAbHq8KO9HmCoMvHr1vLnJ1UT1Y=;
 b=DLpzfzgj3XAqzAcj0ROEo73IKsv5ifmD1F8KwVE2oT3vGa+DqE6OYQLN/0dW4ey6tWpToOoOeY/I9nvXla4hhuZ4krJA8/6lGvm5OQ1wsrGOqVaoUKZ/4r8Z+AsTwRdSZ0u8+X76I1boSS+qjrOGzBFm2NS/guzFFFVg7nuXkDk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5530.jpnprd01.prod.outlook.com
 (2603:1096:404:803b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 11:04:37 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.009; Thu, 4 Jan 2024
 11:04:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Topic: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Index: AQHaGIfbNkLqQJf+iUioLkutiw4N1LCvC8aAgBq+NzA=
Date: Thu, 4 Jan 2024 11:04:37 +0000
Message-ID: <TYCPR01MB112696F8C22F8FB4D2F2E28BC86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
 <20231218103903.GP5290@pendragon.ideasonboard.com>
In-Reply-To: <20231218103903.GP5290@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5530:EE_
x-ms-office365-filtering-correlation-id: a85daeaa-6d3c-4204-e933-08dc0d14f12f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mSYl+qV+ZlwLgXpgDx5v6ghlZJVGAqA2KyX372cG9pWa1ZPF+rIglXfVaDJe+fQyzIth6JWD9K/D5oRtUVV+USdxzBNxA5ZCPq/v+oxc48SChLcAsLEw3q+6gtjn8v7+4T4ilqKHRUlh71Q9k+ny9AQsVYi2q7Xbo5NfrZxc+BxqcfmwT3tnOYYX7ZkYECMHKfcfyOn1nQQtMPy4mKJZnYBmnGrMKDXi7txj8fa8fy7AsL5IfIMUfPknKRGtCMCJzTWCVo1KT7DpgKA3UHCRa+g0nZ/yi6jX4ICzOyRv7cJS3BOFJsaXXNIxKY8hpETdDGi8Rlh3vBvUmPQk0zO9S5RTMAUUDRpq0lkhr2M4PezTFpy5avNq0iHIaNV1mVbG0l4rkn9tkfNFqP2lZuVn81QXQa5rjLdEAZK2wFMblqGTiCse+IhOwFMowOEaNPIWY48n198yiTG0hObExoWI2gKfw/7Vivag/mnxOvi+e8yz/3dl0PTowvBk93ty/mZUVEc35gbhTeN9rkVMvv6Cm/md2mE2KVsw2mO2sljFh73MJNK0wLog8LPTkV97Qv5psWa7UXrUJF1wemaqz/CXZVYCIrAW91rDsabIWhJG8in3w/oFalayX5wezjFVyAe2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(122000001)(38070700009)(55016003)(86362001)(4326008)(9686003)(6506007)(6916009)(76116006)(66476007)(64756008)(66946007)(71200400001)(66446008)(66556008)(8676002)(478600001)(8936002)(52536014)(7696005)(316002)(54906003)(33656002)(83380400001)(41300700001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YktjNFhXdXVrRERGV25ZeWNHL0xYR3lxRXVmZWdySDBQZG5DK2xQeGtpZk9M?=
 =?utf-8?B?bnBmREJ0SVFBUmY0NUFDSXBXekF0bFh4ME5IK3REa1k0NlY5UDJCK1gyZTBs?=
 =?utf-8?B?eWorbjQyQWpXbW42Vk5nR3pOdE5xWS9xcUlQL0UwNEhPOTJVRFJKZ2NtaWRI?=
 =?utf-8?B?QU1RbWtGZ1FzTEhnZ05yZlNqNWUwb3ZiY3Q4VmJGWCs5VUIzYXNCdkhHRWRS?=
 =?utf-8?B?UUpKYzM5MmFaVnQ3OGpUL3dOaWhyOXhDK2NZZForM2U5VTVYSnpaMklVUVMr?=
 =?utf-8?B?Y2ZEZ2tOcCtEZnIrVzN3UWNKM0JPeHBrQ1h1T0dHWG8xWW9lQTlXNldGRUVK?=
 =?utf-8?B?RFB5OTUxQXNqTThFV2dwRmVtZ21lL293ZVFlS0N2TG5lSmhscUg5djZKa3JJ?=
 =?utf-8?B?ZnFnQy9iUER2QmpQZEVlQm1nWVFoZWtyY01kZ0I2UWNaNndJUXBtaHhTQ0V2?=
 =?utf-8?B?VFFnMzY1cFlOUXBndWd6SGZ4VHlzQk85ejJ6VUl2N1NjVHNnNkdPUmM4RGhH?=
 =?utf-8?B?Q2t4QUE3MkVvSFZOTk1KT3hDR0lYNExqZEl5c1NjK1o5Z21ubUNZVlEwU0c1?=
 =?utf-8?B?YXp5ZjdIc2cra29ReTRucklMaUo4b1drK1FINmE1QlMwUGZmbEhwOHN0Vk9J?=
 =?utf-8?B?WXBKb2tPaWh2M3FxbCs2c1M5eVBHcVNqL1FUSEZQcHE2UHRaNisrTUw1UmdM?=
 =?utf-8?B?Lzc5amh0ZnVvWGJSVUg5OHI4S2Y3R3ZnUjg1aHpCeHdwTm95cVZuaU9saWpO?=
 =?utf-8?B?S01EUTAvT29BQjFYSFBnUTVkVWlBKzIzTXNNVUZiRzZvdDBOeUZISEdseEJV?=
 =?utf-8?B?Nkd2eTlQbDlwbHhZc3ZIbW5KVFNCQUtBL0w1eWd5a1NYYmFQT1FhUUloMWVB?=
 =?utf-8?B?Z1ZXM29oSXpTMFVNZ1kzcWlPSmM5dDhxU241UUdlQmlWdStsWlVPZGNGZHoy?=
 =?utf-8?B?bXJOZ1RNVWxON2ZybDhmZFFnU3R2aDRLcE14Vk5BSHRvMDRyd0k3WVlqWSsx?=
 =?utf-8?B?bEdaZFNnRmh1RzZhaWk1azBqSGovWEpDd3NDYStlbG9BOHlaZUhQQmY3RUIr?=
 =?utf-8?B?aGRpWXJnWHloejlOUlVRVE1vN3hSdkU5a0kzT05peW5DNnBSVzZObWxIOVBy?=
 =?utf-8?B?dGV0TFJpRVBlOTBSVkw3YjNBR0JwNHNnTnIvNEVJd29hSHZKd2RPaTJrQWo0?=
 =?utf-8?B?Ry9EYnljR3Y2K09LZlltWVVidy9zNFNmV0krRVlYZlNrVFVKNE5WY1pkN0Zj?=
 =?utf-8?B?aE5ubVk5VUdBNm8zQ3NzNDY1NW5DYmVXWWd4Lys2ckEybEtpbDJEOWp0akli?=
 =?utf-8?B?aUNxZVV0RXpYbXRRb2xOYllaWk1MWGxFekhieUtqK055c2cxbEVKWXNNcG1W?=
 =?utf-8?B?ZXR5OXdoQ2xHS3BlRHUydVJ4QmZZVnNuM2R6QUN1WWF3b2xlTlFZQmJzdnNw?=
 =?utf-8?B?RzJ6WE8zbWZhTHRYZEF2OEdDMFkzSUVSV213R09sckdidG1mTU50YkRXV1lK?=
 =?utf-8?B?YXdDcGdZeHJ3ZiswbWRvRnFpRkdzNXh1UWR0NzNDcE5VM2ZnUGlxVGxPVzRJ?=
 =?utf-8?B?d1EyMzNqUHBLZnNNemJQNitvNUlucTgvcVJmK2VnN1QxNE84RjE1UkpicmFh?=
 =?utf-8?B?b0Z0c3owaXZTYXUyU25xV2ZxblJrbW9zMm5ubjRjN0g0M1g1d21DcHpFWk5G?=
 =?utf-8?B?YllsZDhEdE9STXZuY0FPT05GMEhWblpMai9acEkzMC9Eei9QQk9zS2s5UU1n?=
 =?utf-8?B?RFlUU3dZdG4yNVpPL3FCbmEyV3pKQlNOdzc1eEdqSjFXMUFHMUxDcnBRR3E1?=
 =?utf-8?B?S2ZvTUJVQktJV3dqM21MNS8veFdia04yRk5qa2tPeGVJcGMyN1YyaXNVRUJB?=
 =?utf-8?B?UmYxSGhnbzExenZBS1NkR1ZpcUwzVit0d3FaTVIycHBoZzNaZkhIUnRqRmRR?=
 =?utf-8?B?SGswYzExaW1oeGp2WXFOQjY3dk9wbmNLUUtXWDRVRTJGdUxoaXFwaDdmaWJF?=
 =?utf-8?B?emJnKy8rSS9NbFlwb2FDYUE2QklpcHlxV0huU0JHZEZ1WGtmWjJMR3VWWS9p?=
 =?utf-8?B?MkpLSG1HKytPblNNY3QwR21hSnl1VTdQRFNoQzFncTJlaCtFMVJoMmtYQkxO?=
 =?utf-8?Q?d3hs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85daeaa-6d3c-4204-e933-08dc0d14f12f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 11:04:37.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yYKTkT6wiK16bLNDwql+7+aUQdivgeRCZ1P61me/76u0SlHQVfB/xrykBLYJdVjVTpzsz/5/AguJAtsZs799BG5k1u1ikZtqcALt9DPMDko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5530
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

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm06IHJjYXItZHU6IEZp
eCBtZW1vcnkgbGVhayBpbg0KPiByY2FyX2R1X3ZzcHNfaW5pdCgpDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUaHUsIE5vdiAxNiwgMjAy
MyBhdCAxMjoyNDoyNFBNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBUaGUgcmNhcl9kdV92
c3BzX2luaXQoKSBkb2Vzbid0IGZyZWUgdGhlIG5wIGFsbG9jYXRlZCBieQ0KPiA+IG9mX3BhcnNl
X3BoYW5kbGVfd2l0aF9maXhlZF9hcmdzKCkgZm9yIHRoZSBub24tZXJyb3IgY2FzZS4NCj4gPg0K
PiA+IEZpeCBtZW1vcnkgbGVhayBmb3IgdGhlIG5vbi1lcnJvciBjYXNlLg0KPiA+DQo+ID4gV2hp
bGUgYXQgaXQsIHJlcGxhY2UgdGhlIGxhYmVsICdlcnJvcictPidkb25lJyBhcyBpdCBhcHBsaWVz
IHRvDQo+ID4gbm9uLWVycm9yIGNhc2UgYXMgd2VsbCBhbmQgdXBkYXRlIHRoZSBlcnJvciBjaGVj
ayBjb25kaXRpb24gZm9yDQo+ID4gcmNhcl9kdV92c3BfaW5pdCgpIHRvIGF2b2lkIGJyZWFrYWdl
IGluIGZ1dHVyZSwgaWYgaXQgcmV0dXJucyBwb3NpdGl2ZQ0KPiB2YWx1ZS4NCj4gPg0KPiA+IEZp
eGVzOiAzZTgxMzc0ZTIwMTQgKCJkcm06IHJjYXItZHU6IFN1cHBvcnQgbXVsdGlwbGUgc291cmNl
cyBmcm9tIHRoZQ0KPiA+IHNhbWUgVlNQIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQoNCkNh
biBpdCBiZSBhcHBsaWVkIHRvIHJjYXItZHUgdHJlZSBhcyBpbiBNQUlOVEFJTkVSUyBlbnRyeT8g
T3IgaXQgaGFzIHRvIGdvIHRocm91Z2ggZHJtLW1pc2MtbmV4dD8NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+IA0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBSZXBsYWNlZCB0aGUgbGFiZWwgJ2Vy
cm9yJy0+J2RvbmUnIGFzIGl0IGFwcGxpZXMgdG8gbm9uLWVycm9yIGNhc2UgYXMNCj4gPiAgICB3
ZWxsLg0KPiA+ICAqIFVwZGF0ZSB0aGUgZXJyb3IgY2hlY2sgY29uZGl0aW9uIGZvciByY2FyX2R1
X3ZzcF9pbml0KCkgdG8gYXZvaWQNCj4gPiAgICBicmVha2FnZSBpbiBmdXR1cmUsIGlmIGl0IHJl
dHVybnMgcG9zaXRpdmUgdmFsdWUuDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3JjYXItZHUvcmNhcl9kdV9rbXMuYyB8IDEwICsrKystLS0tLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfa21zLmMNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+IGluZGV4
IDcwZDhhZDA2NWJmYS4uNGM4ZmU4M2RkNjEwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+IEBAIC03MDUsNyArNzA1LDcg
QEAgc3RhdGljIGludCByY2FyX2R1X3ZzcHNfaW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UNCj4g
KnJjZHUpDQo+ID4gIAkJcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3MobnAs
IHZzcHNfcHJvcF9uYW1lLA0KPiA+ICAJCQkJCQkgICAgICAgY2VsbHMsIGksICZhcmdzKTsNCj4g
PiAgCQlpZiAocmV0IDwgMCkNCj4gPiAtCQkJZ290byBlcnJvcjsNCj4gPiArCQkJZ290byBkb25l
Ow0KPiA+DQo+ID4gIAkJLyoNCj4gPiAgCQkgKiBBZGQgdGhlIFZTUCB0byB0aGUgbGlzdCBvciB1
cGRhdGUgdGhlIGNvcnJlc3BvbmRpbmcNCj4gZXhpc3RpbmcgQEANCj4gPiAtNzQzLDEzICs3NDMs
MTEgQEAgc3RhdGljIGludCByY2FyX2R1X3ZzcHNfaW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UN
Cj4gKnJjZHUpDQo+ID4gIAkJdnNwLT5kZXYgPSByY2R1Ow0KPiA+DQo+ID4gIAkJcmV0ID0gcmNh
cl9kdV92c3BfaW5pdCh2c3AsIHZzcHNbaV0ubnAsIHZzcHNbaV0uY3J0Y3NfbWFzayk7DQo+ID4g
LQkJaWYgKHJldCA8IDApDQo+ID4gLQkJCWdvdG8gZXJyb3I7DQo+ID4gKwkJaWYgKHJldCkNCj4g
PiArCQkJZ290byBkb25lOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQlyZXR1cm4gMDsNCj4gPiAtDQo+
ID4gLWVycm9yOg0KPiA+ICtkb25lOg0KPiA+ICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
dnNwcyk7ICsraSkNCj4gPiAgCQlvZl9ub2RlX3B1dCh2c3BzW2ldLm5wKTsNCj4gPg0KPiANCj4g
LS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
