Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C716CC6F1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 02:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486E6EC3E;
	Sat,  5 Oct 2019 00:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244176EC3E
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 00:33:20 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id v4so4868070pff.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 17:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D46P+pVFfxgwgDsZx7SQOen52ll2cZjAnqUT3X3NgW0=;
 b=sDyEvaUpTWADPTepLrAfrF6HmR38Pcq2Gd1J6t0yilKFHzZ1lYkR4AUo6YOwwUzVUl
 kXa3mY2QUnWUcjPggbTiqxtd2qfwJY+4sHv6gapxMLaRmb+6h8X8IqvfZ5HTFrFLkp3C
 xJ+qMLWnQHAAzMSLWmVLJSapNEN6r6MmjLMPuC+h6oMR3sP4bb+Ho7EAdOoQF1p8351t
 V2xZpJ6+8QQ81HP3PadNAFu0x3yq7Q7PQ5LTNPiuN1zM1LZ2qBMRvSeOXAfgBkOi3lVj
 V6fBg2W0P/xMzk+9ysyyxzmIKGg/4NGOY/XYGhJiaL2pkcWOsUMWhl5YJTC6+UDn0TCZ
 DKPg==
X-Gm-Message-State: APjAAAWrjpxFRq7QPS8zkDJGIb3fFYJdFRdectTWJFQnXAXYpQJa9ZsN
 nw7F4x9QD3YV2Bpd2SX6tDiatAA4OxlpuInAtO5zpg==
X-Google-Smtp-Source: APXvYqw66A3fhEGGLREG4yw4Pr+r6ZvkAOqsm8j0EV5rRDrFLbH6NKzALIarwIy5UgNm5Ny2R6LZT6ifOs8an8aRKWI=
X-Received: by 2002:a63:ba47:: with SMTP id l7mr17994364pgu.201.1570235599104; 
 Fri, 04 Oct 2019 17:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
In-Reply-To: <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 4 Oct 2019 17:33:07 -0700
Message-ID: <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=D46P+pVFfxgwgDsZx7SQOen52ll2cZjAnqUT3X3NgW0=;
 b=pfJammvnqsEMehjoLkxaDxOUGpDw9sMZZncjKjevQVD06AywjDWgKxI3wf/rjLvej+
 UMstuf7cZplWndCtVzElsJOLS9g3ywukZExpQOCwhcvJdVD/JBab/7OxMaqUq+VMf8uB
 HAlF4ShFAU0DFBIxJWc0azVVvQ3Wy3f/oPQ9fuPzdpvWA0iIdowJ2c5Zbg/9JFOECY68
 O0WE57VT7qGlC8/9NlRmT3cO731/aVh8fcnZ5D//mK4n1CuG+yjNV9JbOBBcB23LSygI
 0TQKj3Hpc++fct7e7Rz4uTtgBBwkQmtKSHbbFGBlPsmvEeBSrzgLlq+QG4ouGMdfYcWZ
 C2hg==
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
 devicetree <devicetree@vger.kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA0OjU3IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDEwLzQvMTkgNTo1MiBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4g
T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA0OjMwIFBNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1p
dC5lZHU+IHdyb3RlOgo+ID4+Cj4gPj4gT24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6NDc6MDlQ
TSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4gPj4+PiBIb3dldmVyLCBpZiBJIGVuY291cmFnZSBhcmJp
dHJhcnkgdGVzdHMvaW1wcm92ZW1lbnRzIGludG8gbXkgS1VuaXQKPiA+Pj4+IGJyYW5jaCwgaXQg
ZnVydGhlciBkaXZlcmdlcyBhd2F5IGZyb20gdG9ydmFsZHMvbWFzdGVyLCBhbmQgaXMgbW9yZQo+
ID4+Pj4gbGlrZWx5IHRoYXQgdGhlcmUgd2lsbCBiZSBhIG1lcmdlIGNvbmZsaWN0IG9yIGlzc3Vl
IHRoYXQgaXMgbm90IHJlbGF0ZWQKPiA+Pj4+IHRvIHRoZSBjb3JlIEtVbml0IGNoYW5nZXMgdGhh
dCB3aWxsIGNhdXNlIHRoZSB3aG9sZSB0aGluZyB0byBiZQo+ID4+Pj4gcmVqZWN0ZWQgYWdhaW4g
aW4gdjUuNS4KPiA+Pj4KPiA+Pj4gVGhlIGlkZWEgaXMgdGhhdCB0aGUgbmV3IGRldmVsb3BtZW50
IHdpbGwgaGFwcGVuIGJhc2VkIG9uIGt1bml0IGluCj4gPj4+IGxpbnV4LWtzZWxmdGVzdCBuZXh0
LiBJdCB3aWxsIHdvcmsganVzdCBmaW5lLiBBcyB3ZSBhY2NlcHRzIHBhdGNoZXMsCj4gPj4+IHRo
ZXkgd2lsbCBnbyBvbiB0b3Agb2Yga3VuaXQgdGhhdCBpcyBpbiBsaW51eC1uZXh0IG5vdy4KPiA+
Pgo+ID4+IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIHdvdWxkIHdvcmsuICBJZiBJIGFkZCB1bml0IHRl
c3RzIHRvIGV4dDQsIHRoZXkKPiA+PiB3b3VsZCBiZSBpbiBmcy9leHQ0LiAgQW5kIHRvIHRoZSBl
eHRlbnQgdGhhdCBJIG5lZWQgdG8gYWRkIHRlc3QgbW9ja3MKPiA+PiB0byBhbGxvdyB0aGUgdW5p
dCB0ZXN0cyB0byB3b3JrLCB0aGV5IHdpbGwgaW52b2x2ZSBjaGFuZ2VzIHRvIGV4aXN0aW5nCj4g
Pj4gZmlsZXMgaW4gZnMvZXh0NC4gIEkgY2FuJ3QgcHV0IHRoZW0gaW4gdGhlIGV4dDQuZ2l0IHRy
ZWUgd2l0aG91dAo+ID4+IHB1bGxpbmcgaW4gdGhlIGt1bml0IGNoYW5nZXMgaW50byB0aGUgZXh0
NCBnaXQgdHJlZS4gIEFuZCBpZiB0aGV5IGV4dDQKPiA+PiB1bml0IHRlc3RzIGxhbmQgaW4gdGhl
IGt1bml0IHRyZWUsIGl0IHdvdWxkIGJlIGEgcmVjZWlwZSBmb3IgbGFyZ2UKPiA+PiBudW1iZXJz
IG9mIG1lcmdlIGNvbmZsaWN0cy4KPiA+Cj4gPiBUaGF0J3Mgd2hlcmUgSSB3YXMgb3JpZ2luYWxs
eSBjb21pbmcgZnJvbS4KPiA+Cj4gPiBTbyBoZXJlJ3MgYSBkdW1iIGlkZWE6IHdoYXQgaWYgd2Ug
bWVyZ2VkIEtVbml0IHRocm91Z2ggdGhlIGV4dDQgdHJlZT8KPiA+IEkgaW1hZ2luZSB0aGF0IGNv
dWxkIHBvdGVudGlhbGx5IGdldCB2ZXJ5IGNvbmZ1c2luZyB3aGVuIHdlIGdvIGJhY2sgdG8KPiA+
IHNlbmRpbmcgY2hhbmdlcyBpbiB0aHJvdWdoIHRoZSBrc2VsZnRlc3QgdHJlZSwgYnV0IGF0IGxl
YXN0IGl0IG1lYW5zCj4gPiB0aGF0IGV4dDQgY2FuIHVzZSBpdCBpbiB0aGUgbWVhbnRpbWUsIHdo
aWNoIG1lYW5zIHRoYXQgaXQgYXQgbGVhc3QKPiA+IGdldHMgdG8gYmUgdXNlZnVsIHRvIG9uZSBn
cm91cCBvZiBwZW9wbGUuIEFsc28sIHNpbmNlIFRlZCBzZWVtcyBwcmV0dHkKPiA+IGtlZW4gb24g
dXNpbmcgdGhpcywgSSBpbWFnaW5lIGl0IGlzIG11Y2ggbW9yZSBsaWtlbHkgdG8gcHJvZHVjZSBy
ZWFsCj4gPiB3b3JsZCwgaW1tZWRpYXRlbHkgdXNlZnVsIHRlc3RzIG5vdCB3cml0dGVuIGJ5IG1l
IChJJ20gbm90IGJlaW5nIGxhenksCj4gPiBJIGp1c3QgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIGdl
dCBvdGhlciBwZW9wbGUncyBleHBlcmllbmNlcyBvdGhlciB0aGFuCj4gPiBteSBvd24pLgo+ID4K
Pgo+IFRoYXQgZG9lc24ndCBtYWtlIHNlbnNlIGRvZXMgaXQ/IFRoZSB0ZXN0cyBtaWdodCBub3Qg
YmUgbGltaXRlZCB0bwo+IGZzL2V4dDQuIFdlIG1pZ2h0IGhhdmUgb3RoZXIgc3ViLXN5c3RlbXMg
dGhhdCBhZGQgdGVzdHMuCgpXZWxsLCBJIGhhdmUgc29tZSBzbWFsbCBpc29sYXRlZCBleGFtcGxl
cyB0aGF0IEkgdGhpbmsgd291bGQgcHJvYmFibHkKd29yayBubyBtYXR0ZXIgd2hhdCwgc28gd2Ug
Y2FuIGdldCBzb21lIHVzYWdlIG91dHNpZGUgb2YgZXh0NC4gQWxzbywKaWYgd2Ugd2FudCB0byBs
aW1pdCB0aGUgbnVtYmVyIG9mIHRlc3RzLCB0aGVuIHdlIGRvbid0IGV4cGVjdCB0byBnZXQKbXVj
aCB1c2FnZSBvdXRzaWRlIG9mIGV4dDQgYmVmb3JlIHY1LjUgYW55d2F5LiBJIGp1c3QgZmlndXJl
LCBpdCdzCmJldHRlciB0byBtYWtlIGl0IHdvcmsgZm9yIG9uZSBwZXJzb24gdGhhbiBubyBvbmUs
IHJpZ2h0PwoKSW4gYW55IGNhc2UsIEkgYWRtaXQgaXQgaXMgbm90IGEgZ3JlYXQgaWRlYS4gSSBq
dXN0IHRob3VnaHQgaXQgaGFkCnNvbWUgaW50ZXJlc3RpbmcgYWR2YW50YWdlcyBvdmVyIGdvaW5n
IGluIHRocm91Z2ggbGludXgta3NlbGZ0ZXN0IHRoYXQKd2VyZSB3b3J0aCBleHBsb3JpbmcuCgo+
IFNvLCB3ZSB3aWxsIGhhdmUgdG8gd29yayB0byBtYWtlIGxpbnV4LW5leHQgYXMgdGhlIGJhc2Ug
Zm9yIG5ldwo+IGRldmVsb3BtZW50IGFuZCBsaW1pdCB0aGUgbnVtYmVyIG9mIHRlc3RzIHRvIHdo
ZXJlIGl0IHdpbGwgYmUKPiBlYXNpZXIgd29yayBpbiB0aGlzIG1vZGUgZm9yIDUuNS4gV2UgY2Fu
IHN0YWdlIHRoZSBwdWxsIHJlcXVlc3RzCj4gc28gdGhhdCBrdW5pdCBsYW5kcyBmaXJzdCBmb2xs
b3dlZCBieSB0ZXN0cy4KClNvIHdlIGFyZSBnb2luZyB0byBlbmNvdXJhZ2UgbWFpbnRhaW5lcnMg
dG8gYWxsb3cgdGVzdHMgaW4gdGhlaXIgdHJlZQpiYXNlZCBvbiBLVW5pdCBvbiB0aGUgYXNzdW1w
dGlvbiB0aGF0IEtVbml0IHdpbGwgZ2V0IG1lcmdlZCBiZWZvcmUKdGhlcmUgY2hhbmdlcz8gVGhh
dCBzb3VuZHMgbGlrZSBhIGh1Z2UgYnVyZGVuLCBub3QganVzdCBvbiB1cywgYnV0IG9uCm90aGVy
IG1haW50YWluZXJzIGFuZCB1c2Vycy4KCkkgdGhpbmsgaWYgd2UgYXJlIGdvaW5nIHRvIGFsbG93
IHRlc3RzIGJlZm9yZSBLVW5pdCBpcyBtZXJnZWQsIHdlCnNob3VsZCBoYXZlIHRoZSB0ZXN0cyBj
b21lIGluIHRocm91Z2ggdGhlIHNhbWUgdHJlZSBhcyBLVW5pdC4KCj4gV2UgaGF2ZSBhIHNpbWls
YXIgc2l0dWF0aW9uIHdpdGgga3NlbGZ0ZXN0IGFzIHdlbGwuIFN1Yi1zeXN0ZW1zCj4gc2VuZCB0
ZXN0cyB0aGF0IGRlcGVuZCBvbiB0aGVpciB0cmVzcyBzZXBhcmF0ZWx5LgoKV2VsbCBpdCBpcyBk
aWZmZXJlbnQgaWYgdGhlIG1haW50YWluZXIgd2FudHMgdG8gc2VuZCB0aGUgdGVzdCBpbgp0aHJv
dWdoIHRoZWlyIHRyZWUsIHJpZ2h0PyBPdGhlcndpc2UsIGl0IHdvbid0IG1hdHRlciB3aGF0IHRo
ZSBzdGF0ZQpvZiBsaW51eC1uZXh0IGlzIGFuZCBpdCB3b24ndCBtYXR0ZXIgd2hlbiBsaW51eC1r
c2VsZnRlc3QgZ2V0cyBtZXJnZWQuCk9yIGFtIEkgbm90IHVuZGVyc3RhbmRpbmcgeW91PwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
