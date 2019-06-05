Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EED35ECB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13B389B27;
	Wed,  5 Jun 2019 14:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFE589B27
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:12:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so19648467wrm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AycgXSGYqUAjsITGUjnhQpci5ICfquB/aTQgTSexg/Y=;
 b=B21JkADN62q44QRfBE5AhJ6V6o9Hen29yJRto1aHw5gu1zssDy120wFXBvFpvAGQTg
 kWhN3KgyFTNuPRqJLtwzZd8na5a8hJWlRQwOI+f6AesWdxHT27Vh9LMdXps82g2MGZQz
 Wh+0rPafg27Pxm9D5K9F42cUAyqufcx/24dar4AnNwZQYith28yDxRM94A9XFbuRUODD
 +mphLIyqwrH0ZSuraIEScgX8mH57SYG3u3AiGlhfrVn/iPmZtgAWpCGgpg+YpBKbM+bo
 xYAdzZ9fgFTUs0/0KU9k6ovtJWfX4blQzKfinGB9GjY2ti8UP7Bot4I3o3AwaWK6Kchj
 I28A==
X-Gm-Message-State: APjAAAV0f1oYbyAIMXzuFK/TWaZ6fJ7/JoU4DXZFKnsOfp4MxUahz63h
 1U6ULFGZXg1oajNj+fOjnL/XvtwqABAe4A==
X-Google-Smtp-Source: APXvYqwt/qL/+dVCADHJ7VzKOX6wFacIr8smg4S+3JxBM+1fYpsjKCJgyKEX+SxU7TlspnyF/Abntg==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr12845013wrw.138.1559743976264; 
 Wed, 05 Jun 2019 07:12:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s8sm36292546wra.55.2019.06.05.07.12.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:12:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/meson: fix primary plane disabling
Date: Wed,  5 Jun 2019 16:12:51 +0200
Message-Id: <20190605141253.24165-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AycgXSGYqUAjsITGUjnhQpci5ICfquB/aTQgTSexg/Y=;
 b=SAmYe+PChAGdpz3sq/wSWM30WEDKfSGzSN7aCEWwBeVVYwBTaYCsR8tqJy2F6mPhTx
 UEEXrL7JujXQ6vElMFOuTPhlaA+BpBXz+2W1+aalkZh0k6taPWsHfWnYHGk7aAxSEbhT
 LAjZNa1A1Fh6k9NaRNQGCpDiwd+CFSbmT8UB45Ry5bQjWLFCt2M1NcfMwMDX2rvdSo+P
 GHZ/6io8pmjRFt1qxRcfPHuUZCj+xdzR+vt0Mb5u14YyACdNpab0HYjEGCpcJyJlwyAS
 ZpWMHVaNsjXy5tt7nssu3TvOObOZt70/I6DejgUIR5PHEzNv5qHOEyq0RoZRM79oLKyh
 UOcA==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHByaW1hcnkgcGxhbmUgZGlzYWJsaW5nIGxvZ2ljIGlzIGJyb2tlbiBvbiBhbGwgc3VwcG9y
dGVkIEFtbG9naWMKU29DcywgYW5kIHRoZSBHMTJBIHByaW1hcnkgcGxhbmUgZGlzYWJsZSByZWdp
c3RlciB3cml0ZSBpcyB3cm9uZy4KClRoaXMgcGF0Y2hzZXQgc29sdmVzIHRoc2UgaXNzdWVzLCBh
bmQgaGFzIGJlZW4gdGVzdGVkIHdpdGggdGhlIEJheWxpYnJlCmZmbXBlZy1kcm0gdG9vbCBhbmQg
bW9kZXRlc3QuCgpOZWlsIEFybXN0cm9uZyAoMik6CiAgZHJtL21lc29uOiBmaXggcHJpbWFyeSBw
bGFuZSBkaXNhYmxpbmcKICBkcm0vbWVzb246IGZpeCBHMTJBIHByaW1hcnkgcGxhbmUgZGlzYWJs
aW5nCgogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMuYyAgfCA2ICsrLS0tLQogZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMgfCA4ICsrKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fdml1LmMgICB8IDMgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
