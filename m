Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945D96929
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F006E86C;
	Tue, 20 Aug 2019 19:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730066.outbound.protection.outlook.com [40.107.73.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623D66E866;
 Tue, 20 Aug 2019 19:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvviOYw3LHouMQv6rQ/Mmy8HRl4fw5O3LQf8Sti0cO912jILdxy3B5w/0/gOsqcCBQzNd3BuapnT8ZpyxloVJcW6bHc5n6g4R1/KpUuzHS7er4edlW4dRoksvnIh464dFeJsQEagb5UYdKsT5UmReBWBEa2ADILtZ1Ruf9UNE8j8oD4I4r5woVkl+Kj+Ej5TkRBWtqu+lAXDo8GnLzUGCHONvo8lE+qHeNos+tCvEuwBSTLrWtDwPgOOYtB3Xutx+X1KQkpCCJU8AMcuT4zXQ+nE+ZH6LmE5JY+U3g5Z3+w0iDrX772VIIgGJ1BmRl5b/97FzI63LwaRJX8aq9O9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWxSdJDCh0chskGh5wL8fWwLYc0o9AVKu+WfRH16CCo=;
 b=mviivZ+uw0lWzdkFWnpOsWpKMb9IjJ/QuZiJa7kibtJqPI4T2DPgBaYdYaS71/kOXWkh81zLbiTTlCFsmpQTxbjF2ORGuXMpqXpjsvG0aE60+iU0gQaDq1jjwOTsW0QSm2EOham5gqEfEizBdA1nGecp9ZSUg9BgWotcpt/C5jFAMhmdAcwjJSRWGEp0hi6fm4BjrB+7mRO5/ajdkEIxNDE4mgv2IL86MEoFx5lcZww16nlXr9rdv2SYRcMhIvuSQRjY51pq1Wr5ME01LsxtfQ6Bht5rIaIAmVZ+L5SX920UEafq0yLGRryqrWhToBIU7JMtgNfitY+ENRW5A1qfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by CY4PR12MB1271.namprd12.prod.outlook.com
 (2603:10b6:903:3d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 19:12:25 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:24 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:21 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 06/14] drm/dp-mst: Use dc and drm helpers to compute
 timeslots
Date: Tue, 20 Aug 2019 15:11:55 -0400
Message-ID: <20190820191203.25807-7-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(189003)(199004)(81166006)(81156014)(5660300002)(478600001)(8676002)(8936002)(70586007)(50226002)(70206006)(86362001)(50466002)(305945005)(48376002)(51416003)(49486002)(76176011)(476003)(126002)(450100002)(14444005)(53936002)(54906003)(110136005)(16586007)(446003)(426003)(11346002)(336012)(2616005)(186003)(26005)(36756003)(486006)(1076003)(316002)(6666004)(356004)(2906002)(4326008)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1271; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 031af769-cfa6-4556-a2de-08d725a255cb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1271; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1271:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12714843D2D9600DD6BC043FEFAB0@CY4PR12MB1271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4aWc5pAZ4zgmax19dZ/L5cTMHG4AUW2UVvxxbQKUmeGVIaIWi/kZG8pmS9bnU9jzYGLNyuxxTB4bNwJco/BOOr9Hb0EusuXSyLtwHDuFrIfzy6L5RKIL1xFLEuF1OomPPdDIAmJwHaMe4vtXl/POtA6VGi6RCYW7+5MZ9rInRtliS3zC12qSeQ9y2rKs6mDpP4Mjt+Gz2Rurit1lDLwDfXgkYxk+SLNNbAYOBMyo58/qfe0IOZrAq7cd6p2pQ33joJwSnHsgB0GYvCEKQLrGigHBPsVietDqXBV7RCXMeiuJ3RB1jdt7BMAURgBrzBVsTFqxhXFChL0XU1vB9rENK3azaY74sT3rslGLcQBEc4hK9exwDdAYDiX4B4xXniOlPuauiGjEZz/tdgU7WACA1n9MVfENNLbc9c6ZOC7kYQA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:24.8921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 031af769-cfa6-4556-a2de-08d725a255cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWxSdJDCh0chskGh5wL8fWwLYc0o9AVKu+WfRH16CCo=;
 b=i7i3tJFrv5jC1m5Bys9MWUJ1OGuint9cblCMA56lCbCqyvawMYFB2mBlPlLCQ9oZgP/FJDDNS7Lw+mMhJiFoS3zwu2XqhmhzJkx7+wQc5eIksuo7BppcEi/0Cx9o5OezyDBazKBtecttqqKEQiky5xAOI0EfGctxn/R/IQyA3WQ=
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
Cc: David Francis <David.Francis@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2VyZSB1c2luZyBkcm0gaGVscGVycyB0byBjb252ZXJ0IGEgdGltaW5nIGludG8gaXRzCmJh
bmR3aWR0aCwgaXRzIGJhbmR3aWR0aCBpbnRvIHBibiwgYW5kIGl0cyBwYm4gaW50byB0aW1lc2xv
dHMKClRoZXNlIGhlbHBlcnMKLURpZCBub3QgdGFrZSBEU0MgdGltaW5ncyBpbnRvIGFjY291bnQK
LVVzZWQgdGhlIGxpbmsgcmF0ZSBhbmQgbGFuZSBjb3VudCBvZiB0aGUgbGluaydzIGF1eCBkZXZp
Y2UsCiB3aGljaCBhcmUgbm90IHRoZSBzYW1lIGFzIHRoZSBsaW5rJ3MgY3VycmVudCBjYXAKLURp
ZCBub3QgdGFrZSBGRUMgaW50byBhY2NvdW50IChGRUMgcmVkdWNlcyB0aGUgUEJOIHBlciB0aW1l
c2xvdCkKCkZvciBjb252ZXJ0aW5nIHRpbWluZyBpbnRvIFBCTiwgYWRkIGEgbmV3IGZ1bmN0aW9u
CmRybV9kcF9jYWxjX3Bibl9tb2RlX2RzYyB0aGF0IGhhbmRsZXMgdGhlIERTQyBjYXNlCgpGb3Ig
Y29udmVydGluZyBQQk4gaW50byB0aW1lIHNsb3RzLCBhbWRncHUgZG9lc24ndCB1c2UgdGhlCidj
b3JyZWN0JyBhdG9taWMgbWV0aG9kIChkcm1fZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyksIHNv
CmRvbid0IGFkZCBhIG5ldyBoZWxwZXIgdG8gY292ZXIgb3VyIGFwcHJvYWNoLiBVc2UgdGhlIHNh
bWUKbWVhbnMgb2YgY2FsY3VsYXRpbmcgcGJuIHBlciB0aW1lIHNsb3QgYXMgdGhlIERTQyBjb2Rl
LgoKdjI6IEFkZCBkcm0gaGVscGVyIGZvciBjbG9jayB0byBwYm4gY29udmVyc2lvbgoKQ2M6IEpl
cnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNo
b2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgfCAxOCArKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYyAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgNTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKaW5k
ZXggNWYyYzMxNWIxOGJhLi5kZmE5OWUwZDZlNjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKQEAgLTE4
OSw4ICsxODksOCBAQCBib29sIGRtX2hlbHBlcnNfZHBfbXN0X3dyaXRlX3BheWxvYWRfYWxsb2Nh
dGlvbl90YWJsZSgKIAlpbnQgc2xvdHMgPSAwOwogCWJvb2wgcmV0OwogCWludCBjbG9jazsKLQlp
bnQgYnBwID0gMDsKIAlpbnQgcGJuID0gMDsKKwlpbnQgcGJuX3Blcl90aW1lc2xvdCwgYnBwID0g
MDsKIAogCWFjb25uZWN0b3IgPSAoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0t
PmRtX3N0cmVhbV9jb250ZXh0OwogCkBAIC0yMDgsNyArMjA4LDYgQEAgYm9vbCBkbV9oZWxwZXJz
X2RwX21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAJCWNsb2NrID0gc3RyZWFt
LT50aW1pbmcucGl4X2Nsa18xMDBoeiAvIDEwOwogCiAJCXN3aXRjaCAoc3RyZWFtLT50aW1pbmcu
ZGlzcGxheV9jb2xvcl9kZXB0aCkgewotCiAJCWNhc2UgQ09MT1JfREVQVEhfNjY2OgogCQkJYnBw
ID0gNjsKIAkJCWJyZWFrOwpAQCAtMjM0LDExICsyMzMsMTggQEAgYm9vbCBkbV9oZWxwZXJzX2Rw
X21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAKIAkJYnBwID0gYnBwICogMzsK
IAotCQkvKiBUT0RPIG5lZWQgdG8ga25vdyBsaW5rIHJhdGUgKi8KLQotCQlwYm4gPSBkcm1fZHBf
Y2FsY19wYm5fbW9kZShjbG9jaywgYnBwKTsKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0Nf
U1VQUE9SVAorCQlpZiAoc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDKQorCQkJcGJuID0gZHJtX2Rw
X2NhbGNfcGJuX21vZGVfZHNjKGNsb2NrLAorCQkJCQlzdHJlYW0tPnRpbWluZy5kc2NfY2ZnLmJp
dHNfcGVyX3BpeGVsKTsKKwkJZWxzZQorI2VuZGlmCisJCQlwYm4gPSBkcm1fZHBfY2FsY19wYm5f
bW9kZShjbG9jaywgYnBwKTsKIAotCQlzbG90cyA9IGRybV9kcF9maW5kX3ZjcGlfc2xvdHMobXN0
X21nciwgcGJuKTsKKwkJLyogQ29udmVydCBraWxvYml0cyBwZXIgc2Vjb25kIC8gNjQgKGZvciA2
NCB0aW1lc2xvdHMpIHRvIHBibiAoNTQvNjQgbWVnYWJ5dGVzIHBlciBzZWNvbmQpICovCisJCXBi
bl9wZXJfdGltZXNsb3QgPSBkY19saW5rX2JhbmR3aWR0aF9rYnBzKAorCQkJCXN0cmVhbS0+bGlu
aywgZGNfbGlua19nZXRfbGlua19jYXAoc3RyZWFtLT5saW5rKSkgLyAoOCAqIDEwMDAgKiA1NCk7
CisJCXNsb3RzID0gRElWX1JPVU5EX1VQKHBibiwgcGJuX3Blcl90aW1lc2xvdCk7CiAJCXJldCA9
IGRybV9kcF9tc3RfYWxsb2NhdGVfdmNwaShtc3RfbWdyLCBtc3RfcG9ydCwgcGJuLCBzbG90cyk7
CiAKIAkJaWYgKCFyZXQpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCAz
OThlNzMxNGVhOGIuLmQ3ODliN2FmN2RiZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jCkBAIC0zNTg4LDYgKzM1ODgsNDcgQEAgc3RhdGljIGludCB0ZXN0X2NhbGNfcGJuX21v
ZGUodm9pZCkKIAlyZXR1cm4gMDsKIH0KIAorLyoqCisgKiBkcm1fZHBfY2FsY19wYm5fbW9kZV9k
c2MoKSAtIENhbGN1bGF0ZSB0aGUgUEJOIGZvciBhIG1vZGUgd2l0aCBEU0MgZW5hYmxlZC4KKyAq
IEBjbG9jazogZG90IGNsb2NrIGZvciB0aGUgbW9kZQorICogQGRzY19icHA6IGRzYyBiaXRzIHBl
ciBwaXhlbCB4MTYgKGUuZy4gZHNjX2JwcCA9IDEzNiBpcyA4LjUgYnBwKQorICoKKyAqIFRoaXMg
dXNlcyB0aGUgZm9ybXVsYSBpbiB0aGUgc3BlYyB0byBjYWxjdWxhdGUgdGhlIFBCTiB2YWx1ZSBm
b3IgYSBtb2RlLAorICogZ2l2ZW4gdGhhdCB0aGUgbW9kZSBpcyB1c2luZyBEU0MKKyAqLworaW50
IGRybV9kcF9jYWxjX3Bibl9tb2RlX2RzYyhpbnQgY2xvY2ssIGludCBkc2NfYnBwKQoreworCXU2
NCBrYnBzOworCXM2NCBwZWFrX2ticHM7CisJdTMyIG51bWVyYXRvcjsKKwl1MzIgZGVub21pbmF0
b3I7CisKKwlrYnBzID0gY2xvY2sgKiBkc2NfYnBwOworCisJLyoKKwkgKiBtYXJnaW4gNTMwMHBw
bSArIDMwMHBwbSB+IDAuNiUgYXMgcGVyIHNwZWMsIGZhY3RvciBpcyAxLjAwNgorCSAqIFRoZSB1
bml0IG9mIDU0LzY0TWJ5dGVzL3NlYyBpcyBhbiBhcmJpdHJhcnkgdW5pdCBjaG9zZW4gYmFzZWQg
b24KKwkgKiBjb21tb24gbXVsdGlwbGllciB0byByZW5kZXIgYW4gaW50ZWdlciBQQk4gZm9yIGFs
bCBsaW5rIHJhdGUvbGFuZQorCSAqIGNvdW50cyBjb21iaW5hdGlvbnMKKwkgKiBjYWxjdWxhdGUK
KwkgKiBwZWFrX2ticHMgKj0gKDEvMTYpIGJwcHgxNiB0byBicHAKKwkgKiBwZWFrX2ticHMgKj0g
KDEwMDYvMTAwMCkKKwkgKiBwZWFrX2ticHMgKj0gKDY0LzU0KQorCSAqIHBlYWtfa2JwcyAqPSA4
ICAgIGNvbnZlcnQgdG8gYnl0ZXMKKwkgKgorCSAqIERpdmlkZSBudW1lcmF0b3IgYW5kIGRlbm9t
aW5hdG9yIGJ5IDE2IHRvIGF2b2lkIG92ZXJmbG93CisJICovCisKKwludW1lcmF0b3IgPSA2NCAq
IDEwMDYgLyAxNjsKKwlkZW5vbWluYXRvciA9IDU0ICogOCAqIDEwMDAgKiAxMDAwOworCisJa2Jw
cyAqPSBudW1lcmF0b3I7CisJcGVha19rYnBzID0gZHJtX2ZpeHBfZnJvbV9mcmFjdGlvbihrYnBz
LCBkZW5vbWluYXRvcik7CisKKwlyZXR1cm4gZHJtX2ZpeHAyaW50X2NlaWwocGVha19rYnBzKTsK
K30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjKTsKKwogLyogd2Ugd2Fu
dCB0byBraWNrIHRoZSBUWCBhZnRlciB3ZSd2ZSBhY2sgdGhlIHVwL2Rvd24gSVJRcy4gKi8KIHN0
YXRpYyB2b2lkIGRybV9kcF9tc3Rfa2lja190eChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9t
Z3IgKm1ncikKIHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgg
Yi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IDJiYTYyNTNlYTZkMy4uZGRi
NTE4ZjIxNTdhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisr
KyBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTYxMSw3ICs2MTEsNyBAQCBz
dHJ1Y3QgZWRpZCAqZHJtX2RwX21zdF9nZXRfZWRpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yLCBzdHJ1Y3QgZHJtX2RwXwogCiAKIGludCBkcm1fZHBfY2FsY19wYm5fbW9kZShpbnQg
Y2xvY2ssIGludCBicHApOwotCitpbnQgZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjKGludCBjbG9j
aywgaW50IGRzY19icHApOwogCiBib29sIGRybV9kcF9tc3RfYWxsb2NhdGVfdmNwaShzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAkJCSAgICAgIHN0cnVjdCBkcm1fZHBfbXN0
X3BvcnQgKnBvcnQsIGludCBwYm4sIGludCBzbG90cyk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
