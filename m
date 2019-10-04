Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16155CC60D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 00:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2666EC32;
	Fri,  4 Oct 2019 22:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E76EC32
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 22:47:13 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27C0D20873;
 Fri,  4 Oct 2019 22:47:10 +0000 (UTC)
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
Date: Fri, 4 Oct 2019 16:47:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004222714.GA107737@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570229232;
 bh=xzHJwRDpMutixnFislQvEBP/YT7jem/U/8kCBigrHuc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iwzzgBVqn0QkoDuULW/O4NrloecUNaYOg0c99vmkwrF/zjed3x2bOMaHRqdx3FMcB
 x9c+A3rz+204+uJreaQuOoW8uMDh6bYqcKQgfB1jhKbgSV/JJFS70YgyJLCTDDtbp8
 DUCzwKxib6rwVWWLjRz787WWmuX5+RAponaYusdk=
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
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, khilman@baylibre.com,
 knut.omang@oracle.com, kieran.bingham@ideasonboard.com, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree@vger.kernel.org, shuah <shuah@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, logang@deltatee.com,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNC8xOSA0OjI3IFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
MDQsIDIwMTkgYXQgMDM6NTk6MTBQTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4+IE9uIDEwLzQvMTkg
Mzo0MiBQTSwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4+PiBPbiBGcmksIE9jdCA0LCAyMDE5IGF0
IDI6MzkgUE0gVGhlb2RvcmUgWS4gVHMnbyA8dHl0c29AbWl0LmVkdT4gd3JvdGU6Cj4+Pj4KPj4+
PiBUaGlzIHF1ZXN0aW9uIGlzIHByaW1hcmlseSBkaXJlY3RlZCBhdCBTaHVhaCBhbmQgTGludXMu
Li4uCj4+Pj4KPj4+PiBXaGF0J3MgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoZSBrdW5pdCBzZXJp
ZXMgbm93IHRoYXQgQnJlbmRhbiBoYXMKPj4+PiBtb3ZlZCBpdCBvdXQgb2YgdGhlIHRvcC1sZXZl
bCBrdW5pdCBkaXJlY3RvcnkgYXMgTGludXMgaGFzIHJlcXVlc3RlZD8KPj4+Cj4+Cj4+IFRoZSBt
b3ZlIGhhcHBlbmVkIHNtYWNrIGluIHRoZSBtaWRkbGUgb2YgbWVyZ2Ugd2luZG93IGFuZCBsYW5k
ZWQgaW4KPj4gbGludXgtbmV4dCB0b3dhcmRzIHRoZSBlbmQgb2YgdGhlIG1lcmdlIHdpbmRvdy4K
Pj4KPj4+IFdlIHNlZW1lZCB0byBkZWNpZGUgdG8ganVzdCB3YWl0IGZvciA1LjUsIGJ1dCB0aGVy
ZSBpcyBub3RoaW5nIHRoYXQKPj4+IGxvb2tzIHRvIGJsb2NrIHRoYXQuIEFuZCBJIGVuY291cmFn
ZWQgU2h1YWggdG8gZmluZCBtb3JlIGt1bml0IGNhc2VzCj4+PiBmb3Igd2hlbiBpdCBfZG9lc18g
Z2V0IG1lcmdlZC4KPj4+Cj4+Cj4+IFJpZ2h0LiBJIGNvbW11bmljYXRlZCB0aGF0IHRvIEJyZW5k
YW4gdGhhdCB3ZSBjb3VsZCB3b3JrIG9uIGFkZGluZyBtb3JlCj4+IGt1bml0IGJhc2VkIHRlc3Rz
IHdoaWNoIHdvdWxkIGhlbHAgZ2V0IG1vcmUgbWlsZWFnZSBvbiB0aGUga3VuaXQuCj4+Cj4+PiBT
byBpZiB0aGUga3VuaXQgYnJhbmNoIGlzIHN0YWJsZSwgYW5kIHBlb3BsZSB3YW50IHRvIHN0YXJ0
IHVzaW5nIGl0Cj4+PiBmb3IgdGhlaXIgdW5pdCB0ZXN0cywgdGhlbiBJIHRoaW5rIHRoYXQgd291
bGQgYmUgYSBnb29kIGlkZWEsIGFuZCB0aGVuCj4+PiBkdXJpbmcgdGhlIDUuNSBtZXJnZSB3aW5k
b3cgd2UnbGwgbm90IGp1c3QgZ2V0IHRoZSBpbmZyYXN0cnVjdHVyZSwKPj4+IHdlJ2xsIGdldCBh
IGZldyBtb3JlIHVzZXJzIHRvbyBhbmQgbm90IGp1c3QgZXhhbXBsZXMuCj4gCj4gSSB3YXMgcGxh
bm5pbmcgb24gaG9sZGluZyBvZmYgb24gYWNjZXB0aW5nIG1vcmUgdGVzdHMvY2hhbmdlcyB1bnRp
bAo+IEtVbml0IGlzIGluIHRvcnZhbGRzL21hc3Rlci4gQXMgbXVjaCBhcyBJIHdvdWxkIGxpa2Ug
dG8gZ28gYXJvdW5kCj4gcHJvbW90aW5nIGl0LCBJIGRvbid0IHJlYWxseSB3YW50IHRvIHByb21v
dGUgdG9vIG11Y2ggY29tcGxleGl0eSBpbiBhCj4gbm9uLXVwc3RyZWFtIGJyYW5jaCBiZWZvcmUg
Z2V0dGluZyBpdCB1cHN0cmVhbSBiZWNhdXNlIEkgZG9uJ3Qgd2FudCB0bwo+IHJpc2sgYWRkaW5n
IHNvbWV0aGluZyB0aGF0IG1pZ2h0IGNhdXNlIGl0IHRvIGdldCByZWplY3RlZCBhZ2Fpbi4KPiAK
PiBUbyBiZSBjbGVhciwgSSBjYW4gdW5kZXJzdGFuZCBmcm9tIHlvdXIgcGVyc3BlY3RpdmUgd2h5
IGdldHRpbmcgbW9yZQo+IHRlc3RzL3VzYWdlIGJlZm9yZSBhY2NlcHRpbmcgaXQgaXMgYSBnb29k
IHRoaW5nLiBUaGUgbW9yZSBwZW9wbGUgdGhhdAo+IHBsYXkgYXJvdW5kIHdpdGggaXQsIHRoZSBt
b3JlIGxpa2VseSB0aGF0IHNvbWVvbmUgd2lsbCBmaW5kIGFuIGlzc3VlCj4gd2l0aCBpdCwgYW5k
IG1vcmUgbGlrZWx5IHRoYXQgd2hhdCBpcyBhY2NlcHRlZCBpbnRvIHRvcnZhbGRzL21hc3RlciBp
cwo+IG9mIGhpZ2ggcXVhbGl0eS4KPiAKPiBIb3dldmVyLCBpZiBJIGVuY291cmFnZSBhcmJpdHJh
cnkgdGVzdHMvaW1wcm92ZW1lbnRzIGludG8gbXkgS1VuaXQKPiBicmFuY2gsIGl0IGZ1cnRoZXIg
ZGl2ZXJnZXMgYXdheSBmcm9tIHRvcnZhbGRzL21hc3RlciwgYW5kIGlzIG1vcmUKPiBsaWtlbHkg
dGhhdCB0aGVyZSB3aWxsIGJlIGEgbWVyZ2UgY29uZmxpY3Qgb3IgaXNzdWUgdGhhdCBpcyBub3Qg
cmVsYXRlZAo+IHRvIHRoZSBjb3JlIEtVbml0IGNoYW5nZXMgdGhhdCB3aWxsIGNhdXNlIHRoZSB3
aG9sZSB0aGluZyB0byBiZQo+IHJlamVjdGVkIGFnYWluIGluIHY1LjUuCj4gCgpUaGUgaWRlYSBp
cyB0aGF0IHRoZSBuZXcgZGV2ZWxvcG1lbnQgd2lsbCBoYXBwZW4gYmFzZWQgb24ga3VuaXQgaW4K
bGludXgta3NlbGZ0ZXN0IG5leHQuIEl0IHdpbGwgd29yayBqdXN0IGZpbmUuIEFzIHdlIGFjY2Vw
dHMgcGF0Y2hlcywKdGhleSB3aWxsIGdvIG9uIHRvcCBvZiBrdW5pdCB0aGF0IGlzIGluIGxpbnV4
LW5leHQgbm93LgoKdGhhbmtzLAotLSBTaHVhaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
