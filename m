Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F065C1050B2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 11:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8026EDC8;
	Thu, 21 Nov 2019 10:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F6E6ED83
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:38:19 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-PqYQGKb9MKe9HMCdYqCfBA-1; Thu, 21 Nov 2019 05:38:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2BE1107BA9E;
 Thu, 21 Nov 2019 10:38:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79FD1106F972;
 Thu, 21 Nov 2019 10:38:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C868DA1E0; Thu, 21 Nov 2019 11:38:07 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: share address space for dma bufs
Date: Thu, 21 Nov 2019 11:38:07 +0100
Message-Id: <20191121103807.18424-3-kraxel@redhat.com>
In-Reply-To: <20191121103807.18424-1-kraxel@redhat.com>
References: <20191121103807.18424-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: PqYQGKb9MKe9HMCdYqCfBA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574332698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhfsdgfnBGFdqQ+uLrLd0ryQWfyJPaQk6Np/gMUhFtg=;
 b=dswt3taW0XrrftDDshvBfEWMNiGg6RyMUTjdl4RS7rXQx3y1L9yWWHZJLxpQ6xE9ml7nDa
 uuOpuxnj+rDKFdfuCQdbRgxjnIWyO2/47XvcJ1wCyuKMhvfCKl/Rwx7L5ChQAkmW4MERxC
 +0XSK8NBS9y6Gq//c9UP9Dda1j5Rz1Q=
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBzaGFyZWQgYWRkcmVzcyBzcGFjZSBvZiB0aGUgZHJtIGRldmljZSAoc2VlIGRybV9v
cGVuKCkgaW4KZHJtX2ZpbGUuYykgZm9yIGRtYS1idWZzIHRvby4gIFRoYXQgcmVtb3ZlcyBhIGRp
ZmZlcmVuY2UgYmV0d2VlbSBkcm0KZGV2aWNlIG1tYXAgdm1hcyBhbmQgZG1hLWJ1ZiBtbWFwIHZt
YXMgYW5kIGZpeGVzIGNvcm5lciBjYXNlcyBsaWtlCnVubWFwcyBub3Qgd29ya2luZyBwcm9wZXJs
eS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwppbmRleCBhOTYzM2Jk
MjQxYmIuLmMzZmMzNDE0NTNjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmlt
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwpAQCAtMjQwLDYgKzI0MCw3IEBA
IHZvaWQgZHJtX3ByaW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKHN0cnVjdCBkcm1fcHJpbWVfZmls
ZV9wcml2YXRlICpwcmltZV9mcHJpdikKIHN0cnVjdCBkbWFfYnVmICpkcm1fZ2VtX2RtYWJ1Zl9l
eHBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQkgICAgICBzdHJ1Y3QgZG1hX2J1Zl9l
eHBvcnRfaW5mbyAqZXhwX2luZm8pCiB7CisJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBl
eHBfaW5mby0+cHJpdjsKIAlzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZjsKIAogCWRtYV9idWYgPSBk
bWFfYnVmX2V4cG9ydChleHBfaW5mbyk7CkBAIC0yNDcsNyArMjQ4LDggQEAgc3RydWN0IGRtYV9i
dWYgKmRybV9nZW1fZG1hYnVmX2V4cG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1
cm4gZG1hX2J1ZjsKIAogCWRybV9kZXZfZ2V0KGRldik7Ci0JZHJtX2dlbV9vYmplY3RfZ2V0KGV4
cF9pbmZvLT5wcml2KTsKKwlkcm1fZ2VtX29iamVjdF9nZXQob2JqKTsKKwlkbWFfYnVmLT5maWxl
LT5mX21hcHBpbmcgPSBvYmotPmRldi0+YW5vbl9pbm9kZS0+aV9tYXBwaW5nOwogCiAJcmV0dXJu
IGRtYV9idWY7CiB9Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
