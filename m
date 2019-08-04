Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47680C57
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4703C89E1B;
	Sun,  4 Aug 2019 20:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC48589E1B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y17so52880281ljk.10
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1TEXaZ1KpdAoiO85boEPTBxnq8MPM5bbeG78Znsg1kk=;
 b=qnpWLbsWNvrhSZlBBsQc3uSlLeg9DqFSG9a8nzq74SWWUBKuQATN1Q4tTxM/pV5w32
 bBrRjj/Q5XdflOFigzxsq1+nGVoKJoX5/QLv9eXXCxzPloawgi8JeQMrx0nUa0H+a91Y
 rgpHNsgS37uZ5SXah8vGUxXRFZk/XDkBsHE8SSDFB+aYlF+kJBt7qMeYB2DAxvfMUpZu
 XbfsYiSvEEGxFz3PkrtAlu3lxNYwpIcK11drj2WKp7DeT0nQwwcnM32l2wmqyGMdZ3KG
 HPTLMMXvHDNoBlQH4dOGDS8XMIcVHhB/viBm9RT8CR7kgPjBcO8rJFOLxOtisrTvuP03
 G11Q==
X-Gm-Message-State: APjAAAWMwlhyYhTuZ4wTNZa5UjuzZ6JBoHS718PyQ3MC2pT11Hf4PQqS
 rCEKMEMVZG+fDXgR5eyPPtKYrE85B4Bk9Q==
X-Google-Smtp-Source: APXvYqyX2DV4pg4STFder0QLYZxjB3cRp7z66cR5BIB23ZVo0ZMYOEKaRseLqKMG0kPOviSdCK01aQ==
X-Received: by 2002:a2e:3211:: with SMTP id y17mr38833847ljy.86.1564949828875; 
 Sun, 04 Aug 2019 13:17:08 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:08 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 03/16] drm/exynos: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:24 +0200
Message-Id: <20190804201637.1240-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TEXaZ1KpdAoiO85boEPTBxnq8MPM5bbeG78Znsg1kk=;
 b=UY9E/BN/VsoWEhEtkdN8SUZ6JHfj/MBgZgo1KwFNcuBN2pN7TOGU5AbsZbBMQBBMp/
 +KPl14S0+PYrY1NlQyBlfArZikLv53LGe2G/hMahk+c88DAkGoN1qgt0F0pIFL6MlC69
 Lcg7RTaWFBAx4PfmCtkLgYHY73b8PSgMP9+nEJT1uYEv3otLP4iBzlNGlEbAcG98zDQZ
 E6yypKdyIS1mOqIB1qbZbUit/9wBYgZ6PRdzJSzvLpvas00dvht3i0+tzIDnbOuyzH3p
 RAn2m/o5JiW0VANG9Eoc7to6esERy5lprBeYjTpFb798pyI2UJNt8Ef9POkUjSlMe9BK
 Z98A==
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

Q2FsbCB2aWEgZHJtX3BhbmVsX2dldF9tb2RlcygpLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29t
PgpDYzogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgpDYzogU2V1bmct
V29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5n
bWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgpD
YzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgpDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5l
bC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKaW5kZXggNjkyNmNlZTkxYjM2Li4zNmIwMmI0
NTZkOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2ku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKQEAgLTE0NjAs
NyArMTQ2MCw3IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9nZXRfbW9kZXMoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZXh5bm9zX2RzaSAqZHNpID0gY29ubmVjdG9y
X3RvX2RzaShjb25uZWN0b3IpOwogCiAJaWYgKGRzaS0+cGFuZWwpCi0JCXJldHVybiBkc2ktPnBh
bmVsLT5mdW5jcy0+Z2V0X21vZGVzKGRzaS0+cGFuZWwpOworCQlyZXR1cm4gZHJtX3BhbmVsX2dl
dF9tb2Rlcyhkc2ktPnBhbmVsKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
