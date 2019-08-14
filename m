Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AA8DB1A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2E36E794;
	Wed, 14 Aug 2019 17:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D826E794
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:23:02 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9246520665;
 Wed, 14 Aug 2019 17:23:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <CAFd5g45NdQEcP0JQpZc3HYYgNZfsBsHL+ByXRK+OupWObwMuqg@mail.gmail.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <CAFd5g45NdQEcP0JQpZc3HYYgNZfsBsHL+ByXRK+OupWObwMuqg@mail.gmail.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit,
 the Linux kernel unit testing framework
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, shuah <shuah@kernel.org>
User-Agent: alot/0.8.1
Date: Wed, 14 Aug 2019 10:23:00 -0700
Message-Id: <20190814172301.9246520665@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565803381;
 bh=FN7svZ/+iXMULArgYt1oBNGNoJcD+bkl47j+nxOdq5Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=U2k+Omw28LwRRoFmVtodT07PV6nxV/NjO0n84ZnQwJqJzPx0vkjnq79bp1wEvklFG
 VMEVAJLqqexfV8yMpJeyrQSBTfCgZag1WzGsv1E4V8fP+esmsvW+CqJy/MmWeHrA/1
 KqbEgb8F4a9wCCJHNpBFKV7UIh0krHKOR86fwJ8w=
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
Cc: , Petr Mladek <pmladek@suse.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Sasha Levin <Alexander.Levin@microsoft.com>, at@freedesktop.org,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Knut Omang <knut.omang@oracle.com>, wfg@linux.intel.com,
	Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
	Jeff Dike <jdike@addtoit.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kbuild <linux-kbuild@vger.kernel.org>,
	"Bird,  Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Bjorn Helgaas <bhelgaas@google.com>, kunit-dev@googlegroups.com,
	Richard Weinberger <richard@nod>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-fsdevel@vger.kernel.org,
	Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTQgMDM6MDM6NDcpCj4gT24gVHVlLCBB
dWcgMTMsIDIwMTkgYXQgMTA6NTIgUE0gQnJlbmRhbiBIaWdnaW5zCj4gPGJyZW5kYW5oaWdnaW5z
QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+ICMjIFRMO0RSCj4gPgo+ID4gVGhpcyByZXZpc2lv
biBhZGRyZXNzZXMgY29tbWVudHMgZnJvbSBTdGVwaGVuIGFuZCBCam9ybiBIZWxnYWFzLiBNb3N0
Cj4gPiBjaGFuZ2VzIGFyZSBwcmV0dHkgbWlub3Igc3R1ZmYgdGhhdCBkb2Vzbid0IGFmZmVjdCB0
aGUgQVBJIGluIGFueXdheS4KPiA+IE9uZSBzaWduaWZpY2FudCBjaGFuZ2UsIGhvd2V2ZXIsIGlz
IHRoYXQgSSBhZGRlZCBzdXBwb3J0IGZvciBmcmVlaW5nCj4gPiBrdW5pdF9yZXNvdXJjZSBtYW5h
Z2VkIHJlc291cmNlcyBiZWZvcmUgdGhlIHRlc3QgY2FzZSBpcyBmaW5pc2hlZCB2aWEKPiA+IGt1
bml0X3Jlc291cmNlX2Rlc3Ryb3koKS4gQWRkaXRpb25hbGx5LCBCam9ybiBwb2ludGVkIG91dCB0
aGF0IEkgYnJva2UKPiA+IEtVbml0IG9uIGNlcnRhaW4gY29uZmlndXJhdGlvbnMgKGxpa2UgdGhl
IGRlZmF1bHQgb25lIGZvciB4ODYsIHdob29wcykuCj4gPgo+ID4gQmFzZWQgb24gU3RlcGhlbidz
IGZlZWRiYWNrIG9uIHRoZSBwcmV2aW91cyBjaGFuZ2UsIEkgdGhpbmsgd2UgYXJlCj4gPiBwcmV0
dHkgY2xvc2UuIEkgYW0gbm90IGV4cGVjdGluZyBhbnkgc2lnbmlmaWNhbnQgY2hhbmdlcyBmcm9t
IGhlcmUgb24KPiA+IG91dC4KPiAKPiBTdGVwaGVuLCBpdCBsb29rcyBsaWtlIHlvdSBoYXZlIGp1
c3QgcmVwbGllZCB3aXRoICJSZXZpZXdlZC1ieXMiIG9uCj4gYWxsIHRoZSByZW1haW5pbmcgZW1h
aWxzIHRoYXQgeW91IGxvb2tlZCBhdC4gSXMgdGhlcmUgYW55dGhpbmcgZWxzZQo+IHRoYXQgd2Ug
YXJlIG1pc3Npbmc/IE9yIGlzIHRoaXMgcmVhZHkgZm9yIFNodWFoIHRvIGFwcGx5Pwo+IAoKSSB0
aGluayBpdCdzIGdvb2QgdG8gZ28hIFRoYW5rcyBmb3IgdGhlIHBlcnNpc3RlbmNlLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
