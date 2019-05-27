Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E22B404
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFE489B00;
	Mon, 27 May 2019 12:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75E5896ED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 04:51:31 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g21so6569960plq.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 21:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqtXYGK6k+BsF6lFW0Ln3+MfttYOEkXamBERmqOmC5Y=;
 b=qLFsIWDo0x8A71Cz5+UrzplCWIWbp0YSWqCG9W277uCs7rBe10Ca9owS5GHjxRkvEI
 IXAbf2nkwLj7+NcJgA+3LqtcLXFNPaGoKvEZ0Hj8SrxnBeK8BgPIICTW4at31FMzcQOb
 S0B2I73BH7QxFB7WBOAwZS2Ycuwqz/ftopkNT6csb4FSubh9bqPLz4ZBaSDuW1ovttFI
 kwPIoTFP7+W97rp/c0iOPc7A3ObCwOt068EjcQ1XEOk0blOl1A4KbnGWHZitTlAFVH5o
 WvxOihFYr8NTJppXD2A5HrZiSZYKyU8p8DoV5Ehjp5c1tkbr7Nt0uWBpqMyNfOrGUMGZ
 HoUA==
X-Gm-Message-State: APjAAAUW4V2tsf9QlU2Z/42YD2Lzmg+7IL93iwysObLWA9WqkUxGdipQ
 XFVMDkADeH4cuk0ER0AdL1x9AQ==
X-Google-Smtp-Source: APXvYqx3i22O/tAoY6zgk8Ct9ltJx/aRFrpHG2CUs0/G8ATOoqFQULNscuyQ9TI0cY5+0fUmhDePyw==
X-Received: by 2002:a17:902:8303:: with SMTP id
 bd3mr77262990plb.240.1558932691335; 
 Sun, 26 May 2019 21:51:31 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id t18sm8082745pgm.69.2019.05.26.21.51.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 26 May 2019 21:51:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] drm: mediatek: fix unbind functions
Date: Mon, 27 May 2019 12:50:52 +0800
Message-Id: <20190527045054.113259-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527045054.113259-1-hsinyi@chromium.org>
References: <20190527045054.113259-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lqtXYGK6k+BsF6lFW0Ln3+MfttYOEkXamBERmqOmC5Y=;
 b=HF/zJF0QdICLy7NJ4bW6FA9TCLsUv3ADJGYPEPuA3By1u7Y8V2Rl/zlVDy2sdKk81o
 IbxnGSFNNx2FgwLaedCVxPoaF9ANY3vK9P0MF5dAYMhvATfvsyTjwFBSMA0sEktklVak
 GoJSPLBV+x21zj7b9LVfsAHc8PGNEre2C1GFU=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bW92ZSBtaXBpX2RzaV9ob3N0X3VucmVnaXN0ZXIoKSB0byAucmVtb3ZlIHNpbmNlIG1pcGlfZHNp
X2hvc3RfcmVnaXN0ZXIoKQppcyBjYWxsZWQgaW4gLnByb2JlLgoKZGV0YXRjaCBwYW5lbCBpbiBt
dGtfZHNpX2Rlc3Ryb3lfY29ubl9lbmMoKSwgc2luY2UgLmJpbmQgd2lsbCB0cnkgdG8KYXR0YWNo
IGl0IGFnYWluLgoKRml4ZXM6IDJlNTRjMTRlMzEwZiAoImRybS9tZWRpYXRlazogQWRkIERTSSBz
dWIgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA0ICsrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYwppbmRleCBiMDBlYjJkMmUwODYuLmM5YjZkM2E2OGM4YiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC04NDQsNiArODQ0LDggQEAgc3RhdGljIHZvaWQg
bXRrX2RzaV9kZXN0cm95X2Nvbm5fZW5jKHN0cnVjdCBtdGtfZHNpICpkc2kpCiAJLyogU2tpcCBj
b25uZWN0b3IgY2xlYW51cCBpZiBjcmVhdGlvbiB3YXMgZGVsZWdhdGVkIHRvIHRoZSBicmlkZ2Ug
Ki8KIAlpZiAoZHNpLT5jb25uLmRldikKIAkJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKCZkc2ktPmNv
bm4pOworCWlmIChkc2ktPnBhbmVsKQorCQlkcm1fcGFuZWxfZGV0YWNoKGRzaS0+cGFuZWwpOwog
fQogCiBzdGF0aWMgdm9pZCBtdGtfZHNpX2RkcF9zdGFydChzdHJ1Y3QgbXRrX2RkcF9jb21wICpj
b21wKQpAQCAtMTA3Myw3ICsxMDc1LDYgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV91bmJpbmQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJc3RydWN0IG10a19kc2kg
KmRzaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCiAJbXRrX2RzaV9kZXN0cm95X2Nvbm5fZW5j
KGRzaSk7Ci0JbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmhvc3QpOwogCW10a19kZHBf
Y29tcF91bnJlZ2lzdGVyKGRybSwgJmRzaS0+ZGRwX2NvbXApOwogfQogCkBAIC0xMTc5LDYgKzEx
ODAsNyBAQCBzdGF0aWMgaW50IG10a19kc2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAKIAltdGtfb3V0cHV0X2RzaV9kaXNhYmxlKGRzaSk7CiAJY29tcG9uZW50X2RlbCgm
cGRldi0+ZGV2LCAmbXRrX2RzaV9jb21wb25lbnRfb3BzKTsKKwltaXBpX2RzaV9ob3N0X3VucmVn
aXN0ZXIoJmRzaS0+aG9zdCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
