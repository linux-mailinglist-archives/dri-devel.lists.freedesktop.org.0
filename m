Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE3880C6C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5718D89E57;
	Sun,  4 Aug 2019 20:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16C389E5A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 62so51486157lfa.8
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wk6pfousIAMCDI6Uyo+lM1td1MgXZzePdo2c6E2Onic=;
 b=hsK+Hoqp7C/D+qiWCjMdZGt7Wt1tXhNzC7UKXM0MNCqUx8c39xA3iul3D3qVCA8l82
 LxDAGpJtHfrrpsO9BlGLMKeFxA2vDFnb6yWRF8v8sWLu3IpunDF6t/uxAHKNlD7W0lfo
 6X6dvW8LQiu72gnkUAbv5w3Xf02Y1ngEXTYcVG1CQoBHBKwQ40KnSdErffVU5IAL8BtJ
 oaroL00c6Kkc4j/z2c2Lr3R5MUa5LPyYeMXxl+aVLdbr5csxY22qDzdFiIkT53m9Pwyl
 bEopZ7Zt8bi4fY/OQHa3E0fnnn2UPg6Tuzy0l3WtGeNnrCM7GWxUBb0hOb43za1767Q7
 EEPw==
X-Gm-Message-State: APjAAAUEjkP3EiQ+V7oTH98oufD1lzNcnC7lOc9eS5OqoXVDt1nrE0kS
 XtQJ/8vwpf2bNG0KAs7F0M2icpGrAReLsg==
X-Google-Smtp-Source: APXvYqyLrFVeZI/lzYw2iRoU+pX5u/EBCoveXbxfKssjwJUGzKx1R2K/aZs1vIVE+lwZRLrksTI4Hg==
X-Received: by 2002:ac2:5dc3:: with SMTP id x3mr30142069lfq.168.1564949846990; 
 Sun, 04 Aug 2019 13:17:26 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:26 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 09/16] drm/tegra: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:30 +0200
Message-Id: <20190804201637.1240-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wk6pfousIAMCDI6Uyo+lM1td1MgXZzePdo2c6E2Onic=;
 b=tOCty/gZdEJZyOP/LNSmnWRovYxXff7HblVK8JBUwNKGrmTZ+mYA0XLKKLgk4z4yh/
 fBO9mOHvoad0V1tr1vvpw8D9YeCxA6tK5vJcEFMZJnwPoPsbHn+HSREVKkWjPSp9hJxn
 6O+7mFpQuChXeq8lCOSF1rKrQa9RJOuWSEaLRkkGuFO5ra4yL2+dKAYsbR4/XMyVHkWy
 Z1ut/fRIY+7glcUvkTmq+AArGP1m25gmupSXINZcKexEnrAEP9Y2L6S8eT5ly7N5HAK1
 H6xR/uxZns5l6A8wH2ZL1OO1aRJCaRQSPfhd90PwVcC82louRVZsNLqZAULk7h65wV5X
 uqYg==
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

VXNlIHRoZSBkcm1fcGFuZWxfZ2V0X21vZGVzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4KQ2M6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5j
b20+CkNjOiBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvb3V0cHV0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKaW5kZXggMjc0Y2I5NTVlMmUxLi41MmI4
Mzk2ZWMyZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKQEAgLTIzLDcgKzIzLDcgQEAgaW50IHRl
Z3JhX291dHB1dF9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiAJICogaWdub3JlIGFueSBvdGhlciBtZWFucyBvZiBvYnRhaW5pbmcgYSBtb2RlLgog
CSAqLwogCWlmIChvdXRwdXQtPnBhbmVsKSB7Ci0JCWVyciA9IG91dHB1dC0+cGFuZWwtPmZ1bmNz
LT5nZXRfbW9kZXMob3V0cHV0LT5wYW5lbCk7CisJCWVyciA9IGRybV9wYW5lbF9nZXRfbW9kZXMo
b3V0cHV0LT5wYW5lbCk7CiAJCWlmIChlcnIgPiAwKQogCQkJcmV0dXJuIGVycjsKIAl9Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
