Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A947CFF919
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA406E364;
	Sun, 17 Nov 2019 11:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C9F6E25F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 07:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id EB462263A26
Received: by earth.universe (Postfix, from userid 1000)
 id 446983C0CAD; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Date: Sun, 17 Nov 2019 03:40:19 +0100
Message-Id: <20191117024028.2233-34-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuIHNpbXBseSB1c2UgdGhlIGF0b21pYyBoZWxwZXIgZm9yCmhhbmRsaW5nIHRoZSBkaXJ0
eWZiIGNhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlh
bi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9jcnRjLmMgfCAgNiArLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5o
IHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jICAgfCAyMSArKy0tLS0t
LS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5jCmluZGV4IDgwZWQxYjE1YmE0
OS4uMjEyOWNiYTdmNGUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuYwpAQCAtMzQ2
LDEzICszNDYsOSBAQCB2b2lkIG9tYXBfY3J0Y19mcmFtZWRvbmVfaXJxKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywgdWludDMyX3QgaXJxc3RhdHVzKQogCXdha2VfdXAoJm9tYXBfY3J0Yy0+cGVuZGlu
Z193YWl0KTsKIH0KIAotdm9pZCBvbWFwX2NydGNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRj
KQorc3RhdGljIHZvaWQgb21hcF9jcnRjX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIHsK
IAlzdHJ1Y3Qgb21hcF9jcnRjICpvbWFwX2NydGMgPSB0b19vbWFwX2NydGMoY3J0Yyk7Ci0Jc3Ry
dWN0IG9tYXBfY3J0Y19zdGF0ZSAqb21hcF9zdGF0ZSA9IHRvX29tYXBfY3J0Y19zdGF0ZShjcnRj
LT5zdGF0ZSk7Ci0KLQlpZiAoIW9tYXBfc3RhdGUtPm1hbnVhbGx5X3VwZGF0ZWQpCi0JCXJldHVy
bjsKIAogCWlmICghZGVsYXllZF93b3JrX3BlbmRpbmcoJm9tYXBfY3J0Yy0+dXBkYXRlX3dvcmsp
KQogCQlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJm9tYXBfY3J0Yy0+dXBkYXRlX3dvcmssIDApOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmggYi9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuaAppbmRleCAyZmQ1Nzc1MWFlMmIuLmZlODhmNzhm
OTcxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmgKQEAgLTMxLDYgKzMxLDUgQEAg
aW50IG9tYXBfY3J0Y193YWl0X3BlbmRpbmcoc3RydWN0IGRybV9jcnRjICpjcnRjKTsKIHZvaWQg
b21hcF9jcnRjX2Vycm9yX2lycShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHUzMiBpcnFzdGF0dXMp
Owogdm9pZCBvbWFwX2NydGNfdmJsYW5rX2lycShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOwogdm9p
ZCBvbWFwX2NydGNfZnJhbWVkb25lX2lycShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHVpbnQzMl90
IGlycXN0YXR1cyk7Ci12b2lkIG9tYXBfY3J0Y19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMp
OwogCiAjZW5kaWYgLyogX19PTUFQRFJNX0NSVENfSF9fICovCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2ZiLmMKaW5kZXggOWFlYWI4MWRmYjkwLi5iMGU5NzI5NDUyNTIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2ZiLmMKQEAgLTksNiArOSw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rlc2V0X2hl
bHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9n
ZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kYW1hZ2VfaGVscGVy
Lmg+CiAKICNpbmNsdWRlICJvbWFwX2RtbV90aWxlci5oIgogI2luY2x1ZGUgIm9tYXBfZHJ2Lmgi
CkBAIC01NSwyOCArNTYsMTAgQEAgc3RydWN0IG9tYXBfZnJhbWVidWZmZXIgewogCXN0cnVjdCBt
dXRleCBsb2NrOwogfTsKIAotc3RhdGljIGludCBvbWFwX2ZyYW1lYnVmZmVyX2RpcnR5KHN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiLAotCQkJCSAgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYs
Ci0JCQkJICB1bnNpZ25lZCBmbGFncywgdW5zaWduZWQgY29sb3IsCi0JCQkJICBzdHJ1Y3QgZHJt
X2NsaXBfcmVjdCAqY2xpcHMsCi0JCQkJICB1bnNpZ25lZCBudW1fY2xpcHMpCi17Ci0Jc3RydWN0
IGRybV9jcnRjICpjcnRjOwotCi0JZHJtX21vZGVzZXRfbG9ja19hbGwoZmItPmRldik7Ci0KLQlk
cm1fZm9yX2VhY2hfY3J0YyhjcnRjLCBmYi0+ZGV2KQotCQlvbWFwX2NydGNfZmx1c2goY3J0Yyk7
Ci0KLQlkcm1fbW9kZXNldF91bmxvY2tfYWxsKGZiLT5kZXYpOwotCi0JcmV0dXJuIDA7Ci19Ci0K
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIG9tYXBfZnJhbWVidWZm
ZXJfZnVuY3MgPSB7CiAJLmNyZWF0ZV9oYW5kbGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZV9oYW5kbGUs
Ci0JLmRpcnR5ID0gb21hcF9mcmFtZWJ1ZmZlcl9kaXJ0eSwKIAkuZGVzdHJveSA9IGRybV9nZW1f
ZmJfZGVzdHJveSwKKwkuZGlydHkgPSBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiLAogfTsKIAog
c3RhdGljIHUzMiBnZXRfbGluZWFyX2FkZHIoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCi0t
IAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
