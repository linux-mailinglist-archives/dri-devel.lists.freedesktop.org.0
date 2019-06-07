Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989738583
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5414789B45;
	Fri,  7 Jun 2019 07:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E568940F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:29 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 196so480260pgc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKj94I1UJ9U1wimP1ZXUVhx4jFR4v9J2rmetWcqu/jc=;
 b=sNUSTTlgNiWC8Lw3Pxd1ZA12bY4NndmIZ94nnKh/X030Uf6LKSoLx/Pc3zyZOuCLND
 6Qiw1abi3PhgngTEtUI8QPhFk6WOL8sCHYYkzVB4Nbg/xcGTRXGzWuhab3sUsLHbx5vt
 XLtmrgY2wELoIpXsK0780N43XSKZRkR8piU2z2xmI0umh8GcSp6kPZTM6X5m9qZYof8L
 CRtEvT9W2dZf5uikbNT0e7XwZAYoDY2OFbMR0SGvyJBAAF/KDndEi5ITpLXVED3p+8gS
 mVA+AqtrJxRrXSFl0jrUtCUyZ1swg0vCeneYZoPMmFvMOkaW7SL5Or9pjI4ye+t8qcbj
 8+5w==
X-Gm-Message-State: APjAAAUrXuuITxTk+nz5ru22sKxAT9DLE9nFcvtKJwIoXkX3jkarAFFF
 6WEbmwxG6M9N1qPfl2XzmBMt+D1FQF8=
X-Google-Smtp-Source: APXvYqwldgVunQd7qxmyJ+Xn/e/agu1l+MYj5yw0wR8Ter7sPfmPIFdnHlyKscrzkGRhciJLS4S4Zw==
X-Received: by 2002:aa7:9095:: with SMTP id i21mr52436969pfa.119.1559882788909; 
 Thu, 06 Jun 2019 21:46:28 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:28 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/15] drm/bridge: tc358767: Simplify polling in
 tc_main_link_setup()
Date: Thu,  6 Jun 2019 21:45:37 -0700
Message-Id: <20190607044550.13361-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TKj94I1UJ9U1wimP1ZXUVhx4jFR4v9J2rmetWcqu/jc=;
 b=rDQ50ait0AZSnhNs+94DRKzZufz/mXjTyd6b5gGmiEbxWpq/cW1J35S7np/gsPajII
 uyA5y5WQIZ7KAwEy4a8W1KlnNjodjoFYMlKh8Ti9RTCaNJH2cMZhBBIlpikE3Ruz3rmz
 td8fuGtMY5YgUuLkQyon29mrFvOfGnkxzG+mg9zxbG41Krv0zWaPxrbm5SmIZU/5stH1
 Tj7o71t+Xd9RwZAh/EbWuWRq6R5PInS0vUE8DmePswBCkpc3t3rYJ3IzyNLqAgumsK6C
 yuWkxzzNrekpGSexrj1/O6t4Im23EUL8SlxjfRFhC62yeu9H+dmmNbEnYlOb5EAktV7Z
 +ENg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBleHBsaWNpdCBwb2xsaW5nIGxvb3Agd2l0aCBlcXVpdmFsZW50IGNhbGwgdG8KdGNf
cG9sbF90aW1lb3V0KCkgZm9yIGJyZXZpdHkuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNv
bT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBB
bmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8
TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRv
bWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBj
b2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5
IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4
LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8
IDEyICsrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggZmI4YTE5NDJlYzU0Li5m
NDYzZWY2ZDQyNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTc3NCw3ICs3NzQs
NiBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlua19lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRjKQog
CXN0cnVjdCBkZXZpY2UgKmRldiA9IHRjLT5kZXY7CiAJdW5zaWduZWQgaW50IHJhdGU7CiAJdTMy
IGRwX3BoeV9jdHJsOwotCWludCB0aW1lb3V0OwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0OwogCXU4
IHRtcFs4XTsKQEAgLTgzMSwxNSArODMwLDEwIEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2Vu
YWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJZHBfcGh5X2N0cmwgJj0gfihEUF9QSFlfUlNUIHwg
UEhZX00xX1JTVCB8IFBIWV9NMF9SU1QpOwogCXRjX3dyaXRlKERQX1BIWV9DVFJMLCBkcF9waHlf
Y3RybCk7CiAKLQl0aW1lb3V0ID0gMTAwMDsKLQlkbyB7Ci0JCXRjX3JlYWQoRFBfUEhZX0NUUkws
ICZ2YWx1ZSk7Ci0JCXVkZWxheSgxKTsKLQl9IHdoaWxlICgoISh2YWx1ZSAmIFBIWV9SRFkpKSAm
JiAoLS10aW1lb3V0KSk7Ci0KLQlpZiAodGltZW91dCA9PSAwKSB7CisJcmV0ID0gdGNfcG9sbF90
aW1lb3V0KHRjLCBEUF9QSFlfQ1RSTCwgUEhZX1JEWSwgUEhZX1JEWSwgMSwgMTAwMCk7CisJaWYg
KHJldCkgewogCQlkZXZfZXJyKGRldiwgInRpbWVvdXQgd2FpdGluZyBmb3IgcGh5IGJlY29tZSBy
ZWFkeSIpOwotCQlyZXR1cm4gLUVUSU1FRE9VVDsKKwkJcmV0dXJuIHJldDsKIAl9CiAKIAkvKiBT
ZXQgbWlzYzogOCBiaXRzIHBlciBjb2xvciAqLwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
