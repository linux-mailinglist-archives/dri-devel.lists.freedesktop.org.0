Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3417B7E0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78DC6EC6D;
	Fri,  6 Mar 2020 08:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BCD6EBC2;
 Thu,  5 Mar 2020 13:25:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v4so7005731wrs.8;
 Thu, 05 Mar 2020 05:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFXOooXl15aInC0K+fbcrHdLPeZr7NFbN7oTkHPHgHU=;
 b=sdzUqst53Svl/Fb9uslb6zw2jpQc/uAU3/atehJI/coLZnYvXYjU+mtv+zXQZC7pHH
 QMuAkB+uW8zBlYNX4mAV5ckNpYhlW4wtEMJmpTM9lqPLV253L+6JIKV/gZ2e5VFjfuXI
 Fcz/4t/G9FLCOB4V/tsFFcKV5FlxPjLtNnV2n4qZD34c1a6KUng5oPuxys9Q7e2medGN
 fJlhuLeSJ+m5QjGBcIMA8kXQMmMbo4JIjAV86RJX2HDdV2UQZ29vaUMxugf5nwsj0LBz
 6+UFLKXNgBayZpEdBskjZg+myGjBMQdRutxdMWw2CkaznxOBa84U8axemwB6QQNMIu+w
 80Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFXOooXl15aInC0K+fbcrHdLPeZr7NFbN7oTkHPHgHU=;
 b=Tg+D/elB2YWWwnpW9ByCeWCj1lGTaebZLHyUrswiNr0jhRtCUCkhW1cnWRRTWzXS35
 hvBCGMAdzacitxGRQQnPfH6TaiNLA2NJYCVrpi3iBWPKgqTMU7+nYq/ysGCQ1ZWVY7Fe
 Pmtw62eAK4Bf/DE2fOLoPMWR7iln2XhET0Kwl4zyJPgxi54uMapDEHt3LtZ08U9B+JJn
 AobO03lkY0TxhjqEB+cdRF9eGGqB2EEsr1oiNq4xby8116ojxi7jFHddzv+QnJrQww2K
 eIQpwhns49FNismRqWof3TwYQ1sUtj9vHb4a+Wsvz9Qaxbydx0lFE+rZJpI0TujJlICz
 XVMQ==
X-Gm-Message-State: ANhLgQ0rbt61X387FJqdkI43L9tz3h4vjmfpu1yLoOmznPJZTRZXTdB7
 ii9uJGwZN1+ASdmS2V8p4Ut25UnGbyCU4A==
X-Google-Smtp-Source: ADFU+vuG2sJfeiCoHC2/f/tb/GB7e5HZTcmif44OZtk2e9/VcBnd2FtbfVrqhNzBSwy4d4Hhzm/dTg==
X-Received: by 2002:adf:fdc2:: with SMTP id i2mr10797658wrs.166.1583414751202; 
 Thu, 05 Mar 2020 05:25:51 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2EA5001F22CF19908511A1.dip0.t-ipconnect.de.
 [2003:c5:8f2e:a500:1f22:cf19:9085:11a1])
 by smtp.gmail.com with ESMTPSA id g14sm45424819wrv.58.2020.03.05.05.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:25:50 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
Date: Thu,  5 Mar 2020 14:29:04 +0100
Message-Id: <20200305132910.17515-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200305132910.17515-1-nirmoy.das@amd.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
bmRpbmcgb24KYm8tPm9mZnNldC4KClNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5k
YXNAYW1kLmNvbT4KUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
LmggICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0Lmgg
fCAxNiArKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0u
YyAgICB8ICA0ICstLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAppbmRleCAzMGUzMmFkYzFmYzYuLmI3YzNm
YjJiZmI1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCkBAIC0yODI4LDYgKzI4MjgsNyBAQCBl
eHRlcm4gdm9pZCByYWRlb25fdHRtX3NldF9hY3RpdmVfdnJhbV9zaXplKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2LCB1NjQgc2l6ZQogZXh0ZXJuIHZvaWQgcmFkZW9uX3Byb2dyYW1fcmVnaXN0
ZXJfc2VxdWVuY2Uoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAJCQkJCSAgICAgY29uc3Qg
dTMyICpyZWdpc3RlcnMsCiAJCQkJCSAgICAgY29uc3QgdTMyIGFycmF5X3NpemUpOworc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJhZGVvbl9nZXRfcmRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRl
dik7CgogLyoKICAqIHZtCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5oCmluZGV4
IGQyM2YyZWQ0MTI2ZS4uNjAyNzViODIyZjc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9vYmplY3QuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9vYmplY3QuaApAQCAtOTAsNyArOTAsMjEgQEAgc3RhdGljIGlubGluZSB2b2lkIHJhZGVvbl9i
b191bnJlc2VydmUoc3RydWN0IHJhZGVvbl9ibyAqYm8pCiAgKi8KIHN0YXRpYyBpbmxpbmUgdTY0
IHJhZGVvbl9ib19ncHVfb2Zmc2V0KHN0cnVjdCByYWRlb25fYm8gKmJvKQogewotCXJldHVybiBi
by0+dGJvLm9mZnNldDsKKwlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldjsKKwl1NjQgc3RhcnQg
PSAwOworCisJcmRldiA9IHJhZGVvbl9nZXRfcmRldihiby0+dGJvLmJkZXYpOworCisJc3dpdGNo
IChiby0+dGJvLm1lbS5tZW1fdHlwZSkgeworCWNhc2UgVFRNX1BMX1RUOgorCQlzdGFydCA9IHJk
ZXYtPm1jLmd0dF9zdGFydDsKKwkJYnJlYWs7CisJY2FzZSBUVE1fUExfVlJBTToKKwkJc3RhcnQg
PSByZGV2LT5tYy52cmFtX3N0YXJ0OworCQlicmVhazsKKwl9CisKKwlyZXR1cm4gKGJvLT50Ym8u
bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQpICsgc3RhcnQ7CiB9Cgogc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIHJhZGVvbl9ib19zaXplKHN0cnVjdCByYWRlb25fYm8gKmJvKQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCBiYWRmMWI2ZDE1NDkuLjFjODMwMzQ2OGU4ZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTU2LDcgKzU2LDcgQEAKIHN0YXRpYyBp
bnQgcmFkZW9uX3R0bV9kZWJ1Z2ZzX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwog
c3RhdGljIHZvaWQgcmFkZW9uX3R0bV9kZWJ1Z2ZzX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOwoKLXN0YXRpYyBzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmFkZW9uX2dldF9yZGV2KHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KQorc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJhZGVvbl9n
ZXRfcmRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKIHsKIAlzdHJ1Y3QgcmFkZW9uX21t
YW4gKm1tYW47CiAJc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXY7CkBAIC04Miw3ICs4Miw2IEBA
IHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYsIHVpbnQzMl90IHR5cGUsCiAJCWJyZWFrOwogCWNhc2UgVFRNX1BMX1RUOgogCQltYW4tPmZ1
bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKLQkJbWFuLT5ncHVfb2Zmc2V0ID0gcmRldi0+bWMu
Z3R0X3N0YXJ0OwogCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FDSElO
RzsKIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCW1hbi0+
ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFIHwgVFRNX01FTVRZUEVfRkxBR19DTUE7
CkBAIC0xMDQsNyArMTAzLDYgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKIAljYXNlIFRUTV9QTF9WUkFN
OgogCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCiAJCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFu
YWdlcl9mdW5jOwotCQltYW4tPmdwdV9vZmZzZXQgPSByZGV2LT5tYy52cmFtX3N0YXJ0OwogCQlt
YW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8CiAJCQkgICAgIFRUTV9NRU1UWVBF
X0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19V
TkNBQ0hFRCB8IFRUTV9QTF9GTEFHX1dDOwotLQoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
