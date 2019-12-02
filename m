Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AEC10F03A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759B26E2E1;
	Mon,  2 Dec 2019 19:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36976E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k8so838426ljh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ziacaDT5ojzWXLyawunTmtP2RY8dGuryn8kq/1BtKS0=;
 b=sCrOC5ldT19eR5jiFhuMwBRH2r5rT/oQiIpSuteDry5bg7q1qYuC23qhZ8zYV9CO80
 WCtpqa5Y2f9ZMYD1Vf4X5IrHwqOZ87Agbos/p/81F/ds2qmDyI1kzkIl6wxE+CJAzTTM
 oTogg9b47FJT3y/VuGo9itI//iG2ydszPamVdXqQwlVxtNsT+NEVARD2AfkRNIHgp4Er
 o3WCAQivXhdEKLOuT0SS6uIUeD7xiOYvTsjP0SXnET14altECkYwAb3v2IwPMB6B/2hB
 q14mtZiCWbqGeR0aJPrutB9SJLxLoG33LEour+njjKT+6MbKRWh26UVO+uuBfw31yZAT
 nmnw==
X-Gm-Message-State: APjAAAUXkW4dF/YX1r+zZYpLlHlSCfNixuHBhp4b0v552gewZKPV5sGc
 enKGalq67Dlov9BntE3P9Xd00cGgIDEGcQ==
X-Google-Smtp-Source: APXvYqwu5DjS+1a3b7ZBEWBw4hcW7WJdhp41DTTVhmMuxsDxpn8LvqwTqvwr8F6v3F4KQxwRHBv+sg==
X-Received: by 2002:a2e:9110:: with SMTP id m16mr278458ljg.140.1575315208043; 
 Mon, 02 Dec 2019 11:33:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:27 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 12/26] drm/panel: kingdisplay-kd097d04: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:16 +0100
Message-Id: <20191202193230.21310-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziacaDT5ojzWXLyawunTmtP2RY8dGuryn8kq/1BtKS0=;
 b=sddcI5jsaMfWn/78NbEh1ItFa3htles17a7S2GxuBnfw8EGrqWdQq7HkZHjqJsWvut
 VDGhwKNOs1pB6+2hSoNc2Fy2/J9jzTBQrmOb5sEwxK9MZJN+ydX4fCPg+t7aD1qKpkjo
 yysZG995mtrjjGPHCESf/q/8KceeZ5wnp6IMEmhZzcCag438p650Fn3bpikZtooCDOPP
 Ua3HwNS8A6DCrNhqO/b40VgQYJiJLttWNgb6bEX7jsLZ7tLx1hu5f50E51pgUTHh2gFL
 bVk46NLX3t5W/tDxiZ9YYAY8yqZxCBR7u8spRmvuAKL7fBjVd+US3HBR9HtQpkxcj63h
 pSIQ==
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
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLWtpbmdkaXNwbGF5
LWtkMDk3ZDA0LmMgICAgfCAyOCArKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwta2luZ2Rpc3BsYXkta2QwOTdkMDQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1raW5nZGlzcGxheS1rZDA5N2QwNC5jCmluZGV4IDM1M2VlNmNhYTAxYy4u
YmFjMWEyYTA2YzkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwta2lu
Z2Rpc3BsYXkta2QwOTdkMDQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwta2lu
Z2Rpc3BsYXkta2QwOTdkMDQuYwpAQCAtMyw3ICszLDYgQEAKICAqIENvcHlyaWdodCAoYykgMjAx
NywgRnV6aG91IFJvY2tjaGlwIEVsZWN0cm9uaWNzIENvLiwgTHRkCiAgKi8KIAotI2luY2x1ZGUg
PGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8
bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgpAQCAtMjMs
NyArMjIsNiBAQCBzdHJ1Y3Qga2luZ2Rpc3BsYXlfcGFuZWwgewogCXN0cnVjdCBkcm1fcGFuZWwg
YmFzZTsKIAlzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpsaW5rOwogCi0Jc3RydWN0IGJhY2tsaWdo
dF9kZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7CiAJc3RydWN0
IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87CiAKQEAgLTE5MSw4ICsxODksNiBAQCBzdGF0aWMgaW50
IGtpbmdkaXNwbGF5X3BhbmVsX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJaWYg
KCFraW5nZGlzcGxheS0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7CiAKLQliYWNrbGlnaHRfZGlzYWJs
ZShraW5nZGlzcGxheS0+YmFja2xpZ2h0KTsKLQogCWVyciA9IG1pcGlfZHNpX2Rjc19zZXRfZGlz
cGxheV9vZmYoa2luZ2Rpc3BsYXktPmxpbmspOwogCWlmIChlcnIgPCAwKQogCQlEUk1fREVWX0VS
Uk9SKHBhbmVsLT5kZXYsICJmYWlsZWQgdG8gc2V0IGRpc3BsYXkgb2ZmOiAlZFxuIiwKQEAgLTMw
MywxOCArMjk5LDEwIEBAIHN0YXRpYyBpbnQga2luZ2Rpc3BsYXlfcGFuZWxfcHJlcGFyZShzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHN0YXRpYyBpbnQga2luZ2Rpc3BsYXlfcGFuZWxfZW5hYmxl
KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewogCXN0cnVjdCBraW5nZGlzcGxheV9wYW5lbCAq
a2luZ2Rpc3BsYXkgPSB0b19raW5nZGlzcGxheV9wYW5lbChwYW5lbCk7Ci0JaW50IHJldDsKIAog
CWlmIChraW5nZGlzcGxheS0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7CiAKLQlyZXQgPSBiYWNrbGln
aHRfZW5hYmxlKGtpbmdkaXNwbGF5LT5iYWNrbGlnaHQpOwotCWlmIChyZXQpIHsKLQkJRFJNX0RF
Vl9FUlJPUihwYW5lbC0+ZGV2LAotCQkJICAgICAgIkZhaWxlZCB0byBlbmFibGUgYmFja2xpZ2h0
ICVkXG4iLCByZXQpOwotCQlyZXR1cm4gcmV0OwotCX0KLQogCWtpbmdkaXNwbGF5LT5lbmFibGVk
ID0gdHJ1ZTsKIAogCXJldHVybiAwOwpAQCAtMzg4LDEzICszNzYsMTMgQEAgc3RhdGljIGludCBr
aW5nZGlzcGxheV9wYW5lbF9hZGQoc3RydWN0IGtpbmdkaXNwbGF5X3BhbmVsICpraW5nZGlzcGxh
eSkKIAkJa2luZ2Rpc3BsYXktPmVuYWJsZV9ncGlvID0gTlVMTDsKIAl9CiAKLQlraW5nZGlzcGxh
eS0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChkZXYpOwotCWlmIChJU19FUlIo
a2luZ2Rpc3BsYXktPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJfRVJSKGtpbmdkaXNwbGF5LT5i
YWNrbGlnaHQpOwotCiAJZHJtX3BhbmVsX2luaXQoJmtpbmdkaXNwbGF5LT5iYXNlLCAma2luZ2Rp
c3BsYXktPmxpbmstPmRldiwKIAkJICAgICAgICZraW5nZGlzcGxheV9wYW5lbF9mdW5jcywgRFJN
X01PREVfQ09OTkVDVE9SX0RTSSk7CiAKKwllcnIgPSBkcm1fcGFuZWxfb2ZfYmFja2xpZ2h0KCZr
aW5nZGlzcGxheS0+YmFzZSk7CisJaWYgKGVycikKKwkJcmV0dXJuIGVycjsKKwogCXJldHVybiBk
cm1fcGFuZWxfYWRkKCZraW5nZGlzcGxheS0+YmFzZSk7CiB9CiAKQEAgLTQzMiwxMiArNDIwLDEy
IEBAIHN0YXRpYyBpbnQga2luZ2Rpc3BsYXlfcGFuZWxfcmVtb3ZlKHN0cnVjdCBtaXBpX2RzaV9k
ZXZpY2UgKmRzaSkKIAlzdHJ1Y3Qga2luZ2Rpc3BsYXlfcGFuZWwgKmtpbmdkaXNwbGF5ID0gbWlw
aV9kc2lfZ2V0X2RydmRhdGEoZHNpKTsKIAlpbnQgZXJyOwogCi0JZXJyID0ga2luZ2Rpc3BsYXlf
cGFuZWxfdW5wcmVwYXJlKCZraW5nZGlzcGxheS0+YmFzZSk7CisJZXJyID0gZHJtX3BhbmVsX3Vu
cHJlcGFyZSgma2luZ2Rpc3BsYXktPmJhc2UpOwogCWlmIChlcnIgPCAwKQogCQlEUk1fREVWX0VS
Uk9SKCZkc2ktPmRldiwgImZhaWxlZCB0byB1bnByZXBhcmUgcGFuZWw6ICVkXG4iLAogCQkJICAg
ICAgZXJyKTsKIAotCWVyciA9IGtpbmdkaXNwbGF5X3BhbmVsX2Rpc2FibGUoJmtpbmdkaXNwbGF5
LT5iYXNlKTsKKwllcnIgPSBkcm1fcGFuZWxfZGlzYWJsZSgma2luZ2Rpc3BsYXktPmJhc2UpOwog
CWlmIChlcnIgPCAwKQogCQlEUk1fREVWX0VSUk9SKCZkc2ktPmRldiwgImZhaWxlZCB0byBkaXNh
YmxlIHBhbmVsOiAlZFxuIiwgZXJyKTsKIApAQCAtNDU1LDggKzQ0Myw4IEBAIHN0YXRpYyB2b2lk
IGtpbmdkaXNwbGF5X3BhbmVsX3NodXRkb3duKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkK
IHsKIAlzdHJ1Y3Qga2luZ2Rpc3BsYXlfcGFuZWwgKmtpbmdkaXNwbGF5ID0gbWlwaV9kc2lfZ2V0
X2RydmRhdGEoZHNpKTsKIAotCWtpbmdkaXNwbGF5X3BhbmVsX3VucHJlcGFyZSgma2luZ2Rpc3Bs
YXktPmJhc2UpOwotCWtpbmdkaXNwbGF5X3BhbmVsX2Rpc2FibGUoJmtpbmdkaXNwbGF5LT5iYXNl
KTsKKwlkcm1fcGFuZWxfdW5wcmVwYXJlKCZraW5nZGlzcGxheS0+YmFzZSk7CisJZHJtX3BhbmVs
X2Rpc2FibGUoJmtpbmdkaXNwbGF5LT5iYXNlKTsKIH0KIAogc3RhdGljIHN0cnVjdCBtaXBpX2Rz
aV9kcml2ZXIga2luZ2Rpc3BsYXlfcGFuZWxfZHJpdmVyID0gewotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
