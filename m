Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876B80C61
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07ED89E38;
	Sun,  4 Aug 2019 20:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2F989E35
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:20 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y17so52880487ljk.10
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yel48h0qo2wbp0mM+rNqpesYnmUiIUwuFRYEGRdGqyc=;
 b=Ei304Ffim2YLRUKUM3JAACph9iQT/8RBOld+sWdEAgClp3PT5y5T4QPbViYSg8ReCl
 COHKouQ3Ff5O9oBEVoxlT8rDMXziVQ/xzUS++aaT4uPkS/6+nRwnzRBMvO5oQmd5YQ44
 EHutZuqeNxIgn5BWhG4A6ak/+bgJhgNJ2qIZgyJf+n6EQvahaKSmGzq+EwO5UiyTiFPe
 EBY9WJvyPKfJn1SpiiMiO6CCTD/P7LCqtlSUUSQq7N390cH1DvYMQmzIkD3uorsd2pr5
 UOdeoAMawdp3nWRK0qhfiyID4pZaUvTKqHIJM/PCsJM2QVGr/dXuyGKM9BDDvqVKgk1f
 DXuQ==
X-Gm-Message-State: APjAAAWUS0AuYkgi0CT46Kv0Ti0lFz2i9IrMGilHPseFqDaYAMbkWydT
 h/BKGHcWE/19dWUI6DYvI4fxZu35tTp8SQ==
X-Google-Smtp-Source: APXvYqxdGxd0F02kFmQDzjnepawHElytfS6OgwAwlzDKWRLVxKsqajzgR4P7dB62VuLk5D8PL5TcOg==
X-Received: by 2002:a2e:88d3:: with SMTP id a19mr29864312ljk.32.1564949838298; 
 Sun, 04 Aug 2019 13:17:18 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:17 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 06/16] drm/msm: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:27 +0200
Message-Id: <20190804201637.1240-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yel48h0qo2wbp0mM+rNqpesYnmUiIUwuFRYEGRdGqyc=;
 b=RhcmWOYNugg3RhzTq+cei+ZzJ5PbMDYuydezLvh4SzkEdVGuUstINi6mF3JdxqSgHE
 vt/tTDGSa1SEDKK2uctzf8Q7x2lA/At+dJJvONXAfw1PG5quso6A1CYppTRQmjq2Mztz
 8+QesDo5Y3z8q6FOM3FS99qDTyn9eq0bJZAAqangO3/ERv+ON6doIPb4/KiuSEd+wtXi
 tJ+Td+ky5MuQfpIn1AOxC7vWgtQI6QRzHg+odjRtEyUsSQvmNFrXrQU7NFPkrkmguzMt
 nJHPyyRqYLsguHOCJz+yVza9xugy775zludTZthdBmnpUbY+21C3bNWQ8WuAZTw3PPVj
 S+AQ==
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

VXNlIHRoZSBmdW5jdGlvbiBkcm1fcGFuZWxfZ2V0X21vZGVzKCkuCgpTaWduZWQtb2ZmLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBBbGV4aW9zIFphdnJhcyA8YWxleGlv
cy56YXZyYXNAaW50ZWwuY29tPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+CkNjOiBBbGxpc29uIFJhbmRhbCA8YWxsaXNvbkBsb2h1dG9rLm5ldD4KQ2M6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEVucmljbyBXZWlnZWx0IDxpbmZvQG1ldHV4Lm5l
dD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29ubmVjdG9y
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29u
bmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29ubmVj
dG9yLmMKaW5kZXggZWNlZjRmNWI5ZjI2Li4wZTIxMjUyZmQxZDYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfbHZkc19jb25uZWN0b3IuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29ubmVjdG9yLmMKQEAgLTU1LDcg
KzU1LDcgQEAgc3RhdGljIGludCBtZHA0X2x2ZHNfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCWlmIChwYW5lbCkgewogCQlkcm1fcGFuZWxfYXR0
YWNoKHBhbmVsLCBjb25uZWN0b3IpOwogCi0JCXJldCA9IHBhbmVsLT5mdW5jcy0+Z2V0X21vZGVz
KHBhbmVsKTsKKwkJcmV0ID0gZHJtX3BhbmVsX2dldF9tb2RlcyhwYW5lbCk7CiAKIAkJZHJtX3Bh
bmVsX2RldGFjaChwYW5lbCk7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
