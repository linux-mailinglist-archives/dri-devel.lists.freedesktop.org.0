Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8685AE1D7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34E789622;
	Tue,  6 Sep 2022 08:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6729B89622
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 08:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsFaXWURYdnqVSg2xreX0nm/TNHwfJWrwkrvcRIBMExhohOEk23kZrA0G2FJ/o5voit0Rfd0Fws6ZcyHpmLIYqTTnziUaKWZGOJQwgXvyHBzCxihm2ZZtCDCu3Y22aqJHHwBOEvl+Jn07HjLW9mcnJgTIWYrJS6mztqaf90OQMRUcZcjRDeDNdHQPe5zdHfgh3oCHki06SMq6569IhH6+A4ueoMXnEprlVRajNxqsbDi3rGuDh28/fh+g4mJg/yfZ/8QDkTXryegjQqsHWZ+cAEjdPAy+JWacZqI39qVDw11uk1IO094M1ig743PJFvLk6ip7dTm7S4qJnxjkxcjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nXC9NEHy9Tr49N+q8p0w6YjIUhLNvlnb1KETfSxdOI=;
 b=Zz+d9w5sQeiiNTDB94LRp6EcFNLYNfIeldpgkbmcl3aRFcYBpJE9PZfngJCGmimRULc2YeFRLjcAnAqpZqfZQ++E6eF16cN0KFhVK/OOVE2o2QQ2ww8kTdUSuXT8BmpPlihHSlN/xht/vIe+s9eXBFN33oK7pF74LrR5hfzTD1Uavafg0BIHEyC91PFd07mb3oroOWlKUc14SGZWRSS/ONJtzG6PzVUuykxtbRPypjtQH97gdcGlsAx6bNWnuZN5VS4ZDfoS6B7SelQmcbbBbCpp6TTLWaX87WHvoUQAoGQnvW8dHbKDJH9PLgMeP1xo8RevuYwP2rF4qtMnBnCMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nXC9NEHy9Tr49N+q8p0w6YjIUhLNvlnb1KETfSxdOI=;
 b=sq1ujscrO9NRttICbhH79RDASi7JMj9G3XvcC0XZa13kBuJzggfp0uhGdnpDbfdlWLv4UJgMAJeF7NU0cxURmWqY1fBGK2qFmnbyNWnLmVvGPf4Lrl8jBl4lFRamSDWeTdX9IJ76NbyW96ziGUF3kXrcm9s7FPAQX9V3hjGt4R4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5972.jpnprd01.prod.outlook.com (2603:1096:604:cf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 08:06:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 08:06:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: RE: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Thread-Topic: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Thread-Index: AQHYwUs0AungGCQLKE+37Dc5lKmkg63RIy3AgAAYqYCAALEdsIAAHXCAgAAAUgA=
Date: Tue, 6 Sep 2022 08:06:30 +0000
Message-ID: <OS0PR01MB5922240073630A409D67ED03867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
 <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com>
 <OS0PR01MB5922EE3F6CDD827919A7763E867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAJiuCcd7upgT6vQWHos-X1-89+Z-5xxDe2SMCdC2=_LgZaVMiw@mail.gmail.com>
In-Reply-To: <CAJiuCcd7upgT6vQWHos-X1-89+Z-5xxDe2SMCdC2=_LgZaVMiw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c064fbc-08c3-42a2-46e7-08da8fdeb4a8
x-ms-traffictypediagnostic: OS0PR01MB5972:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: peoR1MHcvl5xL9stDxGoXkqYx9y4Hur4YXrE3F21imDYHPcB+yJ17E4eqk+YfWZDDc9/fiNjNzxXaY0rd/eFNxjhfyjl3KXOR6aT5A0KqGXgJ5TG0t82l23F32J2Yj/tlZq+kLM9HZKQhBMNriNKIa1e/Yv6GvNOjQlZDViV9WYQdnh3fYl2IEZUtdDmiCZHpiyDOD4FxZ+t0gzOhxojo5NldUrx305zhiKlBv26bGdLL7vbUCSz+lFCCIU2cSMdNPB1357EE9ilP9KvcTolb1+wDlYEPyPJNkSsZSHlRk5mmEKlnusZHuLddE2kKIxJfCPI9uQDaZbeqBg9Yqi2KoUrjf0Eeu6VtLGBzKd1FN/XWPOh9H926ufOJ1rqi5Gp8GM2HLAGXsmMZXFh/tW88dNTLASQ0W/iAE31xA/l0zk5ESfogH9Tg8btezc66RdjPfL3JTj8awo0xJLqzJYqGzJwYcMewqC7TxTOBYl5Jfg0+pQFvGBAp7R/kECIBODcqyEBUnXCwgdRCoc5ks5tZgCDfThcHXzxF466F5Mkmsl6znOi+CbQqNijmjxMyl/PDYFmcKQOOA5eGrIos5HPkgmRveBp44Sd06VHPk0TdBTmTtYHpezm06l1RORhm38SQlYzDgzYPh5uk4fH+a5GU3GaCC5qxfam03Q/PjCQzblLvbX6JvX+rIcU9zTGeVawVTYxwSGDhfR1waKSaeYdQZ8r+kbIQL/D1+KO5zq+f4/6rxfrnUp0r1lcka4Xl1Z9bY8TZLqY9qSMdjbXVZ3cpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(64756008)(52536014)(76116006)(8676002)(66946007)(478600001)(66446008)(4326008)(66574015)(5660300002)(66476007)(8936002)(6506007)(7696005)(83380400001)(66556008)(7416002)(41300700001)(26005)(9686003)(2906002)(86362001)(33656002)(38070700005)(122000001)(38100700002)(316002)(55016003)(71200400001)(54906003)(6916009)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUxvOFBPYW1iV0IxZWtLUFNoRk13WW4ycWszdXc4dXhydlVYa0lsQURhbzM3?=
 =?utf-8?B?alFrQmdnOEc2b2t3ZkRkZWtKYXA1ZWhhL0VocDljY3dRZTlUUktFQjlQZnpB?=
 =?utf-8?B?WHlERHFyU2loZ3JIdW9OcEY4czE4b3lCdTNvR2pJZUs3WWEraFJjTjNicVd1?=
 =?utf-8?B?M3ovSDdWWEZHVzcyMVBsYnR6bmlubzFQd1pxcFRlVkIxMG1SR1VOWVI0dGcv?=
 =?utf-8?B?UUVOS0NnckFzQWI0WVphaVdBQ1REanI5T2VjZlNSdnByZEwwRThhemVGRnhl?=
 =?utf-8?B?VDJHZ1N5bEdBTVlRQ0dwZTJ0WkY5REJLelFsVVZOOWNRVDg4aE1ZTTBLdFhL?=
 =?utf-8?B?TDdNTnQ0Z2FtQmFkUVVOSVFtRDd5ZmVnSjEyM2lKelV5OHVQNmNLSjFUbGRr?=
 =?utf-8?B?T09RbTVLdHpiK1B6N0pmYUxKc3lWaFB2SXprdklIUTZueDlyOFBFWjNGUHUz?=
 =?utf-8?B?L0tTN1NpMjBpcjFiU2U0SUdBYmw3a1dKL0lBMSthUng1NUN6RTlFcXduSkg3?=
 =?utf-8?B?elh6UVhNZDFjeTZOanlUcHJxdHFNK1NUUlhLWTlETFlYMHNkS21vajU4MmVB?=
 =?utf-8?B?YTRXNm9ZNmJuUTR6eGpGMjNmZDA4clVzL1dYaTJ2c2lVbnA4U2ZWRTI1VVc2?=
 =?utf-8?B?UFNxMTlkYks2cmxBNVlrWlJjZFBCOWRpZllzWFN1RjFQd1gzUUo1V0pDckI2?=
 =?utf-8?B?ay9CVnZ2azdvQmVEaWJuK1htRjA1cDlESDlJaHdQZ3lscER2cWtESklNM0FL?=
 =?utf-8?B?dGxKLyt5cHNyWjU5ZzNRMHkxejh0NkxnRThVUHBHYVNTeWFvTldjVlpxL1dN?=
 =?utf-8?B?dVc4VlN3UitaTGhFaFhJZGluRG9GdEpnNDBaNEp5RDBPS2pndldUcGozR1Fr?=
 =?utf-8?B?OTdKVWxlMmJwem9rSDVFSU55bEVYM0kvWE0zdHlTZWVTdTJ5TXhWRGZjYXBl?=
 =?utf-8?B?NWl6S0FSZUlNTjdCa2JzY1BKSURyOXJRaEhXeWM3WE1FNWYrQ1ZiSk1KWUE3?=
 =?utf-8?B?VUhlSW96S0pCd1VHU2VIUjVkVCszRWFMbnp3SXpiT0dlMm05cGFjK0s0U3lB?=
 =?utf-8?B?WkR0d1l6V2taYXh6d2VQc2UrR0cwZXdjUEQzakJxNkpEcm12ckFqUFQxMXZI?=
 =?utf-8?B?UEpmU0tpUVVPWDdSOUxWVFFlVWY5SGFhUUFMSXQrU1NmNjFhVURNMFBHVTNh?=
 =?utf-8?B?SDFLVFNqNjFFSmV3SDZyZDZKdDVnWTVVTEU4dXZTS0lUREcvR3ZkZVNUUVc2?=
 =?utf-8?B?dkhWWE5VYWJRL1Z4RTBhQUR1Rk1LK1dvK3d3NkI1bjRXVDArZmIreHh0azhE?=
 =?utf-8?B?bXlNblhjK0hjRWs3UW8waGNDWitZMXRTL296clI1bWcvZDd1OWFjaGhHZ01w?=
 =?utf-8?B?SkRuc0tOV29ZRjEyRkVLZFQ5Y3E4eHREalE2RFhyL0NyV3ViZG1QenpXempI?=
 =?utf-8?B?TEtYeDdpalFLMlRZUU02ZjFDSkZ5UGVIZHVmZ1dmNUNGaXM4cVFyaUtjWmR0?=
 =?utf-8?B?SXBpNlI1K2RDdjR4MXU1OTE0NHZQU245ZkVvSHI1OGJvOENQT2VPTmwyU1pN?=
 =?utf-8?B?Yk55bURSQnlQQldvYTNYbUdWakNadG5TbjU4NEZvaEpvVllyTnBmRktYVlpE?=
 =?utf-8?B?MkZ6YWhvdm9PRkxSaExFcDY0NG9kRVRuTHllRUJxOEMzQktXWklpd01SQVRM?=
 =?utf-8?B?UG1xRmdoTTVKa2pNWVNvZmswSXhnc3JRYTZuY09DR3pVSTFDWFNNWDdrWFZQ?=
 =?utf-8?B?OFg2ZEMwVXBqbUkra0d2Y1VqRnBJM2sxaWllem5WMW1EUXY5NE93c2hIMEIv?=
 =?utf-8?B?MmxzTEExME40QmlYamRyYm5kcUpWMzBjYTQ4UUlncHQyTTlITWpWOWZqNU5Z?=
 =?utf-8?B?L2c5M2k1dzI4VVIwWnB2aG5aMVBvai94WkpqYldRRWx4elF5VmVuTTNtWjF4?=
 =?utf-8?B?VmY2MEFuVGlYUnRXS2JTVFdsYUpwQ2pTaUFqVFBzNW5NcW5WTXJPNHYrZ3py?=
 =?utf-8?B?N3A0K3hiTU1zR0FrT2ZMN0ZvbWNLWTlsYTJQRFJ5Y1o3b0dGU2NxTnk2YmhX?=
 =?utf-8?B?cjFNN2hVWU9sQjdDZElJZnpDalhLaW9OdTUrQzVvdW5QdEtFWUFBN2I0ZVNi?=
 =?utf-8?Q?UdQ0eokmnMMHoflr1dL86p1YL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c064fbc-08c3-42a2-46e7-08da8fdeb4a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 08:06:30.2160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ded9HofjWpJ+ATY2zYwOjStYb5DgJHSYv9jfvyDwwKvwGQ9Blqga4ZL3Z1gZTTHumC+jWXUUP8NBuECF9DbPVBoRhsJXiL9xg9mnwEAGKr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5972
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Steven Price <steven.price@arm.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2xlbWVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDQvNV0gZHJtL3BhbmZyb3N0
OiBkZXZmcmVxOiBzZXQgb3BwIHRvIHRoZQ0KPiByZWNvbW1lbmRlZCBvbmUgdG8gY29uZmlndXJl
IGFuZCBlbmFibGUgcmVndWxhdG9yDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCA2IFNl
cHQgMjAyMiBhdCAwODo0MiwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPg0KPiA+IEhpIENsZW1lbnQsDQo+ID4NCj4gPiA+DQo+ID4gPiBIaSwNCj4g
PiA+DQo+ID4gPiBPbiBNb24sIDUgU2VwdCAyMDIyIGF0IDIwOjE3LCBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gSGks
DQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+ID4gPg0KPiA+ID4g
PiA+IFN1YmplY3Q6IFtQQVRDSCB2MyA0LzVdIGRybS9wYW5mcm9zdDogZGV2ZnJlcTogc2V0IG9w
cCB0byB0aGUNCj4gPiA+ID4gPiByZWNvbW1lbmRlZCBvbmUgdG8gY29uZmlndXJlIGFuZCBlbmFi
bGUgcmVndWxhdG9yDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkZXZtX3BtX29wcF9zZXRfcmVndWxh
dG9ycygpIGRvZXNuJ3QgZW5hYmxlIHJlZ3VsYXRvciwgd2hpY2gNCj4gPiA+ID4gPiBtYWtlIHJl
Z3VsYXRvciBmcmFtZXdvcmsgc3dpdGNoaW5nIGl0IG9mZiBkdXJpbmcNCj4gcmVndWxhdG9yX2xh
dGVfY2xlYW51cCgpLg0KPiA+ID4gPg0KPiA+ID4gPiBJbiB0aGF0IGNhc2UsIHdoeSBub3QgcmVn
dWxhdG9yX2dldCgpZm9yIER5bmFtaWMgcmVndWxhdG9yKG5vbg0KPiA+ID4gPiBmaXhlZCByZWd1
bGF0b3IpPz8NCj4gPiA+DQo+ID4gPiBTb3JyeSBJIGRvbid0IHVuZGVyc3RhbmQsIHdoYXQgZG8g
eW91IG1lYW4/DQo+ID4NCj4gPiBOb3JtYWxseSB3ZSBuZWVkIHRvIHR1cm4gb24gcmVndWxhdG9y
IGFuZCBjbG9jayBvbmx5IHdoZW4gbmVlZGVkLg0KPiA+IEkgYW0gbm90IHN1cmUgd2l0aCB5b3Vy
IG5ldyBjb2RlLCB3aWxsIG1ha2UgaXQgYWx3YXlzIG9uIGFuZCBkcmFpbnMNCj4gPiB0aGUgcG93
ZXIgdW5uZWNlc3NhcmlseSBhbmQgZG9lcyBpdCBzZXQgbG93ZXIgb3BwIG9yIGhpZ2hlciBvcHAg
YXQgdGhlDQo+ID4gc3RhcnQ/Pw0KPiANCj4gVGhlIGNvZGUgZG9lc24ndCBtYWtlIGl0IGFsd2F5
cyBvbiwgaXQgbWFrZXMgaXQgaG93IGl0IHNob3VsZCBiZSBhdCB0aGUNCj4gcmVjb21tZW5kZWQg
T1BQIHdoaWNoIGlzIHRoZSAic3RhcnQgcG9pbnQiLg0KPiANCj4gSWYgdGhlIHJlY29tbWVuZGVk
IE9QUCBzYXlzIHRvIHN3aXRjaCBvZmYgdGhlIHJlZ3VsYXRvciB0aGVuIGl0IHdpbGwuDQo+IA0K
PiA+DQo+ID4gQ29tcGFyZWQgdG8gdGhlIGZpeGVkIHJlZ3VsYXRvciwgeW91IGhhdmUgdm9sdGFn
ZSByZWd1bGF0b3IgdG8gY29udHJvbA0KPiA+IHRoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biBteSBlbnZpcm9ubWVudCBhbmQgWW91ciBlbnZpcm9ubWVudC4NCj4gPg0KPiA+IEkgYW0gbm90
IHN1cmUgYW55IG90aGVyIFNvQyBpcyB1c2luZyB2b2x0YWdlIHJlZ3VsYXRvcj8/DQo+ID4gSWYg
eWVzLCB0aGVudGhlcmUgc2hvdWxkIGJlIHNvbWUgYnVnIG9yIHNvbWUgZGlmZmVyZW5jZSBpbiBI
VyB3aGljaCBpcw0KPiA+IGdpdmluZyBkaWZmZXJlbnQgYmVoYXZpb3VyPz8NCj4gPg0KPiA+IElm
IHlvdSBhcmUgdGhlIGZpcnN0IG9uZSB1c2luZyB2b2x0YWdlIHJlZ3VsYXRvciB3aXRoIG1hbGkg
Z3B1LCBUaGVuDQo+ID4gWW91ciBpbXBsZW1lbnRhdGlvbiBtYXkgYmUgY29ycmVjdCwgYXMgeW91
IGhhdmUgcHJvcGVyIEhXIHRvIGNoZWNrLg0KPiANCj4gVGhlIGlzc3VlIGlzIHRoYXQgbXkgcmVn
dWxhdG9yIGlzIG5vdCBtYXJrZWQgYXMgImFsd2F5cy1vbiIsIGlmIG5vIE9QUCBpcw0KPiBjYWxs
ZWQgYmVmb3JlIHJlZ3VsYXRvcl9sYXRlX2NsZWFudXAoKSB0aGVuIG5vYm9keSBzZXRzIHRoZQ0K
PiByZWd1bGF0b3JfZW5hYmxlKCkgYW5kIHRoZSByZWd1bGF0b3IgaXMgc3dpdGNoZWQgb2ZmLCB3
aGljaCBtYWtlcyBteQ0KPiBib2FyZCBoYW5nLg0KDQpDb29sLCBGcm9tIHlvdXIgdGVzdGluZyBs
b29rcyBsaWtlIG5vIG9uZSB0ZXN0ZWQgdGhpcyBmZWF0dXJlIHdpdGgNCm1hbGkgR1BVIG9uIG1h
aW5saW5lPz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCj4gDQo+IExpa2UgVmlyZXNoIHJlY29tbWVu
ZHMgSSB3aWxsIHNlbmQgYW4gdXBkYXRlIHdpdGggbW9yZSBkZXRhaWxzIGluIHRoZQ0KPiBjb21t
aXQgbG9nLg0KPiANCj4gUmVnYXJkcywNCj4gQ2xlbWVudA0KPiANCj4gDQo+ID4NCj4gPiA+DQo+
ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBDYWxsIGRldl9wbV9vcHBfc2V0X29wcCgpIHdp
dGggdGhlIHJlY29tbWVuZCBPUFAgaW4NCj4gPiA+ID4gPiBwYW5mcm9zdF9kZXZmcmVxX2luaXQo
KSB0byBlbmFibGUgdGhlIHJlZ3VsYXRvciBhbmQgYXZvaWQgYW55DQo+ID4gPiA+ID4gc3dpdGNo
IG9mZiBieSByZWd1bGF0b3JfbGF0ZV9jbGVhbnVwKCkuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBT
dWdnZXN0ZWQtYnk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+DQo+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNv
bT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmZyZXEuYyB8IDggKysrKysrKysNCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMNCj4gPiA+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMNCj4gPiA+ID4gPiBpbmRleCA1
MTEwY2Q5YjI0MjUuLjY3YjI0MjQwNzE1NiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jDQo+ID4gPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYw0KPiA+ID4gPiA+IEBAIC0x
MzEsNiArMTMxLDE0IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0DQo+ID4gPiA+
ID4gcGFuZnJvc3RfZGV2aWNlDQo+ID4gPiA+ID4gKnBmZGV2KQ0KPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIob3BwKTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAgICAgIHBh
bmZyb3N0X2RldmZyZXFfcHJvZmlsZS5pbml0aWFsX2ZyZXEgPSBjdXJfZnJlcTsNCj4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gKyAgICAgLyogU2V0dXAgYW5kIGVuYWJsZSByZWd1bGF0b3IgKi8NCj4g
PiA+ID4gPiArICAgICByZXQgPSBkZXZfcG1fb3BwX3NldF9vcHAoZGV2LCBvcHApOw0KPiA+ID4g
PiA+ICsgICAgIGlmIChyZXQpIHsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIERSTV9ERVZfRVJS
T1IoZGV2LCAiQ291bGRuJ3Qgc2V0IHJlY29tbWVuZGVkDQo+IE9QUFxuIik7DQo+ID4gPiA+ID4g
KyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gPiA+ICsgICAgIH0NCj4gPiA+ID4NCj4g
PiA+ID4NCj4gPiA+ID4gRllJLA0KPiA+ID4gPiBPbiBSWi9HMkwgbWFsaSBncHUsIHdlIGhhdmUg
Zml4ZWQgcmVndWxhdG9yIGFuZCBJIHdhcyBhYmxlIHRvIGRvDQo+ID4gPiA+IEdQVSBPUFAgdHJh
bnNpdGlvbiB3aXRob3V0IGFueSBpc3N1ZXMgcHJldmlvdXNseS4NCj4gPiA+DQo+ID4gPiByemcy
bC1zbWFyYy1zb20uZHRzaSB1c2VzIHJlZ3VsYXRvciByZWdfMXAxdjsgd2hpY2ggaXMgbWFya2Vk
IGFzDQo+ID4gPiByZWd1bGF0b3ItYWx3YXlzLW9uOyB0aGF0J3Mgd2h5DQo+ID4gPiByZWd1bGF0
b3JfbGF0ZV9jbGVhbnVwKCkgZG9lc24ndCBzd2l0Y2ggaXQgb2ZmLg0KPiA+DQo+ID4gWWVzIHRo
YXQgaXMgY29ycmVjdC4gSXQgaXMgZml4ZWQgcmVndWxhdG9yIGFuZCBhbHdheXMgb24uDQo+ID4g
V2UgY29udHJvbCBvbmx5IGZyZXF1ZW5jeS4NCj4gPg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo+
ID4NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IHJvb3RAc21hcmMtcnpnMmw6fiMgY2F0IC9zeXMv
Y2xhc3MvZGV2ZnJlcS8xMTg0MDAwMC5ncHUvdHJhbnNfc3RhdA0KPiA+ID4gPiAgICAgIEZyb20g
IDogICBUbw0KPiA+ID4gPiAgICAgICAgICAgIDogIDUwMDAwMDAwICA2MjUwMDAwMCAxMDAwMDAw
MDAgMTI1MDAwMDAwIDIwMDAwMDAwMA0KPiA+ID4gMjUwMDAwMDAwIDQwMDAwMDAwMCA1MDAwMDAw
MDAgICB0aW1lKG1zKQ0KPiA+ID4gPiAqICA1MDAwMDAwMDogICAgICAgICAwICAgICAgICAgMCAg
ICAgICAgIDAgICAgICAgICAwICAgICAgICAgMA0KPiA+ID4gMCAgICAgICAgIDAgICAgICAgICAx
ICAgICAgIDE0NA0KPiA+ID4gPiAgICA2MjUwMDAwMDogICAgICAgICAwICAgICAgICAgMCAgICAg
ICAgIDAgICAgICAgICAwICAgICAgICAgMA0KPiA+ID4gMCAgICAgICAgIDAgICAgICAgICAwICAg
ICAgICAgMA0KPiA+ID4gPiAgIDEwMDAwMDAwMDogICAgICAgICAwICAgICAgICAgMCAgICAgICAg
IDAgICAgICAgICAwICAgICAgICAgMA0KPiA+ID4gMCAgICAgICAgIDAgICAgICAgICA5ICAgICAg
IDUyNA0KPiA+ID4gPiAgIDEyNTAwMDAwMDogICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDkg
ICAgICAgICAwICAgICAgICAgMA0KPiA+ID4gMCAgICAgICAgIDAgICAgICAgICAzICAgICAgMjU0
NA0KPiA+ID4gPiAgIDIwMDAwMDAwMDogICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAg
ICAgIDExICAgICAgICAgMA0KPiA+ID4gMCAgICAgICAgIDAgICAgICAgIDQ2ICAgICAgMzMwNA0K
PiA+ID4gPiAgIDI1MDAwMDAwMDogICAgICAgICAxICAgICAgICAgMCAgICAgICAgIDAgICAgICAg
ICAwICAgICAgICAzMw0KPiA+ID4gMCAgICAgICAgIDAgICAgICAgICAwICAgICAgNzQ5Ng0KPiA+
ID4gPiAgIDQwMDAwMDAwMDogICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAw
ICAgICAgICAxNg0KPiA+ID4gMTkgICAgICAgICAwICAgICAgICAgMCAgICAgIDIwMjQNCj4gPiA+
ID4gICA1MDAwMDAwMDA6ICAgICAgICAgMSAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMSAg
ICAgICAgIDgNCj4gPiA+IDE1ICAgICAgICAzNSAgICAgICAgIDAgICAgICA0MDMyDQo+ID4gPiA+
IFRvdGFsIHRyYW5zaXRpb24gOiAyMDgNCj4gPiA+ID4NCj4gPiA+ID4gQ2hlZXJzLA0KPiA+ID4g
PiBCaWp1DQo+ID4gPiA+DQo=
