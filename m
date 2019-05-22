Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6C26431
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A7989A5D;
	Wed, 22 May 2019 13:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FB289A1F;
 Wed, 22 May 2019 12:59:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b18so2173311wrq.12;
 Wed, 22 May 2019 05:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+aUYs8KrOK4grbSd0Fh2nuQVPFm1teD6ovZh/kTX0TI=;
 b=SjuQVtSq3+qU848IXXrht8K9fIz/qjsQTcmA8rHFqf6aGg73mzNjIQfGtoqII6LwMr
 IxWAFCs89udDFsmvrw3e4+tI5DTMuLFs/bwn/r/MOoqhFWkp56kflIcQvcbJpFjIpG/Q
 nmBmLgbEqIvaSLjHP/71MYeks9IT/G102eCqu0sA8MjYetG9BZN3ZM6XX91W5Dzqp1vf
 dP17UHX7UC/yS6C7GhodKUnAWtpfifnp5elA5I8SUm0O8pBIM+AgEbO4JqG6qNuBAdIx
 A2BWnj/p1vF0jEyaBkeOtkKcgAgV1s1PDTBzkzYDU9WMPCtcLPRzIn20GGTZhPi6o9tT
 CCHA==
X-Gm-Message-State: APjAAAVL4E534EPnc7GTBEVsXmw2ZO1M5nawiWrDPKU6+Sv0UQRpS/Bq
 vH6YJJcnbC7zw8nE4h73y/uvFKcx
X-Google-Smtp-Source: APXvYqwKmwl9zUdlgzkc/5/QXKBpV/XMctmjFfXXAj7qC8a60jJKSbMa1ExvSTdqsM96ODupurOfJA==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr17496390wru.142.1558529997242; 
 Wed, 22 May 2019 05:59:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b94a:dfe1:fb43:c858])
 by smtp.gmail.com with ESMTPSA id 197sm9723523wma.36.2019.05.22.05.59.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:59:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Date: Wed, 22 May 2019 14:59:47 +0200
Message-Id: <20190522125947.4592-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522125947.4592-1-christian.koenig@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+aUYs8KrOK4grbSd0Fh2nuQVPFm1teD6ovZh/kTX0TI=;
 b=apajUB2JghkhzVICmRQw0yn1WVjb2+tVVsDnZanpkCqNBXDAZN8LEIdWC8ioYws85K
 6eS0YzDCiBxn06J/cjF2FyGkLcgRx4PCLnDyjzrqQBptL/AFSJ6x7AlulOEO/+jsknaZ
 14fr58Shhk8SPzSRp9mZR3tvaN+ZmYj22f3ShcMzXBLO7D1g25LJUnxL7KxlT8dISwLZ
 Ej5wYKoM9uq5BbDJY3xygA6lP73Uxz8EAdHsh4plhUZYGPHEVl659sxZy76WAR9/tBXo
 R6zRvhPjBsHJi9QBOPLAYlCSZRaPfHUuAUc90wkVPrk4Ke1CwV9TYI+99wSUSzYXr1ci
 KwFg==
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
