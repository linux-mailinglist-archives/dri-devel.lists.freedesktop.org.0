Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14134F050E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 19:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984A36EAC1;
	Tue,  5 Nov 2019 18:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7A6EB3E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 18:29:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-jIcey9tJN-e2IZXzaHrR-g-1; Tue, 05 Nov 2019 13:29:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65285800C73;
 Tue,  5 Nov 2019 18:29:18 +0000 (UTC)
Received: from gondolin (unknown [10.36.118.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D575C1BB;
 Tue,  5 Nov 2019 18:28:54 +0000 (UTC)
Date: Tue, 5 Nov 2019 19:28:51 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V8 3/6] mdev: introduce device specific ops
Message-ID: <20191105192851.40548978.cohuck@redhat.com>
In-Reply-To: <20191105104418.1735d800@x1.home>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105093240.5135-4-jasowang@redhat.com>
 <20191105175025.1a620844.cohuck@redhat.com>
 <20191105104418.1735d800@x1.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: jIcey9tJN-e2IZXzaHrR-g-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572978566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1F4u3DloqEz3yiZIn87LfiBjLlR9eBatWsYBJzun54=;
 b=MLTg0/LzqhpUwOxpdbOAzJFrjfUaEK1uQ3fUWp1VBJEgA04hNfdaf7jnwHFH0g1gk1aj+S
 ah3PHg1j4H3SN70f+IkJRVic3hGwcbk1h8rif2KjNkWrVZNoZngC57rrvIKckJ6HkMJ/vS
 Al7h69Ea84bcUEfYRRGt3SG4ibvb3Ys=
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, Jason Wang <jasowang@redhat.com>,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, cunming.liang@intel.com,
 rodrigo.vivi@intel.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA1IE5vdiAyMDE5IDEwOjQ0OjE4IC0wNzAwCkFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIDUgTm92IDIwMTkgMTc6NTA6
MjUgKzAxMDAKPiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4g
PiBPbiBUdWUsICA1IE5vdiAyMDE5IDE3OjMyOjM3ICswODAwCj4gPiBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ICAgCj4gPiA+IEN1cnJlbnRseSwgZXhjZXB0IGZv
ciB0aGUgY3JlYXRlIGFuZCByZW1vdmUsIHRoZSByZXN0IG9mCj4gPiA+IG1kZXZfcGFyZW50X29w
cyBpcyBkZXNpZ25lZCBmb3IgdmZpby1tZGV2IGRyaXZlciBvbmx5IGFuZCBtYXkgbm90IGhlbHAK
PiA+ID4gZm9yIGtlcm5lbCBtZGV2IGRyaXZlci4gV2l0aCB0aGUgaGVscCBvZiBjbGFzcyBpZCwg
dGhpcyBwYXRjaAo+ID4gPiBpbnRyb2R1Y2VzIGRldmljZSBzcGVjaWZpYyBjYWxsYmFja3MgaW5z
aWRlIG1kZXZfZGV2aWNlCj4gPiA+IHN0cnVjdHVyZS4gVGhpcyBhbGxvd3MgZGlmZmVyZW50IHNl
dCBvZiBjYWxsYmFjayB0byBiZSB1c2VkIGJ5Cj4gPiA+IHZmaW8tbWRldiBhbmQgdmlydGlvLW1k
ZXYuCj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5v
eC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5j
b20+Cj4gPiA+IC0tLQo+ID4gPiAgLi4uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2Uu
cnN0ICAgICAgIHwgMzUgKysrKysrKysrLS0tLQo+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2t2bWd0LmMgICAgICAgICAgICAgIHwgMTggKysrKy0tLQo+ID4gPiAgZHJpdmVycy9z
MzkwL2Npby92ZmlvX2Njd19vcHMuYyAgICAgICAgICAgICAgIHwgMTggKysrKy0tLQo+ID4gPiAg
ZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgMTQgKysrLS0K
PiA+ID4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICB8IDI0
ICsrKysrKysrLQo+ID4gPiAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggICAgICAg
ICAgICAgIHwgIDUgKysKPiA+ID4gIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICAg
ICAgICAgICAgICB8IDM3ICsrKysrKy0tLS0tLS0KPiA+ID4gIGluY2x1ZGUvbGludXgvbWRldi5o
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQzICsrKystLS0tLS0tLS0tLQo+ID4gPiAgaW5j
bHVkZS9saW51eC9tZGV2X3ZmaW9fb3BzLmggICAgICAgICAgICAgICAgIHwgNTIgKysrKysrKysr
KysrKysrKysrKwo+ID4gPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgICAgICAg
ICAgICAgIHwgMjAgKysrKy0tLQo+ID4gPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAg
ICAgICAgICAgICAgICAgIHwgMjAgKysrKy0tLQo+ID4gPiAgc2FtcGxlcy92ZmlvLW1kZXYvbXR0
eS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTggKysrKy0tLQo+ID4gPiAgMTMgZmlsZXMgY2hh
bmdlZCwgMjA2IGluc2VydGlvbnMoKyksIDk5IGRlbGV0aW9ucygtKQo+ID4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWRldl92ZmlvX29wcy5oCj4gPiA+ICAgICAKPiA+IAo+
ID4gKC4uLikKPiA+ICAgCj4gPiA+IEBAIC0xNzIsMTAgKzE2MywzNCBAQCB0aGF0IGEgZHJpdmVy
IHNob3VsZCB1c2UgdG8gdW5yZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3JlIGRyaXZl
cjo6Cj4gPiA+ICAKPiA+ID4gIAlleHRlcm4gdm9pZCBtZGV2X3VucmVnaXN0ZXJfZGV2aWNlKHN0
cnVjdCBkZXZpY2UgKmRldik7Cj4gPiA+ICAKPiA+ID4gLUl0IGlzIGFsc28gcmVxdWlyZWQgdG8g
c3BlY2lmeSB0aGUgY2xhc3NfaWQgaW4gY3JlYXRlKCkgY2FsbGJhY2sgdGhyb3VnaDo6Cj4gPiA+
ICtBcyBtdWx0aXBsZSB0eXBlcyBvZiBtZWRpYXRlZCBkZXZpY2VzIG1heSBiZSBzdXBwb3J0ZWQs
IGNsYXNzIGlkIG5lZWRzCj4gPiA+ICt0byBiZSBzcGVjaWZpZWQgaW4gdGhlIGNyZWF0ZSBjYWxs
YmFjaygpLiBUaGlzIGNvdWxkIGJlIGRvbmUgICAgCj4gPiAKPiA+IFRoZSBicmFja2V0cyBzaG91
bGQgcHJvYmFibHkgZ28gYmVoaW5kICdjcmVhdGUnPwo+ID4gICAKPiA+ID4gK2V4cGxpY2l0bHkg
Zm9yIHRoZSBkZXZpY2UgdGhhdCBkb2VzIG5vdCB1c2Ugb24gbWRldiBidXMgZm9yIGl0cyAgICAK
PiA+IAo+ID4gImZvciBkZXZpY2VzIHRoYXQgZG8gbm90IHVzZSB0aGUgbWRldiBidXMiID8KPiA+
IAo+ID4gQnV0IHdoeSB3b3VsZG4ndCB0aGV5PyBJIGZlZWwgbGlrZSBJJ3ZlIG1pc3NlZCBzb21l
IGRpc2N1c3Npb24gaGVyZSA6LyAgCj4gCj4gVGhlIGRldmljZSBvcHMgcHJvdmlkZSBhIHJvdXRl
IHRocm91Z2ggbWRldi1jb3JlIGZvciBrbm93biBjYWxsYmFja3MsCj4gd2hpY2ggaXMgcHJpbWFy
aWx5IHVzZWZ1bCB3aGVuIHdlIGhhdmUgMTpOIHJlbGF0aW9uIGJldHdlZW4gbWRldiBidXMKPiBk
cml2ZXIgYW5kIHZlbmRvciBkcml2ZXJzLiAgVGhlIG9idmlvdXMgZXhhbXBsZSBoZXJlIGlzIHZm
aW8tbWRldiwKPiB3aGVyZSB3ZSBoYXZlIEdWVC1nLCB2ZmlvLWFwLCB2ZmlvLWNjdywgTlZJRElB
IEdSSUQsIGFuZCB2YXJpb3VzIHNhbXBsZQo+IGRyaXZlcnMgYWxsIGFkdmVydGlzaW5nIHZmaW8t
bWRldiBzdXBwb3J0IHZpYSB0aGVpciBjbGFzcyBpZC4gIEhvd2V2ZXIsCj4gaWYgd2UgaGF2ZSBh
IHRpZ2h0bHkgY291cGxlZCB2ZW5kb3IgZHJpdmVyIGFuZCBtZGV2IGJ1cyBkcml2ZXIsIGFzIHRo
ZQo+IG1seDUgc3VwcG9ydCB0aGF0IFBhcmF2IGlzIGRldmVsb3BpbmcsIHRoZSBjbGFpbSBpcyB0
aGF0IHRoZXkgcHJlZmVyCj4gbm90IHRvIGV4cG9zZSBhbnkgZGV2aWNlIG9wcyBhbmQgaW50ZW5k
IHRvIGludGVyYWN0IGRpcmVjdGx5IHdpdGggdGhlCj4gbWRldiBkZXZpY2UuICBBdCBsZWFzdCB0
aGF0J3MgbXkgdW5kZXJzdGFuZGluZy4gIFRoYW5rcywKPiAKPiBBbGV4CgpBaCwgb2suCgpTbyBt
YXliZSB1c2UgdGhlIHBocmFzaW5nICJkZXZpY2VzIHRoYXQgaW50ZXJhY3Qgd2l0aCB0aGUgbWRl
diBkZXZpY2UKZGlyZWN0bHkiIHZzICJkZXZpY2VzIHRoYXQgdXNlIGRldmljZS1zcGVjaWZpYyBv
cHMiIGluc3RlYWQ/CgpOb3QgYSBzdHJvbmcgY3JpdGlxdWUsIHRob3VnaC4KCj4gCj4gPiA+ICtv
cGVyYXRpb24gdGhyb3VnaDoKPiA+ID4gIAo+ID4gPiAgCWludCBtZGV2X3NldF9jbGFzcyhzdHJ1
Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHUxNiBpZCk7Cj4gPiA+ICAKPiA+ID4gK0ZvciB0aGUgZGV2
aWNlIHRoYXQgdXNlcyBvbiB0aGUgbWRldiBidXMgZm9yIGl0cyBvcGVyYXRpb24sIHRoZQo+ID4g
PiBjbGFzcyAgICAKPiA+IAo+ID4gIkZvciBkZXZpY2VzIHRoYXQgdXNlIHRoZSBtZGV2IGJ1cy4u
LiIKPiA+IAo+ID4gQnV0IHNhbWUgY29tbWVudCBhcyBhYm92ZS4KPiA+ICAgCj4gPiA+ICtzaG91
bGQgcHJvdmlkZSBoZWxwZXIgZnVuY3Rpb24gdG8gc2V0IGNsYXNzIGlkIGFuZCBkZXZpY2UKPiA+
ID4gc3BlY2lmaWMgK29wcy4gRS5nIGZvciB2ZmlvLW1kZXYgZGV2aWNlcywgdGhlIGZ1bmN0aW9u
IHRvIGJlCj4gPiA+IGNhbGxlZCBpczo6ICsKPiA+ID4gKwlpbnQgbWRldl9zZXRfdmZpb19vcHMo
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3BzCj4gPiA+ICp2ZmlvX29wcyk7
ICsKPiA+ID4gK1RoZSBjbGFzcyBpZCAoc2V0IGJ5IHRoaXMgZnVuY3Rpb24gdG8gTURFVl9DTEFT
U19JRF9WRklPKSBpcwo+ID4gPiB1c2VkIHRvICttYXRjaCBhIGRldmljZSB3aXRoIGFuIG1kZXYg
ZHJpdmVyIHZpYSBpdHMgaWQgdGFibGUuIFRoZQo+ID4gPiBkZXZpY2UgK3NwZWNpZmljIGNhbGxi
YWNrcyAoc3BlY2lmaWVkIGluICp2ZmlvX29wcykgYXJlCj4gPiA+IG9idGFpbmFibGUgdmlhICtt
ZGV2X2dldF92ZmlvX29wcygpIChmb3IgdXNlIGJ5IHRoZSBtZGV2IGJ1cwo+ID4gPiBkcml2ZXIp
LiBBIHZmaW8tbWRldiArZGV2aWNlIChjbGFzcyBpZCBNREVWX0NMQVNTX0lEX1ZGSU8pIHVzZXMK
PiA+ID4gdGhlIGZvbGxvd2luZyArZGV2aWNlLXNwZWNpZmljIG9wczoKPiA+ID4gKwo+ID4gPiAr
KiBvcGVuOiBvcGVuIGNhbGxiYWNrIG9mIHZmaW8gbWVkaWF0ZWQgZGV2aWNlCj4gPiA+ICsqIGNs
b3NlOiBjbG9zZSBjYWxsYmFjayBvZiB2ZmlvIG1lZGlhdGVkIGRldmljZQo+ID4gPiArKiBpb2N0
bDogaW9jdGwgY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPiA+ID4gKyogcmVhZCA6
IHJlYWQgZW11bGF0aW9uIGNhbGxiYWNrCj4gPiA+ICsqIHdyaXRlOiB3cml0ZSBlbXVsYXRpb24g
Y2FsbGJhY2sKPiA+ID4gKyogbW1hcDogbW1hcCBlbXVsYXRpb24gY2FsbGJhY2sKPiA+ID4gKwo+
ID4gPiAgTWVkaWF0ZWQgRGV2aWNlIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFRocm91Z2ggc3lzZnMK
PiA+ID4gID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
ICAgIAo+ID4gCj4gPiBPdGhlcndpc2UsIGxvb2tzIGdvb2QuICAKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
