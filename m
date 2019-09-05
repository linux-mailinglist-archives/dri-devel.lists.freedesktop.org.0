Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46D2A9D06
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 10:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F0489E52;
	Thu,  5 Sep 2019 08:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710084.outbound.protection.outlook.com [40.107.71.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9D89E52
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 08:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjLlF8nxyJcG0NFu69RYNQ3YN8Y5wnXztnaCVocDt80ndh9/10BtZnAarzN57ClwuLHe0wVLcc2hD/CQb2mLsqEtBFRKnfcaRjfJItj8vb0+8Rd9okfF5vh/G1wykqwHYKgOviVwZUo3ddS8eHChQZyMyDuN8kuwE5Q6xb16hguCyDaQ/P8vgNIEEJtX/26lBfD9wHqoRdfQ5ZHTE421wHDK1RD76qrBWKQNPykB234U1qb+KLaWzCc+lqGjpniVJWIQTiWAPPFKn4EbbNHaWTTW72ydnLYu/GTqu4d/za0qZk/XayQZVGVp6QUMQ1qcUbgaG1KT7DEKJQfMmEYAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN0F9LC//C5AqpUXrHAat6iEGCbVmUfLzFdi+20uv1Y=;
 b=a+RK9KVHVlAuavHlZN80Nl6VBuMMaOaclOPyEgg8VrrZ0RZLCT+iMmkxxoi42+dkfa+BtattldcwT4gtDgRERhvGjfzDGQFixIgi5P5IUc4joCqQkc2T6R5xu4bRYk73v41YIgPg0C/gZjIGm9fBsEx6Q8LQsViE2z2UYkaysX0HAZE76lyLDCKWOhTrBcRYFh+E0WzjepQKn0hP5ATqFbP40+WwndCsH+b6CmZL1TMDF3OSgz6Wnl5eKs+MaBoh/Pvw1LadxG7GehnQ3ystnQ85KaWrwhZ+KJHRkYyH1fhchxvq7gjnU7712nDRFNxv32nnJvvxcpid+E3RisfTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB5983.namprd05.prod.outlook.com (20.178.242.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.9; Thu, 5 Sep 2019 08:31:35 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977%2]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 08:31:35 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/vmwgfx: switch to own vma manager
Thread-Topic: [PATCH 7/8] drm/vmwgfx: switch to own vma manager
Thread-Index: AQHVY7hITjmgdv9rNUmfS2SrzzLmoKccwTSA
Date: Thu, 5 Sep 2019 08:31:34 +0000
Message-ID: <8bec5487c9d698d35297033fe48f6bbd6ad98466.camel@vmware.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
 <20190905070509.22407-8-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-8-kraxel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff3f4271-3f05-450d-4db0-08d731db76a3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR05MB5983; 
x-ms-traffictypediagnostic: MN2PR05MB5983:|MN2PR05MB5983:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB5983DC24ED7ECBB6EFBC0215A1BB0@MN2PR05MB5983.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(199004)(189003)(476003)(229853002)(8936002)(6246003)(2616005)(2501003)(53936002)(8676002)(81166006)(2906002)(66556008)(91956017)(6506007)(66946007)(76116006)(66476007)(64756008)(66446008)(81156014)(316002)(14454004)(11346002)(76176011)(66066001)(486006)(14444005)(446003)(71200400001)(25786009)(256004)(71190400001)(26005)(4326008)(118296001)(7736002)(186003)(36756003)(6512007)(5660300002)(6436002)(3846002)(6116002)(110136005)(478600001)(99286004)(4744005)(305945005)(6486002)(66574012)(102836004)(86362001)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB5983;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xyt7bQxCrNo7QtlCRyOZJGhY9DlbWFroE7ACGVOpXENcbUkjWpJKlO2Noex7oH7tfAE6SXwc5VmQU5QMCQ7BJ4CrJVkYGKkKDiEXUgT3qzEYK0/3C4JKn5wZ/KyC1aF3ocxHG2mDRnrvQ91pg6U/pxbiZU/d+iV3Y47RZfgpBL/ZzpWMUW7VTNzr73WimoMsQfdxgu2lc11lg6BgOI8/slg1Td6CpqwyaOjsWm0e9MhP/ytMoFh5AE/hmcuxiS/tL+Ci11fKtxrVHtfu+Ug8RtQ2pE+TcRsDshMPLWU/NeCCNTBtAxcdxObFTJ7vV3jDzE7kKTS8CWcYpDSbT3an7DqkGXC9gEZej3WAJhpzkbPJgl82E8FLUHsBDNZRTKfoPouFlUGkywwr07q+LH4QCmz/OGXNsdeqOezGNjKUIOc=
Content-ID: <AA9B3F7F10387042AC46847EA4E18C29@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3f4271-3f05-450d-4db0-08d731db76a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 08:31:35.2618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: seUVy98Wl7NRWCMNOJgDio3lbro8DbOYsx8AR+657fYWB89wusMtnb9buc4+t7MWvcbCg5/Wh0HlbbRB7cKGxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB5983
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN0F9LC//C5AqpUXrHAat6iEGCbVmUfLzFdi+20uv1Y=;
 b=EXZcXXJ3sDMHM7eHtiW719frWQxm0vsFH13F9w30Z5bjTeU2TdnenOfX31iOU89eocBzDJd6jYONHvfPJmYTmJ0xLF6AHlVqReZme5dGCmJZO8amIU1BXX/2Jc+i+ZCc6kq/p2gGk1P71Yz0HYctjjlE/vPLhF8lFrgx41tgJyI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA5LTA1IGF0IDA5OjA1ICswMjAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOg0K
PiBBZGQgc3RydWN0IGRybV92bWFfb2Zmc2V0X21hbmFnZXIgdG8gdm1hX3ByaXZhdGUsIGluaXRp
YWxpemUgaXQgYW5kDQo+IHBhc3MgaXQgdG8gdHRtX2JvX2RldmljZV9pbml0KCkuDQo+IA0KPiBX
aXRoIHRoaXMgaW4gcGxhY2UgdGhlIGxhc3QgdXNlciBvZiB0dG0ncyBlbWJlZGRlZCB2bWEgb2Zm
c2V0IG1hbmFnZXINCj4gaXMgZ29uZSBhbmQgd2UgY2FuIHJlbW92ZSBpdCAoaW4gYSBzZXBhcmF0
ZSBwYXRjaCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCB8
IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCA2ICsrKysrLQ0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IA0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRoZWxsc3Ryb21Adm13YXJlLmNv
bT4NCg0KSSBhc3N1bWUgdGhpcyB3aWxsIGJlIG1lcmdlZCB0aHJvdWdoIGRybS1taXNjPw0KDQov
VGhvbWFzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
