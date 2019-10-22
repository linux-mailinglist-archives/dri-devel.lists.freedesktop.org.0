Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B41E13B8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E1F6E99D;
	Wed, 23 Oct 2019 08:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B076E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 14so8611473wmu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BBwZAII4c+j90JuEwELJfoaTgwb4BYo/J/e6zDQv4+M=;
 b=cA8YZSju20wP4VQETngkmwClEOu+FFEs+YyoExJrJPFVLKyqam5o301muITsXFDtTA
 xsDb+BxXt2QGjMEEcKX8TyeNnbuM5g0jWT6pbYxzeFwEbR03MTkv0mQFwmDIf+Iuxi3W
 jew9qor/89fbRyi9nLcqhSJBwDxiaSNyMFRxox4MF7w6bcJEm7PsQ1aBeVy5N6hc5vy1
 KKNQw+GZoYtSHoWyAYnGvWk1ojo+dq0NbgRh5+ggU8oznlhi108WxaBPfSxTNLH4mbXU
 pFPVgVmXDFfkEqoEfjgwnthZ+6dFAxv4oSdAv0MHM8gMjZB/SdP3cID9YpCgQrij7+e6
 NO8g==
X-Gm-Message-State: APjAAAVqWU2gzlxknZCHdK/eHEV6cEpxEDqbjk2Ux03xNMBL7yjV2Qd0
 6o+iBNOwxqbjr0Mxq6xd8lE26Q==
X-Google-Smtp-Source: APXvYqxzDA6PjDB8+VXbMfmE9gebpUr/TSL5Jz2YOoPBEyJhJx7o6yy2RVS6GyJDputcJKjnWi9muA==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr1724605wmj.123.1571733405470; 
 Tue, 22 Oct 2019 01:36:45 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 8/9] backlight: gpio: use a helper variable for &pdev->dev
Date: Tue, 22 Oct 2019 10:36:29 +0200
Message-Id: <20191022083630.28175-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BBwZAII4c+j90JuEwELJfoaTgwb4BYo/J/e6zDQv4+M=;
 b=hD0eu+rm2rnCFP73+AbIhyRwxjhgqFh+hxza/N1Idk4VUi0QtJM+GfN7gVPGjp4Z4j
 YUkIjUCh6x9nODKYqHv9hvjSprCJ99Tc1ygodmf5Oy3gnM2wClvINYUqlylplYGSvlZd
 eMXOa5fLbLu7NDm6e4U2VJQbpFkgloMODo+Fmpun0J973i9Vd55dDrlWsbC8zAV7prPc
 aHukaKYQxUSENUEHMncEtx7x/4n3KGxNxRnwfTzL//vvn5oKk99CynyMKx5Mu2+oXmgF
 GQYRa839XdpCQpq+MGMfkGfbdHXXJvz9W7M6sf+AGI+dYNjDZsbgsvRFuahEdRX4M6hQ
 tjqg==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCklu
c3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlh
YmxlIGZvcgp0aGUgYXNzb2NpYXRlZCBkZXZpY2UgcG9pbnRlci4KClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDIzICsrKysrKysrKysr
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGln
aHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5kZXggZGRj
N2QzYjI4OGI3Li5kNjk2OWZhZTI1Y2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYwpAQCAtNzgsMjkgKzc4LDI5IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRf
aW5pdGlhbF9wb3dlcl9zdGF0ZShzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKIAogc3RhdGlj
IGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewotCXN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9Ci0JCWRldl9n
ZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7CisJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsKKwlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0
X3BsYXRkYXRhKGRldik7CiAJc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIHByb3BzOwogCXN0
cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibDsKIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibDsK
IAlpbnQgcmV0LCBpbml0X2JyaWdodG5lc3M7CiAKLQlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYt
PmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKKwlnYmwgPSBkZXZtX2t6YWxsb2MoZGV2
LCBzaXplb2YoKmdibCksIEdGUF9LRVJORUwpOwogCWlmIChnYmwgPT0gTlVMTCkKIAkJcmV0dXJu
IC1FTk9NRU07CiAKLQlnYmwtPmRldiA9ICZwZGV2LT5kZXY7CisJZ2JsLT5kZXYgPSBkZXY7CiAK
IAlpZiAocGRhdGEpCiAJCWdibC0+ZmJkZXYgPSBwZGF0YS0+ZmJkZXY7CiAKLQlnYmwtPmRlZl92
YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24i
KTsKKwlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVm
YXVsdC1vbiIpOwogCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5V
TEwsIEdQSU9EX0FTSVMpOworCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEws
IEdQSU9EX0FTSVMpOwogCWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKIAkJcmV0ID0gUFRSX0VS
UihnYmwtPmdwaW9kKTsKIAkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQotCQkJZGV2X2Vycigm
cGRldi0+ZGV2LAorCQkJZGV2X2VycihkZXYsCiAJCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1l
dGVyIGlzIG1pc3Npbmcgb3IgaW52YWxpZC5cbiIpOwogCQlyZXR1cm4gcmV0OwogCX0KQEAgLTEw
OCwxMSArMTA4LDEwIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsK
IAlwcm9wcy50eXBlID0gQkFDS0xJR0hUX1JBVzsKIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IDE7
Ci0JYmwgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgZGV2X25h
bWUoJnBkZXYtPmRldiksCi0JCQkJCSZwZGV2LT5kZXYsIGdibCwgJmdwaW9fYmFja2xpZ2h0X29w
cywKLQkJCQkJJnByb3BzKTsKKwlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3Rlcihk
ZXYsIGRldl9uYW1lKGRldiksIGRldiwgZ2JsLAorCQkJCQkgICAgJmdwaW9fYmFja2xpZ2h0X29w
cywgJnByb3BzKTsKIAlpZiAoSVNfRVJSKGJsKSkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJm
YWlsZWQgdG8gcmVnaXN0ZXIgYmFja2xpZ2h0XG4iKTsKKwkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gcmVnaXN0ZXIgYmFja2xpZ2h0XG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwogCX0KIApA
QCAtMTIyLDcgKzEyMSw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpbml0X2JyaWdodG5lc3MgPSBncGlvX2JhY2tsaWdo
dF9nZXRfbmV4dF9icmlnaHRuZXNzKGJsKTsKIAlyZXQgPSBncGlvZF9kaXJlY3Rpb25fb3V0cHV0
KGdibC0+Z3Bpb2QsIGluaXRfYnJpZ2h0bmVzcyk7CiAJaWYgKHJldCkgewotCQlkZXZfZXJyKCZw
ZGV2LT5kZXYsICJmYWlsZWQgdG8gc2V0IGluaXRpYWwgYnJpZ2h0bmVzc1xuIik7CisJCWRldl9l
cnIoZGV2LCAiZmFpbGVkIHRvIHNldCBpbml0aWFsIGJyaWdodG5lc3NcbiIpOwogCQlyZXR1cm4g
cmV0OwogCX0KIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
