Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A5C572BF7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 05:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8C311268E;
	Wed, 13 Jul 2022 03:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725F311268E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 03:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0TcK8PbLL2OGKtm504C2nz40XvTVyW8SgOy6KpC0TL0WaM59CjsmEzD5v+v87MQHQ1lTK1hh0yJ2LFmxfU9wBQaPoqqLyNvDsAvwxg0Mnr9bdqj4VdQmLsOpfr+lscLipXNwSg8WpJA/lTcyeZLCAM8YqcMR81f6Ff6NmLGEgzwnU95QjDWb8KZMUeJsvrey6TBy3xxBsgC8bqLQPbOSjJDkTIbR+/ZZ9voAQPR5t/Nfuhr/dVvivusx2PPEela41BStbku4TuRgMVnepQ3YwacLb3I9vYeCzEBcmC8J/qwDxU8bPvPVlWDk8ChMi2uNPq4yPup1PMmZG1P7Tq4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spyJSz9r17XGtolfRwQYJnG64aNSvCY7hUieD5A7XaM=;
 b=LMre/CvAGMWMu1q9/YksOWySOZWOXk+qHrn1xYk4VjfOVWW8mIh/VUGaukHfJflUb4lHo0LyKuhDuacbEYtzZrpMWKWRHn7dW8SO1DGsHRQ0OkIyU+EWSOsQzsuwgO1yDjWPN9alfgjQREmR6hzwpbvKmHeHGFEipV+pVfIyz1cJvWH/6WwDyazbUFIal9+K+FlKxdUjqfAGljZ0PrRNyVN3bTkNneNVo6etRD5lIHwnTZrs+AJE5NrCwjLXEG8+nEJnVnyo8RdkOLdb2yYjYVwIC34w/cNXI9eR+n9DJXw1VoGymVB1A81+N1VmbNGCsfsttvx4sr7lJ0019nyDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spyJSz9r17XGtolfRwQYJnG64aNSvCY7hUieD5A7XaM=;
 b=uw4kTxkn1nHUTF4s+OR589LY2kvPgvMKuvZrctUKnFSpKIMBb64VQBxQwZUYrK61rutvXwytRs69jnF1oPQfS/D/kaU1Pg+iq7lNBmunqfb5tArwhx5ZLRV1IDzBWFdg7c1ay9Gf/Fs1ZgcAZuKvC035DJUVEPCbIHrw6J9xnUc=
Received: from MWHPR05MB3055.namprd05.prod.outlook.com (2603:10b6:300:b9::23)
 by SJ0PR05MB7277.namprd05.prod.outlook.com (2603:10b6:a03:283::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11; Wed, 13 Jul
 2022 03:35:58 +0000
Received: from MWHPR05MB3055.namprd05.prod.outlook.com
 ([fe80::b1e9:a04c:409e:faf9]) by MWHPR05MB3055.namprd05.prod.outlook.com
 ([fe80::b1e9:a04c:409e:faf9%8]) with mapi id 15.20.5438.011; Wed, 13 Jul 2022
 03:35:57 +0000
From: Zack Rusin <zackr@vmware.com>
To: "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
Thread-Topic: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
Thread-Index: AQHYlaAcd8dP2Bwi00as7BiZD+A/Za16XmYAgAFJrYA=
Date: Wed, 13 Jul 2022 03:35:57 +0000
Message-ID: <50fd57193508f33a1e559ef74599c9e52764850d.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-6-zack@kde.org> <20220712105600.4a8592c1@eldfell>
In-Reply-To: <20220712105600.4a8592c1@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 212efcce-0ae5-4b1a-db50-08da6480cca5
x-ms-traffictypediagnostic: SJ0PR05MB7277:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q6Og4tZaiEmPyzbkrwogbjaOc7esSnPpqxKvuvBJm4zOHWbhQU6EFtwJ/qYYduBhRod2KS63ji1JNDj72B4KsEj/CLfFmARNYsWPfq45qV8d56x/YGOzjlL4jqM69KwGIPXGY7odPEL4gg8uoH4CSWj3qSCV9zXPOipWmcX253Ixnl3o4Mche4HYAp5GyIKFZfoFI++EKMpk4yzzN20+3hYquZWPeopTe+mVItbrzC8Bx8yOnonbOk7/HwbIWezp52BCMjWxjdT7gDmcg/biAKxMEW+dhCYZnsYaSx1LJwNUprOwzkg8WOXfbBV6GGo0AUByKT0QoAOyWeUafOcfm8JATXMgL/pQB3Q6ryCxE1Wig6j5Zl8cweQcykrkAXNdwI0LLSyb0MlqFr/dWSUbgXCVwPnOb9neccDj9lQxEGQ2ALxoeKX4MbNn6dYk/U+7+0+AApRhU3dXIvAoP1qqMnxtbU3VyD4V2xUdZq5X4ruIncR05IbAMKBjZKliBxwBjA5+9J4GjjWVbywF7Bg2FuVcKKvu9uxHr/5wzYMBZy3odSFOZeazulq2xHI06671ffanJq56+OO2Lp+gXHXioKDF1TXK5GaKNB/Ov2vwZVlD/6kCX0/OYNo/t8DnXg24SvuBIFeKjAQmVQiUmN1r6XV0W1pF2LHVr5anDjz8eEGC9+OkFv3KMTBCM0I9abei7gKAJIl0YMtuP8Bgt/uiOo4rixhoZ+h+2sli8NnYBfei+hDYabCa30Utwft0rmyDu+W1fULTohYYcEA3ACm/NBd9tKYMdweHpiJB6jT+/JGvhKOTPZHAw1a4Rxv+9eVzjGQom7kabdTBLxSFsdhztF2d0XzeU3tTLTvBjmBMyq7gmZYMJv3tPWIQqZw1ClHr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3055.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(5660300002)(186003)(83380400001)(41300700001)(2616005)(6506007)(38100700002)(2906002)(26005)(4326008)(66946007)(8676002)(66476007)(86362001)(478600001)(6486002)(66556008)(76116006)(64756008)(71200400001)(36756003)(91956017)(6916009)(19627235002)(6512007)(54906003)(8936002)(66446008)(122000001)(316002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTlqVy82UUExcnIvdXBOQXZyVVZjWVNDWldEWURsb2paQk5UKzl1UEpldWtM?=
 =?utf-8?B?N2xXMGxXTkF1R0NKd21WUWpXY01MSTRYUHh2RDIwNTBEc3I4Uy8xb0p6VXEv?=
 =?utf-8?B?VHYyd01xUmNwSms0THlJV1N0WGQ3MDd2U29hM1ZuU1FnOWo2YXFMZ3VzVEZn?=
 =?utf-8?B?dHRYb3FQaDIzQmVKeHYveDZRUno4aEpXOXhSL2hFRnB2Y1pOQlNVTi90Ym9y?=
 =?utf-8?B?K2V4UkZBQkRKenVldEthZXBpMmJDZ2JCUHI2NnVKTndVOU9UNUwyaGZvaXho?=
 =?utf-8?B?UVRaMFg1Z0dUMkpoQjZFVzRKb3E3NWxLYnBMUUd0UWtydzMzTUdVN2dBQXNt?=
 =?utf-8?B?US82VG0zWVcvbHdQYW1ublFRcE9DSDNreERZdjhlY2FZWE01eExTWENXVzV2?=
 =?utf-8?B?WEVwbU9JRXg1Z2hsalU4MG9vcjVRZ28xWExXdEVuektwazU0SlZQWklGTkhQ?=
 =?utf-8?B?Q09ibmdCa3FxUXREZmZGTjdock1Da1pxTEVQMVhVRVZ1S0JWNy9IYTlwY1Bl?=
 =?utf-8?B?cmI5UUhac3QxK1dSbGFBM01qZUphdVQzT0pHU1gvY1BSem40NitURVlwN05o?=
 =?utf-8?B?cUVTSUlna0toZjlnU2J0S2U4Z010Ri9mNExYRVBhNjVZZlFHR1llekwzam5l?=
 =?utf-8?B?S3RPZUsvb29WSmh6c3NBZngzRDJOZmxxdGJhY1AzZmFyRWtqWEEwTURqVFlS?=
 =?utf-8?B?c0Fud2lHSjN4WGFISEgvR3BFOS94cnpTNktNSlNNZ0ovS1paNEJFbTl2aEtk?=
 =?utf-8?B?dlUzTURHNk9WQ3hFL25TM3FuK2FiQXJObktsZzMwVExJLzcxclphZmFyQ0xB?=
 =?utf-8?B?UFVBQzd2VGJWK1lZdzFUb0F6Uy9NVEtWeEs3Nkhsak1PMk5xczNmYWRrS3Zl?=
 =?utf-8?B?UzlMYjlFNjBHU1I3ZWtVNXpHOXBjeFVIT0thLzFZTHpraGd0aFpzUW5VNzZP?=
 =?utf-8?B?RHcvZW9JYnpsT01sTjhGcUVuOTV3anYwYU5vVXc3bEdnQ0J3T2l5MVFidDgv?=
 =?utf-8?B?aDAzVUI4K1VEcXYrRHZkeTFZcEI1S0g0elZTNmZsUkJVNElmVEhpeHpQNEhD?=
 =?utf-8?B?R2VDamV1ZEpVZnRBUEtmckJ4NTJrbk5sbVRVSVJBZk9HK3V5eExhOTJJeWhF?=
 =?utf-8?B?eW4xODJoQVZqeWxCQjBRU0pIR1B4aW55RUVuMVlYTVB6aG4rKzJQNno5NHVn?=
 =?utf-8?B?Y3NEaE81MERrTlF4S09rTkxkNW1sQ1VnUGs4NnRiNjRLcVBHZDByWDdLSkt2?=
 =?utf-8?B?N2lUS2k1eTdlSEhTZkxrN1FjbHVhd3RqQVYrUUxEZFlMb1ZKZ2J4R3VZdWxT?=
 =?utf-8?B?cGdNS1RxOGtNZEcrMjYwQldDaGlmQTRheWRpblp5RHdoR1FFTHZtQ0lHWWl2?=
 =?utf-8?B?NGZGOVdMOTVUb1Z2WkplandQK3VKRWJhL0FPMEI2WjBRMjF6VTJXOVQ5enha?=
 =?utf-8?B?TDlKU1RUejFiUS80amJza3g1SStVa2xoMVJiQjVydGlTeGE0NUJ1RUorOXdP?=
 =?utf-8?B?Wk9MSEljRVhqbGt3TC94aGFwRXhsQ3hkRzQ2ZkZyRHJNN2Zrb1JJdHFLeWg2?=
 =?utf-8?B?OUF0alZBbUxvTm43aThCR1Q3RXJtR0NrNTNVT2s0YXVxVXlBTmhrc05SY3ZI?=
 =?utf-8?B?OWcvRTVzb0FhdWthcEtFMFlOam55UWhsVFZqbzV5N0IrOXZ2RklmcTUzRWRz?=
 =?utf-8?B?VCtPNDNDcEcvcjVtVzhPREhFZitSemlXd1VReW9OTk50QmxtZ1ZnUTJFWmR0?=
 =?utf-8?B?bU9tazZ4UWhkUlhiN29NRTRFMXB2djhpRXlSanlRZndtYURVVCsxYkZvRVRE?=
 =?utf-8?B?ZGtDY09HVkkvY2dxalVLZm1lVGRQOERUL0YxYVZuUlhwdzc2dDhTaUdmcGto?=
 =?utf-8?B?OWFaRGpDMnRWOU1DZWJVTzVnSnRrZWdGQlBCNzlrS2JneUgrU29pMlFmTTBW?=
 =?utf-8?B?VllmYS9YdVFMZFN6VGNpS0hXVzAwZVA4OThDc01ya1VOeFpuU3lUZUhXUWtk?=
 =?utf-8?B?VTRVMGZScThEQlFoOVJ3UFpsbVFOak9Fa3lFaUxkeThkUHV6SzdDcFBhU1VJ?=
 =?utf-8?B?MmxZNWIyTmxVU1h4S3BPTENwdUVZYUR0NGRPcGdwVldjdysyN21qOEJ0am0y?=
 =?utf-8?Q?4c7kMVZYY17lpKFd//jY/9Ttn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33120F863D1DB64EA8257F97A37A28F0@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3055.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212efcce-0ae5-4b1a-db50-08da6480cca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 03:35:57.7734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EosyfV53aSfhGPvaqEVmw2EcRupZSD01ChjWE28io1WhcXsmA+7LBEnkBG+vcQsfGojNQMzFu4iQuH6JvlAdVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7277
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
Cc: Martin Krastev <krastevm@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA3LTEyIGF0IDEwOjU2ICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToN
Cj4gT24gTW9uLCAxMSBKdWwgMjAyMiAyMzozMjo0MyAtMDQwMA0KPiBaYWNrIFJ1c2luIDx6YWNr
QGtkZS5vcmc+IHdyb3RlOg0KPiANCj4gPiBGcm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUu
Y29tPg0KPiA+IA0KPiA+IEF0b21pYyBtb2Rlc2V0dGluZyBnb3Qgc3VwcG9ydCBmb3IgbW91c2Ug
aG90c3BvdHMgdmlhIHRoZSBob3RzcG90DQo+ID4gcHJvcGVydGllcy4gUG9ydCB0aGUgbGVnYWN5
IGttcyBob3RzcG90IGhhbmRsaW5nIHRvIHRoZSBuZXcgcHJvcGVydGllcw0KPiA+IG9uIGN1cnNv
ciBwbGFuZXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWmFjayBSdXNpbiA8emFja3JAdm13
YXJlLmNvbT4NCj4gPiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4g
PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPiA+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92Ym94
dmlkZW8vdmJveF9tb2RlLmMgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8v
dmJveF9tb2RlLmMNCj4gPiBpbmRleCBmYTBkNzNjZTA3YmMuLmNhMzEzNGFkYjEwNCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYw0KPiA+IEBAIC00MjksOCAr
NDI5LDggQEAgc3RhdGljIHZvaWQgdmJveF9jdXJzb3JfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJt
X3BsYW5lICpwbGFuZSwNCj4gPiAgCWZsYWdzID0gVkJPWF9NT1VTRV9QT0lOVEVSX1ZJU0lCTEUg
fCBWQk9YX01PVVNFX1BPSU5URVJfU0hBUEUgfA0KPiA+ICAJCVZCT1hfTU9VU0VfUE9JTlRFUl9B
TFBIQTsNCj4gPiAgCWhnc21pX3VwZGF0ZV9wb2ludGVyX3NoYXBlKHZib3gtPmd1ZXN0X3Bvb2ws
IGZsYWdzLA0KPiA+IC0JCQkJICAgbWluX3QodTMyLCBtYXgoZmItPmhvdF94LCAwKSwgd2lkdGgp
LA0KPiA+IC0JCQkJICAgbWluX3QodTMyLCBtYXgoZmItPmhvdF95LCAwKSwgaGVpZ2h0KSwNCj4g
PiArCQkJCSAgIG1pbl90KHUzMiwgbWF4KG5ld19zdGF0ZS0+aG90c3BvdF94LCAwKSwgd2lkdGgp
LA0KPiA+ICsJCQkJICAgbWluX3QodTMyLCBtYXgobmV3X3N0YXRlLT5ob3RzcG90X3ksIDApLCBo
ZWlnaHQpLA0KPiA+ICAJCQkJICAgd2lkdGgsIGhlaWdodCwgdmJveC0+Y3Vyc29yX2RhdGEsIGRh
dGFfc2l6ZSk7DQo+ID4gIA0KPiA+ICAJbXV0ZXhfdW5sb2NrKCZ2Ym94LT5od19tdXRleCk7DQo+
IA0KPiBIaSwNCj4gDQo+IHRoaXMgbG9va3MgbGlrZSBzaWxlbnQgY2xhbXBpbmcgb2YgdGhlIGhv
dHNwb3QgY29vcmRpbmF0ZXMuDQo+IA0KPiBTaG91bGQgdGhlIERSTSBjb3JlIHBlcmhhcHMgYWxy
ZWFkeSBlbnN1cmUgdGhhdCB0aGUgaG90c3BvdCBtdXN0IHJlc2lkZQ0KPiBpbnNpZGUgdGhlIHBs
YW5lIChmYikgYm91bmRhcmllcyBhbmQgcmVqZWN0IHRoZSBhdG9taWMgKFRFU1RfT05MWSkNCj4g
Y29tbWl0IHdoZW4gaXQncyBvdXRzaWRlPw0KPiANCj4gT3IgaWYgdGhpcyByZXN0cmljdGlvbiBp
cyBub3QgdW5pdmVyc2FsLCBtYXliZSB0aGlzIGRyaXZlciBzaG91bGQNCj4gcmVqZWN0IGludmFs
aWQgaG90c3BvdHMgcmF0aGVyIHRoYW4gc2lsZW50bHkgbWFuZ2xlIHRoZW0/DQoNClRCSCwgSSdt
IG5vdCByZWFsbHkgc3VyZSB3aHkgdmJveHZpZGVvIGlzIGNsYW1waW5nIHRob3NlIHZhbHVlcy4g
SSBkaWRuJ3Qgd2FudCB0bw0KaW50cm9kdWNlIGFueSByZWdyZXNzaW9ucyBieSBjaGFuZ2luZyBp
dCBoZXJlLCBidXQgdGhlIGhvdHNwb3QgY29kZSBuZXZlciBzcGVjaWZpZWQNCnRoYXQgdGhlIGhv
dHNwb3Qgb2Zmc2V0cyBoYXZlIHRvIGJlIHBvc2l0aXZlIG9yIGV2ZW4gd2l0aGluIHRoZSBwbGFu
ZS4gSW4gYSBxdWljaw0Kc2VhcmNoIEkgY291bGRuJ3QgZmluZCByZWFsIHdvcmxkIGN1cnNvcnMg
dGhhdCB3ZXJlIGRvaW5nIGFueXRoaW5nIGxpa2UgdGhhdCB0aG91Z2gNCnNvIEkganVzdCBsZWZ0
IGl0Lg0KDQo+IEFsc28sIGlmIHN1cHBvcnRzX3ZpcnR1YWxfY3Vyc29yX3BsYW5lIGlzIGZhbHNl
LCBzaG91bGQgdGhlcmUgbm90IGJlDQo+IHNvbWV3aGVyZSBjb2RlIHRoYXQgd2lsbCBpZ25vcmUg
dGhlIHZhbHVlcyBzZXQgdG8gdGhlIGF0b21pYyBob3RzcG90DQo+IHByb3BlcnRpZXM/DQoNCkht
bSwgZ29vZCBxdWVzdGlvbi4gSSdtIG5vdCBzdXJlIGlmIHRoZXJlJ3MgYSBjYXNlIHdoZXJlIHRo
YXQgY291bGQgYmUgcG9zc2libGU6DQp3aXRob3V0IHN1cHBvcnRzX3ZpcnR1YWxfY3Vyc29yIHdl
IGVpdGhlciB3b24ndCBoYXZlIGEgY3Vyc29yIHBsYW5lIG9yIHRoZSBjbGllbnQNCndvbid0IGJl
IGF0b21pYyBhbmQgd2lsbCBvbmx5IGJlIGFsbG93ZWQgdG8gdXNlIHRoZSBvbGQgbGVnYWN5IGtt
cyBpb2N0bCdzLCBpLmUuDQpkcm1Nb2RlU2V0Q3Vyc29yMi4NCg0KPiBXaGVuIG9uZSBLTVMgY2xp
ZW50IHN3aXRjaGVzIHRvIGFub3RoZXIsIHRoZSBmaXJzdCBvbmUgYmVpbmcgaG90c3BvdA0KPiBh
d2FyZSBhbmQgdGhlIGxhdHRlciBub3QsIGFuZCBib3RoIGF0b21pYywgdGhlbiB0aGUgbGF0dGVy
IEtNUyBjbGllbnQNCj4gd2hvIGRvZXNuJ3Qga25vdyB0byBkcml2ZSB0aGUgaG90c3BvdCB3aWxs
IGluaGVyaXQgcG90ZW50aWFsbHkgaW52YWxpZA0KPiBob3RzcG90IGZyb20gdGhlIHByZXZpb3Vz
IEtNUyBjbGllbnQuIERvZXMgc29tZXRoaW5nIHByZXZlbnQgdGhhdCBmcm9tDQo+IGJlaW5nIGEg
cHJvYmxlbT8NCg0KVGhhdCBzd2l0Y2ggd2lsbCByZXN1bHQgaW4gcGxhbmUgc3RhdGUgcmVzZXQs
IGVuZGluZyBpbg0KX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9zdGF0ZV9yZXNldCB3aGljaCB3
aWxsIHJlc2V0IGJvdGggaG90c3BvdCBwcm9wZXJ0aWVzIChzZXQNCnRoZW0gdG8gMCkuDQoNCj4g
VGhlIG9sZCBLTVMgY2xpZW50IG1heSBoYXZlIGxlZnQgdGhlIHZpcnR1YWwgY3Vyc29yIHBsYW5l
IHZpc2libGUsIGFuZA0KPiB0aGUgbmV3IEtNUyBjbGllbnQgZG9lc24ndCBldmVuIGtub3cgdGhl
IHZpcnR1YWwgY3Vyc29yIHBsYW5lIGV4aXN0cw0KPiBiZWNhdXNlIGl0IGRvZXNuJ3Qgc2V0IHRo
ZSBEUk0gY2xpZW50IGNhcC4gU29tZXRoaW5nIHNob3VsZCBwcm9iYWJseQ0KPiBlbnN1cmUgdGhl
IHZpcnR1YWwgY3Vyc29yIHBsYW5lIGdldHMgZGlzYWJsZWQsIHJpZ2h0Pw0KDQpIYWgsIHRoYXQn
cyBhbHNvIGEgZ29vZCBxdWVzdGlvbi4gSSAqdGhpbmsqIHRoZSBzYW1lIGNvZGUgdG8gYWJvdmUg
d291bGQgYmUgcmFuLA0KaS5lLiBwbGFuZSByZXNldCB3aGljaCBzaG91bGQgcmVzdWx0IGluIHRo
ZSBwbGFuZSBkaXNhcHBlYXJpbmcgYW5kIHRoZSBuZXcgY2xpZW50DQpub3QgYmVpbmcgYWJsZSB0
byBkcml2ZSBpdCBhbnltb3JlLiBBdCBsZWFzdCB3aGVuIHJ1bm5pbmcgZ25vbWUtc2hlbGwsIHN3
aXRjaGluZyB0bw0Kd2VzdG9uIGFuZCB0aGVuIHN3aXRjaGluZyB0byBnbm9tZS1zaGVsbCB0aGlu
Z3MgbG9vayBvaywgYnV0IEkgaGF2ZW4ndCB0cmllZCBydW5uaW5nDQpzdWNoIGNsaWVudHMgYXQg
dGhlIHNhbWUgdGltZS4NCg0KeiANCg0K
