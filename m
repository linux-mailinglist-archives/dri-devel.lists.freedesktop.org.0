Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B7ADF7E7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54C86E290;
	Mon, 21 Oct 2019 22:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC976E219
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 18:53:02 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id u1so13011757ilq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 11:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=erjZddSV8OJ6M5smw9c8mYfNMrltsPqb9R/cRGyaN38=;
 b=tLg7tJJLlFfA578+MFPwsnaP9WLzUBrVBFerwjqVTzKWwpeOTlni9XLu0XOkSR7EI9
 oELJRAI4hj5wX5GFN5PhzdR+mZEV84J548tTn4kBQn5AHbzecZSlBylQOpqd5WpSX65T
 q1JwMWfak0Enb3ZL/NHVW+2TQi0uPcp3BGCHWuY2r8Wd1OfmvrWtR1UUxXG8rb5o0GoX
 q8NAsrd1Ext7kkAw+SCgdxjYPiV6oNniN1HYS6gf+anlKehjSviVOkvXwK4Wm6bOseBn
 9S2ul/bmDU4cnvH4jHYdH/QzueC2b/4XKQp0CsIb7Ia3ED5FW9VNM1asoOQiNUADA2or
 +v0A==
X-Gm-Message-State: APjAAAXvjZ1BfpYX5MX8cpqyAs3ohVydXfh18D4D6gZOzlw0D+8V/MsR
 /IWs+9ZhOQyTfy2rqpplYfbTYYG0RIE=
X-Google-Smtp-Source: APXvYqypeFGVtWeXC2SiZVCheTcw8968x/hQ1h8DTaS56XiKXAhVvfj9p7br1QvWn0gwJeR9Eyjt+A==
X-Received: by 2002:a92:5d88:: with SMTP id e8mr4794924ilg.95.1571683981508;
 Mon, 21 Oct 2019 11:53:01 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id i26sm4780063iol.84.2019.10.21.11.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 11:53:00 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
Date: Mon, 21 Oct 2019 13:52:49 -0500
Message-Id: <20191021185250.26130-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=erjZddSV8OJ6M5smw9c8mYfNMrltsPqb9R/cRGyaN38=;
 b=QnPNSwJcr8M9bndo9lgdcmLVbusenXSGIcEjUnr4XxJVJmJykAZI7KbITLa0Wny0dp
 O75nQXxEaIslpYQY25szoq/JdGHYOHwfLENyCQafaCGQpkboDYSBTUBnjb1mykSDv6ex
 ECwvV70Vzbc1ea7co9bTdr6O4Y/zg1+T8+x/zmBKNQB4yqwiG6hnPhyGj0dFXWH/q6aw
 i2jhZoROVFhgQ4YES6C3GEZ+v+YfgJ1u20OeYRbXcxkwfeaKHaeGDH39qY+EHCBakbdq
 oatMw7sfoqWm4t4c1e3FWecWIcIewcYzsK9aXdeHhr2gmILAVtQ005k8mOJmFww2EImz
 AqSA==
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, emamd001@umn.edu, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGltcGVsZW1lbnRhdGlvbiBvZiB2M2Rfc3VibWl0X2NsX2lvY3RsKCkgdGhlcmUgYXJl
IHR3byBtZW1vcnkKbGVha3MuIE9uZSBpcyB3aGVuIGFsbG9jYXRpb24gZm9yIGJpbiBmYWlscywg
YW5kIHRoZSBvdGhlciBpcyB3aGVuIGJpbgppbml0aWFsaXphdGlvbiBmYWlscy4gSWYga2NhbGxv
YyBmYWlscyB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGJpbiB0aGVuCnJlbmRlci0+YmFzZSBzaG91
bGQgYmUgcHV0LiBBbHNvLCBpZiB2M2Rfam9iX2luaXQoKSBmYWlscyB0byBpbml0aWFsaXplCmJp
bi0+YmFzZSB0aGVuIGFsbG9jYXRlZCBtZW1vcnkgZm9yIGJpbiBzaG91bGQgYmUgcmVsZWFzZWQu
CgpGaXhlczogYTc4M2EwOWVlNzZkICgiZHJtL3YzZDogUmVmYWN0b3Igam9iIG1hbmFnZW1lbnQu
IikKU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIHwgNSArKysrLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2Vt
LmMKaW5kZXggNWQ4MDUwN2I1MzliLi4xOWMwOTJkNzUyNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92M2QvdjNkX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5j
CkBAIC01NTcsMTMgKzU1NywxNiBAQCB2M2Rfc3VibWl0X2NsX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAKIAlpZiAoYXJncy0+YmNsX3N0YXJ0ICE9IGFyZ3MtPmJj
bF9lbmQpIHsKIAkJYmluID0ga2NhbGxvYygxLCBzaXplb2YoKmJpbiksIEdGUF9LRVJORUwpOwot
CQlpZiAoIWJpbikKKwkJaWYgKCFiaW4pIHsKKwkJCXYzZF9qb2JfcHV0KCZyZW5kZXItPmJhc2Up
OwogCQkJcmV0dXJuIC1FTk9NRU07CisJCX0KIAogCQlyZXQgPSB2M2Rfam9iX2luaXQodjNkLCBm
aWxlX3ByaXYsICZiaW4tPmJhc2UsCiAJCQkJICAgdjNkX2pvYl9mcmVlLCBhcmdzLT5pbl9zeW5j
X2JjbCk7CiAJCWlmIChyZXQpIHsKIAkJCXYzZF9qb2JfcHV0KCZyZW5kZXItPmJhc2UpOworCQkJ
a2ZyZWUoYmluKTsKIAkJCXJldHVybiByZXQ7CiAJCX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
