Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB51649D9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99FA89C96;
	Wed, 19 Feb 2020 16:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316326EBF1;
 Wed, 19 Feb 2020 13:50:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w12so655853wrt.2;
 Wed, 19 Feb 2020 05:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWJVvbyji5lv93ku6dxciulHZbwF+rGmjiubbT57gkM=;
 b=FfcgVpIXuA6Uu2tr7kaJzV6S70uVk+xdHWWVo9xgYG7HsGD26tM9iziXlrgJGthMNL
 5vlxUgZQcLDhx4zLj7RrK0qoEUA7Bh2eBS2oZA6DSo+5qVDjAGN3mX/+MBG4VZU5h0E2
 YMgf1mb8tQP+0ndyWZoQd1OeKF+eCYDIrZxA/TnfC8VeR8Y24lwNy6Vo6Jj5JJKxlC0k
 a1QcPg0AS36d1HOBh81vNSmuTBSxWVzzxL79Ro8DvqSmx9ezahnujhKAOPjccJXx1ety
 59PGYauywqd1X1KkXisGKVYObX62AdqgFWysnPQTu34r1rHQ5b4P6XGmQCiq8KVEN7Sj
 zsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWJVvbyji5lv93ku6dxciulHZbwF+rGmjiubbT57gkM=;
 b=uJhY58dKBHD39o+B8ahtGccnQHTztnT2QPdxFUbxhj6EJvQ+HGrtbyz0a8K+dTZ2G9
 sRZq36aLr0kjKuUIAgUzgfBh7uygU1ER2z2+RTZDfFm8xcPml+N229smpU+1rQ11bj2H
 /slFnSMuTIRIwdR9sihMT9SbGpYokpFDWWM4W2wG9DBN9YPKpqeFL5Fquyi4ehbaE4bJ
 hKe27PWgc7OQd2lMsgmh1UKVMfjizG+zLYJKJLZ0E78GDCaWmyf4uIuRtnO6rSnZF+qa
 18FY4WfH+LVHgqR3TFvUCjHQsQAySntqMve1gFLC+27+DQw1I6u1Z6h6B0lFDMbWWq3D
 Bc1Q==
X-Gm-Message-State: APjAAAWobkPwWw1qyJXagkIUcrYcXXSONo1bsIRs9Ri9/YKCAX6HW3Ok
 b9hpO7AxZnPrsOdONlnsDXLBkkWwZOCIFQ==
X-Google-Smtp-Source: APXvYqxAN8BgC23ZDIvOTe3hFC4I0/SvosvvXkP1g5fGVbNNeSCDEEajNPBNLCWd5lYTzFh0tJ1jEg==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr37745072wru.40.1582120244440; 
 Wed, 19 Feb 2020 05:50:44 -0800 (PST)
Received: from brihaspati.fritz.box (p5DE53754.dip0.t-ipconnect.de.
 [93.229.55.84])
 by smtp.gmail.com with ESMTPSA id y1sm3061881wrq.16.2020.02.19.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 05:50:43 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
Date: Wed, 19 Feb 2020 14:53:16 +0100
Message-Id: <20200219135322.56463-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219135322.56463-1-nirmoy.das@amd.com>
References: <20200219135322.56463-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 16:18:11 +0000
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
