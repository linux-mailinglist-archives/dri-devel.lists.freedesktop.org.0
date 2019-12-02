Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A210F043
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9CE6E2E6;
	Mon,  2 Dec 2019 19:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910646E2E6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z17so774480ljk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+5RYUpfQaHxKRkMXMkrP8oHu/MU7hdMpYDFxNzucUWs=;
 b=ttS/bF+4cq5a8KSVaq5SnxmOAs+ib1mQA+SDA9BBBKvtET9iua6BykoQwNseXow4X1
 gQbUmpONvMw8W8fas/UMMMmJCF0h2zjGQ7BWHD6Xhh8rO851450Dhjkuziu3YAN44ya0
 P4mN8fUDSkIQyIcRe0PUHs44cYBWdcZrVvBmvtDlIIM6TJvGcbdAyChf+7di0VWD+QHU
 /d3fSMLhUasQaGmKRramYdkzh1yajlCr8LrSVCVdeaEYi2urAMpgNhTj/ZTpuhWVyFt8
 tJQ+ptVFfUC7wjXfSbmeI5hQxIiXCnfFiBD5iteIMB0LVRDmTyKCIa7zLBCJqVVOt/C6
 K3/g==
X-Gm-Message-State: APjAAAXOfe0tA+hcnTCvYFXfYCkzNZ3LYHWmaBL57MhTgCtVn4XqruSy
 61H58B+MXY/ymY7BAAPHxZtlBL5TOiRF5w==
X-Google-Smtp-Source: APXvYqw6xZ1V1bDQy1s46yIVtGq4D/aLE8LZc7NwSI+fkDGgYQgqenzANQAALXlLLg5Wahg+qt2cSA==
X-Received: by 2002:a2e:3a15:: with SMTP id h21mr266843lja.256.1575315211669; 
 Mon, 02 Dec 2019 11:33:31 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:31 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 14/26] drm/panel: olimex-lcd-olinuxino: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:18 +0100
Message-Id: <20191202193230.21310-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5RYUpfQaHxKRkMXMkrP8oHu/MU7hdMpYDFxNzucUWs=;
 b=FxrKOZXvIF29xM5J+pbmyhXLfeQ1nklAk2wjlXyurWeQsWf2xXMKDXqzoBzjlf8k4h
 sPXZBUKfoTu2+QPSuB1Mun/NjlwEGG6y4s2LuJC2ikplHxAIxTxYdo0/pT+lQxVE/Dqe
 Q+qDzTGbtGOUWoFMzbsYsrXtMhBrHPAbakZ4oo4+KxLNrE9+Vhsr57kf756kruBBfiwo
 fnvVT2HrnRTkdac8TGx+bWQLxc5opFap8I718aRsVi5UBY2ky009OO8SgyF0Ws/zpy+y
 t4dIPeOh16FHiRVp976VpPmmC4FK7tfYfhZNi1xoQOGrwALJKP5AAjb0a2R93fuuE4wZ
 p52g==
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
 Stefan Mavrodiev <stefan@olimex.com>, linux-rockchip@lists.infradead.org,
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
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
U3RlZmFuIE1hdnJvZGlldiA8c3RlZmFuQG9saW1leC5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8
dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgotLS0KIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLW9saW1leC1sY2Qtb2xpbnV4aW5vLmMg
fCAxOCArKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1vbGltZXgtbGNkLW9saW51eGluby5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW9s
aW1leC1sY2Qtb2xpbnV4aW5vLmMKaW5kZXggZTU1M2U1ODQzOTliLi4wOWRlYjk5OTgxYTQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vbGltZXgtbGNkLW9saW51eGlu
by5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vbGltZXgtbGNkLW9saW51eGlu
by5jCkBAIC02LDcgKzYsNiBAQAogICogICBBdXRob3I6IFN0ZWZhbiBNYXZyb2RpZXYgPHN0ZWZh
bkBvbGltZXguY29tPgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNs
dWRlIDxsaW51eC9jcmMzMi5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNp
bmNsdWRlIDxsaW51eC9pMmMuaD4KQEAgLTY4LDcgKzY3LDYgQEAgc3RydWN0IGxjZF9vbGludXhp
bm8gewogCWJvb2wgcHJlcGFyZWQ7CiAJYm9vbCBlbmFibGVkOwogCi0Jc3RydWN0IGJhY2tsaWdo
dF9kZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7CiAJc3RydWN0
IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87CiAKQEAgLTg3LDggKzg1LDYgQEAgc3RhdGljIGludCBs
Y2Rfb2xpbnV4aW5vX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJaWYgKCFsY2Qt
PmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUobGNkLT5iYWNrbGln
aHQpOwotCiAJbGNkLT5lbmFibGVkID0gZmFsc2U7CiAKIAlyZXR1cm4gMDsKQEAgLTEzNCw4ICsx
MzAsNiBAQCBzdGF0aWMgaW50IGxjZF9vbGludXhpbm9fZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwg
KnBhbmVsKQogCWlmIChsY2QtPmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFja2xpZ2h0X2Vu
YWJsZShsY2QtPmJhY2tsaWdodCk7Ci0KIAlsY2QtPmVuYWJsZWQgPSB0cnVlOwogCiAJcmV0dXJu
IDA7CkBAIC0yODMsMTMgKzI3NywxMyBAQCBzdGF0aWMgaW50IGxjZF9vbGludXhpbm9fcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAlpZiAoSVNfRVJSKGxjZC0+ZW5hYmxlX2dwaW8p
KQogCQlyZXR1cm4gUFRSX0VSUihsY2QtPmVuYWJsZV9ncGlvKTsKIAotCWxjZC0+YmFja2xpZ2h0
ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChkZXYpOwotCWlmIChJU19FUlIobGNkLT5iYWNrbGln
aHQpKQotCQlyZXR1cm4gUFRSX0VSUihsY2QtPmJhY2tsaWdodCk7Ci0KIAlkcm1fcGFuZWxfaW5p
dCgmbGNkLT5wYW5lbCwgZGV2LCAmbGNkX29saW51eGlub19mdW5jcywKIAkJICAgICAgIERSTV9N
T0RFX0NPTk5FQ1RPUl9EUEkpOwogCisJcmV0ID0gZHJtX3BhbmVsX29mX2JhY2tsaWdodCgmbGNk
LT5wYW5lbCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCXJldHVybiBkcm1fcGFuZWxf
YWRkKCZsY2QtPnBhbmVsKTsKIH0KIApAQCAtMjk5LDggKzI5Myw4IEBAIHN0YXRpYyBpbnQgbGNk
X29saW51eGlub19yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAogCWRybV9wYW5l
bF9yZW1vdmUoJnBhbmVsLT5wYW5lbCk7CiAKLQlsY2Rfb2xpbnV4aW5vX2Rpc2FibGUoJnBhbmVs
LT5wYW5lbCk7Ci0JbGNkX29saW51eGlub191bnByZXBhcmUoJnBhbmVsLT5wYW5lbCk7CisJZHJt
X3BhbmVsX2Rpc2FibGUoJnBhbmVsLT5wYW5lbCk7CisJZHJtX3BhbmVsX3VucHJlcGFyZSgmcGFu
ZWwtPnBhbmVsKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
