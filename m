Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA44B6DA5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4C472B03;
	Wed, 18 Sep 2019 20:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800044.outbound.protection.outlook.com [40.107.80.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1653572B09;
 Wed, 18 Sep 2019 20:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iw/+PZPFJpafIlKXcHVwVrIoVFiMJ5ZpCaOP8XEt9VtS0ooDKXXF8SHMvhorN9T8ny11vfPNz88PJRGl4uhy18Htzs40zqWpCoSWae0VUmEiVZSrTwzB4slR6oeqXyV9lxixifLPoa9JQuxQCFGW2QJ1VYhmhp1oy8EMOAN1dzOPP4W4j9iNlpv1IJn+y/u6Fi/MkYth+igpxh/6O0Oc6vKZAGaRJdjcXM8YhmOZoD3soJkdIFNIjErlkcRacF6IPU+om2TCCDDZOXsEN+d5YHndXA8WIXVr8xOEnKTWys7a1PfglyNhVAlPXPlM7bqo/+F70SW858P7jtM6RPeWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tirSsMSav1b2VyGxkBgD1AfuhmnvkWhyMtjylKyBOy4=;
 b=EfVYBfeZ5a6mn7Wvc381UxE2Sn+7hWTy5EoKKql+xpfU4ltikWYlKzEta6yTQFBBo7/0t72tiF0A1kT5uCl/r81M1x75ZnUZsTltwA43WHSGIDPj2Gh2h3MLctoJWFgxRa3qXXrsiTHcUsZMgEcPduzHWMFbWRV9SMEhmHcRBMMYOX/rNsj2U3Svde5kxPOKhj8jKuQtogKsS0lilq5urXH49keq5MDD+dDdKUXNclPMz25USRgm9P8817jMtA+oHPbcBPJqqxq+jkA6YU8HM0HBjRSZl3pgmBMlBNkbtAQbkEvAyKfR1c1ye5IpcviONQ+flTZn5q7bX1wfBiGjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:610:57::38)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Wed, 18 Sep
 2019 20:27:34 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by CH2PR12CA0028.outlook.office365.com
 (2603:10b6:610:57::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:34 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:32 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/15] drm/amd/display: Validate DSC caps on MST endpoints
Date: Wed, 18 Sep 2019 16:26:49 -0400
Message-ID: <d27572ad9f86376f176f17ded22a99e99c7b7e42.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(428003)(199004)(189003)(426003)(2876002)(15650500001)(316002)(2616005)(5660300002)(16586007)(305945005)(2351001)(50466002)(36756003)(118296001)(11346002)(48376002)(446003)(53416004)(54906003)(450100002)(4326008)(186003)(86362001)(76176011)(7696005)(51416003)(8936002)(336012)(81166006)(8676002)(126002)(81156014)(356004)(26005)(47776003)(476003)(50226002)(70206006)(70586007)(14444005)(478600001)(6916009)(2906002)(6666004)(486006)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4039; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aafa3e4-2dec-4d56-570f-08d73c76a36c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CH2PR12MB4039; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB4039:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40394E59B3316699031D4747E48E0@CH2PR12MB4039.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jo9AvsL9pxn1wTNdPChbqLQFKtPWpP5HQEliIQ3lu5j43MA0pa6ZXgPfEFap6fvay6lXBCz4IlHnSqJ6ms2w5CYi3Kf2qeal7tQl8+tRfRzkyUKmeABn89g7dUuRPeMzm1W85e6UmHcdnPGgFVeiQiBwJRd/ZCGa9UQZcAba3c7T4vmmddKkBYZU09RpgPippIbdAB+Rf/NfXavNURMugyimyfV8HsThAKWtBUUURZbMo6aZx0pDqFHgCbFqKdIPQ4uPPyzLbV/7d9k0wqnYIQLxv3Y5V0mI+Nla+w1ZgN182fen5TsXKFCimBwOTvVgypuaToK9S8WjnBh2uWpf1NJgfeQkK+MGkIp2pac8kHqK+Y4shJNy0yTRPJN4tDJq3IWGL9pd+d4riE+72FbemnmhHDsui+zwZdBDAKOttvc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:34.0787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aafa3e4-2dec-4d56-570f-08d73c76a36c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tirSsMSav1b2VyGxkBgD1AfuhmnvkWhyMtjylKyBOy4=;
 b=0qi+CIDSnEXMTnQK5HIQ2lKtm+y+xwkS0BX2Ys9un/5nbSHxhT8utIUHEjEoDCGVuya5tCIZGFY+B9saywQOO1fsS97D1U/9fEVlWy62BobGG0v3uWWryJQJ/4Zz1xIXTMtZBJy+qMjPMU4yeYyv9eFiJQRLO2zIgeOopIoX5XY=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRHVyaW5nIE1TVCBt
b2RlIGVudW1lcmF0aW9uLCBpZiBhIG5ldyBkY19zaW5rIGlzIGNyZWF0ZWQsCnBvcHVsYXRlIGl0
IHdpdGggZHNjIGNhcHMgYXMgYXBwcm9wcmlhdGUuCgpVc2UgZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0IHRvIGdldCB0aGUgcmF3IGNhcHMsCnRoZW4gcGFyc2UgdGhlbSBvbnRvIGRjX3Npbmsg
d2l0aCBkY19kc2NfcGFyc2VfZHNjX2RwY2QuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdl
bmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZy
YW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmggfCAgMyArKwogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYyAgIHwgMzEgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKaW5kZXggYzM2ZmU2MTdlYWM0Li4xMjI4NDQ5YmNh
ODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uaApAQCAtMjY4LDYgKzI2OCw5IEBAIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yIHsK
IAlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0OwogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVj
dG9yICptc3RfcG9ydDsKIAlzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKm1zdF9lbmNvZGVyOworI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJc3RydWN0IGRybV9kcF9hdXggKmRz
Y19hdXg7CisjZW5kaWYKIAogCS8qIFRPRE8gc2VlIGlmIHdlIGNhbiBtZXJnZSB3aXRoIGRkY19i
dXMgb3IgbWFrZSBhIGRtX2Nvbm5lY3RvciAqLwogCXN0cnVjdCBhbWRncHVfaTJjX2FkYXB0ZXIg
KmkyYzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKaW5kZXggNGUxYmJmNWJiZTc3Li4zNzliYzVmMzg4
ZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBAIC0yNSw2ICsyNSw3IEBACiAKICNpbmNsdWRl
IDxsaW51eC92ZXJzaW9uLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSAiZG1fc2VydmljZXMu
aCIKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKQEAgLTE4OSw2
ICsxOTAsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGRtX2Rw
X21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRncHVfZG1f
bXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAogfTsKIAorI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCitzdGF0aWMgYm9vbCB2YWxpZGF0ZV9kc2NfY2Fwc19vbl9jb25u
ZWN0b3Ioc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpCit7CisJc3RydWN0
IGRjX3NpbmsgKmRjX3NpbmsgPSBhY29ubmVjdG9yLT5kY19zaW5rOworCXN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKnBvcnQgPSBhY29ubmVjdG9yLT5wb3J0OworCXU4IGRzY19jYXBzWzE2XSA9IHsg
MCB9OworCisJYWNvbm5lY3Rvci0+ZHNjX2F1eCA9IGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9y
dChwb3J0KTsKKworCWlmICghYWNvbm5lY3Rvci0+ZHNjX2F1eCkKKwkJcmV0dXJuIGZhbHNlOwor
CisJaWYgKGRybV9kcF9kcGNkX3JlYWQoYWNvbm5lY3Rvci0+ZHNjX2F1eCwgRFBfRFNDX1NVUFBP
UlQsIGRzY19jYXBzLCAxNikgPCAwKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoIWRjX2RzY19w
YXJzZV9kc2NfZHBjZChkc2NfY2FwcywgTlVMTCwgJmRjX3NpbmstPnNpbmtfZHNjX2NhcHMuZHNj
X2RlY19jYXBzKSkKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisjZW5kaWYK
Kwogc3RhdGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCiB7CiAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSB0
b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CkBAIC0yMzEsMTAgKzI1NCwxNiBAQCBz
dGF0aWMgaW50IGRtX2RwX21zdF9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikKIAkJLyogZGNfbGlua19hZGRfcmVtb3RlX3NpbmsgcmV0dXJucyBhIG5ldyByZWZlcmVu
Y2UgKi8KIAkJYWNvbm5lY3Rvci0+ZGNfc2luayA9IGRjX3Npbms7CiAKLQkJaWYgKGFjb25uZWN0
b3ItPmRjX3NpbmspCisJCWlmIChhY29ubmVjdG9yLT5kY19zaW5rKSB7CiAJCQlhbWRncHVfZG1f
dXBkYXRlX2ZyZWVzeW5jX2NhcHMoCiAJCQkJCWNvbm5lY3RvciwgYWNvbm5lY3Rvci0+ZWRpZCk7
CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorCQkJaWYgKCF2YWxpZGF0
ZV9kc2NfY2Fwc19vbl9jb25uZWN0b3IoYWNvbm5lY3RvcikpCisJCQkJbWVtc2V0KCZhY29ubmVj
dG9yLT5kY19zaW5rLT5zaW5rX2RzY19jYXBzLAorCQkJCSAgICAgICAwLCBzaXplb2YoYWNvbm5l
Y3Rvci0+ZGNfc2luay0+c2lua19kc2NfY2FwcykpOworI2VuZGlmCisJCX0KIAl9CiAKIAlkcm1f
Y29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
