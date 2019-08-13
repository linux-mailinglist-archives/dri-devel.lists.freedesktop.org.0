Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99078AED0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6FD6E040;
	Tue, 13 Aug 2019 05:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5769F6E040
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:30:24 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC86120651;
 Tue, 13 Aug 2019 05:30:23 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g46PJNTOUAA4GOOrW==74Zy7u1sRESTanL_BXBn6QykscA@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com>
 <20190812235940.100842063F@mail.kernel.org>
 <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
 <20190813045623.F3D9520842@mail.kernel.org>
 <CAFd5g46PJNTOUAA4GOOrW==74Zy7u1sRESTanL_BXBn6QykscA@mail.gmail.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 22:30:22 -0700
Message-Id: <20190813053023.CC86120651@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565674223;
 bh=VMaXsgEnAY9aCCxyP30CJ4opmlruKjGx3jZfaWtT7oo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=b+x/EVyc+E3zWFnrfVKPUrmepXMkItHnO4h9gJR6rp/LIS1Sn024SYTxwH90D+l4/
 Gset4RenPo4NOQsJtTXoRsrQJbqUm4juDNrJMYDU2D162dtEY+pi2t/RqfKrx3Cp+a
 wH8fFAI3YyaJEQdx6DYfPvuFUe+c59vIG08jHvTw=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMjI6MDI6NTkpCj4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgOTo1NiBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEyIDE3OjQxOjA1
KQo+ID4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCA0OjU5IFBNIFN0ZXBoZW4gQm95ZCA8c2Jv
eWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IGt1bml0X3Jlc291cmNlX2Rl
c3Ryb3kgKHJlc3BlY3RpdmUgZXF1aXZhbGVudHMgdG8gZGV2bV9rZnJlZSwgYW5kCj4gPiA+ID4g
PiBkZXZyZXNfZGVzdHJveSkgYW5kIHVzZSBrdW5pdF9rZnJlZSBoZXJlPwo+ID4gPiA+ID4KPiA+
ID4gPgo+ID4gPiA+IFllcywgb3IgZHJvcCB0aGUgQVBJIGVudGlyZWx5PyBEb2VzIGFueXRoaW5n
IG5lZWQgdGhpcyBmdW5jdGlvbmFsaXR5Pwo+ID4gPgo+ID4gPiBEcm9wIHRoZSBrdW5pdF9yZXNv
dXJjZSBBUEk/IEkgd291bGQgc3Ryb25nbHkgcHJlZmVyIG5vdCB0by4KPiA+Cj4gPiBOby4gSSBt
ZWFuIHRoaXMgQVBJLCBzdHJpbmdfc3RyZWFtX2NsZWFyKCkuIERvZXMgYW55dGhpbmcgdXNlIGl0
Pwo+IAo+IE9oLCByaWdodC4gTm8uCj4gCj4gSG93ZXZlciwgbm93IHRoYXQgSSBhZGRlZCB0aGUg
a3VuaXRfcmVzb3VyY2VfZGVzdHJveSwgSSB0aG91Z2h0IGl0Cj4gbWlnaHQgYmUgZ29vZCB0byBm
cmVlIHRoZSBzdHJpbmdfc3RyZWFtIGFmdGVyIEkgdXNlIGl0IGluIGVhY2ggY2FsbCB0bwo+IGt1
bml0X2Fzc2VydC0+Zm9ybWF0KC4uLikgaW4gd2hpY2ggY2FzZSBJIHdpbGwgYmUgdXNpbmcgdGhp
cyBsb2dpYy4KPiAKPiBTbyBJIHRoaW5rIHRoZSByaWdodCB0aGluZyB0byBkbyBpcyB0byBleHBv
c2Ugc3RyaW5nX3N0cmVhbV9kZXN0cm95IHNvCj4ga3VuaXRfZG9fYXNzZXJ0IGNhbiBjbGVhbiB1
cCB3aGVuIGl0J3MgZG9uZSwgYW5kIHRoZW4gZGVtb3RlCj4gc3RyaW5nX3N0cmVhbV9jbGVhciB0
byBzdGF0aWMuIFNvdW5kIGdvb2Q/CgpPaywgc3VyZS4gSSBkb24ndCByZWFsbHkgc2VlIGhvdyBj
bGVhcmluZyBpdCBleHBsaWNpdGx5IHdoZW4gdGhlCmFzc2VydGlvbiBwcmludHMgdnMuIG5ldmVy
IGFsbG9jYXRpbmcgaXQgdG8gYmVnaW4gd2l0aCBpcyByZWFsbHkgYW55CmRpZmZlcmVudC4gTWF5
YmUgSSd2ZSBtaXNzZWQgc29tZXRoaW5nIHRob3VnaC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
