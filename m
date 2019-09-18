Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF8B6D9F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877272B06;
	Wed, 18 Sep 2019 20:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1637C72AF0;
 Wed, 18 Sep 2019 20:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgdsGk/jc0E2ZKK5XtFWNMyGa2thrGtFXg/81Z+Ynxe1zjItyHhxJSbwgm6N9k/YupyqDWxPJvNgWGeT7LL3Mw2L1MQ8ixnpoodySDMTSF8qQbzdB28D+gdCKGCQ7Hg45YKYnVRe78vEabn2GaT2tIKboVjZEbJPtBZd8ZLwHhfP6wJErK8ZMo+5kNS8ElDNGeDwiestNmT2wopfi8860XijwLPtk5wJrjYLaA2b5a6TMDmhrw/r/sWXlZta+Bg77Fh2ZeZUxSLR4AM+XgwFS4c9dg5RGjXPMMIJgYxr5jjY70qDY85//YcQCMNqB/eq6qN5EyoXz6VUARxePOkZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lWslRekWJFGzUwyn//7oOW0PfxNkaj8ERLpHjAILY8=;
 b=Vt2SdRjdvrZ3MEN6viAvRzKl7+R0DVXIWs7vZlIRQgB+wz16127CallqVIPWZzyaMAZNNfoPyq83AWbXKzPYJc3vPBgHFLDf/plX/opKQSkcGuOTJsWHTtQ3MQm6LREvW2/RN73wp7Ed1lNSAXHeOex+id+KCstVSmkngz8cZF6EdjoEdvFvHY0tWo/nX0b2lFq3v3x8jUhcJAnhCAEiXdpf3lQKbCXbyn/Bu0YDPgFwv89byOFfPpRRi0i98sTCi4U1ilBa9dKbyjZ9sjhWuN3WqROSxw11x4eSIeI75i7SB/fux1ss10rll7ELzAIflg0CHwAoV6089q2U/IrnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0008.namprd12.prod.outlook.com (2603:10b6:610:57::18)
 by MWHPR1201MB0095.namprd12.prod.outlook.com (2603:10b6:301:4e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13; Wed, 18 Sep
 2019 20:27:30 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by CH2PR12CA0008.outlook.office365.com
 (2603:10b6:610:57::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:29 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:27 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/15] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Wed, 18 Sep 2019 16:26:46 -0400
Message-ID: <6b11214d7aaa5bff6ba60846a1569b6f2ac25b0b.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(428003)(199004)(189003)(50226002)(186003)(126002)(11346002)(8676002)(53416004)(81166006)(81156014)(70206006)(486006)(70586007)(6666004)(356004)(478600001)(336012)(4326008)(8936002)(2351001)(426003)(118296001)(16586007)(50466002)(76176011)(86362001)(36756003)(7696005)(2616005)(446003)(26005)(476003)(51416003)(47776003)(305945005)(14444005)(5660300002)(6916009)(48376002)(54906003)(2876002)(2906002)(316002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0095; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 296e7261-c8e9-4a29-43da-08d73c76a0ae
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR1201MB0095; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0095:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0095A49BA74CDEA2A53128BAE48E0@MWHPR1201MB0095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YhWSJd8kgDMhSLoj9ev58z6jMSw1koSvtXvphMQdPxGFfai289xj8zFQAHJ22kmA2+l+bwjsOz6ZNggGA1piRODKphPC1Sm7CruWkGAMrjcColrYCtqsFbpIOqgHuZqbrLIDMTOKs0dsGQ0mwQ9t2G3pyZUM0WQovKSz9/N2EOrnOagH4A/fc6awfCK5W3Ukep5A+/BydDNn4y+4Rp0ISGxNfS9JrfsDejbsBos2AsFI4nnCB3wFin9gGlwKJHGJCw8lztnvCvNJJFwYv0RQMoSd/YXgU1EvAtj7QMlVA11aVQwcDSolmDpwUV/ZiSLv0LcqBSoW7AkcW7hMuyLej3NmfebE8COjS7faVIGg9GTDgu1SZwoZGhTVy+y3VBlO7wYl8YrElwU3SCWzf7hY7V1VlIJKq+QVRnbZd9DG12s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:29.4826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 296e7261-c8e9-4a29-43da-08d73c76a0ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0095
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lWslRekWJFGzUwyn//7oOW0PfxNkaj8ERLpHjAILY8=;
 b=zE/wZqcIqM/Y0RNGGgCumAaC+yL0Cj+GcjPdUyaPhmA2Qtp0HQI9QFMifqfOCgYsJQm3jokUqQ7vCJhcHYYQ2iZRVDmQuk+rAyngOBkpOxFOzAyrWVc9EnZhPycjKx7WcJbcWBYkN5yxhjHa2nzAZZNwHdWLC46Hm6nMv5u3toY=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKU3luYXB0aWNzIERQ
MS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQgdmlydHVhbCBEUENE
IHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMgY2FuIGJlIHJlYWQg
ZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNlIGh1YnMgaGF2ZSBt
YW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRvIGRldGVjdCB0aGlz
IGNhc2UuCgpDaGFuZ2UtSWQ6IEk5ZDMzMmYyNzNkZmNhMGNmYmNlZDExMWU2MmY1YTA2YzVjMzEy
ODkzCkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jICAgICAgIHwgIDQgKysrLQogZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICB8ICA3ICsr
KysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX2hlbHBlci5jCmluZGV4IDBjYmYxMDcyN2JkNi4uYzNlMWRhNzhlNDQyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTEyODgsNyArMTI4OCw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHBjZF9xdWlyayBkcGNkX3F1aXJrX2xpc3RbXSA9IHsKIAkvKiBMRyBMUDE0MFdG
Ni1TUE0xIGVEUCBwYW5lbCAqLwogCXsgT1VJKDB4MDAsIDB4MjIsIDB4YjkpLCBERVZJQ0VfSUQo
J3MnLCAnaScsICd2JywgJ2EnLCAncicsICdUJyksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19D
T05TVEFOVF9OKSB9LAogCS8qIEFwcGxlIHBhbmVscyBuZWVkIHNvbWUgYWRkaXRpb25hbCBoYW5k
bGluZyB0byBzdXBwb3J0IFBTUiAqLwotCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJQ0Vf
SURfQU5ZLCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9CisJeyBPVUkoMHgwMCwg
MHgxMCwgMHhmYSksIERFVklDRV9JRF9BTlksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19Q
U1IpIH0sCisJLyogU3luYXB0aWNzIERQMS40IE1TVCBodWJzIGNhbiBzdXBwb3J0IERTQyB3aXRo
b3V0IHZpcnR1YWwgRFBDRCAqLworCXsgT1VJKDB4OTAsIDB4Q0MsIDB4MjQpLCBERVZJQ0VfSURf
QU5ZLCB0cnVlLCBCSVQoRFBfRFBDRF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QpIH0s
CiB9OwogCiAjdW5kZWYgT1VJCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRl
eCBkZDJjYTA2NWNjOTIuLjRlNDkzZDhhZjI4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCkBAIC00MjE5LDYgKzQyMTksNyBAQCBzdHJ1Y3QgZHJtX2RwX2F1eCAqZHJtX2Rw
X21zdF9kc2NfYXV4X2Zvcl9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCiB7CiAJ
c3RydWN0IGRybV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7CiAJc3RydWN0
IGRybV9kcF9tc3RfcG9ydCAqZmVjX3BvcnQ7CisJc3RydWN0IGRybV9kcF9kZXNjIGRlc2MgPSB7
IDAgfTsKIAogCWlmICghcG9ydCkKIAkJcmV0dXJuIE5VTEw7CkBAIC00MjcxLDYgKzQyNzIsMzIg
QEAgc3RydWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1Y3Qg
ZHJtX2RwX21zdF9wb3J0ICpwb3J0KQogCWlmIChkcm1fZHBfbXN0X2lzX3ZpcnR1YWxfZHBjZChw
b3J0KSkKIAkJcmV0dXJuICZwb3J0LT5hdXg7CiAKKwkvKgorCSAqIFN5bmFwdGljcyBxdWlyawor
CSAqIEFwcGxpZXMgdG8gcG9ydHMgZm9yIHdoaWNoOgorCSAqIC0gUGh5c2ljYWwgYXV4IGhhcyBT
eW5hcHRpY3MgT1VJCisJICogLSBEUHYxLjQgb3IgaGlnaGVyCisJICogLSBQb3J0IGlzIG9uIHBy
aW1hcnkgYnJhbmNoIGRldmljZQorCSAqIC0gTm90IGEgVkdBIGFkYXB0ZXIgKERQX0RXTl9TVFJN
X1BPUlRfVFlQRV9BTkFMT0cpCisJICovCisJaWYgKCFkcm1fZHBfcmVhZF9kZXNjKHBvcnQtPm1n
ci0+YXV4LCAmZGVzYywgdHJ1ZSkpCisJCXJldHVybiBOVUxMOworCisJaWYgKGRybV9kcF9oYXNf
cXVpcmsoJmRlc2MsIERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9EUENEKSAmJgor
CSAgICBwb3J0LT5tZ3ItPmRwY2RbRFBfRFBDRF9SRVZdID49IERQX0RQQ0RfUkVWXzE0ICYmCisJ
ICAgIHBvcnQtPnBhcmVudCA9PSBwb3J0LT5tZ3ItPm1zdF9wcmltYXJ5KSB7CisJCXU4IGRvd25z
dHJlYW1wb3J0OworCisJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5hdXgsIERQX0RPV05T
VFJFQU1QT1JUX1BSRVNFTlQsCisJCQkJICAgICAmZG93bnN0cmVhbXBvcnQsIDEpIDwgMCkKKwkJ
CXJldHVybiBOVUxMOworCisJCWlmICgoZG93bnN0cmVhbXBvcnQgJiBEUF9EV05fU1RSTV9QT1JU
X1BSRVNFTlQpICYmCisJCSAgICgoZG93bnN0cmVhbXBvcnQgJiBEUF9EV05fU1RSTV9QT1JUX1RZ
UEVfTUFTSykKKwkJICAgICAhPSBEUF9EV05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKSkKKwkJCXJl
dHVybiBwb3J0LT5tZ3ItPmF1eDsKKwl9CisKIAlyZXR1cm4gTlVMTDsKIH0KIEVYUE9SVF9TWU1C
T0woZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCA2YWUx
YTY3NjVmNjMuLjkxOWFkOTQwYmZiMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTQxNCw2ICsxNDE0
LDEzIEBAIGVudW0gZHJtX2RwX3F1aXJrIHsKIAkgKiBkcml2ZXIgc3RpbGwgbmVlZCB0byBpbXBs
ZW1lbnQgcHJvcGVyIGhhbmRsaW5nIGZvciBzdWNoIGRldmljZS4KIAkgKi8KIAlEUF9EUENEX1FV
SVJLX05PX1BTUiwKKwkvKioKKwkgKiBARFBfRFBDRF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFM
X0RQQ0Q6CisJICoKKwkgKiBUaGUgZGV2aWNlIHN1cHBvcnRzIE1TVCBEU0MgZGVzcGl0ZSBub3Qg
c3VwcG9ydGluZyBWaXJ0dWFsIERQQ0QuCisJICogVGhlIERTQyBjYXBzIGNhbiBiZSByZWFkIGZy
b20gdGhlIHBoeXNpY2FsIGF1eCBpbnN0ZWFkLgorCSAqLworCURQX0RQQ0RfUVVJUktfRFNDX1dJ
VEhPVVRfVklSVFVBTF9EUENELAogfTsKIAogLyoqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
