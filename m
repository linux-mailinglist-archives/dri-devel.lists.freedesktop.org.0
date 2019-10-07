Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FFCDC25
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112316E4B5;
	Mon,  7 Oct 2019 07:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014346E452
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:32:12 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i14so7299152pgt.11
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 20:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4a+pKVTYSrGaRJIHf88S7PAjoi+WG4Wfk9hIUcxXSg=;
 b=ibRMAO4hB2t+R4XYFkZ1LqR7afk5pVbV+nr/g204VVpEgoUAFVeBK8S/02Djjopqe0
 5t64FiOMipZDp4/GuAVEZbbmERX3rSTP6yM4F+nyakHuaeElXxGoqJHaYrBZswtUW0NM
 9gxGAcQitpknhAznW3oOBX4wpwej8CjK/0UDkTLarw+Qnlnj2TbzQoTYpU5nbthALse3
 f6IzFGPtZvh6qIrHt12PyIPGo6szn6MIx+hA0rcW/HLoP/cifISUYSUJMZF6++iKVpE3
 ueRIaEorubaeFgWBDvLtt1EXvdBNwHD4dFmf4TvA6DukW5yx/hZC9AwD07CAZ8qMocxQ
 easg==
X-Gm-Message-State: APjAAAVGoBmz3okPe+DqrF8uGtz9xVsH9aOWQBARmCdeE+F9UT4r/riU
 7LaVrf17o4jHFHv/i42mfZiMEQ==
X-Google-Smtp-Source: APXvYqxJi6Cn38KU2ldDEqD3uN4eN8sBJwkVwzMxJCScyN7v5yPIeq7dl+xAxIUxlchljuW1E7ZgqA==
X-Received: by 2002:a63:705b:: with SMTP id a27mr27756444pgn.136.1570419132502; 
 Sun, 06 Oct 2019 20:32:12 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net.
 [96.95.220.76])
 by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 20:32:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v5 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Date: Mon,  7 Oct 2019 05:32:00 +0200
Message-Id: <20191007033200.13443-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4a+pKVTYSrGaRJIHf88S7PAjoi+WG4Wfk9hIUcxXSg=;
 b=VEhWSNZoLO5WHHbpp9caxeGXuImosevibbsBdB/CmdKiB1x1QaJiw3PM+vtD47onTj
 YnRJWOaxfiYOZMGKnNbIAnpk+Lkq3FitSuXfKNWTeVjsYnLhroWVQs+X9ZiUO38IcwTd
 rYYrkk7IaNSq5w6fCEOUfRmZ9UZ8BXM1z/VvKLUdDa5+ITtgJ6i795wC/Ax32hcUvskA
 5XpcsN84YILPA2nLpfRifCQHKvAQu0rAFy8Ro1p1OrvG8Ax57GMGJEO+PYc96po6eCAp
 6cQLwl1Rsh7FmaNNg7cNvfCg8BiyO0ggdLaZlKDi4Ouwzk9EVF/CUd28ES5S5X3zjTX3
 ccJw==
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
ZSBwcm9iZSBmdW5jdGlvbiBpbiB0aGUgZ3Bpby1iYWNrbGlnaHQgZHJpdmVyIGlzIHF1aXRlIHNo
b3J0LiBJZiB3ZQpwdWxsIGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUoKSBpbnRv
IHByb2JlIHdlIGNhbiBkcm9wIHR3bwptb3JlIGZpZWxkcyBmcm9tIHN0cnVjdCBncGlvX2JhY2ts
aWdodCBhbmQgc2hyaW5rIHRoZSBkcml2ZXIgY29kZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDM3ICsrKysrKysrKy0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4IDYyNDc2ODdiNjMzMC4u
NDA3ZDRlYWFmYzVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2Jh
Y2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMK
QEAgLTE3LDExICsxNyw4IEBACiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogCiBzdHJ1Y3QgZ3Bp
b19iYWNrbGlnaHQgewotCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgZGV2aWNlICpmYmRl
djsKLQogCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwotCWludCBkZWZfdmFsdWU7CiB9OwogCiBz
dGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJsKQpAQCAtNTMsNDEgKzUwLDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xp
Z2h0X29wcyBncGlvX2JhY2tsaWdodF9vcHMgPSB7CiAJLmNoZWNrX2ZiCT0gZ3Bpb19iYWNrbGln
aHRfY2hlY2tfZmIsCiB9OwogCi1zdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93
ZXJfc3RhdGUoc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmwpCi17Ci0Jc3RydWN0IGRldmljZV9u
b2RlICpub2RlID0gZ2JsLT5kZXYtPm9mX25vZGU7Ci0KLQkvKiBOb3QgYm9vdGVkIHdpdGggZGV2
aWNlIHRyZWUgb3Igbm8gcGhhbmRsZSBsaW5rIHRvIHRoZSBub2RlICovCi0JaWYgKCFub2RlIHx8
ICFub2RlLT5waGFuZGxlKQotCQlyZXR1cm4gZ2JsLT5kZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJM
QU5LIDogRkJfQkxBTktfUE9XRVJET1dOOwotCi0JLyogaWYgdGhlIGVuYWJsZSBHUElPIGlzIGRp
c2FibGVkLCBkbyBub3QgZW5hYmxlIHRoZSBiYWNrbGlnaHQgKi8KLQlpZiAoZ3Bpb2RfZ2V0X3Zh
bHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2QpID09IDApCi0JCXJldHVybiBGQl9CTEFOS19QT1dFUkRP
V047Ci0KLQlyZXR1cm4gRkJfQkxBTktfVU5CTEFOSzsKLX0KLQotCiBzdGF0aWMgaW50IGdwaW9f
YmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7CisJc3RydWN0IGRldmljZV9u
b2RlICpvZl9ub2RlID0gZGV2LT5vZl9ub2RlOwogCXN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGll
cyBwcm9wczsKIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7CiAJc3RydWN0IGdwaW9fYmFj
a2xpZ2h0ICpnYmw7Ci0JaW50IHJldDsKKwlpbnQgcmV0LCBkZWZfdmFsdWU7CiAKIAlnYmwgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmdibCksIEdGUF9LRVJORUwpOwogCWlmIChnYmwgPT0g
TlVMTCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlnYmwtPmRldiA9IGRldjsKLQogCWlmIChwZGF0
YSkKIAkJZ2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsKIAotCWdibC0+ZGVmX3ZhbHVlID0gZGV2
aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7CisJZGVmX3ZhbHVlID0g
ZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7CiAKIAlnYmwtPmdw
aW9kID0gZGV2bV9ncGlvZF9nZXQoZGV2LCBOVUxMLCBHUElPRF9BU0lTKTsKIAlpZiAoSVNfRVJS
KGdibC0+Z3Bpb2QpKSB7CkBAIC0xMDksNyArODksMTYgQEAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VS
UihibCk7CiAJfQogCi0JYmwtPnByb3BzLnBvd2VyID0gZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9w
b3dlcl9zdGF0ZShnYmwpOworCS8qIFNldCB0aGUgaW5pdGlhbCBwb3dlciBzdGF0ZSAqLworCWlm
ICghb2Zfbm9kZSB8fCAhb2Zfbm9kZS0+cGhhbmRsZSkKKwkJLyogTm90IGJvb3RlZCB3aXRoIGRl
dmljZSB0cmVlIG9yIG5vIHBoYW5kbGUgbGluayB0byB0aGUgbm9kZSAqLworCQlibC0+cHJvcHMu
cG93ZXIgPSBkZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJMQU5LCisJCQkJCSAgICA6IEZCX0JMQU5L
X1BPV0VSRE9XTjsKKwllbHNlIGlmIChncGlvZF9nZXRfdmFsdWVfY2Fuc2xlZXAoZ2JsLT5ncGlv
ZCkgPT0gMCkKKwkJYmwtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfUE9XRVJET1dOOworCWVsc2UK
KwkJYmwtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfVU5CTEFOSzsKKwogCWJsLT5wcm9wcy5icmln
aHRuZXNzID0gMTsKIAogCWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKGJsKTsKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
