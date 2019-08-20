Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FDC96484
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 17:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156D86E831;
	Tue, 20 Aug 2019 15:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697946E82F;
 Tue, 20 Aug 2019 15:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmpftBAPxw5GHWtdavxQhc+wycxRSRG2TCKdYgHUHDrwJoZGpYB5T4a70rWOz8aL/yr6bhfOkPfFvsdLCsbSiI7+kZ1XpwwqOPd/wRhoNzYms6fZydpVU6uK7dWF/GvSy0zzwyZaWXBM0CqvRfm3aNnkzQtOypiP3IewBIy/wC05YsJFno3DrjI1oGxKJUUU2xqfO24o+9pfzRwBCQ118vvmX4zJsq1d4ubcRQ8ZCABfDmtNVVbDV1/dLsFoRjioecKAB4oA0DWBB6w/JqPNmEEqc16MQpTSXm6qcBl3l1Hn0QDUohXccAQcgtm3I3DxJuoK8rufyfMGlUhObXaBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR/3h1KP1ESaBLRB2XD27iSzaEJA9BUAZETp0tId5sE=;
 b=JQOql7cJO1PBqxJyDkdS0gmibU6wgjqZI/60CI6RgsnxmpikRiZP6js8WMToKeJV4QJc94NbmeI/QqpUG0tYiE5+qe1I4cFqsfjQPri9iLQaQhJolQDJs43TQgmzSVCJ4zmP8ZknEkgRK9dFVcAVzHGBaCuEJR0YtNunobsPPlk/8RfH30gmUPAGX981u24RRj5+cmQRVl6pQULTf72ZD22bphO1vDUK0hLnTdxLPEZ1D2D+/t5rGVrVuFpe/XzSwoxLv9VAantu/XWQLezEtYukKR2i86tCCkKZI2qzX5snok0reXLOjJsYxWC8jXDnu0gtqizXV/OhJXsBd5kaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1929.namprd12.prod.outlook.com (10.175.85.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 15:34:02 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:34:02 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Topic: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Index: AQHVV2cW/tKRttrRtkmgCalTUTQrEacEJaiAgAABZoCAAAN/AA==
Date: Tue, 20 Aug 2019 15:34:02 +0000
Message-ID: <be8f3cda-6788-d424-0135-cb232432fad7@amd.com>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
 <38dc4dfe-88f4-ec16-b075-4bd0566c117d@amd.com>
 <CAKMK7uEgdViPJgs4Y32DwrC8-yGpPU+G=zq-T9tgnQeVOkG6mg@mail.gmail.com>
In-Reply-To: <CAKMK7uEgdViPJgs4Y32DwrC8-yGpPU+G=zq-T9tgnQeVOkG6mg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MRXP264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::34) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcdf3df1-81cc-434c-1c23-08d72583d3f8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1929; 
x-ms-traffictypediagnostic: DM5PR12MB1929:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB192926264B2EE7A3D764465383AB0@DM5PR12MB1929.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(6916009)(65956001)(65806001)(66946007)(66476007)(66556008)(316002)(58126008)(6116002)(64756008)(66446008)(81166006)(81156014)(8936002)(31696002)(186003)(66574012)(36756003)(102836004)(46003)(305945005)(7736002)(65826007)(8676002)(6246003)(4326008)(2906002)(53546011)(6506007)(386003)(25786009)(476003)(2616005)(446003)(486006)(5660300002)(53936002)(6486002)(64126003)(71200400001)(71190400001)(229853002)(31686004)(99286004)(6512007)(14444005)(76176011)(478600001)(14454004)(86362001)(11346002)(256004)(52116002)(54906003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1929;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SLp2PP/25+cqPloBAYv7Bxn+jQQJumLm4st0Z+ef0UXiZK+bF9uZNxEDov3+0MlJzgpqZ9Y0Ba/pHcZbP1vFZtY4H9uNAhfxVxuxQtAyk0epZ9fFMHaToXh5DZr2dUEbtvQwEJ7McD9vMVAr2hhGCN/qs41papthdHsAc776bwR1BPidl+V44UhiRdJDB3Oq0hgeF/5NqvduqVdLu/xrb3kl+Er+lwGm7F+9K3rMd4awyJIWzqmLZofXtUB2mjUC6XUI7VRFKiQhG4Sc7onXLBmwuLAz7rqZyIeAe9gSa/CrSDHTEwXop/9LSOl9hYUy198pNQHE3GGCs9It1l71+pv6OMLuMYisUjoRgzk0/YYGTa9UdPT1IgH9VLg5zIzNJrUWS/wJlOzLFn8nw8k4RDc4FgYv31Qv5NrXpH2Syh8=
Content-ID: <B1E589DF5154364BAA438F6CDD39692D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdf3df1-81cc-434c-1c23-08d72583d3f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 15:34:02.5079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Lilrf/dydrUBil1SeNxJ5zmCjT/GMbWUG9iG7MDMJXOij7gVjTsd+M+RwUHW1ON
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR/3h1KP1ESaBLRB2XD27iSzaEJA9BUAZETp0tId5sE=;
 b=ehE1sXSrSD7kq8GpSNVPOndSkTJpFhYaQ4GcoqYKMXJieaMUspce6Hm5JXF2uE2BYJiZGsdnkr3ZVj6ic4YPDH3b7/YNXFeF0ZZHjZScG/Grj/7EA7eK5gSdykEraq2UPUx1AK0/r28jQldBodpeFe7XZEWrcqDSwSjnq1mKAbw=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDguMTkgdW0gMTc6MjEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUdWUsIEF1
ZyAyMCwgMjAxOSBhdCA1OjE2IFBNIEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+IHdyb3RlOg0KPj4gQW0gMjAuMDguMTkgdW0gMTY6NTMgc2NocmllYiBEYW5p
ZWwgVmV0dGVyOg0KPj4+IFdpdGggbm91dmVhdSBmaXhlZCBhbGwgdHRtLXVzaW5nIGRyaXZlcyBo
YXZlIHRoZSBjb3JyZWN0IG5lc3Rpbmcgb2YNCj4+PiBtbWFwX3NlbSB2cyBkbWFfcmVzdiwgYW5k
IHdlIGNhbiBqdXN0IGxvY2sgdGhlIGJ1ZmZlci4NCj4+Pg0KPj4+IEFzc3VtaW5nIEkgZGlkbid0
IHNjcmV3IHVwIGFueXRoaW5nIHdpdGggbXkgYXVkaXQgb2YgY291cnNlLg0KPj4+DQo+Pj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+Pj4g
Q2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+PiBDYzog
SHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+PiBDYzogR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+DQo+Pj4gQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFwaGlj
cy1tYWludGFpbmVyQHZtd2FyZS5jb20+DQo+Pj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxs
c3Ryb21Adm13YXJlLmNvbT4NCj4+IFllcywgcGxlYXNlLiBCdXQgb25lIG1vcmUgcG9pbnQ6IHlv
dSBjYW4gbm93IHJlbW92ZSBiby0+d3VfbXV0ZXggYXMgd2VsbCENCj4gQWggcmlnaHQgdG90YWxs
eSBmb3Jnb3QgYWJvdXQgdGhhdCBpbiBteSBlbnRodXNpYXNtIGFmdGVyIGFsbCB0aGUNCj4gYXVk
aXRpbmcgYW5kIGZpeGluZyBub3V2ZWF1Lg0KPg0KPj4gQXBhcnQgZnJvbSB0aGF0IFJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFRoYW5r
cywgSSBhbHJlYWR5IHJlc3B1biB0aGUgcGF0Y2hlcywgc28gd2lsbCBiZSBpbiB0aGUgbmV4dCB2
ZXJzaW9uLg0KPiBDYW4geW91IHBscyBhbHNvIGdpdmUgdGhpcyBhIHNwaW4gb24gdGhlIGFtZGdw
dSBDSSwganVzdCB0byBtYWtlIHN1cmUNCj4gaXQncyBhbGwgZmluZT8gV2l0aCBmdWxsIGxvY2tk
ZXAgb2ZjLiBBbmQgdGhlbiByZXBseSB3aXRoIGEgdC1iLg0KDQpJIGNhbiBhc2sgZm9yIHRoaXMg
b24gb3VyIGNhbGwgdG9tb3Jyb3csIGJ1dCBJIGZlYXIgb3VyIENJIA0KaW5mcmFzdHJ1Y3R1cmUg
aXMgbm90IHJlYWR5IHlldC4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IFRoYW5rcywgRGFuaWVsDQo+
Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8IDM0IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3ZtLmMgfCAyNiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gICAgaW5jbHVk
ZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICB8ICAxIC0NCj4+PiAgICAzIGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA2MCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Yw0KPj4+IGluZGV4IDIwZmY1NmYyN2FhNC4uYTk1MmRkNjI0YjA2IDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jDQo+Pj4gQEAgLTE5NTQsMzcgKzE5NTQsMyBAQCB2b2lkIHR0bV9ib19zd2Fw
b3V0X2FsbChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikNCj4+PiAgICAgICAgICAgICAgICA7
DQo+Pj4gICAgfQ0KPj4+ICAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX3N3YXBvdXRfYWxsKTsNCj4+
PiAtDQo+Pj4gLS8qKg0KPj4+IC0gKiB0dG1fYm9fd2FpdF91bnJlc2VydmVkIC0gaW50ZXJydXB0
aWJsZSB3YWl0IGZvciBhIGJ1ZmZlciBvYmplY3QgdG8gYmVjb21lDQo+Pj4gLSAqIHVucmVzZXJ2
ZWQNCj4+PiAtICoNCj4+PiAtICogQGJvOiBQb2ludGVyIHRvIGJ1ZmZlcg0KPj4+IC0gKi8NCj4+
PiAtaW50IHR0bV9ib193YWl0X3VucmVzZXJ2ZWQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bykNCj4+PiAtew0KPj4+IC0gICAgIGludCByZXQ7DQo+Pj4gLQ0KPj4+IC0gICAgIC8qDQo+Pj4g
LSAgICAgICogSW4gdGhlIGFic2Vuc2Ugb2YgYSB3YWl0X3VubG9ja2VkIEFQSSwNCj4+PiAtICAg
ICAgKiBVc2UgdGhlIGJvOjp3dV9tdXRleCB0byBhdm9pZCB0cmlnZ2VyaW5nIGxpdmVsb2NrcyBk
dWUgdG8NCj4+PiAtICAgICAgKiBjb25jdXJyZW50IHVzZSBvZiB0aGlzIGZ1bmN0aW9uLiBOb3Rl
IHRoYXQgdGhpcyB1c2Ugb2YNCj4+PiAtICAgICAgKiBibzo6d3VfbXV0ZXggY2FuIGdvIGF3YXkg
aWYgd2UgY2hhbmdlIGxvY2tpbmcgb3JkZXIgdG8NCj4+PiAtICAgICAgKiBtbWFwX3NlbSAtPiBi
bzo6cmVzZXJ2ZS4NCj4+PiAtICAgICAgKi8NCj4+PiAtICAgICByZXQgPSBtdXRleF9sb2NrX2lu
dGVycnVwdGlibGUoJmJvLT53dV9tdXRleCk7DQo+Pj4gLSAgICAgaWYgKHVubGlrZWx5KHJldCAh
PSAwKSkNCj4+PiAtICAgICAgICAgICAgIHJldHVybiAtRVJFU1RBUlRTWVM7DQo+Pj4gLSAgICAg
aWYgKCFkbWFfcmVzdl9pc19sb2NrZWQoYm8tPmJhc2UucmVzdikpDQo+Pj4gLSAgICAgICAgICAg
ICBnb3RvIG91dF91bmxvY2s7DQo+Pj4gLSAgICAgcmV0ID0gZG1hX3Jlc3ZfbG9ja19pbnRlcnJ1
cHRpYmxlKGJvLT5iYXNlLnJlc3YsIE5VTEwpOw0KPj4+IC0gICAgIGlmIChyZXQgPT0gLUVJTlRS
KQ0KPj4+IC0gICAgICAgICAgICAgcmV0ID0gLUVSRVNUQVJUU1lTOw0KPj4+IC0gICAgIGlmICh1
bmxpa2VseShyZXQgIT0gMCkpDQo+Pj4gLSAgICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7DQo+
Pj4gLSAgICAgZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOw0KPj4+IC0NCj4+PiAtb3V0
X3VubG9jazoNCj4+PiAtICAgICBtdXRleF91bmxvY2soJmJvLT53dV9tdXRleCk7DQo+Pj4gLSAg
ICAgcmV0dXJuIHJldDsNCj4+PiAtfQ0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0KPj4+IGlu
ZGV4IDc2ZWVkYjk2MzY5My4uNTA1ZTE3ODdhZWVhIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib192bS5jDQo+Pj4gQEAgLTEyNSwzMSArMTI1LDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgdHRt
X2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0KPj4+ICAgICAgICAgICAgICAgICZi
ZGV2LT5tYW5bYm8tPm1lbS5tZW1fdHlwZV07DQo+Pj4gICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCBjdm1hOw0KPj4+DQo+Pj4gLSAgICAgLyoNCj4+PiAtICAgICAgKiBXb3JrIGFyb3VuZCBs
b2NraW5nIG9yZGVyIHJldmVyc2FsIGluIGZhdWx0IC8gbm9wZm4NCj4+PiAtICAgICAgKiBiZXR3
ZWVuIG1tYXBfc2VtIGFuZCBib19yZXNlcnZlOiBQZXJmb3JtIGEgdHJ5bG9jayBvcGVyYXRpb24N
Cj4+PiAtICAgICAgKiBmb3IgcmVzZXJ2ZSwgYW5kIGlmIGl0IGZhaWxzLCByZXRyeSB0aGUgZmF1
bHQgYWZ0ZXIgd2FpdGluZw0KPj4+IC0gICAgICAqIGZvciB0aGUgYnVmZmVyIHRvIGJlY29tZSB1
bnJlc2VydmVkLg0KPj4+IC0gICAgICAqLw0KPj4+IC0gICAgIGlmICh1bmxpa2VseSghZG1hX3Jl
c3ZfdHJ5bG9jayhiby0+YmFzZS5yZXN2KSkpIHsNCj4+PiAtICAgICAgICAgICAgIGlmICh2bWYt
PmZsYWdzICYgRkFVTFRfRkxBR19BTExPV19SRVRSWSkgew0KPj4+IC0gICAgICAgICAgICAgICAg
ICAgICBpZiAoISh2bWYtPmZsYWdzICYgRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQpKSB7DQo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHRtX2JvX2dldChibyk7DQo+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdXBfcmVhZCgmdm1mLT52bWEtPnZtX21tLT5tbWFwX3Nl
bSk7DQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQpIHR0bV9ib193YWl0
X3VucmVzZXJ2ZWQoYm8pOw0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR0bV9i
b19wdXQoYm8pOw0KPj4+IC0gICAgICAgICAgICAgICAgICAgICB9DQo+Pj4gLQ0KPj4+IC0gICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gVk1fRkFVTFRfUkVUUlk7DQo+Pj4gLSAgICAgICAgICAg
ICB9DQo+Pj4gLQ0KPj4+IC0gICAgICAgICAgICAgLyoNCj4+PiAtICAgICAgICAgICAgICAqIElm
IHdlJ2Qgd2FudCB0byBjaGFuZ2UgbG9ja2luZyBvcmRlciB0bw0KPj4+IC0gICAgICAgICAgICAg
ICogbW1hcF9zZW0gLT4gYm86OnJlc2VydmUsIHdlJ2QgdXNlIGEgYmxvY2tpbmcgcmVzZXJ2ZSBo
ZXJlDQo+Pj4gLSAgICAgICAgICAgICAgKiBpbnN0ZWFkIG9mIHJldHJ5aW5nIHRoZSBmYXVsdC4u
Lg0KPj4+IC0gICAgICAgICAgICAgICovDQo+Pj4gLSAgICAgICAgICAgICByZXR1cm4gVk1fRkFV
TFRfTk9QQUdFOw0KPj4+IC0gICAgIH0NCj4+PiArICAgICBkbWFfcmVzdl9sb2NrKGJvLT5iYXNl
LnJlc3YsIE5VTEwpOw0KPj4+DQo+Pj4gICAgICAgIC8qDQo+Pj4gICAgICAgICAqIFJlZnVzZSB0
byBmYXVsdCBpbXBvcnRlZCBwYWdlcy4gVGhpcyBzaG91bGQgYmUgaGFuZGxlZA0KPj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaA0KPj4+IGluZGV4IDQzYzQ5MjlhMjE3MS4uNmI1MGU2MjRlM2UyIDEwMDY0NA0K
Pj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgNCj4+PiArKysgYi9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2FwaS5oDQo+Pj4gQEAgLTc2NSw3ICs3NjUsNiBAQCBzc2l6ZV90IHR0
bV9ib19pbyhzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IGZpbGUgKmZpbHAsDQo+
Pj4gICAgaW50IHR0bV9ib19zd2Fwb3V0KHN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iLA0KPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpOw0K
Pj4+ICAgIHZvaWQgdHRtX2JvX3N3YXBvdXRfYWxsKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
KTsNCj4+PiAtaW50IHR0bV9ib193YWl0X3VucmVzZXJ2ZWQoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibyk7DQo+Pj4NCj4+PiAgICAvKioNCj4+PiAgICAgKiB0dG1fYm9fdXNlc19lbWJlZGRl
ZF9nZW1fb2JqZWN0IC0gY2hlY2sgaWYgdGhlIGdpdmVuIGJvIHVzZXMgdGhlDQo+DQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
