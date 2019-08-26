Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C429D56A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A0C6E287;
	Mon, 26 Aug 2019 18:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1658A6E293
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+OAi921gZBog8dfvsIDHxwgIE9RbWsk2s30MZRigamAIi+EpB0s5/rw/7tDOJMwlaBcT62uzSUXsyf/0YXEyDzwYuS6C/qnhe0fajknBXtxIeZCCq2+sFzYHELtI16ofSb2lckgfg+pzII1mWytlYL7ng2zxsrz4NIA9tcs9yNpAqqlHb6bdDI4DQ2MMLT5YDgJ6fIUHf+EsdHqIemUmNwAiWRinS8VHyYrB1FuKpOhWkfA+FektdssyvhjtATez6dojWZjQHdnsNxliuBd8XWylZ7vTqcc6cbyU8+SzIbHy744JBn1OckGpCNfRxecMnyhz5BLPVm8Op5D3Y7pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUBvAxFlcUBiZYgRnSJN4f+nSnhezLKuJg2FyGpNozc=;
 b=W9fK0moLX517Xp9P8zuUcQwflrPa4Ur2fZuDROXjK1yh4S4gm2u+fokX6PKEeaGMPitT9DnU017lTwe9gZ6GEPCx3J9wv1EqCnZ+Nd6ewoOSmkqwGlR1cNlwjXd3iBjh62CYm2hFwDRZYoHvkcllQtNv6yydlX8tXeMj8gqtjMbFHLN9bCw7n9kgIGnqEcTp9FGKUDrWZ16LwwtroGMbZWDgom8Eortm1d7x83A0YBkGxRSOesnYZnRQs60sdCZqM00IsqmOFlKlMMZ//sTxgzwz15kdcFlnmeoUgEiWs3vabYtjMb4AJbeoqvgLr6BHUMc7kb+cf4NudazQVS+GwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:301:4a::12) by BN6PR12MB1266.namprd12.prod.outlook.com
 (2603:10b6:404:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Mon, 26 Aug
 2019 18:05:22 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR1201CA0002.outlook.office365.com
 (2603:10b6:301:4a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 18:05:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 18:05:21 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 13:05:16 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Mon, 26 Aug 2019 14:05:06 -0400
Message-ID: <20190826180507.17802-6-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826180507.17802-1-David.Francis@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(428003)(199004)(189003)(6916009)(16586007)(50226002)(49486002)(54906003)(51416003)(48376002)(76176011)(4326008)(86362001)(50466002)(36756003)(2351001)(316002)(70206006)(70586007)(478600001)(47776003)(1076003)(8676002)(305945005)(2906002)(336012)(426003)(2616005)(486006)(26005)(476003)(126002)(186003)(14444005)(6666004)(81156014)(81166006)(11346002)(5660300002)(356004)(8936002)(446003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5399872f-7b38-4798-279b-08d72a4ff667
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1266; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1266D813FEC8B1A397A149ADEFA10@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rhOfv6HKb9ltZrw5xzPR4dW/sgohJoSBCcXfHousLTOhdmeERx70kKfsJcTiKusy8pv0igjSJtkANGe6RMwOjbvjnQpnQRn1zrwTJoq4ZIE5fOYTR1lE14yBvSnsr2zhxlook+lmHVAc+hwCMGvxHZgb9uAnganHSIgmKD9lFJPY4s0mXhpxaw8wskDD1Mxkpg3iXcu1nHR7KYI7PCdAcuMiYgqAS7e3ZXWgmmPbYKP4TszGd/h8/pebusv3fDMUZaKT7x+s2fiawptbKYx+lzF/XxL+1xKpwhPHNZLS8GwztZN3pB5aIQSzO+QIt1a3YKe+T8rogU6s/M2hkt+CVC6wAe4xblTpAcXLcuRO49Pk6E8jMgYw6J+j++ZwCx6uUy565omgqdkDjkcHat01+Rmy9PKxsfPlqnUNxIBwBek=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 18:05:21.9031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5399872f-7b38-4798-279b-08d72a4ff667
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUBvAxFlcUBiZYgRnSJN4f+nSnhezLKuJg2FyGpNozc=;
 b=vmYnT8O4NjMt9bMZeWeDujSMMe2QfKKuQTDrlS4TgLz7ssSboKWdNJAu5Mm/fAm2CfZood4O7y1INIo0cewqluUH0GeBmvGo52AOpVIqhIbHdH3xODLTODkZ/Wv2QGKhAo61hh/Cho8OU3v9g3CeEQAC3f3XEP7m9nT7FQCU+v0=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3luYXB0aWNzIERQMS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQg
dmlydHVhbCBEUENEIHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMg
Y2FuIGJlIHJlYWQgZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNl
IGh1YnMgaGF2ZSBtYW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRv
IGRldGVjdCB0aGlzIGNhc2UuCgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jIHwgMiArKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAg
ICB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYwppbmRleCAyY2MyMWVmZjRjZjMuLmZjMzkzMjNlN2Q1MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCkBAIC0xMjcwLDYgKzEyNzAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRwY2RfcXVpcmsgZHBjZF9xdWlya19saXN0W10gPSB7CiAJeyBPVUkoMHgwMCwgMHgxMCwgMHhm
YSksIERFVklDRV9JRF9BTlksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0sCiAJ
LyogQ0g3NTExIHNlZW1zIHRvIGxlYXZlIFNJTktfQ09VTlQgemVyb2VkICovCiAJeyBPVUkoMHgw
MCwgMHgwMCwgMHgwMCksIERFVklDRV9JRCgnQycsICdIJywgJzcnLCAnNScsICcxJywgJzEnKSwg
ZmFsc2UsIEJJVChEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQpIH0sCisJLyogU3luYXB0aWNz
IERQMS40IE1TVCBodWJzIGNhbiBzdXBwb3J0IERTQyB3aXRob3V0IHZpcnR1YWwgRFBDRCAqLwor
CXsgT1VJKDB4OTAsIDB4Q0MsIDB4MjQpLCBERVZJQ0VfSURfQU5ZLCB0cnVlLCBCSVQoRFBfRFBD
RF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QpIH0sCiB9OwogCiAjdW5kZWYgT1VJCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmgKaW5kZXggODM2NDUwMmY5MmNmLi5hMTMzMWIwODcwNWYgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKQEAgLTE0MzQsNiArMTQzNCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7CiAJICogVGhl
IGRyaXZlciBzaG91bGQgaWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4KIAkgKi8K
IAlEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQsCisJLyoqCisJICogQERQX0RQQ0RfUVVJUktf
RFNDX1dJVEhPVVRfVklSVFVBTF9EUENEOgorCSAqCisJICogVGhlIGRldmljZSBzdXBwb3J0cyBN
U1QgRFNDIGRlc3BpdGUgbm90IHN1cHBvcnRpbmcgVmlydHVhbCBEUENELgorCSAqIFRoZSBEU0Mg
Y2FwcyBjYW4gYmUgcmVhZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXggaW5zdGVhZC4KKwkgKi8KKwlE
UF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBDRCwKIH07CiAKIC8qKgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
