Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5810116CC5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D17C6E438;
	Mon,  9 Dec 2019 12:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3AD6E42D;
 Mon,  9 Dec 2019 12:00:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id y11so15865358wrt.6;
 Mon, 09 Dec 2019 04:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
 b=MlLo03XAUfHtDoREKWu+JqM3vLuC7wSPcqIpGLHefmUHLhw7z40JARHjh307or0By2
 +WaAHJ/OOAo7pUrJbxRTnIaLMNPM2rhFtXbXBSEcuMInLyzjPZImrU2mpuw5fI0xltbW
 elv/JdD/9WqHFb8aGbVAHUQtygNAXdUwZhn/K8QTS5OwquWJ0IeAlJX3rlX8vMhCO1mA
 /hfpsj39Lze82oBzfJtU/dRZ1IiJLTkKDhfG85JEmKmEHsvxvR/Ck37isWsnKsahPB4M
 5V4gPDurtXFX5WFjHVU/WUHmmWQnFtgGsTNOEKf1ghfBIGJKYB9BkcJN1OIRVKZiN5ye
 psPg==
X-Gm-Message-State: APjAAAXaOsMBcHRyvd7W5rbVOBqbnd7daf5b2nr3WJUFn/mn7yrpp/Hi
 aZOA4rQ3fJBC9+ZGG92OC2jTd2dA
X-Google-Smtp-Source: APXvYqwGAStGmh5k52u0RoRw/k32jrc4q5lTbFOStWvlY73rNHM4OXu04y09xn3OYGOx3B/rw9LKUQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr1683353wre.58.1575892825514; 
 Mon, 09 Dec 2019 04:00:25 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id j12sm28417673wrw.54.2019.12.09.04.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:00:24 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 9/9] drm/nouveau: gp10b: Use correct copy engine
Date: Mon,  9 Dec 2019 13:00:05 +0100
Message-Id: <20191209120005.2254786-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
 b=I3rxL24mYZqpFkBuF0tA7G5UTw3tF0TJkYyIYt79Hs3jpj9RpazUzevgJhnVEPKQrh
 SkR9egT7lgk6iOKwB4F5YgqkRiZL8tgmuul/LmLv9/k5dvjGfQ19vPp+7Mj0ab+AHBCb
 q+Qwh0vTVVvKQpz3s2qs2QZP5vpJol4KgOOPaO7aLPI0YfW5KcTzoLPQSyq/JEWVFNv6
 La0nReZlcssGJkW63OAHHdQlUsFsf5f7e5QVSOEVpm73s8AQpr6sSB12JJD1DpWyyHjw
 9zIoC1imvNgbczStN+jV6BlS9BHpOdl4TSrBrKebUIEBF0wrPJ5NOi3ldvjaU2Gn0Q8n
 8eyg==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCmdwMTBiIHVzZXMgdGhl
IG5ldyBlbmdpbmUgZW51bWVyYXRpb24gbWVjaGFuaXNtIGludHJvZHVjZWQgaW4gdGhlIFBhc2Nh
bAphcmNoaXRlY3R1cmUuIEFzIGEgcmVzdWx0LCB0aGUgY29weSBlbmdpbmUsIHdoaWNoIHVzZWQg
dG8gYmUgYXQgaW5kZXggMgpmb3IgcHJpb3IgVGVncmEgR1BVIGluc3RhbnRpYXRpb25zLCBoYXMg
bm93IG1vdmVkIHRvIGluZGV4IDAuIEZpeCB1cCB0aGUKaW5kZXggYW5kIGFsc28gdXNlIHRoZSBn
cDEwMCB2YXJpYW50IG9mIHRoZSBjb3B5IGVuZ2luZSBjbGFzcyBiZWNhdXNlIG9uCmdwMTBiIHRo
ZSBQQVNDQUxfRE1BX0NPUFlfQiBjbGFzcyBpcyBub3Qgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvYmFzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL2Jhc2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS9iYXNlLmMKaW5kZXggMjMxZWMwMDczYWYzLi5l
YmE0NTBlNjg5YjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5n
aW5lL2RldmljZS9iYXNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdp
bmUvZGV2aWNlL2Jhc2UuYwpAQCAtMjM4Nyw3ICsyMzg3LDcgQEAgbnYxM2JfY2hpcHNldCA9IHsK
IAkucG11ID0gZ20yMGJfcG11X25ldywKIAkudGltZXIgPSBnazIwYV90aW1lcl9uZXcsCiAJLnRv
cCA9IGdrMTA0X3RvcF9uZXcsCi0JLmNlWzJdID0gZ3AxMDJfY2VfbmV3LAorCS5jZVswXSA9IGdw
MTAwX2NlX25ldywKIAkuZG1hID0gZ2YxMTlfZG1hX25ldywKIAkuZmlmbyA9IGdwMTBiX2ZpZm9f
bmV3LAogCS5nciA9IGdwMTBiX2dyX25ldywKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
