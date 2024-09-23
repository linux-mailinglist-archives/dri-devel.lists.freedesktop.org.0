Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C375997E887
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1AB10E3C1;
	Mon, 23 Sep 2024 09:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="ZTMwKIeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D196810E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MP2MHHTJYCImsud+G+w2BWsoD24nwQUQGpHdiwlMQYQ=;
 b=ZTMwKIehm283jEQTXCn1rb+Nq5VsJlKHQ+eXBRgZMzv+K7eTO2qHg979
 lcx4d8VTLYTaMiJagh9ezI4G1V9AKIGE+KY/EtAN5aiYzl27svQmREU4j
 ZAPC0/uIQYFR1w4w0EzMszORfxT0Sh7cr+nJhN67CYWXtJQS2uIS0t0dl
 /PO1QtU4qMGFRB8bX5/GB9xhpYp0GyamxiU5PXRtncsMB1XnQDPWPeSxE
 eNbdwc24pO8FxiBoE28FCCSD5AGSsc6Mf7GzHHr8s3WBUuJre7MiSa/DD
 6aexiH27BJYdx8phj9yV6w5JvmUZgrroUstOxdEXV0q3i0uSWT4o36oPr g==;
X-CSE-ConnectionGUID: EYhSmsoOTb6nu4Jtc+if6g==
X-CSE-MsgGUID: 0rezIbtiSEOhRralHyBfAQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 23 Sep 2024 17:22:44 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48N9MdQj095390;
 Mon, 23 Sep 2024 17:22:39 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 17:22:40 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Mon, 23 Sep 2024 17:22:40 +0800
From: <Hermes.Wu@ite.com.tw>
To: <treapking@chromium.org>
CC: <Kenneth.Hung@ite.com.tw>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] drm/bridge: it6505: fix AUX read use aux fifo
Thread-Topic: [PATCH 1/2] drm/bridge: it6505: fix AUX read use aux fifo
Thread-Index: AQHbDZmk+fNIIacRaE2BPKdEOYsCSbJlGOeQ
Date: Mon, 23 Sep 2024 09:22:40 +0000
Message-ID: <65d5422c7d2e43d59acd8b2461a69106@ite.com.tw>
References: <20240923091337.13183-1-Hermes.Wu@ite.com.tw>
In-Reply-To: <20240923091337.13183-1-Hermes.Wu@ite.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.20.82]
x-tm-snts-smtp: E8381207C559D35E1B9D8C124724AE7258C4478207AF84855C7DD0A532B9E66E2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48N9MdQj095390
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgDQoNClBsZWFzZSBJZ25vcmUgdGhpcyBwYXRoLg0KDQpCUiwNCkhlcm1lcw0KDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBIZXJtZXMgV3UgKKdkqM6nuykgPEhlcm1lcy5X
dUBpdGUuY29tLnR3PiANClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDIzLCAyMDI0IDU6MTQgUE0N
ClRvOiBQaW4teWVuIExpbiA8dHJlYXBraW5nQGNocm9taXVtLm9yZz4NCkNjOiBLZW5uZXRoIEh1
bmcgKKx4rmGt2ykgPEtlbm5ldGguSHVuZ0BpdGUuY29tLnR3PjsgSGVybWVzIFd1ICinZKjOp7sp
IDxIZXJtZXMuV3VAaXRlLmNvbS50dz47IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50
ZWwuY29tPjsgTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBSb2Jl
cnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz47IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT47
IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+OyBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2lt
b25hQGZmd2xsLmNoPjsgb3BlbiBsaXN0OkRSTSBEUklWRVJTIDxkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPjsgb3BlbiBsaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0K
U3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2JyaWRnZTogaXQ2NTA1OiBmaXggQVVYIHJlYWQgdXNl
IGF1eCBmaWZvDQoNCkZyb206IEhlcm1lcyBXdSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQoNCkNo
YW5nZXMgaW4gdjM6DQogLU5ldyBpbiB2Mw0KDQppdDY1MDUgQVVYIEZJRk8gbW9kZSBvbmx5IDE2
IGJ5dGUuDQpBVVggRklGTyBtb2RlIG9ubHkgc3VwcG9ydHMgRURJRCByZWFkIGFuZCBEUENEIEtT
ViBGSUZPIGFyZWEuDQoNCg0KU2lnbmVkLW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRl
LmNvbS50dz4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIHwgMjUg
KysrKysrKysrKysrKysrKystLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pdGUtaXQ2NTA1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KaW5k
ZXggODdiODU0NWZjY2MwLi5kOGI0MGFkODkwYmYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUt
aXQ2NTA1LmMNCkBAIC0zMDAsNyArMzAwLDcgQEANCiAjZGVmaW5lIE1BWF9DUl9MRVZFTCAweDAz
DQogI2RlZmluZSBNQVhfRVFfTEVWRUwgMHgwMw0KICNkZWZpbmUgQVVYX1dBSVRfVElNRU9VVF9N
UyAxNQ0KLSNkZWZpbmUgQVVYX0ZJRk9fTUFYX1NJWkUgMzINCisjZGVmaW5lIEFVWF9GSUZPX01B
WF9TSVpFIDE2DQogI2RlZmluZSBQSVhFTF9DTEtfREVMQVkgMQ0KICNkZWZpbmUgUElYRUxfQ0xL
X0lOVkVSU0UgMA0KICNkZWZpbmUgQURKVVNUX1BIQVNFX1RIUkVTSE9MRCA4MDAwMA0KQEAgLTMy
NCw4ICszMjQsMTMgQEAgZW51bSBhdXhfY21kX3R5cGUgew0KIAlDTURfQVVYX05BVElWRV9SRUFE
ID0gMHgwLA0KIAlDTURfQVVYX05BVElWRV9XUklURSA9IDB4NSwNCiAJQ01EX0FVWF9JMkNfRURJ
RF9SRUFEID0gMHhCLA0KKw0KKwkvKiBLU1YgbGlzdCByZWFkIHVzaW5nIEFVWCBuYXRpdmUgcmVh
ZCB3aXRoIEZJRk8gKi8NCisJQ01EX0FVWF9HRVRfS1NWX0xJU1QgPSAweDEwLA0KIH07DQogDQor
I2RlZmluZSBHRVRfQVVYX0NPTlRST0xfQ09ERShjbWQpICgoY21kKSAmIDB4MEYpDQorDQogZW51
bSBhdXhfY21kX3JlcGx5IHsNCiAJUkVQTFlfQUNLLA0KIAlSRVBMWV9OQUNLLA0KQEAgLTk2NSw3
ICs5NzAsOCBAQCBzdGF0aWMgc3NpemVfdCBpdDY1MDVfYXV4X29wZXJhdGlvbihzdHJ1Y3QgaXQ2
NTA1ICppdDY1MDUsDQogCWl0NjUwNV9zZXRfYml0cyhpdDY1MDUsIFJFR19BVVhfQ1RSTCwgQVVY
X1VTRVJfTU9ERSwgQVVYX1VTRVJfTU9ERSk7DQogDQogYXV4X29wX3N0YXJ0Og0KLQlpZiAoY21k
ID09IENNRF9BVVhfSTJDX0VESURfUkVBRCkgew0KKwkvKiBIVyBBVVggRklGTyBzdXBwb3J0cyBv
bmx5IEVESUQgYW5kIERDUEQgS1NWIEZJRk8gYXJlYWQgKi8NCisJaWYgKGNtZCA9PSBDTURfQVVY
X0kyQ19FRElEX1JFQUQgfHwgY21kID09IENNRF9BVVhfR0VUX0tTVl9MSVNUKSB7DQogCQkvKiBB
VVggRURJRCBGSUZPIGhhcyBtYXggbGVuZ3RoIG9mIEFVWF9GSUZPX01BWF9TSVpFIGJ5dGVzLiAq
Lw0KIAkJc2l6ZSA9IG1pbl90KHNpemVfdCwgc2l6ZSwgQVVYX0ZJRk9fTUFYX1NJWkUpOw0KIAkJ
LyogRW5hYmxlIEFVWCBGSUZPIHJlYWQgYmFjayBhbmQgY2xlYXIgRklGTyAqLw0KQEAgLTk5Niw3
ICsxMDAyLDcgQEAgc3RhdGljIHNzaXplX3QgaXQ2NTA1X2F1eF9vcGVyYXRpb24oc3RydWN0IGl0
NjUwNSAqaXQ2NTA1LA0KIAkJCQkgIHNpemUpOw0KIA0KIAkvKiBBdXggRmlyZSAqLw0KLQlpdDY1
MDVfd3JpdGUoaXQ2NTA1LCBSRUdfQVVYX0NNRF9SRVEsIGNtZCk7DQorCWl0NjUwNV93cml0ZShp
dDY1MDUsIFJFR19BVVhfQ01EX1JFUSwgR0VUX0FVWF9DT05UUk9MX0NPREUoY21kKSk7DQogDQog
CXJldCA9IGl0NjUwNV9hdXhfd2FpdChpdDY1MDUpOw0KIAlpZiAocmV0IDwgMCkNCkBAIC0xMDMw
LDcgKzEwMzYsNyBAQCBzdGF0aWMgc3NpemVfdCBpdDY1MDVfYXV4X29wZXJhdGlvbihzdHJ1Y3Qg
aXQ2NTA1ICppdDY1MDUsDQogCQlnb3RvIGF1eF9vcF9zdGFydDsNCiAJfQ0KIA0KLQlpZiAoY21k
ID09IENNRF9BVVhfSTJDX0VESURfUkVBRCkgew0KKwlpZiAoY21kID09IENNRF9BVVhfSTJDX0VE
SURfUkVBRCB8fCBjbWQgPT0gQ01EX0FVWF9HRVRfS1NWX0xJU1QpIHsNCiAJCWZvciAoaSA9IDA7
IGkgPCBzaXplOyBpKyspIHsNCiAJCQlyZXQgPSBpdDY1MDVfcmVhZChpdDY1MDUsIFJFR19BVVhf
REFUQV9GSUZPKTsNCiAJCQlpZiAocmV0IDwgMCkNCkBAIC0xMDU1LDcgKzEwNjEsNyBAQCBzdGF0
aWMgc3NpemVfdCBpdDY1MDVfYXV4X29wZXJhdGlvbihzdHJ1Y3QgaXQ2NTA1ICppdDY1MDUsDQog
CXJldCA9IGk7DQogDQogYXV4X29wX2VycjoNCi0JaWYgKGNtZCA9PSBDTURfQVVYX0kyQ19FRElE
X1JFQUQpIHsNCisJaWYgKGNtZCA9PSBDTURfQVVYX0kyQ19FRElEX1JFQUQgfHwgY21kID09IENN
RF9BVVhfR0VUX0tTVl9MSVNUKSB7DQogCQkvKiBjbGVhciBBVVggRklGTyAqLw0KIAkJaXQ2NTA1
X3NldF9iaXRzKGl0NjUwNSwgUkVHX0FVWF9DVFJMLA0KIAkJCQlBVVhfRU5fRklGT19SRUFEIHwg
Q0xSX0VESURfRklGTywNCkBAIC0xMDc4LDggKzEwODQsMTEgQEAgc3RhdGljIHNzaXplX3QgaXQ2
NTA1X2F1eF9kb190cmFuc2ZlcihzdHJ1Y3QgaXQ2NTA1ICppdDY1MDUsDQogCWludCBpLCByZXRf
c2l6ZSwgcmV0ID0gMCwgcmVxdWVzdF9zaXplOw0KIA0KIAltdXRleF9sb2NrKCZpdDY1MDUtPmF1
eF9sb2NrKTsNCi0JZm9yIChpID0gMDsgaSA8IHNpemU7IGkgKz0gNCkgew0KLQkJcmVxdWVzdF9z
aXplID0gbWluKChpbnQpc2l6ZSAtIGksIDQpOw0KKwlmb3IgKGkgPSAwOyBpIDwgc2l6ZTsgKSB7
DQorCQlpZiAoY21kID09IENNRF9BVVhfSTJDX0VESURfUkVBRCB8fCBjbWQgPT0gQ01EX0FVWF9H
RVRfS1NWX0xJU1QpDQorCQkJcmVxdWVzdF9zaXplID0gbWluX3QoaW50LCAoaW50KXNpemUgLSBp
LCBBVVhfRklGT19NQVhfU0laRSk7DQorCQllbHNlDQorCQkJcmVxdWVzdF9zaXplID0gbWluX3Qo
aW50LCAoaW50KXNpemUgLSBpLCA0KTsNCiAJCXJldF9zaXplID0gaXQ2NTA1X2F1eF9vcGVyYXRp
b24oaXQ2NTA1LCBjbWQsIGFkZHJlc3MgKyBpLA0KIAkJCQkJCWJ1ZmZlciArIGksIHJlcXVlc3Rf
c2l6ZSwNCiAJCQkJCQlyZXBseSk7DQpAQCAtMTA4OCw2ICsxMDk3LDcgQEAgc3RhdGljIHNzaXpl
X3QgaXQ2NTA1X2F1eF9kb190cmFuc2ZlcihzdHJ1Y3QgaXQ2NTA1ICppdDY1MDUsDQogCQkJZ290
byBhdXhfb3BfZXJyOw0KIAkJfQ0KIA0KKwkJaSArPSByZXF1ZXN0X3NpemU7DQogCQlyZXQgKz0g
cmV0X3NpemU7DQogCX0NCiANCkBAIC0yMjU3LDcgKzIyNjcsNiBAQCBzdGF0aWMgdm9pZCBpdDY1
MDVfbGlua190cmFpbmluZ193b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCiAJCWl0NjUw
NS0+YXV0b190cmFpbl9yZXRyeS0tOw0KIAkJaXQ2NTA1X2R1bXAoaXQ2NTA1KTsNCiAJfQ0KLQ0K
IH0NCiANCiBzdGF0aWMgdm9pZCBpdDY1MDVfcGx1Z2dlZF9zdGF0dXNfdG9fY29kZWMoc3RydWN0
IGl0NjUwNSAqaXQ2NTA1KQ0KLS0gDQoyLjM0LjENCg0K
