Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A5D4F8161
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 16:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B436A10E087;
	Thu,  7 Apr 2022 14:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6968410E087
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 14:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHr/j7AJ41MWMfg52Pc7eFdOfzg++3oMKbpIRzu2SjESk9JarRhW76vsoZbkMjQE6z53Tk7CDIm6rieorQSeDgQ/tg8B4B0OIrswbWR+fuqQfqTN7M17cyIXK27lvX6w21f00MQtKdGWakoFcRs1V2mX0adt7j28SfkjocLwdLkiYAXt8EZ/YAiTlV5mbR7zgUK0P/0+6DZMmuqpeUEiAfAVVn2RgDfEOQdVKhXFzm/m/YGZgd+ILRTYCWbqqtCWBijeSPVl538gqxhGP9Chsct7T4ZR+uABmUtsjOctbhpn3CfCM5CULPnYzpICNAWEOqr3MnY7cw3CcnX0oOLw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7Mi1u7rVcHVK8/mr315BKaSq/JpAxJtE926iT+LLnY=;
 b=fGe5radFJBeEBEsHjAa2IIhwPCp0BCe1MAVCB2sWNziD/ilykZQIQYclUfW8k4SsdDnyl0yoU/8f/B0AqUcJAL79GMj7i8Ei+GfrXLMU+5FL+EYQ64WMpAVXl6+rs4qBCmexEMk0LXIO1FV0LAq3SqvUoVdT3mO6FcgF4gDonFF/YGbit0yZd7QOg/HouWO3mFjQNYGpHBE03HsuODhZuOhruuH0dZjWLkjhi/KvPYOqVE3AGsOBzwnj7485tKXHlaG+yx2v4mUkuiatVVAkaHkQQmNQDQzbgnBYD+0CXBb/++unxkZsCIp/1rrOaHiGW708zYKiwSrzwiccJYgdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7Mi1u7rVcHVK8/mr315BKaSq/JpAxJtE926iT+LLnY=;
 b=VoqU2OAvIugp+m4E8Cm0iVm5Owl6F/iZUSyJhrm8zf6bLpy+xA6ZA2p58z8i+cl5sUP2JtejcMQRhB8eAMrTogdt3RcI/Hj9SlvoZIfgv3BNIC9kGXD1qGDakXalS9uc9vSRA+PU595QVgTjprLj5OttLKBMukmgt3rmjnSYhxI=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by PH0PR05MB8688.namprd05.prod.outlook.com (2603:10b6:510:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.16; Thu, 7 Apr
 2022 14:15:52 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c%3]) with mapi id 15.20.5164.007; Thu, 7 Apr 2022
 14:15:52 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH 1/5] drm/ttm: Add common debugfs code for resource managers
Thread-Topic: [PATCH 1/5] drm/ttm: Add common debugfs code for resource
 managers
Thread-Index: AQHYSitMNASMrgzWgU+iBwK0M3TL+Kzj9ZWAgACKDIA=
Date: Thu, 7 Apr 2022 14:15:52 +0000
Message-ID: <ba7ade96600cf480e929f58f30ea4cf964b94e4e.camel@vmware.com>
References: <20220407025652.146426-1-zack@kde.org>
 <20220407025652.146426-2-zack@kde.org>
 <b84b40b8-fa7f-efa3-5c5e-2596d80bb94c@amd.com>
In-Reply-To: <b84b40b8-fa7f-efa3-5c5e-2596d80bb94c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0baaf08f-5f77-43b7-3e7e-08da18a11f7d
x-ms-traffictypediagnostic: PH0PR05MB8688:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <PH0PR05MB86881ABFEF92EADB652377CFCEE69@PH0PR05MB8688.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWjiWwVD8NWHk4VtVrrjSKXe8e8/lQxNXBzG4RcesmLrF2KlYZH1AxiRyOamzpeQ8DKd2xyrM8TVEKPgIZrewZeih2hPauNpLUGTZFv7VkCtm8ad/SKRKBCsKtaWf2wt2EFILAJ1dCkKOp5czjV2yz25/2jix/y0IcGP5amJtGS6sWPRlm69pmV6Z5u3O8RCOXRnOzmMFSZh7hmu685xrWBugrrTTWy4/fLTyzg/oIHJAlqc7hUSw7X1NJ0U0GqmaPgn0oKz95DmA0TlpTWurMl5eg019u6llRTFuj0T3x548q07/u8eSGuVcjUnwq2Xfm+AIRA/0hj3rSLTZEKFwSr3XSGVVbs2ygEW20508afqzVN1bf6TcxzZlaMlYCToWjykdX7+29cl9MGCuKzmUfBRVX4sHWueXdLZnS/1nCDjtOFXvn4TYFhtz31HXQGtrac3g7ue+7CAjHzs8rF0CKYHG6ad6HdEgofjzBmhr6GGRTp1dOqQwZXkFWYzXH2vykdmugoo9mdmr7sA+HCDmyyYT/97qgxoRt6i6Bfr7tvzAjbxaAzQgKRiQXAghani7jgmk6X/1lUxguTH53K1NYtbOTRyOQK18JY676Xv+RjeIX06GrWazl0dbSr1JQ0pt/7ZhT5Z8nnY91V8/Rl7q5CubWpSjKJqI+2oYWQWMd5XbEdBijV7xVwRkdKGiOSpG4sIrYkOhciaj8CBLeVrPKdhDyAkbE1y5A3u6gS7LjHPAtTpIIzQsWF/HRZChiWK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6512007)(6506007)(186003)(26005)(66574015)(71200400001)(83380400001)(38070700005)(2616005)(122000001)(38100700002)(6486002)(508600001)(5660300002)(66446008)(64756008)(8676002)(4326008)(91956017)(8936002)(54906003)(76116006)(66556008)(316002)(66946007)(66476007)(110136005)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXpjdE1WbFlsRXdFdTVFR2FsdHcvaVNiNFdnWlNVWnJ1TEFqWVM1cHppSXZz?=
 =?utf-8?B?SjgxSmgwMks4MUJTVmRiYjBPTnFwUGZhWjYzZ3h0V1JJKzcxSjBwcTc5dlhq?=
 =?utf-8?B?UnREVXJaT3Q5M0Z3Qi9JdFpCZ3FHaTFraFZDaXJWcGNZVytaMlQvNkNOOVVt?=
 =?utf-8?B?bmxJWDR0RXdieTRGcjZaZ1RGK283ZEtDTUEweWI4N1F6NC9KekI0T0V4MkVz?=
 =?utf-8?B?ZU5yTWxUcjRvRklvamg4TlhMUGcrNm5tUGkzZk9MWXpjNzRyMk8xU3hGRTFp?=
 =?utf-8?B?aUR2SlRXR2ljV3lzWWRic1VYVmcvbVRhcWxtRHNuejMyS01pejM0bXFYa0ps?=
 =?utf-8?B?RTBhUzhFSFNRM2dzdURZTDhpdTFIM2NhSVpXS3JYNXl2QzdmcWswcGk1N0Ew?=
 =?utf-8?B?MnNZbVRKSEorMlAxOEY0aitobnVCcm1WUHlUaEdqWWJnb2M0b1A3dXR1c1Mx?=
 =?utf-8?B?OEJURHlMc2JJRFAxWlpweldZMzhWeE9QVElrZUw3Q0t4eGJaVnFEbU4ySXhG?=
 =?utf-8?B?Sk1xREhueTdaMytLa3V0SlVGN25JSTRXVzRqRHdiVW41UExwb1NvSVozeUU5?=
 =?utf-8?B?M0tqeUdJeFJ5aGNWRkoxUGRUSmV0eFRwc0NHWUxjTTlxYjVlUzRYR29xWXBv?=
 =?utf-8?B?cUpUWUYvSlpMSHNJVFVlenVZcmcxWEZqTXZmRjhvNkNZNURtNFNnL2dub1M1?=
 =?utf-8?B?K0d4QXczOEdLeEQ0cGI1TTY2Q0hpSGgwaHp1emIvT1ZleXBJNWpabEFWUnBR?=
 =?utf-8?B?Tm94MjZIdlNyV2d2QXlRQks4K3BDb3dic0ZrcUg3Z1V3c2xCb1BKWXk3T0lO?=
 =?utf-8?B?NldQaHIxek1odGlEZXU4UTI0YlVWYnVWcDg0NkdZNUZnVDNSV0NJRG1wRXNF?=
 =?utf-8?B?S2RCdjVwQ0VRWDRTZ3RSZlRvdUJkcXJLdEFtdEc0Q3FqWkJ0SkVheG4zbG50?=
 =?utf-8?B?YnFnYmZySlFIbDRoNDUzMnZMMHdCZHRKYmd5NmJreVplTEN6ZWFVclUwQUxL?=
 =?utf-8?B?bFR1eXpMMlg2aHQ1dzlkNUp5Nmh0OWoxbVVtbzd3WUpPSWVkYkx5d1pHNXFV?=
 =?utf-8?B?cmhXMm9BeDc5NTFaNkMvWjlOUXJjNjU0VjRGNnJDaW1kTFJDU3A1bG1mcDZN?=
 =?utf-8?B?eGg4QVV0R3l1ZjBXRHlKUHJURW93K1lIRitFNHl5R3pjNGlSVjREaFBZaTls?=
 =?utf-8?B?aVZEMlQ4Q0ZwSmNDUHE2WlFtNlZ1bzRvcE54SDVocklqYnRXbmhHRkhDYWk1?=
 =?utf-8?B?R1hyV3BMN3gyWHFHRGp5eG9IUkZCSHhlWG1ydzdDVXRJTEZrMW1WZnA2RlFp?=
 =?utf-8?B?WjlRNG8wOEQzWTBRbzU0Z2lvQ0xwZFhoZFRhOHhNY2VnQXYxcVdOd0RvRUdt?=
 =?utf-8?B?ZXIrZ0xnN2JzeUxQOVQ4QklGT1Q3VGFiTS8wWC82eHlwZG5VY2JLc0ZDa2xO?=
 =?utf-8?B?bzhTYmNWL2tpMEFjOU5rOHlic1V2OFgrNjlDcFdDbmZISlRRdFRjQVVXenJY?=
 =?utf-8?B?MUZvSVBRRzQrSEszVTNTbmZXOWZZa3Buc1ZSd0xQQms5dEY1TndrbjJqbjJG?=
 =?utf-8?B?TWpCYStwdzlRZFZTaWxEUmVqYmMreklUZFF0c252R1NWT0x2bVZrTkEzYWs1?=
 =?utf-8?B?NWpvUTJqMlJzNk01cjRFc2YvSHZUQS90K0JKRHp5QTNVU3RyejlXMFFxMnZN?=
 =?utf-8?B?OWdhMFNyeGpjc1NyQ2Fhb0pQU1dxWXVLSkVQbDhQWUt2OFBXZlA0S29Xem9L?=
 =?utf-8?B?NVpacDZHOUxZWmQ2emZaeXJ1Q0diV29jdXA2SVU0eG0zU3poSFB3QjljRUFq?=
 =?utf-8?B?TjQ3ZVRhdW5wK3FRQXB4Y2gwTlE5V0ZUQk4zZXc2UTVkT3pLNGFHWkFrb29T?=
 =?utf-8?B?WURXdjdrZkdKZTh6ZEcrVG5LaE42OWEyY3lwS3gwM2x6ajJTZHYxak5iM1FE?=
 =?utf-8?B?M3FHZGtMS09uNmJMT1Myem1RQjZQT2drcnpYQ0tGNThDelo2S2JVdk45UTNp?=
 =?utf-8?B?ME5LSXF1bks4UEJKUFhWMDBreWVaU2Q4NnQreDNvNW1nNWlmMmU1d1JKRk5W?=
 =?utf-8?B?ODU3RzNYTXRDRVBhd3cxUXlJV0t1VW9ieHlRRUNCNDVSUlR0d1VYaC8remtS?=
 =?utf-8?B?QktCbUJ1aWlOZ0YvUFRhZjM0eE9yRmtDaXd5cHRZbDVxKzUxOEpxSzVvdnRG?=
 =?utf-8?B?dS9KcDB2RG5nVHdWMzMvZkV1M3BVVkhPRUNDRUEvNXlIKy9PWXo5eDhTcGh4?=
 =?utf-8?B?VGcyT2NhZUxvWFZGRUpxVngrS1FlalN5LytKMjYrT21NN2F0VFovM042cHR3?=
 =?utf-8?B?L052RENVVzlmWGRQbmd0cW5mK2ZHNXkreXFvZzMwVGh2d1dvRnhGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F43007742CB644F8386B00C355EE1E4@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0baaf08f-5f77-43b7-3e7e-08da18a11f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 14:15:52.1887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zp89Las4HJ7fsvks9zBI9r3qmOsCeEewIuE6vIlRjzd3rQ3uVZc2Ps5Sw0yOFUaZHMd9ww6c1q3CELfjxcGK4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8688
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Martin Krastev <krastevm@vmware.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA0LTA3IGF0IDA4OjAxICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAwNy4wNC4yMiB1bSAwNDo1NiBzY2hyaWViIFphY2sgUnVzaW46DQo+ID4gRnJvbTog
WmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gPiANCj4gPiBEcml2ZXJzIGR1cGxpY2F0
ZSB0aGUgY29kZSByZXF1aXJlZCB0byBhZGQgZGVidWdmcyBlbnRyaWVzIGZvcg0KPiA+IHZhcmlv
dXMNCj4gPiB0dG0gcmVzb3VyY2UgbWFuYWdlcnMuIFRvIGZpeCBpdCBhZGQgY29tbW9uIFRUTSBy
ZXNvdXJjZSBtYW5hZ2VyDQo+ID4gY29kZSB0aGF0IGVhY2ggZHJpdmVyIGNhbiByZXVzZS4NCj4g
PiANCj4gPiBCZWNhdXNlIFRUTSByZXNvdXJjZSBtYW5hZ2VycyBjYW4gYmUgaW5pdGlhbGl6ZWQg
YW5kIHNldCBhIGxvdA0KPiA+IGxhdGVyDQo+ID4gdGhhbiBUVE0gZGV2aWNlIGluaXRpYWxpemF0
aW9uIGEgc2VwZXJhdGUgaW5pdCBmdW5jdGlvbiBpcw0KPiA+IHJlcXVpcmVkLg0KPiA+IFNwZWNp
ZmljIHJlc291cmNlIG1hbmFnZXJzIGNhbiBvdmVyd3JpdGUNCj4gPiB0dG1fcmVzb3VyY2VfbWFu
YWdlcl9mdW5jOjpkZWJ1ZyB0byBnZXQgbW9yZSBpbmZvcm1hdGlvbiBmcm9tIHRob3NlDQo+ID4g
ZGVidWdmcyBlbnRyaWVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFphY2sgUnVzaW4gPHph
Y2tyQHZtd2FyZS5jb20+DQo+ID4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4NCj4gPiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4gPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPiA+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+DQo+IA0KPiBBaCwgeWVzIHRoYXQgd2FzIG9uIG15IFRPRE8gbGlz
dCBmb3IgcXVpdGUgYSB3aGlsZSBhcyB3ZWxsLg0KPiANCj4gPiAtLS0NCj4gPiDCoCBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9yZXNvdXJjZS5jIHwgNjUNCj4gPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gPiDCoCBpbmNsdWRlL2RybS90dG0vdHRtX3Jlc291cmNlLmjCoMKgwqDC
oCB8wqAgNCArKw0KPiA+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9yZXNvdXJjZS5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9yZXNvdXJjZS5jDQo+ID4gaW5kZXggNDkyYmEz
MTU3ZTc1Li42MzkyYWQzZTlhODggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fcmVzb3VyY2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Jlc291
cmNlLmMNCj4gPiBAQCAtMjksNiArMjksOCBAQA0KPiA+IMKgICNpbmNsdWRlIDxkcm0vdHRtL3R0
bV9yZXNvdXJjZS5oPg0KPiA+IMKgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19kcml2ZXIuaD4N
Cj4gPiANCj4gPiArI2luY2x1ZGUgInR0bV9tb2R1bGUuaCINCj4gPiArDQo+ID4gwqAgLyoqDQo+
ID4gwqDCoCAqIHR0bV9scnVfYnVsa19tb3ZlX2luaXQgLSBpbml0aWFsaXplIGEgYnVsayBtb3Zl
IHN0cnVjdHVyZQ0KPiA+IMKgwqAgKiBAYnVsazogdGhlIHN0cnVjdHVyZSB0byBpbml0DQo+ID4g
QEAgLTY0NCwzICs2NDYsNjYgQEAgdHRtX2ttYXBfaXRlcl9saW5lYXJfaW9fZmluaShzdHJ1Y3QN
Cj4gPiB0dG1fa21hcF9pdGVyX2xpbmVhcl9pbyAqaXRlcl9pbywNCj4gPiANCj4gPiDCoMKgwqDC
oMKgIHR0bV9tZW1faW9fZnJlZShiZGV2LCBtZW0pOw0KPiA+IMKgIH0NCj4gPiArDQo+ID4gKyNp
ZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykNCj4gPiArDQo+ID4gKyNkZWZpbmUgVFRNX1JFU19N
QU5fU0hPVyhpKSBcDQo+ID4gK8KgwqDCoMKgIHN0YXRpYyBpbnQgdHRtX3Jlc291cmNlX21hbmFn
ZXIjI2kjI19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwNCj4gPiB2b2lkICp1bnVzZWQpIFwNCj4g
PiArwqDCoMKgwqAgeyBcDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRt
X2RldmljZSAqYmRldiA9IChzdHJ1Y3QgdHRtX2RldmljZSAqKW0tDQo+ID4gPnByaXZhdGU7IFwN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdl
ciAqbWFuID0NCj4gPiB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIGkpOyBcDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3ByaW50ZXIgcCA9IGRybV9zZXFfZmlsZV9wcmlu
dGVyKG0pOyBcDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fcmVzb3VyY2VfbWFu
YWdlcl9kZWJ1ZyhtYW4sICZwKTsgXA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7IFwNCj4gPiArwqDCoMKgwqAgfVwNCj4gPiArwqDCoMKgwqAgREVGSU5FX1NIT1dfQVRU
UklCVVRFKHR0bV9yZXNvdXJjZV9tYW5hZ2VyIyNpKQ0KPiA+ICsNCj4gPiArVFRNX1JFU19NQU5f
U0hPVygwKTsNCj4gPiArVFRNX1JFU19NQU5fU0hPVygxKTsNCj4gPiArVFRNX1JFU19NQU5fU0hP
VygyKTsNCj4gPiArVFRNX1JFU19NQU5fU0hPVygzKTsNCj4gPiArVFRNX1JFU19NQU5fU0hPVyg0
KTsNCj4gPiArVFRNX1JFU19NQU5fU0hPVyg1KTsNCj4gPiArVFRNX1JFU19NQU5fU0hPVyg2KTsN
Cj4gDQo+IFVmZiwgcGxlYXNlIG5vdCBhIHN0YXRpYyBhcnJheS4NCj4gDQo+ID4gKw0KPiA+ICsj
ZW5kaWYNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiB0dG1fcmVzb3VyY2VfbWFuYWdlcl9kZWJ1
Z2ZzX2luaXQgLSBTZXR1cCBkZWJ1Z2ZzIGVudHJpZXMgZm9yDQo+ID4gc3BlY2lmaWVkDQo+ID4g
KyAqIHJlc291cmNlIG1hbmFnZXJzLg0KPiA+ICsgKiBAYmRldjogVGhlIFRUTSBkZXZpY2UNCj4g
PiArICogQGZpbGVfbmFtZXM6IEEgbWFwcGluZyBiZXR3ZWVuIFRUTV9UVCBwbGFjZW1lbnRzIGFu
ZCB0aGUNCj4gPiBkZWJ1Z2ZzIGZpbGUNCj4gPiArICogbmFtZXMNCj4gPiArICogQG51bV9maWxl
X25hbWVzOiBUaGUgYXJyYXkgc2l6ZSBvZiBAZmlsZV9uYW1lcy4NCj4gPiArICoNCj4gPiArICog
VGhpcyBmdW5jdGlvbiBzZXR1cHMgdXAgZGVidWdmcyBmaWxlcyB0aGF0IGNhbiBiZSB1c2VkIHRv
IGxvb2sNCj4gPiArICogYXQgZGVidWcgc3RhdGlzdGljcyBvZiB0aGUgc3BlY2lmaWVkIHR0bV9y
ZXNvdXJjZV9tYW5hZ2Vycy4NCj4gPiArICogQGZpbGVfbmFtZXMgYXJyYXkgaXMgdXNlZCB0byBm
aWd1cmUgb3V0IHdoaWNoIHR0bSBwbGFjZW1lbnRzDQo+ID4gKyAqIHdpbGwgZ2V0IGRlYnVnZnMg
ZmlsZXMgY3JlYXRlZCBmb3IgdGhlbS4NCj4gPiArICovDQo+ID4gK3ZvaWQNCj4gPiArdHRtX3Jl
c291cmNlX21hbmFnZXJfZGVidWdmc19pbml0KHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LA0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29uc3QgY2hhciAqIGNvbnN0IGZpbGVfbmFtZXNbXSwNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90
IG51bV9maWxlX25hbWVzKQ0KPiA+ICt7DQo+ID4gKyNpZiBkZWZpbmVkKENPTkZJR19ERUJVR19G
UykNCj4gPiArwqDCoMKgwqAgdWludDMyX3QgaTsNCj4gPiArwqDCoMKgwqAgY29uc3Qgc3RydWN0
IGZpbGVfb3BlcmF0aW9ucyAqZm9wc1tdID0gew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnR0bV9yZXNvdXJjZV9tYW5hZ2VyMF9mb3BzLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJnR0bV9yZXNvdXJjZV9tYW5hZ2VyMV9mb3BzLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJnR0bV9yZXNvdXJjZV9tYW5hZ2VyMl9mb3BzLA0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJnR0bV9yZXNvdXJjZV9tYW5hZ2VyM19mb3BzLA0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgJnR0bV9yZXNvdXJjZV9tYW5hZ2VyNF9mb3BzLA0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJnR0bV9yZXNvdXJjZV9tYW5hZ2VyNV9mb3BzLA0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJnR0bV9yZXNvdXJjZV9tYW5hZ2VyNl9mb3BzLA0KPiA+ICvC
oMKgwqDCoCB9Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqAgV0FSTl9PTihudW1fZmlsZV9uYW1lcyA+
IEFSUkFZX1NJWkUoZm9wcykpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8
IG51bV9maWxlX25hbWVzOyArK2kpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
ZmlsZV9uYW1lc1tpXSAmJiBmb3BzW2ldKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRlYnVnZnNfY3JlYXRlX2ZpbGUoZmlsZV9uYW1lc1tpXSwgMDQ0NCwN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX2RlYnVnZnNfcm9vdCwgYmRldiwNCj4g
PiBmb3BzW2ldKTsNCj4gDQo+IFlvdSBjYW4gZ2l2ZSB0aGUgdHRtX3Jlc291cmNlX21hbmFnZXIg
ZGlyZWN0bHkgYXMgcGFyYW1ldGVyIGhlcmUNCj4gaW5zdGVhZA0KPiBvZiB0aGUgYmRldiBhbmQg
YXZvaWQgdGhlIHdob2xlIGhhbmRsaW5nIHdpdGggdGhlIG1hY3JvIGFuZCBnbG9iYWwNCj4gYXJy
YXlzLg0KDQpXZSBjb3VsZCBidXQgdGhhdCBkb2VzIGNoYW5nZSB0aGUgYmVoYXZpb3VyLiBJIHdh
cyB0cnlpbmcgdG8gcHJlc2VydmUNCnRoZSBvbGQgc2VtYW50aWNzLiBCZWNhdXNlIHRoZSBsaWZl
dGltZXMgb2YgZHJpdmVyIHNwZWNpZmljIG1hbmFnZXJzDQphcmUgbm90IGhhbmRsZWQgYnkgdHRt
LCB0aGVyZSdzIG5vdGhpbmcgcHJldmVudGluZyB0aGUgZHJpdmVycyBmcm9tLA0KZS5nLiBkdXJp
bmcgcmVzZXQsIGRlbGV0aW5nIHRoZSBvbGQgYW5kIHNldHRpbmcgdXAgbmV3IHJlc291cmNlDQpt
YW5hZ2Vycy4gQnkgYWx3YXlzIHVzaW5nIHR0bV9tYW5hZ2VyX3R5cGUoKSB3ZSBtYWtlIHN1cmUg
dGhhdCB3ZSdyZQ0KYWx3YXlzIHVzaW5nIHRoZSBjdXJyZW50IG9uZS4gUGFzc2luZyB0dG1fcmVz
b3VyY2VfbWFuYWdlciBkaXJlY3RseQ0KbWFrZXMgaXQgaW1wb3NzaWJsZSB0byB2YWxpZGF0ZSB0
aGF0IGF0IF9zaG93KCkgdGltZQ0KdHRtX3Jlc291cmNlX21hbmFnZXIgaXMgc3RpbGwgdmFsaWQu
IEl0J3Mgbm90IGEgcHJvYmxlbSBmb3Igdm13Z2Z4DQpiZWNhdXNlIHdlIG5ldmVyIHJlc2V0IHRo
ZSByZXNvdXJjZSBtYW5hZ2VycyBidXQgSSBkaWRuJ3QgZmVlbA0KY29tZm9ydGFibGUgY2hhbmdp
bmcgdGhlIHNlbWFudGljcyBsaWtlIHRoYXQgZm9yIGFsbCBkcml2ZXJzLiBJdCBjb3VsZA0KbGVh
ZCB0byB3ZWlyZCBjcmFzaGVzLCBidXQgaWYgeW91IHByZWZlciB0aGF0IGFwcHJvYWNoIEknbSBo
YXBweSB0bw0KY2hhbmdlIGl0Lg0KDQp6DQoNCg==
