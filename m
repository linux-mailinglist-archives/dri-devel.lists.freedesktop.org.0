Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D166C8192D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FA66E42F;
	Mon,  5 Aug 2019 12:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EE86E42F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:15 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s49so43653534edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsPOMRtTr+lM0WoCNjTwi27pzy0ZGcTeVaoicLp14s8=;
 b=fggLa3XeG1v7VkGORXhnpolVnePqyvERXOQKoYaOZBFH4KpSEfb/iZyOzlOtJTzmfu
 ZsD+KbtxhXU4iaJnDlia7b7m+ZHsj6ZDpMMYRFnu8d5L0GP/ezhgHJ+mU14cExA/mhcf
 dmpswiDDn5Y/gjC399nB3YbWN97RRdyYhOLvafJUoB/X3ncdlhuiYf9iQuMtz4LFkCrI
 gdFQBcj9Dxt+ZfPyJeAyMKkOrV/LHcMRzwMd5fKYElpagZUvd2pLhAyWP3DYOWjVkFiO
 hYBydjtsZSeyyxP6UuwBwOJhmj0nIMUOWvpH31CZKLPcMSltTeSEgcdg/EWSrC0JSHuw
 2V3Q==
X-Gm-Message-State: APjAAAV4ZBH9SM4JZFvztQRpYnO46vovUD1D9MWGb82ZGdSilKCnLZBH
 L4145t6nABZ75TLpYqXQTHD7bPA/
X-Google-Smtp-Source: APXvYqwQT+52l5t6LerfLZjrAfN/0s1t1kjgCaOGAqe9g84Wm+hThLJUm8i/i+Nm8dUnSzKIOlAOhw==
X-Received: by 2002:a17:906:724a:: with SMTP id
 n10mr24193585ejk.54.1565007853548; 
 Mon, 05 Aug 2019 05:24:13 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id e21sm14138980eje.55.2019.08.05.05.24.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/21] drm/dp: Set channel coding on link configuration
Date: Mon,  5 Aug 2019 14:23:45 +0200
Message-Id: <20190805122350.8838-16-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rsPOMRtTr+lM0WoCNjTwi27pzy0ZGcTeVaoicLp14s8=;
 b=srEmaYWpolh0g6qGlwRgceeSTAfISD4PJ5fBVHjecFH0FH4P/HUGkd2a3Pt/xam960
 NYO/dzRiyN4z/EkouneH3mWqbYXYvid+3dO3EijZg0vFZykGw+w3wTKgc0eSZ0YZIeLn
 U5/h6YvpL4oiFH0zujPkQz0DNrbKY6+CNQcaUo8VwMdllYz9uYCsSZqt2NaneUGfwWOU
 Xz62CqZtnC7qxFTyH43OvfeVTxLUdQwG9xz0X8AZRPHObAbzRuVMbF2ZH+LrPTrXhVnk
 1E9to80vvY3GS7dqbOvyzwAzowRl4t0OyzksWcEcb5ntrleti40iYMIQxetBexkeiuT0
 MOEw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCk1ha2UgdXNlIG9mIEFO
U0kgOEIvMTBCIGNoYW5uZWwgY29kaW5nIGlmIHRoZSBEaXNwbGF5UG9ydCBzaW5rIHN1cHBvcnRz
Cml0LgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgOSArKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYwppbmRleCBmMWYzNzA1ZmFkZTkuLmY1MWE1NTk1ZWJjMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2hlbHBlci5jCkBAIC01MTksNyArNTE5LDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua19w
b3dlcl9kb3duKTsKICAqLwogaW50IGRybV9kcF9saW5rX2NvbmZpZ3VyZShzdHJ1Y3QgZHJtX2Rw
X2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCiB7Ci0JdTggdmFsdWVzWzJdOwor
CXU4IHZhbHVlc1syXSwgdmFsdWUgPSAwOwogCWludCBlcnI7CiAKIAl2YWx1ZXNbMF0gPSBkcm1f
ZHBfbGlua19yYXRlX3RvX2J3X2NvZGUobGluay0+cmF0ZSk7CkBAIC01MzIsNiArNTMyLDEzIEBA
IGludCBkcm1fZHBfbGlua19jb25maWd1cmUoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgc3RydWN0
IGRybV9kcF9saW5rICpsaW5rKQogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwogCisJaWYg
KGxpbmstPmNhcHMuY2hhbm5lbF9jb2RpbmcpCisJCXZhbHVlID0gRFBfU0VUX0FOU0lfOEIxMEI7
CisKKwllcnIgPSBkcm1fZHBfZHBjZF93cml0ZWIoYXV4LCBEUF9NQUlOX0xJTktfQ0hBTk5FTF9D
T0RJTkdfU0VULCB2YWx1ZSk7CisJaWYgKGVyciA8IDApCisJCXJldHVybiBlcnI7CisKIAlyZXR1
cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX2xpbmtfY29uZmlndXJlKTsKLS0gCjIuMjIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
