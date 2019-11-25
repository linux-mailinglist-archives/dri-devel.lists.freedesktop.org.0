Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973961091E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 17:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1B46E151;
	Mon, 25 Nov 2019 16:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC086E151
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 16:35:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-vqjpxLBbNgmyWArmMxBWLA-1; Mon, 25 Nov 2019 11:35:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA56A801E63;
 Mon, 25 Nov 2019 16:34:59 +0000 (UTC)
Received: from redhat.com (ovpn-120-216.rdu2.redhat.com [10.10.120.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A77CD60C63;
 Mon, 25 Nov 2019 16:34:58 +0000 (UTC)
Date: Mon, 25 Nov 2019 11:34:56 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191125163456.GB5516@redhat.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191123044417.GE14488@nvishwa1-DESK.sc.intel.com>
 <20191123235348.GD7481@mellanox.com>
 <20191124211247.GF14488@nvishwa1-DESK.sc.intel.com>
 <20191125132414.GQ7481@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191125132414.GQ7481@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: vqjpxLBbNgmyWArmMxBWLA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574699704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEl7guTW8sLWw4hnEJMV973DykWnJO6h4KmcaCM/N+o=;
 b=U96xCZ06R7FLL2R/eI7YRyK0zlLyahN5PN+6eFKmrWp0OMivbe3wTimuaaXw4Q3+brgvE9
 t9+MktHjgeyW6Aia6XHxKnwDF/Bdqhx498OqUPwp+oDpZ+9a8iYOaptwIkVesi6Z3q4/wF
 UOkoCWa9vw5sk3qrw85KsK16zb4EPo0=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDE6MjQ6MThQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFN1biwgTm92IDI0LCAyMDE5IGF0IDAxOjEyOjQ3UE0gLTA4MDAsIE5pcmFu
amFuIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToKPiAKPiA+ID4gPiA+IFVzaW5nIGEgdGVtcG9yYXJ5
IHJhbmdlIGlzIHRoZSBwYXR0ZXJuIGZyb20gbm91dmVhdSwgaXMgaXQgcmVhbGx5Cj4gPiA+ID4g
PiBuZWNlc3NhcnkgaW4gdGhpcyBkcml2ZXI/Cj4gPiA+ID4gCj4gPiA+ID4gWWFoLCBub3QgcmVx
dWlyZWQuIEluIG15IGxvY2FsIGJ1aWxkIEkgdHJpZWQgd2l0aCBwcm9wZXIgZGVmYXVsdF9mbGFn
cwo+ID4gPiA+IGFuZCBzZXQgcGZuX2ZsYWdzX21hc2sgdG8gMCBhbmQgaXQgaXMgd29ya2luZyBm
aW5lLgo+ID4gPiAKPiA+ID4gU29ycnksIEkgbWVudCBjYWxsaW5nIGhtbV9yYW5nZV9yZWdpc3Rl
ciBkdXJpbmcgZmF1bHQgcHJvY2Vzc2luZy4KPiA+ID4gCj4gPiA+IElmIHlvdXIgZHJpdmVyIHdv
cmtzIGFyb3VuZCB1c2VyIHNwYWNlIG9iamVjdHMgdGhhdCBjb3ZlciBhIFZBIHRoZW4KPiA+ID4g
dGhlIHJhbmdlIHNob3VsZCBiZSBjcmVhdGVkIHdoZW4gdGhlIG9iamVjdCBpcyBjcmVhdGVkLgo+
ID4gPiAKPiA+IAo+ID4gT2ggb2suIE5vLCB0aGVyZSBpcyBubyB1c2VyIHNwYWNlIG9iamVjdCBo
ZXJlLgo+ID4gQmluZGluZyB0aGUgdXNlciBzcGFjZSBvYmplY3QgdG8gZGV2aWNlIHBhZ2UgdGFi
bGUgaXMgaGFuZGxlZCBpbgo+ID4gcGF0Y2ggMDMgb2YgdGhpcyBzZXJpZXMgKG5vIEhNTSB0aGVy
ZSkuCj4gPiBUaGlzIGlzIGZvciBiaW5kaW5nIGEgc3lzdGVtIGFsbG9jYXRlZCAobWFsbG9jKSBt
ZW1vcnkuIFVzZXIgY2FsbHMKPiA+IHRoZSBiaW5kIGlvY3RsIHdpdGggdGhlIFZBIHJhbmdlLgo+
ID4gCj4gPiA+ID4gPiA+ICsJLyoKPiA+ID4gPiA+ID4gKwkgKiBObyBuZWVkZCB0byBkbWEgbWFw
IHRoZSBob3N0IHBhZ2VzIGFuZCBsYXRlciB1bm1hcCBpdCwgYXMKPiA+ID4gPiA+ID4gKwkgKiBH
UFUgaXMgbm90IGFsbG93ZWQgdG8gYWNjZXNzIGl0IHdpdGggU1ZNLiBIZW5jZSwgbm8gbmVlZAo+
ID4gPiA+ID4gPiArCSAqIG9mIGFueSBpbnRlcm1lZGlhdGUgZGF0YSBzdHJ1Y3V0cmUgdG8gaG9s
ZCB0aGUgbWFwcGluZ3MuCj4gPiA+ID4gPiA+ICsJICovCj4gPiA+ID4gPiA+ICsJZm9yIChpID0g
MDsgaSA8IG5wYWdlczsgaSsrKSB7Cj4gPiA+ID4gPiA+ICsJCXU2NCBhZGRyID0gcmFuZ2UtPnBm
bnNbaV0gJiB+KCgxVUwgPDwgcmFuZ2UtPnBmbl9zaGlmdCkgLSAxKTsKPiA+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gPiArCQlpZiAoc2cgJiYgKGFkZHIgPT0gKHNnX2RtYV9hZGRyZXNzKHNnKSArIHNn
LT5sZW5ndGgpKSkgewo+ID4gPiA+ID4gPiArCQkJc2ctPmxlbmd0aCArPSBQQUdFX1NJWkU7Cj4g
PiA+ID4gPiA+ICsJCQlzZ19kbWFfbGVuKHNnKSArPSBQQUdFX1NJWkU7Cj4gPiA+ID4gPiA+ICsJ
CQljb250aW51ZTsKPiA+ID4gPiA+ID4gKwkJfQo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsJ
CWlmIChzZykKPiA+ID4gPiA+ID4gKwkJCXNnX3BhZ2Vfc2l6ZXMgfD0gc2ctPmxlbmd0aDsKPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArCQlzZyA9ICBzZyA/IF9fc2dfbmV4dChzZykgOiBzdC0+
c2dsOwo+ID4gPiA+ID4gPiArCQlzZ19kbWFfYWRkcmVzcyhzZykgPSBhZGRyOwo+ID4gPiA+ID4g
PiArCQlzZ19kbWFfbGVuKHNnKSA9IFBBR0VfU0laRTsKPiA+ID4gPiA+ID4gKwkJc2ctPmxlbmd0
aCA9IFBBR0VfU0laRTsKPiA+ID4gPiA+ID4gKwkJc3QtPm5lbnRzKys7Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gSXQgaXMgb2RkIHRvIGJ1aWxkIHRoZSByYW5nZSBpbnRvIGEgc2dsLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IElNSE8gaXQgaXMgbm90IGEgZ29vZCBpZGVhIHRvIHVzZSB0aGUgc2dfZG1hX2Fk
ZHJlc3MgbGlrZSB0aGlzLCB0aGF0Cj4gPiA+ID4gPiBzaG91bGQgb25seSBiZSBmaWxsZWQgaW4g
YnkgYSBkbWEgbWFwLiBXaGVyZSBkb2VzIGl0IGVuZCB1cCBiZWluZwo+ID4gPiA+ID4gdXNlZD8K
PiA+ID4gPiAKPiA+ID4gPiBUaGUgc2dsIGlzIHVzZWQgdG8gcGx1ZyBpbnRvIHRoZSBwYWdlIHRh
YmxlIHVwZGF0ZSBmdW5jdGlvbiBpbiBpOTE1Lgo+ID4gPiA+IAo+ID4gPiA+IEZvciB0aGUgZGV2
aWNlIG1lbW9yeSBpbiBkaXNjcmV0ZSBjYXJkLCB3ZSBkb24ndCBuZWVkIGRtYSBtYXAgd2hpY2gK
PiA+ID4gPiBpcyB0aGUgY2FzZSBoZXJlLgo+ID4gPiAKPiA+ID4gSG93IGRpZCB3ZSBnZXQgdG8g
ZGV2aWNlIG1lbW9yeSBvbiBhIGNhcmQ/IElzbid0IHJhbmdlLT5wZm5zIGEgQ1BVIFBGTgo+ID4g
PiBhdCB0aGlzIHBvaW50Pwo+ID4gPiAKPiA+ID4gSSdtIGNvbmZ1c2VkLgo+ID4gCj4gPiBEZXZp
Y2UgbWVtb3J5IHBsdWdpbiBpcyBkb25lIHRocm91Z2ggZGV2bV9tZW1yZW1hcF9wYWdlcygpIGlu
IHBhdGNoIDA3IG9mCj4gPiB0aGlzIHNlcmllcy4gSW4gdGhhdCBwYXRjaCwgd2UgY29udmVydCB0
aGUgQ1BVIFBGTiB0byBkZXZpY2UgUEZOIGJlZm9yZQo+ID4gYnVpbGRpbmcgdGhlIHNnbCAodGhp
cyBpcyBzaW1pbGFyIHRvIHRoZSBub3V2ZWF1IGRyaXZlcikuCj4gCj4gQnV0IGVhcmxpZXIganVz
dCBjYWxsZWQgaG1tX3JhbmdlX2ZhdWx0KCksIGl0IGNhbiByZXR1cm4gYWxsIGtpbmRzIG9mCj4g
cGFnZXMuIElmIHRoZXNlIGFyZSBvbmx5IGFsbG93ZWQgdG8gYmUgZGV2aWNlIHBhZ2VzIGhlcmUg
dGhlbiB0aGF0Cj4gbXVzdCBiZSBjaGVja2VkICh1bmRlciBsb2NrKQo+IAo+IEFuZCBwdXR0aW5n
IHRoZSBjcHUgUEZOIG9mIGEgWk9ORV9ERVZJQ0UgZGV2aWNlIHBhZ2UgaW50bwo+IHNnX2RtYV9h
ZGRyZXNzIHN0aWxsIGxvb2tzIHZlcnkgd3JvbmcgdG8gbWUKClllYWgsIG5vdXZlYXUgaGFzIGRp
ZmZlcmVudCBjb2RlIHBhdGggYnV0IHRoaXMgaXMgYmVjYXVzZSBub3V2ZWF1CmRyaXZlciBhcmNo
aXRlY3R1cmUgYWxsb3dzIGl0LCBpIGRvIG5vdCBzZWUgYW55IGVhc3kgd2F5IHRvIGhhbW1lcgp0
aGlzIGluc2lkZSBpOTE1IGN1cnJlbnQgYXJjaGl0ZWN0dXJlLiBJIHdpbGwgcG9uZGVyIG9uIHRo
aXMgYSBiaXQKbW9yZS4KCkNoZWVycywKSsOpcsO0bWUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
