Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2178BEE6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 18:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A726E111;
	Tue, 13 Aug 2019 16:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A846E111
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 16:48:18 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06A2D20842;
 Tue, 13 Aug 2019 16:48:18 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g452+-6m1eiVK0ccTDkJ2wH8GBwxRDw5owwC8h3NscE1ag@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com>
 <20190812235940.100842063F@mail.kernel.org>
 <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
 <20190813045623.F3D9520842@mail.kernel.org>
 <CAFd5g46PJNTOUAA4GOOrW==74Zy7u1sRESTanL_BXBn6QykscA@mail.gmail.com>
 <20190813053023.CC86120651@mail.kernel.org>
 <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg@mail.gmail.com>
 <CAFd5g452+-6m1eiVK0ccTDkJ2wH8GBwxRDw5owwC8h3NscE1ag@mail.gmail.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Tue, 13 Aug 2019 09:48:17 -0700
Message-Id: <20190813164818.06A2D20842@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565714898;
 bh=+ClQXQZYMO3oD0vJh2iCm8rSEOKMIpNSMDMOjbE3t+k=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pjR7+sDpG5QV8mqVLOqQHM+8vC+tRobkv0ngA4hd4MBaO/KrG4XqTeZ1bpn5bn1bq
 KhfBsT1su6Wd2h61ArrsWNQlNeGWtPTPht9QXac/YRw1heGospZwGZg3FIXZ4HQ+Nu
 vKsI/4s3VfFW3biZ3Mbn7FIY6xfwnAsdy1fw46EY=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTMgMDI6MTI6NTQpCj4gT24gVHVlLCBB
dWcgMTMsIDIwMTkgYXQgMjowNCBBTSBCcmVuZGFuIEhpZ2dpbnMKPiA8YnJlbmRhbmhpZ2dpbnNA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6MzAg
UE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gUXVv
dGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMjI6MDI6NTkpCj4gPiA+ID4gSG93ZXZl
ciwgbm93IHRoYXQgSSBhZGRlZCB0aGUga3VuaXRfcmVzb3VyY2VfZGVzdHJveSwgSSB0aG91Z2h0
IGl0Cj4gPiA+ID4gbWlnaHQgYmUgZ29vZCB0byBmcmVlIHRoZSBzdHJpbmdfc3RyZWFtIGFmdGVy
IEkgdXNlIGl0IGluIGVhY2ggY2FsbCB0bwo+ID4gPiA+IGt1bml0X2Fzc2VydC0+Zm9ybWF0KC4u
LikgaW4gd2hpY2ggY2FzZSBJIHdpbGwgYmUgdXNpbmcgdGhpcyBsb2dpYy4KPiA+ID4gPgo+ID4g
PiA+IFNvIEkgdGhpbmsgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGlzIHRvIGV4cG9zZSBzdHJpbmdf
c3RyZWFtX2Rlc3Ryb3kgc28KPiA+ID4gPiBrdW5pdF9kb19hc3NlcnQgY2FuIGNsZWFuIHVwIHdo
ZW4gaXQncyBkb25lLCBhbmQgdGhlbiBkZW1vdGUKPiA+ID4gPiBzdHJpbmdfc3RyZWFtX2NsZWFy
IHRvIHN0YXRpYy4gU291bmQgZ29vZD8KPiA+ID4KPiA+ID4gT2ssIHN1cmUuIEkgZG9uJ3QgcmVh
bGx5IHNlZSBob3cgY2xlYXJpbmcgaXQgZXhwbGljaXRseSB3aGVuIHRoZQo+ID4gPiBhc3NlcnRp
b24gcHJpbnRzIHZzLiBuZXZlciBhbGxvY2F0aW5nIGl0IHRvIGJlZ2luIHdpdGggaXMgcmVhbGx5
IGFueQo+ID4gPiBkaWZmZXJlbnQuIE1heWJlIEkndmUgbWlzc2VkIHNvbWV0aGluZyB0aG91Z2gu
Cj4gPgo+ID4gSXQncyBmb3IgdGhlIGNhc2UgdGhhdCB3ZSAqZG8qIHByaW50IHNvbWV0aGluZyBv
dXQuIE9uY2Ugd2UgYXJlIGRvaW5nCj4gPiBwcmludGluZywgd2UgZG9uJ3Qgd2FudCB0aGUgZnJh
Z21lbnRzIGFueW1vcmUuCj4gCj4gT29wcywgc29ycnkgZmF0IGZpbmdlcmVkOiBzL2RvaW5nL2Rv
bmUKClllcywgYnV0IHdoZW4gd2UgcHJpbnQgc29tZXRoaW5nIG91dCB3ZSd2ZSBydW4gaW50byBz
b21lIHNvcnQgb2YgcHJvYmxlbQphbmQgdGhlbiB0aGUgdGVzdCBpcyBvdmVyLiBTbyBmcmVlaW5n
IHRoZSBtZW1vcnkgd2hlbiBpdCBmYWlscyB2cy4gd2hlbgp0aGUgdGVzdCBpcyBvdmVyIHNlZW1z
IGxpa2UgYSBtaW5vciBkaWZmZXJlbmNlLiBPciBpcyBpdCBhbHNvIHVzZWQgdG8KcHJpbnQgb3Ro
ZXIgaW5mb3JtYXRpb25hbCBtZXNzYWdlcyB3aGlsZSB0aGUgdGVzdCBpcyBydW5uaW5nPwoKSSdt
IG5vdCBwYXJ0aWN1bGFybHkgd29ycmllZCBoZXJlLCBqdXN0IHRyeWluZyB0byBzZWUgaWYgbGVz
cyBjb2RlIGlzCnBvc3NpYmxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
