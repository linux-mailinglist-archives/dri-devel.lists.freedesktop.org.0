Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49510F019
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB4F6E2CC;
	Mon,  2 Dec 2019 19:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004446E2C8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m30so766374lfp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pufhdufTBZ4mSzYNhIa1SU1Zolx0dEUNyE9ky7d08jw=;
 b=W/18v6lbUax22hknzzMSMRHUvzcwlCiqlnjFTx3o3QvqmRb106B/LHBUgQBXmOrgi+
 TTXLKhCg4hrNSpEvC6U5uJw6GlLQgD+X3PN5vk/mMu9VDE2X4XqHplcyj6xLFKe1hmCH
 SXf1U2vqEgQl3hhP/mRaJWGdP7h8s5nVlMdfNEcrBYbAWlR6Pps7Ge3GPEubNGU5mkpo
 cQSdgxGQ44aO2g76jLVeQsfB0UILUPqyEwgdwCg1F90CoVBbO4pnh5inRf1lFW3SnROf
 EqsrNcxE6K43nvslJWh66Nc7+f/PdJAaMNaVzfzNpNsFcGzVxSA0PxdVkIYE5JdqvwCl
 5hnA==
X-Gm-Message-State: APjAAAUUP5zUhjJQoi8kOvBZtrYUy3p60iHmFyMjvqh9wP05m1MxOvFk
 EYuadEAguyOVlS9F/gezY3E8UfgfFrynLA==
X-Google-Smtp-Source: APXvYqzrv6BigKOuGAiecc+JD92dfDaiQ3Shj7lT0vkeRMJRgmrSt0RVk2kjEFu87HKmvnxxHrbwUw==
X-Received: by 2002:ac2:52a5:: with SMTP id r5mr427632lfm.19.1575315190884;
 Mon, 02 Dec 2019 11:33:10 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:10 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
Date: Mon,  2 Dec 2019 20:32:08 +0100
Message-Id: <20191202193230.21310-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pufhdufTBZ4mSzYNhIa1SU1Zolx0dEUNyE9ky7d08jw=;
 b=Xc6+bsYYLAQi0yIiEPOOsVDOPaXWqYmWsAGZ6RV2VEhV9pVuYL3BsbW3SnM25cmwS0
 AsFNImSjUufwoeD5cU+LBWRxqTjiJH101E6dTd3gVzgmMmtK58WMi8tmDd+mVB21AmMC
 26jmrpI4LIUFW0dI+ZsdH8Q1mmDOZStyy22dGfVi5SFBwBXnx+9b+4YGdwabSu5izF+q
 g2z+T9DJKp1MlZMjk0NZ8IU8ALfdq3ChwuVCiDhpkJSFWVd6XkgBm3fIsgaiReytTE46
 +rc+yBbEdFNNpEPaDtJ8Zfjhx9UiBauYue5/xd2TiCqtdq8EX05A4ejtJKNoE5aJJhTM
 /THA==
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
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9jb25uZWN0b3IgY3JlYXRlZCBieSBkcm1fcGFuZWxfYnJpZGdlIHdhcyBhY2Nlc3Nl
ZAp2aWEgZHJtX3BhbmVsLmNvbm5lY3Rvci4KQXZvaWQgdGhlIGRldG91ciBhcm91bmQgZHJtX3Bh
bmVsIGJ5IHByb3ZpZGluZyBhIHNpbXBsZSBnZXQgbWV0aG9kLgpUaGlzIGF2b2lkcyBkaXJlY3Qg
YWNjZXNzIHRvIHRoZSBjb25uZWN0b3IgZmllbGQgaW4gZHJtX3BhbmVsIGluCnRoZSB0d28gdXNl
cnMuCgpVcGRhdGUgcGwxMTEgYW5kIHR2ZTIwMCB0byB1c2UgdGhlIG5ldyBoZWxwZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgpDYzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpDYzogSmVy
bmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgpDYzogRXJpYyBBbmhvbHQgPGVy
aWNAYW5ob2x0Lm5ldD4KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jICAgICAgfCAxNiArKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZHJ2LmMgICB8ICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyB8ICAyICstCiBpbmNsdWRlL2RybS9kcm1f
YnJpZGdlLmggICAgICAgICAgICB8ICAxICsKIDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKaW5kZXggZjRlMjkzZTdj
ZjY0Li5jNWUyN2I4MTU4OGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFu
ZWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKQEAgLTI4OSwzICsyODks
MTkgQEAgc3RydWN0IGRybV9icmlkZ2UgKmRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQo
c3RydWN0IGRldmljZSAqZGV2LAogCXJldHVybiBicmlkZ2U7CiB9CiBFWFBPUlRfU1lNQk9MKGRl
dm1fZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQpOworCisvKioKKyAqIGRybV9wYW5lbF9icmlk
Z2VfY29ubmVjdG9yIC0gcmV0dXJuIHBvaW50ZXIgdG8gY29ubmVjdG9yCisgKgorICogZHJtX3Bh
bmVsX2JyaWRnZSBjcmVhdGVzIHRoZSBjb25uZWN0b3IuCisgKiBUaGlzIGZ1bmN0aW9uIGdpdmVz
IGV4dGVybmFsIGFjY2VzcyB0byB0aGUgY29ubmVjdG9yLgorICoKKyAqIFJldHVybnM6IFBvaW50
ZXIgdG8gZHJtX2Nvbm5lZWN0b3IKKyAqLworc3RydWN0IGRybV9jb25uZWN0b3IgKmRybV9wYW5l
bF9icmlkZ2VfY29ubmVjdG9yKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCit7CisJc3RydWN0
IHBhbmVsX2JyaWRnZSAqIHBhbmVsX2JyaWRnZTsKKwlwYW5lbF9icmlkZ2UgPSBkcm1fYnJpZGdl
X3RvX3BhbmVsX2JyaWRnZShicmlkZ2UpOworCisJcmV0dXJuICZwYW5lbF9icmlkZ2UtPmNvbm5l
Y3RvcjsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kcnYuYwppbmRleCA2M2RmY2RhMDQxNDcuLmFh
OGFhOGQ5ZTQwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kcnYuYwpAQCAtMTY2LDcgKzE2Niw3
IEBAIHN0YXRpYyBpbnQgcGwxMTFfbW9kZXNldF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
CiAJcHJpdi0+YnJpZGdlID0gYnJpZGdlOwogCWlmIChwYW5lbCkgewogCQlwcml2LT5wYW5lbCA9
IHBhbmVsOwotCQlwcml2LT5jb25uZWN0b3IgPSBwYW5lbC0+Y29ubmVjdG9yOworCQlwcml2LT5j
b25uZWN0b3IgPSBkcm1fcGFuZWxfYnJpZGdlX2Nvbm5lY3RvcihicmlkZ2UpOwogCX0KIAogCXJl
dCA9IHBsMTExX2Rpc3BsYXlfaW5pdChkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3R2ZTIwMC90dmUyMDBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYu
YwppbmRleCA5NTRiMDljOTQ4ZWIuLjAwYmE5ZTVjZTEzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R2ZTIwMC90dmUyMDBfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R2ZTIwMC90
dmUyMDBfZHJ2LmMKQEAgLTExMCw3ICsxMTAsNyBAQCBzdGF0aWMgaW50IHR2ZTIwMF9tb2Rlc2V0
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAl9CiAKIAlwcml2LT5wYW5lbCA9IHBhbmVs
OwotCXByaXYtPmNvbm5lY3RvciA9IHBhbmVsLT5jb25uZWN0b3I7CisJcHJpdi0+Y29ubmVjdG9y
ID0gZHJtX3BhbmVsX2JyaWRnZV9jb25uZWN0b3IoYnJpZGdlKTsKIAlwcml2LT5icmlkZ2UgPSBi
cmlkZ2U7CiAKIAlkZXZfaW5mbyhkZXYtPmRldiwgImF0dGFjaGVkIHRvIHBhbmVsICVzXG4iLApk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2Jy
aWRnZS5oCmluZGV4IGMwYTIyODZhODFlOS4uOWE0OTAyYWNjZmU1IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2RybS9kcm1fYnJpZGdlLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCkBAIC00
MzgsNiArNDM4LDcgQEAgc3RydWN0IGRybV9icmlkZ2UgKmRldm1fZHJtX3BhbmVsX2JyaWRnZV9h
ZGQoc3RydWN0IGRldmljZSAqZGV2LAogc3RydWN0IGRybV9icmlkZ2UgKmRldm1fZHJtX3BhbmVs
X2JyaWRnZV9hZGRfdHlwZWQoc3RydWN0IGRldmljZSAqZGV2LAogCQkJCQkJICAgc3RydWN0IGRy
bV9wYW5lbCAqcGFuZWwsCiAJCQkJCQkgICB1MzIgY29ubmVjdG9yX3R5cGUpOworc3RydWN0IGRy
bV9jb25uZWN0b3IgKmRybV9wYW5lbF9icmlkZ2VfY29ubmVjdG9yKHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UpOwogI2VuZGlmCiAKICNlbmRpZgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
