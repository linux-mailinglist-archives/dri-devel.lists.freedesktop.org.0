Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0180C6F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4D189E69;
	Sun,  4 Aug 2019 20:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F95189E9B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:31 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id p197so56314981lfa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=shoyTDJcoi5HvA8suEJ+ePhtLRmu1CfLIIIm8v7PNNs=;
 b=f5zz9Ir+4vE8jR2nPDxHZoXenyyZggG5jLfTvgeznujvJ+x9Ey5vjizWlJmtVfvaTp
 Ye4/w8IIJeYyO0G5bZZL5vMUnXvGErf4vstvZPXYJVgT7KLL08pxqmY9bp7InH1gO8ju
 qPnmETa8xOZPQYDhhXNkhwcr6lS1nZxYCZPxyUHFMk1tgdxOtU8RG0bTcRv8fdQRQzqr
 SOIXWek+Q5PAsAyEzzlDSLdb+rvCY/p+Cu7bPFBIqOxXjViDzkhNpHQ60Uy4Iqkg8eZ2
 O43+eKaB0sGxLDe8m/Fg39wA3yiNQUVBQ+IwjVYBs5ZF59IKp8x76tIVQT7cb1fE/A1M
 XZeg==
X-Gm-Message-State: APjAAAXNPdwwyREm20lYYc7zS65FLLAJk9mwnCY6WNIWCGINTkIHTMyw
 WnPm8Mho4+r3XBxAksgCu5HuctdJ7PN3zw==
X-Google-Smtp-Source: APXvYqzl1MkkA4C89bp42Rzz6UlZz/8K8R5A5+jNjhZrXPItPaaVvFQmywl+F1LIRSh1rcVqQi6CzA==
X-Received: by 2002:ac2:5c1d:: with SMTP id r29mr18089640lfp.72.1564949849567; 
 Sun, 04 Aug 2019 13:17:29 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:29 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 10/16] drm/panel: ili9322: move bus_flags to get_modes()
Date: Sun,  4 Aug 2019 22:16:31 +0200
Message-Id: <20190804201637.1240-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shoyTDJcoi5HvA8suEJ+ePhtLRmu1CfLIIIm8v7PNNs=;
 b=TT0liCbgGg0E/gJCenrGbe3V7qxESoHcLYR9Fqum61d5epYgpLiaYRYFfKL92Pr3ih
 8qYhDSumrhQUVMEQzIyzfC1SGb+fphtyBPbjIx90BYEUkYkHRusp/zv3xYTe4Q5JntxV
 tPvq1numLSzbK1j6IgLi22GioQ71kzagFKwDFQTjXRdiZQgt2p+E4RM5HcLdsKTlmHBc
 xcIoztstMzYcu0dtXtODbAIM4OsypFfHT2H5Sbqg70r2FfpBM/xvUiRRgTp1cQZhCVPM
 63T3SG4pNSJFLmpPNWxgt7AqRvsoRkBsILlP/FwlXKZdsAnovbJMjKhi+vrEpjsIAHnh
 ymFQ==
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gcHJlcGFyZSB0aGUgZHJpdmVyIHRvIHJlY2VpdmUgZHJtX2Nvbm5lY3RvciBvbmx5IGluIHRo
ZSBnZXRfbW9kZXMoKQpjYWxsYmFjaywgbW92ZSBidXNfZmxhZ3MgaGFuZGxpbmcgdG8gaWxpOTMy
Ml9nZXRfbW9kZXMoKS4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWlsaXRlay1pbGk5MzIyLmMgfCAzNCArKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTMyMi5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzIyLmMKaW5kZXggNTNkZDFlMTI4Nzk1Li4z
YzU4ZjYzYWRiZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0
ZWstaWxpOTMyMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxp
OTMyMi5jCkBAIC0zNDksNyArMzQ5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29u
ZmlnIGlsaTkzMjJfcmVnbWFwX2NvbmZpZyA9IHsKIAogc3RhdGljIGludCBpbGk5MzIyX2luaXQo
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwsIHN0cnVjdCBpbGk5MzIyICppbGkpCiB7Ci0Jc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9IHBhbmVsLT5jb25uZWN0b3I7CiAJdTggcmVnOwog
CWludCByZXQ7CiAJaW50IGk7CkBAIC00MDcsMjMgKzQwNiwxMSBAQCBzdGF0aWMgaW50IGlsaTkz
MjJfaW5pdChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwgc3RydWN0IGlsaTkzMjIgKmlsaSkKIAkg
KiBQb2xhcml0eSBhbmQgaW52ZXJ0ZWQgY29sb3Igb3JkZXIgZm9yIFJHQiBpbnB1dC4KIAkgKiBO
b25lIG9mIHRoaXMgYXBwbGllcyBpbiB0aGUgQlQuNjU2IG1vZGUuCiAJICovCi0JaWYgKGlsaS0+
Y29uZi0+ZGNsa19hY3RpdmVfaGlnaCkgeworCXJlZyA9IDA7CisJaWYgKGlsaS0+Y29uZi0+ZGNs
a19hY3RpdmVfaGlnaCkKIAkJcmVnID0gSUxJOTMyMl9QT0xfRENMSzsKLQkJY29ubmVjdG9yLT5k
aXNwbGF5X2luZm8uYnVzX2ZsYWdzIHw9Ci0JCQlEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9Q
T1NFREdFOwotCX0gZWxzZSB7Ci0JCXJlZyA9IDA7Ci0JCWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZv
LmJ1c19mbGFncyB8PQotCQkJRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfTkVHRURHRTsKLQl9
Ci0JaWYgKGlsaS0+Y29uZi0+ZGVfYWN0aXZlX2hpZ2gpIHsKKwlpZiAoaWxpLT5jb25mLT5kZV9h
Y3RpdmVfaGlnaCkKIAkJcmVnIHw9IElMSTkzMjJfUE9MX0RFOwotCQljb25uZWN0b3ItPmRpc3Bs
YXlfaW5mby5idXNfZmxhZ3MgfD0KLQkJCURSTV9CVVNfRkxBR19ERV9ISUdIOwotCX0gZWxzZSB7
Ci0JCWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJ1c19mbGFncyB8PQotCQkJRFJNX0JVU19GTEFH
X0RFX0xPVzsKLQl9CiAJaWYgKGlsaS0+Y29uZi0+aHN5bmNfYWN0aXZlX2hpZ2gpCiAJCXJlZyB8
PSBJTEk5MzIyX1BPTF9IU1lOQzsKIAlpZiAoaWxpLT5jb25mLT52c3luY19hY3RpdmVfaGlnaCkK
QEAgLTY1OSw5ICs2NDYsMjAgQEAgc3RhdGljIGludCBpbGk5MzIyX2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX3BhbmVsICpwYW5lbCkKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gcGFu
ZWwtPmNvbm5lY3RvcjsKIAlzdHJ1Y3QgaWxpOTMyMiAqaWxpID0gcGFuZWxfdG9faWxpOTMyMihw
YW5lbCk7CiAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7CisJc3RydWN0IGRybV9kaXNw
bGF5X2luZm8gKmluZm87CisKKwlpbmZvID0gJmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvOworCWlu
Zm8tPndpZHRoX21tID0gaWxpLT5jb25mLT53aWR0aF9tbTsKKwlpbmZvLT5oZWlnaHRfbW0gPSBp
bGktPmNvbmYtPmhlaWdodF9tbTsKKwlpZiAoaWxpLT5jb25mLT5kY2xrX2FjdGl2ZV9oaWdoKQor
CQlpbmZvLT5idXNfZmxhZ3MgfD0gRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRTsK
KwllbHNlCisJCWluZm8tPmJ1c19mbGFncyB8PSBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9O
RUdFREdFOwogCi0JY29ubmVjdG9yLT5kaXNwbGF5X2luZm8ud2lkdGhfbW0gPSBpbGktPmNvbmYt
PndpZHRoX21tOwotCWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmhlaWdodF9tbSA9IGlsaS0+Y29u
Zi0+aGVpZ2h0X21tOworCWlmIChpbGktPmNvbmYtPmRlX2FjdGl2ZV9oaWdoKQorCQlpbmZvLT5i
dXNfZmxhZ3MgfD0gRFJNX0JVU19GTEFHX0RFX0hJR0g7CisJZWxzZQorCQlpbmZvLT5idXNfZmxh
Z3MgfD0gRFJNX0JVU19GTEFHX0RFX0xPVzsKIAogCXN3aXRjaCAoaWxpLT5pbnB1dCkgewogCWNh
c2UgSUxJOTMyMl9JTlBVVF9TUkdCX0RVTU1ZXzMyMFgyNDA6Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
