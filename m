Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A028166878
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8426E2FD;
	Fri, 12 Jul 2019 08:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD046E2FD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:18:09 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id w5so5293199pgs.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 01:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tRWxB/VAAV03ErbuMUlwG4nfr04i5uXxvmyjeK/eYMw=;
 b=qigyGzLdF7YhgXCdjqSLgBsSd9Pnh13I6ACOUPMaJvZnSCVfR0wIgvbpgooFbLmAbk
 8ovs7R54uGuLlWDT8JdagGwKJRaqAyqIGiw8RwoxLhsxode/f8dN34zCBMB6vKSImgdU
 WheRbvylYyZPaCFHU+uVIkFS4iXQpJL/1I1fqcBu5mbAQkErotsXaaGAgfDOpZtld554
 7ZqQrRsXrUjW/9V5duMK5rfdT71GbKXqpIIggkCYCKJYQb+VISkIQu/60gvnbufNljoP
 lJ9XuU4HpESZz8pDwZTK9DneTyEyO1P7PA7OYTYiO9+yAQ9fNXJE1hS1deRzZbXY+RQ5
 A9rA==
X-Gm-Message-State: APjAAAWs0EZOhJq91VwCJaQowSLElqzeVFf5g1SH27HAqrWmm7yAyQ6n
 t3M4sX8zKefR/BSSqfbzQ/FACfHsYzEZzRJXlEvFCA==
X-Google-Smtp-Source: APXvYqzSxxZhDV/VHuvjEAx+PSSV2CXvVreQjca+MxOlfBW78VEVBMXf9ELB10VRLpFN34tmpwg5o+RRVIJafuHGXJT+dA==
X-Received: by 2002:a63:755e:: with SMTP id f30mr9386006pgn.246.1562919487340; 
 Fri, 12 Jul 2019 01:18:07 -0700 (PDT)
Date: Fri, 12 Jul 2019 01:17:32 -0700
In-Reply-To: <20190712081744.87097-1-brendanhiggins@google.com>
Message-Id: <20190712081744.87097-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v9 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=tRWxB/VAAV03ErbuMUlwG4nfr04i5uXxvmyjeK/eYMw=;
 b=fHwJnLlLISoqqvDLfyGk8Vw3/9WOMxJ7OvlFCg60FTmh8rrkGX1XqrgWqeHGbkOsY9
 +9oig5zdjDaOqX38pwXJ11qc7zDS9xm51tLG8d25Pjl1qnpFQ00DiM7DgsXnHCHhAf4u
 nWPLyei0fJyAgxO/X1UeAkr7Vthrx42va4uBivgP+bj8Y81BwkUY+zTsBlN4qLRnMdWU
 WEsrFUyDNb2QC4wmy18R655kwuWcHYQFH6bB1A4/qso+3SZixPG89crgQSo4SlPakdWA
 lNMkNruO9RTX0Na3yK694/C+DuZRUD9DprT3tYjpbz8Q1UNMfW9LI+przQMH/Z0msupI
 vhQg==
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
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 Michal Marek <michal.lkml@markovi.net>, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgcm9vdCBLY29uZmlnIGFuZApNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBh
Y3R1YWxseSBidWlsdC4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KQWNrZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2Fo
aXJvQHNvY2lvbmV4dC5jb20+CkNjOiBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmku
bmV0PgpSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNv
bT4KLS0tCiBLY29uZmlnICB8IDIgKysKIE1ha2VmaWxlIHwgMiArKwogMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCA0
OGE4MGJlYWI2ODUzLi4xMDQyODUwMWVkYjc4IDEwMDY0NAotLS0gYS9LY29uZmlnCisrKyBiL0tj
b25maWcKQEAgLTMwLDMgKzMwLDUgQEAgc291cmNlICJjcnlwdG8vS2NvbmZpZyIKIHNvdXJjZSAi
bGliL0tjb25maWciCiAKIHNvdXJjZSAibGliL0tjb25maWcuZGVidWciCisKK3NvdXJjZSAia3Vu
aXQvS2NvbmZpZyIKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggM2U0ODY4
YTY0OThiMi4uMGNlMWE4YTJiNmZlYyAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZp
bGUKQEAgLTk5Myw2ICs5OTMsOCBAQCBQSE9OWSArPSBwcmVwYXJlMAogaWZlcSAoJChLQlVJTERf
RVhUTU9EKSwpCiBjb3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0
eS8gY3J5cHRvLyBibG9jay8KIAorY29yZS0kKENPTkZJR19LVU5JVCkgKz0ga3VuaXQvCisKIHZt
bGludXgtZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIgJS8sICQoaW5pdC15KSAkKGlu
aXQtbSkgXAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChkcml2ZXJzLXkpICQoZHJpdmVy
cy1tKSBcCiAJCSAgICAgJChuZXQteSkgJChuZXQtbSkgJChsaWJzLXkpICQobGlicy1tKSAkKHZp
cnQteSkpKQotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
