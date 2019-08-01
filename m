Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5427E4F1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 23:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA446E821;
	Thu,  1 Aug 2019 21:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06E96E821
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 21:43:55 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b3so32795873plr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 14:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRJWWqPxe4v7OGh5SzFgwfV47CyOeIABo0H7U+M+pdg=;
 b=uAihs3hivuYrQrYRJE9jcN1Vn8KEdL2XKYNCvDE/AYwmgYcopgrFdl8IfpkWrfMe12
 RUYFhdnpyBkzNRauCdUedz9Mei5jknv97Z83wrCb5jVzClxfhwOo6nyV0t5IDnl5JXkr
 XisRjybljiMARtm2NDUO38J0YYykP6s414nin9rxbCK+1WNx+Bi6msoBe1NAXjUahoGK
 FF/QvceOgeZREUpiSJVSKfktkkVjm8M9JCb6SWoKL85myeN42MA5NJbQwZY4+vDS2S/f
 Q7wYHAYzDzrf/aWLU/fdIpdZNoeU8g5hNq2oMcxPVPCKbpywaCpuYTFG9JlL9uWRAFxm
 VnLQ==
X-Gm-Message-State: APjAAAXcR9TwauGdOxRliTW4YBKj3E7+ydc9Rm3TT9qWHVpT65nGIVfl
 T5c0alouDwqINC1/rMCP7d94h+PvwhI2NTyEvI41Vg==
X-Google-Smtp-Source: APXvYqyQJ3oYuIkR4HxnjqcvX8HB7OCTCVhJ4Fku+hNPqOUYjGToK6i2G0j1xWhCd4v39RwFH1V7C/0k5dVHTOnW45I=
X-Received: by 2002:a17:902:347:: with SMTP id
 65mr32846391pld.232.1564695834770; 
 Thu, 01 Aug 2019 14:43:54 -0700 (PDT)
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
In-Reply-To: <20190801211447.6D3D7206A2@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 1 Aug 2019 14:43:42 -0700
Message-ID: <CAFd5g47tk8x5iet=xfPVO6MphD3SsLtYQLrCi5O2h0bvdXwHtA@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tRJWWqPxe4v7OGh5SzFgwfV47CyOeIABo0H7U+M+pdg=;
 b=S/P5gz+a9jUw7SwOiz84JEbZSB3baAlVLSphUNs8eZlN3ZPowtpH0MpNodRchncDaL
 h/pwktm3ZoMM5ur9uIqRsyskaBqjhXhPvxaJG//b32Uphj0PG1ynA9CUTm1TW0sAsjm6
 HvrHFAepLSyokzes/1ht5wjMSnlrEgSRbO09yXW02SG1IbAd8mAQKhoiLKJYr6VkLWg+
 7rO55CqVAf6utB/oO5cCFpNjfcdHsW2PZ6e5nZCbdexwb5KuZDKGxSTHr3F16NHksaHQ
 xyoTxMhvtaSYfpReQiXJpspTpAAqnNeKDN71dNMH70NnoXLk5zU84jZ89voAQsdAyikW
 53ug==
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

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAyOjE0IFBNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wOC0wMSAxMTo1
OTo1NykKPiA+IE9uIFRodSwgQXVnIDEsIDIwMTkgYXQgMTE6NTUgQU0gQnJlbmRhbiBIaWdnaW5z
Cj4gPiA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIEZy
aSwgSnVsIDI2LCAyMDE5IGF0IDE6MzEgQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiA+IFRvIGJlIGhvbmVzdCBJIGRvIG5vdCBmdWxseSB1bmRlcnN0
YW5kIEtVbml0IGRlc2lnbi4gSSBhbSBub3QKPiA+ID4gPiBjb21wbGV0ZWx5IHN1cmUgaG93IHRo
ZSB0ZXN0ZWQgY29kZSBpcyBpc29sYXRlZCBmcm9tIHRoZSBydW5uaW5nCj4gPiA+ID4gc3lzdGVt
LiBOYW1lbHksIEkgZG8gbm90IGtub3cgaWYgdGhlIHRlc3RlZCBjb2RlIHNoYXJlcwo+ID4gPiA+
IHRoZSBzYW1lIGxvY2tzIHdpdGggdGhlIHN5c3RlbSBydW5uaW5nIHRoZSB0ZXN0Lgo+ID4gPgo+
ID4gPiBObyB3b3JyaWVzLCBJIGRvbid0IGV4cGVjdCBwcmludGsgdG8gYmUgdGhlIGhhbmcgdXAg
aW4gdGhvc2UgY2FzZXMuIEl0Cj4gPiA+IHNvdW5kcyBsaWtlIEtVbml0IGhhcyBhIGxvbmcgd2F5
IHRvIGV2b2x2ZSBiZWZvcmUgcHJpbnRrIGlzIGdvaW5nIHRvCj4gPiA+IGJlIGEgbGltaXRhdGlv
bi4KPiA+Cj4gPiBTbyBTdGVwaGVuLCB3aGF0IGRvIHlvdSB0aGluaz8KPiA+Cj4gPiBEbyB5b3Ug
d2FudCBtZSB0byBnbyBmb3J3YXJkIHdpdGggdGhlIG5ldyBrdW5pdF9hc3NlcnQgQVBJIHdyYXBw
aW5nCj4gPiB0aGUgc3RyaW5nX3N0cmVhbSBhcyBJIGhhdmUgaXQgbm93PyBXb3VsZCB5b3UgcHJl
ZmVyIHRvIHB1bnQgdGhpcyB0byBhCj4gPiBsYXRlciBwYXRjaD8gT3Igd291bGQgeW91IHByZWZl
ciBzb21ldGhpbmcgZWxzZT8KPiA+Cj4KPiBJIGxpa2UgdGhlIHN0cnVjdCBiYXNlZCBhcHByb2Fj
aC4gSWYgYW55dGhpbmcsIGl0IGNhbiBiZSBhZGp1c3RlZCB0bwo+IG1ha2UgdGhlIGNvZGUgdGhy
b3cgc29tZSByZWNvcmRzIGludG8gYSBzcGlubG9jayBsYXRlciBvbiBhbmQgZGVsYXkgdGhlCj4g
Zm9ybWF0dGluZyBvZiB0aGUgYXNzZXJ0aW9uIGlmIG5lZWQgYmUuCgpUaGF0J3MgYSBmYWlyIHBv
aW50LgoKPiBDYW4geW91IHJlc2VuZCB3aXRoIHRoYXQKPiBhcHByb2FjaD8gSSBkb24ndCB0aGlu
ayBJJ2xsIGhhdmUgYW55IG1vcmUgY29tbWVudHMgYWZ0ZXIgdGhhdC4KCkNvb2wsIHdpbGwgZG8u
CgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
