Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC52AE455
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C6089D5C;
	Tue, 10 Nov 2020 23:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CC189D5C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:47:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l2so689308lfk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZwpBjCKFkPFg4D+5kgmDyInAjRNL4hw/D5g9alUegs=;
 b=Ois9Ru3JLPsyJ899x+z10htmSkwf6Ku6x2+jtneNn/D8cLDHx5Uz2jl1BNQ/M/HKXU
 T3fAd+t0cE8Ao1I73wOHHT/x/mpk0A93IPjf7mCcsyGHdKZRpBWFUf2GMLvA+RYJMBx0
 IKXzMXbrzOpC8GSyLxccCbgjeAnTmWGED935igkBFuP2wYNadB2/rHpc/2yAN1mLIH2Q
 hjnB3khYHaEXeayRKJWwtaaY4fmsHU2Ae4lDGm5+OnxYii7AEsCcRO5JW+/L3+ZH1UQF
 w9BaWuhLYMrsQ4h2VnQddNVs130Nbpd/ywjqEJOxH5p8dMoJQMTO2IHXUYxFaTrXYNBe
 Z32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZwpBjCKFkPFg4D+5kgmDyInAjRNL4hw/D5g9alUegs=;
 b=AB4WV+oDDhzgH4h8BCrNWvAfVpWbhO5eDYW0O+j4Z2gIG/GCQePlmf8Ovm9otwMEkb
 nanilejOUrJHoVS2u/C8yex1D2ohs7L6HTwTIcppjkZP44sZQUL0oJqfUHXik6EVHxfH
 f4+Gjjmht4c+7QuFl3fgVFaHLEusdvRz9Pqf/vnP/nQvetdlc0I6eT0/DbSVRH+4iw2B
 b7jjy8oxsnX1zld61iK03K702zl5vE1aQ5OD+ymDi6nyDjAS+wjALprxFMc3lroJH8+O
 /PcERLBJGxGHdpiYp2mXWqKSmfABKJCyZ24JnITBVbW5NMXqYAO32Q2PFXTNG6E+3Yu+
 wvig==
X-Gm-Message-State: AOAM532z/XlRi2WD8EVED++xQHnI1ibYey2eFPVz75pypw5L0uB+RK8O
 QusJXChFO19RU3xuolqxSUf0mA==
X-Google-Smtp-Source: ABdhPJxrIf45hk096T37XeKGU/4ge9gAffDTeWkM91ls8F9VWtneZ3CE1oS00zLtaQ8ivc3Z/JmB/A==
X-Received: by 2002:a19:5052:: with SMTP id z18mr8104346lfj.574.1605052021569; 
 Tue, 10 Nov 2020 15:47:01 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y65sm39883lff.73.2020.11.10.15.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 15:47:00 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 2/5] drm/panel: s6e63m0: Implement reading from panel
Date: Wed, 11 Nov 2020 00:46:50 +0100
Message-Id: <20201110234653.2248594-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110234653.2248594-1-linus.walleij@linaro.org>
References: <20201110234653.2248594-1-linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb2RlIHdhcyBmb3VuZCBpbiB0aGUgU2Ftc3VuZyB2ZW5kb3IgdHJlZSBmb3IgdGhlClNh
bXN1bmcgR1QtSTkwNzAgbW9iaWxlIHBob25lLiBMZXQncyBzdXBwb3J0IHJlYWRpbmcgYmVmb3Jl
CndlIGltcGxlbWVudCB0aGUgM1dJUkUgcHJvdG9jb2wgZm9yIGJvdGggcmVhZGluZyBhbmQKd3Jp
dGluZy4KCkNjOiBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5AZ2VyaG9sZC5uZXQ+CkNjOiBQYXdl
xYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiAuLi4vZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAtc3BpLmMgfCAxOSArKysrKysrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLXNw
aS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYwpp
bmRleCA3NWYwMGVkNDgxMGIuLjllMTU1MmE3Y2NjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLXNwaS5jCkBAIC0xMywxMyArMTMsMjAgQEAK
IAogc3RhdGljIGludCBzNmU2M20wX3NwaV9kY3NfcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNv
bnN0IHU4IGNtZCwgdTggKmRhdGEpCiB7Ci0JLyoKLQkgKiBGSVhNRTogaW1wbGVtZW50IHJlYWRp
bmcgRENTIGNvbW1hbmRzIG92ZXIgU1BJIHNvIHdlIGNhbgotCSAqIHByb3Blcmx5IGlkZW50aWZ5
IHdoaWNoIHBoeXNpY2FsIHBhbmVsIGlzIGNvbm5lY3RlZC4KLQkgKi8KLQkqZGF0YSA9IDA7CisJ
c3RydWN0IHNwaV9kZXZpY2UgKnNwaSA9IHRvX3NwaV9kZXZpY2UoZGV2KTsKKwl1MTYgYnVmWzFd
OworCXUxNiByYnVmWzFdOworCWludCByZXQ7CiAKLQlyZXR1cm4gMDsKKwkvKiBTUEkgYnVmZmVy
cyBhcmUgYWx3YXlzIGluIENQVSBvcmRlciAqLworCWJ1ZlswXSA9ICh1MTYpIGNtZDsKKwlyZXQg
PSBzcGlfd3JpdGVfdGhlbl9yZWFkKHNwaSwgYnVmLCAyLCByYnVmLCAyKTsKKwlkZXZfZGJnKGRl
diwgIlJFQUQgQ01EOiAlMDR4IFJFVDogJTA0eFxuIiwgYnVmWzBdLCByYnVmWzBdKTsKKwlpZiAo
IXJldCkKKwkJLyogVGhlc2UgaGlnaCA4IGJpdHMgb2YgdGhlIDkgY29udGFpbnMgdGhlIHJlYWRv
dXQgKi8KKwkJKmRhdGEgPSAocmJ1ZlswXSAmIDB4MWZmKSA+PiAxOworCisJcmV0dXJuIHJldDsK
IH0KIAogc3RhdGljIGludCBzNmU2M20wX3NwaV93cml0ZV93b3JkKHN0cnVjdCBkZXZpY2UgKmRl
diwgdTE2IGRhdGEpCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
