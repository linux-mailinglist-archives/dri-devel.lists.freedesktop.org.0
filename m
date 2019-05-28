Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A972C23C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ED889F24;
	Tue, 28 May 2019 09:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D2F89E50
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:33 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p26so30642805edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vM1aYE2ulFqwNKAI91FehOuN3FngVvZTQQrOwUdJ200=;
 b=kt0tR/xv3Vt7IhbPAkBS5u7CQVoo/p5IFTLNpjxXOeUC1If/bIf9Zx3VQEDIOaERk4
 KFewyB9gPKLBGeM+7wuHk7tmtaMdjt3gPQxhHfb99Y1x/CgD3lN7AnaWEWDo0hwEjnPL
 Pq8ZjpPSCPoP9GDpbMvZEgEXe8XzsuQF5MkESVueqBEwJaF1Ywnygz5H4m14nz+ONLxI
 py/glzb+QGAE3Wq74gkuvC2MEnkhDQh31YBZHYoxZ87+9UqKs9GMKim/j110tqPmwz/R
 M0O0gGsQBjFQklUUsd4mGOyIWNqfd3HAXo8yomWeaWgDI4WNpQkl7sAqTDE8Sru9AH59
 /B8Q==
X-Gm-Message-State: APjAAAWz8qsfxuX6S1SA7hkiiFa3wE0DNqekMwg4Ebns8eyPGl9Cm4dS
 /5g6bDiepQDJ++++augcs7JWAQ==
X-Google-Smtp-Source: APXvYqwU3phWu021ZksHkbFLtcLsKLyfWY2d+xsu54QDYCzOWlQy1gkDllSESV1InsXH4hWCGMcBow==
X-Received: by 2002:a50:b3a6:: with SMTP id
 s35mr129115181edd.220.1559034210796; 
 Tue, 28 May 2019 02:03:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:29 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 13/33] fbdev: sysfs files can't disappear before the device is
 gone
Date: Tue, 28 May 2019 11:02:44 +0200
Message-Id: <20190528090304.9388-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vM1aYE2ulFqwNKAI91FehOuN3FngVvZTQQrOwUdJ200=;
 b=KW37xWZVcPypjbSNTGtze1qbJdJ+h3eyy81RbWAyp7nDLbzjHN5Wkb5DfFZKHDsp2A
 v6vepSIbHMJFlOq2tkBtTV/XzHFr6pwUkmz2w01+sxCfI4CkmEqKeMStEPkcI1eaw2zU
 cTRX3cMyqjfte5kX7q5zfCLS6/JyWCmbOWE5k=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpY2ggbWVhbnMgbG9ja19mYl9pbmZvIGNhbiBuZXZlciBmYWlsLiBSZW1vdmUgdGhlIGVycm9y
IGhhbmRsaW5nLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2
aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQmFy
dGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogUm9i
IENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYnN5c2ZzLmMgfCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYnN5c2ZzLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jCmluZGV4IDQ0
Y2NhMzlmMmI1MS4uNWYzMjkyNzhlNTVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJzeXNmcy5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5c2ZzLmMK
QEAgLTE3OSwxMCArMTc5LDcgQEAgc3RhdGljIHNzaXplX3Qgc3RvcmVfbW9kZXMoc3RydWN0IGRl
dmljZSAqZGV2aWNlLAogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWNvbnNvbGVfbG9jaygpOwotCWlm
ICghbG9ja19mYl9pbmZvKGZiX2luZm8pKSB7Ci0JCWNvbnNvbGVfdW5sb2NrKCk7Ci0JCXJldHVy
biAtRU5PREVWOwotCX0KKwlsb2NrX2ZiX2luZm8oZmJfaW5mbyk7CiAKIAlsaXN0X3NwbGljZSgm
ZmJfaW5mby0+bW9kZWxpc3QsICZvbGRfbGlzdCk7CiAJZmJfdmlkZW9tb2RlX3RvX21vZGVsaXN0
KChjb25zdCBzdHJ1Y3QgZmJfdmlkZW9tb2RlICopYnVmLCBpLApAQCAtNDA5LDEwICs0MDYsNyBA
QCBzdGF0aWMgc3NpemVfdCBzdG9yZV9mYnN0YXRlKHN0cnVjdCBkZXZpY2UgKmRldmljZSwKIAlz
dGF0ZSA9IHNpbXBsZV9zdHJ0b3VsKGJ1ZiwgJmxhc3QsIDApOwogCiAJY29uc29sZV9sb2NrKCk7
Ci0JaWYgKCFsb2NrX2ZiX2luZm8oZmJfaW5mbykpIHsKLQkJY29uc29sZV91bmxvY2soKTsKLQkJ
cmV0dXJuIC1FTk9ERVY7Ci0JfQorCWxvY2tfZmJfaW5mbyhmYl9pbmZvKTsKIAogCWZiX3NldF9z
dXNwZW5kKGZiX2luZm8sIChpbnQpc3RhdGUpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
