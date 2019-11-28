Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5390D10CBDB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9192889B3B;
	Thu, 28 Nov 2019 15:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48A89A32
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:37:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so7697122wmk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dNaoo3mI+xfZVrHcwdtziDtvG7sdJdHcDl5YU1IbCPI=;
 b=SvMkvqhfJeu/3qvtl2nshZ1xUGzOahFkCOYBJhWMnFEx/UH/g6PIz8g9xENQB9LzwF
 +7tB5BMAjlAO6tY/01tbw/W3RR1aktwWsCYIWiHiWtAJ+0oeiG0ji/AZG7n0W4Iy8IeB
 EwFoABqdN3b53dDBE9rkxx/l7AN6c5gAsrpXsQnsoo06hDRXPUpX7sipr5Dw9b5onGa1
 6d0EB+flIlVnxcQ/tgm4D5RPdN3mv0zU1KXVYAvFBpV793t5xTKe7MSehWPORdord35X
 nNazTt7zT1DUbDNtbYtO9WvSTvXxwao3dd5gA33olMq9+k+CxskQd/SvLgg5Q0FiPhxD
 kVsw==
X-Gm-Message-State: APjAAAXTaGr5l0hzNVLgoMGbC/K9YjmIMGGp6zkDMOJIUh97h6rPhS73
 VAhJGRQo4Qy7P5pdZ2ImwbY=
X-Google-Smtp-Source: APXvYqzoiFXF+tYKLyY+hdee6OAJkYHDs/CjucImZ7iJ1DslaZ2xMNDMpFVD7kmM4nZlKtPsYeO6fw==
X-Received: by 2002:a1c:4e1a:: with SMTP id g26mr10460607wmh.138.1574955467207; 
 Thu, 28 Nov 2019 07:37:47 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id a3sm1323242wmh.5.2019.11.28.07.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:46 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/9] drm/tegra: gem: Properly pin imported buffers
Date: Thu, 28 Nov 2019 16:37:34 +0100
Message-Id: <20191128153741.2380419-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dNaoo3mI+xfZVrHcwdtziDtvG7sdJdHcDl5YU1IbCPI=;
 b=A02Ea3PDZO6vcgy0N6CnvrNeKVCYmC8EdeKZvajIZfa2c6r+VRck/zUsN5UwHpSuRM
 X7kx5yVWo3NcbuDOVOT9xjkUoae6pXA0AUpUyJPM2K7JEiM08ZmpqnOjIV9LHdWauIs9
 vrK0hP2mbyQ+Xaz5I0RGa0L/aYEMWoBqcUDXknB4wJN6J5G3xJLlpT9i9HRTpPF0Bl/o
 bPqsjM29bzR0hfJoqgF4Rpd2EjWUm06ai/Rb+hocVj8fUpotxuEL2jM5a0zbbMfY9EI1
 9Npvr+rAgeuIooH+BXmOWoKNfFzjKJez05QTGBrq33SjFc2GIw9Sqr10j21U1XbjInOP
 peoQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkJ1ZmZlcnMgdGhhdCBh
cmUgaW1wb3J0ZWQgZnJvbSBhIERNQS1CVUYgZG9uJ3QgaGF2ZSBwYWdlcyBhbGxvY2F0ZWQgd2l0
aAp0aGVtLiBBdCB0aGUgc2FtZSB0aW1lIGFuIFNHIHRhYmxlIGZvciB0aGVtIGNhbid0IGJlIGRl
cml2ZWQgdXNpbmcgdGhlCkRNQSBBUEkgaGVscGVycyBiZWNhdXNlIHRoZSBuZWNlc3NhcnkgaW5m
b3JtYXRpb24gZG9lc24ndCBleGlzdC4gSG93ZXZlcgp0aGVyZSdzIGFscmVhZHkgYW4gU0cgdGFi
bGUgdGhhdCB3YXMgY3JlYXRlZCBkdXJpbmcgaW1wb3J0LCBzbyB0aGlzIGNhbgpzaW1wbHkgYmUg
ZHVwbGljYXRlZC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jIHwgNDMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZ2VtLmMKaW5kZXggNzQ2ZGFlMzJjNDg0Li42ZGZhZDU2ZWVlMmIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZ2VtLmMKQEAgLTI3LDYgKzI3LDI5IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX2JvX3B1dChz
dHJ1Y3QgaG9zdDF4X2JvICpibykKIAlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoJm9iai0+
Z2VtKTsKIH0KIAorLyogWFhYIG1vdmUgdGhpcyBpbnRvIGxpYi9zY2F0dGVybGlzdC5jPyAqLwor
c3RhdGljIGludCBzZ19hbGxvY190YWJsZV9mcm9tX3NnKHN0cnVjdCBzZ190YWJsZSAqc2d0LCBz
dHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLAorCQkJCSAgdW5zaWduZWQgaW50IG5lbnRzLCBnZnBfdCBn
ZnBfbWFzaykKK3sKKwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKmRzdDsKKwl1bnNpZ25lZCBpbnQgaTsK
KwlpbnQgZXJyOworCisJZXJyID0gc2dfYWxsb2NfdGFibGUoc2d0LCBuZW50cywgZ2ZwX21hc2sp
OworCWlmIChlcnIgPCAwKQorCQlyZXR1cm4gZXJyOworCisJZHN0ID0gc2d0LT5zZ2w7CisKKwlm
b3IgKGkgPSAwOyBpIDwgbmVudHM7IGkrKykgeworCQlzZ19zZXRfcGFnZShkc3QsIHNnX3BhZ2Uo
c2cpLCBzZy0+bGVuZ3RoLCAwKTsKKwkJZHN0ID0gc2dfbmV4dChkc3QpOworCQlzZyA9IHNnX25l
eHQoc2cpOworCX0KKworCXJldHVybiAwOworfQorCiBzdGF0aWMgc3RydWN0IHNnX3RhYmxlICp0
ZWdyYV9ib19waW4oc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgaG9zdDF4X2JvICpibywKIAkJ
CQkgICAgIGRtYV9hZGRyX3QgKnBoeXMpCiB7CkBAIC01MiwxMSArNzUsMzEgQEAgc3RhdGljIHN0
cnVjdCBzZ190YWJsZSAqdGVncmFfYm9fcGluKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGhv
c3QxeF9ibyAqYm8sCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCiAJaWYgKG9iai0+cGFn
ZXMpIHsKKwkJLyoKKwkJICogSWYgdGhlIGJ1ZmZlciBvYmplY3Qgd2FzIGFsbG9jYXRlZCBmcm9t
IHRoZSBleHBsaWNpdCBJT01NVQorCQkgKiBBUEkgY29kZSBwYXRocywgY29uc3RydWN0IGFuIFNH
IHRhYmxlIGZyb20gdGhlIHBhZ2VzLgorCQkgKi8KIAkJZXJyID0gc2dfYWxsb2NfdGFibGVfZnJv
bV9wYWdlcyhzZ3QsIG9iai0+cGFnZXMsIG9iai0+bnVtX3BhZ2VzLAogCQkJCQkJMCwgb2JqLT5n
ZW0uc2l6ZSwgR0ZQX0tFUk5FTCk7CiAJCWlmIChlcnIgPCAwKQogCQkJZ290byBmcmVlOworCX0g
ZWxzZSBpZiAob2JqLT5zZ3QpIHsKKwkJLyoKKwkJICogSWYgdGhlIGJ1ZmZlciBvYmplY3QgYWxy
ZWFkeSBoYXMgYW4gU0cgdGFibGUgYnV0IG5vIHBhZ2VzCisJCSAqIHdlcmUgYWxsb2NhdGVkIGZv
ciBpdCwgaXQgbWVhbnMgdGhlIGJ1ZmZlciB3YXMgaW1wb3J0ZWQgYW5kCisJCSAqIHRoZSBTRyB0
YWJsZSBuZWVkcyB0byBiZSBjb3BpZWQgdG8gYXZvaWQgb3ZlcndyaXRpbmcgYW55CisJCSAqIG90
aGVyIHBvdGVudGlhbCB1c2VycyBvZiB0aGUgb3JpZ2luYWwgU0cgdGFibGUuCisJCSAqLworCQll
cnIgPSBzZ19hbGxvY190YWJsZV9mcm9tX3NnKHNndCwgb2JqLT5zZ3QtPnNnbCwgb2JqLT5zZ3Qt
Pm5lbnRzLAorCQkJCQkgICAgIEdGUF9LRVJORUwpOworCQlpZiAoZXJyIDwgMCkKKwkJCWdvdG8g
ZnJlZTsKIAl9IGVsc2UgeworCQkvKgorCQkgKiBJZiB0aGUgYnVmZmVyIG9iamVjdCBoYWQgbm8g
cGFnZXMgYWxsb2NhdGVkIGFuZCBpZiBpdCB3YXMKKwkJICogbm90IGltcG9ydGVkLCBpdCBoYWQg
dG8gYmUgYWxsb2NhdGVkIHdpdGggdGhlIERNQSBBUEksIHNvCisJCSAqIHRoZSBETUEgQVBJIGhl
bHBlciBjYW4gYmUgdXNlZC4KKwkJICovCiAJCWVyciA9IGRtYV9nZXRfc2d0YWJsZShkZXYsIHNn
dCwgb2JqLT52YWRkciwgb2JqLT5pb3ZhLAogCQkJCSAgICAgIG9iai0+Z2VtLnNpemUpOwogCQlp
ZiAoZXJyIDwgMCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
