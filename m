Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1FF15EEC
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 10:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676D089F2A;
	Tue,  7 May 2019 08:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053CD89EB7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 08:13:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a12so10837393wrn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 01:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoYT2hHMrYQEC4CQx+FjWhBLa6BIb+UBkeO3tQb+qow=;
 b=ntNQRG3SAUXJtBsO2JZmyjmMxVCn5B8dvgVVUurKJqM1SF65ADrWZS2jovUSKB+fPB
 oI6ziLBZbNBlVHxjlEETt/GDe77za6TSKlhdL0D1O+SK+LydVhOg2KAB1F8O3yq6QzHP
 4sZb14JP5GvmjRlozciSHUBF7wWargAR/pJaaC9YMzxKzFeC4TfpZx6u8fCYH9EAd91J
 nrb0vAMkyf2bvLfWxAc6cAzYBJokync3udLe/3PlVsoVosZaG3gSMTRw4A50ed7ftaLb
 RtebfJvexxp01A/fD/MwRWWGz3RAIrYFD/OwnNmc42dY8hEuF2dYT4TFJlkmgzH3o7V5
 z+NA==
X-Gm-Message-State: APjAAAVNu35EH4epIzuqsdsKJ6dH6t/2bZwH3sjac0783VgdC39F6yhS
 vKEYMialnzAaxU8Et+6ER6P1+BBB
X-Google-Smtp-Source: APXvYqwynGzO+xlDXzMaa0CTzeJRisBLjkqE71PweXYOfshQCBWHv8Nf7/jAX1W2QdFp/+CgKUEc9w==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr7913796wrw.152.1557216823587; 
 Tue, 07 May 2019 01:13:43 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id 67sm13588683wmz.41.2019.05.07.01.13.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:13:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Tue,  7 May 2019 10:13:35 +0200
Message-Id: <20190507081338.2571-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081338.2571-1-christian.koenig@amd.com>
References: <20190507081338.2571-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KoYT2hHMrYQEC4CQx+FjWhBLa6BIb+UBkeO3tQb+qow=;
 b=aw8P4CxOuvGh8Hx+a5pL6etIjpeWPEv11OcHp4IxlyhoCq1XxIs8lu6KCnymeDAgNj
 Zmx2RK7pQdpQ1m7g4QzVpYxHVHiHTghuDDBeDRA/LkLGaAaQO66lr58reg+UBF6unMda
 3M8sHkvmQgfTgkijlj99MR6bsssKRu1Tqf/8XR9tQyp4LhBvXJldiF8j9TSt7vaWxjFi
 tBuweoaYgfFBVK7pqpxVpgpcW02PlWRNbekTRnDYUdDsJH2v0ssjtPeYjptGk+jSxtkw
 NFp18da2d/JhLS7rS51M3oSGagdeMRw4RZ5lrVYGZSpNzy+Nj4f/Snl8ssYyPHuCSmHf
 jaow==
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
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IGQwZTIyMWM4ZDk0MC4u
ZDYyMjNlNDFlMzU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
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
