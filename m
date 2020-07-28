Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C00231667
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 01:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0D36E02E;
	Tue, 28 Jul 2020 23:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D9D6E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 23:47:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfHOi5UTJW5m2KGn6gj0zhuTvmz3pA8lJI1dh1r05mhytecnNwp8Xcn1RruvrEU5Pa0iLUrSyhnlRepzSCRwmDWaTpY9XJnueAuuxdFOmapgSZBLEfd0nzSPYNGgEnY68dpSlQzLHTGRMMXmbP0fny671Opqozhea7+FZPcyjlmN7Axugry7gYOi6t5LiXhKgV84NBlrEcBfdUHaFMdaQfnY5T3+/oMToyhNEF142uxHXeN8ricdI599uw9x7/nIAeblgh4oWks9HwdyIWyrIVcQtsRtsetwvieRHQGew11WyBirDYIHiwqI7oyD/R5gm8QbiEmXwrr0Q2CF2TaRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGD05R3m2INiEGlzYwEqkXAr7BX1+1F4WFWVt5m1Wns=;
 b=e6OLiwu6+lZPSLoSoNvr/7EeBUXXUPvnG3bHMn8WQ4JLZRWrRcpoTkCKXs4ePbpY0aSwcVX21KLX29aNHP7V0BFWWi4K/vmc+Z9dmDHHCANwqQfJm47vB0fHwjCAkElAU/taMdawKk+HMhwKbNtzkMd1U/fNIHeZ2g13mRB+TLbdeqRNpHno3F6qYVabmfeipxT+ZwDweEcq7doHYw1pKyRuTMLfOtGWDKcIELIkBZvwfa40zwTmJ2u4ei/LMtYaUggQprZpUuO7FV5gn/eWQ949/KMIk9h7Yl0AGJeYUFHB3jfzvNVRpZK2oM8Mni+xplG0kJV9u0IzbNzvT+qOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGD05R3m2INiEGlzYwEqkXAr7BX1+1F4WFWVt5m1Wns=;
 b=DXw/SPdy6tGx+kwlTBMcM0tS9Abd9yI1+2ABN3nZ2EaChiL9npMUar/6DD0y8XZP8eSf0VNLIq3jU8M4ABt2+ThVtrTXjohoL7kcj6Xqi/0ro1Vr6yO1mI2iaE3gZ6Qtt6RZHj6dKn+qXFPj9RiH9MBEqMryURaMXbtHa5yU0OE=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by BL0PR05MB5284.namprd05.prod.outlook.com (2603:10b6:208:66::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9; Tue, 28 Jul
 2020 23:47:21 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::68f5:51f8:fd42:d6cf]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::68f5:51f8:fd42:d6cf%3]) with mapi id 15.20.3239.015; Tue, 28 Jul 2020
 23:47:21 +0000
From: Zack Rusin <zackr@vmware.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] ttm: ttm_bo_swapout_all doesn't use it's argument.
Thread-Topic: [PATCH] ttm: ttm_bo_swapout_all doesn't use it's argument.
Thread-Index: AQHWZJE0n7gmq/9R20mZ+10c8J4CFKkdqbsA
Date: Tue, 28 Jul 2020 23:47:21 +0000
Message-ID: <5EE24086-3E3B-4735-923A-944602A73DB1@vmware.com>
References: <20200728034254.20114-1-airlied@gmail.com>
In-Reply-To: <20200728034254.20114-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [100.34.240.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd69c842-bc65-46e6-062d-08d833509234
x-ms-traffictypediagnostic: BL0PR05MB5284:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR05MB5284328E3F3D89D41D71BBA0CE730@BL0PR05MB5284.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7lppBwZZusdze9fSTMXDZfzCCCyoa+hatEvjlDrAVmLP5iitaNHz4J4q72Ol9No/pqh/nQMhAFS7iyvNPapHLyM1Thchubbg2a8l4xfLB4biMFDUiOCr+YlacvWKWz95ArBwWvrZ8Lt0f0HNt9MF/Xf4uwl+3jURw+K+H7dCBBachMeKlSpcwxQUeknsVyGwj6h4yLzEvT3e7+FvytJV3E+A+Tbn4klM6/jwD4LFrJv2am9CrD5k3Mn88YxJ1gQ5+ufAYxtrmlslMlBZPZ31wRkIJrVBxpnJaSjW6jM6lFNqJW1yjKhlC/XpdPayMrRPex33vuI2EvpvhTwgQIelrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39850400004)(366004)(136003)(346002)(396003)(376002)(5660300002)(53546011)(76116006)(91956017)(26005)(8936002)(36756003)(33656002)(71200400001)(478600001)(6506007)(186003)(64756008)(4744005)(66446008)(66556008)(66476007)(83380400001)(2906002)(2616005)(66946007)(316002)(8676002)(4326008)(6486002)(86362001)(54906003)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: N506916zeW3J0V+02q+ZdubppTwn5tIcuFo43oQDPVbaWbj31HrtWpt21VkGpl3Fdm0gxBkesLBuyIUWksjNfgINeK8TE+79Hkbja1M42rKl17UPWxT07KqWpOfiiacwvy5hoKBA9BSQ1wgSBRAlVzqLPiCoArqgvilZ2ojKNVzJ8/9WPZM5dELRPEQ7ToNXr9kqA29jnUqycqOG4KPqXG98I61yYRBJ+jzHoNtivzZh5i1F9WJsB/GD6wmnmthY4dO7cIdEXy1xh3/6SREHwv9OI8BGgaLpzLDpzaP5pea15tDafkCOuG9s6aDfqW+3d2YecmaBDFKKkhhN/5bi4JjgrA9XywPvRQDZcecZi4qO4Q1AIVHNKF72IbsG47cT4m1dwvkQqrj/Wq32Dua0uuqvFycoiBg0KRwWKOI/Wrh2FL7YFUrF4V0UY2K3Hrg3Q0ia/NHM0SlbAQoUJrzRbd/pCK6OiUPWPEuRZE20MZOhp5IBinGTMC5X+OqPwnZS0X3CuY5JaCsCDYSZ5W5tv9GNXQw4cWZG5DBDQlwd3JQ4FQmG6fPlPY0JcTCO6YxDfoBZ96jV0sqKjxMdn1XuBxnxUzhT+vIPhmbFbIFQae0CjDMeP9Z9DZLUvcgtywRdyX1Cs2RzHohHz0TRjpKMEQ==
Content-ID: <98F12F510B769F4D9D13A2458EBB3BA1@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd69c842-bc65-46e6-062d-08d833509234
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 23:47:21.2250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnjBtG1Ce7jpuIFqWFdIyK+BYyRTlmpRNlThBNfhXyQlkhYN3Xt6uIqM5gKmPoJOUr44nsYBprPS9KajzwM8wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB5284
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IE9uIEp1bCAyNywgMjAyMCwgYXQgMTE6NDIgUE0sIERhdmUgQWlybGllIDxhaXJsaWVkQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPg0KPiANCj4gSnVzdCBkcm9wIHRoZSBhcmd1bWVudCBmcm9tIHRoaXMuDQo+IA0KPiBUaGlz
IGRvZXMgYXNrIHRoZSBxdWVzdGlvbiBpZiB0aGlzIGlzIHRoZSBmdW5jdGlvbiB2bXdnZngNCj4g
c2hvdWxkIGJlIHVzaW5nIG9yIHNob3VsZCBpdCBiZSBkb2luZyBhbiBldmljdCBhbGwgbGlrZQ0K
PiB0aGUgb3RoZXIgZHJpdmVycy4NCg0KWWVhLCBpdCByZWFsbHkgc2hvdWxkLiBUaGlzIGNvZGUg
aXMgcmVhbGx5IG9sZC4gT3ZlciB0aGUgbmV4dCB5ZWFyIHdl4oCZbGwgc3BlbmQgc29tZSB0aW1l
IG1ha2luZyBvdXIgZHJpdmVyIGEgbGl0dGxlIGxlc3Mgc3BlY2lhbCBzbyB0aGF0IHdlIGNhbiBt
YWtlIHRob3NlIHN5bWJvbHMgcHJpdmF0ZSBhZ2FpbiAod2XigJlsbCBoYXZlIHRvIHJlZXZhdWxh
dGUgd2hldGhlciB3ZSBzdGlsbCBuZWVkIHRoZSBwcml2YXRlIHR0bV9sb2NrIGNvZGUsIGJlY2F1
c2UgaWRlYWxseSB3ZeKAmWQgYnJpbmcgYWxsIG9mIHRoYXQgaW5saW5lIHdpdGggdGhlIG90aGVy
IGRyaXZlcnMpLg0KDQpGb3IgdGhlIHBhdGNoOg0KUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHph
Y2tyQHZtd2FyZS5jb20+DQoNCnoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
