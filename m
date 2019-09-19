Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC4B8BFB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08E46F730;
	Fri, 20 Sep 2019 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D801B6F860
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:06:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y23so3741534ljn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 07:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBTcMpOyl2bLXBXPvlZrHA8WBZZACi7gNqiyseLnytg=;
 b=tEWo6Qx7zZ7kkaruD+ymilqF3r1k+Qj6EWfAJYOBAmyNG8bNUTTSXq1rKRbUTncoGv
 vXsEqhMJ1yWCsJrA/WTYaXk0EsX1bzDQEEfwEi/4dI54nVH6pU20ppxjG75dxXTscbHW
 nKT/gzpymVVShSZsKJgf2gPAIAgSKVQSAOttCe4q62uEGndSC6f5xox/n2rsO3EOnAiM
 cu/P+uLT6G2mLae3CggYQDixaRfWfLkjnsLRnDgYjTmFO2Ev5RWgrKvW+c/5G7CYvoug
 KKluvMTD87U6xrXy/sBY4ghJSlPESkna4bTFZVLD4Bu60kOEkeZfNB9QXHdj3efMUFn5
 docQ==
X-Gm-Message-State: APjAAAW+Kpxj0n3EFq6A/zhSW+RkymhT1OlJhftnH/n53aLHADRuwDhu
 Zt3mrEBmzsK3A3oxp3OHBIZvfw==
X-Google-Smtp-Source: APXvYqz80XnBinuoIhjkWosIvpazzODW2CaBBl25zB2SkJzfe+uW+0Y8qIL/RSBMCTZSD3oY/92ueA==
X-Received: by 2002:a2e:6e18:: with SMTP id j24mr5534397ljc.158.1568901990286; 
 Thu, 19 Sep 2019 07:06:30 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 07:06:29 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/5] backlight: pwm_bl: eliminate a 64/32 division
Date: Thu, 19 Sep 2019 16:06:17 +0200
Message-Id: <20190919140620.32407-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBTcMpOyl2bLXBXPvlZrHA8WBZZACi7gNqiyseLnytg=;
 b=A48WL858gPJVbFagBB2BTpTgHdTGMt1R9BC01trDu5z3ENfmhWS7RiqjnfWx20RoUY
 E0iQrrx0deYrkinYfpODZNFzuVCQBajUDYXy09Qkmb+GV1iPmOdfGkZktLbOEyqsuOiz
 8Rwokwielo8W6w7zis9sx6uJ5V5kHfsVwrS8I=
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bGlnaHRuZXNzKjEwMDAgaXMgbm93aGVyZSBuZWFyIG92ZXJmbG93aW5nIDMyIGJpdHMsIHNvIHdl
IGNhbiBqdXN0IHVzZQphbiBvcmRpbmFyeSAzMi8zMiBkaXZpc2lvbiwgd2hpY2ggaXMgbXVjaCBj
aGVhcGVyIHRoYW4gdGhlIDY0LzMyIGRvbmUKdmlhIGRvX2RpdigpLgoKU2lnbmVkLW9mZi1ieTog
UmFzbXVzIFZpbGxlbW9lcyA8bGludXhAcmFzbXVzdmlsbGVtb2VzLmRrPgotLS0KIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwppbmRleCBiZTM2
YmUxY2FjYjcuLjkyNTJkNTFmMzFiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcHdtX2JsLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKQEAgLTE3
Nyw3ICsxNzcsNyBAQCBzdGF0aWMgdTY0IGNpZTE5MzEodW5zaWduZWQgaW50IGxpZ2h0bmVzcywg
dW5zaWduZWQgaW50IHNjYWxlKQogCSAqLwogCWxpZ2h0bmVzcyAqPSAxMDA7CiAJaWYgKGxpZ2h0
bmVzcyA8PSAoOCAqIHNjYWxlKSkgewotCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwo
bGlnaHRuZXNzICogMTAsIDkwMzMpOworCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVChsaWdo
dG5lc3MgKiAxMCwgOTAzMyk7CiAJfSBlbHNlIHsKIAkJcmV0dmFsID0gaW50X3BvdygobGlnaHRu
ZXNzICsgKDE2ICogc2NhbGUpKSAvIDExNiwgMyk7CiAJCXJldHZhbCA9IERJVl9ST1VORF9DTE9T
RVNUX1VMTChyZXR2YWwsIChzY2FsZSAqIHNjYWxlKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
