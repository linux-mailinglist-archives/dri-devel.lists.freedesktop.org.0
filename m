Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2008DD62
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0CC6E808;
	Wed, 14 Aug 2019 18:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8B16E80A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:44 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x15so11429pgg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wO5ks8srjtZHHtpXOR5yQLjWhZNf1ho4YCPtcrf1Uww=;
 b=YSkzZBOf59WhJ6njDDFbyyV1cS+6Dwn3FVSQEv8dGu07g9FvqDtBiyJnf+Z2IfIFgg
 Wh1RW9nQCDmVFjp9nn1/Nv5+0gpHcm1yLWB7WjvSuj9tbTGYjwtuKPgv+BMkCeNHpApx
 yoWkf47ONdUltLVoR49ANxjKaX3auBG0Y72BMTpxVk4q/mJGv9N8yC3WdGft56EJ2LZ1
 P+5LjiKWglc7xUNs4KgJqA19j/GlnUlPhsNcVZvzv2uBg7/zYLJI/OVC7J4tFVd+e9ge
 yC61CwEiSaKV8QGLxddZ7W7zc7lGNSBvlgAPq8p55H3X4BwRKxJShr3gtb/9xOVK+pCh
 FJ0w==
X-Gm-Message-State: APjAAAWFmTkb4OLlHVYGuyW7o9SYXNifVOVCbUduAlWPTYQ3USqBsVdu
 H9OSENl/XcYXcST8BykmmX2bVA==
X-Google-Smtp-Source: APXvYqxW9O5O6lN6D75dJ6FsTbeutZUOicVbvKl6O0GFXkGTiyx7uCBE3n4NRfwQBEVHRq3DIGsO2w==
X-Received: by 2002:a17:90a:ec07:: with SMTP id
 l7mr1055601pjy.39.1565808463626; 
 Wed, 14 Aug 2019 11:47:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:42 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 24/26] drm: kirin: Add alloc_hw_ctx/clean_hw_ctx
 ops in driver data
Date: Wed, 14 Aug 2019 18:47:00 +0000
Message-Id: <20190814184702.54275-25-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wO5ks8srjtZHHtpXOR5yQLjWhZNf1ho4YCPtcrf1Uww=;
 b=JhjafeeSnqrY96MJ/4i5IWZwtutSY/+sjrJKNymWybFyvALBIrAwaLrXnNm+qRQJFR
 SDwJLC5JbCWTXnmsCh3xFFheswBW72hayuwa4XzQtbYFMdz98f6PUkLTEzuFhrxa7dcT
 +iK9J7/7XZ11mPfH+4rhV1qlHJOE9Cbn15Spe7OBIDglTWmOC5JJDFXGFEcNnn85sFph
 nfFKbeM6gQtUvUA8ojdH0NUEOCMibVOA4ayu7r6zMI0uF1kb47k3aDvlNGBm4X8Ogop4
 hkGyHkjIk+KzXra8pKLmPtOod3J6cD2P2fAQ5iuRAiSTVcRNwKTGrTg6uMRvhyxo9f9c
 BKrw==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKYWxsb2MvY2xlYW5faHdfY3R4
IGZ1bmN0aW9ucyB0byBiZSBjYWxsZWQgdmlhIGRyaXZlcl9kYXRhCnNwZWNpZmljIGZ1bmNpdG9u
IHBvaW50ZXJzLgoKVGhpcyB3aWxsIGFsbG93IHRoZSBhZGVfZHJtX2luaXQgdG8gbGF0ZXIgYmUg
bWFkZSBnZW5lcmljIGFuZAptb3ZlZCB0byBraXJpbl9kcm1fZHJ2LmMKCkNjOiBSb25ncm9uZyBa
b3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFu
Z0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2Zm
LWJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5nQGhpc2lsaWNvbi5jb20+Cltqc3R1bHR6OiBSZXdvcmRl
ZCBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9k
cm1fYWRlLmMgfCA5ICsrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9r
aXJpbl9kcm1fZHJ2LmggfCA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2tpcmluL2tpcmluX2RybV9hZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4v
a2lyaW5fZHJtX2FkZS5jCmluZGV4IDA5ZGMyYzA3NTMzZC4uZjcyOWExZGU2ZTE0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYwpAQCAtOTk5
LDcgKzk5OSw3IEBAIHN0YXRpYyBpbnQgYWRlX2RybV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJCXJldHVybiAtRU5PTUVNOwogCX0KIAotCWN0eCA9IGFkZV9od19jdHhfYWxs
b2MocGRldiwgJmFkZS0+Y3J0Yy5iYXNlKTsKKwljdHggPSBhZGVfZHJpdmVyX2RhdGEuYWxsb2Nf
aHdfY3R4KHBkZXYsICZhZGUtPmNydGMuYmFzZSk7CiAJaWYgKElTX0VSUihjdHgpKSB7CiAJCURS
TV9FUlJPUigiZmFpbGVkIHRvIGluaXRpYWxpemUga2lyaW5fcHJpdiBodyBjdHhcbiIpOwogCQly
ZXR1cm4gLUVJTlZBTDsKQEAgLTEwMzgsNiArMTAzOCwxMCBAQCBzdGF0aWMgaW50IGFkZV9kcm1f
aW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCitzdGF0
aWMgdm9pZCBhZGVfaHdfY3R4X2NsZWFudXAodm9pZCAqaHdfY3R4KQoreworfQorCiBzdGF0aWMg
dm9pZCBhZGVfZHJtX2NsZWFudXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIH0K
QEAgLTEwOTAsNiArMTA5NCw5IEBAIHN0cnVjdCBraXJpbl9kcm1fZGF0YSBhZGVfZHJpdmVyX2Rh
dGEgPSB7CiAJLnBsYW5lX2Z1bmNzID0gJmFkZV9wbGFuZV9mdW5jcywKIAkubW9kZV9jb25maWdf
ZnVuY3MgPSAmYWRlX21vZGVfY29uZmlnX2Z1bmNzLAogCisJLmFsbG9jX2h3X2N0eCA9IGFkZV9o
d19jdHhfYWxsb2MsCisJLmNsZWFudXBfaHdfY3R4ID0gYWRlX2h3X2N0eF9jbGVhbnVwLAorCiAJ
LmluaXQgPSBhZGVfZHJtX2luaXQsCiAJLmNsZWFudXAgPSBhZGVfZHJtX2NsZWFudXAKIH07CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYu
aCBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5oCmluZGV4
IDk1ZjU2Yzk5NjBkNS4uMTY2MzYxMGQyY2Q4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaApAQCAtNDksNiArNDksMTEgQEAgc3RydWN0IGtp
cmluX2RybV9kYXRhIHsKIAljb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2hlbHBlcl9mdW5jcyAqcGxh
bmVfaGVscGVyX2Z1bmNzOwogCWNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgICpwbGFuZV9m
dW5jczsKIAljb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzICptb2RlX2NvbmZpZ19m
dW5jczsKKworCXZvaWQgKigqYWxsb2NfaHdfY3R4KShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LAorCQkJICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjKTsKKwl2b2lkICgqY2xlYW51cF9o
d19jdHgpKHZvaWQgKmh3X2N0eCk7CisKIAlpbnQgKCppbml0KShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KTsKIAl2b2lkICgqY2xlYW51cCkoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dik7CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
