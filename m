Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A692108
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D1C89179;
	Mon, 19 Aug 2019 10:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84096E090
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 04:06:37 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id s142so149768ybc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 21:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PPbQdYyCeikWXeCzzJyCalBEj0GFXKEGI6wDSmoOtt0=;
 b=XadqRjxteIJ3B17mTCwtMPK37WUVVtuyZ2zYac6N8/Ja5OxqZrgUEHD0hPDZ0Ncm+y
 ZbenjNBU5LXrH9+Ga7xVIb9+8fVCPbEEbBkxznHw5GhytPSwaUAT7DpPV4SSbeDPgQ1m
 9ZYRfAGgpJvjPPeqP8SViybiy69GBkD+4nwPs7mNPql/NXT6hhxurnGxEbXuJcqg4KKD
 WU8uyrHSK61vBOwWOgr5hhT2QYLOcgKfgiXa+Pi3P+4ZB5YI/MdZOSzasYvZJsjm8u+f
 fRznpo6VxWGqjxdlnkbkNbovY2HQVp0c21rn2XSYFaHVw4IYz056w2wXiFfOe7X5XhOG
 uVzQ==
X-Gm-Message-State: APjAAAUbP2NZokbpUDkVRRPQ2HaaM+Y2CBmJJQqov6zE2iPaDe1UsuwY
 wvx+ewUw95SdIo5QmmF9Zmk=
X-Google-Smtp-Source: APXvYqwcvjZFzcZF38VQD30/+EabzvCtJOhM3mSDUJSUUmo/bvyIyKyY9r562Bj79wYPEekrUx0VhQ==
X-Received: by 2002:a25:c603:: with SMTP id k3mr15008655ybf.409.1566187596936; 
 Sun, 18 Aug 2019 21:06:36 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id l82sm2939148ywb.64.2019.08.18.21.06.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 21:06:36 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: [PATCH] drm/gma500: fix memory/resource leaks
Date: Sun, 18 Aug 2019 23:06:17 -0500
Message-Id: <1566187591-8263-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHNiX2RyaXZlcl9sb2FkKCksIGlmIGdtYV9iYWNrbGlnaHRfaW5pdCgpIGZhaWxzLCBubyBj
bGVhbnVwIGlzCmV4ZWN1dGVkLCBsZWFkaW5nIHRvIG1lbW9yeS9yZXNvdXJjZSBsZWFrcy4gVG8g
Zml4IHRoaXMgaXNzdWUsIGdvIHRvIHRoZQonb3V0X2VycicgbGFiZWwgdG8gcGVyZm9ybSB0aGUg
Y2xlYW51cCB3b3JrLgoKU2lnbmVkLW9mZi1ieTogV2Vud2VuIFdhbmcgPHdlbndlbkBjcy51Z2Eu
ZWR1PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3Bz
Yl9kcnYuYwppbmRleCA3MDA1ZjhmLi44ZDI2NGFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL3BzYl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYu
YwpAQCAtMzgzLDcgKzM4Myw3IEBAIHN0YXRpYyBpbnQgcHNiX2RyaXZlcl9sb2FkKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCiAJfQogCiAJaWYgKHJldCkKLQkJ
cmV0dXJuIHJldDsKKwkJZ290byBvdXRfZXJyOwogCXBzYl9pbnRlbF9vcHJlZ2lvbl9lbmFibGVf
YXNsZShkZXYpOwogI2lmIDAKIAkvKiBFbmFibGUgcnVudGltZSBwbSBhdCBsYXN0ICovCi0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
