Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9D227985
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01C16E499;
	Tue, 21 Jul 2020 07:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31BB6E499
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:32:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so20109882wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jOa2WyobN/6mvqZxpF7+Iz+WO1Tz3EGHp3pswI1bT8U=;
 b=MucdR56B3jAmW2i+GRMIk0fcFi9groYLf92wjCg8opCgvKx26RVtrNqVwuxzWL0OQM
 rwK/OTAMMbTg0ECMPWEEhnRdUvjezG6xEZYC7Y+MKi/M+EFqgGvwJQ0qSXqYS37U/VJs
 JSTwJ1Bb9QBpT5onTfHNydq0drWamK4KsV67RnuIsx8NPELS3UcQpy3+l4nX0i7XQCiU
 5foroyCIVvc1pTTPu3/R9I7LLcId8vYYxPBKFZNy7AwocpjSnWsXyAGL9FlJVrU5H2o4
 PEEDbAZvDEPf3fseja65E1kFdPcR3AwzkIbh9ENfkNuHiI0oLl65s336e3fh/dWKA119
 dCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOa2WyobN/6mvqZxpF7+Iz+WO1Tz3EGHp3pswI1bT8U=;
 b=NCZcquJwWUqUjHHjWYxfdITW/Jmu2auZUUYQsWwrkgfbIcbKzne/+O3d4502mVlQMV
 U0mFxhuPnhScoumPai4vne69gMXTHBz5HEYQxdpXc9GUqVRA9Av/62rTWg07e7puQZVV
 gPUUyi+TFYrhEnkwrD6tZsf+JEGTEUmEJe6KvcdKPmUIs49ChkrRl7P65RopP2A4Rt1z
 va7VHCxtf42F7o2jTEnQlj3/kEhFQtzKkUM/BXLTpN5o3o+7IizzrATMh9tb5skdkHKG
 y2ewQEyN5EmCxuV/U+QvroLXbUP3kys7OVe/slSXtCxJwvWv5SV2OCJesYz17MBOVxZQ
 /bOg==
X-Gm-Message-State: AOAM532siXLSbqozeZ+XqKf4xpJFHvBgQ34YosA/I7/YiiDzdrjKhQTC
 xQ8wdVLOsmCJI8Glpeeo6z6GhXqd
X-Google-Smtp-Source: ABdhPJy765RUdYiev5eTefh5nqGkGmkJi/WHMl529J/2+Rd3hDJBy4Ll2Nsd6s2cm/h/BQAv+EYSwg==
X-Received: by 2002:adf:a19e:: with SMTP id u30mr11716861wru.274.1595316773379; 
 Tue, 21 Jul 2020 00:32:53 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5eb1:eb29:dadc:7fc5])
 by smtp.gmail.com with ESMTPSA id s4sm29740896wre.53.2020.07.21.00.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:32:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] drm/vmwgfx: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Tue, 21 Jul 2020 09:32:41 +0200
Message-Id: <20200721073245.2484-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721073245.2484-1-christian.koenig@amd.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291cmNl
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCA5
ICsrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKaW5kZXggNmJl
YTc1NDhhZWUwLi4xZDc4MTg3ZWFiYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X3R0bV9idWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF90dG1fYnVmZmVyLmMKQEAgLTc0MiwxNSArNzQyLDEzIEBAIHN0YXRpYyBpbnQgdm13X2luaXRf
bWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJc3dp
dGNoICh0eXBlKSB7CiAJY2FzZSBUVE1fUExfU1lTVEVNOgogCQkvKiBTeXN0ZW0gbWVtb3J5ICov
Ci0KLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZh
aWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCW1hbi0+ZGVmYXVsdF9jYWNo
aW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwogCQlicmVhazsKIAljYXNlIFRUTV9QTF9WUkFNOgog
CQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCiAJCW1hbi0+ZnVuYyA9ICZ2bXdfdGhwX2Z1bmM7
Ci0JCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwgVFRNX01FTVRZUEVfRkxB
R19NQVBQQUJMRTsKKwkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQ7CiAJCW1h
bi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCW1hbi0+ZGVmYXVs
dF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwogCQlicmVhazsKQEAgLTc2Miw3ICs3NjAs
NiBAQCBzdGF0aWMgaW50IHZtd19pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LCB1aW50MzJfdCB0eXBlLAogCQkgKiAgc2xvdHMgYXMgd2VsbCBhcyB0aGUgYm8gc2l6ZS4K
IAkJICovCiAJCW1hbi0+ZnVuYyA9ICZ2bXdfZ21yaWRfbWFuYWdlcl9mdW5jOwotCQltYW4tPmZs
YWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGlu
ZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7CiAJCWJyZWFrOwpAQCAtNzg5LDcgKzc4Niw2IEBAIHN0YXRpYyBpbnQgdm13
X3ZlcmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0IGZpbGUg
KmZpbHApCiAKIHN0YXRpYyBpbnQgdm13X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCiB7Ci0Jc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+bWVtX3R5cGVdOwogCXN0cnVj
dCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYgPSBjb250YWluZXJfb2YoYmRldiwgc3RydWN0IHZtd19w
cml2YXRlLCBiZGV2KTsKIAogCW1lbS0+YnVzLmFkZHIgPSBOVUxMOwpAQCAtNzk3LDggKzc5Myw3
IEBAIHN0YXRpYyBpbnQgdm13X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fcmVnCiAJbWVtLT5idXMub2Zmc2V0ID0gMDsKIAltZW0t
PmJ1cy5zaXplID0gbWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsKIAltZW0tPmJ1cy5iYXNl
ID0gMDsKLQlpZiAoIShtYW4tPmZsYWdzICYgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRSkpCi0J
CXJldHVybiAtRUlOVkFMOworCiAJc3dpdGNoIChtZW0tPm1lbV90eXBlKSB7CiAJY2FzZSBUVE1f
UExfU1lTVEVNOgogCWNhc2UgVk1XX1BMX0dNUjoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
