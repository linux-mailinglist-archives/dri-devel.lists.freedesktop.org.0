Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273F80C50
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4AF89D58;
	Sun,  4 Aug 2019 20:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0C189D58
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u10so17589882lfm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XKQ+KJdp8Wv4Lgd7meexm5skjc2BjgchimNFn7JqqdA=;
 b=VqEGGtHsNXV/6vMV3Jn9uuJWQwDOOzMUsv1aKFFznRccPxnjO/q9bo6LXHjjJHAN0O
 ffTpYMzNEaojZ80wADiuMLrMaXvv/p4kq9yYOIKGxtN0gZdBLFMUO+I9vVcqELKwpx8U
 SdheQf7Wn2ER+XDdcCNWVorQok2MKJ4zw6tFrwsZ46d7oTekULw8UuWbSWARB6/EXo23
 iiXiYrg+wX/A+EfgK+K13LKaCFKssr8u6uPoxTBtmCpz4TPsEEWglcwrAIR5MxW8zd9l
 4QWp8Z03j1mmie0ve1LVMG57bIfBB90VkhMXizj0UHycLk0r+cDKB+07iSfnvZVW2otn
 8ddg==
X-Gm-Message-State: APjAAAX0MTE23lsGl2HFEYxBFYZSZIiSZhlGwgE2f7cSapz3LQSTUdCN
 39ZUw8MMSt9cLNRlwXJz1C7BxjJ++kceBQ==
X-Google-Smtp-Source: APXvYqyao7EZANem5EL9cjm0IVmoUZr8fWYB9FLYhw/F/m5O3hktZo8Fs57Jvrx6gfI76gcjrnUKZw==
X-Received: by 2002:a19:c711:: with SMTP id x17mr69469503lff.147.1564949821600; 
 Sun, 04 Aug 2019 13:17:01 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.16.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:01 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 01/16] drm/bridge: tc358767: fix opencoded use of
 drm_panel_*
Date: Sun,  4 Aug 2019 22:16:22 +0200
Message-Id: <20190804201637.1240-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XKQ+KJdp8Wv4Lgd7meexm5skjc2BjgchimNFn7JqqdA=;
 b=EMDl7m7xtcbiDX6T4zT9T9Oup48SB92u6hjZvbuUDysrvQ2LKT045bww+uGPRJ/wGS
 Xx9dvfCti+h8c3UbT9/vPUIBcFzKt/YnuegL1QMuENQBV1IDlbyEjCcBPVarMC4LPjqX
 2wJ/ko+exxrT8tGNbUyBXLEa3NdBap2PBiUUsZszcYc1q4mfZqrxZ1V3oXBda0LvlPu1
 nAk6RBnwnq/4JPkevOBldmHhgFYKce/qePV0wDsZ4RcHAs8Kx/0/yWesR12likoYCkG7
 qN1LiIhpYBG1MXL6JIwlhuDKzdtU9xdeprPv16WXN39mw2pQ6uz/KDJoZ0lPydP2x26B
 eZMw==
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

UmVwbGFjZSBvcGVuIGNvZGVkIHZlcnNpb24gd2l0aCBjYWxsIHRvIGRybV9wYW5lbF9nZXRfbW9k
ZXMoKS4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28u
c2U+CkNjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgMTAgKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMKaW5kZXggNDJmMDNhOTg1YWMwLi5jZWJjOGU2MjA4MjAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMKQEAgLTEzMTIsNyArMTMxMiw3IEBAIHN0YXRpYyBpbnQgdGNfY29ubmVj
dG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVj
dCB0Y19kYXRhICp0YyA9IGNvbm5lY3Rvcl90b190Yyhjb25uZWN0b3IpOwogCXN0cnVjdCBlZGlk
ICplZGlkOwotCXVuc2lnbmVkIGludCBjb3VudDsKKwlpbnQgY291bnQ7CiAJaW50IHJldDsKIAog
CXJldCA9IHRjX2dldF9kaXNwbGF5X3Byb3BzKHRjKTsKQEAgLTEzMjEsMTEgKzEzMjEsOSBAQCBz
dGF0aWMgaW50IHRjX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikKIAkJcmV0dXJuIDA7CiAJfQogCi0JaWYgKHRjLT5wYW5lbCAmJiB0Yy0+cGFuZWwt
PmZ1bmNzICYmIHRjLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykgewotCQljb3VudCA9IHRjLT5w
YW5lbC0+ZnVuY3MtPmdldF9tb2Rlcyh0Yy0+cGFuZWwpOwotCQlpZiAoY291bnQgPiAwKQotCQkJ
cmV0dXJuIGNvdW50OwotCX0KKwljb3VudCA9IGRybV9wYW5lbF9nZXRfbW9kZXModGMtPnBhbmVs
KTsKKwlpZiAoY291bnQgPiAwKQorCQlyZXR1cm4gY291bnQ7CiAKIAllZGlkID0gZHJtX2dldF9l
ZGlkKGNvbm5lY3RvciwgJnRjLT5hdXguZGRjKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
