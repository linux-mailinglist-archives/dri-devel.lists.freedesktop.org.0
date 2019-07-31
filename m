Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C87BA5C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9738B6E695;
	Wed, 31 Jul 2019 07:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601716E653
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 02:01:51 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t14so29688848plr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUnqDkhp8I/U34Xk2DihF2fZ0LXl/ojC5Gdgd+5fT1g=;
 b=EpiOXYYEZoLLRg0TjJNvEjtJu2Vsgf/0a/yngIClj4SO3vs1Z536fYH+5DEAFbH3G4
 ZSnryx21XpzW6aJnjB7B8w9IDfyOBXRZZ0PopFGi7dYi+IIvQmwy21zvrKcc1QeYZekG
 Yz9YvdZTcbEyyq6sRBbhyq69sJ0O/noUG/x5YcDRG3u/eXO6ZeIaMK5hqa8XUQXClCjs
 TLvsT6rKEWgBJlcKNKP0ZH3J5q/LDWhHryQ1yu+qGOe7MSozevUv9umHPM5sNgv/KMYY
 RSi1OvLmmaZ0ykcMGM5j1vvVpfEqa81f4G08GaC3IhM01fhZoy/f0IPFy6gfx9/PrZYP
 /w6w==
X-Gm-Message-State: APjAAAUNouQFphY98tOijXroFGL43OtMivqJNZ2i47j/SY9XG7Qypuiz
 LPaKButTEnK+RbgDVvIED2s=
X-Google-Smtp-Source: APXvYqzJrbpGmHIg0kbbZs6GahNcyT6zhIhopnwv1zrLWr8TeZLNTK95uTLobGMRMrwnRwYlbgEC5A==
X-Received: by 2002:a17:902:724:: with SMTP id
 33mr115099946pli.49.1564538511043; 
 Tue, 30 Jul 2019 19:01:51 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id b14sm117664pga.20.2019.07.30.19.01.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 19:01:50 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] drm/modes: Fix unterminated strncpy
Date: Wed, 31 Jul 2019 10:01:40 +0800
Message-Id: <20190731020140.3529-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUnqDkhp8I/U34Xk2DihF2fZ0LXl/ojC5Gdgd+5fT1g=;
 b=O+JF52OwlX7DJZJebJXT4RUqHd0r3qbpYtaxn6ewSPHQLcKwyQGvK0/ODbEtH0tfdz
 /P0NpWinz+mUDl+ISIrB3Kco4NAo2moAYmR5aGeQv9zqZE8A5WoWxCEzRDxlNVTMT7qD
 OTqviILCV+c9TG0f/RdiUcENtADWt5QRPKH2DPikcQ7gRprVxFFKJBE2/yrqesM0ZnTF
 aNXTM0tABV+gIo5d09djhevPL623s2Mky0iqmL0Jpimycy7U0EW7Qqg7MQrU4ywrhlXh
 EjwIVO0YdUpynIYJdXazGYDpkhMEYxw/kC91v1hDOGYJCXn61KRnD4XeMw13pCrVM2bR
 hGGA==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c3RybmNweShkZXN0LCBzcmMsIHN0cmxlbihzcmMpKSBsZWFkcyB0byB1bnRlcm1pbmF0ZWQKZGVz
dCwgd2hpY2ggaXMgZGFuZ2Vyb3VzLgpGaXggaXQgYnkgdXNpbmcgc3Ryc2NweS4KClNpZ25lZC1v
ZmYtYnk6IENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5NkBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGlu
IHYyOgogIC0gQ2hlY2sgd2hldGhlciBtb2RlX2VuZCArIDEgZXhjZWVkcwoJdGhlIHNpemUgb2Yg
bW9kZS0+bmFtZS4KCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCA0ICsrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMK
aW5kZXggODBmY2Q1ZGMxNTU4Li5iMDM2OWU2OTBmMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKQEAgLTE3
NzAsNyArMTc3MCw5IEBAIGJvb2wgZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25u
ZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24sCiAJfQogCiAJaWYgKG5hbWVkX21vZGUpIHsK
LQkJc3RybmNweShtb2RlLT5uYW1lLCBuYW1lLCBtb2RlX2VuZCk7CisJCWlmIChtb2RlX2VuZCAr
IDEgPiBEUk1fRElTUExBWV9NT0RFX0xFTikKKwkJCXJldHVybiBmYWxzZTsKKwkJc3Ryc2NweSht
b2RlLT5uYW1lLCBuYW1lLCBtb2RlX2VuZCArIDEpOwogCX0gZWxzZSB7CiAJCXJldCA9IGRybV9t
b2RlX3BhcnNlX2NtZGxpbmVfcmVzX21vZGUobmFtZSwgbW9kZV9lbmQsCiAJCQkJCQkgICAgICBw
YXJzZV9leHRyYXMsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
