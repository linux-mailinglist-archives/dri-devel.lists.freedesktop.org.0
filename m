Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E45A162D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D476E0DA;
	Thu, 29 Aug 2019 10:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50836E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 227378CEC67;
 Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EED7C5D712;
 Thu, 29 Aug 2019 10:33:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 458E631E86; Thu, 29 Aug 2019 12:33:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 03/18] drm/virtio: simplify cursor updates
Date: Thu, 29 Aug 2019 12:32:46 +0200
Message-Id: <20190829103301.3539-4-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byBkbyB0aGUgcmVzZXJ2YXRpb24gZGFuY2UsCndlIGNhbiBqdXN0IHdhaXQgb24g
dGhlIGZlbmNlIGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIHwgMTMg
KysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYwppbmRleCBmZTVlZmIy
ZGU5MGQuLmYyMzYyMmIxMjYyOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5l
LmMKQEAgLTIwMSw3ICsyMDEsNiBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2N1cnNvcl9wbGFu
ZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJc3RydWN0IHZpcnRpb19ncHVfZnJh
bWVidWZmZXIgKnZnZmI7CiAJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyA9IE5VTEw7CiAJ
dWludDMyX3QgaGFuZGxlOwotCWludCByZXQgPSAwOwogCiAJaWYgKHBsYW5lLT5zdGF0ZS0+Y3J0
YykKIAkJb3V0cHV0ID0gZHJtX2NydGNfdG9fdmlydGlvX2dwdV9vdXRwdXQocGxhbmUtPnN0YXRl
LT5jcnRjKTsKQEAgLTIyNSwxNSArMjI0LDkgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jdXJz
b3JfcGxhbmVfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJIGNwdV90b19sZTMy
KHBsYW5lLT5zdGF0ZS0+Y3J0Y193KSwKIAkJCSBjcHVfdG9fbGUzMihwbGFuZS0+c3RhdGUtPmNy
dGNfaCksCiAJCQkgMCwgMCwgdmdmYi0+ZmVuY2UpOwotCQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVj
dF9yZXNlcnZlKGJvLCBmYWxzZSk7Ci0JCWlmICghcmV0KSB7Ci0JCQlkbWFfcmVzdl9hZGRfZXhj
bF9mZW5jZShiby0+dGJvLmJhc2UucmVzdiwKLQkJCQkJCQkgICZ2Z2ZiLT5mZW5jZS0+Zik7Ci0J
CQlkbWFfZmVuY2VfcHV0KCZ2Z2ZiLT5mZW5jZS0+Zik7Ci0JCQl2Z2ZiLT5mZW5jZSA9IE5VTEw7
Ci0JCQl2aXJ0aW9fZ3B1X29iamVjdF91bnJlc2VydmUoYm8pOwotCQkJdmlydGlvX2dwdV9vYmpl
Y3Rfd2FpdChibywgZmFsc2UpOwotCQl9CisJCWRtYV9mZW5jZV93YWl0KCZ2Z2ZiLT5mZW5jZS0+
ZiwgdHJ1ZSk7CisJCWRtYV9mZW5jZV9wdXQoJnZnZmItPmZlbmNlLT5mKTsKKwkJdmdmYi0+ZmVu
Y2UgPSBOVUxMOwogCX0KIAogCWlmIChwbGFuZS0+c3RhdGUtPmZiICE9IG9sZF9zdGF0ZS0+ZmIp
IHsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
