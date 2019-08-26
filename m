Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5F9D2B4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE3D6E239;
	Mon, 26 Aug 2019 15:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEA66E229
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E813428BCD7;
 Mon, 26 Aug 2019 16:26:58 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/21] drm/msm: Use drm_attach_bridge() to attach a bridge
 to an encoder
Date: Mon, 26 Aug 2019 17:26:36 +0200
Message-Id: <20190826152649.13820-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826152649.13820-1-boris.brezillon@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBwYXJ0IG9mIG91ciBhdHRlbXB0IHRvIG1ha2UgdGhlIGJyaWRnZSBjaGFpbiBhIGRv
dWJsZS1saW5rZWQKbGlzdCBiYXNlZCBvbiB0aGUgZ2VuZXJpYyBsaXN0IGhlbHBlcnMuIEluIG9y
ZGVyIHRvIGRvIHRoYXQsIHdlIG11c3QKcGF0Y2ggYWxsIGRyaXZlcnMgbWFuaXB1bGF0aW5nIHRo
ZSBlbmNvZGVyLT5icmlkZ2UgZmllbGQgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoK
KiBBZGQgTGF1cmVudCBhbmQgU2FtIFItYiAod2FpdGluZyBmb3IgYSBSLWIgZnJvbSBhIGRybS9t
c20gbWFpbnRhaW5lcgogIG5vdykKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHAuYyAg
IHwgNCArKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jIHwgNCArKystCiAyIGZp
bGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZWRw
L2VkcC5jCmluZGV4IGI1NDU1OWE3OWQzNi4uYWQ0ZTk2M2NjZDliIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9l
ZHAuYwpAQCAtMTc4LDcgKzE3OCw5IEBAIGludCBtc21fZWRwX21vZGVzZXRfaW5pdChzdHJ1Y3Qg
bXNtX2VkcCAqZWRwLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlnb3RvIGZhaWw7CiAJfQog
Ci0JZW5jb2Rlci0+YnJpZGdlLm5leHQgPSBlZHAtPmJyaWRnZTsKKwlyZXQgPSBkcm1fYnJpZGdl
X2F0dGFjaChlbmNvZGVyLCBlZHAtPmJyaWRnZSwgTlVMTCk7CisJaWYgKHJldCkKKwkJZ290byBm
YWlsOwogCiAJcHJpdi0+YnJpZGdlc1twcml2LT5udW1fYnJpZGdlcysrXSAgICAgICA9IGVkcC0+
YnJpZGdlOwogCXByaXYtPmNvbm5lY3RvcnNbcHJpdi0+bnVtX2Nvbm5lY3RvcnMrK10gPSBlZHAt
PmNvbm5lY3RvcjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jCmluZGV4IDlkOTRhODhkZDhkNi4uNTVi
OWE4YzgzMTJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKQEAgLTMyNyw3ICszMjcsOSBAQCBp
bnQgbXNtX2hkbWlfbW9kZXNldF9pbml0KHN0cnVjdCBoZG1pICpoZG1pLAogCQlnb3RvIGZhaWw7
CiAJfQogCi0JZW5jb2Rlci0+YnJpZGdlLm5leHQgPSBoZG1pLT5icmlkZ2U7CisJcmV0ID0gZHJt
X2JyaWRnZV9hdHRhY2goZW5jb2RlciwgaGRtaS0+YnJpZGdlLCBOVUxMKTsKKwlpZiAocmV0KQor
CQlnb3RvIGZhaWw7CiAKIAlwcml2LT5icmlkZ2VzW3ByaXYtPm51bV9icmlkZ2VzKytdICAgICAg
ID0gaGRtaS0+YnJpZGdlOwogCXByaXYtPmNvbm5lY3RvcnNbcHJpdi0+bnVtX2Nvbm5lY3RvcnMr
K10gPSBoZG1pLT5jb25uZWN0b3I7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
