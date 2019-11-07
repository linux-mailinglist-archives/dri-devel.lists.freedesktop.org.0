Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4BBF3332
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99D86F712;
	Thu,  7 Nov 2019 15:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760083.outbound.protection.outlook.com [40.107.76.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93816F700;
 Thu,  7 Nov 2019 15:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7hLGBscHBr9ezSwd1K8OXs5QyQ0TPwR3DAOvE++xlE5oOUzvTCza7WUcVOVKkfRnq0xUtvbR+UoqodzYvX1qZoJ8gMr0GbB5rUpPtsUfJt+/G9j8aLrI7dZlnyWkyD7lg4WvyV58FOVhrMgo7BAsrEcjkNKFyUWYdvIUkvjBY7RLobhCDbVc0j/wH5Mco6XebjlX/yyrcj6G7oN6fjDKsAoHkB8pK56qG/8dfyfAVQrklCu9x7LYGOhZl8L/LynBX0ct0Z3c89U85KdZF71N2bUVkehfugcyQNggk8FFmoLMAEabRY5qGRvXyBJvwzfVRzpqeFc9CDpbx86Q4vMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKFJS8LHc90hEXeh8koGFe6v1zWHzss/OKvYQRYh5wg=;
 b=KX7AVHznYt2dVsZMvCObA5SJmoSIx6BPhBJHEhp3CXjpBNgGvVAnx+1iodpKuZlZY9N3s6qbYSAan6BY2EPZHRFGcY2SvCnyR6FyZhLDJ58eFinCXpAZT4iBCvPg1jQSH/unlZVtRzB+5M7GQltWTr7LCIjlceB4TdMx9jKrBMpQrHipMExwJOZK3lGjBkAssNrM1GDr1PUx/UXULB84VidERWHNi3iUWIeS80UCvueMerzho3O7q7S1Vgrd8AGJ6geSr2rE3x+OQ4F9XkkOt76GsRrqMT1J3/4WFIqpjUsdp1x8svBuhvKOCK378FDEl9YYazXtDFeL0Xylg6yYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0016.namprd12.prod.outlook.com (2603:10b6:4:1::26) by
 DM6PR12MB3515.namprd12.prod.outlook.com (2603:10b6:5:18a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Thu, 7 Nov 2019 15:32:28 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0016.outlook.office365.com
 (2603:10b6:4:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:25 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:25 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 09/13] drm/amd/display: Write DSC enable to MST DPCD
Date: Thu, 7 Nov 2019 10:32:08 -0500
Message-ID: <20191107153212.1145-10-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(428003)(199004)(189003)(7696005)(50466002)(8936002)(8676002)(81156014)(50226002)(1076003)(86362001)(70586007)(336012)(2876002)(81166006)(26005)(51416003)(70206006)(54906003)(48376002)(76176011)(16586007)(186003)(53416004)(2351001)(47776003)(316002)(486006)(11346002)(476003)(2906002)(126002)(426003)(5660300002)(4326008)(6666004)(356004)(36756003)(446003)(478600001)(450100002)(14444005)(305945005)(2616005)(6916009)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3515; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20813ccf-5d7c-427f-0b73-08d76397b29a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3515:
X-Microsoft-Antispam-PRVS: <DM6PR12MB35158B021A1E0EA5FFA74258E4780@DM6PR12MB3515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fIKpVIYf4VQyjHtKck6U6lzbn4jUT98O1h6LLarSaUuLQck5lkHpJFmJcLEXya0xFgMRKvZrjnzr5e4cEwgFi6Pv6YMxi7U/3FjpwuEhDlWnjeqREsHx8EI/tFP8PTkEnq77dqab9tn93NfTyfl2Dk2sCcIRbJAOwXHSMLCwXQEVpKIyvAizQA5MCYJgrneQYCp9qPMMhxpDkXfCiSrPknQ1JHsCiUz/u5GPZFHN5GwhrCohOjyydwnrwRciaHJAS7RlqyYIinkcu152izxZB1Fh46f3Hi/llJtGFBdY9GVd6rNux9YgC9vyphbhuHdfuctY4lNW6AsylkUd8OQ0muwDk0OqxpJsfg/OD1NLOT3FxE10eO6ypGmjpe6tcSe7pBCbwTmHv6fKR4z9wsXtofHXpjuKFxsZyFyMULIx8vL4+aczAawN/APoZ2C08zfr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:28.2755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20813ccf-5d7c-427f-0b73-08d76397b29a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKFJS8LHc90hEXeh8koGFe6v1zWHzss/OKvYQRYh5wg=;
 b=eGJo39Un4gSFKciwy7Uyb0ugu5J8ketBauR1GpkHeIP/hsqTVASB7G608IDJVAi+/gnYzo0Wx6EjHn2qFBni79ymbNKudsvEctq7TMIxDMyQNLKqG97gF7S+fjHDpuxGxd3yp2ciNhehAobZXwWPtPguY7UclvhhgnSf1sdPdKE=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKUmV3b3JrIHRoZSBk
bV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxlIHRoZSBNU1QgY2Fz
ZS4KClVzZSB0aGUgY2FjaGVkIGRzY19hdXggZmllbGQuCgpSZXZpZXdlZC1ieTogV2VuamluZyBM
aXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgfCAxOSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCBl
M2NkYTY5ODRkMjguLmEwMGNkMWRhZmFmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzcsNiAr
MzcsNyBAQAogI2luY2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5jbHVk
ZSAiYW1kZ3B1X2RtX2lycS5oIgorI2luY2x1ZGUgImFtZGdwdV9kbV9tc3RfdHlwZXMuaCIKIAog
I2luY2x1ZGUgImRtX2hlbHBlcnMuaCIKIApAQCAtNTE5LDggKzUyMCwyNCBAQCBib29sIGRtX2hl
bHBlcnNfZHBfd3JpdGVfZHNjX2VuYWJsZSgKICkKIHsKIAl1aW50OF90IGVuYWJsZV9kc2MgPSBl
bmFibGUgPyAxIDogMDsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsK
KworCWlmICghc3RyZWFtKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoc3RyZWFtLT5zaWduYWwg
PT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUX01TVCkgeworCQlhY29ubmVjdG9yID0gKHN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKKworCQlp
ZiAoIWFjb25uZWN0b3ItPmRzY19hdXgpCisJCQlyZXR1cm4gZmFsc2U7CisKKwkJcmV0dXJuIChk
cm1fZHBfZHBjZF93cml0ZShhY29ubmVjdG9yLT5kc2NfYXV4LCBEUF9EU0NfRU5BQkxFLCAmZW5h
YmxlX2RzYywgMSkgPj0gMCk7CisJfQorCisJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9U
WVBFX0RJU1BMQVlfUE9SVCkKKwkJcmV0dXJuIGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgs
IHN0cmVhbS0+bGluaywgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOwogCi0JcmV0dXJu
IGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgsIHN0cmVhbS0+c2luay0+bGluaywgRFBfRFND
X0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOworCXJldHVybiBmYWxzZTsKIH0KIAogYm9vbCBkbV9o
ZWxwZXJzX2lzX2RwX3NpbmtfcHJlc2VudChzdHJ1Y3QgZGNfbGluayAqbGluaykKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
