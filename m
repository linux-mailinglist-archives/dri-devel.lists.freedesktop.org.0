Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F6158277
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15346E1A4;
	Thu, 27 Jun 2019 12:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAAF6E186
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:23:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 89FB3308793B;
 Thu, 27 Jun 2019 12:23:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAC531001B0E;
 Thu, 27 Jun 2019 12:23:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 05CF116E1A; Thu, 27 Jun 2019 14:23:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/bochs: pass framebuffer to bochs_hw_setbase
Date: Thu, 27 Jun 2019 14:23:45 +0200
Message-Id: <20190627122348.5833-3-kraxel@redhat.com>
In-Reply-To: <20190627122348.5833-1-kraxel@redhat.com>
References: <20190627122348.5833-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 27 Jun 2019 12:23:59 +0000 (UTC)
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
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyByZW5hbWUgdG8gYm9jaHNfaHdfc2V0ZmIsIHdlIGhhdmUgdG8gc2V0IG1vcmUKdGhhbiBq
dXN0IHRoZSBiYXNlIGFkZHJlc3MuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCAgICAgfCAg
NSArKystLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgIHwgMTAgKysrKystLS0t
LQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIHwgMTAgKysrLS0tLS0tLQogMyBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9ib2No
cy9ib2Nocy5oCmluZGV4IGNjMzVkNDkyMTQyYy4uMjQ2ZjA1ZjRhNzExIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHMuaApAQCAtODUsOCArODUsOSBAQCB2b2lkIGJvY2hzX2h3X3NldG1vZGUoc3RydWN0IGJv
Y2hzX2RldmljZSAqYm9jaHMsCiAJCSAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2Rl
KTsKIHZvaWQgYm9jaHNfaHdfc2V0Zm9ybWF0KHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAog
CQkJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0KTsKLXZvaWQgYm9jaHNfaHdf
c2V0YmFzZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKLQkJICAgICAgaW50IHgsIGludCB5
LCB1NjQgYWRkcik7Cit2b2lkIGJvY2hzX2h3X3NldGZiKHN0cnVjdCBib2Noc19kZXZpY2UgKmJv
Y2hzLAorCQkgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCisJCSAgICBpbnQgeCwgaW50
IHkpOwogaW50IGJvY2hzX2h3X2xvYWRfZWRpZChzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2Nocyk7
CiAKIC8qIGJvY2hzX21tLmMgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9i
b2Noc19ody5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKaW5kZXggNzkxYWIy
Zjc5OTQ3Li42NzEwMWM4NTAyOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9i
b2Noc19ody5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCkBAIC0yNTQs
MTcgKzI1NCwxNyBAQCB2b2lkIGJvY2hzX2h3X3NldGZvcm1hdChzdHJ1Y3QgYm9jaHNfZGV2aWNl
ICpib2NocywKIAl9OwogfQogCi12b2lkIGJvY2hzX2h3X3NldGJhc2Uoc3RydWN0IGJvY2hzX2Rl
dmljZSAqYm9jaHMsCi0JCSAgICAgIGludCB4LCBpbnQgeSwgdTY0IGFkZHIpCit2b2lkIGJvY2hz
X2h3X3NldGZiKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAorCQkgICAgc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIsCisJCSAgICBpbnQgeCwgaW50IHkpCiB7Ci0JdW5zaWduZWQgbG9uZyBv
ZmZzZXQgPSAodW5zaWduZWQgbG9uZylhZGRyICsKKwlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVj
dCAqYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGZiLT5vYmpbMF0pOworCXVuc2lnbmVkIGxvbmcg
b2Zmc2V0ID0gYm8tPmJvLm9mZnNldCArCiAJCXkgKiBib2Nocy0+c3RyaWRlICsKIAkJeCAqIChi
b2Nocy0+YnBwIC8gOCk7CiAJaW50IHZ5ID0gb2Zmc2V0IC8gYm9jaHMtPnN0cmlkZTsKIAlpbnQg
dnggPSAob2Zmc2V0ICUgYm9jaHMtPnN0cmlkZSkgKiA4IC8gYm9jaHMtPmJwcDsKIAotCURSTV9E
RUJVR19EUklWRVIoInggJWQsIHkgJWQsIGFkZHIgJWxseCAtPiBvZmZzZXQgJWx4LCB2eCAlZCwg
dnkgJWRcbiIsCi0JCQkgeCwgeSwgYWRkciwgb2Zmc2V0LCB2eCwgdnkpOwogCWJvY2hzX2Rpc3Bp
X3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfWF9PRkZTRVQsIHZ4KTsKIAlib2Noc19kaXNw
aV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1lfT0ZGU0VULCB2eSk7CiB9CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
Ym9jaHMvYm9jaHNfa21zLmMKaW5kZXggNTkwNGVkZGM4M2E1Li5kZGJmMDgwMjEzOGQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKQEAgLTI3LDE2ICsyNywxMiBAQCBzdGF0aWMgY29uc3Qg
dWludDMyX3QgYm9jaHNfZm9ybWF0c1tdID0gewogc3RhdGljIHZvaWQgYm9jaHNfcGxhbmVfdXBk
YXRlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAogCQkJICAgICAgIHN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKnN0YXRlKQogewotCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm87Ci0K
IAlpZiAoIXN0YXRlLT5mYiB8fCAhYm9jaHMtPnN0cmlkZSkKIAkJcmV0dXJuOwogCi0JZ2JvID0g
ZHJtX2dlbV92cmFtX29mX2dlbShzdGF0ZS0+ZmItPm9ialswXSk7Ci0JYm9jaHNfaHdfc2V0YmFz
ZShib2NocywKLQkJCSBzdGF0ZS0+Y3J0Y194LAotCQkJIHN0YXRlLT5jcnRjX3ksCi0JCQkgZ2Jv
LT5iby5vZmZzZXQpOworCWJvY2hzX2h3X3NldGZiKGJvY2hzLCBzdGF0ZS0+ZmIsCisJCSAgICAg
ICBzdGF0ZS0+Y3J0Y194LAorCQkgICAgICAgc3RhdGUtPmNydGNfeSk7CiAJYm9jaHNfaHdfc2V0
Zm9ybWF0KGJvY2hzLCBzdGF0ZS0+ZmItPmZvcm1hdCk7CiB9CiAKLS0gCjIuMTguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
