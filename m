Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412506D140
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230C86E41B;
	Thu, 18 Jul 2019 15:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D41E6E418;
 Thu, 18 Jul 2019 15:37:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k18so27797103ljc.11;
 Thu, 18 Jul 2019 08:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j3sl61idaWn9UYKJNwtX3bBPEmvS1pnSPVz5HXlu+zY=;
 b=TG6KQnxlVZmETfTe0jjxGQEZFhwxw4ExAgKfOM8qtSMRw9rSckT7BEbFjCUHbpr3p1
 kXY1Xn/YkZoerfpZYGdoYOn7odCgp0QDJUMMwnkHmNNoxst7NYfi/pBT7fHqJAw2Kua+
 dbscqRIavRPf7CMap7VMgx0y3vnZlPtZ73oveSUatFrCBeyl7QUWDo4skUsbBufJEGh9
 xOXj8DeOuqwjmLqAJsW2/QCueWGaIJPJTTkYWLvnAjoslkZnos77FXvlpeI3AKFV5Yix
 KnnoPts6DwX/H+buh8AitKUaG1HHEvRRW5DiNYZJoyZI75XsFFv9Ppp0floeOAgWEVcZ
 rEfg==
X-Gm-Message-State: APjAAAXTY0A7rnwYeBdN5062O9BzZXQYKd3if5Y+Bf9rdqWh9LVhhn8+
 eFhrDQs5B0O3/X31zDOWc9cHdjcxMLE=
X-Google-Smtp-Source: APXvYqzxzJ41zh7MyQhmQGZy4bflCU5eBwZzm7dS+kL2al4Bf1vCJV2vvkrKANKvHQ9F7ImeWrnP5A==
X-Received: by 2002:a2e:96d0:: with SMTP id d16mr10974480ljj.14.1563464275466; 
 Thu, 18 Jul 2019 08:37:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c30sm4062388lfp.70.2019.07.18.08.37.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 08:37:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v1 5/6] drm/via: drop DRM_WAIT_ON() in via_irq
Date: Thu, 18 Jul 2019 17:37:36 +0200
Message-Id: <20190718153737.28657-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718153737.28657-1-sam@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3sl61idaWn9UYKJNwtX3bBPEmvS1pnSPVz5HXlu+zY=;
 b=YJ46WydpYc2OIbO/z9BmBvwDAapVVoO0jMa/ePRzITSBZayDg0Qzuq0JrDOp5TtHwK
 Sq3UOG7k34XNsnUTf24KlDQ6raVMRXnPU5Rf5EcATout/jggrgwwfVWk0U3u6tluNC98
 yRZb5WEe/Si5Yt+lxZUYOEgRo/Ljky4hRf5JdExVc1LpBjDyJqM1Tjnj3SB+MG23QwFQ
 7Ib9aWeIQiSjJxDOFsAfokqCgxi+kLKYdz9KFLUs8LEAmSno4YcdhaauXLhdVRTHxjGW
 tEQaB+tvOKGcNm02B9CzPhyJ9ix1UD7Hvs65u2idbmjbInv8dUgzZVPW83bdur7rzfIb
 pDzg==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBEUk1fV0FJVF9PTigpIHdpdGggd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkuCldo
aWxlIHJlcGxhY2luZyBiZSBjYXJlZnVsIHRvIGtlZXAgc2FtZSByZXR1cm4gdmFsdWUgc2VtYW50
aWNzLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
S2V2aW4gQnJhY2UgPGtldmluYnJhY2VAZ214LmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRo
ZWxsc3Ryb21Adm13YXJlLmNvbT4KQ2M6ICJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0Bl
bWJlZGRlZG9yLmNvbT4KQ2M6IE1pa2UgTWFyc2hhbGwgPGh1YmNhcEBvbW5pYm9uZC5jb20+CkNj
OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFi
b3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9pcnEuYyB8IDM0ICsrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3Zp
YV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2lycS5jCmluZGV4IDlkNDdmZWIzNjdk
OC4uNmRlMTUwNjVhM2MwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9pcnEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9pcnEuYwpAQCAtMzYsNyArMzYsNiBAQAog
ICovCiAKICNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgotI2luY2x1ZGUgPGRybS9kcm1fb3Nf
bGludXguaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogI2luY2x1ZGUgPGRybS92aWFf
ZHJtLmg+CiAKQEAgLTIwMSw2ICsyMDAsMTIgQEAgdm9pZCB2aWFfZGlzYWJsZV92Ymxhbmsoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUpCiAJCURSTV9FUlJPUigiJXM6
ICBiYWQgY3J0YyAldVxuIiwgX19mdW5jX18sIHBpcGUpOwogfQogCisvKgorICogUmV0dXJuczoK
KyAqIDAgaWYgaW50ZXJydXB0IG9jY3VyZWQgd2l0aGluIDMgc2VjcworICogLUVCVVNZIGlmIHRp
bWVvdXQgaGFwcGVuZGVkCisgKiAtRUlOVFIgaWYgaW50ZXJydXB0ZWQgYnkgYSBzaWduYWwKKyAq
Lwogc3RhdGljIGludAogdmlhX2RyaXZlcl9pcnFfd2FpdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB1bnNpZ25lZCBpbnQgaXJxLCBpbnQgZm9yY2Vfc2VxdWVuY2UsCiAJCSAgICB1bnNpZ25lZCBp
bnQgKnNlcXVlbmNlKQpAQCAtMjA4LDcgKzIxMyw3IEBAIHZpYV9kcml2ZXJfaXJxX3dhaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlycSwgaW50IGZvcmNlX3NlcXVlbmNl
CiAJZHJtX3ZpYV9wcml2YXRlX3QgKmRldl9wcml2ID0gKGRybV92aWFfcHJpdmF0ZV90ICopIGRl
di0+ZGV2X3ByaXZhdGU7CiAJdW5zaWduZWQgaW50IGN1cl9pcnFfc2VxdWVuY2U7CiAJZHJtX3Zp
YV9pcnFfdCAqY3VyX2lycTsKLQlpbnQgcmV0ID0gMDsKKwlpbnQgcmV0OwogCW1hc2thcnJheV90
ICptYXNrczsKIAlpbnQgcmVhbF9pcnE7CiAKQEAgLTIzNiwxOCArMjQxLDI3IEBAIHZpYV9kcml2
ZXJfaXJxX3dhaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlycSwgaW50
IGZvcmNlX3NlcXVlbmNlCiAJY3VyX2lycSA9IGRldl9wcml2LT52aWFfaXJxcyArIHJlYWxfaXJx
OwogCiAJaWYgKG1hc2tzW3JlYWxfaXJxXVsyXSAmJiAhZm9yY2Vfc2VxdWVuY2UpIHsKLQkJRFJN
X1dBSVRfT04ocmV0LCBjdXJfaXJxLT5pcnFfcXVldWUsIDMgKiBIWiwKLQkJCSAgICAoKFZJQV9S
RUFEKG1hc2tzW2lycV1bMl0pICYgbWFza3NbaXJxXVszXSkgPT0KLQkJCSAgICAgbWFza3NbaXJx
XVs0XSkpOworCQlyZXQgPSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dChjdXJfaXJx
LT5pcnFfcXVldWUsCisJCQkoKFZJQV9SRUFEKG1hc2tzW2lycV1bMl0pICYgbWFza3NbaXJxXVsz
XSkgPT0gbWFza3NbaXJxXVs0XSksCisJCQltc2Vjc190b19qaWZmaWVzKDMwMDApKTsKIAkJY3Vy
X2lycV9zZXF1ZW5jZSA9IGF0b21pY19yZWFkKCZjdXJfaXJxLT5pcnFfcmVjZWl2ZWQpOwogCX0g
ZWxzZSB7Ci0JCURSTV9XQUlUX09OKHJldCwgY3VyX2lycS0+aXJxX3F1ZXVlLCAzICogSFosCi0J
CQkgICAgKCgoY3VyX2lycV9zZXF1ZW5jZSA9Ci0JCQkgICAgICAgYXRvbWljX3JlYWQoJmN1cl9p
cnEtPmlycV9yZWNlaXZlZCkpIC0KLQkJCSAgICAgICpzZXF1ZW5jZSkgPD0gKDEgPDwgMjMpKSk7
CisJCXJldCA9IHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KGN1cl9pcnEtPmlycV9x
dWV1ZSwKKwkJCSgoKGN1cl9pcnFfc2VxdWVuY2UgPSBhdG9taWNfcmVhZCgmY3VyX2lycS0+aXJx
X3JlY2VpdmVkKSkgLSAqc2VxdWVuY2UpIDw9ICgxIDw8IDIzKSksCisJCQltc2Vjc190b19qaWZm
aWVzKDMwMDApKTsKIAl9CiAJKnNlcXVlbmNlID0gY3VyX2lycV9zZXF1ZW5jZTsKLQlyZXR1cm4g
cmV0OworCisJc3dpdGNoIChyZXQpIHsKKwljYXNlIDA6CisJCS8qIHRpbWVvdXQgKi8KKwkJcmV0
dXJuIC1FQlVTWTsKKwljYXNlIC1FUkVTVEFSVFNZUzoKKwkJLyogaW50ZXJydXB0ZWQgYnkgc2ln
bmFsICovCisJCXJldHVybiAtRUlOVFI7CisJZGVmYXVsdDoKKwkJcmV0dXJuIDA7CisJfQogfQog
CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
