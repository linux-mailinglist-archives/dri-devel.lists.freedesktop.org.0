Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C35B6D8C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B331772AD3;
	Wed, 18 Sep 2019 20:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790073.outbound.protection.outlook.com [40.107.79.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F38B72AD8;
 Wed, 18 Sep 2019 20:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJM6ZbrA79GOTDUhvuF2OZSfyb3eDmlXU44eAHZtIG51nrczMw+JjFJp7kHZcLm2OKjFP+8U5W0jAxduREtztrnm4CMqDl+D3jpv1XCZJ3zvLy0o8Jo1HIZcVkGjRR7QKX+DVm90K4jPFKLy6qjzWyHgGk9GaSS3mZqbWKwK7f+DXWWLKrE5E8cqJmTEb1No2gwPyWAf+cpHnQvbwtzx+uzKOEpcpDWELHPf/aXbiQrEfcttKGf0OUcR1LAP0a57KNnV7Hlma05vB1LfN/Q9HP78JxypnTc5vTXdLz3Kp+zSavOb7mPRm0Xli3/NZI7EcUrO57r+pc06l8VtmVFgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBUJ6MopyKhKKt2qADhdxvMQgle3PUKPj1PGFMpfroE=;
 b=IExbyMLkJx+/THy3/boe48rGS9f8zTxFKUiONyjghEszcbGKpApskhcmfLs9hurbvob5mOzMTbbdvywabLAZDI8Wclx8rgzNAcf/TQa38/ar9kj4yvAIxx81VM1a09glodh1dX+A9oB315hbZlTjQn11411E+lLW/NcAy0xXzXdSKSw2tGYSEnj2BuGWyz8mGEQppw1C7z7JTDBkzyhE+7j2217kgwDACQLGtd3nwbRjctn2Kt7d22d/Kpn7/rr6Efi0QBCIQ845FXqKzMtPUgHEumNq1PlugMqZvKy1Q39ez3buaniliwZrXSkMosJlP52LdCDEyUUefAKsaTRRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0025.namprd12.prod.outlook.com (2603:10b6:610:57::35)
 by CY4PR1201MB2532.namprd12.prod.outlook.com (2603:10b6:903:d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Wed, 18 Sep
 2019 20:27:17 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CH2PR12CA0025.outlook.office365.com
 (2603:10b6:610:57::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:16 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:15 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/15] drm/amdgpu: Add connector atomic check
Date: Wed, 18 Sep 2019 16:26:39 -0400
Message-ID: <c33861b3983fe3bb3dbd9c7026cec960f4ce1a6e.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(428003)(189003)(199004)(16586007)(316002)(2906002)(70586007)(53416004)(486006)(76176011)(7696005)(51416003)(356004)(6666004)(70206006)(118296001)(14444005)(6916009)(305945005)(446003)(48376002)(4326008)(86362001)(2876002)(47776003)(476003)(11346002)(126002)(426003)(2351001)(50226002)(36756003)(26005)(50466002)(8676002)(336012)(186003)(5660300002)(2616005)(54906003)(8936002)(478600001)(81156014)(81166006)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2532; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61ac8b3a-a92c-4e9c-e08b-08d73c7698e8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR1201MB2532; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2532:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25320B3868A77671D6520CDEE48E0@CY4PR1201MB2532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: U3pa1shSdMug6ImuM1EbqYpI/+0MN2woRHQnNt5JOoaWUJd5MkAY4pFrn9GFQqB++ooMW4MfmLp/YKOL2OZD60+4RMfutxn3/DTevWLi+Vfw1RzKDwU6+oHGJaDzfeUMRs1IW8jzzkyTMJd0fA+czgWI4NXxyoanewE58dMZTPMaygv1tsOv8YGALjzjROGlT1fbPo2dCXxiIuoWiF9qoXWIVoXCl6Ekryih8aVbfnb0C+511WoXfLrN49QWGKBVrauQY9PyaaP6YYuvpAbv6BYK5BzyJ/VJZWLExm5W1512xwVQFqTdE/HZt+JrZIu4nvx57Z31oiauxLs1NO4Ur5r6PYLDeJ89ebPJENSb3Nu2GbyZbtCDBH1KVQVWNQtXpEnXk/1LTtHkiBySHWhz0g1O0pKLpWjt+KS+lKycsSs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:16.4389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ac8b3a-a92c-4e9c-e08b-08d73c7698e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBUJ6MopyKhKKt2qADhdxvMQgle3PUKPj1PGFMpfroE=;
 b=z9J2ky6omAukJOa72BqadkUXtGYHWoYBHlPin9ZlBuNPMYyZWv13WdE2YH2tl3olsq6v2WfyANxTDk36/nuQf71JCiDor8dUMXwVOUcV40ZQIy7f0eD15Il2zF39HWFJYYR14obZ4pWnHKe+X3yfgzHZxeWspNSSgq3eY4xmgDY=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KQ29tcGx5
aW5nIHdpdGggbmV3IE1TVCBhdG9taWMgY2hlY2sgcmVxdWlyZW1lbnRzLgpUaGUgZHJpdmVyIG5l
ZWRzIHRvIGNhbGwgdGhpcyBmdW5jdGlvbiBvbiBldmVyeQphdG9taWMgY2hlY2sgdG8gcmVzZXQg
dGhlIFZDUEkgc2xvdHMgaWYgbmV3IHN0YXRlCmRpc2FibGVzCltob3ddCi0gVmVyaWZ5IHRoYXQg
aXQgaXMgYSBNU1QgY29ubmVjdGlvbgotIFZlcmlmeSB0aGF0IG9sZCBjcnRjIHN0YXRlIGV4aXN0
cwotIFZlcmlmeSB0aGUgbmV3IGNydGMgc3RhdGUgZGlzYWJsZXMgc2luawotIFJlbGVhc2UgVkNQ
SSBzbG90cyBvbiB0aGUgcG9ydAoKQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClNp
Z25lZC1vZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiAu
Li4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jICAgfCAzNCArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90
eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMKaW5kZXggMTYyMThhMjAyYjU5Li40ZTFiYmY1YmJlNzcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBl
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X21zdF90eXBlcy5jCkBAIC0yNTIsMTAgKzI1Miw0NCBAQCBzdGF0aWMgc3RydWN0IGRybV9lbmNv
ZGVyICpkbV9tc3RfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ip
CiAJcmV0dXJuICZhbWRncHVfZG1fY29ubmVjdG9yLT5tc3RfZW5jb2Rlci0+YmFzZTsKIH0KIAor
c3RhdGljIGludCBkbV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCisJCQkJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKm5ld19jb25uX3N0YXRl
KQoreworCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSA9IG5ld19jb25uX3N0YXRlLT5z
dGF0ZTsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqb2xkX2Nvbm5fc3RhdGUgPQorCQkJ
ZHJtX2F0b21pY19nZXRfb2xkX2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yKTsKKwlz
dHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25u
ZWN0b3IoY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRl
OworCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbXN0X21ncjsKKwlzdHJ1Y3QgZHJt
X2RwX21zdF9wb3J0ICptc3RfcG9ydDsKKworCWlmICghYWNvbm5lY3RvciB8fCAhYWNvbm5lY3Rv
ci0+cG9ydCkKKwkJcmV0dXJuIDA7CisKKwltc3RfcG9ydCA9IGFjb25uZWN0b3ItPnBvcnQ7CisJ
bXN0X21nciA9ICZhY29ubmVjdG9yLT5tc3RfcG9ydC0+bXN0X21ncjsKKworCWlmICghb2xkX2Nv
bm5fc3RhdGUtPmNydGMpCisJCXJldHVybiAwOworCisJaWYgKG5ld19jb25uX3N0YXRlLT5jcnRj
KSB7CisJCW5ld19jcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUoc3Rh
dGUsIG5ld19jb25uX3N0YXRlLT5jcnRjKTsKKwkJaWYgKCFuZXdfY3J0Y19zdGF0ZSB8fAorCQkg
ICAgIWRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KG5ld19jcnRjX3N0YXRlKSB8fAorCQkg
ICAgbmV3X2NydGNfc3RhdGUtPmVuYWJsZSkKKwkJCXJldHVybiAwOworCQl9CisKKwlyZXR1cm4g
ZHJtX2RwX2F0b21pY19yZWxlYXNlX3ZjcGlfc2xvdHMoc3RhdGUsCisJCQkJCQltc3RfbWdyLAor
CQkJCQkJbXN0X3BvcnQpOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jf
aGVscGVyX2Z1bmNzIGRtX2RwX21zdF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRf
bW9kZXMgPSBkbV9kcF9tc3RfZ2V0X21vZGVzLAogCS5tb2RlX3ZhbGlkID0gYW1kZ3B1X2RtX2Nv
bm5lY3Rvcl9tb2RlX3ZhbGlkLAogCS5iZXN0X2VuY29kZXIgPSBkbV9tc3RfYmVzdF9lbmNvZGVy
LAorCS5hdG9taWNfY2hlY2sgPSBkbV9kcF9tc3RfYXRvbWljX2NoZWNrLAogfTsKIAogc3RhdGlj
IHZvaWQgYW1kZ3B1X2RtX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
