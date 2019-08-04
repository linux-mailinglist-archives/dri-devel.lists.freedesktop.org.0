Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF37680C5C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F5189E23;
	Sun,  4 Aug 2019 20:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C11C89E23
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r9so77431285ljg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OqhXxXwy9Hr3xWItmkC0WnCOZqEhN5kTgjtJyN6Z+CY=;
 b=m+HaaaTdgwtHJzTPYx2LG57bWppAjgEFB+3v5yHOxn2XOdUk+0kCN75Kziaswxr+G2
 RznBAmLd8MRIjUJ7sUtqNMOiduGb0S3mBDU1ojJp7oUQmN5oTNKw0zpd56JL0J+sAPdI
 SpNx+ysmSgRT5IghrtuF5u+ti8o2vhDbPeUpD8YoN6DSp71b+pGvdxJ6E3Nz0bWzpcjB
 OirwajZkxOWNF3JwdPDUQdMYa7g4aBQsujPg27OMtbAmF94+Mj30ZvFfKdOfWqKUdP88
 qzWzby5nzQ9SSJjU94IOgY3W/+0tWzapo+lNJ1sWfuGKtMNabzuPDkOTVWCAE9D3fLQD
 sJgg==
X-Gm-Message-State: APjAAAWkV9+dfkDUIDUevdNYWS8r5UY3JAdHlRpXWXX2DOs7FUFeHAHH
 xpTqR/J1KnGHxiLGz1D7G+rBzNqkKtEp/g==
X-Google-Smtp-Source: APXvYqwr7YURU5x5uQX4eMotoB3lQEWzubIKRtOF0qGU+ymuvCnRLcgiy7sxe5BsFuWKIZGt+qJn3A==
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr35048878ljj.129.1564949832447; 
 Sun, 04 Aug 2019 13:17:12 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:11 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 04/16] drm/imx: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:25 +0200
Message-Id: <20190804201637.1240-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqhXxXwy9Hr3xWItmkC0WnCOZqEhN5kTgjtJyN6Z+CY=;
 b=NLLRFWKzJmEIu9OTOt7Ai8tctMWnGdjeyEFU+bfOuWd3AgIJwVV5bg33IJmsvBZup+
 JybThz+nVWyyLhyxpWRvRVqVGJqJtDYU59QsXSfu+zCyvbOcabGJOut4KqbsMVWxIH4Z
 tW+Tv7tICzEJDkmjcIBJSlRM1z6IOKUpkGKIAU/4Ybs703WZbR3nNjvMr3m+CkOHkc17
 Rb4XRehU55J1G+MqL6y4FTAHHomaoEOikxlyWWWJtnnFAqOmZ710XFHX0eWXQQL7lRT1
 f/jZm/vh9FmhUey+YmveVXZdx/reIWL8VTKKHRLpUUQZGISW6Eyybhr/rBDd1ODzkPPO
 8Y7Q==
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

VXNlIHRoZSBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgZnVuY3Rpb24gdG8gZ2V0IHRoZSBtb2Rlcy4K
ClRoaXMgcGF0Y2ggbGVhdmUgb25lIHRlc3QgZm9yIHRoZSBmdW5jdGlvbiBwb2ludGVyOgogICAg
cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMKClRoaXMgaXMgdXNlZCB0byBjaGVjayBpZiB0aGUgcGFu
ZWwgbWF5IGhhdmUgYW55IG1vZGVzLgpUaGVyZSBpcyBubyBkaXJlY3QgcmVwbGFjZW1lbnQuCldl
IG1heSBiZSBhYmxlIHRvIGp1c3QgY2hlY2sgdGhhdCBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgcmV0
dXJuID4gMCwKYnV0IGFzIHRoaXMgaXMgbm90IHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgaXQgaXMg
bGVmdCBmb3IgbGF0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogU2hh
d24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgpDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBl
bmd1dHJvbml4LmRlPgpDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRy
b25peC5kZT4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KQ2M6IE5YUCBM
aW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jICAgICAgICAg
IHwgMTEgKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5j
IHwgMTEgKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jCmluZGV4IGRiNDYxYjZhMjU3Zi4uNjk1ZjMw
N2YzNmIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYwpAQCAtMTI0LDE0ICsxMjQsMTEgQEAgc3RhdGlj
IHZvaWQgaW14X2xkYl9jaF9zZXRfYnVzX2Zvcm1hdChzdHJ1Y3QgaW14X2xkYl9jaGFubmVsICpp
bXhfbGRiX2NoLAogc3RhdGljIGludCBpbXhfbGRiX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlzdHJ1Y3QgaW14X2xkYl9jaGFubmVsICpp
bXhfbGRiX2NoID0gY29uX3RvX2lteF9sZGJfY2goY29ubmVjdG9yKTsKLQlpbnQgbnVtX21vZGVz
ID0gMDsKKwlpbnQgbnVtX21vZGVzOwogCi0JaWYgKGlteF9sZGJfY2gtPnBhbmVsICYmIGlteF9s
ZGJfY2gtPnBhbmVsLT5mdW5jcyAmJgotCSAgICBpbXhfbGRiX2NoLT5wYW5lbC0+ZnVuY3MtPmdl
dF9tb2RlcykgewotCQludW1fbW9kZXMgPSBpbXhfbGRiX2NoLT5wYW5lbC0+ZnVuY3MtPmdldF9t
b2RlcyhpbXhfbGRiX2NoLT5wYW5lbCk7Ci0JCWlmIChudW1fbW9kZXMgPiAwKQotCQkJcmV0dXJu
IG51bV9tb2RlczsKLQl9CisJbnVtX21vZGVzID0gZHJtX3BhbmVsX2dldF9tb2RlcyhpbXhfbGRi
X2NoLT5wYW5lbCk7CisJaWYgKG51bV9tb2RlcyA+IDApCisJCXJldHVybiBudW1fbW9kZXM7CiAK
IAlpZiAoIWlteF9sZGJfY2gtPmVkaWQgJiYgaW14X2xkYl9jaC0+ZGRjKQogCQlpbXhfbGRiX2No
LT5lZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaW14X2xkYl9jaC0+ZGRjKTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jIGIvZHJpdmVycy9n
cHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKaW5kZXggMmU1MWIyZmFkZTc1Li5lN2NlMTc1
MDNhZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jCkBAIC00NywxNCAr
NDcsMTEgQEAgc3RhdGljIGludCBpbXhfcGRfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBpbXhfcGFyYWxsZWxfZGlzcGxheSAq
aW14cGQgPSBjb25fdG9faW14cGQoY29ubmVjdG9yKTsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
ID0gaW14cGQtPmRldi0+b2Zfbm9kZTsKLQlpbnQgbnVtX21vZGVzID0gMDsKKwlpbnQgbnVtX21v
ZGVzOwogCi0JaWYgKGlteHBkLT5wYW5lbCAmJiBpbXhwZC0+cGFuZWwtPmZ1bmNzICYmCi0JICAg
IGlteHBkLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykgewotCQludW1fbW9kZXMgPSBpbXhwZC0+
cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMoaW14cGQtPnBhbmVsKTsKLQkJaWYgKG51bV9tb2RlcyA+
IDApCi0JCQlyZXR1cm4gbnVtX21vZGVzOwotCX0KKwludW1fbW9kZXMgPSBkcm1fcGFuZWxfZ2V0
X21vZGVzKGlteHBkLT5wYW5lbCk7CisJaWYgKG51bV9tb2RlcyA+IDApCisJCXJldHVybiBudW1f
bW9kZXM7CiAKIAlpZiAoaW14cGQtPmVkaWQpIHsKIAkJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRp
ZF9wcm9wZXJ0eShjb25uZWN0b3IsIGlteHBkLT5lZGlkKTsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
