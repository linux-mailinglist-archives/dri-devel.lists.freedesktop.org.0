Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FB10F03F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514536E2E4;
	Mon,  2 Dec 2019 19:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29226E2E2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 21so876386ljr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R0f42CF+zwCz/GYqQyt+Coe4IA7I6q2AFYs8+413zO0=;
 b=Jk/zF6U5y51RPHnLxsMr55p1QBBxlI9d/4JzYDvcq6YKfktOxAFyAD2IiybD63naoh
 m2xJQjlSXtKvTx/QJilEHz+955c1HOVbPPARqxus9f3PDA0PKhh5b22O+flENWElv2FN
 dGkmSl1p/aiU2WqupJODZd8j+355tSBz+C+eszcyt1MNCLs5BqACHFd8+TgvQ2k9B0mq
 IV8VehgUspXD4nt1RI/YwUSy1shqBAz5CG8XNgRdrBoQ3ejkKg1WVbrajvb6cYiRWADd
 QPLyDr+UE+mv8IkUkZNKMlp/uRG5i/GxiaUM8eYeFNEzvpsteNj4XCOTknj6iQnDfBCa
 jMRQ==
X-Gm-Message-State: APjAAAW6JHLCCFhpabS5lQEgWS7H3VDfhyD1/CuRxRVVGWzrNO5CqK/P
 mhn9oeo35jolkoV+kHfzekP1oz2HI4tqYA==
X-Google-Smtp-Source: APXvYqwxAoUwLTLEkQUfJnM7DgssO8M84iKQHSB7L3N4qws7EummnIVscFtc8tlydjwAe0u9VpqMAA==
X-Received: by 2002:a2e:b61a:: with SMTP id r26mr271701ljn.72.1575315209849;
 Mon, 02 Dec 2019 11:33:29 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:29 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 13/26] drm/panel: lvds: use drm_panel backlight support
Date: Mon,  2 Dec 2019 20:32:17 +0100
Message-Id: <20191202193230.21310-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0f42CF+zwCz/GYqQyt+Coe4IA7I6q2AFYs8+413zO0=;
 b=lnMtfHUcqZMMTnJ9gMhihKsg3Z/0eU6Y56rSI1jYsRkXy2EkvUclqmRZIEdI6SSSls
 wPP140xvr7sa1QlrV1iWDGiJ2sjuOkm5L3jQ7FOprQIYggBuzus2yGc1yji7zTj2Nl/O
 cAGOkgbft8rYkYZO8jIVy0IlYiloAfroxD7cWixqmRgTvqmKArka4CvLU0mzj499zQx8
 FJXuUfypTKn7fF2KJwWXlBTvu/WBeYYZxkGmc2iVRMKkGl5lbRPz/4sYiwtyYzLrQxsq
 B9WctI7d/M9bU3H43w9MGzdywkaqP47fHiAPW0Iet8HaUHiDfVL5BPF4qETjJfe8WPzZ
 LLog==
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
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZk
cy5jIHwgNDAgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2
ZHMuYwppbmRleCA1ZTQwYjY3NGJiMTUuLjVjZTNmNGEyYjdhMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtbHZkcy5jCkBAIC04LDcgKzgsNiBAQAogICogQ29udGFjdDogTGF1cmVudCBQaW5jaGFy
dCAobGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tKQogICovCiAKLSNpbmNsdWRlIDxs
aW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+CiAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KQEAg
LTM0LDcgKzMzLDYgQEAgc3RydWN0IHBhbmVsX2x2ZHMgewogCXVuc2lnbmVkIGludCBidXNfZm9y
bWF0OwogCWJvb2wgZGF0YV9taXJyb3I7CiAKLQlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFj
a2xpZ2h0OwogCXN0cnVjdCByZWd1bGF0b3IgKnN1cHBseTsKIAogCXN0cnVjdCBncGlvX2Rlc2Mg
KmVuYWJsZV9ncGlvOwpAQCAtNDYsMTkgKzQ0LDYgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFu
ZWxfbHZkcyAqdG9fcGFuZWxfbHZkcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlyZXR1cm4g
Y29udGFpbmVyX29mKHBhbmVsLCBzdHJ1Y3QgcGFuZWxfbHZkcywgcGFuZWwpOwogfQogCi1zdGF0
aWMgaW50IHBhbmVsX2x2ZHNfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKLXsKLQlz
dHJ1Y3QgcGFuZWxfbHZkcyAqbHZkcyA9IHRvX3BhbmVsX2x2ZHMocGFuZWwpOwotCi0JaWYgKGx2
ZHMtPmJhY2tsaWdodCkgewotCQlsdmRzLT5iYWNrbGlnaHQtPnByb3BzLnBvd2VyID0gRkJfQkxB
TktfUE9XRVJET1dOOwotCQlsdmRzLT5iYWNrbGlnaHQtPnByb3BzLnN0YXRlIHw9IEJMX0NPUkVf
RkJCTEFOSzsKLQkJYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMobHZkcy0+YmFja2xpZ2h0KTsKLQl9
Ci0KLQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGludCBwYW5lbF9sdmRzX3VucHJlcGFyZShzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3QgcGFuZWxfbHZkcyAqbHZkcyA9IHRvX3Bh
bmVsX2x2ZHMocGFuZWwpOwpAQCAtOTMsMTkgKzc4LDYgQEAgc3RhdGljIGludCBwYW5lbF9sdmRz
X3ByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRp
YyBpbnQgcGFuZWxfbHZkc19lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCi17Ci0Jc3Ry
dWN0IHBhbmVsX2x2ZHMgKmx2ZHMgPSB0b19wYW5lbF9sdmRzKHBhbmVsKTsKLQotCWlmIChsdmRz
LT5iYWNrbGlnaHQpIHsKLQkJbHZkcy0+YmFja2xpZ2h0LT5wcm9wcy5zdGF0ZSAmPSB+QkxfQ09S
RV9GQkJMQU5LOwotCQlsdmRzLT5iYWNrbGlnaHQtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfVU5C
TEFOSzsKLQkJYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMobHZkcy0+YmFja2xpZ2h0KTsKLQl9Ci0K
LQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGludCBwYW5lbF9sdmRzX2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX3BhbmVsICpwYW5lbCwKIAkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQog
ewpAQCAtMTMyLDEwICsxMDQsOCBAQCBzdGF0aWMgaW50IHBhbmVsX2x2ZHNfZ2V0X21vZGVzKHN0
cnVjdCBkcm1fcGFuZWwgKnBhbmVsLAogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wYW5l
bF9mdW5jcyBwYW5lbF9sdmRzX2Z1bmNzID0gewotCS5kaXNhYmxlID0gcGFuZWxfbHZkc19kaXNh
YmxlLAogCS51bnByZXBhcmUgPSBwYW5lbF9sdmRzX3VucHJlcGFyZSwKIAkucHJlcGFyZSA9IHBh
bmVsX2x2ZHNfcHJlcGFyZSwKLQkuZW5hYmxlID0gcGFuZWxfbHZkc19lbmFibGUsCiAJLmdldF9t
b2RlcyA9IHBhbmVsX2x2ZHNfZ2V0X21vZGVzLAogfTsKIApAQCAtMjQyLDEwICsyMTIsNiBAQCBz
dGF0aWMgaW50IHBhbmVsX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAkJcmV0dXJuIHJldDsKIAl9CiAKLQlsdmRzLT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFj
a2xpZ2h0KGx2ZHMtPmRldik7Ci0JaWYgKElTX0VSUihsdmRzLT5iYWNrbGlnaHQpKQotCQlyZXR1
cm4gUFRSX0VSUihsdmRzLT5iYWNrbGlnaHQpOwotCiAJLyoKIAkgKiBUT0RPOiBIYW5kbGUgYWxs
IHBvd2VyIHN1cHBsaWVzIHNwZWNpZmllZCBpbiB0aGUgRFQgbm9kZSBpbiBhIGdlbmVyaWMKIAkg
KiB3YXkgZm9yIHBhbmVscyB0aGF0IGRvbid0IGNhcmUgYWJvdXQgcG93ZXIgc3VwcGx5IG9yZGVy
aW5nLiBMVkRTCkBAIC0yNTcsNiArMjIzLDEwIEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWRybV9wYW5lbF9pbml0KCZsdmRzLT5w
YW5lbCwgbHZkcy0+ZGV2LCAmcGFuZWxfbHZkc19mdW5jcywKIAkJICAgICAgIERSTV9NT0RFX0NP
Tk5FQ1RPUl9MVkRTKTsKIAorCXJldCA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQoJmx2ZHMtPnBh
bmVsKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJcmV0ID0gZHJtX3BhbmVsX2FkZCgm
bHZkcy0+cGFuZWwpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwpAQCAtMjcxLDcgKzI0
MSw3IEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAogCWRybV9wYW5lbF9yZW1vdmUoJmx2ZHMtPnBhbmVsKTsKIAotCXBhbmVsX2x2
ZHNfZGlzYWJsZSgmbHZkcy0+cGFuZWwpOworCWRybV9wYW5lbF9kaXNhYmxlKCZsdmRzLT5wYW5l
bCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
