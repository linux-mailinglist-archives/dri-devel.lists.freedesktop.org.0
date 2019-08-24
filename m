Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817179BA33
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 03:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2466ED84;
	Sat, 24 Aug 2019 01:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73566ED84
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 01:34:58 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id q12so7694275pfl.14
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jaLMQno2Ebqgr4Mv8vNWz/EEBwUpKviBFEGImDCb0Hs=;
 b=fVjKYSvjaEi/Nn4nNzgy7kqCzGR8L+jgHd8wgKV1jZX38v3LCdZck2AGlpXl9vitEY
 iXYnZamnkoWd6sUXNlokYTBbE/8/xcdj8UFLBKNHLmcsrw3aKgR9mYeLNMulu1LPdnYt
 +0Lu5K/vbNT4U5pZ8Nhw50AdCEjRQD70UnKAM6u56m6/sJESuDucYeFRwJNzxWc42RbV
 TYXbfJJmg3fyjYKdaXk1mFLLcWfHDZG6iBZd/n0LuuuMpPAFa1AxR9yZaFTpCuqY5kTV
 VCIhV3oWGyeUf39BGHRvN0PWeFOYohCroBc++H+4iQMV7IJowJEiliYZNK8GY4eztlZI
 SZow==
X-Gm-Message-State: APjAAAWsJoj+74kHvheS+OK8bn9jZMV/vWE2qZX7H9QfXVSLvzZd+gmb
 08Y0JLGHGHsUU9W/eJoupPAMaawkT7xdQxnRLus/Lw==
X-Google-Smtp-Source: APXvYqwwY0z16/Y5LFe1Kr5SFliVwpKhegFAUuIw0n+JTAXCBngAGiksy37d5bPtQpg+dxcki1Cv+Q34b9f8TsIeql59jA==
X-Received: by 2002:a65:5b8e:: with SMTP id i14mr6412981pgr.188.1566610497783; 
 Fri, 23 Aug 2019 18:34:57 -0700 (PDT)
Date: Fri, 23 Aug 2019 18:34:15 -0700
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Message-Id: <20190824013425.175645-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190824013425.175645-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 08/18] objtool: add kunit_try_catch_throw to the noreturn
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
 bh=jaLMQno2Ebqgr4Mv8vNWz/EEBwUpKviBFEGImDCb0Hs=;
 b=f8H53a2tmaRVR+1PJzJmfieaxzNc93W/5OvfTk/11u92tAINu1c6dz5memScfayl9C
 /tOrEOoGpLi/C5p9pT0zjbFqBXJ1yt4gWwTFok7LGc1a1E6deXwepr7PJ/AAN8LubPTb
 rL06b+afh8wx2tiEm5oZHM3SyD+jwulLnT2rmJryn3phHAQdr7ngX4D1v3Vnj0dX7bT+
 YiVLX9AQacwGS12YvebGUhnHjSDGGKgFIHvblEL5gh3CDBw/CFbz1nQAj38SKMd85db+
 AP8UcIz6dua15nLdCZfgfFXdwzTpJMsXZZnjUFxYXmZ6se3sUARfroFkhlHMrLpMAjkb
 098w==
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
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
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
IAogCWlmICghZnVuYykKLS0gCjIuMjMuMC4xODcuZzE3ZjViNzU1NmMtZ29vZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
