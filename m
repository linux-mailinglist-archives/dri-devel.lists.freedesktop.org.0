Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4052AE6D1B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2F310E5F4;
	Tue, 24 Jun 2025 16:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="aA5b0ent";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
 by gabe.freedesktop.org (Postfix) with SMTP id 5AE9489580;
 Tue, 24 Jun 2025 12:24:36 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.64.20])
 by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 06118187957BCC; 
 Tue, 24 Jun 2025 20:11:31 +0800 (CST)
Received: from BJ01-ACTMBX-07.didichuxing.com (10.79.64.14) by
 BJ01-ACTMBX-01.didichuxing.com (10.79.64.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 20:12:10 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ01-ACTMBX-07.didichuxing.com (10.79.64.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 20:12:09 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::b00b:de35:2067:9787]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::b00b:de35:2067:9787%7]) with
 mapi id 15.02.1748.010; Tue, 24 Jun 2025 20:12:09 +0800
X-MD-Sfrom: chentaotao@didiglobal.com
X-MD-SrcIP: 10.79.64.20
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
 =?gb2312?B?s8LMzszOIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
Subject: [PATCH v2 4/5] ext4: handle IOCB_DONTCACHE in buffered write path
Thread-Topic: [PATCH v2 4/5] ext4: handle IOCB_DONTCACHE in buffered write path
Thread-Index: AQHb5QE1yGRcX3naAEuwD6HzjMhP6Q==
Date: Tue, 24 Jun 2025 12:12:09 +0000
Message-ID: <20250624121149.2927-5-chentaotao@didiglobal.com>
In-Reply-To: <20250624121149.2927-1-chentaotao@didiglobal.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.64.102]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
 s=2025; t=1750767112;
 bh=UUOG9CnjyAD4jWpFLTC0doAjRjHNZAiWQCI/Hwlwayg=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=aA5b0entemeSUTUM68+duldd0xmEU+TuNweqA1Zwyg6zKSSslLqekm1ZTqq53Py+k
 QXFs+50AmoUq8r/dLYGr5rk5tV2ZPkhF2JdL23bTlKZgWiS64ttVhcPjfpB7waWey7
 oOfmLnJpgrV4Epk/UiDqQZqbbMuQqN7PuMSRXEZM=
X-Mailman-Approved-At: Tue, 24 Jun 2025 16:58:05 +0000
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

RnJvbTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQoNCkFkZCBzdXBw
b3J0IGZvciB0aGUgSU9DQl9ET05UQ0FDSEUgZmxhZyBpbiBleHQ0X3dyaXRlX2JlZ2luKCkgYW5k
DQpleHQ0X2RhX3dyaXRlX2JlZ2luKCkuIFdoZW4gc2V0IGluIHRoZSBraW9jYiwgdGhlIEZHUF9E
T05UQ0FDSEUgYml0DQppcyBwYXNzZWQgdG8gdGhlIHBhZ2UgY2FjaGUgbG9va3VwLCBwcmV2ZW50
aW5nIHdyaXR0ZW4gcGFnZXMgZnJvbQ0KYmVpbmcgcmV0YWluZWQgaW4gdGhlIGNhY2hlLg0KDQpP
bmx5IHRoZSBoYW5kbGluZyBsb2dpYyBpcyBpbXBsZW1lbnRlZCBoZXJlOyB0aGUgYmVoYXZpb3Ig
cmVtYWlucw0KaW5hY3RpdmUgdW50aWwgZXh0NCBhZHZlcnRpc2VzIHN1cHBvcnQgdmlhIEZPUF9E
T05UQ0FDSEUuDQoNClRoaXMgY2hhbmdlIHJlbGllcyBvbiBwcmlvciBwYXRjaGVzIHRoYXQgcmVm
YWN0b3IgdGhlIHdyaXRlX2JlZ2luDQppbnRlcmZhY2UgdG8gdXNlIHN0cnVjdCBraW9jYiBhbmQg
aW50cm9kdWNlIERPTlRDQUNIRSBoYW5kbGluZyBpbiBleHQ0Lg0KDQpQYXJ0IG9mIGEgc2VyaWVz
IHJlZmFjdG9yaW5nIGFkZHJlc3Nfc3BhY2Vfb3BlcmF0aW9ucyB3cml0ZV9iZWdpbiBhbmQNCndy
aXRlX2VuZCBjYWxsYmFja3MgdG8gdXNlIHN0cnVjdCBraW9jYiBmb3IgcGFzc2luZyB3cml0ZSBj
b250ZXh0IGFuZA0KZmxhZ3MuDQoNClNpZ25lZC1vZmYtYnk6IFRhb3RhbyBDaGVuIDxjaGVudGFv
dGFvQGRpZGlnbG9iYWwuY29tPg0KLS0tDQogZnMvZXh0NC9pbm9kZS5jIHwgNiArKysrKysNCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9mcy9leHQ0L2lu
b2RlLmMgYi9mcy9leHQ0L2lub2RlLmMNCmluZGV4IDdmZjcwMDlmOTc5OS4uM2E4MmI1MjU2NWNj
IDEwMDY0NA0KLS0tIGEvZnMvZXh0NC9pbm9kZS5jDQorKysgYi9mcy9leHQ0L2lub2RlLmMNCkBA
IC0xMjY5LDYgKzEyNjksOSBAQCBzdGF0aWMgaW50IGV4dDRfd3JpdGVfYmVnaW4oc3RydWN0IGtp
b2NiICppb2NiLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywNCiAJaWYgKHVubGlrZWx5
KHJldCkpDQogCQlyZXR1cm4gcmV0Ow0KIA0KKwlpZiAoaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX0RP
TlRDQUNIRSkNCisJCWZncCB8PSBGR1BfRE9OVENBQ0hFOw0KKw0KIAl0cmFjZV9leHQ0X3dyaXRl
X2JlZ2luKGlub2RlLCBwb3MsIGxlbik7DQogCS8qDQogCSAqIFJlc2VydmUgb25lIGJsb2NrIG1v
cmUgZm9yIGFkZGl0aW9uIHRvIG9ycGhhbiBsaXN0IGluIGNhc2UNCkBAIC0zMDY2LDYgKzMwNjks
OSBAQCBzdGF0aWMgaW50IGV4dDRfZGFfd3JpdGVfYmVnaW4oc3RydWN0IGtpb2NiICppb2NiLCBz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZw0KIAkJCXJldHVybiAwOw0KIAl9DQogDQorCWlm
IChpb2NiLT5raV9mbGFncyAmIElPQ0JfRE9OVENBQ0hFKQ0KKwkJZmdwIHw9IEZHUF9ET05UQ0FD
SEU7DQorDQogcmV0cnk6DQogCWZncCB8PSBmZ2Zfc2V0X29yZGVyKGxlbik7DQogCWZvbGlvID0g
X19maWxlbWFwX2dldF9mb2xpbyhtYXBwaW5nLCBpbmRleCwgZmdwLA0KLS0gDQoyLjM0LjENCg==
