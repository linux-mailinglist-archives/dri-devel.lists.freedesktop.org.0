Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7FD7961
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 17:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6E36E36F;
	Tue, 15 Oct 2019 15:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C176E358;
 Tue, 15 Oct 2019 15:04:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ2iBhgQLJ6GU3L1ZCHvR2+tF7ibsDvTUhTPdIU9CYGpd1yCDH9VR2X2dUgQLP5g6/Twbttmzj9lAtQBxckwtWwVvPU/5ujSMUUkWrfv7PG4UzDKXtI5V7jbjQlvtfQb5MdTj2XHPv0XeOpE9u33EJBjZMjKo0RQuzqEMQdW2ZTSL6RKG1LNBTKpKS8NZWvgThSbSZURXt/9sbYfGPp9U3380GOhSfcE/LIuaOidfsCekoTAAGpm8plbyKKF3kHG79lvAc8jmxK+lyX8i/qRnjrSjcaJxL4wSxsHL3hjwOKnerT67e5gO6iM5K6Ned73NKIKWNVvvrtu+hqKjkNNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOkcLH8AdUvhhCh8OTIeUmfYElmMj/EHul5PtMj1KXo=;
 b=A+R8b4W2CVdjFK6cY889tANB/PEcUkHgdyGq9SOGH4JcsApOXoWX/X9Excmh3niKQQ2nTD5FJ2kcIoVQTqY3Xg0W37nX3ToIscDW9QbBR6Jsuj3iK+BJoKp/lsWNwqlrmetODlFyvGU6X5CrSeyumFb86ic/y4rBLI46OcDh/yE50IQtiX0dTfSBykhfHAUJ/oAv1yHFOTbxn5m4vmVxcpAV8TeWeTKgGGutMtHXLWrkOME9hnGRE92mMkqkVCO1O3mCdztsJNCOg4FgLXguN25tkxIRKA/Bpykei9pNNZVRFvIM+g+zqz6AWATycDg4BPmnQy8G5QSyBMz45mWCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:910:16::24) by MWHPR12MB1711.namprd12.prod.outlook.com
 (2603:10b6:300:10a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.22; Tue, 15 Oct
 2019 15:04:51 +0000
Received: from BY2NAM03FT018.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by CY4PR1201CA0014.outlook.office365.com
 (2603:10b6:910:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 15:04:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BY2NAM03FT018.mail.protection.outlook.com (10.152.84.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Tue, 15 Oct 2019 15:04:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 15 Oct
 2019 10:04:50 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 15 Oct
 2019 10:04:49 -0500
Received: from hersenwu-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 15 Oct 2019 10:04:49 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/display: hook renoir dc to pplib funcs
Date: Tue, 15 Oct 2019 11:04:43 -0400
Message-ID: <20191015150443.11456-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(428003)(199004)(189003)(48376002)(51416003)(6666004)(486006)(4326008)(8676002)(356004)(7696005)(305945005)(450100002)(1076003)(478600001)(86362001)(36756003)(110136005)(47776003)(186003)(476003)(5660300002)(14444005)(2906002)(54906003)(126002)(16586007)(81156014)(426003)(336012)(81166006)(316002)(70206006)(50466002)(70586007)(53416004)(8936002)(50226002)(26005)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1711; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70f379ca-457b-47f9-5450-08d75181071f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1711:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1711ED3FAC274A1D2FE29446FD930@MWHPR12MB1711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUOMKrsrKeknkbW4+0Zd7V1xbgksF8zHS7h3vIZvWaZjgehQCc+n/xe9Z3Rq89G8NIuo873eqLX7BXolc7KiThFAi7TmdZrwJbpW2Vl4ojO946y7tpk5nDQAM/0iw1JdYjeNyVF1kQN/ntWq82PYs5ox1MVmkU4dqsy7XZ5SRmDALLLY3ozRipOnnckc3sB9hMtuPMmYIK39oj6KZhwmEjAIqfunVSnNNPXskuEWg4pW4tRsz+znvbJLkGsDrdk1dMNk1iIySwNPe1jIrCrw1MwSPyGurSWF150QebL27HXijO/MFgkeTgynlNrg3wpyhI7KbIvYHXVWoI0kvQqTqT5TCFO8V9oSvViEr145woM4oPnosO7Z4yJKZJgeTaFkAAqh5ggu49PlT4p2mPiaSjBOJxCj79yFx3Hy/T5UZLg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 15:04:50.7038 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f379ca-457b-47f9-5450-08d75181071f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOkcLH8AdUvhhCh8OTIeUmfYElmMj/EHul5PtMj1KXo=;
 b=Ub7o5IjrMjNmEdGzj9lei0zBh+OC0LMbBL3I/KfbV5qYZxt02Ybl4lAhD8QHgN4cIpLhzMhfXwdDcaGsoEWjfqKZGQ1F1a6kuosGRDAgF2HmSI8xTlS3IXB1dkFd1Zr1WLgZW5fC82LCIGejP+VyotF06Eu/tGetpOJY8A3RtYc=
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 Hersen Wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZW5hYmxlIGRjIGdldCBkbXAgY2xvY2sgdGFibGUgYW5kIHNldCBkY24gd2F0ZXJtYXJrcwp2aWEg
cHBsaWIuCgpTaWduZWQtb2ZmLWJ5OiBIZXJzZW4gV3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+Ci0t
LQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgIHwgOTMgKysr
KysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3Nt
dS5oICAgIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX3BwX3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fcHBfc211LmMKaW5kZXggOTU1NjRiOGRlM2NlLi43YWRkNDBkZWE5Yjcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX3BwX3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX3BwX3NtdS5jCkBAIC04OTEsNiArODkxLDkwIEBAIGVudW0gcHBfc211X3N0YXR1
cyBwcF9udl9nZXRfdWNsa19kcG1fc3RhdGVzKHN0cnVjdCBwcF9zbXUgKnBwLAogCXJldHVybiBQ
UF9TTVVfUkVTVUxUX0ZBSUw7CiB9CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEK
K2VudW0gcHBfc211X3N0YXR1cyBwcF9ybl9nZXRfZHBtX2Nsb2NrX3RhYmxlKAorCQlzdHJ1Y3Qg
cHBfc211ICpwcCwgc3RydWN0IGRwbV9jbG9ja3MgKmNsb2NrX3RhYmxlKQoreworCWNvbnN0IHN0
cnVjdCBkY19jb250ZXh0ICpjdHggPSBwcC0+ZG07CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSBjdHgtPmRyaXZlcl9jb250ZXh0OworCXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0gJmFk
ZXYtPnNtdTsKKworCWlmICghc211LT5wcHRfZnVuY3MpCisJCXJldHVybiBQUF9TTVVfUkVTVUxU
X1VOU1VQUE9SVEVEOworCisJaWYgKCFzbXUtPnBwdF9mdW5jcy0+Z2V0X2RwbV9jbG9ja190YWJs
ZSkKKwkJcmV0dXJuIFBQX1NNVV9SRVNVTFRfVU5TVVBQT1JURUQ7CisKKwlpZiAoIXNtdS0+cHB0
X2Z1bmNzLT5nZXRfZHBtX2Nsb2NrX3RhYmxlKHNtdSwgY2xvY2tfdGFibGUpKQorCQlyZXR1cm4g
UFBfU01VX1JFU1VMVF9PSzsKKworCXJldHVybiBQUF9TTVVfUkVTVUxUX0ZBSUw7Cit9CisKK2Vu
dW0gcHBfc211X3N0YXR1cyBwcF9ybl9zZXRfd21fcmFuZ2VzKHN0cnVjdCBwcF9zbXUgKnBwLAor
CQlzdHJ1Y3QgcHBfc211X3dtX3JhbmdlX3NldHMgKnJhbmdlcykKK3sKKwljb25zdCBzdHJ1Y3Qg
ZGNfY29udGV4dCAqY3R4ID0gcHAtPmRtOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
Y3R4LT5kcml2ZXJfY29udGV4dDsKKwlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5z
bXU7CisJc3RydWN0IGRtX3BwX3dtX3NldHNfd2l0aF9jbG9ja19yYW5nZXNfc29jMTUgd21fd2l0
aF9jbG9ja19yYW5nZXM7CisJc3RydWN0IGRtX3BwX2Nsb2NrX3JhbmdlX2Zvcl9kbWlmX3dtX3Nl
dF9zb2MxNSAqd21fZGNlX2Nsb2NrcyA9CisJCQl3bV93aXRoX2Nsb2NrX3Jhbmdlcy53bV9kbWlm
X2Nsb2Nrc19yYW5nZXM7CisJc3RydWN0IGRtX3BwX2Nsb2NrX3JhbmdlX2Zvcl9tY2lmX3dtX3Nl
dF9zb2MxNSAqd21fc29jX2Nsb2NrcyA9CisJCQl3bV93aXRoX2Nsb2NrX3Jhbmdlcy53bV9tY2lm
X2Nsb2Nrc19yYW5nZXM7CisJaW50MzJfdCBpOworCisJaWYgKCFzbXUtPmZ1bmNzKQorCQlyZXR1
cm4gUFBfU01VX1JFU1VMVF9VTlNVUFBPUlRFRDsKKworCXdtX3dpdGhfY2xvY2tfcmFuZ2VzLm51
bV93bV9kbWlmX3NldHMgPSByYW5nZXMtPm51bV9yZWFkZXJfd21fc2V0czsKKwl3bV93aXRoX2Ns
b2NrX3Jhbmdlcy5udW1fd21fbWNpZl9zZXRzID0gcmFuZ2VzLT5udW1fd3JpdGVyX3dtX3NldHM7
CisKKwlmb3IgKGkgPSAwOyBpIDwgd21fd2l0aF9jbG9ja19yYW5nZXMubnVtX3dtX2RtaWZfc2V0
czsgaSsrKSB7CisJCWlmIChyYW5nZXMtPnJlYWRlcl93bV9zZXRzW2ldLndtX2luc3QgPiAzKQor
CQkJd21fZGNlX2Nsb2Nrc1tpXS53bV9zZXRfaWQgPSBXTV9TRVRfQTsKKwkJZWxzZQorCQkJd21f
ZGNlX2Nsb2Nrc1tpXS53bV9zZXRfaWQgPQorCQkJCQlyYW5nZXMtPnJlYWRlcl93bV9zZXRzW2ld
LndtX2luc3Q7CisKKwkJd21fZGNlX2Nsb2Nrc1tpXS53bV9taW5fZGNmY2xrX2Nsa19pbl9raHog
PQorCQkJcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1tpXS5taW5fZHJhaW5fY2xrX21oejsKKworCQl3
bV9kY2VfY2xvY2tzW2ldLndtX21heF9kY2ZjbGtfY2xrX2luX2toeiA9CisJCQlyYW5nZXMtPnJl
YWRlcl93bV9zZXRzW2ldLm1heF9kcmFpbl9jbGtfbWh6OworCisJCXdtX2RjZV9jbG9ja3NbaV0u
d21fbWluX21lbV9jbGtfaW5fa2h6ID0KKwkJCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbaV0ubWlu
X2ZpbGxfY2xrX21oejsKKworCQl3bV9kY2VfY2xvY2tzW2ldLndtX21heF9tZW1fY2xrX2luX2to
eiA9CisJCQlyYW5nZXMtPnJlYWRlcl93bV9zZXRzW2ldLm1heF9maWxsX2Nsa19taHo7CisJfQor
CisJZm9yIChpID0gMDsgaSA8IHdtX3dpdGhfY2xvY2tfcmFuZ2VzLm51bV93bV9tY2lmX3NldHM7
IGkrKykgeworCQlpZiAocmFuZ2VzLT53cml0ZXJfd21fc2V0c1tpXS53bV9pbnN0ID4gMykKKwkJ
CXdtX3NvY19jbG9ja3NbaV0ud21fc2V0X2lkID0gV01fU0VUX0E7CisJCWVsc2UKKwkJCXdtX3Nv
Y19jbG9ja3NbaV0ud21fc2V0X2lkID0KKwkJCQkJcmFuZ2VzLT53cml0ZXJfd21fc2V0c1tpXS53
bV9pbnN0OworCQl3bV9zb2NfY2xvY2tzW2ldLndtX21pbl9zb2NjbGtfY2xrX2luX2toeiA9CisJ
CQkJcmFuZ2VzLT53cml0ZXJfd21fc2V0c1tpXS5taW5fZmlsbF9jbGtfbWh6OworCisJCXdtX3Nv
Y19jbG9ja3NbaV0ud21fbWF4X3NvY2Nsa19jbGtfaW5fa2h6ID0KKwkJCXJhbmdlcy0+d3JpdGVy
X3dtX3NldHNbaV0ubWF4X2ZpbGxfY2xrX21oejsKKworCQl3bV9zb2NfY2xvY2tzW2ldLndtX21p
bl9tZW1fY2xrX2luX2toeiA9CisJCQlyYW5nZXMtPndyaXRlcl93bV9zZXRzW2ldLm1pbl9kcmFp
bl9jbGtfbWh6OworCisJCXdtX3NvY19jbG9ja3NbaV0ud21fbWF4X21lbV9jbGtfaW5fa2h6ID0K
KwkJCXJhbmdlcy0+d3JpdGVyX3dtX3NldHNbaV0ubWF4X2RyYWluX2Nsa19taHo7CisJfQorCisJ
c211X3NldF93YXRlcm1hcmtzX2Zvcl9jbG9ja19yYW5nZXMoJmFkZXYtPnNtdSwgJndtX3dpdGhf
Y2xvY2tfcmFuZ2VzKTsKKworCXJldHVybiBQUF9TTVVfUkVTVUxUX09LOworfQorI2VuZGlmCisK
IHZvaWQgZG1fcHBfZ2V0X2Z1bmNzKAogCQlzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LAogCQlzdHJ1
Y3QgcHBfc211X2Z1bmNzICpmdW5jcykKQEAgLTkzNSw2ICsxMDE5LDE1IEBAIHZvaWQgZG1fcHBf
Z2V0X2Z1bmNzKAogCQlmdW5jcy0+bnZfZnVuY3Muc2V0X3BzdGF0ZV9oYW5kc2hha2Vfc3VwcG9y
dCA9IHBwX252X3NldF9wc3RhdGVfaGFuZHNoYWtlX3N1cHBvcnQ7CiAJCWJyZWFrOwogI2VuZGlm
CisKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEKKwljYXNlIERDTl9WRVJTSU9OXzJf
MToKKwkJZnVuY3MtPmN0eC52ZXIgPSBQUF9TTVVfVkVSX1JOOworCQlmdW5jcy0+cm5fZnVuY3Mu
cHBfc211LmRtID0gY3R4OworCQlmdW5jcy0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcyA9IHBwX3Ju
X3NldF93bV9yYW5nZXM7CisJCWZ1bmNzLT5ybl9mdW5jcy5nZXRfZHBtX2Nsb2NrX3RhYmxlID0g
cHBfcm5fZ2V0X2RwbV9jbG9ja190YWJsZTsKKwkJYnJlYWs7CisjZW5kaWYKIAlkZWZhdWx0Ogog
CQlEUk1fRVJST1IoInNtdSB2ZXJzaW9uIGlzIG5vdCBzdXBwb3J0ZWQgIVxuIik7CiAJCWJyZWFr
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oCmluZGV4IGMwM2E0
NDFlZTYzOC4uMjRkNjVkYmJkNzQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZG1fcHBfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RtX3BwX3NtdS5oCkBAIC0yNTIsNyArMjUyLDcgQEAgc3RydWN0IHBwX3NtdV9mdW5jc19udiB7
CiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCiAKICNkZWZpbmUgUFBfU01V
X05VTV9TT0NDTEtfRFBNX0xFVkVMUyAgOAotI2RlZmluZSBQUF9TTVVfTlVNX0RDRkNMS19EUE1f
TEVWRUxTICA0CisjZGVmaW5lIFBQX1NNVV9OVU1fRENGQ0xLX0RQTV9MRVZFTFMgIDgKICNkZWZp
bmUgUFBfU01VX05VTV9GQ0xLX0RQTV9MRVZFTFMgICAgNAogI2RlZmluZSBQUF9TTVVfTlVNX01F
TUNMS19EUE1fTEVWRUxTICA0CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
