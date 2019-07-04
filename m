Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E15FD4C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2426E3DD;
	Thu,  4 Jul 2019 19:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C186E3D6;
 Thu,  4 Jul 2019 19:06:37 +0000 (UTC)
Received: from BN8PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:60::32)
 by BN6PR12MB1186.namprd12.prod.outlook.com (2603:10b6:404:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 19:06:34 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by BN8PR12CA0019.outlook.office365.com
 (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:34 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:24 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/10] drm/radeon: Implement MST Aux device registration
Date: Thu, 4 Jul 2019 15:05:18 -0400
Message-ID: <20190704190519.29525-10-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(1076003)(68736007)(50226002)(48376002)(81156014)(47776003)(81166006)(2906002)(8936002)(2870700001)(5660300002)(336012)(72206003)(478600001)(8676002)(305945005)(2876002)(70586007)(316002)(426003)(126002)(446003)(14444005)(476003)(50466002)(36756003)(54906003)(53936002)(51416003)(77096007)(4326008)(356004)(6666004)(26005)(70206006)(110136005)(186003)(2616005)(486006)(11346002)(86362001)(76176011)(49486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1186; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40d0b346-d0f1-4d2b-883a-08d700b2bb68
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1186; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1186:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1186D490DE425C464815D27282FA0@BN6PR12MB1186.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZYq0nkWc8whvrzQqnP36noaGqR+RXeeKacuFoiJgBmaFmFLSSDcHjOd5BkM6r0LinJjBwQsRu40C4EDAPW04uSIxrBMGnY2fQO2Tee2QDKyIvyfFuCVS06VFK+M8hFL5UbtC0FzLC+x8Lh2R07s/JQFKycZLjNumSpnmsFyBFNjudqjDdiOxLrRGCmkQb1x7uGYdEpcTFT96ET74NplY/bWaGdt2c82qfxJhbK811HSFOVNtjW1O9gV4EJ+NNiGybzuRIo5gQqT6y3ZLfzjTCIBY9f+sakiO1QZcLfdpFyMlNVBLvGORMAg3L3QZbFcwqVioDmhFuEVlI7D5nuj5CEfdLqgPTcYtMmTqko3kq+Ntkz0ZGlH8rMMPUxNXHo2kcBIj0s9V55bdvqbBnF50x+wr/c6wkfPc7OmPXqubXvU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:34.1626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d0b346-d0f1-4d2b-883a-08d700b2bb68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8wYiAJ2Xh33yB9E+rInlTBkW9mTCSWPql5jsZ/BFx0=;
 b=g+0TR+1VwsJ2Kxa1P5jD+Dy2iS2wgk3htySV8c2sri0vK4tCYOl+9DcwCahv7LvUBuRQknzsaN5d7haqUmvx8lU15qH2Et3Y2lYhziiZHbjBYTEPQ/tWWfAv5arUHf3/JOKmLng4OtdHoMz83fN23dUFbww74+PXJTVs7giN830=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCkNhbGwgZHJt
IGhlbHBlcnMgZm9yIE1TVCBjb25uZWN0b3IgcmVnaXN0cmF0aW9uLCB3aGljaCByZWdpc3RlcnMg
dGhlCkFVWCBkZXZpY2VzLgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHBfbXN0LmMgfCAyMiArKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RwX21zdC5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fZHBfbXN0LmMKaW5kZXggMjk5NGYwN2ZiYWQ5Li4yZDUzNjk5NzM0ZmIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RwX21zdC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RwX21zdC5jCkBAIC0yNjAsMTEgKzI2MCwzMyBA
QCByYWRlb25fZHBfbXN0X2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCiAJa2ZyZWUocmFkZW9uX2Nvbm5lY3Rvcik7CiB9CiAKK3N0YXRpYyBpbnQKK3Jh
ZGVvbl9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgcmFkZW9uX2Nvbm5lY3RvciAqcmFkZW9uX2Nvbm5lY3Rv
ciA9CisJCXRvX3JhZGVvbl9jb25uZWN0b3IoY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0ICpwb3J0ID0gcmFkZW9uX2Nvbm5lY3Rvci0+cG9ydDsKKworCXJldHVybiBkcm1fZHBf
bXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKGNvbm5lY3RvciwgcG9ydCk7Cit9CisKK3N0YXRp
YyB2b2lkCityYWRlb25fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCit7CisJc3RydWN0IHJhZGVvbl9jb25uZWN0b3IgKnJh
ZGVvbl9jb25uZWN0b3IgPQorCQl0b19yYWRlb25fY29ubmVjdG9yKGNvbm5lY3Rvcik7CisJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCA9IHJhZGVvbl9jb25uZWN0b3ItPnBvcnQ7CisKKwlk
cm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKGNvbm5lY3RvciwgcG9ydCk7Cit9
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyByYWRlb25fZHBfbXN0
X2Nvbm5lY3Rvcl9mdW5jcyA9IHsKIAkuZHBtcyA9IGRybV9oZWxwZXJfY29ubmVjdG9yX2RwbXMs
CiAJLmRldGVjdCA9IHJhZGVvbl9kcF9tc3RfZGV0ZWN0LAogCS5maWxsX21vZGVzID0gZHJtX2hl
bHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLAogCS5kZXN0cm95ID0gcmFkZW9uX2Rw
X21zdF9jb25uZWN0b3JfZGVzdHJveSwKKwkubGF0ZV9yZWdpc3RlciA9IHJhZGVvbl9kcF9tc3Rf
Y29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIsCisJLmVhcmx5X3VucmVnaXN0ZXIgPSByYWRlb25fZHBf
bXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAogfTsKIAogc3RhdGljIHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpyYWRlb25fZHBfYWRkX21zdF9jb25uZWN0b3Ioc3RydWN0IGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyICptZ3IsCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
