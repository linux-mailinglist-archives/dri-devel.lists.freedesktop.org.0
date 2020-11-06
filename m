Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521A2A9F62
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570056EB23;
	Fri,  6 Nov 2020 21:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2177C6EB22
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:49:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v5so2842386wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmOPpMPfhIiNWLmfD425Vh4v6mCQcNCmoMGuMYmd5/A=;
 b=TRvyCyTnH/kQfSvaUF+4Mph7uYU4vkWmNwmMg9+BDBN6t+igCS95yEeZ4LEqh4XUXD
 R8eISkv5gAP1hNdQMKo8Ygf8Gve+fObVMUpbtkUZRz3t9vj+Rl5hLbsgS8TFMxYL1psx
 k2F/jE4BkilaJVkYfuqAELthkI0vmyfkkO8Sa7LPXqf0E8s41v60oHpJqCPM9CYOUw93
 kFpqUD4NcLPRLJidrtSOKH515bDJ0/3XSArh4XbtdFHSMyCN2yhSMT34nqX25CCKGZpC
 k3MoG3RpKjMZ29E2uQ4EUbT3Dc9v20vXEg8ajge2Yhd2lTgTdopSaE0V/2USYSKYzNG2
 OhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmOPpMPfhIiNWLmfD425Vh4v6mCQcNCmoMGuMYmd5/A=;
 b=EarrfABm0pbNEn34VtNOK2h08sVAcCVmRjK/Pz9om/ua65iY1ty4UUpf9BTTZosShd
 YbPVZFJgeh3YvzDX6dcjYyPmS8N1R0ukZayy48oa9+/T1IYNMilq9aMwCkt0RTd/S+wI
 vZnf6vtE3EnqXqGNVNJyG4+sAmBGWj95ka+Z4kFh8WXO83mVWGRaQJ90XyW3e7gY0RU3
 HDWe912LllgqR6hccFFkC4rAw220S8TqgRV/U1/lXcysz2j41UvnYwbNo0xi/pdCHfe4
 aylmGdt6O+AJRW87oUyGb40CjnlOpHZjmTcikZgH5ng8ffAqfXmGjwgvsZTRxtlIr0GV
 x/Sg==
X-Gm-Message-State: AOAM532AEdw8exMOGoFOUgD/NyphKXUoliDKGr49COVFwvRBrLg9LDd0
 B8TiculKkaXYQtDp/YuWcoGlKw==
X-Google-Smtp-Source: ABdhPJwlneUD3GOe/AzXC/erfEbWyozUYjeiG0s72KxFlAtyLwPy1FkZOocvYKMIlCHlqDhVsYGVqw==
X-Received: by 2002:a1c:c90b:: with SMTP id f11mr1681391wmb.54.1604699396872; 
 Fri, 06 Nov 2020 13:49:56 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:49:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/19] drm/selftests/test-drm_dp_mst_helper: Move
 'sideband_msg_req_encode_decode' onto the heap
Date: Fri,  6 Nov 2020 21:49:33 +0000
Message-Id: <20201106214949.2042120-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgdG9vIG11Y2ggZGF0YSBiZWluZyBzdG9yZWQgb24gdGhlIHN0YWNrLgoKRml4ZXMg
dGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUv
ZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6IEluIGZ1bmN0aW9uIOKAmHNp
ZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZeKAmToKIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVz
dHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jOjE2ODoxOiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6
ZSBvZiAxMDcyIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1XZnJhbWUtbGFyZ2Vy
LXRoYW49XQoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYyB8IDExICsr
KysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0
X2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVs
cGVyLmMKaW5kZXggZTAwYmRjNTU3Zjg4MC4uNmI0NzU5ZWQ2YmZkNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKQEAgLTEyMiw3
ICsxMjIsNyBAQCBzaWRlYmFuZF9tc2dfcmVxX2VuY29kZV9kZWNvZGUoc3RydWN0IGRybV9kcF9z
aWRlYmFuZF9tc2dfcmVxX2JvZHkgKmluKQogewogCXN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNn
X3JlcV9ib2R5ICpvdXQ7CiAJc3RydWN0IGRybV9wcmludGVyIHAgPSBkcm1fZXJyX3ByaW50ZXIo
UFJFRklYX1NUUik7Ci0Jc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfdHggdHhtc2c7CisJc3Ry
dWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfdHggKnR4bXNnOwogCWludCBpLCByZXQ7CiAJYm9vbCBy
ZXN1bHQgPSB0cnVlOwogCkBAIC0xMzAsOCArMTMwLDEyIEBAIHNpZGViYW5kX21zZ19yZXFfZW5j
b2RlX2RlY29kZShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAqaW4pCiAJaWYg
KCFvdXQpCiAJCXJldHVybiBmYWxzZTsKIAotCWRybV9kcF9lbmNvZGVfc2lkZWJhbmRfcmVxKGlu
LCAmdHhtc2cpOwotCXJldCA9IGRybV9kcF9kZWNvZGVfc2lkZWJhbmRfcmVxKCZ0eG1zZywgb3V0
KTsKKwl0eG1zZyA9IGt6YWxsb2Moc2l6ZW9mKCp0eG1zZyksIEdGUF9LRVJORUwpOworCWlmICgh
dHhtc2cpCisJCXJldHVybiBmYWxzZTsKKworCWRybV9kcF9lbmNvZGVfc2lkZWJhbmRfcmVxKGlu
LCB0eG1zZyk7CisJcmV0ID0gZHJtX2RwX2RlY29kZV9zaWRlYmFuZF9yZXEodHhtc2csIG91dCk7
CiAJaWYgKHJldCA8IDApIHsKIAkJZHJtX3ByaW50ZigmcCwgIkZhaWxlZCB0byBkZWNvZGUgc2lk
ZWJhbmQgcmVxdWVzdDogJWRcbiIsCiAJCQkgICByZXQpOwpAQCAtMTY2LDYgKzE3MCw3IEBAIHNp
ZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19y
ZXFfYm9keSAqaW4pCiAKIG91dDoKIAlrZnJlZShvdXQpOworCWtmcmVlKHR4bXNnKTsKIAlyZXR1
cm4gcmVzdWx0OwogfQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
