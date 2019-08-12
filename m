Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F48A881
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 22:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF70A6E3BF;
	Mon, 12 Aug 2019 20:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEDB6E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 20:41:37 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id g2so50293311pfq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 13:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJnh/DbbwUp2ykhuWtKroei6fTXCscBWC620YMU78kw=;
 b=GPwl+pe1kEgVfNIpB6zF+A8zyRjW7YMa4TV5o3uleOe9pj3nsQIt3QEGl9yX34UZjx
 Expy/Yo7fEp2PeUMAequnHDWE+Z7qA/mgrASLc1DicSxIwmqk/Ludj+Bt8ZZ69hzbDd8
 fmiY25d8GmrC3FgpCqJGrD3ke3wsxnZ7rnA4UkEs23SqN8TBL7Hpp40nMfywVNzQsiUw
 2TB1ydHTdp1JT46YsM+qcK/rfS4b9dtAwVnOGIDuX9UXrv9Xv1di1752nxkB5BjBvRWv
 52kJQaD386IFy5obe9gUv9FWly2EErXvzUiIHDJaHTxAs+mtZcOxNP+VaTr9Ff1KoDd3
 iLfA==
X-Gm-Message-State: APjAAAWCC3D7dhO6+/stEbrSn07hAtOk7RPX6Wfrva7b14+fC49FAS7A
 0p/zIwpTaB241d2MTMuMXbXnvhYrjTacsmZH0xEO1A==
X-Google-Smtp-Source: APXvYqzmkY3rA1NydAKLLowsftOVMQA6KoE5ccWG/aJPzsMG71zwm21zQ2Wdnhb2Togz1F6UwE1Me36C6jQdnlOZ3bs=
X-Received: by 2002:a63:b919:: with SMTP id z25mr31379684pge.201.1565642496668; 
 Mon, 12 Aug 2019 13:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190716175021.9CA412173C@mail.kernel.org>
 <20190719000834.GA3228@google.com>
 <20190722200347.261D3218C9@mail.kernel.org>
 <CAFd5g45hdCxEavSxirr0un_uLzo5Z-J4gHRA06qjzcQrTzmjVg@mail.gmail.com>
 <20190722235411.06C1320840@mail.kernel.org>
 <20190724073125.xyzfywctrcvg6fmh@pathway.suse.cz>
 <CAFd5g47v3Mr4GEGOjqyYy9Jwwm+ow7ypbu9j88rxEN06QCzdxQ@mail.gmail.com>
 <20190726083148.d4gf57w2nt5k7t6n@pathway.suse.cz>
 <CAFd5g46iAhDZ5C_chi7oYLVOkwcoj6+0nw+kPWuXhqWwWKd9jA@mail.gmail.com>
 <CAFd5g473iFfvBnJs2pcwuJYgY+DpgD6RLzyDFL1otUuScgKUag@mail.gmail.com>
 <20190801211447.6D3D7206A2@mail.kernel.org>
 <CAFd5g47tk8x5iet=xfPVO6MphD3SsLtYQLrCi5O2h0bvdXwHtA@mail.gmail.com>
In-Reply-To: <CAFd5g47tk8x5iet=xfPVO6MphD3SsLtYQLrCi5O2h0bvdXwHtA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 13:41:24 -0700
Message-ID: <CAFd5g44bovSiiqGCip1Q4zBOUauXMcryxnPs8miOa0-QrPW61Q@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MJnh/DbbwUp2ykhuWtKroei6fTXCscBWC620YMU78kw=;
 b=vB8BBLTcHyR/6MmManbwUwxuFJIulQIi8ssstEWavyxVjDjZTqCdDV4k+GvQznx2Gu
 BYrmoSxq/p6EpObadBuog/qnQED0Er2g3FPY/R5mmU2+6prANR/EPeaPhjZJhguiIiRP
 laVlnix+3k3ldsZoV0C1xagsklVYtYidBM9aE1xGrFVcLjBbwRpW6HahGY9+Avp/kWLm
 T5NAN/tqvOLG0auDu2paiIhDdkHD9xVBreQFe50Qz3Fk4VEdJTBMNP4enXfrvN3t06qW
 EUgtNhbhUYFQV5XLv75AMMsdUTUbhRhJq5GaejhlsHjGOrbIRPayAm9bBTghIOMPNAZO
 gGvA==
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Timothy Bird <Tim.Bird@sony.com>, Frank Rowand <frowand.list@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAyOjQzIFBNIEJyZW5kYW4gSGlnZ2lucwo8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAxLCAyMDE5IGF0IDI6MTQg
UE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBRdW90aW5n
IEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wOC0wMSAxMTo1OTo1NykKPiA+ID4gT24gVGh1LCBBdWcg
MSwgMjAxOSBhdCAxMTo1NSBBTSBCcmVuZGFuIEhpZ2dpbnMKPiA+ID4gPGJyZW5kYW5oaWdnaW5z
QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCBKdWwgMjYsIDIwMTkg
YXQgMTozMSBBTSBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiA+IFRvIGJlIGhvbmVzdCBJIGRvIG5vdCBmdWxseSB1bmRlcnN0YW5kIEtVbml0IGRl
c2lnbi4gSSBhbSBub3QKPiA+ID4gPiA+IGNvbXBsZXRlbHkgc3VyZSBob3cgdGhlIHRlc3RlZCBj
b2RlIGlzIGlzb2xhdGVkIGZyb20gdGhlIHJ1bm5pbmcKPiA+ID4gPiA+IHN5c3RlbS4gTmFtZWx5
LCBJIGRvIG5vdCBrbm93IGlmIHRoZSB0ZXN0ZWQgY29kZSBzaGFyZXMKPiA+ID4gPiA+IHRoZSBz
YW1lIGxvY2tzIHdpdGggdGhlIHN5c3RlbSBydW5uaW5nIHRoZSB0ZXN0Lgo+ID4gPiA+Cj4gPiA+
ID4gTm8gd29ycmllcywgSSBkb24ndCBleHBlY3QgcHJpbnRrIHRvIGJlIHRoZSBoYW5nIHVwIGlu
IHRob3NlIGNhc2VzLiBJdAo+ID4gPiA+IHNvdW5kcyBsaWtlIEtVbml0IGhhcyBhIGxvbmcgd2F5
IHRvIGV2b2x2ZSBiZWZvcmUgcHJpbnRrIGlzIGdvaW5nIHRvCj4gPiA+ID4gYmUgYSBsaW1pdGF0
aW9uLgo+ID4gPgo+ID4gPiBTbyBTdGVwaGVuLCB3aGF0IGRvIHlvdSB0aGluaz8KPiA+ID4KPiA+
ID4gRG8geW91IHdhbnQgbWUgdG8gZ28gZm9yd2FyZCB3aXRoIHRoZSBuZXcga3VuaXRfYXNzZXJ0
IEFQSSB3cmFwcGluZwo+ID4gPiB0aGUgc3RyaW5nX3N0cmVhbSBhcyBJIGhhdmUgaXQgbm93PyBX
b3VsZCB5b3UgcHJlZmVyIHRvIHB1bnQgdGhpcyB0byBhCj4gPiA+IGxhdGVyIHBhdGNoPyBPciB3
b3VsZCB5b3UgcHJlZmVyIHNvbWV0aGluZyBlbHNlPwo+ID4gPgo+ID4KPiA+IEkgbGlrZSB0aGUg
c3RydWN0IGJhc2VkIGFwcHJvYWNoLiBJZiBhbnl0aGluZywgaXQgY2FuIGJlIGFkanVzdGVkIHRv
Cj4gPiBtYWtlIHRoZSBjb2RlIHRocm93IHNvbWUgcmVjb3JkcyBpbnRvIGEgc3BpbmxvY2sgbGF0
ZXIgb24gYW5kIGRlbGF5IHRoZQo+ID4gZm9ybWF0dGluZyBvZiB0aGUgYXNzZXJ0aW9uIGlmIG5l
ZWQgYmUuCj4KPiBUaGF0J3MgYSBmYWlyIHBvaW50Lgo+Cj4gPiBDYW4geW91IHJlc2VuZCB3aXRo
IHRoYXQKPiA+IGFwcHJvYWNoPyBJIGRvbid0IHRoaW5rIEknbGwgaGF2ZSBhbnkgbW9yZSBjb21t
ZW50cyBhZnRlciB0aGF0LgoKSSBzZW50IGEgbmV3IHJldmlzaW9uLCB2MTIsIHRoYXQgaW5jb3Jw
b3JhdGVzIHRoZSBrdW5pdF9hc3NlcnQgc3R1ZmYuCgpMZXQgbWUga25vdyB3aGF0IHlvdSB0aGlu
ayEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
