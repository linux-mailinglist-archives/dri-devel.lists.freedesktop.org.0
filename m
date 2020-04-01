Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A919BC79
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944C56E9EE;
	Thu,  2 Apr 2020 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E296E984
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 18:38:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t8so827574wmi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 11:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zR38ZJz9N+JMEkJu4kuO/NmD297bBtOd+wJpasb+334=;
 b=CRx7/A/8IESq1R1SqFL4udlX63sOgLDO0ZHdENXLB3SlndVsnUiNaKdv8OE9SA58zs
 /x4phhUwyTiFmZM93lpIPWwgvJdjrebzaE4yc7jGy2ckPykECzdBAoq9eeuKnMD9M8Fj
 RGjUpPoej1+s6rU3FaNmRZ8Cj0YXXNrms2gE/PxEf7YhajqelD2wlA9TJc6YlqJAcCWd
 qvtVecfmdpqOi6RQk9Pm5QLQyNY95bf0c/E2D8ylQVcZvceKFrV/8V/vKf5aI697IaUn
 LEhXlTs+J6r8LzbF3tA8hfsHGQfDSG/81FJ9phAV4JR3kbfnr7b086DMuZP2FuVMMQhq
 2BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zR38ZJz9N+JMEkJu4kuO/NmD297bBtOd+wJpasb+334=;
 b=YrHV25sLquYwI7gQQh3AG8y91LMJqwH0rNKQBWAjMHmiBkdwTavK5xS5RhznLpTFan
 odx7vlkzlaOnNBF0ScUQQ3nfVbnzfYZiIl3Qzb5n1gFb5Z/xSi9le4iyKerISu3RPA9p
 EBMwMDw1M7AY2x0pOxBkO9AfdcGVHaiWOBV2dQS8B/Wm5PzbWlL9hVBV4posbzAMd8Hg
 KOuQUo9mEFPUOq6DkcDyEyaf717pXhOwHl2gnsBQIhdlL+LvH4BZ42bit9TR62jCMdTK
 UmROwm6lM9GGxUfYgHEG2y8R2y8ky3EGs7vH3cpg2vH4NnIYvXlLfFRTI51VBMq08Gdj
 UOrA==
X-Gm-Message-State: AGi0PuZmhtfwKZFZNrlw8Hl4pO0/Y1lCWzzoG24/2msXB9Dki1Fk42B5
 HceGIUEA11p5zJEGzA4SJPeWHdW8BpI=
X-Google-Smtp-Source: APiQypKviS+UExRe7ny0VL0hvce0f87QXebHq7qYYoiSngo+VvkuVH0hCqK/IHPDZFjpwK+FZUR4bQ==
X-Received: by 2002:a1c:1fd0:: with SMTP id f199mr5624582wmf.92.1585766314960; 
 Wed, 01 Apr 2020 11:38:34 -0700 (PDT)
Received: from brihaspati.fritz.box (p5DE52E4E.dip0.t-ipconnect.de.
 [93.229.46.78])
 by smtp.gmail.com with ESMTPSA id b11sm3976973wrq.26.2020.04.01.11.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 11:38:34 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
Date: Wed,  1 Apr 2020 20:42:41 +0200
Message-Id: <20200401184247.16643-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401184247.16643-1-nirmoy.das@amd.com>
References: <20200401184247.16643-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
 brian.welty@intel.com, nirmoy.das@amd.com,
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
dik7CiAKIC8qCiAgKiB2bQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fb2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaAppbmRl
eCBkMjNmMmVkNDEyNmUuLjYwMjc1YjgyMmY3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fb2JqZWN0LmgKQEAgLTkwLDcgKzkwLDIxIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCByYWRlb25f
Ym9fdW5yZXNlcnZlKHN0cnVjdCByYWRlb25fYm8gKmJvKQogICovCiBzdGF0aWMgaW5saW5lIHU2
NCByYWRlb25fYm9fZ3B1X29mZnNldChzdHJ1Y3QgcmFkZW9uX2JvICpibykKIHsKLQlyZXR1cm4g
Ym8tPnRiby5vZmZzZXQ7CisJc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXY7CisJdTY0IHN0YXJ0
ID0gMDsKKworCXJkZXYgPSByYWRlb25fZ2V0X3JkZXYoYm8tPnRiby5iZGV2KTsKKworCXN3aXRj
aCAoYm8tPnRiby5tZW0ubWVtX3R5cGUpIHsKKwljYXNlIFRUTV9QTF9UVDoKKwkJc3RhcnQgPSBy
ZGV2LT5tYy5ndHRfc3RhcnQ7CisJCWJyZWFrOworCWNhc2UgVFRNX1BMX1ZSQU06CisJCXN0YXJ0
ID0gcmRldi0+bWMudnJhbV9zdGFydDsKKwkJYnJlYWs7CisJfQorCisJcmV0dXJuIChiby0+dGJv
Lm1lbS5zdGFydCA8PCBQQUdFX1NISUZUKSArIHN0YXJ0OwogfQogCiBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgcmFkZW9uX2JvX3NpemUoc3RydWN0IHJhZGVvbl9ibyAqYm8pCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3R0bS5jCmluZGV4IGJhZGYxYjZkMTU0OS4uMWM4MzAzNDY4ZThmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwpAQCAtNTYsNyArNTYsNyBAQAogc3RhdGlj
IGludCByYWRlb25fdHRtX2RlYnVnZnNfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiBzdGF0aWMgdm9pZCByYWRlb25fdHRtX2RlYnVnZnNfZmluaShzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSAqcmRldik7CiAKLXN0YXRpYyBzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmFkZW9uX2dldF9yZGV2
KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KQorc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJhZGVv
bl9nZXRfcmRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKIHsKIAlzdHJ1Y3QgcmFkZW9u
X21tYW4gKm1tYW47CiAJc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXY7CkBAIC04Miw3ICs4Miw2
IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJCWJyZWFrOwogCWNhc2UgVFRNX1BMX1RUOgogCQltYW4t
PmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKLQkJbWFuLT5ncHVfb2Zmc2V0ID0gcmRldi0+
bWMuZ3R0X3N0YXJ0OwogCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FD
SElORzsKIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCW1h
bi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFIHwgVFRNX01FTVRZUEVfRkxBR19D
TUE7CkBAIC0xMDQsNyArMTAzLDYgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKIAljYXNlIFRUTV9QTF9W
UkFNOgogCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCiAJCW1hbi0+ZnVuYyA9ICZ0dG1fYm9f
bWFuYWdlcl9mdW5jOwotCQltYW4tPmdwdV9vZmZzZXQgPSByZGV2LT5tYy52cmFtX3N0YXJ0Owog
CQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8CiAJCQkgICAgIFRUTV9NRU1U
WVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxB
R19VTkNBQ0hFRCB8IFRUTV9QTF9GTEFHX1dDOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
