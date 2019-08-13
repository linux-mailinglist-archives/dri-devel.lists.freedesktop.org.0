Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3D8B34F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90056E0AE;
	Tue, 13 Aug 2019 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293B289CF9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:04:57 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a93so48964698pla.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QiUXy9T56EDLZHgM/ghmiZZKu3jldBkP3AywgOf7WrE=;
 b=grb4/+7kLLIqbt9qN5ipQTzy0/bCf23hZQLGk6WZ+Zd/BMM3Tp7xBM7weHMimk+chI
 d5DQiOw6C3GHV0SD7OcqudfGtPVdEVQtpxm3zVaGS3xvl3/Qxv2QQEsB7Xc3tLwsdb8+
 J3688E+527vAm6f3dh1VYECsxg2VeOSnx22mMZyDdUzfRCRFujVpzo8nYyynWKyKXOM0
 YIYMvE9VpEmPRGB0XsGRw93fGfs+E6CE7PHbJ71dP3F0tUUwhai5lirpGGvoFfU9IIcy
 DBu2gMFAX8S/sXFMuDvxQSfrizhH0iwGB7q4VeyOT0nDq4y41GhIooA7CcGYVVSw6ktf
 6SPA==
X-Gm-Message-State: APjAAAVd04z/g1ShvqcRsswaymofjSwj/WXbpo6MRt6kbPTaEhHO6Tce
 HrTgV7xw6sTzliSsAyDekMkduj/9SxkpqR+kE6vliw==
X-Google-Smtp-Source: APXvYqwG2gN8zpP7bhFAP1u+fXAsfwR8jNJUVHpIzT9G6iZ0jAKs6Cy6kBh6Os478yKmPUZiHWGohGqW0T9u2YI3MZY=
X-Received: by 2002:a17:902:1024:: with SMTP id
 b33mr27760446pla.325.1565687095973; 
 Tue, 13 Aug 2019 02:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com>
 <20190812235940.100842063F@mail.kernel.org>
 <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
 <20190813045623.F3D9520842@mail.kernel.org>
 <CAFd5g46PJNTOUAA4GOOrW==74Zy7u1sRESTanL_BXBn6QykscA@mail.gmail.com>
 <20190813053023.CC86120651@mail.kernel.org>
In-Reply-To: <20190813053023.CC86120651@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Aug 2019 02:04:44 -0700
Message-ID: <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg@mail.gmail.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QiUXy9T56EDLZHgM/ghmiZZKu3jldBkP3AywgOf7WrE=;
 b=MLD0OBKrmLSIMOt648B9mPAmsjWuHn6T9ywV6kHk53m2QAcx/5//33wzzGap97ISgd
 1n1dPQTH2aqoshjF311lPPF9RyircKfegESJ2xxxn2TBZss5XJTQKDNllI8Lep9L/7SF
 MM7idIRhDooM4kA4MSv9ueRH5hrjDJGGg0AgX0HqE87hvGQZOuRQRmqZQqIXAW5zi2XY
 qx3rKtyNkDR1tJcjwneeXBeG+UkkSb8i3ocoTOXfuDYPqL5L4LUf+dq11gIkuMFV1by4
 yd/+IqmaOAJsJPYvSatGT0S67lif/DCk+kAwLjTl1ZQp1oSabKWPVnDpLlDJM1jY/AYp
 VtUg==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6MzAgUE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEyIDIy
OjAyOjU5KQo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgOTo1NiBQTSBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBRdW90aW5nIEJyZW5kYW4gSGln
Z2lucyAoMjAxOS0wOC0xMiAxNzo0MTowNSkKPiA+ID4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBh
dCA0OjU5IFBNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBrdW5pdF9yZXNvdXJjZV9kZXN0cm95IChyZXNwZWN0aXZlIGVxdWl2YWxl
bnRzIHRvIGRldm1fa2ZyZWUsIGFuZAo+ID4gPiA+ID4gPiBkZXZyZXNfZGVzdHJveSkgYW5kIHVz
ZSBrdW5pdF9rZnJlZSBoZXJlPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFllcywg
b3IgZHJvcCB0aGUgQVBJIGVudGlyZWx5PyBEb2VzIGFueXRoaW5nIG5lZWQgdGhpcyBmdW5jdGlv
bmFsaXR5Pwo+ID4gPiA+Cj4gPiA+ID4gRHJvcCB0aGUga3VuaXRfcmVzb3VyY2UgQVBJPyBJIHdv
dWxkIHN0cm9uZ2x5IHByZWZlciBub3QgdG8uCj4gPiA+Cj4gPiA+IE5vLiBJIG1lYW4gdGhpcyBB
UEksIHN0cmluZ19zdHJlYW1fY2xlYXIoKS4gRG9lcyBhbnl0aGluZyB1c2UgaXQ/Cj4gPgo+ID4g
T2gsIHJpZ2h0LiBOby4KPiA+Cj4gPiBIb3dldmVyLCBub3cgdGhhdCBJIGFkZGVkIHRoZSBrdW5p
dF9yZXNvdXJjZV9kZXN0cm95LCBJIHRob3VnaHQgaXQKPiA+IG1pZ2h0IGJlIGdvb2QgdG8gZnJl
ZSB0aGUgc3RyaW5nX3N0cmVhbSBhZnRlciBJIHVzZSBpdCBpbiBlYWNoIGNhbGwgdG8KPiA+IGt1
bml0X2Fzc2VydC0+Zm9ybWF0KC4uLikgaW4gd2hpY2ggY2FzZSBJIHdpbGwgYmUgdXNpbmcgdGhp
cyBsb2dpYy4KPiA+Cj4gPiBTbyBJIHRoaW5rIHRoZSByaWdodCB0aGluZyB0byBkbyBpcyB0byBl
eHBvc2Ugc3RyaW5nX3N0cmVhbV9kZXN0cm95IHNvCj4gPiBrdW5pdF9kb19hc3NlcnQgY2FuIGNs
ZWFuIHVwIHdoZW4gaXQncyBkb25lLCBhbmQgdGhlbiBkZW1vdGUKPiA+IHN0cmluZ19zdHJlYW1f
Y2xlYXIgdG8gc3RhdGljLiBTb3VuZCBnb29kPwo+Cj4gT2ssIHN1cmUuIEkgZG9uJ3QgcmVhbGx5
IHNlZSBob3cgY2xlYXJpbmcgaXQgZXhwbGljaXRseSB3aGVuIHRoZQo+IGFzc2VydGlvbiBwcmlu
dHMgdnMuIG5ldmVyIGFsbG9jYXRpbmcgaXQgdG8gYmVnaW4gd2l0aCBpcyByZWFsbHkgYW55Cj4g
ZGlmZmVyZW50LiBNYXliZSBJJ3ZlIG1pc3NlZCBzb21ldGhpbmcgdGhvdWdoLgoKSXQncyBmb3Ig
dGhlIGNhc2UgdGhhdCB3ZSAqZG8qIHByaW50IHNvbWV0aGluZyBvdXQuIE9uY2Ugd2UgYXJlIGRv
aW5nCnByaW50aW5nLCB3ZSBkb24ndCB3YW50IHRoZSBmcmFnbWVudHMgYW55bW9yZS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
