Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A03C2436
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 17:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14B16E46F;
	Mon, 30 Sep 2019 15:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D70F66E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 15:25:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80D891000;
 Mon, 30 Sep 2019 08:25:29 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E29F3F706;
 Mon, 30 Sep 2019 08:25:28 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com,
	sudeep.holla@arm.com
Subject: [PATCH 2/2] drm/panfrost: Use coherent pagetable walk on Juno
Date: Mon, 30 Sep 2019 16:24:59 +0100
Message-Id: <1e499f85220b735849126171e64ebdd1da0302ce.1569856049.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWx0aG91Z2ggZ29pbmcgZnVsbCAiZG1hLWNvaGVyZW50IiBlbmRzIGJhZGx5IGR1ZSB0byBHRU0g
b2JqZWN0cyBzdGlsbApiZWluZyBmb3JjaWJseSBtYXBwZWQgbm9uLWNhY2hlYWJsZSwgd2UgY2Fu
IGF0IGxlYXN0IHRha2UgYWR2YW50YWdlIG9mCkp1bm8ncyBBQ0UtbGl0ZSBpbnRlZ3JhdGlvbiB0
byBza2lwIGNhY2hlIG1haW50ZW5hbmNlIGZvciBwYWdldGFibGVzLgoKQ0M6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+CkNDOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJv
cmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29t
PgotLS0KClRoaXMgaXNuJ3QgcmVhbGx5IG1lYW50IGFzIGEgc2VyaWVzLCBJJ20ganVzdCBzZW5k
aW5nIGl0IHRvZ2V0aGVyCndpdGggcGF0Y2ggIzEgZm9yIGNvbnRleHQuCgogZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKaW5kZXgg
YmRkOTkwNTY4NDc2Li41NjA0MzlmNjMyNzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfbW11LmMKQEAgLTM2NSw2ICszNjUsOSBAQCBpbnQgcGFuZnJvc3RfbW11X3BndGFibGVf
YWxsb2Moc3RydWN0IHBhbmZyb3N0X2ZpbGVfcHJpdiAqcHJpdikKIAkJLmlvbW11X2Rldgk9IHBm
ZGV2LT5kZXYsCiAJfTsKIAorCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShwZmRldi0+ZGV2
LT5vZl9ub2RlLCAiYXJtLGp1bm8tbWFsaSIpKQorCQlwZmRldi0+bW11LT5wZ3RibF9jZmcuY29o
ZXJlbnRfd2FsayA9IHRydWU7CisKIAltbXUtPnBndGJsX29wcyA9IGFsbG9jX2lvX3BndGFibGVf
b3BzKEFSTV9NQUxJX0xQQUUsICZtbXUtPnBndGJsX2NmZywKIAkJCQkJICAgICAgcHJpdik7CiAJ
aWYgKCFtbXUtPnBndGJsX29wcykKLS0gCjIuMjEuMC5kaXJ0eQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
