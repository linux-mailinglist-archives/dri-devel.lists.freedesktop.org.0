Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5266671277
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC2789722;
	Tue, 23 Jul 2019 07:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8A989C61
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:03:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n9so39864485wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zJTPUvP+hqISFeooYsrQz9ymOrtJOaEeguggmTOq/k=;
 b=XydQ7pSObXDH/xTONHkggriTHRsPFYuRg3roWnXr9iIaUcyHSQtM2DYxdMslv5xOuK
 Yerixj4ST02EjUi5loHtI7Bog49gSOeQguPfQ+lyx/3z7dUBQJWR6EFjYztQKGFPdpct
 i0xF4YqQezVjlyYS2InOS+IXSP7TLys74VAp1yCY6h9zvLdAKjZ9JxXAl1P7oGjp6lED
 uTQ23vkMs+sxRXo4PYVIWSubz2DyaBnIwhXjOWRpSZ+aaU9irufkh2cqSAmrdIhn2n/0
 dS3qZ2I49MYYI6PfH8K7p1ojtGev05B8v0gCcQqv4IXb26tFHKU+R8Mnftl0udrTBQB6
 FS7w==
X-Gm-Message-State: APjAAAURadsW/h4a13mTEPdQ3J3vs9lYdYydn0wcPTiujdJIy3oNiMVm
 c72L42Kujo692edwP0xn4wk=
X-Google-Smtp-Source: APXvYqzLinW8I3dvvR4AzrGIE+Sp+hY3qQ4I/jHq/HSqa9n6hwBNqZHXKmfOxK1dFVSKdkYe6bGf6g==
X-Received: by 2002:adf:a299:: with SMTP id s25mr67876484wra.74.1563807802560; 
 Mon, 22 Jul 2019 08:03:22 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:03:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 6/7] backlight: gpio: remove def_value from struct
 gpio_backlight
Date: Mon, 22 Jul 2019 17:03:01 +0200
Message-Id: <20190722150302.29526-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zJTPUvP+hqISFeooYsrQz9ymOrtJOaEeguggmTOq/k=;
 b=PCiSprjXoELIP7AMmcbBALqlNtlT1CQZuIXj5Wrl6j/YOz0ypnf9wGGwfuxfWWG5AW
 5In16oK8Cx1DrA84pvaI6AR2rBGQGDW1+q2nWlhI8DTMOTUHCETVzyuju7HlwqTjBx8n
 ck0D9O44NO3Hl7hwl/6qoWy77e/Qpm0+F4beiorACJn+rBdn8e+NmNrANJoSkP6xvFdM
 ZqX+aBUsZ9BsCfcwzPPZEFM7IER//yZQ8jQiMMylWhKnn5mabG7/qjjinKzXTGRyIOaJ
 1HXR35ZJQIxFhr2CalNwGxfF6TgdjOVf9jWAv4SyK15IjCfB0JKvaaFHISVN5GfO159y
 LTzw==
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
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgot
LS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCA5ICsrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwppbmRleCA3MDg4MjU1NmYwNDcuLmNk
NmE3NWJjYTljYyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCkBA
IC0yMSw3ICsyMSw2IEBACiBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgewogCXN0cnVjdCBkZXZpY2Ug
KmZiZGV2OwogCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwotCWludCBkZWZfdmFsdWU7CiB9Owog
CiBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdo
dF9kZXZpY2UgKmJsKQpAQCAtNjEsNyArNjAsNyBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJsOwogCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwogCWVudW0gZ3Bpb2RfZmxh
Z3MgZmxhZ3M7Ci0JaW50IHJldDsKKwlpbnQgcmV0LCBkZWZfdmFsdWU7CiAKIAlnYmwgPSBkZXZt
X2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKIAlpZiAoZ2Js
ID09IE5VTEwpCkBAIC03MCw4ICs2OSw4IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocGRhdGEpCiAJCWdibC0+ZmJk
ZXYgPSBwZGF0YS0+ZmJkZXY7CiAKLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9y
ZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24iKTsKLQlmbGFncyA9IGdibC0+ZGVmX3Zh
bHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOworCWRlZl92YWx1ZSA9IGRldmlj
ZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24iKTsKKwlmbGFncyA9
IGRlZl92YWx1ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKIAogCWdibC0+Z3Bp
b2QgPSBkZXZtX2dwaW9kX2dldCgmcGRldi0+ZGV2LCBOVUxMLCBmbGFncyk7CiAJaWYgKElTX0VS
UihnYmwtPmdwaW9kKSkgewpAQCAtOTQsNyArOTMsNyBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xp
Z2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiBQVFJfRVJS
KGJsKTsKIAl9CiAKLQlibC0+cHJvcHMuYnJpZ2h0bmVzcyA9IGdibC0+ZGVmX3ZhbHVlOworCWJs
LT5wcm9wcy5icmlnaHRuZXNzID0gZGVmX3ZhbHVlOwogCWJhY2tsaWdodF91cGRhdGVfc3RhdHVz
KGJsKTsKIAogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGJsKTsKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
