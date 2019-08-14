Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5238CC5C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 09:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6646E273;
	Wed, 14 Aug 2019 07:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3676E273
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:16:58 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 066412054F;
 Wed, 14 Aug 2019 07:16:58 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190814055108.214253-10-brendanhiggins@google.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <20190814055108.214253-10-brendanhiggins@google.com>
Subject: Re: [PATCH v13 09/18] kunit: test: add support for test abort
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Wed, 14 Aug 2019 00:16:57 -0700
Message-Id: <20190814071658.066412054F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565767018;
 bh=XDAYAIHKx15cbm4MLaeL2uyl4aIQnIOMeL1b9sGwwNE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BivEU2xIZL82EeTgEkm0YeMoEaLJDpoEO7a2zS5hiA9cs3kvwHPeOwoR5hLAFoCSs
 QN7vT/TulxQAdD2w0+cnf1mdxQEv+C8FQSllITsMUv0YH0f9tH2JKqFwShfbEex0li
 PW40DSG+Nh81h9qArVWE/xPTvIfUmbeV1PbKJ/WE=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTMgMjI6NTA6NTkpCj4gQWRkIHN1cHBv
cnQgZm9yIGFib3J0aW5nL2JhaWxpbmcgb3V0IG9mIHRlc3QgY2FzZXMsIHdoaWNoIGlzIG5lZWRl
ZCBmb3IKPiBpbXBsZW1lbnRpbmcgYXNzZXJ0aW9ucy4KPiAKPiBBbiBhc3NlcnRpb24gaXMgbGlr
ZSBhbiBleHBlY3RhdGlvbiwgYnV0IGJhaWxzIG91dCBvZiB0aGUgdGVzdCBjYXNlCj4gZWFybHkg
aWYgdGhlIGFzc2VydGlvbiBpcyBub3QgbWV0LiBUaGUgaWRlYSB3aXRoIGFzc2VydGlvbnMgaXMg
dGhhdCB5b3UKPiB1c2UgdGhlbSB0byBzdGF0ZSBhbGwgdGhlIHByZWNvbmRpdGlvbnMgZm9yIHlv
dXIgdGVzdC4gTG9naWNhbGx5Cj4gc3BlYWtpbmcsIHRoZXNlIGFyZSB0aGUgcHJlbWlzZXMgb2Yg
dGhlIHRlc3QgY2FzZSwgc28gaWYgYSBwcmVtaXNlIGlzbid0Cj4gdHJ1ZSwgdGhlcmUgaXMgbm8g
cG9pbnQgaW4gY29udGludWluZyB0aGUgdGVzdCBjYXNlIGJlY2F1c2UgdGhlcmUgYXJlIG5vCj4g
Y29uY2x1c2lvbnMgdGhhdCBjYW4gYmUgZHJhd24gd2l0aG91dCB0aGUgcHJlbWlzZXMuIFdoZXJl
YXMsIHRoZQo+IGV4cGVjdGF0aW9uIGlzIHRoZSB0aGluZyB5b3UgYXJlIHRyeWluZyB0byBwcm92
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdv
b2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRl
bHRhdGVlLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
