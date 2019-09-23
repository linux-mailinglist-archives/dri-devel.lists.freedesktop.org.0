Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4CBB482
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80706E8DC;
	Mon, 23 Sep 2019 12:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393466E8D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:56:04 +0000 (UTC)
Received: from localhost (unknown [192.168.167.227])
 by lucky1.263xmail.com (Postfix) with ESMTP id 109A842F3B;
 Mon, 23 Sep 2019 20:48:19 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P14169T140710336407296S1569242883858959_; 
 Mon, 23 Sep 2019 20:48:19 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c5aed142c552fbfd0a9d05c825523723>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 14/36] drm/tegra: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:47:38 +0800
Message-Id: <1569242880-182878-4-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
References: <1569242880-182878-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kYy5jICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKaW5kZXggZmJm
NTdiYy4uODUwYWVmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKQEAgLTcwNSw3ICs3MDUsNyBAQCBzdGF0aWMg
dm9pZCB0ZWdyYV9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAog
CXdpbmRvdy5kc3QueSA9IHBsYW5lLT5zdGF0ZS0+ZHN0LnkxOwogCXdpbmRvdy5kc3QudyA9IGRy
bV9yZWN0X3dpZHRoKCZwbGFuZS0+c3RhdGUtPmRzdCk7CiAJd2luZG93LmRzdC5oID0gZHJtX3Jl
Y3RfaGVpZ2h0KCZwbGFuZS0+c3RhdGUtPmRzdCk7Ci0Jd2luZG93LmJpdHNfcGVyX3BpeGVsID0g
ZmItPmZvcm1hdC0+Y3BwWzBdICogODsKKwl3aW5kb3cuYml0c19wZXJfcGl4ZWwgPSBmYi0+Zm9y
bWF0LT5icHBbMF07CiAJd2luZG93LmJvdHRvbV91cCA9IHRlZ3JhX2ZiX2lzX2JvdHRvbV91cChm
YikgfHwgc3RhdGUtPmJvdHRvbV91cDsKIAogCS8qIGNvcHkgZnJvbSBzdGF0ZSAqLwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RybS5jCmluZGV4IDZmYjdkNzQuLmVjNmM1YTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKQEAgLTk3Myw3
ICs5NzMsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX2RlYnVnZnNfZnJhbWVidWZmZXJzKHN0cnVjdCBz
ZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKIAkJc2VxX3ByaW50ZihzLCAiJTNkOiB1c2VyIHNpemU6
ICVkIHggJWQsIGRlcHRoICVkLCAlZCBicHAsIHJlZmNvdW50ICVkXG4iLAogCQkJICAgZmItPmJh
c2UuaWQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKIAkJCSAgIGZiLT5mb3JtYXQtPmRlcHRoLAot
CQkJICAgZmItPmZvcm1hdC0+Y3BwWzBdICogOCwKKwkJCSAgIGZiLT5mb3JtYXQtPmJwcFswXSwK
IAkJCSAgIGRybV9mcmFtZWJ1ZmZlcl9yZWFkX3JlZmNvdW50KGZiKSk7CiAJfQogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9m
Yi5jCmluZGV4IGUzNDMyNWMuLmQ1ZjVlMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9mYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jCkBAIC0xNDgsNyArMTQ4
LDcgQEAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqdGVncmFfZmJfY3JlYXRlKHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm0sCiAJCQlnb3RvIHVucmVmZXJlbmNlOwogCQl9CiAKLQkJYnBwID0gaW5mby0+
Y3BwW2ldOworCQlicHAgPSBpbmZvLT5icHBbaV0gLyA4OwogCiAJCXNpemUgPSAoaGVpZ2h0IC0g
MSkgKiBjbWQtPnBpdGNoZXNbaV0gKwogCQkgICAgICAgd2lkdGggKiBicHAgKyBjbWQtPm9mZnNl
dHNbaV07Ci0tIAoyLjcuNAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
