Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA14B65E9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0316F3B8;
	Wed, 18 Sep 2019 14:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEFC6F3BC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:23:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 052FEB676;
 Wed, 18 Sep 2019 14:23:11 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com, corbet@lwn.net
Subject: [PATCH 04/11] drm/ast: Reserve space for double-buffered cursor image
Date: Wed, 18 Sep 2019 16:23:00 +0200
Message-Id: <20190918142307.27127-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcGF0Y2gsIHdlIHJlc2VydmUgMnggMTYgS2lCIGF0IHRoZSBoaWdoIGVuZCBvZiB2
aWRlbyBtZW1vcnksCndpdGggZWFjaCBmcmFtZSBhbGlnbmVkIHRvIGFuIDgtYnl0ZSBib3VuZGFy
eS4gVGhlIHJlbWFpbmluZyBtZW1vcnkgaXMKYXZhaWxhYmxlIGZvciBHRU0gVlJBTSBidWZmZXIg
b2JqZWN0cy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3R0bS5jIHwgMTMgKysrKysrKysr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdHRtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF90dG0uYwppbmRleCBmYWQzNDEwNjA4M2EuLjhlNmExZDg5MTdkMCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfdHRtLmMKQEAgLTM1LDEzICszNSwyMCBAQAogCiBpbnQgYXN0X21tX2luaXQoc3Ry
dWN0IGFzdF9wcml2YXRlICphc3QpCiB7CisJdW5zaWduZWQgbG9uZyBjdXJzb3Jfc2l6ZTsKIAlz
dHJ1Y3QgZHJtX3ZyYW1fbW0gKnZtbTsKIAlpbnQgcmV0OwogCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYgPSBhc3QtPmRldjsKIAotCXZtbSA9IGRybV92cmFtX2hlbHBlcl9hbGxvY19tbSgKLQkJZGV2
LCBwY2lfcmVzb3VyY2Vfc3RhcnQoZGV2LT5wZGV2LCAwKSwKLQkJYXN0LT52cmFtX3NpemUpOwor
CS8qIEF0IHRoZSBoaWdoIGVuZCBvZiB2aWRlbyBtZW1vcnksIHdlIHJlc2VydmUgc3BhY2UgZm9y
CisJICogdHdvIGN1cnNvciBpbWFnZXMuIFRoZSBjdXJzb3IgcGxhbmUgdXNlcyB0aGlzIG1lbW9y
eSB0bworCSAqIHN0b3JlIGEgZG91YmxlLWJ1ZmZlcmVkIGltYWdlIG9mIHRoZSBjdXJyZW50IGN1
cnNvci4KKwkgKi8KKwljdXJzb3Jfc2l6ZSA9IHJvdW5kdXAoKEFTVF9IV0NfU0laRSArIEFTVF9I
V0NfU0lHTkFUVVJFX1NJWkUpLAorCQkJICAgICAgUEFHRV9TSVpFKSAqIEFTVF9ERUZBVUxUX0hX
Q19OVU07CisKKwl2bW0gPSBkcm1fdnJhbV9oZWxwZXJfYWxsb2NfbW0oZGV2LCBwY2lfcmVzb3Vy
Y2Vfc3RhcnQoZGV2LT5wZGV2LCAwKSwKKwkJCQkgICAgICAgYXN0LT52cmFtX3NpemUgLSBjdXJz
b3Jfc2l6ZSk7CiAJaWYgKElTX0VSUih2bW0pKSB7CiAJCXJldCA9IFBUUl9FUlIodm1tKTsKIAkJ
RFJNX0VSUk9SKCJFcnJvciBpbml0aWFsaXppbmcgVlJBTSBNTTsgJWRcbiIsIHJldCk7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
