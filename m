Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9190185E1
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7520989873;
	Thu,  9 May 2019 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720050.outbound.protection.outlook.com [40.107.72.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336DF897BB;
 Wed,  8 May 2019 11:30:03 +0000 (UTC)
Received: from MWHPR03CA0049.namprd03.prod.outlook.com (2603:10b6:301:3b::38)
 by MWHPR03MB3134.namprd03.prod.outlook.com (2603:10b6:301:3c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 11:29:57 +0000
Received: from BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by MWHPR03CA0049.outlook.office365.com
 (2603:10b6:301:3b::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Wed, 8 May 2019 11:29:57 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT003.mail.protection.outlook.com (10.152.76.204) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:29:56 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BTu06023698
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:29:56 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:29:56 -0400
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
Subject: [PATCH 07/16] device connection: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:33 +0300
Message-ID: <20190508112842.11654-9-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(199004)(189003)(36756003)(50226002)(246002)(47776003)(8936002)(8676002)(2906002)(48376002)(70586007)(76176011)(54906003)(4326008)(106002)(70206006)(86362001)(51416003)(2201001)(107886003)(14444005)(316002)(110136005)(16586007)(7696005)(486006)(11346002)(53416004)(126002)(476003)(2616005)(446003)(44832011)(2441003)(50466002)(7636002)(305945005)(7416002)(6666004)(426003)(186003)(5660300002)(336012)(478600001)(77096007)(1076003)(356004)(26005)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR03MB3134; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91c3809a-bbd8-4770-1064-08d6d3a87fc5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:MWHPR03MB3134; 
X-MS-TrafficTypeDiagnostic: MWHPR03MB3134:
X-Microsoft-Antispam-PRVS: <MWHPR03MB3134ADED8AEA2DE87EDA3597F9320@MWHPR03MB3134.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vPHqUyoLZcW0hVOhWn9GTqMZTbShobrGD2/ViAb1u/5/xckKY/lz+Bdz9sVMaISB5ZX+9BzGInurLqmM2FwjifOIAfCaB8oBwVzIS8pCv9hhyB42Iq3xXxptH5PZSBgO+M5i2dwNxoYHH/OfZkBJA5ivGIM3gJVbqng57UMMXQ2w+fpSmMh4cSgClNCxo8N5onzhk1RNY/exNSfBdSN+Djs9KjT6E9pvBp/NmRaLYmuLC6ZT+yMJ9koDYkjHuyWAEmz0HO0dNrjGBmAXW52KixyJ8drIdiD8EfBe6ovS9H4IykWVZ+zhpPAJrX7aE7bNhPgAj6OIz76YE9VndH2HHEjnLTtm3qOeMcvAav+dbYvG6K++r8veVFChlLmcP/tySHd8yyqVyS0HojCmo6O6IxxBOqhu4D25Gwq0FyInxLU=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:29:56.9840 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c3809a-bbd8-4770-1064-08d6d3a87fc5
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3134
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjcT89AhZdKkG8M5isLXr+VAVcRFhlBYogTm1g/4pg8=;
 b=q7IP+9NQa5EDYubf+Njn1bcwKqmHVEVEGwgvxF4CCCebgPyhKgL87yUmH6oKqvITyTy7ly7BzqJF9CuibfYxh1CD7eVrjMoC5DQyzQjqpnGGsZvQUhXfV78CE1aOuzWdCyhisJf3G2Zqgl4Qabaoo9JYILLYMMWBWRQ5g29Xp+w=
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

VGhlIGBkZXZpY2VfY29ubmVjdGlvbmAgc3RydWN0IGlzIGRlZmluZWQgYXM6CnN0cnVjdCBkZXZp
Y2VfY29ubmVjdGlvbiB7CiAgICAgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgICAgKmZ3bm9kZTsK
ICAgICAgICBjb25zdCBjaGFyICAgICAgICAgICAgICAqZW5kcG9pbnRbMl07CiAgICAgICAgY29u
c3QgY2hhciAgICAgICAgICAgICAgKmlkOwogICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgICAgICAg
IGxpc3Q7Cn07CgpUaGUgYGVuZHBvaW50YCBtZW1iZXIgaXMgYSBzdGF0aWMgYXJyYXkgb2Ygc3Ry
aW5ncyAob24gdGhlIHN0cnVjdCksIHNvCnVzaW5nIHRoZSBtYXRjaF9zdHJpbmcoKSAod2hpY2gg
ZG9lcyBhbiBBUlJBWV9TSVpFKChjb24tPmVuZHBvaW50KSkgc2hvdWxkCmJlIGZpbmUuCgpUaGUg
cmVjZW50IGNoYW5nZSB0byBtYXRjaF9zdHJpbmcoKSAodG8gaWdub3JlIE5VTEwgZW50cmllcyB1
cCB0byB0aGUgc2l6ZQpvZiB0aGUgYXJyYXkpIHNob3VsZG4ndCBhZmZlY3QgdGhpcy4KClNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFuQGFuYWxvZy5j
b20+Ci0tLQogZHJpdmVycy9iYXNlL2RldmNvbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2Rl
dmNvbi5jIGIvZHJpdmVycy9iYXNlL2RldmNvbi5jCmluZGV4IDdiYzFjNjE5YjcyMS4uNGEyMzM4
NjY1NTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jhc2UvZGV2Y29uLmMKKysrIGIvZHJpdmVycy9i
YXNlL2RldmNvbi5jCkBAIC03MCw3ICs3MCw3IEBAIHZvaWQgKmRldmljZV9jb25uZWN0aW9uX2Zp
bmRfbWF0Y2goc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICpjb25faWQsCiAJbXV0ZXhf
bG9jaygmZGV2Y29uX2xvY2spOwogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShjb24sICZkZXZjb25f
bGlzdCwgbGlzdCkgewotCQllcCA9IF9fbWF0Y2hfc3RyaW5nKGNvbi0+ZW5kcG9pbnQsIDIsIGRl
dm5hbWUpOworCQllcCA9IG1hdGNoX3N0cmluZyhjb24tPmVuZHBvaW50LCBkZXZuYW1lKTsKIAkJ
aWYgKGVwIDwgMCkKIAkJCWNvbnRpbnVlOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
