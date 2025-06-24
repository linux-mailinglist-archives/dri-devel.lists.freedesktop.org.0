Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF19AE6D1D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6529410E5F7;
	Tue, 24 Jun 2025 16:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="jsYwnmAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
 by gabe.freedesktop.org (Postfix) with SMTP id 94D8989580;
 Tue, 24 Jun 2025 12:24:31 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.65.20])
 by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 39D011808ACAD9;
 Tue, 24 Jun 2025 20:11:18 +0800 (CST)
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 20:12:00 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 20:12:00 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::b00b:de35:2067:9787]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::b00b:de35:2067:9787%7]) with
 mapi id 15.02.1748.010; Tue, 24 Jun 2025 20:12:00 +0800
X-MD-Sfrom: chentaotao@didiglobal.com
X-MD-SrcIP: 10.79.65.20
From: =?utf-8?B?6ZmI5rab5rabIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
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
 =?utf-8?B?6ZmI5rab5rabIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
Subject: [PATCH v2 0/5] fs: refactor write_begin/write_end and add ext4
 IOCB_DONTCACHE support
Thread-Topic: [PATCH v2 0/5] fs: refactor write_begin/write_end and add ext4
 IOCB_DONTCACHE support
Thread-Index: AQHb5QEvaAoiRj/CJkyi1oGtEi5geQ==
Date: Tue, 24 Jun 2025 12:11:59 +0000
Message-ID: <20250624121149.2927-1-chentaotao@didiglobal.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.64.102]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CD453F0A90DBA419D2AF275EA1B93EA@didichuxing.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
 s=2025; t=1750767103;
 bh=NSR7S0h0nlsDFAQMve21bvAq8IdC1ftrKlDHkbcGUQg=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=jsYwnmAOeJ/U0guKTOzOybwNAvJpA+kI2Hw4mcuqL4Bw4WjVV/jF5i4/5YqEtAmjr
 oEhmALj1C29BvoeavtpO7eD2ECHZuZiUmD8U22619AGAyxkzYlnRk+9y8zMDKfVJAm
 bBpZG/NoAnDQym2NJ623lhYWQ1kd4+0OZRvCxZ4E=
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

RnJvbTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQoNClRoaXMgcGF0
Y2ggc2VyaWVzIHJlZmFjdG9ycyB0aGUgYWRkcmVzc19zcGFjZV9vcGVyYXRpb25zIHdyaXRlX2Jl
Z2luKCkNCmFuZCB3cml0ZV9lbmQoKSBjYWxsYmFja3MgdG8gdGFrZSBzdHJ1Y3Qga2lvY2IgKiBh
cyB0aGVpciBmaXJzdCBhcmd1bWVudCwNCmFsbG93aW5nIElPQ0IgZmxhZ3Mgc3VjaCBhcyBJT0NC
X0RPTlRDQUNIRSB0byBwcm9wYWdhdGUgdG8gZmlsZXN5c3RlbeKAmXMNCmJ1ZmZlcmVkIHdyaXRl
IHBhdGguDQoNCkV4dDQgaXMgdXBkYXRlZCB0byBpbXBsZW1lbnQgaGFuZGxpbmcgb2YgdGhlIElP
Q0JfRE9OVENBQ0hFIGZsYWcgaW4gaXRzDQpidWZmZXJlZCB3cml0ZSBwYXRoIGFuZCB0byBhZHZl
cnRpc2Ugc3VwcG9ydCB2aWEgdGhlIEZPUF9ET05UQ0FDSEUgZmlsZQ0Kb3BlcmF0aW9uIGZsYWcu
DQoNCkFkZGl0aW9uYWxseSwgdGhlIGk5MTUgZHJpdmVy4oCZcyBzaG1lbSB3cml0ZSBwYXRocyBh
cmUgdXBkYXRlZCB0byBieXBhc3MNCnRoZSBsZWdhY3kgd3JpdGVfYmVnaW4vd3JpdGVfZW5kIGlu
dGVyZmFjZSBpbiBmYXZvciBvZiBkaXJlY3RseSBjYWxsaW5nDQp3cml0ZV9pdGVyKCksIHVzaW5n
IGEgY29uc3RydWN0ZWQgc3luY2hyb25vdXMga2lvY2IuIEFub3RoZXIgaTkxNSBwYXRjaA0KcmVw
bGFjZXMgYSBtYW51YWwgd3JpdGUgbG9vcCB3aXRoIGtlcm5lbF93cml0ZSgpIGluIHNobWVtIG9i
amVjdCBjcmVhdGlvbi4NCg0KVGVzdGVkIHdpdGggZXh0NCBhbmQgaTkxNSBHRU0gd29ya2xvYWRz
Lg0KDQpDaGFuZ2VzIHNpbmNlIHYxOg0KLSBleHQ0IHVzZXMga2lvY2ItPmtpX2ZsYWdzIGRpcmVj
dGx5IGluc3RlYWQgb2YgZnNkYXRhLg0KLSB3cml0ZV9iZWdpbi93cml0ZV9lbmQgaW50ZXJmYWNl
IGlzIGNoYW5nZWQgdG8gdGFrZSBzdHJ1Y3Qga2lvY2IgKg0KICBpbnN0ZWFkIG9mIHN0cnVjdCBm
aWxlICouDQotIGk5MTUgc2htZW1fcHdyaXRlIHJlZmFjdG9yZWQgdG8gdXNlIHdyaXRlX2l0ZXIo
KSBkaXJlY3RseSBpbnN0ZWFkDQogIG9mIHdyaXRlX2JlZ2luL3dyaXRlX2VuZC4NCi0gaTkxNSBH
RU0gc2htZW0gb2JqZWN0IGNyZWF0aW9uIHJlcGxhY2VkIG1hbnVhbCB3cml0ZSBsb29wIHdpdGgN
CiAga2VybmVsX3dyaXRlKCkuDQoNClRhb3RhbyBDaGVuICg1KToNCiAgZHJtL2k5MTU6IFVzZSBr
ZXJuZWxfd3JpdGUoKSBpbiBzaG1lbSBvYmplY3QgY3JlYXRlDQogIGRybS9pOTE1OiBSZWZhY3Rv
ciBzaG1lbV9wd3JpdGUoKSB0byB1c2Uga2lvY2IgYW5kIHdyaXRlX2l0ZXINCiAgZnM6IGNoYW5n
ZSB3cml0ZV9iZWdpbi93cml0ZV9lbmQgaW50ZXJmYWNlIHRvIHRha2Ugc3RydWN0IGtpb2NiICoN
CiAgZXh0NDogaGFuZGxlIElPQ0JfRE9OVENBQ0hFIGluIGJ1ZmZlcmVkIHdyaXRlIHBhdGgNCiAg
ZXh0NDogZGVjbGFyZSBzdXBwb3J0IGZvciBGT1BfRE9OVENBQ0hFDQoNCiBEb2N1bWVudGF0aW9u
L2ZpbGVzeXN0ZW1zL2xvY2tpbmcucnN0ICAgICB8ICAgNCArLQ0KIERvY3VtZW50YXRpb24vZmls
ZXN5c3RlbXMvdmZzLnJzdCAgICAgICAgIHwgICA0ICstDQogYmxvY2svZm9wcy5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0NCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fc2htZW0uYyB8IDExMiArKysrKystLS0tLS0tLS0tLS0tLS0tDQogZnMvYWRmcy9p
bm9kZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCiBmcy9hZmZzL2ZpbGUu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArLS0NCiBmcy9iY2FjaGVmcy9mcy1p
by1idWZmZXJlZC5jICAgICAgICAgICAgICB8ICAgNCArLQ0KIGZzL2JjYWNoZWZzL2ZzLWlvLWJ1
ZmZlcmVkLmggICAgICAgICAgICAgIHwgICA0ICstDQogZnMvYmZzL2ZpbGUuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiBmcy9idWZmZXIuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxOCArKy0tDQogZnMvY2VwaC9hZGRyLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDYgKy0NCiBmcy9lY3J5cHRmcy9tbWFwLmMgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxMCArLQ0KIGZzL2V4ZmF0L2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDE0ICsrLQ0KIGZzL2V4ZmF0L2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA2ICstDQogZnMvZXh0Mi9pbm9kZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDYgKy0NCiBmcy9leHQ0L2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAr
LQ0KIGZzL2V4dDQvaW5vZGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI1ICsrLS0t
DQogZnMvZjJmcy9kYXRhLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCiBm
cy9mYXQvaW5vZGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQ0KIGZzL2Z1
c2UvZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstDQogZnMvaGZzL2hm
c19mcy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiBmcy9oZnMvaW5vZGUu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KIGZzL2hmc3BsdXMvaGZzcGx1
c19mcy5oICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogZnMvaGZzcGx1cy9pbm9kZS5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCiBmcy9ob3N0ZnMvaG9zdGZzX2tlcm4uYyAg
ICAgICAgICAgICAgICAgICB8ICAgNiArLQ0KIGZzL2hwZnMvZmlsZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA4ICstDQogZnMvaHVnZXRsYmZzL2lub2RlLmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDQgKy0NCiBmcy9qZmZzMi9maWxlLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgOCArLQ0KIGZzL2pmcy9pbm9kZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA2ICstDQogZnMvbGliZnMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDQgKy0NCiBmcy9taW5peC9pbm9kZS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQ0KIGZzL25mcy9maWxlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstDQog
ZnMvbmlsZnMyL2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0NCiBmcy9u
dGZzMy9maWxlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQ0KIGZzL250ZnMz
L2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstDQogZnMvbnRmczMvbnRm
c19mcy5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCiBmcy9vY2ZzMi9hb3BzLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KIGZzL29tZnMvZmlsZS5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogZnMvb3JhbmdlZnMvaW5vZGUuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDYgKy0NCiBmcy91Ymlmcy9maWxlLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNCArLQ0KIGZzL3VkZi9pbm9kZS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA5ICstDQogZnMvdWZzL2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDYgKy0NCiBmcy92Ym94c2YvZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArLQ0KIGluY2x1ZGUvbGludXgvYnVmZmVyX2hlYWQuaCAgICAgICAgICAgICAgIHwg
ICA0ICstDQogaW5jbHVkZS9saW51eC9mcy5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYg
Ky0NCiBtbS9maWxlbWFwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQ0K
IG1tL3NobWVtLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstDQogNDcg
ZmlsZXMgY2hhbmdlZCwgMTc2IGluc2VydGlvbnMoKyksIDIxMyBkZWxldGlvbnMoLSkNCg0KLS0g
DQoyLjM0LjENCg==
