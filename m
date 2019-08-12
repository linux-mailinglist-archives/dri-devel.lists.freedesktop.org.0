Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3768E6A8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C35B6E90A;
	Thu, 15 Aug 2019 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE706E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so104376575wrm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGlThzviYa74KjZe20Ku3Xepd8/yx78CuAyvtGlIM58=;
 b=oUdsGhwfDWzK6quLvYt8Qh1aAPdapaESJTrZkHg6J7VocYdBZBHT6tVIJXlZ3A9a6p
 IHTC6COTQX/ylKA53SmHsT3Xh2VBDmMxMZuMWMyOKsd6wr01PrGWjSkSB9RGR+X6fz+z
 bPXVKcbVCBSZhrYLXxOZEoYQJ+C+ZXK1Q3vNL7kdlhae7wxYsbUP+MgGaNnRqFqJOwVm
 dj/yZW855Xm2DXEdmNmPY5vQi3nNFdl6g9+fppRmXfo8D5qMuPKmkdYI2pZd/TL754ZV
 C9Kb40wURN53brCUgEBxnmIU51FpDYJiMeb4OECUu8qpY/OvLa/p8Ca4/XvYeUiQieVW
 41QA==
X-Gm-Message-State: APjAAAVvt/x6PguuygGR2k5f6qz0KkiNdgmfjUe8c2VsilSLMGG7eFML
 zwpXyzLXhZGPOyS/hXLEssmBpA==
X-Google-Smtp-Source: APXvYqwyPz46p57eTysQVwY46wCsT+0OYu9uGaKrclq3p6YfT4lDPfbi5P4UsmaTt2jiysECa6xwjA==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr38067769wrn.311.1565611652662; 
 Mon, 12 Aug 2019 05:07:32 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 3/8] drm/bridge: dw-hdmi: set channel count in the
 infoframes
Date: Mon, 12 Aug 2019 14:07:21 +0200
Message-Id: <20190812120726.1528-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGlThzviYa74KjZe20Ku3Xepd8/yx78CuAyvtGlIM58=;
 b=DvTuwoTROuHbVQDxdqWmO0f39ZU0wzX4eGo8P1Qq0wZnKZ7jRQCMZZ/Q0RrCDo8hln
 aqatg2peAcIo1JBQXJUjXd/9raZ7v398jHI1ERa6NAPmzKVUIPIQ+98vi+EEYT0/o1pJ
 Anjes/w6rsqescn13KeKvhzXqbUsd+b9N+rxhNa4xNWcB7tM5rvItjoAXS2BP5m4d+do
 dXoTx1Sz7+XBQCK7TjC1nlEay/35okDkeq7KbV8j4nA9jHROcKJ+JTXqD4qqhFRCf9H1
 cZLxSK3snuiK1FsPN9SijQgW7Ybuwe6e63LvcYiXt0gtnZEUbMV53tL5Cazvny95LWQ6
 cqug==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IHRoZSBudW1iZXIgb2YgY2hhbm5lbCBpbiB0aGUgaW5mb2ZyYW1lcwoKUmV2aWV3ZWQtYnk6
IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KU2lnbmVkLW9mZi1ieTogSmVyb21lIEJy
dW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IGJlNmQ2
ODE5YmVmNC4uYmVkNGJiMDE3YWZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYwpAQCAtNjYzLDYgKzY2MywxMCBAQCB2b2lkIGR3X2hkbWlfc2V0X2NoYW5uZWxf
Y291bnQoc3RydWN0IGR3X2hkbWkgKmhkbWksIHVuc2lnbmVkIGludCBjbnQpCiAJaGRtaV9tb2Ri
KGhkbWksIGxheW91dCwgSERNSV9GQ19BVURTQ09ORl9BVURfUEFDS0VUX0xBWU9VVF9NQVNLLAog
CQkgIEhETUlfRkNfQVVEU0NPTkYpOwogCisJLyogU2V0IHRoZSBhdWRpbyBpbmZvZnJhbWVzIGNo
YW5uZWwgY291bnQgKi8KKwloZG1pX21vZGIoaGRtaSwgKGNudCAtIDEpIDw8IEhETUlfRkNfQVVE
SUNPTkYwX0NDX09GRlNFVCwKKwkJICBIRE1JX0ZDX0FVRElDT05GMF9DQ19NQVNLLCBIRE1JX0ZD
X0FVRElDT05GMCk7CisKIAltdXRleF91bmxvY2soJmhkbWktPmF1ZGlvX211dGV4KTsKIH0KIEVY
UE9SVF9TWU1CT0xfR1BMKGR3X2hkbWlfc2V0X2NoYW5uZWxfY291bnQpOwotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
