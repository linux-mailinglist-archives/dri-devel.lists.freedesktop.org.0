Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD3A5D04
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A710189A0F;
	Mon,  2 Sep 2019 20:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41F58911A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:34:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so13850420wrd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kgBvf4zqwAQJv/GXaUjvZU5ag1nyWnXo4YV3WG7Ae5o=;
 b=USNhabdT5weJcYRIY7oJolNH7/LIFxYZ5D00OR/+HDyys0e/szLtzdSb5ew1MwFp//
 MiItXeUTidpYB1PGRVTS0d8g5mwGGB/f2csAs464u2PUO3lmoaHm+3lb5Gycwa1SjB0A
 qv5h9i0K5Jx0I/P/zHpwTlm93tvCct+O36HkIy8Wm5zXiH0xMKpZKjEaYE1v4dRzhZbD
 j8ynzHkIRqJeLIaXLLfaoPUixR83klHDtd+/NSE0n9WWqnnTTlrnC2IULumlXaZujVwO
 EhKuRHzEdsWUAU3wK3Fh5VR1319P9gb0h/2OmVwSbVSmLnPaJe2lgwjXjotzPxmHZ95B
 +kYg==
X-Gm-Message-State: APjAAAUZPGuiHRDEuENAYtWgfe1/A9ha7H7ZIdEopoIy0qSZLPL1aVh7
 g1KpcCTnjiPGkREzlOC8PplDTg==
X-Google-Smtp-Source: APXvYqxTkcUgrlnixPmCpMUNG4mBIrhYfybJ1WjXE4s7spBPEtnz5QL08Sn51rgvc6+rNUL371Bx6w==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr32496736wrn.62.1567427698362; 
 Mon, 02 Sep 2019 05:34:58 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:34:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 5/7] backlight: gpio: remove dev from struct
 gpio_backlight
Date: Mon,  2 Sep 2019 14:34:42 +0200
Message-Id: <20190902123444.19924-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kgBvf4zqwAQJv/GXaUjvZU5ag1nyWnXo4YV3WG7Ae5o=;
 b=C6XzL5/waF9VCI8FKaC3DLJDZnEZWUCzbxeOgeeuNAvrmhTI3rHWakI5JfRxD1Cl3D
 JWafVk5sffNt/4RsCDXmKm724kCINFyKh57SDumOBlip733qO2wJrJYiREH0jg4o/gJM
 r28wVehv8yZFrfSpmUgHfNKd4llcfdb0GqTRxAEhj4kGlNCsKQfMjiDUTC1NtmC3RI2x
 lCzki+zzTTjTRH1KiGH5neRH0P+zQ3Xl7G9DfpVpBhrLjgZ/ns8Rs9cduq/Wem+2Bs3R
 EVEYNsM5VS1hmUaHZhnKV0trc0ESqu1KbxLtg/QQapY2oQ2OtqRhQddTU4kLvTc2IbtC
 TX/g==
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
aGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dw
aW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5j
CmluZGV4IDAxMjYyMTg2ZmExZS4uNzA4ODI1NTZmMDQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2dwaW9fYmFja2xpZ2h0LmMKQEAgLTE5LDkgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+CiAKIHN0cnVjdCBncGlvX2JhY2tsaWdodCB7Ci0Jc3RydWN0IGRldmljZSAqZGV2Owog
CXN0cnVjdCBkZXZpY2UgKmZiZGV2OwotCiAJc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb2Q7CiAJaW50
IGRlZl92YWx1ZTsKIH07CkBAIC02OSw4ICs2Nyw2IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGln
aHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoZ2JsID09IE5VTEwp
CiAJCXJldHVybiAtRU5PTUVNOwogCi0JZ2JsLT5kZXYgPSAmcGRldi0+ZGV2OwotCiAJaWYgKHBk
YXRhKQogCQlnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2OwogCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
