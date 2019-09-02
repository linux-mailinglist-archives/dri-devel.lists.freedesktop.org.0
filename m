Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A378AA54EE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497A289C27;
	Mon,  2 Sep 2019 11:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE4A89C28
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u16so13684484wrr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsPOMRtTr+lM0WoCNjTwi27pzy0ZGcTeVaoicLp14s8=;
 b=dHj6mEVGXZBhOzNu9JWRZ1XiLYozuHJgN2lBP5die0xPboHEcODv95vNxXLUwO//Gp
 yV9kvGDGo+kXu3ISHngDKiiZDQwmabvbhDK6y5XqhmDpIuacj69CRsaJ80/Zs4OHOC/v
 2DhelJQ4XmCofjLtF+r0GGeUSzi/5QHBGkhIcUdmXw1ZTsIXF/w6KEgmLcpUcoY67uQn
 NzE7Jtc+5ePIKbFRKtqlhx4FeUbi2iiR5CJgM5wf7qeVMwmrJPXhXaUcgY0mPLY1h6qB
 2TNu4/Vk4sVyAjzj0XzKucSX48nycl+bdUN7jJmB0xJXqPfEjjYSp9UpdfzuLq2ayBuj
 uywA==
X-Gm-Message-State: APjAAAV4kOjm1wQN4HcDNQ12zD+AJhOQ0RFORMkLNGS2+KbS1Y2dIOu9
 1mDXg+K2reFl77QfjmYcn7VRHvrf
X-Google-Smtp-Source: APXvYqyEw34Q3pVxIag4EHzigbvTGy6o28CIA+4IQD6j7VZe1yPDHwD880BjigWPWQTcIVVoN+x/Sg==
X-Received: by 2002:adf:e488:: with SMTP id i8mr7540417wrm.20.1567423917753;
 Mon, 02 Sep 2019 04:31:57 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id t13sm7205961wra.70.2019.09.02.04.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/21] drm/dp: Set channel coding on link configuration
Date: Mon,  2 Sep 2019 13:31:16 +0200
Message-Id: <20190902113121.31323-17-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsPOMRtTr+lM0WoCNjTwi27pzy0ZGcTeVaoicLp14s8=;
 b=qO5A1wGYppCMrAEBMHdEBCBP6bZtFZV/ewOhTC1XmWGCbx3ZD6F+MUrSs5LGiPnnmW
 Eiw276C9e/DAd+gvrAYaM+frCOJVDJLEP6gWy0YpIhFgh+a+KEk97hgnkkq03rmP6sDi
 908cXTbxAKS7mjg9GVEjW+ZHFU5GejvElykQWkbUvB1HYx4TXBb2KSZ7muspibR/0jTN
 JqFEZUCkSR4NZAaVmItCLscGGzsmBeYRg6lrSaJJnCytCHe1MNlAGeCNgr5gR1TJw/mN
 Rz7tUh1OFUOPgV4jFoa2fC3AU72dJluYJSUQe8ns4QCwy/ihtN8TW2T+6foIax0mzvLi
 vkcQ==
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
