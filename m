Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16486100F7E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 00:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44F26E0E8;
	Mon, 18 Nov 2019 23:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E546E0D8;
 Mon, 18 Nov 2019 23:43:06 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d7so10673659pls.3;
 Mon, 18 Nov 2019 15:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cf8yodkoGRtKDfrnD35YQbS3qTKWlwJfxsTIImJLdbM=;
 b=lDRHBfrxTgr4jY8Jw9uGsy7ffiBBGP/Hu++15WNnkSC3lTQdUJiYc8ipXw2ZLOJvsr
 75AwP9YagXlOnbrq5pzb0AU1ZKvLpIfZA+W5uB5eFe2TbVfRz5JXYK387lVTLMvt1Uf0
 FqIreonOJvjr/m/UwWjE/r4JHvbmCpqQF3fLcJbTN8Mxr+ZK/OabA87SgQpAoVbiKwT+
 iL/P1TEoUyp+TCmjUxItCAbAS3e/s9jlZjDIGKO0azTSvmb0iOcAn0FzdKzdPezEOILZ
 TadfVupMEmCp+EK9clVOG4pV0naJVjbNM30WzI5vq4YAUnSwFAM5HMTCUxy9c/1MMTmq
 TOmQ==
X-Gm-Message-State: APjAAAWBkJhnHMq1IxyqMyv637K3UwCfSk114y8mZukYJaYaCpVP6G/K
 FH5I31Mhuu+iuqbgExpWEwnmBrW4518=
X-Google-Smtp-Source: APXvYqxZFe04Csp23cuMrWCkWUlksPNGgycxX0DupFxhtb/wTx95pSfOfbetmGRcuXUnRewQwkoyaw==
X-Received: by 2002:a17:90a:353:: with SMTP id
 19mr2265458pjf.128.1574120585799; 
 Mon, 18 Nov 2019 15:43:05 -0800 (PST)
Received: from localhost ([100.118.89.215])
 by smtp.gmail.com with ESMTPSA id t15sm23615528pgb.0.2019.11.18.15.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 15:43:05 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: restore previous freq on resume
Date: Mon, 18 Nov 2019 15:40:38 -0800
Message-Id: <20191118234043.331542-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cf8yodkoGRtKDfrnD35YQbS3qTKWlwJfxsTIImJLdbM=;
 b=FJu8zppiMyx+omZy5bO+IVg+9qxEmoz1snhctE+l4K1z3OKnQKdim1lHw0K+pQAOs5
 yAnrDotA2p76SHeGML+riON2n/thBPNGDCQ3YreVJFqojlwEiMCRcZBI5S4Q5scCtnnV
 RK+98KfsTycbmuCcKgodZRzeFVKtNipyBDjZ8hx/eWi+QZkkfL8V0xiTBRIfLYy0i2qv
 p3XCnbkpHLGRRW3RWjeBbIWaYwRJ30xxs/h2X38/66nL+t6iHpGOxcc9GxdeneSI+N70
 4+EsFlHLglthkf+oNZttvfWbFK2of8DsBznJHxYlgJ9BvqSHMFhsdPIrmDmBCgLZK+qG
 0vxQ==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKUHJldmlvdXNseSwgaWYg
dGhlIGZyZXEgd2VyZSBvdmVycmlkZW4gKGllLiB2aWEgc3lzZnMpLCBpdCB3b3VsZCBnZXQKcmVz
ZXQgdG8gbWF4IG9uIHJlc3VtZS4KClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5j
IHwgOCArKysrKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuaCB8IDMg
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwppbmRleCAyY2E0NzBlYjVjYjguLmI2NDg2
NzcwMWU1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCkBAIC0xNDksNiAr
MTQ5LDggQEAgdm9pZCBhNnh4X2dtdV9zZXRfZnJlcShzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCB1bnNp
Z25lZCBsb25nIGZyZXEpCiAJCWlmIChmcmVxID09IGdtdS0+Z3B1X2ZyZXFzW3BlcmZfaW5kZXhd
KQogCQkJYnJlYWs7CiAKKwlnbXUtPmN1cnJlbnRfcGVyZl9pbmRleCA9IHBlcmZfaW5kZXg7CisK
IAlfX2E2eHhfZ211X3NldF9mcmVxKGdtdSwgcGVyZl9pbmRleCk7CiB9CiAKQEAgLTc0MSw4ICs3
NDMsOCBAQCBpbnQgYTZ4eF9nbXVfcmVzdW1lKHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9ncHUpCiAJ
Z211X3dyaXRlKGdtdSwgUkVHX0E2WFhfR01VX0dNVTJIT1NUX0lOVFJfTUFTSywgfkE2WFhfSEZJ
X0lSUV9NQVNLKTsKIAllbmFibGVfaXJxKGdtdS0+aGZpX2lycSk7CiAKLQkvKiBTZXQgdGhlIEdQ
VSB0byB0aGUgaGlnaGVzdCBwb3dlciBmcmVxdWVuY3kgKi8KLQlfX2E2eHhfZ211X3NldF9mcmVx
KGdtdSwgZ211LT5ucl9ncHVfZnJlcXMgLSAxKTsKKwkvKiBTZXQgdGhlIEdQVSB0byB0aGUgY3Vy
cmVudCBmcmVxICovCisJX19hNnh4X2dtdV9zZXRfZnJlcShnbXUsIGdtdS0+Y3VycmVudF9wZXJm
X2luZGV4KTsKIAogCS8qCiAJICogImVuYWJsZSIgdGhlIEdYIHBvd2VyIGRvbWFpbiB3aGljaCB3
b24ndCBhY3R1YWxseSBkbyBhbnl0aGluZyBidXQgaXQKQEAgLTExNjYsNiArMTE2OCw4IEBAIHN0
YXRpYyBpbnQgYTZ4eF9nbXVfcHdybGV2ZWxzX3Byb2JlKHN0cnVjdCBhNnh4X2dtdSAqZ211KQog
CWdtdS0+bnJfZ3B1X2ZyZXFzID0gYTZ4eF9nbXVfYnVpbGRfZnJlcV90YWJsZSgmZ3B1LT5wZGV2
LT5kZXYsCiAJCWdtdS0+Z3B1X2ZyZXFzLCBBUlJBWV9TSVpFKGdtdS0+Z3B1X2ZyZXFzKSk7CiAK
KwlnbXUtPmN1cnJlbnRfcGVyZl9pbmRleCA9IGdtdS0+bnJfZ3B1X2ZyZXFzIC0gMTsKKwogCS8q
IEJ1aWxkIHRoZSBsaXN0IG9mIFJQTWggdm90ZXMgdGhhdCB3ZSdsbCBzZW5kIHRvIHRoZSBHTVUg
Ki8KIAlyZXR1cm4gYTZ4eF9nbXVfcnBtaF92b3Rlc19pbml0KGdtdSk7CiB9CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5oIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYTZ4eF9nbXUuaAppbmRleCAzOWEyNmRkNjM2NzQuLjJhZjkxZWQ3ZWQwYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5oCkBAIC02Myw2ICs2Myw5IEBAIHN0
cnVjdCBhNnh4X2dtdSB7CiAJc3RydWN0IGNsa19idWxrX2RhdGEgKmNsb2NrczsKIAlzdHJ1Y3Qg
Y2xrICpjb3JlX2NsazsKIAorCS8qIGN1cnJlbnQgcGVyZm9ybWFuY2UgaW5kZXggc2V0IGV4dGVy
bmFsbHkgKi8KKwlpbnQgY3VycmVudF9wZXJmX2luZGV4OworCiAJaW50IG5yX2dwdV9mcmVxczsK
IAl1bnNpZ25lZCBsb25nIGdwdV9mcmVxc1sxNl07CiAJdTMyIGd4X2FyY192b3Rlc1sxNl07Ci0t
IAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
