Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCC61E496
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 00:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2530A89349;
	Tue, 14 May 2019 22:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDBC89349
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 22:18:57 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id z7so683302qtq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 15:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hhxf3AcyDp0eVXaG87rECj9td0IjCbgyx1Cs8/dNg/A=;
 b=NJarrVYsSgC3Nj7oUS0DbRF8OZKLrZKGiMYTPBvxynUmA5NtZapAhMLLbmLZcrs2gZ
 7N/OWhL8um17Mq9HfBfRTIEIlV7PEPLkEnTZA/ze7TgWiON89LFj1axv5eryq9u84UuN
 GclLTO28uscSJaJlgXDAFrgDMFYQ05vsuKYUlHCnrwaVhfdUC8+rD7cDpFX/rdO0NL6p
 D81kmRU5kMtLh2uSgFJi4LvoN1gVfe054WfKoU5DMF6dVrkODJPIVC/YiHLdImicuaXu
 6RXxfFFtmqbHlCoFYxH7bfL66JZT/Swbx/In6wCjbk/3TR4fqQO0JcPU8pV277EAKOeL
 Hgyw==
X-Gm-Message-State: APjAAAXI8QPywXpi8+OlTBgEQ4H8nFpCOkBQuVJvpU4HSMUZo4mGxsVL
 BkJG4i5IpoCeNXFaXdt9lxkCJ+c54v/1/TwyTIlCjA==
X-Google-Smtp-Source: APXvYqxBQ+PfPDI2jK3tSl4/2KK9BEIB1HtAeTqt6B2C5YgBbe+P8hDv92BaaZf8SMwpuI/42oh72dMCZGz5UE2CQk++4Q==
X-Received: by 2002:a0c:9ac8:: with SMTP id k8mr30361437qvf.132.1557872336955; 
 Tue, 14 May 2019 15:18:56 -0700 (PDT)
Date: Tue, 14 May 2019 15:17:01 -0700
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
Message-Id: <20190514221711.248228-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v4 08/18] objtool: add kunit_try_catch_throw to the noreturn
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
 bh=hhxf3AcyDp0eVXaG87rECj9td0IjCbgyx1Cs8/dNg/A=;
 b=DWFXnp4Hv3gxia+unBmllYaYsTdEPeRc/MPliVDfhoKoHkDccBfKjOBBsFdOH4qVF4
 3CGJdM9LtOAktm1DF9ynbnqVLvb//vkXXPW7t/2caqYSYtjHk5Aaij84YmZjLohuJnsj
 duqt01BxicXxTwy4Wq1D8gJEpe7I1Bv/AntHK8CMGKACQmTwcpHMwk+lus/z1YcgauPS
 xb9wQdaOPB2kaJ1qgUx6KyFG2BH9s/HJu2I8bvz46w/Jq1pIQsjadDWuScGCXS8oRyST
 Yp+i+OKpZrGRDaOWBmMoeaAy5+jX8z364mHVYMUrFBoYt9kdi027M6YMfk5pPD9tA2HQ
 MQZg==
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
OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Ckxpbms6IGh0dHBz
Oi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWtidWlsZC9tc2cyMTcwOC5odG1sCi0tLQog
dG9vbHMvb2JqdG9vbC9jaGVjay5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2NoZWNrLmMgYi90b29scy9vYmp0b29sL2No
ZWNrLmMKaW5kZXggNDc5MTk2YWViNDA5Ni4uYmU0MzFkNDU1N2ZlNSAxMDA2NDQKLS0tIGEvdG9v
bHMvb2JqdG9vbC9jaGVjay5jCisrKyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYwpAQCAtMTY2LDYg
KzE2Niw3IEBAIHN0YXRpYyBpbnQgX19kZWFkX2VuZF9mdW5jdGlvbihzdHJ1Y3Qgb2JqdG9vbF9m
aWxlICpmaWxlLCBzdHJ1Y3Qgc3ltYm9sICpmdW5jLAogCQkidXNlcmNvcHlfYWJvcnQiLAogCQki
bWFjaGluZV9yZWFsX3Jlc3RhcnQiLAogCQkicmV3aW5kX3N0YWNrX2RvX2V4aXQiLAorCQkia3Vu
aXRfdHJ5X2NhdGNoX3Rocm93IiwKIAl9OwogCiAJaWYgKGZ1bmMtPmJpbmQgPT0gU1RCX1dFQUsp
Ci0tIAoyLjIxLjAuMTAyMC5nZjI4MjBjZjAxYS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
