Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB508AA2D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 00:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B476E5F2;
	Mon, 12 Aug 2019 22:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530766E5F2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:10:31 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99B31206C2;
 Mon, 12 Aug 2019 22:10:30 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-3-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-3-brendanhiggins@google.com>
Subject: Re: [PATCH v12 02/18] kunit: test: add test resource management API
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 15:10:29 -0700
Message-Id: <20190812221030.99B31206C2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565647830;
 bh=SPZRl5pSVopkTs0dY+BYgF4YdIC5weWXIEKe9ul/RDw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=V3lZzoj5A/ZUJ82O/D6JOwCAESMHhjfhFsM/G+WlAQFOJn0eCYLeKxiUav3yhAWrc
 3bLOfvUeJqm5cu0JRjxhkYqU/qNE2mLaefdclg0BgxHvmqSh/kXGRMQIhxkerIgm9f
 dbMpOgSRN5v/bzLnxQ4pQx6d7nMjpT4h51jSvW3c=
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
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MDUpCj4gQ3JlYXRlIGEg
Y29tbW9uIEFQSSBmb3IgdGVzdCBtYW5hZ2VkIHJlc291cmNlcyBsaWtlIG1lbW9yeSBhbmQgdGVz
dAo+IG9iamVjdHMuIEEgbG90IG9mIHRpbWVzIGEgdGVzdCB3aWxsIHdhbnQgdG8gc2V0IHVwIGlu
ZnJhc3RydWN0dXJlIHRvIGJlCj4gdXNlZCBpbiB0ZXN0IGNhc2VzOyB0aGlzIGNvdWxkIGJlIGFu
eXRoaW5nIGZyb20ganVzdCB3YW50aW5nIHRvIGFsbG9jYXRlCj4gc29tZSBtZW1vcnkgdG8gc2V0
dGluZyB1cCBhIGRyaXZlciBzdGFjazsgdGhpcyBkZWZpbmVzIGZhY2lsaXRpZXMgZm9yCj4gY3Jl
YXRpbmcgInRlc3QgcmVzb3VyY2VzIiB3aGljaCBhcmUgbWFuYWdlZCBieSB0aGUgdGVzdCBpbmZy
YXN0cnVjdHVyZQo+IGFuZCBhcmUgYXV0b21hdGljYWxseSBjbGVhbmVkIHVwIGF0IHRoZSBjb25j
bHVzaW9uIG9mIHRoZSB0ZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8
YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogTG9nYW4gR3Vu
dGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IFN0ZXBoZW4g
Qm95ZCA8c2JveWRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
