Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62147C78
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A289148;
	Mon, 17 Jun 2019 08:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E4489148
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 08:27:13 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id g30so8571193qtm.17
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 01:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=P7qQxupR077m/rPxlenNGlU3U4VVv+id9WBQp+CCiSA=;
 b=WxvPMs6QhnJeh7gGdKuZKL+1l9eL9wQ+Wg5akZb+xnUMmXVkGutIwYprnmHtH5+AOF
 FtOj/uFjJcuYjPU3vzvO39c8rtnA7REclisjBRmLDFsyPuJ8ffqgKITuaRAIMI3whxDK
 DiGzcaS6kmK4I777423OVCw6ranM7Ku59pw93OTy3A/M5FRkMu1hWP6b1ykihHAWHJYc
 c5+Yh0zUR39iu0kqf/pfQbhm6CnOJBl8sVHnTcWC/frRx8ReCHMeFa5UwdANNLpPqmR6
 9P8wQu6/dZPrLho94qZ6nq7ag5xCduprOQHKJIF98DqJX4YN/V0N2rk0iWIWw+LHmwf8
 3Arw==
X-Gm-Message-State: APjAAAWhWoo0hbI+X7BNpqtK3569JXiPtsiSnbD9RuCw+T/qLSlggkpb
 h7siOir67SZ7TO8rahiB6QBo6fuw67R/XnEzx+4+SA==
X-Google-Smtp-Source: APXvYqx0YR1LOvLx8MrLc4kC+IavL77YnqU0ZCY8iQpLJogfIJFPCQppkE8daCg0rbTkPkzwWah6Jy7PTx84UaIsCg506w==
X-Received: by 2002:a37:47d1:: with SMTP id u200mr53840375qka.21.1560760032086; 
 Mon, 17 Jun 2019 01:27:12 -0700 (PDT)
Date: Mon, 17 Jun 2019 01:26:03 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 08/18] objtool: add kunit_try_catch_throw to the noreturn
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
 bh=P7qQxupR077m/rPxlenNGlU3U4VVv+id9WBQp+CCiSA=;
 b=dqLUMwrRZQiMFvm38V0z6iKhsbbQcU8U8N8pSEIsFltqJAqDIL/1dU9s/SknImAoiG
 1jAZQEw1jfjkQsGEKRRwb9c9VUuPvm1EKJpmDRR2Dx395sZirD9rolf3UZGnMkXVT/0g
 B3W+XYMY5/uFttGCyyCOCwERc21fwwPtQ60cuJu7C6FZEa+rCRJoJDWrBrFGXpHe4lpW
 7DlYd2qA6sgsitjocepZeYwQsJtKZWf+m6SkXaSyypkDwrgPqUoUG19PSneUhdkmbpZl
 HjkxdkJ4mI1ik3KnnJs+UUjsWS4abEl/JWsf72O68EzBa7qdBYOno2uD0pv3+2nii6q2
 tKqA==
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
ZWNrLmMKaW5kZXggMTcyZjk5MTk1NzI2OS4uOThkYjVmZTg1Yzc5NyAxMDA2NDQKLS0tIGEvdG9v
bHMvb2JqdG9vbC9jaGVjay5jCisrKyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYwpAQCAtMTM0LDYg
KzEzNCw3IEBAIHN0YXRpYyBpbnQgX19kZWFkX2VuZF9mdW5jdGlvbihzdHJ1Y3Qgb2JqdG9vbF9m
aWxlICpmaWxlLCBzdHJ1Y3Qgc3ltYm9sICpmdW5jLAogCQkidXNlcmNvcHlfYWJvcnQiLAogCQki
bWFjaGluZV9yZWFsX3Jlc3RhcnQiLAogCQkicmV3aW5kX3N0YWNrX2RvX2V4aXQiLAorCQkia3Vu
aXRfdHJ5X2NhdGNoX3Rocm93IiwKIAl9OwogCiAJaWYgKGZ1bmMtPmJpbmQgPT0gU1RCX1dFQUsp
Ci0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
