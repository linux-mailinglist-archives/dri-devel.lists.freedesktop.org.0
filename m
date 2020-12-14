Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1052DA01B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 20:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FC56E0F4;
	Mon, 14 Dec 2020 19:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DAB6E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 19:17:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m5so17535916wrx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 11:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ufmOwKPgQFQAB4ql7EQmK6jhaZylxb/hsIu+JjUm62I=;
 b=LjpuryWAed6pObwmf7bC7xMdnZSZEEOxYjaEvegHWOauiVjiQPN7l1c8To8AdluT/g
 ijkF+SybBpfWOECo358ss/aLN8ys6vRccn3L1oGBaPkR9/rRg+HNsqZEmLxEl7kbgk53
 uDfV7z6j96kNBZ4ti7QxFlGRDnF+AsJjTj63Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ufmOwKPgQFQAB4ql7EQmK6jhaZylxb/hsIu+JjUm62I=;
 b=dhq5B25OUYzmFO8JSB/aaRS3KYOmiyXc9nofv3iplExttaLxHYvamS4hAfangcNqwJ
 mSc6Sucho/aXviA/VYA32rgrg2xC3oy6Rq595x9xJ/S+mFnnwoI/cugiOCtmCiCWEgXz
 oABJqhXbNgO2UQAiSfJXWU8uKUNoWsCQYCl0TipUgkMRdKr4y5GYf5Wi36z8etUNjvVu
 L5NFrJeyOAAtpNOw11EkZPtwqLLkxXz+W+UBiJaMBfRuVkEqPL7dCvlGW8roa+6zWqRI
 cGW432vZ/hraKhsxEDypI1LQany3j4lqEaiXDDaSB5Jt1KpQxM3w1bwkK3t2iGI8hfkT
 oWBw==
X-Gm-Message-State: AOAM530xqRxomSU/qgn4oHyG6NffHL70PD98CjlnT4D5a2UyY5I0THsv
 kzuKXhOw03FKph25IvDjsTcvJtECHzvAXw==
X-Google-Smtp-Source: ABdhPJwwR4xV9ozVPMY/L90foplvJ9uxsIv/2nhpOxme+jx4PdjnWbkNc/H77/Glz0HZVdCJLiPkIA==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr21901875wrs.80.1607973451522; 
 Mon, 14 Dec 2020 11:17:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r15sm7491720wrq.1.2020.12.14.11.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 11:17:30 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: fix ttm size refactor fallout
Date: Mon, 14 Dec 2020 20:17:25 +0100
Message-Id: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
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
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBndWVzcyBDaHJpc3RpYW4gZGlkbid0IGNvbXBpbGUgdGVzdCBhbWRrZmQuCgpGaXhlczogZTEx
YmZiOTlkNmVjICgiZHJtL3R0bTogY2xlYW51cCBCTyBzaXplIGhhbmRsaW5nIHYzIikKQ2M6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+ICh2MSkKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+CkNjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IDc3OTFkMDc0YmQzMi4uYTk2NDdl
N2Y5OGE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jCkBAIC00NTMsNyArNDUzLDcgQEAgc3RhdGljIGludCBhZGRfYm9fdG9fdm0oc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBrZ2RfbWVtICptZW0sCiAJc3RydWN0IGFt
ZGdwdV9ibyAqYm8gPSBtZW0tPmJvOwogCXVpbnQ2NF90IHZhID0gbWVtLT52YTsKIAlzdHJ1Y3Qg
bGlzdF9oZWFkICpsaXN0X2JvX3ZhID0gJm1lbS0+Ym9fdmFfbGlzdDsKLQl1bnNpZ25lZCBsb25n
IGJvX3NpemUgPSBiby0+dGJvLm1lbS5zaXplOworCXVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IGJv
LT50Ym8uYmFzZS5zaXplOwogCiAJaWYgKCF2YSkgewogCQlwcl9lcnIoIkludmFsaWQgVkEgd2hl
biBhZGRpbmcgQk8gdG8gVk1cbiIpOwpAQCAtMTI4MSw3ICsxMjgxLDcgQEAgaW50IGFtZGdwdV9h
bWRrZmRfZ3B1dm1fZnJlZV9tZW1vcnlfb2ZfZ3B1KAogCQlzdHJ1Y3Qga2dkX2RldiAqa2dkLCBz
dHJ1Y3Qga2dkX21lbSAqbWVtLCB1aW50NjRfdCAqc2l6ZSkKIHsKIAlzdHJ1Y3QgYW1ka2ZkX3By
b2Nlc3NfaW5mbyAqcHJvY2Vzc19pbmZvID0gbWVtLT5wcm9jZXNzX2luZm87Ci0JdW5zaWduZWQg
bG9uZyBib19zaXplID0gbWVtLT5iby0+dGJvLm1lbS5zaXplOworCXVuc2lnbmVkIGxvbmcgYm9f
c2l6ZSA9IG1lbS0+Ym8tPnRiby5iYXNlLnNpemU7CiAJc3RydWN0IGtmZF9ib192YV9saXN0ICpl
bnRyeSwgKnRtcDsKIAlzdHJ1Y3QgYm9fdm1fcmVzZXJ2YXRpb25fY29udGV4dCBjdHg7CiAJc3Ry
dWN0IHR0bV92YWxpZGF0ZV9idWZmZXIgKmJvX2xpc3RfZW50cnk7CkBAIC0xNDAyLDcgKzE0MDIs
NyBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9tYXBfbWVtb3J5X3RvX2dwdSgKIAltdXRleF9s
b2NrKCZtZW0tPmxvY2spOwogCiAJZG9tYWluID0gbWVtLT5kb21haW47Ci0JYm9fc2l6ZSA9IGJv
LT50Ym8ubWVtLnNpemU7CisJYm9fc2l6ZSA9IGJvLT50Ym8uYmFzZS5zaXplOwogCiAJcHJfZGVi
dWcoIk1hcCBWQSAweCVsbHggLSAweCVsbHggdG8gdm0gJXAgZG9tYWluICVzXG4iLAogCQkJbWVt
LT52YSwKQEAgLTE1MDYsNyArMTUwNiw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX3VubWFw
X21lbW9yeV9mcm9tX2dwdSgKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGdldF9hbWRn
cHVfZGV2aWNlKGtnZCk7CiAJc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5m
byA9CiAJCSgoc3RydWN0IGFtZGdwdV92bSAqKXZtKS0+cHJvY2Vzc19pbmZvOwotCXVuc2lnbmVk
IGxvbmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRiby5tZW0uc2l6ZTsKKwl1bnNpZ25lZCBsb25nIGJv
X3NpemUgPSBtZW0tPmJvLT50Ym8uYmFzZS5zaXplOwogCXN0cnVjdCBrZmRfYm9fdmFfbGlzdCAq
ZW50cnk7CiAJc3RydWN0IGJvX3ZtX3Jlc2VydmF0aW9uX2NvbnRleHQgY3R4OwogCWludCByZXQ7
Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
