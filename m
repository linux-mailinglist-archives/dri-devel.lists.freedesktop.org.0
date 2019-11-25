Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD5108B26
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE306E106;
	Mon, 25 Nov 2019 09:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374696E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:44:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l17so14679421wmh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/JiBpwFT1+ekHayv85lWsaJZQoV1bVEwMRzX8OSdGk=;
 b=s+Ash8UETplaSqTacog9nPij5tG5iSxfjwh+AFBiYbagxQMuDiBTCixebwqA4b+4Z4
 //V8tYLW6tANIbPSzWYAtUxjGXZDmK7+49tWSz5xDSGSzLwq1500RL5z5GLfnS/K8Q9U
 yBVw9ByoJvnPe49VUEKuDRNBdX5GDhBAwyfw5M8h6HUBqzvy9Qk8phYlkk76jxon8qfI
 9R5dnRlrnJnW9F/3kNE/Udo8CB9Vci6UHBIubVPJHwOXBhI5RxtZG1gO+WFZHSzi6+/r
 kM90h5Q9a7f4bChQleItdFDM/21MuDwiw6IgebPNR30Dg4qw4/jsHIjQNzNzyf6gjQw+
 z21w==
X-Gm-Message-State: APjAAAUtrgtFhtQ/nTrtvB+EYO2RFEEUGIXFQbytV/Kuh+TpBm4JMFHa
 vpI0MuremcR4jBxmcVFHbKTPKg7VG2I=
X-Google-Smtp-Source: APXvYqz6TptZP6espzqoV7J4Xo6+2UKPpZ6aWz5jnYYvCXGuSvJjVXGzv0jO2i2J3D00Wy0yP1wdhA==
X-Received: by 2002:a1c:ab0a:: with SMTP id u10mr29419978wme.0.1574675047320; 
 Mon, 25 Nov 2019 01:44:07 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x2sm7598233wmc.3.2019.11.25.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:44:05 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/msm: Use dma_resv locking wrappers
Date: Mon, 25 Nov 2019 10:43:55 +0100
Message-Id: <20191125094356.161941-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/JiBpwFT1+ekHayv85lWsaJZQoV1bVEwMRzX8OSdGk=;
 b=I8xrDF0oNAPYFO8Rb+AzffCtLbH9qIP552Uqu9j1vGLjJ6yQDhYH78ajtfzHuLbxeW
 9XLJmkSlZu3J4L4VbmvvYH7JF09ap94FA85ZC4oEJ6StY6rVm/WzAx3B1afQMTNLouYk
 ncw+6FQJXicsGzs333qgtuejaRLD0kbw7gwKk=
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdsbCBhZGQgbW9yZSBmYW5jeSBsb2dpYyB0byB0aGVtIHNvb24sIHNvIGV2ZXJ5b25lIHJlYWxs
eSBoYXMgdG8gdXNlCnRoZW0uIFBsdXMgdGhleSBhbHJlYWR5IHByb3ZpZGUgc29tZSBuaWNlIGFk
ZGl0aW9uYWwgZGVidWcKaW5mcmFzdHJ1Y3R1cmUgb24gdG9wIG9mIGRpcmVjdCB3d19tdXRleCB1
c2FnZSBmb3IgdGhlIGZlbmNlcyB0cmFja2VkCmJ5IGRtYV9yZXN2LgoKU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IGxp
bnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jIHwgMTAgKysr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKaW5kZXggN2QwNGM0N2QwMDIzLi4zODVk
NDk2NWE4ZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKQEAgLTE1Nyw3ICsx
NTcsNyBAQCBzdGF0aWMgdm9pZCBzdWJtaXRfdW5sb2NrX3VucGluX2JvKHN0cnVjdCBtc21fZ2Vt
X3N1Ym1pdCAqc3VibWl0LAogCQltc21fZ2VtX3VucGluX2lvdmEoJm1zbV9vYmotPmJhc2UsIHN1
Ym1pdC0+YXNwYWNlKTsKIAogCWlmIChzdWJtaXQtPmJvc1tpXS5mbGFncyAmIEJPX0xPQ0tFRCkK
LQkJd3dfbXV0ZXhfdW5sb2NrKCZtc21fb2JqLT5iYXNlLnJlc3YtPmxvY2spOworCQlkbWFfcmVz
dl91bmxvY2sobXNtX29iai0+YmFzZS5yZXN2KTsKIAogCWlmIChiYWNrb2ZmICYmICEoc3VibWl0
LT5ib3NbaV0uZmxhZ3MgJiBCT19WQUxJRCkpCiAJCXN1Ym1pdC0+Ym9zW2ldLmlvdmEgPSAwOwpA
QCAtMTgwLDggKzE4MCw4IEBAIHN0YXRpYyBpbnQgc3VibWl0X2xvY2tfb2JqZWN0cyhzdHJ1Y3Qg
bXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCkKIAkJY29udGVuZGVkID0gaTsKIAogCQlpZiAoIShzdWJt
aXQtPmJvc1tpXS5mbGFncyAmIEJPX0xPQ0tFRCkpIHsKLQkJCXJldCA9IHd3X211dGV4X2xvY2tf
aW50ZXJydXB0aWJsZSgmbXNtX29iai0+YmFzZS5yZXN2LT5sb2NrLAotCQkJCQkmc3VibWl0LT50
aWNrZXQpOworCQkJcmV0ID0gZG1hX3Jlc3ZfbG9ja19pbnRlcnJ1cHRpYmxlKG1zbV9vYmotPmJh
c2UucmVzdiwKKwkJCQkJCQkgICZzdWJtaXQtPnRpY2tldCk7CiAJCQlpZiAocmV0KQogCQkJCWdv
dG8gZmFpbDsKIAkJCXN1Ym1pdC0+Ym9zW2ldLmZsYWdzIHw9IEJPX0xPQ0tFRDsKQEAgLTIwMiw4
ICsyMDIsOCBAQCBzdGF0aWMgaW50IHN1Ym1pdF9sb2NrX29iamVjdHMoc3RydWN0IG1zbV9nZW1f
c3VibWl0ICpzdWJtaXQpCiAJaWYgKHJldCA9PSAtRURFQURMSykgewogCQlzdHJ1Y3QgbXNtX2dl
bV9vYmplY3QgKm1zbV9vYmogPSBzdWJtaXQtPmJvc1tjb250ZW5kZWRdLm9iajsKIAkJLyogd2Ug
bG9zdCBvdXQgaW4gYSBzZXFubyByYWNlLCBsb2NrIGFuZCByZXRyeS4uICovCi0JCXJldCA9IHd3
X211dGV4X2xvY2tfc2xvd19pbnRlcnJ1cHRpYmxlKCZtc21fb2JqLT5iYXNlLnJlc3YtPmxvY2ss
Ci0JCQkJJnN1Ym1pdC0+dGlja2V0KTsKKwkJcmV0ID0gZG1hX3Jlc3ZfbG9ja19zbG93X2ludGVy
cnVwdGlibGUobXNtX29iai0+YmFzZS5yZXN2LAorCQkJCQkJICAgICAgICZzdWJtaXQtPnRpY2tl
dCk7CiAJCWlmICghcmV0KSB7CiAJCQlzdWJtaXQtPmJvc1tjb250ZW5kZWRdLmZsYWdzIHw9IEJP
X0xPQ0tFRDsKIAkJCXNsb3dfbG9ja2VkID0gY29udGVuZGVkOwotLSAKMi4yNC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
