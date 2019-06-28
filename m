Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759065B12C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE3B89CC9;
	Sun, 30 Jun 2019 18:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA906E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:03:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a15so8492404wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwsPk5YbJoDix1Y8ZNEpxUoFdLsjdX1Ck3sCZ4BgCIs=;
 b=PmGgHy97mXZxV8Eb3yUScpxHaw0zWMzZEfZx6n4l1+zuhOJ+EunMvP2o2MuHHSANfq
 yEn9Drr8LnLhCxKghEGCHkm2e0SJSkpMmqdAUr4AVOHXIbHH1Sx/O4GcHWWz/80MltKz
 1ArxvPGa7JZFJfZhqNzxi8daO7C5Lu6nRhcg+O6SMbnSrLlhRPrN8S6cm8m7f/BFsj4R
 M6MnTLHa8rri//KstsxtjpyJx0XvHcUbXCAxp7cf2JwMMN11WVg8JDQnwUfRgZwX1/ma
 bg6+yWp+gsFkcWbK4/bTU/tfXzUdFs8CvJEw5GjOf9ugvNi2XYlr0WVi/1eOqYlag6yC
 KK9Q==
X-Gm-Message-State: APjAAAU6QYSx74skqePcz/XzqfUMAoqRqogfI/KP4qT6efVfGlEiUm94
 RVDzXK4YQk6+5r+F088zY4Kp/w==
X-Google-Smtp-Source: APXvYqwFiCb2shM2kiGTN1aAGEpRy7nSuxeCbB/BtOrmU69Ws9UfeMtcBbJczJme1reWj0RNCFudtQ==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr6707413wmi.156.1561716184473; 
 Fri, 28 Jun 2019 03:03:04 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 03:03:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFT 1/4] sh: ecovec24: add additional properties to the
 backlight device
Date: Fri, 28 Jun 2019 12:02:50 +0200
Message-Id: <20190628100253.8385-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
References: <20190628100253.8385-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwsPk5YbJoDix1Y8ZNEpxUoFdLsjdX1Ck3sCZ4BgCIs=;
 b=e4MZgyhkaBCcepB2UsfuVfMG6ppjiDnGbz9M79hYKRlZFD1dfOZfKqq/Z6s3I71WSy
 6EWWm6HcpnfPlDylc6RkNICWKI20aotoUFlMqVqwI7XmWNhUr3um5ww6jiMDFo8OsYPU
 5tBd7f9XIBXqM1+IIDt8/VvJ36ZmYODC22e48EWw78V3Oe+BvkiEQMBA+21buJ9Ozd6h
 stDj8jo5MynT4DCP4CIhUwPrIMVVxqfWSJeapQoVc1FODSlcZ/q0XKVmRfFCnxyVVgGJ
 g0I6ZmlL1WxbdI6TPIYy9H9c7W4+vZYJaNAyIDPV4bRKIzfHHdP9S9u5nVHzVPvxI/l7
 Rpig==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCkFk
ZCBhIEdQSU8gbG9va3VwIGVudHJ5IGFuZCBhIGRldmljZSBwcm9wZXJ0eSBmb3IgR1BJTyBiYWNr
bGlnaHQgdG8gdGhlCmJvYXJkIGZpbGUuIFRpZSB0aGVtIHRvIHRoZSBwbGF0Zm9ybSBkZXZpY2Ug
d2hpY2ggaXMgbm93IHJlZ2lzdGVyZWQgdXNpbmcKcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2Z1
bGwoKSBiZWNhdXNlIG9mIHRoZSBwcm9wZXJ0aWVzLiBUaGVzZSBjaGFuZ2VzCmFyZSBpbmFjdGl2
ZSBub3cgYnV0IHdpbGwgYmUgdXNlZCBvbmNlIHRoZSBncGlvIGJhY2tsaWdodCBkcml2ZXIgaXMK
bW9kaWZpZWQuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdz
a2lAYmF5bGlicmUuY29tPgotLS0KIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAu
YyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvc2gvYm9hcmRz
L21hY2gtZWNvdmVjMjQvc2V0dXAuYyBiL2FyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0
dXAuYwppbmRleCBmNDAyYWE3NDFiZjMuLjY5MjZiYjM4NjViOSAxMDA2NDQKLS0tIGEvYXJjaC9z
aC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jCisrKyBiL2FyY2gvc2gvYm9hcmRzL21hY2gt
ZWNvdmVjMjQvc2V0dXAuYwpAQCAtMzcxLDYgKzM3MSwxOSBAQCBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RldmljZSBsY2RjX2RldmljZSA9IHsKIAl9LAogfTsKIAorc3RhdGljIHN0cnVjdCBncGlv
ZF9sb29rdXBfdGFibGUgZ3Bpb19iYWNrbGlnaHRfbG9va3VwID0geworCS5kZXZfaWQJCT0gImdw
aW8tYmFja2xpZ2h0LjAiLAorCS50YWJsZSA9IHsKKwkJR1BJT19MT09LVVAoInNoNzcyNF9wZmMi
LCBHUElPX1BUUjEsIE5VTEwsIEdQSU9fQUNUSVZFX0hJR0gpLAorCQl7IH0KKwl9LAorfTsKKwor
c3RhdGljIHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBncGlvX2JhY2tsaWdodF9wcm9wc1tdID0gewor
CVBST1BFUlRZX0VOVFJZX0JPT0woImRlZmF1bHQtb24iKSwKKwl7IH0KK307CisKIHN0YXRpYyBz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSBncGlvX2JhY2tsaWdodF9kYXRhID0g
ewogCS5mYmRldiA9ICZsY2RjX2RldmljZS5kZXYsCiAJLmdwaW8gPSBHUElPX1BUUjEsCkBAIC0z
NzgsMTMgKzM5MSwxNSBAQCBzdGF0aWMgc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2Rh
dGEgZ3Bpb19iYWNrbGlnaHRfZGF0YSA9IHsKIAkubmFtZSA9ICJiYWNrbGlnaHQiLAogfTsKIAot
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgZ3Bpb19iYWNrbGlnaHRfZGV2aWNlID0gewor
c3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaW5mbyBncGlvX2JhY2tsaWdodF9k
ZXZpY2VfaW5mbyA9IHsKIAkubmFtZSA9ICJncGlvLWJhY2tsaWdodCIsCi0JLmRldiA9IHsKLQkJ
LnBsYXRmb3JtX2RhdGEgPSAmZ3Bpb19iYWNrbGlnaHRfZGF0YSwKLQl9LAorCS5kYXRhID0gJmdw
aW9fYmFja2xpZ2h0X2RhdGEsCisJLnNpemVfZGF0YSA9IHNpemVvZihncGlvX2JhY2tsaWdodF9k
YXRhKSwKKwkucHJvcGVydGllcyA9IGdwaW9fYmFja2xpZ2h0X3Byb3BzLAogfTsKIAorc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmdwaW9fYmFja2xpZ2h0X2RldmljZTsKKwogLyogQ0VV
MCAqLwogc3RhdGljIHN0cnVjdCBjZXVfcGxhdGZvcm1fZGF0YSBjZXUwX3BkYXRhID0gewogCS5u
dW1fc3ViZGV2cwkJCT0gMiwKQEAgLTEwMDYsNyArMTAyMSw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICplY292ZWNfZGV2aWNlc1tdIF9faW5pdGRhdGEgPSB7CiAJJnVzYjFfY29t
bW9uX2RldmljZSwKIAkmdXNiaHNfZGV2aWNlLAogCSZsY2RjX2RldmljZSwKLQkmZ3Bpb19iYWNr
bGlnaHRfZGV2aWNlLAogCSZrZXlzY19kZXZpY2UsCiAJJmNuMTJfcG93ZXIsCiAjaWYgZGVmaW5l
ZChDT05GSUdfTU1DX1NESEkpIHx8IGRlZmluZWQoQ09ORklHX01NQ19TREhJX01PRFVMRSkKQEAg
LTE0NjQsNiArMTQ3OCwxMiBAQCBzdGF0aWMgaW50IF9faW5pdCBhcmNoX3NldHVwKHZvaWQpCiAj
ZW5kaWYKICNlbmRpZgogCisJZ3Bpb2RfYWRkX2xvb2t1cF90YWJsZSgmZ3Bpb19iYWNrbGlnaHRf
bG9va3VwKTsKKwlncGlvX2JhY2tsaWdodF9kZXZpY2UgPSBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0
ZXJfZnVsbCgKKwkJCQkJJmdwaW9fYmFja2xpZ2h0X2RldmljZV9pbmZvKTsKKwlpZiAoSVNfRVJS
KGdwaW9fYmFja2xpZ2h0X2RldmljZSkpCisJCXJldHVybiBQVFJfRVJSKGdwaW9fYmFja2xpZ2h0
X2RldmljZSk7CisKIAlyZXR1cm4gcGxhdGZvcm1fYWRkX2RldmljZXMoZWNvdmVjX2RldmljZXMs
CiAJCQkJICAgIEFSUkFZX1NJWkUoZWNvdmVjX2RldmljZXMpKTsKIH0KLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
