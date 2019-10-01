Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45740C3A38
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97ED6E850;
	Tue,  1 Oct 2019 16:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720042.outbound.protection.outlook.com [40.107.72.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A8D6E84B;
 Tue,  1 Oct 2019 16:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImjmfSCFElzQHDG5devgSObcv3JAiMOEUri5A/04HoU0YilAwJNwEuuPwXYL+RGKvJfLllnOIGrlvzSL9IIuCCJ8Av1BnVilId5Fs3YEr3YaGw2vUN/mxp7vmZsgE2mYnldwy1nGTFq/T3rpU+f/jxKtuxu9/zN1iqh9Zj3/XX9xwB3rFBXGIQZSwnnGt+zix0mWqDddsJCWhTG52WKgc94kf+sTTEwBpwNoL/RErS08c7UulWKp+7P2vpp0pvNzF5XrxabWwXk4MXbsvEPMdodyNyspicEy9ffsoDXzRUS12fTN9hqlPGuE7PW3rLLeNaxUvQQ5Ql6MItlMTW15Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7xA58T2hbz0F/NcnJeC72jc4UVZ6stnu1hOnr43Geg=;
 b=ejlVRPf7lEiRTveH0BLsBiYVf/sirVBztVAcLfdrC5w3AXNTB7YvfOGAvRFQpodiFZ1HkwVxiB7EH8eQ7K4j+F1ihGCQB4py7z3a5mHmsvzyKRUj2NFTbDpgbUwl+A+k1uP02rBlk0SYTdqRy7FiViOveMzentitIRxQpOq/+fporkRmwK+/ZUAzSKgIZXViL0OB6oTEWy53P2dcHzwpSJ1ghNADTh3ANGXhD0CRDG3E5P8IF5Fp/N+sOaq6mZi2wS+YcRLdkDT1Fi/C9lJQohPLjjPbuLUoodpY85czwLNGQyJD8uh4UXK9RzfcATKWrS2hnljfVceJvdMIjSRfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:208:a8::34)
 by BN8PR12MB2914.namprd12.prod.outlook.com (2603:10b6:408:95::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 16:17:34 +0000
Received: from CO1NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0021.outlook.office365.com
 (2603:10b6:208:a8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT013.mail.protection.outlook.com (10.152.80.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:33 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:33 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/14] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Tue, 1 Oct 2019 12:17:14 -0400
Message-ID: <20191001161721.13793-8-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-7-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(428003)(189003)(199004)(8936002)(450100002)(51416003)(126002)(478600001)(8676002)(2876002)(16586007)(5660300002)(6916009)(2616005)(476003)(486006)(50466002)(4326008)(7696005)(36756003)(305945005)(186003)(70206006)(70586007)(14444005)(54906003)(86362001)(76176011)(47776003)(2906002)(336012)(356004)(446003)(48376002)(26005)(426003)(53416004)(316002)(81156014)(81166006)(6666004)(1076003)(50226002)(2351001)(11346002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2914; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc54d833-2caa-4146-c2ba-08d7468addfe
X-MS-TrafficTypeDiagnostic: BN8PR12MB2914:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2914CECD5EFCFB1963F4A073E49D0@BN8PR12MB2914.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZEoFogv1klxs8c2eluXaUBHuxU7VEqOrKSTlJ744UkthcNz9KJGgCWd41IJzJTl0XByv9AyN04mwJPLjYMbAP2sSoxPfWzoSZCUow5ebKeFUnJIVC0vpP2kW6NdYSt+MzesHfc81qEs1FXFUBlbXtzgzs0YV3yHyMCJ9jPxfpQnxM427KhFXYox40gUuFW7jlY4XZWHGNipAm3FTuPKo7ekGN7lW9MaY6bA0JuOD5Q+f0t77DZmDiqbyxYg99/5KOVQSeQ3x1oiPRCuofkOPlehxfvPp1tyhZLUQk/NGGBH+oF6pcl3wBcgMA6idY6F/OXK/h7qkD7tuQm9Pi/J/hI3obOi88FHNDfA5uT1knx33kDbZRQJNi69DQS8Sa+WnaGANUQVu/itoGoREv65x5iuykv4BbNgBAJdHWSf5PTM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:33.8104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc54d833-2caa-4146-c2ba-08d7468addfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7xA58T2hbz0F/NcnJeC72jc4UVZ6stnu1hOnr43Geg=;
 b=l2hSiFF2T/6J+qYJiegxwnmBLDH6v5L00jei8fzhPcOygIj0PNNJQCyhMvGwEs6kCptRLWvDxX60667PZC4+hVDIZsnGGoZ745n7okLTt02xMYAJCMlH7WnwktPBfr7Zlt6w2AybcGUBXhPkoluBibW0l1PTPJHf86EyyJJdHig=
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKU3luYXB0aWNzIERQ
MS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQgdmlydHVhbCBEUENE
IHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQg
ZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNlIGh1YnMgaGF2ZSBt
YW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRvIGRldGVjdCB0aGlz
IGNhc2UuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9oZWxwZXIuYyAgICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgIHwgIDcgKysrKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggYWYxY2Q5Njhh
ZGZkLi4wMmZhOGMzZDlhODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMTI3MSw2ICsx
MjcxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcGNkX3F1aXJrIGRwY2RfcXVpcmtfbGlzdFtd
ID0gewogCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0VfSURfQU5ZLCBmYWxzZSwgQklU
KERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9LAogCS8qIENINzUxMSBzZWVtcyB0byBsZWF2ZSBTSU5L
X0NPVU5UIHplcm9lZCAqLwogCXsgT1VJKDB4MDAsIDB4MDAsIDB4MDApLCBERVZJQ0VfSUQoJ0Mn
LCAnSCcsICc3JywgJzUnLCAnMScsICcxJyksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19T
SU5LX0NPVU5UKSB9LAorCS8qIFN5bmFwdGljcyBEUDEuNCBNU1QgaHVicyBjYW4gc3VwcG9ydCBE
U0Mgd2l0aG91dCB2aXJ0dWFsIERQQ0QgKi8KKwl7IE9VSSgweDkwLCAweENDLCAweDI0KSwgREVW
SUNFX0lEX0FOWSwgdHJ1ZSwgQklUKERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9E
UENEKSB9LAogfTsKIAogI3VuZGVmIE9VSQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKaW5kZXggZDhmOWJhMjdiNTU5Li5kNWRmMDIzMTVlMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwpAQCAtNDIyMiw2ICs0MjIyLDcgQEAgc3RydWN0IGRybV9kcF9hdXgg
KmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0
KQogewogCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKmltbWVkaWF0ZV91cHN0cmVhbV9wb3J0Owog
CXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKmZlY19wb3J0OworCXN0cnVjdCBkcm1fZHBfZGVzYyBk
ZXNjID0geyAwIH07CiAKIAlpZiAoIXBvcnQpCiAJCXJldHVybiBOVUxMOwpAQCAtNDI3NCw2ICs0
Mjc1LDMyIEBAIHN0cnVjdCBkcm1fZHBfYXV4ICpkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQo
c3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCkKIAlpZiAoZHJtX2RwX21zdF9pc192aXJ0dWFs
X2RwY2QocG9ydCkpCiAJCXJldHVybiAmcG9ydC0+YXV4OwogCisJLyoKKwkgKiBTeW5hcHRpY3Mg
cXVpcmsKKwkgKiBBcHBsaWVzIHRvIHBvcnRzIGZvciB3aGljaDoKKwkgKiAtIFBoeXNpY2FsIGF1
eCBoYXMgU3luYXB0aWNzIE9VSQorCSAqIC0gRFB2MS40IG9yIGhpZ2hlcgorCSAqIC0gUG9ydCBp
cyBvbiBwcmltYXJ5IGJyYW5jaCBkZXZpY2UKKwkgKiAtIE5vdCBhIFZHQSBhZGFwdGVyIChEUF9E
V05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKQorCSAqLworCWlmICghZHJtX2RwX3JlYWRfZGVzYyhw
b3J0LT5tZ3ItPmF1eCwgJmRlc2MsIHRydWUpKQorCQlyZXR1cm4gTlVMTDsKKworCWlmIChkcm1f
ZHBfaGFzX3F1aXJrKCZkZXNjLCBEUF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBD
RCkgJiYKKwkgICAgcG9ydC0+bWdyLT5kcGNkW0RQX0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8x
NCAmJgorCSAgICBwb3J0LT5wYXJlbnQgPT0gcG9ydC0+bWdyLT5tc3RfcHJpbWFyeSkgeworCQl1
OCBkb3duc3RyZWFtcG9ydDsKKworCQlpZiAoZHJtX2RwX2RwY2RfcmVhZCgmcG9ydC0+YXV4LCBE
UF9ET1dOU1RSRUFNUE9SVF9QUkVTRU5ULAorCQkJCSAgICAgJmRvd25zdHJlYW1wb3J0LCAxKSA8
IDApCisJCQlyZXR1cm4gTlVMTDsKKworCQlpZiAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NU
Uk1fUE9SVF9QUkVTRU5UKSAmJgorCQkgICAoKGRvd25zdHJlYW1wb3J0ICYgRFBfRFdOX1NUUk1f
UE9SVF9UWVBFX01BU0spCisJCSAgICAgIT0gRFBfRFdOX1NUUk1fUE9SVF9UWVBFX0FOQUxPRykp
CisJCQlyZXR1cm4gcG9ydC0+bWdyLT5hdXg7CisJfQorCiAJcmV0dXJuIE5VTEw7CiB9CiBFWFBP
UlRfU1lNQk9MKGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydCk7CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5k
ZXggODM2NDUwMmY5MmNmLi5hMTMzMWIwODcwNWYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTE0MzQs
NiArMTQzNCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7CiAJICogVGhlIGRyaXZlciBzaG91bGQg
aWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4KIAkgKi8KIAlEUF9EUENEX1FVSVJL
X05PX1NJTktfQ09VTlQsCisJLyoqCisJICogQERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklS
VFVBTF9EUENEOgorCSAqCisJICogVGhlIGRldmljZSBzdXBwb3J0cyBNU1QgRFNDIGRlc3BpdGUg
bm90IHN1cHBvcnRpbmcgVmlydHVhbCBEUENELgorCSAqIFRoZSBEU0MgY2FwcyBjYW4gYmUgcmVh
ZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXggaW5zdGVhZC4KKwkgKi8KKwlEUF9EUENEX1FVSVJLX0RT
Q19XSVRIT1VUX1ZJUlRVQUxfRFBDRCwKIH07CiAKIC8qKgotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
