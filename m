Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D71A5CF7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6818A899E6;
	Mon,  2 Sep 2019 20:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA968911A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:35:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y135so9779761wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBLJsFDHxwQO5fDJ/0XiJk/ChmWyJTLddlv7y7zlKto=;
 b=dzSkR+c005rT5AAxiuypE/5z03Tyes2b8bdfyG86nS4zqq/4vW0CAEkHaXdrpgYKot
 PfHjWY0wHxIxx0OH44AeAIS2f6z4dBfvKMOo/pimgtgu+O+cKtCUfd22cDqIU/34erIR
 +0WZ2FoD1wMmCnrOlNXO16UMhDCgBoVJMbBPuybXHIIS1CRtYJHNfWZ7viKbegBB2c57
 bwoaW1u7HNGmFeRKJ40NUDZuph63ttPpVVx+FavPG7GVXRCWrO+soK1epfvWaAoiBufe
 PubUsp2PtWywXIz3FrXrpzkwhzfnoKXsvU2PeMkrOIUJ07NiLBJXB2bH21oRJlKcqgng
 l7sw==
X-Gm-Message-State: APjAAAXmTCiQNYINiaN1KGHzC/JaE+eHp0+9BipzC3a+joDO7NMuQnLN
 qKZiJucDL7XXMKYo0w5kJlPNzg==
X-Google-Smtp-Source: APXvYqwuZajd1J/NSYA/QGRzkfcMxV+ED2cD7wbF0dc30G/G6uOz9gOEoa4lQU/BcyHW3BPU/kspoA==
X-Received: by 2002:a1c:f103:: with SMTP id p3mr34157179wmh.18.1567427699432; 
 Mon, 02 Sep 2019 05:34:59 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:34:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 6/7] backlight: gpio: remove def_value from struct
 gpio_backlight
Date: Mon,  2 Sep 2019 14:34:43 +0200
Message-Id: <20190902123444.19924-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iBLJsFDHxwQO5fDJ/0XiJk/ChmWyJTLddlv7y7zlKto=;
 b=lwjSsLjUer1VFsgWsDkSA4eN6sALaf4s+oUA+k3XyXbOV0PLVLfHF1wEBKgjAUsM7B
 FqlsuujinuKAzlU/2L38daWRY1ekKA01/UqW69QBIURMfm6KK9bUojE4BNJvIZx0HFpC
 ISx/AmjTBTU9c30Fsu48V5cGMES1/BdDcqgBSsXZxUErSspRTJFgFwwYlOz+PnigdkOL
 eUPhvmAOL418pfzBbbfsKKpec96TNxLRjPJvpmP98sRtW2XO5kIoPn17kwq9sN/SQMjj
 6B5pZamHMxUOAXR2CtMRs3dkTOVI/fxhmBZ0DPZW4nxgFnmr9naHl2XEp7Z20DmqMXUs
 UQ3g==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
aXMgZmllbGQgaXMgdW51c2VkIG91dHNpZGUgb2YgcHJvYmUoKS4gVGhlcmUncyBubyBuZWVkIHRv
IHN0b3JlIGl0LgpXZSBjYW4gbWFrZSBpdCBpbnRvIGEgbG9jYWwgdmFyaWFibGUuCgpTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgpS
ZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+ClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCA5ICsr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwppbmRleCA3MDg4MjU1NmYw
NDcuLmNkNmE3NWJjYTljYyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bp
b19iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jCkBAIC0yMSw3ICsyMSw2IEBACiBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgewogCXN0cnVjdCBk
ZXZpY2UgKmZiZGV2OwogCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwotCWludCBkZWZfdmFsdWU7
CiB9OwogCiBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJh
Y2tsaWdodF9kZXZpY2UgKmJsKQpAQCAtNjEsNyArNjAsNyBAQCBzdGF0aWMgaW50IGdwaW9fYmFj
a2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGJhY2ts
aWdodF9kZXZpY2UgKmJsOwogCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwogCWVudW0gZ3Bp
b2RfZmxhZ3MgZmxhZ3M7Ci0JaW50IHJldDsKKwlpbnQgcmV0LCBkZWZfdmFsdWU7CiAKIAlnYmwg
PSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKIAlp
ZiAoZ2JsID09IE5VTEwpCkBAIC03MCw4ICs2OSw4IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGln
aHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocGRhdGEpCiAJCWdi
bC0+ZmJkZXYgPSBwZGF0YS0+ZmJkZXY7CiAKLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9w
ZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24iKTsKLQlmbGFncyA9IGdibC0+
ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOworCWRlZl92YWx1ZSA9
IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24iKTsKKwlm
bGFncyA9IGRlZl92YWx1ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKIAogCWdi
bC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldCgmcGRldi0+ZGV2LCBOVUxMLCBmbGFncyk7CiAJaWYg
KElTX0VSUihnYmwtPmdwaW9kKSkgewpAQCAtOTQsNyArOTMsNyBAQCBzdGF0aWMgaW50IGdwaW9f
YmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiBQ
VFJfRVJSKGJsKTsKIAl9CiAKLQlibC0+cHJvcHMuYnJpZ2h0bmVzcyA9IGdibC0+ZGVmX3ZhbHVl
OworCWJsLT5wcm9wcy5icmlnaHRuZXNzID0gZGVmX3ZhbHVlOwogCWJhY2tsaWdodF91cGRhdGVf
c3RhdHVzKGJsKTsKIAogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGJsKTsKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
