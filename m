Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC42B6C64
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B05689226;
	Tue, 17 Nov 2020 17:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E9C89226
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:56:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l11so19268881lfg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vkMuTUEF8tVK8/o6kH/0uU22lZBZ4rsB3u4Geir8dd0=;
 b=fTpcC6QiedPTIxdRHBxj2xab1FLTdV1tJNc/fMIy/Olx3TC4K4K9QaAxTKT1pC0GSq
 ujwi6sWxPNQsBCulxxrrmR17BuubieRe2+KZf6LWJHDd8Yje7YomgNTr7nulAKZ/yFCq
 PQ8YIhwNh+n1ELUWIbAf2qLRO5FWHCFNoPCTO13uhqTz6fpKct+43d3sAaPM3uZPz/ln
 boYzj+hdjhEP5Wi/stq0gCCGz7vL88jFXOpayHfBoxUV4Ajme3cEAqIljAjbfv9yHfmg
 QvwLWzan7GE+KeJCfJ4MlBxGTmJ5xDYgD+PZArFAVcECgiknMXSc0Il6mtvE9O8mPRG6
 WEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vkMuTUEF8tVK8/o6kH/0uU22lZBZ4rsB3u4Geir8dd0=;
 b=bXLANx/ZzCRzq9ALTVcBhyvSf04T68GAtc3cbZdtuBRlYnjcSVHmU6YvtlGgcVfkDW
 gT/xLMFsfsuzB09OgsgYmmfAQgNLFwi0ZNMjnuCwWFn6yiPDt0Z5Ijb8fsNVFrpryUIe
 AhW6Zrx02d127F1vy8iv5c+SI8T5oV8Qqlz+7TVnrv1EGy8i1uXqZaxGspc3hO1GgxGQ
 V72soAHWaDtbCvBuwGI2EXXj9bTjxmCgvhZBgqknZbTV/lc2L6zQT0j0kbGWlKNUZX3j
 Bl4hmR5KGX5+Qamwct7Jxt9z7oEh3sfTrQ7nx8Rwuk/sNQLDfBjYqagnLlMHuc9fFkDp
 Lc/A==
X-Gm-Message-State: AOAM532s3H42EGsvNbvzLYAPycDlb25BUVZ3UREh9kW80/Lik+ElEryR
 yCYxB6RkVGn97u/u+IkiCYdGDA==
X-Google-Smtp-Source: ABdhPJxA5IJvWbS3vh9oFa5f0JrgmfSL3Xt5rDVA1gE3jAKjHSgcA2KoqtAsqX9r8I4kuwohlPzKJA==
X-Received: by 2002:a19:b95:: with SMTP id 143mr2117915lfl.51.1605635793541;
 Tue, 17 Nov 2020 09:56:33 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id m21sm1558631ljh.82.2020.11.17.09.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:56:32 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/panel: s6e63m0: Fix and extend MCS table
Date: Tue, 17 Nov 2020 18:56:19 +0100
Message-Id: <20201117175621.870085-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHVwIHRoZSBmb3JtYXQgb2YgdGhlIG1hbnVmYWN0dXJlciBjb21tYW5kIHNldCB0YWJsZQp0
byBiZSBUQUItaW5kZW50ZWQgYW5kIGxvd2VyY2FzZS4gQWRkIHRoZSBNQ1NfVEVNUF9TV0lSRQpj
b21tYW5kIHRoYXQgd2Ugd2lsbCBtYWtlIHVzZSBvZi4KCkNjOiBTdGVwaGFuIEdlcmhvbGQgPHN0
ZXBoYW5AZ2VyaG9sZC5uZXQ+CkNjOiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWll
bEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2
M20wLmMgfCAxNyArKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2Ftc3VuZy1zNmU2M20wLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ft
c3VuZy1zNmU2M20wLmMKaW5kZXggMjEwZTcwZGEzYTE1Li44ZmNlMzk5ZmI5N2QgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLmMKQEAgLTIzLDIwICsy
MywyMSBAQAogI2luY2x1ZGUgInBhbmVsLXNhbXN1bmctczZlNjNtMC5oIgogCiAvKiBNYW51ZmFj
dHVyZXIgQ29tbWFuZCBTZXQgKi8KLSNkZWZpbmUgTUNTX0VMVlNTX09OICAgICAgICAgICAgICAg
IDB4YjEKLSNkZWZpbmUgTUNTX01JRUNUTDEgICAgICAgICAgICAgICAgMHhjMAotI2RlZmluZSBN
Q1NfQkNNT0RFICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMQorI2RlZmluZSBNQ1Nf
RUxWU1NfT04JCTB4YjEKKyNkZWZpbmUgTUNTX1RFTVBfU1dJUkUJCTB4YjIKKyNkZWZpbmUgTUNT
X01JRUNUTDEJCTB4YzAKKyNkZWZpbmUgTUNTX0JDTU9ERQkJMHhjMQogI2RlZmluZSBNQ1NfRVJS
T1JfQ0hFQ0sJCTB4ZDUKICNkZWZpbmUgTUNTX1JFQURfSUQxCQkweGRhCiAjZGVmaW5lIE1DU19S
RUFEX0lEMgkJMHhkYgogI2RlZmluZSBNQ1NfUkVBRF9JRDMJCTB4ZGMKICNkZWZpbmUgTUNTX0xF
VkVMXzJfS0VZCQkweGYwCiAjZGVmaW5lIE1DU19NVFBfS0VZCQkweGYxCi0jZGVmaW5lIE1DU19E
SVNDVEwgICAweGYyCi0jZGVmaW5lIE1DU19TUkNDVEwgICAgICAgICAgIDB4ZjYKLSNkZWZpbmUg
TUNTX0lGQ1RMICAgICAgICAgICAgICAgICAgICAgICAweGY3Ci0jZGVmaW5lIE1DU19QQU5FTENU
TCAgICAgICAgIDB4RjgKLSNkZWZpbmUgTUNTX1BHQU1NQUNUTCAgICAgICAgICAgICAgICAgICAw
eGZhCisjZGVmaW5lIE1DU19ESVNDVEwJCTB4ZjIKKyNkZWZpbmUgTUNTX1NSQ0NUTAkJMHhmNgor
I2RlZmluZSBNQ1NfSUZDVEwJCTB4ZjcKKyNkZWZpbmUgTUNTX1BBTkVMQ1RMCQkweGY4CisjZGVm
aW5lIE1DU19QR0FNTUFDVEwJCTB4ZmEKIAogI2RlZmluZSBTNkU2M00wX0xDRF9JRF9WQUxVRV9N
MgkJMHhBNAogI2RlZmluZSBTNkU2M00wX0xDRF9JRF9WQUxVRV9TTTIJMHhCNAotLSAKMi4yNi4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
