Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F8C8ADC0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D06E622;
	Tue, 13 Aug 2019 04:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DF56E622
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:31:41 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67FF320644;
 Tue, 13 Aug 2019 04:31:40 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-13-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-13-brendanhiggins@google.com>
Subject: Re: [PATCH v12 12/18] kunit: test: add tests for KUnit managed
 resources
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 21:31:39 -0700
Message-Id: <20190813043140.67FF320644@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565670700;
 bh=bXySyH7oG8Qg7BF2tUIzY88o3nkMldgjGwGFcu7lqBI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cn3hL1Bsuw/xu0q8nUGW5OVqNSM02gmqOxEj7OYVccBR3pVdlHQHfyV+9j4VK5VQ9
 bBjRpi5awUcmcj/bU/NSzkg2lan5bKfaGdNGIkUpT77VE6EbkoCuI/ScUG0KINzgI5
 ShJHcDr5aLfptCDpi5hT68kjow7hDCVTkDHNnS8o=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 Avinash Kondareddy <akndr41@gmail.com>, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MTUpCj4gKwo+ICtzdGF0
aWMgaW50IGt1bml0X3Jlc291cmNlX3Rlc3RfaW5pdChzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4gK3sK
PiArICAgICAgIHN0cnVjdCBrdW5pdF90ZXN0X3Jlc291cmNlX2NvbnRleHQgKmN0eCA9Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAga3phbGxvYyhzaXplb2YoKmN0eCksIEdGUF9LRVJORUwpOwo+
ICsKPiArICAgICAgIGlmICghY3R4KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
ClNob3VsZCB0aGlzIHVzZSB0aGUgdGVzdCBhc3NlcnRpb24gbG9naWMgdG8gbWFrZSBzdXJlIHRo
YXQgaXQncyBub3QKZmFpbGluZyBhbGxvY2F0aW9ucyBkdXJpbmcgaW5pdD8gQlRXLCBtYXliZSBr
dW5pdCBhbGxvY2F0aW9uIEFQSXMgc2hvdWxkCmZhaWwgdGhlIHRlc3QgaWYgdGhleSBmYWlsIHRv
IGFsbG9jYXRlIGluIGdlbmVyYWwuIFVubGVzcyB3ZSdyZSB1bml0CnRlc3RpbmcgZmFpbHVyZSB0
byBhbGxvY2F0ZSBwcm9ibGVtcy4KCj4gKwo+ICsgICAgICAgdGVzdC0+cHJpdiA9IGN0eDsKPiAr
Cj4gKyAgICAgICBrdW5pdF9pbml0X3Rlc3QoJmN0eC0+dGVzdCwgInRlc3RfdGVzdF9jb250ZXh0
Iik7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
