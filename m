Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE70612D9A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820D989EB4;
	Fri,  3 May 2019 12:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0152689EA6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CV3HY032357;
 Fri, 3 May 2019 07:31:03 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CV3kq128500
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:03 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYts002029;
 Fri, 3 May 2019 07:31:00 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 10/23] drm/bridge: tc358767: add link disable function
Date: Fri, 3 May 2019 15:29:36 +0300
Message-ID: <20190503122949.12266-11-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886663;
 bh=bpMvvKbh0+HNnyPltp8TbnqepLsGZzA1yRVSYIfxqC0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pghrWSqOovo80N5LQXAGSOirBhR1hZZM/Ua+UY6PaDRCJrFgQW+V697pOp580B+CL
 e0YppAXP+qPA9AHDTUdclHe3TyHz3ze/11JOxQLmmk7HHxRLX+CcFInp0keu6b6utt
 oVhODMKSMuq464er4iVHLJZMzViBLxs+1fwItRyw=
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

Q3VycmVudGx5IHdlIGhhdmUgdGNfbWFpbl9saW5rX3NldHVwKCksIHdoaWNoIGNvbmZpZ3VyZXMg
YW5kIGVuYWJsZWQgdGhlCmxpbmssIGJ1dCB3ZSBoYXZlIG5vIGNvdW50ZXItcGFydCBmb3IgZGlz
YWJsaW5nIHRoZSBsaW5rLgoKQWRkIHRjX21haW5fbGlua19kaXNhYmxlLCBhbmQgcmVuYW1lIHRj
X21haW5fbGlua19zZXR1cCB0bwp0Y19tYWluX2xpbmtfZW5hYmxlLgoKU2lnbmVkLW9mZi1ieTog
VG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwppbmRleCA4ODdiNzgxMjhmMjkuLmIyMmY1ZmU3Y2NmZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtODIyLDcgKzgyMiw3IEBAIHN0YXRpYyBpbnQgdGNf
bGlua190cmFpbmluZyhzdHJ1Y3QgdGNfZGF0YSAqdGMsIGludCBwYXR0ZXJuKQogCXJldHVybiBy
ZXQ7CiB9CiAKLXN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3NldHVwKHN0cnVjdCB0Y19kYXRhICp0
YykKK3N0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiB7
CiAJc3RydWN0IGRybV9kcF9hdXggKmF1eCA9ICZ0Yy0+YXV4OwogCXN0cnVjdCBkZXZpY2UgKmRl
diA9IHRjLT5kZXY7CkBAIC04MzcsNiArODM3LDggQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtf
c2V0dXAoc3RydWN0IHRjX2RhdGEgKnRjKQogCWlmICghdGMtPm1vZGUpCiAJCXJldHVybiAtRUlO
VkFMOwogCisJZGV2X2RiZyh0Yy0+ZGV2LCAibGluayBlbmFibGVcbiIpOworCiAJdGNfd3JpdGUo
RFAwX1NSQ0NUUkwsIHRjX3NyY2N0cmwodGMpKTsKIAkvKiBTU0NHIGFuZCBCVzI3IG9uIERQMSBt
dXN0IGJlIHNldCB0byB0aGUgc2FtZSBhcyBvbiBEUDAgKi8KIAl0Y193cml0ZShEUDFfU1JDQ1RS
TCwKQEAgLTEwMDYsNiArMTAwOCwyMCBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlua19zZXR1cChz
dHJ1Y3QgdGNfZGF0YSAqdGMpCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGludCB0Y19tYWlu
X2xpbmtfZGlzYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCit7CisJaW50IHJldDsKKworCWRldl9k
YmcodGMtPmRldiwgImxpbmsgZGlzYWJsZVxuIik7CisKKwl0Y193cml0ZShEUDBfU1JDQ1RSTCwg
MCk7CisJdGNfd3JpdGUoRFAwQ1RMLCAwKTsKKworCXJldHVybiAwOworZXJyOgorCXJldHVybiBy
ZXQ7Cit9CisKIHN0YXRpYyBpbnQgdGNfc3RyZWFtX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMp
CiB7CiAJaW50IHJldDsKQEAgLTEwODQsMTUgKzExMDAsMTYgQEAgc3RhdGljIHZvaWQgdGNfYnJp
ZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCXN0cnVjdCB0Y19kYXRhICp0
YyA9IGJyaWRnZV90b190YyhicmlkZ2UpOwogCWludCByZXQ7CiAKLQlyZXQgPSB0Y19tYWluX2xp
bmtfc2V0dXAodGMpOworCXJldCA9IHRjX21haW5fbGlua19lbmFibGUodGMpOwogCWlmIChyZXQg
PCAwKSB7Ci0JCWRldl9lcnIodGMtPmRldiwgIm1haW4gbGluayBzZXR1cCBlcnJvcjogJWRcbiIs
IHJldCk7CisJCWRldl9lcnIodGMtPmRldiwgIm1haW4gbGluayBlbmFibGUgZXJyb3I6ICVkXG4i
LCByZXQpOwogCQlyZXR1cm47CiAJfQogCiAJcmV0ID0gdGNfc3RyZWFtX2VuYWJsZSh0Yyk7CiAJ
aWYgKHJldCA8IDApIHsKIAkJZGV2X2Vycih0Yy0+ZGV2LCAibWFpbiBsaW5rIHN0cmVhbSBzdGFy
dCBlcnJvcjogJWRcbiIsIHJldCk7CisJCXRjX21haW5fbGlua19kaXNhYmxlKHRjKTsKIAkJcmV0
dXJuOwogCX0KIApAQCAtMTEwOSw2ICsxMTI2LDEwIEBAIHN0YXRpYyB2b2lkIHRjX2JyaWRnZV9k
aXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJcmV0ID0gdGNfc3RyZWFtX2Rpc2Fi
bGUodGMpOwogCWlmIChyZXQgPCAwKQogCQlkZXZfZXJyKHRjLT5kZXYsICJtYWluIGxpbmsgc3Ry
ZWFtIHN0b3AgZXJyb3I6ICVkXG4iLCByZXQpOworCisJcmV0ID0gdGNfbWFpbl9saW5rX2Rpc2Fi
bGUodGMpOworCWlmIChyZXQgPCAwKQorCQlkZXZfZXJyKHRjLT5kZXYsICJtYWluIGxpbmsgZGlz
YWJsZSBlcnJvcjogJWRcbiIsIHJldCk7CiB9CiAKIHN0YXRpYyB2b2lkIHRjX2JyaWRnZV9wb3N0
X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKLS0gClRleGFzIEluc3RydW1lbnRz
IEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9C
dXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
