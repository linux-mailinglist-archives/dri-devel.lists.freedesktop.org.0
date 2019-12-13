Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E256011E924
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838E06EB69;
	Fri, 13 Dec 2019 17:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25946EB64
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d16so236329wre.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBZaJnQ4T1pfuiYbNCV33pBAl/MiKps57aCdhCCq5GA=;
 b=SgCyprn+TJhfzJrAyOElFygAGYPjDOq49M6+F+et6rfEOdkuMx54OxKa1htCbgaOvN
 XHYlumbXc2snqLMJhb/p1vhbxd2+u7uERrXewvnV9bJZZAN1XYVqQ3i95Lj/8ZnI1QbX
 wBlGUBqXY5npseRH3RKCUbJy/msPwKjx28JhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBZaJnQ4T1pfuiYbNCV33pBAl/MiKps57aCdhCCq5GA=;
 b=TI0/wkVTAsMvLkR2XK2fXaHItJ7tncMcS2rK+cIMUMjAkGtSE+zkOjrz33HO1hnt9Y
 PQBR4KQRGxAn6ESgpqdhI0Fv+bknoxrqq9rcF+6r0la7sJERPZxsdXzc7cpHrka6MQlP
 P/bVMJnnxLvD/zqAMGDeFl0Q3JpAHpHT5KwO+4JzpoYBVeRBPEpXltp9lWeSvxMrCw/H
 UJzh5geO+5yPi+1QQCmD8uH6ZwxjTiUc/sezgAm8DMhPV1u8bgsKeVeaDFyEDgv9WbPM
 AwgGJIV6YGQpj4mgI2+6vbWK5L7H6iNcqnQ7Lbx0LH89ZygNcFdUETL/EzxiWQhdNxVU
 O7iw==
X-Gm-Message-State: APjAAAXG+5LBi2pMQbmwz+XW22co+iIfKXzPnKgfTrnn529H05CzNeap
 wriU67BPNEqe5LMnePN0ZQDiAfFhFZg=
X-Google-Smtp-Source: APXvYqySnMsLeoZE9VQ1vmqK71rJv5VV+5cxXaKC6Jepc5ChVNTPeNt0FFqW4uks4ZmZYYpHvNA/fQ==
X-Received: by 2002:adf:e609:: with SMTP id p9mr13492290wrm.397.1576257984206; 
 Fri, 13 Dec 2019 09:26:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:23 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/10] drm/xrockchip: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:08 +0100
Message-Id: <20191213172612.1514842-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2tpbmcgYm90aCBpcyBvbmUgdG9vIG11Y2gsIHNvIHdyYXAgYSBXQVJOX09OIGFyb3VuZCBp
dCB0byBzdG9wZQp0aGUgY29weXBhc3RhLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMu
Y29tPgpDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgpDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZy
YWRlYWQub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Au
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCmluZGV4IGQwNGIz
NDkyYmRhYy4uY2VjYjJjYzc4MWY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX3ZvcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2Nr
Y2hpcF9kcm1fdm9wLmMKQEAgLTcyNCw3ICs3MjQsNyBAQCBzdGF0aWMgaW50IHZvcF9wbGFuZV9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJaW50IG1heF9zY2FsZSA9IHdp
bi0+cGh5LT5zY2wgPyBGUkFDXzE2XzE2KDgsIDEpIDoKIAkJCQkJRFJNX1BMQU5FX0hFTFBFUl9O
T19TQ0FMSU5HOwogCi0JaWYgKCFjcnRjIHx8ICFmYikKKwlpZiAoIWNydGMgfHwgV0FSTl9PTigh
ZmIpKQogCQlyZXR1cm4gMDsKIAogCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9leGlzdGlu
Z19jcnRjX3N0YXRlKHN0YXRlLT5zdGF0ZSwgY3J0Yyk7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
