Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC46CDC1B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9226E480;
	Mon,  7 Oct 2019 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FC96E452
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:32:11 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id j11so6204553plk.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 20:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
 b=ooisJetSuNXBDQV9EGiYC/FhHxqBp+Lm5F27y2C+11buA/TLXjaxm1Ek90YSyefAQL
 3BeOb8/dYKNXRVQPojiFEsvmSydNOryel57ZLhI4AzNv/so8Zk/nhEvkR38GyfKxu2Eo
 kkk4U8+o27GHfu2lZXsRyWABWoBIWhZJwNOTFPDmJW1ZKy08DvA/9bfMC2Lcz8oETTKW
 Xs0Bp5Pd/cHIF9pIAY/3tFG7Wn5K9l7Dn1ZYcg0DexhhrCHrZbh/34aEUPooZk3O6ONQ
 k4bFFPy0hhSgzbNHmK/kgx3eIP8+CyLPEI2zC/D17k/Y4oXtazWx58KkbdWYwCJuQnDH
 /VhQ==
X-Gm-Message-State: APjAAAVr00g+TP4VMLMHF7l6v8mBq/tGGpO5cQMpoJxW40AW0jbOTqX7
 BHjR53me2oUgj1OVpv7ZGAAs/g==
X-Google-Smtp-Source: APXvYqwui+TZsj1hrpt1A6WhBT4dxRajPwgWEBSZbF3dNiwstGf7Bc3pdFBi1PqMbkPT7HLUpEqGQA==
X-Received: by 2002:a17:902:d887:: with SMTP id
 b7mr26427545plz.297.1570419130968; 
 Sun, 06 Oct 2019 20:32:10 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net.
 [96.95.220.76])
 by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 20:32:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v5 6/7] backlight: gpio: use a helper variable for &pdev->dev
Date: Mon,  7 Oct 2019 05:31:59 +0200
Message-Id: <20191007033200.13443-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
 b=y+TYcOkuUhELANoszr4a3gmhyWWSDY+vzJu611GB87ScAdJ/pXChF4r0b/+6blLSGl
 BUcsrkNzV5otX3RewLR8/ISN1NQj6hvS2qEGuRtZukxoSVQY5mMHJBf9orIetMkyogEe
 mziAl7VWTOgcKRKmfHh+xtHXVdOiyEJkpYvwM31fawB2JvgQdoelG3fpb4T18TIuWxo8
 e0cvbKmSdZUhbAv2AbFvrMM++vdtHF9jEsAcLrXuH1hNQiYLN26eOfdAlJjlvvu/PJzc
 spy3UaKYw41JS/hoOWHPUFQWEeR50Y+YGG6IYla/Scg+AlsPJGD/7g5fXT5QMOwBE7tC
 P6iA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCklu
c3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlh
YmxlIGZvcgp0aGUgYXNzb2NpYXRlZCBkZXZpY2UgcG9pbnRlci4KClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDE4ICsrKysrKysrKy0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwppbmRleCAyMGM1MzExYzdl
ZDIuLjYyNDc2ODdiNjMzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bp
b19iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jCkBAIC03MSwyNSArNzEsMjUgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9pbml0aWFs
X3Bvd2VyX3N0YXRlKHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQogCiBzdGF0aWMgaW50IGdw
aW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0Jc3Ry
dWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0KLQkJZGV2X2dldF9wbGF0
ZGF0YSgmcGRldi0+ZGV2KTsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OworCXN0
cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRh
dGEoZGV2KTsKIAlzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7CiAJc3RydWN0IGJh
Y2tsaWdodF9kZXZpY2UgKmJsOwogCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwogCWludCBy
ZXQ7CiAKLQlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBf
S0VSTkVMKTsKKwlnYmwgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmdibCksIEdGUF9LRVJO
RUwpOwogCWlmIChnYmwgPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlnYmwtPmRldiA9
ICZwZGV2LT5kZXY7CisJZ2JsLT5kZXYgPSBkZXY7CiAKIAlpZiAocGRhdGEpCiAJCWdibC0+ZmJk
ZXYgPSBwZGF0YS0+ZmJkZXY7CiAKLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9y
ZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24iKTsKKwlnYmwtPmRlZl92YWx1ZSA9IGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVmYXVsdC1vbiIpOwogCi0JZ2JsLT5ncGlv
ZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEwsIEdQSU9EX0FTSVMpOworCWdibC0+
Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEwsIEdQSU9EX0FTSVMpOwogCWlmIChJU19F
UlIoZ2JsLT5ncGlvZCkpIHsKIAkJcmV0ID0gUFRSX0VSUihnYmwtPmdwaW9kKTsKIAkJaWYgKHJl
dCAhPSAtRVBST0JFX0RFRkVSKQpAQCAtMTAxLDExICsxMDEsMTEgQEAgc3RhdGljIGludCBncGlv
X2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCW1lbXNldCgm
cHJvcHMsIDAsIHNpemVvZihwcm9wcykpOwogCXByb3BzLnR5cGUgPSBCQUNLTElHSFRfUkFXOwog
CXByb3BzLm1heF9icmlnaHRuZXNzID0gMTsKLQlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9y
ZWdpc3RlcigmcGRldi0+ZGV2LCBkZXZfbmFtZSgmcGRldi0+ZGV2KSwKLQkJCQkJJnBkZXYtPmRl
diwgZ2JsLCAmZ3Bpb19iYWNrbGlnaHRfb3BzLAorCWJsID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNl
X3JlZ2lzdGVyKGRldiwgZGV2X25hbWUoZGV2KSwKKwkJCQkJZGV2LCBnYmwsICZncGlvX2JhY2ts
aWdodF9vcHMsCiAJCQkJCSZwcm9wcyk7CiAJaWYgKElTX0VSUihibCkpIHsKLQkJZGV2X2Vycigm
cGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGJhY2tsaWdodFxuIik7CisJCWRldl9lcnIo
ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGJhY2tsaWdodFxuIik7CiAJCXJldHVybiBQVFJfRVJS
KGJsKTsKIAl9CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
