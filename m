Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5AE2B4DC1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179856EA0B;
	Mon, 16 Nov 2020 17:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282436EA0E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o15so19661008wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmOPpMPfhIiNWLmfD425Vh4v6mCQcNCmoMGuMYmd5/A=;
 b=qQWadntt/mFLB2dHX6lrFTrO+5jYltfzBzIRsvL1z5Z6vtAiX/okLVJtYTfU6M+6ZS
 XzZpueyoOCEm+ppetpCQb/hIf7iXx7l2KUxEI7bn55gdSyyYDPd9gZdfOyOvNWfft1SM
 w+iuynB+rS795d3bkOrNtC1Xrylj2zsp80gJYvH7zZSfL6Hahtp7qBLDtGOGBcpQcEFP
 DJViqYgYnecWKSHdDGPxR8ed0QSh4us9Z22xp+J6fICeTcd+6MkNOp86MqffqD6smjYX
 23yKflHz+b2Wn4pZ9o8v5+IFG9YZ/IJ13tKgb+qBOEJgoE4oB3VoDH9y+d0FXXQ2jRgs
 kSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmOPpMPfhIiNWLmfD425Vh4v6mCQcNCmoMGuMYmd5/A=;
 b=FRbgo7jH1ZQNDhBLHBABc1l51Oq+TZXY9D4TpP/qiRmBL05zBCtgB5lIgROx6h+CE5
 NfyFZ9NxlSv1iHsP9jT5Lhw+yj5IMbRuv0mpl/rtknbNFFPKB04dCDidqRXYoQRdkMww
 XYP665E9rJ8c8VFkcewuzMuMRvGZWfYrBjGXK9l7IUStlSMxxyQvHnl36AwWp48L8wn8
 CkZfn2sQNl4Q+9w4Xqd7U2ApFpIFt1qYn25UBZ0bdsuQW/RLcxvQm9G/EB8IV+8OZV3w
 wvJNSGfQdktO0VyX3BOsGfLeuvU8I5R0U3jVBAKQ+vym626EkeMFUp8RVmS6y8i/875G
 fcrA==
X-Gm-Message-State: AOAM533sn4JeSreSQrqxrW0AC5cZ/E4m4j6jGq7DThf8vi7rFkMg3+qt
 0XFJf/hnm/8BPLYNDzB/tZyzEcuPt42LLkcp
X-Google-Smtp-Source: ABdhPJwE+AiRHnGNLBkmlszJMRYyDRr3EsBayn0O2BqS6CGMXtLN5yEZ0ylGG7y5khqkG3OToESChw==
X-Received: by 2002:a5d:510a:: with SMTP id s10mr20125292wrt.402.1605548522848; 
 Mon, 16 Nov 2020 09:42:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/42] drm/selftests/test-drm_dp_mst_helper: Move
 'sideband_msg_req_encode_decode' onto the heap
Date: Mon, 16 Nov 2020 17:41:00 +0000
Message-Id: <20201116174112.1833368-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
