Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB52DE890
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 18:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CF3893A4;
	Fri, 18 Dec 2020 17:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81574893A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 17:55:43 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id 6so4451930ejz.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZBfGHacC/A6P0LNHxyLUyBLnB8EZ4EXziBwYQny3vrY=;
 b=rsrq12kpcvx+u/KRVvdX8GbCJRuzzscS0ZY/Y0SjSJ4thfI9b1BiIAAmmCmKCkHc6X
 1mx5V/qktrWKU3OwYdCZzxT4tLUTihQqMj/UTH1g/YDat20V5lQin4QF2u5IAZx2fP9A
 gDzN3jwOHPhd15nh58G9M4p107OhQa86k+Zaua0ySpZbUvZP4UJ5+oLEhqxUTUAgT6Mt
 0P+4vvYAfENoEQWNQK2sx0kO9jVYFCdEM15Fw+dzKTTwaDN5IXf60wBXxSew2lQYxc0N
 ARycKziAKeYzVfcjdE8xp+JFInvbHBuOsrkhkOyzUPXhiLOvCbuh661meNNe27CjVn50
 XmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZBfGHacC/A6P0LNHxyLUyBLnB8EZ4EXziBwYQny3vrY=;
 b=Qlue56cNXC/7xKdyA+WtfRuYbuxXTi+SPRVGhEMYmRTs7R6LGYusi1FT8OI/DHProu
 5bCR6s1kQ93suGzASbpJFof2ZB8CpPS6mqfWhVy6t/Hid8oTqe4pNTgmw4nBLc07feHf
 kHIMoSmNYcKuBaNViFLHMwu/5M17CrDMI8fUQncMYGu4NsfhsDP7/0EV7Nffc0MN4mML
 uTN5Zjo0evK7un0rBoHRcWJkHzv3uLXqb5OqW0UwxhTqWtA9kFwL/RzwK0lyO8SyWzaw
 3cpgTB3V3ergH7b1MS51d+B+fuwnrSgMWrVBstxptp2Rd4UtztdL1NBdwIe66gHSgbkq
 kNGg==
X-Gm-Message-State: AOAM530W2Q/8oW5GbM5ivteJomgTbXqbusUJ4HM4Buulul32y1vWykmK
 vqPPHEX+vadvbooyKAjw+0cm+sb5ZXs=
X-Google-Smtp-Source: ABdhPJxlWB+5o85TQuWW1aC1a0WB3LbkE95s0QbTNSj5eo0R9O+HTCCBp8S2NyUs0Vk/04bbibiwXQ==
X-Received: by 2002:a17:907:206a:: with SMTP id
 qp10mr5312506ejb.432.1608314141948; 
 Fri, 18 Dec 2020 09:55:41 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4769:42ab:9b50:97cf])
 by smtp.gmail.com with ESMTPSA id x6sm26751795edl.67.2020.12.18.09.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 09:55:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/ttm: add debugfs entry to test pool shrinker
Date: Fri, 18 Dec 2020 18:55:37 +0100
Message-Id: <20201218175538.1364-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218175538.1364-1-christian.koenig@amd.com>
References: <20201218175538.1364-1-christian.koenig@amd.com>
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
Cc: ray.huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlZnVsIGZvciB0ZXN0aW5nLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wu
YyB8IDUwICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzMiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMK
aW5kZXggMWQ2MWU4ZmMwZTgxLi4xY2RhY2Q1ODc1M2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3Bvb2wuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMK
QEAgLTUyOSw2ICs1MjksMjggQEAgdm9pZCB0dG1fcG9vbF9maW5pKHN0cnVjdCB0dG1fcG9vbCAq
cG9vbCkKIH0KIEVYUE9SVF9TWU1CT0wodHRtX3Bvb2xfZmluaSk7CiAKKy8qIEFzIGxvbmcgYXMg
cGFnZXMgYXJlIGF2YWlsYWJsZSBtYWtlIHN1cmUgdG8gcmVsZWFzZSBhdCBsZWFzdCBvbmUgKi8K
K3N0YXRpYyB1bnNpZ25lZCBsb25nIHR0bV9wb29sX3Nocmlua2VyX3NjYW4oc3RydWN0IHNocmlu
a2VyICpzaHJpbmssCisJCQkJCSAgICBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKQoreworCXVu
c2lnbmVkIGxvbmcgbnVtX2ZyZWVkID0gMDsKKworCWRvCisJCW51bV9mcmVlZCArPSB0dG1fcG9v
bF9zaHJpbmsoKTsKKwl3aGlsZSAoIW51bV9mcmVlZCAmJiBhdG9taWNfbG9uZ19yZWFkKCZhbGxv
Y2F0ZWRfcGFnZXMpKTsKKworCXJldHVybiBudW1fZnJlZWQ7Cit9CisKKy8qIFJldHVybiB0aGUg
bnVtYmVyIG9mIHBhZ2VzIGF2YWlsYWJsZSBvciBTSFJJTktfRU1QVFkgaWYgd2UgaGF2ZSBub25l
ICovCitzdGF0aWMgdW5zaWduZWQgbG9uZyB0dG1fcG9vbF9zaHJpbmtlcl9jb3VudChzdHJ1Y3Qg
c2hyaW5rZXIgKnNocmluaywKKwkJCQkJICAgICBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKQor
eworCXVuc2lnbmVkIGxvbmcgbnVtX3BhZ2VzID0gYXRvbWljX2xvbmdfcmVhZCgmYWxsb2NhdGVk
X3BhZ2VzKTsKKworCXJldHVybiBudW1fcGFnZXMgPyBudW1fcGFnZXMgOiBTSFJJTktfRU1QVFk7
Cit9CisKICNpZmRlZiBDT05GSUdfREVCVUdfRlMKIC8qIENvdW50IHRoZSBudW1iZXIgb2YgcGFn
ZXMgYXZhaWxhYmxlIGluIGEgcG9vbF90eXBlICovCiBzdGF0aWMgdW5zaWduZWQgaW50IHR0bV9w
b29sX3R5cGVfY291bnQoc3RydWN0IHR0bV9wb29sX3R5cGUgKnB0KQpAQCAtNjMzLDI5ICs2NTUs
MTkgQEAgaW50IHR0bV9wb29sX2RlYnVnZnMoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3Qg
c2VxX2ZpbGUgKm0pCiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9wb29sX2RlYnVnZnMpOwogCi0jZW5k
aWYKLQotLyogQXMgbG9uZyBhcyBwYWdlcyBhcmUgYXZhaWxhYmxlIG1ha2Ugc3VyZSB0byByZWxl
YXNlIGF0IGxlYXN0IG9uZSAqLwotc3RhdGljIHVuc2lnbmVkIGxvbmcgdHRtX3Bvb2xfc2hyaW5r
ZXJfc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmluaywKLQkJCQkJICAgIHN0cnVjdCBzaHJpbmtf
Y29udHJvbCAqc2MpCisvKiBUZXN0IHRoZSBzaHJpbmtlciBmdW5jdGlvbnMgYW5kIGR1bXAgdGhl
IHJlc3VsdCAqLworc3RhdGljIGludCB0dG1fcG9vbF9kZWJ1Z2ZzX3Nocmlua19zaG93KHN0cnVj
dCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkKIHsKLQl1bnNpZ25lZCBsb25nIG51bV9mcmVlZCA9
IDA7CisJc3RydWN0IHNocmlua19jb250cm9sIHNjID0geyAuZ2ZwX21hc2sgPSBHRlBfS0VSTkVM
IH07CiAKLQlkbwotCQludW1fZnJlZWQgKz0gdHRtX3Bvb2xfc2hyaW5rKCk7Ci0Jd2hpbGUgKCFu
dW1fZnJlZWQgJiYgYXRvbWljX2xvbmdfcmVhZCgmYWxsb2NhdGVkX3BhZ2VzKSk7CisJc2VxX3By
aW50ZihtLCAiJWx1LyVsdVxuIiwgdHRtX3Bvb2xfc2hyaW5rZXJfY291bnQoJm1tX3Nocmlua2Vy
LCAmc2MpLAorCQkgICB0dG1fcG9vbF9zaHJpbmtlcl9zY2FuKCZtbV9zaHJpbmtlciwgJnNjKSk7
CiAKLQlyZXR1cm4gbnVtX2ZyZWVkOworCXJldHVybiAwOwogfQorREVGSU5FX1NIT1dfQVRUUklC
VVRFKHR0bV9wb29sX2RlYnVnZnNfc2hyaW5rKTsKIAotLyogUmV0dXJuIHRoZSBudW1iZXIgb2Yg
cGFnZXMgYXZhaWxhYmxlIG9yIFNIUklOS19FTVBUWSBpZiB3ZSBoYXZlIG5vbmUgKi8KLXN0YXRp
YyB1bnNpZ25lZCBsb25nIHR0bV9wb29sX3Nocmlua2VyX2NvdW50KHN0cnVjdCBzaHJpbmtlciAq
c2hyaW5rLAotCQkJCQkgICAgIHN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MpCi17Ci0JdW5zaWdu
ZWQgbG9uZyBudW1fcGFnZXMgPSBhdG9taWNfbG9uZ19yZWFkKCZhbGxvY2F0ZWRfcGFnZXMpOwot
Ci0JcmV0dXJuIG51bV9wYWdlcyA/IG51bV9wYWdlcyA6IFNIUklOS19FTVBUWTsKLX0KKyNlbmRp
ZgogCiAvKioKICAqIHR0bV9wb29sX21ncl9pbml0IC0gSW5pdGlhbGl6ZSBnbG9iYWxzCkBAIC02
ODgsNiArNzAwLDggQEAgaW50IHR0bV9wb29sX21ncl9pbml0KHVuc2lnbmVkIGxvbmcgbnVtX3Bh
Z2VzKQogI2lmZGVmIENPTkZJR19ERUJVR19GUwogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInBhZ2Vf
cG9vbCIsIDA0NDQsIHR0bV9kZWJ1Z2ZzX3Jvb3QsIE5VTEwsCiAJCQkgICAgJnR0bV9wb29sX2Rl
YnVnZnNfZ2xvYmFsc19mb3BzKTsKKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJwYWdlX3Bvb2xfc2hy
aW5rIiwgMDQwMCwgdHRtX2RlYnVnZnNfcm9vdCwgTlVMTCwKKwkJCSAgICAmdHRtX3Bvb2xfZGVi
dWdmc19zaHJpbmtfZm9wcyk7CiAjZW5kaWYKIAogCW1tX3Nocmlua2VyLmNvdW50X29iamVjdHMg
PSB0dG1fcG9vbF9zaHJpbmtlcl9jb3VudDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
