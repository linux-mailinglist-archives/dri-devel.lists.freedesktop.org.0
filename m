Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E28B59C17C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FA02BE8D;
	Mon, 22 Aug 2022 14:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF338BB60
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:16:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaJGx3nNEWwolSuWE/Ljk+xBsR5OfvV6UpBZwRPLd4dq9yKuJwJan4GhkyCyWIWZFVStqw/VwtHQjZroibQ1vj3ORcx6fow7puEQ3X5T4EzrQM7jMowzflTeNgV2sOr+uqmI+sNFjhpJ3gJ2IJIM0/IYw6g0NsJUN3MED+G0QHFMFGwoaR+4gOLyh1HgggFAu3O/L7InDcSTEkoNVea/mw+1OhVy3I+P/mZlQu6bYE2gCK1gn5VAaE01RVIygQ+nCuRm8PSaAx7YMU0voOZdbnaJLzkAI8KecTJCKIwXKrbTq5WBAt0OXeyw0HaMBI1bs6jK1yD+EcrLiOI8msFLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJLUElvaLyV1WPmfkADiYzeUtJiZTa5sl+wYlsqNcMw=;
 b=oJUylj5GhvtqbwYhcbpBAYPNleNTNm+6WMTkjOpUPZrbPIpjOgclMygUZdzXbFK99E0lUY9VR85McyHwuz43cMb1FTICKt/S3A9QVcn2mU8xYHkFOSUJvrrC1QyUihAwrqZXju8g7D92Hhy7waexraGVO6JFFVUB0gfVYiEXco8YozFYfUvP4yANmM1zImOKnTtYh+qpD+GrAO7iB4n4FsX2NofjYliJfVXG9MCONpQVGO+SBx1S6kOV9oJ8Xan7Y+L1HUA2RvJLRltszV+rpR6dACveMuxxYPtImnS23Ae5pQwK8/HszY4ixSVd7+vwOSCv5b4dedwHU0camRwUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJLUElvaLyV1WPmfkADiYzeUtJiZTa5sl+wYlsqNcMw=;
 b=GlWGUAopX/e/pLZvhqoBl7vz2dYRKQfAtYhj0LbWZt93+y0x750kAAPKXrXThnmPl0y54cfKGKeBHAyEZ52O3AGYNlkXoIYWSODk0EtQP1i2TREIZH/FBe31xTO1bQo0R74s4qkKyjWVHzRLZpE34jxx+76jc7pf/QMGTyj8ldQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2898.jpnprd01.prod.outlook.com (2603:1096:603:3e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 14:16:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5546.023; Mon, 22 Aug 2022
 14:16:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Thread-Topic: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Thread-Index: AQHYtigCmDMb7ZOlxE2fJo+Yvz7sB6266IdggAAKWICAAAMqQA==
Date: Mon, 22 Aug 2022 14:16:08 +0000
Message-ID: <OS0PR01MB5922D6D9A9AB4B7EB1561AE086719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
 <OS0PR01MB5922058F5712CA3367AFEAE186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <058337c0-ff8b-0cb4-b6eb-192e78cbeda3@ideasonboard.com>
In-Reply-To: <058337c0-ff8b-0cb4-b6eb-192e78cbeda3@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a9e0e0c-bb4a-4d0a-107c-08da8448dba0
x-ms-traffictypediagnostic: OSAPR01MB2898:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w4DDjPl+TxEordNfnryiGzAsAeAj3wAwNxK8j87xM2WvY1TQYzstLviOVUu4Nl6nupDYj3yFilniPEyQrDY0tJUcN5ng1kDDh8xtNzpBAh4z9yDVgK/Hq7xX/rmYkFO5qsgcQ0ElaSYmR9PF1YRiAZwdcMclOj5B5GWuTAWhvG9huLxz1M8SmYoCAupfZjTxAJ//FPLhETLE+jtHFck7i8hXubn0acd9REQ5qJytmTi+oHC1TBm8HL9jXO22/fz02+A+4x8O67NHiQb6a6VNMN5B/67swbb+HtR6RnEOmWLFErQLPoRegFdfUGwK8CQYMzv+JccECIinvcLcuzSVjcdPmJGMHL8u9ma4KbMFL7JeZkdbMy/pRaahsXqnz7BEPK0+BxehT7Ujr5I/IYCZg6ZmgllxI/0VK+ks6bS79yJpAMOC9alR60pGNI4smOAz9y9lwtXQ7RdfggcjLnHvYli24X5pPlC5Uly6nXaDzgAbIXMg4j0zABKfDUmQuOsZddqXb2zxZBW1HqDnV/yIT7Ghe7zm9W62o/PUJKLu+ewscIRl0g8woGctuXVNyKdPUAX9lTFNB3iRvjrJ5JH2P1ef2dUntQBQnHxxLCV5o7yBJYBxiDvRium9qO/l77EE19YEB9n0FlhAyKQFkD2BY4nXLpF9VF6ow89nnbL7Sc4XnUJ3Rt6dEc4czCAO21IFqQ16yLti/UZ849R5mcubg/8GCAGn4tOx3HtmukkDZ/2e9YnTAKOhrZY9cJc1swdlyZTGLC5LyQ9UB63wdMI9OA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(86362001)(83380400001)(122000001)(38070700005)(38100700002)(316002)(110136005)(6506007)(8936002)(66556008)(5660300002)(52536014)(76116006)(66946007)(66476007)(66446008)(64756008)(2906002)(4326008)(8676002)(186003)(55016003)(478600001)(41300700001)(71200400001)(7696005)(53546011)(33656002)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzRRclg4U0R0TFBUcmtDOGd0NjdlZnBTUnZweXVISHFtQ0hGUGF1QmE0eHpC?=
 =?utf-8?B?Ynd4cEJvVjVPTU1qRlNFTUxYcXY1UENjaC9iOVBSNklzRnZscGtZRGs5VmVE?=
 =?utf-8?B?Sk4zQzloWUpWcnRiUkZvdnNzdW5EWE0wdW1Dcy9mNDlGdnd3ZTVHczFVRmU3?=
 =?utf-8?B?RTNOc3Q0M2F1Zjl5ckptREJGRXEwdUd4NTRNYW1vVHg0blFFUnJDclgyUHNE?=
 =?utf-8?B?ZzE4RGtUWXdvdTV1OHJUWDZQZ0JsUzQ1S1VVQVZGRWsreUlVQXZWWGtKZHk2?=
 =?utf-8?B?V1NpSDhzeEs3N1VoeDZhOU50MndRWVh2bGoxWE8zak8yVmpPajZkRmIxc29G?=
 =?utf-8?B?VXFKSjBUemhUQm9OTTJrVFphSm5UV2g4Tmtaa0J4RkhLQjhIRURid0pBK0hQ?=
 =?utf-8?B?aDkwbUh0VFNjTzNYSmhHcW5hU2hvbGlkZGNBcjJ1QUVlbFUrK20rejBkRU5V?=
 =?utf-8?B?RTNsQVpUSnZFcWpSZXdISGdaNSt3ZXNPbFh0aEtKT1NtVzZWc1UwZDhsK0lH?=
 =?utf-8?B?Z3djd3BzSmlEend2c0J5aEFIWU1MaVkzYkVWK09kM2d3OGZwZmI1SFR6SnYz?=
 =?utf-8?B?TEVPQ0tmdDNGVElucFA3bDUvcnJ1NEFBNlVHY2Fpd0dDN2JCMWFNQ012eXU0?=
 =?utf-8?B?U3M4eGFKc3h3VHJRS0VVb0Q0UnBtLzROeTJuR3hGSDZVeDlJTFo5b3FXYkdh?=
 =?utf-8?B?R0ZmcG5tTFJKSHBxMk9ZSktPamoraXVTWjlJQzBlWWYzd2tCTkRrVTJieWFw?=
 =?utf-8?B?cWN4emFNbEl1TkhxOURxTjlTLzFZWm0ya0wySnBmdmRtbzRsVXpDSkpIZ2I2?=
 =?utf-8?B?WkloNXpXbFpjOXhyVDdWS2daYTRRbFZncmdJQjF6UU05UjhacXhGWlZ1cVVG?=
 =?utf-8?B?eEYwazNjb3lrRTBITjZESFdLSXM5Tyt5azcwZWxTM0ZadTAxNGVtcGVhVUt3?=
 =?utf-8?B?STF2UG9aRk8vbUx2MG9PaFU1QkN6amRWNWF3YXlIWUg2UnB3NHhQMWtnMVpv?=
 =?utf-8?B?Zy8rS2ZUb3Y0aFBYV0J5T2NYUGJySUR4dWp5UEtIQjl0OCtpZ0c3N2hrQTJW?=
 =?utf-8?B?VkQwSEh6Mk9rbmFJMHN0YVdwd1htaXFKYjY3WnUyMXV3YnE0Uno4bW1BcTBH?=
 =?utf-8?B?UUx4dXp3WDZNWVFxZ24xbGFtY0hZcnFpdXdLWFoyUE5OQ0tLVnNrOGNuMzgv?=
 =?utf-8?B?Z1RQVGR1K3g4WmpObVllaXNmcFZ3SEFySGtNdE5PeVlkYUxFSExtZEMyNTBX?=
 =?utf-8?B?dFl6aXlqZ2xYcXE4aWttU1VYaTkyWE9zd3J2ZjJhY3RFbUc1SitNWW05aC9a?=
 =?utf-8?B?VnVNdldUT2VZOWZHa3RkMG02YnpERkF0ZzYvWE5QOHY0dEQ1UTVUZmNtQW5E?=
 =?utf-8?B?bWkvdnNmalZ3aUZUOEpVNW1ZaHRrcVlrc0lqU3haUEMzNXJnbTBQbXhUczhl?=
 =?utf-8?B?cjVKODRFTU9mVUFSdDhIZkxEQzJxVTlMRkJER25wYmdMTTF5RnFRUzFCOW0x?=
 =?utf-8?B?a2MwQVlReTNINDVKdm1jQjNlM2pKTzNQRlhiNUl4VmhZZUVxalYwOHZwdWdV?=
 =?utf-8?B?N2IycGt1ZmFEMlR3Wmw5a3dZb3ZMVWUrMGhFWDhhMmR3ZWxlbWJPVnQxNVZt?=
 =?utf-8?B?MGxuQ3JuK2ZoV2tTYlVQbVVreC9RY0R5NlJ2VWkyR1ZZaW9pbFAvQnMycEcw?=
 =?utf-8?B?R2h1MU95ZVMwOFNvSDR4NFpndnBKb3YzQmUrNThRZjVwV3NoRWdzd3BXYlU3?=
 =?utf-8?B?WktGaEp5TDlCQXBTa2krRWs0ZWxHc2pWdThDa0dkMjRwMVdYak5JZ0ZVZVFl?=
 =?utf-8?B?ZEk0RXA5d2JCNm5IbEdDUEMrNUZ4M0t2SXNaUDA5My90aXV5cXh5amRBS2l0?=
 =?utf-8?B?aXdyTlpGOEJyd0VKa2t4NGY0eHlyL2lFVU9NQ1ZTNkVGdDBockVDMWtEdFdy?=
 =?utf-8?B?T2gxV3l5dG4yS2djbGN3VHNja2R2dDVSTzA4b3BwMkZKbndJM2ZWVGVvdXlK?=
 =?utf-8?B?LzZOK21qRmlmTE1DK0UzekJDckVnN3h2ZjRlaDdFTlJDNFBTV1JEQnZMbzE2?=
 =?utf-8?B?aUhaZG1FN0pOSmExNDRzd1VMVjZMTStJRlFMcHR5Q0IyMURrRjRRUGNCMGlN?=
 =?utf-8?B?SWhNOFBQeXFpc0JTMG5jajA1UHlyZGVaZzV0bW5MZ25GMm15ZGZ1NjU1U2pN?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9e0e0c-bb4a-4d0a-107c-08da8448dba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 14:16:08.2933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PmgFDoxhR7mjcE8y1aPboCptJ3ezMvusFnJ3ab7IHP+IRC4odaJvtl9aqsFormllsRWwmFbNuIkkFP9p0eNJsgk75N2NluaLHkHoGTXGDgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2898
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzRdIGRybTogcmNhci1kdTogZHNpOiBQ
cm9wZXJseSBzdG9wIHZpZGVvIG1vZGUNCj4gVFgNCj4gDQo+IEhpLA0KPiANCj4gT24gMjIvMDgv
MjAyMiAxNjoyNSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgVG9taSwNCj4gPg0KPiA+IFRoYW5r
cyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MiAxLzRdIGRybTog
cmNhci1kdTogZHNpOiBQcm9wZXJseSBzdG9wIHZpZGVvIG1vZGUNCj4gPj4gVFgNCj4gPj4NCj4g
Pj4gRnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuK3JlbmVzYXNAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gPj4NCj4gPj4gVGhlIGRyaXZlciBkb2VzIG5vdCBleHBsaWNpdGx5IHN0b3Ag
dGhlIHZpZGVvIG1vZGUgdHJhbnNtaXNzaW9uIHdoZW4NCj4gPj4gZGlzYWJsaW5nIHRoZSBvdXRw
dXQuIFdoaWxlIHRoaXMgZG9lc24ndCBzZWVtIHRvIGJlIGNhdXNpbmcgYW55DQo+ID4+IGlzc3Vl
cywgbGV0cyBmb2xsb3cgdGhlIHN0ZXBzIGRlc2NyaWJlZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBh
bmQgYWRkDQo+ID4+IGENCj4gPj4gcmNhcl9taXBpX2RzaV9zdG9wX3ZpZGVvKCkgd2hpY2ggc3Rv
cCB0aGUgdmlkZW8gbW9kZSB0cmFuc21pc3Npb24uDQo+ID4+IFRoaXMgZnVuY3Rpb24gd2lsbCBh
bHNvIGJlIHVzZWQgaW4gbGF0ZXIgcGF0Y2hlcyB0byBzdG9wIHRoZSB2aWRlbw0KPiA+PiB0cmFu
c21pc3Npb24gZXZlbiBpZiB0aGUgRFNJIElQIGlzIG5vdCBzaHV0IGRvd24uDQo+ID4+DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuDQo+ID4+IDx0b21pLnZhbGtlaW5lbityZW5l
c2FzQGlkZWFzb25ib2FyZC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfbWlwaV9kc2kuYyB8IDI5DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9taXBpX2RzaS5jDQo+ID4+IGIv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9taXBpX2RzaS5jDQo+ID4+IGluZGV4IDYyZjdl
Yjg0YWIwMS4uN2YyYmU0OTBmY2Y4IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX21pcGlfZHNpLmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9taXBpX2RzaS5jDQo+ID4+IEBAIC01NDIsNiArNTQyLDM0IEBAIHN0YXRpYyBpbnQg
cmNhcl9taXBpX2RzaV9zdGFydF92aWRlbyhzdHJ1Y3QNCj4gPj4gcmNhcl9taXBpX2RzaSAqZHNp
KQ0KPiA+PiAgIAlyZXR1cm4gMDsNCj4gPj4gICB9DQo+ID4+DQo+ID4+ICtzdGF0aWMgdm9pZCBy
Y2FyX21pcGlfZHNpX3N0b3BfdmlkZW8oc3RydWN0IHJjYXJfbWlwaV9kc2kgKmRzaSkgew0KPiA+
PiArCXUzMiBzdGF0dXM7DQo+ID4+ICsJaW50IHJldDsNCj4gPj4gKw0KPiA+PiArCS8qIERpc2Fi
bGUgdHJhbnNtaXNzaW9uIGluIHZpZGVvIG1vZGUuICovDQo+ID4+ICsJcmNhcl9taXBpX2RzaV9j
bHIoZHNpLCBUWFZNQ1IsIFRYVk1DUl9FTl9WSURFTyk7DQo+ID4+ICsNCj4gPj4gKwlyZXQgPSBy
ZWFkX3BvbGxfdGltZW91dChyY2FyX21pcGlfZHNpX3JlYWQsIHN0YXR1cywNCj4gPj4gKwkJCQkh
KHN0YXR1cyAmIFRYVk1TUl9BQ1QpLA0KPiA+PiArCQkJCTIwMDAsIDEwMDAwMCwgZmFsc2UsIGRz
aSwgVFhWTVNSKTsNCj4gPj4gKwlpZiAocmV0IDwgMCkgew0KPiA+PiArCQlkZXZfZXJyKGRzaS0+
ZGV2LCAiRmFpbGVkIHRvIGRpc2FibGUgdmlkZW8gdHJhbnNtaXNzaW9uXG4iKTsNCj4gPj4gKwkJ
cmV0dXJuOw0KPiA+PiArCX0NCj4gPj4gKw0KPiA+PiArCS8qIEFzc2VydCB2aWRlbyBGSUZPIGNs
ZWFyLiAqLw0KPiA+PiArCXJjYXJfbWlwaV9kc2lfc2V0KGRzaSwgVFhWTUNSLCBUWFZNQ1JfVkZD
TFIpOw0KPiA+PiArDQo+ID4+ICsJcmV0ID0gcmVhZF9wb2xsX3RpbWVvdXQocmNhcl9taXBpX2Rz
aV9yZWFkLCBzdGF0dXMsDQo+ID4+ICsJCQkJIShzdGF0dXMgJiBUWFZNU1JfVkZSRFkpLA0KPiA+
PiArCQkJCTIwMDAsIDEwMDAwMCwgZmFsc2UsIGRzaSwgVFhWTVNSKTsNCj4gPj4gKwlpZiAocmV0
IDwgMCkgew0KPiA+PiArCQlkZXZfZXJyKGRzaS0+ZGV2LCAiRmFpbGVkIHRvIGFzc2VydCB2aWRl
byBGSUZPIGNsZWFyXG4iKTsNCj4gPj4gKwkJcmV0dXJuOw0KPiA+DQo+ID4gVGhpcyByZXR1cm4g
aXMgbm90IHJlcXVpcmVkLg0KPiANCj4gVGhhdCBpcyB0cnVlLCBidXQgSSdkIHBlcnNvbmFsbHkg
cmF0aGVyIGtlZXAgaXQgdGhlcmUuIElmIHRoZSByZXR1cm4gaXMNCj4gcmVtb3ZlZCwgSSBjYW4g
aW1hZ2luZSBob3cgZWFzaWx5IG9uZSBjb3VsZCBhZGQgYSBuZXcgcGllY2Ugb2YgY29kZSBpbg0K
PiB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbiwgbm90IHJlYWxpemluZyB0aGF0IG9uZSBhbHNvIG5l
ZWRzIHRvIGFkZCBhDQo+IHJldHVybiAodGhlIG9uZSBhYm92ZSkgc28gdGhhdCB0aGUgY29kZSB3
b3JrcyBjb3JyZWN0bHkuDQo+IA0KPiBJdCBqdXN0IGZlZWxzIGEgYml0IHNhZmVyIHRoaXMgd2F5
Lg0KDQpPSywgSSBqdXN0IHRob3VnaHQgb2YgcmVkdWNpbmcgbnVtYmVyIG9mIGxpbmVzIGFuZCBy
ZW1vdmUgdW53YW50ZWQgY29kZQ0KQXMgcmV0dXJuIHR5cGUgaXMgdm9pZC4NCg0KaWYgKHJldCA8
IDApDQogIGRldl9lcnIoZHNpLT5kZXYsICJGYWlsZWQgdG8gYXNzZXJ0IHZpZGVvIEZJRk8gY2xl
YXJcbiIpOw0KDQpBbnkgd2F5IHRoZXJlIGlzIGEgcmV2aWV3IHByb2Nlc3Mgd2hpY2ggd2lsbCBj
YXB0dXJlIHRoZSBpc3N1ZSB5b3UgbWVudGlvbmVkLg0KDQpJIGFtIG9rIHdpdGggeW91ciBzdGF0
ZW1lbnQuDQoNCkNoZWVycywNCkJpanUNCg==
