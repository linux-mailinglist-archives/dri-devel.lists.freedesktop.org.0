Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE74115C97
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CE36E196;
	Sat,  7 Dec 2019 14:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080336E193
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u17so10723738lja.4
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PEkkKHiq+AcHePdv87qZ46O+yNk0TpaePUBzT0oWsAc=;
 b=RKRuT/8MgBaXRy7LORjmELTwbEZTwLt5Fg8irFRZpjZBefhgZwCcy/dKJAIFqeAC7L
 OuyX6FrkNMSmOSofs/U3LxzSgV2+7GgCTRGHR0oWllO3dWYDedlh7wFvqVpNRf66sIrb
 EeHY3fIHa6MH7oq2Nu3s0D3LrU7waE6ngPhgrQeZuZ0UWpy6XoF8RPg/1a+PG0H+TrWv
 MIA5AqEeN0zVzzzX9DqA4X0iCh5+3lSqy0WxDFtDyD8uSOBWqvDJhBQ952AjanCxN25x
 jmeP+85u7KlWsvWQSS2esb5yDkH8fh6A/0GCDfqezJpTIng/7P6BoWiUNaZwo1d78odT
 POJw==
X-Gm-Message-State: APjAAAUPjkXqj0em3ToJ2U5Uw16j6DXDzVITRp9kOZjZY58U01iJUhal
 re1870SwU72r+6NYpoOK7WGTkDBo1lfn3A==
X-Google-Smtp-Source: APXvYqyvSwIE32v2Kp9t6aC1p3mZ5oj9u6z9msGZC5D9TpRLAqQ5hY1QRbeh6HQns7Z439S/CNir0g==
X-Received: by 2002:a2e:978d:: with SMTP id y13mr11771522lji.103.1575727468217; 
 Sat, 07 Dec 2019 06:04:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:27 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 10/25] drm/panel: innolux-p079zca: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:38 +0100
Message-Id: <20191207140353.23967-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PEkkKHiq+AcHePdv87qZ46O+yNk0TpaePUBzT0oWsAc=;
 b=ZfHiRiueSHRoMm/wWPg2IEAFbC+nin4k5/h6+jqp6YAW6dtNdKpHxhLUqyQBrdiW5X
 IS69T1/XMFvXqXGcc956VzDbI9EAU0LALkPtX5E1ULJfoYNnPXw878/lGy/5UDWRyoZn
 lOJzZCmr3W4w+L4mhA22VZAR5ei76vWyygf4hVaS3BMOuchXlSmvt1qbmiOnS6ogFTSO
 AFppLqocMVslabJ7DToSGuHPtYw6gN3Q4temBKQ8tfmnNP9Mpz7mwHqyqb78C40OcI3S
 W84v8/HgfHEL4T9hbGi/iSwgNqm/ytbENpyqiJ1UF+/MPBXwVyJpguDgnGdveWD5YDi/
 QtIA==
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
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
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
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtaW5ub2x1eC1wMDc5emNhLmMgfCAyOCArKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMKaW5kZXggYjlkZTM3YThhMGM1Li43
NDE5ZjFmMGFjZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbm5v
bHV4LXAwNzl6Y2EuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1w
MDc5emNhLmMKQEAgLTMsNyArMyw2IEBACiAgKiBDb3B5cmlnaHQgKGMpIDIwMTcsIEZ1emhvdSBS
b2NrY2hpcCBFbGVjdHJvbmljcyBDby4sIEx0ZAogICovCiAKLSNpbmNsdWRlIDxsaW51eC9iYWNr
bGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8v
Y29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KQEAgLTUyLDcgKzUxLDYgQEAg
c3RydWN0IGlubm9sdXhfcGFuZWwgewogCXN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmxpbms7CiAJ
Y29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgKmRlc2M7CiAKLQlzdHJ1Y3QgYmFja2xpZ2h0X2Rldmlj
ZSAqYmFja2xpZ2h0OwogCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhICpzdXBwbGllczsKIAlz
dHJ1Y3QgZ3Bpb19kZXNjICplbmFibGVfZ3BpbzsKIApAQCAtNzIsOCArNzAsNiBAQCBzdGF0aWMg
aW50IGlubm9sdXhfcGFuZWxfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAo
IWlubm9sdXgtPmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUoaW5u
b2x1eC0+YmFja2xpZ2h0KTsKLQogCWlubm9sdXgtPmVuYWJsZWQgPSBmYWxzZTsKIAogCXJldHVy
biAwOwpAQCAtMjA0LDE4ICsyMDAsMTAgQEAgc3RhdGljIGludCBpbm5vbHV4X3BhbmVsX3ByZXBh
cmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiBzdGF0aWMgaW50IGlubm9sdXhfcGFuZWxfZW5h
YmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewogCXN0cnVjdCBpbm5vbHV4X3BhbmVsICpp
bm5vbHV4ID0gdG9faW5ub2x1eF9wYW5lbChwYW5lbCk7Ci0JaW50IHJldDsKIAogCWlmIChpbm5v
bHV4LT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCXJldCA9IGJhY2tsaWdodF9lbmFibGUoaW5u
b2x1eC0+YmFja2xpZ2h0KTsKLQlpZiAocmV0KSB7Ci0JCURSTV9ERVZfRVJST1IocGFuZWwtPmRl
diwKLQkJCSAgICAgICJGYWlsZWQgdG8gZW5hYmxlIGJhY2tsaWdodCAlZFxuIiwgcmV0KTsKLQkJ
cmV0dXJuIHJldDsKLQl9Ci0KIAlpbm5vbHV4LT5lbmFibGVkID0gdHJ1ZTsKIAogCXJldHVybiAw
OwpAQCAtNDgyLDEzICs0NzAsMTMgQEAgc3RhdGljIGludCBpbm5vbHV4X3BhbmVsX2FkZChzdHJ1
Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2ksCiAJCWlubm9sdXgtPmVuYWJsZV9ncGlvID0gTlVMTDsK
IAl9CiAKLQlpbm5vbHV4LT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KGRldik7
Ci0JaWYgKElTX0VSUihpbm5vbHV4LT5iYWNrbGlnaHQpKQotCQlyZXR1cm4gUFRSX0VSUihpbm5v
bHV4LT5iYWNrbGlnaHQpOwotCiAJZHJtX3BhbmVsX2luaXQoJmlubm9sdXgtPmJhc2UsIGRldiwg
Jmlubm9sdXhfcGFuZWxfZnVuY3MsCiAJCSAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsK
IAorCWVyciA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQoJmlubm9sdXgtPmJhc2UpOworCWlmIChl
cnIpCisJCXJldHVybiBlcnI7CisKIAllcnIgPSBkcm1fcGFuZWxfYWRkKCZpbm5vbHV4LT5iYXNl
KTsKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKQEAgLTUyNiwxMiArNTE0LDEyIEBAIHN0
YXRpYyBpbnQgaW5ub2x1eF9wYW5lbF9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNp
KQogCXN0cnVjdCBpbm5vbHV4X3BhbmVsICppbm5vbHV4ID0gbWlwaV9kc2lfZ2V0X2RydmRhdGEo
ZHNpKTsKIAlpbnQgZXJyOwogCi0JZXJyID0gaW5ub2x1eF9wYW5lbF91bnByZXBhcmUoJmlubm9s
dXgtPmJhc2UpOworCWVyciA9IGRybV9wYW5lbF91bnByZXBhcmUoJmlubm9sdXgtPmJhc2UpOwog
CWlmIChlcnIgPCAwKQogCQlEUk1fREVWX0VSUk9SKCZkc2ktPmRldiwgImZhaWxlZCB0byB1bnBy
ZXBhcmUgcGFuZWw6ICVkXG4iLAogCQkJICAgICAgZXJyKTsKIAotCWVyciA9IGlubm9sdXhfcGFu
ZWxfZGlzYWJsZSgmaW5ub2x1eC0+YmFzZSk7CisJZXJyID0gZHJtX3BhbmVsX2Rpc2FibGUoJmlu
bm9sdXgtPmJhc2UpOwogCWlmIChlcnIgPCAwKQogCQlEUk1fREVWX0VSUk9SKCZkc2ktPmRldiwg
ImZhaWxlZCB0byBkaXNhYmxlIHBhbmVsOiAlZFxuIiwgZXJyKTsKIApAQCAtNTQ5LDggKzUzNyw4
IEBAIHN0YXRpYyB2b2lkIGlubm9sdXhfcGFuZWxfc2h1dGRvd24oc3RydWN0IG1pcGlfZHNpX2Rl
dmljZSAqZHNpKQogewogCXN0cnVjdCBpbm5vbHV4X3BhbmVsICppbm5vbHV4ID0gbWlwaV9kc2lf
Z2V0X2RydmRhdGEoZHNpKTsKIAotCWlubm9sdXhfcGFuZWxfdW5wcmVwYXJlKCZpbm5vbHV4LT5i
YXNlKTsKLQlpbm5vbHV4X3BhbmVsX2Rpc2FibGUoJmlubm9sdXgtPmJhc2UpOworCWRybV9wYW5l
bF91bnByZXBhcmUoJmlubm9sdXgtPmJhc2UpOworCWRybV9wYW5lbF9kaXNhYmxlKCZpbm5vbHV4
LT5iYXNlKTsKIH0KIAogc3RhdGljIHN0cnVjdCBtaXBpX2RzaV9kcml2ZXIgaW5ub2x1eF9wYW5l
bF9kcml2ZXIgPSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
