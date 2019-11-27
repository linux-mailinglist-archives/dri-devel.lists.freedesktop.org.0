Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149210AC98
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 10:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D781D6E4F3;
	Wed, 27 Nov 2019 09:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166546E4E3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 09:25:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-uDvwzbvnNgu0saOxSAtQZA-1; Wed, 27 Nov 2019 04:25:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6825B18543AF;
 Wed, 27 Nov 2019 09:25:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5C1C60BE2;
 Wed, 27 Nov 2019 09:25:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 07DBC9DB3; Wed, 27 Nov 2019 10:25:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm: share address space for dma bufs
Date: Wed, 27 Nov 2019 10:25:23 +0100
Message-Id: <20191127092523.5620-3-kraxel@redhat.com>
In-Reply-To: <20191127092523.5620-1-kraxel@redhat.com>
References: <20191127092523.5620-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uDvwzbvnNgu0saOxSAtQZA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574846734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5z9r04AnLOvBsT/Uxl53eyYluiyIniRuU4OD04klCdw=;
 b=BrrxfMmbmXgbkRYS1KXleWzRuxbBwWG5xwB9+ROdRWqedmk5bH2lks5boiGtzRQ/RH53CY
 8m5lbjwwbo2cjw1S9A1vNjQZacuK1AMDfniEe4as/zeTGUKvlxJpxI3wqsjUQNOfM4QHPB
 lIQSMqmLNGQMzpzKIFwFiqcZ5Uuoerc=
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
Cc: "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBzaGFyZWQgYWRkcmVzcyBzcGFjZSBvZiB0aGUgZHJtIGRldmljZSAoc2VlIGRybV9v
cGVuKCkgaW4KZHJtX2ZpbGUuYykgZm9yIGRtYS1idWZzIHRvby4gIFRoYXQgcmVtb3ZlcyBhIGRp
ZmZlcmVuY2UgYmV0d2VlbSBkcm0KZGV2aWNlIG1tYXAgdm1hcyBhbmQgZG1hLWJ1ZiBtbWFwIHZt
YXMgYW5kIGZpeGVzIGNvcm5lciBjYXNlcyBsaWtlCmRyb3BwaW5nIHB0ZXMgKHVzaW5nIG1hZHZp
c2UoRE9OVE5FRUQpIGZvciBleGFtcGxlKSBub3Qgd29ya2luZwpwcm9wZXJseS4KCkFsc28gcmVt
b3ZlIGFtZGdwdSBkcml2ZXIncyBwcml2YXRlIGRtYWJ1ZiB1cGRhdGUuICBJdCBpcyBub3QgbmVl
ZGVkCmFueSBtb3JlIG5vdyB0aGF0IHdlIGFyZSBkb2luZyB0aGlzIGZvciBldmVyeWJvZHkuCgpT
aWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDQgKy0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9wcmltZS5jICAgICAgICAgICAgICAgICB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kbWFfYnVmLmMKaW5kZXggZDViY2RmZWZiYWQ2Li41ODZkYjRmYjQ2YmQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwpAQCAtMzYxLDEw
ICszNjEsOCBAQCBzdHJ1Y3QgZG1hX2J1ZiAqYW1kZ3B1X2dlbV9wcmltZV9leHBvcnQoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpnb2JqLAogCQlyZXR1cm4gRVJSX1BUUigtRVBFUk0pOwogCiAJYnVm
ID0gZHJtX2dlbV9wcmltZV9leHBvcnQoZ29iaiwgZmxhZ3MpOwotCWlmICghSVNfRVJSKGJ1Zikp
IHsKLQkJYnVmLT5maWxlLT5mX21hcHBpbmcgPSBnb2JqLT5kZXYtPmFub25faW5vZGUtPmlfbWFw
cGluZzsKKwlpZiAoIUlTX0VSUihidWYpKQogCQlidWYtPm9wcyA9ICZhbWRncHVfZG1hYnVmX29w
czsKLQl9CiAKIAlyZXR1cm4gYnVmOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCmluZGV4IGEwZjkyOWM3MTE3
Yi4uODZkOWIwZTQ1YzhjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCkBAIC0yNDAsNiArMjQwLDcgQEAgdm9p
ZCBkcm1fcHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUoc3RydWN0IGRybV9wcmltZV9maWxlX3By
aXZhdGUgKnByaW1lX2Zwcml2KQogc3RydWN0IGRtYV9idWYgKmRybV9nZW1fZG1hYnVmX2V4cG9y
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCSAgICAgIHN0cnVjdCBkbWFfYnVmX2V4cG9y
dF9pbmZvICpleHBfaW5mbykKIHsKKwlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IGV4cF9p
bmZvLT5wcml2OwogCXN0cnVjdCBkbWFfYnVmICpkbWFfYnVmOwogCiAJZG1hX2J1ZiA9IGRtYV9i
dWZfZXhwb3J0KGV4cF9pbmZvKTsKQEAgLTI0Nyw3ICsyNDgsOCBAQCBzdHJ1Y3QgZG1hX2J1ZiAq
ZHJtX2dlbV9kbWFidWZfZXhwb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCXJldHVybiBk
bWFfYnVmOwogCiAJZHJtX2Rldl9nZXQoZGV2KTsKLQlkcm1fZ2VtX29iamVjdF9nZXQoZXhwX2lu
Zm8tPnByaXYpOworCWRybV9nZW1fb2JqZWN0X2dldChvYmopOworCWRtYV9idWYtPmZpbGUtPmZf
bWFwcGluZyA9IG9iai0+ZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmc7CiAKIAlyZXR1cm4gZG1h
X2J1ZjsKIH0KLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
