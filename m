Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6082B4DC0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8D789FED;
	Mon, 16 Nov 2020 17:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0FD6EA08
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so19669707wrt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TjcKYWuzDhqklR5qoTIUsTytnZe/lM+b0Bx4U4tTS3A=;
 b=sU22MNf45vVUHSsYOdy9fl9yIGywaq3clCbLYSUdwuJl0SOFI02Lsd0y793lP8J6Rk
 rPkBRR7UXN6FZZWxOCbado478weeCmgsuYDA2GENsiflFpTuvK+0sE2pkFQD1xqN3M63
 zW6V3eyDvMX99Ec4jMu4ywyLi57RfvGLgaUwkywJ7QNJ040N40KGfN+YHqdl9CMF/z9x
 We/t8grpmbCU5c3UVZ1bHCbKDcJY4xcWcvl/OFHGBz9SwOE6y5t7HZyfNxZepyLrNsfx
 TrcS04JbRFhulNsEItHdk1Pgvb5ivEtH1MUNujY9SVgqgD+oiBNJUW4W5BuZSJ0cWA+t
 1mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TjcKYWuzDhqklR5qoTIUsTytnZe/lM+b0Bx4U4tTS3A=;
 b=HpGckdyFWB4hpiAMC+HSCFXKG0IU2xNoeUQHhhcYzSir0TtzFoMerIdLSJDRnxVbLL
 Wm6Kz8Hk1VhcKDWZGMrbU4IzUflPdsLUa/+xCumW9V3MT6CO83clB6HDM9llfhHOIxMd
 Nd8kDE1jKSnhE0eQcrbO/jQ5nf2a71ypqr8kMwbD5vJVSK8DTveZA2Q5oXsIRmzfpJI3
 a9fH64MpwAz6hRvB3DUpkrZvWMDYSd9QnckMipLFuXqEXVKc08JN7r115xQP/IVNamTo
 i4BBFoIgmE5C/t2wyJ0PN23O44n/7aNYBomIj/dKeiNTYKGL8iRiLOUBUB/5ZFZgfzH9
 6eLg==
X-Gm-Message-State: AOAM533Ypf6U10HGMHzAqGIWp7xcrSi1snEbO3ul0JprQ2ycOrrRCN84
 D0saDAIXL/P7rIFCLGOB6sgTezs4Z5l66AeW
X-Google-Smtp-Source: ABdhPJy1yyaqbtAV862cd0RoEAr1Ke/mk6oE5G4P2h3GHj95qMG7W+9SB8wzWyLsernWsiTuWwQE8A==
X-Received: by 2002:adf:db4a:: with SMTP id f10mr20402689wrj.420.1605548521624; 
 Mon, 16 Nov 2020 09:42:01 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/42] drm/selftests/test-drm_dp_mst_helper: Place 'struct
 drm_dp_sideband_msg_req_body' onto the heap
Date: Mon, 16 Nov 2020 17:40:59 +0000
Message-Id: <20201116174112.1833368-30-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN0YWNrIGlzIHRvbyBmdWxsLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1
aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9t
c3RfaGVscGVyLmM6IEluIGZ1bmN0aW9uIOKAmHNpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29k
ZeKAmToKIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5j
OjE2MToxOiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6ZSBvZiAxMTc2IGJ5dGVzIGlzIGxhcmdlciB0
aGFuIDEwMjQgYnl0ZXMgWy1XZnJhbWUtbGFyZ2VyLXRoYW49XQoKQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5G
cmFuY2lzQGFtZC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogLi4uL2RybS9z
ZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jICAgIHwgMzEgKysrKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVy
LmMKaW5kZXggMWQ2OTZlYzAwMWNmZi4uZTAwYmRjNTU3Zjg4MCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKQEAgLTEyMCw0NCAr
MTIwLDUzIEBAIHNpZGViYW5kX21zZ19yZXFfZXF1YWwoY29uc3Qgc3RydWN0IGRybV9kcF9zaWRl
YmFuZF9tc2dfcmVxX2JvZHkgKmluLAogc3RhdGljIGJvb2wKIHNpZGViYW5kX21zZ19yZXFfZW5j
b2RlX2RlY29kZShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAqaW4pCiB7Ci0J
c3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9OworCXN0cnVjdCBk
cm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5ICpvdXQ7CiAJc3RydWN0IGRybV9wcmludGVyIHAg
PSBkcm1fZXJyX3ByaW50ZXIoUFJFRklYX1NUUik7CiAJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9t
c2dfdHggdHhtc2c7CiAJaW50IGksIHJldDsKKwlib29sIHJlc3VsdCA9IHRydWU7CisKKwlvdXQg
PSBremFsbG9jKHNpemVvZigqb3V0KSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFvdXQpCisJCXJldHVy
biBmYWxzZTsKIAogCWRybV9kcF9lbmNvZGVfc2lkZWJhbmRfcmVxKGluLCAmdHhtc2cpOwotCXJl
dCA9IGRybV9kcF9kZWNvZGVfc2lkZWJhbmRfcmVxKCZ0eG1zZywgJm91dCk7CisJcmV0ID0gZHJt
X2RwX2RlY29kZV9zaWRlYmFuZF9yZXEoJnR4bXNnLCBvdXQpOwogCWlmIChyZXQgPCAwKSB7CiAJ
CWRybV9wcmludGYoJnAsICJGYWlsZWQgdG8gZGVjb2RlIHNpZGViYW5kIHJlcXVlc3Q6ICVkXG4i
LAogCQkJICAgcmV0KTsKLQkJcmV0dXJuIGZhbHNlOworCQlyZXN1bHQgPSBmYWxzZTsKKwkJZ290
byBvdXQ7CiAJfQogCi0JaWYgKCFzaWRlYmFuZF9tc2dfcmVxX2VxdWFsKGluLCAmb3V0KSkgewor
CWlmICghc2lkZWJhbmRfbXNnX3JlcV9lcXVhbChpbiwgb3V0KSkgewogCQlkcm1fcHJpbnRmKCZw
LCAiRW5jb2RlL2RlY29kZSBmYWlsZWQsIGV4cGVjdGVkOlxuIik7CiAJCWRybV9kcF9kdW1wX3Np
ZGViYW5kX21zZ19yZXFfYm9keShpbiwgMSwgJnApOwogCQlkcm1fcHJpbnRmKCZwLCAiR290Olxu
Iik7Ci0JCWRybV9kcF9kdW1wX3NpZGViYW5kX21zZ19yZXFfYm9keSgmb3V0LCAxLCAmcCk7Ci0J
CXJldHVybiBmYWxzZTsKKwkJZHJtX2RwX2R1bXBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5KG91dCwg
MSwgJnApOworCQlyZXN1bHQgPSBmYWxzZTsKKwkJZ290byBvdXQ7CiAJfQogCiAJc3dpdGNoIChp
bi0+cmVxX3R5cGUpIHsKIAljYXNlIERQX1JFTU9URV9EUENEX1dSSVRFOgotCQlrZnJlZShvdXQu
dS5kcGNkX3dyaXRlLmJ5dGVzKTsKKwkJa2ZyZWUob3V0LT51LmRwY2Rfd3JpdGUuYnl0ZXMpOwog
CQlicmVhazsKIAljYXNlIERQX1JFTU9URV9JMkNfUkVBRDoKLQkJZm9yIChpID0gMDsgaSA8IG91
dC51LmkyY19yZWFkLm51bV90cmFuc2FjdGlvbnM7IGkrKykKLQkJCWtmcmVlKG91dC51LmkyY19y
ZWFkLnRyYW5zYWN0aW9uc1tpXS5ieXRlcyk7CisJCWZvciAoaSA9IDA7IGkgPCBvdXQtPnUuaTJj
X3JlYWQubnVtX3RyYW5zYWN0aW9uczsgaSsrKQorCQkJa2ZyZWUob3V0LT51LmkyY19yZWFkLnRy
YW5zYWN0aW9uc1tpXS5ieXRlcyk7CiAJCWJyZWFrOwogCWNhc2UgRFBfUkVNT1RFX0kyQ19XUklU
RToKLQkJa2ZyZWUob3V0LnUuaTJjX3dyaXRlLmJ5dGVzKTsKKwkJa2ZyZWUob3V0LT51LmkyY193
cml0ZS5ieXRlcyk7CiAJCWJyZWFrOwogCX0KIAogCS8qIENsZWFyIGV2ZXJ5dGhpbmcgYnV0IHRo
ZSByZXFfdHlwZSBmb3IgdGhlIGlucHV0ICovCiAJbWVtc2V0KCZpbi0+dSwgMCwgc2l6ZW9mKGlu
LT51KSk7CiAKLQlyZXR1cm4gdHJ1ZTsKK291dDoKKwlrZnJlZShvdXQpOworCXJldHVybiByZXN1
bHQ7CiB9CiAKIGludCBpZ3RfZHBfbXN0X3NpZGViYW5kX21zZ19yZXFfZGVjb2RlKHZvaWQgKnVu
dXNlZCkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
