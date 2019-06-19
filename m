Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475244B3B0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 10:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B4F6E321;
	Wed, 19 Jun 2019 08:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07E26E334
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 08:11:25 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so25852068edq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 01:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MC/t0+GCQCXJ5HUw0cDp3wEG1uegYs81hRvZB9zVfE0=;
 b=hMzDuK1CytDHJd46Jc9xfrvD6bkKszNFK/8mGG6bCAsWoglYv5ATPfaeuzSD3z1qSR
 1uO5d/bgLPWXtYO/fWoSJCKQ5FLrrMfXZJOBTusSQR+iVuSLOmW2gX1NuCeWHOoWHgm7
 41G9QjfKaXYCgTz5j1u44a7nYKiruW7g70ilVrI69/l2zabfKwbhT4shSGn9O+dybINs
 Ee/uk8IrxZEpJpr9B/pxZzsOq/0YXXTiX9HYatEqU8rBZ42yri1LUXSHa4gfIM9DWwu0
 0k6t2puz7auoGJZRSsdYgi3Nfwg0nZmvxAqdFCSJy5MnQBRrPzMgM79Zt2ycV19dzPWt
 ITug==
X-Gm-Message-State: APjAAAUr7fVHRZDPh+u0C8v9TAPCRsAHOkVUxkDu6nu8tuVXJ2JfWt52
 2DMODF3cg2OvpWzA+SltXC0s+Q==
X-Google-Smtp-Source: APXvYqyzTlz7Dqh5Dq8iiPWQJepg5nNh+DInaUL45FQ0/ysRzTOM13RL70UlqW1akAA2NnNB+6n7Sg==
X-Received: by 2002:a50:b343:: with SMTP id r3mr44092303edd.16.1560931884407; 
 Wed, 19 Jun 2019 01:11:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x4sm5562329eda.22.2019.06.19.01.11.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 01:11:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] fbcon: Export fbcon_update_vcs
Date: Wed, 19 Jun 2019 10:11:15 +0200
Message-Id: <20190619081115.27921-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MC/t0+GCQCXJ5HUw0cDp3wEG1uegYs81hRvZB9zVfE0=;
 b=TCSvmjBFMsZZpW3/6MEVx/M9rF5A1CIG3A8MxzxJxdmjwtt3zBZJhDrICd3UjKokZG
 GdVSHPAkfPNi9HmYnYnLR9+c0Fzdn18pvcnp1ZUU1KOmqejSfqXlRka+TsfuMM/UwQNt
 1oGFzgQsKETlSKCa8LEXGuV2ekdZCkNVa/tP4=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kbuild test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jingoo Han <jingoohan1@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBmYWlsZWQgdG8gc3BvdCB0aGlzIHdoaWxlIGNvbXBpbGUtdGVzdGluZy4gT29wcy4KClJlcG9y
dGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KRml4ZXM6IDllMTQ2NzAw
MjYzMCAoImZiY29uOiByZXBsYWNlIEZCX0VWRU5UX01PREVfQ0hBTkdFL19BTEwgd2l0aCBkaXJl
Y3QgY2FsbHMiKQpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogRGFuaWVsIFRob21wc29uIDxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CkNjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KQ2M6IEJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2Vk
ZUByZWRoYXQuY29tPgpDYzogWWlzaGVuZyBYaWUgPHlzeGllQGZveG1haWwuY29tPgpDYzogIk1p
Y2hhxYIgTWlyb3PFgmF3IiA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+CkNjOiBQZXRlciBSb3Np
biA8cGVkYUBheGVudGlhLnNlPgpDYzogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2NrYUByZWRoYXQu
Y29tPgpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+CkNjOiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4KQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29u
LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2ZiY29uLmMKaW5kZXggYjgwNjdlMDdmOGE4Li5jOTIzNWEyZjQyZjggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYmNvbi5jCkBAIC0zMDM3LDYgKzMwMzcsNyBAQCB2b2lkIGZiY29uX3VwZGF0ZV92Y3Mo
c3RydWN0IGZiX2luZm8gKmluZm8sIGJvb2wgYWxsKQogCWVsc2UKIAkJZmJjb25fbW9kZWNoYW5n
ZWQoaW5mbyk7CiB9CitFWFBPUlRfU1lNQk9MKGZiY29uX3VwZGF0ZV92Y3MpOwogCiBpbnQgZmJj
b25fbW9kZV9kZWxldGVkKHN0cnVjdCBmYl9pbmZvICppbmZvLAogCQkgICAgICAgc3RydWN0IGZi
X3ZpZGVvbW9kZSAqbW9kZSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
