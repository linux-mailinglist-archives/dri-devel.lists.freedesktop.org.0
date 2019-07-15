Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882869CCF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 22:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FF189B48;
	Mon, 15 Jul 2019 20:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB78089B48
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 20:30:34 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f25so8252927pgv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Guk3L6+8PLdqP7pYPvzhoPuDjq05e+2mmqgYxycfTpo=;
 b=A21zwVPNvpCTAf6moRJGdofxkVMPqbDA/gFAYjOEGgiT7/SgmZMs4//f17ZpuJ2OU6
 c4tjNgXIU70kXTVCCTi6wHgEXa/hHWnle3zc7cttGERVfgaiFMULrsQlXpt3gi+Horau
 1j1VMD49hA6F5xuaQNDrE0MzdY0GHw8YGmI0m984e4giIQcQRO9M/nj27uEvT66hdEbh
 gl25tt2PurJwTVeI5khnWlbx9coqEWwRq7+FQBHeWs/oMAHnxnMi+vbjg8tw/vRUiFo2
 4ur31DtQyFVWuYjg2hagvn26ENOy1K0SVacrjGUIi1HfgxIhbtXy47MPB4wn18fz7fZP
 /vww==
X-Gm-Message-State: APjAAAVGW3jAE+xUR7LccfreqNKZWENSR5mtic1G4yVpTkjtBk87mRCL
 j9VHk/Wd0hl2WNFZ2UwbNqNQJFoEXFcLlQbdygP/Tg==
X-Google-Smtp-Source: APXvYqzKQuaXpGEOS+dMEmBo8FPFiuVIjj5hhYTkizz5+oKRzaBKQU1vUVyuyXBWxZXEb/U0Rw/0GC/2FiD36LZR+90=
X-Received: by 2002:a63:b919:: with SMTP id z25mr28642556pge.201.1563222633591; 
 Mon, 15 Jul 2019 13:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-3-brendanhiggins@google.com>
 <20190715202425.CE64C20665@mail.kernel.org>
In-Reply-To: <20190715202425.CE64C20665@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 15 Jul 2019 13:30:22 -0700
Message-ID: <CAFd5g45iHnMLOGQbXwzX6F74pkQGKBCSufkpYPOcw_iNSeiQKg@mail.gmail.com>
Subject: Re: [PATCH v9 02/18] kunit: test: add test resource management API
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Guk3L6+8PLdqP7pYPvzhoPuDjq05e+2mmqgYxycfTpo=;
 b=nmdIrQ2ZG9zLY+uPnHaC+zU9b/FYlCcJUklqPlgIEvxvjrncOHXB+C4uonVCMPNT5U
 RDlsPPFfFHanzQy12v9LKBzsgYs//6dy4qqJq9wWWyI4pDK3aCgJ1J/JgmQXwTE7LK3E
 iw5kJfsnm+yh+B2qKZbTQBSYW2yNi7ZyoDweAfKbzMv3dfSuT0useTynnAjypl5lf7/d
 jTEh9cq2DJ6lxhwAR1P3fF5Tm12yriac2Lepz1S6WLSn9ipeqXXdzi8KqMKw91pnk6DG
 ICc14afUNRCpD25tMKIn+kqhek6winXiVWbGXLe13YMzt6iQrEchkA/y8vKWAxCaJIaL
 ulxg==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMToyNCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTIgMDE6
MTc6MjgpCj4gPiBkaWZmIC0tZ2l0IGEva3VuaXQvdGVzdC5jIGIva3VuaXQvdGVzdC5jCj4gPiBp
bmRleCA1NzFlNGM2NWRlYjVjLi5mMTY1YzlkOGUxMGIwIDEwMDY0NAo+ID4gLS0tIGEva3VuaXQv
dGVzdC5jCj4gPiArKysgYi9rdW5pdC90ZXN0LmMKPiA+IEBAIC0xNzEsNiArMTc1LDk2IEBAIGlu
dCBrdW5pdF9ydW5fdGVzdHMoc3RydWN0IGt1bml0X3N1aXRlICpzdWl0ZSkKPiA+ICAgICAgICAg
cmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdHJ1Y3Qga3VuaXRfcmVzb3VyY2UgKmt1bml0X2Fs
bG9jX3Jlc291cmNlKHN0cnVjdCBrdW5pdCAqdGVzdCwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfcmVzb3VyY2VfaW5pdF90IGluaXQsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt1bml0X3Jlc291cmNl
X2ZyZWVfdCBmcmVlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2b2lkICpjb250ZXh0KQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IGt1bml0X3Jlc291
cmNlICpyZXM7Cj4gPiArICAgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICAgIHJlcyA9IGt6
YWxsb2Moc2l6ZW9mKCpyZXMpLCBHRlBfS0VSTkVMKTsKPgo+IFRoaXMgdXNlcyBHRlBfS0VSTkVM
Lgo+Cj4gPiArICAgICAgIGlmICghcmVzKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxM
Owo+ID4gKwo+ID4gKyAgICAgICByZXQgPSBpbml0KHJlcywgY29udGV4dCk7Cj4gPiArICAgICAg
IGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArCj4gPiArICAg
ICAgIHJlcy0+ZnJlZSA9IGZyZWU7Cj4gPiArICAgICAgIG11dGV4X2xvY2soJnRlc3QtPmxvY2sp
Owo+Cj4gQW5kIHRoaXMgY2FuIHNsZWVwLgo+Cj4gPiArICAgICAgIGxpc3RfYWRkX3RhaWwoJnJl
cy0+bm9kZSwgJnRlc3QtPnJlc291cmNlcyk7Cj4gPiArICAgICAgIG11dGV4X3VubG9jaygmdGVz
dC0+bG9jayk7Cj4gPiArCj4gPiArICAgICAgIHJldHVybiByZXM7Cj4gPiArfQo+ID4gKwo+ID4g
K3ZvaWQga3VuaXRfZnJlZV9yZXNvdXJjZShzdHJ1Y3Qga3VuaXQgKnRlc3QsIHN0cnVjdCBrdW5p
dF9yZXNvdXJjZSAqcmVzKQo+Cj4gU2hvdWxkIHByb2JhYmx5IGFkZCBhIG5vdGUgdGhhdCB3ZSBh
c3N1bWUgdGhlIHRlc3QgbG9jayBpcyBoZWxkIGhlcmUsIG9yCj4gZXZlbiBhZGQgYSBsb2NrZGVw
X2Fzc2VydF9oZWxkKCZ0ZXN0LT5sb2NrKSBpbnRvIHRoZSBmdW5jdGlvbiB0bwo+IGRvY3VtZW50
IHRoYXQgYW5kIGFzc2VydCBpdCBhdCB0aGUgc2FtZSB0aW1lLgoKU2VlbXMgcmVhc29uYWJsZS4K
Cj4gPiArewo+ID4gKyAgICAgICByZXMtPmZyZWUocmVzKTsKPiA+ICsgICAgICAgbGlzdF9kZWwo
JnJlcy0+bm9kZSk7Cj4gPiArICAgICAgIGtmcmVlKHJlcyk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0
cnVjdCBrdW5pdF9rbWFsbG9jX3BhcmFtcyB7Cj4gPiArICAgICAgIHNpemVfdCBzaXplOwo+ID4g
KyAgICAgICBnZnBfdCBnZnA7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgaW50IGt1bml0X2tt
YWxsb2NfaW5pdChzdHJ1Y3Qga3VuaXRfcmVzb3VyY2UgKnJlcywgdm9pZCAqY29udGV4dCkKPiA+
ICt7Cj4gPiArICAgICAgIHN0cnVjdCBrdW5pdF9rbWFsbG9jX3BhcmFtcyAqcGFyYW1zID0gY29u
dGV4dDsKPiA+ICsKPiA+ICsgICAgICAgcmVzLT5hbGxvY2F0aW9uID0ga21hbGxvYyhwYXJhbXMt
PnNpemUsIHBhcmFtcy0+Z2ZwKTsKPiA+ICsgICAgICAgaWYgKCFyZXMtPmFsbG9jYXRpb24pCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgICAgIHJldHVy
biAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBrdW5pdF9rbWFsbG9jX2ZyZWUoc3Ry
dWN0IGt1bml0X3Jlc291cmNlICpyZXMpCj4gPiArewo+ID4gKyAgICAgICBrZnJlZShyZXMtPmFs
bG9jYXRpb24pOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lkICprdW5pdF9rbWFsbG9jKHN0cnVjdCBr
dW5pdCAqdGVzdCwgc2l6ZV90IHNpemUsIGdmcF90IGdmcCkKPiA+ICt7Cj4gPiArICAgICAgIHN0
cnVjdCBrdW5pdF9rbWFsbG9jX3BhcmFtcyBwYXJhbXM7Cj4gPiArICAgICAgIHN0cnVjdCBrdW5p
dF9yZXNvdXJjZSAqcmVzOwo+ID4gKwo+ID4gKyAgICAgICBwYXJhbXMuc2l6ZSA9IHNpemU7Cj4g
PiArICAgICAgIHBhcmFtcy5nZnAgPSBnZnA7Cj4gPiArCj4gPiArICAgICAgIHJlcyA9IGt1bml0
X2FsbG9jX3Jlc291cmNlKHRlc3QsCj4KPiBUaGlzIGNhbGxzIHRoYXQgc2xlZXBpbmcgZnVuY3Rp
b24gYWJvdmUuLi4KPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdW5p
dF9rbWFsbG9jX2luaXQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt1
bml0X2ttYWxsb2NfZnJlZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JnBhcmFtcyk7Cj4KPiBidXQgdGhpcyBwYXNzZXMgYSBHRlAgZmxhZ3MgcGFyYW1ldGVyIHRocm91
Z2ggdG8gdGhlCj4ga3VuaXRfa21hbGxvY19pbml0KCkgZnVuY3Rpb24uIEhvdyBpcyB0aGlzIGdv
aW5nIHRvIHdvcmsgaWYgc29tZSBjb2RlCj4gdXNlcyBHRlBfQVRPTUlDLCBidXQgdGhlbiB3ZSB0
cnkgdG8gYWxsb2NhdGUgYW5kIHNsZWVwIGluCj4ga3VuaXRfYWxsb2NfcmVzb3VyY2UoKSB3aXRo
IEdGUF9LRVJORUw/CgpZZWFoLCB0aGF0J3MgYW4gaW5jb25zaXN0ZW5jeS4gSSBuZWVkIHRvIGZp
eCB0aGF0LgoKPiBPbmUgc29sdXRpb24gd291bGQgYmUgdG8gcGlnZ3liYWNrIG9uIGFsbCB0aGUg
ZXhpc3RpbmcgZGV2cmVzIGFsbG9jYXRpb24KPiBsb2dpYyB3ZSBhbHJlYWR5IGhhdmUgYW5kIG1h
a2UgZWFjaCBzdHJ1Y3Qga3VuaXQgYSBkZXZpY2UgdGhhdCB3ZSBwYXNzCj4gaW50byB0aGUgZGV2
cmVzIGZ1bmN0aW9ucy4gQSBmYXIgc2ltcGxlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBqdXN0Cj4g
Y29weS9wYXN0ZSB3aGF0IGRldnJlcyBkb2VzIGFuZCB1c2UgYSBzcGlubG9jayBhbmQgYW4gYWxs
b2NhdGlvbgo+IGZ1bmN0aW9uIHRoYXQgdGFrZXMgR0ZQIGZsYWdzLgoKWWVhaCwgdGhhdCdzIHdo
YXQgSSBkaWQgb3JpZ2luYWxseSwgYnV0IEkgdGhvdWdodCBmcm9tIHRoZSBkaXNjdXNzaW9uCm9u
IHBhdGNoIDAxIHRoYXQgeW91IHRob3VnaHQgYSBzcGlubG9jayB3YXMgb3ZlcmtpbGwgZm9yIHN0
cnVjdCBrdW5pdC4KSSB0YWtlIGl0IHlvdSBvbmx5IG1lYW50IGluIHRoYXQgaW5pdGlhbCBwYXRj
aD8KCj4gPiArCj4gPiArICAgICAgIGlmIChyZXMpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IHJlcy0+YWxsb2NhdGlvbjsKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArfQoK
Q2hlZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
