Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B538E6BD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880C86E905;
	Thu, 15 Aug 2019 08:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90186E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:46:11 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id y187so6679714vkf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 03:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
 b=jrOK1Vc0n3UMi96yqUGDBkgo/Zp7DkX6WqSvNp0PKh9uKkamSjVI36ufgNbTDQG/H/
 2qC4m3RmsaXyGC99wQOJ23KugQNhYxg3w9iZ0n/1NIeBHTiKFK//ZvT5Sv4jzC4XEDXN
 ysP0njufKmtYvmaU/7Bi+htjG+SA7iXbUlql2pTSscS5dbOI14QtFEU2qFn5xa+12K+6
 OEO0m8ndNmg1YqxwMWvhb5j+hcXRwyrwLTW3weHRwW/c96svSdjPIIuA9o2PLozjNyg/
 ZuBfy3S0PqrRR7L7NXDCKzFHBrTsUP4ZVugeWebtVFCe+nwv2LHt2nJMCrxKBBFVvYLD
 /tmw==
X-Gm-Message-State: APjAAAXuwN0Z8RLQKwFmR6NxsvwcI7eDcurI52Vcuzq6Lewg9BcPaT82
 72dQcnKgtNmNsJwuOOwXfHnCTNUztABWC8hE1+zJiTPMoM9YfQ2WJ7mYHEVM4qU6GsRlnQ0EFlO
 4DTUO3Z0QURK/8ypmwlAa+YFfElLNfFIYFjlvp59HYBnMaQF98G9ZoevXEG86pW998ebE4Fc0Ew
 ==
X-Google-Smtp-Source: APXvYqyoT5pUd+WeFrXBYZxNE0G3jZZLgp89mH7NfYSTWCCaTY8Y54tIFMMw/d4PPiauoCVTHqxHY+kI17c=
X-Received: by 2002:ac5:cdad:: with SMTP id l13mr9148123vka.30.1565779570656; 
 Wed, 14 Aug 2019 03:46:10 -0700 (PDT)
Date: Wed, 14 Aug 2019 12:45:05 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-8-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
 b=qHDnRpQM4FQsTdQ5gtW17elm8fjJAy+ftuSFwl3seP2A/RZCy3vUgZqi1oZvyDumPB
 0Ywwj7FkrvBNiaRh79/tLI+OvZ1GEIZxWGGGS11bToRsPclnktx5ydUOPcoV/ceGedU5
 j1ZohdoTULS7l4DG4E0oJIA8PGiv25MlfXgEXGINrCSWlIDU/utNRX87TiyQNzVxcfB0
 QITWLROiiBxsMYizA0WIK++f+g8MnJYRvv3JfrZGDFxRKujJdFUCdsBLjO+lvxPnlrbw
 oO2mtZwBbqa7HcAUnZBC8eE/ortohmS+Ysn//uZpJx0oFLxoJTSC4l28xIFknZMupCVu
 2tBQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyKCkgZnVuY3Rpb25zIHRv
Cih1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZp
bGwgaW4KdGhlIGNlY19jb25uZWN0b3JfaW5mby4KCkNoYW5nZXMgc2luY2UgdjQ6CgktIG9ubHkg
Y3JlYXRlIGEgQ0VDIG5vdGlmaWVyIGZvciBIRE1JIGNvbm5lY3RvcnMKClNpZ25lZC1vZmYtYnk6
IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+ClRlc3RlZC1ieTogSGFu
cyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL291dHB1dC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291
dHB1dC5jCmluZGV4IGJkY2FhNGM3MTY4Y2YuLjM0MzczNzM0ZmY2ODkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
b3V0cHV0LmMKQEAgLTcwLDYgKzcwLDExIEBAIHRlZ3JhX291dHB1dF9jb25uZWN0b3JfZGV0ZWN0
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCiAKIHZvaWQgdGVn
cmFfb3V0cHV0X2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCiB7CisJc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0ID0gY29ubmVjdG9yX3RvX291dHB1
dChjb25uZWN0b3IpOworCisJaWYgKG91dHB1dC0+Y2VjKQorCQljZWNfbm90aWZpZXJfY29ubl91
bnJlZ2lzdGVyKG91dHB1dC0+Y2VjKTsKKwogCWRybV9jb25uZWN0b3JfdW5yZWdpc3Rlcihjb25u
ZWN0b3IpOwogCWRybV9jb25uZWN0b3JfY2xlYW51cChjb25uZWN0b3IpOwogfQpAQCAtMTYzLDE4
ICsxNjgsMTEgQEAgaW50IHRlZ3JhX291dHB1dF9wcm9iZShzdHJ1Y3QgdGVncmFfb3V0cHV0ICpv
dXRwdXQpCiAJCWRpc2FibGVfaXJxKG91dHB1dC0+aHBkX2lycSk7CiAJfQogCi0Jb3V0cHV0LT5j
ZWMgPSBjZWNfbm90aWZpZXJfZ2V0KG91dHB1dC0+ZGV2KTsKLQlpZiAoIW91dHB1dC0+Y2VjKQot
CQlyZXR1cm4gLUVOT01FTTsKLQogCXJldHVybiAwOwogfQogCiB2b2lkIHRlZ3JhX291dHB1dF9y
ZW1vdmUoc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0KQogewotCWlmIChvdXRwdXQtPmNlYykK
LQkJY2VjX25vdGlmaWVyX3B1dChvdXRwdXQtPmNlYyk7Ci0KIAlpZiAob3V0cHV0LT5ocGRfZ3Bp
bykKIAkJZnJlZV9pcnEob3V0cHV0LT5ocGRfaXJxLCBvdXRwdXQpOwogCkBAIC0xODQsNiArMTgy
LDcgQEAgdm9pZCB0ZWdyYV9vdXRwdXRfcmVtb3ZlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1
dCkKIAogaW50IHRlZ3JhX291dHB1dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVj
dCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkKIHsKKwlpbnQgY29ubmVjdG9yX3R5cGU7CiAJaW50IGVy
cjsKIAogCWlmIChvdXRwdXQtPnBhbmVsKSB7CkBAIC0xOTksNiArMTk4LDIxIEBAIGludCB0ZWdy
YV9vdXRwdXRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgdGVncmFfb3V0cHV0
ICpvdXRwdXQpCiAJaWYgKG91dHB1dC0+aHBkX2dwaW8pCiAJCWVuYWJsZV9pcnEob3V0cHV0LT5o
cGRfaXJxKTsKIAorCWNvbm5lY3Rvcl90eXBlID0gb3V0cHV0LT5jb25uZWN0b3IuY29ubmVjdG9y
X3R5cGU7CisJLyoKKwkgKiBDcmVhdGUgYSBDRUMgbm90aWZpZXIgZm9yIEhETUkgY29ubmVjdG9y
LgorCSAqLworCWlmIChjb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEg
fHwKKwkgICAgY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlCKSB7CisJ
CXN0cnVjdCBjZWNfY29ubmVjdG9yX2luZm8gY29ubl9pbmZvOworCisJCWNlY19maWxsX2Nvbm5f
aW5mb19mcm9tX2RybSgmY29ubl9pbmZvLCAmb3V0cHV0LT5jb25uZWN0b3IpOworCQlvdXRwdXQt
PmNlYyA9IGNlY19ub3RpZmllcl9jb25uX3JlZ2lzdGVyKG91dHB1dC0+ZGV2LCBOVUxMLAorCQkJ
CQkJCSAmY29ubl9pbmZvKTsKKwkJaWYgKCFvdXRwdXQtPmNlYykKKwkJCXJldHVybiAtRU5PTUVN
OworCX0KKwogCXJldHVybiAwOwogfQogCi0tIAoyLjIzLjAucmMxLjE1My5nZGVlZDgwMzMwZi1n
b29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
