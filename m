Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9F22DCE8
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 14:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5FA6E2F0;
	Wed, 29 May 2019 12:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AF76E2F0;
 Wed, 29 May 2019 12:27:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f8so1669151wrt.1;
 Wed, 29 May 2019 05:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+aUYs8KrOK4grbSd0Fh2nuQVPFm1teD6ovZh/kTX0TI=;
 b=iv65DOVlsvkfDk71NfAhoonck/OmJTAH4uopEdz5MY/3hCqDq7lz88xVX2ljvIwwcd
 5Gzztgj4QrsnfpqW/D+abBivfC4JnZG6RQfmz1+OvU6L3pZvrc9N5SChaLVkNNOCHltG
 9TY3OYyZN5yitVIvK/AiVq+HD5CB142LRssL+Jf4szigW4dYHasRNHjJ4sp7nbVivvv6
 TrtUKJ9lleTEfddg5T7wZ5on/iU2SvtSmE/SQVYRZv8K+silpQEAkKh+DaJeMk4XUdwx
 ATB3M25iKg6kg9qWeWmACNMz/xzTEEa0NHF2Yv4GoA5vzgDIaKMh/Wfk8QJAbKih+hqm
 I20A==
X-Gm-Message-State: APjAAAW8klTnMiwEMMcCrzgGJyUrjPlQ8yRNQ1/BxnHvzC73kNd5R0Gd
 p23xjXU491DXmDtqIg/34gpzyKwN
X-Google-Smtp-Source: APXvYqz48SAbnPW9deyOlIQ6SKfEcgOG56HyYrZ+tJZ4Fq3ULRCv/h7/SKdBKjJZx6tsGmufslJ6jg==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr20926790wrw.306.1559132831532; 
 Wed, 29 May 2019 05:27:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Date: Wed, 29 May 2019 14:27:02 +0200
Message-Id: <20190529122702.13035-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529122702.13035-1-christian.koenig@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+aUYs8KrOK4grbSd0Fh2nuQVPFm1teD6ovZh/kTX0TI=;
 b=ZphIOZYJSa4loL4BuSbcyOjxq30C5m1FtMXSy4WRPiuVW7u1x+uunyaQ0D2CEOiMu6
 bRxhhaITYWh8ZxYXiwiY9oqagnkEb/zvdRsK+EQasgbz0waR9P7en3mNBfR+MGtmW7Z5
 LYV/wI9lRZQ5jbmHzGAyLhPbS8Wu9k7WwVlOjzYSq2IYhBa19wbnuoqxEAQpzqyPOf2P
 TmU6QA5ApbNjjIlLPZDIMD6OD+y0gSYUy+9k90cSe0vRZwsqqcwQERleQM5h0J+rWSI1
 e8YMdH+bZdBS1Nv+dM1slano02L8dsZtzNLgoPz/QDfLaA4Wn1U5fQgiDKP27FB+3pfE
 xScg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhdm9pZHMgT09NIHNpdHVhdGlvbnMgd2hlbiB3ZSBoYXZlIGxvdHMgb2YgdGhyZWFkcwpz
dWJtaXR0aW5nIGF0IHRoZSBzYW1lIHRpbWUuCgp2MzogYXBwbHkgdGhpcyB0byB0aGUgd2hvbGUg
ZHJpdmVyLCBub3QganVzdCBDUwoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
c2EuYyAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAg
ICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwg
MiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwppbmRleCAyMGYyOTU1ZDJhNTUuLjNl
MmRhMjRjZDE3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKQEAgLTY0
OCw3ICs2NDgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wYXJzZXJfYm9zKHN0cnVjdCBhbWRn
cHVfY3NfcGFyc2VyICpwLAogCX0KIAogCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZwLT50
aWNrZXQsICZwLT52YWxpZGF0ZWQsIHRydWUsCi0JCQkJICAgJmR1cGxpY2F0ZXMsIHRydWUpOwor
CQkJCSAgICZkdXBsaWNhdGVzLCBmYWxzZSk7CiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKIAkJ
aWYgKHIgIT0gLUVSRVNUQVJUU1lTKQogCQkJRFJNX0VSUk9SKCJ0dG1fZXVfcmVzZXJ2ZV9idWZm
ZXJzIGZhaWxlZC5cbiIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2NzYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jCmlu
ZGV4IDA2ZjgzY2FjMGQzYS4uZjY2MDYyOGU2YWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2NzYS5jCkBAIC03OSw3ICs3OSw3IEBAIGludCBhbWRncHVfbWFwX3N0YXRpY19j
c2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogCWxp
c3RfYWRkKCZjc2FfdHYuaGVhZCwgJmxpc3QpOwogCWFtZGdwdV92bV9nZXRfcGRfYm8odm0sICZs
aXN0LCAmcGQpOwogCi0JciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3Qs
IHRydWUsIE5VTEwsIHRydWUpOworCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQs
ICZsaXN0LCB0cnVlLCBOVUxMLCBmYWxzZSk7CiAJaWYgKHIpIHsKIAkJRFJNX0VSUk9SKCJmYWls
ZWQgdG8gcmVzZXJ2ZSBDU0EsUEQgQk9zOiBlcnI9JWRcbiIsIHIpOwogCQlyZXR1cm4gcjsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRleCBkNTEzYTVhZDAzZGQuLmVk
MjVhNGUxNDQwNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwpAQCAt
MTcxLDcgKzE3MSw3IEBAIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmosCiAKIAlhbWRncHVfdm1fZ2V0X3BkX2JvKHZtLCAmbGlzdCwgJnZtX3Bk
KTsKIAotCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxzZSwg
JmR1cGxpY2F0ZXMsIHRydWUpOworCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQs
ICZsaXN0LCBmYWxzZSwgJmR1cGxpY2F0ZXMsIGZhbHNlKTsKIAlpZiAocikgewogCQlkZXZfZXJy
KGFkZXYtPmRldiwgImxlYWtpbmcgYm8gdmEgYmVjYXVzZSAiCiAJCQkid2UgZmFpbCB0byByZXNl
cnZlIGJvICglZClcbiIsIHIpOwpAQCAtNjA4LDcgKzYwOCw3IEBAIGludCBhbWRncHVfZ2VtX3Zh
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAKIAlhbWRncHVfdm1f
Z2V0X3BkX2JvKCZmcHJpdi0+dm0sICZsaXN0LCAmdm1fcGQpOwogCi0JciA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsICZkdXBsaWNhdGVzLCB0cnVlKTsKKwly
ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgJmR1cGxpY2F0
ZXMsIGZhbHNlKTsKIAlpZiAocikKIAkJZ290byBlcnJvcl91bnJlZjsKIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCmluZGV4IGM0MzBlODI1OTAzOC4uZDYwNTkz
Y2M0MzZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCkBA
IC0xNTUsNyArMTU1LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X2JvX3Jlc2VydmUoc3Ry
dWN0IGFtZGdwdV9ibyAqYm8sIGJvb2wgbm9faW50cikKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwogCWludCByOwogCi0JciA9IHR0
bV9ib19yZXNlcnZlKCZiby0+dGJvLCAhbm9faW50ciwgZmFsc2UsIE5VTEwpOworCXIgPSBfX3R0
bV9ib19yZXNlcnZlKCZiby0+dGJvLCAhbm9faW50ciwgZmFsc2UsIE5VTEwpOwogCWlmICh1bmxp
a2VseShyICE9IDApKSB7CiAJCWlmIChyICE9IC1FUkVTVEFSVFNZUykKIAkJCWRldl9lcnIoYWRl
di0+ZGV2LCAiJXAgcmVzZXJ2ZSBmYWlsZWRcbiIsIGJvKTsKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
