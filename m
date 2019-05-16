Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7E21029
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 23:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF09989467;
	Thu, 16 May 2019 21:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD156897DC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 21:40:50 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id g9so2507138pfo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hVv4kB5Ecy4Nzot5JSmd+w2kmDQzag6YdAwhTawAS+o=;
 b=VMOmBV7RGRLoxMUBcTNSJm/tbRpYbxWrXOT0I6Ba38rHsqNDWc4UCldLWjJjkob0nP
 81myP4D275sq/+omLl1inC1wA47kHoexxq8fzH9LmYs5hEa1Boyxwie+hTbOCl25kR9Y
 o6bzS/GxoWAecKATp715hZq5hnFFUg0hKdAr19GbSRpM7hH42h3+YlbHlMNFgE9x/6qK
 ZvsQZFakeuOjXqzGHj3ojBpTUKzMiwLpzXFTVdUUMeL/IR2QB+dPdL8Mar8Ub79QX1IQ
 2K5zD37ZiqEIE9q+Ggv5cVLqLw0oFLwP/m0oXnWJoFdAfqVeuryNLMYdWShTRuDRpg2p
 a/rw==
X-Gm-Message-State: APjAAAXwlESvKftqsGf15e4FLsSITFZ2iJkqzCeybY/oMRHkxMOrf5xY
 jAzkAMHo2tDdO1OUXXgo4sR+oQ==
X-Google-Smtp-Source: APXvYqyP0E6DNadrM+r5JhT3uOu5deldF8xqqkH34aEOJ4KlNc8FJkCV2ERtDfIFBJk2wFdQq4Is2w==
X-Received: by 2002:a63:d343:: with SMTP id u3mr53012185pgi.285.1558042850353; 
 Thu, 16 May 2019 14:40:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v4sm13127252pff.45.2019.05.16.14.40.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 14:40:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 2/2] drm/rockchip: dw_hdmi: Handle suspend/resume
Date: Thu, 16 May 2019 14:40:22 -0700
Message-Id: <20190516214022.65220-2-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190516214022.65220-1-dianders@chromium.org>
References: <20190516214022.65220-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hVv4kB5Ecy4Nzot5JSmd+w2kmDQzag6YdAwhTawAS+o=;
 b=C2mEaCV5q7RRlPDkTl+jNc69GKmHQGbUzwdCXb4uJuIQRqjiwjE8vEVrEuUybINuD1
 CaXvTTgS7AqB5rKqV9O2SfHGsVPYh/UdIAMeuPT128yOp4EI0fA8af3ZBM+HxlhYaScP
 IQMWJsOKUNzn9FS7aX/h9q0stQ3lFpm6IpUEk=
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
 mka@chromium.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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
IGluIHYyOgotIEFkZCBmb3Jnb3R0ZW4gc3RhdGljIChMYXVyZW50KQotIE5vIGVtcHR5IHN0dWIg
Zm9yIHN1c3BlbmQgKExhdXJlbnQpCgogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWkt
cm9ja2NoaXAuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2Nr
Y2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwppbmRl
eCA0Y2RjOWY4NmMyZTUuLmJlZmZlNDRjMjQ4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHdfaGRtaS1yb2NrY2hpcC5jCkBAIC01NDIsMTEgKzU0MiwyMyBAQCBzdGF0aWMgaW50IGR3
X2hkbWlfcm9ja2NoaXBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0
dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdfaGRtaV9yb2NrY2hpcF9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0cnVjdCByb2NrY2hpcF9oZG1pICpoZG1p
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwlyZXR1cm4gZHdfaGRtaV9yZXN1bWUoaGRtaS0+
aGRtaSk7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd19oZG1pX3JvY2tj
aGlwX3BtID0geworCVNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKE5VTEwsIGR3X2hkbWlfcm9ja2No
aXBfcmVzdW1lKQorfTsKKwogc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd19oZG1pX3JvY2tjaGlw
X3BsdGZtX2RyaXZlciA9IHsKIAkucHJvYmUgID0gZHdfaGRtaV9yb2NrY2hpcF9wcm9iZSwKIAku
cmVtb3ZlID0gZHdfaGRtaV9yb2NrY2hpcF9yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUg
PSAiZHdoZG1pLXJvY2tjaGlwIiwKKwkJLnBtID0gJmR3X2hkbWlfcm9ja2NoaXBfcG0sCiAJCS5v
Zl9tYXRjaF90YWJsZSA9IGR3X2hkbWlfcm9ja2NoaXBfZHRfaWRzLAogCX0sCiB9OwotLSAKMi4y
MS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
