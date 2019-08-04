Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47C80C7E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D11E89EEB;
	Sun,  4 Aug 2019 20:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2475789EF7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j17so2330330lfp.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aobqP46odx3tunBAtyyrec00lPA6Ep/KC6NYpNeo17U=;
 b=S3JtzMhhSFmbtQ84LNeQUQJyW1+aErVQ705V8a4x/6rXE9W/Cj4BopxYR1SG/McQfT
 HQ1+n79uLln9W3idk0H+2v6etovhaY0x+Tnjzl3nkX37AE5OsLrgBJIrk1I5LuWKm571
 oAdiJPEMWzGDLAeaWwh6skB1yNnTBoknQzkeGMAvhHAPqatvBB0B4tezPEshaygbueMh
 nwy2Z4VvUrWxw/d3pckmVQjJL/nFAMfQDQUi9XwiOCwxrBRUp1pFEgv9X7+PyWii9Bu7
 UxJLgc7+I8Q5U8XU/e00ovTMIiTu/WGSN+aM+V3JYeztSsVYZGr7Ta/Umh/8lML62uqw
 5DVQ==
X-Gm-Message-State: APjAAAXQeGf/n1wZFOTANMcxJtMKx/CwIjcqeOY8Q4buFtlRDGn5YFvL
 2s6mqYE/Dc0eUsRN/Yc335Hhw0ZCEoOZRg==
X-Google-Smtp-Source: APXvYqzTqaOH/E4yWYEObO2R5wACA7U9nuaIZddLKnxycMIdLIM6Ra7WWa7AU5/RHuBYEwNpuEELQA==
X-Received: by 2002:ac2:4289:: with SMTP id m9mr5299981lfh.49.1564949863271;
 Sun, 04 Aug 2019 13:17:43 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:42 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 15/16] drm/panel: add backlight support
Date: Sun,  4 Aug 2019 22:16:36 +0200
Message-Id: <20190804201637.1240-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aobqP46odx3tunBAtyyrec00lPA6Ep/KC6NYpNeo17U=;
 b=SFyUwEVzQiN+6Jh9U4W+Ou+eODKjyMW+KpMuYRXjME46CmaH8aJsl/dRMIn9p2zWZO
 G8C9gUmunvvNAfQnltvpwvvr6SZKIBTXon/9pdHoYF2OEAzg4X0T7udsIbCPJZOJcMaK
 bF7VAH94hYH9HecpdWX9NjSM2fOUXMY4DPHYOXKH4dCA1oQVpxwV9gghaBGzSrUJGnCf
 gnWSfFzy8l0vUQExN4iXCesBUcBGkrx41lBJ9v6i6fEVRhrOLfUtHJOvNoWinLnBY6Yd
 cJ8A0XDKQ6zvW2868e4DsxOCHxTkdTI4F7DukDhV0NOo+sRz6pV/i5BymdeavxXTvWwJ
 XOag==
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

UGFuZWxzIG9mdGVuIHN1cHBvcnRzIGJhY2tsaWdodCBhcyBzcGVjaWZpZWQgaW4gYSBkZXZpY2Ug
dHJlZS4KVXBkYXRlIHRoZSBkcm1fcGFuZWwgaW5mcmFzdHJ1Y3R1cmUgdG8gc3VwcG9ydCB0aGlz
IHRvCnNpbXBsaWZ5IHRoZSBkcml2ZXJzLgoKV2l0aCB0aGlzIHRoZSBwYW5lbCBkcml2ZXIganVz
dCBuZWVkcyB0byBhZGQgdGhlIGZvbGxvd2luZyB0byB0aGUKcHJvYmUoKSBmdW5jdGlvbjoKCiAg
ICBlcnIgPSBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KHBhbmVsKTsKICAgIGlmIChlcnIpCiAgICAg
ICAgICAgIHJldHVybiBlcnI7CgpUaGVuIGRybV9wYW5lbCB3aWxsIGhhbmRsZSBhbGwgdGhlIHJl
c3QuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8
c2VhbkBwb29ybHkucnVuPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMgfCA0MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCAgICAgfCAyMyArKysr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcGFuZWwuYwppbmRleCAwODUzNzY0MDQwZGUuLmQ4MTM5Njc0Yjg4MyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFu
ZWwuYwpAQCAtMjEsNiArMjEsNyBAQAogICogREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICov
CiAKKyNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4K
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KIApAQCAtMTEwLDYgKzExMSw3IEBAIGludCBkcm1f
cGFuZWxfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmIChyZXQgPj0gMCkKIAkJ
cGFuZWwtPmVuYWJsZWQgPSB0cnVlOwogCisJYmFja2xpZ2h0X2VuYWJsZShwYW5lbC0+YmFja2xp
Z2h0KTsKIAlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfZW5hYmxlKTsK
QEAgLTEzNCw2ICsxMzYsOCBAQCBpbnQgZHJtX3BhbmVsX2Rpc2FibGUoc3RydWN0IGRybV9wYW5l
bCAqcGFuZWwpCiAJaWYgKCFwYW5lbC0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7CiAKKwliYWNrbGln
aHRfZGlzYWJsZShwYW5lbC0+YmFja2xpZ2h0KTsKKwogCWlmIChwYW5lbC0+ZnVuY3MgJiYgcGFu
ZWwtPmZ1bmNzLT5kaXNhYmxlKQogCQlyZXQgPSBwYW5lbC0+ZnVuY3MtPmRpc2FibGUocGFuZWwp
OwogCkBAIC0zMDgsNiArMzEyLDQzIEBAIHN0cnVjdCBkcm1fcGFuZWwgKm9mX2RybV9maW5kX3Bh
bmVsKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiBFWFBPUlRfU1lNQk9MKG9mX2RybV9m
aW5kX3BhbmVsKTsKICNlbmRpZgogCisjaWZkZWYgQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJ
Q0UKKy8qKgorICogZHJtX3BhbmVsX29mX2JhY2tsaWdodCAtIHVzZSBiYWNrbGlnaHQgZGV2aWNl
IG5vZGUgZm9yIGJhY2tsaWdodAorICogQHBhbmVsOiBEUk0gcGFuZWwKKyAqCisgKiBVc2UgdGhp
cyBmdW5jdGlvbiB0byBlbmFibGUgYmFja2xpZ2h0IGhhbmRsaW5nIGlmIHlvdXIgcGFuZWwKKyAq
IHVzZXMgZGV2aWNlIHRyZWUgYW5kIGhhcyBhIGJhY2tsaWdodCBoYW5kbGUuCisgKgorICogV2hl
biBwYW5lbCBpcyBlbmFibGVkIGJhY2tsaWdodCB3aWxsIGJlIGVuYWJsZWQgYWZ0ZXIgYQorICog
c3VjY2Vzc2Z1bGwgY2FsbCB0byAmZHJtX3BhbmVsX2Z1bmNzLmVuYWJsZSgpCisgKgorICogV2hl
biBwYW5lbCBpcyBkaXNhYmxlZCBiYWNrbGlnaHQgd2lsbCBiZSBkaXNhYmxlZCBiZWZvcmUgdGhl
CisgKiBjYWxsIHRvICZkcm1fcGFuZWxfZnVuY3MuZGlzYWJsZSgpLgorICoKKyAqIEEgdHlwaWNh
bCBpbXBsZW1lbnRhdGlvbiBmb3IgYSBwYW5lbCBkcml2ZXIgc3VwcG9ydGluZyBkZXZpY2UgdHJl
ZQorICogd2lsbCBjYWxsIHRoaXMgZnVuY3Rpb24gYW5kIHRoZW4gYmFja2xpZ2h0IGp1c3Qgd29y
a3MuCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2Rl
IG9uIGZhaWx1cmUuCisgKi8KK2ludCBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KHN0cnVjdCBkcm1f
cGFuZWwgKnBhbmVsKQoreworCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CisK
KwlpZiAoIXBhbmVsIHx8ICFwYW5lbC0+ZGV2KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWJhY2ts
aWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQocGFuZWwtPmRldik7CisKKwlpZiAoSVNfRVJS
KGJhY2tsaWdodCkpCisgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoYmFja2xpZ2h0KTsK
KworCXBhbmVsLT5iYWNrbGlnaHQgPSBiYWNrbGlnaHQ7CisJcmV0dXJuIDA7Cit9CitFWFBPUlRf
U1lNQk9MKGRybV9wYW5lbF9vZl9iYWNrbGlnaHQpOworI2VuZGlmCisKIE1PRFVMRV9BVVRIT1Io
IlRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Iik7CiBNT0RVTEVfREVTQ1JJUFRJ
T04oIkRSTSBwYW5lbCBpbmZyYXN0cnVjdHVyZSIpOwogTU9EVUxFX0xJQ0VOU0UoIkdQTCBhbmQg
YWRkaXRpb25hbCByaWdodHMiKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5o
IGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKaW5kZXggNzQ5MzUwMGZjOWJkLi4zMTM0OWMyMzkz
YjcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9wYW5lbC5oCkBAIC0yOCw2ICsyOCw3IEBACiAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4K
ICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+CiAKK3N0cnVjdCBiYWNrbGlnaHRfZGV2aWNlOwogc3Ry
dWN0IGRldmljZV9ub2RlOwogc3RydWN0IGRybV9jb25uZWN0b3I7CiBzdHJ1Y3QgZHJtX2Rldmlj
ZTsKQEAgLTU5LDYgKzYwLDEwIEBAIHN0cnVjdCBkaXNwbGF5X3RpbWluZzsKICAqCiAgKiBUbyBz
YXZlIHBvd2VyIHdoZW4gbm8gdmlkZW8gZGF0YSBpcyB0cmFuc21pdHRlZCwgYSBkcml2ZXIgY2Fu
IHBvd2VyIGRvd24KICAqIHRoZSBwYW5lbC4gVGhpcyBpcyB0aGUgam9iIG9mIHRoZSAudW5wcmVw
YXJlKCkgZnVuY3Rpb24uCisgKgorICogQmFja2xpZ2h0IGNhbiBiZSBoYW5kbGVkIGF1dG9tYXRp
Y2FsbHkgaWYgY29uZmlndXJlZCB1c2luZworICogZHJtX3BhbmVsX29mX2JhY2tsaWdodCgpLiBU
aGVuIHRoZSBkcml2ZXIgZG8gbm90IG5lZWQgdG8gaW1wbGVtZW50IHRoZQorICogZnVuY3Rpb25h
bGl0eSB0byBlbmFibGUvZGlzYWJsZSBiYWNrbGlnaHQuCiAgKi8KIHN0cnVjdCBkcm1fcGFuZWxf
ZnVuY3MgewogCS8qKgpAQCAtMTM5LDYgKzE0NCwxNSBAQCBzdHJ1Y3QgZHJtX3BhbmVsIHsKIAkg
Ki8KIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAKKwkvKioKKwkgKiBAYmFja2xpZ2h0OgorCSAqCisJ
ICogQmFja2xpZ2h0IGRldmljZSwgdXNlZCB0byB0dXJuIG9uIGJhY2tsaWdodCBhZnRlcgorCSAq
IHRoZSBjYWxsIHRvIGVuYWJsZSgpLCBhbmQgdG8gdHVybiBvZmYKKwkgKiBiYWNrbGlnaHQgYmVm
b3JlIGNhbGwgdG8gZGlzYWJsZSgpLgorCSAqLworCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpi
YWNrbGlnaHQ7CisKIAkvKioKIAkgKiBAZnVuY3M6CiAJICoKQEAgLTE5Myw0ICsyMDcsMTMgQEAg
c3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX3BhbmVsICpvZl9kcm1fZmluZF9wYW5lbChjb25zdCBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogfQogI2VuZGlmCiAKKyNpZiBkZWZpbmVkKENPTkZJR19C
QUNLTElHSFRfQ0xBU1NfREVWSUNFKSAmJiBkZWZpbmVkKENPTkZJR19EUk1fUEFORUwpCitpbnQg
ZHJtX3BhbmVsX29mX2JhY2tsaWdodChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7CisjZWxzZQor
c3RhdGljIGlubGluZSBpbnQgZHJtX3BhbmVsX29mX2JhY2tsaWdodChzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCkKK3sKKwlyZXR1cm4gLUVJTlZBTDsKK30KKyNlbmRpZgorCiAjZW5kaWYKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
