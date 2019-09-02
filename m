Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD4A54EF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D687289C28;
	Mon,  2 Sep 2019 11:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCABB89C2A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:32:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o184so14223472wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/DkPf5FMkkaEV/9e+/KRAcVqbG1QNA8dHLBfLowkK8=;
 b=LZ4zb42mqxWXp01veN7/I68BcrrDSP1mKec1zt4kcivHZ5rXoCpjsQBRXFjGynkZUV
 64KUPTP0j/Fkvlc2HOOQ620reY2czllceA35zZhDiZHyq9JMuXTKHippx86dLP/lvt6p
 QdaFxmP8Dh16y4S1/m7hBbIpWWZNAEcPrH4uZjgbTKS8rNxY7aSHFGKekE3bpwCq4SjO
 XAZnVY3cnBL2XvVgbhf8BsZ2rA0tkoINa4wt3a0hzDSthkW7J/lTPiczoBHjSTwJGg45
 zwSw10i1D5qPVoHlXfUYbKCK1yoFrRtJlXIeKNDvf7LLqEvxWFVsYh6F+KFAVZzGtdb+
 o+ig==
X-Gm-Message-State: APjAAAXG23Hq6w85dEyvGV0PANsm3jq6ILIQqRjtj8/WRIVNC9bOmoa4
 YcXtOeESviErLUjTBB2LMRWoj60V
X-Google-Smtp-Source: APXvYqxNQSUK2TyrcjNBFI/e/XhAj9h7ZDeqlBhdWAAn87P2KFgBAqTSE1UzDJJ+c/1ybhLX1C3prg==
X-Received: by 2002:a7b:cb0f:: with SMTP id u15mr33070835wmj.173.1567423920197; 
 Mon, 02 Sep 2019 04:32:00 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id b18sm18699042wro.34.2019.09.02.04.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/21] drm/dp: Enable alternate scrambler reset when
 supported
Date: Mon,  2 Sep 2019 13:31:17 +0200
Message-Id: <20190902113121.31323-18-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/DkPf5FMkkaEV/9e+/KRAcVqbG1QNA8dHLBfLowkK8=;
 b=cf2UWlOV1wQoGPN8Ve9HA1QJy5Vaoh3aheXrXO5fnphyK2PfOMLLn8tJrbQxPt/0vt
 nB7WzCIL10OUfQnqRZCqX4I4U5SZP/CXKifxSXXEf/R0/8XZWru9V8yrZESxzxpsBtPq
 H49Lit4oBtGIBO7Zcs/auIT+fJM6cLirRvs6iILT+r1a5Z+3oy6ZJZvg7N4mAPZcqxcW
 6HLQBUb6KoyXFmME/LEO6cr9Z4X2V9EPo6nbCsT1E+i4odx5CV9QGep5hzL7I+3z9943
 jKveZcikWz3tcruhO8CCrwG/mQ0wPDlQ4Oq7Y1eBHWS44UbAtoQ9ZTS8oZ3lRi8dZgGa
 /6Tw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBzaW5rIGlz
IGVEUCBhbmQgc3VwcG9ydHMgdGhlIGFsdGVybmF0ZSBzY3JhbWJsZXIgcmVzZXQsIGVuYWJsZQpp
dC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDcgKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmluZGV4IGY1MWE1
NTk1ZWJjMC4uODU5NTZmM2EyNGUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTUzOSw2
ICs1MzksMTMgQEAgaW50IGRybV9kcF9saW5rX2NvbmZpZ3VyZShzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCiAJaWYgKGVyciA8IDApCiAJCXJldHVybiBl
cnI7CiAKKwlpZiAobGluay0+Y2Fwcy5hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0KSB7CisJCWVy
ciA9IGRybV9kcF9kcGNkX3dyaXRlYihhdXgsIERQX0VEUF9DT05GSUdVUkFUSU9OX1NFVCwKKwkJ
CQkJIERQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfRU5BQkxFKTsKKwkJaWYgKGVyciA8IDAp
CisJCQlyZXR1cm4gZXJyOworCX0KKwogCXJldHVybiAwOwogfQogRVhQT1JUX1NZTUJPTChkcm1f
ZHBfbGlua19jb25maWd1cmUpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
