Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B018D5F4D5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C478E6E30D;
	Thu,  4 Jul 2019 08:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CDE6E30D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:47:04 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 090A3218BC;
 Thu,  4 Jul 2019 08:47:03 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] video: fbdev: w100fb: convert platform driver to use
 dev_groups
Date: Thu,  4 Jul 2019 10:46:14 +0200
Message-Id: <20190704084617.3602-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704084617.3602-1-gregkh@linuxfoundation.org>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562230024;
 bh=zxScwFkLjiixqdeZRh7a5dXv8jDdQ8T3PHXavOyUF88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dv6zzAeEQOLrSruoBnVNVkmd1VvWZ2P/o3R8uv4G3LheVuxIeaLnayVa+Wg0bHN40
 Vzq//RNvbEZmNAWyoAv35LneKIUggwAXGlWL5w34unYMha2SjdH34WS2Vg6+MY6SYz
 NJzaOTuLMWTPi+zxqcoS2IylbU2vM4unYytSg4X0=
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
LmNvLm56PgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1
bmcuY29tPgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5v
cmcKU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3cxMDBmYi5jIHwgMjMgKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3cxMDBmYi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi93MTAwZmIuYwppbmRleCA2OTYxMDZlY2RmZjAuLjRiZTNhZmNjMWM5
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi93MTAwZmIuYworKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3cxMDBmYi5jCkBAIC0xNjgsNiArMTY4LDE1IEBAIHN0YXRpYyBzc2l6ZV90
IGZhc3RwbGxjbGtfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJp
YnV0ZSAqYXR0CiAKIHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhmYXN0cGxsY2xrKTsKIAorc3RhdGlj
IHN0cnVjdCBhdHRyaWJ1dGUgKncxMDBmYl9hdHRyc1tdID0geworCSZkZXZfYXR0cl9mYXN0cGxs
Y2xrLmF0dHIsCisJJmRldl9hdHRyX3JlZ19yZWFkLmF0dHIsCisJJmRldl9hdHRyX3JlZ193cml0
ZS5hdHRyLAorCSZkZXZfYXR0cl9mbGlwLmF0dHIsCisJTlVMTCwKK307CitBVFRSSUJVVEVfR1JP
VVBTKHcxMDBmYik7CisKIC8qCiAgKiBTb21lIHRvdWNoc2NyZWVucyBuZWVkIGhzeW5jIGluZm9y
bWF0aW9uIGZyb20gdGhlIHZpZGVvIGRyaXZlciB0bwogICogZnVuY3Rpb24gY29ycmVjdGx5LiBX
ZSBleHBvcnQgaXQgaGVyZS4KQEAgLTc1NiwxNCArNzY1LDYgQEAgaW50IHcxMDBmYl9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIG91dDsKIAl9CiAKLQllcnIgPSBk
ZXZpY2VfY3JlYXRlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRyX2Zhc3RwbGxjbGspOwotCWVy
ciB8PSBkZXZpY2VfY3JlYXRlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRyX3JlZ19yZWFkKTsK
LQllcnIgfD0gZGV2aWNlX2NyZWF0ZV9maWxlKCZwZGV2LT5kZXYsICZkZXZfYXR0cl9yZWdfd3Jp
dGUpOwotCWVyciB8PSBkZXZpY2VfY3JlYXRlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRyX2Zs
aXApOwotCi0JaWYgKGVyciAhPSAwKQotCQlmYl93YXJuKGluZm8sICJmYWlsZWQgdG8gcmVnaXN0
ZXIgYXR0cmlidXRlcyAoJWQpXG4iLCBlcnIpOwotCiAJZmJfaW5mbyhpbmZvLCAiJXMgZnJhbWUg
YnVmZmVyIGRldmljZVxuIiwgaW5mby0+Zml4LmlkKTsKIAlyZXR1cm4gMDsKIG91dDoKQEAgLTc4
OCwxMSArNzg5LDYgQEAgc3RhdGljIGludCB3MTAwZmJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJc3RydWN0IGZiX2luZm8gKmluZm8gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsKIAlzdHJ1Y3QgdzEwMGZiX3BhciAqcGFyPWluZm8tPnBhcjsKIAotCWRldmljZV9y
ZW1vdmVfZmlsZSgmcGRldi0+ZGV2LCAmZGV2X2F0dHJfZmFzdHBsbGNsayk7Ci0JZGV2aWNlX3Jl
bW92ZV9maWxlKCZwZGV2LT5kZXYsICZkZXZfYXR0cl9yZWdfcmVhZCk7Ci0JZGV2aWNlX3JlbW92
ZV9maWxlKCZwZGV2LT5kZXYsICZkZXZfYXR0cl9yZWdfd3JpdGUpOwotCWRldmljZV9yZW1vdmVf
ZmlsZSgmcGRldi0+ZGV2LCAmZGV2X2F0dHJfZmxpcCk7Ci0KIAl1bnJlZ2lzdGVyX2ZyYW1lYnVm
ZmVyKGluZm8pOwogCiAJdmZyZWUocGFyLT5zYXZlZF9pbnRtZW0pOwpAQCAtMTYzMCw2ICsxNjI2
LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdzEwMGZiX2RyaXZlciA9IHsKIAku
ZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSAidzEwMGZiIiwKIAl9LAorCS5kZXZfZ3JvdXBzCT0gdzEw
MGZiX2dyb3VwcywKIH07CiAKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIodzEwMGZiX2RyaXZlcik7
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
