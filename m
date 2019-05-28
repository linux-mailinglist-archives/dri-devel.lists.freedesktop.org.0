Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7407F2C133
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7989289C21;
	Tue, 28 May 2019 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769EC89C37
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8S55A036533;
 Tue, 28 May 2019 03:28:05 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8S5hm007988
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:05 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:04 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8RxuV125039;
 Tue, 28 May 2019 03:28:02 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 01/24] drm/bridge: tc358767: fix tc_aux_get_status error
 handling
Date: Tue, 28 May 2019 11:27:24 +0300
Message-ID: <20190528082747.3631-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032085;
 bh=mue3dbtuKYVRrYReTQ5hjO+JVZtPfyL/5kZXHvJLjfk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NZ5NQ71uvhT/0F+7bll7Jt2DbtxIbce9yGSadmYPZzup4buzU5jWY3+ZF5q5doXz1
 0j6eVIEys4LgIsOH2wU4hT6xtjIfz3VmWOofbOonRAriMCB5+AodA3+SDa37PZAjLd
 1+MRBukXeACYkAWWRzbb+QwXFiZGnFnNqsvN/qUk=
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

dGNfYXV4X2dldF9zdGF0dXMoKSBkb2VzIG5vdCByZXBvcnQgQVVYX1RJTUVPVVQgY29ycmVjdGx5
LCBhcyBpdCBvbmx5CmNoZWNrcyB0aGUgQVVYX1RJTUVPVVQgaWYgYXV4IGlzIHN0aWxsIGJ1c3ku
IEZpeCB0aGlzIGJ5IGFsd2F5cyBjaGVja2luZwpmb3IgQVVYX1RJTUVPVVQuCgpTaWduZWQtb2Zm
LWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpSZXZpZXdlZC1ieTog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMgfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5k
ZXggZTU3MGM5ZGVlMTgwLi5iNmM0ZDEwNjNjY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMKQEAgLTI4NiwxNCArMjg2LDE3IEBAIHN0YXRpYyBpbnQgdGNfYXV4X2dldF9zdGF0dXMoc3Ry
dWN0IHRjX2RhdGEgKnRjLCB1OCAqcmVwbHkpCiAJcmV0ID0gcmVnbWFwX3JlYWQodGMtPnJlZ21h
cCwgRFAwX0FVWFNUQVRVUywgJnZhbHVlKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsK
KwogCWlmICh2YWx1ZSAmIEFVWF9CVVNZKSB7Ci0JCWlmICh2YWx1ZSAmIEFVWF9USU1FT1VUKSB7
Ci0JCQlkZXZfZXJyKHRjLT5kZXYsICJpMmMgYWNjZXNzIHRpbWVvdXQhXG4iKTsKLQkJCXJldHVy
biAtRVRJTUVET1VUOwotCQl9CisJCWRldl9lcnIodGMtPmRldiwgImF1eCBidXN5IVxuIik7CiAJ
CXJldHVybiAtRUJVU1k7CiAJfQogCisJaWYgKHZhbHVlICYgQVVYX1RJTUVPVVQpIHsKKwkJZGV2
X2Vycih0Yy0+ZGV2LCAiYXV4IGFjY2VzcyB0aW1lb3V0IVxuIik7CisJCXJldHVybiAtRVRJTUVE
T1VUOworCX0KKwogCSpyZXBseSA9ICh2YWx1ZSAmIEFVWF9TVEFUVVNfTUFTSykgPj4gQVVYX1NU
QVRVU19TSElGVDsKIAlyZXR1cm4gMDsKIH0KLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQg
T3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJ
RDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
