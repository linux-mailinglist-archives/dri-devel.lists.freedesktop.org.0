Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B18D44C76
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 21:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6469E892E6;
	Thu, 13 Jun 2019 19:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C97892C2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:43:36 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id go2so8555643plb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AB616NjBSa9Vj9zUvVGBmMFoqPgqn8QM9MSbUPc9ICQ=;
 b=D0ORzor0Z/0zecjlR/hHPwKsinewyhgU+FKOsi5URp/LZUzdu5RWkUt2FVkHedpDJI
 vXWTxPo7lRUse/kDWgISafNjEWGvDsUeSpQWXUO8Y73NJBraaS/+55tzQEgsOF7boa7U
 2f1U2OreCafAWglYY+eT2Q+Qh7ku9nhrXpLtOkwOSple1AfTRPDG9UyZLactIAXU7jp2
 cripSJeroQA+kGsEgFXSTb0eJBi6GLUuHQl/xDuoVSNY0X5htlXAE9rQPU5Zk0+u+sH8
 c2F1ovcAdfl+XQa+ucY73p1RZDyYn/YfB8SXSdvVW6NJTN3nHMeUZtK8NI3RSScllyfL
 xbzA==
X-Gm-Message-State: APjAAAVkxUm+2e5s0SsbclJQSE9RsaPg1Ae3bqlJjP+gxjiKwKS99wDf
 hafFz392esK6kNdIcauE4oCrzA==
X-Google-Smtp-Source: APXvYqzSKXohZs3Y1MuNYqnEVn0RY46WZktUdfaBzLXLJbhxNFxqybOloZxPtO9z7gXgrhS6QV+9tg==
X-Received: by 2002:a17:902:d695:: with SMTP id
 v21mr72975853ply.342.1560455016086; 
 Thu, 13 Jun 2019 12:43:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id b17sm525029pfb.18.2019.06.13.12.43.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 12:43:35 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
Date: Thu, 13 Jun 2019 12:43:25 -0700
Message-Id: <20190613194326.180889-4-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190613194326.180889-1-mka@chromium.org>
References: <20190613194326.180889-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AB616NjBSa9Vj9zUvVGBmMFoqPgqn8QM9MSbUPc9ICQ=;
 b=Yxrvkmixlfb/dkkn3muC+q7KBymUNvGxf3uq8JFtc1veDsLcXzlkkbky+1KOMyJJy5
 AUXgm4wSct7l+DLpaom1h3YgZ53bhvH7VMit/r23M13Zf7UJXpiZNBMpf5qKt8L5WZzR
 JCW00YgMSqhmw+cLWJ4x1BT1ucklGqtUb1zYA=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGJhY2tsaWdodCBjdXJ2ZXMgY2FsY3VsYXRlZCB3aXRoIHRoZSBDSUUgMTkzMSBhbGdvcml0
aG0gc2V0CnRoZSBicmlnaHRuZXNzIHNjYWxlIHR5cGUgcHJvcGVydHkgYWNjb3JkaW5nbHkuIFRo
aXMgbWFrZXMgdGhlCnNjYWxlIHR5cGUgYXZhaWxhYmxlIHRvIHVzZXJzcGFjZSB2aWEgdGhlICdz
Y2FsZScgc3lzZnMgYXR0cmlidXRlLgoKU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2Ug
PG1rYUBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMg
fCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwppbmRleCBmYjQ1Zjg2NmI5MjMuLmYwNjdmZTdhYTM1
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKKysrIGIvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKQEAgLTU1Myw2ICs1NTMsOCBAQCBzdGF0aWMg
aW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJ
Z290byBlcnJfYWxsb2M7CiAJfQogCisJbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHN0cnVjdCBi
YWNrbGlnaHRfcHJvcGVydGllcykpOworCiAJaWYgKGRhdGEtPmxldmVscykgewogCQkvKgogCQkg
KiBGb3IgdGhlIERUIGNhc2UsIG9ubHkgd2hlbiBicmlnaHRuZXNzIGxldmVscyBpcyBkZWZpbmVk
CkBAIC01OTEsNiArNTkzLDggQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAkJCXBiLT5sZXZlbHMgPSBkYXRhLT5sZXZlbHM7
CiAJCX0KKworCQlwcm9wcy5zY2FsZSA9IEJBQ0tMSUdIVF9TQ0FMRV9DSUUxOTMxOwogCX0gZWxz
ZSB7CiAJCS8qCiAJCSAqIFRoYXQgb25seSBoYXBwZW5zIGZvciB0aGUgbm9uLURUIGNhc2UsIHdo
ZXJlIHBsYXRmb3JtIGRhdGEKQEAgLTYwMSw3ICs2MDUsNiBAQCBzdGF0aWMgaW50IHB3bV9iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXBiLT5sdGhfYnJp
Z2h0bmVzcyA9IGRhdGEtPmx0aF9icmlnaHRuZXNzICogKHN0YXRlLnBlcmlvZCAvIHBiLT5zY2Fs
ZSk7CiAKLQltZW1zZXQoJnByb3BzLCAwLCBzaXplb2Yoc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0
aWVzKSk7CiAJcHJvcHMudHlwZSA9IEJBQ0tMSUdIVF9SQVc7CiAJcHJvcHMubWF4X2JyaWdodG5l
c3MgPSBkYXRhLT5tYXhfYnJpZ2h0bmVzczsKIAlibCA9IGJhY2tsaWdodF9kZXZpY2VfcmVnaXN0
ZXIoZGV2X25hbWUoJnBkZXYtPmRldiksICZwZGV2LT5kZXYsIHBiLAotLSAKMi4yMi4wLnJjMi4z
ODMuZ2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
