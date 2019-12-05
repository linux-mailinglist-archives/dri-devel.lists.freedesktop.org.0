Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4D113D76
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01506F5FC;
	Thu,  5 Dec 2019 09:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760075.outbound.protection.outlook.com [40.107.76.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BC16F5FC;
 Thu,  5 Dec 2019 09:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR4dlc3pglR6dLuR+c/yaz7fPS5X2CFKpZZOPk8JwJwZmVgjz4qTKzaM87hcUTH3aKb/A3kRBeO5PGfF7VJjCp4yt0mQNdO1KTpYEom9baNIg49QPBhh6YZCk7VjBnmzxi0B93OZ3T2KpDr9uEfNgRy/UmitcDA+l+a1ghOtPR7ZCW8B563WqRIcX+TeLvAuVIbGWBdUJsMgXlBhsQ/U73fIgCdgAG3P4GwbQz3yzA0DaDX1REyPUkEEepuJaJwQGYV3rTxzhlVpm7tLDscFzunktSXS/UTwD1SEeynoV5/iQ/UJYmpprwc1vYyM9QvMJ+uKwJ+AjAZdgcQNQDzXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdFr6837ay9GVGu4ppW1TvFtsVwna6j2PxUPEW9dbI4=;
 b=GtpycWjpGMFCC18LLaJIvDLvCmBLoJJGljbfNMiSaRIuvoDCqUh/0R18bXR7luS18srO8vwzjUw6LzMB7u9dSJiai8kVp3dw9wGiYrF6LwV59Z9DZIoJjV/W6MAyLeniB31pTq74TSX1kZe+o1SEJK2kxjF3t+zi5ZkX3ewLiCAAf3dhH/f3ldpZCrXvHIZrbDNT6/MztSgufUNBwTWnjiumi2vIlmT7iCsTgoAB0HxazXgf0gW+4jvTYyEv0dHn7mFce58iR5MLuixwn9714RHlCJfJb7B4ztxZvzzC67BHhC/yKQuzsG2zcuxHKtFVTYevLcZO12eTaz4AQbdPng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0030.namprd12.prod.outlook.com (2603:10b6:405:70::16)
 by DM6PR12MB3786.namprd12.prod.outlook.com (2603:10b6:5:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Thu, 5 Dec
 2019 09:01:18 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::206) by BN6PR12CA0030.outlook.office365.com
 (2603:10b6:405:70::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Thu, 5 Dec 2019 09:01:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 5 Dec 2019 09:01:18 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 03:01:17 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 5 Dec 2019 03:01:15 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
Date: Thu, 5 Dec 2019 17:00:43 +0800
Message-ID: <20191205090043.7580-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(428003)(199004)(189003)(2616005)(426003)(53416004)(51416003)(7696005)(1076003)(4326008)(14444005)(50226002)(305945005)(186003)(26005)(478600001)(336012)(36756003)(16586007)(54906003)(2906002)(5660300002)(48376002)(110136005)(81166006)(81156014)(8676002)(316002)(8936002)(70206006)(356004)(6666004)(70586007)(50466002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3786; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 702d6a9d-542e-4c89-9252-08d77961b0cc
X-MS-TrafficTypeDiagnostic: DM6PR12MB3786:
X-Microsoft-Antispam-PRVS: <DM6PR12MB37863F64909420F4E8B76FFAFC5C0@DM6PR12MB3786.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 02426D11FE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loDQL3WHreVe5duDJXX5v2aUSlsTHz7u4rHWMiET8n81481+hd2BeYcM6uzq7cUOhWbc/06OvGWLtpzJ2yc9k429dIhvmYa7CKMFg7EHF/ZPMw/otjzNjrjAVvUha0Ef2IfGnIykCKp1GCtXH2PaO/SaW0ctYSRJOBSePXoDMTChVB/EaWlwe5idYjJd4m4hi13mvInUWfGr96scdAdH4R+TFuBN/f0RBa9s2XWMy80NhT23FHKuZ9dCAey/ilDxt3gfd7kkcieVtY/F0uPhM3e3VA2P7OUUtzHBKgkxukzUyvqLg3OLNYTdYsrReV77959xLtJN5owbmqT6xiuMwDzeJNkQMxCSJ74jE6KFZaQx2cY18vlysbH5DflKEe3tGdJvIcyu0xS2XH/TlXxzYzryZxbUu36ZeNsFJOw2kFygNauBmWeuvIRIuzXIxDBr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 09:01:18.0269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702d6a9d-542e-4c89-9252-08d77961b0cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3786
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdFr6837ay9GVGu4ppW1TvFtsVwna6j2PxUPEW9dbI4=;
 b=N39/J981y635pBN4yG62PlLzIbfTQJUlHFMU7mexgJRsPmWdpbGXRKKYnZf2CV5HLCEvwqmoKjIQwVJlKZqJmksBe4aJhhjsimA1ZcEkODH2ngHUky9nQDHribG43Y1R5HRDvi5Nh5sTFn3DEvFMPfLcXK9fqitW/oTtjYxp8/A=
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
Cc: stable@vger.kernel.org, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KClRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIGFkZHJlc3MgdGhlIGlzc3VlIG9ic2VydmVk
IHdoZW4gaG90cGx1ZyBEUApkYWlzeSBjaGFpbiBtb25pdG9ycy4KCmUuZy4Kc3JjLW1zdGItbXN0
Yi1zc3QgLT4gc3JjICh1bnBsdWcpIG1zdGItbXN0Yi1zc3QgLT4gc3JjLW1zdGItbXN0Yi1zc3QK
KHBsdWcgaW4gYWdhaW4pCgpPbmNlIHVucGx1ZyBhIERQIE1TVCBjYXBhYmxlIGRldmljZSwgZHJp
dmVyIHdpbGwgY2FsbApkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KCkgdG8gZGlzYWJs
ZSBNU1QuIEluIHRoaXMgZnVuY3Rpb24sCml0IGNsZWFucyBkYXRhIG9mIHRvcG9sb2d5IG1hbmFn
ZXIgd2hpbGUgZGlzYWJsaW5nIG1zdF9zdGF0ZS4gSG93ZXZlciwKaXQgZG9lc24ndCBjbGVhbiB1
cCB0aGUgcHJvcG9zZWRfdmNwaXMgb2YgdG9wb2xvZ3kgbWFuYWdlci4KSWYgcHJvcG9zZWRfdmNw
aSBpcyBub3QgcmVzZXQsIG9uY2UgcGx1ZyBpbiBNU1QgZGFpc3kgY2hhaW4gbW9uaXRvcnMKbGF0
ZXIsIGNvZGUgd2lsbCBmYWlsIGF0IGNoZWNraW5nIHBvcnQgdmFsaWRhdGlvbiB3aGlsZSB0cnlp
bmcgdG8KYWxsb2NhdGUgcGF5bG9hZHMuCgpXaGVuIE1TVCBjYXBhYmxlIGRldmljZSBpcyBwbHVn
Z2VkIGluIGFnYWluIGFuZCB0cnkgdG8gYWxsb2NhdGUKcGF5bG9hZHMgYnkgY2FsbGluZyBkcm1f
ZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoKSwgdGhpcwpmdW5jdGlvbiB3aWxsIGl0ZXJhdGUgb3Zl
ciBhbGwgcHJvcG9zZWQgdmlydHVhbCBjaGFubmVscyB0byBzZWUgaWYKYW55IHByb3Bvc2VkIFZD
UEkncyBudW1fc2xvdHMgaXMgZ3JlYXRlciB0aGFuIDAuIElmIGFueSBwcm9wb3NlZApWQ1BJJ3Mg
bnVtX3Nsb3RzIGlzIGdyZWF0ZXIgdGhhbiAwIGFuZCB0aGUgcG9ydCB3aGljaCB0aGUKc3BlY2lm
aWMgdmlydHVhbCBjaGFubmVsIGRpcmVjdGVkIHRvIGlzIG5vdCBpbiB0aGUgdG9wb2xvZ3ksIGNv
ZGUgdGhlbgpmYWlscyBhdCB0aGUgcG9ydCB2YWxpZGF0aW9uLiBTaW5jZSB0aGVyZSBhcmUgc3Rh
bGUgVkNQSSBhbGxvY2F0aW9ucwpmcm9tIHRoZSBwcmV2aW91cyB0b3BvbG9neSBlbmFibGVtZW50
IGluIHByb3Bvc2VkX3ZjcGlbXSwgY29kZSB3aWxsIGZhaWwKYXQgcG9ydCB2YWxpZGF0aW9uIGFu
ZCByZXVybiBFSU5WQUwuCgpbSG93XQoKQ2xlYW4gdXAgdGhlIGRhdGEgb2Ygc3RhbGUgcHJvcG9z
ZWRfdmNwaVtdIGFuZCByZXNldCBtZ3ItPnByb3Bvc2VkX3ZjcGlzCnRvIE5VTEwgd2hpbGUgZGlz
YWJsaW5nIG1zdCBpbiBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KCkuCgpDaGFuZ2Vz
IHNpbmNlIHYxOgoqQWRkIG9uIG1vcmUgZGV0YWlscyBpbiBjb21taXQgbWVzc2FnZSB0byBkZXNj
cmliZSB0aGUgaXNzdWUgd2hpY2ggdGhlIApwYXRjaCBpcyB0cnlpbmcgdG8gZml4CgpTaWduZWQt
b2ZmLWJ5OiBXYXluZSBMaW4gPFdheW5lLkxpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5k
ZXggYWU1ODA5YTFmMTlhLi5iZjRmNzQ1YTRlZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYwpAQCAtMzM4Niw2ICszMzg2LDcgQEAgc3RhdGljIGludCBkcm1fZHBfZ2V0X3Zj
X3BheWxvYWRfYncodTggZHBfbGlua19idywgdTggIGRwX2xpbmtfY291bnQpCiBpbnQgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Ig
Km1nciwgYm9vbCBtc3Rfc3RhdGUpCiB7CiAJaW50IHJldCA9IDA7CisJaW50IGkgPSAwOwogCXN0
cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiA9IE5VTEw7CiAKIAltdXRleF9sb2NrKCZtZ3It
PmxvY2spOwpAQCAtMzQ0NiwxMCArMzQ0NywyMSBAQCBpbnQgZHJtX2RwX21zdF90b3BvbG9neV9t
Z3Jfc2V0X21zdChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwgYm9vbCBtcwog
CQkvKiB0aGlzIGNhbiBmYWlsIGlmIHRoZSBkZXZpY2UgaXMgZ29uZSAqLwogCQlkcm1fZHBfZHBj
ZF93cml0ZWIobWdyLT5hdXgsIERQX01TVE1fQ1RSTCwgMCk7CiAJCXJldCA9IDA7CisJCW11dGV4
X2xvY2soJm1nci0+cGF5bG9hZF9sb2NrKTsKIAkJbWVtc2V0KG1nci0+cGF5bG9hZHMsIDAsIG1n
ci0+bWF4X3BheWxvYWRzICogc2l6ZW9mKHN0cnVjdCBkcm1fZHBfcGF5bG9hZCkpOwogCQltZ3It
PnBheWxvYWRfbWFzayA9IDA7CiAJCXNldF9iaXQoMCwgJm1nci0+cGF5bG9hZF9tYXNrKTsKKwkJ
Zm9yIChpID0gMDsgaSA8IG1nci0+bWF4X3BheWxvYWRzOyBpKyspIHsKKwkJCXN0cnVjdCBkcm1f
ZHBfdmNwaSAqdmNwaSA9IG1nci0+cHJvcG9zZWRfdmNwaXNbaV07CisKKwkJCWlmICh2Y3BpKSB7
CisJCQkJdmNwaS0+dmNwaSA9IDA7CisJCQkJdmNwaS0+bnVtX3Nsb3RzID0gMDsKKwkJCX0KKwkJ
CW1nci0+cHJvcG9zZWRfdmNwaXNbaV0gPSBOVUxMOworCQl9CiAJCW1nci0+dmNwaV9tYXNrID0g
MDsKKwkJbXV0ZXhfdW5sb2NrKCZtZ3ItPnBheWxvYWRfbG9jayk7CiAJfQogCiBvdXRfdW5sb2Nr
OgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
