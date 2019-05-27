Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76982B302
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 13:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4387B898A4;
	Mon, 27 May 2019 11:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B210898A4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:15:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BCA93084023;
 Mon, 27 May 2019 11:14:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
 [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB43917197;
 Mon, 27 May 2019 11:14:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DEBF316E1A; Mon, 27 May 2019 13:14:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: add plane check
Date: Mon, 27 May 2019 13:14:47 +0200
Message-Id: <20190527111447.21625-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 27 May 2019 11:15:01 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKCkKdG8gc2FuaXR5IGNoZWNr
IHRoZSBwbGFuZSBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIHwg
MTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYwppbmRleCAw
MjRjMmFhMGM5MjkuLjNiMzc3YmI1YjVjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X3BsYW5lLmMKQEAgLTgyLDcgKzgyLDIyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5l
X2Z1bmNzIHZpcnRpb19ncHVfcGxhbmVfZnVuY3MgPSB7CiBzdGF0aWMgaW50IHZpcnRpb19ncHVf
cGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJCQkgc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUpCiB7Ci0JcmV0dXJuIDA7CisJYm9vbCBpc19jdXJzb3Ig
PSBwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9DVVJTT1I7CisJc3RydWN0IGRybV9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlOworCWludCByZXQ7CisKKwlpZiAoIXN0YXRlLT5mYiB8ICFzdGF0
ZS0+Y3J0YykKKwkJcmV0dXJuIDA7CisKKwljcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY3J0
Y19zdGF0ZShzdGF0ZS0+c3RhdGUsIHN0YXRlLT5jcnRjKTsKKwlpZiAoSVNfRVJSKGNydGNfc3Rh
dGUpKQorICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNydGNfc3RhdGUpOworCisJcmV0
ID0gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUoc3RhdGUsIGNydGNfc3RhdGUs
CisJCQkJCQkgIERSTV9QTEFORV9IRUxQRVJfTk9fU0NBTElORywKKwkJCQkJCSAgRFJNX1BMQU5F
X0hFTFBFUl9OT19TQ0FMSU5HLAorCQkJCQkJICBpc19jdXJzb3IsIHRydWUpOworCXJldHVybiBy
ZXQ7CiB9CiAKIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfcHJpbWFyeV9wbGFuZV91cGRhdGUoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
