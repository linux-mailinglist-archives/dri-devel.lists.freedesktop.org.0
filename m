Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119C7C1EF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 14:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD5889A75;
	Wed, 31 Jul 2019 12:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABE989728
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 12:44:25 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EAFE217D4;
 Wed, 31 Jul 2019 12:44:25 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Richard Gong <richard.gong@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 09/10] video: fbdev: w100fb: convert platform driver to use
 dev_groups
Date: Wed, 31 Jul 2019 14:43:48 +0200
Message-Id: <20190731124349.4474-10-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731124349.4474-1-gregkh@linuxfoundation.org>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564577065;
 bh=WkqAHanTxQx5yUJI8jkG4KR2Oxhqk5ywNQpUPn5vZ0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IeGNaHqO7mU7FVNZgLJgpD1nSBX+og+oFJK8Lv70p6INJwOHscvf3U50pBreu3WaC
 gadW9vLuBIPrHaP36YcZaIAw9E3xLPWA4pPXwBZy5n9fdcSie6vqxP5wzl5RiCJfdu
 sU7JqBxB+9Ut+zINEm3Qivs89aq6PTpwxdTuHKvU=
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Tony Prisk <linux@prisktech.co.nz>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxhdGZvcm0gZHJpdmVycyBub3cgaGF2ZSB0aGUgb3B0aW9uIHRvIGhhdmUgdGhlIHBsYXRmb3Jt
IGNvcmUgY3JlYXRlCmFuZCByZW1vdmUgYW55IG5lZWRlZCBzeXNmcyBhdHRyaWJ1dGUgZmlsZXMu
ICBTbyB0YWtlIGFkdmFudGFnZSBvZiB0aGF0CmFuZCBkbyBub3QgcmVnaXN0ZXIgImJ5IGhhbmQi
IGEgYnVuY2ggb2Ygc3lzZnMgZmlsZXMuCgpDYzogVG9ueSBQcmlzayA8bGludXhAcHJpc2t0ZWNo
LmNvLm56PgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5v
cmcKQWNrZWQtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1z
dW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3cxMDBmYi5jIHwgMjMgKysr
KysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3cxMDBmYi5j
IGIvZHJpdmVycy92aWRlby9mYmRldi93MTAwZmIuYwppbmRleCA1OTdmZmFhMTNjZDIuLjNiZTA3
ODA3ZWRjZCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi93MTAwZmIuYworKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3cxMDBmYi5jCkBAIC0xNjQsNiArMTY0LDE1IEBAIHN0YXRpYyBz
c2l6ZV90IGZhc3RwbGxjbGtfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
X2F0dHJpYnV0ZSAqYXR0CiAKIHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhmYXN0cGxsY2xrKTsKIAor
c3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKncxMDBmYl9hdHRyc1tdID0geworCSZkZXZfYXR0cl9m
YXN0cGxsY2xrLmF0dHIsCisJJmRldl9hdHRyX3JlZ19yZWFkLmF0dHIsCisJJmRldl9hdHRyX3Jl
Z193cml0ZS5hdHRyLAorCSZkZXZfYXR0cl9mbGlwLmF0dHIsCisJTlVMTCwKK307CitBVFRSSUJV
VEVfR1JPVVBTKHcxMDBmYik7CisKIC8qCiAgKiBTb21lIHRvdWNoc2NyZWVucyBuZWVkIGhzeW5j
IGluZm9ybWF0aW9uIGZyb20gdGhlIHZpZGVvIGRyaXZlciB0bwogICogZnVuY3Rpb24gY29ycmVj
dGx5LiBXZSBleHBvcnQgaXQgaGVyZS4KQEAgLTc1MiwxNCArNzYxLDYgQEAgaW50IHcxMDBmYl9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIG91dDsKIAl9CiAKLQll
cnIgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRyX2Zhc3RwbGxjbGsp
OwotCWVyciB8PSBkZXZpY2VfY3JlYXRlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRyX3JlZ19y
ZWFkKTsKLQllcnIgfD0gZGV2aWNlX2NyZWF0ZV9maWxlKCZwZGV2LT5kZXYsICZkZXZfYXR0cl9y
ZWdfd3JpdGUpOwotCWVyciB8PSBkZXZpY2VfY3JlYXRlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9h
dHRyX2ZsaXApOwotCi0JaWYgKGVyciAhPSAwKQotCQlmYl93YXJuKGluZm8sICJmYWlsZWQgdG8g
cmVnaXN0ZXIgYXR0cmlidXRlcyAoJWQpXG4iLCBlcnIpOwotCiAJZmJfaW5mbyhpbmZvLCAiJXMg
ZnJhbWUgYnVmZmVyIGRldmljZVxuIiwgaW5mby0+Zml4LmlkKTsKIAlyZXR1cm4gMDsKIG91dDoK
QEAgLTc4NCwxMSArNzg1LDYgQEAgc3RhdGljIGludCB3MTAwZmJfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGZiX2luZm8gKmluZm8gPSBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgdzEwMGZiX3BhciAqcGFyPWluZm8tPnBhcjsKIAotCWRl
dmljZV9yZW1vdmVfZmlsZSgmcGRldi0+ZGV2LCAmZGV2X2F0dHJfZmFzdHBsbGNsayk7Ci0JZGV2
aWNlX3JlbW92ZV9maWxlKCZwZGV2LT5kZXYsICZkZXZfYXR0cl9yZWdfcmVhZCk7Ci0JZGV2aWNl
X3JlbW92ZV9maWxlKCZwZGV2LT5kZXYsICZkZXZfYXR0cl9yZWdfd3JpdGUpOwotCWRldmljZV9y
ZW1vdmVfZmlsZSgmcGRldi0+ZGV2LCAmZGV2X2F0dHJfZmxpcCk7Ci0KIAl1bnJlZ2lzdGVyX2Zy
YW1lYnVmZmVyKGluZm8pOwogCiAJdmZyZWUocGFyLT5zYXZlZF9pbnRtZW0pOwpAQCAtMTYyNSw2
ICsxNjIxLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdzEwMGZiX2RyaXZlciA9
IHsKIAkucmVzdW1lCQk9IHcxMDBmYl9yZXN1bWUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCT0g
IncxMDBmYiIsCisJCS5kZXZfZ3JvdXBzCT0gdzEwMGZiX2dyb3VwcywKIAl9LAogfTsKIAotLSAK
Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
