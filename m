Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35324B48F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE646E317;
	Wed, 19 Jun 2019 09:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312AF6E326
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:04:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C1B6F308FBAC;
 Wed, 19 Jun 2019 09:04:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-86.ams2.redhat.com
 [10.36.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4460360A9A;
 Wed, 19 Jun 2019 09:04:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B041817474; Wed, 19 Jun 2019 11:04:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/12] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve, unreserve}
Date: Wed, 19 Jun 2019 11:04:15 +0200
Message-Id: <20190619090420.6667-8-kraxel@redhat.com>
In-Reply-To: <20190619090420.6667-1-kraxel@redhat.com>
References: <20190619090420.6667-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 19 Jun 2019 09:04:28 +0000 (UTC)
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

Q2FsbCByZXNlcnZhdGlvbl9vYmplY3RfKiBkaXJlY3RseSBpbnN0ZWFkCm9mIHVzaW5nIHR0bV9i
b197cmVzZXJ2ZSx1bnJlc2VydmV9LgoKdjM6IGNoZWNrIGZvciBFSU5UUiB0b28uCgpTaWduZWQt
b2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5o
CmluZGV4IDA2Y2MwZTk2MWRmNi4uNzdhYzY5YThlNmNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rydi5oCkBAIC00MDIsOSArNDAyLDkgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydGlv
X2dwdV9vYmplY3RfcmVzZXJ2ZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKQogewogCWlu
dCByOwogCi0JciA9IHR0bV9ib19yZXNlcnZlKCZiby0+dGJvLCB0cnVlLCBmYWxzZSwgTlVMTCk7
CisJciA9IHJlc2VydmF0aW9uX29iamVjdF9sb2NrX2ludGVycnVwdGlibGUoYm8tPmdlbV9iYXNl
LnJlc3YsIE5VTEwpOwogCWlmICh1bmxpa2VseShyICE9IDApKSB7Ci0JCWlmIChyICE9IC1FUkVT
VEFSVFNZUykgeworCQlpZiAociAhPSAtRVJFU1RBUlRTWVMgJiYgciAhPSAtRUlOVFIpIHsKIAkJ
CXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqcWRldiA9CiAJCQkJYm8tPmdlbV9iYXNlLmRldi0+
ZGV2X3ByaXZhdGU7CiAJCQlkZXZfZXJyKHFkZXYtPmRldiwgIiVwIHJlc2VydmUgZmFpbGVkXG4i
LCBibyk7CkBAIC00MTYsNyArNDE2LDcgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydGlvX2dwdV9v
YmplY3RfcmVzZXJ2ZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKQogCiBzdGF0aWMgaW5s
aW5lIHZvaWQgdmlydGlvX2dwdV9vYmplY3RfdW5yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29i
amVjdCAqYm8pCiB7Ci0JdHRtX2JvX3VucmVzZXJ2ZSgmYm8tPnRibyk7CisJcmVzZXJ2YXRpb25f
b2JqZWN0X3VubG9jayhiby0+Z2VtX2Jhc2UucmVzdik7CiB9CiAKIC8qIHZpcmdsIGRlYnVmcyAq
LwotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
