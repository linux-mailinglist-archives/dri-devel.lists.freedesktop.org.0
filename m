Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9038AE77
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 07:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B4A89E1A;
	Tue, 13 Aug 2019 05:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A8D89E1A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 05:04:42 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i30so2170267pfk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yw2VPeqxmsRoQHPYiMspo9WSTIZItOOYPkJzlzz97sQ=;
 b=R4DTHIbcZUn/V3zHiO5P8DisOgPvqd3D64944iY66O1aZlUTqG1SOU5GGd+HNio+90
 msBzSNoBQn6dSEbe1OQmyK0kknLOifeHj7oCFKeZsc6N2DAvw26E16IO1CFKJHm8uYTo
 y5X5X7mWi/VcvEXVAQyoc5fsLW6aDBea3lsZ1qxM0W9ZdRNNvBZdjXqc7l5DOtgbnsVo
 pk7AJU9ZU+IlSzzrL0umvn0ojeH5nDpct0tKXAW6MY8EZ3Fs0jh472ykN1lzzWq6Wy6u
 YU26NSs/ewp1bR3FRghJyj53CPkpCHE2Q+7kPpKWI+2FUNoIExkQlR3a2IbmXHxcR7my
 XZwQ==
X-Gm-Message-State: APjAAAXuVKH7hOcGMSI4plYwej9F+2l+GAvHYxA3u5Wef8ZZOWYLIx9A
 ZS1X+xI+BXpzL5frYZcQs6u1jKOlQ2HkwjE6b4X6Vw==
X-Google-Smtp-Source: APXvYqzY7+RzhfN0PwrRrz6X4tFGzeJErvdkB+WMoL53BHH2m/gFw2SJjgYuiLuK2/VE++6KBxdxNTyzwKrq+P1ZkEU=
X-Received: by 2002:a63:eb51:: with SMTP id b17mr32062966pgk.384.1565672681626; 
 Mon, 12 Aug 2019 22:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-6-brendanhiggins@google.com>
 <20190812235701.533E82063F@mail.kernel.org>
 <20190813003352.GA235915@google.com>
 <20190813050206.2A49C206C2@mail.kernel.org>
In-Reply-To: <20190813050206.2A49C206C2@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 22:04:30 -0700
Message-ID: <CAFd5g44VBzDSjxHGUZ=8A9hempQ0_3Ym_8qzj0ETEJ8AzM6poA@mail.gmail.com>
Subject: Re: [PATCH v12 05/18] kunit: test: add the concept of expectations
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Yw2VPeqxmsRoQHPYiMspo9WSTIZItOOYPkJzlzz97sQ=;
 b=R+xjVFNBTOKx66Ip6R2LUuGGTv9eRVrdSycmzhhLqv6ShkSGz9R0iiaQlwquO7BkEU
 x0+Ib4JO36b96tMczjZmXSHPyXXgXTGAWZTVVhOp2T/QIbWWY9V/IwNi6o7K3rnqxKD6
 ziqRin5+uEzkBO92V/m+9MKxmbzCf0EpwYeh574LKHHRRabDjwTHNTwZWhEFkvfuCrXM
 uElR/9bIqUIPxCl1QveNg860hXAYpRf6f2BJRo4B5oKRtiCThZ4ssb+YGhqyKYj3MwTn
 75s7SvppXdJK7apvtGoXkIluns/j2aGIDRd+g49iLbsgOZ5chYru9qT65dM05aT4eQAY
 d3gA==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6MDIgUE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEyIDE3
OjMzOjUyKQo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDQ6NTc6MDBQTSAtMDcwMCwgU3Rl
cGhlbiBCb3lkIHdyb3RlOgo+ID4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wOC0x
MiAxMToyNDowOCkKPiA+ID4gPiArICovCj4gPiA+ID4gKyNkZWZpbmUgS1VOSVRfRVhQRUNUX1RS
VUUodGVzdCwgY29uZGl0aW9uKSBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgIEtVTklUX1RSVUVf
QVNTRVJUSU9OKHRlc3QsIEtVTklUX0VYUEVDVEFUSU9OLCBjb25kaXRpb24pCj4gPiA+Cj4gPiA+
IEEgbG90IG9mIHRoZXNlIG1hY3JvcyBzZWVtIGRvdWJsZSBpbmRlbnRlZC4KPiA+Cj4gPiBJbiBh
IGNhc2UgeW91IHBvaW50ZWQgb3V0IGluIHRoZSBwcmVjZWRpbmcgcGF0Y2gsIEkgd2FzIGp1c3Qg
a2VlcGluZyB0aGUKPiA+IGFyZ3VtZW50cyBjb2x1bW4gYWxpZ25lZC4KPiA+Cj4gPiBJbiB0aGlz
IGNhc2UgSSBhbSBqdXN0IGluZGVudGluZyB0d28gdGFicyBmb3IgYSBsaW5lIGNvbnRpbnVhdGlv
bi4gSQo+ID4gdGhvdWdodCBJIGZvdW5kIG90aGVyIGluc3RhbmNlcyBpbiB0aGUga2VybmVsIHRo
YXQgZGlkIHRoaXMgZWFybHkgb24KPiA+IChhbmQgdGhhdCdzIGFsc28gd2hhdCB0aGUgTGludXgg
a2VybmVsIHZpbSBwbHVnaW4gd2FudGVkIG1lIHRvIGRvKS4KPiA+IEFmdGVyIGEgY291cGxlIG9m
IHNwb3QgY2hlY2tzLCBpdCBzZWVtcyBsaWtlIG9uZSB0YWIgZm9yIHRoaXMga2luZCBvZgo+ID4g
bGluZSBjb250aW51YXRpb24gc2VlbXMgbW9yZSBjb21tb24uIEkgcGVyc29uYWxseSBkb24ndCBm
ZWVsIHN0cm9uZ2x5Cj4gPiBhYm91dCBhbnkgcGFydGljdWxhciB2ZXJzaW9uLiBJIGp1c3Qgd2Fu
dCB0byBrbm93IG5vdyB3aGF0IHRoZSBjb3JyZWN0Cj4gPiBpbmRlbnRhdGlvbiBpcyBmb3IgbWFj
cm9zIGJlZm9yZSBJIGdvIHRocm91Z2ggYW5kIGNoYW5nZSB0aGVtIGFsbC4KPiA+Cj4gPiBJIHRo
aW5rIHRoZXJlIGFyZSB0aHJlZSBjYXNlczoKPiA+Cj4gPiAjZGVmaW5lIG1hY3JvMChwYXJhbTAs
IHBhcmFtMSkgXAo+ID4gICAgICAgICAgICAgICAgIGFfcmVhbGx5X2xvbmdfbWFjcm8oLi4uKQo+
ID4KPiA+IEluIHRoaXMgZmlyc3QgY2FzZSwgSSB1c2UgdHdvIHRhYnMgZm9yIHRoZSBmaXJzdCBp
bmRlbnQsIEkgdGhpbmsgeW91IGFyZQo+ID4gdGVsbGluZyBtZSB0aGlzIHNob3VsZCBiZSBvbmUg
dGFiLgo+Cj4gWWVzLiBTaG91bGQgYmUgb25lLgo+Cj4gPgo+ID4gI2RlZmluZSBtYWNybzEocGFy
YW0wLCBwYXJhbTEpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ICAgICAgICAgc3RhdGVtZW50X2luX2FfYmxvY2swOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgIHN0YXRlbWVudF9p
bl9hX2Jsb2NrMTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgICAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IH0KPiA+Cj4gPiBJbiB0aGlzIGNh
c2UsIGV2ZXJ5IGxpbmUgaXMgaW4gYSBibG9jayBhbmQgaXMgaW5kZW50ZWQgYXMgaXQgd291bGQg
YmUgaW4KPiA+IGEgZnVuY3Rpb24gYm9keS4gSSB0aGluayB5b3UgYXJlIG9rYXkgd2l0aCB0aGlz
LCBhbmQgbm93IHRoYXQgSSBhbQo+ID4gdGhpbmtpbmcgYWJvdXQgaXQsIHdoYXQgSSB0aGluayB5
b3UgYXJlIHByb3Bvc2luZyBmb3IgbWFjcm8wIHdpbGwgbWFrZQo+ID4gdGhlc2UgdHdvIGNhc2Vz
IG1vcmUgY29uc2lzdGVudC4KPiA+Cj4gPiAjZGVmaW5lIG1hY3JvMihwYXJhbTAsICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAg
ICAgICAgICAgICAgcGFyYW0xLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgICAgICAgIHBhcmFtMiwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAg
ICAgICAgICAgICBwYXJhbTMsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICAgLi4uLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAg
ICAgICAgICAgIHBhcmFtbikgLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPgo+ID4gSW4gdGhpcyBsYXN0IGNhc2UsIHRoZSBib2R5IHdv
dWxkIGJlIGluZGVudGVkIGFzIGluIG1hY3JvMCwgb3IgbWFjcm8xLAo+ID4gYnV0IHRoZSBwYXJh
bWV0ZXJzIHBhc3NlZCBpbnRvIHRoZSBtYWNybyBhcmUgY29sdW1uIGFsaWduZWQsIGNvbnNpc3Rl
bnQKPiA+IHdpdGggb25lIG9mIHRoZSBhY2NlcHRhYmxlIHdheXMgb2YgZm9ybWF0dGluZyBmdW5j
dGlvbiBwYXJhbWV0ZXJzIHRoYXQKPiA+IGRvbid0IGZpdCBvbiBhIHNpbmdsZSBsaW5lLgo+ID4K
PiA+IEluIGFsbCBjYXNlcywgSSBwdXQgMSBzcGFjZSBpbiBiZXR3ZWVuIHRoZSBjbG9zaW5nIHBh
cmFtZXRlciBwYXJlbiBhbmQKPiA+IHRoZSBsaW5lIGNvbnRpbnVhdGlvbiBgXGAsIGlmIG9ubHkg
b25lIGBcYCBpcyBuZWVkZWQuIE90aGVyd2lzZSwgSSBhbGlnbgo+ID4gYWxsIHRoZSBgXHNgIHRv
IHRoZSA4MHRoIGNvbHVtbi4gSXMgdGhpcyBva2F5LCBvciB3b3VsZCB5b3UgcHJlZmVyIHRoYXQK
PiA+IEkgYWxpZ24gdGhlbSBhbGwgdG8gdGhlIDgwdGggY29sdW1uLCBvciBzb21ldGhpbmcgZWxz
ZT8KPiA+Cj4KPiBUaGlzIGFsbCBzb3VuZHMgZmluZSBhbmQgSSdtIG5vdCBuaXRwaWNraW5nIHRo
aXMgc3R5bGUuIEp1c3QgdGhlIGRvdWJsZQo+IHRhYnMgbWFraW5nIGxpbmVzIGxvbmdlciB0aGFu
IHJlcXVpcmVkLgoKU291bmRzIGdvb2QuIFdpbGwgZG8uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
