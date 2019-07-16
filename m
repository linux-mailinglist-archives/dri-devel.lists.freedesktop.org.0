Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167466B14D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 23:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DE76E1A4;
	Tue, 16 Jul 2019 21:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5EB6E0F3;
 Tue, 16 Jul 2019 21:45:00 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f25so10070640pgv.10;
 Tue, 16 Jul 2019 14:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4drR0FDgR1qKvDPf6ArOgp5GWnRtGoeeH0ezG721TC0=;
 b=ai8rFYoNo6I+tsPofwT4ZAFDaoyUQSVCJbIEoZUsohVzGlkX9R5///NT2nIXZM4uAV
 PMyu2XvcuAQDwiEGAztoPVWLgU2XFbuCqo8PD4pdZfUtoaFTh/JTz3iFmUGwzld9QiCI
 y58BJCyT86A2A3+ijeZlH2V5/zbcbp/taPfbOocJjdi11B5lD9QDJdtewzECoj866sYr
 tR4rQMDUffcnokNVk2PRqhZMvLzAmulGAHmvksMe7JK1SpQuaYE/aCQeH5hoVXGLwRyM
 sk6yYLSQ5mJd01BMF76SZYXmb90vjLchmAgOW3Jo6gDvv13rhRKss5OjY6RHPr/PML4B
 kQdw==
X-Gm-Message-State: APjAAAXW0ZXc7QULIijgEiARGuc5+rW5gpqCrmAygdWAT9Epev1w73Fr
 T/+dgJTQGvOGFStuXqO5P6ZYa7ikjk4=
X-Google-Smtp-Source: APXvYqxiDio1TWrmNR0NEynX+8QmbTFyvAzkbSoW72UZvLkMfedCjFiKOzRrZlV77GO0V2OJitoyeQ==
X-Received: by 2002:a17:90a:5887:: with SMTP id
 j7mr39000839pji.136.1563313499680; 
 Tue, 16 Jul 2019 14:44:59 -0700 (PDT)
Received: from localhost ([100.118.89.203])
 by smtp.gmail.com with ESMTPSA id 135sm20978687pfb.137.2019.07.16.14.44.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 14:44:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/vgem: use normal cached mmap'ings
Date: Tue, 16 Jul 2019 14:37:42 -0700
Message-Id: <20190716213746.4670-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716213746.4670-1-robdclark@gmail.com>
References: <20190716213746.4670-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4drR0FDgR1qKvDPf6ArOgp5GWnRtGoeeH0ezG721TC0=;
 b=d0XRWLafSldOVujZRpCkAu9+YwaiUggcPzRRQGuqpuKlW6jllCs6aNRjoFTQhxg4W6
 z7ImjRNh5QmIhLrvG3LhZo0PIw8SLsbPLLxFxaZOy4h7hkmlvhGkc1vtL4Gsa4mkCHz1
 zJ+OWNjBPEuKNabEYJEFz46fx9LgdzRJWPcElIRSmJJG5lufLlzetP7GPCAmZHS6V2xl
 2mxK1+ye+N5ayG7/d9N0ag+WZAL7AAonPq26ki8Ch07dIWP/z73zocHpTVI4WSb32Wj/
 4Wly/viUTLx9SnnoMfTR1xsYZJ0YcZ3G/B7jx6HPwUu0T3GhkwGGo8T1bQV9zgTEmpzR
 PxIA==
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2luY2UgdGhlcmUgaXMg
bm8gcmVhbCBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIFZHRU0sIGl0IGlzIGltcG9zc2libGUgdG8K
ZW5kIHVwIHdpdGggYXBwcm9wcmlhdGUgZGV2LT5kbWFfb3BzLCBtZWFuaW5nIHRoYXQgd2UgaGF2
ZSBubyB3YXkgdG8KaW52YWxpZGF0ZSB0aGUgc2htZW0gcGFnZXMgYWxsb2NhdGVkIGJ5IFZHRU0u
ICBTbywgYXQgbGVhc3Qgb24gcGxhdGZvcm1zCndpdGhvdXQgZHJtX2NmbHVzaF9wYWdlcygpLCB3
ZSBlbmQgdXAgd2l0aCBjb3JydXB0aW9uIHdoZW4gY2FjaGUgbGluZXMKZnJvbSBwcmV2aW91cyB1
c2FnZSBvZiBWR0VNIGJvIHBhZ2VzIGdldCBldmljdGVkIHRvIG1lbW9yeS4KClRoZSBvbmx5IHNh
bmUgb3B0aW9uIGlzIHRvIHVzZSBjYWNoZWQgbWFwcGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQp2MzogcmViYXNlZCBvbiBkcm0tdGlw
CgogZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyB8IDI0ICsrKysrKysrKysrKysrLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCmluZGV4IGU3ZDEyZTkzYjFmMC4uODQyNjJlMmJkN2Y3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKQEAgLTI1OSw5ICsyNTksNiBAQCBzdGF0aWMgaW50
IHZnZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCS8qIEtlZXAgdGhlIFdDIG1tYXBpbmcgc2V0
IGJ5IGRybV9nZW1fbW1hcCgpIGJ1dCBvdXIgcGFnZXMKLQkgKiBhcmUgb3JkaW5hcnkgYW5kIG5v
dCBzcGVjaWFsLgotCSAqLwogCXZtYS0+dm1fZmxhZ3MgPSBmbGFncyB8IFZNX0RPTlRFWFBBTkQg
fCBWTV9ET05URFVNUDsKIAlyZXR1cm4gMDsKIH0KQEAgLTMxMCwxNyArMzA3LDE3IEBAIHN0YXRp
YyB2b2lkIHZnZW1fdW5waW5fcGFnZXMoc3RydWN0IGRybV92Z2VtX2dlbV9vYmplY3QgKmJvKQog
c3RhdGljIGludCB2Z2VtX3ByaW1lX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3Ry
dWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBkcm1fdmdlbV9nZW1fb2JqZWN0ICpibyA9IHRv
X3ZnZW1fYm8ob2JqKTsKLQlsb25nIG5fcGFnZXMgPSBvYmotPnNpemUgPj4gUEFHRV9TSElGVDsK
Kwlsb25nIGksIG5fcGFnZXMgPSBvYmotPnNpemUgPj4gUEFHRV9TSElGVDsKIAlzdHJ1Y3QgcGFn
ZSAqKnBhZ2VzOwogCiAJcGFnZXMgPSB2Z2VtX3Bpbl9wYWdlcyhibyk7CiAJaWYgKElTX0VSUihw
YWdlcykpCiAJCXJldHVybiBQVFJfRVJSKHBhZ2VzKTsKIAotCS8qIEZsdXNoIHRoZSBvYmplY3Qg
ZnJvbSB0aGUgQ1BVIGNhY2hlIHNvIHRoYXQgaW1wb3J0ZXJzIGNhbiByZWx5Ci0JICogb24gY29o
ZXJlbnQgaW5kaXJlY3QgYWNjZXNzIHZpYSB0aGUgZXhwb3J0ZWQgZG1hLWFkZHJlc3MuCi0JICov
Ci0JZHJtX2NsZmx1c2hfcGFnZXMocGFnZXMsIG5fcGFnZXMpOworCWZvciAoaSA9IDA7IGkgPCBu
X3BhZ2VzOyBpKyspIHsKKwkJZG1hX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UoZGV2LCBwYWdlX3Rv
X3BoeXMocGFnZXNbaV0pLAorCQkJCQkgICBQQUdFX1NJWkUsIERNQV9CSURJUkVDVElPTkFMKTsK
Kwl9CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTMyOCw2ICszMjUsMTMgQEAgc3RhdGljIGludCB2Z2Vt
X3ByaW1lX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2
KQogc3RhdGljIHZvaWQgdmdlbV9wcmltZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aiwgc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBkcm1fdmdlbV9nZW1fb2JqZWN0ICpi
byA9IHRvX3ZnZW1fYm8ob2JqKTsKKwlsb25nIGksIG5fcGFnZXMgPSBvYmotPnNpemUgPj4gUEFH
RV9TSElGVDsKKwlzdHJ1Y3QgcGFnZSAqKnBhZ2VzID0gYm8tPnBhZ2VzOworCisJZm9yIChpID0g
MDsgaSA8IG5fcGFnZXM7IGkrKykgeworCQlkbWFfc3luY19zaW5nbGVfZm9yX2NwdShkZXYsIHBh
Z2VfdG9fcGh5cyhwYWdlc1tpXSksCisJCQkJCVBBR0VfU0laRSwgRE1BX0JJRElSRUNUSU9OQUwp
OworCX0KIAogCXZnZW1fdW5waW5fcGFnZXMoYm8pOwogfQpAQCAtMzgyLDcgKzM4Niw3IEBAIHN0
YXRpYyB2b2lkICp2Z2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJ
aWYgKElTX0VSUihwYWdlcykpCiAJCXJldHVybiBOVUxMOwogCi0JcmV0dXJuIHZtYXAocGFnZXMs
IG5fcGFnZXMsIDAsIHBncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpKTsKKwlyZXR1cm4g
dm1hcChwYWdlcywgbl9wYWdlcywgMCwgUEFHRV9LRVJORUwpOwogfQogCiBzdGF0aWMgdm9pZCB2
Z2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIp
CkBAIC00MTEsNyArNDE1LDcgQEAgc3RhdGljIGludCB2Z2VtX3ByaW1lX21tYXAoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmosCiAJZnB1dCh2bWEtPnZtX2ZpbGUpOwogCXZtYS0+dm1fZmlsZSA9
IGdldF9maWxlKG9iai0+ZmlscCk7CiAJdm1hLT52bV9mbGFncyB8PSBWTV9ET05URVhQQU5EIHwg
Vk1fRE9OVERVTVA7Ci0Jdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5lKHZt
X2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncykpOworCXZtYS0+dm1fcGFnZV9wcm90ID0gdm1f
Z2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
