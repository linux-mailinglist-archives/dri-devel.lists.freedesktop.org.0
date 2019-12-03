Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716F11005D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5323A6E7D2;
	Tue,  3 Dec 2019 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E0A6E7A0;
 Tue,  3 Dec 2019 14:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVR9i5vSfWZaaVoNs4kyTLz9tbn3YNC+kOqqBEMXz4r603D0Hh8lnTPv3PxyNHFF9sfUrpQPNAoDAMjVP+2nVpP+xeS74i0ZnLnnuSqjttcvolit2uHfdae/zVWHtosHy6oFE8bNGRseorkqhRh4S6ZtUU/9lLd06bgfkB3ugkNBVZxZ1JI84xXBGYiQHXen+B8igfCSRP7CCFa7zjHRv8MWi+k9FF5OmF2z7fkj5/uGdfby3UhifRJAIDpKiB5Lq4elOnjPMgzKYNirrv+2ru1Dkd1L5m1H5AeDLnO6QTEl4Ly0AmQ8wN0uI90/qOhrQjEJv3sfsJdUxz31SbdQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTodLTZAP+8jfwQY0weyYwS8j96zYlC2FWxnAFndJHg=;
 b=DwO0sQyjbN5sx0iMvIDZRf/m44LrGdLPWKmPK9uYBZTEfQD1IDDp/26ycoLFv0Vt8rni5+iRWLIA8Igt20Xwc5R+HVkiBTBEEZ1wVMx71rIhdRa9puc2g0EfqSLOWa+PXZW1nAZBkqYLubFH9WwaFN/i4Fv2MkJk1P3JsSsFmQwgbG0tkdOGmo5rkjp4ANwJs0FTO0RL+BiOknAjRSXnS4UIiH9SkoQivfn2wGWl52WmdrsXmZgYIpInQBdiZJD7cyjoe8yLmmSNEB5WBqhJmnTYwXOnBf80m/HDknm/xiCgj6HOu1xf8hNK44FfsHc/u/fuNhwa+hhQVYpnuu+gHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by BL0PR12MB2466.namprd12.prod.outlook.com (2603:10b6:207:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Tue, 3 Dec
 2019 14:35:47 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::202) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:47 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:44 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:44 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 09/17] drm/amd/display: Write DSC enable to MST DPCD
Date: Tue, 3 Dec 2019 09:35:22 -0500
Message-ID: <20191203143530.27262-10-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(428003)(189003)(199004)(86362001)(26005)(6916009)(36756003)(450100002)(6666004)(70206006)(305945005)(11346002)(1076003)(14444005)(50466002)(478600001)(70586007)(356004)(48376002)(76176011)(4326008)(51416003)(316002)(446003)(7696005)(2616005)(2906002)(16586007)(186003)(5660300002)(50226002)(8936002)(8676002)(81166006)(81156014)(2876002)(54906003)(53416004)(336012)(2351001)(426003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2466; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67bd2ebc-f88a-48a3-2a41-08d777fe1619
X-MS-TrafficTypeDiagnostic: BL0PR12MB2466:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24664978B5B47FCAE781DFB6E4420@BL0PR12MB2466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMiABIwxVqjAB+zySdfR2vqM0NryrrRzbUuLaq5srxhlbu6jqi2hZo4k45UHcwtKwZRfq3W0ImzJLreUSXFXwqJ0HU8U268SNi0/Kni2GNid3iVbVGPPIfTRDpT3oVZKPDNvKMQ/XsnXtZdZb0x+HpQMVlkxSbYFqtjEf4T7yXAyADzxf0tFqXPZGmHJ2uQtF13w2ieqsjIBqqrlPWLgCrK0Vp4Fmvh+PNOR8Dm4NHUOKBCzOTyJPMFaJojnxIlCnudiFu+WBZLS3NYI8jcTE3sP8jJHGCDi9S2I8FVDM4/1V953w9i0eIEVc43y//XIKAOzFxB9JLOm1+kNtMGD/m6dxIxlK1aNe2aokPp2OVoHT+t9sXR6D0MBFjGABu76ljK06LC53z4goeWUylB763yXXQuNeYrzZ1FvfW2qat5/I+FgneWjlnF+5L83PcBp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:47.1530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bd2ebc-f88a-48a3-2a41-08d777fe1619
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTodLTZAP+8jfwQY0weyYwS8j96zYlC2FWxnAFndJHg=;
 b=vK8GmBQAthbNFpAd4sVVOZApgGXfD9YNcqgO0vzJZ/V6OBeMCX5OvRqQWvZ1m8YUcg8swpprCN76wgRnfSAEvH3ag+A/o8CUR8E5KvzvWfLqbS5FMviTUJR8ZkL59ci8fEbFSl+FtrUkpR2EzvA6l5yfQ+Rt1o7VcLaXf5I/nB0=
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKUmV3b3JrIHRoZSBk
bV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxlIHRoZSBNU1QgY2Fz
ZS4KClVzZSB0aGUgY2FjaGVkIGRzY19hdXggZmllbGQuCgpSZXZpZXdlZC1ieTogV2VuamluZyBM
aXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRh
LmxpcHNraUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYyB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCmluZGV4IDY2ZjI2
NmE1ZTEwYi4uMDY5YjdhNmY1NTk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCkBAIC0zNyw2ICszNyw3
IEBACiAjaW5jbHVkZSAiZGMuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKICNpbmNsdWRlICJh
bWRncHVfZG1faXJxLmgiCisjaW5jbHVkZSAiYW1kZ3B1X2RtX21zdF90eXBlcy5oIgogCiAjaW5j
bHVkZSAiZG1faGVscGVycy5oIgogCkBAIC01MTYsOCArNTE3LDI0IEBAIGJvb2wgZG1faGVscGVy
c19kcF93cml0ZV9kc2NfZW5hYmxlKAogKQogewogCXVpbnQ4X3QgZW5hYmxlX2RzYyA9IGVuYWJs
ZSA/IDEgOiAwOworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yOworCisJ
aWYgKCFzdHJlYW0pCisJCXJldHVybiBmYWxzZTsKKworCWlmIChzdHJlYW0tPnNpZ25hbCA9PSBT
SUdOQUxfVFlQRV9ESVNQTEFZX1BPUlRfTVNUKSB7CisJCWFjb25uZWN0b3IgPSAoc3RydWN0IGFt
ZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0tPmRtX3N0cmVhbV9jb250ZXh0OworCisJCWlmICgh
YWNvbm5lY3Rvci0+ZHNjX2F1eCkKKwkJCXJldHVybiBmYWxzZTsKKworCQlyZXR1cm4gKGRybV9k
cF9kcGNkX3dyaXRlKGFjb25uZWN0b3ItPmRzY19hdXgsIERQX0RTQ19FTkFCTEUsICZlbmFibGVf
ZHNjLCAxKSA+PSAwKTsKKwl9CisKKwlpZiAoc3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZUEVf
RElTUExBWV9QT1JUKQorCQlyZXR1cm4gZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwgc3Ry
ZWFtLT5saW5rLCBEUF9EU0NfRU5BQkxFLCAmZW5hYmxlX2RzYywgMSk7CiAKLQlyZXR1cm4gZG1f
aGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwgc3RyZWFtLT5zaW5rLT5saW5rLCBEUF9EU0NfRU5B
QkxFLCAmZW5hYmxlX2RzYywgMSk7CisJcmV0dXJuIGZhbHNlOwogfQogCiBib29sIGRtX2hlbHBl
cnNfaXNfZHBfc2lua19wcmVzZW50KHN0cnVjdCBkY19saW5rICpsaW5rKQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
