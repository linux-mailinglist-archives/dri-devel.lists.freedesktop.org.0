Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1EB10F05E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE326E2F0;
	Mon,  2 Dec 2019 19:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6932A6E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n25so822144lfl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RAsbC5cqN6MKFPQ6PG5e5K6xQzBWVJ78zoRaemBgaGg=;
 b=lL1k9ta1cUH9zIHrD47nDJmO0W276rV4bR9GV2pZXE8A4DB6s+1lwGOBBC5DdUyjnp
 Xm82dyRWhqAeVjra/oE50ADNoy6FIHatfSbWTPaajTirkdG0KuOYjR5uVmY8Ne0m3dzr
 4Euz1XgSNiVrtNW7c0htu6pnf3zU1RQowgROWkLvmTUTZXAW2BY+0u4qnDNKcFnKn81+
 LeS2l3gurcLKXgcfhqWmX78rLIY8zG1Ag2+97wTnc+Y08k0T1hzCc0LZwcHaTueW1pYZ
 0S67qMtBUPqNPRa+ibcftzOCEqCB+MSI5PgGPrJ1eCqaZOUZRsdV1rJR4VXtx2LPxeJO
 n8aw==
X-Gm-Message-State: APjAAAX4raa6ooQz1G2kZBMZT7csmH4bzskUUGsE+nmxnpVCgXRkh+Ev
 xMr72ZqvZfu8Zfhzu69Yqm7YmneJFOAwZg==
X-Google-Smtp-Source: APXvYqxgC0o7yY6+/wa5jNY1ByPzl8EwYMqBcVDLKKwFraG7QLXiwa/WDguruEd1xtBPdhlcSdCT9w==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr432258lfi.170.1575315220244;
 Mon, 02 Dec 2019 11:33:40 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:39 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 19/26] drm/panel: ronbo-rb070d30: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:23 +0100
Message-Id: <20191202193230.21310-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAsbC5cqN6MKFPQ6PG5e5K6xQzBWVJ78zoRaemBgaGg=;
 b=TXUTqMevG+NnSg2VBH8v+6DuQCnq6JRVAalnYOEupDPG7sgQ4MOBs0GxgbTost/kN2
 5W4yzzNwg+Y3BitXq2T9jpEpfJHIptbCJeIjvnco+zlT2eefFw4RBaEB+ibA+F8H7ymY
 AkNZCpxsiTQfe0XRmefXBvT82/3Wnq/R7+W+Dc195BoXoXm3NxY3jx6fhADMTjgo2ZDN
 4Onzbk+H6sTnkhdgzv7O4OOSO/csJHyyJn6Mz73f1WDRE/lYGlRqBp+jCTYqz4XJtUlD
 WhN2e+8+09qJ90X8cql4g9vMVXvF8HZXhmAp7SXQ2gvtV5c75/VwyBQyjSXFwqleuXbC
 mLag==
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
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9u
Ym8tcmIwNzBkMzAuYyB8IDE5ICsrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1yb25iby1yYjA3MGQzMC5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXJvbmJvLXJiMDcwZDMwLmMKaW5kZXggNzQ2YTNhMjIxMTAwLi5lZjE4NTU5ZTIzN2Ug
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb25iby1yYjA3MGQzMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb25iby1yYjA3MGQzMC5jCkBAIC03
LDcgKzcsNiBAQAogICogVGhpcyBmaWxlIGJhc2VkIG9uIHBhbmVsLWlsaXRlay1pbGk5ODgxYy5j
CiAgKi8KIAotI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L2Rl
bGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+
CkBAIC0yOSw3ICsyOCw2IEBACiBzdHJ1Y3QgcmIwNzBkMzBfcGFuZWwgewogCXN0cnVjdCBkcm1f
cGFuZWwgcGFuZWw7CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpOwotCXN0cnVjdCBiYWNr
bGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJc3RydWN0IHJlZ3VsYXRvciAqc3VwcGx5OwogCiAJ
c3RydWN0IHsKQEAgLTg0LDIyICs4MiwxMyBAQCBzdGF0aWMgaW50IHJiMDcwZDMwX3BhbmVsX2Vu
YWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0Owog
Ci0JcmV0ID0gYmFja2xpZ2h0X2VuYWJsZShjdHgtPmJhY2tsaWdodCk7Ci0JaWYgKHJldCkKLQkJ
Z290byBvdXQ7Ci0KIAlyZXR1cm4gMDsKLQotb3V0OgotCW1pcGlfZHNpX2Rjc19lbnRlcl9zbGVl
cF9tb2RlKGN0eC0+ZHNpKTsKLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50IHJiMDcwZDMw
X3BhbmVsX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7CiAJc3RydWN0IHJiMDcw
ZDMwX3BhbmVsICpjdHggPSBwYW5lbF90b19yYjA3MGQzMF9wYW5lbChwYW5lbCk7CiAKLQliYWNr
bGlnaHRfZGlzYWJsZShjdHgtPmJhY2tsaWdodCk7CiAJcmV0dXJuIG1pcGlfZHNpX2Rjc19lbnRl
cl9zbGVlcF9tb2RlKGN0eC0+ZHNpKTsKIH0KIApAQCAtMjA4LDExICsxOTcsOSBAQCBzdGF0aWMg
aW50IHJiMDcwZDMwX3BhbmVsX2RzaV9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kp
CiAJCXJldHVybiBQVFJfRVJSKGN0eC0+Z3Bpb3Muc2hscik7CiAJfQogCi0JY3R4LT5iYWNrbGln
aHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCZkc2ktPmRldik7Ci0JaWYgKElTX0VSUihjdHgt
PmJhY2tsaWdodCkpIHsKLQkJRFJNX0RFVl9FUlJPUigmZHNpLT5kZXYsICJDb3VsZG4ndCBnZXQg
b3VyIGJhY2tsaWdodFxuIik7Ci0JCXJldHVybiBQVFJfRVJSKGN0eC0+YmFja2xpZ2h0KTsKLQl9
CisJcmV0ID0gZHJtX3BhbmVsX29mX2JhY2tsaWdodCgmY3R4LT5wYW5lbCk7CisJaWYgKHJldCkK
KwkJcmV0dXJuIHJldDsKIAogCXJldCA9IGRybV9wYW5lbF9hZGQoJmN0eC0+cGFuZWwpOwogCWlm
IChyZXQgPCAwKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
