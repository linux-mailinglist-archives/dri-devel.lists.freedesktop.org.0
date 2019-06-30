Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758B5B18B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDC289CB8;
	Sun, 30 Jun 2019 20:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852C089DDF;
 Sun, 30 Jun 2019 20:36:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m14so9450799qka.10;
 Sun, 30 Jun 2019 13:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49NmudHDFaiz637maLt0od1jxi4vc0fBNFWPB/OQ7Ew=;
 b=NRy/cPMEY/Ic+sD1CWIA/uOgvGVIGPbe+0kGB0f5xRgmrOBcJvlPq/ZFyiA1fUk+YJ
 5FHSMfXpibPR6gIKL2MKCycW+5z3xd2ZK8WPr1v0N3uA/ozmgQJwrmpoLiycCa1FlWwI
 dCfgR8JqbIVsGmFObg8dZGkRTUmKOJJV94kCYZ3VaEGHHi7C2hm7qkH/rzsNZlU3TEUo
 id2pUH4ZOn9CRBth+Z6+gCleZI8uar6VYhWxO91+4XIZth7uA3qC/DMsrHmNQOowNw+8
 UEmUFvy/c8ZxebRzxu/O5vaC9J6rhK0qKm4c+P9S93pONaSuUKzvXgv5sd/hMkDxjwbO
 IC9A==
X-Gm-Message-State: APjAAAU9lthB0Db3GZOjhrLOWV8LGGhM4PbsMvx2wnUMTDAULSeps80X
 +gFCO3jBeq9fdYEnBVFKvZl745nX8RVkTw==
X-Google-Smtp-Source: APXvYqw9dPdRPjUOBiaJgOP42sCQA941WsYe4Bx2/e7qKIMcRkO0Fhw3GXsoNcznih/UEJD2KmtWsA==
X-Received: by 2002:a37:9a97:: with SMTP id
 c145mr18112662qke.309.1561927015455; 
 Sun, 30 Jun 2019 13:36:55 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id v30sm4457747qtk.45.2019.06.30.13.36.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 13:36:54 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/4] drm: add helper to lookup panel-id
Date: Sun, 30 Jun 2019 13:36:07 -0700
Message-Id: <20190630203614.5290-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630203614.5290-1-robdclark@gmail.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=49NmudHDFaiz637maLt0od1jxi4vc0fBNFWPB/OQ7Ew=;
 b=DBTuLa2SFCIRlncjgp0a8sjJMrmiVoevGiyq+PyOd3P/l5i0yHONM0OpSlSPJQxe0j
 7W2lLA6Jtko/v+HWPa5jPZz/hgrSWzo9Npum9/dB6oPMFA7EasBtv8GFtuNx5mx3Q5K9
 yNS0NwKxar7I5iQ/3fYTwzi1un0rCFFcDdWgmz1y61hZD4K1wajMwyRnQoPTepJ4vg5r
 t0Xk5yYpLn/9+BgC+O/N6chIuEGHCEfKTJMDGl7F7gMMUeVDaUkAS985kTO3JwIwbl1c
 hCkd5sPpwrIYtzhobXpu28W9vMkxVoChJUA/Rf6RNJHr4+SqFPjJmDgdUa25jHGDkxPx
 TkEQ==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRmluZHMgdGhlIHBhbmVs
LWlkIGZyb20gY2hvc2VuLCBzbyBkcml2ZXJzIGNhbiB1c2UgdGhpcyB0byBwaWNrIHRoZQpjb3Jy
ZWN0IGVuZHBvaW50IHdoZW4gbG9va2luZyB1cCBwYW5lbC4KClNpZ25lZC1vZmYtYnk6IFJvYiBD
bGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX29m
LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9vZi5oICAgICB8
ICA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwpp
bmRleCA0M2Q4OWRkNTljNmIuLjNiYTY1NzUwMDQ4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9vZi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwpAQCAtMjc5LDMgKzI3
OSwyNCBAQCBpbnQgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGNvbnN0IHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAsCiAJcmV0dXJuIHJldDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRybV9vZl9m
aW5kX3BhbmVsX29yX2JyaWRnZSk7CisKKy8qKgorICogZHJtX29mX2ZpbmRfcGFuZWxfaWQgLSBy
ZXR1cm4gaWQgb2YgcGFuZWwgZnJvbSBjaG9zZW4KKyAqCisgKiBSZXR1cm5zIHRoZSBwYW5lbCBp
ZCwgb3IgemVybyBpZiBub25lIHNwZWNpZmllZAorICovCitpbnQgZHJtX29mX2ZpbmRfcGFuZWxf
aWQodm9pZCkKK3sKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gTlVMTDsKKwl1MzIgcGFuZWxf
aWQ7CisKKwlucCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvY2hvc2VuIik7CisJaWYgKCFucCkK
KwkJcmV0dXJuIDA7CisKKwlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJwYW5lbC1pZCIs
ICZwYW5lbF9pZCkpCisJCXJldHVybiAwOworCisJcmV0dXJuIHBhbmVsX2lkOworfQorRVhQT1JU
X1NZTUJPTF9HUEwoZHJtX29mX2ZpbmRfcGFuZWxfaWQpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX29mLmggYi9pbmNsdWRlL2RybS9kcm1fb2YuaAppbmRleCBlYWQzNGFiNWNhNGUuLjZj
ZDJkNTljYjFkYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX29mLmgKKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX29mLmgKQEAgLTM1LDYgKzM1LDggQEAgaW50IGRybV9vZl9maW5kX3BhbmVsX29y
X2JyaWRnZShjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogCQkJCWludCBwb3J0LCBpbnQg
ZW5kcG9pbnQsCiAJCQkJc3RydWN0IGRybV9wYW5lbCAqKnBhbmVsLAogCQkJCXN0cnVjdCBkcm1f
YnJpZGdlICoqYnJpZGdlKTsKK2ludCBkcm1fb2ZfZmluZF9wYW5lbF9pZCh2b2lkKTsKKwogI2Vs
c2UKIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZHJtX29mX2NydGNfcG9ydF9tYXNrKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAJCQkJCSAgc3RydWN0IGRldmljZV9ub2RlICpwb3J0KQpAQCAtNzcs
NiArNzksMTEgQEAgc3RhdGljIGlubGluZSBpbnQgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdl
KGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCiB7CiAJcmV0dXJuIC1FSU5WQUw7CiB9CisK
K3N0YXRpYyBpbmxpbmUgaW50IGRybV9vZl9maW5kX3BhbmVsX2lkKHZvaWQpCit7CisJcmV0dXJu
IDA7Cit9CiAjZW5kaWYKIAogLyoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
