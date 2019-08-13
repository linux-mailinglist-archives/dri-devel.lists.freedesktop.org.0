Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC598B37A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988346E0BD;
	Tue, 13 Aug 2019 09:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E035A6E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:13:08 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 62so71369410lfa.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9ILhd2aCjQh4oMSFsJoowCjN4C8D/s8MJgq4YAEBLc=;
 b=pVoSTO/o+xD+ypHeMwDjINkK7uWScDqPkCTa6HYU3LrX4Jvb3fAFOsaGC2U7s6Jc/n
 iq2OptyuII4/5Oj7UuXEc9X4GD5DVY49aPO+Q4enBRMw64+eGVdJB5kJvghQL3Ykt10A
 /+HovF0FagAcOV9JfXOpckVbT4qeEbXzn6aNBQyeuhbY/IFpKY2Jn3Gx9s9/PFU35oIr
 5xYpsYywdHbWkP4jehxlmPDXXcKPGMkO7vCfNpxcdWyaSlV2RVUrQie79SAIDjXBF7LB
 5/VUHNv2YCFKllI1OzohlUPJ3NzvaShf2mzvEpX7ESLM9/ThEBA/+GnFUHVyGsQqqHIr
 W+uQ==
X-Gm-Message-State: APjAAAXEGU+BDB0dspa5VwvQ6OuexoEM01mQvj8H97qzNdxgbmBL4bzd
 /9iBrF+68KcQfg1+hka4/9B4KI1TAG6EiP9WPahXOg==
X-Google-Smtp-Source: APXvYqwLnkbduPeN9fnl3i+lRRTsMYZatTj1IuJmhpqxnMiio1q0JfaKumMLZmtQt11+bQEG/iQwBN5AGKfhGyCW+Rs=
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr21614482lfq.92.1565687586809; 
 Tue, 13 Aug 2019 02:13:06 -0700 (PDT)
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
 <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg@mail.gmail.com>
In-Reply-To: <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Aug 2019 02:12:54 -0700
Message-ID: <CAFd5g452+-6m1eiVK0ccTDkJ2wH8GBwxRDw5owwC8h3NscE1ag@mail.gmail.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=b9ILhd2aCjQh4oMSFsJoowCjN4C8D/s8MJgq4YAEBLc=;
 b=W2oxF32qcEgwvRN+TzYXAddY5GIfE0TU07ZZEMjsnTdZHws8iAZ2t8Ultvl9YT7B9l
 FcqQcsJALGn/N6C5ZuExhftHA8ZS8MNOrSUeIrQu3gBXXLe4ixyR8Oo5hmg4UUGyabxo
 uWv09COtEGpqAdax3WCg5P2ubO3WE1ftRGYMB38Ed3fgj3xpruF/YDRjA5s4U1SsywTz
 raOTZO3u1j8iOcpslIka2xJ8bkvq+QSToLsxoCLDTz8ppRJhCuL8ltvK/wB/IXN51+OA
 Tmzcrff2zT5F1o2XfVqbtXnT9QaUbGOA7cZQ4WzLX6NEXNn++uTMldyauztGbKy/kIWW
 PdfQ==
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

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMjowNCBBTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6
MzAgUE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBRdW90
aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wOC0xMiAyMjowMjo1OSkKPiA+ID4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgOTo1NiBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIg
MTc6NDE6MDUpCj4gPiA+ID4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCA0OjU5IFBNIFN0ZXBo
ZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4ga3VuaXRfcmVzb3VyY2VfZGVzdHJveSAocmVzcGVjdGl2ZSBlcXVpdmFsZW50cyB0byBkZXZt
X2tmcmVlLCBhbmQKPiA+ID4gPiA+ID4gPiBkZXZyZXNfZGVzdHJveSkgYW5kIHVzZSBrdW5pdF9r
ZnJlZSBoZXJlPwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywgb3Ig
ZHJvcCB0aGUgQVBJIGVudGlyZWx5PyBEb2VzIGFueXRoaW5nIG5lZWQgdGhpcyBmdW5jdGlvbmFs
aXR5Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IERyb3AgdGhlIGt1bml0X3Jlc291cmNlIEFQST8gSSB3
b3VsZCBzdHJvbmdseSBwcmVmZXIgbm90IHRvLgo+ID4gPiA+Cj4gPiA+ID4gTm8uIEkgbWVhbiB0
aGlzIEFQSSwgc3RyaW5nX3N0cmVhbV9jbGVhcigpLiBEb2VzIGFueXRoaW5nIHVzZSBpdD8KPiA+
ID4KPiA+ID4gT2gsIHJpZ2h0LiBOby4KPiA+ID4KPiA+ID4gSG93ZXZlciwgbm93IHRoYXQgSSBh
ZGRlZCB0aGUga3VuaXRfcmVzb3VyY2VfZGVzdHJveSwgSSB0aG91Z2h0IGl0Cj4gPiA+IG1pZ2h0
IGJlIGdvb2QgdG8gZnJlZSB0aGUgc3RyaW5nX3N0cmVhbSBhZnRlciBJIHVzZSBpdCBpbiBlYWNo
IGNhbGwgdG8KPiA+ID4ga3VuaXRfYXNzZXJ0LT5mb3JtYXQoLi4uKSBpbiB3aGljaCBjYXNlIEkg
d2lsbCBiZSB1c2luZyB0aGlzIGxvZ2ljLgo+ID4gPgo+ID4gPiBTbyBJIHRoaW5rIHRoZSByaWdo
dCB0aGluZyB0byBkbyBpcyB0byBleHBvc2Ugc3RyaW5nX3N0cmVhbV9kZXN0cm95IHNvCj4gPiA+
IGt1bml0X2RvX2Fzc2VydCBjYW4gY2xlYW4gdXAgd2hlbiBpdCdzIGRvbmUsIGFuZCB0aGVuIGRl
bW90ZQo+ID4gPiBzdHJpbmdfc3RyZWFtX2NsZWFyIHRvIHN0YXRpYy4gU291bmQgZ29vZD8KPiA+
Cj4gPiBPaywgc3VyZS4gSSBkb24ndCByZWFsbHkgc2VlIGhvdyBjbGVhcmluZyBpdCBleHBsaWNp
dGx5IHdoZW4gdGhlCj4gPiBhc3NlcnRpb24gcHJpbnRzIHZzLiBuZXZlciBhbGxvY2F0aW5nIGl0
IHRvIGJlZ2luIHdpdGggaXMgcmVhbGx5IGFueQo+ID4gZGlmZmVyZW50LiBNYXliZSBJJ3ZlIG1p
c3NlZCBzb21ldGhpbmcgdGhvdWdoLgo+Cj4gSXQncyBmb3IgdGhlIGNhc2UgdGhhdCB3ZSAqZG8q
IHByaW50IHNvbWV0aGluZyBvdXQuIE9uY2Ugd2UgYXJlIGRvaW5nCj4gcHJpbnRpbmcsIHdlIGRv
bid0IHdhbnQgdGhlIGZyYWdtZW50cyBhbnltb3JlLgoKT29wcywgc29ycnkgZmF0IGZpbmdlcmVk
OiBzL2RvaW5nL2RvbmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
