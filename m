Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F34AE6D8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81B289143;
	Tue, 10 Sep 2019 09:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469DC88A72;
 Tue, 10 Sep 2019 09:24:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k6so6492369wrn.11;
 Tue, 10 Sep 2019 02:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCGcai+9FFYIlQzu2KCfJeP0G8UocShpapX6vYVPseE=;
 b=cJTpLFY3cT7fUc28KX1KDqBRi/qfJok4qABRUKg6ymYeeeVdcst2bDvbpJZO2VkqD7
 jfE8LXX55bQ1lTW0LF2WutwH6Bud4ZdusUczee1AH4Oy/YlWUzXBj8jMna4ep2x2aAgh
 36lU+UuGZ/w7LSeKu6xMb2tktR9mQXUWK2lHIwCfZx67geiqGOfZlqEILqgTDBDTkJms
 KPA2QVhZJU/o8fnkcCdHtq3ASPzJysb10IiloVwbfIG0naof+placqo+nWwpP+J/RBI/
 UooQlLbqI83ynbtVfgAuV/odZ0eJXwrOfaaf1uzBIUI81esea6FXT+SvT8pEL7kUcOSt
 ZToA==
X-Gm-Message-State: APjAAAVJmxmrsZPw7X3RWt18Wgs763VyiWbXdz2Y7t8uCWfrFGW6sReB
 k4ZbX//qQ2EST4E8U0F1kjFDHXNx
X-Google-Smtp-Source: APXvYqzrsopibat2YzH73UyZQiIY5solmdsl6wXkFvr9vm0LpCrOLKQQ2HlcVq5s+tAlnaT/jqYjag==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr16463022wrn.352.1568107476770; 
 Tue, 10 Sep 2019 02:24:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1cd:7d57:6942:ab1b])
 by smtp.gmail.com with ESMTPSA id e12sm6107036wrw.37.2019.09.10.02.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:24:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/9] drm/amdgpu: allow direct submission of clears
Date: Tue, 10 Sep 2019 11:24:28 +0200
Message-Id: <20190910092431.37471-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910092431.37471-1-christian.koenig@amd.com>
References: <20190910092431.37471-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCGcai+9FFYIlQzu2KCfJeP0G8UocShpapX6vYVPseE=;
 b=Tl0aPvQbb8GV/nYlYdMmTlq8nGZ04u2x2ItX9hzLwLAbGScHJt0UoZDMyguLtm2IhL
 0U68jojlm9AKWRL5nXJzsJEuwIGfWKtipTEslyxz1GAt6fj02gX8DrL6ml+slpO12Smi
 gXG+gkwPNcuD72hnb70mM2oWu1JgX3EjzxmxQe8iCWJpNDMKPmlq7qeCFkBZXqFTzzeN
 eTEHCV3YTNW+oWGAtLC3hkdW/V71nuFTM3AOwwxNC78RDCFXVGC8lsAbL7vAfDs1IvGV
 b0mBVLpFWnO8FhjOO1AqFctysb85r/hHRjBLT7AsuHDtpezKZa6fdi0b865tSfx5iC5A
 VWcw==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGhhbmRsaW5nIFBEL1BUIGNsZWFycyBkaXJlY3RseSBpbiB0aGUgZmF1bHQgaGFuZGxlci4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMTcgKysrKysrKysr
KystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXggYWVkNjhmYTg4ZjE2
Li42Yzk0YzVhNTYyY2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBA
IC02OTUsNiArNjk1LDcgQEAgYm9vbCBhbWRncHVfdm1fcmVhZHkoc3RydWN0IGFtZGdwdV92bSAq
dm0pCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCiAgKiBAdm06IFZNIHRvIGNsZWFy
IEJPIGZyb20KICAqIEBibzogQk8gdG8gY2xlYXIKKyAqIEBkaXJlY3Q6IHVzZSBhIGRpcmVjdCB1
cGRhdGUKICAqCiAgKiBSb290IFBEIG5lZWRzIHRvIGJlIHJlc2VydmVkIHdoZW4gY2FsbGluZyB0
aGlzLgogICoKQEAgLTcwMyw3ICs3MDQsOCBAQCBib29sIGFtZGdwdV92bV9yZWFkeShzdHJ1Y3Qg
YW1kZ3B1X3ZtICp2bSkKICAqLwogc3RhdGljIGludCBhbWRncHVfdm1fY2xlYXJfYm8oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKLQkJ
CSAgICAgIHN0cnVjdCBhbWRncHVfYm8gKmJvKQorCQkJICAgICAgc3RydWN0IGFtZGdwdV9ibyAq
Ym8sCisJCQkgICAgICBib29sIGRpcmVjdCkKIHsKIAlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHgg
Y3R4ID0geyB0cnVlLCBmYWxzZSB9OwogCXVuc2lnbmVkIGxldmVsID0gYWRldi0+dm1fbWFuYWdl
ci5yb290X2xldmVsOwpAQCAtNzYyLDYgKzc2NCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2Ns
ZWFyX2JvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCW1lbXNldCgmcGFyYW1zLCAwLCBz
aXplb2YocGFyYW1zKSk7CiAJcGFyYW1zLmFkZXYgPSBhZGV2OwogCXBhcmFtcy52bSA9IHZtOwor
CXBhcmFtcy5kaXJlY3QgPSBkaXJlY3Q7CiAKIAlyID0gdm0tPnVwZGF0ZV9mdW5jcy0+cHJlcGFy
ZSgmcGFyYW1zLCBBTURHUFVfRkVOQ0VfT1dORVJfS0ZELCBOVUxMKTsKIAlpZiAocikKQEAgLTg1
Miw3ICs4NTUsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdm1fYm9fcGFyYW0oc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogICovCiBzdGF0aWMgaW50IGFt
ZGdwdV92bV9hbGxvY19wdHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkgICAgICAg
c3RydWN0IGFtZGdwdV92bSAqdm0sCi0JCQkgICAgICAgc3RydWN0IGFtZGdwdV92bV9wdF9jdXJz
b3IgKmN1cnNvcikKKwkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X3ZtX3B0X2N1cnNvciAqY3Vyc29y
LAorCQkJICAgICAgIGJvb2wgZGlyZWN0KQogewogCXN0cnVjdCBhbWRncHVfdm1fcHQgKmVudHJ5
ID0gY3Vyc29yLT5lbnRyeTsKIAlzdHJ1Y3QgYW1kZ3B1X2JvX3BhcmFtIGJwOwpAQCAtODg1LDcg
Kzg4OSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2FsbG9jX3B0cyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAlwdC0+cGFyZW50ID0gYW1kZ3B1X2JvX3JlZihjdXJzb3ItPnBhcmVudC0+
YmFzZS5ibyk7CiAJYW1kZ3B1X3ZtX2JvX2Jhc2VfaW5pdCgmZW50cnktPmJhc2UsIHZtLCBwdCk7
CiAKLQlyID0gYW1kZ3B1X3ZtX2NsZWFyX2JvKGFkZXYsIHZtLCBwdCk7CisJciA9IGFtZGdwdV92
bV9jbGVhcl9ibyhhZGV2LCB2bSwgcHQsIGRpcmVjdCk7CiAJaWYgKHIpCiAJCWdvdG8gZXJyb3Jf
ZnJlZV9wdDsKIApAQCAtMTQwMSw3ICsxNDA1LDggQEAgc3RhdGljIGludCBhbWRncHVfdm1fdXBk
YXRlX3B0ZXMoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwYXJhbXMsCiAJCXVpbnQ2
NF90IGluY3IsIGVudHJ5X2VuZCwgcGVfc3RhcnQ7CiAJCXN0cnVjdCBhbWRncHVfYm8gKnB0Owog
Ci0JCXIgPSBhbWRncHVfdm1fYWxsb2NfcHRzKHBhcmFtcy0+YWRldiwgcGFyYW1zLT52bSwgJmN1
cnNvcik7CisJCXIgPSBhbWRncHVfdm1fYWxsb2NfcHRzKHBhcmFtcy0+YWRldiwgcGFyYW1zLT52
bSwgJmN1cnNvciwKKwkJCQkJcGFyYW1zLT5kaXJlY3QpOwogCQlpZiAocikKIAkJCXJldHVybiBy
OwogCkBAIC0yNzI1LDcgKzI3MzAsNyBAQCBpbnQgYW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogCiAJYW1kZ3B1X3ZtX2JvX2Jh
c2VfaW5pdCgmdm0tPnJvb3QuYmFzZSwgdm0sIHJvb3QpOwogCi0JciA9IGFtZGdwdV92bV9jbGVh
cl9ibyhhZGV2LCB2bSwgcm9vdCk7CisJciA9IGFtZGdwdV92bV9jbGVhcl9ibyhhZGV2LCB2bSwg
cm9vdCwgZmFsc2UpOwogCWlmIChyKQogCQlnb3RvIGVycm9yX3VucmVzZXJ2ZTsKIApAQCAtMjg0
OCw3ICsyODUzLDcgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLCB1bnMKIAkgKi8KIAlpZiAocHRlX3N1
cHBvcnRfYXRzICE9IHZtLT5wdGVfc3VwcG9ydF9hdHMpIHsKIAkJdm0tPnB0ZV9zdXBwb3J0X2F0
cyA9IHB0ZV9zdXBwb3J0X2F0czsKLQkJciA9IGFtZGdwdV92bV9jbGVhcl9ibyhhZGV2LCB2bSwg
dm0tPnJvb3QuYmFzZS5ibyk7CisJCXIgPSBhbWRncHVfdm1fY2xlYXJfYm8oYWRldiwgdm0sIHZt
LT5yb290LmJhc2UuYm8sIGZhbHNlKTsKIAkJaWYgKHIpCiAJCQlnb3RvIGZyZWVfaWRyOwogCX0K
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
