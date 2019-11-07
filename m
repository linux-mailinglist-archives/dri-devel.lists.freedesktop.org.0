Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5BCF333F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D056F717;
	Thu,  7 Nov 2019 15:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6A86F70D;
 Thu,  7 Nov 2019 15:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ap/IlPcjjFjpr5VF5j26dgTIJl9gwnF9gFx0M+Y9aHY3yaF9Mu64Z0z92h/7gTKWxpd+uA2x+zRtpkDs6sbjgJI8z+Z8prSDa9a6MLuNi6Kx0zUnmnYj46ugeAq8jK3nzEMBcjDmmw654z3OAJbrm+LEbABMB8NH5OdC+C/kcryYHrgEG5Xbt0QRG1AmnerbANj/ePeQuHBo9V8ZXPOqeVcFWkZ6eDZAYCQh35EMbl552KaK6Bt96C7eOfpPOEjl6MWw4eX+48EtwbqGqQoTpwFKkZ/f8UGNwqjf8oyMg0GJhFSTuRCFJm9JhL3voXZ2ZTVZxzmRZkq1NAixg/3q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPV+Hb3LpUxzgcisP+S5QBg9Bjt8C1XPVsbe8bGZDKs=;
 b=av+Woxe+N2U0lTSv/wNj0A2stcx31k9jgKf+6w2M8ZrYD1YIDpe/L5RS/YZla3AKAX4pQNz654E8csmrQFfD1rWRAn0g0qcWsrHxKqQEz+wRlnArZwkiUwUX3sBIgzG9U3gK5Cr/Xnx7gEpgHOg2BKLnztcozwYTpK0rqOzRGC1Ckkk1EEwlEAQgTUpwBELP5nDrioi7sY9b0BpnZ/fzCKHOTsfqCugGgOeEUl1yU+87LQw73LiNzSxYnZtItN6QUmtb2WjsSFzYsAI5WhhHUEjMrZizCEVUChTHgn0pSF8sGeOd5kGd8DsMlCVOkVwVsSKDsdehQXGWEXHBc72vnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0015.namprd12.prod.outlook.com (2603:10b6:4:1::25) by
 MWHPR12MB1325.namprd12.prod.outlook.com (2603:10b6:300:f::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 15:32:30 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by DM5PR12CA0015.outlook.office365.com
 (2603:10b6:4:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:30 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:29 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:29 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 13/13] drm/amd/display: Recalculate VCPI slots for new DSC
 connectors
Date: Thu, 7 Nov 2019 10:32:12 -0500
Message-ID: <20191107153212.1145-14-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(428003)(199004)(189003)(76176011)(446003)(476003)(2616005)(16586007)(11346002)(2906002)(486006)(8676002)(126002)(336012)(305945005)(426003)(2351001)(316002)(54906003)(6666004)(356004)(186003)(6916009)(1076003)(2876002)(5660300002)(86362001)(7696005)(50466002)(48376002)(53416004)(81156014)(81166006)(47776003)(4326008)(36756003)(478600001)(50226002)(14444005)(70586007)(70206006)(26005)(51416003)(8936002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1325; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b54c632-7973-489d-7eab-08d76397b3ec
X-MS-TrafficTypeDiagnostic: MWHPR12MB1325:
X-Microsoft-Antispam-PRVS: <MWHPR12MB13253923C162D43F15A5AB86E4780@MWHPR12MB1325.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZB/CDKx/hysQ8JTR1+2aTPYq07ltpCsi3WNhu98bZVJxqxgPEhPhu00WqzQFF2AZZNvheN+MwQIhNpA8jUYSp24ATD2Iy4+P8Okn/EnMJ+NoHhiLgU3IElCEP39PqBjhMpO4CP+NDxMreWc49J8mWTYbyWxPp87hhv1k1w0LicCxuRoWjnNoLUHDvpxEBn3Xziy6CTqyJ2zIYKyM7dLrECdOXi6ITBtWRqy4FKKQ03CM9mbH5wHFsuINoSe0FjBK694/X5m8POAJo4GamepXV+naw0iUl3A8U4GQtdzH1Wgoo0NlOFYSUKmcEt1/EXQjsRnYrfs+T/vkbmAOo6PBPMIC02YeOiLfinQUWB1Xs2ZLLTEFStSSEWb9oMaVsXjs6BYnFRr8IkuuDKWW/7TuzO1xhVRba5oWbKAIx14n1gtMHboUJBsogijIJ0Efuk6E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:30.5125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b54c632-7973-489d-7eab-08d76397b3ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1325
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPV+Hb3LpUxzgcisP+S5QBg9Bjt8C1XPVsbe8bGZDKs=;
 b=4UDCR7LT7lOL0eOMUXHlu9WkzgiPd+xPFxXuB5zjWzRSm91AXPmUnDi8sh7x1edKkNSiDdNhwAMKVkk31n7W3kx7aUoNlTCaDYaW1aXM+r8+c23nMtA/6KYyTVWMcJU4qgehN80jPx6mQEPekIegdjWJjgu9R+o2VQbeUTX63WQ=
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
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKU2luY2UgZm9yIERT
QyBNU1QgY29ubmVjdG9yJ3MgUEJOIGlzIGNsYWN1bGF0ZWQgZGlmZmVyZW50bHkKZHVlIHRvIGNv
bXByZXNzaW9uLCB3ZSBoYXZlIHRvIHJlY2FsY3VsYXRlIGJvdGggUEJOIGFuZApWQ1BJIHNsb3Rz
IGZvciB0aGF0IGNvbm5lY3Rvci4KClRoZSBmdW5jdGlvbiBpdGVyYXRlcyB0aHJvdWdoIGFsbCB0
aGUgYWN0aXZlIHN0cmVhbXMgdG8KZmluZCwgd2hpY2ggaGF2ZSBEU0MgZW5hYmxlZCwgdGhlbiBy
ZWNhbGN1bGF0ZXMgUEJOIGZvcgppdCBhbmQgY2FsbHMgZHJtX2RwX2hlbHBlcl91cGRhdGVfdmNw
aV9zbG90c19mb3JfZHNjIHRvCnVwZGF0ZSBjb25uZWN0b3IncyBWQ1BJIHNsb3RzLgoKdjI6IHVz
ZSBkcm1fZHBfbXN0X2F0b21pY19lbmFibGVfZHNjIHBlciBwb3J0IHRvCmVuYWJsZS9kaXNhYmxl
IERTQwoKQ2M6IEplcnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFu
ZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+ClNpZ25lZC1vZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4K
LS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1NiAr
KysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwppbmRleCA2MDkwMjBhMDU0OWUuLjllNmRkODI1MDZmNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00
OTU4LDYgKzQ5NTgsNDkgQEAgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyBh
bWRncHVfZG1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7CiAJLmF0b21pY19jaGVjayA9IGRtX2Vu
Y29kZXJfaGVscGVyX2F0b21pY19jaGVjawogfTsKIAorc3RhdGljIGludCBkbV91cGRhdGVfbXN0
X3ZjcGlfc2xvdHNfZm9yX2RzYyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCisJCQkJ
CSAgICBzdHJ1Y3QgZGNfc3RhdGUgKmRjX3N0YXRlKQoreworCXN0cnVjdCBkY19zdHJlYW1fc3Rh
dGUgKnN0cmVhbTsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsKKwlz
dHJ1Y3QgZG1fY29ubmVjdG9yX3N0YXRlICpkbV9jb25uX3N0YXRlOworCWludCBpID0gMCwgY2xv
Y2sgPSAwLCBicHAgPSAwOworCWludCB2Y3BpID0gMCwgcGJuID0gMDsKKworCWZvciAoaSA9IDA7
IGkgPCBkY19zdGF0ZS0+c3RyZWFtX2NvdW50OyBpKyspIHsKKworCQlzdHJlYW0gPSBkY19zdGF0
ZS0+c3RyZWFtc1tpXTsKKworCQlpZiAoIXN0cmVhbSkKKwkJCWNvbnRpbnVlOworCisJCWFjb25u
ZWN0b3IgPSAoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0tPmRtX3N0cmVhbV9j
b250ZXh0OworCQlkbV9jb25uX3N0YXRlID0gdG9fZG1fY29ubmVjdG9yX3N0YXRlKGFjb25uZWN0
b3ItPmJhc2Uuc3RhdGUpOworCisJCWlmICghYWNvbm5lY3Rvci0+cG9ydCkKKwkJCWNvbnRpbnVl
OworCisJCWlmIChzdHJlYW0tPnRpbWluZy5mbGFncy5EU0MgIT0gMSkgeworCQkJZHJtX2RwX21z
dF9hdG9taWNfZW5hYmxlX2RzYyhzdGF0ZSwgYWNvbm5lY3Rvci0+cG9ydCwgZG1fY29ubl9zdGF0
ZS0+cGJuLCBmYWxzZSk7CisJCQljb250aW51ZTsKKwkJfQorCisJCWJwcCA9IGNvbnZlcnRfZGNf
Y29sb3JfZGVwdGhfaW50b19icGMoc3RyZWFtLT50aW1pbmcuZGlzcGxheV9jb2xvcl9kZXB0aCkq
IDM7CisJCWNsb2NrID0gc3RyZWFtLT50aW1pbmcucGl4X2Nsa18xMDBoeiAvIDEwOworCQlwYm4g
PSAgZHJtX2RwX2NhbGNfcGJuX21vZGUoY2xvY2ssIGJwcCwgdHJ1ZSk7CisJCXZjcGkgPSBkcm1f
ZHBfbXN0X2F0b21pY19lbmFibGVfZHNjKHN0YXRlLCBhY29ubmVjdG9yLT5wb3J0LCBwYm4sIHRy
dWUpOworCisJCWlmICh2Y3BpIDwgMCkKKwkJCXJldHVybiB2Y3BpOworCisJCWlmICh2Y3BpID4g
MCAmJiBkbV9jb25uX3N0YXRlLT52Y3BpX3Nsb3RzICE9IHZjcGkpIHsKKwkJCWRtX2Nvbm5fc3Rh
dGUtPnBibiA9IHBibjsKKwkJCWRtX2Nvbm5fc3RhdGUtPnZjcGlfc2xvdHMgPSB2Y3BpOworCQl9
CisJfQorCXJldHVybiAwOworfQorCiBzdGF0aWMgdm9pZCBkbV9kcm1fcGxhbmVfcmVzZXQoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUpCiB7CiAJc3RydWN0IGRtX3BsYW5lX3N0YXRlICphbWRncHVf
c3RhdGUgPSBOVUxMOwpAQCAtNzk5MSwxMSArODAzNCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rt
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChyZXQpCiAJCWdvdG8g
ZmFpbDsKIAotCS8qIFBlcmZvcm0gdmFsaWRhdGlvbiBvZiBNU1QgdG9wb2xvZ3kgaW4gdGhlIHN0
YXRlKi8KLQlyZXQgPSBkcm1fZHBfbXN0X2F0b21pY19jaGVjayhzdGF0ZSk7Ci0JaWYgKHJldCkK
LQkJZ290byBmYWlsOwotCiAJaWYgKHN0YXRlLT5sZWdhY3lfY3Vyc29yX3VwZGF0ZSkgewogCQkv
KgogCQkgKiBUaGlzIGlzIGEgZmFzdCBjdXJzb3IgdXBkYXRlIGNvbWluZyBmcm9tIHRoZSBwbGFu
ZSB1cGRhdGUKQEAgLTgwNjcsNiArODEwNSwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9t
aWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9E
Q19EU0NfU1VQUE9SVAogCQlpZiAoIWNvbXB1dGVfbXN0X2RzY19jb25maWdzX2Zvcl9zdGF0ZShz
dGF0ZSwgZG1fc3RhdGUtPmNvbnRleHQpKQogCQkJZ290byBmYWlsOworCisJCXJldCA9IGRtX3Vw
ZGF0ZV9tc3RfdmNwaV9zbG90c19mb3JfZHNjKHN0YXRlLCBkbV9zdGF0ZS0+Y29udGV4dCk7CisJ
CWlmIChyZXQpCisJCQlnb3RvIGZhaWw7CiAjZW5kaWYKIAkJaWYgKGRjX3ZhbGlkYXRlX2dsb2Jh
bF9zdGF0ZShkYywgZG1fc3RhdGUtPmNvbnRleHQsIGZhbHNlKSAhPSBEQ19PSykgewogCQkJcmV0
ID0gLUVJTlZBTDsKQEAgLTgwOTYsNiArODEzOCwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQlkY19yZXRhaW5fc3RhdGUo
b2xkX2RtX3N0YXRlLT5jb250ZXh0KTsKIAkJfQogCX0KKwkvKiBQZXJmb3JtIHZhbGlkYXRpb24g
b2YgTVNUIHRvcG9sb2d5IGluIHRoZSBzdGF0ZSovCisJcmV0ID0gZHJtX2RwX21zdF9hdG9taWNf
Y2hlY2soc3RhdGUpOworCWlmIChyZXQpCisJCWdvdG8gZmFpbDsKIAogCS8qIFN0b3JlIHRoZSBv
dmVyYWxsIHVwZGF0ZSB0eXBlIGZvciB1c2UgbGF0ZXIgaW4gYXRvbWljIGNoZWNrLiAqLwogCWZv
cl9lYWNoX25ld19jcnRjX2luX3N0YXRlIChzdGF0ZSwgY3J0YywgbmV3X2NydGNfc3RhdGUsIGkp
IHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
