Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4031C23D
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 07:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EEB891CA;
	Tue, 14 May 2019 05:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCB7891CA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 05:45:58 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id g11so11201839pfq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 22:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VbH5YRFZXncUKHJ08BK/QLvXpcAkrT2bjg0doJXq4Wg=;
 b=QkM53Eokbb8wULe/aPR4epxI1TlnXS9tWkVdHofa1TZr6XvXfNuBdpWVdnObQr1XUr
 FIe4N3MPQQK3q13AaKKZOD1LAdZd73A8nKivSFZl4oYp1qH8Usgqest4dXlCI3/EEP6k
 XlsmKbJqmZEPuvbeBUggbjSklysk0/h4pX2bDVX99dB8CSiZtgtOWD+Tkgd2StYs029U
 SHz/d0AcsRfRdrOsl45TJnDPrZJkuLrUupek2rwSaMLb4QJlA12LoCwR93J8clPOXd+R
 2Oenc8WWTBm3wqWt4hNF5/DJzWkpIFGg8neVoXhQxFUtbfzMWRPUEs0C7q3DvzStqDmE
 ZMGw==
X-Gm-Message-State: APjAAAUxq++azlVVeMBeeb/IZIPcPsiPgGoXo65F7D3cDPRV1IuSOYar
 pDRTMzykJCFHF7KIa8SIaYcnCNwT92jKuPA4CIjT1Q==
X-Google-Smtp-Source: APXvYqzjyPHISZHTubFgYiNc+UUgch1AmojyVKkhg7WJQC/48paQal1w/wN9VXCtsmHigQZU/YpJ2B4lN0a4vVc5IsORIQ==
X-Received: by 2002:a63:4852:: with SMTP id x18mr22462430pgk.14.1557812758075; 
 Mon, 13 May 2019 22:45:58 -0700 (PDT)
Date: Mon, 13 May 2019 22:42:42 -0700
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
Message-Id: <20190514054251.186196-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514054251.186196-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the noreturn
 list
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, 
 yamada.masahiro@socionext.com, Josh Poimboeuf <jpoimboe@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=VbH5YRFZXncUKHJ08BK/QLvXpcAkrT2bjg0doJXq4Wg=;
 b=OCf3XCWWrg+X1Zfo2KaJsFc8CYMd22l8ZwpB9CroJFTOGYu/0vFhezR4iaTz3kE/3I
 fFp/IuLXCNLvi8L+VRx6kfU3G3XY4NvmC2B9UA+fcbK52mbM47Ly7LjtfuOk6l07r1aw
 7rap3NRlqFMOpBj4U8/6gt0ZxmeHgu+VVL4G8SUAfYBjc+woQRb3nnHSwQ+9kZJCiUQt
 cTYxnNoGEKgBfOjbhfz3gOpWG7YpeM8ZnnTHcHXv+OkS1fJtg5JRoCpiq9Zu3adkDaG8
 r5CO2AuRSUkRtDKGzZGriujyukwMGH26KBv6iBCZjdqXbRKNz+iY3fC3Z80CkCmbNL9k
 fnfg==
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
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgc2VlbiBvbiBHQ0MgNy4zOgogIGt1bml0
L3Rlc3QtdGVzdC5vOiB3YXJuaW5nOiBvYmp0b29sOiBrdW5pdF90ZXN0X3Vuc3VjY2Vzc2Z1bF90
cnkoKSBmYWxscyB0aHJvdWdoIHRvIG5leHQgZnVuY3Rpb24ga3VuaXRfdGVzdF9jYXRjaCgpCgpS
ZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClRvOiBKb3NoIFBv
aW1ib2V1ZiA8anBvaW1ib2VAcmVkaGF0LmNvbT4KVG86IFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgpMaW5rOiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51
eC1rYnVpbGQvbXNnMjE3MDguaHRtbAotLS0KIHRvb2xzL29ianRvb2wvY2hlY2suYyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9v
bC9jaGVjay5jIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jCmluZGV4IDQ3OTE5NmFlYjQwOTYuLmJl
NDMxZDQ1NTdmZTUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29ianRvb2wvY2hlY2suYworKysgYi90b29s
cy9vYmp0b29sL2NoZWNrLmMKQEAgLTE2Niw2ICsxNjYsNyBAQCBzdGF0aWMgaW50IF9fZGVhZF9l
bmRfZnVuY3Rpb24oc3RydWN0IG9ianRvb2xfZmlsZSAqZmlsZSwgc3RydWN0IHN5bWJvbCAqZnVu
YywKIAkJInVzZXJjb3B5X2Fib3J0IiwKIAkJIm1hY2hpbmVfcmVhbF9yZXN0YXJ0IiwKIAkJInJl
d2luZF9zdGFja19kb19leGl0IiwKKwkJImt1bml0X3RyeV9jYXRjaF90aHJvdyIsCiAJfTsKIAog
CWlmIChmdW5jLT5iaW5kID09IFNUQl9XRUFLKQotLSAKMi4yMS4wLjEwMjAuZ2YyODIwY2YwMWEt
Z29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
