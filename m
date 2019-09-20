Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B677B97DC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 21:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132E6E0BB;
	Fri, 20 Sep 2019 19:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04706E0BB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 19:36:02 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id n11so2883500ywn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 12:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r27pJo91QpO7bKM8Lp6TXgu9Rs6sf8em9A1gFRf00oE=;
 b=cGYQimXS2QZbrHC1zUP2aLdjyv+SRXVHbfZnDAXCyJYqKQjJZ4XTLswQ6YBORIqHBD
 QYKnmeO1BaQ6FsvyJpNa1VZj1L6P9o0fvt1vII27kug+8qJYOOBAHxINENKzuCseezCv
 IQaqQodjAPyf+XuqQ64bMX5CzYzOW8PdxErbz6pi8eRK34zEIFmmNcGwSweMGtxtDQzw
 5s3dV1j4rDYR6qwmhWVq1JSevXsUprq96h2IF3LMab88qUDRuEzX8+ZeXCkjWMrDGx+U
 rfafSrlwyZO4xzYFqdezAuH79l0N02RPdmdOQds9iCvzFKqwzKuClYqGyDyM1ZLSyFCX
 fg5w==
X-Gm-Message-State: APjAAAXB/fnI2kEhJpRHMyXsPdalOeVqgGo/txxbBGoYf1lKob1w6npa
 1FVJJ6Eq+7hd8G5MPhvZnY3Im0w8eJlYOw==
X-Google-Smtp-Source: APXvYqwOOAA02s9o6SUl/Ha9P4+dQM83JGTWQj2zmMbuwOawEUkj1+HAIwW55Lm29Y8EBtldBd9PqA==
X-Received: by 2002:a81:628a:: with SMTP id
 w132mr14682435ywb.290.1569008161471; 
 Fri, 20 Sep 2019 12:36:01 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g1sm655126ywk.53.2019.09.20.12.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 12:35:59 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Fix duplicate const warning in drm_gem_ttm_helper.c
Date: Fri, 20 Sep 2019 15:35:51 -0400
Message-Id: <20190920193558.89815-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r27pJo91QpO7bKM8Lp6TXgu9Rs6sf8em9A1gFRf00oE=;
 b=WOwdN1o6x27mPCn2RbPXDxhuuAAHceXlyVdKKpqUNT1P9moo00QlqWCJ1RX67yr1hO
 aEAlL+emgiL5EM3Cvn0F7iXN7BKwX+IdqxVWsQI92T0/66b4InlO6Itjt7dbDrxHTPO4
 7lwLb5Z2faq611SBPaoDWjYHDX4B6/bjioX4D0ppeehZvyLcZx903BdiMtzFQ9J+xg+h
 i8S26gWRrVrwteiOO5ZETrz7cv4LEb8JBPIMRWme3H3bthXO3Q6hh5rWsDVVG0WSM8om
 LcOdwfOPMJBDdU35KOYb3STdLmLneAgfb5SxoF4OeR6xpY/K5ju2BwFgy4sV4PehbrGE
 SUZA==
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGb3IgdGhlIHdhcm5pbmcK
Li4vZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jOjI2OjIwOiB3YXJuaW5nOiBk
dXBsaWNhdGUg4oCYY29uc3TigJkgZGVjbGFyYXRpb24gc3BlY2lmaWVyIFstV2R1cGxpY2F0ZS1k
ZWNsLXNwZWNpZmllcl0KClJlYWRpbmcgYmV0d2VlbiB0aGUgbGluZXMsIEkgdGhpbmsgdGhlIGRv
dWJsZSBjb25zdCBpcyB0byBwcmVzZXJ2ZSBib3RoCnRoZSB2YWx1ZXMgYW5kIHRoZSBwb2ludGVy
cyBpbiB0aGUgYXJyYXkgKHdoaWNoIG1ha2VzIHRvdGFsIHNlbnNlKS4gVGhpcwpwYXRjaCBtb3Zl
cyB0aGUgc2Vjb25kIGNvbnN0IHRvIGFjaGlldmUgdGhpcyAoYW5kIGZpeCB0aGUgd2FybmluZyku
CgpGaXhlczogZmY1NDBiNzZmMTRhICgiZHJtL3R0bTogYWRkIGRybSBnZW0gdHRtIGhlbHBlcnMs
IHN0YXJ0aW5nIHdpdGggZHJtX2dlbV90dG1fcHJpbnRfaW5mbygpIikKQ2M6IEdlcmQgSG9mZm1h
bm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+
CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jIHwgMiArLQogZHJp
dmVycy9ncHUvZHJtL2RybV9wcmludC5jICAgICAgICAgIHwgMiArLQogaW5jbHVkZS9kcm0vZHJt
X3ByaW50LmggICAgICAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fdHRtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jCmlu
ZGV4IDlhNGJhZmNmMjBkZi4uYWU3YmEwMDUyOTU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV90dG1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRt
X2hlbHBlci5jCkBAIC0yMyw3ICsyMyw3IEBACiB2b2lkIGRybV9nZW1fdHRtX3ByaW50X2luZm8o
c3RydWN0IGRybV9wcmludGVyICpwLCB1bnNpZ25lZCBpbnQgaW5kZW50LAogCQkJICAgIGNvbnN0
IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtKQogewotCXN0YXRpYyBjb25zdCBjaGFyIGNvbnN0
ICpwbG5hbWVbXSA9IHsKKwlzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHBsbmFtZVtdID0gewog
CQlbIFRUTV9QTF9TWVNURU0gXSA9ICJzeXN0ZW0iLAogCQlbIFRUTV9QTF9UVCAgICAgXSA9ICJ0
dCIsCiAJCVsgVFRNX1BMX1ZSQU0gICBdID0gInZyYW0iLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wcmludC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jCmluZGV4IGRm
YTI3MzY3ZWJiOC4uMjBjNDljODViN2EyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3ByaW50LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jCkBAIC0xOTgsNyArMTk4
LDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fcHJpbnRmKTsKICAqIEB0bzogZW5kIG9mIGJpdCByYW5n
ZSB0byBwcmludCAoZXhjbHVzaXZlKS4KICAqLwogdm9pZCBkcm1fcHJpbnRfYml0cyhzdHJ1Y3Qg
ZHJtX3ByaW50ZXIgKnAsCi0JCSAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCBjb25zdCBjaGFyICpi
aXRzW10sCisJCSAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCBjb25zdCBjaGFyICogY29uc3QgYml0
c1tdLAogCQkgICAgdW5zaWduZWQgaW50IGZyb20sIHVuc2lnbmVkIGludCB0bykKIHsKIAlib29s
IGZpcnN0ID0gdHJ1ZTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oIGIvaW5j
bHVkZS9kcm0vZHJtX3ByaW50LmgKaW5kZXggMTJkNDkxNjI1NGI0Li4xZTZhNGVlOGE2YjIgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9w
cmludC5oCkBAIC05MCw3ICs5MCw3IEBAIHZvaWQgZHJtX3ByaW50ZihzdHJ1Y3QgZHJtX3ByaW50
ZXIgKnAsIGNvbnN0IGNoYXIgKmYsIC4uLik7CiB2b2lkIGRybV9wdXRzKHN0cnVjdCBkcm1fcHJp
bnRlciAqcCwgY29uc3QgY2hhciAqc3RyKTsKIHZvaWQgZHJtX3ByaW50X3JlZ3NldDMyKHN0cnVj
dCBkcm1fcHJpbnRlciAqcCwgc3RydWN0IGRlYnVnZnNfcmVnc2V0MzIgKnJlZ3NldCk7CiB2b2lk
IGRybV9wcmludF9iaXRzKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwKLQkJICAgIHVuc2lnbmVkIGxv
bmcgdmFsdWUsIGNvbnN0IGNoYXIgKmJpdHNbXSwKKwkJICAgIHVuc2lnbmVkIGxvbmcgdmFsdWUs
IGNvbnN0IGNoYXIgKiBjb25zdCBiaXRzW10sCiAJCSAgICB1bnNpZ25lZCBpbnQgZnJvbSwgdW5z
aWduZWQgaW50IHRvKTsKIAogX19wcmludGYoMiwgMCkKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUg
RW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
