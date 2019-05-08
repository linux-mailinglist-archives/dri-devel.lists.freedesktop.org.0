Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1900B185E5
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1DB898A3;
	Thu,  9 May 2019 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780058.outbound.protection.outlook.com [40.107.78.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ABF8979D;
 Wed,  8 May 2019 11:29:57 +0000 (UTC)
Received: from BYAPR03CA0029.namprd03.prod.outlook.com (2603:10b6:a02:a8::42)
 by CY4PR03MB3127.namprd03.prod.outlook.com (2603:10b6:910:53::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.15; Wed, 8 May
 2019 11:29:53 +0000
Received: from BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::206) by BYAPR03CA0029.outlook.office365.com
 (2603:10b6:a02:a8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Wed, 8 May 2019 11:29:52 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT049.mail.protection.outlook.com (10.152.77.118) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:29:52 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BTp08023613
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:29:51 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:29:51 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, 
 <linux-pm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-omap@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <devel@driverdev.osuosl.org>, <linux-usb@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <cgroups@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-security-module@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 06/16] x86/mtrr: use new match_string() helper + add gaps ==
 minor fix
Date: Wed, 8 May 2019 14:28:32 +0300
Message-ID: <20190508112842.11654-8-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(189003)(199004)(478600001)(356004)(7416002)(4326008)(476003)(107886003)(305945005)(5660300002)(76176011)(48376002)(47776003)(50466002)(486006)(7636002)(44832011)(70206006)(70586007)(2906002)(110136005)(6666004)(50226002)(8936002)(54906003)(2616005)(246002)(53416004)(16586007)(1076003)(8676002)(11346002)(106002)(86362001)(7696005)(51416003)(446003)(126002)(426003)(186003)(2441003)(2201001)(336012)(316002)(26005)(36756003)(77096007)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB3127; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e84d071-f926-4c84-2e80-08d6d3a87ceb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:CY4PR03MB3127; 
X-MS-TrafficTypeDiagnostic: CY4PR03MB3127:
X-Microsoft-Antispam-PRVS: <CY4PR03MB3127E9C16F1035878E392535F9320@CY4PR03MB3127.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hda0K0v5ij/G6H2YACXfIt6bKjpSjAgKGea3NqLag4TL7c+wMp6G/9ToPo3Vo2ALGoXYKL8lIXefI3pjgsKmvrxcQbFYmQXJS7mMxOOHzlhmFQ7IYxncBKfDC4dQju6ANVJhrbiCK6I2H9u41GPFBS6zp5bmQ3KEGqcTA6uu8J8UwkG02mPR404b+UaRjboXhFhWhmzco8OFnY/ZS+Oyiv+jgrcub3OWF1ZE6g2PWZYCiPw+ix3NL4MdKxaNv0gnzhApnIqnJ4GghYC7Eb4ExLnTn+gnu/dJzfLMbsj54G46HtKSw8zG3MhatUk0Fy/RUF/d0ftyuE3K6GD9m91VOurlbnHt9HiykZLpXxUZ0G1o+7zGAAC/ca50ThQK38xp2eRz+OZNwVPJAdO97Sm3P+EhZBozB3hNY3g9PrvxJRw=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:29:52.2067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e84d071-f926-4c84-2e80-08d6d3a87ceb
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3127
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peJzb31cm17ABrXFyc+VL8b8kWU6z5UpeWBKRx5iGOY=;
 b=Ht8Fm6RXFzi+Mh2C7TtDBrevghDIkKBBrf5hR26HEMHT3clXH+auLpcCAPlBDjunidMIf2KlMCOrIihkOj8RRHLgWzEWMMKXr0g4KWNemLVVhqUlyEjNr2yadJK+HpBmin3dfirgmdsGRBLIe+wQFsopNOyElR+2pj8AJZVAfxw=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=analog.com;
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
Cc: gregkh@linuxfoundation.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjaGFuZ2UgaXMgYSBiaXQgbW9yZSB0aGFuIGNvc21ldGljLgoKSXQgcmVwbGFjZXMgMiB2
YWx1ZXMgaW4gbXRycl9zdHJpbmdzIHdpdGggTlVMTC4gUHJldmlvdXNseSwgdGhleSB3ZXJlCmRl
ZmluZWQgYXMgIj8iLCB3aGljaCBpcyBub3QgZ3JlYXQgYmVjYXVzZSB5b3UgY291bGQgdGVjaG5p
Y2FsbHkgcGFzcyAiPyIsCmFuZCB5b3Ugd291bGQgZ2V0IHZhbHVlIDIuCkl0J3Mgbm90IHN1cmUg
d2hldGhlciB0aGF0IHdhcyBpbnRlbmRlZCAobGlrZWx5IGl0IHdhc24ndCksIGJ1dCB0aGlzIGZp
eGVzCnRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFsZXhhbmRydS5h
cmRlbGVhbkBhbmFsb2cuY29tPgotLS0KIGFyY2gveDg2L2tlcm5lbC9jcHUvbXRyci9pZi5jIHwg
MTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L210cnIvaWYuYyBiL2FyY2gv
eDg2L2tlcm5lbC9jcHUvbXRyci9pZi5jCmluZGV4IDRlYzdhNWY3Yjk0Yy4uZTY3ODIwYTA0NGNj
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L210cnIvaWYuYworKysgYi9hcmNoL3g4
Ni9rZXJuZWwvY3B1L210cnIvaWYuYwpAQCAtMjAsOCArMjAsOCBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqY29uc3QgbXRycl9zdHJpbmdzW01UUlJfTlVNX1RZUEVTXSA9CiB7CiAJInVuY2FjaGFibGUi
LAkJLyogMCAqLwogCSJ3cml0ZS1jb21iaW5pbmciLAkvKiAxICovCi0JIj8iLAkJCS8qIDIgKi8K
LQkiPyIsCQkJLyogMyAqLworCU5VTEwsCQkJLyogMiAqLworCU5VTEwsCQkJLyogMyAqLwogCSJ3
cml0ZS10aHJvdWdoIiwJLyogNCAqLwogCSJ3cml0ZS1wcm90ZWN0IiwJLyogNSAqLwogCSJ3cml0
ZS1iYWNrIiwJCS8qIDYgKi8KQEAgLTI5LDcgKzI5LDkgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmNv
bnN0IG10cnJfc3RyaW5nc1tNVFJSX05VTV9UWVBFU10gPQogCiBjb25zdCBjaGFyICptdHJyX2F0
dHJpYl90b19zdHIoaW50IHgpCiB7Ci0JcmV0dXJuICh4IDw9IDYpID8gbXRycl9zdHJpbmdzW3hd
IDogIj8iOworCWlmICgoeCA+PSBBUlJBWV9TSVpFKG10cnJfc3RyaW5ncykpIHx8IChtdHJyX3N0
cmluZ3NbeF0gPT0gTlVMTCkpCisJCXJldHVybiAiPyI7CisJcmV0dXJuIG10cnJfc3RyaW5nc1t4
XTsKIH0KIAogI2lmZGVmIENPTkZJR19QUk9DX0ZTCkBAIC0xNDIsNyArMTQ0LDcgQEAgbXRycl93
cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKmJ1Ziwgc2l6ZV90IGxl
biwgbG9mZl90ICogcHBvcykKIAkJcmV0dXJuIC1FSU5WQUw7CiAJcHRyID0gc2tpcF9zcGFjZXMo
cHRyICsgNSk7CiAKLQlpID0gX19tYXRjaF9zdHJpbmcobXRycl9zdHJpbmdzLCBNVFJSX05VTV9U
WVBFUywgcHRyKTsKKwlpID0gbWF0Y2hfc3RyaW5nKG10cnJfc3RyaW5ncywgcHRyKTsKIAlpZiAo
aSA8IDApCiAJCXJldHVybiBpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
