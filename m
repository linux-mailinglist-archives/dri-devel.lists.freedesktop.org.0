Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B36687E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642B66E30C;
	Fri, 12 Jul 2019 08:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191F76E30C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:18:14 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id o16so5285218pgk.18
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 01:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=i+cHtqqH4D1BH2a9iTheu+r071sQgiMbeMpUxd8ISoM=;
 b=ORFLMyEmuLhnm52mwPdnICcKzSg/UOiCj1TD7raFHctAtZcc0XPsSuwWWIj0/cMxGk
 Xs0P22e9TRjK6mKA0U/T2+RB3tj2K0a0SAHjrOaYgNuyY8b+WN0Yxfev9/89vF0ZIHBO
 Q/Mste2biEGrX2SQklWyiWJFEy+FFyj8tiSL5UwMZrpi+aMGKgJhjHe/4P2MWRUyD3OD
 T77TfrZL2a5wWhKnj32SRKJ+knV0HwMOi3tdhdGiL8VaA39iBiqrU49rVafC7U76I7xY
 N6jHD78S7Q9afOG0YanPIYPZioskI2Y+QT/ef8w11OoQgamT+oVUZfdaCHAQuu93KsKO
 En4Q==
X-Gm-Message-State: APjAAAUpuQtZ9JLlP+UpY+Dj29mkGEkAZ6TLJ542S2rY2sf3RiJFgZ9b
 5nlS/NdscjR2p6fYTovcakF7CKArG5cmPXSH30F9dQ==
X-Google-Smtp-Source: APXvYqzz2gJJL34hDMbBwPs85xg2+0dv7RK7cTbtv7ZbF6XViPSV/DLjekY0hrvbIynZL7ZvM95IzPNpuP225+5zbR75Zw==
X-Received: by 2002:a63:3046:: with SMTP id w67mr9536501pgw.37.1562919492919; 
 Fri, 12 Jul 2019 01:18:12 -0700 (PDT)
Date: Fri, 12 Jul 2019 01:17:34 -0700
In-Reply-To: <20190712081744.87097-1-brendanhiggins@google.com>
Message-Id: <20190712081744.87097-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v9 08/18] objtool: add kunit_try_catch_throw to the noreturn
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
 bh=i+cHtqqH4D1BH2a9iTheu+r071sQgiMbeMpUxd8ISoM=;
 b=oHpfhzNbJmulqM6XSNH5su9esA0AXBMlIYp9xnUAqjTBxFDowcENzhm8NkKmPbzmBf
 TfIjRelR04iLN1TttiN4WrjDbgNJqROj8ZHFleOvrhDsyhjxlOVAKSIO3dzyZoQobaI7
 JWKbSLVf4RHLIrH4o+UfsD8ykJ2/IyL5O6ecYkykXB52Po8SpR2jZoRpgc9FNom5cM7L
 rW8BibE3ShU7hHecNSLSWPt79g74xsWLSFavd+V86jp0tTlXJ/wwZuXnzaPPuQYJ21My
 /ZSaqrVaDRaCkFVnpYDKUKzv1IQHchCGI5eBif6HuLTcLqHw+1CSS5LXiGvHFAFfgFXn
 LNsw==
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
CiAKIAlpZiAoZnVuYy0+YmluZCA9PSBTVEJfV0VBSykKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIx
YjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
