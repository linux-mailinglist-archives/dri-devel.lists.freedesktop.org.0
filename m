Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6598EE2BD9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 10:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05E56E158;
	Thu, 24 Oct 2019 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A496E181
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 08:14:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1551DB5F8;
 Thu, 24 Oct 2019 08:14:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 3/4] drm/hisilicon/hibmc: Use GEM VRAM's prepare_fb() and
 cleanup_fb() helpers
Date: Thu, 24 Oct 2019 10:14:03 +0200
Message-Id: <20191024081404.6978-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024081404.6978-1-tzimmermann@suse.de>
References: <20191024081404.6978-1-tzimmermann@suse.de>
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

VGhpcyBwYXRjaCBpbXBsZW1lbnRzIHByZXBhcmVfZmIoKSBhbmQgY2xlYW51cF9mYigpIGluIGhp
Ym1jIHdpdGggdGhlCkdFTSBWUkFNIGhlbHBlcnMuIEluIHRoZSBjdXJyZW50IGNvZGUsIHBpbm5p
bmcgdGhlIEJPIGlzIHBlcmZvcm1lZCBieQpoaWJtY19wbGFuZV9hdG9taWNfdXBkYXRlKCksIHdo
ZXJlIHRoZSBvcGVyYXRpb24gZG9lcyBub3QgYmVsb25nLgoKVGhpcyBwYXRjaCBhbHNvIGZpeGVz
IGEgYnVnIHdoZXJlIHRoZSBwaW5uZWQgQk8gd2FzIG5ldmVyIHVucGlubmVkLgpQaW5uaW5nIG11
bHRpcGxlIEJPcyB3b3VsZCBoYXZlIGV4aGF1c2VkIHRoZSBhdmFpbGFibGUgVlJBTSBhbmQgZnVy
dGhlcgpwaW4gb3BlcmF0aW9ucyB3b3VsZCBoYXZlIGZhaWxlZCwgbGVhdmluZyB0aGUgZGlzcGxh
eSBpbiBhIGNvcnJ1cHQKc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1j
L2hpYm1jX2RybV9kZS5jIHwgMTQgKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxp
Y29uL2hpYm1jL2hpYm1jX2RybV9kZS5jCmluZGV4IGNjNGM0MTc0OGNmYi4uNjUyN2E5N2Y2OGEz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9k
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2RlLmMK
QEAgLTk2LDcgKzk2LDYgQEAgc3RhdGljIHZvaWQgaGlibWNfcGxhbmVfYXRvbWljX3VwZGF0ZShz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIHsKIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlCSpzdGF0
ZQk9IHBsYW5lLT5zdGF0ZTsKIAl1MzIgcmVnOwotCWludCByZXQ7CiAJczY0IGdwdV9hZGRyID0g
MDsKIAl1bnNpZ25lZCBpbnQgbGluZV9sOwogCXN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJp
diA9IHBsYW5lLT5kZXYtPmRldl9wcml2YXRlOwpAQCAtMTA5LDE2ICsxMDgsOSBAQCBzdGF0aWMg
dm9pZCBoaWJtY19wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAog
CWhpYm1jX2ZiID0gdG9faGlibWNfZnJhbWVidWZmZXIoc3RhdGUtPmZiKTsKIAlnYm8gPSBkcm1f
Z2VtX3ZyYW1fb2ZfZ2VtKGhpYm1jX2ZiLT5vYmopOwogCi0JcmV0ID0gZHJtX2dlbV92cmFtX3Bp
bihnYm8sIERSTV9HRU1fVlJBTV9QTF9GTEFHX1ZSQU0pOwotCWlmIChyZXQpIHsKLQkJRFJNX0VS
Uk9SKCJmYWlsZWQgdG8gcGluIGJvOiAlZCIsIHJldCk7Ci0JCXJldHVybjsKLQl9CiAJZ3B1X2Fk
ZHIgPSBkcm1fZ2VtX3ZyYW1fb2Zmc2V0KGdibyk7Ci0JaWYgKGdwdV9hZGRyIDwgMCkgewotCQlk
cm1fZ2VtX3ZyYW1fdW5waW4oZ2JvKTsKLQkJcmV0dXJuOwotCX0KKwlpZiAoV0FSTl9PTl9PTkNF
KGdwdV9hZGRyIDwgMCkpCisJCXJldHVybjsgLyogQnVnOiB3ZSBkaWRuJ3QgcGluIHRoZSBCTyB0
byBWUkFNIGluIHByZXBhcmVfZmIuICovCiAKIAl3cml0ZWwoZ3B1X2FkZHIsIHByaXYtPm1taW8g
KyBISUJNQ19DUlRfRkJfQUREUkVTUyk7CiAKQEAgLTE1Nyw2ICsxNDksOCBAQCBzdGF0aWMgc3Ry
dWN0IGRybV9wbGFuZV9mdW5jcyBoaWJtY19wbGFuZV9mdW5jcyA9IHsKIH07CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2hlbHBlcl9mdW5jcyBoaWJtY19wbGFuZV9oZWxwZXJfZnVu
Y3MgPSB7CisJLnByZXBhcmVfZmIJPSBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX3ByZXBhcmVf
ZmIsCisJLmNsZWFudXBfZmIJPSBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX2NsZWFudXBfZmIs
CiAJLmF0b21pY19jaGVjayA9IGhpYm1jX3BsYW5lX2F0b21pY19jaGVjaywKIAkuYXRvbWljX3Vw
ZGF0ZSA9IGhpYm1jX3BsYW5lX2F0b21pY191cGRhdGUsCiB9OwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
