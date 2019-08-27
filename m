Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085C9EA95
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427D89BCD;
	Tue, 27 Aug 2019 14:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800089.outbound.protection.outlook.com [40.107.80.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74AF89BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RinhXnq8IyDVS35r8P0nIi65wMDZ7w2O+jJDtt0hhdQacKecXZcyeGx78csXWL4HAivyu2dmFEaIZaJDhTckqhZ7bM59p20B1cxhNEsbj6VdrE42yyKUD88TC5NbHsuCYbWUopj1ymJse3/Dik7D9x7mrv4UboDaAkp1Q+RhjEs7imqu5sLHGPxiVhjaACZL/xe4knWk9phMZuo2Mq8+2XVl32vkZbDesuONQEoS+/j7DjqNeF2+CVIs01xRJzr10mxDER07xT+uJbVpUWLdnOYpf+mymiFhGu3Mp7w6C1EEocAXfEoo8xS/3BoKtVhuNzHTsvoOPgMdQdtusEvHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qBLjLZxGeeYLEGdGSvbiw43tHYJTyUvDcrRzLNxpm0=;
 b=X9uk5BJj46j+ZdMNrwvyQQzvn8rVx+J6Vd9lWT5v22hfhuLmRT4pT/SyND7RmXggfKe93QZSce1S5QOfpE9h8kLHDMFqWYelfSwmSy1ai8KzXViwkT6+N63MFVjcOubGhM4OZC0sEgMrhLAeLA7OFlePJ1Qa84/LEcwcy1UvUx+2DvlGRqUID2pru7fndMEV2vRg8eNVGMA8nB1dt+gSJRhjPSx3LtKA0oa4BHnyvY1tU9uXKh4O0YcpguPn5QEF00T6vKXjKjjDEMAnmG4gFJi798qOB1+UYfmgWGCEv8GJvaEVZ1emKHLI7o8rrimYGWif3+BR7NjYPhYPu8TlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:405:4c::20) by DM6PR12MB2715.namprd12.prod.outlook.com
 (2603:10b6:5:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Tue, 27 Aug
 2019 14:13:38 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by BN6PR1201CA0010.outlook.office365.com
 (2603:10b6:405:4c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 14:13:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 14:13:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 27 Aug 2019 09:13:32 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Tue, 27 Aug 2019 10:13:28 -0400
Message-ID: <20190827141329.30767-6-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827141329.30767-1-David.Francis@amd.com>
References: <20190827141329.30767-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(426003)(446003)(2351001)(305945005)(14444005)(2906002)(8936002)(4326008)(50226002)(48376002)(316002)(6666004)(50466002)(53936002)(16586007)(356004)(54906003)(51416003)(76176011)(86362001)(2616005)(26005)(1076003)(186003)(478600001)(5660300002)(49486002)(6916009)(47776003)(486006)(70206006)(81156014)(36756003)(336012)(11346002)(126002)(70586007)(476003)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 615b7ad1-2fe6-4c9f-d703-08d72af8c184
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB271584990AC1428F66C64B8BEFA00@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GtI4SD6rvU3lCgAzN8HjkUBMtDgF8Oel/+RUO+qTAgBlyjc0B7Udgr3NAufKDb3RVHqF77faQ+fSwVJEtZ9z174Xptoru9L/1NNQveW3NwOw9kKrq75XIbipJOnVqHcQ6hesyEFHQImfwklDqBeRvYUo9O9Tp4/teANPGhMMmg5VsbZ0ohAdctoiE6OSBmq+mu2ubT3f0dz/wRaKLeOCkQ7nNzNy3koZZYksCEL311Pskgl7bfamll6qfXHwZyJco3EzfL/Sd6Qyjj+N5LhtSp5msiESsAmw1Kmrk9dEf98UEZynanUCXcg8SgXr/GuGUutwfZ3iGUjj6PtGiOcLfhJPinTR7fC1dtEDJtv6/E6TmH9BdlUTg2e31tVDyV+TFlpVpN16pd8EI7GfJXuncIfyshu4MaGOGC8epjye8/8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 14:13:37.9946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 615b7ad1-2fe6-4c9f-d703-08d72af8c184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qBLjLZxGeeYLEGdGSvbiw43tHYJTyUvDcrRzLNxpm0=;
 b=HCowOkO1eokFc50PgZcxNmRRtK8HR72Ff/admDC0S2YsbGdzPvkkd9u//4cnukzu0iBEYvlzt7xOQGJ4mvCPg7qLxeZCl8/FQWS3dIh2SQRkLT9CHJWBhERiz9tukss9NPFcY01A04EeUDvenvh86iN1fHXq86tBUCBQZcsWrt8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3luYXB0aWNzIERQMS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQg
dmlydHVhbCBEUENEIHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMg
Y2FuIGJlIHJlYWQgZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNl
IGh1YnMgaGF2ZSBtYW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRv
IGRldGVjdCB0aGlzIGNhc2UuCgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFdlbmppbmcgTGl1IDxX
ZW5qaW5nLkxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5G
cmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDIg
KysKIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCA3ICsrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggMmNj
MjFlZmY0Y2YzLi5mYzM5MzIzZTdkNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMTI3
MCw2ICsxMjcwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcGNkX3F1aXJrIGRwY2RfcXVpcmtf
bGlzdFtdID0gewogCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxz
ZSwgQklUKERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9LAogCS8qIENINzUxMSBzZWVtcyB0byBsZWF2
ZSBTSU5LX0NPVU5UIHplcm9lZCAqLwogCXsgT1VJKDB4MDAsIDB4MDAsIDB4MDApLCBERVZJQ0Vf
SUQoJ0MnLCAnSCcsICc3JywgJzUnLCAnMScsICcxJyksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlS
S19OT19TSU5LX0NPVU5UKSB9LAorCS8qIFN5bmFwdGljcyBEUDEuNCBNU1QgaHVicyBjYW4gc3Vw
cG9ydCBEU0Mgd2l0aG91dCB2aXJ0dWFsIERQQ0QgKi8KKwl7IE9VSSgweDkwLCAweENDLCAweDI0
KSwgREVWSUNFX0lEX0FOWSwgdHJ1ZSwgQklUKERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklS
VFVBTF9EUENEKSB9LAogfTsKIAogI3VuZGVmIE9VSQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IDgzNjQ1
MDJmOTJjZi4uYTEzMzFiMDg3MDVmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBAIC0xNDM0LDYgKzE0MzQs
MTMgQEAgZW51bSBkcm1fZHBfcXVpcmsgewogCSAqIFRoZSBkcml2ZXIgc2hvdWxkIGlnbm9yZSBT
SU5LX0NPVU5UIGR1cmluZyBkZXRlY3Rpb24uCiAJICovCiAJRFBfRFBDRF9RVUlSS19OT19TSU5L
X0NPVU5ULAorCS8qKgorCSAqIEBEUF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBD
RDoKKwkgKgorCSAqIFRoZSBkZXZpY2Ugc3VwcG9ydHMgTVNUIERTQyBkZXNwaXRlIG5vdCBzdXBw
b3J0aW5nIFZpcnR1YWwgRFBDRC4KKwkgKiBUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQgZnJvbSB0
aGUgcGh5c2ljYWwgYXV4IGluc3RlYWQuCisJICovCisJRFBfRFBDRF9RVUlSS19EU0NfV0lUSE9V
VF9WSVJUVUFMX0RQQ0QsCiB9OwogCiAvKioKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
