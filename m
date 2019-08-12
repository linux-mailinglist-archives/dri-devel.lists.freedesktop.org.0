Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3348ABA9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 01:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2540F89F75;
	Mon, 12 Aug 2019 23:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E82289F75
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:59:40 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 100842063F;
 Mon, 12 Aug 2019 23:59:40 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812233336.GA224410@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 16:59:39 -0700
Message-Id: <20190812235940.100842063F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565654380;
 bh=Ihx5qucsrmvrAAE/5ImD3U15K8tabsAl8VFviXM9+Bg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fIGb9dkjeLM6ykUlYcegOGMgH57XYg0i2e09hxpU6M5SeZwLGIFKwZRTa3F446++Q
 7v31k+Hz3Z3dkW7F1eUzFN+GhoaUfon3TmFOSQ+Kek1TG5+5BWGh5EPASd4FKHvy+z
 H+flEKxiF+rQtxdwpE+w2sauD520cIpSgMU1N6LU=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 jpoimboe@redhat.com, kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTY6MzM6MzYpCj4gT24gTW9uLCBB
dWcgMTIsIDIwMTkgYXQgMDM6NTU6MTlQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+ID4g
UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MDYpCj4gPiA+ICt2b2lk
IHN0cmluZ19zdHJlYW1fY2xlYXIoc3RydWN0IHN0cmluZ19zdHJlYW0gKnN0cmVhbSkKPiA+ID4g
K3sKPiA+ID4gKyAgICAgICBzdHJ1Y3Qgc3RyaW5nX3N0cmVhbV9mcmFnbWVudCAqZnJhZ19jb250
YWluZXIsICpmcmFnX2NvbnRhaW5lcl9zYWZlOwo+ID4gPiArCj4gPiA+ICsgICAgICAgc3Bpbl9s
b2NrKCZzdHJlYW0tPmxvY2spOwo+ID4gPiArICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShmcmFnX2NvbnRhaW5lciwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZnJhZ19jb250YWluZXJfc2FmZSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnN0cmVhbS0+ZnJhZ21lbnRzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBub2RlKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBsaXN0X2RlbCgmZnJhZ19jb250YWlu
ZXItPm5vZGUpOwo+ID4gCj4gPiBTaG91bGRuJ3Qgd2UgZnJlZSB0aGUgYWxsb2NhdGlvbiBoZXJl
PyBPdGhlcndpc2UsIGlmIHNvbWUgdGVzdCBpcyBnb2luZwo+ID4gdG8gYWRkLCBhZGQsIGNsZWFy
LCBhZGQsIGl0J3MgZ29pbmcgdG8gbGVhayB1bnRpbCB0aGUgdGVzdCBpcyBvdmVyPwo+IAo+IFNv
IGJhc2ljYWxseSB0aGlzIG1lYW5zIEkgc2hvdWxkIGFkZCBhIGt1bml0X2tmcmVlIGFuZAo+IGt1
bml0X3Jlc291cmNlX2Rlc3Ryb3kgKHJlc3BlY3RpdmUgZXF1aXZhbGVudHMgdG8gZGV2bV9rZnJl
ZSwgYW5kCj4gZGV2cmVzX2Rlc3Ryb3kpIGFuZCB1c2Uga3VuaXRfa2ZyZWUgaGVyZT8KPiAKClll
cywgb3IgZHJvcCB0aGUgQVBJIGVudGlyZWx5PyBEb2VzIGFueXRoaW5nIG5lZWQgdGhpcyBmdW5j
dGlvbmFsaXR5PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
