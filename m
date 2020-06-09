Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB81F4F06
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6299389E7B;
	Wed, 10 Jun 2020 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7146E2D5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 9so24989331ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaLwBgEJHAnRll2My7iiWFVAnwuWkHTJFbXmtwzd9MY=;
 b=aC4glVDhDS6ajEjF584IuzsxAMYQt4toyxqZK52jEcvULo8RhpSOxNphdBVi8P4OLv
 DLLzp/QJx/rbgkC6qG1/ST9kv+T/ES4KUlqW2rPtOO0Wph6Hs0Z1qgNv0uIgYfPZyEQI
 llyWxvYfnUXdL6kWcoCuZ/oZ4mbaCS7kAtLPhwpKjUcOfRUx/4ITmOaJcOV6P2sDgKD1
 iU/pzZsNOp5pZLqWuj4uY2KzElystLbeKXihgwOOzUnCcTr5/E5sjMPqhFPjtwPOwYxv
 SylCskYpcyi9T2zgRF0lQBRLmg5udBC3dmOTS4p3B+WxlFyFBszPy/gE4DMm2ero/0pK
 9nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaLwBgEJHAnRll2My7iiWFVAnwuWkHTJFbXmtwzd9MY=;
 b=VTVQypCSEHlT2/IyBKVrb4RQ7QSmYJ2rjC3vJK7am7PM3fV1R4Ye0pOVgUtDeEHUEk
 4JuntAxQj6wS0SK/yP4l+hO8YDpYxBQpz6TTO2pB9tyhzEjs8wp944UpJ9NMBsOimQP3
 soZyPPaD4U+403L94WHndc6HamF8FFvwg+iSBK7RTrRTt98oCikbr6M5/tfWEcqXoKBE
 Q/MKS7v+gDKcN0miQCxFtF9olTVz7yusKaLZJMTnoihcwgmP6y42I83AcHRg35w2Gpaw
 WOWcId01fuoigE2OOc52H0T92N+fyDwRmw9jtlWsW0dP9MJgHwd/iCQaUszsbPurAEED
 ZgOQ==
X-Gm-Message-State: AOAM530lV0gf/j5yTgcSJWOmisRQXzMMJy9+DzwxbSAwL+JcJCRUVDmg
 BrzKkqt9usNgvl4oeBlTY+8=
X-Google-Smtp-Source: ABdhPJwqzjarfix9XEE4prNh4Lc0nEjZ80Nvozu6vayHIphT+WuI7ooDdLSLgKJLy9OUPp/ATKnKnA==
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr13086844ljm.90.1591708498010; 
 Tue, 09 Jun 2020 06:14:58 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 27/37] interconnect: Relax requirement in
 of_icc_get_from_provider()
Date: Tue,  9 Jun 2020 16:13:54 +0300
Message-Id: <20200609131404.17523-28-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgoKVGhpcyBwYXRjaCBy
ZWxheGVzIHRoZSBjb25kaXRpb24gaW4gb2ZfaWNjX2dldF9mcm9tX3Byb3ZpZGVyKCkgc28gdGhh
dCBpdAppcyBubyBsb25nZXIgcmVxdWlyZWQgdG8gc2V0ICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8
MT4gaW4gdGhlIERULiBJbiBjYXNlCm9mIHRoZSBkZXZmcmVxIGRyaXZlciBmb3IgZXh5bm9zLWJ1
cywgI2ludGVyY29ubmVjdC1jZWxscyBpcyBhbHdheXMgemVyby4KClNpZ25lZC1vZmYtYnk6IEFy
dHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KW2RpZ2V0eEBnbWFpbC5jb206IGFk
ZGVkIGNlbGxzX251bSBjaGVja2luZyBmb3Igb2ZfaWNjX3hsYXRlX29uZWNlbGwoKV0KU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
aW50ZXJjb25uZWN0L2NvcmUuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW50ZXJj
b25uZWN0L2NvcmUuYyBiL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYwppbmRleCBlNWY5OTg3
NDQ1MDEuLmNiMTQzNDIxY2E2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29y
ZS5jCisrKyBiL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYwpAQCAtMzM5LDcgKzMzOSw3IEBA
IHN0YXRpYyBzdHJ1Y3QgaWNjX25vZGUgKm9mX2ljY19nZXRfZnJvbV9wcm92aWRlcihzdHJ1Y3Qg
b2ZfcGhhbmRsZV9hcmdzICpzcGVjKQogCXN0cnVjdCBpY2Nfbm9kZSAqbm9kZSA9IEVSUl9QVFIo
LUVQUk9CRV9ERUZFUik7CiAJc3RydWN0IGljY19wcm92aWRlciAqcHJvdmlkZXI7CiAKLQlpZiAo
IXNwZWMgfHwgc3BlYy0+YXJnc19jb3VudCAhPSAxKQorCWlmICghc3BlYykKIAkJcmV0dXJuIEVS
Ul9QVFIoLUVJTlZBTCk7CiAKIAltdXRleF9sb2NrKCZpY2NfbG9jayk7CkBAIC05NjcsNiArOTY3
LDE1IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGljY19ub2Rlc19yZW1vdmUpOwogICovCiBpbnQgaWNj
X3Byb3ZpZGVyX2FkZChzdHJ1Y3QgaWNjX3Byb3ZpZGVyICpwcm92aWRlcikKIHsKKwlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wID0gcHJvdmlkZXItPmRldi0+b2Zfbm9kZTsKKwl1MzIgY2VsbHNfbnVt
OworCWludCBlcnI7CisKKwllcnIgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgIiNpbnRlcmNv
bm5lY3QtY2VsbHMiLCAmY2VsbHNfbnVtKTsKKwlpZiAoV0FSTl9PTihlcnIpKQorCQlyZXR1cm4g
ZXJyOworCWlmIChXQVJOX09OKHByb3ZpZGVyLT54bGF0ZSA9PSBvZl9pY2NfeGxhdGVfb25lY2Vs
bCAmJiBjZWxsc19udW0gIT0gMSkpCisJCXJldHVybiAtRUlOVkFMOwogCWlmIChXQVJOX09OKCFw
cm92aWRlci0+c2V0KSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAJaWYgKFdBUk5fT04oIXByb3ZpZGVy
LT54bGF0ZSkpCi0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
