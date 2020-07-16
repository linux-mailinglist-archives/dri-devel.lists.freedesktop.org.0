Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D292222D9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7172A6E2B1;
	Thu, 16 Jul 2020 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1870C6E222
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:50:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q5so6928947wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nh9YF4R80f+foSmXySs44UxAVbWDN7uFO3+6X5LLzuA=;
 b=l6b93O51r+efeqZ7cqRgHzWlcTGBeJAUtYxzbAFjYR86Pwes7FwlVQliykY6DukuoZ
 Ins1Dd1Z1G2RsTbbA9zvIwkWObZsl5NtDyxqRuKNtIbiH/79Ahno2Bk23TaPIHRv3Xmo
 GiBNZguuK9PYvWBvn978S9W+fHsKHM2bi9Zsn+QC/dyN9AqrNOvamYYdGTjW01MVzWJC
 BbZRxwrYIALI7ukDT1ufY7ctUgrw5ppkzEjKsjT/pQamQnpzHLglj/MmXlhwDGgG980e
 gwLm8NJZ2YvEnbE7EXevoMQcnCiP2810QALP1AAN/Lv6bd0EKMrvhLPJWHUowYSE+mzU
 /EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nh9YF4R80f+foSmXySs44UxAVbWDN7uFO3+6X5LLzuA=;
 b=NX0MX2A0jGJohdgNF/3YM0ffBTcUuU0Ej9zceb1jcHGhnqOwDX4N1pDOCd6WrA58MI
 jq3UNBzW252Pfx7bakGLtlwU4LdRQ4mIzctwOzi+ByHLrz3i6MB5Piv4d01LXO4mYy0g
 90DWZhNazQweFC6CR6N4iCQcEDoZJXis9Omsu+dXlQzDEaMClOlAEZfyuvNSsi9ci6nS
 hpt1b6lQJS0ENwkrE6fZCnJgW8CbRMBgkx0kNCJ6vdgwzOi3DGbL7dGsA3SHPkeEWrGv
 lUw5cV7bV1U1eymlrnIKpknfgE0qg5gxI5OHLuASrBnAnMPtsuPs0lbT9Zrgt5ApFghJ
 JU8A==
X-Gm-Message-State: AOAM530FsNoe+B4AWyKTKPhAEXZF5BN7/ZSExRHmZCek+LqoocxL9Xh6
 VNfVUSkCt4eiKQDHeGgtI42oXx5m
X-Google-Smtp-Source: ABdhPJwI9syA7xSYRkD10+tuSbMn8hSQGTyvO6aT34HYVjPrzZI5VqCqSlvSx5ciiPYvnnE72kR3GQ==
X-Received: by 2002:a05:6000:6:: with SMTP id h6mr4875579wrx.26.1594903840424; 
 Thu, 16 Jul 2020 05:50:40 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:efc1:eb01:18eb:bff2])
 by smtp.gmail.com with ESMTPSA id z25sm7669872wmk.28.2020.07.16.05.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:50:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Thu, 16 Jul 2020 14:50:31 +0200
Message-Id: <20200716125037.67437-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291cmNl
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDEzICsrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCA1NGFmMDZkZjg2NWIuLmI0NzQ3
ODFhMDkyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTc2LDcgKzc2LDcg
QEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAq
YmRldiwgdWludDMyX3QgdHlwZSwKIAlzd2l0Y2ggKHR5cGUpIHsKIAljYXNlIFRUTV9QTF9TWVNU
RU06CiAJCS8qIFN5c3RlbSBtZW1vcnkgKi8KLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZM
QUdfTUFQUEFCTEU7CisJCW1hbi0+ZmxhZ3MgPSAwOwogCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5n
ID0gVFRNX1BMX01BU0tfQ0FDSElORzsKIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7CiAJCWJyZWFrOwpAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IHJhZGVv
bl9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBl
LAogCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKIAkJbWFuLT5hdmFpbGFibGVf
Y2FjaGluZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0g
VFRNX1BMX0ZMQUdfQ0FDSEVEOwotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQ
QUJMRTsKKwkJbWFuLT5mbGFncyA9IDA7CiAjaWYgSVNfRU5BQkxFRChDT05GSUdfQUdQKQogCQlp
ZiAocmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfQUdQKSB7CiAJCQlpZiAoIXJkZXYtPmRkZXYtPmFn
cCkgewpAQCAtOTIsOCArOTIsNiBAQCBzdGF0aWMgaW50IHJhZGVvbl9pbml0X21lbV90eXBlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCQkJCQkgICh1bnNpZ25l
ZCl0eXBlKTsKIAkJCQlyZXR1cm4gLUVJTlZBTDsKIAkJCX0KLQkJCWlmICghcmRldi0+ZGRldi0+
YWdwLT5jYW50X3VzZV9hcGVydHVyZSkKLQkJCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxB
R19NQVBQQUJMRTsKIAkJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19VTkNB
Q0hFRCB8CiAJCQkJCQkgVFRNX1BMX0ZMQUdfV0M7CiAJCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9
IFRUTV9QTF9GTEFHX1dDOwpAQCAtMTAzLDggKzEwMSw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2lu
aXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJ
Y2FzZSBUVE1fUExfVlJBTToKIAkJLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwogCQltYW4tPmZ1
bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZM
QUdfRklYRUQgfAotCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOworCQltYW4tPmZs
YWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRDsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9
IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfV0M7CiAJCW1hbi0+ZGVmYXVsdF9j
YWNoaW5nID0gVFRNX1BMX0ZMQUdfV0M7CiAJCWJyZWFrOwpAQCAtMzk0LDcgKzM5MSw2IEBAIHN0
YXRpYyBpbnQgcmFkZW9uX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9v
bCBldmljdCwKIAogc3RhdGljIGludCByYWRlb25fdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKIHsKLQlzdHJ1Y3Qg
dHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bbWVtLT5tZW1fdHlwZV07CiAJ
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYgPSByYWRlb25fZ2V0X3JkZXYoYmRldik7CiAKIAlt
ZW0tPmJ1cy5hZGRyID0gTlVMTDsKQEAgLTQwMiw4ICszOTgsNyBAQCBzdGF0aWMgaW50IHJhZGVv
bl90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0
dG1fbWVtXwogCW1lbS0+YnVzLnNpemUgPSBtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwog
CW1lbS0+YnVzLmJhc2UgPSAwOwogCW1lbS0+YnVzLmlzX2lvbWVtID0gZmFsc2U7Ci0JaWYgKCEo
bWFuLT5mbGFncyAmIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEUpKQotCQlyZXR1cm4gLUVJTlZB
TDsKKwogCXN3aXRjaCAobWVtLT5tZW1fdHlwZSkgewogCWNhc2UgVFRNX1BMX1NZU1RFTToKIAkJ
Lyogc3lzdGVtIG1lbW9yeSAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
