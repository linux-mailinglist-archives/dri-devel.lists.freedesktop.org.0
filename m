Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D880C54
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA9A89E03;
	Sun,  4 Aug 2019 20:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90DB89E03
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:06 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h28so56312110lfj.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZQy9HfEbGA1ab0VIPAqW/5LFlvvMfM3YtKt25w5akQg=;
 b=WoetXyys3DDKL3Qq+/yUu4XO7IQWMYmbskl5O5AXIo7pjauLHg3cArTU21muhiHVjE
 wxr2Gqp5Xr+/LBQBc+5CRIR57hA0Nlj7DQmJeKv7AK9k/snl9AsXo+14194Md6J6rCjE
 KfTohgsIQmbjgs6kk5p9skJVLQ9vuv5cQD3Sprd0wSAe+GQ+BvXGLXd7fd7zsKykUS3x
 fKccsL16XmfjFBUCjjfS+ba5LqDSYi+ZyMzCJrCzTBZ5pstsA3p0LZzKHvIE5rB6Aupd
 zVnqS6LwAY6BTGc0Y+waHF07TytfKYSIi7o9jqibCxIiNcSlj42dAkQITy0cF+z8Md37
 9juw==
X-Gm-Message-State: APjAAAVhjOofpfGbBbwcd5+UQVKGmpFggghHnQ1qD82qlG9VQGr+Rx6V
 tXExv5pBicNh1SpRMOJlAiQp2N+nTwIlbQ==
X-Google-Smtp-Source: APXvYqxrxJ6f5gcwOvxklU9HO4h4OF+p5nSRTWaf0Mi726mZOEO7tha0ZCSglPRdKYDVM/d5m/f2qg==
X-Received: by 2002:a05:6512:146:: with SMTP id
 m6mr5406980lfo.90.1564949824886; 
 Sun, 04 Aug 2019 13:17:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:04 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 02/16] drm/exynos: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:23 +0200
Message-Id: <20190804201637.1240-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQy9HfEbGA1ab0VIPAqW/5LFlvvMfM3YtKt25w5akQg=;
 b=kU2m0+RBLUeqJOTqmN7wdIW5oOoJZk4mOVt8g2Pj9LBw8owAvIqfINDwzOdJ8fG3vY
 TmasVFXMgD9rbalVp2CRfKLF2xAY6JU4RpR/URtcsWX5hO4W1AcMMyl7KxM0EwKntN+X
 s0PmeKEE1zCtIcWZZbPwdxjRU5nYL6lOJnt+7SVLtKXAqsl18OyMoAewTdWmVuRodIhM
 KERP/ppypDVfWGQGYyvXKM9f9XAJghQ8AgeG2s18H4kOr9xhKEUbFmFZ5sLSnbcTPPgg
 zbfqIEc3h652BTSzj7i7m2PWJWdp865ZGwAZPpyW4xSJXt92fzG/ahvoGyE7oIx+IrkH
 t9mA==
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

ZHJtX3BhbmVsX2F0dGFjaCgpIHdpbGwgY2hlY2sgaWYgdGhlcmUgaXMgYSBjb250cm9sbGVyCmFs
cmVhZHkgYXR0YWNoZWQgLSBkcm9wIHRoZSBjaGVjayBpbiB0aGUgZHJpdmVyLgoKVXNlIGRybV9w
YW5lbF9nZXRfbW9kZXMoKSBzbyB0aGUgZHJpdmVyIG5vIGxvbmdlciB1c2VzIHRoZSBmdW5jdGlv
bgpwb2ludGVyLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpDYzogSm9vbnlvdW5nIFNoaW0g
PGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgpDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBz
YW1zdW5nLmNvbT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+
CkNjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgpDYzogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHBpLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2RwaS5jCmluZGV4IDNjZWJiMTllYzFjNC4uNTQ3OWZmNzFjYmM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHBpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jCkBAIC00Myw3ICs0Myw3IEBAIGV4eW5vc19k
cGlfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCiB7
CiAJc3RydWN0IGV4eW5vc19kcGkgKmN0eCA9IGNvbm5lY3Rvcl90b19kcGkoY29ubmVjdG9yKTsK
IAotCWlmIChjdHgtPnBhbmVsICYmICFjdHgtPnBhbmVsLT5jb25uZWN0b3IpCisJaWYgKGN0eC0+
cGFuZWwpCiAJCWRybV9wYW5lbF9hdHRhY2goY3R4LT5wYW5lbCwgJmN0eC0+Y29ubmVjdG9yKTsK
IAogCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKQEAgLTg1LDcgKzg1LDcgQEAg
c3RhdGljIGludCBleHlub3NfZHBpX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogCX0KIAogCWlmIChjdHgtPnBhbmVsKQotCQlyZXR1cm4gY3R4LT5wYW5lbC0+ZnVu
Y3MtPmdldF9tb2RlcyhjdHgtPnBhbmVsKTsKKwkJcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMo
Y3R4LT5wYW5lbCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
