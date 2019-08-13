Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6200B8E6C8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915426E922;
	Thu, 15 Aug 2019 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771E989CD5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:03:35 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id 15so16802471ybj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=5GrEzYiIH/unCsaBGko1TspkMkNP+HLKhnYgNzhRAT4=;
 b=eEc6XyP+ngfZnXL+kcFlziWS+gYlUWgvNLcVhqSS807IGUJvj5ZOJQvC4paG7/CnNI
 DlVcZ5tp6EC2u7EFYKHMlIaTvOtNt+yaXLUboWD+PeTUhaCpB5NQz66YeUfDKDpjuuL0
 O498RNnyQyviW6wQokb7lIk5i2s0ziGaPxK78b0j3uGvfBPPNsAa47/tsOIyQbZBLDSX
 6x6jWeAflCYb7ggN4sy9NPbVoN3n7X4HYCwEyv08mQnC6SLdusF8wOQUHLXGecWmFBcE
 L65W+sob+snEDltHpoWTvkb93Yyw3zHuiI8ucV6tzqMrqjkjQRQSMpTLyMwvMO9HYXQv
 SIuw==
X-Gm-Message-State: APjAAAU1rq+mg7VrwOji1aPHX1gKJ4JDhxR9htnMkKuUmty0SKFBz9b5
 +vbnQFWvQDNmWv4L/qk5xAh5BEN/XdW5wCP8fOBguBFlSAvMzetifjhPwlX2avL/mSPexsYh3Ze
 agCnotv+PHDatmxNmlcb3XPNKZp3B+IAeijamrCXXd5uR9x/0VpLhWHvWkbHTUIGlhIB712jPMg
 ==
X-Google-Smtp-Source: APXvYqyLX95KpXN3rEOFXH9arwYXUA/oLB6wYatzxBSXGEWX+FrwajWLVr74R5bJlf/QCVJsods1yg8mh6Q=
X-Received: by 2002:a81:3049:: with SMTP id w70mr18532978yww.173.1565694213999; 
 Tue, 13 Aug 2019 04:03:33 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:02:32 +0200
Message-Id: <20190813110300.83025-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 0/8] drm: cec: convert DRM drivers to the new notifier API
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=5GrEzYiIH/unCsaBGko1TspkMkNP+HLKhnYgNzhRAT4=;
 b=cJ1sWLezAPje8Ue86Ba2meCZXrGWldpGuZC9PGrAChxYC4BaOOjBPlTlrR436zld0j
 sauqlMGYlcV6OH4do/7YT3ZW57sbOh5ZWQk/ACkuhZsxg93be0rcnkwgf2mkAv6qABis
 ePIz4dr45qv+8Hc8Q4kQwDZHNns4RdzC3UMeIhfY9Dsq3Nhe9tcYL2jXccLMTxts2pdR
 12aw3QAASlkykVxmp+xXe/OKHSlVqNmKPeOByVys/jQp0eYvXk5rA+6SMW6XSkXLhvkH
 tcPCkdF7MvkeCFDim4FJVuHrcWvPb1fn10vzFjUeUF2j2eh8TLrVCk+aMzndotIi1xle
 weSQ==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Allison Randal <allison@lohutok.net>,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 open list <linux-kernel@vger.kernel.org>,
 Colin Ian King <colin.king@canonical.com>,
 Dariusz Marcinkiewicz <darekm@google.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgdXBkYXRlcyBEUk0gZHJpdmVycyB0byB1c2UgbmV3IENFQyBub3RpZmllciBB
UEkuCgpPbmx5IGZpcnN0IHR3byBwYXRjaGVzIHdlcmUgdGVzdGVkIG9uIHRoZSBhY3R1YWwgaGFy
ZHdhcmUuCgpDaGFuZ2VzIHNpbmNlIHY1OgoJRml4ZWQgYSB3YXJuaW5nIGFib3V0IGEgbWlzc2lu
ZyBjb21tZW50IGZvciBhIG5ldyBtZW1iZXIgb2YKCWRybV9kcF9hdXhfY2VjIHN0cnVjdC4gU2Vu
ZGluZyB0byBhIHdpZGVyIGF1ZGllbmNlLCBpbmNsdWRpbmcKCW1haW50YWluZXJzIG9mIHJlc3Bl
Y3RpdmUgZHJpdmVycy4KQ2hhbmdlcyBzaW5jZSB2NDoKCUFkZHJlc3NpbmcgcmV2aWV3IGNvbW1l
bnRzLgpDaGFuZ2VzIHNpbmNlIHYzOgogICAgICAgIFVwZGF0ZWQgYWRhcHRlciBmbGFncyBpbiBk
dy1oZG1pLWNlYy4KQ2hhbmdlcyBzaW5jZSB2MjoKCUluY2x1ZGUgYWxsIERSTSBwYXRjaGVzIGZy
b20gImNlYzogaW1wcm92ZSBub3RpZmllciBzdXBwb3J0LAoJYWRkIGNvbm5lY3RvciBpbmZvIGNv
bm5lY3RvciBpbmZvIiBzZXJpZXMuCkNoYW5nZXMgc2luY2UgdjE6CglUaG9zZSBwYXRjaGVzIGRl
bGF5IGNyZWF0aW9uIG9mIG5vdGlmaWVycyB1bnRpbCByZXNwZWN0aXZlCgljb25uZWN0b3JzIGFy
ZSBjb25zdHJ1Y3RlZC4gSXQgc2VlbXMgdGhhdCB0aG9zZSBwYXRjaGVzLCBmb3IgYQoJY291cGxl
IG9mIGRyaXZlcnMsIGJ5IGFkZGluZyB0aGUgZGVsYXksIGludHJvZHVjZSBhIHJhY2UgYmV0d2Vl
bgoJbm90aWZpZXJzJyBjcmVhdGlvbiBhbmQgdGhlIElSUXMgaGFuZGxpbmcgdGhyZWFkcyAtIGF0
IGxlYXN0IEkKCWRvbid0IHNlZSBhbnl0aGluZyBvYnZpb3VzIGluIHRoZXJlIHRoYXQgd291bGQg
ZXhwbGljaXRseSBmb3JiaWQKCXN1Y2ggcmFjZXMgdG8gb2NjdXIuIHYyIGFkZHMgYSB3cml0ZSBi
YXJyaWVyIHRvIG1ha2Ugc3VyZSBJUlEKCXRocmVhZHMgc2VlIHRoZSBub3RpZmllciBvbmNlIGl0
IGlzIGNyZWF0ZWQgKHJlcGxhY2luZyB0aGUKCVdSSVRFX09OQ0UgSSBwdXQgaW4gdjEpLiBUaGUg
YmVzdCB0aGluZyB0byBkbyBoZXJlLCBJIGJlbGlldmUsCgl3b3VsZCBiZSBub3QgdG8gaGF2ZSBh
bnkgc3luY2hyb25pemF0aW9uIGFuZCBtYWtlIHN1cmUgdGhhdCBhbiBJUlEKCW9ubHkgZ2V0cyBl
bmFibGVkIGFmdGVyIHRoZSBub3RpZmllciBpcyBjcmVhdGVkLgoKRGFyaXVzeiBNYXJjaW5raWV3
aWN6ICg4KToKICBkcm0vaTkxNS9pbnRlbF9oZG1pOiB1c2UgY2VjX25vdGlmaWVyX2Nvbm5fKHVu
KXJlZ2lzdGVyCiAgZHctaGRtaS1jZWM6IHVzZSBjZWNfbm90aWZpZXJfY2VjX2FkYXBfKHVuKXJl
Z2lzdGVyCiAgdGRhOTk1MDogdXNlIGNlY19ub3RpZmllcl9jZWNfYWRhcF8odW4pcmVnaXN0ZXIK
ICBkcm06IHRkYTk5OHg6IHVzZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKICBkcm06
IHN0aTogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcgogIGRybTogdGVncmE6IHVz
ZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKICBkcm06IGR3LWhkbWk6IHVzZSBjZWNf
bm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKICBkcm06IGV4eW5vczogZXh5bm9zX2hkbWk6IHVz
ZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWktY2VjLmMgfCAxMyArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCAzNiArKysrKysrKysrKy0tLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgICAgICAgICAgfCAzMSArKysrKysrKyst
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5NTAuYyAgICAgICAgICAgICAgICAgfCAx
MiArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMgICAgICAgICAgICAg
fCAzMyArKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9oZG1pLmMgICAgIHwgMTMgKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5j
ICAgICAgICAgICAgICAgIHwgMTkgKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291
dHB1dC5jICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKystLS0tCiA4IGZpbGVzIGNoYW5n
ZWQsIDExNyBpbnNlcnRpb25zKCspLCA2OCBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAucmMxLjE1
My5nZGVlZDgwMzMwZi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
