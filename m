Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63010F057
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CA66E2E9;
	Mon,  2 Dec 2019 19:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B856E2E9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so807071ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9l88xihpsr+Oq7AiOCDQfFuIMQfThGtVnWiYKe7NjT4=;
 b=CdMkP+aGgM/rsx4ZOMgq0qfwSGzPVzBmcbvJh093QjVVjjUm60FK2EevRFlcNsftsr
 /WVhhKMhA3plIK+jJAko+Rb+LjD/rQ/zdYFjOunl9qEdStX2g4qbgLjCSWzxTkNDUXMg
 7d+OxcL4xOdP+edMrvFtT5NmSrZTUqlE30mC+qJ9Bh72rhxW1tYY1W/lFWcZdfxX+0Ou
 idhXMnHA7wU5y3g7jbNU+6FHPPZBdai60L7zMjsTI0aeNbsHWJ+jdxJtkp2pcOwQeQ+z
 EWC10CDiW/RgqRqkaYwoTvvJMoaZDTy0hqbHFge4EG5mWhz69wJkDzOqrFN+DE+B7hmR
 MG8w==
X-Gm-Message-State: APjAAAXycqs0ahv1pJVY73tJQU8TZQq/kyAWzMGdW14X+VwNrklLLVlj
 jap9PpxppXenmw3a/bG8CXFJIXkcSXJZZg==
X-Google-Smtp-Source: APXvYqzS7SokA6A/WeeKZw1vsjDaKZ/zMqV2/WXPSZ5E+ZDr9kYmre74jF/nrnnSX3bYrjhN+JwTpg==
X-Received: by 2002:a2e:b5ae:: with SMTP id f14mr256760ljn.31.1575315218380;
 Mon, 02 Dec 2019 11:33:38 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:37 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 18/26] drm/panel: rocktech-jh057n00900: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:22 +0100
Message-Id: <20191202193230.21310-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9l88xihpsr+Oq7AiOCDQfFuIMQfThGtVnWiYKe7NjT4=;
 b=NXrsvTVyKTVDN70+OK/7PF45HUHG5iMhS69DUkYT2xofsK/0mFMX5121dT/vftSM7R
 qpWNdC7qTqqXqAThmb+h5aQ9rm2oVx2VUbwhav5ehLUT6ffVSkzCmxdk4CfDL/Ex4G0W
 SodcXhFAjBSa16VNI+zM+1tj8zgBvTgKX4T3rTKedBUL8+Bsk3ogVw4MlixwlgKh4M8T
 Q02q2gq4vhycml3qIipLMtXIqfBm0UWXxBQzF6UdxFcxXL4UsH1fWSnPj+ZEP61vy2cu
 Wpp3fOUqsu8zeLeEcGbwxyDwq7ejHwvJ/M+G1AKiP/8ZbX/Gu9jjG75b0nywoWL8Pg5J
 dzLQ==
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
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 NXP Linux Team <linux-imx@nxp.com>, Jitao Shi <jitao.shi@mediatek.com>,
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
aXZlci4KV2hpbGUgdG91Y2hpbmcgdGhlIGluY2x1ZGUgZmlsZXMgc29ydCB0aGVtCmFuZCBkaXZp
ZGUgdGhlbSB1cCBpbiBibG9ja3MuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+CkNjOiAiR3VpZG8gR8O8bnRoZXIiIDxhZ3hAc2lneGNwdS5vcmc+CkNjOiBQ
dXJpc20gS2VybmVsIFRlYW0gPGtlcm5lbEBwdXJpLnNtPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRo
aWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgICAgfCAy
NCArKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9j
a3RlY2gtamgwNTduMDA5MDAuYwppbmRleCAzYTRmMWMwZmNlODYuLjM4ZmY3NDJiYzEyMCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAw
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAw
LmMKQEAgLTUsMjAgKzUsMjIgQEAKICAqIENvcHlyaWdodCAoQykgUHVyaXNtIFNQQyAyMDE5CiAg
Ki8KIAotI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX21v
ZGVzLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgotI2luY2x1ZGUgPGRybS9kcm1fcHJp
bnQuaD4KLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWJ1
Z2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2Nv
bnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvbWVkaWEtYnVzLWZvcm1hdC5oPgorI2luY2x1ZGUg
PGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgorCiAjaW5jbHVkZSA8dmlkZW8vZGlz
cGxheV90aW1pbmcuaD4KICNpbmNsdWRlIDx2aWRlby9taXBpX2Rpc3BsYXkuaD4KIAorI2luY2x1
ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+CisjaW5j
bHVkZSA8ZHJtL2RybV9wYW5lbC5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KKwogI2Rl
ZmluZSBEUlZfTkFNRSAicGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAiCiAKIC8qIE1hbnVmYWN0
dXJlciBzcGVjaWZpYyBDb21tYW5kcyBzZW5kIHZpYSBEU0kgKi8KQEAgLTQ3LDcgKzQ5LDYgQEAg
c3RydWN0IGpoMDU3biB7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBkcm1fcGFuZWwg
cGFuZWw7CiAJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsKLQlzdHJ1Y3QgYmFja2xpZ2h0
X2RldmljZSAqYmFja2xpZ2h0OwogCXN0cnVjdCByZWd1bGF0b3IgKnZjYzsKIAlzdHJ1Y3QgcmVn
dWxhdG9yICppb3ZjYzsKIAlib29sIHByZXBhcmVkOwpAQCAtMTUyLDcgKzE1Myw3IEBAIHN0YXRp
YyBpbnQgamgwNTduX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAkJcmV0dXJuIHJl
dDsKIAl9CiAKLQlyZXR1cm4gYmFja2xpZ2h0X2VuYWJsZShjdHgtPmJhY2tsaWdodCk7CisJcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgamgwNTduX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAq
cGFuZWwpCkBAIC0xNjAsNyArMTYxLDYgQEAgc3RhdGljIGludCBqaDA1N25fZGlzYWJsZShzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlzdHJ1Y3QgamgwNTduICpjdHggPSBwYW5lbF90b19qaDA1
N24ocGFuZWwpOwogCXN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSA9IHRvX21pcGlfZHNpX2Rl
dmljZShjdHgtPmRldik7CiAKLQliYWNrbGlnaHRfZGlzYWJsZShjdHgtPmJhY2tsaWdodCk7CiAJ
cmV0dXJuIG1pcGlfZHNpX2Rjc19zZXRfZGlzcGxheV9vZmYoZHNpKTsKIH0KIApAQCAtMzIxLDEw
ICszMjEsNiBAQCBzdGF0aWMgaW50IGpoMDU3bl9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNl
ICpkc2kpCiAJZHNpLT5tb2RlX2ZsYWdzID0gTUlQSV9EU0lfTU9ERV9WSURFTyB8CiAJCU1JUElf
RFNJX01PREVfVklERU9fQlVSU1QgfCBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVMU0U7CiAK
LQljdHgtPmJhY2tsaWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoZGV2KTsKLQlpZiAoSVNf
RVJSKGN0eC0+YmFja2xpZ2h0KSkKLQkJcmV0dXJuIFBUUl9FUlIoY3R4LT5iYWNrbGlnaHQpOwot
CiAJY3R4LT52Y2MgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAidmNjIik7CiAJaWYgKElTX0VS
UihjdHgtPnZjYykpIHsKIAkJcmV0ID0gUFRSX0VSUihjdHgtPnZjYyk7CkBAIC0zNDcsNiArMzQz
LDEwIEBAIHN0YXRpYyBpbnQgamgwNTduX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRz
aSkKIAlkcm1fcGFuZWxfaW5pdCgmY3R4LT5wYW5lbCwgZGV2LCAmamgwNTduX2RybV9mdW5jcywK
IAkJICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwogCisJcmV0ID0gZHJtX3BhbmVsX29m
X2JhY2tsaWdodCgmY3R4LT5wYW5lbCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCWRy
bV9wYW5lbF9hZGQoJmN0eC0+cGFuZWwpOwogCiAJcmV0ID0gbWlwaV9kc2lfYXR0YWNoKGRzaSk7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
