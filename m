Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3BCC703
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 02:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501226EC41;
	Sat,  5 Oct 2019 00:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF90B6EC41
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 00:49:45 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DF8120873;
 Sat,  5 Oct 2019 00:49:42 +0000 (UTC)
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
Date: Fri, 4 Oct 2019 18:49:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570236585;
 bh=xZI6AMC9vT2JUzUTQ3pJuNpdKOT2e6BWHiA9XuyQOVs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SRxOVm5ZugVR9rPMT1vz1QnfT5DZU08BilGfHRkuBOL3bL6oGDnP9LI2rhpHu1/NT
 2PFjKAUSfAWbrIlCERqaEBazVFVeCktEuF8uBAr3Aja8YtlRZGlhPRIvVFvxBw1ZtC
 0Hz/bgIernzxUNvQc+h53RXM+AUErJoJGZQMUKp4=
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

T24gMTAvNC8xOSA2OjMzIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
NCwgMjAxOSBhdCA0OjU3IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMTAvNC8xOSA1OjUyIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+PiBPbiBGcmksIE9j
dCA0LCAyMDE5IGF0IDQ6MzAgUE0gVGhlb2RvcmUgWS4gVHMnbyA8dHl0c29AbWl0LmVkdT4gd3Jv
dGU6Cj4+Pj4KPj4+PiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAwNDo0NzowOVBNIC0wNjAwLCBz
aHVhaCB3cm90ZToKPj4+Pj4+IEhvd2V2ZXIsIGlmIEkgZW5jb3VyYWdlIGFyYml0cmFyeSB0ZXN0
cy9pbXByb3ZlbWVudHMgaW50byBteSBLVW5pdAo+Pj4+Pj4gYnJhbmNoLCBpdCBmdXJ0aGVyIGRp
dmVyZ2VzIGF3YXkgZnJvbSB0b3J2YWxkcy9tYXN0ZXIsIGFuZCBpcyBtb3JlCj4+Pj4+PiBsaWtl
bHkgdGhhdCB0aGVyZSB3aWxsIGJlIGEgbWVyZ2UgY29uZmxpY3Qgb3IgaXNzdWUgdGhhdCBpcyBu
b3QgcmVsYXRlZAo+Pj4+Pj4gdG8gdGhlIGNvcmUgS1VuaXQgY2hhbmdlcyB0aGF0IHdpbGwgY2F1
c2UgdGhlIHdob2xlIHRoaW5nIHRvIGJlCj4+Pj4+PiByZWplY3RlZCBhZ2FpbiBpbiB2NS41Lgo+
Pj4+Pgo+Pj4+PiBUaGUgaWRlYSBpcyB0aGF0IHRoZSBuZXcgZGV2ZWxvcG1lbnQgd2lsbCBoYXBw
ZW4gYmFzZWQgb24ga3VuaXQgaW4KPj4+Pj4gbGludXgta3NlbGZ0ZXN0IG5leHQuIEl0IHdpbGwg
d29yayBqdXN0IGZpbmUuIEFzIHdlIGFjY2VwdHMgcGF0Y2hlcywKPj4+Pj4gdGhleSB3aWxsIGdv
IG9uIHRvcCBvZiBrdW5pdCB0aGF0IGlzIGluIGxpbnV4LW5leHQgbm93Lgo+Pj4+Cj4+Pj4gSSBk
b24ndCBzZWUgaG93IHRoaXMgd291bGQgd29yay4gIElmIEkgYWRkIHVuaXQgdGVzdHMgdG8gZXh0
NCwgdGhleQo+Pj4+IHdvdWxkIGJlIGluIGZzL2V4dDQuICBBbmQgdG8gdGhlIGV4dGVudCB0aGF0
IEkgbmVlZCB0byBhZGQgdGVzdCBtb2Nrcwo+Pj4+IHRvIGFsbG93IHRoZSB1bml0IHRlc3RzIHRv
IHdvcmssIHRoZXkgd2lsbCBpbnZvbHZlIGNoYW5nZXMgdG8gZXhpc3RpbmcKPj4+PiBmaWxlcyBp
biBmcy9leHQ0LiAgSSBjYW4ndCBwdXQgdGhlbSBpbiB0aGUgZXh0NC5naXQgdHJlZSB3aXRob3V0
Cj4+Pj4gcHVsbGluZyBpbiB0aGUga3VuaXQgY2hhbmdlcyBpbnRvIHRoZSBleHQ0IGdpdCB0cmVl
LiAgQW5kIGlmIHRoZXkgZXh0NAo+Pj4+IHVuaXQgdGVzdHMgbGFuZCBpbiB0aGUga3VuaXQgdHJl
ZSwgaXQgd291bGQgYmUgYSByZWNlaXBlIGZvciBsYXJnZQo+Pj4+IG51bWJlcnMgb2YgbWVyZ2Ug
Y29uZmxpY3RzLgo+Pj4KPj4+IFRoYXQncyB3aGVyZSBJIHdhcyBvcmlnaW5hbGx5IGNvbWluZyBm
cm9tLgo+Pj4KPj4+IFNvIGhlcmUncyBhIGR1bWIgaWRlYTogd2hhdCBpZiB3ZSBtZXJnZWQgS1Vu
aXQgdGhyb3VnaCB0aGUgZXh0NCB0cmVlPwo+Pj4gSSBpbWFnaW5lIHRoYXQgY291bGQgcG90ZW50
aWFsbHkgZ2V0IHZlcnkgY29uZnVzaW5nIHdoZW4gd2UgZ28gYmFjayB0bwo+Pj4gc2VuZGluZyBj
aGFuZ2VzIGluIHRocm91Z2ggdGhlIGtzZWxmdGVzdCB0cmVlLCBidXQgYXQgbGVhc3QgaXQgbWVh
bnMKPj4+IHRoYXQgZXh0NCBjYW4gdXNlIGl0IGluIHRoZSBtZWFudGltZSwgd2hpY2ggbWVhbnMg
dGhhdCBpdCBhdCBsZWFzdAo+Pj4gZ2V0cyB0byBiZSB1c2VmdWwgdG8gb25lIGdyb3VwIG9mIHBl
b3BsZS4gQWxzbywgc2luY2UgVGVkIHNlZW1zIHByZXR0eQo+Pj4ga2VlbiBvbiB1c2luZyB0aGlz
LCBJIGltYWdpbmUgaXQgaXMgbXVjaCBtb3JlIGxpa2VseSB0byBwcm9kdWNlIHJlYWwKPj4+IHdv
cmxkLCBpbW1lZGlhdGVseSB1c2VmdWwgdGVzdHMgbm90IHdyaXR0ZW4gYnkgbWUgKEknbSBub3Qg
YmVpbmcgbGF6eSwKPj4+IEkganVzdCB0aGluayBpdCBpcyBiZXR0ZXIgdG8gZ2V0IG90aGVyIHBl
b3BsZSdzIGV4cGVyaWVuY2VzIG90aGVyIHRoYW4KPj4+IG15IG93bikuCj4+Pgo+Pgo+PiBUaGF0
IGRvZXNuJ3QgbWFrZSBzZW5zZSBkb2VzIGl0PyBUaGUgdGVzdHMgbWlnaHQgbm90IGJlIGxpbWl0
ZWQgdG8KPj4gZnMvZXh0NC4gV2UgbWlnaHQgaGF2ZSBvdGhlciBzdWItc3lzdGVtcyB0aGF0IGFk
ZCB0ZXN0cy4KPiAKPiBXZWxsLCBJIGhhdmUgc29tZSBzbWFsbCBpc29sYXRlZCBleGFtcGxlcyB0
aGF0IEkgdGhpbmsgd291bGQgcHJvYmFibHkKPiB3b3JrIG5vIG1hdHRlciB3aGF0LCBzbyB3ZSBj
YW4gZ2V0IHNvbWUgdXNhZ2Ugb3V0c2lkZSBvZiBleHQ0LiBBbHNvLAo+IGlmIHdlIHdhbnQgdG8g
bGltaXQgdGhlIG51bWJlciBvZiB0ZXN0cywgdGhlbiB3ZSBkb24ndCBleHBlY3QgdG8gZ2V0Cj4g
bXVjaCB1c2FnZSBvdXRzaWRlIG9mIGV4dDQgYmVmb3JlIHY1LjUgYW55d2F5LiBJIGp1c3QgZmln
dXJlLCBpdCdzCj4gYmV0dGVyIHRvIG1ha2UgaXQgd29yayBmb3Igb25lIHBlcnNvbiB0aGFuIG5v
IG9uZSwgcmlnaHQ/Cj4gCj4gSW4gYW55IGNhc2UsIEkgYWRtaXQgaXQgaXMgbm90IGEgZ3JlYXQg
aWRlYS4gSSBqdXN0IHRob3VnaHQgaXQgaGFkCj4gc29tZSBpbnRlcmVzdGluZyBhZHZhbnRhZ2Vz
IG92ZXIgZ29pbmcgaW4gdGhyb3VnaCBsaW51eC1rc2VsZnRlc3QgdGhhdAo+IHdlcmUgd29ydGgg
ZXhwbG9yaW5nLgo+IAo+PiBTbywgd2Ugd2lsbCBoYXZlIHRvIHdvcmsgdG8gbWFrZSBsaW51eC1u
ZXh0IGFzIHRoZSBiYXNlIGZvciBuZXcKPj4gZGV2ZWxvcG1lbnQgYW5kIGxpbWl0IHRoZSBudW1i
ZXIgb2YgdGVzdHMgdG8gd2hlcmUgaXQgd2lsbCBiZQo+PiBlYXNpZXIgd29yayBpbiB0aGlzIG1v
ZGUgZm9yIDUuNS4gV2UgY2FuIHN0YWdlIHRoZSBwdWxsIHJlcXVlc3RzCj4+IHNvIHRoYXQga3Vu
aXQgbGFuZHMgZmlyc3QgZm9sbG93ZWQgYnkgdGVzdHMuCj4gCj4gU28gd2UgYXJlIGdvaW5nIHRv
IGVuY291cmFnZSBtYWludGFpbmVycyB0byBhbGxvdyB0ZXN0cyBpbiB0aGVpciB0cmVlCj4gYmFz
ZWQgb24gS1VuaXQgb24gdGhlIGFzc3VtcHRpb24gdGhhdCBLVW5pdCB3aWxsIGdldCBtZXJnZWQg
YmVmb3JlCj4gdGhlcmUgY2hhbmdlcz8gVGhhdCBzb3VuZHMgbGlrZSBhIGh1Z2UgYnVyZGVuLCBu
b3QganVzdCBvbiB1cywgYnV0IG9uCj4gb3RoZXIgbWFpbnRhaW5lcnMgYW5kIHVzZXJzLgo+IAo+
IEkgdGhpbmsgaWYgd2UgYXJlIGdvaW5nIHRvIGFsbG93IHRlc3RzIGJlZm9yZSBLVW5pdCBpcyBt
ZXJnZWQsIHdlCj4gc2hvdWxkIGhhdmUgdGhlIHRlc3RzIGNvbWUgaW4gdGhyb3VnaCB0aGUgc2Ft
ZSB0cmVlIGFzIEtVbml0Lgo+IAo+PiBXZSBoYXZlIGEgc2ltaWxhciBzaXR1YXRpb24gd2l0aCBr
c2VsZnRlc3QgYXMgd2VsbC4gU3ViLXN5c3RlbXMKPj4gc2VuZCB0ZXN0cyB0aGF0IGRlcGVuZCBv
biB0aGVpciB0cmVzcyBzZXBhcmF0ZWx5Lgo+IAo+IFdlbGwgaXQgaXMgZGlmZmVyZW50IGlmIHRo
ZSBtYWludGFpbmVyIHdhbnRzIHRvIHNlbmQgdGhlIHRlc3QgaW4KPiB0aHJvdWdoIHRoZWlyIHRy
ZWUsIHJpZ2h0PyBPdGhlcndpc2UsIGl0IHdvbid0IG1hdHRlciB3aGF0IHRoZSBzdGF0ZQo+IG9m
IGxpbnV4LW5leHQgaXMgYW5kIGl0IHdvbid0IG1hdHRlciB3aGVuIGxpbnV4LWtzZWxmdGVzdCBn
ZXRzIG1lcmdlZC4KPiBPciBhbSBJIG5vdCB1bmRlcnN0YW5kaW5nIHlvdT8KPiAKCkxldCdzIHRh
bGsgYWJvdXQgY3VycmVudCBzdGF0ZS4gUmlnaHQgbm93IGt1bml0IGlzIGluIGxpbnV4LW5leHQg
YW5kCndlIHdhbnQgdG8gYWRkIGEgZmV3IG1vcmUgdGVzdHMuIFdlIHdpbGwgaGF2ZSB0byBjb29y
ZGluYXRlIHRoZSBlZmZvcnQuCk9uY2Uga3VuaXQgZ2V0IGludG8gbWFpbmxpbmUsIHRoZW4gdGhl
IG5lZWQgZm9yIHRoaXMgY29vcmRpbmF0aW9uIGdvZXMKZG93bi4KCkxldCdzIGZvY3VzIG9uIHRo
ZSBuZXh0IGZldyB3ZWVrcyBmaXJzdCBzbyB3ZSBjYW4gZ2V0IHRoaXMgaW50byBtYWlubGluZQpp
biA1LjUuCgpUaGUgdHdvIG9mIHVzIGNhbiBjaGF0IG5leHQgd2VlayBhbmQgY29tZSB1cCB3aXRo
IGEgcGxhbi4KCnRoYW5rcywKLS0gU2h1YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
