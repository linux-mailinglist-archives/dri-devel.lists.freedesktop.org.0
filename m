Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5166EE7F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 10:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6E16E895;
	Sat, 20 Jul 2019 08:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488F6E888;
 Sat, 20 Jul 2019 08:45:54 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i21so32931526ljj.3;
 Sat, 20 Jul 2019 01:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5bCKsoONVp9v/i0uE4V+7JVM6Ep6Ht+p5Byht1Y7c+M=;
 b=ezmj/lWYZ2w+g7NjAth3BjLR0nYbqX6TmiOd8GAJ0Tp2NbOBwdAM9I3jWdsfVWOnxX
 y+IxHzNQzgmLs62/9LEUhRlAZ4HIr700LoCv4UV/R3q7AHdYoJUfocdAiRhaBLB3z8VL
 /yVquGbbK7+lQdCC8IjoSNNWzvEKDFj1po7wacUoWUS5axw7Hu5j3qeQ2PeOT9ckSDQQ
 eaYaRNIw6SeHSxP0OGZ6jzs+TxiFj7/vDtXkvsiPb8trh1/p/lK/1EVbPIBzS7czip6L
 5KQlWdaY3hnAz/Unju8sx9UqGUdAyZNGEfqI0X5q7bQCH7kPVRLPiR3erVGwq4WA5Vum
 zQGA==
X-Gm-Message-State: APjAAAX1BWFz+CMFJ9hZv19fpP32yykHug+jhetLrgv3fufzAyeteaHt
 69wC4NqAFgYLBdpDHW0LpanNm8VE3zs=
X-Google-Smtp-Source: APXvYqzLmICwVJI0xuFdgtgJSFdzktOhdrpDLnrbrMd8ylnft4HiMlbf7I+U6N4rZQJfY4RI+gPrzA==
X-Received: by 2002:a2e:720b:: with SMTP id n11mr30523480ljc.213.1563612352224; 
 Sat, 20 Jul 2019 01:45:52 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o3sm5047022lfb.40.2019.07.20.01.45.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 01:45:51 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/via: drop use of DRM(READ|WRITE) macros
Date: Sat, 20 Jul 2019 10:45:24 +0200
Message-Id: <20190720084527.12593-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190720084527.12593-1-sam@ravnborg.org>
References: <20190720084527.12593-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bCKsoONVp9v/i0uE4V+7JVM6Ep6Ht+p5Byht1Y7c+M=;
 b=WwfrwhCCzIVz3MO7knrE0Y65hmceYpNrU9T1mpKSvSWVDBNU1CPPVCFQ5TwY79Rpro
 b9GvV3SjyOh6e5zQwjt4HjLAoVMXvP8tDSHAjcCySM/Fx0NPqOZ2lT9MNhp7aKou8kBF
 znrJIgg6rU0axYsoQrPEMtf0f5tZRwbC4aUpozNEUvh8NT8SdbSrSAGE0EpUAF4FE8cG
 HaXhGmy0dwLoGMGioA7clwg5Ck/EEwLgl7anEae1WPgK6+OGiqyudP6VVOkGDwZ3RUJZ
 KKazzPGLy7kDgVU4J14iYjd29EUNK0YYQ/nxGBOv9nf07DxHJPZ5mhn7+DK82GkJWVBa
 ARYA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTV9SRUFELCBEUk1fV1JJVEUgbWFjcm9zIGNvbWVzIGZyb20gdGhlIGRlcHJlY2F0ZWQg
ZHJtX29zX2xpbnV4LmgKaGVhZGVyIGZpbGUuIFJlbW92ZSB0aGVpciB1c2UgdG8gcmVtb3ZlIHRo
aXMgZGVwZW5kZW5jeS4KClJlcGxhY2UgdGhlIHVzZSBvZiB0aGUgbWFjcm9zIHdpdGggb3BlbiBj
b2RlZCB2YXJpYW50cy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KQ2M6IEtldmluIEJyYWNlIDxrZXZpbmJyYWNlQGdteC5jb20+CkNjOiBUaG9tYXMgSGVs
bHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CkNjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIg
PGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CkNjOiBNaWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJv
bmQuY29tPgpDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxp
a292QGNvbGxhYm9yYS5jb20+CkNjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oIHwgMTUgKysrKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92
aWEvdmlhX2Rydi5oCmluZGV4IDZkMWFlODM0NDg0Yy4uZDVhMmIxZmZkOGMxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlh
L3ZpYV9kcnYuaApAQCAtMTE1LDEwICsxMTUsMTcgQEAgZW51bSB2aWFfZmFtaWx5IHsKIC8qIFZJ
QSBNTUlPIHJlZ2lzdGVyIGFjY2VzcyAqLwogI2RlZmluZSBWSUFfQkFTRSAoKGRldl9wcml2LT5t
bWlvKSkKIAotI2RlZmluZSBWSUFfUkVBRChyZWcpCQlEUk1fUkVBRDMyKFZJQV9CQVNFLCByZWcp
Ci0jZGVmaW5lIFZJQV9XUklURShyZWcsIHZhbCkJRFJNX1dSSVRFMzIoVklBX0JBU0UsIHJlZywg
dmFsKQotI2RlZmluZSBWSUFfUkVBRDgocmVnKQkJRFJNX1JFQUQ4KFZJQV9CQVNFLCByZWcpCi0j
ZGVmaW5lIFZJQV9XUklURTgocmVnLCB2YWwpCURSTV9XUklURTgoVklBX0JBU0UsIHJlZywgdmFs
KQorI2RlZmluZSBWSUFfUkVBRChyZWcpIFwKKwlyZWFkbCgoKHZvaWQgX19pb21lbSAqKVZJQV9C
QVNFLT5oYW5kbGUpICsgKHJlZykpCisKKyNkZWZpbmUgVklBX1dSSVRFKHJlZywgdmFsKSBcCisJ
d3JpdGVsKHZhbCwgKCh2b2lkIF9faW9tZW0gKilWSUFfQkFTRS0+aGFuZGxlKSArIChyZWcpKQor
CisjZGVmaW5lIFZJQV9SRUFEOChyZWcpIFwKKwlyZWFkYigoKHZvaWQgX19pb21lbSAqKVZJQV9C
QVNFLT5oYW5kbGUpICsgKHJlZykpCisKKyNkZWZpbmUgVklBX1dSSVRFOChyZWcsIHZhbCkgXAor
CXdyaXRlYih2YWwsICgodm9pZCBfX2lvbWVtICopVklBX0JBU0UtPmhhbmRsZSkgKyAocmVnKSkK
IAogZXh0ZXJuIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyB2aWFfaW9jdGxzW107CiBleHRl
cm4gaW50IHZpYV9tYXhfaW9jdGw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
