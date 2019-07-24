Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF11D72EB6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAF16E52C;
	Wed, 24 Jul 2019 12:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8446E4B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:25:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h19so32873490wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ARbd1V2PTR/7B70DXuDpAAyS9eCMhAVKqqbb1qk0e7w=;
 b=gYPqcZ/U/xjulkSsbh59ueSO+hYAB/Q5l8g3fruf1JR3QOZf+4UJv0MSTNimtFbbmE
 iDW3uvx6q3HNoud9S2s1G7O9B7iS8NPW7L43rJjLhzgwy2DbJtzUQK9uOCYmlsbtQvh5
 rJA08FfmtjgrQk9vU+lcrrCpzHS02oIv+rTrSChCm3WxTaFegahw2aXToVm155Hrsf5x
 bSQ97MnIh61N6Y8H1ePbR9sDdIoi2a+Dc6Fk5UsY9Cq85ohPIMwo6B1p6CmHWyZwQPjL
 prePWYmgVc17tWsCGI3CS1r+xLl7J2On10zFXwYFJKwH+8uE7x9j7xdDW33mqOGhg17L
 KKJQ==
X-Gm-Message-State: APjAAAUvtj1898ZIfVuVljXmgEUxTVPnII7Xtsms3C47ftJvRMyawnoK
 so/J4GK+gUHPot4Jq9LvVXM=
X-Google-Smtp-Source: APXvYqzkgEv3bgw2h6q7V26EkyUVPqeJGTwwUSYmcdpXaPZAm+K0dgiQU1XSSJC6xbDuOYYXG2bWGg==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr71172006wmb.66.1563956719095; 
 Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 6/7] backlight: gpio: remove def_value from struct
 gpio_backlight
Date: Wed, 24 Jul 2019 10:25:07 +0200
Message-Id: <20190724082508.27617-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ARbd1V2PTR/7B70DXuDpAAyS9eCMhAVKqqbb1qk0e7w=;
 b=wyVGQpD+T3uiZkn3LiRgv0LYR+71l0MHfD4iNRDIwOQSK1f0Vsijy1ZdZwYSok7pGz
 z6LQ/p4UKx3DYKA1xd/DhH3xxwduColASNq35D+f1bZwGtV1216ArwUnZkLSVo0OtHQT
 v37sruntHU3mWDOLAWr7Rdt/I5/oCDYSICOp/dVFtoGCsJBP+j6iLKLMDQWiklPMQGRj
 /MD5+fKLNv8D2Y26FgKUwdHv/cC7IUtLWGtnucaCJ8jkJKrcEF5Z4bcCeTM3atrAeCXh
 qHm6EZZVaObTXL7NmmkRvgeBJ7fNCV1kZMYsReZIJ7ScJgSUHLEuRxbDDoy2a9VXOHJm
 N2Cg==
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
bC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDkg
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4IDcwODgyNTU2
ZjA0Ny4uY2Q2YTc1YmNhOWNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xp
Z2h0LmMKQEAgLTIxLDcgKzIxLDYgQEAKIHN0cnVjdCBncGlvX2JhY2tsaWdodCB7CiAJc3RydWN0
IGRldmljZSAqZmJkZXY7CiAJc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb2Q7Ci0JaW50IGRlZl92YWx1
ZTsKIH07CiAKIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhzdHJ1Y3Qg
YmFja2xpZ2h0X2RldmljZSAqYmwpCkBAIC02MSw3ICs2MCw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19i
YWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgYmFj
a2xpZ2h0X2RldmljZSAqYmw7CiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7CiAJZW51bSBn
cGlvZF9mbGFncyBmbGFnczsKLQlpbnQgcmV0OworCWludCByZXQsIGRlZl92YWx1ZTsKIAogCWdi
bCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmdibCksIEdGUF9LRVJORUwpOwog
CWlmIChnYmwgPT0gTlVMTCkKQEAgLTcwLDggKzY5LDggQEAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChwZGF0YSkKIAkJ
Z2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsKIAotCWdibC0+ZGVmX3ZhbHVlID0gZGV2aWNlX3By
b3BlcnR5X3JlYWRfYm9vbCgmcGRldi0+ZGV2LCAiZGVmYXVsdC1vbiIpOwotCWZsYWdzID0gZ2Js
LT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9EX09VVF9MT1c7CisJZGVmX3ZhbHVl
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCgmcGRldi0+ZGV2LCAiZGVmYXVsdC1vbiIpOwor
CWZsYWdzID0gZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwogCiAJ
Z2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEwsIGZsYWdzKTsKIAlp
ZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7CkBAIC05NCw3ICs5Myw3IEBAIHN0YXRpYyBpbnQgZ3Bp
b19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcmV0dXJu
IFBUUl9FUlIoYmwpOwogCX0KIAotCWJsLT5wcm9wcy5icmlnaHRuZXNzID0gZ2JsLT5kZWZfdmFs
dWU7CisJYmwtPnByb3BzLmJyaWdodG5lc3MgPSBkZWZfdmFsdWU7CiAJYmFja2xpZ2h0X3VwZGF0
ZV9zdGF0dXMoYmwpOwogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgYmwpOwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
