Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304AAE6D1E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7658010E5F9;
	Tue, 24 Jun 2025 16:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.b="cEW7/Ufu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
 by gabe.freedesktop.org (Postfix) with SMTP id D55A289CE3;
 Tue, 24 Jun 2025 12:24:36 +0000 (UTC)
Received: from mail.didiglobal.com (unknown [10.79.65.20])
 by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 3B0B71808ACADD;
 Tue, 24 Jun 2025 20:11:29 +0800 (CST)
Received: from BJ02-ACTMBX-08.didichuxing.com (10.79.65.15) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 20:12:11 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com (10.79.71.34) by
 BJ02-ACTMBX-08.didichuxing.com (10.79.65.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 20:12:11 +0800
Received: from BJ03-ACTMBX-07.didichuxing.com ([fe80::b00b:de35:2067:9787]) by
 BJ03-ACTMBX-07.didichuxing.com ([fe80::b00b:de35:2067:9787%7]) with
 mapi id 15.02.1748.010; Tue, 24 Jun 2025 20:12:11 +0800
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
 =?gb2312?B?s8LMzszOIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
Subject: [PATCH v2 5/5] ext4: declare support for FOP_DONTCACHE
Thread-Topic: [PATCH v2 5/5] ext4: declare support for FOP_DONTCACHE
Thread-Index: AQHb5QE2ZjIKcQrU5kGPOqcDpxUbGg==
Date: Tue, 24 Jun 2025 12:12:10 +0000
Message-ID: <20250624121149.2927-6-chentaotao@didiglobal.com>
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
 s=2025; t=1750767110;
 bh=iuF1ZOur63OjUvd6ybvJnLgKwbJ3U/NzwPXRo3n32rY=;
 h=From:To:CC:Subject:Date:Message-ID:Content-Type;
 b=cEW7/UfuFR9GJjBn+9WIFO3vuASVCalB3o2O0NUd/YMuW/x46pv/XlvCutN5cV/th
 e09CPp1bHCPCZ1UrzhIG/eEpXoPybPkKWNeuUDpstKTGpHJwNrnOT34pOnDg96O9VP
 HNlfdS+qpcqN31yAjdtca+Zm/u9GnVNlg5lWZNE4=
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

RnJvbTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQoNClNldCB0aGUg
Rk9QX0RPTlRDQUNIRSBmbGFnIGluIGV4dDRfZmlsZV9vcGVyYXRpb25zIHRvIGluZGljYXRlIHRo
YXQNCmV4dDQgc3VwcG9ydHMgSU9DQl9ET05UQ0FDSEUgaGFuZGxpbmcgaW4gYnVmZmVyZWQgd3Jp
dGUgcGF0aHMuDQoNClBhcnQgb2YgYSBzZXJpZXMgcmVmYWN0b3JpbmcgYWRkcmVzc19zcGFjZV9v
cGVyYXRpb25zIHdyaXRlX2JlZ2luIGFuZA0Kd3JpdGVfZW5kIGNhbGxiYWNrcyB0byB1c2Ugc3Ry
dWN0IGtpb2NiIGZvciBwYXNzaW5nIHdyaXRlIGNvbnRleHQgYW5kDQpmbGFncy4NCg0KU2lnbmVk
LW9mZi1ieTogVGFvdGFvIENoZW4gPGNoZW50YW90YW9AZGlkaWdsb2JhbC5jb20+DQotLS0NCiBm
cy9leHQ0L2ZpbGUuYyB8IDMgKystDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZnMvZXh0NC9maWxlLmMgYi9mcy9leHQ0L2Zp
bGUuYw0KaW5kZXggMjFkZjgxMzQ3MTQ3Li4yNzRiNDFhNDc2YzggMTAwNjQ0DQotLS0gYS9mcy9l
eHQ0L2ZpbGUuYw0KKysrIGIvZnMvZXh0NC9maWxlLmMNCkBAIC05NzcsNyArOTc3LDggQEAgY29u
c3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBleHQ0X2ZpbGVfb3BlcmF0aW9ucyA9IHsNCiAJLnNw
bGljZV93cml0ZQk9IGl0ZXJfZmlsZV9zcGxpY2Vfd3JpdGUsDQogCS5mYWxsb2NhdGUJPSBleHQ0
X2ZhbGxvY2F0ZSwNCiAJLmZvcF9mbGFncwk9IEZPUF9NTUFQX1NZTkMgfCBGT1BfQlVGRkVSX1JB
U1lOQyB8DQotCQkJICBGT1BfRElPX1BBUkFMTEVMX1dSSVRFLA0KKwkJCSAgRk9QX0RJT19QQVJB
TExFTF9XUklURSB8DQorCQkJICBGT1BfRE9OVENBQ0hFLA0KIH07DQogDQogY29uc3Qgc3RydWN0
IGlub2RlX29wZXJhdGlvbnMgZXh0NF9maWxlX2lub2RlX29wZXJhdGlvbnMgPSB7DQotLSANCjIu
MzQuMQ0K
