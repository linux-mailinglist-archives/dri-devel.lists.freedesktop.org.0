Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BDF24A046
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 15:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764056E3DF;
	Wed, 19 Aug 2020 13:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770B86E3DF;
 Wed, 19 Aug 2020 13:44:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so21587673wrc.7;
 Wed, 19 Aug 2020 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lxF/trM9SgnathNJ4ODZkXBgjXiIKUash9TsOy9A8SA=;
 b=u5WY57dRKgnsGFyW5wDApka8d7yha40MMxmCf5a5EZQUGfIiwBusOgW0XfSrGmOMBA
 lSBk8krzrFHj9RxRvY99zBSHPsABj6K2y62EV9tfqOlqm8xWTmDhZQxOVAtkKFljNiHB
 uWOu/JWIXNc3jexdZnnXbXXHS4f9SIsKwIoQQ94NVDUXB7XInYNRHyYAT8sxFBwBiaNw
 AvgZ9aYIsA9uhkQOJbtjXAWuJWozSZpQt884kPZFjS/RsV9+6COx1Uf/gZ9o5aIs+juq
 ckldlydYBit6Vn9RN9evz83dC6/skzURNZLwCt30cpXhhvPxLQa7QF9b0vm9bDS8QaXI
 xybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lxF/trM9SgnathNJ4ODZkXBgjXiIKUash9TsOy9A8SA=;
 b=feXGT6IWgDxpQPHxKq7FoAE6LAaNf3i1vgRv3RYROZ1nnGBfdg8Dr0VqXjO2+JpNe5
 5afQi7zPAdCnLVU2AMmuyJTUoQHtP6K0kq2nH/0COOkBE3B+9zO2E0cLLKpMMJMj1N+G
 +zkmdexyTMe2/KjZngyG2dCIk5WSvOoeBm0Kg9BEF3bi7BQ/qEJfoiKxA5Uz3IIy/rJT
 8SYAK03af2UGnaPhUQuZqMh1avw/KtzRL0FTsK1EuXFysjeNkO6qll6AK5R4NcXqiVQr
 ZjjslJn7Oz2KEUvY03kgjn3HTfjGCO767H4e47m7msElatbAEpKFKDZqmJ0ZZ7xJZWeM
 CimQ==
X-Gm-Message-State: AOAM531BG3h9VldqUJCMLWJAE1fsMNxrydQgJBGcncLR1vrGpZ7NSIjr
 XhYcS+CpSIiyZ9GYwN+J7PlrKA+PCvI=
X-Google-Smtp-Source: ABdhPJzsyij0rqtTA2umVggmf50hkF0KOp7iJPDRlt4HyDoORFCssYxqjM5EDAxB9etjP8+72PitkA==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr24506320wrq.131.1597844660803; 
 Wed, 19 Aug 2020 06:44:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:2c06:21fe:1007:30ae])
 by smtp.gmail.com with ESMTPSA id f17sm5807713wru.13.2020.08.19.06.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 06:44:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix broken merge between drm-next and drm-misc-next
Date: Wed, 19 Aug 2020 15:44:19 +0200
Message-Id: <20200819134419.2054-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtLW5leHQgcmV2ZXJ0ZWQgdGhlIGNoYW5nZXMgdG8gdHRtX3R0X2NyZWF0ZSgpIHRvIGRvIHRo
ZQpOVUxMIGNoZWNrIGluc2lkZSB0aGUgZnVuY3Rpb24sIGJ1dCBkcm0tbWlzYy1uZXh0IGFkZHMg
bmV3CnVzZXJzIG9mIHRoaXMgYXBwcm9hY2guCgpSZS1hcHBseSB0aGUgTlVMTCBjaGVjayBjaGFu
Z2UgaW5zaWRlIHRoZSBmdW5jdGlvbiB0byBmaXggdGhpcy4KClNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDQg
KysrLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKaW5kZXggOTdhYzY2MmE0N2NiLi5lMzkzMWU1MTU5MDYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwpAQCAtMTE4MCw3ICsxMTgwLDcgQEAgaW50IHR0bV9ib192YWxpZGF0ZShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCS8qCiAJICogV2UgbWlnaHQgbmVlZCB0byBhZGQg
YSBUVE0uCiAJICovCi0JaWYgKGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJiBi
by0+dHRtID09IE5VTEwpIHsKKwlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVN
KSB7CiAJCXJldCA9IHR0bV90dF9jcmVhdGUoYm8sIHRydWUpOwogCQlpZiAocmV0KQogCQkJcmV0
dXJuIHJldDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCmluZGV4IDlhYTRmYmUzODZlNi4uMWNjZjFlZjA1MGQ2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3R0LmMKQEAgLTUwLDYgKzUwLDkgQEAgaW50IHR0bV90dF9jcmVhdGUo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCB6ZXJvX2FsbG9jKQogCiAJZG1hX3Jl
c3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7CiAKKwlpZiAoYm8tPnR0bSkKKwkJcmV0dXJu
IDA7CisKIAlpZiAoYmRldi0+bmVlZF9kbWEzMikKIAkJcGFnZV9mbGFncyB8PSBUVE1fUEFHRV9G
TEFHX0RNQTMyOwogCkBAIC02Nyw3ICs3MCw2IEBAIGludCB0dG1fdHRfY3JlYXRlKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgemVyb19hbGxvYykKIAkJcGFnZV9mbGFncyB8PSBU
VE1fUEFHRV9GTEFHX1NHOwogCQlicmVhazsKIAlkZWZhdWx0OgotCQliby0+dHRtID0gTlVMTDsK
IAkJcHJfZXJyKCJJbGxlZ2FsIGJ1ZmZlciBvYmplY3QgdHlwZVxuIik7CiAJCXJldHVybiAtRUlO
VkFMOwogCX0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
