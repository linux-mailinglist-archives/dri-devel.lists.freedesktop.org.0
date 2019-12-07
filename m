Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE534115CBF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991F66E1B3;
	Sat,  7 Dec 2019 14:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326AE6E1AA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e28so10676219ljo.9
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e7mwo6xIwy/U2XO5N1RPHN+wQVnB1gT7AErUd+pEX6s=;
 b=q+ssLz4+lFwgKFxu6JfRy4U++zEkRNZHyILOyem80ahQiihAD97HISjzv55n/S0olu
 3w4ZjHtu1lJeeLobJPx1XXOWL+KqK3epSxZnazyxkJxzJkHgoPXQRXoFPRn22ei3cQQV
 nDewx6J4GeHtiLTW1w0xDgCkq2AiDdsCUClK9JQKUkVU+aZIkw/YToxkSSlyhPIbHPPW
 lYDDPyWrdn5b4Mld3P5ZLRpgi62saQmHLkgEarTy36t6PUC6Hlq5+8VUzftHNprN7+T4
 VoCP3pooWDu0yeHVv24/Wp+9b4C/7+Zt41uzNj/XsMaWdNLWmaO/MW9WEd0/TzSvahBK
 /LXg==
X-Gm-Message-State: APjAAAUhUWTRFfaKlCG2kvKKdzcwX3+hSSqkdpQ8mSCABWjUNj5Cmdgq
 m3ln5DAx7jqinGKTqD8JFaMoiDQFkxkB2g==
X-Google-Smtp-Source: APXvYqwmQQwd5PYZLccoPw95nR8Lj7iniKv3EdQE4SgC0FhGKWQQgOWwqa3PijSftjOtij17f88rLg==
X-Received: by 2002:a2e:2d11:: with SMTP id t17mr3482709ljt.177.1575727484353; 
 Sat, 07 Dec 2019 06:04:44 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:43 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 19/25] drm/panel: seiko-43wvf1g: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:47 +0100
Message-Id: <20191207140353.23967-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7mwo6xIwy/U2XO5N1RPHN+wQVnB1gT7AErUd+pEX6s=;
 b=msAonKM+50sxoUWm6s+q2esLV9oiyaLLag111TzDTz8SQ+I/uiTt4rgjySC6KQ24ZP
 fXT8q42NVcWNBBOldzoyC2oxgwuojTx+oMy8sGrVOxFJc+sIFep2xsKxiGPLGuvCUOQb
 +DehKKaI9EjFDPgvxBfkGTlkJ6+EeOEQ26qQrsfCpTK5BlwPzwkP21+KBhAIynRdYqh0
 Jw7CBJeqjUi/cNctV7ufzixPmO4vWRS6LCKWGG3X/IuYWOWD+ogcWxss+SUNRHoQhGxd
 rb3/XNYedJL3zRiwMkBCAYztTMbOApa0sT+M+ObavSMPtvRbjj3Ie40+20QGBlMIpb2P
 +9bQ==
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
cGFuZWwtc2Vpa28tNDN3dmYxZy5jIHwgMzYgKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Vpa28tNDN3dmYxZy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNlaWtvLTQzd3ZmMWcuYwppbmRleCAxOGU3NDUxMDRhYWYuLjQwZmNi
YmJhY2IyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNlaWtvLTQz
d3ZmMWcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Vpa28tNDN3dmYxZy5j
CkBAIC02LDcgKzYsNiBAQAogICogQmFzZWQgb24gUGFuZWwgU2ltcGxlIGRyaXZlciBieSBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9i
YWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L29mLmg+CkBAIC00Niw3ICs0NSw2IEBAIHN0cnVjdCBz
ZWlrb19wYW5lbCB7CiAJYm9vbCBwcmVwYXJlZDsKIAlib29sIGVuYWJsZWQ7CiAJY29uc3Qgc3Ry
dWN0IHNlaWtvX3BhbmVsX2Rlc2MgKmRlc2M7Ci0Jc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJh
Y2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpkdmRkOwogCXN0cnVjdCByZWd1bGF0b3IgKmF2
ZGQ7CiB9OwpAQCAtMTI3LDEyICsxMjUsNiBAQCBzdGF0aWMgaW50IHNlaWtvX3BhbmVsX2Rpc2Fi
bGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJaWYgKCFwLT5lbmFibGVkKQogCQlyZXR1cm4g
MDsKIAotCWlmIChwLT5iYWNrbGlnaHQpIHsKLQkJcC0+YmFja2xpZ2h0LT5wcm9wcy5wb3dlciA9
IEZCX0JMQU5LX1BPV0VSRE9XTjsKLQkJcC0+YmFja2xpZ2h0LT5wcm9wcy5zdGF0ZSB8PSBCTF9D
T1JFX0ZCQkxBTks7Ci0JCWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKHAtPmJhY2tsaWdodCk7Ci0J
fQotCiAJcC0+ZW5hYmxlZCA9IGZhbHNlOwogCiAJcmV0dXJuIDA7CkBAIC0xOTYsMTIgKzE4OCw2
IEBAIHN0YXRpYyBpbnQgc2Vpa29fcGFuZWxfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVs
KQogCWlmIChwLT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCWlmIChwLT5iYWNrbGlnaHQpIHsK
LQkJcC0+YmFja2xpZ2h0LT5wcm9wcy5zdGF0ZSAmPSB+QkxfQ09SRV9GQkJMQU5LOwotCQlwLT5i
YWNrbGlnaHQtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfVU5CTEFOSzsKLQkJYmFja2xpZ2h0X3Vw
ZGF0ZV9zdGF0dXMocC0+YmFja2xpZ2h0KTsKLQl9Ci0KIAlwLT5lbmFibGVkID0gdHJ1ZTsKIAog
CXJldHVybiAwOwpAQCAtMjQ1LDcgKzIzMSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Bh
bmVsX2Z1bmNzIHNlaWtvX3BhbmVsX2Z1bmNzID0gewogc3RhdGljIGludCBzZWlrb19wYW5lbF9w
cm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQkJCWNvbnN0IHN0cnVjdCBzZWlrb19wYW5lbF9k
ZXNjICpkZXNjKQogewotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqYmFja2xpZ2h0OwogCXN0cnVjdCBz
ZWlrb19wYW5lbCAqcGFuZWw7CiAJaW50IGVycjsKIApAQCAtMjY1LDE4ICsyNTAsMTMgQEAgc3Rh
dGljIGludCBzZWlrb19wYW5lbF9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJaWYgKElTX0VS
UihwYW5lbC0+YXZkZCkpCiAJCXJldHVybiBQVFJfRVJSKHBhbmVsLT5hdmRkKTsKIAotCWJhY2ts
aWdodCA9IG9mX3BhcnNlX3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAiYmFja2xpZ2h0IiwgMCk7Ci0J
aWYgKGJhY2tsaWdodCkgewotCQlwYW5lbC0+YmFja2xpZ2h0ID0gb2ZfZmluZF9iYWNrbGlnaHRf
Ynlfbm9kZShiYWNrbGlnaHQpOwotCQlvZl9ub2RlX3B1dChiYWNrbGlnaHQpOwotCi0JCWlmICgh
cGFuZWwtPmJhY2tsaWdodCkKLQkJCXJldHVybiAtRVBST0JFX0RFRkVSOwotCX0KLQogCWRybV9w
YW5lbF9pbml0KCZwYW5lbC0+YmFzZSwgZGV2LCAmc2Vpa29fcGFuZWxfZnVuY3MsCiAJCSAgICAg
ICBEUk1fTU9ERV9DT05ORUNUT1JfRFBJKTsKIAorCWVyciA9IGRybV9wYW5lbF9vZl9iYWNrbGln
aHQoJnBhbmVsLT5iYXNlKTsKKwlpZiAoZXJyKQorCQlyZXR1cm4gZXJyOworCiAJZXJyID0gZHJt
X3BhbmVsX2FkZCgmcGFuZWwtPmJhc2UpOwogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwpA
QCAtMjkxLDExICsyNzEsNyBAQCBzdGF0aWMgaW50IHNlaWtvX3BhbmVsX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBzZWlrb19wYW5lbCAqcGFuZWwgPSBkZXZf
Z2V0X2RydmRhdGEoJnBkZXYtPmRldik7CiAKIAlkcm1fcGFuZWxfcmVtb3ZlKCZwYW5lbC0+YmFz
ZSk7Ci0KLQlzZWlrb19wYW5lbF9kaXNhYmxlKCZwYW5lbC0+YmFzZSk7Ci0KLQlpZiAocGFuZWwt
PmJhY2tsaWdodCkKLQkJcHV0X2RldmljZSgmcGFuZWwtPmJhY2tsaWdodC0+ZGV2KTsKKwlkcm1f
cGFuZWxfZGlzYWJsZSgmcGFuZWwtPmJhc2UpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0zMDQsNyAr
MjgwLDcgQEAgc3RhdGljIHZvaWQgc2Vpa29fcGFuZWxfc2h1dGRvd24oc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc2Vpa29fcGFuZWwgKnBhbmVsID0gZGV2X2dldF9k
cnZkYXRhKCZwZGV2LT5kZXYpOwogCi0Jc2Vpa29fcGFuZWxfZGlzYWJsZSgmcGFuZWwtPmJhc2Up
OworCWRybV9wYW5lbF9kaXNhYmxlKCZwYW5lbC0+YmFzZSk7CiB9CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZGlzcGxheV90aW1pbmcgc2Vpa29fNDN3dmYxZ190aW1pbmcgPSB7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
