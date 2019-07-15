Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F969CB9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 22:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEF189A76;
	Mon, 15 Jul 2019 20:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389BF89A76
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 20:24:26 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE64C20665;
 Mon, 15 Jul 2019 20:24:25 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190712081744.87097-3-brendanhiggins@google.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-3-brendanhiggins@google.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
Subject: Re: [PATCH v9 02/18] kunit: test: add test resource management API
User-Agent: alot/0.8.1
Date: Mon, 15 Jul 2019 13:24:25 -0700
Message-Id: <20190715202425.CE64C20665@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563222265;
 bh=z/3S4xXt/Rio/ofj03vwkBIO5OR52dDSZ9Eeq6mO6XI=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=BXkGMbTaQqFfurRCy1g8au7AeTtgOFutLGJt3puQKKnveCArE1l5n+TvNB5nyLQN2
 RewIrkkACOQLU4j8bdd/A1S3ea0t6aCgTcsSBEisWmgVGg22p/nmZ63GDKRcOxtMyZ
 60uqJ7tvYGN5awKtcLQiKpJWBRakwwDtbA+09H2w=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTIgMDE6MTc6MjgpCj4gZGlmZiAtLWdp
dCBhL2t1bml0L3Rlc3QuYyBiL2t1bml0L3Rlc3QuYwo+IGluZGV4IDU3MWU0YzY1ZGViNWMuLmYx
NjVjOWQ4ZTEwYjAgMTAwNjQ0Cj4gLS0tIGEva3VuaXQvdGVzdC5jCj4gKysrIGIva3VuaXQvdGVz
dC5jCj4gQEAgLTE3MSw2ICsxNzUsOTYgQEAgaW50IGt1bml0X3J1bl90ZXN0cyhzdHJ1Y3Qga3Vu
aXRfc3VpdGUgKnN1aXRlKQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0cnVjdCBr
dW5pdF9yZXNvdXJjZSAqa3VuaXRfYWxsb2NfcmVzb3VyY2Uoc3RydWN0IGt1bml0ICp0ZXN0LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfcmVzb3Vy
Y2VfaW5pdF90IGluaXQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBrdW5pdF9yZXNvdXJjZV9mcmVlX3QgZnJlZSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmNvbnRleHQpCj4gK3sKPiArICAgICAgIHN0cnVj
dCBrdW5pdF9yZXNvdXJjZSAqcmVzOwo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBy
ZXMgPSBremFsbG9jKHNpemVvZigqcmVzKSwgR0ZQX0tFUk5FTCk7CgpUaGlzIHVzZXMgR0ZQX0tF
Uk5FTC4KCj4gKyAgICAgICBpZiAoIXJlcykKPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7
Cj4gKwo+ICsgICAgICAgcmV0ID0gaW5pdChyZXMsIGNvbnRleHQpOwo+ICsgICAgICAgaWYgKHJl
dCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgICAgcmVzLT5mcmVl
ID0gZnJlZTsKPiArICAgICAgIG11dGV4X2xvY2soJnRlc3QtPmxvY2spOwoKQW5kIHRoaXMgY2Fu
IHNsZWVwLgoKPiArICAgICAgIGxpc3RfYWRkX3RhaWwoJnJlcy0+bm9kZSwgJnRlc3QtPnJlc291
cmNlcyk7Cj4gKyAgICAgICBtdXRleF91bmxvY2soJnRlc3QtPmxvY2spOwo+ICsKPiArICAgICAg
IHJldHVybiByZXM7Cj4gK30KPiArCj4gK3ZvaWQga3VuaXRfZnJlZV9yZXNvdXJjZShzdHJ1Y3Qg
a3VuaXQgKnRlc3QsIHN0cnVjdCBrdW5pdF9yZXNvdXJjZSAqcmVzKQoKU2hvdWxkIHByb2JhYmx5
IGFkZCBhIG5vdGUgdGhhdCB3ZSBhc3N1bWUgdGhlIHRlc3QgbG9jayBpcyBoZWxkIGhlcmUsIG9y
CmV2ZW4gYWRkIGEgbG9ja2RlcF9hc3NlcnRfaGVsZCgmdGVzdC0+bG9jaykgaW50byB0aGUgZnVu
Y3Rpb24gdG8KZG9jdW1lbnQgdGhhdCBhbmQgYXNzZXJ0IGl0IGF0IHRoZSBzYW1lIHRpbWUuCgo+
ICt7Cj4gKyAgICAgICByZXMtPmZyZWUocmVzKTsKPiArICAgICAgIGxpc3RfZGVsKCZyZXMtPm5v
ZGUpOwo+ICsgICAgICAga2ZyZWUocmVzKTsKPiArfQo+ICsKPiArc3RydWN0IGt1bml0X2ttYWxs
b2NfcGFyYW1zIHsKPiArICAgICAgIHNpemVfdCBzaXplOwo+ICsgICAgICAgZ2ZwX3QgZ2ZwOwo+
ICt9Owo+ICsKPiArc3RhdGljIGludCBrdW5pdF9rbWFsbG9jX2luaXQoc3RydWN0IGt1bml0X3Jl
c291cmNlICpyZXMsIHZvaWQgKmNvbnRleHQpCj4gK3sKPiArICAgICAgIHN0cnVjdCBrdW5pdF9r
bWFsbG9jX3BhcmFtcyAqcGFyYW1zID0gY29udGV4dDsKPiArCj4gKyAgICAgICByZXMtPmFsbG9j
YXRpb24gPSBrbWFsbG9jKHBhcmFtcy0+c2l6ZSwgcGFyYW1zLT5nZnApOwo+ICsgICAgICAgaWYg
KCFyZXMtPmFsbG9jYXRpb24pCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsK
PiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBrdW5pdF9rbWFsbG9j
X2ZyZWUoc3RydWN0IGt1bml0X3Jlc291cmNlICpyZXMpCj4gK3sKPiArICAgICAgIGtmcmVlKHJl
cy0+YWxsb2NhdGlvbik7Cj4gK30KPiArCj4gK3ZvaWQgKmt1bml0X2ttYWxsb2Moc3RydWN0IGt1
bml0ICp0ZXN0LCBzaXplX3Qgc2l6ZSwgZ2ZwX3QgZ2ZwKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
a3VuaXRfa21hbGxvY19wYXJhbXMgcGFyYW1zOwo+ICsgICAgICAgc3RydWN0IGt1bml0X3Jlc291
cmNlICpyZXM7Cj4gKwo+ICsgICAgICAgcGFyYW1zLnNpemUgPSBzaXplOwo+ICsgICAgICAgcGFy
YW1zLmdmcCA9IGdmcDsKPiArCj4gKyAgICAgICByZXMgPSBrdW5pdF9hbGxvY19yZXNvdXJjZSh0
ZXN0LAoKVGhpcyBjYWxscyB0aGF0IHNsZWVwaW5nIGZ1bmN0aW9uIGFib3ZlLi4uCgo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfa21hbGxvY19pbml0LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfa21hbGxvY19mcmVlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBhcmFtcyk7CgpidXQgdGhpcyBwYXNzZXMg
YSBHRlAgZmxhZ3MgcGFyYW1ldGVyIHRocm91Z2ggdG8gdGhlCmt1bml0X2ttYWxsb2NfaW5pdCgp
IGZ1bmN0aW9uLiBIb3cgaXMgdGhpcyBnb2luZyB0byB3b3JrIGlmIHNvbWUgY29kZQp1c2VzIEdG
UF9BVE9NSUMsIGJ1dCB0aGVuIHdlIHRyeSB0byBhbGxvY2F0ZSBhbmQgc2xlZXAgaW4Ka3VuaXRf
YWxsb2NfcmVzb3VyY2UoKSB3aXRoIEdGUF9LRVJORUw/IAoKT25lIHNvbHV0aW9uIHdvdWxkIGJl
IHRvIHBpZ2d5YmFjayBvbiBhbGwgdGhlIGV4aXN0aW5nIGRldnJlcyBhbGxvY2F0aW9uCmxvZ2lj
IHdlIGFscmVhZHkgaGF2ZSBhbmQgbWFrZSBlYWNoIHN0cnVjdCBrdW5pdCBhIGRldmljZSB0aGF0
IHdlIHBhc3MKaW50byB0aGUgZGV2cmVzIGZ1bmN0aW9ucy4gQSBmYXIgc2ltcGxlciBzb2x1dGlv
biB3b3VsZCBiZSB0byBqdXN0CmNvcHkvcGFzdGUgd2hhdCBkZXZyZXMgZG9lcyBhbmQgdXNlIGEg
c3BpbmxvY2sgYW5kIGFuIGFsbG9jYXRpb24KZnVuY3Rpb24gdGhhdCB0YWtlcyBHRlAgZmxhZ3Mu
Cgo+ICsKPiArICAgICAgIGlmIChyZXMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXMtPmFs
bG9jYXRpb247Cj4gKwo+ICsgICAgICAgcmV0dXJuIE5VTEw7Cj4gK30KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
