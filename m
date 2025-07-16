Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5263CB071CE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CDE10E6F2;
	Wed, 16 Jul 2025 09:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="lGGg1Bgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
 by gabe.freedesktop.org (Postfix) with SMTP id AA98110E702;
 Wed, 16 Jul 2025 09:36:11 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.65.19])
 by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 1C22918121AECF; 
 Wed, 16 Jul 2025 17:35:58 +0800 (CST)
Received: from BJ01-ACTMBX-07.didichuxing.com (10.79.64.14) by
 BJ02-ACTMBX-01.didichuxing.com (10.79.65.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 17:36:08 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ01-ACTMBX-07.didichuxing.com (10.79.64.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 17:36:08 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e%7]) with
 mapi id 15.02.1748.010; Wed, 16 Jul 2025 17:36:08 +0800
X-MD-Sfrom: chentaotao@didiglobal.com
X-MD-SrcIP: 10.79.65.19
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
Subject: [PATCH v6 4/5] mm/pagemap: add write_begin_get_folio() helper function
Thread-Topic: [PATCH v6 4/5] mm/pagemap: add write_begin_get_folio() helper
 function
Thread-Index: AQHb9jUPgZzrK/k9lEy+9mrsE7IzAA==
Date: Wed, 16 Jul 2025 09:36:08 +0000
Message-ID: <20250716093559.217344-5-chentaotao@didiglobal.com>
In-Reply-To: <20250716093559.217344-1-chentaotao@didiglobal.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.64.102]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
 s=2025; t=1752658559;
 bh=e+n/6AlPUc3DbRhJD+hzg5MV5KYpldOkq0RvjNrxVUY=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=lGGg1BgxPR4VvsH2yk1L93G8Ms3bNWyA9Z/eCB/UAxEAxWhJ1Q7vufMqoHnw6qmJU
 VUfIAqfpZ69l/IDEbX/N25f2SVLoJ3rPrb2tB0FnF/l3a5O3k2n0aZ9hRiywyXBCzC
 x0AsrkNqaiPAwabLsXspDIP24GussE9vs4fvf9+Q=
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

RnJvbTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQoNCkFkZCB3cml0
ZV9iZWdpbl9nZXRfZm9saW8oKSB0byBzaW1wbGlmeSB0aGUgY29tbW9uIGZvbGlvIGxvb2t1cCBs
b2dpYw0KdXNlZCBieSBmaWxlc3lzdGVtIC0+d3JpdGVfYmVnaW4oKSBpbXBsZW1lbnRhdGlvbnMu
DQoNClRoaXMgaGVscGVyIHdyYXBzIF9fZmlsZW1hcF9nZXRfZm9saW8oKSB3aXRoIGNvbW1vbiBm
bGFncyBzdWNoIGFzDQpGR1BfV1JJVEVCRUdJTiwgY29uZGl0aW9uYWwgRkdQX0RPTlRDQUNIRSwg
YW5kIHNldCBmb2xpbyBvcmRlciBiYXNlZA0Kb24gdGhlIHdyaXRlIGxlbmd0aC4NCg0KUGFydCBv
ZiBhIHNlcmllcyByZWZhY3RvcmluZyBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgd3JpdGVfYmVn
aW4gYW5kDQp3cml0ZV9lbmQgY2FsbGJhY2tzIHRvIHVzZSBzdHJ1Y3Qga2lvY2IgZm9yIHBhc3Np
bmcgd3JpdGUgY29udGV4dCBhbmQNCmZsYWdzLg0KDQpTaWduZWQtb2ZmLWJ5OiBUYW90YW8gQ2hl
biA8Y2hlbnRhb3Rhb0BkaWRpZ2xvYmFsLmNvbT4NCi0tLQ0KIGluY2x1ZGUvbGludXgvcGFnZW1h
cC5oIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGFnZW1hcC5oIGIv
aW5jbHVkZS9saW51eC9wYWdlbWFwLmgNCmluZGV4IGU2M2ZiZmJkNWIwZi4uY2UyYmNkY2FkYjcz
IDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9saW51eC9wYWdlbWFwLmgNCisrKyBiL2luY2x1ZGUvbGlu
dXgvcGFnZW1hcC5oDQpAQCAtNzUwLDYgKzc1MCwzMyBAQCBzdHJ1Y3QgZm9saW8gKl9fZmlsZW1h
cF9nZXRfZm9saW8oc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHBnb2ZmX3QgaW5kZXgs
DQogc3RydWN0IHBhZ2UgKnBhZ2VjYWNoZV9nZXRfcGFnZShzdHJ1Y3QgYWRkcmVzc19zcGFjZSAq
bWFwcGluZywgcGdvZmZfdCBpbmRleCwNCiAJCWZnZl90IGZncF9mbGFncywgZ2ZwX3QgZ2ZwKTsN
CiANCisvKioNCisgKiB3cml0ZV9iZWdpbl9nZXRfZm9saW8gLSBHZXQgZm9saW8gZm9yIHdyaXRl
X2JlZ2luIHdpdGggZmxhZ3MuDQorICogQGlvY2I6IFRoZSBraW9jYiBwYXNzZWQgZnJvbSB3cml0
ZV9iZWdpbiAobWF5IGJlIE5VTEwpLg0KKyAqIEBtYXBwaW5nOiBUaGUgYWRkcmVzcyBzcGFjZSB0
byBzZWFyY2guDQorICogQGluZGV4OiBUaGUgcGFnZSBjYWNoZSBpbmRleC4NCisgKiBAbGVuOiBM
ZW5ndGggb2YgZGF0YSBiZWluZyB3cml0dGVuLg0KKyAqDQorICogVGhpcyBpcyBhIGhlbHBlciBm
b3IgZmlsZXN5c3RlbSB3cml0ZV9iZWdpbigpIGltcGxlbWVudGF0aW9ucy4NCisgKiBJdCB3cmFw
cyBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKCksIHNldHRpbmcgYXBwcm9wcmlhdGUgZmxhZ3MgaW4NCisg
KiB0aGUgd3JpdGUgYmVnaW4gY29udGV4dC4NCisgKg0KKyAqIFJldHVybjogQSBmb2xpbyBvciBh
biBFUlJfUFRSLg0KKyAqLw0KK3N0YXRpYyBpbmxpbmUgc3RydWN0IGZvbGlvICp3cml0ZV9iZWdp
bl9nZXRfZm9saW8oY29uc3Qgc3RydWN0IGtpb2NiICppb2NiLA0KKwkJICBzdHJ1Y3QgYWRkcmVz
c19zcGFjZSAqbWFwcGluZywgcGdvZmZfdCBpbmRleCwgc2l6ZV90IGxlbikNCit7DQorICAgICAg
ICBmZ2ZfdCBmZ3BfZmxhZ3MgPSBGR1BfV1JJVEVCRUdJTjsNCisNCisgICAgICAgIGZncF9mbGFn
cyB8PSBmZ2Zfc2V0X29yZGVyKGxlbik7DQorDQorICAgICAgICBpZiAoaW9jYiAmJiBpb2NiLT5r
aV9mbGFncyAmIElPQ0JfRE9OVENBQ0hFKQ0KKyAgICAgICAgICAgICAgICBmZ3BfZmxhZ3MgfD0g
RkdQX0RPTlRDQUNIRTsNCisNCisgICAgICAgIHJldHVybiBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKG1h
cHBpbmcsIGluZGV4LCBmZ3BfZmxhZ3MsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtYXBwaW5nX2dmcF9tYXNrKG1hcHBpbmcpKTsNCit9DQorDQogLyoqDQogICogZmlsZW1h
cF9nZXRfZm9saW8gLSBGaW5kIGFuZCBnZXQgYSBmb2xpby4NCiAgKiBAbWFwcGluZzogVGhlIGFk
ZHJlc3Nfc3BhY2UgdG8gc2VhcmNoLg0KLS0gDQoyLjM0LjENCg==
