Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BAA116CBF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAAC6E434;
	Mon,  9 Dec 2019 12:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCF16E41A;
 Mon,  9 Dec 2019 12:00:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d16so15846988wre.10;
 Mon, 09 Dec 2019 04:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
 b=rs99OgYA22gtlOmzNzBZyyHWY64nX+e8i3kqZ96MO6uW2ZBov9IpK9MA67lD1AjGst
 ZW/G0U4Amml2h4Vz1HEuLj/xywHC/ZdzzVuPm9qQ5LzRYx+AFDWmHyHnXuoEXBeI/SVs
 bJ3BSQp21oJNgv3K9ZRBritGoT3arbrT2i8PiM6HJaP5bqf7Oz5acwt7uoTRVIu+v51i
 AySvtK6F2t4OWzBpGrp3eX2AoNKdSzsnAa7DQ8Oj2i5JGndrHK6z24jtVNE1n1XzVej4
 atmJ6MYWILiDjRfJmQiSJ7Pp24FDNm9Pf5Nx5vE9/b2k+mfRSqxbuCzv+xBa4HXMZkQt
 GoCw==
X-Gm-Message-State: APjAAAXX6JjR19KZHK50s1FPGSeq71qLH6UKlGMGqnmBm+WHvmJr8VY0
 9x7FNpY4AsIa9qZOCFp3JUM=
X-Google-Smtp-Source: APXvYqz6AD9TbeO2U0q7ZW37gBJWPpvXTESxowBlxDJqhVrWpyoFbwFU1U8Obp2WvpV1pHnwNC7u2w==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr1726974wrs.330.1575892819756; 
 Mon, 09 Dec 2019 04:00:19 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id l17sm26821557wro.77.2019.12.09.04.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:00:18 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v3 6/9] drm/nouveau: tegra: Set clock rate if not set
Date: Mon,  9 Dec 2019 13:00:02 +0100
Message-Id: <20191209120005.2254786-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
 b=E8zburFTQFbyXTDRWkkvQMSz5JNfUifO6kw1FDbBuBwPKbzpbbw/fKkOr9jz3xU9Ej
 LcipXvsmVU9ZQ6KmHbbJzmjImuxsTMD6Kr0VgCsiXmlt59hBMCzZyoNPWpgBJtu+AcvV
 YwzcQI8m0jrqljc12UDr9iVDSYqJJU0y7Eyb2jRQ+aPh7F5frcKJXHnP5vLprMHgXQJR
 q0cYYx7n5643QUY57xo0OqvwYKbKTJDELa4EsbU9j8B0KgHSBXyWe8jZvXfqKQPI4F6i
 Swo6xinD0cSmQO4g9qf/yBdC5dOr8PxVzt6G8NbnOcD2xiCNgkk1HrNBSpxQol3wZhmX
 KwsA==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBHUFUgY2xv
Y2sgaGFzIG5vdCBoYWQgYSByYXRlIHNldCwgaW5pdGlhbGl6ZSBpdCB0byB0aGUgbWF4aW11bQpj
bG9jayByYXRlIHRvIG1ha2Ugc3VyZSBpdCBkb2VzIHJ1bi4KClNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwppbmRleCA3NDdhNzc1MTIxY2YuLmQwZDUyYzFk
NGFlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2
aWNlL3RlZ3JhLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2
aWNlL3RlZ3JhLmMKQEAgLTI3OSw2ICsyNzksNyBAQCBudmttX2RldmljZV90ZWdyYV9uZXcoY29u
c3Qgc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhX2Z1bmMgKmZ1bmMsCiAJCSAgICAgIHN0cnVjdCBu
dmttX2RldmljZSAqKnBkZXZpY2UpCiB7CiAJc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhICp0ZGV2
OworCXVuc2lnbmVkIGxvbmcgcmF0ZTsKIAlpbnQgcmV0OwogCiAJaWYgKCEodGRldiA9IGt6YWxs
b2Moc2l6ZW9mKCp0ZGV2KSwgR0ZQX0tFUk5FTCkpKQpAQCAtMzA3LDYgKzMwOCwxNyBAQCBudmtt
X2RldmljZV90ZWdyYV9uZXcoY29uc3Qgc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhX2Z1bmMgKmZ1
bmMsCiAJCWdvdG8gZnJlZTsKIAl9CiAKKwlyYXRlID0gY2xrX2dldF9yYXRlKHRkZXYtPmNsayk7
CisJaWYgKHJhdGUgPT0gMCkgeworCQlyZXQgPSBjbGtfc2V0X3JhdGUodGRldi0+Y2xrLCBVTE9O
R19NQVgpOworCQlpZiAocmV0IDwgMCkKKwkJCWdvdG8gZnJlZTsKKworCQlyYXRlID0gY2xrX2dl
dF9yYXRlKHRkZXYtPmNsayk7CisKKwkJZGV2X2RiZygmcGRldi0+ZGV2LCAiR1BVIGNsb2NrIHNl
dCB0byAlbHVcbiIsIHJhdGUpOworCX0KKwogCWlmIChmdW5jLT5yZXF1aXJlX3JlZl9jbGspCiAJ
CXRkZXYtPmNsa19yZWYgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgInJlZiIpOwogCWlmIChJ
U19FUlIodGRldi0+Y2xrX3JlZikpIHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
