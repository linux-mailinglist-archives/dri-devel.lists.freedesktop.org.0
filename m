Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13931178E91
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5D6E05D;
	Wed,  4 Mar 2020 10:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56EA89B70
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:41:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r7so1778108wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 02:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ajIJB0wcFTIisjxYEYMgxm+dr9nVY4WUtZ38KJr42sk=;
 b=wg0RvIDCGd3OKaS+UQvVbeeMEYBWJF8GOY/PfMOKdQVJ+TjqChEm4pHTM69HwAbcCX
 Ex/7xSAM1S2h4CuGEj33aykuH0PKks9E44VM31QfhpCHDz63upJK9OFMlqxsgAtBq2Nz
 aN1DBI3qRWbUl0moYu2dCezZbRxsydcMItxVLT3946v2JgZpCBKkwEclmbG9OteF4vci
 32xslYPrUrGOKImGpSpFBKB4SuS0OGuno5LIq8urHrqEzvL5aNSSgbmYr1oUm1FP6/Ln
 y0yoUQauN9eyXCMnuoly6kqtiuuwxtgKyUKLEJcJn8Qw2Qn4nLN1ZflEdpIB3NwBwMOC
 lJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ajIJB0wcFTIisjxYEYMgxm+dr9nVY4WUtZ38KJr42sk=;
 b=fB8XfRKMafbnMMc9fx79TmXvev30ccSvNBabBH0C1pjX4G/jYw5WKaq3mlf/7PsWvG
 oX4WPiju5ffuGgS43RBh6Dk+Jl0fHlJj+VUSnsQaOCT+dECkI6dgH+xqpJGj4A/tIHyY
 CQj23w1d18TFVLU0AjbiSKNzR1MXdbeVVBI3qCAcZ+gMh4BmWchhVTC3FvI1ZcN55/iP
 mby7G5VEwC1LVkdx5pRuze6AAigbYAQ7lOI585Ex03nIR5yKTHUQb4NuDdB6ToOSy8wq
 Z6ujsFVrQkr5n2NjoSl4H8CKGw3bDEVLM8TFYvEYEYbPSxrxEW5YpcfpWWHMI5ekm4Mo
 flCA==
X-Gm-Message-State: ANhLgQ23pIs/ZJOnF3Njm7sAiNfSTstvQrKlnN5IWSotduUgL5fwusgE
 Dbr0kq/RYWVEuxjiFgkJ6r19zg==
X-Google-Smtp-Source: ADFU+vsX44bMGYYDWTVYLN4XIHqigFLMlCLDbsBmS7tp2HMpAhPRQ9ZynsXeUOg29HcIDJKwo4OQ4w==
X-Received: by 2002:adf:9282:: with SMTP id 2mr3674245wrn.124.1583318460121;
 Wed, 04 Mar 2020 02:41:00 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm24006398wro.36.2020.03.04.02.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 02:40:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de, heiko@sntech.de, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v5 02/11] drm/bridge: dw-hdmi: add max bpc connector property
Date: Wed,  4 Mar 2020 11:40:43 +0100
Message-Id: <20200304104052.17196-3-narmstrong@baylibre.com>
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

RnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgoKQWRkIHRoZSBtYXhfYnBjIHBy
b3BlcnR5IHRvIHRoZSBkdy1oZG1pIGNvbm5lY3RvciB0byBwcmVwYXJlIHN1cHBvcnQKZm9yIDEw
LCAxMiAmIDE2Yml0IG91dHB1dCBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1h
biA8am9uYXNAa3dpYm9vLnNlPgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClJldmlld2VkLWJ5OiBKZXJuZWogxaBrcmFiZWMg
PGplcm5lai5za3JhYmVjQHNpb2wubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggMTBm
OThjOWVlNzdlLi5lMDk3ZjYwZTY0MzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCkBAIC0yNDE0LDYgKzI0MTQsMTQgQEAgc3RhdGljIGludCBkd19oZG1pX2Jy
aWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkJCQkgICAgRFJNX01PREVf
Q09OTkVDVE9SX0hETUlBLAogCQkJCSAgICBoZG1pLT5kZGMpOwogCisJLyoKKwkgKiBkcm1fY29u
bmVjdG9yX2F0dGFjaF9tYXhfYnBjX3Byb3BlcnR5KCkgcmVxdWlyZXMgdGhlCisJICogY29ubmVj
dG9yIHRvIGhhdmUgYSBzdGF0ZS4KKwkgKi8KKwlkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
cmVzZXQoY29ubmVjdG9yKTsKKworCWRybV9jb25uZWN0b3JfYXR0YWNoX21heF9icGNfcHJvcGVy
dHkoY29ubmVjdG9yLCA4LCAxNik7CisKIAlpZiAoaGRtaS0+dmVyc2lvbiA+PSAweDIwMGEgJiYg
aGRtaS0+cGxhdF9kYXRhLT51c2VfZHJtX2luZm9mcmFtZSkKIAkJZHJtX29iamVjdF9hdHRhY2hf
cHJvcGVydHkoJmNvbm5lY3Rvci0+YmFzZSwKIAkJCWNvbm5lY3Rvci0+ZGV2LT5tb2RlX2NvbmZp
Zy5oZHJfb3V0cHV0X21ldGFkYXRhX3Byb3BlcnR5LCAwKTsKLS0gCjIuMjIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
