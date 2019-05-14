Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7581C21C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 07:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B10A89276;
	Tue, 14 May 2019 05:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D5089276
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 05:44:13 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id r75so3068834pfc.15
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 22:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hN9qf7+RrypIPHqUONQZmMGddOrdEANVDvigURbu6dA=;
 b=n0P7iuiS76iZqRH6R4SyUv6ihWdJutgNjkWrzvO2w6LTb/Sfkl5QLyGq8O4aIYebV1
 s/DTV7bIN5OjM28U9N9KRJc5J2t3rso3+YleQy4UOWPhmKXGVbEBt/LOk7PaKpQ6Mlj4
 IdIc6JpqKGUKbnQZGS1JPF7gB4RjdBrmHVV7DJ8zZyGBFtCsHD9GaGWZ7i2rcmxWEs3U
 vNz9+ebcJJRX+OPh4TicC+YKqujf4KrE2PLOkO80S9Gb3tSpLxXiy/iO3ydMo3vpl2HR
 y0nBp5DQG+Icq8xcOwEaHQr4BlznqgfDvLedZCsnoUA3zShdQz1FoHp1n+g7aW6konNf
 nNFQ==
X-Gm-Message-State: APjAAAVKAHUFbsOkLCalyWkKIdxDFxu7OP6Wnku7Jl8rZp7rBmNjHVjB
 /oN+zMDkJ/EKsOK+p/B1culhkHmI72TlvLLCvUTIzg==
X-Google-Smtp-Source: APXvYqypLujpnV/Vdl1pYHMXICHGFoX6Lv2fPwDbCH6fHgKJkPC2sx/Vc0HPXqG6cBw7dhDlnlPRD7bdIYYvS4bGxpiVHg==
X-Received: by 2002:a63:8741:: with SMTP id i62mr35837456pge.313.1557812653206; 
 Mon, 13 May 2019 22:44:13 -0700 (PDT)
Date: Mon, 13 May 2019 22:42:39 -0700
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
Message-Id: <20190514054251.186196-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514054251.186196-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v3 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, 
 yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=hN9qf7+RrypIPHqUONQZmMGddOrdEANVDvigURbu6dA=;
 b=qpNcWD3Y0kl9+eBKEvbxHFNU7HSbifNewSYRx7Bf6o8l7Ke6/csSYyO5zv2WxAMwCw
 1clrx6usnqE/8tMeKdicTsHMdxaZhGE855zAfB2p5ktCxpqm1UvjHy6jbopoVHrKXTJu
 7XToK69m2OAEcktEp/sBKtsjQNLSLcqQn8GVwbQygY2DUZPUX/dOS5KbgqmQtNUtZYCp
 wrnJaamR7NoH4ePJwr456aJvpPNQSuIxVgAj7VigLO+2F4t6B5mXO5pvBmfaC8rN7V+L
 Ao7V5ERz7Y4bh1lVVQIOh9Hgtblw6vSKRA0X1/2C5pRc1A4nWNmmsMlR061f9/7kgHWi
 mU4w==
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
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIEtVbml0IHRvIHJvb3QgS2NvbmZpZyBhbmQgTWFrZWZpbGUgYWxsb3dpbmcgaXQgdG8gYWN0
dWFsbHkgYmUgYnVpbHQuCgpTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgpSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dh
bmdAZGVsdGF0ZWUuY29tPgotLS0KQ2hhbmdlcyBTaW5jZSBMYXN0IFJldmlzaW9uOgogLSBNYXNh
aGlybyByZXBvcnRlZCBhIG51bWJlciBvZiBpc3N1ZXMgaGVyZSBvbiB0aGUgcHJldmlvdXMgcmV2
aXNpb247CiAgIGhvd2V2ZXIsIGFsbCBvZiB0aGUgY2hhbmdlcyBhY3R1YWxseSBuZWVkZWQgdG8g
aGFwcGVuIG9uIGVhcmxpZXIgb3IKICAgbGF0ZXIgcGF0Y2hlcy4KLS0tCiBLY29uZmlnICB8IDIg
KysKIE1ha2VmaWxlIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCA0OGE4MGJl
YWI2ODUzLi4xMDQyODUwMWVkYjc4IDEwMDY0NAotLS0gYS9LY29uZmlnCisrKyBiL0tjb25maWcK
QEAgLTMwLDMgKzMwLDUgQEAgc291cmNlICJjcnlwdG8vS2NvbmZpZyIKIHNvdXJjZSAibGliL0tj
b25maWciCiAKIHNvdXJjZSAibGliL0tjb25maWcuZGVidWciCisKK3NvdXJjZSAia3VuaXQvS2Nv
bmZpZyIKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggMjZjOTJmODkyZDI0
Yi4uMmVhODdhOGZlNzcwZCAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAg
LTk2OSw3ICs5NjksNyBAQCBlbmRpZgogUEhPTlkgKz0gcHJlcGFyZTAKIAogaWZlcSAoJChLQlVJ
TERfRVhUTU9EKSwpCi1jb3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1
cml0eS8gY3J5cHRvLyBibG9jay8KK2NvcmUteQkJKz0ga2VybmVsLyBjZXJ0cy8gbW0vIGZzLyBp
cGMvIHNlY3VyaXR5LyBjcnlwdG8vIGJsb2NrLyBrdW5pdC8KIAogdm1saW51eC1kaXJzCTo9ICQo
cGF0c3Vic3QgJS8sJSwkKGZpbHRlciAlLywgJChpbml0LXkpICQoaW5pdC1tKSBcCiAJCSAgICAg
JChjb3JlLXkpICQoY29yZS1tKSAkKGRyaXZlcnMteSkgJChkcml2ZXJzLW0pIFwKLS0gCjIuMjEu
MC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
