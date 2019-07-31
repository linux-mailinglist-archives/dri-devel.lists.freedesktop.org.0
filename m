Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BAF7C32F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29DE89DFE;
	Wed, 31 Jul 2019 13:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C03E89DFE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYUENCu4qrwThoMPAd+n4dyJPsIPhu0x4VDZyHiIkBOtqgZ1WnezgMXNjNLQ7CIgDdZWFBKYs3PG7Et8BkIB7psEGqq+oqOi66wN7wvKrhuo8Zxt5/SfJHKhvJ5VmsCGCMVN3XLAIifEL48LT6jdGQfoaHPiTQSnPMAGDJ8KJnQ8ePR4pXWHS8hShcn4Ai+vino6PsJhPhGCmCIxCZW4Wg6wAKbJZcaMrmDGcr+VQ8uAtoV609wZK2gUMPHxo+tn2Q8uKg2nKALXhTHCCsIMVBxVLUKussHtepP7PfI5z84Mp5331W3HObg88TX7XBlxX9NaU2LSb2pBEP/2Yev3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuSkLlpTjoAAw3ygeWNyh42L9mDiLoQVEwylkEU2t3Y=;
 b=NKqJaOFd/pehwRte4gPoO0sogMWCGtuwLMWUEBHJQy0EF4B43/a/muVgLALk4YNBlJooQ4qIAexim0YWhAM62V7c8wqpPKeCNfHGo39MtlCE5lBR0BGxgv7o6RW/Yr92e3bV70yCR52whiginkxgQkUbb6kCIjBsC5Sk2LeZ3P+zIvY2YLzWQ3WTTPq7bMRBB1DDRrCe04DnSpMJDBv1y0hMfbPENk3X87qpYqjYOe05vwBOqSA8PE1mLb6fFRd7I2HuWAy94UyBwzLhNgIuGVKKpvk6lhdTADyQgfA77Ff3MxoXuNyGlVXPFrZCirn9OqGQ61OP7Un8V6mPH2XJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB3662.eurprd08.prod.outlook.com (20.177.61.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 13:20:04 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::6d04:e478:d795:5d80%4]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:20:05 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/KbU4UCRFzvkaBT5qon3yv66bktjIA
Date: Wed, 31 Jul 2019 13:20:04 +0000
Message-ID: <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cfb4053-22b1-4a38-2cc8-08d715b9ccad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB3662; 
x-ms-traffictypediagnostic: VI1PR08MB3662:
x-microsoft-antispam-prvs: <VI1PR08MB3662CD7184680ED022D69040F0DF0@VI1PR08MB3662.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(199004)(189003)(2906002)(71190400001)(386003)(86362001)(5660300002)(14454004)(6862004)(9686003)(102836004)(6116002)(99286004)(71200400001)(6512007)(76176011)(6246003)(6506007)(3846002)(478600001)(7736002)(53936002)(1076003)(305945005)(66476007)(25786009)(256004)(66556008)(52116002)(58126008)(4326008)(66946007)(81166006)(186003)(446003)(6436002)(316002)(476003)(11346002)(486006)(81156014)(26005)(6636002)(8676002)(8936002)(54906003)(7416002)(64756008)(66066001)(66446008)(68736007)(44832011)(6486002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3662;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Sf77PoeWBWTi5+b8IEhz9XsbqluOZ6jcxWEbbm3K2/SBqe5YxzCxWPjBz1bQx8nk1wIDnUUg9BNMYl5wDTKLxu76j3mf7lvqb/R+ECl0XUWULzpYS1lsjKytljrFOs/XHd+x3w/XtwmQOOtZkcfprZgEYCA9sBszZwMQqnUA5b/cYYkyej7Hxx2nX3Q8qKYWiVl1Ugsoe2UKOHavO/2XNRb+Z1/Rr1ZMfvBdHVkTaN/i3ODZ+DjVWK+CwKV/x0ZDJCKFFYlFTTPRRXIZmh7Bb53cm28gL+0f7AkIdc0NYzkyJKsDTaCZHAPm0S7cMs1+L1jN2RNSr4WL3N1t7DjGkpp4a0n2wCNivBWE9rVltQw/Wnx0jQpQJeOpxc5xShmL6e13CKxVWYtQQqyebDjSFeCFG5HOHeb3zexnVcqrpug=
Content-ID: <30B2B0A32DF9114B91949B555FBBCC60@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfb4053-22b1-4a38-2cc8-08d715b9ccad
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:20:04.5237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuSkLlpTjoAAw3ygeWNyh42L9mDiLoQVEwylkEU2t3Y=;
 b=b+pstyLyDIC6x5SQD1k0FPbHyu94QySZtunMP7iQjVMkcfT8hQKXOaYz0F3T5xVNQUyVAIAp1dogOqTlxyTQ+vrQAtheWog4BfXrziOL79C2ZAZ+zyJqhMsK9IkdtFFtWRyqoKlB97hW+gRiRdwSumqyrBVGw+g6MiRE4XPxBK0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTG93cnksCgpUaGFua3MgZm9yIHRoaXMgY2xlYW51cC4KCk9uIFdlZCwgSnVsIDMxLCAyMDE5
IGF0IDExOjA0OjQ1QU0gKzAwMDAsIExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3Jv
dGU6Cj4gRHVyaW5nIGl0IHNpZ25hbHMgdGhlIGNvbXBsZXRpb24gb2YgYSB3cml0ZWJhY2sgam9i
LCBhZnRlciByZWxlYXNpbmcKPiB0aGUgb3V0X2ZlbmNlLCB3ZSdkIGNsZWFyIHRoZSBwb2ludGVy
Lgo+IAo+IENoZWNrIGlmIGZlbmNlIGxlZnQgb3ZlciBpbiBkcm1fd3JpdGViYWNrX2NsZWFudXBf
am9iKCksIHJlbGVhc2UgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV93cml0ZWJhY2suYyB8IDIzICsrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV93
cml0ZWJhY2suYwo+IGluZGV4IGZmMTM4YjYuLjQzZDllM2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV93cml0ZWJhY2suYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3Jp
dGViYWNrLmMKPiBAQCAtMzI0LDYgKzMyNCw5IEBAIHZvaWQgZHJtX3dyaXRlYmFja19jbGVhbnVw
X2pvYihzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpvYikKPiAgCWlmIChqb2ItPmZiKQo+ICAJ
CWRybV9mcmFtZWJ1ZmZlcl9wdXQoam9iLT5mYik7Cj4gIAo+ICsJaWYgKGpvYi0+b3V0X2ZlbmNl
KQoKSSdtIHRoaW5raW5nIGl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIHNpZ25hbCB0aGUgZmVu
Y2Ugd2l0aCBhbiBlcnJvcgpoZXJlLCBpZiBpdCdzIG5vdCBhbHJlYWR5IHNpZ25hbGVkLiBPdGhl
cndpc2UsIGlmIHRoZXJlJ3Mgc29tZW9uZQp3YWl0aW5nICh3aGljaCB0aGVyZSBzaG91bGRuJ3Qg
YmUpLCB0aGV5J3JlIGdvaW5nIHRvIGJlIHdhaXRpbmcgYSB2ZXJ5CmxvbmcgdGltZSA6LSkKClRo
YW5rcywKLUJyaWFuCgo+ICsJCWRtYV9mZW5jZV9wdXQoam9iLT5vdXRfZmVuY2UpOwo+ICsKPiAg
CWtmcmVlKGpvYik7Cj4gIH0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
