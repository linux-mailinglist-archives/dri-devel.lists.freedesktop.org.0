Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9F101ADC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D69A6EB8B;
	Tue, 19 Nov 2019 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A186E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m4so15494155ljj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3B7+0SNFIwKYfZnWg59M6CobeLtFL0LQksvAiCdlsLo=;
 b=i0eFnCI+ShVLa+AOn4rpufaids1QTnDSa+HY0cBRVenPkIaXTUVpF01s8+cuAWEoCQ
 qxBWtRAV6RopqxwOFgwj8dkoW9POIZo7fFGXWIvnqhO6GJquCP5E8BT9VgErEKD9WfDP
 qZU6IDc9UrwS4xuuPL9mK1msS2Wd5NGA9w1baMacJFhh7RKe+lxV3C9gqjGSxNjkDlSb
 NfCsrIrbVQ4+pVm4nMjoGQUoTZlfotY6onPWGiGYFx8Nc2UgQoVdjOhL5CCmAK4E0DJG
 q8adTVMA4+U/bxdwlcOafX9Ag/vUnGKcszu5W9/oPlNLaTmf05lfgLHBtf9lawM2zTer
 sUWw==
X-Gm-Message-State: APjAAAWFFYZ65cts/2+/qyn3QCKnJBc2iTb747tz6glwyDa9IUI2Chzw
 JVWNdjP55sx2muLyrQe3vo4=
X-Google-Smtp-Source: APXvYqw4Kk/DTPpOdb5NICSC77dWA+HpTh1Lw/70XFfbsOeRC7m2vVYJpp6tyFd+HjiY4uZyb2RFPQ==
X-Received: by 2002:a2e:921a:: with SMTP id k26mr944738ljg.238.1574107540692; 
 Mon, 18 Nov 2019 12:05:40 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 10/29] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Mon, 18 Nov 2019 23:02:28 +0300
Message-Id: <20191118200247.3567-11-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3B7+0SNFIwKYfZnWg59M6CobeLtFL0LQksvAiCdlsLo=;
 b=GvfAMBwjwdcJwcfQkg3EYPixn7Fn9xRg5dcSxz41GPIA2pK3Lsv7ue0FOHHWASXzbR
 c8HdPA2WivTVy97ItI39CUEvrHkYTM2BFLLyihqmmzzYjmW7+8PNBFZpf8e5YJ33+QNj
 pg84s/xcDSukyKnuAui1kYlt6oAvk8L2dRImj4FI1leqMK91gJSnKs3urCrms5d6GrbD
 OnBPvMLZP8Hk5f50CVL3KPjPFnsEv+sL9Qc8Dr28XcoHvwEZFlclJr34gcg+fX2PoDCY
 /caJfWEf3TlFkSFovaSf7dqk9AZkEPVI4yVSiTdaCJxtGhJDZv2Fk6rWTCV8AAUkPLif
 a1ag==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGludGVyY29ubmVjdCBwcm9wZXJ0aWVzIHRvIHRoZSBtZW1vcnkgY29udHJvbGxlciwgZXh0
ZXJuYWwgbWVtb3J5CmNvbnRyb2xsZXIgYW5kIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgbm9kZXMg
dG8gZGVzY3JpYmUgaW50ZXJjb25uZWN0aW9uCm9mIHRoZXNlIG5vZGVzLgoKU2lnbmVkLW9mZi1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3RlZ3JhMzAuZHRzaSB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy90ZWdyYTMwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLmR0c2kKaW5kZXggNTVh
ZTA1MDA0MmNlLi42OWEyMzlmMWE4MjMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Rl
Z3JhMzAuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLmR0c2kKQEAgLTMsNiAr
Myw3IEBACiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby90ZWdyYS1ncGlvLmg+CiAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvbWVtb3J5L3RlZ3JhMzAtbWMuaD4KICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9waW5jdHJsL3BpbmN0cmwtdGVncmEuaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcmNv
bm5lY3QvdGVncmEtaWNjLmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvYXJtLWdpYy5oPgogCiAvIHsKQEAgLTIwNyw2ICsyMDgsOSBAQAogCiAJCQludmlkaWEs
aGVhZCA9IDwwPjsKIAorCQkJaW50ZXJjb25uZWN0cyA9IDwmbWMgVEVHUkFfSUNDX01DX0RDICZl
bWMgVEVHUkFfSUNDX0VNRU0+OworCQkJaW50ZXJjb25uZWN0LW5hbWVzID0gImRtYS1tZW0iOwor
CiAJCQlyZ2IgewogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQl9OwpAQCAtMjI2LDYgKzIz
MCw5IEBACiAKIAkJCW52aWRpYSxoZWFkID0gPDE+OwogCisJCQlpbnRlcmNvbm5lY3RzID0gPCZt
YyBURUdSQV9JQ0NfTUNfRENCICZlbWMgVEVHUkFfSUNDX0VNRU0+OworCQkJaW50ZXJjb25uZWN0
LW5hbWVzID0gImRtYS1tZW0iOworCiAJCQlyZ2IgewogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CiAJCQl9OwpAQCAtNzMxLDE1ICs3MzgsMTggQEAKIAogCQkjaW9tbXUtY2VsbHMgPSA8MT47CiAJ
CSNyZXNldC1jZWxscyA9IDwxPjsKKwkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwxPjsKIAl9Owog
Ci0JbWVtb3J5LWNvbnRyb2xsZXJANzAwMGY0MDAgeworCWVtYzogbWVtb3J5LWNvbnRyb2xsZXJA
NzAwMGY0MDAgewogCQljb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTMwLWVtYyI7CiAJCXJlZyA9
IDwweDcwMDBmNDAwIDB4NDAwPjsKIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDc4IElSUV9UWVBF
X0xFVkVMX0hJR0g+OwogCQljbG9ja3MgPSA8JnRlZ3JhX2NhciBURUdSQTMwX0NMS19FTUM+Owog
CiAJCW52aWRpYSxtZW1vcnktY29udHJvbGxlciA9IDwmbWM+OworCisJCSNpbnRlcmNvbm5lY3Qt
Y2VsbHMgPSA8MT47CiAJfTsKIAogCWZ1c2VANzAwMGY4MDAgewotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
