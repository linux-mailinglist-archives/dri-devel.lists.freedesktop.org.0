Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D68BF0F3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 13:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7AF6EC28;
	Thu, 26 Sep 2019 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720048.outbound.protection.outlook.com [40.107.72.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FD06EC28
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 11:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP6zUoYF1h72hro4bo7JCSjNOFWMQ5pLrC2HcvDR4ypvjfXY54rUUC2CZBHR4SBlf1q3XQ26VcoK7xAAvLiZS1jHqVDKmAIfoHYO6+HZmG+u0UU/0ZRXXwho3xAaDi5ixN1S/2bxaNE4l5KLVagyKBTqlGqI8F/U9DOEWR4gkchBSF6TgOdTBdzHgveqUjFgaEVIRA1ylQCzR753CSpXgS+JhsOWh5muqrAQ23ie+xLZcDoWlEq+oU+c/NwzOlUvVTIIlMwCUMGiW7QL3G8VQCYR1A3mBLVw7u1n/y6+v/u7VguXOJ/ONKat4lOM/IM1vpsaJ+u9jqM5dtf1sqs5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vfF5kDvCWqpjmX9mvgJbCmPpYd5gx+VJbryw04glPA=;
 b=LqmYFPigqDSnFmZLt+gtRnalO+BT7/HYrCva05dx0T3R/qb2sYoqNK5Yx95cikJubjNrgPO+cAMCCwkI5NKowebaEhc9yGmr0Yi2M67xJlhaPe2GKurMc/JOI93hY61No9DMOGSpyArE6X4bUvUSPvwWwbS/d2/TO2aC+p+CHj2JuVyav2PniB6kvP4I3zHnWb0LOgDil0hZ4J5KDXadfStcJaw/QCRTGJS9GQGhH44kVYUQMff7GLskDy5+YEGA6R6YdoqCKk+rF2t+LFtjarh+3yZIjlltwh2Iq4MR99Vc+vaYxh/FNZmspexKVCAU0GtycV8MGRCrF0oJ5udRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1689.namprd12.prod.outlook.com (10.172.33.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 11:17:12 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 11:17:12 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Topic: [PATCH] drm: Don't free jobs in wait_event_interruptible()
Thread-Index: AQHVc7PzyGiUqz4Sx0azjxLt3Sgtwqc9irIAgAAspYCAABkYAA==
Date: Thu, 26 Sep 2019 11:17:12 +0000
Message-ID: <8a0a81d1-a797-f16d-d218-f0f207749185@amd.com>
References: <20190925151404.23222-1-steven.price@arm.com>
 <321e99c1-4ce8-e6e1-83c8-2df1c78acce3@amd.com>
 <bcdeda56-619d-cff1-7b62-12dd446c532e@arm.com>
In-Reply-To: <bcdeda56-619d-cff1-7b62-12dd446c532e@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2PR09CA0022.eurprd09.prod.outlook.com
 (2603:10a6:101:16::34) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d377a997-1d31-4d88-09dc-08d74273140a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1689; 
x-ms-traffictypediagnostic: DM5PR12MB1689:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1689718167A0AC307557FAC383860@DM5PR12MB1689.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(99286004)(66556008)(64756008)(66446008)(66946007)(229853002)(66476007)(256004)(8676002)(14444005)(81166006)(81156014)(31696002)(86362001)(54906003)(76176011)(4326008)(6116002)(486006)(8936002)(25786009)(186003)(6486002)(6436002)(71200400001)(71190400001)(46003)(476003)(65956001)(65806001)(36756003)(31686004)(14454004)(6512007)(2906002)(11346002)(446003)(2616005)(6246003)(58126008)(316002)(6506007)(386003)(305945005)(110136005)(5660300002)(102836004)(478600001)(53546011)(52116002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1689;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7Mt1ffT5t786q12wMwuCZikuxrXvSxBUnNkQYhoBhNIlB+IPYZDUO+dBIwSViJK1uPLDdF+/7hDm3OlShTmxVTEsmGx5XamgyyKSgV+1P3XEavbUPI6rB+NFep92YyMz/tTGu5CNpuQtgIgsnfdERuwl2JyF+KbF1McGzq3OeojkXwzgu+RoRepi/hUZN5ZiZn9htxKRVx7Hor/EP8CPu2EyRQ3SxuqgOj03PLncVRrUUY3sIuTg+/ZudJ8KDOVGXMZcv5tBfTVfmY0fZTq8D8y3cW/30nqDf/uYQe8jdpgbIiz676q5ev+Etk/D9XSz+pQBhWtS2wV1wSZaAeX+wxKiIK7I8DzZ4algQX8f5zq6sljiRbwfOcOpBev3HVK4v8PXuBESK0qKqTurv2UE/j1SijpZhQSR68aW6G/NH1g=
Content-ID: <72A1A59A6537A54686C414C68856E757@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d377a997-1d31-4d88-09dc-08d74273140a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 11:17:12.3937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yEswMEthI2ckf4UxehRbitehaFPhso9hOO1SgqbEJQgWB5nmtv3oM68HeACRic6J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1689
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vfF5kDvCWqpjmX9mvgJbCmPpYd5gx+VJbryw04glPA=;
 b=OJ9WnZXVxvo3pseI0ToeB3iYU72eTYxIdgZkhAPqkNvenNpvCCtTfKXSm7CftWjQgsIRc/GVbR37uGg4J+IaMNXXsYfU33uZ98Iw/3VnQgf2L7hDjpR4QuitP++Afi3MoI4xp+88GscyeiA/Sai27w88Gm6KSbeNTWb55+6fRuc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMDkuMTkgdW0gMTE6NDcgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IE9uIDI2LzA5LzIw
MTkgMDg6MDcsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjUuMDkuMTkgdW0gMTc6
MTQgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+Pj4gZHJtX3NjaGVkX2NsZWFudXBfam9icygpIGF0
dGVtcHRzIHRvIGZyZWUgZmluaXNoZWQgam9icywgaG93ZXZlciBiZWNhdXNlDQo+Pj4gaXQgaXMg
Y2FsbGVkIGFzIHRoZSBjb25kaXRpb24gb2Ygd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgaXQg
bXVzdCBub3QNCj4+PiBzbGVlcC4gVW5mb3J0dW5hdGVseSBzb21lIGZyZWUgY2FsbGJhY2tzIChu
b3RhYmx5IGZvciBQYW5mcm9zdCkgZG8gc2xlZXAuDQo+Pj4NCj4+PiBJbnN0ZWFkIGxldCdzIHJl
bmFtZSBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKCkgdG8NCj4+PiBkcm1fc2NoZWRfZ2V0X2NsZWFu
dXBfam9iKCkgYW5kIHNpbXBseSByZXR1cm4gYSBqb2IgZm9yIHByb2Nlc3NpbmcgaWYNCj4+PiB0
aGVyZSBpcyBvbmUuIFRoZSBjYWxsZXIgY2FuIHRoZW4gY2FsbCB0aGUgZnJlZV9qb2IoKSBjYWxs
YmFjayBvdXRzaWRlDQo+Pj4gdGhlIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSgpIHdoZXJlIHNs
ZWVwaW5nIGlzIHBvc3NpYmxlIGJlZm9yZQ0KPj4+IHJlLWNoZWNraW5nIGFuZCByZXR1cm5pbmcg
dG8gc2xlZXAgaWYgbmVjZXNzYXJ5Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFBy
aWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDQ0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
DQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygt
KQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+PiBpbmRl
eCA5YTBlZTc0ZDgyZGMuLjBlZDRhYWE0ZTZkMSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4gQEAgLTYyMiw0MyArNjIyLDQxIEBAIHN0YXRpYyB2
b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1h
X2ZlbmNlX2NiICpjYikNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gICAgLyoqDQo+Pj4gLSAqIGRy
bV9zY2hlZF9jbGVhbnVwX2pvYnMgLSBkZXN0cm95IGZpbmlzaGVkIGpvYnMNCj4+PiArICogZHJt
X3NjaGVkX2dldF9jbGVhbnVwX2pvYiAtIGZldGNoIHRoZSBuZXh0IGZpbmlzaGVkIGpvYiB0byBi
ZSBkZXN0cm95ZWQNCj4+PiAgICAgKg0KPj4+ICAgICAqIEBzY2hlZDogc2NoZWR1bGVyIGluc3Rh
bmNlDQo+Pj4gICAgICoNCj4+PiAtICogUmVtb3ZlIGFsbCBmaW5pc2hlZCBqb2JzIGZyb20gdGhl
IG1pcnJvciBsaXN0IGFuZCBkZXN0cm95IHRoZW0uDQo+Pj4gKyAqIFJldHVybnMgdGhlIG5leHQg
ZmluaXNoZWQgam9iIGZyb20gdGhlIG1pcnJvciBsaXN0IChpZiB0aGVyZSBpcyBvbmUpDQo+Pj4g
KyAqIHJlYWR5IGZvciBpdCB0byBiZSBkZXN0cm95ZWQuDQo+Pj4gICAgICovDQo+Pj4gLXN0YXRp
YyB2b2lkIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpz
Y2hlZCkNCj4+PiArc3RhdGljIHN0cnVjdCBkcm1fc2NoZWRfam9iICoNCj4+PiArZHJtX3NjaGVk
X2dldF9jbGVhbnVwX2pvYihzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4+ICAg
IHsNCj4+PiArCXN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IgPSBOVUxMOw0KPj4+ICAgIAl1bnNp
Z25lZCBsb25nIGZsYWdzOw0KPj4+ICAgIA0KPj4+ICAgIAkvKiBEb24ndCBkZXN0cm95IGpvYnMg
d2hpbGUgdGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcgKi8NCj4+PiAgICAJaWYgKHNjaGVk
LT50aW1lb3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1FT1VUICYmDQo+Pj4gICAgCSAgICAhY2FuY2Vs
X2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkNCj4+PiAtCQlyZXR1cm47DQo+Pj4gLQ0K
Pj4+IC0NCj4+PiAtCXdoaWxlICghbGlzdF9lbXB0eSgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3Qp
KSB7DQo+Pj4gLQkJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsNCj4+PiArCQlyZXR1cm4gTlVM
TDsNCj4+PiAgICANCj4+PiAtCQlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5KCZzY2hlZC0+cmluZ19t
aXJyb3JfbGlzdCwNCj4+PiArCWpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQt
PnJpbmdfbWlycm9yX2xpc3QsDQo+Pj4gICAgCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pv
Yiwgbm9kZSk7DQo+PiBUaGlzIGlzIHByb2JhYmx5IGJldHRlciBkb25lIGFmdGVyIHRha2luZyB0
aGUgbG9jaywgYXBhcnQgZnJvbSB0aGF0DQo+PiBsb29rcyBnb29kIHRvIG1lLg0KPiBJdCB3YXNu
J3QgcHJldmlvdXNseSBwcm90ZWN0ZWQgYnkgdGhlIGxvY2sgLSBidXQgSSBkb24ndCBzZWUgYW55
IGhhcm0gc28NCj4gSSdsbCBwb3N0IGEgdjIuDQoNCkNhbGxpbmcgbGlzdF9lbXB0eSB3aXRob3V0
IHRoZSBsb2NrIGlzIGhhcm1sZXNzLCBidXQgaWYgeW91IHJldHVybiB0aGUgDQplbnRyeSB3aXRo
IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCB5b3UgcmF0aGVyIHdhbnQgdGhlIG1lbW9yeSBiYXJy
aWVyLg0KDQpJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSB3ZSBjb3VsZCBhY3R1YWxseSBnZXQgYXdh
eSB3aXRoIGl0IGJlY2F1c2UgdGhlIA0Kb25seSBvdGhlciBhY3RvciByZW1vdmluZyBlbnRyaWVz
IGlzIHRoZSB0aW1lb3V0IGhhbmRsaW5nIGFuZCB0aGF0IHdhcyANCmNhbmNlbGVkIGEgZmV3IGxp
bmVzIGFib3ZlLg0KDQpCdXQgYmV0dGVyIHNhdmUgdGhhbiBzb3JyeSBzaG91bGQgYW55Ym9keSBk
ZWNpZGUgdG8gbW9kaWZ5IHRoZSBjb2RlIGFnYWluLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0K
DQo+DQo+IFN0ZXZlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
