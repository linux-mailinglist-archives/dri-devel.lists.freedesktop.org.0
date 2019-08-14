Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A758CAE1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 07:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EAA6E258;
	Wed, 14 Aug 2019 05:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CC86E255
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 05:52:31 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id j96so18293693plb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 22:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dJI3f1SN7FHCWsT2YqJJAK+Vl1EvHBTDcI6eHyMtfac=;
 b=rHzbQxSMzCinQOfXqarnp9dgZ3GEh8zXxfKJnNQof9R7x46iGqv0SHLg7eUWxEuc63
 a4RhiT7RJBS8B7aLGYsXJaYmF1ItMgSCV06qXuuRiVA+1TKRHEBWRGsyib0i3zC2CA6W
 WhRoxTp2rI1iXllrwMm96nUdYMdyqxw+tDjwOSiPHAe2sznv2KRJkYq0W/POInerZ0J1
 cAVrS0Bh65P+DdHVZ5tkbhm41qApZN8owAMmsTsdr98EnRnB3CjQztbdjStkRKH0fbLR
 deU1hG3+Rx06yU2CQXJfBkv0IwaU18AXxn7mkAIyHgEdAjXXljaR2aw26OifCD6HpgIL
 cgNA==
X-Gm-Message-State: APjAAAVjwLYznj+edqYm7Zn8VUQtxASFwas0IGo6TJAksfZ2Wn4tw5Tr
 noL14kHxGFY9/uuxAOY8iUO5OeZHLkS9GweihE7G9A==
X-Google-Smtp-Source: APXvYqx15GDkg8PQB7JqjQGJp0JcWDFj1Zkf1yox9JkFPI/5qXF/sLjhNwC7NbFBzfAoGHt2OonLFNZNFwcrsUAQ3uzHkA==
X-Received: by 2002:a63:3006:: with SMTP id w6mr37892554pgw.440.1565761950937; 
 Tue, 13 Aug 2019 22:52:30 -0700 (PDT)
Date: Tue, 13 Aug 2019 22:50:58 -0700
In-Reply-To: <20190814055108.214253-1-brendanhiggins@google.com>
Message-Id: <20190814055108.214253-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v13 08/18] objtool: add kunit_try_catch_throw to the noreturn
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
 bh=dJI3f1SN7FHCWsT2YqJJAK+Vl1EvHBTDcI6eHyMtfac=;
 b=sDK5BT/dvFb/4wwwQc1PTpPfH2empuHwtwW683jTc1/UBzcVhObxNP6pBGFilT0sdq
 YjFA/RSQMApVVG+t8h1ynCnvPdjVkkT4nFOBzw6j86bvAZfGFyoYXaIKH1aOmyN2jmCD
 jUU/GIuMEPnspV2nccFjXTCmkzDGT+WZ84tAAqSxmHfl/ERNtjccEG5kl3wcxEb9cTTq
 HoSgKYVtNTanG5OqH7HxaTtMxnQztFLBRlhJ5hoYcT1Yny5tYkm3VtA63Leys4fWCsMI
 KbnsbQWD30WYxkZtVqZaWnTXS2XmF8P1lMAnt7SfjvXusNDDBGHrhs/Rz5S38DPj/h3r
 n92A==
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
anRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYwppbmRleCAxNzZmMmYwODQwNjA5
Li4wYzhlMTdmOTQ2Y2RhIDEwMDY0NAotLS0gYS90b29scy9vYmp0b29sL2NoZWNrLmMKKysrIGIv
dG9vbHMvb2JqdG9vbC9jaGVjay5jCkBAIC0xNDUsNiArMTQ1LDcgQEAgc3RhdGljIGJvb2wgX19k
ZWFkX2VuZF9mdW5jdGlvbihzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlLCBzdHJ1Y3Qgc3ltYm9s
ICpmdW5jLAogCQkidXNlcmNvcHlfYWJvcnQiLAogCQkibWFjaGluZV9yZWFsX3Jlc3RhcnQiLAog
CQkicmV3aW5kX3N0YWNrX2RvX2V4aXQiLAorCQkia3VuaXRfdHJ5X2NhdGNoX3Rocm93IiwKIAl9
OwogCiAJaWYgKCFmdW5jKQotLSAKMi4yMy4wLnJjMS4xNTMuZ2RlZWQ4MDMzMGYtZ29vZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
