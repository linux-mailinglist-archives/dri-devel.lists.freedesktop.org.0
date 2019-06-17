Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F6348607
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBA3892EE;
	Mon, 17 Jun 2019 14:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591C9892EA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:51:55 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DF809E0017;
 Mon, 17 Jun 2019 14:51:47 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 10/12] drm/atomic: Add a function to reset connector TV
 properties
Date: Mon, 17 Jun 2019 16:51:37 +0200
Message-Id: <84a7b657f09303a2850e1cc79e68f623547f3fdd.1560783090.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVyaW5nIHRoZSBjb25uZWN0b3IgcmVzZXQsIGlmIHRoYXQgY29ubmVjdG9yIGhhcyBhIFRWIHBy
b3BlcnR5LCBpdCBuZWVkcwp0byBiZSByZXNldCB0byB0aGUgdmFsdWUgcHJvdmlkZWQgb24gdGhl
IGNvbW1hbmQgbGluZS4KClByb3ZpZGUgYSBoZWxwZXIgdG8gZG8gdGhhdC4KClJldmlld2VkLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KU2lnbmVkLW9mZi1ieTogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogaW5j
bHVkZS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuaCAgICAgfCAgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2F0b21pY19zdGF0ZV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRl
X2hlbHBlci5jCmluZGV4IDdkNzM0N2E2ZjE5NC4uNDZkYzI2NGEyNDhiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYwpAQCAtMzgwLDYgKzM4MCwyNCBAQCB2b2lk
IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQogRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVz
ZXQpOwogCiAvKioKKyAqIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldCAtIFJl
c2V0cyBUViBjb25uZWN0b3IgcHJvcGVydGllcworICogQGNvbm5lY3RvcjogRFJNIGNvbm5lY3Rv
cgorICoKKyAqIFJlc2V0cyB0aGUgVFYtcmVsYXRlZCBwcm9wZXJ0aWVzIGF0dGFjaGVkIHRvIGEg
Y29ubmVjdG9yLgorICovCit2b2lkIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNl
dChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQoreworCXN0cnVjdCBkcm1fY21kbGlu
ZV9tb2RlICpjbWRsaW5lID0gJmNvbm5lY3Rvci0+Y21kbGluZV9tb2RlOworCXN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpzdGF0ZSA9IGNvbm5lY3Rvci0+c3RhdGU7CisKKwlzdGF0ZS0+dHYu
bWFyZ2lucy5sZWZ0ID0gY21kbGluZS0+dHZfbWFyZ2lucy5sZWZ0OworCXN0YXRlLT50di5tYXJn
aW5zLnJpZ2h0ID0gY21kbGluZS0+dHZfbWFyZ2lucy5yaWdodDsKKwlzdGF0ZS0+dHYubWFyZ2lu
cy50b3AgPSBjbWRsaW5lLT50dl9tYXJnaW5zLnRvcDsKKwlzdGF0ZS0+dHYubWFyZ2lucy5ib3R0
b20gPSBjbWRsaW5lLT50dl9tYXJnaW5zLmJvdHRvbTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2F0
b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X3Jlc2V0KTsKKworLyoqCiAgKiBfX2RybV9hdG9taWNf
aGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUgLSBjb3B5IGF0b21pYyBjb25uZWN0b3Ig
c3RhdGUKICAqIEBjb25uZWN0b3I6IGNvbm5lY3RvciBvYmplY3QKICAqIEBzdGF0ZTogYXRvbWlj
IGNvbm5lY3RvciBzdGF0ZQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pY19zdGF0
ZV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmgKaW5kZXgg
NGU2ZDJlN2E0MGI4Li5lNDU3N2NjMTE2ODkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9h
dG9taWNfc3RhdGVfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2F0b21pY19zdGF0ZV9o
ZWxwZXIuaApAQCAtNjIsNiArNjIsNyBAQCB2b2lkIGRybV9hdG9taWNfaGVscGVyX3BsYW5lX2Rl
c3Ryb3lfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiB2b2lkIF9fZHJtX2F0b21pY19o
ZWxwZXJfY29ubmVjdG9yX3Jlc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJ
CQkJCSBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSk7CiB2b2lkIGRybV9h
dG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKTsKK3ZvaWQgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3R2X3Jlc2V0KHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpOwogdm9pZAogX19kcm1fYXRvbWljX2hlbHBlcl9jb25u
ZWN0b3JfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJ
CQkJCSAgIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpzdGF0ZSk7Ci0tIApnaXQtc2VyaWVz
IDAuOS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
