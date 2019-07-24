Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9129F72EA6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3DD6E4EC;
	Wed, 24 Jul 2019 12:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FC86E4B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:25:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so20859588wrr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MWh9VGd2JwifXWatter5gVNCFGQvFvQYl1wPUfmq6BA=;
 b=tLSXPHEaN6iFY3hWIGE+5/IxrNyG+Ad1s8MWuOg7DXBvdNmPIcku6sj6W2ICjgSasH
 TbnZCxx9+eySUvGru8pOSw2pEIY1OV+TVLTvfSZZBzIlMQKEa/YaFG4eOYt+D9fvG8cD
 XGts3DFDVZtJ2QVNeJfoq2g2L3QgYtO04KPqSloqr94voNMcY9kXl6ouDgRDAy8KliVv
 X9Af/5K1zddYZ+TQgs/Q74l63kJ3+FstgPSILzzMovHBhEb4LS5w/qQ70VeDzaUMDBkD
 ECgnflUiRSvi59VWDTUVSm9hHTp8fS3FBIhAPzPWzmqyaILAb1+vklxq1DCr0OKDbSam
 5K1w==
X-Gm-Message-State: APjAAAUUKHQVdUDFyNKJDumj3aq4PR2gyYx2qbat3vhDaKNoJ7afwt+s
 xNRYhArrhBVcqEMw6nqKcTk=
X-Google-Smtp-Source: APXvYqzovu25Xh93eS5i9WI728LZP4TFmEiOkc764Y7T62dKsCFZMLaetBHEt9+L/8KfHBSTKqd9ZA==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr29586503wrv.40.1563956718056; 
 Wed, 24 Jul 2019 01:25:18 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 5/7] backlight: gpio: remove dev from struct gpio_backlight
Date: Wed, 24 Jul 2019 10:25:06 +0200
Message-Id: <20190724082508.27617-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MWh9VGd2JwifXWatter5gVNCFGQvFvQYl1wPUfmq6BA=;
 b=Ru8/V2KuUXMTU8q4g8iglT+1D551XJ1jRu1e/mkMhxZ41/k+vNUX9+CBHpMMATMLcL
 qA7G90MOkXL0es1XDru84jIee/hoFp5YxCFwfo0CgWKkTkJSlHOqCEr1iMF31PkLvpAm
 vxWfi3/v9hnpL85NJbcn84NuLHK8ZwfNr8R1aicwnOSGGBohMr4+VtbWERpElGqBQvj4
 J7dN+52l7aCDWASYucxYNDxixUcCvgVIwkPoWyDWNVcMPfl8K9m6vSmglYR+bwChB6TE
 SabhVALFMspdy8q97T4skJ5NHKGlkr5mA0aqOWlMKI4cH00E1sSr0uZYF75qmVgmJd/s
 Tr9A==
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
aXMgZmllbGQgaXMgdW51c2VkLiBSZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogQW5keSBT
aGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMKaW5kZXggMDEyNjIxODZmYTFlLi43MDg4MjU1NmYwNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtMTksOSArMTksNyBAQAogI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4KIAogc3RydWN0IGdwaW9fYmFja2xpZ2h0IHsKLQlzdHJ1Y3QgZGV2aWNlICpkZXY7
CiAJc3RydWN0IGRldmljZSAqZmJkZXY7Ci0KIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZDsKIAlp
bnQgZGVmX3ZhbHVlOwogfTsKQEAgLTY5LDggKzY3LDYgQEAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChnYmwgPT0gTlVM
TCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlnYmwtPmRldiA9ICZwZGV2LT5kZXY7Ci0KIAlpZiAo
cGRhdGEpCiAJCWdibC0+ZmJkZXYgPSBwZGF0YS0+ZmJkZXY7CiAKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
