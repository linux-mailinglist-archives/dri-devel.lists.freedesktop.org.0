Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DDF3335
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACDC6F715;
	Thu,  7 Nov 2019 15:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE4B89C6C;
 Thu,  7 Nov 2019 15:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+DJWoDPaQNDlPggSsEiB31gPP9Z3NFr70xdID2kMa30tad+LQvKRDeRbOz/fRxbIOm37jc0SUJIuu0DY2+AxSES6inD4eXjrdOeWSolU9w+jduYT6yMEnHI66PSP8KRbPkBsLDOzQGuPaPPXdl35Zqd6ntD+qEKWUAmQnEj7z0BLcq5QIV1qDBGQtBgBZjUQZc2pgH5bYrn206MfIDOYZHAdBa4hVeop/QLu2lNgQALVEm6FeKNCjWqtj22AWkHa1MwULg2S/F9NFqXdgAggcxBDIdP3F2K2RHlfwfR8pKhLCK2bWV4++Mcs311VbW0SD1gf8uuq+XLD0cMXssfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDahGbodcZkrdxllRCGxxiEsvpSv+MkbzmcBRat875k=;
 b=Wx8CsHxP5s7MbGDaXVjZmjTJeO4Nm721ZLqvFiXA6TrumD8Ed/iCuH3kjyxd37n2k662n9Ht/gQnS3Ae0E4E8GuFXGcXLLQ7PN0+CuCCGcZBfHAF1fge7DH1vRTrEZhqNserdn7HpExshVzhwo7A9vzPDGJQLyOxSBsFjS4eiX/2ms/bJJCzTAlDzwbgaBUMJA3wWSGIJMB6006rT5vs/hRV7m5CQsl8rgLqV7PhysDBYsltVUxNa0uWRW96pDPFkKsQzawfsBfsfGq3GnRUs1JRJo0ZNY40/mHHnibqHIEOl1gf6Hc7Y5hj03B1gaSXpSiuZt7cTkrBAxnKKRCt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0016.namprd12.prod.outlook.com (2603:10b6:4:1::26) by
 BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 15:32:29 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0016.outlook.office365.com
 (2603:10b6:4:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:29 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:27 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:27 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 11/13] drm/dp_mst: Add branch bandwidth validation to MST
 atomic check
Date: Thu, 7 Nov 2019 10:32:10 -0500
Message-ID: <20191107153212.1145-12-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(428003)(189003)(199004)(81166006)(51416003)(336012)(14444005)(2906002)(2351001)(426003)(2876002)(316002)(47776003)(16586007)(8676002)(76176011)(26005)(53416004)(478600001)(54906003)(186003)(86362001)(1076003)(36756003)(5660300002)(7696005)(48376002)(486006)(70206006)(11346002)(70586007)(356004)(4326008)(6916009)(476003)(2616005)(81156014)(8936002)(6666004)(126002)(305945005)(50226002)(50466002)(446003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3479; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 043f19e5-f5f9-43f9-014e-08d76397b330
X-MS-TrafficTypeDiagnostic: BYAPR12MB3479:
X-Microsoft-Antispam-PRVS: <BYAPR12MB34794D500D2AA054F7625096E4780@BYAPR12MB3479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owHZ8ZC2xruG7zn6qESs2bxM98/01n2fZUqBo6z54g/80fX22dgpcJYUVnX79jm6SN6ZrGyrdCjRT79UuQO2BuwSTsMFcxZCzYy78iYPvo8FCm63uD9UfvTIPgy8VbCRn7tsZi76eUji/20t+72x1ZPheudFp2WkWjWmScWz3DS3/i6llRf4fD6V608zT9fbqBEH6Sqg/VKOl3MQ83ZWbialcwlRr5TMlgeqieFZwA9XhMFgE65IvFgR9b8f4ZbSgwwVcNB4144JMTBjsHBMjKZe5vHoQRZMxgpxO9vSXZPc9ypvOI7W+Z0xy4rHw3ZDoSMDJ9qNJkUeIj5Y6fGERiODPYHEmZfCD3FJG3q3d3/uZlWwQm6RCU262c56QYXWmUg91MfkmEioAyjR1GxPre8VGxWYq0ujuarYJwXyPRkU9Vm69mxzTdaqlzPZj1w8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:29.2773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 043f19e5-f5f9-43f9-014e-08d76397b330
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3479
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDahGbodcZkrdxllRCGxxiEsvpSv+MkbzmcBRat875k=;
 b=gRCyzDEFsmVevk9W/duRw0vpZiZGA2iclUUfcUos/ujqGIQRYSO5cko/7zQc31WlVYDMysPwLxp0GWJBedY9GUkJijNZGAuR3BdGsauPGJMVCtieVC5qsvXa4ROclS+pZjdk3Xn2C8488YFWi7HFYAEOPIM83W6OpcCsy0r0dVM=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKQWRkaW5nIFBCTiBh
dHRyaWJ1dGUgdG8gZHJtX2RwX3ZjcGlfYWxsb2NhdGlvbiBzdHJ1Y3R1cmUgdG8Ka2VlcCB0cmFj
ayBvZiBob3cgbXVjaCBiYW5kd2lkdGggZWFjaCBQb3J0IHJlcXVpcmVzLgpBZGRpbmcgZHJtX2Rw
X21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQgdG8gdmVyaWZ5IHRoYXQKc3RhdGUncyBiYW5kd2lk
dGggbmVlZHMgZG9lc24ndCBleGNlZWQgYXZhaWxhYmxlIGJhbmR3aWR0aC4KVGhlIGZ1bnRpb24g
aXMgY2FsbGVkIGluIGRybV9kcF9tc3RfYXRvbWljX2NoZWNrIGFmdGVyCmRybV9kcF9tc3RfYXRv
bWljX2NoZWNrX3RvcG9sb2d5X3N0YXRlIHRvIGZ1bGx5IHZlcmlmeSB0aGF0CnRoZSBwcm9wb3Nl
ZCB0b3BvbG9neSBpcyBzdXBwb3J0ZWQuCgpDYzogSmVycnkgWnVvIDxKZXJyeS5adW9AYW1kLmNv
bT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlr
aXRhLmxpcHNraUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgfCA2OCArKysrKysrKysrKysrKysrKysrKysrKysrLS0KIGluY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmggICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMK
aW5kZXggODZlMjBkYmYzY2NlLi4yZTQ0ZGZkYTBmYmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwpAQCAtMzI0MSw3ICszMjQxLDcgQEAgaW50IGRybV9kcF9hdG9taWNfZmlu
ZF92Y3BpX3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIHsKIAlzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqdG9wb2xvZ3lfc3RhdGU7CiAJc3RydWN0IGRybV9k
cF92Y3BpX2FsbG9jYXRpb24gKnBvcywgKnZjcGkgPSBOVUxMOwotCWludCBwcmV2X3Nsb3RzLCBy
ZXFfc2xvdHMsIHJldDsKKwlpbnQgcHJldl9zbG90cywgcHJldl9idywgcmVxX3Nsb3RzLCByZXQ7
CiAKIAl0b3BvbG9neV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X21zdF90b3BvbG9neV9zdGF0ZShz
dGF0ZSwgbWdyKTsKIAlpZiAoSVNfRVJSKHRvcG9sb2d5X3N0YXRlKSkKQEAgLTMyNTIsNiArMzI1
Miw3IEBAIGludCBkcm1fZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyhzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUsCiAJCWlmIChwb3MtPnBvcnQgPT0gcG9ydCkgewogCQkJdmNwaSA9IHBv
czsKIAkJCXByZXZfc2xvdHMgPSB2Y3BpLT52Y3BpOworCQkJcHJldl9idyA9IHZjcGktPnBibjsK
IAogCQkJLyoKIAkJCSAqIFRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbiwgdW5sZXNzIHRoZSBkcml2
ZXIgdHJpZXMKQEAgLTMyNjcsMTQgKzMyNjgsMTggQEAgaW50IGRybV9kcF9hdG9taWNfZmluZF92
Y3BpX3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCWJyZWFrOwogCQl9
CiAJfQotCWlmICghdmNwaSkKKwlpZiAoIXZjcGkpIHsKIAkJcHJldl9zbG90cyA9IDA7Ci0KKwkJ
cHJldl9idyA9IDA7CisJfQogCXJlcV9zbG90cyA9IERJVl9ST1VORF9VUChwYm4sIG1nci0+cGJu
X2Rpdik7CiAKIAlEUk1fREVCVUdfQVRPTUlDKCJbQ09OTkVDVE9SOiVkOiVzXSBbTVNUIFBPUlQ6
JXBdIFZDUEkgJWQgLT4gJWRcbiIsCiAJCQkgcG9ydC0+Y29ubmVjdG9yLT5iYXNlLmlkLCBwb3J0
LT5jb25uZWN0b3ItPm5hbWUsCiAJCQkgcG9ydCwgcHJldl9zbG90cywgcmVxX3Nsb3RzKTsKKwlE
Uk1fREVCVUdfQVRPTUlDKCJbQ09OTkVDVE9SOiVkOiVzXSBbTVNUIFBPUlQ6JXBdIFBCTiAlZCAt
PiAlZFxuIiwKKwkJCSBwb3J0LT5jb25uZWN0b3ItPmJhc2UuaWQsIHBvcnQtPmNvbm5lY3Rvci0+
bmFtZSwKKwkJCSBwb3J0LCBwcmV2X2J3LCBwYm4pOwogCiAJLyogQWRkIHRoZSBuZXcgYWxsb2Nh
dGlvbiB0byB0aGUgc3RhdGUgKi8KIAlpZiAoIXZjcGkpIHsKQEAgLTMyODcsNiArMzI5Miw3IEBA
IGludCBkcm1fZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUsCiAJCWxpc3RfYWRkKCZ2Y3BpLT5uZXh0LCAmdG9wb2xvZ3lfc3RhdGUtPnZjcGlz
KTsKIAl9CiAJdmNwaS0+dmNwaSA9IHJlcV9zbG90czsKKwl2Y3BpLT5wYm4gPSBwYm47CiAKIAly
ZXQgPSByZXFfc2xvdHM7CiAJcmV0dXJuIHJldDsKQEAgLTM4MzIsNiArMzgzOCw1OSBAQCBzdGF0
aWMgdm9pZCBkcm1fZHBfbXN0X2Rlc3Ryb3lfc3RhdGUoc3RydWN0IGRybV9wcml2YXRlX29iaiAq
b2JqLAogCWtmcmVlKG1zdF9zdGF0ZSk7CiB9CiAKK3N0YXRpYyBib29sIGRybV9kcF9tc3RfcG9y
dF9kb3duc3RyZWFtX29mX2JyYW5jaChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0LAorCQkJ
CQkJIHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqYnJhbmNoKQoreworCXdoaWxlIChwb3J0LT5w
YXJlbnQpIHsKKwkJaWYgKHBvcnQtPnBhcmVudCA9PSBicmFuY2gpCisJCQlyZXR1cm4gdHJ1ZTsK
KworCQlpZiAocG9ydC0+cGFyZW50LT5wb3J0X3BhcmVudCkKKwkJCXBvcnQgPSBwb3J0LT5wYXJl
bnQtPnBvcnRfcGFyZW50OworCQllbHNlCisJCQlicmVhazsKKwl9CisJcmV0dXJuIGZhbHNlOwor
fQorCitzdGF0aWMgaW5saW5lCitpbnQgZHJtX2RwX21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQo
c3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICpicmFuY2gsCisJCQkJICAgICBzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9zdGF0ZSAqbXN0X3N0YXRlKQoreworCXN0cnVjdCBkcm1fZHBfbXN0X3Bv
cnQgKnBvcnQ7CisJc3RydWN0IGRybV9kcF92Y3BpX2FsbG9jYXRpb24gKnZjcGk7CisJaW50IHBi
bl9saW1pdCA9IDAsIHBibl91c2VkID0gMDsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkocG9ydCwg
JmJyYW5jaC0+cG9ydHMsIG5leHQpIHsKKwkJaWYgKHBvcnQtPm1zdGIpIHsKKwkJCWlmIChkcm1f
ZHBfbXN0X2F0b21pY19jaGVja19id19saW1pdChwb3J0LT5tc3RiLCBtc3Rfc3RhdGUpKQorCQkJ
CXJldHVybiAtRUlOVkFMOworCQl9CisJCWlmIChwb3J0LT5hdmFpbGFibGVfcGJuID4gMCkKKwkJ
CXBibl9saW1pdCA9IHBvcnQtPmF2YWlsYWJsZV9wYm47CisJfQorCURSTV9ERUJVR19BVE9NSUMo
IltNU1QgQlJBTkNIOiVwXSBicmFuY2ggaGFzICVkIFBCTiBhdmFpbGFibGVcbiIsCisJCQkJCSBi
cmFuY2gsCisJCQkJCSBwYm5fbGltaXQpOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeSh2Y3BpLCAm
bXN0X3N0YXRlLT52Y3BpcywgbmV4dCkgeworCQlpZiAoIXZjcGktPnBibikKKwkJCWNvbnRpbnVl
OworCisJCWlmIChkcm1fZHBfbXN0X3BvcnRfZG93bnN0cmVhbV9vZl9icmFuY2godmNwaS0+cG9y
dCwgYnJhbmNoKSkKKwkJCXBibl91c2VkICs9IHZjcGktPnBibjsKKwl9CisJRFJNX0RFQlVHX0FU
T01JQygiW01TVCBCUkFOQ0g6JXBdIGJyYW5jaCB1c2VkICVkIFBCTlxuIiwKKwkJCSBicmFuY2gs
CisJCQkgcGJuX2xpbWl0KTsKKwlpZiAocGJuX3VzZWQgPiBwYm5fbGltaXQpIHsKKwkJRFJNX0RF
QlVHX0FUT01JQygiW01TVCBCUkFOQ0g6JXBdIE5vIGF2YWlsYWJsZSBiYW5kd2lkdGhcbiIsCisJ
CQkJIGJyYW5jaCk7CisJCXJldHVybiAtRUlOVkFMOworCX0KKwlyZXR1cm4gMDsKK30KKwogc3Rh
dGljIGlubGluZSBpbnQKIGRybV9kcF9tc3RfYXRvbWljX2NoZWNrX3RvcG9sb2d5X3N0YXRlKHN0
cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJCSAgICAgICBzdHJ1Y3QgZHJt
X2RwX21zdF90b3BvbG9neV9zdGF0ZSAqbXN0X3N0YXRlKQpAQCAtMzk3OCw2ICs0MDM3LDkgQEAg
aW50IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSkKIAkJcmV0ID0gZHJtX2RwX21zdF9hdG9taWNfY2hlY2tfdG9wb2xvZ3lfc3RhdGUobWdyLCBt
c3Rfc3RhdGUpOwogCQlpZiAocmV0KQogCQkJYnJlYWs7CisJCXJldCA9IGRybV9kcF9tc3RfYXRv
bWljX2NoZWNrX2J3X2xpbWl0KG1nci0+bXN0X3ByaW1hcnksIG1zdF9zdGF0ZSk7CisJCWlmIChy
ZXQpCisJCQlicmVhazsKIAl9CiAKIAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgK
aW5kZXggMGE5YWVkMWMwMGZmLi4wOGRlNzExZjM4YjAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIu
aApAQCAtNDMxLDYgKzQzMSw3IEBAIHN0cnVjdCBkcm1fZHBfcGF5bG9hZCB7CiBzdHJ1Y3QgZHJt
X2RwX3ZjcGlfYWxsb2NhdGlvbiB7CiAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKIAlp
bnQgdmNwaTsKKwlpbnQgcGJuOwogCWJvb2wgZHNjX2VuYWJsZWQ7CiAJc3RydWN0IGxpc3RfaGVh
ZCBuZXh0OwogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
