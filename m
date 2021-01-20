Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709992FD688
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2142E6E0C4;
	Wed, 20 Jan 2021 17:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237156E409
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:10:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 59B5D80160;
 Wed, 20 Jan 2021 18:00:53 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/probe-helper: Check epoch counter in
 output_poll_execute()
Date: Wed, 20 Jan 2021 18:00:32 +0100
Message-Id: <20210120170033.38468-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>
References: <20210120170033.38468-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LfoSFAXi c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=rnb-knuk5dQJkhbuddwA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KCkgY2hlY2tzIHRoZSBlcG9jaCBjb3VudGVyIHRvIGRl
dGVybWluZQpjb25uZWN0b3Igc3RhdHVzIGNoYW5nZS4gVGhpcyB3YXMgaW50cm9kdWNlZCBpbgpj
b21taXQgNTE4NjQyMWNiZmUyICgiZHJtOiBJbnRyb2R1Y2UgZXBvY2ggY291bnRlciB0byBkcm1f
Y29ubmVjdG9yIikuCkRvIHRoZSBzYW1lIGZvciBvdXRwdXRfcG9sbF9leGVjdXRlKCkgc28gaXQg
Y2FuIGRldGVjdCBvdGhlciBjaGFuZ2VzCmJlc2lkZSBjb25uZWN0aW9uIHN0YXR1cyB2YWx1ZSBj
aGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxwZXIuYyB8IDcgKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3Byb2JlX2hlbHBlci5jCmluZGV4IGQ2MDE3NzI2Y2MyYS4uZTU0MzJkY2Y2OTk5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMKQEAgLTYyMyw2ICs2MjMsNyBAQCBzdGF0aWMgdm9p
ZCBvdXRwdXRfcG9sbF9leGVjdXRlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXIgY29ubl9pdGVyOwogCWVudW0gZHJtX2Nvbm5lY3Rvcl9z
dGF0dXMgb2xkX3N0YXR1czsKIAlib29sIHJlcG9sbCA9IGZhbHNlLCBjaGFuZ2VkOworCXU2NCBv
bGRfZXBvY2hfY291bnRlcjsKIAogCWlmICghZGV2LT5tb2RlX2NvbmZpZy5wb2xsX2VuYWJsZWQp
CiAJCXJldHVybjsKQEAgLTY1OSw4ICs2NjAsOSBAQCBzdGF0aWMgdm9pZCBvdXRwdXRfcG9sbF9l
eGVjdXRlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAogCQlyZXBvbGwgPSB0cnVlOwogCisJ
CW9sZF9lcG9jaF9jb3VudGVyID0gY29ubmVjdG9yLT5lcG9jaF9jb3VudGVyOwogCQljb25uZWN0
b3ItPnN0YXR1cyA9IGRybV9oZWxwZXJfcHJvYmVfZGV0ZWN0KGNvbm5lY3RvciwgTlVMTCwgZmFs
c2UpOwotCQlpZiAob2xkX3N0YXR1cyAhPSBjb25uZWN0b3ItPnN0YXR1cykgeworCQlpZiAob2xk
X2Vwb2NoX2NvdW50ZXIgIT0gY29ubmVjdG9yLT5lcG9jaF9jb3VudGVyKSB7CiAJCQljb25zdCBj
aGFyICpvbGQsICpuZXc7CiAKIAkJCS8qCkBAIC02ODksNiArNjkxLDkgQEAgc3RhdGljIHZvaWQg
b3V0cHV0X3BvbGxfZXhlY3V0ZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJCQkJICAgICAg
Y29ubmVjdG9yLT5iYXNlLmlkLAogCQkJCSAgICAgIGNvbm5lY3Rvci0+bmFtZSwKIAkJCQkgICAg
ICBvbGQsIG5ldyk7CisJCQlEUk1fREVCVUdfS01TKCJbQ09OTkVDVE9SOiVkOiVzXSBlcG9jaCBj
b3VudGVyICVsbHUgLT4gJWxsdVxuIiwKKwkJCQkgICAgICBjb25uZWN0b3ItPmJhc2UuaWQsIGNv
bm5lY3Rvci0+bmFtZSwKKwkJCQkgICAgICBvbGRfZXBvY2hfY291bnRlciwgY29ubmVjdG9yLT5l
cG9jaF9jb3VudGVyKTsKIAogCQkJY2hhbmdlZCA9IHRydWU7CiAJCX0KLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
