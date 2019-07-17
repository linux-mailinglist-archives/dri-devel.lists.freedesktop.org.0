Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B316B3B8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 03:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6086E20A;
	Wed, 17 Jul 2019 01:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6636E209
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:56:16 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id l9so19825707qtu.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 18:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lZlBFQY3Us5crfW9WSC4bzJfPTy9JBI0rQpN2XrR9wI=;
 b=ZcF62z8n/gy78SA9gm+vnzMwIhztLHtRvbxBb9unsKB4NQyLxbbfIA4BOmVFALLIlB
 WaxvMP1RJ392hHInkxX6dmF3Mv+cWfEAUWbflPSIeyJilHuoGFjI7KNqCiFzsjoYs9Mv
 JuF960PU2B75yiIdMC/RuXv+4In1Wg+TKdER5bpWmAfGbMx1Z3pXlhyARBfSt5yaiisU
 kufKdJfvm3z7P5VEMGtO2mf4ItqvfkkJkh4fPLotF8S6xbGChTDaoLQspI5TG71/i6as
 8I/Nz311rlJ7ls1tdAZFAmoDdWD2EsYATh8E3r0NRFrxArb821NE63SB2tgsg5rNTq1P
 exTw==
X-Gm-Message-State: APjAAAXlny6f/C2NPPsKGbpVyze1uOixVNOB2yfr9K5X0uipEzLB2gN+
 RkGqT52WJ68SW2uIj15VulYzfvz7iTRYN4JVdtz57g==
X-Google-Smtp-Source: APXvYqy/TbQinVkJuiRr7In6NyYeP8GT0mPKVABGBjQoi+qfrDV3qI73/LYe4gjXEi7BN46B71HCJBM5Bwy+83T+EO8gPQ==
X-Received: by 2002:aed:37a1:: with SMTP id j30mr25579345qtb.367.1563328575182; 
 Tue, 16 Jul 2019 18:56:15 -0700 (PDT)
Date: Tue, 16 Jul 2019 18:55:33 -0700
In-Reply-To: <20190717015543.152251-1-brendanhiggins@google.com>
Message-Id: <20190717015543.152251-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190717015543.152251-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v11 08/18] objtool: add kunit_try_catch_throw to the noreturn
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
 bh=lZlBFQY3Us5crfW9WSC4bzJfPTy9JBI0rQpN2XrR9wI=;
 b=tqrR9xFTwORg1QSrmBsFleKT9JOo0mWeTxGW4Cfwc/bY+SbwKbWZtnZC5uqvLPXSy0
 fFTbFyRnOTfxluTh2q6BMZP1q+PSU3GiYh3dcvTTUMWsTDnE6XZgVauYWvDh+EbTKMPB
 KOgoPOnY6LBnwW9fDpo4DT805XeLouwSR15jHAff7jT0L9EmtILO0Z0eY1r1rCV8Q2i5
 O5GViNSp0p+IvC97BTusPHUJbhRwBbnLV8q2bc7TmAONmWtyLpSkhVrAreIyO5wcuztq
 zhOnGzS12A0sd7xlto/kMnwO3Xxh5zXw/gRGmyzq7nhT8lD3eB9n4tJ+8f/lrXrHJcfq
 mv9w==
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
anRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYwppbmRleCAxNzJmOTkxOTU3MjY5
Li45OGRiNWZlODVjNzk3IDEwMDY0NAotLS0gYS90b29scy9vYmp0b29sL2NoZWNrLmMKKysrIGIv
dG9vbHMvb2JqdG9vbC9jaGVjay5jCkBAIC0xMzQsNiArMTM0LDcgQEAgc3RhdGljIGludCBfX2Rl
YWRfZW5kX2Z1bmN0aW9uKHN0cnVjdCBvYmp0b29sX2ZpbGUgKmZpbGUsIHN0cnVjdCBzeW1ib2wg
KmZ1bmMsCiAJCSJ1c2VyY29weV9hYm9ydCIsCiAJCSJtYWNoaW5lX3JlYWxfcmVzdGFydCIsCiAJ
CSJyZXdpbmRfc3RhY2tfZG9fZXhpdCIsCisJCSJrdW5pdF90cnlfY2F0Y2hfdGhyb3ciLAogCX07
CiAKIAlpZiAoZnVuYy0+YmluZCA9PSBTVEJfV0VBSykKLS0gCjIuMjIuMC41MTAuZzI2NGYyYzgx
N2EtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
