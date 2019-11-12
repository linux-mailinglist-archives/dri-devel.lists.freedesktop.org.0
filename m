Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC72F916B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 15:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8236E499;
	Tue, 12 Nov 2019 14:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEC16E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:04:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E1D1B2DD;
 Tue, 12 Nov 2019 14:04:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v3 4/5] drm/fb-helper: Remove drm_fb_helper_unlink_fbi()
Date: Tue, 12 Nov 2019 15:04:30 +0100
Message-Id: <20191112140431.7895-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191112140431.7895-1-tzimmermann@suse.de>
References: <20191112140431.7895-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIG5vIGNhbGxlcnMgb2YgZHJtX2ZiX2hlbHBlcl91bmxpbmtfZmJpKCkgbGVmdC4g
UmVtb3ZlIHRoZQpmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMg
fCAxNiArLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmggICAgIHwg
IDYgLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyMSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCAxMDM4YTJmMDYzOWUuLmViOTdmMzRhMTVl
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC01NjMsOCArNTYzLDcgQEAgRVhQT1JUX1NZ
TUJPTChkcm1fZmJfaGVscGVyX3VucmVnaXN0ZXJfZmJpKTsKICAqIGRybV9mYl9oZWxwZXJfZmlu
aSAtIGZpbmlhbGl6ZSBhICZzdHJ1Y3QgZHJtX2ZiX2hlbHBlcgogICogQGZiX2hlbHBlcjogZHJp
dmVyLWFsbG9jYXRlZCBmYmRldiBoZWxwZXIsIGNhbiBiZSBOVUxMCiAgKgotICogVGhpcyBjbGVh
bnMgdXAgYWxsIHJlbWFpbmluZyByZXNvdXJjZXMgYXNzb2NpYXRlZCB3aXRoIEBmYl9oZWxwZXIu
IE11c3QgYmUKLSAqIGNhbGxlZCBhZnRlciBkcm1fZmJfaGVscGVyX3VubGlua19mYmkoKSB3YXMg
Y2FsbGVkLgorICogVGhpcyBjbGVhbnMgdXAgYWxsIHJlbWFpbmluZyByZXNvdXJjZXMgYXNzb2Np
YXRlZCB3aXRoIEBmYl9oZWxwZXIuCiAgKi8KIHZvaWQgZHJtX2ZiX2hlbHBlcl9maW5pKHN0cnVj
dCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCiB7CkBAIC02MDQsMTkgKzYwMyw2IEBAIHZvaWQg
ZHJtX2ZiX2hlbHBlcl9maW5pKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCiB9CiBF
WFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfZmluaSk7CiAKLS8qKgotICogZHJtX2ZiX2hlbHBl
cl91bmxpbmtfZmJpIC0gd3JhcHBlciBhcm91bmQgdW5saW5rX2ZyYW1lYnVmZmVyCi0gKiBAZmJf
aGVscGVyOiBkcml2ZXItYWxsb2NhdGVkIGZiZGV2IGhlbHBlciwgY2FuIGJlIE5VTEwKLSAqCi0g
KiBBIHdyYXBwZXIgYXJvdW5kIHVubGlua19mcmFtZWJ1ZmZlciBpbXBsZW1lbnRlZCBieSBmYmRl
diBjb3JlCi0gKi8KLXZvaWQgZHJtX2ZiX2hlbHBlcl91bmxpbmtfZmJpKHN0cnVjdCBkcm1fZmJf
aGVscGVyICpmYl9oZWxwZXIpCi17Ci0JaWYgKGZiX2hlbHBlciAmJiBmYl9oZWxwZXItPmZiZGV2
KQotCQl1bmxpbmtfZnJhbWVidWZmZXIoZmJfaGVscGVyLT5mYmRldik7Ci19Ci1FWFBPUlRfU1lN
Qk9MKGRybV9mYl9oZWxwZXJfdW5saW5rX2ZiaSk7Ci0KIHN0YXRpYyBib29sIGRybV9mYmRldl91
c2Vfc2hhZG93X2ZiKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCiB7CiAJc3RydWN0
IGRybV9kZXZpY2UgKmRldiA9IGZiX2hlbHBlci0+ZGV2OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2ZiX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oCmluZGV4IGUz
YTc1ZmYwNzM5MC4uMWMyZTBjM2NmODU3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZmJf
aGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oCkBAIC0yMzEsOCArMjMx
LDYgQEAgdm9pZCBkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbywK
IAkJCSAgICAgc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwKIAkJCSAgICAgc3RydWN0
IGRybV9mYl9oZWxwZXJfc3VyZmFjZV9zaXplICpzaXplcyk7CiAKLXZvaWQgZHJtX2ZiX2hlbHBl
cl91bmxpbmtfZmJpKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpOwotCiB2b2lkIGRy
bV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oc3RydWN0IGZiX2luZm8gKmluZm8sCiAJCQkgICAgICAg
c3RydWN0IGxpc3RfaGVhZCAqcGFnZWxpc3QpOwogCkBAIC0zNTYsMTAgKzM1NCw2IEBAIHN0YXRp
YyBpbmxpbmUgaW50IGRybV9mYl9oZWxwZXJfaW9jdGwoc3RydWN0IGZiX2luZm8gKmluZm8sIHVu
c2lnbmVkIGludCBjbWQsCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBkcm1f
ZmJfaGVscGVyX3VubGlua19mYmkoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKLXsK
LX0KLQogc3RhdGljIGlubGluZSB2b2lkIGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oc3RydWN0
IGZiX2luZm8gKmluZm8sCiAJCQkJCSAgICAgc3RydWN0IGxpc3RfaGVhZCAqcGFnZWxpc3QpCiB7
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
