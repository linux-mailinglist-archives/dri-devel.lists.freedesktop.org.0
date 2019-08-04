Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B813680C62
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970C89E3B;
	Sun,  4 Aug 2019 20:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AE489E3B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:23 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u10so17590132lfm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OxHLOBnK1lNWSIGtczNLCozsQ3QtlSsdUZb5LP3kT0Y=;
 b=T19aayB3vGgE58rgxZ2upreUjxhn8+WuqQABojY8xeEjE92qLoW8bNO2zHY79/OaDR
 gAJ+lu51gVbSeZDNemopWRGI836jew83fTv7UO7AxhJbDXKdphxxo9FMzEjmWMnlJYHG
 R4K246WOJOQ2umeodtEj8Q8vZxfaPLv6M4/btUGIfpGJljPxQ0nCU6BNlVGTx3e3L8zN
 s+xD7XQTVmAYsv5lIoQRIZCSUvI3z/N/aihsp5gvBNGsPzKNPkC7h1YQ9y/gBLBgO+d4
 kXqtfWELd73GbZ43qJd5vYuntJVDF336jUzcAWJ76eoULwhvz5OHHVkT2mIgvGpMpCdr
 kb3w==
X-Gm-Message-State: APjAAAV/Df22V9lnXW+hAG2fmzCowhgD4s0Wp5vx5uBR+i0vpI8fl2fy
 R0SJ3Jgu4jXub7dSbH0n9yo7tXQMeMOt7Q==
X-Google-Smtp-Source: APXvYqz3M5CTobM4ucLU8BcfTgw1LTrA2m/uc+fEekEh6iImfAPIvEukRCN6dkkcG2PkH6QhUumtFg==
X-Received: by 2002:ac2:4242:: with SMTP id m2mr7496505lfl.121.1564949841198; 
 Sun, 04 Aug 2019 13:17:21 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:20 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 07/16] drm/mxsfb: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:28 +0200
Message-Id: <20190804201637.1240-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxHLOBnK1lNWSIGtczNLCozsQ3QtlSsdUZb5LP3kT0Y=;
 b=gAaQXpYAm1KYEI8rTb/OJS5eorTrd92AMU7Pgi3cS8X6yqya7FjBl9kj9ebkyM+BQ/
 kG4QjvdGy6WXSKN7R/ZQNoAxeSgQCgA1VuMB+nBFs6rk8efjjkFyzh2SrNKwlNtKxRv2
 iqFdb18qXUBYcmOjBQMer7IjewoVURBwU1mO6clB1CjpoYwMbL0dpBv5c5OlKDDciWGs
 +6s7JssXa+Tp4Fw6Xv9rE4h/pvUSUTj+AGdJZ0Y1bIflrUTi9w/c11SxgFj2XGUzbSor
 Ih7r/DdnsvWE0Xa5m0vqrhXL8QpXxKHJ2L7jKQ5/4zZoKB6An4mvQ34TzIHSV8u5sEtD
 kaxg==
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

VXNlIHRoZSBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4KQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgpDYzogU2hhd24gR3VvIDxz
aGF3bmd1b0BrZXJuZWwub3JnPgpDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4
LmRlPgpDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4K
Q2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KQ2M6IE5YUCBMaW51eCBUZWFt
IDxsaW51eC1pbXhAbnhwLmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9vdXQuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9vdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9vdXQuYwppbmRleCAyMzFkMDE2YzZmNDcuLmJlMzZmNGQ2Y2M5NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9vdXQuYwpAQCAtMzAsNyArMzAsNyBAQCBzdGF0aWMgaW50IG14c2ZiX3BhbmVs
X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQkJZHJtX2Nvbm5l
Y3Rvcl90b19teHNmYl9kcm1fcHJpdmF0ZShjb25uZWN0b3IpOwogCiAJaWYgKG14c2ZiLT5wYW5l
bCkKLQkJcmV0dXJuIG14c2ZiLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcyhteHNmYi0+cGFuZWwp
OworCQlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2RlcyhteHNmYi0+cGFuZWwpOwogCiAJcmV0dXJu
IDA7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
