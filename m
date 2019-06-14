Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A01C45C59
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA14589612;
	Fri, 14 Jun 2019 12:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AA389708
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:13:39 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 72B56240002;
 Fri, 14 Jun 2019 12:13:31 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 02/12] drm/client: Restrict the plane_state scope
Date: Fri, 14 Jun 2019 14:13:09 +0200
Message-Id: <4f6344cb770047cf5808791d849bbc0cbd330e54.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
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

VGhlIGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfYXRvbWljIGZ1bmN0aW9uIHVzZXMgdHdvIHRp
bWVzIHRoZQpwbGFuZV9zdGF0ZSB2YXJpYWJsZSBpbiBpbm5lciBibG9ja3Mgb2YgY29kZSwgYnV0
IHRoZSB2YXJpYWJsZSBoYXMgYSBzY29wZQpnbG9iYWwgdG8gdGhpcyBmdW5jdGlvbi4KClRoaXMg
d2lsbCBsZWFkIHRvIGluYWR2ZXJ0ZW50IGRldnMgdG8gcmV1c2UgdGhlIHZhcmlhYmxlIGluIHRo
ZSBzZWNvbmQKYmxvY2sgd2l0aCB0aGUgdmFsdWUgbGVmdCBieSB0aGUgZmlyc3QsIHdpdGhvdXQg
YW55IHdhcm5pbmcgZnJvbSB0aGUKY29tcGlsZXIgc2luY2UgdmFsdWUgd291bGQgaGF2ZSBiZWVu
IGluaXRpYWxpemVkLgoKRml4IHRoaXMgYnkgbW92aW5nIHRoZSB2YXJpYWJsZSBkZWNsYXJhdGlv
biB0byB0aGUgcHJvcGVyIHNjb3BlLgoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9t
b2Rlc2V0LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNl
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCmluZGV4IDAwNmJmNzM5
MGU3ZC4uODI2NGMzYTczMmIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dF9tb2Rlc2V0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCkBA
IC04NjEsNyArODYxLDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X3BhbmVsX3JvdGF0aW9u
KTsKIHN0YXRpYyBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMoc3RydWN0IGRy
bV9jbGllbnRfZGV2ICpjbGllbnQsIGJvb2wgYWN0aXZlKQogewogCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYgPSBjbGllbnQtPmRldjsKLQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0
ZTsKIAlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZTsKIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAq
c3RhdGU7CiAJc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsKQEAgLTg3OSw2ICs4
NzgsOCBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfYXRvbWljKHN0cnVj
dCBkcm1fY2xpZW50X2RldiAqY2xpZW50LCBib29sIAogCXN0YXRlLT5hY3F1aXJlX2N0eCA9ICZj
dHg7CiByZXRyeToKIAlkcm1fZm9yX2VhY2hfcGxhbmUocGxhbmUsIGRldikgeworCQlzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKKwogCQlwbGFuZV9zdGF0ZSA9IGRybV9hdG9t
aWNfZ2V0X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7CiAJCWlmIChJU19FUlIocGxhbmVfc3Rh
dGUpKSB7CiAJCQlyZXQgPSBQVFJfRVJSKHBsYW5lX3N0YXRlKTsKQEAgLTkwMSw2ICs5MDIsOCBA
QCBzdGF0aWMgaW50IGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfYXRvbWljKHN0cnVjdCBkcm1f
Y2xpZW50X2RldiAqY2xpZW50LCBib29sIAogCQl1bnNpZ25lZCBpbnQgcm90YXRpb247CiAKIAkJ
aWYgKGRybV9jbGllbnRfcGFuZWxfcm90YXRpb24obW9kZV9zZXQsICZyb3RhdGlvbikpIHsKKwkJ
CXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOworCiAJCQkvKiBDYW5ub3QgZmFp
bCBhcyB3ZSd2ZSBhbHJlYWR5IGdvdHRlbiB0aGUgcGxhbmUgc3RhdGUgYWJvdmUgKi8KIAkJCXBs
YW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwcmltYXJ5
KTsKIAkJCXBsYW5lX3N0YXRlLT5yb3RhdGlvbiA9IHJvdGF0aW9uOwotLSAKZ2l0LXNlcmllcyAw
LjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
