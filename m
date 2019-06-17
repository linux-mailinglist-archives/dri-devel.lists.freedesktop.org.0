Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9894F47C71
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B32A89177;
	Mon, 17 Jun 2019 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D31789177
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 08:27:03 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id 184so4464879vku.17
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 01:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=x00LgSmLKToDFMVzGBRd3p5tkepZRYMdj+2oyEasIr8=;
 b=qMf4knxtMb1MPkhOGds6HNle9lBNTdY+ZrzOp8DkGXbFQPqUQucFc8crprLlDjmk7p
 HGLLxe6SkjiPui4zFmDxRhYeYmjni0d3lovlbvExwJok4q4/8p+TRG+2/quGX+fz7wTK
 S4/QBVuekAc1UHoL5Jbyb3lx34fNz2HYvEFJSosrx2deqAMqjKpB0mKg86a3ZuiEppa4
 +U8ckdvywmIjLuKhvgTPkgYqCU0mRyVbemauQ7pTKubGzkgVqRLuCTaNkiEdOLZwztCg
 fMnwlJ1RQA/d2WY4lN/0I2ul9xSxeEbUt2bNwxQbx40TVNC1Ofk1hUaNj1AfnqMBAuYn
 OLmA==
X-Gm-Message-State: APjAAAVHoXJ3N0MRQrhRBAHw6+M/t/P1JjTJwQBzPKG+izbZI7/wrjxr
 Tj7XmJHL+lbkhD04lLSaapmkX9UXhn+wPIx0sPKkFw==
X-Google-Smtp-Source: APXvYqw0AQqNp/70EN0nmAb/HcpHOuljd/qoLNtxJ0Hn2/jd1Zqa5j+kjBpA0VFAeCRj9jxoqQZAwaaDKLUcJqXCrNqWPg==
X-Received: by 2002:a67:6d44:: with SMTP id i65mr58904024vsc.106.1560760022147; 
 Mon, 17 Jun 2019 01:27:02 -0700 (PDT)
Date: Mon, 17 Jun 2019 01:26:01 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=x00LgSmLKToDFMVzGBRd3p5tkepZRYMdj+2oyEasIr8=;
 b=QRuUpR7fe5b6KQBbrm5CJpf+ld0Qdmum4wKPR1jUB+VQRr9GS6e7oJ5ulOSoALkGRP
 ovpTcXb4G9btECrBBzgf45fxCMM2GXv30izjPgnZKuYLFrpwe3HXhZDQB73XVrAejJxD
 IgfII4Z9jaY8fPVzbtqxbOwVsCvGiB0RF4Mffv1td7BVKS1Kx0JJZAXyrkGkivyiYA63
 hsgbC0KTmy8G9zVu3WhXcfLq7dYt6rebWJmZYOhXohOw40uDx9fx1rlyjCam74q3M300
 OpJon9kmObZYZt7VkAjWX8Hir7yRWcNZaLM02mxdF6GX3sH1HnSt2LSrmWpaGI1AehdZ
 m5iA==
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
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgcm9vdCBLY29uZmlnIGFuZApNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBh
Y3R1YWxseSBidWlsdC4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+ClJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2Fu
Z0BkZWx0YXRlZS5jb20+Ci0tLQogS2NvbmZpZyAgfCAyICsrCiBNYWtlZmlsZSB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvS2NvbmZpZyBiL0tjb25maWcKaW5kZXggNDhhODBiZWFiNjg1My4uMTA0Mjg1MDFlZGI3OCAx
MDA2NDQKLS0tIGEvS2NvbmZpZworKysgYi9LY29uZmlnCkBAIC0zMCwzICszMCw1IEBAIHNvdXJj
ZSAiY3J5cHRvL0tjb25maWciCiBzb3VyY2UgImxpYi9LY29uZmlnIgogCiBzb3VyY2UgImxpYi9L
Y29uZmlnLmRlYnVnIgorCitzb3VyY2UgImt1bml0L0tjb25maWciCmRpZmYgLS1naXQgYS9NYWtl
ZmlsZSBiL01ha2VmaWxlCmluZGV4IGI4MWUxNzI2MTI1MDcuLjRiNTQ0YThlZWJlZTQgMTAwNjQ0
Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC05OTEsNyArOTkxLDcgQEAgZW5kaWYK
IFBIT05ZICs9IHByZXBhcmUwCiAKIGlmZXEgKCQoS0JVSUxEX0VYVE1PRCksKQotY29yZS15CQkr
PSBrZXJuZWwvIGNlcnRzLyBtbS8gZnMvIGlwYy8gc2VjdXJpdHkvIGNyeXB0by8gYmxvY2svCitj
b3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5cHRvLyBi
bG9jay8ga3VuaXQvCiAKIHZtbGludXgtZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIg
JS8sICQoaW5pdC15KSAkKGluaXQtbSkgXAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChk
cml2ZXJzLXkpICQoZHJpdmVycy1tKSBcCi0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
