Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7296BB057
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 11:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2296E29E;
	Mon, 23 Sep 2019 09:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DB76E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:03:17 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id p2so7595180pff.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Ps4mUI1wXYQhLtVI103dUb/qTWn9bG8Bcp8PtHYLuE4=;
 b=grs97fOJMesntkJlRHw79ihxgjlPzKx2gJ/crufvcof/i2qg8T4ejfV2vZmpvUjUHJ
 RZEiu1jX0pGA7TPz2/PpM8NQKtAyHwaaz3XooEh+62GBffFBF6jb+Roy9tek09R3iKAa
 PavtMjiGz3h46karhrpagzQp1RkOAj5UnWiOQNpF2ZivpRPoKAwEDxxMwbhzq/4xrmJp
 gy6MpXXQoGG1rnmbpwf9iIgV6Owfu+MkCLcJm2ZAS6lcLtC2mq4vOB0tBe8wFryDrHC/
 kuPMRHBMr2W44o9I893OHHXZ1DTZCVnDTUUZ6R+okxa8SlNaV1HzwUTofJ7EywI5RVJG
 gDbA==
X-Gm-Message-State: APjAAAVkh31ACkQqChzlC1b06K+fV0u8oC9L+OZuEBJoIFpNxSaLwjGd
 etXH7ybictqNV27jLxl9cJ1HNNEASOqS3bJJDqN0AA==
X-Google-Smtp-Source: APXvYqxZtpb+vxVfs6KdEpv95n2czjshe/ga6Yeu5rhPTDLYFp2Lda7Njju8cJbWVakX1V0GRGWCC35NALYsFoQ/9SEM6Q==
X-Received: by 2002:a65:6659:: with SMTP id z25mr1323921pgv.23.1569229396529; 
 Mon, 23 Sep 2019 02:03:16 -0700 (PDT)
Date: Mon, 23 Sep 2019 02:02:38 -0700
In-Reply-To: <20190923090249.127984-1-brendanhiggins@google.com>
Message-Id: <20190923090249.127984-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v18 08/19] objtool: add kunit_try_catch_throw to the noreturn
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
 b=qFxdsLMix9SuTOm0MqeSjHtbvUU/0+OVOoudDPyyuONAd7hDphar1IPavEzQZvPuKF
 4zApBd/WkrRJaMotHA8Gz8e364EwfwrjcSj2Q+OgpEFUlBWHejV7VwF5SxR3jXc3iwTm
 +KueNreMBToJhGaIwgcRWU2ncBL2txp5eZa9EeYIdKtYAC74wbaFkI/zcNThcsgV0LHt
 4pJu+ofH8cxDOingwsv26mOPBC5gk5MG8HIO0L6v/8d7ZvscGBi3MWx5+l8SyLzH2Eey
 9KV+cYRLRYJQoFhhWy7zrsF/glsxruQ50pQ+Ri2tg5svkFiEkHLGdUrTr2UyJpXuokUB
 IYlQ==
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
