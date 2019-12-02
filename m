Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D301B10EB0A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 14:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FE06E1E8;
	Mon,  2 Dec 2019 13:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C296E1E8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 13:47:24 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v201so26966286lfa.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 05:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A0Ch9GdyhFeE+gfd6Z5DWf7KGKT8iNUVse8tB117Zm4=;
 b=T/QUwbbD9ZL2M7SK1FCy0MSH0lz9a3DY14q7adxSLnftfBd2PyusrBW2/vuGyQgq+1
 PgEZCNxQp0HAxCffDAmRaC86odRkHSyvA6FyOYt28b6s+ZjDzvHiC1cX+GH2odCwDZ+F
 b2rQNhGQhrQHWDINIcXnlgyIG8DVVDqqp/HCP8GcyxcCseU12zJkcICKH2yjdzLNXEt1
 Rqd8Wfk6eTAncU5a/B29QSSSGCM4qnElykCZNMeg4i9NKlABj1Tur/3aIhy7hpsbG3Bs
 jpnPH3Ff5fvhfI1+widgVt8am3aHQ1Upi9d9B3IZGBBJALNP0A03xyek3uVUlzlXfMu7
 C42Q==
X-Gm-Message-State: APjAAAUMkWUj3m6GoX4yhOsos6np98uEnzvguElyV6UNVZqKR6fRuzsp
 eNv4ZEVTllXPDqPSww+Yh9WP06G26Y979g==
X-Google-Smtp-Source: APXvYqy2ksseeVDtg2mfDRQsT5XPfHoavrEqU0v8PMf5ffOQBVXHHD4yI3j7KerJMjUbpfuclf2gXA==
X-Received: by 2002:a19:645b:: with SMTP id b27mr32647592lfj.117.1575294442357; 
 Mon, 02 Dec 2019 05:47:22 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
 by smtp.gmail.com with ESMTPSA id f13sm5904912ljp.104.2019.12.02.05.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 05:47:21 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix vertical resolution bugs
Date: Mon,  2 Dec 2019 14:47:17 +0100
Message-Id: <20191202134717.30760-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A0Ch9GdyhFeE+gfd6Z5DWf7KGKT8iNUVse8tB117Zm4=;
 b=XCas24bn2q3q7q/Ck8Vw55vrahamI50QxSIfJquu9Qq9RlJHjHSY1fEMzst5h45z7u
 t3ea8hn2UdCumfw4fmUjiBcn977whMTxKNOrgpzlmdN354Vgd+vdblSJjEZG6HoJXoJm
 ZEoPrqhnPTn3QpT/uyd6X1atqIIX5v8h9aNawvDyVZjjpB8xEJNzzvzkdg99rLoz3sla
 /R7dyxP5m7NOZvCe0c1c56hPCrvQe+uY8K2jMxEcvSQUYMVC3LGtmi1eyRciMFXLeVDy
 lwEHFFjhLx7WwJo4MDhEADeVyb4+4JwVmq/7UnocmSIlPo/tnHMNj/ukTiHy2UDWR43v
 /Xpg==
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdmlkZW8gbW9kZSB0aGUgVkFDVCAodmlkZW8gYWN0aXZlKSBhbmQgVlNBICh2ZXJ0aWNhbCBz
eW5jCmFjdGl2ZSkgZ290IHN3YXBwZWQuIEZpeCBpdCB1cC4KClRoZSByZXN1bHQgd2FzIGNvbXBh
cmVkIHRvIGEgcmVnaXN0ZXIgZHVtcCBmcm9tIHRoZSBHb2xkZW4KKFNhbXN1bmcgR1QtSTgxOTAp
LgoKQ2M6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBnZXJob2xkLm5ldD4KU2lnbmVkLW9mZi1i
eTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tY2RlL21jZGVfZHNpLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWNkZS9tY2RlX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYwppbmRleCAy
MWNlZTRkOWQyZmQuLjhmNmNlMTU1N2UzZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21j
ZGUvbWNkZV9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCkBAIC00
MzEsMTYgKzQzMSwxNiBAQCBzdGF0aWMgdm9pZCBtY2RlX2RzaV9zZXR1cF92aWRlb19tb2RlKHN0
cnVjdCBtY2RlX2RzaSAqZCwKIAkvKiBSZWNvdmVyeSBtb2RlIDEgKi8KIAl2YWwgfD0gMSA8PCBE
U0lfVklEX01BSU5fQ1RMX1JFQ09WRVJZX01PREVfU0hJRlQ7CiAJLyogQWxsIG90aGVyIGZpZWxk
cyB6ZXJvICovCi0Jd3JpdGVsKHZhbCwgZC0+cmVncyArIERTSV9WSURfTUFJTl9DVEwpOworCXdy
aXRlbF9kc2koZCwgdmFsLCBEU0lfVklEX01BSU5fQ1RMKTsKIAogCS8qIFZlcnRpY2FsIGZyYW1l
IHBhcmFtZXRlcnMgYXJlIHByZXR0eSBzdHJhaWdodC1mb3J3YXJkICovCi0JdmFsID0gbW9kZS0+
dmRpc3BsYXkgPDwgRFNJX1ZJRF9WU0laRV9WU0FfTEVOR1RIX1NISUZUOworCXZhbCA9IG1vZGUt
PnZkaXNwbGF5IDw8IERTSV9WSURfVlNJWkVfVkFDVF9MRU5HVEhfU0hJRlQ7CiAJLyogdmVydGlj
YWwgZnJvbnQgcG9yY2ggKi8KIAl2YWwgfD0gKG1vZGUtPnZzeW5jX3N0YXJ0IC0gbW9kZS0+dmRp
c3BsYXkpCiAJCTw8IERTSV9WSURfVlNJWkVfVkZQX0xFTkdUSF9TSElGVDsKIAkvKiB2ZXJ0aWNh
bCBzeW5jIGFjdGl2ZSAqLwogCXZhbCB8PSAobW9kZS0+dnN5bmNfZW5kIC0gbW9kZS0+dnN5bmNf
c3RhcnQpCi0JCTw8IERTSV9WSURfVlNJWkVfVkFDVF9MRU5HVEhfU0hJRlQ7CisJCTw8IERTSV9W
SURfVlNJWkVfVlNBX0xFTkdUSF9TSElGVDsKIAkvKiB2ZXJ0aWNhbCBiYWNrIHBvcmNoICovCiAJ
dmFsIHw9IChtb2RlLT52dG90YWwgLSBtb2RlLT52c3luY19lbmQpCiAJCTw8IERTSV9WSURfVlNJ
WkVfVkJQX0xFTkdUSF9TSElGVDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
