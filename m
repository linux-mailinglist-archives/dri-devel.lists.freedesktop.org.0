Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5E8DD54
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851796E7DC;
	Wed, 14 Aug 2019 18:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099CF6E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 196so6932923pfz.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oF/wbsoL0VS/wbGpdQ82+BUReXpcSGsjNr6ZOoxveCE=;
 b=dmhGD8mIfEuCWTO80VCDENC0KeBIeccqPhhQPAzDal1oD2yMe1G44Q2N8oLmClqB4I
 TVz4jTwKzNf3YoMwIqa/tzUBQTaJwLG9yQ6AyY2JjpX8sqBA8HT+A7FxNKFR6Ylu0VPn
 XTJ8OTVF9Locb0OV8UHahqPlMgKsh88kTm9ODAJloGzQurPDNwJVNEqSGZLSbdwqABcb
 9E7HG72nQlxhna/G8g2npOl1U/nh0h6o3lNx8AZCcLYbF0+vB6aYxnSocAmD78S3gzVl
 VCv56DoooIMABHKOmwkc48nUQsMf1sng2WgyzK1XqlHiqK+OmEMLjUVvdlTYtCSv32ID
 CAIQ==
X-Gm-Message-State: APjAAAURf6azfBRRut5nAuDGdsoWW2jMntzZnI0zoVkKB8LzP269sHIv
 zSu22zeNAU/mQeug1zLfstwg0WvbSa4=
X-Google-Smtp-Source: APXvYqxwrcP6tgZ+Cn/BGiRQhmX25xrIEbmdHjEGFfzqljCsAWuX2UCiX97DGxggqL+Pgk1BdiMUpA==
X-Received: by 2002:a63:b346:: with SMTP id x6mr519112pgt.218.1565808443994;
 Wed, 14 Aug 2019 11:47:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:23 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 11/26] drm: kirin: Move workqueue to ade_hw_ctx
 structure
Date: Wed, 14 Aug 2019 18:46:47 +0000
Message-Id: <20190814184702.54275-12-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oF/wbsoL0VS/wbGpdQ82+BUReXpcSGsjNr6ZOoxveCE=;
 b=fbE+WUXen307U/StI9D2O7GIdMzehRpD6EtZen5vznPou1FPyMwl/2Xxzt4nMi0Wa8
 rcWMpKaVL9QJEqXN1S1DhwMt81wV9iG1G/6oKUsCcVJ5yLGNWbBn2ED85dp96DmG8N5Y
 3+MAEKD7CVRKwn5TU2L+IcKTbCd99tingrjVosZlgwpzyfITUpDY0VnmL4vTXg2ojAWI
 Fq6dpbIOcMiD7DsNZ/R2k3ON8TyRwH0VP+IYRWl9UmU1cf1YzSoAv6oGBf29neQ31Lvq
 7gUwiKmxVzWTxufpHByAIwKdCWpsjinRfA/5l5yIUNiE8pnt6qG+KCo/eXCYHWwOTyQg
 yk2w==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdvcmtxdWV1ZSB1c2VkIHRvIHJlc2V0IHRoZSBkaXNwbGF5IHdoZW4gd2UgaGl0IGFuIExE
SQp1bmRlcmZsb3cgZXJyb3IgaXMgQURFIHNwZWNpZmljLCBzbyBzaW5jZSB0aGlzIHBhdGNoIHNl
cmllcwp3b3JrcyB0byBtYWtlIHRoZSBraXJpbl9jcnRjIHN0cnVjdHVyZSBtb3JlIGdlbmVyaWMs
IG1vdmUgdGhlCndvcmtxdWV1ZSB0byB0aGUgYWRlX2h3X2N0eCBzdHJ1Y3R1cmUgaW5zdGVhZC4K
CkNjOiBSb25ncm9uZyBab3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IFhpbmxpYW5nIExp
dSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRl
dmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyB8IDEy
ICsrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9hZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Fk
ZS5jCmluZGV4IDBlMGZlMWNiOTQ1Zi4uZWM0ODU3ZTQ1YjZlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYwpAQCAtNTIsNiArNTIsNyBAQCBz
dHJ1Y3QgYWRlX2h3X2N0eCB7CiAJc3RydWN0IGNsayAqbWVkaWFfbm9jX2NsazsKIAlzdHJ1Y3Qg
Y2xrICphZGVfcGl4X2NsazsKIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcmVzZXQ7CisJc3RydWN0
IHdvcmtfc3RydWN0IGRpc3BsYXlfcmVzZXRfd3E7CiAJYm9vbCBwb3dlcl9vbjsKIAlpbnQgaXJx
OwogCkBAIC02MSw3ICs2Miw2IEBAIHN0cnVjdCBhZGVfaHdfY3R4IHsKIHN0cnVjdCBraXJpbl9j
cnRjIHsKIAlzdHJ1Y3QgZHJtX2NydGMgYmFzZTsKIAl2b2lkICpod19jdHg7Ci0Jc3RydWN0IHdv
cmtfc3RydWN0IGRpc3BsYXlfcmVzZXRfd3E7CiAJYm9vbCBlbmFibGU7CiB9OwogCkBAIC0zNDks
OSArMzQ5LDkgQEAgc3RhdGljIHZvaWQgYWRlX2NydGNfZGlzYWJsZV92Ymxhbmsoc3RydWN0IGRy
bV9jcnRjICpjcnRjKQogCiBzdGF0aWMgdm9pZCBkcm1fdW5kZXJmbG93X3dxKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykKIHsKLQlzdHJ1Y3Qga2lyaW5fY3J0YyAqYWNydGMgPSBjb250YWluZXJf
b2Yod29yaywgc3RydWN0IGtpcmluX2NydGMsCisJc3RydWN0IGFkZV9od19jdHggKmN0eCA9IGNv
bnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgYWRlX2h3X2N0eCwKIAkJCQkJICAgICAgZGlzcGxheV9y
ZXNldF93cSk7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSAoJmFjcnRjLT5iYXNlKS0+
ZGV2OworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gY3R4LT5jcnRjLT5kZXY7CiAJc3Ry
dWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlOwogCiAJc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBl
cl9zdXNwZW5kKGRybV9kZXYpOwpAQCAtMzYyLDcgKzM2Miw2IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBhZGVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgYWRlX2h3
X2N0eCAqY3R4ID0gZGF0YTsKIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBjdHgtPmNydGM7Ci0J
c3RydWN0IGtpcmluX2NydGMgKmtjcnRjID0gdG9fa2lyaW5fY3J0YyhjcnRjKTsKIAl2b2lkIF9f
aW9tZW0gKmJhc2UgPSBjdHgtPmJhc2U7CiAJdTMyIHN0YXR1czsKIApAQCAtMzc5LDcgKzM3OCw3
IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBhZGVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0
YSkKIAkJYWRlX3VwZGF0ZV9iaXRzKGJhc2UgKyBMRElfSU5UX0NMUiwgVU5ERVJGTE9XX0lOVF9F
Tl9PRlNULAogCQkJCU1BU0soMSksIDEpOwogCQlEUk1fRVJST1IoIkxESSB1bmRlcmZsb3chIik7
Ci0JCXNjaGVkdWxlX3dvcmsoJmtjcnRjLT5kaXNwbGF5X3Jlc2V0X3dxKTsKKwkJc2NoZWR1bGVf
d29yaygmY3R4LT5kaXNwbGF5X3Jlc2V0X3dxKTsKIAl9CiAKIAlyZXR1cm4gSVJRX0hBTkRMRUQ7
CkBAIC0xMDE2LDYgKzEwMTUsNyBAQCBzdGF0aWMgdm9pZCAqYWRlX2h3X2N0eF9hbGxvYyhzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCWlmIChyZXQpCiAJCXJldHVybiBFUlJfUFRSKC1F
SU8pOwogCisJSU5JVF9XT1JLKCZjdHgtPmRpc3BsYXlfcmVzZXRfd3EsIGRybV91bmRlcmZsb3df
d3EpOwogCWN0eC0+Y3J0YyA9IGNydGM7CiAKIAlyZXR1cm4gY3R4OwpAQCAtMTA3MSw4ICsxMDcx
LDYgQEAgc3RhdGljIGludCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JSU5JVF9XT1JLKCZrY3J0Yy0+ZGlzcGxh
eV9yZXNldF93cSwgZHJtX3VuZGVyZmxvd193cSk7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
