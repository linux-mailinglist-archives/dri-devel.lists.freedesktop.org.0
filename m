Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A763604CE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 10:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2DB6EA02;
	Thu, 15 Apr 2021 08:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A236E9F9;
 Thu, 15 Apr 2021 08:47:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id v6so34361810ejo.6;
 Thu, 15 Apr 2021 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sCUmO/CYyWAKIzM+gvF7+fZr4loCFJ7TN7MEdgNdy8g=;
 b=i5bIiGq5NvMI8HB9dad6HfxDqdJ2Pn8A033SXd6tf9K13b0KYBtfam/vWNgKav7jL9
 Okf6rFnhdXIan5t9UnIGJVigY7Z6rU2mF1uAy7zzLQhZ973l2H2Q+WzZ7+3S0dhRG/mi
 UdwISwL1ICc1I+hSuWKJy5BVzKceR1auG4j07nZ1qCvd25FmrXvz+ZViFegv5KVquPgi
 vfRrDTUHsM0UC4JwDxbSHp2lZPZ5VbR2Bchp1KUhCbAoaEvLrVvGCi4PSZHBaXZCXEJd
 uwooZiC5zyEyCyWBXakKR1pfmUvw5cF9d7btV7bVY6wkDZSYcUTV4tiuw+fCyZmau4xV
 popg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sCUmO/CYyWAKIzM+gvF7+fZr4loCFJ7TN7MEdgNdy8g=;
 b=T8IcUkjzhuLvZ/rYwVfuVPHJclMfst7id9KVVNt87sgHsu3HGhWkDs301n23+eRGGG
 XmDsY+bayoh32iNdJuyHXI2p6Uq3FDVs7uZlJ53q/VgDOYBDTlBhFoMh/6T2dF+Vg7dE
 bmadZnLmMgplG47ZfeNDJ4MqmNwA3JGbjCdTywtq7zF+JdPylBBd7G5m8gb8L1DZOnPR
 ZVNJ5189XbKM57sYYa793xla46SynvPgAghbyu5sOcp+4QcFbh5P4PzuAmHyk4HYR7Ea
 29If7AlLJoyKWuRX5qTnT8Iy7WiKnrpAoqhzMt5BCuFKHq7cHG4y2eqfCvQ1LYUnOeyV
 8sUQ==
X-Gm-Message-State: AOAM532XcO4gy0C6Dh6F2/KY2/MV33aCmHhQJ75Xm3U2K0ca7bWS6DBZ
 ewIw/7wUFXsodTyiiduH1Tsv0oqNlKM=
X-Google-Smtp-Source: ABdhPJwbY+mlXbgNBZiUm39iCxFF1KCKuN71GiJ6+Xia8fqM/K8gWDQ637Af6VjHwv09V63mIUm27Q==
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr2215636ejb.381.1618476452586; 
 Thu, 15 Apr 2021 01:47:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3ba1:ccd9:cd93:a8ed])
 by smtp.gmail.com with ESMTPSA id a9sm1830049eds.33.2021.04.15.01.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 01:47:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: freeing pinned objects is illegal now
Date: Thu, 15 Apr 2021 10:47:29 +0200
Message-Id: <20210415084730.2057-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415084730.2057-1-christian.koenig@amd.com>
References: <20210415084730.2057-1-christian.koenig@amd.com>
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

V2Ugd2FudCB0byBkcm9wIHN1cHBvcnQgaW4gVFRNIGZvciB0aGlzLgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDM2ICsrKysrKy0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKaW5kZXggOTg0ZGNm
NWE0NzVlLi5hZWU4YjdiOGMxNTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmMKQEAgLTUyLDM1ICs1MiwxMSBAQAogICoKICAqLwogCi0vKioKLSAqIGFtZGdw
dV9ib19zdWJ0cmFjdF9waW5fc2l6ZSAtIFJlbW92ZSBCTyBmcm9tIHBpbl9zaXplIGFjY291bnRp
bmcKLSAqCi0gKiBAYm86ICZhbWRncHVfYm8gYnVmZmVyIG9iamVjdAotICoKLSAqIFRoaXMgZnVu
Y3Rpb24gaXMgY2FsbGVkIHdoZW4gYSBCTyBzdG9wcyBiZWluZyBwaW5uZWQsIGFuZCB1cGRhdGVz
IHRoZQotICogJmFtZGdwdV9kZXZpY2UgcGluX3NpemUgdmFsdWVzIGFjY29yZGluZ2x5LgotICov
Ci1zdGF0aWMgdm9pZCBhbWRncHVfYm9fc3VidHJhY3RfcGluX3NpemUoc3RydWN0IGFtZGdwdV9i
byAqYm8pCi17Ci0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYo
Ym8tPnRiby5iZGV2KTsKLQotCWlmIChiby0+dGJvLm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfVlJB
TSkgewotCQlhdG9taWM2NF9zdWIoYW1kZ3B1X2JvX3NpemUoYm8pLCAmYWRldi0+dnJhbV9waW5f
c2l6ZSk7Ci0JCWF0b21pYzY0X3N1YihhbWRncHVfdnJhbV9tZ3JfYm9fdmlzaWJsZV9zaXplKGJv
KSwKLQkJCSAgICAgJmFkZXYtPnZpc2libGVfcGluX3NpemUpOwotCX0gZWxzZSBpZiAoYm8tPnRi
by5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1RUKSB7Ci0JCWF0b21pYzY0X3N1YihhbWRncHVfYm9f
c2l6ZShibyksICZhZGV2LT5nYXJ0X3Bpbl9zaXplKTsKLQl9Ci19Ci0KIHN0YXRpYyB2b2lkIGFt
ZGdwdV9ib19kZXN0cm95KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKQogewogCXN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KHRiby0+YmRldik7CiAJc3Ry
dWN0IGFtZGdwdV9ibyAqYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKHRibyk7CiAKLQlpZiAoYm8tPnRi
by5waW5fY291bnQgPiAwKQotCQlhbWRncHVfYm9fc3VidHJhY3RfcGluX3NpemUoYm8pOwotCiAJ
YW1kZ3B1X2JvX2t1bm1hcChibyk7CiAKIAlpZiAoYm8tPnRiby5iYXNlLmltcG9ydF9hdHRhY2gp
CkBAIC0xMDAwLDE0ICs5NzYsMjIgQEAgaW50IGFtZGdwdV9ib19waW4oc3RydWN0IGFtZGdwdV9i
byAqYm8sIHUzMiBkb21haW4pCiAgKi8KIHZvaWQgYW1kZ3B1X2JvX3VucGluKHN0cnVjdCBhbWRn
cHVfYm8gKmJvKQogeworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9h
ZGV2KGJvLT50Ym8uYmRldik7CisKIAl0dG1fYm9fdW5waW4oJmJvLT50Ym8pOwogCWlmIChiby0+
dGJvLnBpbl9jb3VudCkKIAkJcmV0dXJuOwogCi0JYW1kZ3B1X2JvX3N1YnRyYWN0X3Bpbl9zaXpl
KGJvKTsKLQogCWlmIChiby0+dGJvLmJhc2UuaW1wb3J0X2F0dGFjaCkKIAkJZG1hX2J1Zl91bnBp
bihiby0+dGJvLmJhc2UuaW1wb3J0X2F0dGFjaCk7CisKKwlpZiAoYm8tPnRiby5tZW0ubWVtX3R5
cGUgPT0gVFRNX1BMX1ZSQU0pIHsKKwkJYXRvbWljNjRfc3ViKGFtZGdwdV9ib19zaXplKGJvKSwg
JmFkZXYtPnZyYW1fcGluX3NpemUpOworCQlhdG9taWM2NF9zdWIoYW1kZ3B1X3ZyYW1fbWdyX2Jv
X3Zpc2libGVfc2l6ZShibyksCisJCQkgICAgICZhZGV2LT52aXNpYmxlX3Bpbl9zaXplKTsKKwl9
IGVsc2UgaWYgKGJvLT50Ym8ubWVtLm1lbV90eXBlID09IFRUTV9QTF9UVCkgeworCQlhdG9taWM2
NF9zdWIoYW1kZ3B1X2JvX3NpemUoYm8pLCAmYWRldi0+Z2FydF9waW5fc2l6ZSk7CisJfQogfQog
CiAvKioKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
