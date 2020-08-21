Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC4124D941
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 18:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C69C6E98B;
	Fri, 21 Aug 2020 16:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58296E247;
 Fri, 21 Aug 2020 16:01:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r2so2410185wrs.8;
 Fri, 21 Aug 2020 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6S7nYG45COwD6fXewgQl8rLxWxkl2MJ94CkweTJ2ZOU=;
 b=hv0lCXC5cf5fgzcgBk9byaVwYrzVG+fiElJxW1Lu6+QBCDKt0pjhB7wJrky9v1PoKE
 2JvJOvVBXaF2l2aVD7JcQK9Nu30jlaQIMrHyQ5Dc3U74FY6y77LmNpOXbTYwNlZh3NTC
 RKkueefu8QFiUwPkug+Ff6wFQsOxqEeQtFPofCFFghcPBCX4FfIEb/03IGL/6cuALqVD
 q/OsIIPdBTB/XkL7ryr5gc8iBAV1mwCtBHSt0YEwRMttaw0LeTfjtlhfgaWa8OCinCCU
 uVLeJGw6eNRQg3NI4LaaGrwFjgANvKcagqqrIwQ+IwELNyinMku9GY3s0bthWGZyHJ9P
 5wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6S7nYG45COwD6fXewgQl8rLxWxkl2MJ94CkweTJ2ZOU=;
 b=SDL052h7PNE/wCWtFnm1K+Fqx1B8E+fGIFmHdsaClw94g290kqtp4q3Y2h3+vhVDyB
 HlLInBCSyttzTpm8ohfro7d3C4I1ZnxVfu+iBasz6KamOx65hBniks43i8YGtap8Uunh
 OD0B30h7Od4BJTspqbHwO4Eu4XGrLgorpA0aeVeiIMYohVpKiuhsCZ3ThImk/iRp8sIh
 cRXwuncpDiY7sAb/Q1s0+jijq8qEjeAbfl8D8hu3QvjnquFblroFLBZmCxXwX0tk4Zks
 5OxmhE/0ZVPrA05ToaDjUbOx6zgrQ6aP+MDj4hjvVJ7Kwx1YsGf/bAR+S4MdHn0qw956
 lEbQ==
X-Gm-Message-State: AOAM531/BgV+ZK6dRhvnGr9DdMVZ9nUPkn3OIghDXipJs4njB21JaxfM
 ONz1lbHKi2PWZNZHLuBnrXFPPGCNix0=
X-Google-Smtp-Source: ABdhPJy50FpwhYqqowjKrlwDZjCTXFsjGGQ521oT/aGSj7QQyvZxZcPuMCXxpzzmWcDugoK7BGG/Qg==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr3370668wrp.168.1598025659441; 
 Fri, 21 Aug 2020 09:00:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f174:75c9:ca38:873f])
 by smtp.gmail.com with ESMTPSA id l81sm6554993wmf.4.2020.08.21.09.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:00:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com, skeggsb@gmail.com, dri-devel@lists.freedesktop.org,
 Nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] drm/ttm: make sure that we always zero init mem.bus
Date: Fri, 21 Aug 2020 18:00:48 +0200
Message-Id: <20200821160050.1368-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821160050.1368-1-christian.koenig@amd.com>
References: <20200821160050.1368-1-christian.koenig@amd.com>
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

V2UgYXJlIHRyeWluZyB0byByZW1vdmUgdGhlIGlvX2xydSBoYW5kbGluZyBhbmQgZGVwZW5kCm9u
IHplcm8gaW5pdCBiYXNlIGFuZCBvZmZzZXQgaGVyZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwppbmRleCBlMzkzMWU1MTU5MDYuLjYwYjU4M2QwN2IwNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCkBAIC02NTAsNiArNjUwLDggQEAgc3RhdGljIGludCB0dG1fYm9fZXZpY3Qo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAlldmljdF9tZW0ubW1fbm9kZSA9IE5VTEw7
CiAJZXZpY3RfbWVtLmJ1cy5pb19yZXNlcnZlZF92bSA9IGZhbHNlOwogCWV2aWN0X21lbS5idXMu
aW9fcmVzZXJ2ZWRfY291bnQgPSAwOworCWV2aWN0X21lbS5idXMuYmFzZSA9IDA7CisJZXZpY3Rf
bWVtLmJ1cy5vZmZzZXQgPSAwOwogCiAJcmV0ID0gdHRtX2JvX21lbV9zcGFjZShibywgJnBsYWNl
bWVudCwgJmV2aWN0X21lbSwgY3R4KTsKIAlpZiAocmV0KSB7CkBAIC0xMDg0LDYgKzEwODYsOCBA
QCBzdGF0aWMgaW50IHR0bV9ib19tb3ZlX2J1ZmZlcihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAogCW1lbS5wYWdlX2FsaWdubWVudCA9IGJvLT5tZW0ucGFnZV9hbGlnbm1lbnQ7CiAJbWVt
LmJ1cy5pb19yZXNlcnZlZF92bSA9IGZhbHNlOwogCW1lbS5idXMuaW9fcmVzZXJ2ZWRfY291bnQg
PSAwOworCW1lbS5idXMuYmFzZSA9IDA7CisJbWVtLmJ1cy5vZmZzZXQgPSAwOwogCW1lbS5tbV9u
b2RlID0gTlVMTDsKIAogCS8qCkBAIC0xMjQzLDYgKzEyNDcsOCBAQCBpbnQgdHRtX2JvX2luaXRf
cmVzZXJ2ZWQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJYm8tPm1lbS5wYWdlX2FsaWdu
bWVudCA9IHBhZ2VfYWxpZ25tZW50OwogCWJvLT5tZW0uYnVzLmlvX3Jlc2VydmVkX3ZtID0gZmFs
c2U7CiAJYm8tPm1lbS5idXMuaW9fcmVzZXJ2ZWRfY291bnQgPSAwOworCWJvLT5tZW0uYnVzLmJh
c2UgPSAwOworCWJvLT5tZW0uYnVzLm9mZnNldCA9IDA7CiAJYm8tPm1vdmluZyA9IE5VTEw7CiAJ
Ym8tPm1lbS5wbGFjZW1lbnQgPSAoVFRNX1BMX0ZMQUdfU1lTVEVNIHwgVFRNX1BMX0ZMQUdfQ0FD
SEVEKTsKIAliby0+YWNjX3NpemUgPSBhY2Nfc2l6ZTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
