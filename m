Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446FA56BD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F83C8908D;
	Mon,  2 Sep 2019 12:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CD489097
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:54:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x82CsdTa119941;
 Mon, 2 Sep 2019 07:54:39 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x82CscQd102330
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Sep 2019 07:54:38 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 2 Sep
 2019 07:54:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 2 Sep 2019 07:54:38 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x82CsYYJ126767;
 Mon, 2 Sep 2019 07:54:37 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/7] drm/omap: drop unneeded locking from mgr_fld_write()
Date: Mon, 2 Sep 2019 15:53:53 +0300
Message-ID: <20190902125359.18001-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190902125359.18001-1-tomi.valkeinen@ti.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1567428879;
 bh=3dcgr/HHnffSgx711bGgM8Zuy905mPx0AIMK1mpRVlw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yayPyDWYDkmVT58nyIVGwsGdcAgB1vQQYZ9dTHM0puuE7YG4Obei97cWsVDorjdK3
 RM8B1Xonzy11XOd62KsSOvrtk1AeOD90KNiF8l7HnE8vdBKkFkbNUKDtbWUVmJLZKO
 X5qiwCU9y6cimEhfAnrkvapxMEoyO/MAgQiG18Eg=
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

Q29tbWl0IGQ0OWNkMTU1NTBkOWQ0NDk1ZjYxODc0MjUzMThjMjQ1ZDU4Y2I2M2YgKCJPTUFQRFNT
OiBESVNQQzogbG9jawphY2Nlc3MgdG8gRElTUENfQ09OVFJPTCAmIERJU1BDX0NPTkZJRyIpIGFk
ZGVkIGxvY2tpbmcgdG8KbWdyX2ZsZF93cml0ZSgpLiBUaGlzIHdhcyBuZWVkZWQgaW4gb21hcGZi
IHRpbWVzIGR1ZSB0byBsYWNrIG9mIGdvb2QKbG9ja2luZywgZXNwZWNpYWxseSBpbiB0aGUgY2Fz
ZSBvZiBib3RoIFY0TDIgYW5kIGZiZGV2IGxheWVycyB1c2luZyB0aGUKRFNTIGRyaXZlci4KClRo
aXMgaXMgbm90IG5lZWRlZCBmb3Igb21hcGRybSwgc28gd2UgY2FuIHJlbW92ZSB0aGUgbG9ja2lu
Zy4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmMgfCAxNiArLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmMKaW5kZXggNzg1YzU1NDYwNjdhLi5jNmRhMzNl
NzAxNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jCkBAIC0xODQsOSArMTg0LDYg
QEAgc3RydWN0IGRpc3BjX2RldmljZSB7CiAKIAlzdHJ1Y3QgcmVnbWFwICpzeXNjb25fcG9sOwog
CXUzMiBzeXNjb25fcG9sX29mZnNldDsKLQotCS8qIERJU1BDX0NPTlRST0wgJiBESVNQQ19DT05G
SUcgbG9jayovCi0Jc3BpbmxvY2tfdCBjb250cm9sX2xvY2s7CiB9OwogCiBlbnVtIG9tYXBfY29s
b3JfY29tcG9uZW50IHsKQEAgLTM3NywxNiArMzc0LDcgQEAgc3RhdGljIHZvaWQgbWdyX2ZsZF93
cml0ZShzdHJ1Y3QgZGlzcGNfZGV2aWNlICpkaXNwYywgZW51bSBvbWFwX2NoYW5uZWwgY2hhbm5l
bCwKIAkJCSAgZW51bSBtZ3JfcmVnX2ZpZWxkcyByZWdmbGQsIGludCB2YWwpCiB7CiAJY29uc3Qg
c3RydWN0IGRpc3BjX3JlZ19maWVsZCByZmxkID0gbWdyX2Rlc2NbY2hhbm5lbF0ucmVnX2Rlc2Nb
cmVnZmxkXTsKLQljb25zdCBib29sIG5lZWRfbG9jayA9IHJmbGQucmVnID09IERJU1BDX0NPTlRS
T0wgfHwgcmZsZC5yZWcgPT0gRElTUENfQ09ORklHOwotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0K
LQlpZiAobmVlZF9sb2NrKSB7Ci0JCXNwaW5fbG9ja19pcnFzYXZlKCZkaXNwYy0+Y29udHJvbF9s
b2NrLCBmbGFncyk7Ci0JCVJFR19GTERfTU9EKGRpc3BjLCByZmxkLnJlZywgdmFsLCByZmxkLmhp
Z2gsIHJmbGQubG93KTsKLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGlzcGMtPmNvbnRyb2xf
bG9jaywgZmxhZ3MpOwotCX0gZWxzZSB7Ci0JCVJFR19GTERfTU9EKGRpc3BjLCByZmxkLnJlZywg
dmFsLCByZmxkLmhpZ2gsIHJmbGQubG93KTsKLQl9CisJUkVHX0ZMRF9NT0QoZGlzcGMsIHJmbGQu
cmVnLCB2YWwsIHJmbGQuaGlnaCwgcmZsZC5sb3cpOwogfQogCiBzdGF0aWMgaW50IGRpc3BjX2dl
dF9udW1fb3ZscyhzdHJ1Y3QgZGlzcGNfZGV2aWNlICpkaXNwYykKQEAgLTQ3NjksOCArNDc1Nyw2
IEBAIHN0YXRpYyBpbnQgZGlzcGNfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZp
Y2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkaXNw
Yyk7CiAJZGlzcGMtPmRzcyA9IGRzczsKIAotCXNwaW5fbG9ja19pbml0KCZkaXNwYy0+Y29udHJv
bF9sb2NrKTsKLQogCS8qCiAJICogVGhlIE9NQVAzLWJhc2VkIG1vZGVscyBjYW4ndCBiZSB0b2xk
IGFwYXJ0IHVzaW5nIHRoZSBjb21wYXRpYmxlCiAJICogc3RyaW5nLCB1c2UgU29DIGRldmljZSBt
YXRjaGluZy4KLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUg
MjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3Rp
cGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
