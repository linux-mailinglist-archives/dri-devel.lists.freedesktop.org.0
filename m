Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F1D185EA
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C291D899E7;
	Thu,  9 May 2019 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680055.outbound.protection.outlook.com [40.107.68.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A223897BB;
 Wed,  8 May 2019 11:29:29 +0000 (UTC)
Received: from MWHPR03CA0013.namprd03.prod.outlook.com (10.175.133.151) by
 BN3PR03MB2260.namprd03.prod.outlook.com (10.166.73.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 11:29:27 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::203) by MWHPR03CA0013.outlook.office365.com
 (2603:10b6:300:117::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Wed, 8 May 2019 11:29:26 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:29:26 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x48BTPmx016989
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:29:25 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:29:25 -0400
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
Subject: [PATCH 01/16] lib: fix match_string() helper when array size is
 positive
Date: Wed, 8 May 2019 14:28:27 +0300
Message-ID: <20190508112842.11654-3-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(189003)(199004)(246002)(8676002)(356004)(5660300002)(1076003)(8936002)(50226002)(53416004)(7416002)(305945005)(2441003)(47776003)(478600001)(7636002)(336012)(107886003)(77096007)(4326008)(186003)(446003)(26005)(44832011)(126002)(476003)(2616005)(11346002)(486006)(86362001)(76176011)(7696005)(51416003)(426003)(14444005)(36756003)(2201001)(48376002)(54906003)(70586007)(110136005)(70206006)(16586007)(316002)(50466002)(2906002)(106002)(921003)(2101003)(1121003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB2260; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06992cbe-c2a0-450f-a978-08d6d3a86d64
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:BN3PR03MB2260; 
X-MS-TrafficTypeDiagnostic: BN3PR03MB2260:
X-Microsoft-Antispam-PRVS: <BN3PR03MB22605D56BDEC0036712171DFF9320@BN3PR03MB2260.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HMrFOjcKVNRTHDmX1/HvU/gXQlBl+uBSOtcwOD51vWmdyi5ZtZaq4HeTrVqglmQielk1qFJ8dbdhoPs7SBm2gQas++XsjhD055LJSrs5xjRibQaqSBcjHQ44wcFTrBpHBH89k3Ki8Yow3eXIUMpM+NlewIkNIJV3DPQLKY30RuyrOhfh8nkva9n/YB2AL2kQU6YR15UTz29qyv7g67oh8CMTWpMo3frw6vU81LMqNBFZ66OrPeZSiSJAkJBE/bMd3zQC4Hxw9oF5//2KgiJjBZpmuL6vm8U1PSkG8Dxc2tota5ciVE6wTr78/CN6CfJNaW+OzxN0iMIV1Ig8ZSn8zd4ymGDzX2XaqHB1wZ4OfMvmgpNKxP1+GEdfSFMqVRyw0npwgjP2wrgtmFovCAalytU1DI/oSEu8S/98Y5oQHkE=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:29:26.1629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06992cbe-c2a0-450f-a978-08d6d3a86d64
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2260
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej4TvjRJPb880Evlka3jGsq9toPstBngds/H7MSz+98=;
 b=h9DQ+GRsCQDxKqwstM007EbLcpBHqWjQ2MRqXq5cju0OtcgE40K257CUdmKTcLmNiFsVQ8TTUi5HLpjaCc0tXSIxEMkemV6E3tWUguwanL7bPvyn1MHBba2gc+TzvtAMCzfuHmsH9w9p/tFocvXacJIH4a0VqaLEN/p5NINwGK0=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 137.71.25.57)
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

VGhlIGRvY3VtZW50YXRpb24gdGhlIGBfbWF0Y2hfc3RyaW5nKClgIGhlbHBlciBtZW50aW9ucyB0
aGF0IGBuYAooc2l6ZSBvZiB0aGUgZ2l2ZW4gYXJyYXkpIHNob3VsZCBiZToKICogQG46IG51bWJl
ciBvZiBzdHJpbmdzIGluIHRoZSBhcnJheSBvciAtMSBmb3IgTlVMTCB0ZXJtaW5hdGVkIGFycmF5
cwoKVGhlIGJlaGF2aW9yIG9mIHRoZSBmdW5jdGlvbiBpcyBkaWZmZXJlbnQsIGluIHRoZSBzZW5z
ZSB0aGF0IGl0IGV4aXRzIG9uCnRoZSBmaXJzdCBOVUxMIGVsZW1lbnQgaW4gdGhlIGFycmF5LCBy
ZWdhcmRsZXNzIG9mIHdoZXRoZXIgYG5gIGlzIC0xIG9yIGEKcG9zaXRpdmUgbnVtYmVyLgoKVGhp
cyBwYXRjaCBjaGFuZ2VzIHRoZSBiZWhhdmlvciwgdG8gZXhpdCB0aGUgbG9vcCB3aGVuIGEgTlVM
TCBlbGVtZW50IGlzCmZvdW5kIGFuZCBuID09IC0xLiBFc3NlbnRpYWxseSwgdGhpcyBhbGlnbnMg
dGhlIGJlaGF2aW9yIHdpdGggdGhlCmRvYy1zdHJpbmcuCgpUaGVyZSBhcmUgY3VycmVudGx5IG1h
bnkgdXNlcnMgb2YgYG1hdGNoX3N0cmluZygpYCwgYW5kIHNvLCBpbiBvcmRlciB0byBnbwp0aHJv
dWdoIHRoZW0sIHRoZSBuZXh0IHBhdGNoZXMgaW4gdGhlIHNlcmllcyB3aWxsIGZvY3VzIG9uIGRv
aW5nIHNvbWUKY29zbWV0aWMgY2hhbmdlcywgd2hpY2ggYXJlIGFpbWVkIGF0IGdyb3VwaW5nIHRo
ZSB1c2VycyBvZgpgbWF0Y2hfc3RyaW5nKClgLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFy
ZGVsZWFuIDxhbGV4YW5kcnUuYXJkZWxlYW5AYW5hbG9nLmNvbT4KLS0tCiBsaWIvc3RyaW5nLmMg
fCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvbGliL3N0cmluZy5jIGIvbGliL3N0cmluZy5jCmluZGV4IDNhYjg2MWMx
YTg1Ny4uNzZlZGI3YmY3NmNiIDEwMDY0NAotLS0gYS9saWIvc3RyaW5nLmMKKysrIGIvbGliL3N0
cmluZy5jCkBAIC02NDgsOCArNjQ4LDExIEBAIGludCBtYXRjaF9zdHJpbmcoY29uc3QgY2hhciAq
IGNvbnN0ICphcnJheSwgc2l6ZV90IG4sIGNvbnN0IGNoYXIgKnN0cmluZykKIAogCWZvciAoaW5k
ZXggPSAwOyBpbmRleCA8IG47IGluZGV4KyspIHsKIAkJaXRlbSA9IGFycmF5W2luZGV4XTsKLQkJ
aWYgKCFpdGVtKQorCQlpZiAoIWl0ZW0pIHsKKwkJCWlmIChuICE9IChzaXplX3QpLTEpCisJCQkJ
Y29udGludWU7CiAJCQlicmVhazsKKwkJfQogCQlpZiAoIXN0cmNtcChpdGVtLCBzdHJpbmcpKQog
CQkJcmV0dXJuIGluZGV4OwogCX0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
