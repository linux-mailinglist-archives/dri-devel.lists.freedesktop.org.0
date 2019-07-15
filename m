Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA869D23
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 22:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF38589B67;
	Mon, 15 Jul 2019 20:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AA689B67
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 20:51:01 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB55B2145D;
 Mon, 15 Jul 2019 20:51:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g45iHnMLOGQbXwzX6F74pkQGKBCSufkpYPOcw_iNSeiQKg@mail.gmail.com>
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-3-brendanhiggins@google.com>
 <20190715202425.CE64C20665@mail.kernel.org>
 <CAFd5g45iHnMLOGQbXwzX6F74pkQGKBCSufkpYPOcw_iNSeiQKg@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v9 02/18] kunit: test: add test resource management API
User-Agent: alot/0.8.1
Date: Mon, 15 Jul 2019 13:51:00 -0700
Message-Id: <20190715205101.AB55B2145D@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563223861;
 bh=6m3JRkZe4W2eR9x3TEB42iTGm06AKnl0iKV7troXRVI=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=EwqhqpJU1AH9O3azv7tLQPtK6CGIx5+N25Vfxpts0j2Zu9LzI8K3EVF6FF7FMlJqe
 HqZdyATMk1hx4CfnLLeNhVn8jZBCw/KN0Ip/RXuDu+/ZJV8+T7LRYZFf0rRh6wit2r
 FZCr9nMrPp9Qn2lqNejmYhOwnPlNfDt+4lLfsG/0=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTUgMTM6MzA6MjIpCj4gT24gTW9uLCBK
dWwgMTUsIDIwMTkgYXQgMToyNCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA3LTEyIDAxOjE3OjI4
KQo+ID4gPiBkaWZmIC0tZ2l0IGEva3VuaXQvdGVzdC5jIGIva3VuaXQvdGVzdC5jCj4gPiA+IGlu
ZGV4IDU3MWU0YzY1ZGViNWMuLmYxNjVjOWQ4ZTEwYjAgMTAwNjQ0Cj4gCj4gPiBPbmUgc29sdXRp
b24gd291bGQgYmUgdG8gcGlnZ3liYWNrIG9uIGFsbCB0aGUgZXhpc3RpbmcgZGV2cmVzIGFsbG9j
YXRpb24KPiA+IGxvZ2ljIHdlIGFscmVhZHkgaGF2ZSBhbmQgbWFrZSBlYWNoIHN0cnVjdCBrdW5p
dCBhIGRldmljZSB0aGF0IHdlIHBhc3MKPiA+IGludG8gdGhlIGRldnJlcyBmdW5jdGlvbnMuIEEg
ZmFyIHNpbXBsZXIgc29sdXRpb24gd291bGQgYmUgdG8ganVzdAo+ID4gY29weS9wYXN0ZSB3aGF0
IGRldnJlcyBkb2VzIGFuZCB1c2UgYSBzcGlubG9jayBhbmQgYW4gYWxsb2NhdGlvbgo+ID4gZnVu
Y3Rpb24gdGhhdCB0YWtlcyBHRlAgZmxhZ3MuCj4gCj4gWWVhaCwgdGhhdCdzIHdoYXQgSSBkaWQg
b3JpZ2luYWxseSwgYnV0IEkgdGhvdWdodCBmcm9tIHRoZSBkaXNjdXNzaW9uCj4gb24gcGF0Y2gg
MDEgdGhhdCB5b3UgdGhvdWdodCBhIHNwaW5sb2NrIHdhcyBvdmVya2lsbCBmb3Igc3RydWN0IGt1
bml0Lgo+IEkgdGFrZSBpdCB5b3Ugb25seSBtZWFudCBpbiB0aGF0IGluaXRpYWwgcGF0Y2g/CgpD
b3JyZWN0LiBJIHdhcyBvbmx5IHRhbGtpbmcgYWJvdXQgdGhlIHN1Y2Nlc3MgYml0IGluIHRoZXJl
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
