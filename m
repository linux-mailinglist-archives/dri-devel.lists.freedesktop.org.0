Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8374E6DFF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8597D6E439;
	Mon, 28 Oct 2019 08:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27866E94F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 09:49:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n15so1520822wrw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 02:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3uzPaMEUG7uzlUaWgLj84V/5JtUR6Pevk4lkhYdYRgg=;
 b=D9HKRWktJOPZAoWp+7fBqtwxQa2KeDPycMLkb1uCxYDUIa6xL+Dlr3xShXrc9bHVUQ
 sru+XBr9J4lz6wFS3J8s18/LmwsZzL1HFXJT1Rud1NdfSyA6r6QjJSB6Ejd7K38vUzHH
 onjqizHP0NcFpsNU7u04D0RniZG3R9xy1ShUl6mc8jVs2NiG6uJvbdy41PtSyCPg0lDb
 M6S05NU3DAnJgEctxIrb0dQHHuIXFvejM3Zg43bL7vY76JVb14n1kI7m62AuQeCV4g6B
 lSHkFLGqMn+2RZDypYhaUE9yT6UPI1WhD41h8FoQwn789SGBeqB4hGyUUwF/OHmtbPlg
 Bk2A==
X-Gm-Message-State: APjAAAVP8mAhrlFNuh0eTkR5QZzyNsIibLnX+9xwOSqpLzdik2Ieko/o
 lUXUDP4m0il12T9oNSa9CdVQvVcuQUAuTQ==
X-Google-Smtp-Source: APXvYqxXxmjr5OAjFpkJ3ppbV54p68g3ca6vAeJMxmyG/pnqg27NNe1nvr9M2G2LEvpAPGX2NQSKLQ==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr2109312wrr.207.1571996952978; 
 Fri, 25 Oct 2019 02:49:12 -0700 (PDT)
Received: from wambui.brck.local ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id q14sm2130403wre.27.2019.10.25.02.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:49:12 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [Outreachy][PATCH] drm: use DIV_ROUND_UP helper macro for calculations
Date: Fri, 25 Oct 2019 12:49:07 +0300
Message-Id: <20191025094907.3582-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3uzPaMEUG7uzlUaWgLj84V/5JtUR6Pevk4lkhYdYRgg=;
 b=ilh8wyesMchbb9NRybDxrhIKd3t7KS4WEAJhQEvgBO70lPCJrL27bNYUejtd4AHFcy
 zRmXLq0PTnXnDjGkDJPwpa6xjTnzjkZE0qIca5JafDVC+rIH9RIyWTpBfKCJcYoESMwH
 6gFUrZnM2qJOlP+0GEZhMqBbV3iOjps4qSSvo2021RJdetxIEAswV6b8Yq/gSe0C6Xxz
 RuEVk9u9J9MqHgMwjVXe/C6h3kWNjaWX13/NlNjtCEELK9m4leLkBoaPdZOyBHB5X244
 61HwCnc3i76BlYzO8u+GDW6N1N3o0/SYF6p4ogJ0FDwCDCqUvAzJ4cEA4xPI2enFnPAK
 wjlw==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBvcGVuIGNvZGVkIGRpdmlzb3IgY2FsY3VsYXRpb25zIHdpdGggdGhlIERJVl9ST1VO
RF9VUCBrZXJuZWwKbWFjcm8gZm9yIGJldHRlciByZWFkYWJpbGl0eS4KSXNzdWUgZm91bmQgdXNp
bmcgY29jY2luZWxsZToKQEAKZXhwcmVzc2lvbiBuLGQ7CkBACigKLSAoKG4gKyBkIC0gMSkgLyBk
KQorIERJVl9ST1VORF9VUChuLGQpCnwKLSAoKG4gKyAoZCAtIDEpKSAvIGQpCisgRElWX1JPVU5E
X1VQKG4sZCkKKQoKU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhA
Z21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9hZ3BzdXBwb3J0LmMKaW5kZXggNmUwOWYyN2ZkOWQ2Li40YzdhZDQ2ZmRkMjEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYWdwc3VwcG9ydC5jCkBAIC0yMTIsNyArMjEyLDcgQEAgaW50IGRybV9hZ3BfYWxs
b2Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9hZ3BfYnVmZmVyICpyZXF1ZXN0
KQogCWlmICghZW50cnkpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcGFnZXMgPSAocmVxdWVzdC0+
c2l6ZSArIFBBR0VfU0laRSAtIDEpIC8gUEFHRV9TSVpFOworCXBhZ2VzID0gRElWX1JPVU5EX1VQ
KHJlcXVlc3QtPnNpemUsIFBBR0VfU0laRSk7CiAJdHlwZSA9ICh1MzIpIHJlcXVlc3QtPnR5cGU7
CiAJbWVtb3J5ID0gYWdwX2FsbG9jYXRlX21lbW9yeShkZXYtPmFncC0+YnJpZGdlLCBwYWdlcywg
dHlwZSk7CiAJaWYgKCFtZW1vcnkpIHsKQEAgLTMyNSw3ICszMjUsNyBAQCBpbnQgZHJtX2FncF9i
aW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fYWdwX2JpbmRpbmcgKnJlcXVl
c3QpCiAJZW50cnkgPSBkcm1fYWdwX2xvb2t1cF9lbnRyeShkZXYsIHJlcXVlc3QtPmhhbmRsZSk7
CiAJaWYgKCFlbnRyeSB8fCBlbnRyeS0+Ym91bmQpCiAJCXJldHVybiAtRUlOVkFMOwotCXBhZ2Ug
PSAocmVxdWVzdC0+b2Zmc2V0ICsgUEFHRV9TSVpFIC0gMSkgLyBQQUdFX1NJWkU7CisJcGFnZSA9
IERJVl9ST1VORF9VUChyZXF1ZXN0LT5vZmZzZXQsIFBBR0VfU0laRSk7CiAJcmV0Y29kZSA9IGRy
bV9iaW5kX2FncChlbnRyeS0+bWVtb3J5LCBwYWdlKTsKIAlpZiAocmV0Y29kZSkKIAkJcmV0dXJu
IHJldGNvZGU7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
