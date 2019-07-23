Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0171350
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA276E1BD;
	Tue, 23 Jul 2019 07:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35609899B7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 07:54:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4AF5AE82;
 Tue, 23 Jul 2019 07:54:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, airlied@redhat.com
Subject: [PATCH 2/3] drm/mgag200: Set cursor scanout address to correct BO
Date: Tue, 23 Jul 2019 09:54:24 +0200
Message-Id: <20190723075425.24028-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723075425.24028-1-tzimmermann@suse.de>
References: <20190723075425.24028-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGhhcmR3YXJlIHJlcXVpcmVzIHRoZSBjb3JyZWN0IG1lbW9yeSBhZGRyZXNzIG9mIHRoZSBi
dWZmZXIuIEN1cnJlbnRseQp0aGUgc2FtZSBCTydzIGFkZHJlc3MgaXMgcHJvZ3JhbW1lZCB1bmNv
bmRpdGlvbmFsbHksIHNvIG9ubHkgZXZlcnkgc2Vjb25kCmN1cnNvciB1cGRhdGUgYWN0dWFsbHkg
YmVjb21lcyB2aXNpYmxlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+CkZpeGVzOiA5NGRjNTdiMTAzOTkgKCJkcm0vbWdhZzIwMDogUmV3cml0
ZSBjdXJzb3IgaGFuZGxpbmciKQpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX2N1cnNvci5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9j
dXJzb3IuYwppbmRleCBhMTk5NzU5MzFjNmQuLmYxMWI4NjJjYmVkOSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jCkBAIC0xMTIsNyArMTEyLDcgQEAgaW50IG1nYV9j
cnRjX2N1cnNvcl9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJImZhaWxlZCB0byBrbWFw
IGN1cnNvciB1cGRhdGVzOiAlZFxuIiwgcmV0KTsKIAkJZ290byBlcnJfZHJtX2dlbV92cmFtX3Vu
cGluX2RzdDsKIAl9Ci0JZ3B1X2FkZHIgPSBkcm1fZ2VtX3ZyYW1fb2Zmc2V0KHBpeGVsc18yKTsK
KwlncHVfYWRkciA9IGRybV9nZW1fdnJhbV9vZmZzZXQocGl4ZWxzX25leHQpOwogCWlmIChncHVf
YWRkciA8IDApIHsKIAkJcmV0ID0gKGludClncHVfYWRkcjsKIAkJZGV2X2VycigmZGV2LT5wZGV2
LT5kZXYsCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
