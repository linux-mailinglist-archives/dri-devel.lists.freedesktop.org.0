Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDAC3C1410
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 15:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C269C6E8C6;
	Thu,  8 Jul 2021 13:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 08 Jul 2021 10:19:30 UTC
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 30FE16E08C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 10:19:30 +0000 (UTC)
X-UUID: b52e43e1cd4a44ea8bab0ad0d062c7cc-20210708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BdKf2p9ZqSn+V2IGWR+PNooNX2lJcGUJfQegrqEiVdM=; 
 b=b9KBXnQhFfVkALohUmv/2LnhbOt1iUi904ILwVtQ1tYHLOaWrXl1XYroC752ZyZqDtJex2kTKqACUwgbm3cX8vQjTL97yy4w4zDXL8YDUxLp+ybU6dYhlz1T18HznDFrejFTF7tLeIyBkuB8OEs6eyMkf03jlsC5iSjlHijj/DE=;
X-UUID: b52e43e1cd4a44ea8bab0ad0d062c7cc-20210708
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 290473540; Thu, 08 Jul 2021 18:14:25 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 18:14:23 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 MTKCAS06.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 8 Jul 2021 18:14:22 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] dma-heap: Let dma heap use dma_map_attrs to map & unmap iova
Date: Thu, 8 Jul 2021 18:14:21 +0800
Message-ID: <20210708101421.9101-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 879CEDBA69CA375324736404F3170BD4C1626A51C81092302B49131EC5ACEC612000:8
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Thu, 08 Jul 2021 13:15:22 +0000
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
Cc: Guangming Cao <Guangming.Cao@mediatek.com>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-mediatek@lists.infradead.org, Laura Abbott <labbott@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+DQoNCkZvciBk
bWEtaGVhcCB1c2VycywgdGhleSBjYW4ndCBieXBhc3MgY2FjaGUgc3luYyB3aGVuIG1hcC91bm1h
cCBpb3ZhDQp3aXRoIGRtYSBoZWFwLiBCdXQgdGhleSBjYW4gZG8gaXQgYnkgYWRkaW5nIERNQV9B
VFRSX1NLSVBfQ1BVX1NZTkMNCmludG8gZG1hX2FsbG9jX2F0dHJzLg0KDQpUbyBrZWVwIGFsaWdu
bWVudCwgYXQgZG1hX2hlYXAgc2lkZSwgYWxzbyB1c2UNCmRtYV9idWZfYXR0YWNobWVudC5kbWFf
bWFwX2F0dHJzIHRvIGRvIGlvdmEgbWFwICYgdW5tYXAuDQoNClNpZ25lZC1vZmYtYnk6IEd1YW5n
bWluZyBDYW8gPEd1YW5nbWluZy5DYW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9kbWEt
YnVmL2hlYXBzL2NtYV9oZWFwLmMgICAgfCA2ICsrKystLQ0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9zeXN0ZW1faGVhcC5jIHwgNiArKysrLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9jbWFfaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMNCmluZGV4IDBj
MDViNzk4NzBmOS4uMmM5ZmViM2JmYzNlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hl
YXBzL2NtYV9oZWFwLmMNCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jDQpA
QCAtOTksOSArOTksMTAgQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqY21hX2hlYXBfbWFwX2Rt
YV9idWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNobWUNCiB7DQogCXN0cnVjdCBk
bWFfaGVhcF9hdHRhY2htZW50ICphID0gYXR0YWNobWVudC0+cHJpdjsNCiAJc3RydWN0IHNnX3Rh
YmxlICp0YWJsZSA9ICZhLT50YWJsZTsNCisJaW50IGF0dHJzID0gYXR0YWNobWVudC0+ZG1hX21h
cF9hdHRyczsNCiAJaW50IHJldDsNCiANCi0JcmV0ID0gZG1hX21hcF9zZ3RhYmxlKGF0dGFjaG1l
bnQtPmRldiwgdGFibGUsIGRpcmVjdGlvbiwgMCk7DQorCXJldCA9IGRtYV9tYXBfc2d0YWJsZShh
dHRhY2htZW50LT5kZXYsIHRhYmxlLCBkaXJlY3Rpb24sIGF0dHJzKTsNCiAJaWYgKHJldCkNCiAJ
CXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KIAlhLT5tYXBwZWQgPSB0cnVlOw0KQEAgLTExMyw5
ICsxMTQsMTAgQEAgc3RhdGljIHZvaWQgY21hX2hlYXBfdW5tYXBfZG1hX2J1ZihzdHJ1Y3QgZG1h
X2J1Zl9hdHRhY2htZW50ICphdHRhY2htZW50LA0KIAkJCQkgICBlbnVtIGRtYV9kYXRhX2RpcmVj
dGlvbiBkaXJlY3Rpb24pDQogew0KIAlzdHJ1Y3QgZG1hX2hlYXBfYXR0YWNobWVudCAqYSA9IGF0
dGFjaG1lbnQtPnByaXY7DQorCWludCBhdHRycyA9IGF0dGFjaG1lbnQtPmRtYV9tYXBfYXR0cnM7
DQogDQogCWEtPm1hcHBlZCA9IGZhbHNlOw0KLQlkbWFfdW5tYXBfc2d0YWJsZShhdHRhY2htZW50
LT5kZXYsIHRhYmxlLCBkaXJlY3Rpb24sIDApOw0KKwlkbWFfdW5tYXBfc2d0YWJsZShhdHRhY2ht
ZW50LT5kZXYsIHRhYmxlLCBkaXJlY3Rpb24sIGF0dHJzKTsNCiB9DQogDQogc3RhdGljIGludCBj
bWFfaGVhcF9kbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3Moc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYyBiL2RyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jDQppbmRleCAyM2E3ZTc0ZWY5NjYuLmZjN2Ix
ZTAyOTg4ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5j
DQorKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYw0KQEAgLTEzMCw5ICsx
MzAsMTAgQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqc3lzdGVtX2hlYXBfbWFwX2RtYV9idWYo
c3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWMNCiB7DQogCXN0cnVjdCBkbWFfaGVhcF9h
dHRhY2htZW50ICphID0gYXR0YWNobWVudC0+cHJpdjsNCiAJc3RydWN0IHNnX3RhYmxlICp0YWJs
ZSA9IGEtPnRhYmxlOw0KKwlpbnQgYXR0cnMgPSBhdHRhY2htZW50LT5kbWFfbWFwX2F0dHJzOw0K
IAlpbnQgcmV0Ow0KIA0KLQlyZXQgPSBkbWFfbWFwX3NndGFibGUoYXR0YWNobWVudC0+ZGV2LCB0
YWJsZSwgZGlyZWN0aW9uLCAwKTsNCisJcmV0ID0gZG1hX21hcF9zZ3RhYmxlKGF0dGFjaG1lbnQt
PmRldiwgdGFibGUsIGRpcmVjdGlvbiwgYXR0cnMpOw0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIEVS
Ul9QVFIocmV0KTsNCiANCkBAIC0xNDUsOSArMTQ2LDEwIEBAIHN0YXRpYyB2b2lkIHN5c3RlbV9o
ZWFwX3VubWFwX2RtYV9idWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNobWVudCwN
CiAJCQkJICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQ0KIHsNCiAJc3Ry
dWN0IGRtYV9oZWFwX2F0dGFjaG1lbnQgKmEgPSBhdHRhY2htZW50LT5wcml2Ow0KKwlpbnQgYXR0
cnMgPSBhdHRhY2htZW50LT5kbWFfbWFwX2F0dHJzOw0KIA0KIAlhLT5tYXBwZWQgPSBmYWxzZTsN
Ci0JZG1hX3VubWFwX3NndGFibGUoYXR0YWNobWVudC0+ZGV2LCB0YWJsZSwgZGlyZWN0aW9uLCAw
KTsNCisJZG1hX3VubWFwX3NndGFibGUoYXR0YWNobWVudC0+ZGV2LCB0YWJsZSwgZGlyZWN0aW9u
LCBhdHRycyk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgc3lzdGVtX2hlYXBfZG1hX2J1Zl9iZWdpbl9j
cHVfYWNjZXNzKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsDQotLSANCjIuMTcuMQ0K

