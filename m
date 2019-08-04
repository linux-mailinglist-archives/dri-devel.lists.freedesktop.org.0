Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E4D80C5F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B726E89E2B;
	Sun,  4 Aug 2019 20:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4167089E2B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k18so77399514ljc.11
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WgVzWcgmLIPnyZKomZGLKI2l35SfEezC0RuGRG5g/EI=;
 b=DnqvG9L3/OeQIss1k/+pohqtFQcHiGS1CI+ZhhC3zwSqlQnTB2NAQHFaT4Atyg4KF9
 w1F0BB2Rd/S4YYo5Cig+pWRzGLb+hKXLqOuPBa6MzloNP+wyASqzz0m0PqPvrAHVBlnh
 2906k7lp4Wnk75fLne1/0dr92S0rTayQIqIeKOT+AFlQMmwmeaCZR1ffKzay5WxE61hY
 af+5ayHo+nXPrMr4NGajshsIEGiUp9+ov9Gt8nbt6RXZB0YF6zlbsmQg1WyR6NPR5H9P
 +LGhnOiYR/fgnDzTEsid7V3dZniuS6mgXQIjmKyygKAv7sCf3zcoFAlMsT+zqdW8a5I7
 AAyw==
X-Gm-Message-State: APjAAAWJbj+M2B9SYXar82xuJzi8/R5oAZsNdWo0so74xFjMMFpqHrB4
 enTFo+kwvxJVv4OyaVz2vGJTz+1HslabQw==
X-Google-Smtp-Source: APXvYqwud3tPWGlx2rT6WRxi5qtgEVcIyAyTabZz4LeIPtVV4R4zHjIsHNXrxj2gWB7phumt4Zx9PQ==
X-Received: by 2002:a2e:854d:: with SMTP id u13mr78583687ljj.236.1564949835418; 
 Sun, 04 Aug 2019 13:17:15 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:14 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:26 +0200
Message-Id: <20190804201637.1240-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgVzWcgmLIPnyZKomZGLKI2l35SfEezC0RuGRG5g/EI=;
 b=Brv6b6OXXGcKeKH38lJ761HH0YTn5I9O/tREug6fGjyWJ+NCJsVZQvPQM7DlX+nsR6
 WA6HO+Rv7vxjU15u7L1NOWrHWicKyXbrTATlAAXAD8yRFsCg2XGn4VI2lwGp8s6DpiMn
 E+QAS5oYqtk6XgBCtudTDF/nIQ0Muy9Gmk0WQyu31aBZVKM5gvbZmkz16wMGlkqAX8tT
 wSS/p1pcWPPdgD67sqBEd7oUFfCCBGs7Y8NUSBCmu45zwvTYB7/dsrGKfXnKQEvSnQFP
 hjVSneDQ7YRnHrxMyOpJIf7d8FN3ltIdMphdq4MyGP2KAGXagMIV58euOaKS9DGq1EgA
 VMKA==
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

VXNlIGRybV9wYW5lbF9nZXRfbW9kZXMoKSB0byBhY2Nlc3MgbW9kZXMuClRoaXMgaGFzIGEgbmlj
ZSBzaWRlIGVmZmVjdCB0byBzaW1wbGlmeSB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVy
LmNoPgpDYzogQWxpc29uIFdhbmcgPGFsaXNvbi53YW5nQG54cC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgfCAxMCArLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZnNsLWRjdS9mc2xfZGN1X2RybV9yZ2IuYwppbmRleCAyNzlkODNlYWZmYzAuLmE5MmZkNmM3MGIw
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMKQEAgLTY1LDE3
ICs2NSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBmc2xfZGN1
X2RybV9jb25uZWN0b3JfZnVuY3MgPSB7CiBzdGF0aWMgaW50IGZzbF9kY3VfZHJtX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlzdHJ1Y3Qg
ZnNsX2RjdV9kcm1fY29ubmVjdG9yICpmc2xfY29ubmVjdG9yOwotCWludCAoKmdldF9tb2Rlcyko
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwotCWludCBudW1fbW9kZXMgPSAwOwogCiAJZnNsX2Nv
bm5lY3RvciA9IHRvX2ZzbF9kY3VfY29ubmVjdG9yKGNvbm5lY3Rvcik7Ci0JaWYgKGZzbF9jb25u
ZWN0b3ItPnBhbmVsICYmIGZzbF9jb25uZWN0b3ItPnBhbmVsLT5mdW5jcyAmJgotCSAgICBmc2xf
Y29ubmVjdG9yLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykgewotCQlnZXRfbW9kZXMgPSBmc2xf
Y29ubmVjdG9yLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlczsKLQkJbnVtX21vZGVzID0gZ2V0X21v
ZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKLQl9Ci0KLQlyZXR1cm4gbnVtX21vZGVzOworCXJl
dHVybiBkcm1fcGFuZWxfZ2V0X21vZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKIH0KIAogc3Rh
dGljIGludCBmc2xfZGN1X2RybV9jb25uZWN0b3JfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
