Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07611CC65B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 01:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542D36E329;
	Fri,  4 Oct 2019 23:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A36E329
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 23:16:04 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07CB7215EA;
 Fri,  4 Oct 2019 23:16:00 +0000 (UTC)
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <CAFd5g46pzu=Bh5X7-ttfhTP+NYNDCAxN16OCGFxc5ohjTL-v0g@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <b38b118f-9bcb-c2fc-4365-0b94fde4e1ec@kernel.org>
Date: Fri, 4 Oct 2019 17:15:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g46pzu=Bh5X7-ttfhTP+NYNDCAxN16OCGFxc5ohjTL-v0g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570230963;
 bh=ed2Oj0Rtnhm1rXJkcqfJxOLIvuDPtA/O2HMmNV71h1A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WM0U4KZ8Yc4SM5CiFfv5XPcZ0aRzdXwsYvoXnNevsXnJsPyjQKtdRXjIMQzZ+kVOJ
 6YPavRWeR2P5RDQEazsuY+5qqP9SteouIZAzdGwtjgnZiXBW45gWTz4CaJtz77mMLh
 9WfdeFi7Wi/iRWJWlEXKUF33HUEeeyYS7Fk3RiSQ=
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, shuah <shuah@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Logan Gunthorpe <logang@deltatee.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
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

T24gMTAvNC8xOSA1OjEwIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
NCwgMjAxOSBhdCAzOjQ3IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMTAvNC8xOSA0OjI3IFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+PiBPbiBGcmksIE9j
dCAwNCwgMjAxOSBhdCAwMzo1OToxMFBNIC0wNjAwLCBzaHVhaCB3cm90ZToKPj4+PiBPbiAxMC80
LzE5IDM6NDIgUE0sIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+Pj4+PiBPbiBGcmksIE9jdCA0LCAy
MDE5IGF0IDI6MzkgUE0gVGhlb2RvcmUgWS4gVHMnbyA8dHl0c29AbWl0LmVkdT4gd3JvdGU6Cj4+
Pj4+Pgo+Pj4+Pj4gVGhpcyBxdWVzdGlvbiBpcyBwcmltYXJpbHkgZGlyZWN0ZWQgYXQgU2h1YWgg
YW5kIExpbnVzLi4uLgo+Pj4+Pj4KPj4+Pj4+IFdoYXQncyB0aGUgY3VycmVudCBzdGF0dXMgb2Yg
dGhlIGt1bml0IHNlcmllcyBub3cgdGhhdCBCcmVuZGFuIGhhcwo+Pj4+Pj4gbW92ZWQgaXQgb3V0
IG9mIHRoZSB0b3AtbGV2ZWwga3VuaXQgZGlyZWN0b3J5IGFzIExpbnVzIGhhcyByZXF1ZXN0ZWQ/
Cj4+Pj4+Cj4+Pj4KPj4+PiBUaGUgbW92ZSBoYXBwZW5lZCBzbWFjayBpbiB0aGUgbWlkZGxlIG9m
IG1lcmdlIHdpbmRvdyBhbmQgbGFuZGVkIGluCj4+Pj4gbGludXgtbmV4dCB0b3dhcmRzIHRoZSBl
bmQgb2YgdGhlIG1lcmdlIHdpbmRvdy4KPj4+Pgo+Pj4+PiBXZSBzZWVtZWQgdG8gZGVjaWRlIHRv
IGp1c3Qgd2FpdCBmb3IgNS41LCBidXQgdGhlcmUgaXMgbm90aGluZyB0aGF0Cj4+Pj4+IGxvb2tz
IHRvIGJsb2NrIHRoYXQuIEFuZCBJIGVuY291cmFnZWQgU2h1YWggdG8gZmluZCBtb3JlIGt1bml0
IGNhc2VzCj4+Pj4+IGZvciB3aGVuIGl0IF9kb2VzXyBnZXQgbWVyZ2VkLgo+Pj4+Pgo+Pj4+Cj4+
Pj4gUmlnaHQuIEkgY29tbXVuaWNhdGVkIHRoYXQgdG8gQnJlbmRhbiB0aGF0IHdlIGNvdWxkIHdv
cmsgb24gYWRkaW5nIG1vcmUKPj4+PiBrdW5pdCBiYXNlZCB0ZXN0cyB3aGljaCB3b3VsZCBoZWxw
IGdldCBtb3JlIG1pbGVhZ2Ugb24gdGhlIGt1bml0Lgo+Pj4+Cj4+Pj4+IFNvIGlmIHRoZSBrdW5p
dCBicmFuY2ggaXMgc3RhYmxlLCBhbmQgcGVvcGxlIHdhbnQgdG8gc3RhcnQgdXNpbmcgaXQKPj4+
Pj4gZm9yIHRoZWlyIHVuaXQgdGVzdHMsIHRoZW4gSSB0aGluayB0aGF0IHdvdWxkIGJlIGEgZ29v
ZCBpZGVhLCBhbmQgdGhlbgo+Pj4+PiBkdXJpbmcgdGhlIDUuNSBtZXJnZSB3aW5kb3cgd2UnbGwg
bm90IGp1c3QgZ2V0IHRoZSBpbmZyYXN0cnVjdHVyZSwKPj4+Pj4gd2UnbGwgZ2V0IGEgZmV3IG1v
cmUgdXNlcnMgdG9vIGFuZCBub3QganVzdCBleGFtcGxlcy4KPj4+Cj4+PiBJIHdhcyBwbGFubmlu
ZyBvbiBob2xkaW5nIG9mZiBvbiBhY2NlcHRpbmcgbW9yZSB0ZXN0cy9jaGFuZ2VzIHVudGlsCj4+
PiBLVW5pdCBpcyBpbiB0b3J2YWxkcy9tYXN0ZXIuIEFzIG11Y2ggYXMgSSB3b3VsZCBsaWtlIHRv
IGdvIGFyb3VuZAo+Pj4gcHJvbW90aW5nIGl0LCBJIGRvbid0IHJlYWxseSB3YW50IHRvIHByb21v
dGUgdG9vIG11Y2ggY29tcGxleGl0eSBpbiBhCj4+PiBub24tdXBzdHJlYW0gYnJhbmNoIGJlZm9y
ZSBnZXR0aW5nIGl0IHVwc3RyZWFtIGJlY2F1c2UgSSBkb24ndCB3YW50IHRvCj4+PiByaXNrIGFk
ZGluZyBzb21ldGhpbmcgdGhhdCBtaWdodCBjYXVzZSBpdCB0byBnZXQgcmVqZWN0ZWQgYWdhaW4u
Cj4+Pgo+Pj4gVG8gYmUgY2xlYXIsIEkgY2FuIHVuZGVyc3RhbmQgZnJvbSB5b3VyIHBlcnNwZWN0
aXZlIHdoeSBnZXR0aW5nIG1vcmUKPj4+IHRlc3RzL3VzYWdlIGJlZm9yZSBhY2NlcHRpbmcgaXQg
aXMgYSBnb29kIHRoaW5nLiBUaGUgbW9yZSBwZW9wbGUgdGhhdAo+Pj4gcGxheSBhcm91bmQgd2l0
aCBpdCwgdGhlIG1vcmUgbGlrZWx5IHRoYXQgc29tZW9uZSB3aWxsIGZpbmQgYW4gaXNzdWUKPj4+
IHdpdGggaXQsIGFuZCBtb3JlIGxpa2VseSB0aGF0IHdoYXQgaXMgYWNjZXB0ZWQgaW50byB0b3J2
YWxkcy9tYXN0ZXIgaXMKPj4+IG9mIGhpZ2ggcXVhbGl0eS4KPj4+Cj4+PiBIb3dldmVyLCBpZiBJ
IGVuY291cmFnZSBhcmJpdHJhcnkgdGVzdHMvaW1wcm92ZW1lbnRzIGludG8gbXkgS1VuaXQKPj4+
IGJyYW5jaCwgaXQgZnVydGhlciBkaXZlcmdlcyBhd2F5IGZyb20gdG9ydmFsZHMvbWFzdGVyLCBh
bmQgaXMgbW9yZQo+Pj4gbGlrZWx5IHRoYXQgdGhlcmUgd2lsbCBiZSBhIG1lcmdlIGNvbmZsaWN0
IG9yIGlzc3VlIHRoYXQgaXMgbm90IHJlbGF0ZWQKPj4+IHRvIHRoZSBjb3JlIEtVbml0IGNoYW5n
ZXMgdGhhdCB3aWxsIGNhdXNlIHRoZSB3aG9sZSB0aGluZyB0byBiZQo+Pj4gcmVqZWN0ZWQgYWdh
aW4gaW4gdjUuNS4KPj4+Cj4+Cj4+IFRoZSBpZGVhIGlzIHRoYXQgdGhlIG5ldyBkZXZlbG9wbWVu
dCB3aWxsIGhhcHBlbiBiYXNlZCBvbiBrdW5pdCBpbgo+PiBsaW51eC1rc2VsZnRlc3QgbmV4dC4g
SXQgd2lsbCB3b3JrIGp1c3QgZmluZS4gQXMgd2UgYWNjZXB0cyBwYXRjaGVzLAo+PiB0aGV5IHdp
bGwgZ28gb24gdG9wIG9mIGt1bml0IHRoYXQgaXMgaW4gbGludXgtbmV4dCBub3cuCj4gCj4gQnV0
IHRoZW4gd291bGRuJ3Qgd2Ugd2FudCB0byBsaW1pdCB3aGF0IEtVbml0IGNoYW5nZXMgYXJlIGdv
aW5nIGludG8KPiBsaW51eC1rc2VsZnRlc3QgbmV4dCBmb3IgdjUuNT8gRm9yIGV4YW1wbGUsIHdl
IHByb2JhYmx5IGRvbid0IHdhbnQgdG8KPiBkbyBhbnltb3JlIGZlYXR1cmUgZGV2ZWxvcG1lbnQg
b24gaXQgdW50aWwgaXQgaXMgaW4gdjUuNSwgc2luY2UgdGhlCj4gZ29hbCBpcyB0byBtYWtlIGl0
IG1vcmUgc3RhYmxlLCByaWdodD8KPiAKPiBJIGFtIGd1ZXNzaW5nIHRoYXQgaXQgd2lsbCBwcm9i
YWJseSBiZSBmaW5lLCBidXQgaXQgc3RpbGwgc291bmRzIGxpa2UKPiB3ZSBuZWVkIHRvIGVzdGFi
bGlzaCBzb21lIGdyb3VuZCBydWxlcywgYW5kIHBsYXkgaXQgKnZlcnkqIHNhZmUuCj4gCgpIb3cg
YWJvdXQgd2UgaWRlbnRpZnkgYSBzbWFsbCBudW1iZXIgdGVzdHMgdGhhdCBjYW4gYWRkIHZhbHVl
IGFuZCBmb2N1cwpvbiB0aGVtLiBJIGFtIHRoaW5raW5nIGEgbnVtYmVyIGJldHdlZW4gMiBhbmQg
NS4gVGhpcyB3YXkgd2UgZ2V0IGEgZmVlbApmb3IgdGhlIEFQSSwgaWYgaXQgY2hhbmdlcyBmb3Ig
dGhlIGJldHRlciBncmVhdCwgaWYgaXQgZG9lc24ndCBoYXZlIHRvLAp0aGVuIHlvdSBrbm93IHlv
dSBhbHJlYWR5IGRpZCBhIGdyZWF0IGpvYi4KCkRvZXMgdGhhdCBzb3VuZCByZWFzb25hYmxlIHRv
IHlvdT8KCnRoYW5rcywKLS0gU2h1YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
