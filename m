Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B2B9A2A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2019 01:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FA06FE23;
	Fri, 20 Sep 2019 23:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8346FE23
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 23:20:01 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id 30so5371550pgt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 16:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Ps4mUI1wXYQhLtVI103dUb/qTWn9bG8Bcp8PtHYLuE4=;
 b=Ip0PNeW3p28fRntKc98AcfrLEZDJddQ7AzTSvP51Q1Npp2HOrYOQuYbixtVZZiYMc+
 +qlKfQbhq55/OmF5JXfHUhISo2hxtEQsea7UNxq6v8YSnvq0nJN+/0P0F8kvyp+3y9Cc
 /XOcI6EI9oJCgowbOud74yUCSuexNpwoXDQrU7g8ay3wnSqIQx7GBtTx4jjVm1xvxrGf
 XKWvi1h42h9Q1ZLd4boCi6/tFMjLE/NoepI/fXXdw3MHrXRKr95fOW2ck/XZUGydxIKi
 geJMQgQR1PX1l7TZXL+WW21DGjs7cWsDIi0jP3i3tHFOn528LzlbHT/V8WTcuMQ30uTn
 D7bA==
X-Gm-Message-State: APjAAAWmvKEshxB0hak2BSCbQWRjSvwEW37GK7BsxxmL8il218tpg/QH
 YQ86MvQmQQf7gxEWxxSn0w5VI+05LKsiB0ccwSUCaA==
X-Google-Smtp-Source: APXvYqyRyEtSIoadJVkzfr7pCBqe/P8Wqalii5pRNBWiJia3EUvmP93K/4Z5BGLmgvurL+sQYFSnEu4syCjzL5l2a736Qg==
X-Received: by 2002:a63:30c1:: with SMTP id w184mr7246294pgw.145.1569021600602; 
 Fri, 20 Sep 2019 16:20:00 -0700 (PDT)
Date: Fri, 20 Sep 2019 16:19:12 -0700
In-Reply-To: <20190920231923.141900-1-brendanhiggins@google.com>
Message-Id: <20190920231923.141900-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190920231923.141900-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v16 08/19] objtool: add kunit_try_catch_throw to the noreturn
 list
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=Ps4mUI1wXYQhLtVI103dUb/qTWn9bG8Bcp8PtHYLuE4=;
 b=SnZOsrrlWJenGk20gQW1Rwp5y0l+UpBWU6rQ95Ow7AO3VBAJbCntTU3oMaEnvHfJbE
 Az1+XHvzex5yH9YFg4jrae0doIjkNfK2WKgj242VtDhXD7eb58D9+84nTodB0jFlCnpA
 F3JdXTDadG8BO6TY+IJp1iOTvFuTuNf4zY1e2+f4L1KBvmaa5008SAMUudZJV/WVeS/1
 DWMTXY9ED1V9wBZw/L3YY/bPCQkkAeUj/UWD1IVV8rhopQcYgoNXGkyPmKZ/Ip+AAvzH
 W5sULkrrYhl61N0NfZ7xJKxt1MnQS64YyhlU91UwMiWNkDlJcfHS5jVAKyPqQcRv8148
 lTJw==
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
 kbuild test robot <lkp@intel.com>, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com,
 joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, torvalds@linux-foundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgd2FybmluZyBzZWVuIG9uIEdDQyA3LjM6CiAga3VuaXQvdGVzdC10
ZXN0Lm86IHdhcm5pbmc6IG9ianRvb2w6IGt1bml0X3Rlc3RfdW5zdWNjZXNzZnVsX3RyeSgpIGZh
bGxzIHRocm91Z2ggdG8gbmV4dCBmdW5jdGlvbiBrdW5pdF90ZXN0X2NhdGNoKCkKCmt1bml0X3Ry
eV9jYXRjaF90aHJvdyBpcyBhIGZ1bmN0aW9uIGFkZGVkIGluIHRoZSBmb2xsb3dpbmcgcGF0Y2gg
aW4gdGhpcwpzZXJpZXM7IGl0IGFsbG93cyBLVW5pdCwgYSB1bml0IHRlc3RpbmcgZnJhbWV3b3Jr
IGZvciB0aGUga2VybmVsLCB0bwpiYWlsIG91dCBvZiBhIGJyb2tlbiB0ZXN0LiBBcyBhIGNvbnNl
cXVlbmNlLCBpdCBpcyBhIG5ldyBfX25vcmV0dXJuCmZ1bmN0aW9uIHRoYXQgb2JqdG9vbCB0aGlu
a3MgaXMgYnJva2VuIChhcyBzZWVuIGFib3ZlKS4gU28gZml4IHRoaXMKd2FybmluZyBieSBhZGRp
bmcga3VuaXRfdHJ5X2NhdGNoX3Rocm93IHRvIG9ianRvb2wncyBub3JldHVybiBsaXN0LgoKUmVw
b3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+CkFja2VkLWJ5OiBK
b3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAcmVkaGF0LmNvbT4KTGluazogaHR0cHM6Ly93d3cuc3Bp
bmljcy5uZXQvbGlzdHMvbGludXgta2J1aWxkL21zZzIxNzA4Lmh0bWwKQ2M6IFBldGVyIFppamxz
dHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KLS0tCiB0b29scy9vYmp0b29sL2NoZWNrLmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL29i
anRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYwppbmRleCAxNzZmMmYwODQwNjAu
LjBjOGUxN2Y5NDZjZCAxMDA2NDQKLS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jCisrKyBiL3Rv
b2xzL29ianRvb2wvY2hlY2suYwpAQCAtMTQ1LDYgKzE0NSw3IEBAIHN0YXRpYyBib29sIF9fZGVh
ZF9lbmRfZnVuY3Rpb24oc3RydWN0IG9ianRvb2xfZmlsZSAqZmlsZSwgc3RydWN0IHN5bWJvbCAq
ZnVuYywKIAkJInVzZXJjb3B5X2Fib3J0IiwKIAkJIm1hY2hpbmVfcmVhbF9yZXN0YXJ0IiwKIAkJ
InJld2luZF9zdGFja19kb19leGl0IiwKKwkJImt1bml0X3RyeV9jYXRjaF90aHJvdyIsCiAJfTsK
IAogCWlmICghZnVuYykKLS0gCjIuMjMuMC4zNTEuZ2M0MzE3MDMyZTYtZ29vZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
