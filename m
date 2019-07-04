Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB45FD46
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B301F6E3D2;
	Thu,  4 Jul 2019 19:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790080.outbound.protection.outlook.com [40.107.79.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2403A6E3C7;
 Thu,  4 Jul 2019 19:06:34 +0000 (UTC)
Received: from BN8PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:60::32)
 by BYAPR12MB2854.namprd12.prod.outlook.com (2603:10b6:a03:12c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 4 Jul
 2019 19:06:32 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by BN8PR12CA0019.outlook.office365.com
 (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:31 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:23 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/10] drm/i915: Implement MST Aux device registration
Date: Thu, 4 Jul 2019 15:05:16 -0400
Message-ID: <20190704190519.29525-8-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(68736007)(2870700001)(77096007)(110136005)(26005)(36756003)(2876002)(14444005)(76176011)(2906002)(8676002)(54906003)(5660300002)(486006)(186003)(49486002)(47776003)(50466002)(51416003)(81156014)(81166006)(305945005)(476003)(86362001)(446003)(11346002)(426003)(2616005)(72206003)(8936002)(478600001)(70206006)(4326008)(316002)(336012)(70586007)(50226002)(48376002)(53936002)(1076003)(126002)(6666004)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2854; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d68e1c3-d5b9-4eae-ec01-08d700b2b9a1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2854; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2854:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2854A937C38E650F42ADD7A982FA0@BYAPR12MB2854.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2ACy4uQfEPUXKYjfj8pJ4d0/+p2keLpDCbdehZO8STOW3rbyi0v9pjDiaUW73MBzPD3LKYsBQKrJeR4vlQEm3HhrSRdZ5wzco+gPO8vDe9QGFLnxCrJpgjRpp4MckdHzgQ6ci2cD5eUCc1rPkdnKwuG/g1eEnOvLou6p6IIAT9JvA6K4m4L/hKhteRYCTmEQmlucdiQKIWIZ2rvRhoCZ7vI6CutmuI7iKHKJ5PKQQ36Tch4egxdAHHgrYrtzWtl8ADSJFPxWSfP81aHFRmIjrMCuEMJachuLbz6GdpIYOdDwI06rb5EjCS+ggd1/4wiFxj1FuhMIVNXJ6uFTaMZPGMGHQj8/ocKF0QCroeeT06RvmqMr3/9dXmG36F1fM+jpShS4v0slRO9ZHrMumcbSCcnCH4nebxzvBI+0ieYbGnY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:31.1427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d68e1c3-d5b9-4eae-ec01-08d700b2b9a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/xbAwEqipqurBk+/l7aEwleZzUyoatfx9xtGXdQdiI=;
 b=Sw3wpjKxHmHYnU18hVdlQTwSFpwUhjroLPj8kh2OhWqzgh4mD2tQKkxhmRfc/zKuZqEy7AsyVawXKozDRL5YoZx1hVtBqEDiuIHFTWU/YdW5NVwfjqrTctt28MWEKn7vQf76HnLR2e2FWyZmn1Nk7IXrfzRGokLFGvr6QDNUB60=
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCkNhbGwgZHJt
IGhlbHBlcnMgZm9yIE1TVCBjb25uZWN0b3IgcmVnaXN0cmF0aW9uLCB3aGljaCByZWdpc3RlcnMg
dGhlCkFVWCBkZXZpY2VzLgoKU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDI5
ICsrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBf
bXN0LmMKaW5kZXggNjA2NTJlYmJkZjYxLi5iZTMwOTAxNmY3NDYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwpAQCAtNDAwLDEzICs0MDAsMzggQEAgaW50
ZWxfZHBfbXN0X2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZv
cmNlKQogCQkJCSAgICAgIGludGVsX2Nvbm5lY3Rvci0+cG9ydCk7CiB9CiAKK3N0YXRpYyBpbnQK
K2ludGVsX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQoreworCXN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3Rv
ciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCXN0cnVjdCBkcm1fZHBfbXN0X3Bv
cnQgKnBvcnQgPSBpbnRlbF9jb25uZWN0b3ItPnBvcnQ7CisKKwlpbnQgcmV0OworCisJcmV0ID0g
aW50ZWxfY29ubmVjdG9yX3JlZ2lzdGVyKGNvbm5lY3Rvcik7CisJaWYgKHJldCkKKwkJcmV0dXJu
IHJldDsKKworCXJldHVybiBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKGNvbm5l
Y3RvciwgcG9ydCk7Cit9CisKK3N0YXRpYyB2b2lkCitpbnRlbF9kcF9tc3RfY29ubmVjdG9yX2Vh
cmx5X3VucmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1
Y3QgaW50ZWxfY29ubmVjdG9yICppbnRlbF9jb25uZWN0b3IgPSB0b19pbnRlbF9jb25uZWN0b3Io
Y29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0ID0gaW50ZWxfY29ubmVj
dG9yLT5wb3J0OworCisJZHJtX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3Rlcihjb25u
ZWN0b3IsIHBvcnQpOworCWludGVsX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKGNvbm5lY3Rvcik7Cit9
CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBpbnRlbF9kcF9tc3Rf
Y29ubmVjdG9yX2Z1bmNzID0gewogCS5kZXRlY3QgPSBpbnRlbF9kcF9tc3RfZGV0ZWN0LAogCS5m
aWxsX21vZGVzID0gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLAogCS5h
dG9taWNfZ2V0X3Byb3BlcnR5ID0gaW50ZWxfZGlnaXRhbF9jb25uZWN0b3JfYXRvbWljX2dldF9w
cm9wZXJ0eSwKIAkuYXRvbWljX3NldF9wcm9wZXJ0eSA9IGludGVsX2RpZ2l0YWxfY29ubmVjdG9y
X2F0b21pY19zZXRfcHJvcGVydHksCi0JLmxhdGVfcmVnaXN0ZXIgPSBpbnRlbF9jb25uZWN0b3Jf
cmVnaXN0ZXIsCi0JLmVhcmx5X3VucmVnaXN0ZXIgPSBpbnRlbF9jb25uZWN0b3JfdW5yZWdpc3Rl
ciwKKwkubGF0ZV9yZWdpc3RlciA9IGludGVsX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3Rl
ciwKKwkuZWFybHlfdW5yZWdpc3RlciA9IGludGVsX2RwX21zdF9jb25uZWN0b3JfZWFybHlfdW5y
ZWdpc3RlciwKIAkuZGVzdHJveSA9IGludGVsX2Nvbm5lY3Rvcl9kZXN0cm95LAogCS5hdG9taWNf
ZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRl
LAogCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gaW50ZWxfZGlnaXRhbF9jb25uZWN0b3JfZHVw
bGljYXRlX3N0YXRlLAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
