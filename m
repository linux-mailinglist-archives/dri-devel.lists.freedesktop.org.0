Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C528637E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FE3892E2;
	Thu,  8 Aug 2019 13:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90296E858;
 Thu,  8 Aug 2019 13:44:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20144300BEB4;
 Thu,  8 Aug 2019 13:44:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD86C60600;
 Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B64E59CAB; Thu,  8 Aug 2019 15:44:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 14/17] drm/qxl: drop qxl_ttm_fault
Date: Thu,  8 Aug 2019 15:44:14 +0200
Message-Id: <20190808134417.10610-15-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 08 Aug 2019 13:44:25 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHN1cmUgd2hhdCB0aGlzIGhvb2sgaXMgc3VwcG9zZWQgdG8gZG8uICB2bWYtPnZtYS0+dm1f
cHJpdmF0ZV9kYXRhCnNob3VsZCBuZXZlciBiZSBOVUxMLCBzbyB0aGUgZXh0cmEgY2hlY2sgaW4g
cXhsX3R0bV9mYXVsdCBzaG91bGQgaGF2ZSBubwplZmZlY3QuCgpEcm9wIGl0LgoKU2lnbmVkLW9m
Zi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3F4bC9xeGxfdHRtLmMgfCAyNyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90
dG0uYwppbmRleCAzYTI0MTQ1ZGQ1MTYuLjQxZWRiZGUwZTM3ZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRt
LmMKQEAgLTQ4LDI0ICs0OCw4IEBAIHN0YXRpYyBzdHJ1Y3QgcXhsX2RldmljZSAqcXhsX2dldF9x
ZGV2KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KQogCXJldHVybiBxZGV2OwogfQogCi1zdGF0
aWMgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHF4bF90dG1fdm1fb3BzOwotc3RhdGljIGNv
bnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCAqdHRtX3ZtX29wczsKLQotc3RhdGljIHZt
X2ZhdWx0X3QgcXhsX3R0bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKLXsKLQlzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvOwotCXZtX2ZhdWx0X3QgcmV0OwotCi0JYm8gPSAoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICopdm1mLT52bWEtPnZtX3ByaXZhdGVfZGF0YTsKLQlpZiAoYm8g
PT0gTlVMTCkKLQkJcmV0dXJuIFZNX0ZBVUxUX05PUEFHRTsKLQlyZXQgPSB0dG1fdm1fb3BzLT5m
YXVsdCh2bWYpOwotCXJldHVybiByZXQ7Ci19Ci0KIGludCBxeGxfbW1hcChzdHJ1Y3QgZmlsZSAq
ZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7Ci0JaW50IHI7CiAJc3RydWN0IGRy
bV9maWxlICpmaWxlX3ByaXYgPSBmaWxwLT5wcml2YXRlX2RhdGE7CiAJc3RydWN0IHF4bF9kZXZp
Y2UgKnFkZXYgPSBmaWxlX3ByaXYtPm1pbm9yLT5kZXYtPmRldl9wcml2YXRlOwogCkBAIC03Nywx
NiArNjEsNyBAQCBpbnQgcXhsX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKQogCURSTV9ERUJVR19EUklWRVIoImZpbHAtPnByaXZhdGVfZGF0YSA9IDB4
JXAsIHZtYS0+dm1fcGdvZmYgPSAlbHhcbiIsCiAJCSAgZmlscC0+cHJpdmF0ZV9kYXRhLCB2bWEt
PnZtX3Bnb2ZmKTsKIAotCXIgPSB0dG1fYm9fbW1hcChmaWxwLCB2bWEsICZxZGV2LT5tbWFuLmJk
ZXYpOwotCWlmICh1bmxpa2VseShyICE9IDApKQotCQlyZXR1cm4gcjsKLQlpZiAodW5saWtlbHko
dHRtX3ZtX29wcyA9PSBOVUxMKSkgewotCQl0dG1fdm1fb3BzID0gdm1hLT52bV9vcHM7Ci0JCXF4
bF90dG1fdm1fb3BzID0gKnR0bV92bV9vcHM7Ci0JCXF4bF90dG1fdm1fb3BzLmZhdWx0ID0gJnF4
bF90dG1fZmF1bHQ7Ci0JfQotCXZtYS0+dm1fb3BzID0gJnF4bF90dG1fdm1fb3BzOwotCXJldHVy
biAwOworCXJldHVybiB0dG1fYm9fbW1hcChmaWxwLCB2bWEsICZxZGV2LT5tbWFuLmJkZXYpOwog
fQogCiBzdGF0aWMgaW50IHF4bF9pbnZhbGlkYXRlX2NhY2hlcyhzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgdWludDMyX3QgZmxhZ3MpCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
