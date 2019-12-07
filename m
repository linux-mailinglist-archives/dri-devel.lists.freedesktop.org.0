Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7F115CA3
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D8C6E19B;
	Sat,  7 Dec 2019 14:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DC76E197
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:35 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 15so7433804lfr.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=66uC10NTDsBRb7X6vStnogHiILcbdjND8PJjJ30cYbk=;
 b=EjLvIqjz8IgRw66FKmiA5x6PKbHNkMGkv1IheLXimCxoNRsIsMpfD41lEz+aBky5Xi
 xVTC9bMzHLa4ltobt/wMm/Zoy87i2mfnd8dRekqGVV0JHJbvQWpxC/Er0/koXE4HRb/f
 yjxEdr2yYLi1M36a6UJKN8XRbuFNyU0ydKMcrOesKw7hA/14UtbTxcqlmuTK/X9Bk1fG
 nyO0DpvBLEXjTBBpVdEWi6FYO6DLjYm0FdGKfzIJ0ycAN2sp8MAuPMm1ySIuVjuwK73D
 /Fcx69lMeZCGQt1UjVmYWxdo4DWSXbJMEYlQbu7zsbBpWFcsfTfDHcRTXS+XD56X1zQv
 V0Zg==
X-Gm-Message-State: APjAAAXstIHlhbJFuLyK0VdA7IfNMBcpqV2cZyI+/YHUn8XW0U0OQ6Vm
 JNRkGLRPgxmt71LHEXbUJ22HDtkVWywbvQ==
X-Google-Smtp-Source: APXvYqxVNVpfDn6H4MM9EgRQ26sPL400SlH6382v5r0u3Jj20zEKSwiT5FQB/2Gog+qGIuLc4xC8dA==
X-Received: by 2002:a19:550a:: with SMTP id n10mr10813033lfe.104.1575727473305; 
 Sat, 07 Dec 2019 06:04:33 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:32 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 13/25] drm/panel: olimex-lcd-olinuxino: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:41 +0100
Message-Id: <20191207140353.23967-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66uC10NTDsBRb7X6vStnogHiILcbdjND8PJjJ30cYbk=;
 b=eXo50RX1awgOgNqXA1euoTjADMDxJIIFt7Pu3nB1qA9kL/D53Wde7x1V7fPKl2ER6f
 mKPD6elw1ZuMST7wwxBb3iv3VN9n4mHUZuCyvBBdvRZ+zO9nzDUfgM+nr89reyidFjk2
 5bl5lEnsZ5a+YLW/5u7sk+EqFefyVyztWmjYqKsrM0j+3Hu9JYA32AFZOHg/zXqQEhil
 EaIetBjkLamIOXtQH7Ef+AHxOdglN5O/sqEFpPCFljHdlSqIYsq3aggg2FUtPigLHmwG
 Qwnhq8a1y98GH4vItHdyUv4SzuVygkRRme4IlJZiEXPhgPjwJOXY5+RKh3KzTEoOj3Oe
 uylw==
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
 linux-samsung-soc@vger.kernel.org, Stefan Mavrodiev <stefan@olimex.com>,
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
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgpDYzogU3RlZmFuIE1hdnJvZGlldiA8c3RlZmFuQG9saW1leC5jb20+CkNjOiBUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgotLS0KIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLW9saW1leC1sY2Qtb2xp
bnV4aW5vLmMgfCAxOCArKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1vbGltZXgtbGNkLW9saW51eGluby5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLW9saW1leC1sY2Qtb2xpbnV4aW5vLmMKaW5kZXggZTU1M2U1ODQzOTliLi4wOWRlYjk5
OTgxYTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vbGltZXgtbGNk
LW9saW51eGluby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vbGltZXgtbGNk
LW9saW51eGluby5jCkBAIC02LDcgKzYsNiBAQAogICogICBBdXRob3I6IFN0ZWZhbiBNYXZyb2Rp
ZXYgPHN0ZWZhbkBvbGltZXguY29tPgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQu
aD4KICNpbmNsdWRlIDxsaW51eC9jcmMzMi5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3Vt
ZXIuaD4KICNpbmNsdWRlIDxsaW51eC9pMmMuaD4KQEAgLTY4LDcgKzY3LDYgQEAgc3RydWN0IGxj
ZF9vbGludXhpbm8gewogCWJvb2wgcHJlcGFyZWQ7CiAJYm9vbCBlbmFibGVkOwogCi0Jc3RydWN0
IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7
CiAJc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87CiAKQEAgLTg3LDggKzg1LDYgQEAgc3Rh
dGljIGludCBsY2Rfb2xpbnV4aW5vX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJ
aWYgKCFsY2QtPmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUobGNk
LT5iYWNrbGlnaHQpOwotCiAJbGNkLT5lbmFibGVkID0gZmFsc2U7CiAKIAlyZXR1cm4gMDsKQEAg
LTEzNCw4ICsxMzAsNiBAQCBzdGF0aWMgaW50IGxjZF9vbGludXhpbm9fZW5hYmxlKHN0cnVjdCBk
cm1fcGFuZWwgKnBhbmVsKQogCWlmIChsY2QtPmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFj
a2xpZ2h0X2VuYWJsZShsY2QtPmJhY2tsaWdodCk7Ci0KIAlsY2QtPmVuYWJsZWQgPSB0cnVlOwog
CiAJcmV0dXJuIDA7CkBAIC0yODMsMTMgKzI3NywxMyBAQCBzdGF0aWMgaW50IGxjZF9vbGludXhp
bm9fcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAlpZiAoSVNfRVJSKGxjZC0+ZW5h
YmxlX2dwaW8pKQogCQlyZXR1cm4gUFRSX0VSUihsY2QtPmVuYWJsZV9ncGlvKTsKIAotCWxjZC0+
YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChkZXYpOwotCWlmIChJU19FUlIobGNk
LT5iYWNrbGlnaHQpKQotCQlyZXR1cm4gUFRSX0VSUihsY2QtPmJhY2tsaWdodCk7Ci0KIAlkcm1f
cGFuZWxfaW5pdCgmbGNkLT5wYW5lbCwgZGV2LCAmbGNkX29saW51eGlub19mdW5jcywKIAkJICAg
ICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EUEkpOwogCisJcmV0ID0gZHJtX3BhbmVsX29mX2JhY2ts
aWdodCgmbGNkLT5wYW5lbCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCXJldHVybiBk
cm1fcGFuZWxfYWRkKCZsY2QtPnBhbmVsKTsKIH0KIApAQCAtMjk5LDggKzI5Myw4IEBAIHN0YXRp
YyBpbnQgbGNkX29saW51eGlub19yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAog
CWRybV9wYW5lbF9yZW1vdmUoJnBhbmVsLT5wYW5lbCk7CiAKLQlsY2Rfb2xpbnV4aW5vX2Rpc2Fi
bGUoJnBhbmVsLT5wYW5lbCk7Ci0JbGNkX29saW51eGlub191bnByZXBhcmUoJnBhbmVsLT5wYW5l
bCk7CisJZHJtX3BhbmVsX2Rpc2FibGUoJnBhbmVsLT5wYW5lbCk7CisJZHJtX3BhbmVsX3VucHJl
cGFyZSgmcGFuZWwtPnBhbmVsKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
