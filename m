Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528711005E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C722E6E7DD;
	Tue,  3 Dec 2019 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740041.outbound.protection.outlook.com [40.107.74.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1556E7A2;
 Tue,  3 Dec 2019 14:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be0AE+OpCijkl6GTn//ZTiw2DQ3tQa7DfBXUSXhCHy4kRxjf6PR9RB5jyfxsR8uciNenJmHAF6fu/bvecuJuMkxwFO6bSfnrm95Er10Siu2ducSdaCWNLG+rkXvN5JSf8xVQJ1hnCSfRT1bvDZriKYSYao8lIsvUEhyG/u8CUgK7uM6d0rOBzP0UwVOtxhe4g7bN5K3HkRyNVV/8Ahq6U4sPfXryyFc5lQzplmOOk4WBmQg7wOGFdADhjCzWn7KFq852civNZwaMqzGtUIwvjCnJay53gwcRp/6fMfsVCaoYJ/uqL0Tq+wWDimP8+pTAlnY+ATqkFtpPBoZdtTF7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNQXdpFoxmV9VP2lzwPvBu5kKQX/8AIogTx2kbKxPro=;
 b=QU81L8/dXSg8QxkTZpQE3rhZVlN1RB3k7hAPTCymFRvhmyceS9HZJGIAq+1i7uzar2MgM/NUPrJtHys8i5BoYWFPl/OFe+miv44wSuOy+eeMGambWq6sdSYOuR/HHjWpvWui+KQY8nd0hgAmG6vAQO86N49eWmctZ5sRJJqrDSaxqEdU9Y6v3K1dCD3aY6oMkIN3XYhgQWVbESogh+fU6Hz/nWfaHR9vN7xFavUpkHtOERKQhLrbC5grOIfE5q1j3NBhEjPJA8aqZCMlkbkkocEGyZBa1sIj1oToo/volVKH4YXXIuNV5Djb7thx396EkFc50gVm+o6hkR/ZaT6L/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by DM6PR12MB3691.namprd12.prod.outlook.com (2603:10b6:5:1c5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17; Tue, 3 Dec
 2019 14:35:50 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:50 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:47 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:47 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 15/17] drm/amd/display: Recalculate VCPI slots for new DSC
 connectors
Date: Tue, 3 Dec 2019 09:35:28 -0500
Message-ID: <20191203143530.27262-16-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(428003)(189003)(199004)(5660300002)(1076003)(16586007)(316002)(2351001)(50466002)(70206006)(70586007)(86362001)(14444005)(478600001)(36756003)(54906003)(48376002)(53416004)(336012)(305945005)(356004)(186003)(26005)(6666004)(2906002)(8676002)(81166006)(6916009)(81156014)(426003)(8936002)(11346002)(2616005)(446003)(51416003)(2876002)(76176011)(4326008)(7696005)(50226002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3691; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d310c71-b7ba-4255-97c8-08d777fe1848
X-MS-TrafficTypeDiagnostic: DM6PR12MB3691:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3691AEAEFB081C95D533EFD0E4420@DM6PR12MB3691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mN5xsPSAAa98wESi3Q/j41gyHgASbEk/SVB7TH+hKBZWjES54jqeROPpGIWV69z7VcV7a3P4SHN0cwHDdXVbF9dRpvkn6+rl1B1+458OczeQPacvFlIeWcFc32rTHh6mV3xQPgX23FTKZysLrkKgAl1aeQAO7uNOGAVE/rt9Ue8WCZ6UKB1A7z6Qb0/u+e9mpTPfxYYQMQmitHrR9YK4yfBi0CYO1JyxRC1sWzFThK0lIrHq37Qh/y3d1zbe43aMO0m6XDG5rjRs+g3QeCns2GMbaBKJH7O2maU2AgN9NgW1ivxXbxtCTxXXP86VTEc4vcEV64MpPvkRqs6/7MO5izhfR9L9rG/phxuOKYbfSLKm/Osihkrnnqd/hlSkCvxt65bn69A9GfETUK6kcHNCqBSh1fCvGu/l5D6y3m9PmTPF5H4I0QvOqCOh/+UjcDlS7cWHBGCdbsAOuC8Dr6v6VXRutPOkouW00Vss51jD4ijcF58gLW26mOo3SfPehMDS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:50.8153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d310c71-b7ba-4255-97c8-08d777fe1848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNQXdpFoxmV9VP2lzwPvBu5kKQX/8AIogTx2kbKxPro=;
 b=jWbk5cQnEp0O9B7rakQGphmQtDE4QZYKAYmPHc8eaduwGDN6Mv+R+2hhr2QWnTV2cIxUBDPNfFKxP2UAcKmH1pMTf4NAxYRAaY021swbFMclk3RkoWwncX45pMtjZriiuPOvXuoJjPogzBDlz7MDPATBtgGqnM1GFIeKbcynKSA=
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
Cc: dri-devel@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>,
 Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KU2luY2Ug
Zm9yIERTQyBNU1QgY29ubmVjdG9yJ3MgUEJOIGlzIGNsYWN1bGF0ZWQgZGlmZmVyZW50bHkKZHVl
IHRvIGNvbXByZXNzaW9uLCB3ZSBoYXZlIHRvIHJlY2FsY3VsYXRlIGJvdGggUEJOIGFuZApWQ1BJ
IHNsb3RzIGZvciB0aGF0IGNvbm5lY3Rvci4KCltob3ddClRoZSBmdW5jdGlvbiBpdGVyYXRlcyB0
aHJvdWdoIGFsbCB0aGUgYWN0aXZlIHN0cmVhbXMgdG8KZmluZCwgd2hpY2ggaGF2ZSBEU0MgZW5h
YmxlZCwgdGhlbiByZWNhbGN1bGF0ZXMgUEJOIGZvcgppdCBhbmQgY2FsbHMgZHJtX2RwX2hlbHBl
cl91cGRhdGVfdmNwaV9zbG90c19mb3JfZHNjIHRvCnVwZGF0ZSBjb25uZWN0b3IncyBWQ1BJIHNs
b3RzLgoKdjI6IC0gdXNlIGRybV9kcF9tc3RfYXRvbWljX2VuYWJsZV9kc2MgcGVyIHBvcnQgdG8K
ZW5hYmxlL2Rpc2FibGUgRFNDCgp2MzogLSBJdGVyYXRlIHRocm91Z2ggY29ubmVjdG9yIHN0YXRl
cyBmcm9tIHRoZSBzdGF0ZSBwYXNzZWQKICAgIC0gT24gZWFjaCBjb25uZWN0b3Igc3RhdGUgZ2V0
IHN0cmVhbSBmcm9tIGRjX3N0YXRlLAppbnN0ZWFkIENSVEMgc3RhdGUKCkNjOiBKZXJyeSBadW8g
PEplcnJ5Llp1b0BhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogTWFuYXNpIE5hdmFy
ZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNr
aSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyB8IDc2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA3MSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDkzYTIzMGQ5NTZl
ZS4uMmFjM2EyZjBiNDUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQ5ODYsNiArNDk4Niw2OSBAQCBjb25zdCBzdHJ1Y3Qg
ZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGFtZGdwdV9kbV9lbmNvZGVyX2hlbHBlcl9mdW5jcyA9
IHsKIAkuYXRvbWljX2NoZWNrID0gZG1fZW5jb2Rlcl9oZWxwZXJfYXRvbWljX2NoZWNrCiB9Owog
CitzdGF0aWMgaW50IGRtX3VwZGF0ZV9tc3RfdmNwaV9zbG90c19mb3JfZHNjKHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZSwKKwkJCQkJICAgIHN0cnVjdCBkY19zdGF0ZSAqZGNfc3RhdGUp
Cit7CisJc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtID0gTlVMTDsKKwlzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpuZXdf
Y29uX3N0YXRlLCAqb2xkX2Nvbl9zdGF0ZTsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAq
YWNvbm5lY3RvcjsKKwlzdHJ1Y3QgZG1fY29ubmVjdG9yX3N0YXRlICpkbV9jb25uX3N0YXRlOwor
CWludCBpLCBqLCBjbG9jaywgYnBwOworCWludCB2Y3BpLCBwYm5fZGl2LCBwYm4gPSAwOworCisJ
Zm9yX2VhY2hfb2xkbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yLCBvbGRf
Y29uX3N0YXRlLCBuZXdfY29uX3N0YXRlLCBpKSB7CisKKwkJYWNvbm5lY3RvciA9IHRvX2FtZGdw
dV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKKworCQlpZiAoIWFjb25uZWN0b3ItPnBvcnQpCisJ
CQljb250aW51ZTsKKworCQlpZiAoIW5ld19jb25fc3RhdGUgfHwgIW5ld19jb25fc3RhdGUtPmNy
dGMpCisJCQljb250aW51ZTsKKworCQlkbV9jb25uX3N0YXRlID0gdG9fZG1fY29ubmVjdG9yX3N0
YXRlKG5ld19jb25fc3RhdGUpOworCisJCWZvciAoaiA9IDA7IGogPCBkY19zdGF0ZS0+c3RyZWFt
X2NvdW50OyBqKyspIHsKKwkJCXN0cmVhbSA9IGRjX3N0YXRlLT5zdHJlYW1zW2pdOworCQkJaWYg
KCFzdHJlYW0pCisJCQkJY29udGludWU7CisKKwkJCWlmICgoc3RydWN0IGFtZGdwdV9kbV9jb25u
ZWN0b3IqKXN0cmVhbS0+ZG1fc3RyZWFtX2NvbnRleHQgPT0gYWNvbm5lY3RvcikKKwkJCQlicmVh
azsKKworCQkJc3RyZWFtID0gTlVMTDsKKwkJfQorCisJCWlmICghc3RyZWFtKQorCQkJY29udGlu
dWU7CisKKwkJaWYgKHN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQyAhPSAxKSB7CisJCQlkcm1fZHBf
bXN0X2F0b21pY19lbmFibGVfZHNjKHN0YXRlLAorCQkJCQkJICAgICBhY29ubmVjdG9yLT5wb3J0
LAorCQkJCQkJICAgICBkbV9jb25uX3N0YXRlLT5wYm4sCisJCQkJCQkgICAgIDAsCisJCQkJCQkg
ICAgIGZhbHNlKTsKKwkJCWNvbnRpbnVlOworCQl9CisKKwkJcGJuX2RpdiA9IGRtX21zdF9nZXRf
cGJuX2RpdmlkZXIoc3RyZWFtLT5saW5rKTsKKwkJYnBwID0gc3RyZWFtLT50aW1pbmcuZHNjX2Nm
Zy5iaXRzX3Blcl9waXhlbDsKKwkJY2xvY2sgPSBzdHJlYW0tPnRpbWluZy5waXhfY2xrXzEwMGh6
IC8gMTA7CisJCXBibiA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKGNsb2NrLCBicHAsIHRydWUpOwor
CQl2Y3BpID0gZHJtX2RwX21zdF9hdG9taWNfZW5hYmxlX2RzYyhzdGF0ZSwKKwkJCQkJCSAgICBh
Y29ubmVjdG9yLT5wb3J0LAorCQkJCQkJICAgIHBibiwgcGJuX2RpdiwKKwkJCQkJCSAgICB0cnVl
KTsKKwkJaWYgKHZjcGkgPCAwKQorCQkJcmV0dXJuIHZjcGk7CisKKwkJZG1fY29ubl9zdGF0ZS0+
cGJuID0gcGJuOworCQlkbV9jb25uX3N0YXRlLT52Y3BpX3Nsb3RzID0gdmNwaTsKKwl9CisJcmV0
dXJuIDA7Cit9CisKIHN0YXRpYyB2b2lkIGRtX2RybV9wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3Bs
YW5lICpwbGFuZSkKIHsKIAlzdHJ1Y3QgZG1fcGxhbmVfc3RhdGUgKmFtZGdwdV9zdGF0ZSA9IE5V
TEw7CkBAIC04MDIyLDExICs4MDg1LDYgQEAgc3RhdGljIGludCBhbWRncHVfZG1fYXRvbWljX2No
ZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaWYgKHJldCkKIAkJZ290byBmYWlsOwogCi0J
LyogUGVyZm9ybSB2YWxpZGF0aW9uIG9mIE1TVCB0b3BvbG9neSBpbiB0aGUgc3RhdGUqLwotCXJl
dCA9IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0YXRlKTsKLQlpZiAocmV0KQotCQlnb3RvIGZh
aWw7Ci0KIAlpZiAoc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKSB7CiAJCS8qCiAJCSAqIFRo
aXMgaXMgYSBmYXN0IGN1cnNvciB1cGRhdGUgY29taW5nIGZyb20gdGhlIHBsYW5lIHVwZGF0ZQpA
QCAtODA5OCw2ICs4MTU2LDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlpZiAoIWNvbXB1dGVfbXN0X2RzY19jb25maWdzX2Zv
cl9zdGF0ZShzdGF0ZSwgZG1fc3RhdGUtPmNvbnRleHQpKQogCQkJZ290byBmYWlsOwogCisJCXJl
dCA9IGRtX3VwZGF0ZV9tc3RfdmNwaV9zbG90c19mb3JfZHNjKHN0YXRlLCBkbV9zdGF0ZS0+Y29u
dGV4dCk7CisJCWlmIChyZXQpCisJCQlnb3RvIGZhaWw7CisKIAkJaWYgKGRjX3ZhbGlkYXRlX2ds
b2JhbF9zdGF0ZShkYywgZG1fc3RhdGUtPmNvbnRleHQsIGZhbHNlKSAhPSBEQ19PSykgewogCQkJ
cmV0ID0gLUVJTlZBTDsKIAkJCWdvdG8gZmFpbDsKQEAgLTgxMjYsNiArODE4OCwxMCBAQCBzdGF0
aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJ
CQlkY19yZXRhaW5fc3RhdGUob2xkX2RtX3N0YXRlLT5jb250ZXh0KTsKIAkJfQogCX0KKwkvKiBQ
ZXJmb3JtIHZhbGlkYXRpb24gb2YgTVNUIHRvcG9sb2d5IGluIHRoZSBzdGF0ZSovCisJcmV0ID0g
ZHJtX2RwX21zdF9hdG9taWNfY2hlY2soc3RhdGUpOworCWlmIChyZXQpCisJCWdvdG8gZmFpbDsK
IAogCS8qIFN0b3JlIHRoZSBvdmVyYWxsIHVwZGF0ZSB0eXBlIGZvciB1c2UgbGF0ZXIgaW4gYXRv
bWljIGNoZWNrLiAqLwogCWZvcl9lYWNoX25ld19jcnRjX2luX3N0YXRlIChzdGF0ZSwgY3J0Yywg
bmV3X2NydGNfc3RhdGUsIGkpIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
