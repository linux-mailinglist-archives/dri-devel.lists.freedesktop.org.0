Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA614E797
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C9A6E899;
	Fri, 21 Jun 2019 11:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEB86E889
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:58:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E113659440;
 Fri, 21 Jun 2019 11:58:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A7055C221;
 Fri, 21 Jun 2019 11:58:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4B4689D6A; Fri, 21 Jun 2019 13:58:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/18] drm/virtio: switch driver from bo->resv to
 bo->base.resv
Date: Fri, 21 Jun 2019 13:57:54 +0200
Message-Id: <20190621115755.8481-18-kraxel@redhat.com>
In-Reply-To: <20190621115755.8481-1-kraxel@redhat.com>
References: <20190621115755.8481-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 21 Jun 2019 11:58:04 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, ckoenig.leichtzumerken@gmail.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
aW9jdGwuYwppbmRleCBhYzYwYmU5YjVjMTkuLjRhZGZjZWQ4ZGYyYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKQEAgLTM5NCw3ICszOTQsNyBAQCBzdGF0aWMgaW50IHZp
cnRpb19ncHVfdHJhbnNmZXJfZnJvbV9ob3N0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CiAJCSh2Z2RldiwgcW9iai0+aHdfcmVzX2hhbmRsZSwKIAkJIHZmcHJpdi0+Y3R4X2lkLCBvZmZz
ZXQsIGFyZ3MtPmxldmVsLAogCQkgJmJveCwgZmVuY2UpOwotCXJlc2VydmF0aW9uX29iamVjdF9h
ZGRfZXhjbF9mZW5jZShxb2JqLT50Ym8ucmVzdiwKKwlyZXNlcnZhdGlvbl9vYmplY3RfYWRkX2V4
Y2xfZmVuY2UocW9iai0+dGJvLmJhc2UucmVzdiwKIAkJCQkJICAmZmVuY2UtPmYpOwogCiAJZG1h
X2ZlbmNlX3B1dCgmZmVuY2UtPmYpOwpAQCAtNDQ4LDcgKzQ0OCw3IEBAIHN0YXRpYyBpbnQgdmly
dGlvX2dwdV90cmFuc2Zlcl90b19ob3N0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgKmRhdGEsCiAJCQkodmdkZXYsIHFvYmosCiAJCQkgdmZwcml2ID8gdmZwcml2LT5jdHhfaWQg
OiAwLCBvZmZzZXQsCiAJCQkgYXJncy0+bGV2ZWwsICZib3gsIGZlbmNlKTsKLQkJcmVzZXJ2YXRp
b25fb2JqZWN0X2FkZF9leGNsX2ZlbmNlKHFvYmotPnRiby5yZXN2LAorCQlyZXNlcnZhdGlvbl9v
YmplY3RfYWRkX2V4Y2xfZmVuY2UocW9iai0+dGJvLmJhc2UucmVzdiwKIAkJCQkJCSAgJmZlbmNl
LT5mKTsKIAkJZG1hX2ZlbmNlX3B1dCgmZmVuY2UtPmYpOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X3BsYW5lLmMKaW5kZXggMDI0YzJhYTBjOTI5Li4zMjhlMjgwODFkOWYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCkBAIC0yMTAsNyArMjEwLDcgQEAgc3Rh
dGljIHZvaWQgdmlydGlvX2dwdV9jdXJzb3JfcGxhbmVfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLAogCQkJIDAsIDAsIHZnZmItPmZlbmNlKTsKIAkJcmV0ID0gdmlydGlvX2dwdV9vYmpl
Y3RfcmVzZXJ2ZShibywgZmFsc2UpOwogCQlpZiAoIXJldCkgewotCQkJcmVzZXJ2YXRpb25fb2Jq
ZWN0X2FkZF9leGNsX2ZlbmNlKGJvLT50Ym8ucmVzdiwKKwkJCXJlc2VydmF0aW9uX29iamVjdF9h
ZGRfZXhjbF9mZW5jZShiby0+dGJvLmJhc2UucmVzdiwKIAkJCQkJCQkgICZ2Z2ZiLT5mZW5jZS0+
Zik7CiAJCQlkbWFfZmVuY2VfcHV0KCZ2Z2ZiLT5mZW5jZS0+Zik7CiAJCQl2Z2ZiLT5mZW5jZSA9
IE5VTEw7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
