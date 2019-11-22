Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6FB106692
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 07:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926B66E21E;
	Fri, 22 Nov 2019 06:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882A06E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 06:38:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-TBtFseKXMp6LDL4WsY81WA-1; Fri, 22 Nov 2019 01:37:55 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22958593CE;
 Fri, 22 Nov 2019 06:37:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F975DF2C;
 Fri, 22 Nov 2019 06:37:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B368A1E0; Fri, 22 Nov 2019 07:37:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm: share address space for dma bufs
Date: Fri, 22 Nov 2019 07:37:49 +0100
Message-Id: <20191122063749.27113-3-kraxel@redhat.com>
In-Reply-To: <20191122063749.27113-1-kraxel@redhat.com>
References: <20191122063749.27113-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: TBtFseKXMp6LDL4WsY81WA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574404679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kO/f20OK8ehETRWvdOhwDSCz6FJfjfQn0GgthZnU0Rc=;
 b=OiGVLPEhhszZ08NhUsVnCAzZLQTHi5Pr/l/afZGSx9aXBpGP2HPK3BYM1TR7TYGx/xsdpP
 dxL/EP1ej7bSd0xiadpvzXSRwzSPw+YfeLE/Ir+t+vIRODyKIy/n+JiTBZCamz87rjomqD
 LgjFLGfISWVNlgaHmax7M2PUDOOYyuE=
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
MIME-Version: 1.0
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
aWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgNCArLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMgICAgICAgICAgICAgICAgIHwgNCArKystCiAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwppbmRleCBkNWJjZGZlZmJhZDYuLjU4NmRiNGZi
NDZiZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9i
dWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCkBA
IC0zNjEsMTAgKzM2MSw4IEBAIHN0cnVjdCBkbWFfYnVmICphbWRncHVfZ2VtX3ByaW1lX2V4cG9y
dChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmosCiAJCXJldHVybiBFUlJfUFRSKC1FUEVSTSk7
CiAKIAlidWYgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydChnb2JqLCBmbGFncyk7Ci0JaWYgKCFJU19F
UlIoYnVmKSkgewotCQlidWYtPmZpbGUtPmZfbWFwcGluZyA9IGdvYmotPmRldi0+YW5vbl9pbm9k
ZS0+aV9tYXBwaW5nOworCWlmICghSVNfRVJSKGJ1ZikpCiAJCWJ1Zi0+b3BzID0gJmFtZGdwdV9k
bWFidWZfb3BzOwotCX0KIAogCXJldHVybiBidWY7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKaW5kZXggYTk2
MzNiZDI0MWJiLi5jM2ZjMzQxNDUzYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKQEAgLTI0MCw2ICsyNDAs
NyBAQCB2b2lkIGRybV9wcmltZV9kZXN0cm95X2ZpbGVfcHJpdmF0ZShzdHJ1Y3QgZHJtX3ByaW1l
X2ZpbGVfcHJpdmF0ZSAqcHJpbWVfZnByaXYpCiBzdHJ1Y3QgZG1hX2J1ZiAqZHJtX2dlbV9kbWFi
dWZfZXhwb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJICAgICAgc3RydWN0IGRtYV9i
dWZfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQogeworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
ID0gZXhwX2luZm8tPnByaXY7CiAJc3RydWN0IGRtYV9idWYgKmRtYV9idWY7CiAKIAlkbWFfYnVm
ID0gZG1hX2J1Zl9leHBvcnQoZXhwX2luZm8pOwpAQCAtMjQ3LDcgKzI0OCw4IEBAIHN0cnVjdCBk
bWFfYnVmICpkcm1fZ2VtX2RtYWJ1Zl9leHBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJ
cmV0dXJuIGRtYV9idWY7CiAKIAlkcm1fZGV2X2dldChkZXYpOwotCWRybV9nZW1fb2JqZWN0X2dl
dChleHBfaW5mby0+cHJpdik7CisJZHJtX2dlbV9vYmplY3RfZ2V0KG9iaik7CisJZG1hX2J1Zi0+
ZmlsZS0+Zl9tYXBwaW5nID0gb2JqLT5kZXYtPmFub25faW5vZGUtPmlfbWFwcGluZzsKIAogCXJl
dHVybiBkbWFfYnVmOwogfQotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
