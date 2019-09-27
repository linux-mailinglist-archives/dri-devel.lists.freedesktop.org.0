Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234DC053C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E376E158;
	Fri, 27 Sep 2019 12:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4010E6E105;
 Fri, 27 Sep 2019 12:34:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i1so2547980wro.4;
 Fri, 27 Sep 2019 05:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OVLUdJ9CZYZAxAN5mvwMUyx5JxnTqjTXU/Hdcke8umc=;
 b=kARm2VG4N7LEbEqCNNsltnWGzpGfc8qjccqDVHTb7aQ177JROYvCKT8r9rCB3qg3oM
 Xq3zhPUeMBsFBE5+YJNCNTdWnSgIcu+Gc1b/GEVZ4Y04XcI33RzG3sv07Pt00KApcRmH
 6uRuiHJWt9Qdh0hghNOX7nk/Rz2UW9ER9kqqturjB4ZtYIq4BqWcRFiDJ7xj86KqRY3E
 CMireRTiQ3fW0KMUQhieOiId3qsBuYMr03Vyc2+sDQ8ZGnKIogvxG+zwUbs9iuZBzA3G
 Dra/DLfPoO5uK/anjvY6se4T8sezmSsA4dIwwfq07rR/UkJPn5rlujLb60ADwyNda6/z
 ObLA==
X-Gm-Message-State: APjAAAV2UUoyhE7TnlyTkSk7hhr4uU/Ha0SH9Cz/G2yjActaXQ8aDC2c
 LNKRz1iJwg25RjDOytKaA9l0LeRj
X-Google-Smtp-Source: APXvYqzFzZ7d705mU9vpNdODq0m3a5HdM1jywLU8HifP5Sq+DMSR/ImGwJLsFvc+RPG+rZmYWtuyEQ==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr2840086wrr.390.1569587666758; 
 Fri, 27 Sep 2019 05:34:26 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:2d04:d861:e9c6:56ab])
 by smtp.gmail.com with ESMTPSA id w7sm4639887wmd.22.2019.09.27.05.34.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 05:34:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: also export ttm_bo_vm_fault
Date: Fri, 27 Sep 2019 14:34:24 +0200
Message-Id: <20190927123425.17513-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OVLUdJ9CZYZAxAN5mvwMUyx5JxnTqjTXU/Hdcke8umc=;
 b=T8aINPzIBUfH2sYfiIY+GyeHGEsmxvfAluaUplTcLe7m/HjCcUQFl8SonU1mzQvTAE
 eeGP7PBTQpaB1Ch82e5GQFOGoAr5lX/4M7lU4aBc+1V1pQBR0WOg+hgXwCa5R+8t2Saq
 T1TQCtnYBe38c/4KEkRsK9i1d6Ct9BbzH5eaIakzplmx3fZ/zOlCOc/EP3+yguXFGGSC
 sXJkxhdnJCIeUgbq/N2XY6nRZY5mvI2rrCdoINpVQJkCsgcN/KsFOaeKiz4NdgCpdktH
 Z3qmSI+DXahjgTIE2REKFL7EqAg+Lgkq9I5Q5g/GPnPKxUedSBAVHKYQMglPbSZo5BtV
 0exQ==
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

VGhhdCBpcyBuZWVkZWQgYnkgYXQgbGVhc3QgYSBjbGVhbnVwIGluIHJhZGVvbi4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgMyArKy0KIGluY2x1ZGUvZHJtL3R0bS90
dG1fYm9fYXBpLmggICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCmluZGV4IGNiMzEyMGNkNWFhMS4u
NTI1MDQ2YmJjYjZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKQEAgLTMxNiw3ICszMTYsNyBA
QCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKIH0KIEVYUE9SVF9TWU1CT0wodHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKTsKIAotc3RhdGlj
IHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQordm1fZmF1
bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7CiAJc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZtYTsKIAlwZ3Byb3RfdCBwcm90OwpAQCAtMzM2LDYg
KzMzNiw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1
bHQgKnZtZikKIAogCXJldHVybiByZXQ7CiB9CitFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9mYXVs
dCk7CiAKIHZvaWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19hcGkuaAppbmRleCA4NTEyNjBjYmJiMmYuLmRhZDQxY2Y1Y2Q2NCAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAorKysgYi9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2FwaS5oCkBAIC03OTYsNiArNzk2LDggQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1
bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCiAJCQkJICAgIHBncHJvdF90IHByb3Qs
CiAJCQkJICAgIHBnb2ZmX3QgbnVtX3ByZWZhdWx0KTsKIAordm1fZmF1bHRfdCB0dG1fYm9fdm1f
ZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpOworCiB2b2lkIHR0bV9ib192bV9vcGVuKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKIAogdm9pZCB0dG1fYm9fdm1fY2xvc2Uoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpOwotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
