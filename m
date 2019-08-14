Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B38E6A6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBB46E909;
	Thu, 15 Aug 2019 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 936 seconds by postgrey-1.36 at gabe;
 Wed, 14 Aug 2019 04:59:44 UTC
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DE8898A4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 04:59:44 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5C997CF11AF697350998;
 Wed, 14 Aug 2019 12:44:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 12:43:59 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH -next] drm/panfrost: Fix missing unlock on error in
 panfrost_mmu_map_fault_addr()
Date: Wed, 14 Aug 2019 04:48:14 +0000
Message-ID: <20190814044814.102294-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBtaXNzaW5nIHVubG9jayBiZWZvcmUgcmV0dXJuIGZyb20gZnVuY3Rpb24gcGFuZnJv
c3RfbW11X21hcF9mYXVsdF9hZGRyKCkKaW4gdGhlIGVycm9yIGhhbmRsaW5nIGNhc2UuCgpGaXhl
czogMTg3ZDI5MjkyMDZlICgiZHJtL3BhbmZyb3N0OiBBZGQgc3VwcG9ydCBmb3IgR1BVIGhlYXAg
YWxsb2NhdGlvbnMiKQpTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVh
d2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA1
ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCmluZGV4IDJlZDQxMWYwOWQ4MC4u
MDZmMWE1NjNlOTQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfbW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCkBA
IC0zMjcsMTQgKzMyNywxNyBAQCBpbnQgcGFuZnJvc3RfbW11X21hcF9mYXVsdF9hZGRyKHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBpbnQgYXMsIHU2NCBhZGRyKQogCWlmICghYm8tPmJh
c2UucGFnZXMpIHsKIAkJYm8tPnNndHMgPSBrdm1hbGxvY19hcnJheShiby0+YmFzZS5iYXNlLnNp
emUgLyBTWl8yTSwKIAkJCQkgICAgIHNpemVvZihzdHJ1Y3Qgc2dfdGFibGUpLCBHRlBfS0VSTkVM
IHwgX19HRlBfWkVSTyk7Ci0JCWlmICghYm8tPnNndHMpCisJCWlmICghYm8tPnNndHMpIHsKKwkJ
CW11dGV4X3VubG9jaygmYm8tPmJhc2UucGFnZXNfbG9jayk7CiAJCQlyZXR1cm4gLUVOT01FTTsK
KwkJfQogCiAJCXBhZ2VzID0ga3ZtYWxsb2NfYXJyYXkoYm8tPmJhc2UuYmFzZS5zaXplID4+IFBB
R0VfU0hJRlQsCiAJCQkJICAgICAgIHNpemVvZihzdHJ1Y3QgcGFnZSAqKSwgR0ZQX0tFUk5FTCB8
IF9fR0ZQX1pFUk8pOwogCQlpZiAoIXBhZ2VzKSB7CiAJCQlrZnJlZShiby0+c2d0cyk7CiAJCQli
by0+c2d0cyA9IE5VTEw7CisJCQltdXRleF91bmxvY2soJmJvLT5iYXNlLnBhZ2VzX2xvY2spOwog
CQkJcmV0dXJuIC1FTk9NRU07CiAJCX0KIAkJYm8tPmJhc2UucGFnZXMgPSBwYWdlczsKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
