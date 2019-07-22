Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D36FDFC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 12:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FA78979F;
	Mon, 22 Jul 2019 10:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918EA89A61
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:43:25 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55388
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpVmt-0001lD-Nd; Mon, 22 Jul 2019 12:43:23 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/tinydrm/mipi-dbi: Move cmdlock mutex init
Date: Mon, 22 Jul 2019 12:43:04 +0200
Message-Id: <20190722104312.16184-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722104312.16184-1-noralf@tronnes.org>
References: <20190722104312.16184-1-noralf@tronnes.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=1UIi3LFAJ0z87Iki0W3LMC7oy/x16zToVygXpno5g/w=; 
 b=LpJQRr88BCCm1AghEbtecK9Ru/SwlLKk9fyljJ8rKApsrSyMu5dND6OHOAyKumZjWP1J0YQ1Bg0YIK4iX/YL+zaDAY1SKk8JmbcX9qsNyRFVU0vfZtkDIPqs7/vzdZFmozXKkEuEmVE4Dg8EMFozxVo0oHyRU3OEJlTlLj/6kR9KzWqEp6pfqElXeuMinig0/J6x9hKnkaAUfZgTqDlIwnkQkBy0UsYgS7u97l81tv69Ssdr3H3oqRwCpFkDCCPcLhKydX2fAgJ576WLfSzsL76xosXAbDvCPFjT9n/hb/9c+GZHW3qhji+/ysClP9aV8sQNHRDyGmzH0AFhRznayQ==;
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
Cc: sam@ravnborg.org, david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y21kbG9jayBwcm90ZWN0cyBjb21tYW5kIGV4ZWN1dGlvbiBzbyBwdXQgaXQgaW4gbWlwaV9kYmlf
c3BpX2luaXQoKQp3aGVyZSBpdCBjb25jZXB0dWFsbHkgYmVsb25ncy4KVGhpcyBpcyBwcmVwIHdv
cmsgZm9yIHRoZSBzcGxpdHRpbmcgb2Ygc3RydWN0IG1pcGlfZGJpLgoKUmV2aWV3ZWQtYnk6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hu
bmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlw
aS1kYmkuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5j
IGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwppbmRleCA0MjQ2NTIyODEyOWMu
LjM3YTczYjRjMGY4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1k
YmkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5jCkBAIC01MDYsOCAr
NTA2LDYgQEAgaW50IG1pcGlfZGJpX2luaXRfd2l0aF9mb3JtYXRzKHN0cnVjdCBtaXBpX2RiaSAq
bWlwaSwKIAlpZiAoIW1pcGktPmNvbW1hbmQpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JbXV0ZXhf
aW5pdCgmbWlwaS0+Y21kbG9jayk7Ci0KIAltaXBpLT50eF9idWYgPSBkZXZtX2ttYWxsb2MoZHJt
LT5kZXYsIHR4X2J1Zl9zaXplLCBHRlBfS0VSTkVMKTsKIAlpZiAoIW1pcGktPnR4X2J1ZikKIAkJ
cmV0dXJuIC1FTk9NRU07CkBAIC0xMTIwLDYgKzExMTgsOCBAQCBpbnQgbWlwaV9kYmlfc3BpX2lu
aXQoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSwgc3RydWN0IG1pcGlfZGJpICptaXBpLAogCQkJcmV0
dXJuIC1FTk9NRU07CiAJfQogCisJbXV0ZXhfaW5pdCgmbWlwaS0+Y21kbG9jayk7CisKIAlEUk1f
REVCVUdfRFJJVkVSKCJTUEkgc3BlZWQ6ICV1TUh6XG4iLCBzcGktPm1heF9zcGVlZF9oeiAvIDEw
MDAwMDApOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
