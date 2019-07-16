Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCEE6A52D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 11:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4556E0FE;
	Tue, 16 Jul 2019 09:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B666E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:43:33 +0000 (UTC)
Received: by mail-ua1-x949.google.com with SMTP id z23so2160917uaq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lZlBFQY3Us5crfW9WSC4bzJfPTy9JBI0rQpN2XrR9wI=;
 b=jwEAkgPuwJxB4K1eerNC1eijOgsn6czAv+AIVkc/5ipBiDuyPTJfaKDLP0vVgQJ26T
 0p9qnEgmQmxsf3rQabspEu1ecwwdkaWMhh7+HHDSguKgh0vh22MUjHtqfD4nmz0p6e8T
 XkgjM5QxCuWuB2CB6Na2BsFEP+Ltqcb3EII/4mzoY6Y2+68wTi+9LnNSBD2VeXly/ioV
 4ZJbeyBms5Qa3eya037jcD0kYGVm/QxXw6y0RHkEjP/eeOYWmjuB/hk29FUq1cQN42DU
 /MsqsyNo6vGonBjidRewCBweZ9aDFZ+ghFPHGqqZ1SGOqpPJ4yZ9yGE+yjILTrNbh6qs
 jumw==
X-Gm-Message-State: APjAAAXQ91j1ENNSXzbeN8zKEvE8IunRptf3cGGE8UC3xQzBXNb7RDeX
 OTW4ZnqCBTtCF+G+1AlHqsox9aN5q4aysM7lXw4NsA==
X-Google-Smtp-Source: APXvYqxqKbel/54jGzh19qChTyrMaZnWOC/e3EUzK7J+6Pv1AZ9Pc0NWXvhp/2B+Xqkw03JSEPx72ClnYnJPihFK/5czgQ==
X-Received: by 2002:a67:e9c3:: with SMTP id q3mr19671567vso.5.1563270211546;
 Tue, 16 Jul 2019 02:43:31 -0700 (PDT)
Date: Tue, 16 Jul 2019 02:42:52 -0700
In-Reply-To: <20190716094302.180360-1-brendanhiggins@google.com>
Message-Id: <20190716094302.180360-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190716094302.180360-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v10 08/18] objtool: add kunit_try_catch_throw to the noreturn
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
 b=DX1LvNppWtT3TTQulWABcRXxpn8iTEBCN5ZSrvB8fB+IBGJFMNOzH7YL/HN+5yKRqJ
 41R44YMyFgs7gHPFM5RC4OR25wcyrJb2dRbNHBzIF8MDGN1aUqj0nQIjWPbmbCIDdiZS
 cbgtCzkOa7R72JDgOcaUDIdw3GtElQSqPValW/ciqg+U2tj3JnixmeuOd924bFFXqG4f
 z/GebTNz0Wj6zeIjBdId6Trn8NcfhaCv4E9mrcr/kEB/hlP7Y7V683cSF7qBPtXQVwqA
 OZ1pGjqpkfJcHrtSowOO3rz1QVSk8rt2UrNl+7wFdEQczKSB3unQbu1ZXA6E+PQkfKLB
 Ja9g==
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
