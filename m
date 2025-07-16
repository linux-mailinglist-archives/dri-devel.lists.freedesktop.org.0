Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D44B071CD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2376210E6C6;
	Wed, 16 Jul 2025 09:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="IxqNLlHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
 by gabe.freedesktop.org (Postfix) with SMTP id 9740410E6F2;
 Wed, 16 Jul 2025 09:36:11 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.65.20])
 by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 9D55C18121AED5; 
 Wed, 16 Jul 2025 17:35:51 +0800 (CST)
Received: from BJ02-ACTMBX-08.didichuxing.com (10.79.65.15) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 17:36:02 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ02-ACTMBX-08.didichuxing.com (10.79.65.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 17:36:01 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::2e1a:dd47:6d25:287e%7]) with
 mapi id 15.02.1748.010; Wed, 16 Jul 2025 17:36:01 +0800
X-MD-Sfrom: chentaotao@didiglobal.com
X-MD-SrcIP: 10.79.65.20
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
 =?gb2312?B?s8LMzszOIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>, "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH v6 0/5] fs: refactor write_begin/write_end and add ext4
 IOCB_DONTCACHE support
Thread-Topic: [PATCH v6 0/5] fs: refactor write_begin/write_end and add ext4
 IOCB_DONTCACHE support
Thread-Index: AQHb9jULofTXnprVQECcaSYOVFKHUA==
Date: Wed, 16 Jul 2025 09:36:01 +0000
Message-ID: <20250716093559.217344-1-chentaotao@didiglobal.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.79.64.102]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
 s=2025; t=1752658558;
 bh=0zYXam5C0/pCSJyKQVX8Pe/qKDvmGXv1zAAjMTAOJ+E=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=IxqNLlHMxAhih2297gc/ze4zQGN4mc8iK+HX2I1vym2+kC0B2Grp1VqfVg7Zshwiz
 4nF7W+BtiLXBjsoZQygUoIyDDNg4zO7cJQi9+dmvr87YFrOPS9zWMIcUsesXCZ5I9u
 Qqpf4GLCPzAKiIAktT0/gbVgDlpCXZ1GWWGLYqmc=
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
Z2luKCkNCmFuZCB3cml0ZV9lbmQoKSBjYWxsYmFja3MgdG8gdGFrZSBjb25zdCBzdHJ1Y3Qga2lv
Y2IgKiBhcyB0aGVpciBmaXJzdA0KYXJndW1lbnQsIGFsbG93aW5nIElPQ0IgZmxhZ3Mgc3VjaCBh
cyBJT0NCX0RPTlRDQUNIRSB0byBwcm9wYWdhdGUgdG8gdGhlDQpmaWxlc3lzdGVtJ3MgYnVmZmVy
ZWQgSS9PIHBhdGguDQoNCkV4dDQgaXMgdXBkYXRlZCB0byBpbXBsZW1lbnQgaGFuZGxpbmcgb2Yg
dGhlIElPQ0JfRE9OVENBQ0hFIGZsYWcgYW5kDQphZHZlcnRpc2VzIHN1cHBvcnQgdmlhIHRoZSBG
T1BfRE9OVENBQ0hFIGZpbGUgb3BlcmF0aW9uIGZsYWcuDQoNCkFkZGl0aW9uYWxseSwgdGhlIGk5
MTUgZHJpdmVyJ3Mgc2htZW0gd3JpdGUgcGF0aHMgYXJlIHVwZGF0ZWQgdG8gYnlwYXNzDQp0aGUg
bGVnYWN5IHdyaXRlX2JlZ2luL3dyaXRlX2VuZCBpbnRlcmZhY2UgaW4gZmF2b3Igb2YgZGlyZWN0
bHkNCmNhbGxpbmcgd3JpdGVfaXRlcigpIHdpdGggYSBjb25zdHJ1Y3RlZCBzeW5jaHJvbm91cyBr
aW9jYi4gQW5vdGhlciBpOTE1DQpjaGFuZ2UgcmVwbGFjZXMgYSBtYW51YWwgd3JpdGUgbG9vcCB3
aXRoIGtlcm5lbF93cml0ZSgpIGR1cmluZyBHRU0gc2htZW0NCm9iamVjdCBjcmVhdGlvbi4NCg0K
VGVzdGVkIHdpdGggZXh0NCBhbmQgaTkxNSBHRU0gd29ya2xvYWRzLg0KDQpUaGlzIHBhdGNoIHNl
cmllcyBpcyBiYXNlZCBvbiB0aGUgdmZzLTYuMTcubWlzYyBicmFuY2guDQoNClRoZSBrZXJuZWwg
dGVzdCByb2JvdCByZXBvcnRlZCBpc3N1ZXMgaW4gcHJldmlvdXMgdmVyc2lvbnMsIHdoaWNoIGFy
ZSBmaXhlZA0KaW4gdGhpcyB1cGRhdGVkIHBhdGNoc2V0Lg0KDQpSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29lLWtidWlsZC1hbGwvMjAyNTA3MTQyMTI4LlpyNVN0blloLWxrcEBpbnRlbC5jb20vDQoN
ClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCkNsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI1MDcxNDIwNDAud3BweW9Y
MXMtbGtwQGludGVsLmNvbS8NCg0KQ2hhbmdlcyBzaW5jZSB2NToNCi0gUGF0Y2ggMi81OiBGaXgg
YnVpbGQgZXJyb3JzIGluIGk5MTVfZ2VtX3NobWVtLmMgYnkgYWRkaW5nDQogICNpbmNsdWRlIDxs
aW51eC91aW8uaD4gdG8gZGVmaW5lIGlvdl9pdGVyIGFuZCByZWxhdGVkIHN5bWJvbHMuDQotIFBh
dGNoIDMvNTogRml4IHViaWZzX3dyaXRlX2VuZCgpIGJ5IGFkZGluZyBjb25zdCB0byB0aGUgYXJn
dW1lbnQNCiAgdG8gbWF0Y2ggdGhlIHVwZGF0ZWQgd3JpdGVfZW5kKCkgaW50ZXJmYWNlLg0KDQpU
YW90YW8gQ2hlbiAoNSk6DQogIGRybS9pOTE1OiBVc2Uga2VybmVsX3dyaXRlKCkgaW4gc2htZW0g
b2JqZWN0IGNyZWF0ZQ0KICBkcm0vaTkxNTogUmVmYWN0b3Igc2htZW1fcHdyaXRlKCkgdG8gdXNl
IGtpb2NiIGFuZCB3cml0ZV9pdGVyDQogIGZzOiBjaGFuZ2Ugd3JpdGVfYmVnaW4vd3JpdGVfZW5k
IGludGVyZmFjZSB0byB0YWtlIHN0cnVjdCBraW9jYiAqDQogIG1tL3BhZ2VtYXA6IGFkZCB3cml0
ZV9iZWdpbl9nZXRfZm9saW8oKSBoZWxwZXIgZnVuY3Rpb24NCiAgZXh0NDogc3VwcG9ydCB1bmNh
Y2hlZCBidWZmZXJlZCBJL08NCg0KIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbG9ja2luZy5y
c3QgICAgIHwgICA0ICstDQogRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy92ZnMucnN0ICAgICAg
ICAgfCAgIDYgKy0NCiBibG9jay9mb3BzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxMyArKy0NCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYyB8IDEx
NSArKysrKystLS0tLS0tLS0tLS0tLS0tDQogZnMvYWRmcy9pbm9kZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDkgKy0NCiBmcy9hZmZzL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyNiArKy0tLQ0KIGZzL2JjYWNoZWZzL2ZzLWlvLWJ1ZmZlcmVkLmMgICAgICAg
ICAgICAgIHwgICA0ICstDQogZnMvYmNhY2hlZnMvZnMtaW8tYnVmZmVyZWQuaCAgICAgICAgICAg
ICAgfCAgIDQgKy0NCiBmcy9iZnMvZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNyArLQ0KIGZzL2J1ZmZlci5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI2
ICsrLS0tDQogZnMvY2VwaC9hZGRyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAg
Ky0NCiBmcy9lY3J5cHRmcy9tbWFwLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQ0K
IGZzL2V4ZmF0L2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICstLQ0KIGZz
L2V4ZmF0L2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICstLQ0KIGZzL2V4
dDIvaW5vZGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsrLQ0KIGZzL2V4dDQv
ZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstDQogZnMvZXh0NC9pbm9k
ZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzAgKysrLS0tDQogZnMvZjJmcy9kYXRh
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0NCiBmcy9mYXQvaW5vZGUuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxOCArKy0tDQogZnMvZnVzZS9maWxlLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKystDQogZnMvaGZzL2hmc19mcy5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiBmcy9oZnMvaW5vZGUuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KIGZzL2hmc3BsdXMvaGZzcGx1c19mcy5oICAgICAg
ICAgICAgICAgICAgIHwgICA2ICstDQogZnMvaGZzcGx1cy9pbm9kZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDggKy0NCiBmcy9ob3N0ZnMvaG9zdGZzX2tlcm4uYyAgICAgICAgICAgICAg
ICAgICB8ICAgOCArLQ0KIGZzL2hwZnMvZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDE4ICsrLS0NCiBmcy9odWdldGxiZnMvaW5vZGUuYyAgICAgICAgICAgICAgICAgICAgICB8
ICAgOSArLQ0KIGZzL2pmZnMyL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI4
ICsrKy0tLQ0KIGZzL2pmcy9pbm9kZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2
ICstLQ0KIGZzL2xpYmZzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsr
LQ0KIGZzL21pbml4L2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstDQog
ZnMvbmZzL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0NCiBmcy9u
aWxmczIvaW5vZGUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQ0KIGZzL250ZnMz
L2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstDQogZnMvbnRmczMvaW5v
ZGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKy0NCiBmcy9udGZzMy9udGZzX2Zz
LmggICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQ0KIGZzL29jZnMyL2FvcHMuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstDQogZnMvb21mcy9maWxlLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDcgKy0NCiBmcy9vcmFuZ2Vmcy9pbm9kZS5jICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxNiArLS0NCiBmcy91Ymlmcy9maWxlLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgOCArLQ0KIGZzL3VkZi9pbm9kZS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDExICsrLQ0KIGZzL3Vmcy9pbm9kZS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDE2ICstLQ0KIGZzL3Zib3hzZi9maWxlLmMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA1ICstDQogaW5jbHVkZS9saW51eC9idWZmZXJfaGVhZC5oICAgICAgICAgICAgICAgfCAg
IDQgKy0NCiBpbmNsdWRlL2xpbnV4L2ZzLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSAr
Ky0NCiBpbmNsdWRlL2xpbnV4L3BhZ2VtYXAuaCAgICAgICAgICAgICAgICAgICB8ICAyNyArKysr
Kw0KIG1tL2ZpbGVtYXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstDQog
bW0vc2htZW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKy0tDQogNDgg
ZmlsZXMgY2hhbmdlZCwgMzMwIGluc2VydGlvbnMoKyksIDI5NiBkZWxldGlvbnMoLSkNCg0KLS0g
DQoyLjM0LjENCg==
