Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF495FD4B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5796E3DB;
	Thu,  4 Jul 2019 19:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820054.outbound.protection.outlook.com [40.107.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CB36E3DB;
 Thu,  4 Jul 2019 19:06:38 +0000 (UTC)
Received: from BN8PR12CA0019.namprd12.prod.outlook.com (20.178.208.32) by
 BN8PR12MB2851.namprd12.prod.outlook.com (20.179.64.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Thu, 4 Jul 2019 19:06:35 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by BN8PR12CA0019.outlook.office365.com
 (2603:10b6:408:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:35 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:24 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/10] drm/amd/display: Implement MST Aux device registration
Date: Thu, 4 Jul 2019 15:05:19 -0400
Message-ID: <20190704190519.29525-11-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(110136005)(11346002)(54906003)(305945005)(8936002)(49486002)(50226002)(36756003)(53936002)(486006)(126002)(336012)(476003)(2616005)(446003)(4326008)(76176011)(14444005)(426003)(186003)(2906002)(48376002)(1076003)(8676002)(72206003)(77096007)(2870700001)(316002)(68736007)(5660300002)(50466002)(70206006)(47776003)(51416003)(2876002)(70586007)(26005)(6666004)(86362001)(81166006)(81156014)(356004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2851; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b446187-94f2-46df-7bb7-08d700b2bbfe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB2851; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB2851:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2851C577899B719689AD621582FA0@BN8PR12MB2851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lcwwVuCWFANRzGQQlfLsl4MLgPGHI/3pgx2/nF5A1OTBi1IeYiGhGWtcqHxnkU2A/d6K6eAJErpRMVgnzJKhFH2JjTRARDHo5E8RPE7tyGfIOyGSENtJyOvesLRdBBknZ3ksrgcSASUA6QwIqRXlL31esBPEaijf1gVCK8gyrodlsPrWc3GrfMF9uUKp7LUU+IX5+3kJI+wXBFcOWhj04iQ4xxHhFnaJ15SVuwo1sTJlOY8DquO68k5vw4H5Cy9I9QW3bF9arAF2HwWkMhpqCRYrf28wQjyWApKQvp1Txgq24AA5PeHZqPpmrVAGT43FG5jraWfE+9ArQJszbifDnOm2XXDN/qub/ptYY1eeY1J+BijfNemDgv+/2klNRUBtX1L8sXXrxT6AmsXE3XxSK/6tZI5BF9yH1J/wR96/Zfs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:35.1573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b446187-94f2-46df-7bb7-08d700b2bbfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGbz64FOm7IKpvZhMdz6SsYWNclo1MCz/vAqKmtOKkQ=;
 b=i2M8OtzvgnLKqv2xGfkvlRU8YfZLkG8lGrnTTcz9U0JqOwYVEwBYBzCwDqEBhxEuaW4sRaI0v/9o5pTh4tQJo3tCGUkcfVEgFpQsnQ1a5nVWsdjxOlvuBYW2QRi0FdKNKFkqJREGSXgkkgXVVsWNURTfxvLIcKWupDwxeSlg6X4=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCkNhbGwgZHJt
IGhlbHBlcnMgZm9yIE1TVCBjb25uZWN0b3IgcmVnaXN0cmF0aW9uLCB3aGljaCByZWdpc3RlcnMg
dGhlCkFVWCBkZXZpY2VzLgoKQ2M6IEplcnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBO
aWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDI0ICsrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9t
c3RfdHlwZXMuYwppbmRleCA1M2QyY2ZlNjJlMTMuLjE2MjE4YTIwMmI1OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVz
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMKQEAgLTE1Niw2ICsxNTYsMjYgQEAgZG1fZHBfbXN0X2Nvbm5lY3Rvcl9kZXN0
cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJa2ZyZWUoYW1kZ3B1X2RtX2Nv
bm5lY3Rvcik7CiB9CiAKK3N0YXRpYyBpbnQKK2FtZGdwdV9kbV9tc3RfY29ubmVjdG9yX2xhdGVf
cmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgYW1k
Z3B1X2RtX2Nvbm5lY3RvciAqYW1kZ3B1X2RtX2Nvbm5lY3RvciA9CisJCXRvX2FtZGdwdV9kbV9j
b25uZWN0b3IoY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0ID0gYW1k
Z3B1X2RtX2Nvbm5lY3Rvci0+cG9ydDsKKworCXJldHVybiBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9s
YXRlX3JlZ2lzdGVyKGNvbm5lY3RvciwgcG9ydCk7Cit9CisKK3N0YXRpYyB2b2lkCithbWRncHVf
ZG1fbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCit7CisJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFtZGdwdV9kbV9jb25u
ZWN0b3IgPQorCQl0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CisJc3RydWN0IGRy
bV9kcF9tc3RfcG9ydCAqcG9ydCA9IGFtZGdwdV9kbV9jb25uZWN0b3ItPnBvcnQ7CisKKwlkcm1f
ZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKGNvbm5lY3RvciwgcG9ydCk7Cit9CisK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBkbV9kcF9tc3RfY29ubmVj
dG9yX2Z1bmNzID0gewogCS5kZXRlY3QgPSBkbV9kcF9tc3RfZGV0ZWN0LAogCS5maWxsX21vZGVz
ID0gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLApAQCAtMTY0LDcgKzE4
NCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBkbV9kcF9tc3Rf
Y29ubmVjdG9yX2Z1bmNzID0gewogCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gYW1kZ3B1X2Rt
X2Nvbm5lY3Rvcl9hdG9taWNfZHVwbGljYXRlX3N0YXRlLAogCS5hdG9taWNfZGVzdHJveV9zdGF0
ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlLAogCS5hdG9taWNf
c2V0X3Byb3BlcnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfc2V0X3Byb3BlcnR5LAot
CS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3By
b3BlcnR5CisJLmF0b21pY19nZXRfcHJvcGVydHkgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21p
Y19nZXRfcHJvcGVydHksCisJLmxhdGVfcmVnaXN0ZXIgPSBhbWRncHVfZG1fbXN0X2Nvbm5lY3Rv
cl9sYXRlX3JlZ2lzdGVyLAorCS5lYXJseV91bnJlZ2lzdGVyID0gYW1kZ3B1X2RtX21zdF9jb25u
ZWN0b3JfZWFybHlfdW5yZWdpc3RlciwKIH07CiAKIHN0YXRpYyBpbnQgZG1fZHBfbXN0X2dldF9t
b2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
