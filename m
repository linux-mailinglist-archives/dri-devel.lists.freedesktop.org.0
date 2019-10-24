Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C5E300C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 13:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9796E2A5;
	Thu, 24 Oct 2019 11:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09896E2A5;
 Thu, 24 Oct 2019 11:16:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v3so1762090wmh.1;
 Thu, 24 Oct 2019 04:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCQaA/HwCTAIu7RWh6OLFtX0XDvs1xwjUEkUewqaQ5o=;
 b=RJri05qyFmWkZej7QvD+uR6mF3jw2uz643jry/A8QALKzz4fSAChPgRH1VSctmjBqt
 k6Nmj+xIFK8R5VyjZupwNdUc3wC7tYn74yIzDot4YQSEgVebtfMQEJKFS2xllsftPR/R
 rr5Cxs2aJ1GE2KapuK+kCAeyOmi044V+7qWb+4wGrGs5ETk518g2hiZvEtaU5jbphluE
 vVm2MDY/ityKGW6cOXgjrSp0qsu2fdQokHpdI58t/tQlksT0C++T+8DCVSrYZgigQ4xH
 pDPKJWl9juVXlNDC08f0PvaC+wfzpIauhruhW2kqsnNvl9hWV4sqDyB/TGifGAHWNcV0
 EoVQ==
X-Gm-Message-State: APjAAAXRRLnap8/lRrywvTeIZaU7I9uTyCCP2tr1byehpzZ28rINUAkg
 yJu9LHpxgqsVfHT89Qp7JCbNakWA
X-Google-Smtp-Source: APXvYqwNJj/s5ncCyavF1dfw67l8mX9plop2wlS1buseBzJTnll7F8CtJfbit6tS7N70Ae8KZtaxWQ==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr4135636wmk.122.1571915794444; 
 Thu, 24 Oct 2019 04:16:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c1c6:7e3f:6219:69f7])
 by smtp.gmail.com with ESMTPSA id r65sm2310210wmr.9.2019.10.24.04.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:16:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 David1.Zhou@amd.com
Subject: [PATCH] drm/ttm: use the parent resv for ghost objects v3
Date: Thu, 24 Oct 2019 13:16:32 +0200
Message-Id: <20191024111632.1836-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aCQaA/HwCTAIu7RWh6OLFtX0XDvs1xwjUEkUewqaQ5o=;
 b=a2HwealmptzOa/gD8XCQ2u68IbXTrafOWXJhkDzpBA01lXlUgTr8vtQplQtz8wE6cR
 Hbpboxjglzh4H3Me7QUUaE+hcBo/FSa19Yi3Re+rcs1++q7Cz6bP4HtXdrA3kMgt3UzZ
 Y5rjlwhv2y2hdTicO3g0Or6xe3ciMcBFHJTEZDrFbQaFcM8CC9oYZZRu7TUEmodmJGbC
 QOoEtpLl/67V7cbFskqxUUK99Z2d2JPBD2jI3D47yR/xzc4JssvQvz7Xw/86bDGZBRf8
 l11VJN3pAguBlwY++fZqMjHjwUjQWGO3k4Gx3DQqeZJ26ZBpWNSDoozMAU0jYeI5WY2K
 TjyQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXkgdGhlIFRUTSBpcyBkZXN0cm95ZWQgd2l0aCB0aGUgY29ycmVjdCBkbWFfcmVzdiBv
YmplY3QKbG9ja2VkIGFuZCB3ZSBjYW4gZXZlbiBwaXBlbGluZSBpbXBvcnRlZCBCTyBldmljdGlv
bnMuCgp2MjogTGltaXQgdGhpcyB0byBvbmx5IGNhc2VzIHdoZW4gdGhlIHBhcmVudCBvYmplY3Qg
dXNlcyBhIHNlcGFyYXRlCiAgICByZXNlcnZhdGlvbiBvYmplY3QgYXMgd2VsbC4gVGhpcyBmaXhl
cyBhbm90aGVyIE9PTSBwcm9ibGVtLgp2MzogZml4IGluaXQgYW5kIHRyeV9sb2NrIG9uIHRoZSB3
cm9uZyBvYmplY3QKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAy
MCArKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCmluZGV4IDczYTFiMDE4
NjAyOS4uZjdiNTdjYTFhOTViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b191dGlsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCkBAIC01MTYs
OSArNTE2LDExIEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAlrcmVmX2luaXQoJmZiby0+YmFzZS5rcmVmKTsKIAlm
Ym8tPmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95OwogCWZiby0+YmFzZS5h
Y2Nfc2l6ZSA9IDA7Ci0JZmJvLT5iYXNlLmJhc2UucmVzdiA9ICZmYm8tPmJhc2UuYmFzZS5fcmVz
djsKLQlkbWFfcmVzdl9pbml0KGZiby0+YmFzZS5iYXNlLnJlc3YpOwotCXJldCA9IGRtYV9yZXN2
X3RyeWxvY2soZmJvLT5iYXNlLmJhc2UucmVzdik7CisJaWYgKGJvLT5iYXNlLnJlc3YgPT0gJmJv
LT5iYXNlLl9yZXN2KQorCQlmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9y
ZXN2OworCisJZG1hX3Jlc3ZfaW5pdCgmZmJvLT5iYXNlLmJhc2UuX3Jlc3YpOworCXJldCA9IGRt
YV9yZXN2X3RyeWxvY2soJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKIAlXQVJOX09OKCFyZXQpOwog
CiAJKm5ld19vYmogPSAmZmJvLT5iYXNlOwpAQCAtNzE1LDcgKzcxNyw3IEBAIGludCB0dG1fYm9f
bW92ZV9hY2NlbF9jbGVhbnVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCWlmIChy
ZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0JCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKGdob3N0X29i
ai0+YmFzZS5yZXN2LCBmZW5jZSk7CisJCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9zdF9v
YmotPmJhc2UuX3Jlc3YsIGZlbmNlKTsKIAogCQkvKioKIAkJICogSWYgd2UncmUgbm90IG1vdmlu
ZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0CkBAIC03MjgsNyArNzMwLDcgQEAgaW50
IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9v
YmopOworCQlkbWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7CiAJCXR0bV9i
b19wdXQoZ2hvc3Rfb2JqKTsKIAl9CiAKQEAgLTc3MSw3ICs3NzMsNyBAQCBpbnQgdHRtX2JvX3Bp
cGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJaWYgKHJldCkKIAkJ
CXJldHVybiByZXQ7CiAKLQkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rfb2JqLT5iYXNl
LnJlc3YsIGZlbmNlKTsKKwkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoJmdob3N0X29iai0+YmFz
ZS5fcmVzdiwgZmVuY2UpOwogCiAJCS8qKgogCQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZp
eGVkIG1lbW9yeSwgdGhlIFRUTSBvYmplY3QKQEAgLTc4NCw3ICs3ODYsNyBAQCBpbnQgdHRtX2Jv
X3BpcGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxzZQogCQkJ
Ym8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOworCQlkbWFf
cmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7CiAJCXR0bV9ib19wdXQoZ2hvc3Rf
b2JqKTsKIAogCX0gZWxzZSBpZiAoZnJvbS0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVE
KSB7CkBAIC04NDAsNyArODQyLDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJl
dCA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKGdob3N0LT5iYXNlLnJlc3YsIGJvLT5iYXNlLnJlc3Yp
OworCXJldCA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKCZnaG9zdC0+YmFzZS5fcmVzdiwgYm8tPmJh
c2UucmVzdik7CiAJLyogTGFzdCByZXNvcnQsIHdhaXQgZm9yIHRoZSBCTyB0byBiZSBpZGxlIHdo
ZW4gd2UgYXJlIE9PTSAqLwogCWlmIChyZXQpCiAJCXR0bV9ib193YWl0KGJvLCBmYWxzZSwgZmFs
c2UpOwpAQCAtODQ5LDcgKzg1MSw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogCWJvLT5tZW0ubWVtX3R5cGUgPSBUVE1fUExfU1lT
VEVNOwogCWJvLT50dG0gPSBOVUxMOwogCi0JdHRtX2JvX3VucmVzZXJ2ZShnaG9zdCk7CisJZG1h
X3Jlc3ZfdW5sb2NrKCZnaG9zdC0+YmFzZS5fcmVzdik7CiAJdHRtX2JvX3B1dChnaG9zdCk7CiAK
IAlyZXR1cm4gMDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
