Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3F91A90F
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 20:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CEE89704;
	Sat, 11 May 2019 18:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8B899D5;
 Fri, 10 May 2019 09:28:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEE65AD9D;
 Fri, 10 May 2019 09:28:19 +0000 (UTC)
Date: Fri, 10 May 2019 11:28:19 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] kernel/locking/semaphore: use wake_q in up()
Message-ID: <20190510092819.elu4b7fcojzcek2q@pathway.suse.cz>
References: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
 <20190509200633.19678-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509200633.19678-1-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20170912 (1.9.0)
X-Mailman-Approved-At: Sat, 11 May 2019 18:22:57 +0000
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDIwMTktMDUtMDkgMjI6MDY6MzMsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gY29uc29s
ZV90cnlsb2NrLCBjYWxsZWQgZnJvbSB3aXRoaW4gcHJpbnRrLCBjYW4gYmUgY2FsbGVkIGZyb20g
cHJldHR5Cj4gbXVjaCBhbnl3aGVyZS4gSW5jbHVkaW5nIHRyeV90b193YWtlX3VwLiBOb3RlIHRo
YXQgdGhpcyBpc24ndCBjb21tb24sCj4gdXN1YWxseSB0aGUgYm94IGlzIGluIHByZXR0eSBiYWQg
c2hhcGUgYXQgdGhhdCBwb2ludCBhbHJlYWR5LiBCdXQgaXQKPiByZWFsbHkgZG9lc24ndCBoZWxw
IHdoZW4gdGhlbiBsb2NrZGVwIGp1bXBzIGluIGFuZCBzcGFtcyB0aGUgbG9ncywKPiBwb3RlbnRp
YWxseSBvYnNjdXJpbmcgdGhlIHJlYWwgYmFja3RyYWNlIHdlJ3JlIHJlYWxseSBpbnRlcmVzdGVk
IGluLgo+IE9uZSBjYXNlIEkndmUgc2VlbiAoc2xpZ2h0bHkgc2ltcGxpZmllZCBiYWNrdHJhY2Up
Ogo+IAo+IEZpeCB0aGlzIHNwZWNpZmljIGxvY2tpbmcgcmVjdXJzaW9uIGJ5IG1vdmluZyB0aGUg
d2FrZV91cF9wcm9jZXNzIG91dAo+IGZyb20gdW5kZXIgdGhlIHNlbWFwaG9yZS5sb2NrIHNwaW5s
b2NrLCB1c2luZyB3YWtlX3EgYXMgcmVjb21tZW5kZWQgYnkKPiBQZXRlciBaaWpsc3RyYS4KCkl0
IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gbWVudGlvbiBhbHNvIHRoZSBvcHRpbWl6YXRpb24gZWZmZWN0
IG1lbnRpb25lZApieSBQZXRlci4KCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL3NlbWFw
aG9yZS5jIGIva2VybmVsL2xvY2tpbmcvc2VtYXBob3JlLmMKPiBpbmRleCA1NjFhY2RkMzk5NjAu
LjdhNmYzMzcxNTY4OCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvbG9ja2luZy9zZW1hcGhvcmUuYwo+
ICsrKyBiL2tlcm5lbC9sb2NraW5nL3NlbWFwaG9yZS5jCj4gQEAgLTE2OSw2ICsxNjksMTQgQEAg
aW50IGRvd25fdGltZW91dChzdHJ1Y3Qgc2VtYXBob3JlICpzZW0sIGxvbmcgdGltZW91dCkKPiAg
fQo+ICBFWFBPUlRfU1lNQk9MKGRvd25fdGltZW91dCk7Cj4gIAo+ICsvKiBGdW5jdGlvbnMgZm9y
IHRoZSBjb250ZW5kZWQgY2FzZSAqLwo+ICsKPiArc3RydWN0IHNlbWFwaG9yZV93YWl0ZXIgewo+
ICsJc3RydWN0IGxpc3RfaGVhZCBsaXN0Owo+ICsJc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrOwo+
ICsJYm9vbCB1cDsKPiArfTsKPiArCj4gIC8qKgo+ICAgKiB1cCAtIHJlbGVhc2UgdGhlIHNlbWFw
aG9yZQo+ICAgKiBAc2VtOiB0aGUgc2VtYXBob3JlIHRvIHJlbGVhc2UKPiBAQCAtMTc5LDI0ICsx
ODcsMjUgQEAgRVhQT1JUX1NZTUJPTChkb3duX3RpbWVvdXQpOwo+ICB2b2lkIHVwKHN0cnVjdCBz
ZW1hcGhvcmUgKnNlbSkKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCXN0cnVjdCBz
ZW1hcGhvcmVfd2FpdGVyICp3YWl0ZXI7Cj4gKwlERUZJTkVfV0FLRV9RKHdha2VfcSk7CgpXZSBu
ZWVkIHRvIGNhbGwgd2FrZV9xX2luaXQoJndha2VfcSkgdG8gbWFrZSBzdXJlIHRoYXQKaXQgaXMg
ZW1wdHkuCgpCZXN0IFJlZ2FyZHMsClBldHIKCj4gIAlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJnNl
bS0+bG9jaywgZmxhZ3MpOwo+IC0JaWYgKGxpa2VseShsaXN0X2VtcHR5KCZzZW0tPndhaXRfbGlz
dCkpKQo+ICsJaWYgKGxpa2VseShsaXN0X2VtcHR5KCZzZW0tPndhaXRfbGlzdCkpKSB7Cj4gIAkJ
c2VtLT5jb3VudCsrOwo+IC0JZWxzZQo+IC0JCV9fdXAoc2VtKTsKPiArCX0gZWxzZSB7Cj4gKwkJ
d2FpdGVyID0gIGxpc3RfZmlyc3RfZW50cnkoJnNlbS0+d2FpdF9saXN0LAo+ICsJCQkJCSAgIHN0
cnVjdCBzZW1hcGhvcmVfd2FpdGVyLCBsaXN0KTsKPiArCQlsaXN0X2RlbCgmd2FpdGVyLT5saXN0
KTsKPiArCQl3YWl0ZXItPnVwID0gdHJ1ZTsKPiArCQl3YWtlX3FfYWRkKCZ3YWtlX3EsIHdhaXRl
ci0+dGFzayk7Cj4gKwl9Cj4gIAlyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2VtLT5sb2Nr
LCBmbGFncyk7Cj4gKwo+ICsJd2FrZV91cF9xKCZ3YWtlX3EpOwo+ICB9Cj4gIEVYUE9SVF9TWU1C
T0wodXApOwo+ICAKPiAtLyogRnVuY3Rpb25zIGZvciB0aGUgY29udGVuZGVkIGNhc2UgKi8KPiAt
Cj4gLXN0cnVjdCBzZW1hcGhvcmVfd2FpdGVyIHsKPiAtCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsK
PiAtCXN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzazsKPiAtCWJvb2wgdXA7Cj4gLX07Cj4gLQo+ICAv
Kgo+ICAgKiBCZWNhdXNlIHRoaXMgZnVuY3Rpb24gaXMgaW5saW5lZCwgdGhlICdzdGF0ZScgcGFy
YW1ldGVyIHdpbGwgYmUKPiAgICogY29uc3RhbnQsIGFuZCB0aHVzIG9wdGltaXNlZCBhd2F5IGJ5
IHRoZSBjb21waWxlci4gIExpa2V3aXNlIHRoZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
