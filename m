Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1D920B25
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0882A897B5;
	Thu, 16 May 2019 15:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710063.outbound.protection.outlook.com [40.107.71.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720CF8979D;
 Thu, 16 May 2019 15:27:00 +0000 (UTC)
Received: from SN1PR12CA0084.namprd12.prod.outlook.com (2603:10b6:802:21::19)
 by CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Thu, 16 May
 2019 15:26:59 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by SN1PR12CA0084.outlook.office365.com
 (2603:10b6:802:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 15:26:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 15:26:58 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 10:26:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/bridge/analogix-anx78xx: Use connector kdev as aux
 device parent
Date: Thu, 16 May 2019 11:18:02 -0400
Message-ID: <1558019883-12397-7-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(189003)(199004)(53936002)(6666004)(126002)(54906003)(11346002)(70206006)(486006)(446003)(110136005)(86152003)(476003)(8676002)(2616005)(70586007)(53416004)(336012)(86362001)(5660300002)(426003)(50466002)(2876002)(356004)(2906002)(26005)(50226002)(5024004)(14444005)(7696005)(76176011)(8936002)(36756003)(51416003)(16586007)(77096007)(81166006)(186003)(316002)(68736007)(4326008)(48376002)(478600001)(47776003)(72206003)(305945005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0056; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c63b203a-e209-43af-f641-08d6da12efb6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR1201MB0056; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00562D8008C7685C904AAED9820A0@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bGNP/Y24zC9/iGmc3EGN+urS6oaqfQaGM+MdphrlIMOX/oeYbmte5B+X261wtb6OYu9uHyzge4EqkEZUumi7j4kJpcEplwB/J7GPmd84P9DpbVwP7Fzeo6XZyWd6B9R5GKnz/u6Uytmkh8srnZCm5WxKuA7RcCg7lsvwYzbkt5zq8hzlfNrm5si1WKWJy8okPxF6oQ/p1iDpe3ZlcS2fz6YrhDPe52zZhCTHjyICm68uuOOPIMzmrGm4PD89axBBdaX5bhiqtaLoaD41js1PSojh54QreoW9xMfJzThjjQf1nkaXw9EDUeHWepUh5mjdAQhHSV+3+PVCxlSlaHdJasXd0XO/CsQlnmkagB3f+Yo/U2Dd5/mli5FERGhLfPyqlDMnB/L0O93XVX31h7S9FPmw3XeDwwcG/LhERC17krc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 15:26:58.3964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c63b203a-e209-43af-f641-08d6da12efb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZQfKr8LtoKi4xxeY8s7qTQKLwEeZSQ34NAZ3EqshaU=;
 b=AHX3OiOYmgl1EN0gqr3RI4qhP965KTPslPNZ5EVPgusU0WTnBUnjIrgn7mv7zBXagovXf908n3otDN1pVJWh8GVu7X4yz8bS1OeF9NBT0s+byapO4eIYiY3YR796SlKfVzw/J8BrRIBEV1UEtaHvbb2M2YcSZjiA+3DPb6kIu1w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; collabora.com; dkim=none (message not signed)
 header.d=none; collabora.com; dmarc=permerror action=none header.from=amd.com; 
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKVG8gZG8gc28sIHRoZSBjb25uZWN0b3Ig
bmVlZHMgdG8gYmUgcmVnaXN0ZXJlZCBiZWZvcmVoYW5kLiBUaGVyZWZvcmUsCnNoaWZ0IGF1eCBy
ZWdpc3RyYXRpb24gdG8gYmUgYWZ0ZXIgY29ubmVjdG9yIHJlZ2lzdHJhdGlvbi4KCkNjOiBFbnJp
YyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgpDYzogTmlj
b2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgtYW54Nzh4eC5jIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC1hbng3OHh4LmMKaW5kZXggZjg0MzNjOS4uOWZjOGI0YyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKQEAgLTEwMTgsMTcgKzEwMTgsNiBAQCBz
dGF0aWMgaW50IGFueDc4eHhfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
KQogCQlyZXR1cm4gLUVOT0RFVjsKIAl9CiAKLQkvKiBSZWdpc3RlciBhdXggY2hhbm5lbCAqLwot
CWFueDc4eHgtPmF1eC5uYW1lID0gIkRQLUFVWCI7Ci0JYW54Nzh4eC0+YXV4LmRldiA9ICZhbng3
OHh4LT5jbGllbnQtPmRldjsKLQlhbng3OHh4LT5hdXgudHJhbnNmZXIgPSBhbng3OHh4X2F1eF90
cmFuc2ZlcjsKLQotCWVyciA9IGRybV9kcF9hdXhfcmVnaXN0ZXIoJmFueDc4eHgtPmF1eCk7Ci0J
aWYgKGVyciA8IDApIHsKLQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gcmVnaXN0ZXIgYXV4IGNoYW5u
ZWw6ICVkXG4iLCBlcnIpOwotCQlyZXR1cm4gZXJyOwotCX0KLQogCWVyciA9IGRybV9jb25uZWN0
b3JfaW5pdChicmlkZ2UtPmRldiwgJmFueDc4eHgtPmNvbm5lY3RvciwKIAkJCQkgJmFueDc4eHhf
Y29ubmVjdG9yX2Z1bmNzLAogCQkJCSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQpOwpA
QCAtMTA0OCw2ICsxMDM3LDE3IEBAIHN0YXRpYyBpbnQgYW54Nzh4eF9icmlkZ2VfYXR0YWNoKHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAKIAlhbng3OHh4LT5jb25uZWN0b3IucG9sbGVkID0g
RFJNX0NPTk5FQ1RPUl9QT0xMX0hQRDsKIAorCS8qIFJlZ2lzdGVyIGF1eCBjaGFubmVsICovCisJ
YW54Nzh4eC0+YXV4Lm5hbWUgPSAiRFAtQVVYIjsKKwlhbng3OHh4LT5hdXguZGV2ID0gJmFueDc4
eHgtPmNvbm5lY3Rvci5rZGV2OworCWFueDc4eHgtPmF1eC50cmFuc2ZlciA9IGFueDc4eHhfYXV4
X3RyYW5zZmVyOworCisJZXJyID0gZHJtX2RwX2F1eF9yZWdpc3RlcigmYW54Nzh4eC0+YXV4KTsK
KwlpZiAoZXJyIDwgMCkgeworCQlEUk1fRVJST1IoIkZhaWxlZCB0byByZWdpc3RlciBhdXggY2hh
bm5lbDogJWRcbiIsIGVycik7CisJCXJldHVybiBlcnI7CisJfQorCiAJZXJyID0gZHJtX2Nvbm5l
Y3Rvcl9hdHRhY2hfZW5jb2RlcigmYW54Nzh4eC0+Y29ubmVjdG9yLAogCQkJCQkgICBicmlkZ2Ut
PmVuY29kZXIpOwogCWlmIChlcnIpIHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
