Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251072EA5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED97F6E4D7;
	Wed, 24 Jul 2019 12:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944516E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:25:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n4so46004051wrs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpxCRy2V5Agh4JLerbqys83epZFNSOhcfRgJphFvhIM=;
 b=PZ/Vk8UgeuYCaP/UAMDuvFxOSLPn5d0DgUTVMpg8/Etprr3Mqv6ufuw64S9E0wt5tp
 QD+Eu/fgCO3pZFdqN3gLDF9GNwJp4H9CSgZ92A8nN3BnkEL+Cep2Mybw6EsAJQsB+yuL
 8nq+Hm5dfvvDmWuKgNJXYm5v/4Lv4qs70sApg1NfrhwyecMiRkMAf3Y9aQQ8GJr01uuD
 e+arYOlTSBCuf/klbV14iiVFpnpr1VV5VX54xjfkNpJJMLkWjdrguXZqoob84wyY9vsK
 isa5dfJerJndit9d/0bxibIyX2voemtnUO0niavQxJdk6ENw4G4iFvKuSSN4hTPT3NAW
 5HYQ==
X-Gm-Message-State: APjAAAWs0FDACOCA8zQ0G3n42awqvrnKRn81bkw6ODlUAgJxDyJ6WLhM
 JAjLYlNu+9K4l11aPelOADs=
X-Google-Smtp-Source: APXvYqwH9jsfXEOv3fcGiDqEzST6zq9dWSrvlyiiGgXaYsEM7ZSrxfCt9vxBHSk4uEnWLIx49qhpiQ==
X-Received: by 2002:adf:8bc2:: with SMTP id w2mr3587116wra.7.1563956720281;
 Wed, 24 Jul 2019 01:25:20 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 7/7] backlight: gpio: use a helper variable for &pdev->dev
Date: Wed, 24 Jul 2019 10:25:08 +0200
Message-Id: <20190724082508.27617-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HpxCRy2V5Agh4JLerbqys83epZFNSOhcfRgJphFvhIM=;
 b=x19yNdi/wQM2QHEWsQ8Fml/XsADvHcBE6EJCk5MVdtjRIYLdcz8QxPF6qBAO/K2CdR
 FPqD88r5piJ1E8YFxjZL6g97vhm37EM9ZEeqHPRtITeuG9dgMFd6OI2rl3kcxyRxGr2/
 AR5YqqHwRuiTh7exj0tZLBHZKBFwKtKGR3YMgT21+68aAndEk8RQF7rg4NUK2SiKQcHO
 rRqpGbAwY3EMvnAmAf58IAZZ3pEMM/x10whrww55L/YQ+PzmVafOq5xEQhagdFtY4f7R
 irg/VdMVaHIJMgs+Tc3kf4xhNgxgrtaUSIa1o0gFgToMLgCzbjz/eaoyeBumRIhB+oEA
 b5Jg==
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
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDE5ICsrKysrKysrKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4IGNkNmE3NWJjYTljYy4u
N2RjNGY5MGQ5MjZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2Jh
Y2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMK
QEAgLTU0LDI5ICs1NCwyOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9vcHMgZ3Bp
b19iYWNrbGlnaHRfb3BzID0gewogCiBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0Jc3RydWN0IGdwaW9fYmFja2xpZ2h0X3Bs
YXRmb3JtX2RhdGEgKnBkYXRhID0KLQkJZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKKwlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OworCXN0cnVjdCBncGlvX2JhY2tsaWdodF9w
bGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsKIAlzdHJ1Y3QgYmFj
a2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7CiAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsOwog
CXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwogCWVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7CiAJ
aW50IHJldCwgZGVmX3ZhbHVlOwogCi0JZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNp
emVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7CisJZ2JsID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9m
KCpnYmwpLCBHRlBfS0VSTkVMKTsKIAlpZiAoZ2JsID09IE5VTEwpCiAJCXJldHVybiAtRU5PTUVN
OwogCiAJaWYgKHBkYXRhKQogCQlnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2OwogCi0JZGVmX3Zh
bHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCgmcGRldi0+ZGV2LCAiZGVmYXVsdC1vbiIp
OworCWRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVmYXVsdC1v
biIpOwogCWZsYWdzID0gZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9X
OwogCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEwsIGZsYWdz
KTsKKwlnYmwtPmdwaW9kID0gZGV2bV9ncGlvZF9nZXQoZGV2LCBOVUxMLCBmbGFncyk7CiAJaWYg
KElTX0VSUihnYmwtPmdwaW9kKSkgewogCQlyZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2QpOwogCQlp
ZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwKKwkJCWRl
dl9lcnIoZGV2LAogCQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5nIG9y
IGludmFsaWQuXG4iKTsKIAkJfQogCQlyZXR1cm4gcmV0OwpAQCAtODUsMTEgKzg1LDEwIEBAIHN0
YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKIAlwcm9wcy50eXBlID0gQkFD
S0xJR0hUX1JBVzsKIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IDE7Ci0JYmwgPSBkZXZtX2JhY2ts
aWdodF9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgZGV2X25hbWUoJnBkZXYtPmRldiksCi0J
CQkJCSZwZGV2LT5kZXYsIGdibCwgJmdwaW9fYmFja2xpZ2h0X29wcywKLQkJCQkJJnByb3BzKTsK
KwlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsIGRldl9uYW1lKGRldiks
IGRldiwgZ2JsLAorCQkJCQkgICAgJmdwaW9fYmFja2xpZ2h0X29wcywgJnByb3BzKTsKIAlpZiAo
SVNfRVJSKGJsKSkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIg
YmFja2xpZ2h0XG4iKTsKKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgYmFja2xp
Z2h0XG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwogCX0KIAotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
