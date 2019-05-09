Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A7189CA
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 14:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A4689BF8;
	Thu,  9 May 2019 12:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97F989BF8;
 Thu,  9 May 2019 12:31:27 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOiCX-00033y-Vv; Thu, 09 May 2019 12:31:06 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 76A562029F884; Thu,  9 May 2019 14:31:04 +0200 (CEST)
Date: Thu, 9 May 2019 14:31:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] RFC: console: hack up console_lock more v3
Message-ID: <20190509123104.GQ2589@hirez.programming.kicks-ass.net>
References: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=STuNDqhHWk4xUPlw4l8ibpyKNVMs8YJpESd8dG0MbCA=; b=MDs2QHjlE/RbLxY2I/iid5ZpW
 GshO7LKO+WxIhPVZCajrx7EVEqK+CKKczBKtK5Or3RAXVoh0TFWiI2fNxWfmCZsjee/oDW3qHCHK8
 cxwH951iYsoPvcVFDFeE9+o5qu8Ahk5UESKy70qrO4dz3jLNxDrzgVuPqGQ/+JMTevEtjWWkN3vyP
 IG1owGFEZWKeVgJUFNjzV0pep/I7uBW47bzY7K6wxYDN/SRHIAUA2LatMcitFhfjuV1YnPF5SlOYF
 8lGAoQNRLs+HqgKOBPZHRmTrrvhfc9kKPgig33rBKnGdg8Q0Kxrjxy/0ZzbuaXnk4nHvT3nM2NOI9
 operbSoww==;
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
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

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDI6MDk6MDNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBGaXggdGhpcyBieSBjcmVhdGluZyBhIHByaW5rdF9zYWZlX3VwKCkgd2hpY2ggY2Fs
bHMgd2FrZV91cF9wcm9jZXNzCj4gb3V0c2lkZSBvZiB0aGUgc3BpbmxvY2suIFRoaXMgaXNuJ3Qg
Y29ycmVjdCBpbiBmdWxsIGdlbmVyYWxpdHksIGJ1dAo+IGdvb2QgZW5vdWdoIGZvciBjb25zb2xl
X2xvY2s6Cj4gCj4gLSBjb25zb2xlX2xvY2sgZG9lc24ndCB1c2UgaW50ZXJydXB0aWJsZSBvciBr
aWxsYWJsZSBvciB0aW1lb3V0IGRvd24oKQo+ICAgY2FsbHMsIGhlbmNlIGFuIHVwKCkgaXMgdGhl
IG9ubHkgdGhpbmcgdGhhdCBjYW4gd2FrZSB1cCBhIHByb2Nlc3MuCgpXcm9uZyA6LyBBbnkgdGFz
ayBjYW4gYmUgd29rZW4gYXQgYW55IHJhbmRvbSB0aW1lLiBXZSBtdXN0LCBhdCBhbGwKdGltZXMs
IGFzc3VtZSBzcHVyaW91cyB3YWtldXBzIHdpbGwgaGFwcGVuLgoKPiArdm9pZCBwcmludGtfc2Fm
ZV91cChzdHJ1Y3Qgc2VtYXBob3JlICpzZW0pCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
Cj4gKwlzdHJ1Y3Qgc2VtYXBob3JlX3dhaXRlciAqd2FpdGVyID0gTlVMTDsKPiArCj4gKwlyYXdf
c3Bpbl9sb2NrX2lycXNhdmUoJnNlbS0+bG9jaywgZmxhZ3MpOwo+ICsJaWYgKGxpa2VseShsaXN0
X2VtcHR5KCZzZW0tPndhaXRfbGlzdCkpKSB7Cj4gKwkJc2VtLT5jb3VudCsrOwo+ICsJfSBlbHNl
IHsKPiArCQl3YWl0ZXIgPSBsaXN0X2ZpcnN0X2VudHJ5KCZzZW0tPndhaXRfbGlzdCwKPiArCQkJ
CQkgIHN0cnVjdCBzZW1hcGhvcmVfd2FpdGVyLCBsaXN0KTsKPiArCQlsaXN0X2RlbCgmd2FpdGVy
LT5saXN0KTsKPiArCQl3YWl0ZXItPnVwID0gdHJ1ZTsKPiArCX0KPiArCXJhd19zcGluX3VubG9j
a19pcnFyZXN0b3JlKCZzZW0tPmxvY2ssIGZsYWdzKTsKPiArCj4gKwlpZiAod2FpdGVyKSAvKiBw
cm90ZWN0ZWQgYnkgYmVpbmcgc29sZSB3YWtlIHNvdXJjZSAqLwo+ICsJCXdha2VfdXBfcHJvY2Vz
cyh3YWl0ZXItPnRhc2spOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0wocHJpbnRrX3NhZmVfdXApOwoK
U2luY2UgaXRzIG9ubHkgdXNlZCBmcm9tIHByaW50aywgdGhhdCBFWFBPUlQgcmVhbGx5IGlzbid0
IG5lZWRlZC4KClNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyBtaWdodCB3b3JrLgoKLS0tCiBrZXJu
ZWwvbG9ja2luZy9zZW1hcGhvcmUuYyB8IDI2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEva2VybmVsL2xvY2tpbmcvc2VtYXBob3JlLmMgYi9rZXJuZWwvbG9ja2luZy9zZW1hcGhv
cmUuYwppbmRleCA1NjFhY2RkMzk5NjAuLmFjMGE2N2U5NWFhYyAxMDA2NDQKLS0tIGEva2VybmVs
L2xvY2tpbmcvc2VtYXBob3JlLmMKKysrIGIva2VybmVsL2xvY2tpbmcvc2VtYXBob3JlLmMKQEAg
LTM4LDcgKzM4LDYgQEAgc3RhdGljIG5vaW5saW5lIHZvaWQgX19kb3duKHN0cnVjdCBzZW1hcGhv
cmUgKnNlbSk7CiBzdGF0aWMgbm9pbmxpbmUgaW50IF9fZG93bl9pbnRlcnJ1cHRpYmxlKHN0cnVj
dCBzZW1hcGhvcmUgKnNlbSk7CiBzdGF0aWMgbm9pbmxpbmUgaW50IF9fZG93bl9raWxsYWJsZShz
dHJ1Y3Qgc2VtYXBob3JlICpzZW0pOwogc3RhdGljIG5vaW5saW5lIGludCBfX2Rvd25fdGltZW91
dChzdHJ1Y3Qgc2VtYXBob3JlICpzZW0sIGxvbmcgdGltZW91dCk7Ci1zdGF0aWMgbm9pbmxpbmUg
dm9pZCBfX3VwKHN0cnVjdCBzZW1hcGhvcmUgKnNlbSk7CiAKIC8qKgogICogZG93biAtIGFjcXVp
cmUgdGhlIHNlbWFwaG9yZQpAQCAtMTc4LDE0ICsxNzcsMjQgQEAgRVhQT1JUX1NZTUJPTChkb3du
X3RpbWVvdXQpOwogICovCiB2b2lkIHVwKHN0cnVjdCBzZW1hcGhvcmUgKnNlbSkKIHsKKwlzdHJ1
Y3Qgc2VtYXBob3JlX3dhaXRlciAqd2FpdGVyOworCURFRklORV9XQUtFX1Eod2FrZV9xKTsKIAl1
bnNpZ25lZCBsb25nIGZsYWdzOwogCiAJcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZzZW0tPmxvY2ss
IGZsYWdzKTsKLQlpZiAobGlrZWx5KGxpc3RfZW1wdHkoJnNlbS0+d2FpdF9saXN0KSkpCisJaWYg
KGxpa2VseShsaXN0X2VtcHR5KCZzZW0tPndhaXRfbGlzdCkpKSB7CiAJCXNlbS0+Y291bnQrKzsK
LQllbHNlCi0JCV9fdXAoc2VtKTsKKwkJZ290byB1bmxvY2s7CisJfQorCisJd2FpdGVyID0gbGlz
dF9maXJzdF9lbnRyeSgmc2VtLT53YWl0X2xpc3QsIHN0cnVjdCBzZW1hcGhvcmVfd2FpdGVyLCBs
aXN0KTsKKwlsaXN0X2RlbCgmd2FpdGVyLT5saXN0KTsKKwl3YWl0ZXItPnVwID0gdHJ1ZTsKKwl3
YWtlX3FfYWRkKCZ3YWtlX3EsIHdhaXRlci0+dGFzayk7Cit1bmxvY2s6CiAJcmF3X3NwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJnNlbS0+bG9jaywgZmxhZ3MpOworCisJd2FrZV91cF9xKCZ3YWtlX3Ep
OwogfQogRVhQT1JUX1NZTUJPTCh1cCk7CiAKQEAgLTI1MiwxMiArMjYxLDMgQEAgc3RhdGljIG5v
aW5saW5lIGludCBfX3NjaGVkIF9fZG93bl90aW1lb3V0KHN0cnVjdCBzZW1hcGhvcmUgKnNlbSwg
bG9uZyB0aW1lb3V0KQogewogCXJldHVybiBfX2Rvd25fY29tbW9uKHNlbSwgVEFTS19VTklOVEVS
UlVQVElCTEUsIHRpbWVvdXQpOwogfQotCi1zdGF0aWMgbm9pbmxpbmUgdm9pZCBfX3NjaGVkIF9f
dXAoc3RydWN0IHNlbWFwaG9yZSAqc2VtKQotewotCXN0cnVjdCBzZW1hcGhvcmVfd2FpdGVyICp3
YWl0ZXIgPSBsaXN0X2ZpcnN0X2VudHJ5KCZzZW0tPndhaXRfbGlzdCwKLQkJCQkJCXN0cnVjdCBz
ZW1hcGhvcmVfd2FpdGVyLCBsaXN0KTsKLQlsaXN0X2RlbCgmd2FpdGVyLT5saXN0KTsKLQl3YWl0
ZXItPnVwID0gdHJ1ZTsKLQl3YWtlX3VwX3Byb2Nlc3Mod2FpdGVyLT50YXNrKTsKLX0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
