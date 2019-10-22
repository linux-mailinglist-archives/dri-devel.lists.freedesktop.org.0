Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF44E01FF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17646E5A9;
	Tue, 22 Oct 2019 10:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618C16E59B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 10:25:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C392B15A;
 Tue, 22 Oct 2019 10:25:26 +0000 (UTC)
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
Subject: [PATCH 3/5] drm/bochs: Replace prepare_fb()/cleanup_fb() with GEM
 VRAM helpers
Date: Tue, 22 Oct 2019 12:25:18 +0200
Message-Id: <20191022102520.13181-4-tzimmermann@suse.de>
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

R0VNIFZSQU0gcHJvdmlkZXMgYW4gaW1wbGVtZW50YXRpb24gZm9yIHByZXBhcmVfZmIoKSBhbmQg
Y2xlYW51cF9mYigpCm9mIHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcy4gU3dp
dGNoIG92ZXIgYm9jaHMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgfCAy
NiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hz
L2JvY2hzX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCmluZGV4IDA4
OTE2NDA0OTFlYi4uZDc3ZTE3YmI0M2JhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9j
aHMvYm9jaHNfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCkBA
IC02OSwzMyArNjksMTEgQEAgc3RhdGljIHZvaWQgYm9jaHNfcGlwZV91cGRhdGUoc3RydWN0IGRy
bV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCX0KIH0KIAotc3RhdGljIGludCBib2Noc19w
aXBlX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCi0JCQkJIHN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKm5ld19zdGF0ZSkKLXsKLQlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAq
Z2JvOwotCi0JaWYgKCFuZXdfc3RhdGUtPmZiKQotCQlyZXR1cm4gMDsKLQlnYm8gPSBkcm1fZ2Vt
X3ZyYW1fb2ZfZ2VtKG5ld19zdGF0ZS0+ZmItPm9ialswXSk7Ci0JcmV0dXJuIGRybV9nZW1fdnJh
bV9waW4oZ2JvLCBEUk1fR0VNX1ZSQU1fUExfRkxBR19WUkFNKTsKLX0KLQotc3RhdGljIHZvaWQg
Ym9jaHNfcGlwZV9jbGVhbnVwX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAotCQkJCSAgc3Ry
dWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlKQotewotCXN0cnVjdCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0ICpnYm87Ci0KLQlpZiAoIW9sZF9zdGF0ZS0+ZmIpCi0JCXJldHVybjsKLQlnYm8gPSBk
cm1fZ2VtX3ZyYW1fb2ZfZ2VtKG9sZF9zdGF0ZS0+ZmItPm9ialswXSk7Ci0JZHJtX2dlbV92cmFt
X3VucGluKGdibyk7Ci19Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5
X3BpcGVfZnVuY3MgYm9jaHNfcGlwZV9mdW5jcyA9IHsKIAkuZW5hYmxlCSAgICA9IGJvY2hzX3Bp
cGVfZW5hYmxlLAogCS51cGRhdGUJICAgID0gYm9jaHNfcGlwZV91cGRhdGUsCi0JLnByZXBhcmVf
ZmIgPSBib2Noc19waXBlX3ByZXBhcmVfZmIsCi0JLmNsZWFudXBfZmIgPSBib2Noc19waXBlX2Ns
ZWFudXBfZmIsCisJLnByZXBhcmVfZmIgPSBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX2Z1bmNz
X3ByZXBhcmVfZmIsCisJLmNsZWFudXBfZmIgPSBkcm1fZ2VtX3ZyYW1fcGxhbmVfaGVscGVyX2Z1
bmNzX2NsZWFudXBfZmIsCiB9OwogCiBzdGF0aWMgaW50IGJvY2hzX2Nvbm5lY3Rvcl9nZXRfbW9k
ZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
