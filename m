Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E8B65EE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A466F3BB;
	Wed, 18 Sep 2019 14:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92C6F3B9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:23:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05A3DB679;
 Wed, 18 Sep 2019 14:23:11 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com, corbet@lwn.net
Subject: [PATCH 02/11] drm/ast: Don't call ast_show_cursor() from
 ast_cursor_move()
Date: Wed, 18 Sep 2019 16:22:58 +0200
Message-Id: <20190918142307.27127-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VwYXJhdGluZyB0aGUgY3Vyc29yJ3MgbW92ZSgpIGZ1bmN0aW9uIGZyb20gdGhlIHNob3coKSBm
dW5jdGlvbiBpbgpwcmVwYXJhdGlvbiBvZiBmdXJ0aGVyIHJld29yayBvZiB0aGUgY3Vyc29yIHVw
ZGF0ZSBjb2RlLgoKJ1Nob3dpbmcnIHRoZSBjdXJzb3IgZnJvbSB3aXRoaW4gdGhlIG1vdmUoKSBm
dW5jdGlvbiBpcyByZXF1aXJlZCB0bwp1cGRhdGVzIHRoZSBjdXJzb3IgcG9zaXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCmluZGV4
IDZjYWE2ZWJmZWFhOC4uYTRjYmYyZDVlZTBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCkBAIC0x
MjM2LDYgKzEyMzYsNyBAQCBzdGF0aWMgaW50IGFzdF9jdXJzb3JfbW92ZShzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsCiAJc3RydWN0IGFzdF9wcml2YXRlICphc3QgPSBjcnRjLT5kZXYtPmRldl9wcml2
YXRlOwogCWludCB4X29mZnNldCwgeV9vZmZzZXQ7CiAJdTggKnNpZzsKKwl1OCBqcmVnOwogCiAJ
c2lnID0gZHJtX2dlbV92cmFtX2ttYXAoZHJtX2dlbV92cmFtX29mX2dlbShhc3QtPmN1cnNvcl9j
YWNoZSksCiAJCQkJZmFsc2UsIE5VTEwpOwpAQCAtMTI2Miw3ICsxMjYzLDkgQEAgc3RhdGljIGlu
dCBhc3RfY3Vyc29yX21vdmUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCWFzdF9zZXRfaW5kZXhf
cmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhjNywgKCh5ID4+IDgpICYgMHgwNykpOwogCiAJ
LyogZHVtbXkgd3JpdGUgdG8gZmlyZSBIV0MgKi8KLQlhc3Rfc2hvd19jdXJzb3IoY3J0Yyk7CisJ
anJlZyA9IDB4MDIgfAorCSAgICAgICAweDAxOyAvKiBlbmFibGUgQVJHQjQ0NDQgY3Vyc29yICov
CisJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4Y2IsIDB4
ZmMsIGpyZWcpOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
