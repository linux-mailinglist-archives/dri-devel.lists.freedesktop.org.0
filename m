Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4969948055
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96D4891AF;
	Mon, 17 Jun 2019 11:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E2D891AC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:14:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A69155D5E6;
 Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1388A5944A;
 Mon, 17 Jun 2019 11:14:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2D73C16E2D; Mon, 17 Jun 2019 13:14:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/virtio: simplify cursor updates
Date: Mon, 17 Jun 2019 13:14:05 +0200
Message-Id: <20190617111406.14765-4-kraxel@redhat.com>
In-Reply-To: <20190617111406.14765-1-kraxel@redhat.com>
References: <20190617111406.14765-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
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

Tm8gbmVlZCB0byBkbyB0aGUgcmVzZXJ2YXRpb24gZGFuY2UsCndlIGNhbiBqdXN0IHdhaXQgb24g
dGhlIGZlbmNlIGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMg
fCAxMyArKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
cGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCmluZGV4IDAy
NGMyYWEwYzkyOS4uNGI4MDViZjQ2NmQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
cGxhbmUuYwpAQCAtMTg0LDcgKzE4NCw2IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3Vyc29y
X3BsYW5lX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlzdHJ1Y3QgdmlydGlvX2dw
dV9mcmFtZWJ1ZmZlciAqdmdmYjsKIAlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvID0gTlVM
TDsKIAl1aW50MzJfdCBoYW5kbGU7Ci0JaW50IHJldCA9IDA7CiAKIAlpZiAocGxhbmUtPnN0YXRl
LT5jcnRjKQogCQlvdXRwdXQgPSBkcm1fY3J0Y190b192aXJ0aW9fZ3B1X291dHB1dChwbGFuZS0+
c3RhdGUtPmNydGMpOwpAQCAtMjA4LDE1ICsyMDcsOSBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1
X2N1cnNvcl9wbGFuZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCQkgY3B1X3Rv
X2xlMzIocGxhbmUtPnN0YXRlLT5jcnRjX3cpLAogCQkJIGNwdV90b19sZTMyKHBsYW5lLT5zdGF0
ZS0+Y3J0Y19oKSwKIAkJCSAwLCAwLCB2Z2ZiLT5mZW5jZSk7Ci0JCXJldCA9IHZpcnRpb19ncHVf
b2JqZWN0X3Jlc2VydmUoYm8sIGZhbHNlKTsKLQkJaWYgKCFyZXQpIHsKLQkJCXJlc2VydmF0aW9u
X29iamVjdF9hZGRfZXhjbF9mZW5jZShiby0+dGJvLnJlc3YsCi0JCQkJCQkJICAmdmdmYi0+ZmVu
Y2UtPmYpOwotCQkJZG1hX2ZlbmNlX3B1dCgmdmdmYi0+ZmVuY2UtPmYpOwotCQkJdmdmYi0+ZmVu
Y2UgPSBOVUxMOwotCQkJdmlydGlvX2dwdV9vYmplY3RfdW5yZXNlcnZlKGJvKTsKLQkJCXZpcnRp
b19ncHVfb2JqZWN0X3dhaXQoYm8sIGZhbHNlKTsKLQkJfQorCQlkbWFfZmVuY2Vfd2FpdCgmdmdm
Yi0+ZmVuY2UtPmYsIHRydWUpOworCQlkbWFfZmVuY2VfcHV0KCZ2Z2ZiLT5mZW5jZS0+Zik7CisJ
CXZnZmItPmZlbmNlID0gTlVMTDsKIAl9CiAKIAlpZiAocGxhbmUtPnN0YXRlLT5mYiAhPSBvbGRf
c3RhdGUtPmZiKSB7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
