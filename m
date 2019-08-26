Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A259D226
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CD06E0B8;
	Mon, 26 Aug 2019 14:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC0B89F8E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:57:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so15668156wrr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GefcgZIGi5vsG6C57y1gbEiNAKDUmLjbeYvTQElZ2d8=;
 b=FOE+k3cT+YqajbQC4YxzXyUmCiuT82XL2llyBrPrlIM35P2OryVo6uynmS1LAm68tJ
 ibZCZmfb4915+Hc0MbS5gDapL0QYkEP+w5wdflfwJnF2rjurwmZeeT+lXgy+XcIMJOuB
 Za5FdiZqTDLNSnOHwxTwd29j9n/gdhwfitHnYoa7JH9aKHggc1PdNVb4I2r5ngMLzRNy
 lj4RnSs0p8E89Y72ZpvGE3sgjWVilnvok3R6LNshz40fSQJlQR8H/tiv/FdnpYRijHH/
 5MJpj7XOWL3TFxTW7Orx8CX20IatHH9i+UIsEfmBU2Mkfm30eoA/2elX2jvP6W6IkCGq
 dpZA==
X-Gm-Message-State: APjAAAXyDiHs/thkAweh+YCxOWQrOG3y1S4kBerWva5gLGtiu7ZNkFiY
 YNE34fyRQVqozgvKm9PdvycgRJlI
X-Google-Smtp-Source: APXvYqxbtIvVlf0LU8sBoH1O7i1a5htrmWUBLD1TBbgGDi1pOovTAaMRMU/7OanU/acQYDQTx8LqPw==
X-Received: by 2002:adf:fc87:: with SMTP id g7mr22435677wrr.319.1566831456491; 
 Mon, 26 Aug 2019 07:57:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
 by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:57:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/9] dma-buf: add dma_fence_array_recycle v2
Date: Mon, 26 Aug 2019 16:57:26 +0200
Message-Id: <20190826145731.1725-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GefcgZIGi5vsG6C57y1gbEiNAKDUmLjbeYvTQElZ2d8=;
 b=KD6ZJoDdrEtCWrNY63PfxzIIIL6WvSRgiwXrbfalOX3b9dnnCuHvAvBOFp/qfrDOI2
 hPPtIG+tZ6LQbuE88P5NVbYdNcVU0Zf2ZLkpfvvGGU8znDJtfQ8N1wsODNVAOC3udnwp
 2271dlAXstMfuavAKkKnBfQkvH7gavmveIXKMBnSmc2dMmkHpldg0XPAlk87bcdXawKd
 XmCduwZ1z1gou8+MuqLoha9FJdfTucALI5XougmHkg+fAKj6ydEn94rc+JjB1dJsD06M
 VVfyzY7Xdk1JbJDgFChRXZOhZeRwo+nB8Q62VT2CrWYJtPTDue+bWCvfoCI7ApCJQb2N
 l62A==
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

VHJ5IHRvIHJlY3ljbGUgYW4gZG1hX2ZlbmNlX2FycmF5IG9iamVjdCBieSBkcm9wcGluZyB0aGUg
bGFzdApyZWZlcmVuY2UgdG8gaXQgd2l0aG91dCBmcmVlaW5nIGl0LgoKdjI6IGZpeCB0aGUgV0FS
Tl9PTl9PTkNFIHJlY3ljbGUgdGVzdCBhZnRlciByZWJhc2UKClNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLWFycmF5LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQs
IDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LWFycmF5LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKaW5kZXggNDY2NDYw
N2YwYWJjLi5lYTc3MTNiNDA1MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVu
Y2UtYXJyYXkuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKQEAgLTE5
OCw2ICsxOTgsMzQgQEAgdm9pZCBkbWFfZmVuY2VfYXJyYXlfaW5pdChzdHJ1Y3QgZG1hX2ZlbmNl
X2FycmF5ICphcnJheSwgdTY0IGNvbnRleHQsCiB9CiBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9h
cnJheV9pbml0KTsKIAorLyoqCisgKiBkbWFfZmVuY2VfYXJyYXlfcmV1c2UgLSBkdW1teSBmb3Ig
ZG1hX2ZlbmNlX2FycmF5X3JlY3ljbGUKKyAqLworc3RhdGljIHZvaWQgZG1hX2ZlbmNlX2FycmF5
X3JldXNlKHN0cnVjdCBrcmVmICprcmVmKQoreworCXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFy
cmF5ID0gY29udGFpbmVyX29mKGtyZWYsIHR5cGVvZigqYXJyYXkpLAorCQkJCQkJICAgICBiYXNl
LnJlZmNvdW50KTsKKworCWlmICghdGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFMRURfQklU
LCAmYXJyYXktPmJhc2UuZmxhZ3MpKQorCQlXQVJOX09OX09OQ0UoIWxpc3RfZW1wdHkoJmFycmF5
LT5iYXNlLmNiX2xpc3QpKTsKK30KKworLyoqCisgKiBkbWFfZmVuY2VfYXJyYXlfdHJ5X3JldXNl
IC0gdHJ5IHRvIHJldXNlIGEgZG1hX2ZlbmNlX2FycmF5IG9iamVjdAorICogQGFycmF5OiBhcnJh
eSB3aGljaCB3ZSBzaG91bGQgdHJ5IHRvIHJldXNlCisgKgorICogVHJ5IHRvIGRyb3AgdGhlIGxh
c3QgcmVmZXJlbmNlIHRvIGFuIGRtYV9mZW5jZV9hcnJheSBhbmQgc28gYWxsb3cgaXQgdG8gYmUK
KyAqIHJldXNlZC4KKyAqCisgKiBSZXR1cm5zIHRydWUgaWYgdGhpcyB3YXMgdGhlIGxhc3QgcmVm
ZXJlbmNlIHRoZW4gY2FsbGVyIGNhbiByZXVzZSB0aGUgYXJyYXkuCisgKiBJbiB0aGlzIGNhc2Ug
dGhlIGFycmF5IGlzIHJlc2V0IGludG8gYSBzdGF0ZSB3aGVyZSBpdCBjYW4gYmUgdXNlZCB3aXRo
CisgKiBkbWFfZmVuY2VfYXJyYXlfaW5pdCBhZ2Fpbi4KKyAqLworYm9vbCBkbWFfZmVuY2VfYXJy
YXlfcmVjeWNsZShzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICphcnJheSkKK3sKKwlyZXR1cm4ga3Jl
Zl9wdXQoJmFycmF5LT5iYXNlLnJlZmNvdW50LCBkbWFfZmVuY2VfYXJyYXlfcmV1c2UpOworfQor
CiAvKioKICAqIGRtYV9mZW5jZV9hcnJheV9mcmVlIC0gZnJlZSBhIGRtYV9mZW5jZV9hcnJheSBv
YmplY3QKICAqIEBhcnJheTogdGhlIG9iamVjdCB0byBmcmVlCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXku
aAppbmRleCBiZTg1YzA2YjUyNGQuLjM1ZDFkMWU3YzkzYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9kbWEtZmVuY2UtYXJyYXkuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJh
eS5oCkBAIC05Myw2ICs5Myw3IEBAIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmRtYV9mZW5jZV9h
cnJheV9hbGxvYyhpbnQgbnVtX2ZlbmNlcywKIAkJCQkJICAgICAgc3RydWN0IGRtYV9mZW5jZSAq
KmZlbmNlcyk7CiB2b2lkIGRtYV9mZW5jZV9hcnJheV9pbml0KHN0cnVjdCBkbWFfZmVuY2VfYXJy
YXkgKmFycmF5LCB1NjQgY29udGV4dCwKIAkJCSAgdW5zaWduZWQgaW50IHNlcW5vLCBib29sIHNp
Z25hbF9vbl9hbnkpOworYm9vbCBkbWFfZmVuY2VfYXJyYXlfcmVjeWNsZShzdHJ1Y3QgZG1hX2Zl
bmNlX2FycmF5ICphcnJheSk7CiB2b2lkIGRtYV9mZW5jZV9hcnJheV9mcmVlKHN0cnVjdCBkbWFf
ZmVuY2VfYXJyYXkgKmFycmF5KTsKIAogLyoqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
