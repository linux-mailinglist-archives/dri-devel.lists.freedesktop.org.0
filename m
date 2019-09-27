Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391E6C1933
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41B86E320;
	Sun, 29 Sep 2019 19:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150044.outbound.protection.outlook.com [40.107.15.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67B6E0E6;
 Fri, 27 Sep 2019 16:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGpB5EOV/oKSsQXRpWYYPvV+/6wUMVkmAjykmtYFIbU5/uH4yDbPSLEDGofXu+Vw2FH/LPC7niuyOI6mxzHOCQpqo2OufN0xxj52UKJuOmSNhiilGTQ4xRIs1tRPJdHugEdElnKZU55XBdXmrJXlC6Ud7Rtu87MsqX1XwVkJ/IJ5FXPkEis0/nrPSNi3ZDrvTUA7cbpmg4g0txuDFx7Bw/fENCBmFWMr789UOAviBMR4htqnnBtGjnMkrAf5yGE5vWdqN5z/yYC5FnFoYEmOTq6e9+bPbVcn8SHGGmxqPZ878e7ffREHMSGFuukcMAfGUFNE9Mjr4jxrGi6OR0pN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+y/9H62lFH4Ig4SnfDBmgUmJOcb0tQyecsFU0d0qJk=;
 b=ZxjH7lDT0EXpoN6f4Cwll53BwRt/0Ol3u0yAZThiPzPw9lO0ZiH+BHY9wjEhmmqUE92WUuVFfc9kl9FHS8w47uvvDBXzkKeosHLAvFWgQIBmDem7F4Msd3O2NHn+SGMFbspJM8avI7r/hjEaw7se39ule4BnvrcgiFv1b7YVhcUtcmHQZt4lT0IZDRMNF2L+2eZ19VpqH+H3l0zp5ae+XmbH/CUAr+CM5N2Gj6RelPn2yXTaw16I+Z/55duk6Atmtb6oyGqc7LRc/FNvAnQrrz4UInhtyBVRrhYZxR8g8E3QhwpDvcUW2nE+euKzOZZ3UO4c9wmFrFHz3OCNO5s6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com (20.176.214.160) by
 AM0PR05MB6820.eurprd05.prod.outlook.com (10.186.175.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Fri, 27 Sep 2019 16:25:14 +0000
Received: from AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::bc4c:7c4c:d3e2:8b28]) by AM0PR05MB4866.eurprd05.prod.outlook.com
 ([fe80::bc4c:7c4c:d3e2:8b28%6]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 16:25:14 +0000
From: Parav Pandit <parav@mellanox.com>
To: Alex Williamson <alex.williamson@redhat.com>, Jason Wang
 <jasowang@redhat.com>
Subject: RE: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Thread-Topic: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Thread-Index: AQHVct/hr92+ZIUyNU2VqO3A/jqSs6c7c7IAgARFQ3A=
Date: Fri, 27 Sep 2019 16:25:13 +0000
Message-ID: <AM0PR05MB48662BA1D397D74DF4F5B9AFD1810@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <20190924170640.1da03bae@x1.home>
In-Reply-To: <20190924170640.1da03bae@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.176.44.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4139002e-3635-41ec-af66-08d74367469a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR05MB6820; 
x-ms-traffictypediagnostic: AM0PR05MB6820:|AM0PR05MB6820:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR05MB682058026F444641759B2685D1810@AM0PR05MB6820.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(189003)(13464003)(199004)(478600001)(66066001)(54906003)(25786009)(99286004)(26005)(6506007)(53546011)(52536014)(3846002)(76176011)(7736002)(7696005)(102836004)(6116002)(256004)(14454004)(33656002)(110136005)(4326008)(186003)(5660300002)(66446008)(81166006)(8936002)(71200400001)(446003)(6246003)(11346002)(66476007)(2906002)(316002)(486006)(66556008)(8676002)(7416002)(64756008)(55016002)(81156014)(9686003)(305945005)(74316002)(7406005)(86362001)(476003)(6436002)(76116006)(66946007)(229853002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB6820;
 H:AM0PR05MB4866.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2qVkCLuERBpVWPf+oB5TsloByWTKpCCqXDDeUIDMpLOL3lgd+3QCkkbDSutMluMtafv1xfyyePLJIpaTv9ZYuMVYZZLugcU6FwQo9zJm4RoHW0U6POc3mumM3jusdbGwGCXhD5OWB+P/uKS2zfIsJR0TN2WcifTSo1lwqMYOR5Y3Mx7HsnV4KqTSuz5gvDxpQ0XkuyNGLOUvhY0d5+T4ttFjf4MKjwEO1BG5rtRv8wR4yAkN2M2c4ZQjgF1u+odPtavfh1yDvJ8EFH04IUVj0urThAiXf3WOF0KdBQQirJ3t+QW4oscvsfTbrCGzMudce75xa7PejbZ43YOKTAqyCnX0bV3FwfDt81W5NCRKRTQmMtkIPg+Jm0VYGVGiAJyFdqfm27a1RAqxkkrJp9/slQCDkH2uCWUfD22c4+jWIw0=
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4139002e-3635-41ec-af66-08d74367469a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 16:25:13.9510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OLD2OpAqJySER/ZlgzAJmSAUycM58+teA56POASf+BQJXXYtuVlfYjTVXy6MDhL3BCD2cu7nztsJSOR2U/fIeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB6820
X-Mailman-Approved-At: Sun, 29 Sep 2019 19:47:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+y/9H62lFH4Ig4SnfDBmgUmJOcb0tQyecsFU0d0qJk=;
 b=s2eQH0d5jPnPtv3tIGxV+CPpPqMZTMMeIcs5/8ZjVia6Qy9SEUV64KyIYOD6j4iMsQ1ltiYCwtBx5bNkvYc6dz6vl5/gqJ1kgD8YvhdP6NeD9HqRiTP1rwC++62hSMgWqbcKjzxNF3ztvTz5YTAqtSEpIZWeXWZGj/vulkovvR0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=parav@mellanox.com; 
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
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQWxleCBXaWxs
aWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KPiBTZW50OiBUdWVzZGF5LCBTZXB0
ZW1iZXIgMjQsIDIwMTkgNjowNyBQTQo+IFRvOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPgo+IENjOiBrdm1Admdlci5rZXJuZWwub3JnOyBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgaW50ZWwtCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4ga3dhbmtoZWRlQG52aWRpYS5jb207IG1zdEBy
ZWRoYXQuY29tOyB0aXdlaS5iaWVAaW50ZWwuY29tOwo+IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOwo+IGNvaHVja0ByZWRo
YXQuY29tOyBtYXhpbWUuY29xdWVsaW5AcmVkaGF0LmNvbTsKPiBjdW5taW5nLmxpYW5nQGludGVs
LmNvbTsgemhpaG9uZy53YW5nQGludGVsLmNvbTsKPiByb2IubWlsbGVyQGJyb2FkY29tLmNvbTsg
eGlhby53LndhbmdAaW50ZWwuY29tOwo+IGhhb3RpYW4ud2FuZ0BzaWZpdmUuY29tOyB6aGVueXV3
QGxpbnV4LmludGVsLmNvbTsgemhpLmEud2FuZ0BpbnRlbC5jb207Cj4gamFuaS5uaWt1bGFAbGlu
dXguaW50ZWwuY29tOyBqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tOwo+IHJvZHJpZ28u
dml2aUBpbnRlbC5jb207IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsKPiBmYXJt
YW5AbGludXguaWJtLmNvbTsgcGFzaWNAbGludXguaWJtLmNvbTsgc2Vib3R0QGxpbnV4LmlibS5j
b207Cj4gb2JlcnBhckBsaW51eC5pYm0uY29tOyBoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tOyBn
b3JAbGludXguaWJtLmNvbTsKPiBib3JudHJhZWdlckBkZS5pYm0uY29tOyBha3Jvd2lha0BsaW51
eC5pYm0uY29tOyBmcmV1ZGVAbGludXguaWJtLmNvbTsKPiBsaW5nc2hhbi56aHVAaW50ZWwuY29t
OyBJZG8gU2hhbWF5IDxpZG9zQG1lbGxhbm94LmNvbT47Cj4gZXBlcmV6bWFAcmVkaGF0LmNvbTsg
bHVsdUByZWRoYXQuY29tOyBQYXJhdiBQYW5kaXQKPiA8cGFyYXZAbWVsbGFub3guY29tPjsgY2hy
aXN0b3BoZS5kZS5kaW5lY2hpbkBnbWFpbC5jb207Cj4ga2V2aW4udGlhbkBpbnRlbC5jb20KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFYyIDYvOF0gbWRldjogaW50cm9kdWNlIHZpcnRpbyBkZXZpY2Ug
YW5kIGl0cyBkZXZpY2Ugb3BzCj4gCj4gT24gVHVlLCAyNCBTZXAgMjAxOSAyMTo1MzozMCArMDgw
MAo+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+IAo+ID4gVGhpcyBw
YXRjaCBpbXBsZW1lbnRzIGJhc2ljIHN1cHBvcnQgZm9yIG1kZXYgZHJpdmVyIHRoYXQgc3VwcG9y
dHMKPiA+IHZpcnRpbyB0cmFuc3BvcnQgZm9yIGtlcm5lbCB2aXJ0aW8gZHJpdmVyLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiAtLS0K
PiA+ICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgfCAgIDIgKwo+ID4gIGluY2x1ZGUvbGlu
dXgvdmlydGlvX21kZXYuaCB8IDE0NQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9tZGV2LmggYi9pbmNsdWRlL2xpbnV4L21kZXYuaCBpbmRleAo+
ID4gMzQxNDMwNzMxMWYxLi43M2FjMjdiM2I4NjggMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L21kZXYuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZGV2LmgKPiA+IEBAIC0xMjYsNiAr
MTI2LDggQEAgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2X2Zyb21fZGV2KHN0cnVjdCBkZXZpY2UK
PiA+ICpkZXYpOwo+ID4KPiA+ICBlbnVtIHsKPiA+ICAJTURFVl9JRF9WRklPID0gMSwKPiA+ICsJ
TURFVl9JRF9WSVJUSU8gPSAyLAo+ID4gKwlNREVWX0lEX1ZIT1NUID0gMywKPiAKPiBNREVWX0lE
X1ZIT1NUIGlzbid0IHVzZWQgeWV0IGhlcmUuICBBbHNvLCBnaXZlbiB0aGUgc3Ryb25nIGludGVy
ZGVwZW5kZW5jZQo+IGJldHdlZW4gdGhlIGNsYXNzX2lkIGFuZCB0aGUgb3BzIHN0cnVjdHVyZSwg
d2UgbWlnaHQgd2FuZCB0byBkZWZpbmUgdGhlbSBpbgo+IHRoZSBzYW1lIHBsYWNlLiAgVGhhbmtz
LAo+IAoKV2hlbiBtbHg1X2NvcmUgY3JlYXRlcyBtZGV2cyAocGFyZW50LT5vcHMtPmNyZWF0ZSgp
IGFuZCBpdCB3YW50cyB0byBiaW5kIHRvIG1seDUgbWRldiBkcml2ZXIgKHdoaWNoIGRvZXMgbWRl
dl9yZWdpc3Rlcl9kcml2ZXIoKSksIAptbHg1IGNvcmUgZHJpdmVyIHdpbGwgcHVibGlzaCBNREVW
X0lEX01MWDVfTkVUIGRlZmluZWQgaW4gY2VudHJhbCBwbGFjZSBhcyBpbmNsdWRlL2xpbnV4L21k
ZXYuaCB3aXRob3V0IGFueSBvcHMgc3RydWN0dXJlLgpCZWNhdXNlIHN1Y2ggb3BzIGFyZSBub3Qg
cmVsZXZhbnQuIEl0IHVzZXMgdXN1YWwsIHN0YW5kYXJkIG9wcyBwcm9iZSgpIHJlbW92ZSgpIG9u
IHRoZSBtZGV2IChzaW1pbGFyIHRvIGEgcmVndWxhciBQQ0kgZGV2aWNlKS4KU28gZm9yIFZIT1NU
IGNhc2Ugb3BzIG1heSBiZSBjbG9zZWx5IHJlbGF0ZWQgdG8gSUQsIGJ1dCBub3QgZm9yIG90aGVy
IHR5cGUgb2YgSUQuCgpKdXN0IHdhbnQgdG8gbWFrZSBzdXJlLCB0aGF0IHNjb3BlIG9mIElEIGNv
dmVycyB0aGlzIGNhc2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
