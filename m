Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033A1394F
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 12:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FF5892AA;
	Sat,  4 May 2019 10:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EA5892AA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 10:42:54 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83EC9206DF;
 Sat,  4 May 2019 10:42:53 +0000 (UTC)
Date: Sat, 4 May 2019 12:42:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
Message-ID: <20190504104251.GB1478@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
 <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
 <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
 <1a5f3c44-9fa9-d423-66bf-45255a90c468@gmail.com>
 <CAFd5g45RYm+zfdJXnyp2KZZH5ojfOzy++aq+4zBeE5VDu6WgEw@mail.gmail.com>
 <052fa196-4ea9-8384-79b7-fe6bacc0ee82@gmail.com>
 <CAFd5g47aY-CL+d7DfiyTidY4aAVY+eg1TM1UJ4nYqKSfHOi-0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g47aY-CL+d7DfiyTidY4aAVY+eg1TM1UJ4nYqKSfHOi-0w@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556966574;
 bh=2wZMR8kL7s1krXCBVQ2gHWVCoJe2nAbegB0hEA5FL6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g2qAYqK93MmeEO5EtmmbYxkKej3oQNG4Xe6XPJD6vrQPt38T1svHdBKrBvdMiYWgD
 AZ7qWDqABTJ6olUjiTR2iLAVWnkx5H2eC/KCt6WPfdYa51NsGiNAAeStPcWNLEDQJV
 lDwxJTqazCCtkTaH5ybwPNJUh0FxQBUrP7ZHlU+A=
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDQ6MTQ6NDlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEluIGFueSBjYXNlLCBpdCBzb3VuZHMgbGlrZSB5b3UgYW5kIEdyZWcgYXJlIGlu
IGFncmVlbWVudCBvbiB0aGUgY29yZQo+IGxpYnJhcmllcyBnZW5lcmF0aW5nIHRoZSBvdXRwdXQg
aW4gVEFQMTMsIHNvIEkgd29uJ3QgYXJndWUgdGhhdCBwb2ludAo+IGZ1cnRoZXIuCgpHcmVhdCEK
Cj4gIyMgQW5hbHlzaXMgb2YgdXNpbmcgVEFQMTMKPiAKPiBPbmUgb2YgbXkgZWFybGllciBjb25j
ZXJucyB3YXMgdGhhdCBUQVAxMyBpcyBhIGJpdCBvdmVyIGNvbnN0cmFpbmVkCj4gZm9yIHdoYXQg
SSB3b3VsZCBsaWtlIHRvIG91dHB1dCBmcm9tIHRoZSBLVW5pdCBjb3JlLiBJdCBvbmx5IGFsbG93
cwo+IGRhdGEgdG8gYmUgb3V0cHV0IGFzIGVpdGhlcjoKPiAgLSB0ZXN0IG51bWJlcgo+ICAtIG9r
L25vdCBvayB3aXRoIHNpbmdsZSBsaW5lIGRlc2NyaXB0aW9uCj4gIC0gZGlyZWN0aXZlCj4gIC0g
ZGlhZ25vc3RpY3MKPiAgLSBZQU1MIGJsb2NrCj4gCj4gVGhlIHRlc3QgbnVtYmVyIG11c3QgYmVj
b21lIGJlZm9yZSBhIHNldCBvZiBvay9ub3Qgb2sgbGluZXMsIGFuZCBkb2VzCj4gbm90IGNvbnRh
aW4gYW55IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uIE9uZSBhbm5veWluZyB0aGluZyBhYm91dCB0
aGlzCj4gaXMgaXQgZG9lc24ndCBwcm92aWRlIGFueSBraW5kIG9mIG5lc3Rpbmcgb3IgZ3JvdXBp
bmcuCgpJdCBzaG91bGQgaGFuZGxlIG5lc3RpbmcganVzdCBmaW5lLCBJIHRoaW5rIHdlIGRvIHRo
YXQgYWxyZWFkeSB0b2RheS4KCj4gVGhlcmUgaXMgb25lIG9rL25vdCBvayBsaW5lIHBlciB0ZXN0
IGFuZCBpdCBtYXkgaGF2ZSBhIHNob3J0Cj4gZGVzY3JpcHRpb24gb2YgdGhlIHRlc3QgaW1tZWRp
YXRlbHkgYWZ0ZXIgJ29rJyBvciAnbm90IG9rJzsgdGhpcyBpcwo+IHByb2JsZW1hdGljIGJlY2F1
c2UgaXQgd2FudHMgdGhlIGZpcnN0IHRoaW5nIHlvdSBzYXkgYWJvdXQgYSB0ZXN0IHRvCj4gYmUg
YWZ0ZXIgeW91IGtub3cgd2hldGhlciBpdCBwYXNzZXMgb3Igbm90LgoKVGFrZSBhIGxvb2sgYXQg
dGhlIG91dHB1dCBvZiBvdXIgY3VycmVudCB0ZXN0cywgSSB0aGluayB5b3UgbWlnaHQgZmluZApp
dCB0byBiZSBhIGJpdCBtb3JlIGZsZXhpYmxlIHRoYW4geW91IHRoaW5rLgoKQWxzbywgdGhpcyBp
c24ndCBvdXIgc3RhbmRhcmQsIHdlIHBpY2tlZCBpdCBiZWNhdXNlIHdlIG5lZWRlZCBhIHN0YW5k
YXJkCnRoYXQgdGhlIHRvb2xzIG9mIHRvZGF5IGFscmVhZHkgdW5kZXJzdGFuZC4gIEl0IG1pZ2h0
IGhhdmUgaXNzdWVzIGFuZApvdGhlciBwcm9ibGVtcywgYnV0IHdlIGFyZSBub3QgaW4gdGhlIGJ1
c2luZXNzIG9mIHdyaXRpbmcgdGVzdCBvdXRwdXQKcGFyc2luZyB0b29scywgYW5kIHdlIGRvbid0
IHdhbnQgdG8gZm9yY2UgZXZlcnlvbmUgb3V0IHRoZXJlIHRvIHdyaXRlCmN1c3RvbSBwYXJzZXJz
LiAgV2Ugd2FudCB0aGVtIHRvIGJlIGFibGUgdG8gdXNlIHRoZSB0b29scyB0aGV5IGFscmVhZHkK
aGF2ZSBzbyB0aGV5IGNhbiB0ZXN0IHRoZSBrZXJuZWwsIGFuZCB0byBkbyBzbyBhcyBlYXNpbHkg
YXMgcG9zc2libGUuCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
