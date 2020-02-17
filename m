Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FEB1621CD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3F6E172;
	Tue, 18 Feb 2020 07:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE5B6E904;
 Mon, 17 Feb 2020 10:16:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r11so18911837wrq.10;
 Mon, 17 Feb 2020 02:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWJVvbyji5lv93ku6dxciulHZbwF+rGmjiubbT57gkM=;
 b=KTqLGbQV5ypb/tAqXb5eaxLaNZ1Uu6fx/w1xYMydjW0RQTD5mb6inZ+GwbIQzupanu
 miX9HFisCwAWVOc+CFefHJQYMCrLRYCfYGTJ8RSZOqnijf6gRWXc5YZZNN38doJ2F82G
 TJhcUKW4+NOyKPUhWabH6Z1PDpzXooc7uk/KwqARR35qSc0gB3XcvSiUAt3KtLSO7R3r
 qrtt+BuO2a9rwow2JHkVX+ZQqFNcDDTq7S0BJ+Gpte+KuoI6w9EDO4kDKIZp4Twm9fF8
 usJYF8j9r+tYfdl3rZAOIRAuDaviUsdzkVAGToHyL9Y/ynQ/KTZ2P0ul6k8mJB5i9Mh9
 whNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWJVvbyji5lv93ku6dxciulHZbwF+rGmjiubbT57gkM=;
 b=eLQEY22zZbq3D1vOx1FA/GgBVSQOVAX89wERivDSRUas290ifsbTA4JCLZZzaifn/y
 U/cblhIIDU7oFyAI7Wmay3fBTBYGAdEw3fQhmwLb0pNXRsnBQIDgWqyMEwt8FbcL5kXf
 pSmFOzHH3Rqc4dSBf3yamRcy+EJDoHghBgEn4BUHYL/GPfBq4hDVc5Gt9cMHTTZJKicf
 wFzY94epJAB7wgwRqiGfpj3ZWjm0PwYEq1q81T1vVe7jtkA3zausbEviyBcoKabo6nqF
 ORUWeVVjnmXfHwRl7l8Bh6D+AZ+k1NtbaY94rH9+Xv2djQSEpvNDx2Mo/aTZA2tMW+B5
 c7tw==
X-Gm-Message-State: APjAAAUC/yYW0w/trsZWmlJRkotDSpGujSuniUoA2hVWUjtn8+Xgfhil
 j9Y6JwGdKYHuJOtPEmxZ5OuxIXHqIin4Hg==
X-Google-Smtp-Source: APXvYqwD4spEte5a+f8rIFQdVYJaPaG7MRLgGsVLIBM3PNh8GRdExLhbDIqYlcW/rCDitiw7y+BDsA==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr20315317wrl.190.1581934561462; 
 Mon, 17 Feb 2020 02:16:01 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F261400BC111EAD619EC67C.dip0.t-ipconnect.de.
 [2003:c5:8f26:1400:bc11:1ead:619e:c67c])
 by smtp.gmail.com with ESMTPSA id a16sm278487wrt.30.2020.02.17.02.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 02:16:01 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/radeon: don't use ttm bo->offset
Date: Mon, 17 Feb 2020 11:18:36 +0100
Message-Id: <20200217101841.7437-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217101841.7437-1-nirmoy.das@amd.com>
References: <20200217101841.7437-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FsY3VsYXRlIEdQVSBvZmZzZXQgaW4gcmFkZW9uX2JvX2dwdV9vZmZzZXQgd2l0aG91dCBkZXBl
bmRpbmcgb24KYm8tPm9mZnNldAoKU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRh
c0BhbWQuY29tPgpSZXZpZXdlZC1hbmQtdGVzdGVkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24u
aCAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaCB8
IDE2ICsrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5j
ICAgIHwgIDQgKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmggYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCmluZGV4IDMwZTMyYWRjMWZjNi4uYjdjM2Zi
MmJmYjU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKQEAgLTI4MjgsNiArMjgyOCw3IEBAIGV4
dGVybiB2b2lkIHJhZGVvbl90dG1fc2V0X2FjdGl2ZV92cmFtX3NpemUoc3RydWN0IHJhZGVvbl9k
ZXZpY2UgKnJkZXYsIHU2NCBzaXplCiBleHRlcm4gdm9pZCByYWRlb25fcHJvZ3JhbV9yZWdpc3Rl
cl9zZXF1ZW5jZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKIAkJCQkJICAgICBjb25zdCB1
MzIgKnJlZ2lzdGVycywKIAkJCQkJICAgICBjb25zdCB1MzIgYXJyYXlfc2l6ZSk7CitzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmFkZW9uX2dldF9yZGV2KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
KTsKIAogLyoKICAqIHZtCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5oCmluZGV4
IGQyM2YyZWQ0MTI2ZS4uNGQzNzU3MWM3ZmY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9vYmplY3QuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9vYmplY3QuaApAQCAtOTAsNyArOTAsMjEgQEAgc3RhdGljIGlubGluZSB2b2lkIHJhZGVvbl9i
b191bnJlc2VydmUoc3RydWN0IHJhZGVvbl9ibyAqYm8pCiAgKi8KIHN0YXRpYyBpbmxpbmUgdTY0
IHJhZGVvbl9ib19ncHVfb2Zmc2V0KHN0cnVjdCByYWRlb25fYm8gKmJvKQogewotCXJldHVybiBi
by0+dGJvLm9mZnNldDsKKwlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldjsKKwl1NjQgc3RhcnQg
PSAwOworCisJcmRldiA9IHJhZGVvbl9nZXRfcmRldihiby0+dGJvLmJkZXYpOworCisJc3dpdGNo
KGJvLT50Ym8ubWVtLm1lbV90eXBlKSB7CisJY2FzZSBUVE1fUExfVFQ6CisJCXN0YXJ0ID0gcmRl
di0+bWMuZ3R0X3N0YXJ0OworCQlicmVhazsKKwljYXNlIFRUTV9QTF9WUkFNOgorCQlzdGFydCA9
IHJkZXYtPm1jLnZyYW1fc3RhcnQ7CisJCWJyZWFrOworCX0KKworCXJldHVybiAoYm8tPnRiby5t
ZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkgKyBzdGFydDsKIH0KIAogc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIHJhZGVvbl9ib19zaXplKHN0cnVjdCByYWRlb25fYm8gKmJvKQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCBiYWRmMWI2ZDE1NDkuLjFjODMwMzQ2OGU4ZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTU2LDcgKzU2LDcgQEAKIHN0YXRpYyBp
bnQgcmFkZW9uX3R0bV9kZWJ1Z2ZzX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwog
c3RhdGljIHZvaWQgcmFkZW9uX3R0bV9kZWJ1Z2ZzX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOwogCi1zdGF0aWMgc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJhZGVvbl9nZXRfcmRldihz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKK3N0cnVjdCByYWRlb25fZGV2aWNlICpyYWRlb25f
Z2V0X3JkZXYoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpCiB7CiAJc3RydWN0IHJhZGVvbl9t
bWFuICptbWFuOwogCXN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2OwpAQCAtODIsNyArODIsNiBA
QCBzdGF0aWMgaW50IHJhZGVvbl9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LCB1aW50MzJfdCB0eXBlLAogCQlicmVhazsKIAljYXNlIFRUTV9QTF9UVDoKIAkJbWFuLT5m
dW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7Ci0JCW1hbi0+Z3B1X29mZnNldCA9IHJkZXYtPm1j
Lmd0dF9zdGFydDsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9NQVNLX0NBQ0hJ
Tkc7CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwogCQltYW4t
PmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRSB8IFRUTV9NRU1UWVBFX0ZMQUdfQ01B
OwpAQCAtMTA0LDcgKzEwMyw2IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJY2FzZSBUVE1fUExfVlJB
TToKIAkJLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwogCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21h
bmFnZXJfZnVuYzsKLQkJbWFuLT5ncHVfb2Zmc2V0ID0gcmRldi0+bWMudnJhbV9zdGFydDsKIAkJ
bWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQgfAogCQkJICAgICBUVE1fTUVNVFlQ
RV9GTEFHX01BUFBBQkxFOwogCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdf
VU5DQUNIRUQgfCBUVE1fUExfRkxBR19XQzsKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
