Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875C6A56BE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED26890B9;
	Mon,  2 Sep 2019 12:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC128908C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:54:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x82CshE0021126;
 Mon, 2 Sep 2019 07:54:43 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x82CshJY000784
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Sep 2019 07:54:43 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 2 Sep
 2019 07:54:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 2 Sep 2019 07:54:43 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x82CsYYM126767;
 Mon, 2 Sep 2019 07:54:42 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
Date: Mon, 2 Sep 2019 15:53:56 +0300
Message-ID: <20190902125359.18001-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190902125359.18001-1-tomi.valkeinen@ti.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1567428884;
 bh=djV77i26A0+F5MOTKnyz3vMQTUtN0MSuCkdbk8DNuD8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PgBMD7r2/93vKT9sTGewEHmTl8Oh+88NOciswp/YU5cSiyfz/jVYxcXtxMoRQpLfR
 cHx1PeDaK2nCBMf3xTpo+4FC2eVhmKsqjXY6xcoaHM+V7CTgx6Ww3Uh42Ibl/hxfr2
 M1ZdOlNzwoK0V4S2GTGdgyaI52aXWzprniTe/MT0=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KCkltcGxlbWVudCBDVE0gY29sb3IgbWFu
YWdlbWVudCBwcm9wZXJ0eSBmb3IgT01BUCBDUlRDIHVzaW5nIERTUwpvdmVybGF5IG1hbmFnZXIn
cyBDb2xvciBQaGFzZSBSb3RhdGlvbiBtYXRyaXguIFRoZSBDUFIgbWF0cml4IGRvZXMgbm90CmV4
YWN0bHkgbWF0Y2ggdGhlIENUTSBwcm9wZXJ0eSBkb2N1bWVudGF0aW9uLiBPbiBEU1MgdGhlIENQ
UiBtYXRyaXggaXMKYXBwbGllZCBhZnRlciBnYW1tYSB0YWJsZSBsb29rIHVwLiBIb3dldmVyLCBp
dCBzZWVtcyBzdHVwaWQgdG8gYWRkIGEKY3VzdG9tIHByb3BlcnR5IGp1c3QgZm9yIHRoYXQuCgpT
aWduZWQtb2ZmLWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfY3J0Yy5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9jcnRjLmMKaW5kZXggM2M1ZGRiZjMwZTk3Li5kNjMyMTNkZDdkODMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5jCkBAIC0zOTEsNiArMzkxLDMyIEBAIHN0
YXRpYyB2b2lkIG9tYXBfY3J0Y19tYW51YWxfZGlzcGxheV91cGRhdGUoc3RydWN0IHdvcmtfc3Ry
dWN0ICpkYXRhKQogCX0KIH0KIAorc3RhdGljIHMxNiBvbWFwX2NydGNfUzMxXzMyX3RvX3MyXzgo
czY0IGNvZWYpCit7CisJdWludDY0X3Qgc2lnbl9iaXQgPSAxVUxMIDw8IDYzOworCXVpbnQ2NF90
IGNiaXRzID0gKHVpbnQ2NF90KSBjb2VmOworCXMxNiByZXQgPSBjbGFtcF92YWwoKChjYml0cyAm
IH5zaWduX2JpdCkgPj4gMjQpLCAwLCAweDFGRik7CisKKwlpZiAoY2JpdHMgJiBzaWduX2JpdCkK
KwkJcmV0ID0gLXJldDsKKworCXJldHVybiByZXQ7Cit9CisKK3N0YXRpYyB2b2lkIG9tYXBfY3J0
Y19jcHJfY29lZnNfZnJvbV9jdG0oY29uc3Qgc3RydWN0IGRybV9jb2xvcl9jdG0gKmN0bSwKKwkJ
CQkJIHN0cnVjdCBvbWFwX2Rzc19jcHJfY29lZnMgKmNwcikKK3sKKwljcHItPnJyID0gb21hcF9j
cnRjX1MzMV8zMl90b19zMl84KGN0bS0+bWF0cml4WzBdKTsKKwljcHItPnJnID0gb21hcF9jcnRj
X1MzMV8zMl90b19zMl84KGN0bS0+bWF0cml4WzFdKTsKKwljcHItPnJiID0gb21hcF9jcnRjX1Mz
MV8zMl90b19zMl84KGN0bS0+bWF0cml4WzJdKTsKKwljcHItPmdyID0gb21hcF9jcnRjX1MzMV8z
Ml90b19zMl84KGN0bS0+bWF0cml4WzNdKTsKKwljcHItPmdnID0gb21hcF9jcnRjX1MzMV8zMl90
b19zMl84KGN0bS0+bWF0cml4WzRdKTsKKwljcHItPmdiID0gb21hcF9jcnRjX1MzMV8zMl90b19z
Ml84KGN0bS0+bWF0cml4WzVdKTsKKwljcHItPmJyID0gb21hcF9jcnRjX1MzMV8zMl90b19zMl84
KGN0bS0+bWF0cml4WzZdKTsKKwljcHItPmJnID0gb21hcF9jcnRjX1MzMV8zMl90b19zMl84KGN0
bS0+bWF0cml4WzddKTsKKwljcHItPmJiID0gb21hcF9jcnRjX1MzMV8zMl90b19zMl84KGN0bS0+
bWF0cml4WzhdKTsKK30KKwogc3RhdGljIHZvaWQgb21hcF9jcnRjX3dyaXRlX2NydGNfcHJvcGVy
dGllcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiB7CiAJc3RydWN0IG9tYXBfZHJtX3ByaXZhdGUg
KnByaXYgPSBjcnRjLT5kZXYtPmRldl9wcml2YXRlOwpAQCAtNDAyLDcgKzQyOCwxNiBAQCBzdGF0
aWMgdm9pZCBvbWFwX2NydGNfd3JpdGVfY3J0Y19wcm9wZXJ0aWVzKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YykKIAlpbmZvLmRlZmF1bHRfY29sb3IgPSAweDAwMDAwMDsKIAlpbmZvLnRyYW5zX2VuYWJs
ZWQgPSBmYWxzZTsKIAlpbmZvLnBhcnRpYWxfYWxwaGFfZW5hYmxlZCA9IGZhbHNlOwotCWluZm8u
Y3ByX2VuYWJsZSA9IGZhbHNlOworCisJaWYgKGNydGMtPnN0YXRlLT5jdG0pIHsKKwkJc3RydWN0
IGRybV9jb2xvcl9jdG0gKmN0bSA9CisJCQkoc3RydWN0IGRybV9jb2xvcl9jdG0gKikgY3J0Yy0+
c3RhdGUtPmN0bS0+ZGF0YTsKKworCQlpbmZvLmNwcl9lbmFibGUgPSB0cnVlOworCQlvbWFwX2Ny
dGNfY3ByX2NvZWZzX2Zyb21fY3RtKGN0bSwgJmluZm8uY3ByX2NvZWZzKTsKKwl9IGVsc2Ugewor
CQlpbmZvLmNwcl9lbmFibGUgPSBmYWxzZTsKKwl9CiAKIAlwcml2LT5kaXNwY19vcHMtPm1ncl9z
ZXR1cChwcml2LT5kaXNwYywgb21hcF9jcnRjLT5jaGFubmVsLCAmaW5mbyk7CiB9CkBAIC04MzYs
NyArODcxLDcgQEAgc3RydWN0IGRybV9jcnRjICpvbWFwX2NydGNfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCWlmIChwcml2LT5kaXNwY19vcHMtPm1ncl9nYW1tYV9zaXplKHByaXYtPmRp
c3BjLCBjaGFubmVsKSkgewogCQl1bnNpZ25lZCBpbnQgZ2FtbWFfbHV0X3NpemUgPSAyNTY7CiAK
LQkJZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoY3J0YywgMCwgZmFsc2UsIGdhbW1hX2x1dF9z
aXplKTsKKwkJZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoY3J0YywgMCwgdHJ1ZSwgZ2FtbWFf
bHV0X3NpemUpOwogCQlkcm1fbW9kZV9jcnRjX3NldF9nYW1tYV9zaXplKGNydGMsIGdhbW1hX2x1
dF9zaXplKTsKIAl9CiAKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxh
bmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00
LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
