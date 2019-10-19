Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C4DDB95
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768F589C54;
	Sun, 20 Oct 2019 00:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0E89EBD
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l10so8129122wrb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
 b=hJA5hVo2HJxNP3Xebyg5IQm0CUey5DJRUUSeSTMUkUhxQLdAHr24aUsnIxCuLG2t1D
 ZMjib+OTeSlWBbvVBG3eiWpl7v9QHoEF5iztfhVM50C/f3Ip37g6/KF5+jnkpdekGP64
 hehkIyPY7Aopxs4s0bkKYws4rfLkDTD6UttX/DxzWzA20Ay2OUTbTla3SVrxzivLA7p/
 +ylG4sjxBdJdLDm8dtSB0MK+zKqgmZgsMMeXSa7PhEq4k7ZDPyfngWHjTFZdMh0GGAeA
 NsBbTFnRbQ0tC1ycc8wzQWtZ67ger99vq+giLI8/3mW5JIEnW8yvuzD1cQFvPsnaQlaR
 yXTw==
X-Gm-Message-State: APjAAAWOImMP4byBgjVgufKwCQAMNo9foQLcIcKB+Nw/5CaardxHnmgr
 SKKPpCpwvWIWX6HdkWpSiFY6Yw==
X-Google-Smtp-Source: APXvYqyMb3UE4kvzJU/RtmQDyFjei6QR5gPK148b8ly3ekSY2I6LEvUTkS+/jEFISaVozTN+hXpUFA==
X-Received: by 2002:adf:c105:: with SMTP id r5mr4342828wre.125.1571474177563; 
 Sat, 19 Oct 2019 01:36:17 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 6/9] sh: ecovec24: don't set unused fields in platform data
Date: Sat, 19 Oct 2019 10:35:53 +0200
Message-Id: <20191019083556.19466-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
 b=KTrWMJfcSsNsU/hInH+8etvSbXWxmCunj3myy9w3kenbKYKLPvPV2HXvi/9ONkNlby
 JlacPZ3LR4yVNif1PlgZpYgm6GvDWNCsxclVp+7fpsz9MlOznlaVrG9I85dnSyZcPjuK
 zZTZrKKoHTU/wnkEaBL9oEttLxsLvew/TtYzrVTXdL4dWZQ4NtjZyZq6UYkDskdNSgWP
 Aw7QdUQ0Pi9iYxj9wqB9guvcDwKlzlHqSbrPiqZ9iUULr1G+gvARZZTFhGNhXxAxkcXm
 EBhC3iFA9YN46vY/ako/Gp2L4ASzbDaTlcUsXZxo3XR04DIEVlIbKINwG1cLyh8dPg2u
 /HUg==
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
