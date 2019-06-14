Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88F946AE5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37D8982E;
	Fri, 14 Jun 2019 20:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AF889349
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:25 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so5201957edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8GghTMCj6wvJSVvB8PXvgr/pYsWXgqm2kXHsMo+HB8=;
 b=kQiTOYcybOKDK4UmLVItWej6Q60nlfPz2Ska++FLPpF9ta32prVlu49eZ6IIx5E4bg
 qs0vagdnSQUoAEA/Kfu77wJgTRrYvdNhH/c+QiKLm7GR0IIDLfw+KGwJA7k9rgXB2hP1
 WEFyehRDsIM4srGaBFCvEbWjbLYTZx5gBDk9u+RkkSGRbEg50XSHaFM5dM2JoWVZ4+DD
 9BlkXmjOe8FDrdTSU8Tm0k3tshlENV5cVdPxuRIZHSMJXU8KtjQO420fBL/l1Nwvozj5
 BoMhe+V+sPGAiI/3kXFVfl/SiRJE4LFF2kvtoZp+eGsAWAN8DppYe/uTg5H4ePKC6PlW
 X9Bg==
X-Gm-Message-State: APjAAAU+g7QrYZeMG22OyB3fFCf+gOvGrzTp5lvLuZe4imp6/QKA9P0L
 inOvvvg6DM/ONgwqwUe6pgg5C2/BBU8=
X-Google-Smtp-Source: APXvYqxqSDXYVjHDnkWcz9+bqUuaitEQ/d3sJokLHSzoLFmRCmpCanuIcBL2GlVEur18SVgs+V7d+g==
X-Received: by 2002:a50:94d9:: with SMTP id t25mr68979897eda.32.1560544643912; 
 Fri, 14 Jun 2019 13:37:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 54/59] drm/prime: Ditch gem_prime_res_obj hook
Date: Fri, 14 Jun 2019 22:36:10 +0200
Message-Id: <20190614203615.12639-55-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8GghTMCj6wvJSVvB8PXvgr/pYsWXgqm2kXHsMo+HB8=;
 b=eSaY9hOBKfcWbb1pvm/A416/HrjWdY5fVvnb2kBqi0HMimvxLtCSGTTvKJysRH1ENe
 HQeOTm/x62qn4znksZdjAERDmsArAph/XtDfddeG8EjeNR+pjuYh0/lYXKYkkY1Gu3z1
 aORpyO2nmPCfh/RfxeVPJ7q51DtF2pXHB7xpk=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlcnlvbmUgaXMganVzdCB1c2luZyBnZW1fb2JqZWN0LT5yZXN2IG5vdy4KClNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KLS0tCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAg
fCAgOSAtLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8ICAzIC0tLQogaW5j
bHVkZS9kcm0vZHJtX2Rydi5oICAgICAgIHwgMTIgLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5n
ZWQsIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8u
cnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKaW5kZXggMjM1ODNmMGUzNzU1Li44MWZi
YjE1Yzk0YzYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CisrKyBiL0Rv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CkBAIC0xOTYsMTUgKzE5Niw2IEBAIE1pZ2h0IGJlIGdv
b2QgdG8gYWxzbyBoYXZlIHNvbWUgaWd0IHRlc3RjYXNlcyBmb3IgdGhpcy4KIAogQ29udGFjdDog
RGFuaWVsIFZldHRlciwgTm9yYWxmIFRyb25uZXMKIAotUmVtb3ZlIHRoZSAtPmdlbV9wcmltZV9y
ZXNfb2JqIGNhbGxiYWNrCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQotCi1UaGUgLT5nZW1fcHJpbWVfcmVzX29iaiBjYWxsYmFjayBjYW4gYmUgcmVtb3ZlZCBm
cm9tIGRyaXZlcnMgYnkgdXNpbmcgdGhlCi1yZXNlcnZhdGlvbl9vYmplY3QgaW4gdGhlIGRybV9n
ZW1fb2JqZWN0LiBJdCBtYXkgYWxzbyBiZSBwb3NzaWJsZSB0byB1c2UgdGhlCi1nZW5lcmljIGRy
bV9nZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQgaGVscGVyIGZvciB3YWl0aW5nIGZvciBhIGJv
LgotCi1Db250YWN0OiBEYW5pZWwgVmV0dGVyCi0KIGlkcl9pbml0X2Jhc2UoKQogLS0tLS0tLS0t
LS0tLS0tCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcHJpbWUuYwppbmRleCA1OGQ1OTVmNGE0ZjUuLjY1ZTYxMTMzNzI1NCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcHJpbWUuYwpAQCAtODMyLDkgKzgzMiw2IEBAIHN0cnVjdCBkbWFfYnVmICpkcm1f
Z2VtX3ByaW1lX2V4cG9ydChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIAkJLnJlc3YgPSBv
YmotPnJlc3YsCiAJfTsKIAotCWlmIChkZXYtPmRyaXZlci0+Z2VtX3ByaW1lX3Jlc19vYmopCi0J
CWV4cF9pbmZvLnJlc3YgPSBkZXYtPmRyaXZlci0+Z2VtX3ByaW1lX3Jlc19vYmoob2JqKTsKLQog
CXJldHVybiBkcm1fZ2VtX2RtYWJ1Zl9leHBvcnQoZGV2LCAmZXhwX2luZm8pOwogfQogRVhQT1JU
X1NZTUJPTChkcm1fZ2VtX3ByaW1lX2V4cG9ydCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fZHJ2LmggYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKaW5kZXggZWMxYzYzODkyN2IwLi5iMDFh
MzBjNjQwNzUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZHJ2LmgKQEAgLTYxOCwxOCArNjE4LDYgQEAgc3RydWN0IGRybV9kcml2ZXIgewog
CSAqLwogCXN0cnVjdCBzZ190YWJsZSAqKCpnZW1fcHJpbWVfZ2V0X3NnX3RhYmxlKShzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaik7CiAKLQkvKioKLQkgKiBAZ2VtX3ByaW1lX3Jlc19vYmo6Ci0J
ICoKLQkgKiBPcHRpb25hbCBob29rIHRvIGxvb2sgdXAgdGhlICZyZXNlcnZhdGlvbl9vYmplY3Qg
Zm9yIGFuIGJ1ZmZlciB3aGVuCi0JICogZXhwb3J0aW5nIGl0LgotCSAqCi0JICogRklYTUU6IFRo
aXMgaG9vayBpcyBkZXByZWNhdGVkLiBVc2VyIG9mIHRoaXMgaG9vayBzaG91bGQgYmUgcmVwbGFj
ZWQKLQkgKiBieSBzZXR0aW5nICZkcm1fZ2VtX29iamVjdC5yZXN2IGluc3RlYWQuCi0JICovCi0J
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqICgqZ2VtX3ByaW1lX3Jlc19vYmopKAotCQkJCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKLQogCS8qKgogCSAqIEBnZW1fcHJpbWVfaW1wb3J0
X3NnX3RhYmxlOgogCSAqCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
