Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A731A940
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 02:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D8D6F3E2;
	Sat, 13 Feb 2021 01:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A19E6F3D8;
 Sat, 13 Feb 2021 01:08:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzPg+NaL8Bv5mXIZrDyYKaxpgrFZC2dN5Nzwu56DJ2xQcyQM4q3dapUt/cwVKb9MpRwkTm/4yQFZxzLimZEvVdYtN92B3nHucWC0Um6ia9iYtJDroE2W/+IPQgyaCeOK3srM87a9uciGawM9RBSUfOwYKebuYCLuTJiAPsjTt5dNFNMTx5S6PlqIdCLgjrfmUqa2hgsRi6pyLstI5TPKGf48EshjWbNI1IvN4r+s4JNaKOp6jD/u7D30YWbOM5SGHmH0A+oSW2t1yhEC2UWv8igUrQX+22WFr2ZvV4cPATK49RsPsEngqqd3ol5tYogAGUJNe1Y6jZ7fKmyAZzQugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4k4Sep0rG3+wmMRLqnKzlRFC0GiucToCiNrIB639l8=;
 b=RKPxAg7ihjFK+cVYKLf4AzyA9T4eM1l473yt1NkF6dtH/QX+VKEppw0qSi0dFtDEFtDTrSxLOsGi03iUzdov6Xcfg1oQur031vY7OTNZGKBP+FKKrg351lRscKlBq/QcGnfGdPIOob3USvoN8LCjWygTM2ptZ03ZK8M1Jql7osdlbv6kdV5hS5Gk/Ro62NEL30SMtIYWyNg55GgAdkCXbVCcgoHBFjQ1LxB0E4wp0DfYoDWwGQGLL0yIiAccQh4vUmtTg5xX2rxf5llCzCfRuWXFabpob4zrMlDyM72PfrvWxUzzbU0kFVQye/oc5RaCm540J1PI/zLTREV9StmimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4k4Sep0rG3+wmMRLqnKzlRFC0GiucToCiNrIB639l8=;
 b=fD1Jemaw0jgEiG+HP+/6HgmvkHJZuFyi+zgzwg173tVv1CnToILtnFmHyuetsX1H3BPaYyDyQOAFBBcPRr5lPr05mx536cYb95vpiSgU672P/qAhqXJNB1YRUf4dqqRcqOzflzfVdooFNOaYG6OE4FokX/f3LNTbO7wAptpa9DM=
Received: from DM5PR13CA0016.namprd13.prod.outlook.com (2603:10b6:3:23::26) by
 BN7PR12MB2691.namprd12.prod.outlook.com (2603:10b6:408:26::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25; Sat, 13 Feb 2021 01:08:40 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:23:cafe::75) by DM5PR13CA0016.outlook.office365.com
 (2603:10b6:3:23::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend
 Transport; Sat, 13 Feb 2021 01:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Sat, 13 Feb 2021 01:08:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 12 Feb
 2021 19:08:37 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 12 Feb
 2021 19:08:37 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Feb 2021 19:08:36 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 1/3] drm/amd/display: Add module parameter for freesync
 video mode
Date: Fri, 12 Feb 2021 20:08:25 -0500
Message-ID: <20210213010827.261272-2-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210213010827.261272-1-aurabindo.pillai@amd.com>
References: <20210213010827.261272-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e87c4b23-2cb0-4715-b978-08d8cfbbe54c
X-MS-TrafficTypeDiagnostic: BN7PR12MB2691:
X-Microsoft-Antispam-PRVS: <BN7PR12MB26915FDEA452AF780B2D90108B8A9@BN7PR12MB2691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79df3jQRX5BjWGlv15uRhX449Prn/WDAiQUrbStlptx84mQLLZwVEZsPmD+beDlEG//tuH2ELSROZDrlyVKzN1mCcQ2OTvCTk5AY9ikuJmasrbgSaQsBRqPViF5n8VeswgQ18C2hSoXU1za8/HZtv46BtRufPtpdlLIcV7XdeVnmHeXFYRb0OzVJkbVV2a/Xa+GEkC0gDDXYLhDWo/JB9Yn6EjD5tq/PoqkDnUwiwmUljABa3DA01uHEe5C7spmO7QTGJ6Ozr1O8YauJYyK/9LH5E6MIAVtm1BBaz+G1fg1G0oO1dw7jyfOfFbfAY71GLTlM2f9HQSebfLX0FuNL2r+dISuqCAEdejrAmTSyrwppxuIjcg3H6cjNyGwqsNPbEBNU15j1+n9rS+8j5bM4fSJ04XmNsAGhYtXnxnIzz8AxNtGOu1xLQKjBfSCnE5MEprUK+JDMdX+2/Z/JZRLpDhHQlAIq2DHhBG8Q2zrgJIQityaWcq6EmsIATSDCaJnE5vrAXEmzE/LvTB46jtbjmJ4jwNvx3WrDvmGqJJTBl8CdCatjRnfP86MKCRzkaZ/Rt2+nLcppNQ7UUyxaW1h4L2Qo930ae2DFtH+t0Vttt7jhEs5hMWRM3DHAy4C3fxnnGuAGgmLi+VPK8b5EKd+hxBYBZiaceOmM3aewzhuSJ55s1WQch4o2uRaaJk26+vlg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(36840700001)(46966006)(1076003)(426003)(82310400003)(81166007)(86362001)(26005)(356005)(66574015)(2906002)(478600001)(36756003)(36860700001)(54906003)(186003)(44832011)(83380400001)(4326008)(450100002)(82740400003)(316002)(5660300002)(6666004)(70206006)(8676002)(47076005)(7696005)(8936002)(2616005)(110136005)(336012)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2021 01:08:38.4730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87c4b23-2cb0-4715-b978-08d8cfbbe54c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2691
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, aurabindo.pillai@amd.com,
 wayne.lin@amd.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KVGhpcyBvcHRpb24gc2hhbGwgYmUgb3B0LWluIGJ5IGRlZmF1bHQgc2luY2UgaXQgaXMg
YSB0ZW1wb3Jhcnkgc29sdXRpb24KdW50aWwgbG9uZyB0ZXJtIHNvbHV0aW9uIGlzIGFncmVlZCB1
cG9uIHdoaWNoIG1heSByZXF1aXJlIHVzZXJzcGFjZSBpbnRlcmZhY2UKY2hhbmdlcy4gVGhpcyBm
ZWF0dXJlIGdpdmUgdGhlIHVzZXIgYSBzZWFtbGVzcyBleHBlcmllbmNlIHdoZW4gZnJlZXN5bmMg
YXdhcmUKcHJvZ3JhbXMgKG1lZGlhIHBsYXllcnMgZm9yIGluc3RhbmNlKSBzd2l0Y2hlcyB0byBh
IGNvbXBhdGlibGUgZnJlZXN5bmMgbW9kZQp3aGVuIHBsYXlpbmcgdmlkZW9zLiBFbmFibGluZyB0
aGlzIGZlYXR1cmUgYWxzbyBoYXZlIHRoZSBwb3RlbnRpYWwgc2lkZSBlZmZlY3QKb2YgY2F1c2lu
ZyBoaWdoZXIgcG93ZXIgY29uc3VtcHRpb24gZHVlIHRvIHJ1bm5pbmcgYSBtb2RlIHdpdGggbG93
ZXIgcmVzb2x1dGlvbgphbmQgYmFzZSBjbG9jayBmcmVxdWVuY3kgd2l0aCB0aGUgaGlnaGVzdCBi
YXNlIGNsb2NrIHN1cHBvcnRlZCBvbiB0aGUgbW9uaXRvciBhcwpwZXIgaXRzIGFkdmVydGlzZWQg
bW9kZXMuIFRoZXJlIGhhcyBiZWVuIHByZWNlZGVudCBvZiBtYW51ZmFjdHVyaW5nIG1vZGVzIGlu
IHRoZQprZXJuZWwuIEluIEFNREdQVSwgdGhlIGV4aXN0aW5nIHVzYWdlIGFyZSBmb3IgY29tbW9u
IG1vZGVzIGFuZCBzY2FsaW5nIG1vZGVzLgpPdGhlciBkcml2ZXIgaGF2ZSBhIHNpbWlsYXIgYXBw
cm9hY2ggYXMgd2VsbC4KCltIb3ddCkFkZHMgYSBtb2R1bGUgcGFyYW1ldGVyIHRvIGVuYWJsZSBm
cmVlc3luYyB2aWRlbyBtb2RlIG1vZGVzZXQKb3B0aW1pemF0aW9uLiBFbmFibGluZyB0aGlzIG1v
ZGUgYWxsb3dzIHRoZSBkcml2ZXIgdG8gc2tpcCBhIGZ1bGwgbW9kZXNldCB3aGVuIGEKZnJlZXN5
bmMgY29tcGF0aWJsZSBtb2RlIGlzIHJlcXVlc3RlZCBieSB0aGUgdXNlcnNwYWNlLiBUaGlzIHBh
cmFtZXRlciB3aWxsIGFsc28KYWRkIHNvbWUgYWRkaXRpb25hbCBtb2RlcyB0aGF0IGFyZSB3aXRo
aW4gdGhlIGNvbm5lY3RlZCBtb25pdG9yJ3MgVlJSIHJhbmdlCmNvcnJlc3BvbmRpbmcgdG8gY29t
bW9uIHZpZGVvIG1vZGVzLCB3aGljaCBtZWRpYSBwbGF5ZXJzIGNhbiB1c2UgZm9yIGEgc2VhbWxl
c3MKZXhwZXJpZW5jZSB3aGlsZSBtYWtpbmcgdXNlIG9mIGZyZWVzeW5jLgoKU2lnbmVkLW9mZi1i
eTogQXVyYWJpbmRvIFBpbGxhaSA8YXVyYWJpbmRvLnBpbGxhaUBhbWQuY29tPgpBY2tlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZyBhdCBhbWQuY29tPgpSZXZpZXdlZC1i
eTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAxMiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXgg
ZTNkNGQyZGNiM2EwLi5lMjQyYjc2MDdkY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oCkBAIC0xNzksNiArMTc5LDcgQEAgZXh0ZXJuIGludCBhbWRncHVfZ3B1X3JlY292ZXJ5Owog
ZXh0ZXJuIGludCBhbWRncHVfZW11X21vZGU7CiBleHRlcm4gdWludCBhbWRncHVfc211X21lbW9y
eV9wb29sX3NpemU7CiBleHRlcm4gdWludCBhbWRncHVfZGNfZmVhdHVyZV9tYXNrOworZXh0ZXJu
IHVpbnQgYW1kZ3B1X2ZyZWVzeW5jX3ZpZF9tb2RlOwogZXh0ZXJuIHVpbnQgYW1kZ3B1X2RjX2Rl
YnVnX21hc2s7CiBleHRlcm4gdWludCBhbWRncHVfZG1fYWJtX2xldmVsOwogZXh0ZXJuIHN0cnVj
dCBhbWRncHVfbWdwdV9pbmZvIG1ncHVfaW5mbzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYwppbmRleCBiN2VlNTg3NDg0YjIuLmFlZmJlMTRjMzBmYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTYyLDYgKzE2Miw3IEBAIGludCBhbWRn
cHVfbWVzOwogaW50IGFtZGdwdV9ub3JldHJ5ID0gLTE7CiBpbnQgYW1kZ3B1X2ZvcmNlX2FzaWNf
dHlwZSA9IC0xOwogaW50IGFtZGdwdV90bXo7Cit1aW50IGFtZGdwdV9mcmVlc3luY192aWRfbW9k
ZTsKIGludCBhbWRncHVfcmVzZXRfbWV0aG9kID0gLTE7IC8qIGF1dG8gKi8KIGludCBhbWRncHVf
bnVtX2tjcSA9IC0xOwogCkBAIC03OTAsNiArNzkxLDE3IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChh
Ym1sZXZlbCwgYW1kZ3B1X2RtX2FibV9sZXZlbCwgdWludCwgMDQ0NCk7CiBNT0RVTEVfUEFSTV9E
RVNDKHRteiwgIkVuYWJsZSBUTVogZmVhdHVyZSAoLTEgPSBhdXRvLCAwID0gb2ZmIChkZWZhdWx0
KSwgMSA9IG9uKSIpOwogbW9kdWxlX3BhcmFtX25hbWVkKHRteiwgYW1kZ3B1X3RteiwgaW50LCAw
NDQ0KTsKIAorLyoqCisgKiBET0M6IGZyZWVzeW5jX3ZpZGVvICh1aW50KQorICogRW5hYmxlZCB0
aGUgb3B0aW1pemF0aW9uIHRvIGFkanVzdCBmcm9udCBwb3JjaCB0aW1pbmcgdG8gYWNoaWV2ZSBz
ZWFtbGVzcyBtb2RlIGNoYW5nZSBleHBlcmllbmNlCisgKiB3aGVuIHNldHRpbmcgYSBmcmVlc3lu
YyBzdXBwb3J0ZWQgbW9kZSBmb3Igd2hpY2ggZnVsbCBtb2Rlc2V0IGlzIG5vdCBuZWVkZWQuCisg
KiBUaGUgZGVmYXVsdCB2YWx1ZTogMCAob2ZmKS4KKyAqLworTU9EVUxFX1BBUk1fREVTQygKKwlm
cmVlc3luY192aWRlbywKKwkiRW5hYmxlIGZyZWVzeW5jIG1vZGVzZXR0aW5nIG9wdGltaXphdGlv
biBmZWF0dXJlICgwID0gb2ZmIChkZWZhdWx0KSwgMSA9IG9uKSIpOworbW9kdWxlX3BhcmFtX25h
bWVkKGZyZWVzeW5jX3ZpZGVvLCBhbWRncHVfZnJlZXN5bmNfdmlkX21vZGUsIHVpbnQsIDA0NDQp
OworCiAvKioKICAqIERPQzogcmVzZXRfbWV0aG9kIChpbnQpCiAgKiBHUFUgcmVzZXQgbWV0aG9k
ICgtMSA9IGF1dG8gKGRlZmF1bHQpLCAwID0gbGVnYWN5LCAxID0gbW9kZTAsIDIgPSBtb2RlMSwg
MyA9IG1vZGUyLCA0ID0gYmFjbywgNSA9IHBjaSkKLS0gCjIuMzAuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
