Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B6388636
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 06:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF896E187;
	Wed, 19 May 2021 04:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E97B6E187
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 04:55:09 +0000 (UTC)
X-UUID: 98c88d82fd344b57a50108e11aaa34bd-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4SNfkbRqzDZ+P6okN6fxqL61nvCWq7VOzTHBHYbyx0k=; 
 b=XD5huvevJ6BzKlh8M2cITcXAy+hFDaKRgKqcsr3V8ZBoIEi+xPdl56i/P9HncxYKY2usxoKxzTA9R/NW2ou6iUaZSih70kSTOXcfm5TIng0CKIiRG4SWgZDiadLk6oQfLBG6dFAnEYvw+L1ZyVG+xo+6l67p0yVW9zLHkoUd020=;
X-UUID: 98c88d82fd344b57a50108e11aaa34bd-20210519
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1186167528; Wed, 19 May 2021 11:54:53 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 May 2021 11:54:47 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 11:54:46 +0800
Message-ID: <1621396486.18307.22.camel@mszsdaap41>
Subject: Re: [PATCH 3/4] drm/mediatek: fine tune the dsi panel's power sequence
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 May 2021 11:54:46 +0800
In-Reply-To: <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
 <20210420132614.150242-3-jitao.shi@mediatek.com>
 <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F8D1A7938E471559E34A2AA68D23CC1055848FF057CA6C0BB5272F2AB98E3E3F2000:8
X-MTK: N
Content-Transfer-Encoding: base64
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 Huijuan Xie =?UTF-8?Q?=28=E8=B0=A2=E6=85=A7=E5=A8=9F=29?=
 <Huijuan.Xie@mediatek.com>, "stonea168@163.com" <stonea168@163.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Cawa Cheng =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?=
 <cawa.cheng@mediatek.com>,
 Rex-BC Chen =?UTF-8?Q?=28=E9=99=B3=E6=9F=8F=E8=BE=B0=29?=
 <Rex-BC.Chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIxLTA0LTI0IGF0IDAwOjM2ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSml0YW86DQo+IA0KPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaW
vCAyMDIx5bm0NOaciDIw5pelIOmAseS6jCDkuIvljYg5OjI25a+r6YGT77yaDQo+ID4NCj4gPiBB
ZGQgdGhlIGRybV9wYW5lbF9wcmVwYXJlX3Bvd2VyIGFuZCBkcm1fcGFuZWxfdW5wcmVwYXJlX3Bv
d2VyIGNvbnRyb2wuDQo+ID4gVHVybiBvbiBwYW5lbCBwb3dlcihkcm1fcGFuZWxfcHJlcGFyZV9w
b3dlcikgYW5kIGNvbnRyb2wgYmVmb3JlIGRzaQ0KPiA+IGVuYWJsZS4gQW5kIHRoZW4gZHNpIGVu
YWJsZSwgc2VuZCBkY3MgY21kIGluIGRybV9wYW5lbF9wcmVwYXJlLCBsYXN0DQo+ID4gdHVybiBv
biBiYWNrbGlnaHQuDQo+IA0KPiBQbGVhc2UgZGVzY3JpYmUgV0hZIGRvIHlvdSBuZWVkIHRoaXMg
cGF0Y2g/IEZpeCBhbnkgYnVnPw0KDQpNb3N0IHBhbmVscywgaGF2ZSBmaXZlIHN0ZXBzIHdoZW4g
cG93ZXJvbi4NCg0KMS4gdHVybiBvbiBkc2kgc2lnbmFsIHRvIExQMTEgICAtLT4gZHNpIGhvc3Qn
cyBhY3Rpb24NCjIuIHR1cm4gb24gdGhlIHBvd2VyIHN1cHBsaWVzLCAgLS0+IHBhbmVsJ3MgYWN0
aW9uDQozLiBzZW5kIHRoZSBEQ1MgIGNtZCB0byBwYW5lbCAgIC0tPiBwYW5lbCdzIGFjdGlvbg0K
NC4gc3RhcnQgc2VuZCB2aWRlbyBzdHJlYW0gICAgICAtLT4gZHNpIGhvc3QncyBhY3Rpb24NCjUu
IHR1cm4gb24gYmFja2xpZ2h0LiAgICAgICAgICAgLS0+IHBhbmVsJ3MgYWN0aW9uDQoNCndlIHB1
dCAidHVybiBvbiB0aGUgcG93ZXIgc3VwcGxpZXMiIGFuZCAic2VuZCB0aGUgRENTICBjbWQgdG8g
cGFuZWwiIGluDQpwYW5lbF9wcmVwYXJlLiBBbmQgInR1cm4gb24gYmFja2xpZ2h0IiBpbiBwYW5l
bF9lbmFibGUuDQoNCkJ1dCBzb21lIG90aGVyIHBhbmVscyBoYXMgYSBzcGVjaWFsIHBvd2Vyb24g
c2VxdWVuY2UgYXMgdGhlIGZvbGxvd2luZy4NCg0KMS4gdHVybiBvbiB0aGUgcG93ZXIgc3VwcGxp
ZXMsICAtLT4gcGFuZWwncyBhY3Rpb24NCjIuIHR1cm4gb24gZHNpIHNpZ25hbCB0byBMUDExICAg
LS0+IGRzaSBob3N0J3MgYWN0aW9uDQozLiBzZW5kIHRoZSBEQ1MgIGNtZCB0byBwYW5lbCAgIC0t
PiBwYW5lbCdzIGFjdGlvbg0KNC4gc3RhcnQgc2VuZCB2aWRlbyBzdHJlYW0gICAgICAtLT4gZHNp
IGhvc3QncyBhY3Rpb24NCjUuIHR1cm4gb24gYmFja2xpZ2h0LiAgICAgICAgICAgLS0+IHBhbmVs
J3MgYWN0aW9uDQoNCnBhbmVsJ3MgYWN0aW9ucyBhcmUgZGl2aWRlZCBpbnRvIHRocmVlIHBhcnRz
Lg0KDQpTbyBJIGFkZCBhIG5ldyBhcGkgImRybV9wYW5lbF9wcmVwYXJlX3Bvd2VyL3JtX3BhbmVs
X3VucHJlcGFyZV9wb3dlciIgdG8NCmNvbnRyb2wgdGhlIHNlcXVlbmNlLg0KDQoNCkJlc3QgUmVn
YXJkcw0KSml0YW8NCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYyB8IDEyICsrKysrKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYw0KPiA+IGluZGV4IGExZmYxNTJlZjQ2OC4uNDU1ZmU1ODJjNmI1IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ID4gQEAgLTYxNSwxMCArNjE1LDEz
IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kpDQo+ID4g
ICAgICAgICBkc2ktPmRhdGFfcmF0ZSA9IERJVl9ST1VORF9VUF9VTEwoZHNpLT52bS5waXhlbGNs
b2NrICogYml0X3Blcl9waXhlbCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkc2ktPmxhbmVzKTsNCj4gPg0KPiA+ICsgICAgICAgaWYgKHBhbmVsX2JyaWRn
ZV9wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4dF9icmlkZ2UpKQ0KPiANCj4gcmV0ID0gcGFuZWxfYnJp
ZGdlX3ByZXBhcmVfcG93ZXIoZHNpLT5uZXh0X2JyaWRnZSk7DQo+IGlmIChyZXQpDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICBEUk1fSU5GTygiY2FuJ3QgcHJlcGFyZSBwb3dlciB0aGUgcGFuZWxc
biIpOw0KPiANCj4gSSB0aGluayB5b3Ugc2hvdWxkIGdvdG8gZXJyX3JlZmNvdW50Ow0KDQpUaGFu
a3MgZm9yIHlvdXIgcmV2aWV3LiBJJ2xsIGZpeCBpdCBuZXh0IHBhdGNoLg0KDQo+IA0KPiA+ICsN
Cj4gPiAgICAgICAgIHJldCA9IGNsa19zZXRfcmF0ZShkc2ktPmhzX2NsaywgZHNpLT5kYXRhX3Jh
dGUpOw0KPiA+ICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiAgICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gc2V0IGRhdGEgcmF0ZTogJWRcbiIsIHJldCk7DQo+ID4gLSAg
ICAgICAgICAgICAgIGdvdG8gZXJyX3JlZmNvdW50Ow0KPiA+ICsgICAgICAgICAgICAgICBnb3Rv
IGVycl9wcmVwYXJlX3Bvd2VyOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICBwaHlf
cG93ZXJfb24oZHNpLT5waHkpOw0KPiA+IEBAIC02NjEsNyArNjY0LDkgQEAgc3RhdGljIGludCBt
dGtfZHNpX3Bvd2Vyb24oc3RydWN0IG10a19kc2kgKmRzaSkNCj4gPiAgICAgICAgIGNsa19kaXNh
YmxlX3VucHJlcGFyZShkc2ktPmVuZ2luZV9jbGspOw0KPiA+ICBlcnJfcGh5X3Bvd2VyX29mZjoN
Cj4gPiAgICAgICAgIHBoeV9wb3dlcl9vZmYoZHNpLT5waHkpOw0KPiA+IC1lcnJfcmVmY291bnQ6
DQo+ID4gK2Vycl9wcmVwYXJlX3Bvd2VyOg0KPiA+ICsgICAgICAgaWYgKHBhbmVsX2JyaWRnZV91
bnByZXBhcmVfcG93ZXIoZHNpLT5uZXh0X2JyaWRnZSkpDQo+IA0KPiByZXQgPSBwYW5lbF9icmlk
Z2VfdW5wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4dF9icmlkZ2UpOw0KPiANCj4gPiArICAgICAgICAg
ICAgICAgRFJNX0lORk8oIkNhbid0IHVucHJlcGFyZSBwb3dlciB0aGUgcGFuZWxcbiIpOw0KPiA+
ICAgICAgICAgZHNpLT5yZWZjb3VudC0tOw0KPiA+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAg
fQ0KPiA+IEBAIC02OTQsNiArNjk5LDkgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9wb3dlcm9mZihz
dHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KPiA+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRz
aS0+ZGlnaXRhbF9jbGspOw0KPiA+DQo+ID4gICAgICAgICBwaHlfcG93ZXJfb2ZmKGRzaS0+cGh5
KTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAocGFuZWxfYnJpZGdlX3VucHJlcGFyZV9wb3dlcihk
c2ktPm5leHRfYnJpZGdlKSkNCj4gDQo+IHJldCA9IHBhbmVsX2JyaWRnZV91bnByZXBhcmVfcG93
ZXIoZHNpLT5uZXh0X2JyaWRnZSk7DQo+IA0KPiA+ICsgICAgICAgICAgICAgICBEUk1fSU5GTygi
Q2FuJ3QgdW5wcmVwYXJlIHBvd2VyIHRoZSBwYW5lbFxuIik7DQo+ID4gIH0NCj4gPg0KPiA+ICBz
dGF0aWMgdm9pZCBtdGtfb3V0cHV0X2RzaV9lbmFibGUoc3RydWN0IG10a19kc2kgKmRzaSkNCj4g
PiAtLQ0KPiA+IDIuMjUuMQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KDQo=

