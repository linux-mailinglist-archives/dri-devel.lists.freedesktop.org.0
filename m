Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893AA1617
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE46E0AB;
	Thu, 29 Aug 2019 10:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F84C6E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C78594E926;
 Thu, 29 Aug 2019 10:33:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FF4219D7A;
 Thu, 29 Aug 2019 10:33:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A56C631F29; Thu, 29 Aug 2019 12:33:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 16/18] drm/virtio: drop virtio_gpu_object_{ref,unref}
Date: Thu, 29 Aug 2019 12:32:59 +0200
Message-Id: <20190829103301.3539-17-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 29 Aug 2019 10:33:11 +0000 (UTC)
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
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCB8IDE1IC0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRleCAzZTViMmQxZGI0MmQuLjg1Zjk3NGE5ODM3YiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMzYzLDIxICszNjMsNiBAQCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnZpcnRncHVfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSgK
IAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRh
Y2gsCiAJc3RydWN0IHNnX3RhYmxlICpzZ3QpOwogCi1zdGF0aWMgaW5saW5lIHN0cnVjdCB2aXJ0
aW9fZ3B1X29iamVjdCoKLXZpcnRpb19ncHVfb2JqZWN0X3JlZihzdHJ1Y3QgdmlydGlvX2dwdV9v
YmplY3QgKmJvKQotewotCWRybV9nZW1fb2JqZWN0X2dldCgmYm8tPmJhc2UuYmFzZSk7Ci0JcmV0
dXJuIGJvOwotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQgdmlydGlvX2dwdV9vYmplY3RfdW5yZWYo
c3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICoqYm8pCi17Ci0JaWYgKCgqYm8pID09IE5VTEwpCi0J
CXJldHVybjsKLQlkcm1fZ2VtX29iamVjdF9wdXQoJigqYm8pLT5iYXNlLmJhc2UpOwotCSpibyA9
IE5VTEw7Ci19Ci0KIHN0YXRpYyBpbmxpbmUgdTY0IHZpcnRpb19ncHVfb2JqZWN0X21tYXBfb2Zm
c2V0KHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCiB7CiAJcmV0dXJuIGRybV92bWFfbm9k
ZV9vZmZzZXRfYWRkcigmYm8tPmJhc2UuYmFzZS52bWFfbm9kZSk7Ci0tIAoyLjE4LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
