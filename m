Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8AB7F81B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51F6EE1B;
	Fri,  2 Aug 2019 13:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42596EE15
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:12:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6012F302246D;
 Fri,  2 Aug 2019 13:12:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21B060BF4;
 Fri,  2 Aug 2019 13:12:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3E74C1750B; Fri,  2 Aug 2019 15:12:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 03/18] drm/virtio: simplify cursor updates
Date: Fri,  2 Aug 2019 15:12:10 +0200
Message-Id: <20190802131225.17760-4-kraxel@redhat.com>
In-Reply-To: <20190802131225.17760-1-kraxel@redhat.com>
References: <20190802131225.17760-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 02 Aug 2019 13:12:36 +0000 (UTC)
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
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYwppbmRleCBmOTZjODI5
NjMwN2UuLjExNTM5YjY2YzZmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5l
LmMKQEAgLTE4Niw3ICsxODYsNiBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2N1cnNvcl9wbGFu
ZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJc3RydWN0IHZpcnRpb19ncHVfZnJh
bWVidWZmZXIgKnZnZmI7CiAJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyA9IE5VTEw7CiAJ
dWludDMyX3QgaGFuZGxlOwotCWludCByZXQgPSAwOwogCiAJaWYgKHBsYW5lLT5zdGF0ZS0+Y3J0
YykKIAkJb3V0cHV0ID0gZHJtX2NydGNfdG9fdmlydGlvX2dwdV9vdXRwdXQocGxhbmUtPnN0YXRl
LT5jcnRjKTsKQEAgLTIxMCwxNSArMjA5LDkgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jdXJz
b3JfcGxhbmVfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJIGNwdV90b19sZTMy
KHBsYW5lLT5zdGF0ZS0+Y3J0Y193KSwKIAkJCSBjcHVfdG9fbGUzMihwbGFuZS0+c3RhdGUtPmNy
dGNfaCksCiAJCQkgMCwgMCwgdmdmYi0+ZmVuY2UpOwotCQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVj
dF9yZXNlcnZlKGJvLCBmYWxzZSk7Ci0JCWlmICghcmV0KSB7Ci0JCQlyZXNlcnZhdGlvbl9vYmpl
Y3RfYWRkX2V4Y2xfZmVuY2UoYm8tPnRiby5yZXN2LAotCQkJCQkJCSAgJnZnZmItPmZlbmNlLT5m
KTsKLQkJCWRtYV9mZW5jZV9wdXQoJnZnZmItPmZlbmNlLT5mKTsKLQkJCXZnZmItPmZlbmNlID0g
TlVMTDsKLQkJCXZpcnRpb19ncHVfb2JqZWN0X3VucmVzZXJ2ZShibyk7Ci0JCQl2aXJ0aW9fZ3B1
X29iamVjdF93YWl0KGJvLCBmYWxzZSk7Ci0JCX0KKwkJZG1hX2ZlbmNlX3dhaXQoJnZnZmItPmZl
bmNlLT5mLCB0cnVlKTsKKwkJZG1hX2ZlbmNlX3B1dCgmdmdmYi0+ZmVuY2UtPmYpOworCQl2Z2Zi
LT5mZW5jZSA9IE5VTEw7CiAJfQogCiAJaWYgKHBsYW5lLT5zdGF0ZS0+ZmIgIT0gb2xkX3N0YXRl
LT5mYikgewotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
