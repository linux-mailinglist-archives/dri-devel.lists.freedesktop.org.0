Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8BAA209
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 13:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673789F53;
	Thu,  5 Sep 2019 11:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790042.outbound.protection.outlook.com [40.107.79.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD4289F53
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 11:54:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqx1UV76iK5o9g+kCHLnT2wgpyqs4LPnIX/CVlhzuvem/lDss87dtXDXuF8cGv72yn/dePwc7qPo0Tr7sU2+emp2vwCpXh8OZa47nomgjih+2VmDHztQIXFqzE5+2mK5KIJf9lCBiXYofK1LNCsVvGnHGD4DOR+UYOqb5bvqK5YgK3/uHkHtJnjhMnKvN/PSA3m3uBQqaZLLS+8g0x9X/Prbm06WjttZQXj8A6jXOBcUBOkKJ2vPiLp7CE3aCu7Oi82V9LpQ+iKsy5QrmukbMI/7GIyfGmMl4wHyWn+f93v7EZM346o9qR7waCybq2EOCVOAgzl17gUaDwlanlnyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZEp0HFQ6BLNzJ436lZ+H1Aohse7hxCKIhcVEoPc5QE=;
 b=hegd4fwAs46uX6NVin7aHfqiyDBWEzUyGQnc61dkQK0kMgkSftHUlbtJ70fHfmnkNM3Cwogj6GFOeQzSN/MB0IjP6aL645tPG6+8CZUmUmPdMyEusiSSwxg5C4ngFqPdwfwuzZcCogVyn8lEn7/jzd45FS7uj+L4FkxfU8VQKQ6ykKpVcb9FdRG9ENohygPb1HeZoJ1CgCtkzEDoGbt+bAB6NX8I/4rqGvhNt+OiWxMadd0t6yGn5Tjw6/4KfsQdZyEN+yMxb1u0LZj6ocIzvndSnLySqXnDgGzlCd1IeCRZpnT0cPGXtTOTH1cUWwruU3wS/O8cYujHSnfogblYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6143.namprd05.prod.outlook.com (20.178.244.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.4; Thu, 5 Sep 2019 11:54:47 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977%2]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 11:54:46 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "colin.king@canonical.com" <colin.king@canonical.com>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix double free in vmw_recv_msg()
Thread-Topic: [PATCH] drm/vmwgfx: Fix double free in vmw_recv_msg()
Thread-Index: AQHVU0PQkTqRNIUlckSPpJbkwjPDv6b74yUAgCE3voA=
Date: Thu, 5 Sep 2019 11:54:46 +0000
Message-ID: <830c68e5591dd197e098028227148106739e5591.camel@vmware.com>
References: <20190815083050.GC27238@mwanda>
 <08f19935-97fe-4c8b-ca7b-707586ed89a1@canonical.com>
In-Reply-To: <08f19935-97fe-4c8b-ca7b-707586ed89a1@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a3bb59c-dfd1-4728-063b-08d731f7d961
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR05MB6143; 
x-ms-traffictypediagnostic: MN2PR05MB6143:|MN2PR05MB6143:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6143A59F49C682BBD08CFC12A1BB0@MN2PR05MB6143.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(199004)(189003)(26005)(118296001)(81156014)(6116002)(71190400001)(71200400001)(8676002)(316002)(102836004)(81166006)(478600001)(86362001)(3846002)(25786009)(6506007)(256004)(66066001)(76116006)(91956017)(6636002)(2906002)(66476007)(476003)(66946007)(53546011)(11346002)(6512007)(66556008)(14454004)(446003)(64756008)(6436002)(66446008)(4326008)(6486002)(186003)(2501003)(54906003)(229853002)(6246003)(5660300002)(8936002)(36756003)(305945005)(486006)(110136005)(2616005)(7736002)(99286004)(53936002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6143;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YMmoPIADNER+DnpYiA/yfsI9A7PK8YeCQUKtum2fmOzeWRpFNWXdmi3KX+kiY4bBV2zr0BTU7Ai0q5Fr47EwELGobeiS4RpiJN6dOrnKkj7gSBLqoTLdLb2y+f2C/me7nZfCjtdikK3VoERROAIkkpMinrV9qlIyVgqok+G9SOBacvQ2gYtwIOyC2UDFMgfyUG4g0Lz1L69cdDMGYudXvIqNs1BA9HGFMSKMGXAb2bpDM9o2bRTOg/sDcgEhpUXlnsNoXbVgsTnUbkZmnkpEg+Hq0104zMxUwNKoHeUmg5ZMInccHU+hfHJOdZs1Ib8B2O2x0QSPFX2MHuoFBIcUF6XTw54wVNQlBmA5tXHUYlXyKzR3XUwvpNYtD8qPQdRo1ZRID8I0rslFxEbbWuuGvlRSu+I0/HvtLf00HJoNzbg=
Content-ID: <AA51AFC9B7C36441B8DE00A3BA11FC96@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3bb59c-dfd1-4728-063b-08d731f7d961
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 11:54:46.8792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLlUxf/DLovRQg1HZnUdFFF7vvknZtOq7EWUVNMM85TCQ0OZ9mzPyDEg9P90/vgaZQdC/y+sxRGjgKlpba+2pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZEp0HFQ6BLNzJ436lZ+H1Aohse7hxCKIhcVEoPc5QE=;
 b=0gu0zwfz/ZNiaDKMIKglnRs0VXnfLGTOEpoHAhggPx1hAAb7ZDtiZPHvSCgLz6KA1acetExh7JHnf8jzT3OeRe8T7j0a+63/jHRTEnJ6Eg087UVwzeetInQVw2ghk5rT6cJ4dUbiGBi2NfTO0q4k8hZZfHGrIWZCP03PnZ6r0uM=
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
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA4LTE1IGF0IDA5OjM4ICswMTAwLCBDb2xpbiBJYW4gS2luZyB3cm90ZToN
Cj4gT24gMTUvMDgvMjAxOSAwOTozMCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gPiBXZSByZWNl
bnRseSBhZGRlZCBhIGtmcmVlKCkgYWZ0ZXIgdGhlIGVuZCBvZiB0aGUgbG9vcDoNCj4gPiANCj4g
PiAJaWYgKHJldHJpZXMgPT0gUkVUUklFUykgew0KPiA+IAkJa2ZyZWUocmVwbHkpOw0KPiA+IAkJ
cmV0dXJuIC1FSU5WQUw7DQo+ID4gCX0NCj4gPiANCj4gPiBUaGVyZSBhcmUgdHdvIHByb2JsZW1z
LiAgRmlyc3QgdGhlIHRlc3QgaXMgd3JvbmcgYW5kIGJlY2F1c2UNCj4gPiByZXRyaWVzDQo+ID4g
ZXF1YWxzIFJFVFJJRVMgaWYgd2Ugc3VjY2VlZCBvbiB0aGUgbGFzdCBpdGVyYXRpb24gdGhyb3Vn
aCB0aGUNCj4gPiBsb29wLg0KPiA+IFNlY29uZCBpZiB3ZSBmYWlsIG9uIHRoZSBsYXN0IGl0ZXJh
dGlvbiB0aHJvdWdoIHRoZSBsb29wIHRoZW4gdGhlDQo+ID4ga2ZyZWUNCj4gPiBpcyBhIGRvdWJs
ZSBmcmVlLg0KPiA+IA0KPiA+IFdoZW4geW91J3JlIHJlYWRpbmcgdGhpcyBjb2RlLCBwbGVhc2Ug
bm90ZSB0aGUgYnJlYWsgc3RhdGVtZW50IGF0DQo+ID4gdGhlDQo+ID4gZW5kIG9mIHRoZSB3aGls
ZSBsb29wLiAgVGhpcyBwYXRjaCBjaGFuZ2VzIHRoZSBsb29wIHNvIHRoYXQgaWYgaXQncw0KPiA+
IG5vdA0KPiA+IHN1Y2Nlc3NmdWwgdGhlbiAicmVwbHkiIGlzIE5VTEwgYW5kIHdlIGNhbiB0ZXN0
IGZvciB0aGF0IGFmdGVyd2FyZC4NCj4gPiANCj4gPiBGaXhlczogNmI3YzNiODZmMGI2ICgiZHJt
L3Ztd2dmeDogZml4IG1lbW9yeSBsZWFrIHdoZW4gdG9vIG1hbnkNCj4gPiByZXRyaWVzIGhhdmUg
b2NjdXJyZWQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfbXNnLmMgfCA4ICsrKy0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X21zZy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9tc2cuYw0KPiA+IGluZGV4IDU5ZTlkMDVhYjkyOC4uMGFmMDQ4ZDFhODE1IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNnLmMNCj4gPiBAQCAtMzUzLDcgKzM1Myw3IEBA
IHN0YXRpYyBpbnQgdm13X3JlY3ZfbXNnKHN0cnVjdCBycGNfY2hhbm5lbA0KPiA+ICpjaGFubmVs
LCB2b2lkICoqbXNnLA0KPiA+ICAJCQkJICAgICAhIShISUdIX1dPUkQoZWN4KSAmDQo+ID4gTUVT
U0FHRV9TVEFUVVNfSEIpKTsNCj4gPiAgCQlpZiAoKEhJR0hfV09SRChlYngpICYgTUVTU0FHRV9T
VEFUVVNfU1VDQ0VTUykgPT0gMCkgew0KPiA+ICAJCQlrZnJlZShyZXBseSk7DQo+ID4gLQ0KPiA+
ICsJCQlyZXBseSA9IE5VTEw7DQo+ID4gIAkJCWlmICgoSElHSF9XT1JEKGVieCkgJiBNRVNTQUdF
X1NUQVRVU19DUFQpICE9IDApDQo+ID4gew0KPiA+ICAJCQkJLyogQSBjaGVja3BvaW50IG9jY3Vy
cmVkLiBSZXRyeS4gKi8NCj4gPiAgCQkJCWNvbnRpbnVlOw0KPiA+IEBAIC0zNzcsNyArMzc3LDcg
QEAgc3RhdGljIGludCB2bXdfcmVjdl9tc2coc3RydWN0IHJwY19jaGFubmVsDQo+ID4gKmNoYW5u
ZWwsIHZvaWQgKiptc2csDQo+ID4gIA0KPiA+ICAJCWlmICgoSElHSF9XT1JEKGVjeCkgJiBNRVNT
QUdFX1NUQVRVU19TVUNDRVNTKSA9PSAwKSB7DQo+ID4gIAkJCWtmcmVlKHJlcGx5KTsNCj4gPiAt
DQo+ID4gKwkJCXJlcGx5ID0gTlVMTDsNCj4gPiAgCQkJaWYgKChISUdIX1dPUkQoZWN4KSAmIE1F
U1NBR0VfU1RBVFVTX0NQVCkgIT0gMCkNCj4gPiB7DQo+ID4gIAkJCQkvKiBBIGNoZWNrcG9pbnQg
b2NjdXJyZWQuIFJldHJ5LiAqLw0KPiA+ICAJCQkJY29udGludWU7DQo+ID4gQEAgLTM4OSwxMCAr
Mzg5LDggQEAgc3RhdGljIGludCB2bXdfcmVjdl9tc2coc3RydWN0IHJwY19jaGFubmVsDQo+ID4g
KmNoYW5uZWwsIHZvaWQgKiptc2csDQo+ID4gIAkJYnJlYWs7DQo+ID4gIAl9DQo+ID4gIA0KPiA+
IC0JaWYgKHJldHJpZXMgPT0gUkVUUklFUykgew0KPiA+IC0JCWtmcmVlKHJlcGx5KTsNCj4gPiAr
CWlmICghcmVwbHkpDQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gLQl9DQo+ID4gIA0KPiA+
ICAJKm1zZ19sZW4gPSByZXBseV9sZW47DQo+ID4gIAkqbXNnICAgICA9IHJlcGx5Ow0KPiA+IA0K
PiANCj4gRGFuLCBUaGFua3MgZm9yIGZpeGluZyB1cCBteSBtaXN0YWtlLg0KDQpUaGFua3MsIERh
bi4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiANClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0
csO2bSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KV2lsbCBwdXNoIHRoaXMgdG8gZml4ZXMuDQoN
Ci9UaG9tYXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
