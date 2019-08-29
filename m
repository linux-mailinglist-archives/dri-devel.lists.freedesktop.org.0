Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC5A162B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C814E6E0BA;
	Thu, 29 Aug 2019 10:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644816E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E47643CA0C;
 Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF76600CD;
 Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD92C31F2A; Thu, 29 Aug 2019 12:33:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 17/18] drm/virtio: drop virtio_gpu_object_{reserve,
 unreserve}
Date: Thu, 29 Aug 2019 12:33:00 +0200
Message-Id: <20190829103301.3539-18-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
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

Tm8gdXNlcnMgbGVmdC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCB8IDIxIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRleCA4NWY5NzRhOTgzN2IuLmZiMzU4MzFl
ZDM1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMzY4LDI3ICszNjgs
NiBAQCBzdGF0aWMgaW5saW5lIHU2NCB2aXJ0aW9fZ3B1X29iamVjdF9tbWFwX29mZnNldChzdHJ1
Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKQogCXJldHVybiBkcm1fdm1hX25vZGVfb2Zmc2V0X2Fk
ZHIoJmJvLT5iYXNlLmJhc2Uudm1hX25vZGUpOwogfQogCi1zdGF0aWMgaW5saW5lIGludCB2aXJ0
aW9fZ3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCi17Ci0J
aW50IHI7Ci0KLQlyID0gZG1hX3Jlc3ZfbG9ja19pbnRlcnJ1cHRpYmxlKGJvLT5iYXNlLmJhc2Uu
cmVzdiwgTlVMTCk7Ci0JaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKLQkJaWYgKHIgIT0gLUVJTlRS
KSB7Ci0JCQlzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnFkZXYgPQotCQkJCWJvLT5iYXNlLmJh
c2UuZGV2LT5kZXZfcHJpdmF0ZTsKLQkJCWRldl9lcnIocWRldi0+ZGV2LCAiJXAgcmVzZXJ2ZSBm
YWlsZWRcbiIsIGJvKTsKLQkJfQotCQlyZXR1cm4gcjsKLQl9Ci0JcmV0dXJuIDA7Ci19Ci0KLXN0
YXRpYyBpbmxpbmUgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF91bnJlc2VydmUoc3RydWN0IHZpcnRp
b19ncHVfb2JqZWN0ICpibykKLXsKLQlkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UuYmFzZS5yZXN2
KTsKLX0KLQogLyogdmlyZ2wgZGVidWZzICovCiBpbnQgdmlydGlvX2dwdV9kZWJ1Z2ZzX2luaXQo
c3RydWN0IGRybV9taW5vciAqbWlub3IpOwogCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
