Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D86E2109
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 18:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8206EB4C;
	Wed, 23 Oct 2019 16:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588D86EB4C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 16:52:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-kiwu8J-9MZWZX-y3vAa-XQ-1; Wed, 23 Oct 2019 12:52:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D64580183E;
 Wed, 23 Oct 2019 16:52:26 +0000 (UTC)
Received: from redhat.com (ovpn-124-105.rdu2.redhat.com [10.10.124.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 258D660126;
 Wed, 23 Oct 2019 16:52:25 +0000 (UTC)
Date: Wed, 23 Oct 2019 12:52:23 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: christian.koenig@amd.com
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Message-ID: <20191023165223.GA4163@redhat.com>
References: <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
 <20191018203608.GA5670@mellanox.com>
 <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
 <20191021135744.GA25164@mellanox.com>
 <e07092c3-8ccd-9814-835c-6c462017aff8@amd.com>
 <20191021151221.GC25164@mellanox.com>
 <20191022075735.GV11828@phenom.ffwll.local>
 <20191022150109.GF22766@mellanox.com>
 <20191023090858.GV11828@phenom.ffwll.local>
 <13edf841-421e-3522-fcec-ef919c2013ef@gmail.com>
MIME-Version: 1.0
In-Reply-To: <13edf841-421e-3522-fcec-ef919c2013ef@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: kiwu8J-9MZWZX-y3vAa-XQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571849552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GanjAE8HfQ8qzFKCa/r64Dq3fD+/mSUc5zOx+PGr8eg=;
 b=BMzZ/dKYIzmcTQ67DfZ6Rp1Q6K9dvSEbBdRYZsplNMLYVeAJeGc2hOq+Y4E7p+nnFW4R/G
 VS2r2h5L60mdQCIYRWF8W0GK50vTSUIjPXn7NiAJED06Hzklj2yvcoxYfg6gg+yN8HOqP9
 Hrld9X9cQYxrNhlpuA6rg3y2JpBew1c=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTE6MzI6MTZBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAyMy4xMC4xOSB1bSAxMTowOCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4g
PiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAwMzowMToxM1BNICswMDAwLCBKYXNvbiBHdW50aG9y
cGUgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDA5OjU3OjM1QU0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+ID4gVGhlIHVudXN1YWwgYml0IGlu
IGFsbCBvZiB0aGlzIGlzIHVzaW5nIGEgbG9jaydzIGNyaXRpY2FsIHJlZ2lvbiB0bwo+ID4gPiA+
ID4gJ3Byb3RlY3QnIGRhdGEgZm9yIHJlYWQsIGJ1dCB1cGRhdGluZyB0aGF0IHNhbWUgZGF0YSBi
ZWZvcmUgdGhlIGxvY2sncwo+ID4gPiA+ID4gY3JpdGljYWwgc2VjaW9uLiBpZSByZWx5aW5nIG9u
IHRoZSB1bmxvY2sgYmFycmllciB0byAncmVsZWFzZScgcHJvZ3JhbQo+ID4gPiA+ID4gb3JkZXJl
ZCBzdG9yZXMgZG9uZSBiZWZvcmUgdGhlIGxvY2sncyBvd24gY3JpdGljYWwgcmVnaW9uLCBhbmQg
dGhlCj4gPiA+ID4gPiBsb2NrIHNpZGUgYmFycmllciB0byAnYWNxdWlyZScgdGhvc2Ugc3RvcmVz
Lgo+ID4gPiA+IEkgdGhpbmsgdGhpcyB1bnVzdWFsIHVzZSBvZiBsb2NrcyBhcyBiYXJyaWVycyBm
b3Igb3RoZXIgdW5sb2NrZWQgYWNjZXNzZXMKPiA+ID4gPiBkZXNlcnZlcyBjb21tZW50cyBldmVu
IG1vcmUgdGhhbiBqdXN0IG5vcm1hbCBiYXJyaWVycy4gQ2FuIHlvdSBwbHMgYWRkCj4gPiA+ID4g
dGhlbT8gSSB0aGluayB0aGUgZGVzaWduIHNlZWVtcyBzb3VuZCAuLi4KPiA+ID4gPiAKPiA+ID4g
PiBBbHNvIHRoZSBjb21tZW50IG9uIHRoZSBkcml2ZXIncyBsb2NrIGhvcGVmdWxseSBwcmV2ZW50
cyBkcml2ZXIKPiA+ID4gPiBtYWludGFpbmVycyBmcm9tIG1vdmluZyB0aGUgZHJpdmVyX2xvY2sg
YXJvdW5kIGluIGEgd2F5IHRoYXQgd291bGQgdmVyeQo+ID4gPiA+IHN1YnRsZSBicmVhayB0aGUg
c2NoZW1lLCBzbyBJIHRoaW5rIGhhdmluZyB0aGUgYWNxdWlyZSBiYXJyaWVyIGNvbW1lbnRlZAo+
ID4gPiA+IGluIGVhY2ggcGxhY2Ugd291bGQgYmUgcmVhbGx5IGdvb2QuCj4gPiA+IFRoZXJlIGlz
IGFscmVhZHkgYSBsb3Qgb2YgZG9jdW1lbnRhdGlvbiwgSSB0aGluayBpdCB3b3VsZCBiZSBoZWxw
ZnVsCj4gPiA+IGlmIHlvdSBjb3VsZCBzdWdnZXN0IHNvbWUgc3BlY2lmaWMgcGxhY2VzIHdoZXJl
IHlvdSB0aGluayBhbiBhZGRpdGlvbgo+ID4gPiB3b3VsZCBoZWxwPyBJIHRoaW5rIHRoZSBwZXJz
cGVjdGl2ZSBvZiBzb21lb25lIGxlc3MgZmFtaWxpYXIgd2l0aCB0aGlzCj4gPiA+IGRlc2lnbiB3
b3VsZCByZWFsbHkgaW1wcm92ZSB0aGUgZG9jdW1lbnRhdGlvbgo+ID4gSG0gSSBqdXN0IG1lYW50
IHRoZSB1c3VhbCByZWNvbW1lbmRhdGlvbiB0aGF0ICJiYXJyaWVycyBtdXN0IGhhdmUgY29tbWVu
dHMKPiA+IGV4cGxhaW5pbmcgd2hhdCB0aGV5IG9yZGVyLCBhbmQgd2hlcmUgdGhlIG90aGVyIHNp
ZGUgb2YgdGhlIGJhcnJpZXIgaXMiLgo+ID4gVXNpbmcgdW5sb2NrL2xvY2sgYXMgYSBiYXJyaWVy
IGltbyBqdXN0IG1ha2VzIHRoYXQgYW4gZXZlbiBiZXR0ZXIgaWRlYS4KPiA+IFVzdWFsbHkgd2hh
dCBJIGRvIGlzIHNvbWV0aGluZyBsaWtlICJ3ZSBuZWVkIHRvIG9yZGVyICR0aGlzIGFnYWluc3Qg
JHRoYXQKPiA+IGJlbG93LCBhbmQgdGhlIG90aGVyIHNpZGUgb2YgdGhpcyBiYXJyaWVyIGlzIGlu
IGZ1bmN0aW9uKCkuIiBXaXRoIG1heWJlIGEKPiA+IGJpdCBtb3JlIGlmIGl0J3Mgbm90IG9idmlv
dXMgaG93IHRoaW5ncyBnbyB3cm9uZyBpZiB0aGUgb3JkZXJpbiBpcyBicm9rZW4uCj4gPiAKPiA+
IE9mYyBzZXFsb2NrLmggaXRzZWxmIHNraW1wcyBvbiB0aGF0IHJ1bGUgYW5kIGRvZXNuJ3QgYm90
aGVyIGV4cGxhaW5pbmcgaXRzCj4gPiBiYXJyaWVycyA6LS8KPiA+IAo+ID4gPiBJJ3ZlIGJlZW4g
dGVtcHRlZCB0byBmb3JjZSB0aGUgZHJpdmVyIHRvIHN0b3JlIHRoZSBzZXEgbnVtYmVyIGRpcmVj
dGx5Cj4gPiA+IHVuZGVyIHRoZSBkcml2ZXIgbG9jayAtIHRoaXMgbWFrZXMgdGhlIHNjaGVtZSBt
dWNoIGNsZWFyZXIsIGllCj4gPiA+IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPiA+IAo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKPiA+ID4gaW5kZXggNzEyYzk5OTE4NTUx
YmMuLjczOGZhNjcwZGNmYjE5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3N2bS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMKPiA+ID4gQEAgLTQ4OCw3ICs0ODgsOCBAQCBzdHJ1Y3Qgc3ZtX25vdGlmaWVy
IHsKPiA+ID4gICB9Owo+ID4gPiAgIHN0YXRpYyBib29sIG5vdXZlYXVfc3ZtX3JhbmdlX2ludmFs
aWRhdGUoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuLAo+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFu
Z2UgKnJhbmdlKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlLAo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2VxKQo+ID4gPiAg
IHsKPiA+ID4gICAgICAgICAgc3RydWN0IHN2bV9ub3RpZmllciAqc24gPQo+ID4gPiAgICAgICAg
ICAgICAgICAgIGNvbnRhaW5lcl9vZihtcm4sIHN0cnVjdCBzdm1fbm90aWZpZXIsIG5vdGlmaWVy
KTsKPiA+ID4gQEAgLTUwNCw2ICs1MDUsNyBAQCBzdGF0aWMgYm9vbCBub3V2ZWF1X3N2bV9yYW5n
ZV9pbnZhbGlkYXRlKHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXIgKm1ybiwKPiA+ID4gICAgICAg
ICAgICAgICAgICBtdXRleF9sb2NrKCZzbi0+c3ZtbS0+bXV0ZXgpOwo+ID4gPiAgICAgICAgICBl
bHNlIGlmICghbXV0ZXhfdHJ5bG9jaygmc24tPnN2bW0tPm11dGV4KSkKPiA+ID4gICAgICAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ICsgICAgICAgbW11X3JhbmdlX25vdGlmaWVyX3Vw
ZGF0ZV9zZXEobXJuLCBzZXEpOwo+ID4gPiAgICAgICAgICBtdXRleF91bmxvY2soJnNuLT5zdm1t
LT5tdXRleCk7Cj4gPiA+ICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gPiAgIH0KPiA+ID4gCj4g
PiA+IAo+ID4gPiBBdCB0aGUgY29zdCBvZiBtYWtpbmcgdGhlIGRyaXZlciBhIGJpdCBtb3JlIGNv
bXBsZXgsIHdoYXQgZG8geW91Cj4gPiA+IHRoaW5rPwo+ID4gSG0sIHNwaW5uaW5nIHRoaXMgZnVy
dGhlciAuLi4gY291bGQgd2UgaW5pdGlhbGl6ZSB0aGUgbW11IHJhbmdlIG5vdGlmaWVyCj4gPiB3
aXRoIGEgcG9pbnRlciB0byB0aGUgZHJpdmVyIGxvY2ssIHNvIHRoYXQgd2UgY291bGQgcHV0IGEK
PiA+IGxvY2tkZXBfYXNzZXJ0X2hlbGQgaW50byBtbXVfcmFuZ2Vfbm90aWZpZXJfdXBkYXRlX3Nl
cT8gSSB0aGluayB0aGF0IHdvdWxkCj4gPiBtYWtlIHRoaXMgc2NoZW1lIHN1YnN0YW50aWFsbHkg
bW9yZSBkcml2ZXItaGFja2VyIHByb29mIDotKQo+IAo+IEdvaW5nIGFub3RoZXIgc3RlcCBmdXJ0
aGVyLi4uLiB3aGF0IGhpbmRlcnMgdXMgdG8gcHV0IHRoZSBsb2NrIGludG8gdGhlIG1tdQo+IHJh
bmdlIG5vdGlmaWVyIGl0c2VsZiBhbmQgaGF2ZSBfbG9jaygpL191bmxvY2soKSBoZWxwZXJzPwo+
IAo+IEkgbWVhbiBoYXZpbmcgdGhlIGxvY2sgaW4gdGhlIGRyaXZlciBvbmx5IG1ha2VzIHNlbnNl
IHdoZW4gdGhlIGRyaXZlciB3b3VsZAo+IGJlIHVzaW5nIHRoZSBzYW1lIGxvY2sgZm9yIG11bHRp
cGxlIHRoaW5ncywgZS5nLiBtdWx0aXBsZSBNTVUgcmFuZ2UKPiBub3RpZmllcnMgdW5kZXIgdGhl
IHNhbWUgbG9jay4gQnV0IEkgcmVhbGx5IGRvbid0IHNlZSB0aGF0IHVzZSBjYXNlIGhlcmUuCgpJ
IGFjdHVhbHkgZG8sIG5vdXZlYXUgdXNlIG9uZSBsb2NrIHRvIHByb3RlY3QgdGhlIHBhZ2UgdGFi
bGUgYW5kIHRoYXQncyB0aGUKbG9jayB0aGF0IG1hdHRlci4gWW91IGNhbiBoYXZlIG11bHRpcGxl
IHJhbmdlIGZvciBhIHNpbmdsZSBwYWdlIHRhYmxlLCBpZGVhCmJlaW5nIG9ubHkgYSBzdWItc2V0
IG9mIHRoZSBwcm9jZXNzIGFkZHJlc3Mgc3BhY2UgaXMgZXZlciBhY2Nlc3NlZCBieSB0aGUKR1BV
IGFuZCB0aG9zZSBpdCBpcyBiZXR0ZXIgdG8gZm9jdXMgb24gdGhpcyBzdWItc2V0IGFuZCB0cmFj
ayBpbnZhbGlkYXRpb24gaW4KYSBmaW5lciBncmFpbi4KCkNoZWVycywKSsOpcsO0bWUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
