Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE385C4844
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84726E8DE;
	Wed,  2 Oct 2019 07:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5D6E788
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:59:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 7so3288204wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 05:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
 b=k7ORM5dBO627EnUDBEhGh/JXWTLsXDzD9r2m//weZ8CwfEffCkYLo9geOtVm6bAhiU
 XpVTbJsW/HMStrFZoECRXNqbARsf/DIE3rWSVP2xSdr5hCR8n6Rbhv4fqt1+T9M9NK9c
 LoVSLFkl3KqbpnpiN/p38YcefUwejkETIfVY+qCup0uzMiJKhcnZf1IdCvCGfKql6/6R
 mrsbsEokrzrgRULI/Dh/0Xuzj5MY9w7Usiq2bbU7wrZNg+KFjzFwW2TCu8SPOymH5Sxg
 Uzs03OYkJ+3lx9m3tO/xeFJhBMXvWAzZWmqLydYLNvJ6e1fYA+YgqOMnAB39SUxFqjeJ
 Q5HQ==
X-Gm-Message-State: APjAAAXcRTu6WB7z3uMTvVkead2ChD/6r1nzDMDDKDnxcgrLSyNLH71w
 CiGIc9fmUdSTLdqLNQwDgYZ9dg==
X-Google-Smtp-Source: APXvYqyfFhsII8M6bT8z0Hza0LDbhxIPYRpZT0+h7X+cw4RTZ4ywSFMziDChoEo0eoy8GmQhERWw+g==
X-Received: by 2002:a1c:9988:: with SMTP id b130mr3769813wme.164.1569934769902; 
 Tue, 01 Oct 2019 05:59:29 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 05:59:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 4/7] sh: ecovec24: don't set unused fields in platform data
Date: Tue,  1 Oct 2019 14:58:34 +0200
Message-Id: <20191001125837.4472-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
 b=lcmE3vN8QgAF/cvQx92RbIvCHD9TYk2CybtaaltOK66//ZtmicBFCv2YZD0wNJvk9Z
 x3LWJ+IpV72x0eGb6WR/OKHiXkz/P1HC/meJgjLIvflb9QGtyNheUwiAWw6v0AZhKnxB
 ma/y6xvB5CrMHLfFUQrJ1vXBqRLMnRT6sligmSUsafHf0QBngMOebQIuuzuFoLhA8n5c
 Mqqoz9Gcq2KG8i2AVZ5fRdKa0/rHB5XgABwyVLJvA2ebNiGjsWWjn39+XDAKhOnB2z+y
 lelRUsfcCN7WiEIuGroQUsEAA6kHafmjUUuh9/DaSZw5CZ7MvPyqGmqgDhR3bnc7tldn
 areQ==
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
NC9zZXR1cC5jIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jCmluZGV4IGFh
YThlYTYyNjM2Zi4uZGQ0MjdiYWM1Y2RlIDEwMDY0NAotLS0gYS9hcmNoL3NoL2JvYXJkcy9tYWNo
LWVjb3ZlYzI0L3NldHVwLmMKKysrIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1
cC5jCkBAIC0zODYsOSArMzg2LDYgQEAgc3RhdGljIHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBncGlv
X2JhY2tsaWdodF9wcm9wc1tdID0gewogCiBzdGF0aWMgc3RydWN0IGdwaW9fYmFja2xpZ2h0X3Bs
YXRmb3JtX2RhdGEgZ3Bpb19iYWNrbGlnaHRfZGF0YSA9IHsKIAkuZmJkZXYgPSAmbGNkY19kZXZp
Y2UuZGV2LAotCS5ncGlvID0gR1BJT19QVFIxLAotCS5kZWZfdmFsdWUgPSAxLAotCS5uYW1lID0g
ImJhY2tsaWdodCIsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9p
bmZvIGdwaW9fYmFja2xpZ2h0X2RldmljZV9pbmZvID0gewotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
