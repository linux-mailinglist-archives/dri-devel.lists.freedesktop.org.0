Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0724D45
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 12:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EA5892F0;
	Tue, 21 May 2019 10:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC78892F0;
 Tue, 21 May 2019 10:53:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 03:53:07 -0700
X-ExtLoop1: 1
Received: from asaudi-mobl.ger.corp.intel.com (HELO [10.249.47.52])
 ([10.249.47.52])
 by orsmga005.jf.intel.com with ESMTP; 21 May 2019 03:53:00 -0700
Subject: Re: [PATCH 19/33] fbdev: unify unlink_framebufer paths
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-20-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <f3d7a95e-358b-1181-7a62-ce364003a8d6@linux.intel.com>
Date: Tue, 21 May 2019 12:52:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520082216.26273-20-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Hans de Goede <hdegoede@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

XlR5cG8gaW4gc3ViamVjdC4KCk9wIDIwLTA1LTIwMTkgb20gMTA6MjIgc2NocmVlZiBEYW5pZWwg
VmV0dGVyOgo+IEZvciBzb21lIHJlYXNvbnMgdGhlIHBtX3Z0X3N3aXRjaF91bnJlZ2lzdGVyIGNh
bGwgd2FzIG1pc3NpbmcgZnJvbSB0aGUKPiBkaXJlY3QgdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlciBw
YXRoLiBGaXggdGhpcy4KPgo+IHYyOiBmYmluZm8tPmRldiBpcyB1c2VkIHRvIGRlY2lkZWQgd2hl
dGhlciB1bmxpbmtfZnJhbWVidWZmZXIgaGFzIGJlZW4KPiBjYWxsZWQgYWxyZWFkeS4gSSBib3Rj
aGVkIHRoYXQgaW4gdjEuIE1ha2UgdGhpcyBhbGwgY2xlYXJlciBieQo+IGlubGluaW5nIF9fdW5s
aW5rX2ZyYW1lYnVmZmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9s
bmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPiBDYzogIk1pY2hhxYIgTWlyb3PFgmF3IiA8bWlycS1saW51eEByZXJlLnFtcW0u
cGw+Cj4gQ2M6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+Cj4gQ2M6IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gQ2M6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FA
cmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCA0
NyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
Ywo+IGluZGV4IDAzMjUwNjU3NmFhMC4uZjA1OWIwYjFhMDMwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZibWVtLmMKPiBAQCAtMTcxNCwxNSArMTcxNCwzMCBAQCBzdGF0aWMgdm9pZCB1bmJpbmRf
Y29uc29sZShzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKPiAgCWNvbnNvbGVfdW5sb2NrKCk7Cj4g
IH0KPiAgCj4gLXN0YXRpYyB2b2lkIF9fdW5saW5rX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZv
ICpmYl9pbmZvKTsKPiAtCj4gLXN0YXRpYyB2b2lkIGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIo
c3RydWN0IGZiX2luZm8gKmZiX2luZm8pCj4gK3ZvaWQgdW5saW5rX2ZyYW1lYnVmZmVyKHN0cnVj
dCBmYl9pbmZvICpmYl9pbmZvKQo+ICB7Cj4gLQl1bmJpbmRfY29uc29sZShmYl9pbmZvKTsKPiAr
CWludCBpOwo+ICsKPiArCWkgPSBmYl9pbmZvLT5ub2RlOwo+ICsJaWYgKFdBUk5fT04oaSA8IDAg
fHwgaSA+PSBGQl9NQVggfHwgcmVnaXN0ZXJlZF9mYltpXSAhPSBmYl9pbmZvKSkKPiArCQlyZXR1
cm47Cj4gKwo+ICsJaWYgKCFmYl9pbmZvLT5kZXYpCj4gKwkJcmV0dXJuOwo+ICsKPiArCWRldmlj
ZV9kZXN0cm95KGZiX2NsYXNzLCBNS0RFVihGQl9NQUpPUiwgaSkpOwo+ICAKPiAgCXBtX3Z0X3N3
aXRjaF91bnJlZ2lzdGVyKGZiX2luZm8tPmRldik7Cj4gIAo+IC0JX191bmxpbmtfZnJhbWVidWZm
ZXIoZmJfaW5mbyk7Cj4gKwl1bmJpbmRfY29uc29sZShmYl9pbmZvKTsKPiArCj4gKwlmYl9pbmZv
LT5kZXYgPSBOVUxMOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0wodW5saW5rX2ZyYW1lYnVmZmVyKTsK
PiArCj4gK3N0YXRpYyB2b2lkIGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2lu
Zm8gKmZiX2luZm8pCj4gK3sKPiArCXVubGlua19mcmFtZWJ1ZmZlcihmYl9pbmZvKTsKPiAgCWlm
IChmYl9pbmZvLT5waXhtYXAuYWRkciAmJgo+ICAJICAgIChmYl9pbmZvLT5waXhtYXAuZmxhZ3Mg
JiBGQl9QSVhNQVBfREVGQVVMVCkpCj4gIAkJa2ZyZWUoZmJfaW5mby0+cGl4bWFwLmFkZHIpOwo+
IEBAIC0xNzM4LDI4ICsxNzUzLDYgQEAgc3RhdGljIHZvaWQgZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1
ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKPiAgCXB1dF9mYl9pbmZvKGZiX2luZm8pOwo+
ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBfX3VubGlua19mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5m
byAqZmJfaW5mbykKPiAtewo+IC0JaW50IGk7Cj4gLQo+IC0JaSA9IGZiX2luZm8tPm5vZGU7Cj4g
LQlpZiAoV0FSTl9PTihpIDwgMCB8fCBpID49IEZCX01BWCB8fCByZWdpc3RlcmVkX2ZiW2ldICE9
IGZiX2luZm8pKQo+IC0JCXJldHVybjsKPiAtCj4gLQlpZiAoZmJfaW5mby0+ZGV2KSB7Cj4gLQkJ
ZGV2aWNlX2Rlc3Ryb3koZmJfY2xhc3MsIE1LREVWKEZCX01BSk9SLCBpKSk7Cj4gLQkJZmJfaW5m
by0+ZGV2ID0gTlVMTDsKPiAtCX0KPiAtfQo+IC0KPiAtdm9pZCB1bmxpbmtfZnJhbWVidWZmZXIo
c3RydWN0IGZiX2luZm8gKmZiX2luZm8pCj4gLXsKPiAtCV9fdW5saW5rX2ZyYW1lYnVmZmVyKGZi
X2luZm8pOwo+IC0KPiAtCXVuYmluZF9jb25zb2xlKGZiX2luZm8pOwo+IC19Cj4gLUVYUE9SVF9T
WU1CT0wodW5saW5rX2ZyYW1lYnVmZmVyKTsKPiAtCj4gIC8qKgo+ICAgKiByZW1vdmVfY29uZmxp
Y3RpbmdfZnJhbWVidWZmZXJzIC0gcmVtb3ZlIGZpcm13YXJlLWNvbmZpZ3VyZWQgZnJhbWVidWZm
ZXJzCj4gICAqIEBhOiBtZW1vcnkgcmFuZ2UsIHVzZXJzIG9mIHdoaWNoIGFyZSB0byBiZSByZW1v
dmVkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
