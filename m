Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479F6EF83
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 15:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332456E8B1;
	Sat, 20 Jul 2019 13:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37226E8B1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 13:47:18 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56672
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hophk-0003FR-Le; Sat, 20 Jul 2019 15:47:16 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/tinydrm/mipi-dbi: Move cmdlock mutex init
Date: Sat, 20 Jul 2019 15:47:04 +0200
Message-Id: <20190720134709.15186-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190720134709.15186-1-noralf@tronnes.org>
References: <20190720134709.15186-1-noralf@tronnes.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=mEieYDuZ96/juE0UpBoQFnb4m6OVYIewkuOeuRaV/MU=; 
 b=YKoOCfachJmT0OiXLCH3MOXEryAlf6FmsYqK3b7f3zCJTQZXMVKvaZ2ANxdnaXTRx1Ndbeh1uauFDl5+OYOIZTGNuD5xQB5+131i8mXRqjj2GlfVHsOacQNemuXjYXbAko69xl47EzPSaew9PVNrEzjxDvfaIEYyG8mcb2fmMNd2T/PiGJhTz4Y0vd0pYDEaf0qWl/0qUF+IAR07UJsrBG8J5HwjUQERNf+gceS/JU7MSMJjlrVQQzCSIVG3heabzNVx4ZEXwT+EnRuNnMFM3A2VNCPFdtNQ0w2swljvcI+Ev0yYjFbD743Wn0lHpHZf5pJaMUhPB/wypHnGQ5mj7Q==;
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
Cc: david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y21kbG9jayBwcm90ZWN0cyBjb21tYW5kIGV4ZWN1dGlvbiBzbyBwdXQgaXQgaW4gbWlwaV9kYmlf
c3BpX2luaXQoKQp3aGVyZSBpdCBjb25jZXB0dWFsbHkgYmVsb25ncy4KVGhpcyBpcyBwcmVwIHdv
cmsgZm9yIHRoZSBzcGxpdHRpbmcgb2Ygc3RydWN0IG1pcGlfZGJpLgoKU2lnbmVkLW9mZi1ieTog
Tm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3Rpbnlkcm0vbWlwaS1kYmkuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueWRy
bS9taXBpLWRiaS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwppbmRleCA0
MjQ2NTIyODEyOWMuLjM3YTczYjRjMGY4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rp
bnlkcm0vbWlwaS1kYmkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5j
CkBAIC01MDYsOCArNTA2LDYgQEAgaW50IG1pcGlfZGJpX2luaXRfd2l0aF9mb3JtYXRzKHN0cnVj
dCBtaXBpX2RiaSAqbWlwaSwKIAlpZiAoIW1pcGktPmNvbW1hbmQpCiAJCXJldHVybiAtRUlOVkFM
OwogCi0JbXV0ZXhfaW5pdCgmbWlwaS0+Y21kbG9jayk7Ci0KIAltaXBpLT50eF9idWYgPSBkZXZt
X2ttYWxsb2MoZHJtLT5kZXYsIHR4X2J1Zl9zaXplLCBHRlBfS0VSTkVMKTsKIAlpZiAoIW1pcGkt
PnR4X2J1ZikKIAkJcmV0dXJuIC1FTk9NRU07CkBAIC0xMTIwLDYgKzExMTgsOCBAQCBpbnQgbWlw
aV9kYmlfc3BpX2luaXQoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSwgc3RydWN0IG1pcGlfZGJpICpt
aXBpLAogCQkJcmV0dXJuIC1FTk9NRU07CiAJfQogCisJbXV0ZXhfaW5pdCgmbWlwaS0+Y21kbG9j
ayk7CisKIAlEUk1fREVCVUdfRFJJVkVSKCJTUEkgc3BlZWQ6ICV1TUh6XG4iLCBzcGktPm1heF9z
cGVlZF9oeiAvIDEwMDAwMDApOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
