Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589DD3608A8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 13:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3B6EA47;
	Thu, 15 Apr 2021 11:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DC76EA46
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 11:56:26 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x12so15663519ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MAgKFkUbajfTwkiBbjHCwLbY8LqpQ8PBmh7VA/cwU0E=;
 b=m1wDMNbKQex77GuTlU5+skb5l8cZdzF7kNI3HPNE8cQmGFBDeoAAfO3z62VHp2W3S6
 g8hW0/7uNFuyEGt2cBpWlxY7pcdErauqg3dyEdRwrM0YzVCRm1joAJpAAV5NNdVsHQoF
 hahSKm6dCyKXf1Qc/eKCUHyZ69K7r1luODPcgcG5j0yP0ohshKObaq7m0ImYa5GWbCry
 9Al1nVGzFju2O2/uydbJISxb5xBQhjAZqCnMhAz9VcnbR6pq5rT9YQjA3ZD+kQvHIDEE
 6sfiAKFL4nt2J7KcscGOnWoI8wLfSRKUNDg4gXyWvv6+zlHwL+czM74h6/wzk/VJYSXm
 F+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MAgKFkUbajfTwkiBbjHCwLbY8LqpQ8PBmh7VA/cwU0E=;
 b=DGg4H03XXH5psyoGlJisVrqjZ8GrdnsmKVVEf091SSc1JpbXXCnAA61QLhK5L1wN96
 VIABd/Kk63teahyf2F9oWKl185cbKJoO/GUiBAFDhRh15PzHcMCELiAJ0DSKeu13ijyw
 Wmo4A2unXdoxrYVw+GzaGJnqNbuRe4jPnk8E9ergx2Hy32dCqHFL9rg2fy+roUSVr3jA
 +t6fLamvxzvTzrd2NmgXq80OkS3aeSjTPf6MpkMGJ+Ty+H4HFIiQA6CIsSZVaKEEwyhU
 8v6RvqHLT3MzIrNjICEcU6h/ZfiDi773fpZsWxAlc/cE2yv5ny46hrgxIgBTm4ITV1kn
 zbCg==
X-Gm-Message-State: AOAM533jPVRAJ+/ug2EQF9Y3SemxLWRsFczawN/NM3Pt5JUtPnx8994i
 kVepOLRzxjGcvCVHlUGNrRc=
X-Google-Smtp-Source: ABdhPJwgvhGuyBEvsRLBj8pJVlv1MD8sM4alBQQIq3AaHw/fvXpcPyQjXZnukRoS19wBBYBX8H5fjg==
X-Received: by 2002:a17:906:524f:: with SMTP id
 y15mr2973184ejm.65.1618487785620; 
 Thu, 15 Apr 2021 04:56:25 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3ba1:ccd9:cd93:a8ed])
 by smtp.gmail.com with ESMTPSA id s9sm2182461edd.16.2021.04.15.04.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 04:56:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] mm/vmscan: add sync_shrinkers function
Date: Thu, 15 Apr 2021 13:56:23 +0200
Message-Id: <20210415115624.2904-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: akpm@linux-foundation.org, ray.huang@amd.com, vbabka@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYmUgYWJsZSB0byBzd2l0Y2ggdG8gYSBzcGlubG9jayBhbmQgcmVkdWNlIGxvY2sgY29udGVu
dGlvbiBpbiB0aGUgVFRNCnNocmlua2VyIHdlIGRvbid0IHdhbnQgdG8gaG9sZCBhIG11dGV4IHdo
aWxlIHVubWFwcGluZyBhbmQgZnJlZWluZyBwYWdlcwpmcm9tIHRoZSBwb29sLgoKQnV0IHRoZW4g
d2Ugc29tZWhvdyBuZWVkIHRvIHByZXZlbnQgYSByYWNlIGJldHdlZW4gKGZvciBleGFtcGxlKSB0
aGUgc2hyaW5rZXIKdHJ5aW5nIHRvIGZyZWUgcGFnZXMgYW5kIGhvdHBsdWcgdHJ5aW5nIHRvIHJl
bW92ZSB0aGUgZGV2aWNlIHdoaWNoIHRob3NlIHBhZ2VzCmJlbG9uZyB0by4KClRha2luZyBhbmQg
cmVsZWFzaW5nIHRoZSBzaHJpbmtlciBzZW1hcGhvcmUgb24gdGhlIHdyaXRlIHNpZGUgYWZ0ZXIK
dW5tYXBwaW5nIGFuZCBmcmVlaW5nIGFsbCBwYWdlcyBzaG91bGQgbWFrZSBzdXJlIHRoYXQgbm8g
c2hyaW5rZXIgaXMgcnVubmluZyBpbgpwYXJhbGVsbCBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBpbmNsdWRl
L2xpbnV4L3Nocmlua2VyLmggfCAgMSArCiBtbS92bXNjYW4uYyAgICAgICAgICAgICAgfCAxMCAr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmggYi9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmgKaW5k
ZXggMGY4MDEyMzY1MGUyLi42Yjc1ZGMzNzJmY2UgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
c2hyaW5rZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmgKQEAgLTkyLDQgKzkyLDUg
QEAgZXh0ZXJuIHZvaWQgcmVnaXN0ZXJfc2hyaW5rZXJfcHJlcGFyZWQoc3RydWN0IHNocmlua2Vy
ICpzaHJpbmtlcik7CiBleHRlcm4gaW50IHJlZ2lzdGVyX3Nocmlua2VyKHN0cnVjdCBzaHJpbmtl
ciAqc2hyaW5rZXIpOwogZXh0ZXJuIHZvaWQgdW5yZWdpc3Rlcl9zaHJpbmtlcihzdHJ1Y3Qgc2hy
aW5rZXIgKnNocmlua2VyKTsKIGV4dGVybiB2b2lkIGZyZWVfcHJlYWxsb2NlZF9zaHJpbmtlcihz
dHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKK2V4dGVybiB2b2lkIHN5bmNfc2hyaW5rZXJzKHZv
aWQpOwogI2VuZGlmCmRpZmYgLS1naXQgYS9tbS92bXNjYW4uYyBiL21tL3Ztc2Nhbi5jCmluZGV4
IDU2MmU4N2NiZDdhMS4uNDZjZDljMjE1ZDczIDEwMDY0NAotLS0gYS9tbS92bXNjYW4uYworKysg
Yi9tbS92bXNjYW4uYwpAQCAtNDA4LDYgKzQwOCwxNiBAQCB2b2lkIHVucmVnaXN0ZXJfc2hyaW5r
ZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKIH0KIEVYUE9SVF9TWU1CT0wodW5yZWdpc3Rl
cl9zaHJpbmtlcik7CiAKKy8qKgorICogc3luY19zaHJpbmtlciAtIFdhaXQgZm9yIGFsbCBydW5u
aW5nIHNocmlua2VycyB0byBjb21wbGV0ZS4KKyAqLwordm9pZCBzeW5jX3Nocmlua2Vycyh2b2lk
KQoreworCWRvd25fd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKKwl1cF93cml0ZSgmc2hyaW5rZXJf
cndzZW0pOworfQorRVhQT1JUX1NZTUJPTChzeW5jX3Nocmlua2Vycyk7CisKICNkZWZpbmUgU0hS
SU5LX0JBVENIIDEyOAogCiBzdGF0aWMgdW5zaWduZWQgbG9uZyBkb19zaHJpbmtfc2xhYihzdHJ1
Y3Qgc2hyaW5rX2NvbnRyb2wgKnNocmlua2N0bCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
