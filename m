Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F31F6AA
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197CC892CC;
	Wed, 15 May 2019 14:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C719892A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 14:38:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s17so2982159wru.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 07:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kyqLW1wFo6fedLNXu94PYugpnhaCwh1bgBosb5XL4Iw=;
 b=WC/QG0FpZcP4zt71uNvHYyGd6nNwddevPNdUtJYetYbGYsC7ms3f6Gk7TrqWO9lDYo
 uWR36+DKE/1S5znFLKMEn11xuOLhIdBgo35vGjawFQ2SxeD+lrKqoZ9PZOheqJZm+/+W
 lcr60KhyKwtAiRZhPH0kgS1Nigrhu7vL2rnYfPAsizHOHnWRyhagicGsLlqgwJLsjcVt
 Vl0nAzaUoyOXHwWbnEBsraQOJiKaUYCdnxHBvSmjOwoD84ZL+ObdkuycLn/J3EFvRO/Y
 c1pVgRnflw499Pd32/Ir+PNeHeQwY33OopPvH/EUIrB1awmajTJDXPLlcmSxZ2J8Vtka
 b6lw==
X-Gm-Message-State: APjAAAUXbHYHYh0h7o61uHToc1KxX0a0NmgWmSJ3LHF3fgZXeId4e/Pm
 y9uzeo6Nt3WNb8bV+Veyjgw=
X-Google-Smtp-Source: APXvYqxYAKFNmKn2Lk9vjrnfm01AW5oxe+1Bo0VrHLVlR88gsn6TNrGuR3B+wqb24ZvnCEEcFIRkbQ==
X-Received: by 2002:a5d:53c3:: with SMTP id a3mr6676754wrw.60.1557931116089;
 Wed, 15 May 2019 07:38:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fd02:5db:d141:8a62])
 by smtp.gmail.com with ESMTPSA id w7sm2606895wmm.16.2019.05.15.07.38.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 07:38:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Wed, 15 May 2019 16:38:29 +0200
Message-Id: <20190515143831.1639-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190515143831.1639-1-christian.koenig@amd.com>
References: <20190515143831.1639-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kyqLW1wFo6fedLNXu94PYugpnhaCwh1bgBosb5XL4Iw=;
 b=D9TuhU9LhoOHIAoSV+0xU7n/kIb758K+is3ACxw6JmW7ckLCzazm77BXgaly/C1B0E
 3A6Y9zhBYl9RhU4xHvcVTCa4KHm1EZ8gpyoyuJYIvpN2MnurNVRhFAErzpeylSMuKwHE
 uClS3e/d66OQAQIzaV5DONmDeXY/xgJ8GU4Ed0COshzgx9uPMcJJoIE1MQAP43DFOfQU
 kPD5n4p0EUHQw4fFoSw04Fl2jUWD0/baM9KtwRhLsgbgPNJR22nL1eNykyOkSzRdFfp8
 W7F3uBoKdzI5aP9jQG/PU4HIModTCLRzKWRMmigArpT1sk0WiO7LexYik/UQfuuMvyUG
 6n0w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXZvaWQgdGhhdCB3ZSBwaW5nL3BvbmcgdGhlIGJ1ZmZlcnMgd2hlbiB3ZSBzdG9wIHRvIHBpbiBE
TUEtYnVmCmV4cG9ydHMgYnkgdXNpbmcgdGhlIGFsbG93ZWQgZG9tYWlucyBmb3IgZXhwb3J0ZWQg
YnVmZmVycy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IGQ3MmNjNTgzZWJkMS4u
OWIyYjYyZDIyYzAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAt
MjYsNiArMjYsNyBAQAogICovCiAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgogI2luY2x1ZGUg
PGxpbnV4L3N5bmNfZmlsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KICNpbmNsdWRl
IDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9zeW5jb2JqLmg+CkBAIC00MTIsNyArNDEzLDkgQEAgc3RhdGljIGludCBhbWRncHVfY3Nf
Ym9fdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJLyogRG9uJ3QgbW92ZSB0
aGlzIGJ1ZmZlciBpZiB3ZSBoYXZlIGRlcGxldGVkIG91ciBhbGxvd2FuY2UKIAkgKiB0byBtb3Zl
IGl0LiBEb24ndCBtb3ZlIGFueXRoaW5nIGlmIHRoZSB0aHJlc2hvbGQgaXMgemVyby4KIAkgKi8K
LQlpZiAocC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQpIHsKKwlpZiAo
cC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQgJiYKKwkgICAgKCFiby0+
Z2VtX2Jhc2UuZG1hX2J1ZiB8fAorCSAgICBsaXN0X2VtcHR5KCZiby0+Z2VtX2Jhc2UuZG1hX2J1
Zi0+YXR0YWNobWVudHMpKSkgewogCQlpZiAoIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUo
JmFkZXYtPmdtYykgJiYKIAkJICAgIChiby0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVf
QUNDRVNTX1JFUVVJUkVEKSkgewogCQkJLyogQW5kIGRvbid0IG1vdmUgYSBDUFVfQUNDRVNTX1JF
UVVJUkVEIEJPIHRvIGxpbWl0ZWQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
