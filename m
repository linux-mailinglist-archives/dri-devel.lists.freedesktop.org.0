Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F84F1CD0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8441D6EE28;
	Wed,  6 Nov 2019 17:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFE86EE29;
 Wed,  6 Nov 2019 17:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaIGxyn+IWp3JrFN/Te/gPKT1PTAi4ubB4hlyHAwN+aJeOpsdFbdQq8NOGyMLddEySUBjBtrnNIQPsSxH1J4f3O3tSJ6h13/7VAIINnaaeybQWzHh5aV+I/WU3N0HLHDoANedUQUbJdG5bxL4Q3xvfeTlzBmotdw9LGUg44miO6scfaicN5+OhL+uGg6x/Z3tSDxOIZeqMHZtA5EieDFuHt6hbQWXAX7scI6MNkx/Qp2JOwkNxMw9Fo6SYaSQoSALju7eZPzSEsDjkCPb+i6d6nclgsrZe1DRpot+mhp/aE4kpontE9IXYCMtCoj8jKEDKCbNd1fll9bsH4DWCR07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7ZtcNlS+NzFNgMGtng8wt8sCwvmbpnonp+ZQ2rEn+s=;
 b=J4huJ4AWeLi0mKylaSUv5fLP5orWMzfUAGsV3a2jdeWABCjsfHllL65PTMVST/fg3shPvYK4eSXxieSBFvoLga2SQAgNWJCpzulP2fw41IQYpfHU0KDwRoeF58B3vVmkGNKmrtPgC/FdDtGYN5iKneOpmdaGpvVU9a8VsRe4B4XROZ3Vao2pzW6c5u1BhGcmcLRzssdV+W9u7SkPW/MNXlgl1vQA2oJLmrbo/1LRpoMsgVcgvRadmaKbT/qWwCFDCRTsfowBUN5efWibt2Eax0BHWuPZgHGkuGv1NXTZ+hIFNw+rmr5tp17NNVpszF6zKlVzYXQ90kBZEAyq3v2bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:910:16::33) by BN8PR12MB3489.namprd12.prod.outlook.com
 (2603:10b6:408:44::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Wed, 6 Nov
 2019 17:51:22 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CY4PR1201CA0023.outlook.office365.com
 (2603:10b6:910:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Wed, 6 Nov 2019 17:51:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 17:51:21 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 11:51:20 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 11:51:20 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: 
Subject: [PATCH 4/4] drm/amdgpu: Avoid accidental thread thread reactivation.
Date: Wed, 6 Nov 2019 12:51:12 -0500
Message-ID: <1573062672-23698-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(428003)(189003)(199004)(2616005)(47776003)(450100002)(8676002)(426003)(81166006)(50466002)(316002)(76176011)(8936002)(486006)(51416003)(305945005)(446003)(81156014)(6666004)(16586007)(2906002)(11346002)(86362001)(186003)(476003)(126002)(478600001)(5660300002)(53416004)(14444005)(36756003)(54906003)(109986005)(70586007)(336012)(26005)(70206006)(1671002)(356004)(48376002)(44832011)(7696005)(4326008)(50226002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3489; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 763fe8f7-96ae-4551-5f9b-08d762e1ef3a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3489:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3489D09A7C9DB81E9C62F2EAEA790@BN8PR12MB3489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mal7CvrlOrw+5myhE+W/dsXjhdgeIdGUARMbfffr0QJsdd0YpqZaZx4JdSKlS42o9QbHtIEo6sgUSHdRcfRZ9nZC4akmfdN57ls3Kb/d3UyjT0UJ+8BkLLPiYWRnjGRVBMz8AB/cmZQeigJg3OPQVJc50vrdb25yp8H/ReBHttyy9i7aHYTJQSpEoERJGg7prHYOZ5IL4QZrpFs1Z/ZQzgQg0NogUAmLgvKZ4FRKzgN/N+5kpzR4nFMnf+TK7i6A5hthqlzJIHYoPSTejztvdsyGlPkTsV6RFh84s7IjG/gC9/iL0QjUL2xIg0h9+ZUoLiHo4Wg/dqfmMd6RaLVIu/j6sqyGyKGu6gO8UHbSEKJ22V8vmXOAE3R/4arpY0W+g4Alu7UoUHTOOnlrUcyxqRcXIi0U+ZNWmn+ahuU3WSrC4l2yr3un593hxeYgwN9n
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 17:51:21.5347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 763fe8f7-96ae-4551-5f9b-08d762e1ef3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3489
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7ZtcNlS+NzFNgMGtng8wt8sCwvmbpnonp+ZQ2rEn+s=;
 b=a2gr1QRx0FicAP4hZ/+Rv4VnaW6NXAyz+lIR6hrdDW8mSljWV4aixD1aWLDfsoxoLdI0R7WtZsaR5ChmiHh6zmlcKa1MHTS4NHRUR7yiJCAxdK6USK3GXlTAHEVVjNc29SB/SkcT4iPuuvy6YEo2Q0zjUv2Ma75dsRivL+shmRw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
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
Cc: Shirish.S@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmxlbToKRHVyaW5nIEdQVSByZXNldCB3ZSBjYWxsIHRoZSBHUFUgc2NoZWR1bGVyIHRvIHN1
c3BlbmQgaXQncwp0aHJlYWQsIHRob3NlIHR3byBmdW5jdGlvbnMgaW4gYW1kZ3B1IGFsc28gc3Vz
cGVuZCBhbmQgcmVzdW1lCnRoZSBzY2VkdWxlciBmb3IgdGhlaXIgbmVlZHMgYnV0IHRoaXMgY2Fu
IGNvbGxpZGUgd2l0aCBHUFUKcmVzZXQgaW4gcHJvZ3Jlc3MgYW5kIGFjY2lkZW50bHkgcmVzdGFy
dCBhIHN1c3BlbmRlZCB0aHJlYWQKYmVmb3JlIHRpbWUuCgpGaXg6ClNlcmlhbGl6ZSB3aXRoIEdQ
VSByZXNldC4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpv
dnNreUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1
Z2ZzLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCmluZGV4IDY5M2Yx
N2UuLjhlNjcyNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVn
ZnMuYwpAQCAtODU5LDYgKzg1OSw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RlYnVnZnNfdGVzdF9p
YihzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCiAJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCWludCByID0gMCwgaTsKIAorCS8qIEF2b2lkIGFj
Y2lkZW50bHkgdW5wYXJraW5nIHRoZSBzY2hlZCB0aHJlYWQgZHVyaW5nIEdQVSByZXNldCAqLwor
CW11dGV4X2xvY2soJmFkZXYtPmxvY2tfcmVzZXQpOworCiAJLyogaG9sZCBvbiB0aGUgc2NoZWR1
bGVyICovCiAJZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhfUklOR1M7IGkrKykgewogCQlzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsKQEAgLTg4NCw2ICs4ODcsOCBA
QCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX3Rlc3RfaWIoc3RydWN0IHNlcV9maWxlICptLCB2
b2lkICpkYXRhKQogCQlrdGhyZWFkX3VucGFyayhyaW5nLT5zY2hlZC50aHJlYWQpOwogCX0KIAor
CW11dGV4X3VubG9jaygmYWRldi0+bG9ja19yZXNldCk7CisKIAlyZXR1cm4gMDsKIH0KIApAQCAt
MTAzNiw2ICsxMDQxLDkgQEAgc3RhdGljIGludCBhbWRncHVfZGVidWdmc19pYl9wcmVlbXB0KHZv
aWQgKmRhdGEsIHU2NCB2YWwpCiAJaWYgKCFmZW5jZXMpCiAJCXJldHVybiAtRU5PTUVNOwogCisJ
LyogQXZvaWQgYWNjaWRlbnRseSB1bnBhcmtpbmcgdGhlIHNjaGVkIHRocmVhZCBkdXJpbmcgR1BV
IHJlc2V0ICovCisJbXV0ZXhfbG9jaygmYWRldi0+bG9ja19yZXNldCk7CisKIAkvKiBzdG9wIHRo
ZSBzY2hlZHVsZXIgKi8KIAlrdGhyZWFkX3BhcmsocmluZy0+c2NoZWQudGhyZWFkKTsKIApAQCAt
MTA3NSw2ICsxMDgzLDggQEAgc3RhdGljIGludCBhbWRncHVfZGVidWdmc19pYl9wcmVlbXB0KHZv
aWQgKmRhdGEsIHU2NCB2YWwpCiAJLyogcmVzdGFydCB0aGUgc2NoZWR1bGVyICovCiAJa3RocmVh
ZF91bnBhcmsocmluZy0+c2NoZWQudGhyZWFkKTsKIAorCW11dGV4X3VubG9jaygmYWRldi0+bG9j
a19yZXNldCk7CisKIAl0dG1fYm9fdW5sb2NrX2RlbGF5ZWRfd29ya3F1ZXVlKCZhZGV2LT5tbWFu
LmJkZXYsIHJlc2NoZWQpOwogCiAJa2ZyZWUoZmVuY2VzKTsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
