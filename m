Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12152C40B7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8533C6E8BD;
	Wed, 25 Nov 2020 12:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3206E6E8BD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:59:26 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a15so2464034edy.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MH9tcnEcPavCMzNMEU4E8hZDjQGD6ImVdrKjbrSN1cs=;
 b=aD54tdbKsBs+LA0F6NNa0Q/8w5tBpRLRsJQj6usJWg4jv9yWiIEg8qkw988KmQZeRT
 oxFrM4k4/MXncw+Sb2qWl7CPow/Af9dsOwSMWWfLCLkYWx6U/S/rCK8cFJremrf3bGpu
 JEUzSN1YEAkHemARU81G5uIzm25AjXJK5jKu2fKXxJ2jajzJuqqhtuQtSNq1B1zleH5Y
 cmx5SS0JtPXyy+Zu6NDtcgXvXQj0d5fjDua50m6S5GGkAa50B2HaEsN3ggsibsFQJCdG
 YhNIV8RLrNSSM4hTphDE8WXZsdctpbpvGas4splF7GduqxHxGCbZ3nOFrU1igCwHDlm1
 L0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MH9tcnEcPavCMzNMEU4E8hZDjQGD6ImVdrKjbrSN1cs=;
 b=LaXqhqzoWyX5CQ265FdfUHg3Eu/fVVJmCRqXWzRiF1QW8auqoy9rRiDCw50/E6nOVu
 gH1oqruvahySOPITvsAi7y5jyeHqSggbEXO9NHctEKs0eo7l9Vkl9vJtCgDXa6W4iW6G
 i0j3taSqZpP6NSWNsA5flOxChHIFgLGQuJgUV0eLQw3fHJSSvl4EhUGbVInMnYwuBLtG
 2NAtV9zMJtl3ZAQcQx8g9TYUzKG0RVZQfia3FOsiU2XmW3DeCxHaYYYhDP/Pr/Gc3bxK
 wRrEpYx82aPD2jTiBS5m0R7t6luEuAVCn3UMG5HhRbrXg8qA3ILnpCntGCx0h4PbNvev
 GEbg==
X-Gm-Message-State: AOAM531/04NYFGSdqF8OJxnumupP13UxZVfrkftK1w5W0l1WnliMC6QL
 N+7pjglDzPQHlG7knu+v9IPIEcBFt8g=
X-Google-Smtp-Source: ABdhPJxj32yfCm6/As4KYB4M0f1xsPXTnpLZJMHXYukPA76T1fkuvorz6F00S6ZePrljHjFELACwkQ==
X-Received: by 2002:aa7:cac2:: with SMTP id l2mr3324037edt.141.1606309164647; 
 Wed, 25 Nov 2020 04:59:24 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:87d9:eeff:99f6:84c2])
 by smtp.gmail.com with ESMTPSA id z19sm1203188ejj.101.2020.11.25.04.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:59:23 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/qxl: switch to ttm_sg_tt_init
Date: Wed, 25 Nov 2020 13:59:17 +0100
Message-Id: <20201125125919.1372-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125125919.1372-1-christian.koenig@amd.com>
References: <20201125125919.1372-1-christian.koenig@amd.com>
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

VGhlIGZ1bmN0aW9uIHF4bF9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlIGlzIG5vdCBmdWxseSBp
bXBsZW1lbnRlZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfdHRtLmMKaW5kZXggMTI4YzM4YzhhODM3Li5kNDJlNzUwY2JkZDMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X3R0bS5jCkBAIC0xMTUsNyArMTE1LDcgQEAgc3RhdGljIHN0cnVjdCB0dG1fdHQgKnF4bF90dG1f
dHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJdHRtID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IHR0bV90dCksIEdGUF9LRVJORUwpOwogCWlmICh0dG0gPT0gTlVMTCkKIAkJ
cmV0dXJuIE5VTEw7Ci0JaWYgKHR0bV9kbWFfdHRfaW5pdCh0dG0sIGJvLCBwYWdlX2ZsYWdzLCB0
dG1fY2FjaGVkKSkgeworCWlmICh0dG1fc2dfdHRfaW5pdCh0dG0sIGJvLCBwYWdlX2ZsYWdzLCB0
dG1fY2FjaGVkKSkgewogCQlrZnJlZSh0dG0pOwogCQlyZXR1cm4gTlVMTDsKIAl9Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
