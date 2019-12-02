Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95510F062
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7C26E2EC;
	Mon,  2 Dec 2019 19:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CAB6E2EC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l14so757669lfh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+FHuLNwTdHR6blgVNr/owkQfKdgYFCUT0XTY+HsYKBg=;
 b=cUeYM1dOc21RAiQOKE70/V9Gd0IMG0QeBrwuR6jXoSnUbdVeEy93Z33mZRp5fCmq2q
 bSAHRcB9ong/mSWboeQ5lBL3ztGozRLu8nPkEqfQu/49KF9TNRvuFJro5ZhBLKVnqqqd
 64RRVvmfU46y7MA9NvhOFGTUUx6Uq1e4ZNLB74lZ3rOkzWmHQH83H/pTXhTvQWTv8SgT
 tYT0BfZFjOguM/zsoKsXbF1EcEgbB5U4o1sOmFf/DTCfwnF1zdJ/N3wxatGeczKLvtFf
 dWdBR3Vj4yZESzfvXT8Ui77GDuDGqQ/2e0Q0d03Wg+Uf2aOprwKcz7bvPBfge5IQdnk3
 uqEQ==
X-Gm-Message-State: APjAAAXBKWPh2tiexvw6qimxm3Fw76WYPDA7n2YDwqZUS+A3jsWaCjxk
 Bi74a3vsu71cGclT+MSaOaUbzKs+AXTJBg==
X-Google-Smtp-Source: APXvYqzGlpVDHTn2zIkxekoAh78y1wVNAMIONaXD45gxrFXPhUl9H7ermaRGNE/MDT+fhbkWwEN1Ww==
X-Received: by 2002:a19:2213:: with SMTP id i19mr408485lfi.83.1575315222087;
 Mon, 02 Dec 2019 11:33:42 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:41 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 20/26] drm/panel: seiko-43wvf1g: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:24 +0100
Message-Id: <20191202193230.21310-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FHuLNwTdHR6blgVNr/owkQfKdgYFCUT0XTY+HsYKBg=;
 b=jAXzCXL9OdEFsuNU1Rs/H2FYtD6pIirQWfm5U6evmlkFIskQuthJt9AUIdScaihjmF
 52FsG/8XdjrE41j+He/A6yyC4jP5mmYdG1kZ3G0ZpJVzEHwZBztYfRt+kcQL2kUFvh/L
 yW9AezRVYJMkZnaGMdTL3Q+YhbEZoA/RoEjQTerZESKzRJxS03HIJ86GOmWGZdCBzUSS
 HnP3Mu25UOP/ytQcsx+HDzNsMONGSLUwbpSZNLe1q8ni4NI8jZwpxIZdbWOnX8+nOUiY
 2wlEgN8ddWA+US468fwzh7tyFb1t3BA0PgXvb1U/3gWy/qnyLg82pgFzUE6eqnZk0Tcq
 RD/A==
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
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Vp
a28tNDN3dmYxZy5jIHwgMzYgKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2Vpa28tNDN3dmYxZy5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNlaWtvLTQzd3ZmMWcuYwppbmRleCA0YjM0NWEyNDJiM2YuLmU3ZTAwYjIzYzk3NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNlaWtvLTQzd3ZmMWcuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Vpa28tNDN3dmYxZy5jCkBAIC02LDcg
KzYsNiBAQAogICogQmFzZWQgb24gUGFuZWwgU2ltcGxlIGRyaXZlciBieSBUaGllcnJ5IFJlZGlu
ZyA8dHJlZGluZ0BudmlkaWEuY29tPgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQu
aD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgog
I2luY2x1ZGUgPGxpbnV4L29mLmg+CkBAIC00Niw3ICs0NSw2IEBAIHN0cnVjdCBzZWlrb19wYW5l
bCB7CiAJYm9vbCBwcmVwYXJlZDsKIAlib29sIGVuYWJsZWQ7CiAJY29uc3Qgc3RydWN0IHNlaWtv
X3BhbmVsX2Rlc2MgKmRlc2M7Ci0Jc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodDsK
IAlzdHJ1Y3QgcmVndWxhdG9yICpkdmRkOwogCXN0cnVjdCByZWd1bGF0b3IgKmF2ZGQ7CiB9OwpA
QCAtMTI3LDEyICsxMjUsNiBAQCBzdGF0aWMgaW50IHNlaWtvX3BhbmVsX2Rpc2FibGUoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpCiAJaWYgKCFwLT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCWlm
IChwLT5iYWNrbGlnaHQpIHsKLQkJcC0+YmFja2xpZ2h0LT5wcm9wcy5wb3dlciA9IEZCX0JMQU5L
X1BPV0VSRE9XTjsKLQkJcC0+YmFja2xpZ2h0LT5wcm9wcy5zdGF0ZSB8PSBCTF9DT1JFX0ZCQkxB
Tks7Ci0JCWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKHAtPmJhY2tsaWdodCk7Ci0JfQotCiAJcC0+
ZW5hYmxlZCA9IGZhbHNlOwogCiAJcmV0dXJuIDA7CkBAIC0xOTYsMTIgKzE4OCw2IEBAIHN0YXRp
YyBpbnQgc2Vpa29fcGFuZWxfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmIChw
LT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCWlmIChwLT5iYWNrbGlnaHQpIHsKLQkJcC0+YmFj
a2xpZ2h0LT5wcm9wcy5zdGF0ZSAmPSB+QkxfQ09SRV9GQkJMQU5LOwotCQlwLT5iYWNrbGlnaHQt
PnByb3BzLnBvd2VyID0gRkJfQkxBTktfVU5CTEFOSzsKLQkJYmFja2xpZ2h0X3VwZGF0ZV9zdGF0
dXMocC0+YmFja2xpZ2h0KTsKLQl9Ci0KIAlwLT5lbmFibGVkID0gdHJ1ZTsKIAogCXJldHVybiAw
OwpAQCAtMjI3LDcgKzIxMyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNz
IHNlaWtvX3BhbmVsX2Z1bmNzID0gewogc3RhdGljIGludCBzZWlrb19wYW5lbF9wcm9iZShzdHJ1
Y3QgZGV2aWNlICpkZXYsCiAJCQkJCWNvbnN0IHN0cnVjdCBzZWlrb19wYW5lbF9kZXNjICpkZXNj
KQogewotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqYmFja2xpZ2h0OwogCXN0cnVjdCBzZWlrb19wYW5l
bCAqcGFuZWw7CiAJaW50IGVycjsKIApAQCAtMjQ3LDE4ICsyMzIsMTMgQEAgc3RhdGljIGludCBz
ZWlrb19wYW5lbF9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJaWYgKElTX0VSUihwYW5lbC0+
YXZkZCkpCiAJCXJldHVybiBQVFJfRVJSKHBhbmVsLT5hdmRkKTsKIAotCWJhY2tsaWdodCA9IG9m
X3BhcnNlX3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAiYmFja2xpZ2h0IiwgMCk7Ci0JaWYgKGJhY2ts
aWdodCkgewotCQlwYW5lbC0+YmFja2xpZ2h0ID0gb2ZfZmluZF9iYWNrbGlnaHRfYnlfbm9kZShi
YWNrbGlnaHQpOwotCQlvZl9ub2RlX3B1dChiYWNrbGlnaHQpOwotCi0JCWlmICghcGFuZWwtPmJh
Y2tsaWdodCkKLQkJCXJldHVybiAtRVBST0JFX0RFRkVSOwotCX0KLQogCWRybV9wYW5lbF9pbml0
KCZwYW5lbC0+YmFzZSwgZGV2LCAmc2Vpa29fcGFuZWxfZnVuY3MsCiAJCSAgICAgICBEUk1fTU9E
RV9DT05ORUNUT1JfRFBJKTsKIAorCWVyciA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQoJnBhbmVs
LT5iYXNlKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOworCiAJZXJyID0gZHJtX3BhbmVsX2Fk
ZCgmcGFuZWwtPmJhc2UpOwogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwpAQCAtMjczLDEx
ICsyNTMsNyBAQCBzdGF0aWMgaW50IHNlaWtvX3BhbmVsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCXN0cnVjdCBzZWlrb19wYW5lbCAqcGFuZWwgPSBkZXZfZ2V0X2RydmRh
dGEoJnBkZXYtPmRldik7CiAKIAlkcm1fcGFuZWxfcmVtb3ZlKCZwYW5lbC0+YmFzZSk7Ci0KLQlz
ZWlrb19wYW5lbF9kaXNhYmxlKCZwYW5lbC0+YmFzZSk7Ci0KLQlpZiAocGFuZWwtPmJhY2tsaWdo
dCkKLQkJcHV0X2RldmljZSgmcGFuZWwtPmJhY2tsaWdodC0+ZGV2KTsKKwlkcm1fcGFuZWxfZGlz
YWJsZSgmcGFuZWwtPmJhc2UpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0yODYsNyArMjYyLDcgQEAg
c3RhdGljIHZvaWQgc2Vpa29fcGFuZWxfc2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIHsKIAlzdHJ1Y3Qgc2Vpa29fcGFuZWwgKnBhbmVsID0gZGV2X2dldF9kcnZkYXRhKCZw
ZGV2LT5kZXYpOwogCi0Jc2Vpa29fcGFuZWxfZGlzYWJsZSgmcGFuZWwtPmJhc2UpOworCWRybV9w
YW5lbF9kaXNhYmxlKCZwYW5lbC0+YmFzZSk7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGlz
cGxheV90aW1pbmcgc2Vpa29fNDN3dmYxZ190aW1pbmcgPSB7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
