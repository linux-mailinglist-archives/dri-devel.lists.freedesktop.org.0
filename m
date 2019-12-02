Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A6F10F050
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454106E2DE;
	Mon,  2 Dec 2019 19:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803696E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m6so869243ljc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YHyg1Dv+yW1P3woHHern0IWhA1ZSh1oVCkpM4/quUn4=;
 b=N47pRbEz23abyB74k+9ULUAJ+zGsjgAzjFMBmTZbNSGCdnY1uNXCuv1kWrcUvQcVaP
 PfYoNfqDhDch0ky3pKKTVUWiirHHJ4vGeHmOQmA7/fVHVYNDNEn+vntupG5L4Iw4COWz
 mELrKkAuNqosAf3Tdq9eToJA4Hj4HpalpK/8IZCqM41mS0VVy/qrgOv8WpAFMnaN3lTR
 GU+IvB9NYSbUoPxaCkTQoNPxdXqZVYq2XJQlX6uybFofFm3e67WUstkp05UV1YgExkwx
 kxUYk+ATynq6fCrXNLOAh1UTMll4XHZj2q7ESDyFMN5uPW2OV+uyME375OH+NFObite2
 0Peg==
X-Gm-Message-State: APjAAAVHbJbjnqmJFQppbtYWZ2Yyuz1w4OFMzCu+6ov4MHboJysCwIN0
 dwNa7fje50M7PeXMdwyWWNJBoxijuBZlnw==
X-Google-Smtp-Source: APXvYqz3r+laN9FnmWTYFLLBUS6ZnkiUvsIMFFNjcED2AJXxTlqVCVCVhK5M16rTTToSSV/kHLG6ng==
X-Received: by 2002:a2e:b007:: with SMTP id y7mr253216ljk.215.1575315216701;
 Mon, 02 Dec 2019 11:33:36 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:36 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 17/26] drm/panel: raydium-rm68200: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:21 +0100
Message-Id: <20191202193230.21310-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHyg1Dv+yW1P3woHHern0IWhA1ZSh1oVCkpM4/quUn4=;
 b=UXVhIwS9hxqLyUKpFsi/9B+m1W8tz6O8LM+RB3HfE3wlqNoBarTzpBZk+cRfYXcKbn
 lA8UgPBM4FenshUYYPFPqreNDBD0AdQLGp+x3aW+O9T9/S+2zSZDnb0GB1Y0loieXdeD
 x4GtLZtb2OTb7W9PgYDmkjvrt2X/t6hZEa2L5ksHtQTbwiEOw1Lk1rgsxYN+OLJdJypE
 SyLoO7QNk3W0D2lNr5wmo+W5RLt+tCMvGf1qO/QjC6NNh8geO0+GKYkbHCQLQ5BOzjqz
 s/tm2pU99xfXKIdoDFCpO4LL9AXdqOSsLBqTrS/FhG5fmQTOIcEBokwV07Xlex9BHEN3
 Urnw==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5
ZGl1bS1ybTY4MjAwLmMgfCAxNSArKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjgyMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1yYXlkaXVtLXJtNjgyMDAuYwppbmRleCBkNmEwMzMyOGU1OTQuLmU4OTgyOTQ4ZTBlYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJheWRpdW0tcm02ODIwMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjgyMDAuYwpAQCAt
Niw5ICs2LDkgQEAKICAqICAgICAgICAgIFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBz
dC5jb20+CiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgorI2luY2x1ZGUg
PGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogCkBAIC03OCw3ICs3OCw2IEBAIHN0
cnVjdCBybTY4MjAwIHsKIAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwogCXN0cnVjdCBncGlvX2Rl
c2MgKnJlc2V0X2dwaW87CiAJc3RydWN0IHJlZ3VsYXRvciAqc3VwcGx5OwotCXN0cnVjdCBiYWNr
bGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJYm9vbCBwcmVwYXJlZDsKIAlib29sIGVuYWJsZWQ7
CiB9OwpAQCAtMjQyLDggKzI0MSw2IEBAIHN0YXRpYyBpbnQgcm02ODIwMF9kaXNhYmxlKHN0cnVj
dCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmICghY3R4LT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAot
CWJhY2tsaWdodF9kaXNhYmxlKGN0eC0+YmFja2xpZ2h0KTsKLQogCWN0eC0+ZW5hYmxlZCA9IGZh
bHNlOwogCiAJcmV0dXJuIDA7CkBAIC0zMjgsOCArMzI1LDYgQEAgc3RhdGljIGludCBybTY4MjAw
X2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAoY3R4LT5lbmFibGVkKQogCQly
ZXR1cm4gMDsKIAotCWJhY2tsaWdodF9lbmFibGUoY3R4LT5iYWNrbGlnaHQpOwotCiAJY3R4LT5l
bmFibGVkID0gdHJ1ZTsKIAogCXJldHVybiAwOwpAQCAtMzkyLDEwICszODcsNiBAQCBzdGF0aWMg
aW50IHJtNjgyMDBfcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCQlyZXR1cm4g
cmV0OwogCX0KIAotCWN0eC0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChkZXYp
OwotCWlmIChJU19FUlIoY3R4LT5iYWNrbGlnaHQpKQotCQlyZXR1cm4gUFRSX0VSUihjdHgtPmJh
Y2tsaWdodCk7Ci0KIAltaXBpX2RzaV9zZXRfZHJ2ZGF0YShkc2ksIGN0eCk7CiAKIAljdHgtPmRl
diA9IGRldjsKQEAgLTQwOCw2ICszOTksMTAgQEAgc3RhdGljIGludCBybTY4MjAwX3Byb2JlKHN0
cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKIAlkcm1fcGFuZWxfaW5pdCgmY3R4LT5wYW5lbCwg
ZGV2LCAmcm02ODIwMF9kcm1fZnVuY3MsCiAJCSAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJ
KTsKIAorCXJldCA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQoJmN0eC0+cGFuZWwpOworCWlmIChy
ZXQpCisJCXJldHVybiByZXQ7CisKIAlkcm1fcGFuZWxfYWRkKCZjdHgtPnBhbmVsKTsKIAogCXJl
dCA9IG1pcGlfZHNpX2F0dGFjaChkc2kpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
