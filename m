Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3994AB3C6B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C960E6E994;
	Mon, 16 Sep 2019 14:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1E56E999;
 Mon, 16 Sep 2019 14:19:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r195so10633445wme.2;
 Mon, 16 Sep 2019 07:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZDLxWDSdCY+U+/hnABJdaj0vyVtgQakuZCTpEsmDYuY=;
 b=qEasqe6XzVocQg8lHeopERyTfZcSHwoEJesQ6FrT+5bUH4/ZcgLAETDz/oRY4mgAWX
 2fjvAI8VDyWw36tGch4tYIkIUwMWpm1uacHYdYIpalYwfJU/Cppqw4BJZZ+0Eczo6XO2
 +9L7ee5cZQb2V3rYrMumziQ/EEg52pUhSulHl6mm85rTLnrWz9ZN3vkJB9dAkKZAy2Ra
 9S4nTAeBQJKEvK8ut1SgF0vB6wKgKljXJ142GS/OurdXVJd6NZenAdVPlgJNYAB4Wway
 KJG/xrfQLCnNFiifRyFMTAv9O0UH4J763pdPHHrcoIH5uQtx0mG21aowih/D38y8b6pN
 +/wA==
X-Gm-Message-State: APjAAAXZQs1ugL0ozvn2dT8BFK34LUQPVggp7o5w7GurP9DmTa/oFOA5
 kSRijqPOsLrljcPPTGMJlcA=
X-Google-Smtp-Source: APXvYqw8cTk/vgZCjSYkbUlqSpRJn+RlgVoMoeWOYmNl7dn47DM9tUcIWBtLKcsCX1IXLloanleo7Q==
X-Received: by 2002:a05:600c:285:: with SMTP id
 5mr15540826wmk.161.1568643575503; 
 Mon, 16 Sep 2019 07:19:35 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id f13sm2307273wmj.17.2019.09.16.07.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 07:19:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 3/4] drm/nouveau: Fix ordering between TTM and GEM release
Date: Mon, 16 Sep 2019 16:19:25 +0200
Message-Id: <20190916141926.8594-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916141926.8594-1-thierry.reding@gmail.com>
References: <20190916141926.8594-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZDLxWDSdCY+U+/hnABJdaj0vyVtgQakuZCTpEsmDYuY=;
 b=BgkimlTHeF9SNSgS5V8XiEGRCPrEtPD3PyqCtUm4+wNGXbz4dkeI8/LK3aHDgIEWSq
 b2FCMfIfVUKAF3HlPJItyMqKRLptvez4D+98m3VR6TanRcWsjc1Mlpq9XHC0xSt0QqHd
 R2/w2XBPpqjJnhUGRL8g7MI+ToO8FpJ6+Ysb2QHul7bEoYmTNMP5NITPhBXLgz4b7g2M
 k7yyDMDDI2O6vSXD4KTS2U8cBjIKTtVSDQbAxH/5UShprE5YsZITl4KOlvAPVTbIHyjj
 jUy5yFX2z6CkgLa1IAvcvOluNRV7LCLiBSWLidU24xfUZ3AVaN8pxwbmZKF5Y0uY+1sp
 tR8w==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhlIGxhc3Qg
cmVmZXJlbmNlIHRvIGEgVFRNIEJPIGlzIGRyb3BwZWQsIHR0bV9ib19yZWxlYXNlKCkgd2lsbAph
Y3F1aXJlIHRoZSBETUEgcmVzZXJ2YXRpb24gb2JqZWN0J3Mgd291bmQvd2FpdCBtdXRleCB3aGls
ZSB0cnlpbmcgdG8KY2xlYW4gdXAgKHR0bV9ib19jbGVhbnVwX3JlZnNfb3JfcXVldWUoKSB2aWEg
dHRtX2JvX3JlbGVhc2UoKSkuIEl0IGlzCnRoZXJlZm9yZSBlc3NlbnRpYWwgdGhhdCBkcm1fZ2Vt
X29iamVjdF9yZWxlYXNlKCkgYmUgY2FsbGVkIGFmdGVyIHRoZQpUVE0gQk8gaGFzIGJlZW4gdW5p
bml0aWFsaXplZCwgb3RoZXJ3aXNlIGRybV9nZW1fb2JqZWN0X3JlbGVhc2UoKSBoYXMKYWxyZWFk
eSBkZXN0cm95ZWQgdGhlIHdvdW5kL3dhaXQgbXV0ZXggKHZpYSBkbWFfcmVzdl9maW5pKCkpLgoK
U2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgIHwgMTAgKysrKysrKystLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uYyB8ICA0IC0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYwppbmRleCBlNzgwM2RjYTMyYzUuLmY4MDE1ZTAzMThkNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTM2LDEwICsxMzYsMTYgQEAgbm91dmVhdV9i
b19kZWxfdHRtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJc3RydWN0IGRybV9kZXZp
Y2UgKmRldiA9IGRybS0+ZGV2OwogCXN0cnVjdCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9i
byhibyk7CiAKLQlpZiAodW5saWtlbHkobnZiby0+Ym8uYmFzZS5maWxwKSkKLQkJRFJNX0VSUk9S
KCJibyAlcCBzdGlsbCBhdHRhY2hlZCB0byBHRU0gb2JqZWN0XG4iLCBibyk7CiAJV0FSTl9PTihu
dmJvLT5waW5fcmVmY250ID4gMCk7CiAJbnYxMF9ib19wdXRfdGlsZV9yZWdpb24oZGV2LCBudmJv
LT50aWxlLCBOVUxMKTsKKworCS8qCisJICogSWYgbm91dmVhdV9ib19uZXcoKSBhbGxvY2F0ZWQg
dGhpcyBidWZmZXIsIHRoZSBHRU0gb2JqZWN0IHdhcyBuZXZlcgorCSAqIGluaXRpYWxpemVkLCBz
byBkb24ndCBhdHRlbXB0IHRvIHJlbGVhc2UgaXQuCisJICovCisJaWYgKGJvLT5iYXNlLmRldikK
KwkJZHJtX2dlbV9vYmplY3RfcmVsZWFzZSgmYm8tPmJhc2UpOworCiAJa2ZyZWUobnZibyk7CiB9
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jCmluZGV4IDFiZGZmZDcxNDQ1Ni4u
MTMyNGMxOWY0ZTVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMKQEAgLTUx
LDEwICs1MSw2IEBAIG5vdXZlYXVfZ2VtX29iamVjdF9kZWwoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpnZW0pCiAJaWYgKGdlbS0+aW1wb3J0X2F0dGFjaCkKIAkJZHJtX3ByaW1lX2dlbV9kZXN0cm95
KGdlbSwgbnZiby0+Ym8uc2cpOwogCi0JZHJtX2dlbV9vYmplY3RfcmVsZWFzZShnZW0pOwotCi0J
LyogcmVzZXQgZmlscCBzbyBub3V2ZWF1X2JvX2RlbF90dG0oKSBjYW4gdGVzdCBmb3IgaXQgKi8K
LQlnZW0tPmZpbHAgPSBOVUxMOwogCXR0bV9ib19wdXQoJm52Ym8tPmJvKTsKIAogCXBtX3J1bnRp
bWVfbWFya19sYXN0X2J1c3koZGV2KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
