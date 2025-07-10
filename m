Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9BAFFEDF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D86310E218;
	Thu, 10 Jul 2025 10:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="Z6/jK5gL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
 by gabe.freedesktop.org (Postfix) with SMTP id 5B87310E369;
 Thu, 10 Jul 2025 10:14:12 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.71.38])
 by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 86542181988061; 
 Thu, 10 Jul 2025 18:14:05 +0800 (CST)
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ03-ACTMBX-02.didichuxing.com (10.79.71.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 18:14:08 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 18:14:08 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e%7]) with
 mapi id 15.02.1748.010; Thu, 10 Jul 2025 18:14:08 +0800
X-MD-Sfrom: chentaotao@didiglobal.com
X-MD-SrcIP: 10.79.71.38
From: =?gb2312?B?s8LMzszOIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
To: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>, 
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "willy@infradead.org"
 <willy@infradead.org>, "brauner@kernel.org" <brauner@kernel.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>
CC: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "chentao325@qq.com" <chentao325@qq.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 =?gb2312?B?s8LMzszOIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
Subject: [PATCH v5 1/5] drm/i915: Use kernel_write() in shmem object create
Thread-Topic: [PATCH v5 1/5] drm/i915: Use kernel_write() in shmem object
 create
Thread-Index: AQHb8YNfdAtlZSbKRkmOcPt/kk2Uzg==
Date: Thu, 10 Jul 2025 10:14:08 +0000
Message-ID: <20250710101404.362146-2-chentaotao@didiglobal.com>
In-Reply-To: <20250710101404.362146-1-chentaotao@didiglobal.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.64.102]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
 s=2025; t=1752142447;
 bh=G4rwVJYLKQqnce8QoPmaSGWeYFRMyGi7Hu7kmAMCExA=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=Z6/jK5gLCbJsbl1surobq42/zdAi8K0ts+lLuOOo9L4Wve9bIiesXsPmhPAF0ZPSV
 6gAGXSQuZVL0bCdS8qppbGk5s3xHO0UkTkNCWmJZqiL7CouGgjlKnXAO4j4TRwyUM1
 5oqHT1f42ie3Nn9qrDTrpX1cyFOI6vhKMS6fM4BM=
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

RnJvbTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQoNClJlcGxhY2Ug
dGhlIHdyaXRlX2JlZ2luL3dyaXRlX2VuZCBsb29wIGluDQppOTE1X2dlbV9vYmplY3RfY3JlYXRl
X3NobWVtX2Zyb21fZGF0YSgpIHdpdGggY2FsbCB0byBrZXJuZWxfd3JpdGUoKS4NCg0KVGhpcyBm
dW5jdGlvbiBpbml0aWFsaXplcyBzaG1lbS1iYWNrZWQgR0VNIG9iamVjdHMuIGtlcm5lbF93cml0
ZSgpDQpzaW1wbGlmaWVzIHRoZSBjb2RlIGJ5IHJlbW92aW5nIG1hbnVhbCBmb2xpbyBoYW5kbGlu
Zy4NCg0KUGFydCBvZiBhIHNlcmllcyByZWZhY3RvcmluZyBhZGRyZXNzX3NwYWNlX29wZXJhdGlv
bnMgd3JpdGVfYmVnaW4gYW5kDQp3cml0ZV9lbmQgY2FsbGJhY2tzIHRvIHVzZSBzdHJ1Y3Qga2lv
Y2IgZm9yIHBhc3Npbmcgd3JpdGUgY29udGV4dCBhbmQNCmZsYWdzLg0KDQpTaWduZWQtb2ZmLWJ5
OiBUYW90YW8gQ2hlbiA8Y2hlbnRhb3Rhb0BkaWRpZ2xvYmFsLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jIHwgMzMgKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5j
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3NobWVtLmMNCmluZGV4IDE5YTNl
YjgyZGM2YS4uMWU4ZjY2YWM0OGNhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX3NobWVtLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9zaG1lbS5jDQpAQCAtNjM3LDkgKzYzNyw4IEBAIGk5MTVfZ2VtX29iamVjdF9jcmVhdGVf
c2htZW1fZnJvbV9kYXRhKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LA0KIHsNCiAJc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iajsNCiAJc3RydWN0IGZpbGUgKmZpbGU7DQotCWNv
bnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgKmFvcHM7DQotCWxvZmZfdCBwb3M7
DQotCWludCBlcnI7DQorCWxvZmZfdCBwb3MgPSAwOw0KKwlzc2l6ZV90IGVycjsNCiANCiAJR0VN
X1dBUk5fT04oSVNfREdGWChpOTE1KSk7DQogCW9iaiA9IGk5MTVfZ2VtX29iamVjdF9jcmVhdGVf
c2htZW0oaTkxNSwgcm91bmRfdXAoc2l6ZSwgUEFHRV9TSVpFKSk7DQpAQCAtNjQ5LDI5ICs2NDgs
MTUgQEAgaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zaG1lbV9mcm9tX2RhdGEoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUsDQogCUdFTV9CVUdfT04ob2JqLT53cml0ZV9kb21haW4gIT0gSTkx
NV9HRU1fRE9NQUlOX0NQVSk7DQogDQogCWZpbGUgPSBvYmotPmJhc2UuZmlscDsNCi0JYW9wcyA9
IGZpbGUtPmZfbWFwcGluZy0+YV9vcHM7DQotCXBvcyA9IDA7DQotCWRvIHsNCi0JCXVuc2lnbmVk
IGludCBsZW4gPSBtaW5fdCh0eXBlb2Yoc2l6ZSksIHNpemUsIFBBR0VfU0laRSk7DQotCQlzdHJ1
Y3QgZm9saW8gKmZvbGlvOw0KLQkJdm9pZCAqZnNkYXRhOw0KLQ0KLQkJZXJyID0gYW9wcy0+d3Jp
dGVfYmVnaW4oZmlsZSwgZmlsZS0+Zl9tYXBwaW5nLCBwb3MsIGxlbiwNCi0JCQkJCSZmb2xpbywg
JmZzZGF0YSk7DQotCQlpZiAoZXJyIDwgMCkNCi0JCQlnb3RvIGZhaWw7DQorCWVyciA9IGtlcm5l
bF93cml0ZShmaWxlLCBkYXRhLCBzaXplLCAmcG9zKTsNCiANCi0JCW1lbWNweV90b19mb2xpbyhm
b2xpbywgb2Zmc2V0X2luX2ZvbGlvKGZvbGlvLCBwb3MpLCBkYXRhLCBsZW4pOw0KKwlpZiAoZXJy
IDwgMCkNCisJCWdvdG8gZmFpbDsNCiANCi0JCWVyciA9IGFvcHMtPndyaXRlX2VuZChmaWxlLCBm
aWxlLT5mX21hcHBpbmcsIHBvcywgbGVuLCBsZW4sDQotCQkJCSAgICAgIGZvbGlvLCBmc2RhdGEp
Ow0KLQkJaWYgKGVyciA8IDApDQotCQkJZ290byBmYWlsOw0KLQ0KLQkJc2l6ZSAtPSBsZW47DQot
CQlkYXRhICs9IGxlbjsNCi0JCXBvcyArPSBsZW47DQotCX0gd2hpbGUgKHNpemUpOw0KKwlpZiAo
ZXJyICE9IHNpemUpIHsNCisJCWVyciA9IC1FSU87DQorCQlnb3RvIGZhaWw7DQorCX0NCiANCiAJ
cmV0dXJuIG9iajsNCiANCi0tIA0KMi4zNC4xDQo=
