Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2028C28E2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 23:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38EF89EF7;
	Mon, 30 Sep 2019 21:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82289EBB;
 Mon, 30 Sep 2019 21:36:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD89A3084244;
 Mon, 30 Sep 2019 21:36:09 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DEF460872;
 Mon, 30 Sep 2019 21:36:02 +0000 (UTC)
Date: Mon, 30 Sep 2019 15:36:01 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Parav Pandit <parav@mellanox.com>
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Message-ID: <20190930153601.31e29f7e@x1.home>
In-Reply-To: <AM0PR05MB48662BA1D397D74DF4F5B9AFD1810@AM0PR05MB4866.eurprd05.prod.outlook.com>
References: <20190924135332.14160-1-jasowang@redhat.com>
 <20190924135332.14160-7-jasowang@redhat.com>
 <20190924170640.1da03bae@x1.home>
 <AM0PR05MB48662BA1D397D74DF4F5B9AFD1810@AM0PR05MB4866.eurprd05.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 30 Sep 2019 21:36:10 +0000 (UTC)
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
 "airlied@linux.ie" <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>, Ido Shamay <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
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

T24gRnJpLCAyNyBTZXAgMjAxOSAxNjoyNToxMyArMDAwMApQYXJhdiBQYW5kaXQgPHBhcmF2QG1l
bGxhbm94LmNvbT4gd3JvdGU6Cgo+IEhpIEFsZXgsCj4gCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQo+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVk
aGF0LmNvbT4KPiA+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNCwgMjAxOSA2OjA3IFBNCj4g
PiBUbzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+IENjOiBrdm1Admdlci5r
ZXJuZWwub3JnOyBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0K
PiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOwo+ID4ga3dhbmtoZWRlQG52aWRpYS5jb207IG1zdEByZWRoYXQuY29tOyB0aXdl
aS5iaWVAaW50ZWwuY29tOwo+ID4gdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7Cj4gPiBjb2h1Y2tAcmVkaGF0LmNvbTsgbWF4
aW1lLmNvcXVlbGluQHJlZGhhdC5jb207Cj4gPiBjdW5taW5nLmxpYW5nQGludGVsLmNvbTsgemhp
aG9uZy53YW5nQGludGVsLmNvbTsKPiA+IHJvYi5taWxsZXJAYnJvYWRjb20uY29tOyB4aWFvLncu
d2FuZ0BpbnRlbC5jb207Cj4gPiBoYW90aWFuLndhbmdAc2lmaXZlLmNvbTsgemhlbnl1d0BsaW51
eC5pbnRlbC5jb207IHpoaS5hLndhbmdAaW50ZWwuY29tOwo+ID4gamFuaS5uaWt1bGFAbGludXgu
aW50ZWwuY29tOyBqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tOwo+ID4gcm9kcmlnby52
aXZpQGludGVsLmNvbTsgYWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOwo+ID4gZmFy
bWFuQGxpbnV4LmlibS5jb207IHBhc2ljQGxpbnV4LmlibS5jb207IHNlYm90dEBsaW51eC5pYm0u
Y29tOwo+ID4gb2JlcnBhckBsaW51eC5pYm0uY29tOyBoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29t
OyBnb3JAbGludXguaWJtLmNvbTsKPiA+IGJvcm50cmFlZ2VyQGRlLmlibS5jb207IGFrcm93aWFr
QGxpbnV4LmlibS5jb207IGZyZXVkZUBsaW51eC5pYm0uY29tOwo+ID4gbGluZ3NoYW4uemh1QGlu
dGVsLmNvbTsgSWRvIFNoYW1heSA8aWRvc0BtZWxsYW5veC5jb20+Owo+ID4gZXBlcmV6bWFAcmVk
aGF0LmNvbTsgbHVsdUByZWRoYXQuY29tOyBQYXJhdiBQYW5kaXQKPiA+IDxwYXJhdkBtZWxsYW5v
eC5jb20+OyBjaHJpc3RvcGhlLmRlLmRpbmVjaGluQGdtYWlsLmNvbTsKPiA+IGtldmluLnRpYW5A
aW50ZWwuY29tCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDYvOF0gbWRldjogaW50cm9kdWNl
IHZpcnRpbyBkZXZpY2UgYW5kIGl0cyBkZXZpY2Ugb3BzCj4gPiAKPiA+IE9uIFR1ZSwgMjQgU2Vw
IDIwMTkgMjE6NTM6MzAgKzA4MDAKPiA+IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
IHdyb3RlOgo+ID4gICAKPiA+ID4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIGJhc2ljIHN1cHBvcnQg
Zm9yIG1kZXYgZHJpdmVyIHRoYXQgc3VwcG9ydHMKPiA+ID4gdmlydGlvIHRyYW5zcG9ydCBmb3Ig
a2VybmVsIHZpcnRpbyBkcml2ZXIuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgaW5jbHVkZS9saW51eC9t
ZGV2LmggICAgICAgIHwgICAyICsKPiA+ID4gIGluY2x1ZGUvbGludXgvdmlydGlvX21kZXYuaCB8
IDE0NQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTQ3IGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvbWRldi5oIGIvaW5jbHVkZS9saW51eC9tZGV2LmggaW5kZXgKPiA+ID4gMzQx
NDMwNzMxMWYxLi43M2FjMjdiM2I4NjggMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvbGludXgv
bWRldi5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbWRldi5oCj4gPiA+IEBAIC0xMjYsNiAr
MTI2LDggQEAgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2X2Zyb21fZGV2KHN0cnVjdCBkZXZpY2UK
PiA+ID4gKmRldik7Cj4gPiA+Cj4gPiA+ICBlbnVtIHsKPiA+ID4gIAlNREVWX0lEX1ZGSU8gPSAx
LAo+ID4gPiArCU1ERVZfSURfVklSVElPID0gMiwKPiA+ID4gKwlNREVWX0lEX1ZIT1NUID0gMywg
IAo+ID4gCj4gPiBNREVWX0lEX1ZIT1NUIGlzbid0IHVzZWQgeWV0IGhlcmUuICBBbHNvLCBnaXZl
biB0aGUgc3Ryb25nIGludGVyZGVwZW5kZW5jZQo+ID4gYmV0d2VlbiB0aGUgY2xhc3NfaWQgYW5k
IHRoZSBvcHMgc3RydWN0dXJlLCB3ZSBtaWdodCB3YW5kIHRvIGRlZmluZSB0aGVtIGluCj4gPiB0
aGUgc2FtZSBwbGFjZS4gIFRoYW5rcywKPiA+ICAgCj4gCj4gV2hlbiBtbHg1X2NvcmUgY3JlYXRl
cyBtZGV2cyAocGFyZW50LT5vcHMtPmNyZWF0ZSgpIGFuZCBpdCB3YW50cyB0bwo+IGJpbmQgdG8g
bWx4NSBtZGV2IGRyaXZlciAod2hpY2ggZG9lcyBtZGV2X3JlZ2lzdGVyX2RyaXZlcigpKSwgbWx4
NQo+IGNvcmUgZHJpdmVyIHdpbGwgcHVibGlzaCBNREVWX0lEX01MWDVfTkVUIGRlZmluZWQgaW4g
Y2VudHJhbCBwbGFjZSBhcwo+IGluY2x1ZGUvbGludXgvbWRldi5oIHdpdGhvdXQgYW55IG9wcyBz
dHJ1Y3R1cmUuIEJlY2F1c2Ugc3VjaCBvcHMgYXJlCj4gbm90IHJlbGV2YW50LiBJdCB1c2VzIHVz
dWFsLCBzdGFuZGFyZCBvcHMgcHJvYmUoKSByZW1vdmUoKSBvbiB0aGUKPiBtZGV2IChzaW1pbGFy
IHRvIGEgcmVndWxhciBQQ0kgZGV2aWNlKS4gU28gZm9yIFZIT1NUIGNhc2Ugb3BzIG1heSBiZQo+
IGNsb3NlbHkgcmVsYXRlZCB0byBJRCwgYnV0IG5vdCBmb3Igb3RoZXIgdHlwZSBvZiBJRC4KPiAK
PiBKdXN0IHdhbnQgdG8gbWFrZSBzdXJlLCB0aGF0IHNjb3BlIG9mIElEIGNvdmVycyB0aGlzIGNh
c2UuCgpBSVVJLCB0aGVzZSBkZXZpY2Utb3BzIGFyZSBwcmltYXJpbHkgbWVhbnQgdG8gaGF2ZSAx
Ok4gbXVsdGlwbGV4aW5nIG9mCnRoZSBtZGV2IGJ1cyBkcml2ZXIuICBPbmUgbWRldiBidXMgZHJp
dmVyIHN1cHBvcnRzIE4gdmVuZG9yIGRyaXZlcnMgdmlhCmEgY29tbW9uICJwcm90b2NvbCIgZGVm
aW5lZCBieSB0aGlzIHN0cnVjdHVyZS4gIHZmaW8tbWRldiBzdXBwb3J0cwpHVlQtZywgR1JJRCwg
YW5kIHNldmVyYWwgc2FtcGxlIGRyaXZlcnMuICBJIHRoaW5rIEphc29uIGFuZCBUaXdlaSBhcmUK
YXR0ZW1wdGluZyBzb21ldGhpbmcgc2ltaWxhciBpZiB3ZSBoYXZlIG11bHRpcGxlIHZlbmRvcnMg
dGhhdCBtYXkKcHJvdmlkZSB2aXJ0aW8vdmhvc3QgcGFyZW50IGRyaXZlcnMuICBJZiB5b3UgaGF2
ZSBhIDE6MSBtb2RlbCB3aXRoCm1seDUgd2hlcmUgeW91J3JlIG5vdCB0cnlpbmcgdG8gYWJzdHJh
Y3QgYSBjb21tb24gY2hhbm5lbCBiZXR3ZWVuIHRoZQptZGV2IGJ1cyBkcml2ZXIgYW5kIHRoZSBt
ZGV2IHZlbmRvciBkcml2ZXIsIHRoZW4gSSBzdXBwb3NlIHlvdSBtaWdodApub3QgdXNlIHRoZSBk
ZXZpY2Utb3BzIGNhcGFiaWxpdGllcyBvZiB0aGUgbWRldi1jb3JlLiAgRGlkIEkgaW50ZXJwcmV0
CnRoZSBxdWVzdGlvbiBjb3JyZWN0bHk/ICBJIHRoaW5rIHRoYXQncyBwcm9iYWJseSBmaW5lLCBt
ZGV2LWNvcmUKc2hvdWxkbid0IGhhdmUgYW55IGRlcGVuZGVuY2llcyBvbiB0aGUgZGV2aWNlLW9w
cyBhbmQgd2Ugc2hvdWxkbid0CnJlYWxseSBiZSBkaWN0YXRpbmcgdGhlIGJ1cy92ZW5kb3IgbGlu
ayB0aHJvdWdoIG1kZXYuICBUaGFua3MsCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
