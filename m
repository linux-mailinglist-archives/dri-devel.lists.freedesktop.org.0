Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0338372AFA
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DFA6EADE;
	Tue,  4 May 2021 13:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865C76E44E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:36 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l7so1771860edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wZaUvq8g4OV6zX0loYmI/r/7XWW2L6figYiC/95Wh0=;
 b=SEazZ4NbIpLtdBQ6Bjn4ncDvGbbFSw9JOLbM0WZ/8krNPNh1so1AoObGg1oTo5brlB
 ot6vqvaZVErMh8quQd3ahZHquVZW9uIRnO9Y1BGLGNaGyumhq2qxYHSQD9XCxiyTyMZ9
 p/S9HVBxlQ497+io8hDMaHrEOKF6787p73ecwrzlqHt4uEVD0U4EebsqQ+ePMPzHRzfV
 SeFnb2XGu3NEeOt0z066T+ib41/cnMxxoQO26wvQodQ7mv/h90mRbbsfScHLZs35xT1Y
 3aaCmbB4LBMaZ8uVvD1SkyWppLrn08T1YOcb10ZZiwBjsSMj4bHVUSfyo2LrSxi5Aq/z
 ruWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2wZaUvq8g4OV6zX0loYmI/r/7XWW2L6figYiC/95Wh0=;
 b=FIZQ1aiLlXmoQFPSHw73Uw3OMSI+ahOxuIHf8HmB3VWgt1K0cZXaFpcfzZJqGxtITH
 7JfwR3Hp4RAq4U3BuCJpHidg379wkKvUrhcPY9ROwJSb48j2/M3zy6uQIppn0swc2BB2
 rp6ySy7tSwtaBvpkWT621EWNAMoIV/XTwbsGXETmBWpOCBbEDMjtoIlan761cJCn7s8K
 OrmSoaiFqlM0m97tNrt5l/o6cs/gO6kY00gOqYmHGInZQ69AL/0nkgAH2f9+YyYrKS6x
 KIkPNbYlAE2K83pcQvuZRvObrBb82/VXL+tKDDBadY9oMRRHGgIXN8H1w4BdZO+Wk58j
 c9Tg==
X-Gm-Message-State: AOAM532XM1Q4vMI42r1UjmZ7jXA/cBd1Dz01McmrPrluTHDzgFYxSpIs
 f54/m2azEmKcVGAsk3rosGmxYHQu88M=
X-Google-Smtp-Source: ABdhPJyb8TyUivfSBZCipUm25NEm5YmlPk0s/bRdWIneLO7uroOgw+ZKUr/cd8/oU3tGdWH6eGq1Vw==
X-Received: by 2002:aa7:d6d9:: with SMTP id x25mr26348251edr.305.1620134855302; 
 Tue, 04 May 2021 06:27:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] drm/etnaviv: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:22 +0200
Message-Id: <20210504132729.2046-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYyB8IDIzICsrKysrKysrKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3N1Ym1pdC5jCmluZGV4IGQwNWMz
NTk5NDU3OS4uMmU0NDA2NzRjYTViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2dlbV9zdWJtaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dlbV9zdWJtaXQuYwpAQCAtMTA4LDYgKzEwOCwyMSBAQCBzdGF0aWMgaW50IHN1Ym1pdF9s
b29rdXBfb2JqZWN0cyhzdHJ1Y3QgZXRuYXZpdl9nZW1fc3VibWl0ICpzdWJtaXQsCiAJcmV0dXJu
IHJldDsKIH0KIAorc3RhdGljIGludCBzdWJtaXRfc3luY191c2VyKHN0cnVjdCBldG5hdml2X2dl
bV9zdWJtaXQgKnN1Ym1pdCkKK3sKKwl1bnNpZ25lZCBpbnQgaTsKKwlpbnQgcmV0OworCisJZm9y
IChpID0gMDsgaSA8IHN1Ym1pdC0+bnJfYm9zOyBpKyspIHsKKwkJc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmogPSAmc3VibWl0LT5ib3NbaV0ub2JqLT5iYXNlOworCisJCXJldCA9IGRtYV9yZXN2
X3N5bmNfdXNlcl9mZW5jZShvYmotPnJlc3YpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsK
Kwl9CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyB2b2lkIHN1Ym1pdF91bmxvY2tfb2JqZWN0KHN0
cnVjdCBldG5hdml2X2dlbV9zdWJtaXQgKnN1Ym1pdCwgaW50IGkpCiB7CiAJaWYgKHN1Ym1pdC0+
Ym9zW2ldLmZsYWdzICYgQk9fTE9DS0VEKSB7CkBAIC01MTgsOCArNTMzLDYgQEAgaW50IGV0bmF2
aXZfaW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAog
CQl9CiAJfQogCi0Jd3dfYWNxdWlyZV9pbml0KCZ0aWNrZXQsICZyZXNlcnZhdGlvbl93d19jbGFz
cyk7Ci0KIAlzdWJtaXQgPSBzdWJtaXRfY3JlYXRlKGRldiwgZ3B1LCBhcmdzLT5ucl9ib3MsIGFy
Z3MtPm5yX3BtcnMpOwogCWlmICghc3VibWl0KSB7CiAJCXJldCA9IC1FTk9NRU07CkBAIC01NDEs
NiArNTU0LDEyIEBAIGludCBldG5hdml2X2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwKIAlpZiAocmV0KQogCQlnb3RvIGVycl9zdWJtaXRfb2JqZWN0
czsKIAorCXJldCA9IHN1Ym1pdF9zeW5jX3VzZXIoc3VibWl0KTsKKwlpZiAocmV0KQorCQlnb3Rv
IGVycl9zdWJtaXRfb2JqZWN0czsKKworCXd3X2FjcXVpcmVfaW5pdCgmdGlja2V0LCAmcmVzZXJ2
YXRpb25fd3dfY2xhc3MpOworCiAJaWYgKChwcml2LT5tbXVfZ2xvYmFsLT52ZXJzaW9uICE9IEVU
TkFWSVZfSU9NTVVfVjIpICYmCiAJICAgICFldG5hdml2X2NtZF92YWxpZGF0ZV9vbmUoZ3B1LCBz
dHJlYW0sIGFyZ3MtPnN0cmVhbV9zaXplIC8gNCwKIAkJCQkgICAgICByZWxvY3MsIGFyZ3MtPm5y
X3JlbG9jcykpIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
