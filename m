Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F051AC483A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CEB6E8C1;
	Wed,  2 Oct 2019 07:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5128D6E788
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:59:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v17so3126930wml.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 05:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
 b=IucNKFqBT2CTswHhEqfyMvdP09V30WBqIW7Gnr03cuM3Vlh89kK61tIttWLM3IJLwF
 9NANDwZfI5TvoyC1Af66mMlq+ciSjzZKmdyDBZuw0lrQgqdgHZcWwkhytnbGc9jin8kF
 pOVOM5Yh2QFx0v+yll2mZRWISncVPUHMgUOyP+fU/TwPq/f/W3dBi3uYNVpTcm3Bqiua
 0NQT5u+lhXizmPH6fVtyNEXrUv+hjQvlqnL+v8y6x3ZqILmg9Y4/WsFA/91ijYsymF8J
 p8vUelD5UyiEzJrPFJcrXwfSYPJk4a0WGQffNAzZfLhom0loxSPkRIsXyy3X66e0XRjS
 S/IQ==
X-Gm-Message-State: APjAAAWfvJa1iL4aDylLyfUSx+NNXnU6ZaikKa+pqn0ODR7PQN8vdz4K
 rIWHdYUwL4/jN7PftdgG8cXDXg==
X-Google-Smtp-Source: APXvYqz4hwRoZovdKY3xAs1Jj3G2pPXNemkxGMSqBibHk1SoQoNt+fHBr5oTS1QgLiaTkOSdBS1/dw==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr3528584wmk.11.1569934771921;
 Tue, 01 Oct 2019 05:59:31 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 05:59:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 6/7] backlight: gpio: use a helper variable for &pdev->dev
Date: Tue,  1 Oct 2019 14:58:36 +0200
Message-Id: <20191001125837.4472-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3BPysl6DVnolWKLxLF4VbdfeZy6f97Qv6aum3TgQhxM=;
 b=Py0M9oMfQI+PMa52Szwcn96sG7yU+5grw98sqbRASFWjqymtUPfIXRkhfGWRJD+uDc
 DFOu0PfiYq1m23B1DGc6kJPwZwMiaRvRd1WOam26xktbHxIDyr6V06nEie2tUaHoKdtV
 AomZQ+XSHDMaZFKSreeGOeLEXAxO4iRq1Tp0sk+tnJuTJbP2SILKf6ElpGAzQ+k8jCyQ
 NMvnZtYl9F504nM6L1/fKeoVVAjAK9cwk1LrFe8bU200Hp+AZIy1y9ujvf+Q6hhBfUUV
 MFGIJrG+POreX2icEi090xnKID8hmd/owTKbPoTRDP55mYCSy1y9nWR81XgMJAB48TcD
 GdGQ==
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
