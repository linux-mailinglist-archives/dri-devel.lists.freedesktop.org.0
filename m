Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58BD450FB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 03:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ECD892F3;
	Fri, 14 Jun 2019 01:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE96892F3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 01:03:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so656580wrl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+EV7DG8i07w38rTd1k2CcWOZS1S6GGa4Mr7+B4XkO7M=;
 b=maAossrRv+1ClXUzlKzWDwMSrdvrgP3Vj2THQEAm8YPYKx/7oCdjXhuja8HRk1xR+O
 fvHmwYS9QvxXjoSf1fHXEqlBOb8jwAv546gENSM1T3dTF2N4HpBBRgaQlOAjEyOqob6R
 QAAuf0RYZxxtEYwQLyeQ9LBHwRmsbWbzAQU/9A69MoA51cEuNv2i3gBDMA8ZBFsn+I+0
 a4UKVp+ufFrQdD/1Fdh8E2Wy7lwVrUVWxjMcOxU9GvmE3C+HD/PK+MrawdcutFU0f84j
 fJNfobftbLmOXM8f4ZMjSqGTNjyIYMl0YMtGGeCGDXZ6A+F564XqnA/ewUGFhzEkEElr
 DEHw==
X-Gm-Message-State: APjAAAUjjsKZBoIahA2J8RO+mXvKUrasu1GOePxSrR+NzSIYp7x4fTDb
 YbCl3n4Q6E4y3Kq3nb7XeX0=
X-Google-Smtp-Source: APXvYqzuBFsGZGklqTH+D6iW9N9NeQjHnth0STybblRODEa+D76ffLeUX/1dGRXXHPmOakPD+zw4ew==
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr9034856wrw.8.1560474187054;
 Thu, 13 Jun 2019 18:03:07 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com.
 [139.181.7.34])
 by smtp.gmail.com with ESMTPSA id r131sm1177476wmf.4.2019.06.13.18.03.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 18:03:06 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] gpu: ipu-v3: image-convert: Enable double write reduction
Date: Thu, 13 Jun 2019 18:02:55 -0700
Message-Id: <20190614010255.13593-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+EV7DG8i07w38rTd1k2CcWOZS1S6GGa4Mr7+B4XkO7M=;
 b=dqzAr8lDzVrREDJu/eQH5cHbAFXP18GA93BzzRHGXmp+2enb6Phtfs9IxKmg82gKz6
 EKaO8kLQlDE6p8hNbrlELjK+3KH4mNyV7BCdU9PqhEjMpbJ7ttOxV4U5mk9W4m+6blns
 p3Eh7SabkjaBcUr0MKJfp0xtCHpeQvfv3WyiR+NeGLjYq0C7uk2zjqI+8rI1uOoCwxE3
 IsBD12tP5GWeJuJkjhGFdOZNjvtDUCB52OG6RZDcHORLHAih8qV/DI049lBLYsWV7KUZ
 D6jwmEJy9QhMA6rBa8e9qPuxIEaZjemM8bP7C4FuOfETwYSKXrbEW93w563q6MXpDqsb
 KM0Q==
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR FREESCALE IMX"
 <dri-devel@lists.freedesktop.org>, Steve Longerbeam <slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHRoZSB3cml0ZSBjaGFubmVscyB3aXRoIDQ6MjowIHN1YnNhbXBsZWQgWVVWIGZvcm1hdHMs
IGF2b2lkIGNocm9tYQpvdmVyZHJhdyBieSBvbmx5IHdyaXRpbmcgY2hyb21hIGZvciBldmVuIGxp
bmVzIChza2lwIG9kZCBjaHJvbWEgcm93cykuClRoaXMgcmVkdWNlcyBuZWNlc3Nhcnkgd3JpdGUg
bWVtb3J5IGJhbmR3aWR0aCBieSBhdCBsZWFzdCAyNSUgKG1vcmUKd2l0aCByb3RhdGlvbiBlbmFi
bGVkKS4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlIExvbmdlcmJlYW0gPHNsb25nZXJiZWFtQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYyB8IDkgKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMgYi9kcml2ZXJzL2dwdS9pcHUtdjMv
aXB1LWltYWdlLWNvbnZlcnQuYwppbmRleCAzNmU4ODQzNDUxM2EuLjMwMzZlMDFkOGQ0MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMKKysrIGIvZHJp
dmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMKQEAgLTEyNzksNiArMTI3OSwxNSBA
QCBzdGF0aWMgdm9pZCBpbml0X2lkbWFjX2NoYW5uZWwoc3RydWN0IGlwdV9pbWFnZV9jb252ZXJ0
X2N0eCAqY3R4LAogCWlmIChyb3RfbW9kZSkKIAkJaXB1X2NwbWVtX3NldF9yb3RhdGlvbihjaGFu
bmVsLCByb3RfbW9kZSk7CiAKKwkvKgorCSAqIFNraXAgd3JpdGluZyBVIGFuZCBWIGNvbXBvbmVu
dHMgdG8gb2RkIHJvd3MgaW4gdGhlIG91dHB1dAorCSAqIGNoYW5uZWxzIGZvciBwbGFuYXIgNDoy
OjAuCisJICovCisJaWYgKChjaGFubmVsID09IGNoYW4tPm91dF9jaGFuIHx8CisJICAgICBjaGFu
bmVsID09IGNoYW4tPnJvdGF0aW9uX291dF9jaGFuKSAmJgorCSAgICBpbWFnZS0+Zm10LT5wbGFu
YXIgJiYgaW1hZ2UtPmZtdC0+dXZfaGVpZ2h0X2RlYyA9PSAyKQorCQlpcHVfY3BtZW1fc2tpcF9v
ZGRfY2hyb21hX3Jvd3MoY2hhbm5lbCk7CisKIAlpZiAoY2hhbm5lbCA9PSBjaGFuLT5yb3RhdGlv
bl9pbl9jaGFuIHx8CiAJICAgIGNoYW5uZWwgPT0gY2hhbi0+cm90YXRpb25fb3V0X2NoYW4pIHsK
IAkJYnVyc3Rfc2l6ZSA9IDg7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
