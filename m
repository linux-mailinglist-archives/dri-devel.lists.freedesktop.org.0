Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7110F03B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01F16E2DC;
	Mon,  2 Dec 2019 19:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E0E6E2DC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d20so778098ljc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Cxn0Dcc3ud33ZBWmj1R8mFjw49Jkrh1PBlMx23F/Da8=;
 b=rcrWNKbZhqmJ6gdt8LBFUhxvD94/Ub23fhmqdkwJ9+MbxSYuYuVYhlOVwikmpjI4A9
 K3KUJaC+OZNFoURaeLyxVNPTifs8dRrb/Ljsuc0w+wJnj0U+KR6KbsOvDasfhvQXeibb
 0ZXNspuHDIW82TDMBqHuF1uS4G8W+SjCFwmXB8v7MKutFWZOVMU02wOX2OnxJ9Ao5Jo5
 9zofEJpL2P4bOJZXV4a6uA3eSVoqjXbO2hwRR7paiJOkCBzCP+YXvFRxPz2tnCOm0Eeq
 D+Cf4FWavgo3iqPNYrbwP22u0U+q9UfKblWz/cSkecfOzHyjQCe88ScbWWz/lasYsecZ
 0xuw==
X-Gm-Message-State: APjAAAUjL/VqnPhnHlbS6aYEgfWt6KEzWh9Ct7B5kHQA6nTV6AsgTo1S
 tdr9ejw0JDJAdZJ8FbleRrNFTMMkssFKjQ==
X-Google-Smtp-Source: APXvYqz/FMOrR16VQIW0JGwmevwl6PeUROPkg5uiylseK6QdXCQ6GjK97RCcja1bW2oF1wD3BFSBmw==
X-Received: by 2002:a05:651c:1064:: with SMTP id
 y4mr271748ljm.168.1575315205934; 
 Mon, 02 Dec 2019 11:33:25 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:25 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 11/26] drm/panel: innolux-p079zca: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:15 +0100
Message-Id: <20191202193230.21310-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cxn0Dcc3ud33ZBWmj1R8mFjw49Jkrh1PBlMx23F/Da8=;
 b=qLmPiWAobxUJw64smnCCOogyLzv7N8HXUOD52nBOHcR1TbPQWz2CjYMaJeV9hZxMFp
 IhWr7KlnrQcRyiWqkQcP/lO7bfilF2ldyM2yoCfL+Q7ZsS9U15XSasotNs3SmwowTNHD
 X88J9ufOwalKfq2JTZrtLQn19ZukH2S+PVaIi/Rjvl1vT+JwcieCQUGRUXkOXySRQm6g
 JEsBt9jRS2lKLzVVxfkEWHko76+T+y2P5ZsWwY1QfVcXWBsQB7ZQfBD18vTommfNs6/h
 lZJSs9I6X9WB28WLqTUZhd9cw1wIcWJ151gIqbrWpe7y3D5gdKBHo+L/0QP6i0MFFOyd
 OTXg==
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
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaW5u
b2x1eC1wMDc5emNhLmMgfCAyOCArKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMKaW5kZXggYjlkZTM3YThhMGM1Li43NDE5ZjFmMGFj
ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbm5vbHV4LXAwNzl6
Y2EuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMK
QEAgLTMsNyArMyw2IEBACiAgKiBDb3B5cmlnaHQgKGMpIDIwMTcsIEZ1emhvdSBSb2NrY2hpcCBF
bGVjdHJvbmljcyBDby4sIEx0ZAogICovCiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4K
ICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIu
aD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KQEAgLTUyLDcgKzUxLDYgQEAgc3RydWN0IGlu
bm9sdXhfcGFuZWwgewogCXN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmxpbms7CiAJY29uc3Qgc3Ry
dWN0IHBhbmVsX2Rlc2MgKmRlc2M7CiAKLQlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFja2xp
Z2h0OwogCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhICpzdXBwbGllczsKIAlzdHJ1Y3QgZ3Bp
b19kZXNjICplbmFibGVfZ3BpbzsKIApAQCAtNzIsOCArNzAsNiBAQCBzdGF0aWMgaW50IGlubm9s
dXhfcGFuZWxfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlpZiAoIWlubm9sdXgt
PmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUoaW5ub2x1eC0+YmFj
a2xpZ2h0KTsKLQogCWlubm9sdXgtPmVuYWJsZWQgPSBmYWxzZTsKIAogCXJldHVybiAwOwpAQCAt
MjA0LDE4ICsyMDAsMTAgQEAgc3RhdGljIGludCBpbm5vbHV4X3BhbmVsX3ByZXBhcmUoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpCiBzdGF0aWMgaW50IGlubm9sdXhfcGFuZWxfZW5hYmxlKHN0cnVj
dCBkcm1fcGFuZWwgKnBhbmVsKQogewogCXN0cnVjdCBpbm5vbHV4X3BhbmVsICppbm5vbHV4ID0g
dG9faW5ub2x1eF9wYW5lbChwYW5lbCk7Ci0JaW50IHJldDsKIAogCWlmIChpbm5vbHV4LT5lbmFi
bGVkKQogCQlyZXR1cm4gMDsKIAotCXJldCA9IGJhY2tsaWdodF9lbmFibGUoaW5ub2x1eC0+YmFj
a2xpZ2h0KTsKLQlpZiAocmV0KSB7Ci0JCURSTV9ERVZfRVJST1IocGFuZWwtPmRldiwKLQkJCSAg
ICAgICJGYWlsZWQgdG8gZW5hYmxlIGJhY2tsaWdodCAlZFxuIiwgcmV0KTsKLQkJcmV0dXJuIHJl
dDsKLQl9Ci0KIAlpbm5vbHV4LT5lbmFibGVkID0gdHJ1ZTsKIAogCXJldHVybiAwOwpAQCAtNDgy
LDEzICs0NzAsMTMgQEAgc3RhdGljIGludCBpbm5vbHV4X3BhbmVsX2FkZChzdHJ1Y3QgbWlwaV9k
c2lfZGV2aWNlICpkc2ksCiAJCWlubm9sdXgtPmVuYWJsZV9ncGlvID0gTlVMTDsKIAl9CiAKLQlp
bm5vbHV4LT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KGRldik7Ci0JaWYgKElT
X0VSUihpbm5vbHV4LT5iYWNrbGlnaHQpKQotCQlyZXR1cm4gUFRSX0VSUihpbm5vbHV4LT5iYWNr
bGlnaHQpOwotCiAJZHJtX3BhbmVsX2luaXQoJmlubm9sdXgtPmJhc2UsIGRldiwgJmlubm9sdXhf
cGFuZWxfZnVuY3MsCiAJCSAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKIAorCWVyciA9
IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQoJmlubm9sdXgtPmJhc2UpOworCWlmIChlcnIpCisJCXJl
dHVybiBlcnI7CisKIAllcnIgPSBkcm1fcGFuZWxfYWRkKCZpbm5vbHV4LT5iYXNlKTsKIAlpZiAo
ZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKQEAgLTUyNiwxMiArNTE0LDEyIEBAIHN0YXRpYyBpbnQg
aW5ub2x1eF9wYW5lbF9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCXN0cnVj
dCBpbm5vbHV4X3BhbmVsICppbm5vbHV4ID0gbWlwaV9kc2lfZ2V0X2RydmRhdGEoZHNpKTsKIAlp
bnQgZXJyOwogCi0JZXJyID0gaW5ub2x1eF9wYW5lbF91bnByZXBhcmUoJmlubm9sdXgtPmJhc2Up
OworCWVyciA9IGRybV9wYW5lbF91bnByZXBhcmUoJmlubm9sdXgtPmJhc2UpOwogCWlmIChlcnIg
PCAwKQogCQlEUk1fREVWX0VSUk9SKCZkc2ktPmRldiwgImZhaWxlZCB0byB1bnByZXBhcmUgcGFu
ZWw6ICVkXG4iLAogCQkJICAgICAgZXJyKTsKIAotCWVyciA9IGlubm9sdXhfcGFuZWxfZGlzYWJs
ZSgmaW5ub2x1eC0+YmFzZSk7CisJZXJyID0gZHJtX3BhbmVsX2Rpc2FibGUoJmlubm9sdXgtPmJh
c2UpOwogCWlmIChlcnIgPCAwKQogCQlEUk1fREVWX0VSUk9SKCZkc2ktPmRldiwgImZhaWxlZCB0
byBkaXNhYmxlIHBhbmVsOiAlZFxuIiwgZXJyKTsKIApAQCAtNTQ5LDggKzUzNyw4IEBAIHN0YXRp
YyB2b2lkIGlubm9sdXhfcGFuZWxfc2h1dGRvd24oc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNp
KQogewogCXN0cnVjdCBpbm5vbHV4X3BhbmVsICppbm5vbHV4ID0gbWlwaV9kc2lfZ2V0X2RydmRh
dGEoZHNpKTsKIAotCWlubm9sdXhfcGFuZWxfdW5wcmVwYXJlKCZpbm5vbHV4LT5iYXNlKTsKLQlp
bm5vbHV4X3BhbmVsX2Rpc2FibGUoJmlubm9sdXgtPmJhc2UpOworCWRybV9wYW5lbF91bnByZXBh
cmUoJmlubm9sdXgtPmJhc2UpOworCWRybV9wYW5lbF9kaXNhYmxlKCZpbm5vbHV4LT5iYXNlKTsK
IH0KIAogc3RhdGljIHN0cnVjdCBtaXBpX2RzaV9kcml2ZXIgaW5ub2x1eF9wYW5lbF9kcml2ZXIg
PSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
