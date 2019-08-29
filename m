Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A1A160C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBC76E09E;
	Thu, 29 Aug 2019 10:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E596E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E62668553A;
 Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD751001938;
 Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A709731E95; Thu, 29 Aug 2019 12:33:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 06/18] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve, unreserve}
Date: Thu, 29 Aug 2019 12:32:49 +0200
Message-Id: <20190829103301.3539-7-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 29 Aug 2019 10:33:07 +0000 (UTC)
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

Q2FsbCByZXNlcnZhdGlvbl9vYmplY3RfKiBkaXJlY3RseSBpbnN0ZWFkCm9mIHVzaW5nIHR0bV9i
b197cmVzZXJ2ZSx1bnJlc2VydmV9LgoKdjQ6IGNoZWNrIGZvciBFSU5UUiBvbmx5Lgp2MzogY2hl
Y2sgZm9yIEVJTlRSIHRvby4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggYi9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKaW5kZXggZDg4NmMwZTM1MDJhLi5kYjU3YmJiMzYy
MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKQEAgLTQwMiw5ICs0MDIsOSBA
QCBzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0
aW9fZ3B1X29iamVjdCAqYm8pCiB7CiAJaW50IHI7CiAKLQlyID0gdHRtX2JvX3Jlc2VydmUoJmJv
LT50Ym8sIHRydWUsIGZhbHNlLCBOVUxMKTsKKwlyID0gZG1hX3Jlc3ZfbG9ja19pbnRlcnJ1cHRp
YmxlKGJvLT5nZW1fYmFzZS5yZXN2LCBOVUxMKTsKIAlpZiAodW5saWtlbHkociAhPSAwKSkgewot
CQlpZiAociAhPSAtRVJFU1RBUlRTWVMpIHsKKwkJaWYgKHIgIT0gLUVJTlRSKSB7CiAJCQlzdHJ1
Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnFkZXYgPQogCQkJCWJvLT5nZW1fYmFzZS5kZXYtPmRldl9w
cml2YXRlOwogCQkJZGV2X2VycihxZGV2LT5kZXYsICIlcCByZXNlcnZlIGZhaWxlZFxuIiwgYm8p
OwpAQCAtNDE2LDcgKzQxNiw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRpb19ncHVfb2JqZWN0
X3Jlc2VydmUoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibykKIAogc3RhdGljIGlubGluZSB2
b2lkIHZpcnRpb19ncHVfb2JqZWN0X3VucmVzZXJ2ZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3Qg
KmJvKQogewotCXR0bV9ib191bnJlc2VydmUoJmJvLT50Ym8pOworCWRtYV9yZXN2X3VubG9jayhi
by0+Z2VtX2Jhc2UucmVzdik7CiB9CiAKIC8qIHZpcmdsIGRlYnVmcyAqLwotLSAKMi4xOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
