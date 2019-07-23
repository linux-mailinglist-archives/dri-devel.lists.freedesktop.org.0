Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB572305
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33456E3DD;
	Tue, 23 Jul 2019 23:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61FD6E3E4;
 Tue, 23 Jul 2019 23:29:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPdyYPBroCsJ419abXotXBfhd8pDgvfuZ/PURjzKqGB9er+ik7fwQAmggsAswfOEx+mneAAFwUAZ4fF2pf25HAnZS6bJNZ1Z1Ehi5CLwZAd5wsqmbnq9lEf2PWmiskomDYiTwxwF4/5PkGdlreqVT3HVRGgtxKCTDOHQLoFppdwSFneLd2COklVn+bppr0emB6FD7yiGnjgBH0iXERMWhG8orCb/YPbH7ShiYav/s461ZX5le9nBtTHJgv4Cp4J1Hfm+S1QSAirzs+1lf5zP0eYNfkPQpjM2MHFKduoiJIaWP4edOc04KImuavf6qDf42dE6XyKliIwbJo/tt45gSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtxWvtZmg/0et3/q8/dWNXDC3/jSkhtdFEe+vZGDNi4=;
 b=b8HlhMG7dVbX7OJMM2wzFIYa5+gUTjyCkJuqkouZ9u3o39NBGrANEkDWop5p+wZCdGuWRyER3f/Gx5XzaEAbaJG767pFlrHefBPzGuV0SpNC/0OE1MB38Hzy24uiVgvvtdYYvw832E2Ju46Vud1Spy6toNu8m1JnGXzi840m0JJUp6ETwsP7hwplKDVfDYDqmEG4QDAgoJLcIpUbgWatkg4TFztTGjf32vwKK1G1GbjLCydnY0DCq1Rt0gpQpHKYhk/RD0X2eQCnYLayZutB2XgkjEROrkY4zrkEFkBI1bB3zNnwQTGaMfBfUwoFTIgJ8k5aY8LQvcq6QWoKnX4xUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by DM5PR12MB1305.namprd12.prod.outlook.com
 (2603:10b6:3:75::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15; Tue, 23 Jul
 2019 23:29:11 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:11 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:06 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 8/9] drm/radeon: Implement MST Aux device registration
Date: Tue, 23 Jul 2019 19:28:07 -0400
Message-ID: <20190723232808.28128-9-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723232808.28128-1-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(478600001)(70586007)(70206006)(47776003)(2876002)(53936002)(5660300002)(49486002)(50466002)(305945005)(48376002)(14444005)(4326008)(486006)(86362001)(476003)(110136005)(76176011)(8676002)(186003)(68736007)(126002)(50226002)(54906003)(2616005)(2870700001)(446003)(11346002)(426003)(2906002)(1076003)(336012)(36756003)(51416003)(81166006)(26005)(8936002)(81156014)(356004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1305; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e75a7fb4-18b2-4be8-b859-08d70fc5912a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1305; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1305:
X-Microsoft-Antispam-PRVS: <DM5PR12MB13051C1ED07A7DF7863AD0B182C70@DM5PR12MB1305.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BgjLzfxDBN8M9Yj7yBfEhQwMZG86RmAoZ+1iqwpIDkQMM34Ktw1yEEOfE65YkLwA9wEvP8onH6etmWnpunA5xHAH5LycoLvXJNWFkRMzSo7z6j6L7FEPD18vx9TY0Jw54dkxg5ZFj/rQesUEok+KFgZROrqMXNznH9Zid4dFd/oxlBSW/xZs5ii4BWZdXIJN7+cW6Dfk3rUV01Q8s635U4NE6oaQCVy9cwS98JBOV5jvYEwTtgOavF2rFW7ElzUz9GdmH6OFdHkOLQcjNYQci7XKtlfe06C3acubLHv3LoHM4IUwVqPElt5Z4AZ0doqnf31UDRPGaI/CLqmyFY128bUulNlJXyuOt85utDnQEpD8sLWWQKOjQ5M2Hnzcf7rLqL2XWpCHNhGXPxDJLQctQp1LUG2akREpYR1/XjOSNsM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:11.1922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e75a7fb4-18b2-4be8-b859-08d70fc5912a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtxWvtZmg/0et3/q8/dWNXDC3/jSkhtdFEe+vZGDNi4=;
 b=JDfFXQaHp1gspvp7kCkSr0aaxuFmdZ5NDOgiR6pzQ2YVhv8+IhqQhxQVJcJ9n0G4q7u4Mpi8ZHqfW7ampfJEA+0aLLJ8x+CUda2FrbTgO1EpfO6172Zo/z/ZFXshxY+Ql/f0Ec5Ve7clnRHibAZIGFB0aAD/CizanlmvDQYTzvI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCkNhbGwgZHJt
IGhlbHBlcnMgZm9yIE1TVCBjb25uZWN0b3IgcmVnaXN0cmF0aW9uLCB3aGljaCByZWdpc3RlcnMg
dGhlCkFVWCBkZXZpY2VzLgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcF9tc3QuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZHBfbXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
cF9tc3QuYwppbmRleCAyOTk0ZjA3ZmJhZDkuLjJkNTM2OTk3MzRmYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHBfbXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZHBfbXN0LmMKQEAgLTI2MCwxMSArMjYwLDMzIEBAIHJhZGVvbl9kcF9t
c3RfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlr
ZnJlZShyYWRlb25fY29ubmVjdG9yKTsKIH0KIAorc3RhdGljIGludAorcmFkZW9uX2RwX21zdF9j
b25uZWN0b3JfbGF0ZV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQor
eworCXN0cnVjdCByYWRlb25fY29ubmVjdG9yICpyYWRlb25fY29ubmVjdG9yID0KKwkJdG9fcmFk
ZW9uX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQg
PSByYWRlb25fY29ubmVjdG9yLT5wb3J0OworCisJcmV0dXJuIGRybV9kcF9tc3RfY29ubmVjdG9y
X2xhdGVfcmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKK30KKworc3RhdGljIHZvaWQKK3JhZGVv
bl9kcF9tc3RfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgcmFkZW9uX2Nvbm5lY3RvciAqcmFkZW9uX2Nvbm5lY3Rv
ciA9CisJCXRvX3JhZGVvbl9jb25uZWN0b3IoY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0ICpwb3J0ID0gcmFkZW9uX2Nvbm5lY3Rvci0+cG9ydDsKKworCWRybV9kcF9tc3RfY29u
bmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKK30KKwogc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIHJhZGVvbl9kcF9tc3RfY29ubmVjdG9yX2Z1
bmNzID0gewogCS5kcG1zID0gZHJtX2hlbHBlcl9jb25uZWN0b3JfZHBtcywKIAkuZGV0ZWN0ID0g
cmFkZW9uX2RwX21zdF9kZXRlY3QsCiAJLmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3Byb2JlX3Np
bmdsZV9jb25uZWN0b3JfbW9kZXMsCiAJLmRlc3Ryb3kgPSByYWRlb25fZHBfbXN0X2Nvbm5lY3Rv
cl9kZXN0cm95LAorCS5sYXRlX3JlZ2lzdGVyID0gcmFkZW9uX2RwX21zdF9jb25uZWN0b3JfbGF0
ZV9yZWdpc3RlciwKKwkuZWFybHlfdW5yZWdpc3RlciA9IHJhZGVvbl9kcF9tc3RfY29ubmVjdG9y
X2Vhcmx5X3VucmVnaXN0ZXIsCiB9OwogCiBzdGF0aWMgc3RydWN0IGRybV9jb25uZWN0b3IgKnJh
ZGVvbl9kcF9hZGRfbXN0X2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Ig
Km1nciwKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
