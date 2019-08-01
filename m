Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAF7D3E3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAB56E354;
	Thu,  1 Aug 2019 03:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B2A6E354
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:20 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n190so1833577pgn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l0iGU7OjgEb+jEdW4ORscHtkcmdOvreVfILRvjj1+Oo=;
 b=TEnyUTatYHmHb2Vld1dDvKV0cPVf+RKuGouyacCpyuwG8DTCQGpIuUvamO0ZhsZLf9
 sg6sPlhkONiaBb/Bi7oiAW5uO09wpki7aVdq9C47QKgoKmyw0VOpm2Rrqi8iRP6ZFV4k
 /ldvQGJAKJ0TRtTcoWSX3+oJFLDJPKed/po0lQZpLPgQtnD67HkYfRZ0f5tEbYMybgUO
 37HoNHzOV5HpxmSiiDtdKsiKQ+t2a4CPKosaZlgTaZnzmOLagTbC7KueCRndXVJ7vFI4
 8HvJkNLVJgD2tcbpVi+Ch/wy45NmyLu8Ib0kNpUAv2+FO1mIViEEzZ9hEG/1tRH2K3t9
 7F3g==
X-Gm-Message-State: APjAAAX6/dr9Puhmom6Iyr5OXQ8nnWAA6e0Re/Y81aCe/p+UIOMir+DW
 cw0QcAlyphFDKFUADoQfvs5uMw==
X-Google-Smtp-Source: APXvYqwQrYrPD7WmSLedewQDsd/0ccueFsQ6lDrBBY/uwQkz1NbeQoHSUVHsVJakO64KiZOSs0/JsQ==
X-Received: by 2002:a17:90a:32ec:: with SMTP id
 l99mr6319509pjb.44.1564631119659; 
 Wed, 31 Jul 2019 20:45:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.45.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:18 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 22/26] drm: kirin: Fix dev->driver_data setting
Date: Thu,  1 Aug 2019 03:44:35 +0000
Message-Id: <20190801034439.98227-23-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l0iGU7OjgEb+jEdW4ORscHtkcmdOvreVfILRvjj1+Oo=;
 b=gzFKilZEeoz2ZWeGIlMCgbyjJirnk+SAY0OJ2oLnv6TDgPgy7gDOwYDgjgIFUQubIG
 7+Y0HrHWaAB0e4dKi7eNz9DgY21doX491Hl5Sy+Sh8g5nK7pOWCIhguyG2hxQxlCJ3m+
 V4lAkD5jZ1rxH+J1N3BMCfzf18dtcWa/tWf/bedn8Eoqbl0x//3hvJmPq5KY71XxHIb8
 YdSwvhZxwjRcpluUmA+MymwndWUTD9T4yvsljP4JherbrCQlpvIfRr+p9hgxD0MBxlfi
 s3ziTT38BUOG0VrYrqLn0j3u59fVughR5SE25urd1EMxgHBxruMmZnuXjTImZQZ7Mj3O
 JUgw==
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
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKZGV2LT5kcml2ZXJfZGF0YSB0
byBwb2ludCB0byBhIGRybV9kZXZpY2UsIG5vdCBhZGVfZGF0YS4KClRodXMgd2Ugc2V0IHRoZSBk
cml2ZXIgZGF0YSB0byBkcm0gZGV2aWNlIGFmdGVyIGFsbG9jLgoKQ2M6IFJvbmdyb25nIFpvdSA8
em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5nQGhpc2lsaWNvbi5jb20+Cltqc3R1bHR6OiBS
ZXdvcmRlZCBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4u
c3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9r
aXJpbl9kcm1fYWRlLmMgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2ly
aW5fZHJtX2Rydi5jIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJp
bi9raXJpbl9kcm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9hZGUuYwppbmRleCAwYmRjYWM5ODFkOGIuLjA5ZGMyYzA3NTMzZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKQEAgLTk5OCw3ICs5
OTgsNiBAQCBzdGF0aWMgaW50IGFkZV9kcm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCQlEUk1fRVJST1IoImZhaWxlZCB0byBhbGxvYyBhZGVfZGF0YVxuIik7CiAJCXJldHVy
biAtRU5PTUVNOwogCX0KLQlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBhZGUpOwogCiAJY3R4
ID0gYWRlX2h3X2N0eF9hbGxvYyhwZGV2LCAmYWRlLT5jcnRjLmJhc2UpOwogCWlmIChJU19FUlIo
Y3R4KSkgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJp
bl9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9k
cnYuYwppbmRleCAxYzk2NThlOTU2NWUuLmYxODUzYjg0YWI1OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMKQEAgLTQzLDggKzQzLDYgQEAg
c3RhdGljIGludCBraXJpbl9kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHsK
IAlpbnQgcmV0OwogCi0JZGV2X3NldF9kcnZkYXRhKGRldi0+ZGV2LCBkZXYpOwotCiAJLyogZGV2
LT5tb2RlX2NvbmZpZyBpbml0aWFsaXphdGlvbiAqLwogCWRybV9tb2RlX2NvbmZpZ19pbml0KGRl
dik7CiAJZGV2LT5tb2RlX2NvbmZpZy5taW5fd2lkdGggPSAwOwpAQCAtMTM5LDYgKzEzNyw3IEBA
IHN0YXRpYyBpbnQga2lyaW5fZHJtX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQogCWRybV9kZXYg
PSBkcm1fZGV2X2FsbG9jKGRyaXZlcl9kYXRhLT5kcml2ZXIsIGRldik7CiAJaWYgKElTX0VSUihk
cm1fZGV2KSkKIAkJcmV0dXJuIFBUUl9FUlIoZHJtX2Rldik7CisJZGV2X3NldF9kcnZkYXRhKGRl
diwgZHJtX2Rldik7CiAKIAlyZXQgPSBraXJpbl9kcm1fa21zX2luaXQoZHJtX2Rldik7CiAJaWYg
KHJldCkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
