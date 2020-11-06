Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8412A95B5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 12:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74036E1FB;
	Fri,  6 Nov 2020 11:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04C16E1BA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 11:48:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p5so1515852ejj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 03:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EHBGsJ+axiVeE8GmrzxBefG74B7GrWvtyoVrJ1bJNe4=;
 b=dwBxmPRis0CiuAvK3dpOVlXXCno92VoLNCF1plCpOyt21fe2HVq2z6F84DJPbrQF4y
 0J9okR7YYlAYxRqf+Dz8r9mKuiULzAsOf5AF3Hc/S5Ywjvftp9XrZgxQzWBdZ+eTeYsR
 jWe04yebEH/9RyBNzawmtcYPrsJ0aLi6bS/P6GABAf0jO3H5KVomei5TdK8hJBvTWbb6
 FEKDthSvgXbSF48Z7njmHcOCSPpext8ymP5f9Goy62lvTZc6BnWB7Ez/Ie9LvPYT8r/R
 CzScPtmKb8LsbbGsHY0Mz2nJg0jR4KtUoiLMkvbfsFmGc1jpjoLlQVAL2zaVn1PlXOZq
 XhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EHBGsJ+axiVeE8GmrzxBefG74B7GrWvtyoVrJ1bJNe4=;
 b=TKhfP8bC74Bt57wd6JikbafgY+SVKQZQIaiyIT5MRp4uv6y5z1PppqhkpFFHki9yoQ
 FLGrhxAnOiM11ITa3srRuLqRzuibnWfgHCY8RDPaS4nXXQkMSkXj8Ai82ntIokFiHsGr
 4KKOySi/CrHafxuQ7zKokQiuHb+W64SRvkbdCR+pV1bQAWYokSU4NMQovNef2fA/GiHK
 SuPFEJwNledjlqDj/FPuvMsPdAehViDf9YiPAP39IxFf8VDUlPgsjS7948y2StwFVwRT
 iuRooIWP8IpanFsQZ3Yrs0dVLOs8EXR47ldWGZc5US7ftjtUO5vJ4ajYSDj9kv4mWBjy
 TIPw==
X-Gm-Message-State: AOAM530m2ZRa1aw356G599rSx+v0rlk/mVHy5AnefgtV2hVkKkuTBZNN
 ENoPBm8BOeQfYKqbad2AD1s=
X-Google-Smtp-Source: ABdhPJzcrRQtSzVw6Cx/8bs9wFTOEqntQvRxu+IoDSCnHLgYmCyzUgZk5DO9jYm3No8iZLoVYt4mvg==
X-Received: by 2002:a17:907:119e:: with SMTP id
 uz30mr1681508ejb.125.1604663290625; 
 Fri, 06 Nov 2020 03:48:10 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c066:c9fc:f8c2:d50b])
 by smtp.gmail.com with ESMTPSA id j8sm875933edk.79.2020.11.06.03.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 03:48:10 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Subject: [PATCH 1/2] mm: mmap: fix fput in error path v2
Date: Fri,  6 Nov 2020 12:48:05 +0100
Message-Id: <20201106114806.46015-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106114806.46015-1-christian.koenig@amd.com>
References: <20201106114806.46015-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF0Y2ggIjQ5NWMxMGNjMWMwYyBDSFJPTUlVTTogZG1hLWJ1ZjogcmVzdG9yZSBhcmdzLi4uIgph
ZGRzIGEgd29ya2Fyb3VuZCBmb3IgYSBidWcgaW4gbW1hcF9yZWdpb24uCgpBcyB0aGUgY29tbWVu
dCBzdGF0ZXMgLT5tbWFwKCkgY2FsbGJhY2sgY2FuIGNoYW5nZQp2bWEtPnZtX2ZpbGUgYW5kIHNv
IHdlIG1pZ2h0IGNhbGwgZnB1dCgpIG9uIHRoZSB3cm9uZyBmaWxlLgoKUmV2ZXJ0IHRoZSB3b3Jr
YXJvdW5kIGFuZCBwcm9wZXIgZml4IHRoaXMgaW4gbW1hcF9yZWdpb24uCgp2MjogZHJvcCB0aGUg
ZXh0cmEgaWYgaW4gZG1hX2J1Zl9tbWFwIGFzIHdlbGwKClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1
bnRob3JwZSA8amdnQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyB8
IDIwICsrKy0tLS0tLS0tLS0tLS0tLS0tCiBtbS9tbWFwLmMgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYwppbmRleCAwZWI4MGMxZWNkYWIuLjI4MmJkOGI4NDE3MCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCkBA
IC0xMTY2LDkgKzExNjYsNiBAQCBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX2VuZF9jcHVfYWNj
ZXNzKTsKIGludCBkbWFfYnVmX21tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsCiAJCSB1bnNpZ25lZCBsb25nIHBnb2ZmKQogewotCXN0cnVjdCBm
aWxlICpvbGRmaWxlOwotCWludCByZXQ7Ci0KIAlpZiAoV0FSTl9PTighZG1hYnVmIHx8ICF2bWEp
KQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtMTE4NiwyMiArMTE4MywxMSBAQCBpbnQgZG1hX2J1
Zl9tbWFwKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LAogCQlyZXR1cm4gLUVJTlZBTDsKIAogCS8qIHJlYWRqdXN0IHRoZSB2bWEgKi8KLQlnZXRfZmls
ZShkbWFidWYtPmZpbGUpOwotCW9sZGZpbGUgPSB2bWEtPnZtX2ZpbGU7Ci0Jdm1hLT52bV9maWxl
ID0gZG1hYnVmLT5maWxlOworCWZwdXQodm1hLT52bV9maWxlKTsKKwl2bWEtPnZtX2ZpbGUgPSBn
ZXRfZmlsZShkbWFidWYtPmZpbGUpOwogCXZtYS0+dm1fcGdvZmYgPSBwZ29mZjsKIAotCXJldCA9
IGRtYWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKLQlpZiAocmV0KSB7Ci0JCS8qIHJlc3Rv
cmUgb2xkIHBhcmFtZXRlcnMgb24gZmFpbHVyZSAqLwotCQl2bWEtPnZtX2ZpbGUgPSBvbGRmaWxl
OwotCQlmcHV0KGRtYWJ1Zi0+ZmlsZSk7Ci0JfSBlbHNlIHsKLQkJaWYgKG9sZGZpbGUpCi0JCQlm
cHV0KG9sZGZpbGUpOwotCX0KLQlyZXR1cm4gcmV0OwotCisJcmV0dXJuIGRtYWJ1Zi0+b3BzLT5t
bWFwKGRtYWJ1Ziwgdm1hKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfbW1hcCk7CiAK
ZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRleCBkOTFlY2IwMGQzOGMuLjMw
YTRlODQxMmE1OCAxMDA2NDQKLS0tIGEvbW0vbW1hcC5jCisrKyBiL21tL21tYXAuYwpAQCAtMTg5
OSw4ICsxODk5LDggQEAgdW5zaWduZWQgbG9uZyBtbWFwX3JlZ2lvbihzdHJ1Y3QgZmlsZSAqZmls
ZSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCXJldHVybiBhZGRyOwogCiB1bm1hcF9hbmRfZnJlZV92
bWE6CisJZnB1dCh2bWEtPnZtX2ZpbGUpOwogCXZtYS0+dm1fZmlsZSA9IE5VTEw7Ci0JZnB1dChm
aWxlKTsKIAogCS8qIFVuZG8gYW55IHBhcnRpYWwgbWFwcGluZyBkb25lIGJ5IGEgZGV2aWNlIGRy
aXZlci4gKi8KIAl1bm1hcF9yZWdpb24obW0sIHZtYSwgcHJldiwgdm1hLT52bV9zdGFydCwgdm1h
LT52bV9lbmQpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
