Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2238178E8E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECBB89CA8;
	Wed,  4 Mar 2020 10:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2DF89CA8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:41:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v2so1727873wrp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fPj5TgC2jUYLfz4Vs3gbXgfh3ZeKyckJI3P6/EwL1o=;
 b=M16492gcFm1M/b93ik55wP4X2xibbNHk+7ZvwTrQvBh4f/tG8ga7h4RR+mwYaZPAlG
 SF8rQ7AbB1ZJLmvpkZfzQgWYGBKoh9WRS2mVEy3U4SGo/pf1xfuvcM6Alj2Hc8c25yZ6
 QkwahiC1bEh+ObLBx8WL3h/YFjvLDgZowt9fVLVLHhGD9DOw10Mz6neFPFJy5GPcWYqh
 t18UuoPLqfOD0r+edKcH7R3IeRh7KPhkp8AaKKYS4IWHm9HPXm31AGCBEAuYAmHfp+9J
 uuc7S8XJf0qdtd43gcVrhhr7CEVuYdHiLXOcZ4spz+OgWpwPk6ihPqia18y4V4ouP6A3
 8mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fPj5TgC2jUYLfz4Vs3gbXgfh3ZeKyckJI3P6/EwL1o=;
 b=UblVuhRI3lUH+6wzFFTP+Brk12LxYuO1yxcFZCmxv49A1cfHeEZ3iJU/8rp3Xuan4q
 U22kiowDNTAJNmcQKWG0fTBtY2oPEXeaX1ksm6GXtJ4eeDvlCR8xVX3u864dBsg+46cH
 lN3ucWwXnXxAdh8To3lU0nrETjeLUqTBqgBu8vpsc7IzMMwpQhDMK13GkwI8jxM65zx0
 93nQ6gis72VedNoDEVaPUzixOKSanls8jmm4aRX7Jb7Vmxa3dfG6t2iytftxwmYdjQ29
 4lMXyG7T/SOwlRrwWM0t6Bp7nv7rQliF9zqvDnnLdirSlmZd5QNG5kYuUdJpVJEKjr9m
 TOjQ==
X-Gm-Message-State: ANhLgQ092hUPuJp3ehyM7n/V1He0QV1ukwt8EwGSkYH/jOTbks5k5lTj
 mHMrGlek0oxeDnt41C7G/ZOaqg==
X-Google-Smtp-Source: ADFU+vsLT+l1ePDs5v3r0T9iY83Llt3kWCUJwmA48pBvBjPuVueZH/TNfPGj/dvaQYJSc5KIiiLFbQ==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr3339405wrq.333.1583318461487; 
 Wed, 04 Mar 2020 02:41:01 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:41:01 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de, heiko@sntech.de, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 03/11] drm/bridge: dw-hdmi: Plug atomic state hooks to the
 default implementation
Date: Wed,  4 Mar 2020 11:40:44 +0100
Message-Id: <20200304104052.17196-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200304104052.17196-1-narmstrong@baylibre.com>
References: <20200304104052.17196-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGF0b21pY19kdXBsaWNhdGVfc3RhdGUvYXRvbWljX2Rlc3Ryb3lfc3RhdGUvYXRvbWljX3Jl
c2V0IGJyaWRnZQpmdW5jcyB0byBhbGxvdyBzZXR1cCBvZiBhdG9taWMgYnJpZGdlIHN0YXRlLgoK
U2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpS
ZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IEplcm5laiDFoGtyYWJlYyA8amVybmVqLnNrcmFiZWNA
c2lvbC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMg
fCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggZTA5N2Y2MGU2NDMxLi45ZjI5MTg4OThm
NjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0yNTA2
LDYgKzI1MDYsOSBAQCBzdGF0aWMgdm9pZCBkd19oZG1pX2JyaWRnZV9lbmFibGUoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1
bmNzIGR3X2hkbWlfYnJpZGdlX2Z1bmNzID0geworCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0g
ZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX2R1cGxpY2F0ZV9zdGF0ZSwKKwkuYXRvbWljX2Rlc3Ry
b3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfZGVzdHJveV9zdGF0ZSwKKwkuYXRv
bWljX3Jlc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX3Jlc2V0LAogCS5hdHRhY2ggPSBk
d19oZG1pX2JyaWRnZV9hdHRhY2gsCiAJLmRldGFjaCA9IGR3X2hkbWlfYnJpZGdlX2RldGFjaCwK
IAkuZW5hYmxlID0gZHdfaGRtaV9icmlkZ2VfZW5hYmxlLAotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
