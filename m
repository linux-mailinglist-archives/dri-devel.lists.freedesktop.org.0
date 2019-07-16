Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2936AF5A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 20:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7050C6E17D;
	Tue, 16 Jul 2019 18:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9346E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 18:56:06 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y15so9553631pfn.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 11:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZybekRt/woJPUqImfzbAl3ncwjUgoXdjZVOXaEHk8I8=;
 b=mBHINfDbwe+zpOLZbXwQ7tM7wUphoigukhbMWEDuG0oTnZIazbLaJItJatRWtu6F0U
 UFHlzqxmNLwX3hAyS3e3JObSSzWel9WeqQz7VQMsvZPk60oUaKbFsDSKMFq1iRX63r9L
 9vztuJdx7oEUj8oOBTnlFl3dNgPDevIbRf2mSP3dxCclSs2A6mOUa0IFRp+6qFnQKX0f
 F0ObeMVnw6gSPOaJmP2mqVdoPOX7BXiPO9aCqigUv1CFLnGhf3UQDnzxuzyToszatWu0
 rCfaBZtJfBiIwu2Q0v+ojiuUIoRmvpMcBYqqliDcMclP55Agf/YIhKumI7tsCn6hS+uT
 eARQ==
X-Gm-Message-State: APjAAAXD9pRbVW7Uj4Ju8Dlx7zJU+69aZVK2hQX5aM2w9YKiaVQbFH/Q
 YTXIbX6gqF6Q+vpl78prguTR/j7REMHgUKNiEZeOkw==
X-Google-Smtp-Source: APXvYqwkl9ifterOK2ove6KXh9jZEcTxm4XlxkMBt5KD+9P3zl/wFtgkQs2T9gGivENnFOevPZS3P3oa9+3ivqemHYQ=
X-Received: by 2002:a63:205f:: with SMTP id r31mr35946123pgm.159.1563303365863; 
 Tue, 16 Jul 2019 11:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-4-brendanhiggins@google.com>
 <20190715204356.4E3F92145D@mail.kernel.org>
 <CAFd5g47481sRaez=yEJN4_ghiXZbxayk1Y04tAZpuzPLsmnhKg@mail.gmail.com>
 <20190715220407.0030420665@mail.kernel.org>
 <CAFd5g44bE0F=wq_fOAnxFTtoOyx1dUshhDAkKWr5hX9ipJ4Sxw@mail.gmail.com>
 <CAFd5g47y4vDB2P=EsGN8305LGeQPCTveNs-Jd5-=6K-XKY==CA@mail.gmail.com>
 <20190716153400.5CB182054F@mail.kernel.org>
In-Reply-To: <20190716153400.5CB182054F@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 16 Jul 2019 11:55:54 -0700
Message-ID: <CAFd5g47Nawp7V8=hetgBQWzWqmEyAz1GtWWwMrb9k=CCR33inQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZybekRt/woJPUqImfzbAl3ncwjUgoXdjZVOXaEHk8I8=;
 b=j9eLSBzu7vGeOp+9v4PjjMY8Y60gIHirQjt/95JgwPIeMch+f2SZ4m2BcsmqzLNPnA
 y6mKbUvfRgB58Dd24aP06L/LHkjitHNk2jtHnbwOvIcJMeUwKyAY7Zj3rZzVz85nZG+R
 H6nYqq0HtuMcKgj4ph8KvSOJ57XFS8xQJyN4O9EfZBueGH2zgw2CSiJKxHwffHaRiCZU
 F2ZM5rxXlitmIEXm2ndwKKQaLdsI3EeFpaR3+KwtG2rjkMO/QifOGpG1dhcUu5Cz8T3g
 tXwTsXzmF1fc22PaEHeit7cbJ2ZXrz0nkagsUOfmTF+46/GQqdl6HnMMZCq90oDQiUGy
 RAXQ==
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgODozNCBBTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTUgMTU6
NDM6MjApCj4gPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCAzOjExIFBNIEJyZW5kYW4gSGlnZ2lu
cwo+ID4gPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBN
b24sIEp1bCAxNSwgMjAxOSBhdCAzOjA0IFBNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0w
Ny0xNSAxNDoxMTo1MCkKPiA+ID4gPiA+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDE6NDMgUE0g
U3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gSSBhbHNvIHdvbmRlciBpZiBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8ganVzdCBoYXZlIGEg
YmlnIHNsb3AgYnVmZmVyIG9mIGEKPiA+ID4gPiA+ID4gNEsgcGFnZSBvciBzb21ldGhpbmcgc28g
dGhhdCB3ZSBhbG1vc3QgbmV2ZXIgaGF2ZSB0byBhbGxvY2F0ZSBhbnl0aGluZwo+ID4gPiA+ID4g
PiB3aXRoIGEgc3RyaW5nX3N0cmVhbSBhbmQgd2UgY2FuIGp1c3QgcmVseSBvbiBhIHJlYWRlciBj
b25zdW1pbmcgZGF0YQo+ID4gPiA+ID4gPiB3aGlsZSB3cml0ZXJzIGFyZSB3cml0aW5nLiBUaGF0
IG1pZ2h0IHdvcmsgb3V0IGJldHRlciwgYnV0IEkgZG9uJ3QgcXVpdGUKPiA+ID4gPiA+ID4gdW5k
ZXJzdGFuZCB0aGUgdXNlIGNhc2UgZm9yIHRoZSBzdHJpbmcgc3RyZWFtLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoYXQgbWFrZXMgc2Vuc2UsIGJ1dCBtaWdodCB0aGF0IGFsc28gd2FzdGUgbWVtb3J5
IHNpbmNlIHdlIHdpbGwKPiA+ID4gPiA+IGFsbW9zdCBuZXZlciBuZWVkIHRoYXQgbXVjaCBtZW1v
cnk/Cj4gPiA+ID4KPiA+ID4gPiBXaHkgZG8gd2UgY2FyZT8gVGhlc2UgYXJlIHVuaXQgdGVzdHMu
Cj4gPiA+Cj4gPiA+IEFncmVlZC4KPiA+ID4KPiA+ID4gPiBIYXZpbmcgYWxsb2NhdGlvbnMgaW4g
aGVyZSBtYWtlcwo+ID4gPiA+IHRoaW5ncyBtb3JlIGNvbXBsaWNhdGVkLCB3aGVyZWFzIGl0IHdv
dWxkIGJlIHNpbXBsZXIgdG8gaGF2ZSBhIHBvaW50ZXIKPiA+ID4gPiBhbmQgYSBzcGlubG9jayBv
cGVyYXRpbmcgb24gYSBjaHVuayBvZiBtZW1vcnkgdGhhdCBnZXRzIGZsdXNoZWQgb3V0Cj4gPiA+
ID4gcGVyaW9kaWNhbGx5Lgo+ID4gPgo+ID4gPiBJIGFtIG5vdCBzbyBzdXJlLiBJIGhhdmUgdG8g
aGF2ZSB0aGUgbG9naWMgdG8gYWxsb2NhdGUgbWVtb3J5IGluIHNvbWUKPiA+ID4gY2FzZSBubyBt
YXR0ZXIgd2hhdCAod2hhdCBpZiBJIG5lZWQgbW9yZSBtZW1vcnkgdGhhdCBteSBwcmVhbGxvY2F0
ZWQKPiA+ID4gY2h1Y2s/KS4gSSB0aGluayBpdCBpcyBzaW1wbGVyIHRvIGFsd2F5cyByZXF1ZXN0
IGFuIGFsbG9jYXRpb24gdGhhbiB0bwo+ID4gPiBvbmx5IHNvbWV0aW1lcyByZXF1ZXN0IGFuIGFs
bG9jYXRpb24uCj4gPgo+ID4gQW5vdGhlciBldmVuIHNpbXBsZXIgYWx0ZXJuYXRpdmUgbWlnaHQg
YmUgdG8ganVzdCBhbGxvY2F0ZSBtZW1vcnkKPiA+IHVzaW5nIGt1bml0X2ttYWxsb2MgYXMgd2Ug
bmVlZCBpdCBhbmQganVzdCBsZXQgdGhlIGt1bml0X3Jlc291cmNlIGNvZGUKPiA+IGhhbmRsZSBj
bGVhbmluZyBpdCBhbGwgdXAgd2hlbiB0aGUgdGVzdCBjYXNlIGZpbmlzaGVzLgo+Cj4gU3VyZSwg
c291bmRzIGxpa2UgYSBuaWNlIHdheSB0byBhdm9pZCBkdXBsaWNhdGluZyBzaW1pbGFyIGxvZ2lj
IHRvCj4gbWFpbnRhaW4gYSBsaXN0IG9mIHRoaW5ncyB0byBmcmVlIGxhdGVyLgoKSSB0aGluayBJ
IHdpbGwgZ28gdGhhdCByb3V0ZSBmb3Igbm93LgoKPiA+Cj4gPiBXaGF0IGRvIHlvdSB0aGluaz8K
Pgo+IElmIHlvdSBnbyB0aGUgYWxsb2NhdGlvbiByb3V0ZSB0aGVuIHlvdSdsbCBuZWVkIHRvIGhh
dmUgdGhlIGZsYWdzIHRvCj4ga25vdyB3aGF0IGNvbnRleHQgeW91J3JlIGluIHRvIGFsbG9jYXRl
IGFwcHJvcHJpYXRlbHkuIERvZXMgdGhhdCBtZWFuCj4gYWxsIHRoZSBzdHJpbmcgb3BlcmF0aW9u
cyB3aWxsIG5vdyB0YWtlIEdGUCBmbGFncz8KCldlIGNvdWxkIHNldCB0aGUgR0ZQIGZsYWdzIGlu
IHRoZSBjb25zdHJ1Y3Rvciwgc3RvcmUgdGhlbSBpbiBhIGZpZWxkLAphbmQgdGhlbiBqdXN0IHJl
dXNlIHRoZW0uCgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
