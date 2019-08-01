Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F37E4AA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 23:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B656E815;
	Thu,  1 Aug 2019 21:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FC06E815
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 21:14:48 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D3D7206A2;
 Thu,  1 Aug 2019 21:14:47 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g473iFfvBnJs2pcwuJYgY+DpgD6RLzyDFL1otUuScgKUag@mail.gmail.com>
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
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Thu, 01 Aug 2019 14:14:46 -0700
Message-Id: <20190801211447.6D3D7206A2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564694087;
 bh=n0IdgFG7Kos2nGnJ4DnkR9p1y4CCyIbJ6ZBAUiBNpN4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mCeQAbdwzIbwLPOijpChQVFo4UiYoSWfSZsIgfoIrNYNDT1t+cF6inHSpvwbpaWEE
 h3a75ihCGxnVfKz0yO5MH+8Z55L0rleQ67pJQ89uiV1jYfk7eCIm+wLogdHeiGG1J2
 0oPUv74xqN1E4K+r3Bcp5gj1D6bBbIkaOl5oR1Jc=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMDEgMTE6NTk6NTcpCj4gT24gVGh1LCBB
dWcgMSwgMjAxOSBhdCAxMTo1NSBBTSBCcmVuZGFuIEhpZ2dpbnMKPiA8YnJlbmRhbmhpZ2dpbnNA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTozMSBB
TSBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBUbyBiZSBo
b25lc3QgSSBkbyBub3QgZnVsbHkgdW5kZXJzdGFuZCBLVW5pdCBkZXNpZ24uIEkgYW0gbm90Cj4g
PiA+IGNvbXBsZXRlbHkgc3VyZSBob3cgdGhlIHRlc3RlZCBjb2RlIGlzIGlzb2xhdGVkIGZyb20g
dGhlIHJ1bm5pbmcKPiA+ID4gc3lzdGVtLiBOYW1lbHksIEkgZG8gbm90IGtub3cgaWYgdGhlIHRl
c3RlZCBjb2RlIHNoYXJlcwo+ID4gPiB0aGUgc2FtZSBsb2NrcyB3aXRoIHRoZSBzeXN0ZW0gcnVu
bmluZyB0aGUgdGVzdC4KPiA+Cj4gPiBObyB3b3JyaWVzLCBJIGRvbid0IGV4cGVjdCBwcmludGsg
dG8gYmUgdGhlIGhhbmcgdXAgaW4gdGhvc2UgY2FzZXMuIEl0Cj4gPiBzb3VuZHMgbGlrZSBLVW5p
dCBoYXMgYSBsb25nIHdheSB0byBldm9sdmUgYmVmb3JlIHByaW50ayBpcyBnb2luZyB0bwo+ID4g
YmUgYSBsaW1pdGF0aW9uLgo+IAo+IFNvIFN0ZXBoZW4sIHdoYXQgZG8geW91IHRoaW5rPwo+IAo+
IERvIHlvdSB3YW50IG1lIHRvIGdvIGZvcndhcmQgd2l0aCB0aGUgbmV3IGt1bml0X2Fzc2VydCBB
UEkgd3JhcHBpbmcKPiB0aGUgc3RyaW5nX3N0cmVhbSBhcyBJIGhhdmUgaXQgbm93PyBXb3VsZCB5
b3UgcHJlZmVyIHRvIHB1bnQgdGhpcyB0byBhCj4gbGF0ZXIgcGF0Y2g/IE9yIHdvdWxkIHlvdSBw
cmVmZXIgc29tZXRoaW5nIGVsc2U/Cj4gCgpJIGxpa2UgdGhlIHN0cnVjdCBiYXNlZCBhcHByb2Fj
aC4gSWYgYW55dGhpbmcsIGl0IGNhbiBiZSBhZGp1c3RlZCB0bwptYWtlIHRoZSBjb2RlIHRocm93
IHNvbWUgcmVjb3JkcyBpbnRvIGEgc3BpbmxvY2sgbGF0ZXIgb24gYW5kIGRlbGF5IHRoZQpmb3Jt
YXR0aW5nIG9mIHRoZSBhc3NlcnRpb24gaWYgbmVlZCBiZS4gQ2FuIHlvdSByZXNlbmQgd2l0aCB0
aGF0CmFwcHJvYWNoPyBJIGRvbid0IHRoaW5rIEknbGwgaGF2ZSBhbnkgbW9yZSBjb21tZW50cyBh
ZnRlciB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
