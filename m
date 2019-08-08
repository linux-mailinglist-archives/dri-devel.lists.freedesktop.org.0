Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0E786385
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDAF6E861;
	Thu,  8 Aug 2019 13:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8F36E851
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F08930A7BBD;
 Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01BB61000343;
 Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 375179D3C; Thu,  8 Aug 2019 15:44:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 11/17] drm/vram: drop verify_access
Date: Thu,  8 Aug 2019 15:44:11 +0200
Message-Id: <20190808134417.10610-12-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 08 Aug 2019 13:44:24 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAg
fCAgMyAtLS0KIGluY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oICAgICAgfCAgMyAtLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAgMSAtCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMgIHwgMTEgLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hh
bmdlZCwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92
cmFtX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oCmluZGV4IDcw
MWQyYzQ2YTRmNC4uNzcyM2FkNTlhMGM1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2Vt
X3ZyYW1faGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oCkBA
IC05OCw5ICs5OCw2IEBAIGludCBkcm1fZ2VtX3ZyYW1fZmlsbF9jcmVhdGVfZHVtYihzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUsCiB2b2lkIGRybV9nZW1fdnJhbV9ib19kcml2ZXJfZXZpY3RfZmxhZ3Mo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCQkJc3RydWN0IHR0bV9wbGFjZW1lbnQg
KnBsKTsKIAotaW50IGRybV9nZW1fdnJhbV9ib19kcml2ZXJfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAotCQkJCQkgc3RydWN0IGZpbGUgKmZpbHApOwotCiBleHRl
cm4gY29uc3Qgc3RydWN0IGRybV92cmFtX21tX2Z1bmNzIGRybV9nZW1fdnJhbV9tbV9mdW5jczsK
IAogLyoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oIGIvaW5j
bHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKaW5kZXggZmYzMjhiZGFhNjM4Li5mMjcyYWRj
OGFkMzcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oCisrKyBi
L2luY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oCkBAIC0xMyw4ICsxMyw2IEBAIHN0cnVj
dCBkcm1fZGV2aWNlOwogICogc3RydWN0IGRybV92cmFtX21tX2Z1bmNzIC0gQ2FsbGJhY2sgZnVu
Y3Rpb25zIGZvciAmc3RydWN0IGRybV92cmFtX21tCiAgKiBAZXZpY3RfZmxhZ3M6CVByb3ZpZGVz
IGFuIGltcGxlbWVudGF0aW9uIGZvciBzdHJ1Y3QgXAogCSZ0dG1fYm9fZHJpdmVyLmV2aWN0X2Zs
YWdzCi0gKiBAdmVyaWZ5X2FjY2VzczoJUHJvdmlkZXMgYW4gaW1wbGVtZW50YXRpb24gZm9yIFwK
LQlzdHJ1Y3QgJnR0bV9ib19kcml2ZXIudmVyaWZ5X2FjY2VzcwogICoKICAqIFRoZXNlIGNhbGxi
YWNrIGZ1bmN0aW9uIGludGVncmF0ZSBWUkFNIE1NIHdpdGggVFRNIGJ1ZmZlciBvYmplY3RzLiBO
ZXcKICAqIGZ1bmN0aW9ucyBjYW4gYmUgYWRkZWQgaWYgbmVjZXNzYXJ5LgpAQCAtMjIsNyArMjAs
NiBAQCBzdHJ1Y3QgZHJtX2RldmljZTsKIHN0cnVjdCBkcm1fdnJhbV9tbV9mdW5jcyB7CiAJdm9p
ZCAoKmV2aWN0X2ZsYWdzKShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJICAgIHN0
cnVjdCB0dG1fcGxhY2VtZW50ICpwbGFjZW1lbnQpOwotCWludCAoKnZlcmlmeV9hY2Nlc3MpKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCBmaWxlICpmaWxwKTsKIH07CiAKIC8q
KgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggZWQxNjI1ZjZhMjk2Li40
MWJiOTY5MDc5ZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwpAQCAtNDQ1
LDcgKzQ0NSw2IEBAIEVYUE9SVF9TWU1CT0woZHJtX2dlbV92cmFtX2JvX2RyaXZlcl92ZXJpZnlf
YWNjZXNzKTsKICAqLwogY29uc3Qgc3RydWN0IGRybV92cmFtX21tX2Z1bmNzIGRybV9nZW1fdnJh
bV9tbV9mdW5jcyA9IHsKIAkuZXZpY3RfZmxhZ3MgPSBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX2V2
aWN0X2ZsYWdzLAotCS52ZXJpZnlfYWNjZXNzID0gZHJtX2dlbV92cmFtX2JvX2RyaXZlcl92ZXJp
ZnlfYWNjZXNzCiB9OwogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fbW1fZnVuY3MpOwogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMKaW5kZXggOGY2ZTI2YjNkYTY5Li4wNTlhMjE2
ZDZlNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmMKQEAgLTg5LDE2ICs4OSw2
IEBAIHN0YXRpYyB2b2lkIGJvX2RyaXZlcl9ldmljdF9mbGFncyhzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAogCQl2bW0tPmZ1bmNzLT5ldmljdF9mbGFncyhibywgcGxhY2VtZW50KTsKIH0K
IAotc3RhdGljIGludCBib19kcml2ZXJfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAotCQkJCSAgIHN0cnVjdCBmaWxlICpmaWxwKQotewotCXN0cnVjdCBkcm1fdnJh
bV9tbSAqdm1tID0gZHJtX3ZyYW1fbW1fb2ZfYmRldihiby0+YmRldik7Ci0KLQlpZiAoIXZtbS0+
ZnVuY3MgfHwgIXZtbS0+ZnVuY3MtPnZlcmlmeV9hY2Nlc3MpCi0JCXJldHVybiAwOwotCXJldHVy
biB2bW0tPmZ1bmNzLT52ZXJpZnlfYWNjZXNzKGJvLCBmaWxwKTsKLX0KLQogc3RhdGljIGludCBi
b19kcml2ZXJfaW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJCQkJ
ICAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQogewpAQCAtMTQwLDcgKzEzMCw2IEBAIHN0YXRp
YyBzdHJ1Y3QgdHRtX2JvX2RyaXZlciBib19kcml2ZXIgPSB7CiAJLmluaXRfbWVtX3R5cGUgPSBi
b19kcml2ZXJfaW5pdF9tZW1fdHlwZSwKIAkuZXZpY3Rpb25fdmFsdWFibGUgPSB0dG1fYm9fZXZp
Y3Rpb25fdmFsdWFibGUsCiAJLmV2aWN0X2ZsYWdzID0gYm9fZHJpdmVyX2V2aWN0X2ZsYWdzLAot
CS52ZXJpZnlfYWNjZXNzID0gYm9fZHJpdmVyX3ZlcmlmeV9hY2Nlc3MsCiAJLmlvX21lbV9yZXNl
cnZlID0gYm9fZHJpdmVyX2lvX21lbV9yZXNlcnZlLAogCS5pb19tZW1fZnJlZSA9IGJvX2RyaXZl
cl9pb19tZW1fZnJlZSwKIH07Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
