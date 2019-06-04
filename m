Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634F3513A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 22:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3F89BB0;
	Tue,  4 Jun 2019 20:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C30589BB0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 20:42:33 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q10so3180957pff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 13:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NL5DPTKKMNZWvD7Hnx1KIRpy/8nRGAMXIh44aNGHSaY=;
 b=AS1bSBrGuZ2DZUCjqeCsqXgJRgN+zxWv2eD6+zJxLNvv94xktry92KTgDIhfbgfT0g
 8lWPz80ODyP+J+KxASLhWNzQCgCeClYXgLVfotYN37SQAEfJQWDiVUSQ+unV6EPV0x9J
 4zkpTVLu02rbCs3nS8HEhM2Yf1YdyADjpzcHNO3pMH0tW9OhXX1daTL7tEKF+7PvxqMC
 0sXua0uzWQO1Msyy23PtFDB/V+NlcQvcvNgdUIfmsVBYYZPSKoAsLkLQ6VTalCMRUCEq
 XXib1jQ7jQ5RZ8SUjNJhIhOItSxtOcp1eC7ZT+RKT9MjQREjDyr4PcGSFzbLZdtwBYT/
 c6fw==
X-Gm-Message-State: APjAAAW4kOL/k9XHLteZHZVo7wIiHy2mE9lwPZ9lAGfPz0yDKZNtKFEC
 Yr8fxKyPTsyxlGxTb+jOdQeo0Q==
X-Google-Smtp-Source: APXvYqy6yGca0NfMnlay8Iio+11gDCTu9XCNqkdRwwop7IybVxYxXjJ3nlJNPRuR6O5jg/ll53xR3w==
X-Received: by 2002:a63:2bd1:: with SMTP id r200mr633202pgr.202.1559680952939; 
 Tue, 04 Jun 2019 13:42:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id m5sm11553616pgn.59.2019.06.04.13.42.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 13:42:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Sean Paul <seanpaul@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 2/2] drm/rockchip: dw_hdmi: Handle suspend/resume
Date: Tue,  4 Jun 2019 13:42:07 -0700
Message-Id: <20190604204207.168085-2-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190604204207.168085-1-dianders@chromium.org>
References: <20190604204207.168085-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NL5DPTKKMNZWvD7Hnx1KIRpy/8nRGAMXIh44aNGHSaY=;
 b=TVOLIvqXNvIKZDyIwK8wpLxqIpKlUqfTCiUrsEkG21UZPFVpKJ6u/ERmqbwBnZ100J
 MXZP+S/ZMqjo48TC2q466d1DX8mhAZ31orqtTrnRjWiiiEZT++FMmvnf+4CFvTY0hdRh
 jRJliijhyE9rK1ULJ56hNMxT1YaXl3L8Q43wg=
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
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 mka@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gUm9ja2NoaXAgcmszMjg4LWJhc2VkIENocm9tZWJvb2tzIHdoZW4geW91IGRvIGEgc3VzcGVu
ZC9yZXN1bWUKY3ljbGU6CgoxLiBZb3UgbG9zZSB0aGUgYWJpbGl0eSB0byBkZXRlY3QgYW4gSERN
SSBkZXZpY2UgYmVpbmcgcGx1Z2dlZCBpbi4KCjIuIElmIHlvdSdyZSB1c2luZyB0aGUgaTJjIGJ1
cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMKd29ya2luZy4KCkxldCdzIGNhbGwg
dGhlIGNvcmUgZHctaGRtaSdzIHN1c3BlbmQvcmVzdW1lIGZ1bmN0aW9ucyB0byByZXN0b3JlCnRo
aW5ncy4KCk5PVEU6IGluIGRvd25zdHJlYW0gQ2hyb21lIE9TIChiYXNlZCBvbiBrZXJuZWwgMy4x
NCkgd2UgdXNlZCB0aGUKImxhdGUvZWFybHkiIHZlcnNpb25zIG9mIHN1c3BlbmQvcmVzdW1lIGJl
Y2F1c2Ugd2UgZm91bmQgdGhhdCB0aGUgVk9QCndhcyBzb21ldGltZXMgcmVzdW1pbmcgYmVmb3Jl
IGR3X2hkbWkgYW5kIHRoZW4gY2FsbGluZyBpbnRvIHVzIGJlZm9yZQp3ZSB3ZXJlIGZ1bGx5IHJl
c3VtZWQuICBGb3Igbm93IEkgaGF2ZSBnb25lIGJhY2sgdG8gdGhlIG5vcm1hbApzdXNwZW5kL3Jl
c3VtZSBiZWNhdXNlIEkgY2FuJ3QgcmVwcm9kdWNlIHRoZSBwcm9ibGVtcy4KClNpZ25lZC1vZmYt
Ynk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KLS0tCgpDaGFuZ2Vz
IGluIHYzOgotIGR3X2hkbWlfcmVzdW1lKCkgaXMgbm93IGEgdm9pZCBmdW5jdGlvbiAoTGF1cmVu
dCkKCkNoYW5nZXMgaW4gdjI6Ci0gQWRkIGZvcmdvdHRlbiBzdGF0aWMgKExhdXJlbnQpCi0gTm8g
ZW1wdHkgc3R1YiBmb3Igc3VzcGVuZCAoTGF1cmVudCkKCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHdfaGRtaS1yb2NrY2hpcC5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2R3X2hkbWktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJv
Y2tjaGlwLmMKaW5kZXggNGNkYzlmODZjMmU1Li43YmIwZjkyMmIzMDMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwpAQCAtNTQyLDExICs1NDIsMjUgQEAg
c3RhdGljIGludCBkd19oZG1pX3JvY2tjaGlwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3X2hk
bWlfcm9ja2NoaXBfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3Qgcm9ja2No
aXBfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCisJZHdfaGRtaV9yZXN1bWUo
aGRtaS0+aGRtaSk7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZf
cG1fb3BzIGR3X2hkbWlfcm9ja2NoaXBfcG0gPSB7CisJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMo
TlVMTCwgZHdfaGRtaV9yb2NrY2hpcF9yZXN1bWUpCit9OworCiBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGR3X2hkbWlfcm9ja2NoaXBfcGx0Zm1fZHJpdmVyID0gewogCS5wcm9iZSAgPSBkd19oZG1p
X3JvY2tjaGlwX3Byb2JlLAogCS5yZW1vdmUgPSBkd19oZG1pX3JvY2tjaGlwX3JlbW92ZSwKIAku
ZHJpdmVyID0gewogCQkubmFtZSA9ICJkd2hkbWktcm9ja2NoaXAiLAorCQkucG0gPSAmZHdfaGRt
aV9yb2NrY2hpcF9wbSwKIAkJLm9mX21hdGNoX3RhYmxlID0gZHdfaGRtaV9yb2NrY2hpcF9kdF9p
ZHMsCiAJfSwKIH07Ci0tIAoyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
