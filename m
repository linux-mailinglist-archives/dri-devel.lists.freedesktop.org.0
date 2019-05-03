Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3712D8D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D3B89134;
	Fri,  3 May 2019 12:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101789134
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:30:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CUgKr017285;
 Fri, 3 May 2019 07:30:42 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CUgIL109856
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:30:42 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:30:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:30:40 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtj002029;
 Fri, 3 May 2019 07:30:37 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 01/23] drm/bridge: tc358767: fix tc_aux_get_status error
 handling
Date: Fri, 3 May 2019 15:29:27 +0300
Message-ID: <20190503122949.12266-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886642;
 bh=9OH+WmDrr+S93M5OoAEvbWqUz1QW5s2P6JjdkXc1j1A=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yI9Gk/8W/mXYx8ovoZ613CCr4gL9kBS7LLD25QIOrVRPi52Ic4JwyizBcHIfBVda3
 nxCPr7wFy8oa3P4xDSzDTNHgSM3LWlM7fzh2Up2UPj1B1m5NnD63uTYx6YhY1Y5bnZ
 k9p0WuxLCSTnB+numTOiaTwFwb5kTswyDEkSQB+Y=
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
ZXggODg4OTgwZDRiYzc0Li43MDMxYzRmNTJjNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
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
