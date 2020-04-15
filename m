Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED51A949F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F106E8A0;
	Wed, 15 Apr 2020 07:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA20E6E896
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a25so17884181wrd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJNLXELlGSwI8GqzdIq/q8fVeAI+ALD0AehIQsFWNJo=;
 b=VruuaKyP0hrhOgpg/QMkfSfoJ1ksy5grFRZIfAG4H0V0BZMtv+5PyqSwbC7Wznuetd
 wylmKgwdeihILQsn2oEHAdb7Hx4d5NbDj+vpmK4Dq0eL9aRe1VNZ17cuGsq8qx34mzdp
 SHb6Mwq5Mtyplap2r+1Y0/2QeFAB1wG8XJ4Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJNLXELlGSwI8GqzdIq/q8fVeAI+ALD0AehIQsFWNJo=;
 b=UskA0K+RXn/mn65AAaxKwMYP52SWjhmYR4/5EGnHfbWgItWsVGN0Zl1yncTLNYPPuV
 wwI8B980LwbEECYmjJN4dKXhYpM15lyRdrX8UMhEGayxKDRIzQmpEO6Ucy9vBhvUQKDB
 4oEswp4uXQsFd8cvTf00e53juW87Kjq/v1kLPcUA6U8REhX8ykrHrcnSCXPzoO58DK5f
 vOpqJZz+sosBnfoxFpYd6Bcs+UWHbpAvWybXUACp9skICOhZfCCwfnMhE0YpSuwafteY
 ytdP6hzWZbH+CPiOyEFxras3U/Kdko+Ian/BAjnqITM5i22XsbHNc6KfcJvbgt5PQPn0
 JuOg==
X-Gm-Message-State: AGi0PubE4nMDJy+I1xyLPVgs+D3Y1Ms/kj81X2/oxlYEn2Zr7QQwh9S1
 P9HkhgNXcD5d+VmDRfan0UDcow==
X-Google-Smtp-Source: APiQypLew8WjJQIKHusqN1Dahpvoi75BI5oxRb5uxMe3JgTpqa04MCbiDqj+YUGtdD2A+11YKSoObw==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr26060493wrj.337.1586936458589; 
 Wed, 15 Apr 2020 00:40:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 17/59] drm/ili9486: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:52 +0200
Message-Id: <20200415074034.175360-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxyZWFkeSB1c2luZyBkZXZtX2RybV9kZXZfaW5pdCwgc28gdmVyeSBzaW1wbGUgcmVwbGFjbWVu
dC4KCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQWNrZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBLYW1sZXNoIEd1cnVkYXNhbmkg
PGthbWxlc2guZ3VydWRhc2FuaUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Rpbnkv
aWxpOTQ4Ni5jIHwgMTMgKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9p
bGk5NDg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5NDg2LmMKaW5kZXggYzQwNzliZjll
MmM4Li4yNzAyZWE1NTdkMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2lsaTk0
ODYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5NDg2LmMKQEAgLTE5NywxOCArMTk3
LDEzIEBAIHN0YXRpYyBpbnQgaWxpOTQ4Nl9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQog
CXUzMiByb3RhdGlvbiA9IDA7CiAJaW50IHJldDsKIAotCWRiaWRldiA9IGt6YWxsb2Moc2l6ZW9m
KCpkYmlkZXYpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWRiaWRldikKLQkJcmV0dXJuIC1FTk9NRU07
CisJZGJpZGV2ID0gZGV2bV9kcm1fZGV2X2FsbG9jKGRldiwgJmlsaTk0ODZfZHJpdmVyLAorCQkJ
CSAgICBzdHJ1Y3QgbWlwaV9kYmlfZGV2LCBkcm0pOworCWlmIChJU19FUlIoZGJpZGV2KSkKKwkJ
cmV0dXJuIFBUUl9FUlIoZGJpZGV2KTsKIAogCWRiaSA9ICZkYmlkZXYtPmRiaTsKIAlkcm0gPSAm
ZGJpZGV2LT5kcm07Ci0JcmV0ID0gZGV2bV9kcm1fZGV2X2luaXQoZGV2LCBkcm0sICZpbGk5NDg2
X2RyaXZlcik7Ci0JaWYgKHJldCkgewotCQlrZnJlZShkYmlkZXYpOwotCQlyZXR1cm4gcmV0Owot
CX0KLQlkcm1tX2FkZF9maW5hbF9rZnJlZShkcm0sIGRiaWRldik7CiAKIAlkYmktPnJlc2V0ID0g
ZGV2bV9ncGlvZF9nZXQoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7CiAJaWYgKElTX0VS
UihkYmktPnJlc2V0KSkgewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
