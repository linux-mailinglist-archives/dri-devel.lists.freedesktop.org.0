Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8BE59A52
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878928961D;
	Fri, 28 Jun 2019 12:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C686E902
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:13:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 32A6B6697A;
 Fri, 28 Jun 2019 12:13:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1B2F5DAA4;
 Fri, 28 Jun 2019 12:13:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5FEA417536; Fri, 28 Jun 2019 14:13:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/12] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve, unreserve}
Date: Fri, 28 Jun 2019 14:13:32 +0200
Message-Id: <20190628121338.24398-7-kraxel@redhat.com>
In-Reply-To: <20190628121338.24398-1-kraxel@redhat.com>
References: <20190628121338.24398-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 28 Jun 2019 12:13:50 +0000 (UTC)
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
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FsbCByZXNlcnZhdGlvbl9vYmplY3RfKiBkaXJlY3RseSBpbnN0ZWFkCm9mIHVzaW5nIHR0bV9i
b197cmVzZXJ2ZSx1bnJlc2VydmV9LgoKdjQ6IGNoZWNrIGZvciBFSU5UUiBvbmx5Lgp2MzogY2hl
Y2sgZm9yIEVJTlRSIHRvby4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKaW5kZXggMDZjYzBlOTYxZGY2Li4wN2Y2MDAxZWE5
MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKQEAgLTQwMiw5ICs0MDIsOSBA
QCBzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0
aW9fZ3B1X29iamVjdCAqYm8pCiB7CiAJaW50IHI7CiAKLQlyID0gdHRtX2JvX3Jlc2VydmUoJmJv
LT50Ym8sIHRydWUsIGZhbHNlLCBOVUxMKTsKKwlyID0gcmVzZXJ2YXRpb25fb2JqZWN0X2xvY2tf
aW50ZXJydXB0aWJsZShiby0+Z2VtX2Jhc2UucmVzdiwgTlVMTCk7CiAJaWYgKHVubGlrZWx5KHIg
IT0gMCkpIHsKLQkJaWYgKHIgIT0gLUVSRVNUQVJUU1lTKSB7CisJCWlmIChyICE9IC1FSU5UUikg
ewogCQkJc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICpxZGV2ID0KIAkJCQliby0+Z2VtX2Jhc2Uu
ZGV2LT5kZXZfcHJpdmF0ZTsKIAkJCWRldl9lcnIocWRldi0+ZGV2LCAiJXAgcmVzZXJ2ZSBmYWls
ZWRcbiIsIGJvKTsKQEAgLTQxNiw3ICs0MTYsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9f
Z3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCiAKIHN0YXRp
YyBpbmxpbmUgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF91bnJlc2VydmUoc3RydWN0IHZpcnRpb19n
cHVfb2JqZWN0ICpibykKIHsKLQl0dG1fYm9fdW5yZXNlcnZlKCZiby0+dGJvKTsKKwlyZXNlcnZh
dGlvbl9vYmplY3RfdW5sb2NrKGJvLT5nZW1fYmFzZS5yZXN2KTsKIH0KIAogLyogdmlyZ2wgZGVi
dWZzICovCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
