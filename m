Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8EB3B5DE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 15:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0431189149;
	Mon, 10 Jun 2019 13:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1355289149
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:19:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: koike) with ESMTPSA id 8868A261136
From: Helen Koike <helen.koike@collabora.com>
To: stable@vger.kernel.org
Subject: [PATCH v5] drm/vc4: fix fb references in async update
Date: Mon, 10 Jun 2019 10:18:59 -0300
Message-Id: <20190610131859.7616-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156007492924468@kroah.com>
References: <156007492924468@kroah.com>
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
Cc: gregkh@linuxfoundation.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y29tbWl0IGMxNmI4NTU1OWRjZmI1YTM0OGNjMDg1YTdiNGM3NWVkNDliMDVlMmMgdXBzdHJlYW0u
CgpBc3luYyB1cGRhdGUgY2FsbGJhY2tzIGFyZSBleHBlY3RlZCB0byBzZXQgdGhlIG9sZF9mYiBp
biB0aGUgbmV3X3N0YXRlCnNvIHByZXBhcmUvY2xlYW51cCBmcmFtZWJ1ZmZlcnMgYXJlIGJhbGFu
Y2VkLgoKQ2FsbGluZyBkcm1fYXRvbWljX3NldF9mYl9mb3JfcGxhbmUoKSAod2hpY2ggZ2V0cyBh
IHJlZmVyZW5jZSBvZiB0aGUgbmV3CmZiIGFuZCBwdXQgdGhlIG9sZCBmYikgaXMgbm90IHJlcXVp
cmVkLCBhcyBpdCdzIHRha2VuIGNhcmUgYnkKZHJtX21vZGVfY3Vyc29yX3VuaXZlcnNhbCgpIHdo
ZW4gY2FsbGluZyBkcm1fYXRvbWljX2hlbHBlcl91cGRhdGVfcGxhbmUoKS4KCkNjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyB2NC4xOSsKRml4ZXM6IDUzOWMzMjBiZmE5NyAoImRybS92YzQ6
IHVwZGF0ZSBjdXJzb3JzIGFzeW5jaHJvbm91c2x5IHRocm91Z2ggYXRvbWljIikKU3VnZ2VzdGVk
LWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBIZWxlbiBLb2lrZSA8aGVsZW4ua29pa2VAY29sbGFib3JhLmNvbT4KUmV2aWV3
ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ClNp
Z25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDE5MDYwMzE2NTYxMC4yNDYxNC01LWhlbGVuLmtvaWtlQGNvbGxhYm9yYS5jb20KLS0tCgpIaSwK
ClRoaXMgcGF0Y2ggZmFpbGVkIHRvIGFwcGx5IG9uIGtlcm5lbCBzdGFibGUgdjQuMTksIEknbSBy
ZS1zZW5kaW5nIGl0CmZpeGluZyB0aGUgY29uZmxpY3QuCgpUaGFua3MKSGVsZW4KCiBkcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYwppbmRleCBhYjM5MzE1YzkwNzguLjM5ZTYwODI3
MTI2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCkBAIC04MTgsNiArODE4LDcgQEAgc3RhdGlj
IHZvaWQgdmM0X3BsYW5lX2F0b21pY19hc3luY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsCiAJCWRybV9hdG9taWNfc2V0X2ZiX2Zvcl9wbGFuZShwbGFuZS0+c3RhdGUsIHN0YXRlLT5m
Yik7CiAJfQogCisJc3dhcChwbGFuZS0+c3RhdGUtPmZiLCBzdGF0ZS0+ZmIpOwogCS8qIFNldCB0
aGUgY3Vyc29yJ3MgcG9zaXRpb24gb24gdGhlIHNjcmVlbi4gIFRoaXMgaXMgdGhlCiAJICogZXhw
ZWN0ZWQgY2hhbmdlIGZyb20gdGhlIGRybV9tb2RlX2N1cnNvcl91bml2ZXJzYWwoKQogCSAqIGhl
bHBlci4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
