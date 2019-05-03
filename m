Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1912D8E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A25C8913B;
	Fri,  3 May 2019 12:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0F89134
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:30:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CUhaA017290;
 Fri, 3 May 2019 07:30:43 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CUhLN121223
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:30:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:30:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:30:42 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtk002029;
 Fri, 3 May 2019 07:30:40 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 02/23] drm/bridge: tc358767: reset voltage-swing &
 pre-emphasis
Date: Fri, 3 May 2019 15:29:28 +0300
Message-ID: <20190503122949.12266-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886643;
 bh=BlwWTzYvunLKctKkv35eo4s39aaBrOJkiufexUvjPqQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Av6KH77zgjxmcobkYl1KnK6oqnFJXkJv1PgePpNizNWuwQiorEkjMOD2w8fMORlk4
 4xrydJ0/7s96k8V/Ql+w0gi90hYNzl3y/Ef2RiSihR/q/O8846dgLCeh1I59IRMVVT
 hj0TqSiSQypMOUGV5NUQ3/IqOWjI+bs/xvCEtudA=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byByZXNldCBEUENEIHZvbHRhZ2Utc3dpbmcgJiBwcmUtZW1waGFzaXMgYmVmb3Jl
IHN0YXJ0aW5nIHRoZQpsaW5rIHRyYWluaW5nLCBhcyBvdGhlcndpc2UgdGMzNTg3Njcgd2lsbCB1
c2UgdGhlIHByZXZpb3VzIHZhbHVlcyBhcwptaW5pbXVtcy4KClNpZ25lZC1vZmYtYnk6IFRvbWkg
VmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA3MDMxYzRmNTJjNTcuLjAzZGE0N2NmZjE4MiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtOTU2LDYgKzk1NiwxMyBAQCBzdGF0aWMg
aW50IHRjX21haW5fbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJaWYgKHJldCA8IDAp
CiAJCWdvdG8gZXJyX2RwY2Rfd3JpdGU7CiAKKwkvKiBSZXNldCB2b2x0YWdlLXN3aW5nICYgcHJl
LWVtcGhhc2lzICovCisJdG1wWzBdID0gdG1wWzFdID0gRFBfVFJBSU5fVk9MVEFHRV9TV0lOR19M
RVZFTF8wIHwKKwkJCSAgRFBfVFJBSU5fUFJFX0VNUEhfTEVWRUxfMDsKKwlyZXQgPSBkcm1fZHBf
ZHBjZF93cml0ZShhdXgsIERQX1RSQUlOSU5HX0xBTkUwX1NFVCwgdG1wLCAyKTsKKwlpZiAocmV0
IDwgMCkKKwkJZ290byBlcnJfZHBjZF93cml0ZTsKKwogCXJldCA9IHRjX2xpbmtfdHJhaW5pbmco
dGMsIERQX1RSQUlOSU5HX1BBVFRFUk5fMSk7CiAJaWYgKHJldCkKIAkJZ290byBlcnI7Ci0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
