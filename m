Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DFC3D65FE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F79C6E930;
	Mon, 26 Jul 2021 17:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 551 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jul 2021 11:41:51 UTC
Received: from mail4.tencent.com (mail12.tencent.com [61.241.47.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF56F6EBAC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 11:41:51 +0000 (UTC)
Received: from EX-SZ021.tencent.com (unknown [10.28.6.73])
 by mail4.tencent.com (Postfix) with ESMTP id 8A41E64112;
 Mon, 26 Jul 2021 19:32:37 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tencent.com;
 s=s202002; t=1627299157;
 bh=evDPUslxUaLukH5pVeeVe4ET0nWliHTCs40Ts/OkTRs=;
 h=From:To:CC:Subject:Date;
 b=jGzGwnIiKN7HjDJ+AtlLPh5vXGE6W+42s2exAzhNRpBA6oVd1kvPgBNyLchZdBOSZ
 CYdS1uzgt6r8Sde4KZouTKIMmOTWXPru5KQ/B9se3BIodg7Ib+3cT5nF4fSbHXoZcQ
 +jfg4ay2BH9CS5wHhACTJiwbMdTUAGbfxi5oypgw=
Received: from EX-SZ037.tencent.com (10.28.6.119) by EX-SZ021.tencent.com
 (10.28.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 19:32:37 +0800
Received: from EX-SZ030.tencent.com (10.28.6.105) by EX-SZ037.tencent.com
 (10.28.6.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 19:32:37 +0800
Received: from EX-SZ030.tencent.com ([fe80::cd97:7a16:11e6:d0c8]) by
 EX-SZ030.tencent.com ([fe80::cd97:7a16:11e6:d0c8%5]) with mapi id
 15.01.2242.008; Mon, 26 Jul 2021 19:32:37 +0800
From: =?utf-8?B?dGNzX2tlcm5lbCjohb7orq/kupHlhoXmoLjlvIDlj5HogIUp?=
 <tcs_kernel@tencent.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "yepeilin.cs@gmail.com"
 <yepeilin.cs@gmail.com>, "penguin-kernel@I-love.SAKURA.ne.jp"
 <penguin-kernel@I-love.SAKURA.ne.jp>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "george.kennedy@oracle.com"
 <george.kennedy@oracle.com>, "ducheng2@gmail.com" <ducheng2@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: [PATCH] fbcon: Out-Of-Bounds write in sys_imageblit, add range check
Thread-Topic: [PATCH] fbcon: Out-Of-Bounds write in sys_imageblit, add range
 check
Thread-Index: AQHXghHvrDWkYfnua06MBXDuWeAYaw==
Date: Mon, 26 Jul 2021 11:32:37 +0000
Message-ID: <D5DF8A1C-5FA2-426B-AAB4-3199AEA0A02E@tencent.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.28.2.15]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F26A0D29A1DFB646BB35537219DFF289@tencent.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Jul 2021 17:47:34 +0000
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eXJlcyBhbmQgdnlyZXMgY2FuIGJlIGNvbnRyb2xsZWQgYnkgdXNlciBtb2RlIHBhcmFtYXRlcnMs
IGFuZCBjYXVzZSBwLT52cm93cyB0byBiZWNvbWUgYSBuZWdhdGl2ZSB2YWx1ZS4gV2hpbGUgdGhp
cyB2YWx1ZSBiZSBwYXNzZWQgdG8gcmVhbF95IGZ1bmN0aW9uLCB0aGUgeXBvcyB3aWxsIGJlIG91
dCBvZiBzY3JlZW4gcmFuZ2UuDQpUaGlzIGlzIGFuIG91dC1vZi1ib3VuZHMgd3JpdGUgYnVnLg0K
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jDQppbmRleCAyMmJiMzg5MmY2YmQuLjA5NzBkZTQ2
NzgyZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jDQorKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KQEAgLTE5NTYsMTEgKzE5NTYsMTIg
QEAgc3RhdGljIHZvaWQgdXBkYXRlc2Nyb2xsbW9kZShzdHJ1Y3QgZmJjb25fZGlzcGxheSAqcCwN
CiAgICAgICAgaW50IHlyZXMgPSBGQkNPTl9TV0FQKG9wcy0+cm90YXRlLCBpbmZvLT52YXIueXJl
cywgaW5mby0+dmFyLnhyZXMpOw0KICAgICAgICBpbnQgdnlyZXMgPSBGQkNPTl9TV0FQKG9wcy0+
cm90YXRlLCBpbmZvLT52YXIueXJlc192aXJ0dWFsLA0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbmZvLT52YXIueHJlc192aXJ0dWFsKTsNCisgICAgICAgaW50IHJvd3MgPSB2
Yy0+dmNfcm93czsNCiANCiAgICAgICAgcC0+dnJvd3MgPSB2eXJlcy9maDsNCi0gICAgICAgaWYg
KHlyZXMgPiAoZmggKiAodmMtPnZjX3Jvd3MgKyAxKSkpDQotICAgICAgICAgICAgICAgcC0+dnJv
d3MgLT0gKHlyZXMgLSAoZmggKiB2Yy0+dmNfcm93cykpIC8gZmg7DQotICAgICAgIGlmICgoeXJl
cyAlIGZoKSAmJiAodnlyZXMgJSBmaCA8IHlyZXMgJSBmaCkpDQorICAgICAgIGlmICgoeXJlcyA+
IChmaCAqIChyb3dzICsgMSkpKSAmJiAodnlyZXMgPj0gKHlyZXMgLSAoZmggKiByb3dzKSkpICYm
IHAtPnZyb3dzKQ0KKyAgICAgICAgICAgICAgIHAtPnZyb3dzIC09ICh5cmVzIC0gKGZoICogcm93
cykpIC8gZmg7DQorICAgICAgIGlmICgoeXJlcyAlIGZoKSAmJiAodnlyZXMgJSBmaCA8IHlyZXMg
JSBmaCkgJiYgcC0+dnJvd3MpDQogICAgICAgICAgICAgICAgcC0+dnJvd3MtLTsNCiB9DQoNCg==
