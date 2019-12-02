Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF110F069
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F006E312;
	Mon,  2 Dec 2019 19:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBD06E301
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a13so793321ljm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EQCdMhhHkJLZcD9BzMhwIb5xb1irL0uJ2pcFEXKepFw=;
 b=EpNRHQ4c5o7Bf5+mh+zjA2iIwjpeMoCd1uKXYwsqYKe811Snm72S/MjOls81naGVHa
 a/x8nZslwem8c3M+8PXczbnCSzL3TCBGD55gc0VTI7NIunHTX4/QzQCwNkEgxdlDIYFF
 5WzqeVyV7Pkf9Y9S3a9Nz05u0BH0j/kE70KJPnF+3OljU9CsxxLw74pelHrIQQ4TIayN
 R5nmpzJywTjQb8kRnKK9WGzD44ryRmhk3htzdmYQAQqiu10HK9qmM9+Zs5TfeHlrqvl0
 GD9sDcz9D6zIupL+SnZc9oRLLT9HvDVvcfyq3z8k8lxHMtkUuQzpDdOwHs5bz/2eaVeP
 Rt9w==
X-Gm-Message-State: APjAAAU5V8MiEjdXcJQj5aLw/kLaoGI7dI62aTHMIAhmygFRbMm/BNeq
 dTNvmfGRSVDfFV6SVDlnKd9I8XiS+bezuQ==
X-Google-Smtp-Source: APXvYqzBtPgnZJO2C3FgsAdYxGahX1PcJUcy/5pxg4ftOozbwWlQs9ZDIf/3+yVVuJ09OIxficg0uA==
X-Received: by 2002:a2e:c42:: with SMTP id o2mr277018ljd.222.1575315225817;
 Mon, 02 Dec 2019 11:33:45 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:45 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 22/26] drm/panel: sharp-ls043t1le01: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:26 +0100
Message-Id: <20191202193230.21310-23-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQCdMhhHkJLZcD9BzMhwIb5xb1irL0uJ2pcFEXKepFw=;
 b=OY1yeCPDNfjdMrvsRARHHhgFlNUaTixpvh8ETXE7pMJprdmFTKVV1we1+8cJAz4XT/
 TZOFneS+bmAmVo2/1FarsnUNlF/HQ+i0a79binQ5VeON+J+QbN06Nj4uz7Ma4ZX7Igvl
 NXSUqN+sktPvX04ns9obPeU83zwmI1ihE6txwTCk4mACiFSc0Q+/zOjZfeleVpUs3cTe
 /fi4PLHiLkuNCu2ibSyeRs7p/Vqvx3bApaueyaqYsXJJJtQcMDWNS4q1uTGpF1hcRUau
 gBOAK7Vue7m8v3F+YcSlkj9YA2E3ShmHOkJj0JQcPrWeqpoS0NMGuWbKaARELG4bbetw
 SW5Q==
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
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1s
czA0M3QxbGUwMS5jICAgfCAyMCArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwNDN0MWxlMDEuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaGFycC1sczA0M3QxbGUwMS5jCmluZGV4IDc5OTVjZjVhOWZjNC4uYjYwYzRk
YjFlZDZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMw
NDN0MWxlMDEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwNDN0
MWxlMDEuYwpAQCAtNyw3ICs3LDYgQEAKICAqIEJhc2VkIG9uIEFVTyBwYW5lbCBkcml2ZXIgYnkg
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9i
YWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KQEAgLTI1LDcgKzI0LDYg
QEAgc3RydWN0IHNoYXJwX250X3BhbmVsIHsKIAlzdHJ1Y3QgZHJtX3BhbmVsIGJhc2U7CiAJc3Ry
dWN0IG1pcGlfZHNpX2RldmljZSAqZHNpOwogCi0Jc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJh
Y2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7CiAJc3RydWN0IGdwaW9fZGVzYyAq
cmVzZXRfZ3BpbzsKIApAQCAtMTA3LDggKzEwNSw2IEBAIHN0YXRpYyBpbnQgc2hhcnBfbnRfcGFu
ZWxfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAoIXNoYXJwX250LT5lbmFi
bGVkKQogCQlyZXR1cm4gMDsKIAotCWJhY2tsaWdodF9kaXNhYmxlKHNoYXJwX250LT5iYWNrbGln
aHQpOwotCiAJc2hhcnBfbnQtPmVuYWJsZWQgPSBmYWxzZTsKIAogCXJldHVybiAwOwpAQCAtMTkw
LDggKzE4Niw2IEBAIHN0YXRpYyBpbnQgc2hhcnBfbnRfcGFuZWxfZW5hYmxlKHN0cnVjdCBkcm1f
cGFuZWwgKnBhbmVsKQogCWlmIChzaGFycF9udC0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7CiAKLQli
YWNrbGlnaHRfZW5hYmxlKHNoYXJwX250LT5iYWNrbGlnaHQpOwotCiAJc2hhcnBfbnQtPmVuYWJs
ZWQgPSB0cnVlOwogCiAJcmV0dXJuIDA7CkBAIC0yNDQsNiArMjM4LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fcGFuZWxfZnVuY3Mgc2hhcnBfbnRfcGFuZWxfZnVuY3MgPSB7CiBzdGF0aWMg
aW50IHNoYXJwX250X3BhbmVsX2FkZChzdHJ1Y3Qgc2hhcnBfbnRfcGFuZWwgKnNoYXJwX250KQog
ewogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzaGFycF9udC0+ZHNpLT5kZXY7CisJaW50IHJldDsK
IAogCXNoYXJwX250LT5tb2RlID0gJmRlZmF1bHRfbW9kZTsKIApAQCAtMjYwLDE0ICsyNTUsMTMg
QEAgc3RhdGljIGludCBzaGFycF9udF9wYW5lbF9hZGQoc3RydWN0IHNoYXJwX250X3BhbmVsICpz
aGFycF9udCkKIAkJZ3Bpb2Rfc2V0X3ZhbHVlKHNoYXJwX250LT5yZXNldF9ncGlvLCAwKTsKIAl9
CiAKLQlzaGFycF9udC0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChkZXYpOwot
Ci0JaWYgKElTX0VSUihzaGFycF9udC0+YmFja2xpZ2h0KSkKLQkJcmV0dXJuIFBUUl9FUlIoc2hh
cnBfbnQtPmJhY2tsaWdodCk7Ci0KIAlkcm1fcGFuZWxfaW5pdCgmc2hhcnBfbnQtPmJhc2UsICZz
aGFycF9udC0+ZHNpLT5kZXYsCiAJCSAgICAgICAmc2hhcnBfbnRfcGFuZWxfZnVuY3MsIERSTV9N
T0RFX0NPTk5FQ1RPUl9EU0kpOwogCisJcmV0ID0gZHJtX3BhbmVsX29mX2JhY2tsaWdodCgmc2hh
cnBfbnQtPmJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlyZXR1cm4gZHJtX3Bh
bmVsX2FkZCgmc2hhcnBfbnQtPmJhc2UpOwogfQogCkBAIC0zMDksNyArMzAzLDcgQEAgc3RhdGlj
IGludCBzaGFycF9udF9wYW5lbF9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQog
CXN0cnVjdCBzaGFycF9udF9wYW5lbCAqc2hhcnBfbnQgPSBtaXBpX2RzaV9nZXRfZHJ2ZGF0YShk
c2kpOwogCWludCByZXQ7CiAKLQlyZXQgPSBzaGFycF9udF9wYW5lbF9kaXNhYmxlKCZzaGFycF9u
dC0+YmFzZSk7CisJcmV0ID0gZHJtX3BhbmVsX2Rpc2FibGUoJnNoYXJwX250LT5iYXNlKTsKIAlp
ZiAocmV0IDwgMCkKIAkJZGV2X2VycigmZHNpLT5kZXYsICJmYWlsZWQgdG8gZGlzYWJsZSBwYW5l
bDogJWRcbiIsIHJldCk7CiAKQEAgLTMyNiw3ICszMjAsNyBAQCBzdGF0aWMgdm9pZCBzaGFycF9u
dF9wYW5lbF9zaHV0ZG93bihzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiB7CiAJc3RydWN0
IHNoYXJwX250X3BhbmVsICpzaGFycF9udCA9IG1pcGlfZHNpX2dldF9kcnZkYXRhKGRzaSk7CiAK
LQlzaGFycF9udF9wYW5lbF9kaXNhYmxlKCZzaGFycF9udC0+YmFzZSk7CisJZHJtX3BhbmVsX2Rp
c2FibGUoJnNoYXJwX250LT5iYXNlKTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgc2hhcnBfbnRfb2ZfbWF0Y2hbXSA9IHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
