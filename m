Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B724B29E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED846E2A6;
	Wed, 19 Jun 2019 07:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073026E293
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:36 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d126so9025887pfd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKj94I1UJ9U1wimP1ZXUVhx4jFR4v9J2rmetWcqu/jc=;
 b=F8DzgeDjGcvrXoAJA9z/orChqVp8Yw4Be6mGGUu+XjPRvgrBa+tSbEc0q1Xx7vLmij
 U9GhD23XXcHyUloN5/pd3kG7NqQPB1a58wwu6n4mtci7GsOIuAkN6CqJstuJXq/ICSen
 9HUSJ5hRao1AnszqNUR0ExeB6Ffp9W/kLXzNJk/a57GTEJFwlUVTT3tfVxMJ5ADME37t
 IvXQKYsbflpkbVyHw7NbSzA2lXHDodHjut3Ziq+aZS7erKMil+dPtpcv2Zi0jKaMXXHm
 Oo/ljLzeZN0eFDJDrYIr35CyJSHxvzHNoL/9kg+q//VeQwePGUQPxv4YrWlfz5EUu2oA
 IVNg==
X-Gm-Message-State: APjAAAVIFgFiipvLJqzZ3Bq3EJzIUTFTenwIwq7cI2WSTyOdRgP10Pds
 PPeuVwKHqAbkTCe80f31sDdeoJRi2r8=
X-Google-Smtp-Source: APXvYqw9wK3jCk36OHTZfB+uFDa8ce3rAFNRgzwWwSVLXsIlElg+D1QR6c5WDjf+RkLuF6NhOb+KMQ==
X-Received: by 2002:a63:2258:: with SMTP id t24mr6037843pgm.236.1560922055190; 
 Tue, 18 Jun 2019 22:27:35 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:34 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 02/15] drm/bridge: tc358767: Simplify polling in
 tc_main_link_setup()
Date: Tue, 18 Jun 2019 22:27:03 -0700
Message-Id: <20190619052716.16831-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TKj94I1UJ9U1wimP1ZXUVhx4jFR4v9J2rmetWcqu/jc=;
 b=suY/vXMO4QTGQwZl4b4hihTIVEb82iVu4ggZaDzsG/eDO8iqQ3LZ31ZXNdlAMGSlge
 v6umLl8wBTpltFmkqIT1WwywnFeKp5GhIoTJce2RtjvJTRL95Le08tm3rkfHDvf8nT1M
 xvJS+YY9b0lsyLJm6SHyVVcz9oNdxpM1yx7aSh2hvimjopBmA4DW1Cntut8JMhHdAX6P
 PPL1zbdz1B9t/HY1Aww05BGUJVVqBwDSr+AOZVXSE2yOG8OvF3blcp7Tz6KGnm1rkFdZ
 FKomMg0EUUp3EKXOFlHaPO8MQ3jC6cN+P+bCTA0IspJykUhKm0yr1lqX77YtFDKPQFc+
 6HOw==
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
