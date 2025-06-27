Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE933AEB5B6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149F010E9D2;
	Fri, 27 Jun 2025 11:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="ehTRUkDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
 by gabe.freedesktop.org (Postfix) with SMTP id B3C1810E9CE;
 Fri, 27 Jun 2025 11:03:37 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.71.38])
 by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 69C23180FFD57A;
 Fri, 27 Jun 2025 19:02:31 +0800 (CST)
Received: from BJ03-ACTMBX-08.didichuxing.com (10.79.71.35) by
 BJ03-ACTMBX-02.didichuxing.com (10.79.71.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 19:03:14 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ03-ACTMBX-08.didichuxing.com (10.79.71.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 19:03:13 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e%7]) with
 mapi id 15.02.1748.010; Fri, 27 Jun 2025 19:03:13 +0800
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
Subject: [PATCH v3 4/4] ext4: support uncached buffered I/O
Thread-Topic: [PATCH v3 4/4] ext4: support uncached buffered I/O
Thread-Index: AQHb51MTaMwhJCsRP0eEgBCVUoPCoQ==
Date: Fri, 27 Jun 2025 11:03:13 +0000
Message-ID: <20250627110257.1870826-5-chentaotao@didiglobal.com>
In-Reply-To: <20250627110257.1870826-1-chentaotao@didiglobal.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.64.102]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
 s=2025; t=1751022173;
 bh=4rXllrq3i00vA/X/MCfjVxkg+yARKY9+OylzC6mFE+c=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=ehTRUkDpCbEGkhMZpTTEM7DPSDb/UWxpKKgQP/Vy9sHFH/sbmH4ptirGdI2TC8yxO
 mZHpZNlUxGBa0YCbHJ9au4BOMGEAd3oFTVzILrWnaR5BANeKmYT+Ta2GlMcEnb/u4G
 uyBuOmOz7hUFR4dKovFjwFMs6SSIi6KRO/Nb5knw=
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

RnJvbTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQoNClNldCBGT1Bf
RE9OVENBQ0hFIGluIGV4dDRfZmlsZV9vcGVyYXRpb25zIHRvIGRlY2xhcmUgc3VwcG9ydCBmb3IN
CnVuY2FjaGVkIGJ1ZmZlcmVkIEkvTy4NCg0KVG8gaGFuZGxlIHRoaXMgZmxhZywgYWRkIHByb2Nl
c3NpbmcgZm9yIElPQ0JfRE9OVENBQ0hFIGluDQpleHQ0X3dyaXRlX2JlZ2luKCkgYW5kIGV4dDRf
ZGFfd3JpdGVfYmVnaW4oKSBieSBwYXNzaW5nIEZHUF9ET05UQ0FDSEUNCnRvIHBhZ2UgY2FjaGUg
bG9va3Vwcy4NCg0KUGFydCBvZiBhIHNlcmllcyByZWZhY3RvcmluZyBhZGRyZXNzX3NwYWNlX29w
ZXJhdGlvbnMgd3JpdGVfYmVnaW4gYW5kDQp3cml0ZV9lbmQgY2FsbGJhY2tzIHRvIHVzZSBzdHJ1
Y3Qga2lvY2IgZm9yIHBhc3Npbmcgd3JpdGUgY29udGV4dCBhbmQNCmZsYWdzLg0KDQpTaWduZWQt
b2ZmLWJ5OiBUYW90YW8gQ2hlbiA8Y2hlbnRhb3Rhb0BkaWRpZ2xvYmFsLmNvbT4NCi0tLQ0KIGZz
L2V4dDQvZmlsZS5jICB8IDMgKystDQogZnMvZXh0NC9pbm9kZS5jIHwgNiArKysrKysNCiAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0
IGEvZnMvZXh0NC9maWxlLmMgYi9mcy9leHQ0L2ZpbGUuYw0KaW5kZXggMjFkZjgxMzQ3MTQ3Li4y
NzRiNDFhNDc2YzggMTAwNjQ0DQotLS0gYS9mcy9leHQ0L2ZpbGUuYw0KKysrIGIvZnMvZXh0NC9m
aWxlLmMNCkBAIC05NzcsNyArOTc3LDggQEAgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBl
eHQ0X2ZpbGVfb3BlcmF0aW9ucyA9IHsNCiAJLnNwbGljZV93cml0ZQk9IGl0ZXJfZmlsZV9zcGxp
Y2Vfd3JpdGUsDQogCS5mYWxsb2NhdGUJPSBleHQ0X2ZhbGxvY2F0ZSwNCiAJLmZvcF9mbGFncwk9
IEZPUF9NTUFQX1NZTkMgfCBGT1BfQlVGRkVSX1JBU1lOQyB8DQotCQkJICBGT1BfRElPX1BBUkFM
TEVMX1dSSVRFLA0KKwkJCSAgRk9QX0RJT19QQVJBTExFTF9XUklURSB8DQorCQkJICBGT1BfRE9O
VENBQ0hFLA0KIH07DQogDQogY29uc3Qgc3RydWN0IGlub2RlX29wZXJhdGlvbnMgZXh0NF9maWxl
X2lub2RlX29wZXJhdGlvbnMgPSB7DQpkaWZmIC0tZ2l0IGEvZnMvZXh0NC9pbm9kZS5jIGIvZnMv
ZXh0NC9pbm9kZS5jDQppbmRleCAwOGMxMDIwMGQ2ZmUuLjYzOWUyZTIzMWM0YiAxMDA2NDQNCi0t
LSBhL2ZzL2V4dDQvaW5vZGUuYw0KKysrIGIvZnMvZXh0NC9pbm9kZS5jDQpAQCAtMTI3MCw2ICsx
MjcwLDkgQEAgc3RhdGljIGludCBleHQ0X3dyaXRlX2JlZ2luKGNvbnN0IHN0cnVjdCBraW9jYiAq
aW9jYiwNCiAJaWYgKHVubGlrZWx5KHJldCkpDQogCQlyZXR1cm4gcmV0Ow0KIA0KKwlpZiAoaW9j
Yi0+a2lfZmxhZ3MgJiBJT0NCX0RPTlRDQUNIRSkNCisJCWZncCB8PSBGR1BfRE9OVENBQ0hFOw0K
Kw0KIAl0cmFjZV9leHQ0X3dyaXRlX2JlZ2luKGlub2RlLCBwb3MsIGxlbik7DQogCS8qDQogCSAq
IFJlc2VydmUgb25lIGJsb2NrIG1vcmUgZm9yIGFkZGl0aW9uIHRvIG9ycGhhbiBsaXN0IGluIGNh
c2UNCkBAIC0zMDY4LDYgKzMwNzEsOSBAQCBzdGF0aWMgaW50IGV4dDRfZGFfd3JpdGVfYmVnaW4o
Y29uc3Qgc3RydWN0IGtpb2NiICppb2NiLA0KIAkJCXJldHVybiAwOw0KIAl9DQogDQorCWlmIChp
b2NiLT5raV9mbGFncyAmIElPQ0JfRE9OVENBQ0hFKQ0KKwkJZmdwIHw9IEZHUF9ET05UQ0FDSEU7
DQorDQogcmV0cnk6DQogCWZncCB8PSBmZ2Zfc2V0X29yZGVyKGxlbik7DQogCWZvbGlvID0gX19m
aWxlbWFwX2dldF9mb2xpbyhtYXBwaW5nLCBpbmRleCwgZmdwLA0KLS0gDQoyLjM0LjENCg==
