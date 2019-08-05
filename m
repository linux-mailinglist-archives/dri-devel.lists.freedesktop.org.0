Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2908148C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A74A6E30D;
	Mon,  5 Aug 2019 08:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0892C6E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:59:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p17so78639350ljg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 01:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XS8NSKoh+CguW/bz0NOSFtpL/Lk0LcQIGEWD1T1/JOM=;
 b=SJZUkPOJVG+IHw96S0LQiM6yHK4gD1iU3rTSqGv/3zCoVBFyiEQSqdAqRBEfm6AYqF
 o3hXFfMqLgOmfPdk6mNhQksJbaFNqK+3crZclY/AYjWdZgsgECpr7fQabiAno7+sma0U
 GWAeJ7J+QkVogeen6xVTMGvy3gFM1k1V3tcbcyMFHuU8+7nIBm4KyNekXGI6YeUrQ2YN
 v46oNAR+lmygtAfiqyDMUyr35GlU0PegIsauPmtvB0Y/RiguVJjwgH3X47Xt+IC2tIAU
 Wo+se1XQY6VC8n+n3+YtxLe7KwOMt1040kxYwrSOtifcWAkPB/zEplyfr3OZp0IxnIKK
 OHbQ==
X-Gm-Message-State: APjAAAXJwlopNGqWTbd1HHv3XRtkLGCO85ynwYlc4dQqf3ltLCo2DLit
 C6hw1gpCliZNIija1NFs3iBirQ==
X-Google-Smtp-Source: APXvYqyT7JCeHt1WLbylCyF2z+2x7MRYAh/2OgpnQbB7X9M0R32wIXpIVsQv++GkFVnlRjUJmLHDGA==
X-Received: by 2002:a2e:8495:: with SMTP id b21mr59894302ljh.149.1564995544322; 
 Mon, 05 Aug 2019 01:59:04 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id b20sm234500lfc.17.2019.08.05.01.59.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 01:59:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Daniel Tang <dt.tangr@gmail.com>,
	Fabian Vogt <fabian@ritter-vogt.de>
Subject: [PATCH 1/4 v2] drm/pl111: Support grayscale
Date: Mon,  5 Aug 2019 10:58:44 +0200
Message-Id: <20190805085847.25554-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805085847.25554-1-linus.walleij@linaro.org>
References: <20190805085847.25554-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XS8NSKoh+CguW/bz0NOSFtpL/Lk0LcQIGEWD1T1/JOM=;
 b=TaJN+q5ENJDArezn6ZlerbgxeGiw7w3OKzEjj/3FnWUanN6/R+IL+cMVEdjLJZxQKc
 gUp7dFwr2lelmvLY8MA1Lzkjc2rbXkWEz+2YndDZtEYMQ/DaEoT7EZpBFX/n19VW4Ie+
 +ILJrk4AS9SkeW0SDceOJ+UXb0dspph9y/Io5YiEXGInLxSVNs3dkanwW/qQkFRFI6vQ
 LdJYfz3GgDcxXLcNrfe7ZTBalXzR+8vwMik8VihO5yKajOM6Wssw5zBwiCnFgOnbYhpM
 9+oJB3B2qD5ftS/VSXFeBvX1RtXMbZK6Uy/ZexLrVVDZL5z0HYMh5Uevd5QNyBXYTPqQ
 pOJg==
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWlncmF0aW5nIHRoZSBUSSBuc3BpcmUgY2FsY3VsYXRvcnMgdG8gdXNlIHRoZSBQTDExMSBkcml2
ZXIgZm9yCmZyYW1lYnVmZmVyIHJlcXVpcmVzIGdyYXlzY2FsZSBzdXBwb3J0IGZvciB0aGUgZWxk
ZXIgcGFuZWwKd2hpY2ggdXNlcyA4Yml0IGdyYXlzY2FsZSBvbmx5LgoKRFJNIGRvZXMgbm90IHN1
cHBvcnQgOGJpdCBncmF5c2NhbGUgZnJhbWVidWZmZXJzIGluIG1lbW9yeSwKYnV0IGJ5IGRlZmlu
aW5nIHRoZSBidXMgZm9ybWF0IHRvIGJlIE1FRElBX0JVU19GTVRfWThfMVg4IHdlCmNhbiBnZXQg
dGhlIGhhcmR3YXJlIHRvIHR1cm4gb24gYSBncmF5c2NhbGluZyBmZWF0dXJlIGFuZApjb252ZXJ0
IHRoZSBSR0IgZnJhbWVidWZmZXIgdG8gZ3JheXNjYWxlIGZvciB1cy4KCkNjOiBEYW5pZWwgVGFu
ZyA8ZHQudGFuZ3JAZ21haWwuY29tPgpDYzogRmFiaWFuIFZvZ3QgPGZhYmlhbkByaXR0ZXItdm9n
dC5kZT4KVGVzdGVkLWJ5OiBGYWJpYW4gVm9ndCA8ZmFiaWFuQHJpdHRlci12b2d0LmRlPgpBY2tl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VMb2cgdjEtPnYy
OgotIE5vdyB0ZXN0ZWQKLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5j
IHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiBpbmNsdWRlL2xpbnV4L2FtYmEvY2xj
ZC1yZWdzLmggICAgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDEx
MV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jCmluZGV4
IDQ1MDE2NmQxNjdmNi4uMTc1MWZjYTZmNmY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cGwxMTEvcGwxMTFfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9k
aXNwbGF5LmMKQEAgLTEyNiw2ICsxMjYsNyBAQCBzdGF0aWMgdm9pZCBwbDExMV9kaXNwbGF5X2Vu
YWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIgPSBwbGFuZS0+c3RhdGUtPmZiOwogCXN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IgPSBwcml2LT5jb25uZWN0b3I7CiAJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSA9IHByaXYtPmJyaWRnZTsKKwlib29sIGdyYXlzY2FsZSA9IGZhbHNlOwogCXUzMiBjbnRsOwog
CXUzMiBwcGwsIGhzdywgaGZwLCBoYnA7CiAJdTMyIGxwcCwgdnN3LCB2ZnAsIHZicDsKQEAgLTE4
NSw2ICsxODYsMjAgQEAgc3RhdGljIHZvaWQgcGwxMTFfZGlzcGxheV9lbmFibGUoc3RydWN0IGRy
bV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQlpZiAoY29ubmVjdG9yLT5kaXNwbGF5X2lu
Zm8uYnVzX2ZsYWdzICYKIAkJICAgIERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX05FR0VER0Up
CiAJCQl0aW0yIHw9IFRJTTJfSVBDOworCisJCWlmIChjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5u
dW1fYnVzX2Zvcm1hdHMgPT0gMSAmJgorCQkgICAgY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnVz
X2Zvcm1hdHNbMF0gPT0KKwkJICAgIE1FRElBX0JVU19GTVRfWThfMVg4KQorCQkJZ3JheXNjYWxl
ID0gdHJ1ZTsKKworCQkvKgorCQkgKiBUaGUgQUMgcGluIGJpYXMgZnJlcXVlbmN5IGlzIHNldCB0
byBtYXggY291bnQgd2hlbiB1c2luZworCQkgKiBncmF5c2NhbGUgc28gYXQgbGVhc3Qgb25jZSBp
biBhIHdoaWxlIHdlIHdpbGwgcmV2ZXJzZQorCQkgKiBwb2xhcml0eSBhbmQgZ2V0IHJpZCBvZiBh
bnkgREMgYnVpbHQgdXAgdGhhdCBjb3VsZAorCQkgKiBkYW1hZ2UgdGhlIGRpc3BsYXkuCisJCSAq
LworCQlpZiAoZ3JheXNjYWxlKQorCQkJdGltMiB8PSBUSU0yX0FDQl9NQVNLOwogCX0KIAogCWlm
IChicmlkZ2UpIHsKQEAgLTIxNiw4ICsyMzEsMTggQEAgc3RhdGljIHZvaWQgcGwxMTFfZGlzcGxh
eV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCiAJd3JpdGVs
KDAsIHByaXYtPnJlZ3MgKyBDTENEX1RJTTMpOwogCi0JLyogSGFyZC1jb2RlIFRGVCBwYW5lbCAq
LwotCWNudGwgPSBDTlRMX0xDREVOIHwgQ05UTF9MQ0RURlQgfCBDTlRMX0xDRFZDT01QKDEpOwor
CS8qCisJICogRGV0ZWN0IGdyYXlzY2FsZSBidXMgZm9ybWF0LiBXZSBkbyBub3Qgc3VwcG9ydCBh
IGdyYXlzY2FsZSBtb2RlCisJICogdG93YXJkIHVzZXJzcGFjZSwgaW5zdGVhZCB3ZSBleHBvc2Ug
YW4gUkdCMjQgYnVmZmVyIGFuZCB0aGVuIHRoZQorCSAqIGhhcmR3YXJlIHdpbGwgYWN0aXZhdGUg
aXRzIGdyYXlzY2FsZXIgdG8gY29udmVydCB0byB0aGUgZ3JheXNjYWxlCisJICogZm9ybWF0Lgor
CSAqLworCWlmIChncmF5c2NhbGUpCisJCWNudGwgPSBDTlRMX0xDREVOIHwgQ05UTF9MQ0RNT05P
ODsKKwllbHNlCisJCS8qIEVsc2Ugd2UgYXNzdW1lIFRGVCBkaXNwbGF5ICovCisJCWNudGwgPSBD
TlRMX0xDREVOIHwgQ05UTF9MQ0RURlQgfCBDTlRMX0xDRFZDT01QKDEpOworCiAJLyogT24gdGhl
IFNUIE1pY3JvIHZhcmlhbnQsIGFzc3VtZSBhbGwgMjQgYml0cyBhcmUgY29ubmVjdGVkICovCiAJ
aWYgKHByaXYtPnZhcmlhbnQtPnN0X2JpdG11eF9jb250cm9sKQogCQljbnRsIHw9IENOVExfU1Rf
Q0RXSURfMjQ7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2FtYmEvY2xjZC1yZWdzLmggYi9p
bmNsdWRlL2xpbnV4L2FtYmEvY2xjZC1yZWdzLmgKaW5kZXggNTE2YTZmZGE4M2M1Li40MjFiMGZh
OTBkNmEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYW1iYS9jbGNkLXJlZ3MuaAorKysgYi9p
bmNsdWRlL2xpbnV4L2FtYmEvY2xjZC1yZWdzLmgKQEAgLTQyLDYgKzQyLDcgQEAKICNkZWZpbmUg
VElNMl9QQ0RfTE9fTUFTSwlHRU5NQVNLKDQsIDApCiAjZGVmaW5lIFRJTTJfUENEX0xPX0JJVFMJ
NQogI2RlZmluZSBUSU0yX0NMS1NFTAkJKDEgPDwgNSkKKyNkZWZpbmUgVElNMl9BQ0JfTUFTSwkJ
R0VOTUFTSygxMCwgNikKICNkZWZpbmUgVElNMl9JVlMJCSgxIDw8IDExKQogI2RlZmluZSBUSU0y
X0lIUwkJKDEgPDwgMTIpCiAjZGVmaW5lIFRJTTJfSVBDCQkoMSA8PCAxMykKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
