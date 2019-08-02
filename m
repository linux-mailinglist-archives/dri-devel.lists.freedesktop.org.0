Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE5B7EF73
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E5A6ED4D;
	Fri,  2 Aug 2019 08:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF726ED4D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:38:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x728cuYp091154;
 Fri, 2 Aug 2019 03:38:56 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x728cuck082375
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 Aug 2019 03:38:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 2 Aug
 2019 03:38:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 2 Aug 2019 03:38:55 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x728cr0i059387;
 Fri, 2 Aug 2019 03:38:54 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <jsarha@ti.com>
Subject: [PATCH] drm/tilcdc: Check priv->crtc validity in cpufreq_transition()
Date: Fri, 2 Aug 2019 11:39:01 +0300
Message-ID: <20190802083901.2018-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564735136;
 bh=GyT9UnnnwvGvKVP/yT3fe/bRitSeJe73gD1k+xYJsvA=;
 h=From:To:CC:Subject:Date;
 b=RRWcbPsuCfvsVt/oZfGKDYdAtSESRiiOMg8IuKHVyZYuilgrkiujFtjlOR7LQ0fAz
 nnw51+xn3Hc70qL8p5xtIflpJRz68r6lQbBKx6Oce2pzEKscFG0LNgcgCWhp5MjJtJ
 bW4xvUNxhCR9r5bd3NaNgKl5jJG6Ai/HJOtXP198=
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
Cc: airlied@linux.ie, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG5vdGlmaWVyIGNhbiBiZSBjYWxsZWQgYmVmb3JlIHdlIGhhdmUgY3J0Yy4gV2l0aCB0aGUg
Y2hlY2sgd2UgY2FuIGF2b2lkCk5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB3aXRoaW4gdGlsY2Rj
X2NydGNfdXBkYXRlX2NsaygpLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVy
LnVqZmFsdXNpQHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19kcnYu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMKaW5kZXggMzA0NmE0YTQyMzJkLi44NTA5MzEy
MzcyMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Rydi5jCkBAIC0xNjksNyArMTY5LDcg
QEAgc3RhdGljIGludCBjcHVmcmVxX3RyYW5zaXRpb24oc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpu
YiwKIAlzdHJ1Y3QgdGlsY2RjX2RybV9wcml2YXRlICpwcml2ID0gY29udGFpbmVyX29mKG5iLAog
CQkJc3RydWN0IHRpbGNkY19kcm1fcHJpdmF0ZSwgZnJlcV90cmFuc2l0aW9uKTsKIAotCWlmICh2
YWwgPT0gQ1BVRlJFUV9QT1NUQ0hBTkdFKQorCWlmICh2YWwgPT0gQ1BVRlJFUV9QT1NUQ0hBTkdF
ICYmIHByaXYtPmNydGMpCiAJCXRpbGNkY19jcnRjX3VwZGF0ZV9jbGsocHJpdi0+Y3J0Yyk7CiAK
IAlyZXR1cm4gMDsKLS0gClBldGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jr
a2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1
MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
