Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F4B9A22
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2019 01:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097556FE21;
	Fri, 20 Sep 2019 23:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5CD6FE20
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 23:19:56 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id x5so5400129pln.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 16:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iAt6nbLOTb6MSd0OQpor+vgL4LVt0KITsii11UOE388=;
 b=beydc/ZyvtBfxiQ229xDRevwxis1z9YGbColfS7FkFGMkGt1AFaua9Hw1ah5rvaBec
 Y7Qccntlsr7QumS6amvfTe6jZ0kIG70KYBXUuPB0SsAyCAE3au2LvTtS0Hdk6Jkq6V2g
 V1V9nIZ4OvtVcQ+dd/10KZSBKL/eeHWyrCzA+cAZMSkQAPFPYktm7ukabeF/W4g3xIDj
 aZLrIIA1LIncCrAoND2EP2/rDWEb6Yu8YYFOzrjnzXkeTsY4fJV+0wqqzHQRNKZGSTcg
 VEFXJT9iKMaS/349RBPDFlFd+p4bWQtcp+Gp6876VE3ZJ+bT8EZka5LZcVr+T3BFJXZ7
 CkmA==
X-Gm-Message-State: APjAAAV1OCixubJy1SMLMTnZJBZGWnpjUf9FHbSq9OKpfwpXRZtUuHdf
 Nyst8WzNvBZhkkcMSHtQkAa0elvhJTNXEPof28dR6w==
X-Google-Smtp-Source: APXvYqwvNWfMwXT5OHmC0FOVMC3AvIVvQINgZf/DTvElVJK0vl4Su5PZQX9OXJ1XdFr+Yzg+uGF0Z+1UbeiJPCoJbgdZWw==
X-Received: by 2002:a65:4145:: with SMTP id x5mr4101853pgp.259.1569021595251; 
 Fri, 20 Sep 2019 16:19:55 -0700 (PDT)
Date: Fri, 20 Sep 2019 16:19:10 -0700
In-Reply-To: <20190920231923.141900-1-brendanhiggins@google.com>
Message-Id: <20190920231923.141900-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190920231923.141900-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v16 06/19] lib: enable building KUnit in lib/
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=iAt6nbLOTb6MSd0OQpor+vgL4LVt0KITsii11UOE388=;
 b=AYjtMTJ/bM129CXuepq5nEai9unWmuv9KrBsNEIaNyPvQ4Lt9h0LEysSES4HAewjdy
 29QdHAI+HmjwUpZpOFfp+65UA1AXawPyQBrV9eC7bzwv+iTdkaID8+C2RbUTQ424wFXU
 ikBwbFbcoWCNie+/3MBIfmo5PilLysY1O2sVT4F+CzBPblIy6HgcB1k/q+DaLNKLnOPG
 KGhX19FC/G+6Iq+SUJYyTo1TyMfAp7OPjYNGjrMoMDGT8Lcrz3+Do8Yd4VbmfMqldrGC
 31xONjlg/4CyE/OtZ+d8kznbXo+3NUSFplR4NcCXIsv/+7PDrkmrSqkTzl+KSxrv6PXb
 yRPA==
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
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org,
 julia.lawall@lip6.fr, kunit-dev@googlegroups.com, richard@nod.at,
 torvalds@linux-foundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgbGliIEtjb25maWcgYW5kCk1ha2VmaWxlIHRvIGFsbG93IGl0IHRvIGJlIGFj
dHVhbGx5IGJ1aWx0LgoKU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgpDYzogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+
CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWFzYWhp
cm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KQ2M6IEtlZXMgQ29vayA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgotLS0KIGxpYi9LY29uZmlnLmRlYnVnIHwgMiArKwogbGli
L01ha2VmaWxlICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIvbGliL0tjb25maWcuZGVidWcKaW5kZXgg
NTk2MGUyOTgwYThhLi41ODcwZmJlMTFlOWIgMTAwNjQ0Ci0tLSBhL2xpYi9LY29uZmlnLmRlYnVn
CisrKyBiL2xpYi9LY29uZmlnLmRlYnVnCkBAIC0yMTQ0LDQgKzIxNDQsNiBAQCBjb25maWcgSU9f
U1RSSUNUX0RFVk1FTQogCiBzb3VyY2UgImFyY2gvJChTUkNBUkNIKS9LY29uZmlnLmRlYnVnIgog
Citzb3VyY2UgImxpYi9rdW5pdC9LY29uZmlnIgorCiBlbmRtZW51ICMgS2VybmVsIGhhY2tpbmcK
ZGlmZiAtLWdpdCBhL2xpYi9NYWtlZmlsZSBiL2xpYi9NYWtlZmlsZQppbmRleCAyOWMwMmE5MjQ5
NzMuLjY3ZTc5ZDM3MjRlZCAxMDA2NDQKLS0tIGEvbGliL01ha2VmaWxlCisrKyBiL2xpYi9NYWtl
ZmlsZQpAQCAtOTYsNiArOTYsOCBAQCBvYmotJChDT05GSUdfVEVTVF9NRU1JTklUKSArPSB0ZXN0
X21lbWluaXQubwogCiBvYmotJChDT05GSUdfVEVTVF9MSVZFUEFUQ0gpICs9IGxpdmVwYXRjaC8K
IAorb2JqLSQoQ09ORklHX0tVTklUKSArPSBrdW5pdC8KKwogaWZlcSAoJChDT05GSUdfREVCVUdf
S09CSkVDVCkseSkKIENGTEFHU19rb2JqZWN0Lm8gKz0gLURERUJVRwogQ0ZMQUdTX2tvYmplY3Rf
dWV2ZW50Lm8gKz0gLURERUJVRwotLSAKMi4yMy4wLjM1MS5nYzQzMTcwMzJlNi1nb29nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
