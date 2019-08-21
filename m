Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0A98509
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3255A6E9FC;
	Wed, 21 Aug 2019 20:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817B86E9F6;
 Wed, 21 Aug 2019 20:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+w5DsRTHL/HOXKb5hCEthpdsTlELohiv1IeYEyBE6gNpbfDuSOCLvZOV2pSwhGq0h+yQxK2+6zwpdDo8Ehr0RRBg/LOAk6SJ7eN8vuVf35S5pFqAWjjpgVGIHe53SwAhMJGqLoRiVgWD1f61X1Bl2BUctDpc1OCKtR3+6Vjs6os84UsTzya3YjbKI+b8k/1we6k+X9wlE/mEERgapZJS+HCCUqfQqMFu1OEIPFBq7u/6nVOvYmBHXRlfJxtBsIGsv8tr1n51SGPg5X6TaET1sup8nzf6oH+myZ/sraiLO6fu47l7cUCc94uZeNgZ6hd8ZPMtc/gs10GCyHFm6k2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfOgLC2cSAo9yGSTfY+3+Nfr0DItAcG8Mx1Heg+YsCU=;
 b=kmXE9elYKHzu6+H5W1lj7/PkgQ1fi16a0Zhvs31I2KqPu/y72ch0H7F1/AwKGrslXCmU1Hlnc+lgSZ+x2dcw8b6I/Zrfaohd/gY2wAPyL0nUvwU9bWr+DdneOyhHnufdULq851JZI6zblxnqBY6Rh8b8WCBEmVlyyNetwwFVgY7hQT9lFS0xAXPdXtu+UA+NMTbIFmoOHVqO+m7f7m92qnC7m9HtMCG5nYGXKdAXkn7XwnX+gUKZO5tgK8CLgFsy8pmVGoisBnV4DBFrSlOQ9cUN4bH4bMe1pgpNNeI2woVi1fQQuWVl/SNuC3oOfdRgoG5k+XqVuYyDxZBfE78ASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (10.164.241.19) by
 BN6PR12MB1267.namprd12.prod.outlook.com (10.168.224.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 20:02:07 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:02:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:02:07 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:43 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 13/16] drm/amd/display: Validate DSC caps on MST endpoints
Date: Wed, 21 Aug 2019 16:01:26 -0400
Message-ID: <20190821200129.11575-14-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(81156014)(70206006)(50226002)(6666004)(356004)(54906003)(110136005)(476003)(14444005)(478600001)(36756003)(70586007)(5660300002)(486006)(86362001)(126002)(11346002)(446003)(316002)(53936002)(2616005)(16586007)(186003)(8936002)(51416003)(450100002)(49486002)(50466002)(426003)(8676002)(305945005)(4326008)(2906002)(1076003)(48376002)(26005)(81166006)(76176011)(336012)(15650500001)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f94a424-08e6-47f1-d8c8-08d7267271e4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1267A1B7F26125E0F0C663E6EFAA0@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kXuNmBpyw+FOO60pEVv78Qg315uh8xaoNxAqnUJbPAsFW+gExdubRhe04guVUHxZ1NZGkXQBzobr6D9gwuojSWzZH56NL0hXEm5Nb4WdmC35Ybzn9ixuRD9SG0lswyxTfim941trU3OXB4Ug2x+LK1/sf3Lo/JAGW8GfnOPDIkT+5+A0pdGB76TSHLBu3BvbWkGIi48u4y2OlYDGKxunkKQZ+pZXgt3ne/7A4b671XlNPpKDn/cHj2S8zHO8eisPGmfUMhN4y3z4gsaNW5aPyhUBOFzqMxaS8B2gWTBVYPpzVJeGhcxJMbhwaFeFmKtfxeGPJyblRTArJMewBtuuOnEMtg+bFDH91xt43GJl89TSbV/HYrRyDosjkVom+7bZZmJIGLvZxixcxT9O1fPfaHZ4tEMvxR8cZYJgOQl/csk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:02:07.2402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f94a424-08e6-47f1-d8c8-08d7267271e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfOgLC2cSAo9yGSTfY+3+Nfr0DItAcG8Mx1Heg+YsCU=;
 b=ISKoZ+qgjUGF2o21XxCwYTEvSx3Ep/8CJMCtv4KKsZi6lCjp/jXn6OqZMlDzCUof8XNTU9VihQFeOVG2YwaBYWNOnJxbUSbl8X7CjReyNttrpuFfn4F7zfRZz9UN1PniPLXsWQbf7W1JYzLWhRgpSOrW2+iv89TOujOWfLU10cQ=
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
Cc: David Francis <David.Francis@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVyaW5nIE1TVCBtb2RlIGVudW1lcmF0aW9uLCBpZiBhIG5ldyBkY19zaW5rIGlzIGNyZWF0ZWQs
CnBvcHVsYXRlIGl0IHdpdGggZHNjIGNhcHMgYXMgYXBwcm9wcmlhdGUuCgpVc2UgZHJtX2RwX21z
dF9kc2NfY2Fwc19mb3JfcG9ydCB0byBnZXQgdGhlIHJhdyBjYXBzLAp0aGVuIHBhcnNlIHRoZW0g
b250byBkY19zaW5rIHdpdGggZGNfZHNjX3BhcnNlX2RzY19kcGNkLgoKQ2M6IFdlbmppbmcgTGl1
IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpDYzogTmlrb2xhIENvcm5paiA8Tmlrb2xhLkNvcm5pakBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5j
b20+Ci0tLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwg
MjcgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCmluZGV4IDE2MjE4YTIwMmI1OS4u
OTk3OGMxYTAxZWI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwpAQCAtMjUsNiArMjUsNyBAQAog
CiAjaW5jbHVkZSA8bGludXgvdmVyc2lvbi5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hl
bHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZHBfbXN0X2hlbHBlci5oPgogI2luY2x1ZGUgImRt
X3NlcnZpY2VzLmgiCiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgi
CkBAIC0xODksNiArMTkwLDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9m
dW5jcyBkbV9kcF9tc3RfY29ubmVjdG9yX2Z1bmNzID0gewogCS5lYXJseV91bnJlZ2lzdGVyID0g
YW1kZ3B1X2RtX21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3RlciwKIH07CiAKKyNpZmRlZiBD
T05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorc3RhdGljIGJvb2wgdmFsaWRhdGVfZHNjX2Nh
cHNfb25fY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yKQor
eworCXN0cnVjdCBkY19zaW5rICpkY19zaW5rID0gYWNvbm5lY3Rvci0+ZGNfc2luazsKKwlzdHJ1
Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0ID0gYWNvbm5lY3Rvci0+cG9ydDsKKwl1OCBkc2NfY2Fw
c1sxNl0gPSB7IDAgfTsKKworCWlmIChkcm1fZHBfbXN0X2RzY19jYXBzX2Zvcl9wb3J0KHBvcnQs
IGRzY19jYXBzKSA8IDApCisJCXJldHVybiBmYWxzZTsKKworCXByaW50aygiVmFsaWRhdGVkIERT
QyBjYXBzIDB4JXgiLCBkc2NfY2Fwc1swXSk7CisJaWYgKCFkY19kc2NfcGFyc2VfZHNjX2RwY2Qo
ZHNjX2NhcHMsIE5VTEwsICZkY19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2FwcykpCisJ
CXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorI2VuZGlmCisKIHN0YXRpYyBpbnQg
ZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewog
CXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nv
bm5lY3Rvcihjb25uZWN0b3IpOwpAQCAtMjMxLDEwICsyNTAsMTYgQEAgc3RhdGljIGludCBkbV9k
cF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJCS8qIGRj
X2xpbmtfYWRkX3JlbW90ZV9zaW5rIHJldHVybnMgYSBuZXcgcmVmZXJlbmNlICovCiAJCWFjb25u
ZWN0b3ItPmRjX3NpbmsgPSBkY19zaW5rOwogCi0JCWlmIChhY29ubmVjdG9yLT5kY19zaW5rKQor
CQlpZiAoYWNvbm5lY3Rvci0+ZGNfc2luaykgewogCQkJYW1kZ3B1X2RtX3VwZGF0ZV9mcmVlc3lu
Y19jYXBzKAogCQkJCQljb25uZWN0b3IsIGFjb25uZWN0b3ItPmVkaWQpOwogCisjaWZkZWYgQ09O
RklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKKwkJCWlmICghdmFsaWRhdGVfZHNjX2NhcHNfb25f
Y29ubmVjdG9yKGFjb25uZWN0b3IpKQorCQkJCW1lbXNldCgmYWNvbm5lY3Rvci0+ZGNfc2luay0+
c2lua19kc2NfY2FwcywKKwkJCQkgICAgICAgMCwgc2l6ZW9mKGFjb25uZWN0b3ItPmRjX3Npbmst
PnNpbmtfZHNjX2NhcHMpKTsKKyNlbmRpZgorCQl9CiAJfQogCiAJZHJtX2Nvbm5lY3Rvcl91cGRh
dGVfZWRpZF9wcm9wZXJ0eSgKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
