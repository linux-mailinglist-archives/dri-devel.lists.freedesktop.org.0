Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BBCA5CFE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E1F89A14;
	Mon,  2 Sep 2019 20:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A8D8910C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:34:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n10so3751910wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOZ9G7G9MWu3PapBqwm76MzTbTk7qh7g47mE4DOAzps=;
 b=iZn6fCRZhUalpKywkjL7eSla9i7lY/Dh2SDN5j+F/9HiWhqHl2aY0Q9gTIsOy2g5I9
 x6LwyYyMGURBYpTBTWw0CRFzL+TD+IecOMhj8gvnGL6JC4zXJ2sVonRsNNE5xiDVGsKg
 b3cYmXt0Cz8FpU84H+OlOiA3m23iznLRcUP6dBIQQADHU4iifas1x9TEqmP9OVAKwbn8
 s43Uqh7HBomQaas9ORjOu9wmmehpGfDLvvQoSTHdSng3BYj+d0VIYMbVadJV+mU0eBD6
 QaTKNbwXeyzm78M+GFM2Q0tjZh1tro0Mhv3csmHrFw6Q7nsMvVNbVOAJMb5HPd0cEO6O
 773w==
X-Gm-Message-State: APjAAAUqeXzflTtFQkBZ0Jh1KHe0TpiudDztazgZ6h2QoLlfV6Gruoh9
 bltD3wwPUi4ltE6yO2c1a0GrLA==
X-Google-Smtp-Source: APXvYqyPyCZkVkGyJylO/Z4gFXwGq95akjDrBPerrKkIdPHewT4cqgI0NrgE4gHZcdxk3CuDm2BYqw==
X-Received: by 2002:a1c:eb13:: with SMTP id j19mr33248298wmh.18.1567427696092; 
 Mon, 02 Sep 2019 05:34:56 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:34:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 3/7] sh: ecovec24: don't set unused fields in
 platform data
Date: Mon,  2 Sep 2019 14:34:40 +0200
Message-Id: <20190902123444.19924-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XOZ9G7G9MWu3PapBqwm76MzTbTk7qh7g47mE4DOAzps=;
 b=S02UO1ON99M1ouFNv8Fx0Xfkw7LOATunblr4HuZkddsYv/0NpCFEoEpOmOcnwsI8nY
 VElm2FAR+R/tHlyAC8hk1GoYi6+xQwuNbqFjtLSO0CpOk3Tzs3VdS93tFz15As0KPeBH
 UPJ7XsSxHjHFbfU3clWqLaBu5DJoT+go9nASHDJLsIIUvm4cscKqWHqdTjyrvLVQbPsW
 LiSHRSxqkQpNj6t15AFHNOTC8jy+ckjaVKdloIB83XMyl6hKi02d1Js3e6kCUlsZRK4a
 WvMbpKsMfc3vqm3H/Ee0G8Lkc3dJSCDM6c3tKCCq/WXG1oKwVrALh2/fv9nq4ZpO3nO5
 7Wlg==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClBs
YXRmb3JtIGRhdGEgZmllbGRzIG90aGVyIHRoYW4gZmJkZXYgYXJlIG5vIGxvbmdlciB1c2VkIGJ5
IHRoZQpiYWNrbGlnaHQgZHJpdmVyLiBSZW1vdmUgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEJhcnRv
c3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBB
bmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiBhcmNo
L3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMy
NC9zZXR1cC5jIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jCmluZGV4IDY5
MjZiYjM4NjViOS4uNjRhNWExNjYyYjZkIDEwMDY0NAotLS0gYS9hcmNoL3NoL2JvYXJkcy9tYWNo
LWVjb3ZlYzI0L3NldHVwLmMKKysrIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1
cC5jCkBAIC0zODYsOSArMzg2LDYgQEAgc3RhdGljIHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBncGlv
X2JhY2tsaWdodF9wcm9wc1tdID0gewogCiBzdGF0aWMgc3RydWN0IGdwaW9fYmFja2xpZ2h0X3Bs
YXRmb3JtX2RhdGEgZ3Bpb19iYWNrbGlnaHRfZGF0YSA9IHsKIAkuZmJkZXYgPSAmbGNkY19kZXZp
Y2UuZGV2LAotCS5ncGlvID0gR1BJT19QVFIxLAotCS5kZWZfdmFsdWUgPSAxLAotCS5uYW1lID0g
ImJhY2tsaWdodCIsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9p
bmZvIGdwaW9fYmFja2xpZ2h0X2RldmljZV9pbmZvID0gewotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
