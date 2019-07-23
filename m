Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC872307
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB026E3EB;
	Tue, 23 Jul 2019 23:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690054.outbound.protection.outlook.com [40.107.69.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2856E3E3;
 Tue, 23 Jul 2019 23:29:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W64dNbW+DVkLbUxns9DjHYi33YjbaPnvDuFQ8NQYspaopgB3VCOODRzbyH0G2bWd3B3CsM4OVlXjGo3uq9Eh8GKZVgDwWZsXszSbUlN/7AWoeiWpvtdSwfyWkiGTi0V9pvVGuR/SXerTKo/50HwMyEATJQ+vNU4keKljM+vVDDqMLBp/Qq0xhtWlG0UZl/rD5hKj0+QvbrtRn3OEU+z3BmP1YbSRCCYEbaMHA1fhs2sF1OFLTlt6JEMJc4FQAfnK4i2s3Hb+UdbFtguWy2Y+9/O0oQ/8UzG0WfFbwdDNxgZvH2ym2wptFRac7P+2oWNtPao/YTNIcs7VseRUHeMOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2QHNUt4kalFLqlG+5Qbbn4m7VLFc8GJcsqH1CrTyt0=;
 b=NWLg2y249s1uRFTCTMSnrCH6vrhcs+fFo7ukzADwHrhwtyQkx107ovjtKdhJEy5MenvXcz3BBDzq14AOVIH1gOql7agoE290jvEOIAc2jpjsWl2c8gvq2PPpbNaKTkb14yEYJ6Wyj1XZMB9QzjEF1nD/sqtf3JpkeI/W7RV+gAwe3EXYSCD0Vhzu6Fmx8atRbNsLQXSXeIk+F4KtKZ8XIF/vOAnfGaQmkt0dL8TcpmnAtgy5DdrUBWwJWb+TcWq0g6V4G0qRgt7GmBbyjDlTW5cOQwNL7dbpy2vwuZp9cz3ElCRwdnXryJ/yzeTWILtKtv6jvluTT5WC3BjLmT4jvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by DM5PR12MB1305.namprd12.prod.outlook.com
 (2603:10b6:3:75::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15; Tue, 23 Jul
 2019 23:29:10 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:05 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/9 v2] drm/i915: Implement MST Aux device registration
Date: Tue, 23 Jul 2019 19:28:05 -0400
Message-ID: <20190723232808.28128-7-sunpeng.li@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e9aa1bf-d3a3-4da0-f7b1-08d70fc59018
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1305; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1305:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1305B381C65FFA7C0760433D82C70@DM5PR12MB1305.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Q6NaLwtGKOehoHWv7DQyKm4XxpXnYyXJD59E76HQSPT6snulBSDnpyk9iLxq79yr8T3/He4h4tV9KuWVMq8I+Jqtv+eV8bdy8pK9PFwBc2ZvUAcKwn6bDKzFmJu9D9nW6x/PDtb7XWX8D1qVa8PE0ONbqSok4Bp+t76X1etEJZZ0EA5NDuWBMDtMucYulHGVm/LsdG+9wf6RkY3J2Vn8N9esM6B0FoZi2Sjf/dh9Lrqfy6f2S+Ej1k8p0qDYhyHuIjwvKcg2dTJT1gNblb5odweq75xPJ9L+6tNfIngUbyyeOgYlX/kcWaaFcrix1EfUeCTLHrR9oHT4VL/AscOrzS0vX1ZHFFxUkJUdldVExYQaqoau8AkJcKyPD4CF4ft7lcSi9SPLRUXQS8CEBlfTDm0DhXGPiPQCjvO6RbWZRow=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:09.4692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9aa1bf-d3a3-4da0-f7b1-08d70fc59018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2QHNUt4kalFLqlG+5Qbbn4m7VLFc8GJcsqH1CrTyt0=;
 b=XOhq5sZV0U5Ijd17Ee4pxrtj57arlw99FtUGC7EC+dbjRGHKhYEDmTZY3BIWZSBEnz3yvYVMruy+Ebvr72rnKEpVavDizwOCUiOyOO3U9KqWuNoPjWIC1rkdAXTfCXkIW3HwkXIChVPonej1rSzl/EL+Yx7xKJmf/+ZVE3Xbstc=
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
Cc: Leo Li <sunpeng.li@amd.com>, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCkNhbGwgZHJt
IGhlbHBlcnMgZm9yIE1TVCBjb25uZWN0b3IgcmVnaXN0cmF0aW9uLCB3aGljaCByZWdpc3RlcnMg
dGhlCkFVWCBkZXZpY2VzLgoKU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5j
b20+Cgp2MiBjaGFuZ2VzOgpVbndpbmQgaW50ZWxfY29ubmVjdG9yX3JlZ2lzdGVyIG9uIG1zdCBs
YXRlIHJlZ2lzdGVyIGZhaWx1cmUuCi0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9tc3QuYyB8IDMzICsrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKaW5kZXggNjA2NTJlYmJkZjYxLi4wNjMzZWJmM2YxYmYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwpAQCAtNDAw
LDEzICs0MDAsNDIgQEAgaW50ZWxfZHBfbXN0X2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLCBib29sIGZvcmNlKQogCQkJCSAgICAgIGludGVsX2Nvbm5lY3Rvci0+cG9ydCk7
CiB9CiAKK3N0YXRpYyBpbnQKK2ludGVsX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3Rlcihz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQoreworCXN0cnVjdCBpbnRlbF9jb25uZWN0
b3IgKmludGVsX2Nvbm5lY3RvciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCXN0
cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQgPSBpbnRlbF9jb25uZWN0b3ItPnBvcnQ7CisKKwlp
bnQgcmV0OworCisJcmV0ID0gaW50ZWxfY29ubmVjdG9yX3JlZ2lzdGVyKGNvbm5lY3Rvcik7CisJ
aWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCXJldCA9IGRybV9kcF9tc3RfY29ubmVjdG9yX2xh
dGVfcmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKKwlpZiAocmV0KQorCQlpbnRlbF9jb25uZWN0
b3JfdW5yZWdpc3Rlcihjb25uZWN0b3IpOworCisJcmV0dXJuIHJldDsKK30KKworc3RhdGljIHZv
aWQKK2ludGVsX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQoreworCXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nv
bm5lY3RvciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCXN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKnBvcnQgPSBpbnRlbF9jb25uZWN0b3ItPnBvcnQ7CisKKwlkcm1fZHBfbXN0X2Nv
bm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKGNvbm5lY3RvciwgcG9ydCk7CisJaW50ZWxfY29ubmVj
dG9yX3VucmVnaXN0ZXIoY29ubmVjdG9yKTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Y29ubmVjdG9yX2Z1bmNzIGludGVsX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmRldGVj
dCA9IGludGVsX2RwX21zdF9kZXRlY3QsCiAJLmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3Byb2Jl
X3NpbmdsZV9jb25uZWN0b3JfbW9kZXMsCiAJLmF0b21pY19nZXRfcHJvcGVydHkgPSBpbnRlbF9k
aWdpdGFsX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5LAogCS5hdG9taWNfc2V0X3Byb3Bl
cnR5ID0gaW50ZWxfZGlnaXRhbF9jb25uZWN0b3JfYXRvbWljX3NldF9wcm9wZXJ0eSwKLQkubGF0
ZV9yZWdpc3RlciA9IGludGVsX2Nvbm5lY3Rvcl9yZWdpc3RlciwKLQkuZWFybHlfdW5yZWdpc3Rl
ciA9IGludGVsX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyLAorCS5sYXRlX3JlZ2lzdGVyID0gaW50ZWxf
ZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyLAorCS5lYXJseV91bnJlZ2lzdGVyID0gaW50
ZWxfZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAogCS5kZXN0cm95ID0gaW50ZWxf
Y29ubmVjdG9yX2Rlc3Ryb3ksCiAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19o
ZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCiAJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUg
PSBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsCi0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
