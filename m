Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49F115CB7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA2A6E1A5;
	Sat,  7 Dec 2019 14:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6AA6E1A5
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c19so10648205lji.11
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FyzdtrGlFpa66vBX6d0CokXkZKTeTI49fgevppwlQZg=;
 b=ZSlkCkl/JLhOKWtkpukswYXLiPpacp+AVE4JOo6yS+WiEx5fa0ar7mY9RRF0DDX0Ii
 nBI+80gz0w9HfcxeY4F3y8UHWjmXvUSepjDZbm33ZpmZBaNvhfKwhyRp5P+fNml7wCHl
 QuHNN0ehMroHuahS44Idbxu0HTaOVVzNI4x+IROhZMPrSiXMz4zu6k37131VpdaKeaYn
 ctSnE4O+ZRqGhkfj7jobZ6DxAL6ZjE93hSBiOfJNEDcFtfxAyczaz1esH8lU6So8iY7b
 R30EWUGoT6DVAvOBBN+hSloFAw8ZnCYxJhWdR6MrGPIAq7q2nTeBqQ2syUZ/wY2nEhZv
 2V3A==
X-Gm-Message-State: APjAAAWI2nSznVZcK8kPrspKHSkc0YZhoi5cSOeSZiE8xatYgT46JvsT
 MkC6RqOpsuxtxWpYJqw535AmiHZiPQXMRg==
X-Google-Smtp-Source: APXvYqzmbqgsvM4MYLG+23AC8GtnbZ5+HS2M1nUpn3JGh1VQ6K7SA75id3AxcVjTkWFzhcRKBys3yw==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr11614068ljg.154.1575727482524; 
 Sat, 07 Dec 2019 06:04:42 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:42 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 18/25] drm/panel: ronbo-rb070d30: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:46 +0100
Message-Id: <20191207140353.23967-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FyzdtrGlFpa66vBX6d0CokXkZKTeTI49fgevppwlQZg=;
 b=OxXSoMt5KqlihAHzAB1tJW/fsjhsEVaVIHQaxDsigHnPvpF+WpEYROGZBvnoIyXDMc
 iTKm69RRPHv7BTKCbm9ObKOcHrT32z/UPlc/Glf9bUIo528EwwWmQZx7GAt+6Jsb10Om
 fcHNr+GJBKvKi5S1pnU9KrJ02ERnGk7w1kOORaWMN1Pt+X1ZEfJpsICzjXkuyzSIz8pZ
 NpVBk28gMihwGzY1CDV9Y0LcT2EqA6Iu9DV3egrmbtWVtlPTTyxQw05se5aFkzoao3yl
 Crfxl/Rn3rB20oEjkeD7xmWORzd3XpiPpJBrpwgakGE9FpVGwYL10TAsQFhHJysyftoA
 +tMw==
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
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
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
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtcm9uYm8tcmIwNzBkMzAuYyB8IDE5ICsrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb25iby1yYjA3MGQzMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJvbmJvLXJiMDcwZDMwLmMKaW5kZXggNzQ2YTNhMjIxMTAwLi5lZjE4
NTU5ZTIzN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb25iby1y
YjA3MGQzMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb25iby1yYjA3MGQz
MC5jCkBAIC03LDcgKzcsNiBAQAogICogVGhpcyBmaWxlIGJhc2VkIG9uIHBhbmVsLWlsaXRlay1p
bGk5ODgxYy5jCiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+CkBAIC0yOSw3ICsyOCw2IEBACiBzdHJ1Y3QgcmIwNzBkMzBfcGFuZWwgewogCXN0
cnVjdCBkcm1fcGFuZWwgcGFuZWw7CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpOwotCXN0
cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJc3RydWN0IHJlZ3VsYXRvciAqc3Vw
cGx5OwogCiAJc3RydWN0IHsKQEAgLTg0LDIyICs4MiwxMyBAQCBzdGF0aWMgaW50IHJiMDcwZDMw
X3BhbmVsX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAocmV0KQogCQlyZXR1
cm4gcmV0OwogCi0JcmV0ID0gYmFja2xpZ2h0X2VuYWJsZShjdHgtPmJhY2tsaWdodCk7Ci0JaWYg
KHJldCkKLQkJZ290byBvdXQ7Ci0KIAlyZXR1cm4gMDsKLQotb3V0OgotCW1pcGlfZHNpX2Rjc19l
bnRlcl9zbGVlcF9tb2RlKGN0eC0+ZHNpKTsKLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50
IHJiMDcwZDMwX3BhbmVsX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7CiAJc3Ry
dWN0IHJiMDcwZDMwX3BhbmVsICpjdHggPSBwYW5lbF90b19yYjA3MGQzMF9wYW5lbChwYW5lbCk7
CiAKLQliYWNrbGlnaHRfZGlzYWJsZShjdHgtPmJhY2tsaWdodCk7CiAJcmV0dXJuIG1pcGlfZHNp
X2Rjc19lbnRlcl9zbGVlcF9tb2RlKGN0eC0+ZHNpKTsKIH0KIApAQCAtMjA4LDExICsxOTcsOSBA
QCBzdGF0aWMgaW50IHJiMDcwZDMwX3BhbmVsX2RzaV9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2kpCiAJCXJldHVybiBQVFJfRVJSKGN0eC0+Z3Bpb3Muc2hscik7CiAJfQogCi0JY3R4
LT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCZkc2ktPmRldik7Ci0JaWYgKElT
X0VSUihjdHgtPmJhY2tsaWdodCkpIHsKLQkJRFJNX0RFVl9FUlJPUigmZHNpLT5kZXYsICJDb3Vs
ZG4ndCBnZXQgb3VyIGJhY2tsaWdodFxuIik7Ci0JCXJldHVybiBQVFJfRVJSKGN0eC0+YmFja2xp
Z2h0KTsKLQl9CisJcmV0ID0gZHJtX3BhbmVsX29mX2JhY2tsaWdodCgmY3R4LT5wYW5lbCk7CisJ
aWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAogCXJldCA9IGRybV9wYW5lbF9hZGQoJmN0eC0+cGFu
ZWwpOwogCWlmIChyZXQgPCAwKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
