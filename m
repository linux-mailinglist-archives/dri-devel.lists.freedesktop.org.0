Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169EE20B27
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC1D897D0;
	Thu, 16 May 2019 15:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720063.outbound.protection.outlook.com [40.107.72.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC3689781;
 Thu, 16 May 2019 15:26:58 +0000 (UTC)
Received: from SN1PR12CA0079.namprd12.prod.outlook.com (2603:10b6:802:21::14)
 by BN6PR1201MB0052.namprd12.prod.outlook.com (2603:10b6:405:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17; Thu, 16 May
 2019 15:26:56 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0079.outlook.office365.com
 (2603:10b6:802:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 15:26:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 15:26:56 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 10:26:52 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/sysfs: Add mstpath attribute to connector devices
Date: Thu, 16 May 2019 11:18:00 -0400
Message-ID: <1558019883-12397-5-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(476003)(70586007)(11346002)(316002)(70206006)(5660300002)(2906002)(110136005)(53936002)(2870700001)(54906003)(126002)(5820100001)(486006)(47776003)(2616005)(6666004)(426003)(356004)(446003)(76176011)(50466002)(77096007)(8676002)(53416004)(305945005)(8936002)(81156014)(81166006)(72206003)(478600001)(336012)(68736007)(66574012)(86152003)(86362001)(4326008)(50226002)(14444005)(186003)(23676004)(7696005)(36756003)(26005)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0052; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f76ec8a9-e6df-4c59-f80c-08d6da12ee5f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR1201MB0052; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0052:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00520077818654B6F0D9E927820A0@BN6PR1201MB0052.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Ps5u5BEt7x0NlPXH6dFjumguraYmSMIGBPr27R4qtli5IDbMwwZ6cK91dC678U6ySLcOOfkkFcN3kkd3SPCgXykqAck2xInbv3B7VUMT4GLVHpKY9BNjaYBoRXPpDu0c702uKhJI4PamJlHFZBBr6DD5RB4FLEv8dUoG5skylv6eYpKrQzr90bEmsMzTlFPfqx7SBfXHZBrgBM4WFyDXPCjz3kEmr829xL0wNJINv2OlOXQ8GqogdoLA+bQmsxG2fOpVLuulWcpu0CyrAL4EWd95t2Q33z39mn5oWl/6fr0whYIDRo1WwQXNG30+1P+Xkz8JQAwVU3v7iMsG4M4UETcY17vCC7a5oI3cC4QFRfkWc9mKFpUXH+kBZp1/UjNBurOS3KyLS6A18Vw9gUBNKRMkYt0FEKF2kEyvH7Z6RXU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 15:26:56.1555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f76ec8a9-e6df-4c59-f80c-08d6da12ee5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yFk9TOyxUZxBGE9bD2j+6e2zfnKie9RP5Jf45ehXgU=;
 b=17ATNaghpw1wt248W+Nx6DI0dxfwz70uUxrLJBSqLhJABuZ4qVRKtlsK9YMg6E24Nrmi9tCVlCcRqzhfz8F13i3t57FqBYNLEubn9U0bIjQVZe+WFCJlNakH+Ldcczt/tMewtlX1vDQrG40RmcgSFrKVrPIhIPOGF+9O4OmYsnk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpUaGlzIGNhbiBiZSB1c2VkIHRvIGNy
ZWF0ZSBtb3JlIGRlc2NyaXB0aXZlIHN5bWxpbmtzIGZvciBNU1QgYXV4CmRldmljZXMuIENvbnNp
ZGVyIHRoZSBmb2xsb3dpbmcgdWRldiBydWxlOgoKU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYi
LCBTVUJTWVNURU1TPT0iZHJtIiwgQVRUUlN7bXN0cGF0aH09PSI/KiIsCglTWU1MSU5LKz0iZHJt
X2RwX2F1eC9ieS1wYXRoLyRhdHRye21zdHBhdGh9IgoKVGhlIGZvbGxvd2luZyBzeW1saW5rcyB3
aWxsIGJlIGNyZWF0ZWQgKGRlcGVuZGluZyBvbiB5b3VyIE1TVCB0b3BvbG9neSk6CgokIGxzIC9k
ZXYvZHJtX2RwX2F1eC9ieS1wYXRoLwpjYXJkMC1tc3Q6MC0xICBjYXJkMC1tc3Q6MC0xLTEgIGNh
cmQwLW1zdDowLTEtOCAgY2FyZDAtbXN0OjAtOAoKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX3N5c2ZzLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKaW5kZXggZWNiN2IzMy4u
ZTAwMGUwYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwpAQCAtMjI5LDE2ICsyMjksMzkgQEAgc3RhdGljIHNz
aXplX3QgbW9kZXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCiAJcmV0dXJuIHdyaXR0ZW47
CiB9CiAKK3N0YXRpYyBzc2l6ZV90IG1zdHBhdGhfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXZpY2Us
CisJCQkgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkgICAgY2hhciAqYnVm
KQoreworCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSB0b19kcm1fY29ubmVjdG9y
KGRldmljZSk7CisJc3NpemVfdCByZXQgPSAwOworCWNoYXIgKnBhdGg7CisKKwltdXRleF9sb2Nr
KCZjb25uZWN0b3ItPmRldi0+bW9kZV9jb25maWcubXV0ZXgpOworCWlmICghY29ubmVjdG9yLT5w
YXRoX2Jsb2JfcHRyKQorCQlnb3RvIHVubG9jazsKKworCXBhdGggPSBjb25uZWN0b3ItPnBhdGhf
YmxvYl9wdHItPmRhdGE7CisJcmV0ID0gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJjYXJkJWQt
JXNcbiIsCisJICAgICAgICAgICAgICAgY29ubmVjdG9yLT5kZXYtPnByaW1hcnktPmluZGV4LCBw
YXRoKTsKKwordW5sb2NrOgorCW11dGV4X3VubG9jaygmY29ubmVjdG9yLT5kZXYtPm1vZGVfY29u
ZmlnLm11dGV4KTsKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgREVWSUNFX0FUVFJfUlcoc3Rh
dHVzKTsKIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhlbmFibGVkKTsKIHN0YXRpYyBERVZJQ0VfQVRU
Ul9STyhkcG1zKTsKIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhtb2Rlcyk7CitzdGF0aWMgREVWSUNF
X0FUVFJfUk8obXN0cGF0aCk7CiAKIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpjb25uZWN0b3Jf
ZGV2X2F0dHJzW10gPSB7CiAJJmRldl9hdHRyX3N0YXR1cy5hdHRyLAogCSZkZXZfYXR0cl9lbmFi
bGVkLmF0dHIsCiAJJmRldl9hdHRyX2RwbXMuYXR0ciwKIAkmZGV2X2F0dHJfbW9kZXMuYXR0ciwK
KwkmZGV2X2F0dHJfbXN0cGF0aC5hdHRyLAogCU5VTEwKIH07CiAKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
