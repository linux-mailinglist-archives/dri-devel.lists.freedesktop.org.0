Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536C32A817A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707736EDA0;
	Thu,  5 Nov 2020 14:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188C6EDA0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x7so2105568wrl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSkh58f2krzhp2hE3KFf5ZyOONS9hWGvZQYe4kveepQ=;
 b=VlPjzCJT3y6e/FnCd2xLEPBd0z7vGt4Qg/m+b0RlACokUoWDnR7rwn/cE/eawSN26W
 Wz2Vmh8dmVk3cTlLPul5wt3AlHqwThJYpazo4c8CHYlLlbi+um3zq0XC/BntQDQDlSug
 qP9xHZoWAqIhvGMCzQyBkgpS2fxEnGPkSCmwP4o0tV70AV7CwMxNJ4dHIVzUHDawwKnM
 N5OzXuMeIbtujOq7o6yjhUQubbYvD45CJls1gsJCnHgAiyv1oWrRGm42I+1RxN6LOq70
 jYUJep8G9BsTpyns4E0uVhkbNw80eZTOMgIaaedtq1GBcTjO4/U4C4y6dYJ9oZ70BJk7
 ocIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSkh58f2krzhp2hE3KFf5ZyOONS9hWGvZQYe4kveepQ=;
 b=Bq5CTVT9tS1WoGLwAe6z81Tg425CWKhGbj4dMsKRUWndEoUFZCPgCdCsNFT9clz7QO
 w7AWHnen7H2QPijbLnfXzZAorYmQUt0PA9Jif37oKvFSRM82XLCLKzwLa6upyoGH6KDn
 LsPSauS85WFof9zoNiMVw0Wnl5QOXG5xg5aVIY0JeJ7L5WgEbXRQJTNOpmmnIJJiBG2D
 MWxOYL/TcMfQPYK8kK53qP0JjTAE+FisupstMvKIepiN964zAdkvqWj9OEX2IOJcJZUj
 tYvIA2X0tv/p4K/8yWWYS5jdpnHuZ0l1EG+52mQ/U35plrb8agJsRn0ayTtvRaHQEA7O
 IasA==
X-Gm-Message-State: AOAM532LQsks9iHFgP/9QRYWM26csvy58zihsSJezVDKJOBzNjUK8SGL
 oMxRaqfpBaAwtl7cXm69eaCYxg==
X-Google-Smtp-Source: ABdhPJyLybY/q1JINhhp6tsqqnQa/WrE4fpJ0FtSt5uywWd1JtbavxdvLo7R9GEFsr/3kV4i58KbAw==
X-Received: by 2002:adf:a2c2:: with SMTP id t2mr3530595wra.54.1604587951999;
 Thu, 05 Nov 2020 06:52:31 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Date: Thu,  5 Nov 2020 14:45:12 +0000
Message-Id: <20201105144517.1826692-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
ZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jICAgIHwgMjkgKysrKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVy
LmMKaW5kZXggMWQ2OTZlYzAwMWNmZi4uMGE1Mzk0NTZmNjg2NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKQEAgLTEyMCw0NCAr
MTIwLDUxIEBAIHNpZGViYW5kX21zZ19yZXFfZXF1YWwoY29uc3Qgc3RydWN0IGRybV9kcF9zaWRl
YmFuZF9tc2dfcmVxX2JvZHkgKmluLAogc3RhdGljIGJvb2wKIHNpZGViYW5kX21zZ19yZXFfZW5j
b2RlX2RlY29kZShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSAqaW4pCiB7Ci0J
c3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9OworCXN0cnVjdCBk
cm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5ICpvdXQ7CiAJc3RydWN0IGRybV9wcmludGVyIHAg
PSBkcm1fZXJyX3ByaW50ZXIoUFJFRklYX1NUUik7CiAJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9t
c2dfdHggdHhtc2c7CiAJaW50IGksIHJldDsKKwlib29sIHJlc3VsdCA9IHRydWU7CisKKwlvdXQg
PSBremFsbG9jKHNpemVvZigqb3V0KSwgR0ZQX0tFUk5FTCk7CiAKIAlkcm1fZHBfZW5jb2RlX3Np
ZGViYW5kX3JlcShpbiwgJnR4bXNnKTsKLQlyZXQgPSBkcm1fZHBfZGVjb2RlX3NpZGViYW5kX3Jl
cSgmdHhtc2csICZvdXQpOworCXJldCA9IGRybV9kcF9kZWNvZGVfc2lkZWJhbmRfcmVxKCZ0eG1z
Zywgb3V0KTsKIAlpZiAocmV0IDwgMCkgewogCQlkcm1fcHJpbnRmKCZwLCAiRmFpbGVkIHRvIGRl
Y29kZSBzaWRlYmFuZCByZXF1ZXN0OiAlZFxuIiwKIAkJCSAgIHJldCk7Ci0JCXJldHVybiBmYWxz
ZTsKKwkJcmVzdWx0ID0gZmFsc2U7CisJCWdvdG8gb3V0OwogCX0KIAotCWlmICghc2lkZWJhbmRf
bXNnX3JlcV9lcXVhbChpbiwgJm91dCkpIHsKKwlpZiAoIXNpZGViYW5kX21zZ19yZXFfZXF1YWwo
aW4sIG91dCkpIHsKIAkJZHJtX3ByaW50ZigmcCwgIkVuY29kZS9kZWNvZGUgZmFpbGVkLCBleHBl
Y3RlZDpcbiIpOwogCQlkcm1fZHBfZHVtcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkoaW4sIDEsICZw
KTsKIAkJZHJtX3ByaW50ZigmcCwgIkdvdDpcbiIpOwotCQlkcm1fZHBfZHVtcF9zaWRlYmFuZF9t
c2dfcmVxX2JvZHkoJm91dCwgMSwgJnApOwotCQlyZXR1cm4gZmFsc2U7CisJCWRybV9kcF9kdW1w
X3NpZGViYW5kX21zZ19yZXFfYm9keShvdXQsIDEsICZwKTsKKwkJcmVzdWx0ID0gZmFsc2U7CisJ
CWdvdG8gb3V0OwogCX0KIAogCXN3aXRjaCAoaW4tPnJlcV90eXBlKSB7CiAJY2FzZSBEUF9SRU1P
VEVfRFBDRF9XUklURToKLQkJa2ZyZWUob3V0LnUuZHBjZF93cml0ZS5ieXRlcyk7CisJCWtmcmVl
KG91dC0+dS5kcGNkX3dyaXRlLmJ5dGVzKTsKIAkJYnJlYWs7CiAJY2FzZSBEUF9SRU1PVEVfSTJD
X1JFQUQ6Ci0JCWZvciAoaSA9IDA7IGkgPCBvdXQudS5pMmNfcmVhZC5udW1fdHJhbnNhY3Rpb25z
OyBpKyspCi0JCQlrZnJlZShvdXQudS5pMmNfcmVhZC50cmFuc2FjdGlvbnNbaV0uYnl0ZXMpOwor
CQlmb3IgKGkgPSAwOyBpIDwgb3V0LT51LmkyY19yZWFkLm51bV90cmFuc2FjdGlvbnM7IGkrKykK
KwkJCWtmcmVlKG91dC0+dS5pMmNfcmVhZC50cmFuc2FjdGlvbnNbaV0uYnl0ZXMpOwogCQlicmVh
azsKIAljYXNlIERQX1JFTU9URV9JMkNfV1JJVEU6Ci0JCWtmcmVlKG91dC51LmkyY193cml0ZS5i
eXRlcyk7CisJCWtmcmVlKG91dC0+dS5pMmNfd3JpdGUuYnl0ZXMpOwogCQlicmVhazsKIAl9CiAK
IAkvKiBDbGVhciBldmVyeXRoaW5nIGJ1dCB0aGUgcmVxX3R5cGUgZm9yIHRoZSBpbnB1dCAqLwog
CW1lbXNldCgmaW4tPnUsIDAsIHNpemVvZihpbi0+dSkpOwogCi0JcmV0dXJuIHRydWU7CitvdXQ6
CisJa2ZyZWUob3V0KTsKKwlyZXR1cm4gcmVzdWx0OwogfQogCiBpbnQgaWd0X2RwX21zdF9zaWRl
YmFuZF9tc2dfcmVxX2RlY29kZSh2b2lkICp1bnVzZWQpCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
