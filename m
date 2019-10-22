Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075DE0202
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86EB6E59B;
	Tue, 22 Oct 2019 10:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4196E5AB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 10:25:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09EF2B19A;
 Tue, 22 Oct 2019 10:25:27 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, noralf@tronnes.org, sam@ravnborg.org, daniel@ffwll.ch,
 airlied@linux.ie, joel@jms.id.au, andrew@aj.id.au,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linus.walleij@linaro.org, marex@denx.de, stefan@agner.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, eric@anholt.net,
 david@lechnology.com, hdegoede@redhat.com,
 oleksandr_andrushchenko@epam.com, liviu.dudau@arm.com, ck.hu@mediatek.com
Subject: [PATCH 4/5] drm/hisilicon/hibmc: Use GEM VRAM's prepare_fb() and
 cleanup_fb() helpers
Date: Tue, 22 Oct 2019 12:25:19 +0200
Message-Id: <20191022102520.13181-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022102520.13181-1-tzimmermann@suse.de>
References: <20191022102520.13181-1-tzimmermann@suse.de>
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
Y29uL2hpYm1jL2hpYm1jX2RybV9kZS5jCmluZGV4IGNjNGM0MTc0OGNmYi4uNmQ4NzY0OGRmNTNj
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
Y3MgPSB7CisJLnByZXBhcmVfZmIJPSBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX2Z1bmNzX3By
ZXBhcmVfZmIsCisJLmNsZWFudXBfZmIJPSBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX2Z1bmNz
X2NsZWFudXBfZmIsCiAJLmF0b21pY19jaGVjayA9IGhpYm1jX3BsYW5lX2F0b21pY19jaGVjaywK
IAkuYXRvbWljX3VwZGF0ZSA9IGhpYm1jX3BsYW5lX2F0b21pY191cGRhdGUsCiB9OwotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
