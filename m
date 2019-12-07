Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFEB115C8E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50AD6E18E;
	Sat,  7 Dec 2019 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F54E6E18E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:28 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s22so10701039ljs.7
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=63FAYeXHOLWZvE39+BvFTQvx8rk1mNWwTMgVp4w9KIs=;
 b=oLLRb80SlJPcVu+e9jMaozhOspjvgxjhM5SkNSg7lnuAGXZxgoNe79Kw70GRpLggab
 5w7qijf/RMn7o+k7ig6ye4IGcDVYa48tyiZL/6t1zrIe2UQupHZ+Jw4Pq6ctm8WsT9CA
 ERiCrQgKWZqB6+Ms09yJ4avXk/J3KU3TM6r/vXynaxLmrC0g+qR+xW1hVeYwIpwo82PW
 g0tYoyfz/6b1a5KcNQOjPddwmXG55YTuSUjqibxnz5wuxFHu1eSH8xuDlETqBJv8HXcy
 38GVyGBJN4vx7/V+JcVnOMMfnvRuSmNxLDYOAS13Q+3AgWPPAivMJ+h593UYTJaBjf17
 iT4Q==
X-Gm-Message-State: APjAAAW4q89Wnra0Ww5JcD7b4UDr9dzRWYw3xVvxOoL808Fc20oqEb+a
 m/s3RK8UNxeJI3EOeLgwYg+ZWsip3goNVA==
X-Google-Smtp-Source: APXvYqwCXvyDmoKVIc4zlBB2XBU0M9Y6CN9iEAOB/MhVUE9gB+QmdDrvfL6CdFab3+wa1LcGnDUevg==
X-Received: by 2002:a2e:548:: with SMTP id 69mr11532790ljf.67.1575727466338;
 Sat, 07 Dec 2019 06:04:26 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:25 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 09/25] drm/panel: ilitek-ili9881c: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:37 +0100
Message-Id: <20191207140353.23967-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63FAYeXHOLWZvE39+BvFTQvx8rk1mNWwTMgVp4w9KIs=;
 b=HqZQqzcXLz6qqDnZBbtAncz09h4HHdF2Rkf9L00gHYZQMGeLF4pATtZsOyBRySDv3s
 Bl3agh2QBKbOWCqCed3xKaiQ1hIYC4wfRE3lkCWQUbcCp2hc82VNbjrgwBfWtPlyOUUj
 TJPJwwUs5scJ4AZ3yh3dgLIhOcFzhQCvGwbnLzxnHt909E9Zlma812SMN43OXAbuKxhA
 TH6UiuR0tJW2YyO2/ggmZGxM7VQ+KvuhI20nEw/+PuNfy6SuD4QeOEzWmGd6pbg/zb+1
 IKovefo+w7fUJoUZPp71KIiPRelS6vNLmT9JDbi+oRq5TSvBn3wWF86rEoCCs2oWMu1x
 V6Sw==
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
cGFuZWwtaWxpdGVrLWlsaTk4ODFjLmMgfCAxOSArKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTk4ODFjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTk4ODFjLmMKaW5kZXggMzFlNWE0ZTY3NzUwLi5m
NTQwNzdjMjE2YTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0
ZWstaWxpOTg4MWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWls
aTk4ODFjLmMKQEAgLTMsNyArMyw2IEBACiAgKiBDb3B5cmlnaHQgKEMpIDIwMTctMjAxOCwgQm9v
dGxpbgogICovCiAKLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2Vy
ci5oPgpAQCAtMjUsNyArMjQsNiBAQCBzdHJ1Y3QgaWxpOTg4MWMgewogCXN0cnVjdCBkcm1fcGFu
ZWwJcGFuZWw7CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZQkqZHNpOwogCi0Jc3RydWN0IGJhY2ts
aWdodF9kZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yCSpwb3dlcjsKIAlzdHJ1
Y3QgZ3Bpb19kZXNjCSpyZXNldDsKIH07CkBAIC0zNDgsNyArMzQ2LDYgQEAgc3RhdGljIGludCBp
bGk5ODgxY19lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJbXNsZWVwKDEyMCk7CiAK
IAltaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb24oY3R4LT5kc2kpOwotCWJhY2tsaWdodF9lbmFi
bGUoY3R4LT5iYWNrbGlnaHQpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0zNTcsNyArMzU0LDYgQEAg
c3RhdGljIGludCBpbGk5ODgxY19kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewog
CXN0cnVjdCBpbGk5ODgxYyAqY3R4ID0gcGFuZWxfdG9faWxpOTg4MWMocGFuZWwpOwogCi0JYmFj
a2xpZ2h0X2Rpc2FibGUoY3R4LT5iYWNrbGlnaHQpOwogCXJldHVybiBtaXBpX2RzaV9kY3Nfc2V0
X2Rpc3BsYXlfb2ZmKGN0eC0+ZHNpKTsKIH0KIApAQCAtNDIzLDcgKzQxOSw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNzIGlsaTk4ODFjX2Z1bmNzID0gewogCiBzdGF0aWMg
aW50IGlsaTk4ODFjX2RzaV9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiB7Ci0J
c3RydWN0IGRldmljZV9ub2RlICpucDsKIAlzdHJ1Y3QgaWxpOTg4MWMgKmN0eDsKIAlpbnQgcmV0
OwogCkBAIC00NDgsMTQgKzQ0Myw5IEBAIHN0YXRpYyBpbnQgaWxpOTg4MWNfZHNpX3Byb2JlKHN0
cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKIAkJcmV0dXJuIFBUUl9FUlIoY3R4LT5yZXNldCk7
CiAJfQogCi0JbnAgPSBvZl9wYXJzZV9waGFuZGxlKGRzaS0+ZGV2Lm9mX25vZGUsICJiYWNrbGln
aHQiLCAwKTsKLQlpZiAobnApIHsKLQkJY3R4LT5iYWNrbGlnaHQgPSBvZl9maW5kX2JhY2tsaWdo
dF9ieV9ub2RlKG5wKTsKLQkJb2Zfbm9kZV9wdXQobnApOwotCi0JCWlmICghY3R4LT5iYWNrbGln
aHQpCi0JCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKLQl9CisJcmV0ID0gZHJtX3BhbmVsX29mX2Jh
Y2tsaWdodCgmY3R4LT5wYW5lbCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAogCXJldCA9
IGRybV9wYW5lbF9hZGQoJmN0eC0+cGFuZWwpOwogCWlmIChyZXQgPCAwKQpAQCAtNDc1LDkgKzQ2
NSw2IEBAIHN0YXRpYyBpbnQgaWxpOTg4MWNfZHNpX3JlbW92ZShzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2kpCiAJbWlwaV9kc2lfZGV0YWNoKGRzaSk7CiAJZHJtX3BhbmVsX3JlbW92ZSgmY3R4
LT5wYW5lbCk7CiAKLQlpZiAoY3R4LT5iYWNrbGlnaHQpCi0JCXB1dF9kZXZpY2UoJmN0eC0+YmFj
a2xpZ2h0LT5kZXYpOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
