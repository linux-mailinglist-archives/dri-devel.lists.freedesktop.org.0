Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D418A27F72E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 03:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF996E842;
	Thu,  1 Oct 2020 01:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433286E841
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 01:22:03 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id v14so928783pjd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 18:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qUE/bFNhODNtHNRsHvBXEA45DqCyOEgbacD10q/Sq0U=;
 b=Q/wAFM39Rms4Cg6R01+pxD55x29L4ewoWoUZ+S7Z7mxiKyj0RhW8lBRNyebd0Ajsym
 ZbWsnFfYqThP83i3+/O/No7rhMIGxfFX6rUVBre1ij8ck79HtDUre+cgDGwlT/LebKd7
 Z3N6vqdd6ZmYucEAMJrXw+K3tDHLxHrDTyNJVfWV1DLgF+3nMTuE4dzlFKe0dKyXgZ/L
 +YAOOxe1PoUmw4iwulvRAjtdjroKFzeUaT4zyNguSy9k1VnVUyRr4qZJuGyX9ZzlMCk8
 SxRTLFymBz/46QTBHNI0oHkoPII+NSPNBePPKABgP1ToD/AnhtbNl6ONJ8Y5597Es9Hc
 vLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qUE/bFNhODNtHNRsHvBXEA45DqCyOEgbacD10q/Sq0U=;
 b=Lc97xgtgeVVWhprFM9czfAhrx8OnVFxqHnORI4N89lD9Ck3zzQPOe3+e0srnGoTOVl
 kR1LFafHBe1HCkvPmewOMzWOyGwpUKUY4+MsbCZJZHd+1l2MDwd8MGLTtHxkWjI70P4u
 TOB3+frBKRk3wa1b/MdF8wt9tuwq3+IZI0SAewiB5mf09U53hwk+nicdZlXTE/6MjdKC
 v5YOpsmWPb1ULqKEA9Ie2OGJ6OhHEs1RSzv0Fqb1hwhEnEFob/UGJWBzyGZJbOrzgoBk
 KCNuelaSbW1IRBEa2Dyk1tdqGcQtYkA0gCF7EplbgNGeEKdGSD6DbL1ccCph5S3CpXvV
 xfCQ==
X-Gm-Message-State: AOAM532FxFXXWO39uOfGiSQKsbp1CZ60ZeS3STlegqrk5FwXzsG1P5by
 vxMuWR7Tci/Y9ULiw+Jh8TyDuw==
X-Google-Smtp-Source: ABdhPJyJUcXPh+NYEvxLYkahDBmDEif30rbaBRcZGNLXe+O6HphWKSvRYIFKc6clx1LMc0IZE+eKKg==
X-Received: by 2002:a17:90b:950:: with SMTP id
 dw16mr3201939pjb.200.1601515322827; 
 Wed, 30 Sep 2020 18:22:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 s187sm4229372pfc.134.2020.09.30.18.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 18:22:02 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/6] dma-buf: system_heap: Add pagepool support to system
 heap
Date: Thu,  1 Oct 2020 01:21:50 +0000
Message-Id: <20201001012151.21149-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001012151.21149-1-john.stultz@linaro.org>
References: <20201001012151.21149-1-john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV1c2UvYWJ1c2UgdGhlIHBhZ2Vwb29sIGNvZGUgZnJvbSB0aGUgbmV0d29yayBjb2RlIHRvIHNw
ZWVkCnVwIGFsbG9jYXRpb24gcGVyZm9ybWFuY2UuCgpUaGlzIGlzIHNpbWlsYXIgdG8gdGhlIElP
TiBwYWdlcG9vbCB1c2FnZSwgYnV0IHRyaWVzIHRvCnV0aWxpemUgZ2VuZXJpYyBjb2RlIGluc3Rl
YWQgb2YgYSBjdXN0b20gaW1wbGVtZW50YXRpb24uCgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+CkNj
OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAa2VybmVsLm9yZz4KQ2M6IEJyaWFuIFN0YXJrZXkgPEJy
aWFuLlN0YXJrZXlAYXJtLmNvbT4KQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUu
Y29tPgpDYzogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KQ2M6IFNhbmRl
ZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KQ2M6IMOYcmphbiBFaWRlIDxvcmphbi5laWRl
QGFybS5jb20+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgpDYzogRXpl
cXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgpDYzogU2ltb24gU2VyIDxjb250
YWN0QGVtZXJzaW9uLmZyPgpDYzogSmFtZXMgSm9uZXMgPGpham9uZXNAbnZpZGlhLmNvbT4KQ2M6
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyAgICAgICB8ICAxICsKIGRyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyBiL2RyaXZlcnMv
ZG1hLWJ1Zi9oZWFwcy9LY29uZmlnCmluZGV4IGE1ZWVmMDZjNDIyNi4uZjEzY2RlNDMyMWIxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZworKysgYi9kcml2ZXJzL2Rt
YS1idWYvaGVhcHMvS2NvbmZpZwpAQCAtMSw2ICsxLDcgQEAKIGNvbmZpZyBETUFCVUZfSEVBUFNf
U1lTVEVNCiAJYm9vbCAiRE1BLUJVRiBTeXN0ZW0gSGVhcCIKIAlkZXBlbmRzIG9uIERNQUJVRl9I
RUFQUworCXNlbGVjdCBQQUdFX1BPT0wKIAloZWxwCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gdG8g
ZW5hYmxlIHRoZSBzeXN0ZW0gZG1hYnVmIGhlYXAuIFRoZSBzeXN0ZW0gaGVhcAogCSAgaXMgYmFj
a2VkIGJ5IHBhZ2VzIGZyb20gdGhlIGJ1ZGR5IGFsbG9jYXRvci4gSWYgaW4gZG91YnQsIHNheSBZ
LgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgYi9kcml2
ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwppbmRleCBkMTg5MzdmYTViMTguLmYzMDkw
NDM0NWNjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMK
KysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKQEAgLTIwLDYgKzIwLDcg
QEAKICNpbmNsdWRlIDxsaW51eC9zY2F0dGVybGlzdC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+CisjaW5jbHVkZSA8bmV0L3BhZ2VfcG9vbC5o
PgogCiBzdHJ1Y3QgZG1hX2hlYXAgKnN5c19oZWFwOwogCkBAIC00Niw2ICs0Nyw3IEBAIHN0cnVj
dCBkbWFfaGVhcF9hdHRhY2htZW50IHsKIHN0YXRpYyBnZnBfdCBvcmRlcl9mbGFnc1tdID0ge0hJ
R0hfT1JERVJfR0ZQLCBMT1dfT1JERVJfR0ZQLCBMT1dfT1JERVJfR0ZQfTsKIHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBpbnQgb3JkZXJzW10gPSB7OCwgNCwgMH07CiAjZGVmaW5lIE5VTV9PUkRFUlMg
QVJSQVlfU0laRShvcmRlcnMpCitzdHJ1Y3QgcGFnZV9wb29sICpwb29sc1tOVU1fT1JERVJTXTsK
IAogc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqZHVwX3NnX3RhYmxlKHN0cnVjdCBzZ190YWJsZSAq
dGFibGUpCiB7CkBAIC0yNjUsMTMgKzI2NywxNyBAQCBzdGF0aWMgdm9pZCBzeXN0ZW1faGVhcF9k
bWFfYnVmX3JlbGVhc2Uoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikKIAlzdHJ1Y3Qgc3lzdGVtX2hl
YXBfYnVmZmVyICpidWZmZXIgPSBkbWFidWYtPnByaXY7CiAJc3RydWN0IHNnX3RhYmxlICp0YWJs
ZTsKIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwotCWludCBpOworCWludCBpLCBqOwogCiAJdGFi
bGUgPSAmYnVmZmVyLT5zZ190YWJsZTsKIAlmb3JfZWFjaF9zZyh0YWJsZS0+c2dsLCBzZywgdGFi
bGUtPm5lbnRzLCBpKSB7CiAJCXN0cnVjdCBwYWdlICpwYWdlID0gc2dfcGFnZShzZyk7CiAKLQkJ
X19mcmVlX3BhZ2VzKHBhZ2UsIGNvbXBvdW5kX29yZGVyKHBhZ2UpKTsKKwkJZm9yIChqID0gMDsg
aiA8IE5VTV9PUkRFUlM7IGorKykgeworCQkJaWYgKGNvbXBvdW5kX29yZGVyKHBhZ2UpID09IG9y
ZGVyc1tqXSkKKwkJCQlicmVhazsKKwkJfQorCQlwYWdlX3Bvb2xfcHV0X2Z1bGxfcGFnZShwb29s
c1tqXSwgcGFnZSwgZmFsc2UpOwogCX0KIAlzZ19mcmVlX3RhYmxlKHRhYmxlKTsKIAlrZnJlZShi
dWZmZXIpOwpAQCAtMzAxLDggKzMwNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqYWxsb2NfbGFy
Z2VzdF9hdmFpbGFibGUodW5zaWduZWQgbG9uZyBzaXplLAogCQkJY29udGludWU7CiAJCWlmICht
YXhfb3JkZXIgPCBvcmRlcnNbaV0pCiAJCQljb250aW51ZTsKLQotCQlwYWdlID0gYWxsb2NfcGFn
ZXMob3JkZXJfZmxhZ3NbaV0sIG9yZGVyc1tpXSk7CisJCXBhZ2UgPSBwYWdlX3Bvb2xfYWxsb2Nf
cGFnZXMocG9vbHNbaV0sIG9yZGVyX2ZsYWdzW2ldKTsKIAkJaWYgKCFwYWdlKQogCQkJY29udGlu
dWU7CiAJCXJldHVybiBwYWdlOwpAQCAtNDA3LDYgKzQxMiwyNSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRtYV9oZWFwX29wcyBzeXN0ZW1faGVhcF9vcHMgPSB7CiBzdGF0aWMgaW50IHN5c3RlbV9o
ZWFwX2NyZWF0ZSh2b2lkKQogewogCXN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5mbyBleHBfaW5m
bzsKKwlpbnQgaTsKKworCWZvciAoaSA9IDA7IGkgPCBOVU1fT1JERVJTOyBpKyspIHsKKwkJc3Ry
dWN0IHBhZ2VfcG9vbF9wYXJhbXMgcHA7CisKKwkJbWVtc2V0KCZwcCwgMCwgc2l6ZW9mKHBwKSk7
CisJCXBwLm9yZGVyID0gb3JkZXJzW2ldOworCQlwcC5kbWFfZGlyID0gRE1BX0JJRElSRUNUSU9O
QUw7CisJCXBvb2xzW2ldID0gcGFnZV9wb29sX2NyZWF0ZSgmcHApOworCisJCWlmIChJU19FUlIo
cG9vbHNbaV0pKSB7CisJCQlpbnQgajsKKworCQkJcHJfZXJyKCIlczogcGFnZSBwb29sIGNyZWF0
aW9uIGZhaWxlZCFcbiIsIF9fZnVuY19fKTsKKwkJCWZvciAoaiA9IDA7IGogPCBpOyBqKyspCisJ
CQkJcGFnZV9wb29sX2Rlc3Ryb3kocG9vbHNbal0pOworCQkJcmV0dXJuIFBUUl9FUlIocG9vbHNb
aV0pOworCQl9CisJfQogCiAJZXhwX2luZm8ubmFtZSA9ICJzeXN0ZW0iOwogCWV4cF9pbmZvLm9w
cyA9ICZzeXN0ZW1faGVhcF9vcHM7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
