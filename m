Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870952A07B4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 15:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D3A6EDE3;
	Fri, 30 Oct 2020 14:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975D76E9C4;
 Fri, 30 Oct 2020 14:19:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22845286-1500050 for multiple; Fri, 30 Oct 2020 14:19:46 +0000
MIME-Version: 1.0
In-Reply-To: <20201022194256.30978-1-ville.syrjala@linux.intel.com>
References: <20201022194256.30978-1-ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/modes: Switch to 64bit maths to avoid integer overflow
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Date: Fri, 30 Oct 2020 14:19:45 +0000
Message-ID: <160406758530.15070.9622609556730885347@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDIwLTEwLTIyIDIwOjQyOjU2KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVGhlIG5ldyA+
OGsgQ0VBIG1vZGVzIGhhdmUgZG90Y2xvY2tzIHJlYWNoaW5nIDUuOTQgR0h6LCB3aGljaAo+IG1l
YW5zIG91ciBjbG9jayoxMDAwIHdpbGwgbm93IG92ZXJmbG93IHRoZSAzMmJpdCB1bnNpZ25lZAo+
IGludGVnZXIuIFN3aXRjaCB0byA2NGJpdCBtYXRocyB0byBhdm9pZCBpdC4KPiAKPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwo+IFJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+IEFuIGludGVyZXN0aW5nIHF1ZXN0aW9uIGhv
dyBtYW55IG90aGVyIHBsYWNlIG1pZ2h0IHN1ZmZlciBmcm9tIHNpbWlsYXIKPiBvdmVyZmxvd3Mu
IEkgdGhpbmsgaTkxNSBzaG91bGQgYmUgbW9zdGx5IE9LLiBUaGUgb25lIHBsYWNlIEkga25vdyB3
ZSB1c2UKPiBIeiBpbnN0ZWFkIGtIeiBpcyB0aGUgaHN3IERQTEwgY29kZSwgd2hpY2ggSSB3b3Vs
ZCBwcmVmZXIgd2UgYWxzbyBjaGFuZ2UKPiB0byB1c2Uga0h6LiBUaGUgb3RoZXIgY29uY2VybiBp
cyB3aGV0aGVyIHdlIGhhdmUgYW55IHBvdGVudGlhbCBvdmVyZmxvd3MKPiBiZWZvcmUgd2UgY2hl
Y2sgdGhpcyBhZ2FpbnN0IHRoZSBwbGF0Zm9ybSdzIG1heCBkb3RjbG9jay4KPiAKPiBJIGRvIGhh
dmUgdGhpcyB1bnJldmlld2VkIGlndCBzZXJpZXMgCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy82OTUzMS8gd2hpY2ggZXh0ZW5kcyB0aGUKPiBjdXJyZW50IHRlc3Rp
bmcgd2l0aCBzb21lIG90aGVyIGZvcm1zIG9mIGludmFsaWQgbW9kZXMuIENvdWxkIHByb2JhYmx5
Cj4gZXh0ZW5kIHRoYXQgd2l0aCBhIG1vZGUuY2xvY2s9SU5UX01BWCB0ZXN0IHRvIHNlZSBpZiBh
bnl0aGluZyBlbHNlIG1pZ2h0Cj4gdHJpcCB1cC4KPiAKPiBObyBpZGVhIGFib3V0IG90aGVyIGRy
aXZlcnMuCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVzLmMKPiBpbmRleCA1MDFiNGZlNTVhM2QuLjUxMWNkZTVjN2ZhNiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVzLmMKPiBAQCAtNzYyLDcgKzc2Miw3IEBAIGludCBkcm1fbW9kZV92cmVmcmVzaChjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAgICAgICAgIGlmIChtb2RlLT5odG90YWwg
PT0gMCB8fCBtb2RlLT52dG90YWwgPT0gMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
IAo+IC0gICAgICAgbnVtID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+ICsgICAgICAgbnVtID0gbW9k
ZS0+Y2xvY2s7Cj4gICAgICAgICBkZW4gPSBtb2RlLT5odG90YWwgKiBtb2RlLT52dG90YWw7CgpZ
b3UgZG9uJ3Qgd2FudCB0byBwcm9tb3RlIGRlbiB0byB1NjQgd2hpbGUgeW91IGFyZSBoZXJlPyBX
ZSBhcmUgYXQKOGt4NGssIHRocm93IGluIGRibHNjYW4gYW5kIHNvbWUgdnNjYW4sIGFuZCB3ZSBj
b3VsZCBzb29uIGhhdmUgd2Fja3kKcmVmcmVzaCByYXRlcy4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
