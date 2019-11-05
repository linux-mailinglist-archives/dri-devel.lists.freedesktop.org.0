Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6897BF0440
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 18:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B536EB2E;
	Tue,  5 Nov 2019 17:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF836EB31
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 17:44:41 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Fsp1fWk7MS6L-3vtqVbnMQ-1; Tue, 05 Nov 2019 12:44:36 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DEFC477;
 Tue,  5 Nov 2019 17:44:32 +0000 (UTC)
Received: from x1.home (ovpn-116-110.phx2.redhat.com [10.3.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D1385D9CD;
 Tue,  5 Nov 2019 17:44:19 +0000 (UTC)
Date: Tue, 5 Nov 2019 10:44:18 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V8 3/6] mdev: introduce device specific ops
Message-ID: <20191105104418.1735d800@x1.home>
In-Reply-To: <20191105175025.1a620844.cohuck@redhat.com>
References: <20191105093240.5135-1-jasowang@redhat.com>
 <20191105093240.5135-4-jasowang@redhat.com>
 <20191105175025.1a620844.cohuck@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Fsp1fWk7MS6L-3vtqVbnMQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572975880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46u2l9L8Y05Qm2/MKUXXTgxpERoN9tnFQ6gH6kXcl6k=;
 b=VceUb5MQBplMp5ya6r8thW+i2Q4N1HGx2vsb6t8ZMd+zNPDuPCxXqC0iEOsqWUPR1G8boC
 jzT/H6zlofg2Kypm9gMh/j38lwMKpewHJ+5QHF+ZfYybPYq/X5tcyFg2nROnymTCb1Bw+x
 DcUkVUcLBo7wzFFo5sg9TQ764Y8/VYI=
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

T24gVHVlLCA1IE5vdiAyMDE5IDE3OjUwOjI1ICswMTAwCkNvcm5lbGlhIEh1Y2sgPGNvaHVja0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gT24gVHVlLCAgNSBOb3YgMjAxOSAxNzozMjozNyArMDgwMAo+
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+IAo+ID4gQ3VycmVudGx5
LCBleGNlcHQgZm9yIHRoZSBjcmVhdGUgYW5kIHJlbW92ZSwgdGhlIHJlc3Qgb2YKPiA+IG1kZXZf
cGFyZW50X29wcyBpcyBkZXNpZ25lZCBmb3IgdmZpby1tZGV2IGRyaXZlciBvbmx5IGFuZCBtYXkg
bm90IGhlbHAKPiA+IGZvciBrZXJuZWwgbWRldiBkcml2ZXIuIFdpdGggdGhlIGhlbHAgb2YgY2xh
c3MgaWQsIHRoaXMgcGF0Y2gKPiA+IGludHJvZHVjZXMgZGV2aWNlIHNwZWNpZmljIGNhbGxiYWNr
cyBpbnNpZGUgbWRldl9kZXZpY2UKPiA+IHN0cnVjdHVyZS4gVGhpcyBhbGxvd3MgZGlmZmVyZW50
IHNldCBvZiBjYWxsYmFjayB0byBiZSB1c2VkIGJ5Cj4gPiB2ZmlvLW1kZXYgYW5kIHZpcnRpby1t
ZGV2Lgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+
ID4gLS0tCj4gPiAgLi4uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0ICAgICAg
IHwgMzUgKysrKysrKysrLS0tLQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3Qu
YyAgICAgICAgICAgICAgfCAxOCArKysrLS0tCj4gPiAgZHJpdmVycy9zMzkwL2Npby92ZmlvX2Nj
d19vcHMuYyAgICAgICAgICAgICAgIHwgMTggKysrKy0tLQo+ID4gIGRyaXZlcnMvczM5MC9jcnlw
dG8vdmZpb19hcF9vcHMuYyAgICAgICAgICAgICB8IDE0ICsrKy0tCj4gPiAgZHJpdmVycy92Zmlv
L21kZXYvbWRldl9jb3JlLmMgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKystCj4gPiAgZHJp
dmVycy92ZmlvL21kZXYvbWRldl9wcml2YXRlLmggICAgICAgICAgICAgIHwgIDUgKysKPiA+ICBk
cml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAgfCAzNyArKysrKyst
LS0tLS0tCj4gPiAgaW5jbHVkZS9saW51eC9tZGV2LmggICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNDMgKysrKy0tLS0tLS0tLS0tCj4gPiAgaW5jbHVkZS9saW51eC9tZGV2X3ZmaW9fb3BzLmgg
ICAgICAgICAgICAgICAgIHwgNTIgKysrKysrKysrKysrKysrKysrKwo+ID4gIHNhbXBsZXMvdmZp
by1tZGV2L21ib2Nocy5jICAgICAgICAgICAgICAgICAgICB8IDIwICsrKystLS0KPiA+ICBzYW1w
bGVzL3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrLS0tCj4g
PiAgc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTggKysr
Ky0tLQo+ID4gIDEzIGZpbGVzIGNoYW5nZWQsIDIwNiBpbnNlcnRpb25zKCspLCA5OSBkZWxldGlv
bnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZGV2X3ZmaW9fb3Bz
LmgKPiA+ICAgCj4gCj4gKC4uLikKPiAKPiA+IEBAIC0xNzIsMTAgKzE2MywzNCBAQCB0aGF0IGEg
ZHJpdmVyIHNob3VsZCB1c2UgdG8gdW5yZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRldiBjb3Jl
IGRyaXZlcjo6Cj4gPiAgCj4gPiAgCWV4dGVybiB2b2lkIG1kZXZfdW5yZWdpc3Rlcl9kZXZpY2Uo
c3RydWN0IGRldmljZSAqZGV2KTsKPiA+ICAKPiA+IC1JdCBpcyBhbHNvIHJlcXVpcmVkIHRvIHNw
ZWNpZnkgdGhlIGNsYXNzX2lkIGluIGNyZWF0ZSgpIGNhbGxiYWNrIHRocm91Z2g6Ogo+ID4gK0Fz
IG11bHRpcGxlIHR5cGVzIG9mIG1lZGlhdGVkIGRldmljZXMgbWF5IGJlIHN1cHBvcnRlZCwgY2xh
c3MgaWQgbmVlZHMKPiA+ICt0byBiZSBzcGVjaWZpZWQgaW4gdGhlIGNyZWF0ZSBjYWxsYmFjaygp
LiBUaGlzIGNvdWxkIGJlIGRvbmUgIAo+IAo+IFRoZSBicmFja2V0cyBzaG91bGQgcHJvYmFibHkg
Z28gYmVoaW5kICdjcmVhdGUnPwo+IAo+ID4gK2V4cGxpY2l0bHkgZm9yIHRoZSBkZXZpY2UgdGhh
dCBkb2VzIG5vdCB1c2Ugb24gbWRldiBidXMgZm9yIGl0cyAgCj4gCj4gImZvciBkZXZpY2VzIHRo
YXQgZG8gbm90IHVzZSB0aGUgbWRldiBidXMiID8KPiAKPiBCdXQgd2h5IHdvdWxkbid0IHRoZXk/
IEkgZmVlbCBsaWtlIEkndmUgbWlzc2VkIHNvbWUgZGlzY3Vzc2lvbiBoZXJlIDovCgpUaGUgZGV2
aWNlIG9wcyBwcm92aWRlIGEgcm91dGUgdGhyb3VnaCBtZGV2LWNvcmUgZm9yIGtub3duIGNhbGxi
YWNrcywKd2hpY2ggaXMgcHJpbWFyaWx5IHVzZWZ1bCB3aGVuIHdlIGhhdmUgMTpOIHJlbGF0aW9u
IGJldHdlZW4gbWRldiBidXMKZHJpdmVyIGFuZCB2ZW5kb3IgZHJpdmVycy4gIFRoZSBvYnZpb3Vz
IGV4YW1wbGUgaGVyZSBpcyB2ZmlvLW1kZXYsCndoZXJlIHdlIGhhdmUgR1ZULWcsIHZmaW8tYXAs
IHZmaW8tY2N3LCBOVklESUEgR1JJRCwgYW5kIHZhcmlvdXMgc2FtcGxlCmRyaXZlcnMgYWxsIGFk
dmVydGlzaW5nIHZmaW8tbWRldiBzdXBwb3J0IHZpYSB0aGVpciBjbGFzcyBpZC4gIEhvd2V2ZXIs
CmlmIHdlIGhhdmUgYSB0aWdodGx5IGNvdXBsZWQgdmVuZG9yIGRyaXZlciBhbmQgbWRldiBidXMg
ZHJpdmVyLCBhcyB0aGUKbWx4NSBzdXBwb3J0IHRoYXQgUGFyYXYgaXMgZGV2ZWxvcGluZywgdGhl
IGNsYWltIGlzIHRoYXQgdGhleSBwcmVmZXIKbm90IHRvIGV4cG9zZSBhbnkgZGV2aWNlIG9wcyBh
bmQgaW50ZW5kIHRvIGludGVyYWN0IGRpcmVjdGx5IHdpdGggdGhlCm1kZXYgZGV2aWNlLiAgQXQg
bGVhc3QgdGhhdCdzIG15IHVuZGVyc3RhbmRpbmcuICBUaGFua3MsCgpBbGV4Cgo+ID4gK29wZXJh
dGlvbiB0aHJvdWdoOgo+ID4gIAo+ID4gIAlpbnQgbWRldl9zZXRfY2xhc3Moc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2LCB1MTYgaWQpOwo+ID4gIAo+ID4gK0ZvciB0aGUgZGV2aWNlIHRoYXQgdXNl
cyBvbiB0aGUgbWRldiBidXMgZm9yIGl0cyBvcGVyYXRpb24sIHRoZSBjbGFzcyAgCj4gCj4gIkZv
ciBkZXZpY2VzIHRoYXQgdXNlIHRoZSBtZGV2IGJ1cy4uLiIKPiAKPiBCdXQgc2FtZSBjb21tZW50
IGFzIGFib3ZlLgo+IAo+ID4gK3Nob3VsZCBwcm92aWRlIGhlbHBlciBmdW5jdGlvbiB0byBzZXQg
Y2xhc3MgaWQgYW5kIGRldmljZSBzcGVjaWZpYwo+ID4gK29wcy4gRS5nIGZvciB2ZmlvLW1kZXYg
ZGV2aWNlcywgdGhlIGZ1bmN0aW9uIHRvIGJlIGNhbGxlZCBpczo6Cj4gPiArCj4gPiArCWludCBt
ZGV2X3NldF92ZmlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1kZXZfdmZpb19kZXZpY2Vfb3BzICp2
ZmlvX29wcyk7Cj4gPiArCj4gPiArVGhlIGNsYXNzIGlkIChzZXQgYnkgdGhpcyBmdW5jdGlvbiB0
byBNREVWX0NMQVNTX0lEX1ZGSU8pIGlzIHVzZWQgdG8KPiA+ICttYXRjaCBhIGRldmljZSB3aXRo
IGFuIG1kZXYgZHJpdmVyIHZpYSBpdHMgaWQgdGFibGUuIFRoZSBkZXZpY2UKPiA+ICtzcGVjaWZp
YyBjYWxsYmFja3MgKHNwZWNpZmllZCBpbiAqdmZpb19vcHMpIGFyZSBvYnRhaW5hYmxlIHZpYQo+
ID4gK21kZXZfZ2V0X3ZmaW9fb3BzKCkgKGZvciB1c2UgYnkgdGhlIG1kZXYgYnVzIGRyaXZlciku
IEEgdmZpby1tZGV2Cj4gPiArZGV2aWNlIChjbGFzcyBpZCBNREVWX0NMQVNTX0lEX1ZGSU8pIHVz
ZXMgdGhlIGZvbGxvd2luZwo+ID4gK2RldmljZS1zcGVjaWZpYyBvcHM6Cj4gPiArCj4gPiArKiBv
cGVuOiBvcGVuIGNhbGxiYWNrIG9mIHZmaW8gbWVkaWF0ZWQgZGV2aWNlCj4gPiArKiBjbG9zZTog
Y2xvc2UgY2FsbGJhY2sgb2YgdmZpbyBtZWRpYXRlZCBkZXZpY2UKPiA+ICsqIGlvY3RsOiBpb2N0
bCBjYWxsYmFjayBvZiB2ZmlvIG1lZGlhdGVkIGRldmljZQo+ID4gKyogcmVhZCA6IHJlYWQgZW11
bGF0aW9uIGNhbGxiYWNrCj4gPiArKiB3cml0ZTogd3JpdGUgZW11bGF0aW9uIGNhbGxiYWNrCj4g
PiArKiBtbWFwOiBtbWFwIGVtdWxhdGlvbiBjYWxsYmFjawo+ID4gKwo+ID4gIE1lZGlhdGVkIERl
dmljZSBNYW5hZ2VtZW50IEludGVyZmFjZSBUaHJvdWdoIHN5c2ZzCj4gPiAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0gIAo+IAo+IE90aGVyd2lzZSwg
bG9va3MgZ29vZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
