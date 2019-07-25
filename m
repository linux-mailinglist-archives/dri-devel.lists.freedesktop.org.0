Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BBE74876
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7175B6E685;
	Thu, 25 Jul 2019 07:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C3C6E685
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+KISeOS/Y286bQxlHOmwhul5sQm/eImYthjRkdq/anLNUp5tC8HwIPL9Ha2ELr+sm4WUWfnirCev9Y3tjhAPOR3hXtXGMTbbZ8da1ikdWo4/IajmuWn755Tpnh0f4xyarAFLXrvAHqNbPY18HjkXZ9uNNqWOKQPLNAI+sLioTadjXEC93sRBzNBBG/DbmeOdi6xjTkXq5CkyMAJXqV6fffMntrPeduoJakjUINAoAFj3xMSGAOtZFH5OSYy9tHqc8bwBiNe1yVwlKRC4rv4hz2rs+Z8hbPczRl8JDI8zrMSZUemscRgHwYCXUHlOxRE+/VIV6HmnJ00eMtHmACRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZl622LdEcOELHCgf4gkJHTl4milZTlFy03+hqGnSiI=;
 b=kTLmKqPfFJOKIHu2Dgy7ajQMu0kiwj9609QT9InqsRp0NHpN2Hk/duNMAALYbQzTdVLtp5ZWPTuY9DUbAkMldVsY051vIheGRFmFCiJ7Wl4erxTXCCxHMhDVQLhBUeOjAMBzSon1BVmVyBzdqbhKhiNyVa2GNWTqnyTX2x4GUrq513FWe2IX8ns7kslqtSst2m7/tlyh0pLVjUvESxcw4LxsAvKwB7HVH9yzQBvEpor3vGNgEoDQq4K2YIBBXoV+xqHhJGgTEaFpk1fcj3ALjCNI3qPBiGrbQbJlvJxSk14bb6hWxhsEpT01HHAz19dyYeEFJxOVTxEp5JYsfpnI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0057.namprd12.prod.outlook.com (2603:10b6:3:103::19)
 by BN6PR12MB1571.namprd12.prod.outlook.com (2603:10b6:405:4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Thu, 25 Jul
 2019 07:52:45 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0057.outlook.office365.com
 (2603:10b6:3:103::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Thu, 25 Jul 2019 07:52:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 07:52:44 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 25 Jul 2019
 02:52:43 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm] libdrm: wrap new flexible syncobj query interface v2
Date: Thu, 25 Jul 2019 15:52:36 +0800
Message-ID: <20190725075236.21226-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(428003)(199004)(189003)(81166006)(5660300002)(81156014)(54906003)(316002)(4326008)(1076003)(14444005)(2351001)(50226002)(2870700001)(305945005)(53416004)(53936002)(50466002)(2906002)(126002)(8936002)(8676002)(66574012)(186003)(2616005)(476003)(7696005)(336012)(6916009)(70586007)(70206006)(486006)(6666004)(426003)(478600001)(47776003)(5820100001)(86362001)(26005)(356004)(36756003)(23676004)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1571; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d55829-e429-4ff2-4466-08d710d51433
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1571; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1571:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1571F4073036CA665A04F7F1B4C10@BN6PR12MB1571.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cBqW0fbhvA4UnjUOdK41cQsd4Sk+BA82MkYdUU6ddsJG01pmvMvmw3jz6zUTsQnxGJ4UZWWqIfnixiMbYWT9N4Ef07RdFZZB+I1bVzB7kAbAfJPsz05AMBHgiY4cMIT1zqYj7CfZSrbCMso49hnjACZDKcF+GUWDKnl0S63HLdxjeB2GnddsdZ0sE32+m/JMiELP5StgKG4ZerN6WZUd0EXA3+onvhYsOyBiwumxLWIjCXw5zxOkjFxs4fAa47XXFbPOJ7P7Y3iDJl+z0zVtBLUUmMMMHufZ1dXhpDX9EHw7uq64hfiv6w26fROV+0T/28yRv4Tbw34izvLc4E9IpY91IGak2PTcbkitBgvbT0+0zM737bYgDPhbfxL5t2qCKIu5wSXkah+qUemIWudtvvJKNnwOmUnNN6O5C/luwgU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 07:52:44.7164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d55829-e429-4ff2-4466-08d710d51433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1571
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZl622LdEcOELHCgf4gkJHTl4milZTlFy03+hqGnSiI=;
 b=wMc2ixtgIdZPvL+TT7foAlzTlrPsjtR6xPToklr8Zy126qHJnJhXV8+Yn1G+9k5jBjEqdZPOb2TAGp+wCR+JEDSz30AT2WVyadIqCI1U+WSmri97ByOJoklTMxFh1mEbPANImV/Ru5TO3V94JbiPEJyHuYcdZ6rwA2yYBykw7xs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6IG5pdC1waWNrcyBmaXgKClNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56
aG91QGFtZC5jb20+CkNjOiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBp
bnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
Ci0tLQogYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sgfCAgMSArCiBhbWRncHUvYW1kZ3B1Lmgg
ICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwogYW1kZ3B1L2FtZGdwdV9jcy5jICAg
ICAgICAgfCAxMCArKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm0uaCAgICAgICAgICB8ICAzICsr
LQogeGY4NmRybS5jICAgICAgICAgICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysKIHhmODZk
cm0uaCAgICAgICAgICAgICAgICAgIHwgIDIgKysKIDYgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUtc3ltYm9s
LWNoZWNrIGIvYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sKaW5kZXggMjc0YjRjNmQuLjU5N2E5
OWIyIDEwMDc1NQotLS0gYS9hbWRncHUvYW1kZ3B1LXN5bWJvbC1jaGVjaworKysgYi9hbWRncHUv
YW1kZ3B1LXN5bWJvbC1jaGVjawpAQCAtNTYsNiArNTYsNyBAQCBhbWRncHVfY3Nfc3luY29ial9l
eHBvcnRfc3luY19maWxlMgogYW1kZ3B1X2NzX3N5bmNvYmpfaW1wb3J0X3N5bmNfZmlsZQogYW1k
Z3B1X2NzX3N5bmNvYmpfaW1wb3J0X3N5bmNfZmlsZTIKIGFtZGdwdV9jc19zeW5jb2JqX3F1ZXJ5
CithbWRncHVfY3Nfc3luY29ial9xdWVyeTIKIGFtZGdwdV9jc19zeW5jb2JqX3Jlc2V0CiBhbWRn
cHVfY3Nfc3luY29ial9zaWduYWwKIGFtZGdwdV9jc19zeW5jb2JqX3RpbWVsaW5lX3NpZ25hbApk
aWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdS5oIGIvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDlkOWIw
ODMyLi4xOWY3NGJkNiAxMDA2NDQKLS0tIGEvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2FtZGdwdS9h
bWRncHUuaApAQCAtMTU5MSw2ICsxNTkxLDI0IEBAIGludCBhbWRncHVfY3Nfc3luY29ial90aW1l
bGluZV93YWl0KGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKIGludCBhbWRncHVfY3Nfc3luY29i
al9xdWVyeShhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJCQkgICAgdWludDMyX3QgKmhhbmRs
ZXMsIHVpbnQ2NF90ICpwb2ludHMsCiAJCQkgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMpOworLyoq
CisgKiAgUXVlcnkgc3luYyBvYmplY3RzIGxhc3Qgc2lnbmFsZWQgb3Igc3VibWl0dGVkIHBvaW50
LgorICoKKyAqIFxwYXJhbSAgIGRldgkgICAgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAq
IFxwYXJhbSAgIGhhbmRsZXMgLSBcYyBbaW5dIGFycmF5IG9mIHN5bmMgb2JqZWN0IGhhbmRsZXMK
KyAqIFxwYXJhbSAgIHBvaW50cyAtIFxjIFtvdXRdIGFycmF5IG9mIHN5bmMgcG9pbnRzIHJldHVy
bmVkLCB3aGljaCBwcmVzZW50cworICogc3luY29iaiBwYXlsb2FkLgorICogXHBhcmFtICAgbnVt
X2hhbmRsZXMgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAqIFxwYXJhbSAgIGZsYWdzICAg
LSBcYyBbaW5dIGEgYml0bWFzayBvZiBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU18qCisgKgorICog
XHJldHVybiAgIDAgb24gc3VjY2Vzc1xuCisgKiAgICAgICAgICAtRVRJTUUgLSBUaW1lb3V0Cisg
KiAgICAgICAgICA8MCAtIE5lZ2F0aXZlIFBPU0lYIEVycm9yIGNvZGUKKyAqCisgKi8KK2ludCBh
bWRncHVfY3Nfc3luY29ial9xdWVyeTIoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAorCQkJICAg
ICB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKKwkJCSAgICAgdW5zaWduZWQg
bnVtX2hhbmRsZXMsIHVpbnQzMl90IGZsYWdzKTsKIAogLyoqCiAgKiAgRXhwb3J0IGtlcm5lbCBz
eW5jIG9iamVjdCB0byBzaGFyZWFibGUgZmQuCmRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1X2Nz
LmMgYi9hbWRncHUvYW1kZ3B1X2NzLmMKaW5kZXggOTc3ZmEzY2YuLmZlYjJhZWM4IDEwMDY0NAot
LS0gYS9hbWRncHUvYW1kZ3B1X2NzLmMKKysrIGIvYW1kZ3B1L2FtZGdwdV9jcy5jCkBAIC03MjEs
NiArNzIxLDE2IEBAIGRybV9wdWJsaWMgaW50IGFtZGdwdV9jc19zeW5jb2JqX3F1ZXJ5KGFtZGdw
dV9kZXZpY2VfaGFuZGxlIGRldiwKIAlyZXR1cm4gZHJtU3luY29ialF1ZXJ5KGRldi0+ZmQsIGhh
bmRsZXMsIHBvaW50cywgbnVtX2hhbmRsZXMpOwogfQogCitkcm1fcHVibGljIGludCBhbWRncHVf
Y3Nfc3luY29ial9xdWVyeTIoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAorCQkJCQl1aW50MzJf
dCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKKwkJCQkJdW5zaWduZWQgbnVtX2hhbmRsZXMs
IHVpbnQzMl90IGZsYWdzKQoreworCWlmIChOVUxMID09IGRldikKKwkJcmV0dXJuIC1FSU5WQUw7
CisKKwlyZXR1cm4gZHJtU3luY29ialF1ZXJ5MihkZXYtPmZkLCBoYW5kbGVzLCBwb2ludHMsIG51
bV9oYW5kbGVzLCBmbGFncyk7Cit9CisKIGRybV9wdWJsaWMgaW50IGFtZGdwdV9jc19leHBvcnRf
c3luY29iaihhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJCQkJCXVpbnQzMl90IGhhbmRsZSwK
IAkJCQkJaW50ICpzaGFyZWRfZmQpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm0uaCBiL2lu
Y2x1ZGUvZHJtL2RybS5oCmluZGV4IDUzMjc4N2JmLi5hZjM3YTgwYiAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vZHJtLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtLmgKQEAgLTc3MSwxMSArNzcxLDEy
IEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7CiAJX191MzIgcGFkOwogfTsKIAorI2RlZmlu
ZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRFRCAoMSA8PCAwKSAvKiBsYXN0
IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBzeW5jb2JqICovCiBzdHJ1Y3QgZHJtX3N5bmNv
YmpfdGltZWxpbmVfYXJyYXkgewogCV9fdTY0IGhhbmRsZXM7CiAJX191NjQgcG9pbnRzOwogCV9f
dTMyIGNvdW50X2hhbmRsZXM7Ci0JX191MzIgcGFkOworCV9fdTMyIGZsYWdzOwogfTsKIAogCmRp
ZmYgLS1naXQgYS94Zjg2ZHJtLmMgYi94Zjg2ZHJtLmMKaW5kZXggOTUzZmM3NjIuLjI4YTYxMjY0
IDEwMDY0NAotLS0gYS94Zjg2ZHJtLmMKKysrIGIveGY4NmRybS5jCkBAIC00MzE0LDYgKzQzMTQs
MjEgQEAgZHJtX3B1YmxpYyBpbnQgZHJtU3luY29ialF1ZXJ5KGludCBmZCwgdWludDMyX3QgKmhh
bmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCiAgICAgcmV0dXJuIDA7CiB9CiAKK2RybV9wdWJsaWMg
aW50IGRybVN5bmNvYmpRdWVyeTIoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3Qg
KnBvaW50cywKKwkJCQl1aW50MzJfdCBoYW5kbGVfY291bnQsIHVpbnQzMl90IGZsYWdzKQorewor
ICAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSBhcmdzOworCisgICAgbWVtY2xl
YXIoYXJncyk7CisgICAgYXJncy5oYW5kbGVzID0gKHVpbnRwdHJfdCloYW5kbGVzOworICAgIGFy
Z3MucG9pbnRzID0gKHVpbnRwdHJfdClwb2ludHM7CisgICAgYXJncy5jb3VudF9oYW5kbGVzID0g
aGFuZGxlX2NvdW50OworICAgIGFyZ3MuZmxhZ3MgPSBmbGFnczsKKworICAgIHJldHVybiBkcm1J
b2N0bChmZCwgRFJNX0lPQ1RMX1NZTkNPQkpfUVVFUlksICZhcmdzKTsKK30KKworCiBkcm1fcHVi
bGljIGludCBkcm1TeW5jb2JqVHJhbnNmZXIoaW50IGZkLAogCQkJCSAgdWludDMyX3QgZHN0X2hh
bmRsZSwgdWludDY0X3QgZHN0X3BvaW50LAogCQkJCSAgdWludDMyX3Qgc3JjX2hhbmRsZSwgdWlu
dDY0X3Qgc3JjX3BvaW50LApkaWZmIC0tZ2l0IGEveGY4NmRybS5oIGIveGY4NmRybS5oCmluZGV4
IDNmYjFkMWNhLi41NWNlYWVkOSAxMDA2NDQKLS0tIGEveGY4NmRybS5oCisrKyBiL3hmODZkcm0u
aApAQCAtODg0LDYgKzg4NCw4IEBAIGV4dGVybiBpbnQgZHJtU3luY29ialRpbWVsaW5lV2FpdChp
bnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAogCQkJCSAgdWludDMy
X3QgKmZpcnN0X3NpZ25hbGVkKTsKIGV4dGVybiBpbnQgZHJtU3luY29ialF1ZXJ5KGludCBmZCwg
dWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCiAJCQkgICB1aW50MzJfdCBoYW5k
bGVfY291bnQpOworZXh0ZXJuIGludCBkcm1TeW5jb2JqUXVlcnkyKGludCBmZCwgdWludDMyX3Qg
KmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJCQkgICAgdWludDMyX3QgaGFuZGxlX2NvdW50
LCB1aW50MzJfdCBmbGFncyk7CiBleHRlcm4gaW50IGRybVN5bmNvYmpUcmFuc2ZlcihpbnQgZmQs
CiAJCQkgICAgICB1aW50MzJfdCBkc3RfaGFuZGxlLCB1aW50NjRfdCBkc3RfcG9pbnQsCiAJCQkg
ICAgICB1aW50MzJfdCBzcmNfaGFuZGxlLCB1aW50NjRfdCBzcmNfcG9pbnQsCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
