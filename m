Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 396CBCDC1F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD5B6E488;
	Mon,  7 Oct 2019 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187DA6E450
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:32:09 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y5so7736754pfo.4
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 20:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
 b=FxamlCN5HfBgSa04iw474a6kmQSeS7TA5/1UTG5JGqew3g0SxPOsh+NzaS45hw24X5
 soGLX17brHpv4nbKKaGsK+c8Bg/LjQsk3bcjTiZm1epVFXKT0EttFObj6OaOMwL50/f7
 NInKgssyh4o8UCmEYzmVqELZKSEQnrnE0k5R1aLDhA383/N87TPkpyJfLMtD3hzkGyoT
 E1xa8714lebrbARR3HMWGUhubPBhrGaN7jaC1vaWiH8y1TwIQ6GYlW4yhTAQU7HTEt98
 YHoxrohmePjLETqCBP1tlYpx+0atrBUhubENwO717jSf9ons61jyueM1bYybTytfs/EU
 8JhQ==
X-Gm-Message-State: APjAAAVO+WQkBZeZ6HCxN7Mft6xX2YWD1oHVogh0RcnkDrQrjG69C+G0
 UEzxFM97yjujt9rI+r4V7WgMKA==
X-Google-Smtp-Source: APXvYqzdOWFcsQosjrpnIGRE710tR911OOtW+TNB7GzyjXHdPq3QJaRmZyw9bD+GubnD2IvAJNhmSw==
X-Received: by 2002:a62:7d54:: with SMTP id y81mr30577794pfc.86.1570419128451; 
 Sun, 06 Oct 2019 20:32:08 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net.
 [96.95.220.76])
 by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 20:32:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v5 4/7] sh: ecovec24: don't set unused fields in platform data
Date: Mon,  7 Oct 2019 05:31:57 +0200
Message-Id: <20191007033200.13443-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdPiqrMx4DGxjMQly7Bs8yH/i3WsBA2bl/JSPtLQAlU=;
 b=CdUzkW995hDj+4VhwVg9oMZHUzQGlHk72ob3OVsXRVWZgf7+4PHcvudHA/4wmxF+Nx
 q+SIn6grfSFoMvOijlJ9pQ33jnn2HTj+q/fNdBXa9XiocAuw6VtpXZ6uq4TlDqtHtpoW
 uzBnJM5AkvSTCU9MtnTncl8QA8kaeg1O2tXI77iJpYeu/i7WyUxJzuzz7F21puHWx2Vv
 n3dkHdeaikrmzXLbNk9GudGvyDoVdGfiVsmDaMrvK8ByUz5nRuPw0Z4rzejlbciaT0p9
 oCxo5hLvx+sIIVu0Vn9kz6xNFGZ12WuMxEDcZWxk1OPqX2NpNxdx+GQmU1E8FXVLopYl
 n06Q==
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
