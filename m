Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EB66317A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9AA89971;
	Tue,  9 Jul 2019 07:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9A89D4D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 12:33:23 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c14so8202452plo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 05:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cnpaUYY7PfsaPEiNSsa/HFMftAhnh6cWuyIN2oyHtQI=;
 b=RpIM+t0vrY9c0iZF9J/OQiPxyebbc1k8rwJmBMIHMkQrMqxbdx9Zeu/aQIT/0L/1GM
 ce2HE5mrr24dyY7XQjZdewAldcryJVIYBuHJR39CiJZgZphzjfe+IIK6pvePKLnCFHi/
 QaLG1N+x1kSoi1V2pw9XpUiz45r3Dysy70zlOPB3h8cuMq9fzJZUlJ+23394oT39Bthf
 4fxFtQLj1caSXUNrgzX3M2dwguGRlHPJ4Mybg4HahUEnBVui1dCW6FB4/Igqai4ihHS8
 SDMs0v68hIScuj3OoQvlF+hBB2LzUTlBzCSsBEMd1ZH4kM9gJeU3cIfYrO/zk8QT8uod
 YV+A==
X-Gm-Message-State: APjAAAUbaU9zyw0ng4dATZL+DQ2S1zlsCLo7jFBjneFcQhbmIPY1b30g
 KaBo/GKFdUsGIrzEc/FvDA4=
X-Google-Smtp-Source: APXvYqw5PgsxhbaI8eUmPiNT21zGE7yXFZ6cMZ56ySR8GcW2gXlNXBV2MFZVeGhPWAum1yV27k5+pA==
X-Received: by 2002:a17:902:6b02:: with SMTP id
 o2mr22656033plk.99.1562589202713; 
 Mon, 08 Jul 2019 05:33:22 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id j24sm23386297pgg.86.2019.07.08.05.33.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 05:33:22 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 06/14] drm/i2c: tda9950: Replace devm_add_action() followed by
 failure action with devm_add_action_or_reset()
Date: Mon,  8 Jul 2019 20:33:15 +0800
Message-Id: <20190708123315.11897-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cnpaUYY7PfsaPEiNSsa/HFMftAhnh6cWuyIN2oyHtQI=;
 b=oq23msEjxcp/YyvSg1o4afYr5Q8Sb2xtGTbtsbrLoZz1W5PzO5QhZmHvBqXz/kE0hJ
 dk6DJM0VLA3Kdr+aMUDHu3MU3d5cn8/1InYpj6Nseky2nJGFt7LX+ds0YBE+mI27/qiQ
 DT7bde2LtthGa0IgVWpWisyzpcHir8bFypHN+w4GfpfFhssCWKTTytBQubgvCEP0lMyi
 lbU/71Lm3LCCLvllIgEN+ifjZe5cNAjVczwL6Engpe+0K/f3wnuPumPGCKKANQYhI6V6
 MCoWFOSWje6xxISlSgoCAKTQOrsc1kmos6qF7wFtNWBLUQNR5kx3b7XxfmM6FjxstBtc
 FTcA==
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
Cc: David Airlie <airlied@linux.ie>, Fuqian Huang <huangfq.daxian@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgaXMgaW50cm9kdWNlZCBhcyBhIGhlbHBlciBmdW5j
dGlvbiB3aGljaCAKaW50ZXJuYWxseSBjYWxscyBkZXZtX2FkZF9hY3Rpb24oKS4gSWYgZGV2bV9h
ZGRfYWN0aW9uKCkgZmFpbHMgCnRoZW4gaXQgd2lsbCBleGVjdXRlIHRoZSBhY3Rpb24gbWVudGlv
bmVkIGFuZCByZXR1cm4gdGhlIGVycm9yIGNvZGUuClRoaXMgcmVkdWNlIHNvdXJjZSBjb2RlIHNp
emUgKGF2b2lkIHdyaXRpbmcgdGhlIGFjdGlvbiB0d2ljZSkgCmFuZCByZWR1Y2UgdGhlIGxpa2Vs
eWhvb2Qgb2YgYnVncy4KClNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhp
YW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jIHwgNCArLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTUwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTJj
L3RkYTk5NTAuYwppbmRleCA4MDM5ZmMwZDgzZGIuLjA0MmY2NDg3ZTZmYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTUwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2kyYy90
ZGE5OTUwLmMKQEAgLTM2MSw5ICszNjEsNyBAQCBzdGF0aWMgaW50IHRkYTk5NTBfZGV2bV9nbHVl
X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgdGRhOTk1MF9nbHVlICpnbHVlKQogCQkJ
cmV0dXJuIHJldDsKIAl9CiAKLQlyZXQgPSBkZXZtX2FkZF9hY3Rpb24oZGV2LCB0ZGE5OTUwX2Rl
dm1fZ2x1ZV9leGl0LCBnbHVlKTsKLQlpZiAocmV0KQotCQl0ZGE5OTUwX2Rldm1fZ2x1ZV9leGl0
KGdsdWUpOworCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIHRkYTk5NTBfZGV2
bV9nbHVlX2V4aXQsIGdsdWUpOwogCiAJcmV0dXJuIHJldDsKIH0KLS0gCjIuMTEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
