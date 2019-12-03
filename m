Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3CC110056
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF06E7C6;
	Tue,  3 Dec 2019 14:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700066.outbound.protection.outlook.com [40.107.70.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FD56E79C;
 Tue,  3 Dec 2019 14:35:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3ohnnveus3GhVXNYRdtb1uerVCWm3pHEomtUqpWVy0aKDQNsj6WHHBf+DiAt+hmEYPelARguyQbZZmdN7HtPZmK/QWXLpAE1FLV+2WP1yqBwUXkcpsd/nQE6nLzKdlv7HHtLyuNAJbKM80i+sbRfzhz3zbhozFGM/SP5h9T3XjOz2chTQc3VDewRTq2EaW7oK1N/UbzLTIG28qtHM9M7Yu0mqhPAfrxXloRILhB+AEiN1FFSVR2rqC/FU3YqwC1K54HMyHqDW2G8ipbeeSO4I4gUG9nJXquDYh14zYLR7c9mpvdyJMg9CoSjZhHgWk1GjhDVV9w4pu3xgDu5cfFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3rZy/BBuFAXy6InW39gWtDc8wRA/M+iK+hVezxgW7A=;
 b=Q76gHCk5hvsvfZ1bqcjzdPeU79G1fxC3KifqrYN8nFAJGIm+rXfQRiOF480yYgEP8uXTyfMevlq5efiH5AD+Gcubl8NhGiLJRKo9yb+hN16Qrmr3c/btomz72JE1KeVNBCIGWSrFmiLhOQ2ZeSR3+fM7dyag0/QaH0e08SaCZe6SE+q+PyRixJxmsTibMXIl/meXBGYBKnD0ajKt3lqM4eQu2Asmyo4RyZPPhTKmdpM+IspQrGXt3xgIFBXatVEZQqkqlzi/wSeICJjhbZQKAY7jhF7QNrJmCGbpXCP1zGND6Bd/CKgGt1fCJXKCpwjlBI5lqWTmG/JxNFnnO6rilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0016.namprd12.prod.outlook.com (2603:10b6:5:1c0::29)
 by MN2PR12MB4158.namprd12.prod.outlook.com (2603:10b6:208:15f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 14:35:45 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::203) by DM6PR12CA0016.outlook.office365.com
 (2603:10b6:5:1c0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:45 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:43 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:43 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 06/17] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Tue, 3 Dec 2019 09:35:19 -0500
Message-ID: <20191203143530.27262-7-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(428003)(199004)(189003)(6666004)(2351001)(450100002)(6916009)(36756003)(8936002)(8676002)(81156014)(50226002)(4326008)(81166006)(53416004)(305945005)(356004)(7696005)(70206006)(14444005)(70586007)(51416003)(50466002)(76176011)(26005)(16586007)(54906003)(316002)(186003)(86362001)(426003)(2616005)(48376002)(446003)(11346002)(2906002)(1076003)(478600001)(336012)(2876002)(5660300002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4158; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eef4f577-14d0-4dcc-e125-08d777fe150c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4158:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4158A92846C6219B0B79F5BCE4420@MN2PR12MB4158.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejxmTJfrVYEnkjNHO31LYCBvQr75G2WzilTINhcJyZm39pkQgoLiZFR9uPc4PFUBU7sxPFk2H3ROo6jE46Cm6p5Do4nOFbBBgthxet2rEYmlsCwV952G5BM7T/UJdilCnJd5dJzpXAvfKqOMltbp3zS/JIQYRwgfEn7irBW6BI0H/BfWLVAwtwJFObFl2GwwyAEzq1Wzsof78o0Xr8wGjpFj83BmOcK2f7m/3kcKdG3nIbjUZIMJ+E/Tm3UrCQl8rClY0gbOeFoccu8fJcvM/eWNPPUeJgUdpz5YO3EC52pe/qO6ez8kRhClnVUmice9KcWD0QOHVqtnfmOs0LOro6JbFSPPs5mPkErUFZ2lHN4xhcC6MfdIe3BZacICEorUhGxD5E7UYzzr34R1kQC7Rye/9IYXRK72mq4CjCsROX1ouhzPmIUtDbkyd9nDpNT24nHeFMpIS8hyZg8vKx2KBbBeXdCt4zvosem80UOrsMRR8Z++LsxP8f7V73BuinUD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:45.3948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eef4f577-14d0-4dcc-e125-08d777fe150c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3rZy/BBuFAXy6InW39gWtDc8wRA/M+iK+hVezxgW7A=;
 b=xlbTslUuu5WVDTqpFBfjv+oXHHhCAHHCoa8VMaljVRveYay1TnEhs/tPjQEinrWgDsMLgkMe9LhbOH95UruG3nEZxCiVj61bWAmT6z3qwWklV3gMVLlrtskDme68CQMxsULqqErBNxwGaiZ7xMXG2nrRUQpWpOFMQjFDcMvE/tc=
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
YXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE1pa2l0
YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jICAgICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaCAgICAgICAgICAgfCAgNyArKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCAyZmFlZjhiZDkxMWYu
LjM3NGNlZGM2YzJhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0xMTY1LDYgKzExNjUs
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRwY2RfcXVpcmsgZHBjZF9xdWlya19saXN0W10gPSB7
CiAJeyBPVUkoMHgwMCwgMHgxMCwgMHhmYSksIERFVklDRV9JRF9BTlksIGZhbHNlLCBCSVQoRFBf
RFBDRF9RVUlSS19OT19QU1IpIH0sCiAJLyogQ0g3NTExIHNlZW1zIHRvIGxlYXZlIFNJTktfQ09V
TlQgemVyb2VkICovCiAJeyBPVUkoMHgwMCwgMHgwMCwgMHgwMCksIERFVklDRV9JRCgnQycsICdI
JywgJzcnLCAnNScsICcxJywgJzEnKSwgZmFsc2UsIEJJVChEUF9EUENEX1FVSVJLX05PX1NJTktf
Q09VTlQpIH0sCisJLyogU3luYXB0aWNzIERQMS40IE1TVCBodWJzIGNhbiBzdXBwb3J0IERTQyB3
aXRob3V0IHZpcnR1YWwgRFBDRCAqLworCXsgT1VJKDB4OTAsIDB4Q0MsIDB4MjQpLCBERVZJQ0Vf
SURfQU5ZLCB0cnVlLCBCSVQoRFBfRFBDRF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0Qp
IH0sCiB9OwogCiAjdW5kZWYgT1VJCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpp
bmRleCA5ZGYwMjA5MGFhOWYuLjAxODkyMWM0YmE5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCkBAIC01MTAxLDYgKzUxMDEsNyBAQCBzdHJ1Y3QgZHJtX2RwX2F1eCAqZHJt
X2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCiB7
CiAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7CiAJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqZmVjX3BvcnQ7CisJc3RydWN0IGRybV9kcF9kZXNjIGRlc2Mg
PSB7IDAgfTsKIAogCWlmICghcG9ydCkKIAkJcmV0dXJuIE5VTEw7CkBAIC01MTUzLDYgKzUxNTQs
MzIgQEAgc3RydWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1
Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KQogCWlmIChkcm1fZHBfbXN0X2lzX3ZpcnR1YWxfZHBj
ZChwb3J0KSkKIAkJcmV0dXJuICZwb3J0LT5hdXg7CiAKKwkvKgorCSAqIFN5bmFwdGljcyBxdWly
aworCSAqIEFwcGxpZXMgdG8gcG9ydHMgZm9yIHdoaWNoOgorCSAqIC0gUGh5c2ljYWwgYXV4IGhh
cyBTeW5hcHRpY3MgT1VJCisJICogLSBEUHYxLjQgb3IgaGlnaGVyCisJICogLSBQb3J0IGlzIG9u
IHByaW1hcnkgYnJhbmNoIGRldmljZQorCSAqIC0gTm90IGEgVkdBIGFkYXB0ZXIgKERQX0RXTl9T
VFJNX1BPUlRfVFlQRV9BTkFMT0cpCisJICovCisJaWYgKCFkcm1fZHBfcmVhZF9kZXNjKHBvcnQt
Pm1nci0+YXV4LCAmZGVzYywgdHJ1ZSkpCisJCXJldHVybiBOVUxMOworCisJaWYgKGRybV9kcF9o
YXNfcXVpcmsoJmRlc2MsIERQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9EUENEKSAm
JgorCSAgICBwb3J0LT5tZ3ItPmRwY2RbRFBfRFBDRF9SRVZdID49IERQX0RQQ0RfUkVWXzE0ICYm
CisJICAgIHBvcnQtPnBhcmVudCA9PSBwb3J0LT5tZ3ItPm1zdF9wcmltYXJ5KSB7CisJCXU4IGRv
d25zdHJlYW1wb3J0OworCisJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5hdXgsIERQX0RP
V05TVFJFQU1QT1JUX1BSRVNFTlQsCisJCQkJICAgICAmZG93bnN0cmVhbXBvcnQsIDEpIDwgMCkK
KwkJCXJldHVybiBOVUxMOworCisJCWlmICgoZG93bnN0cmVhbXBvcnQgJiBEUF9EV05fU1RSTV9Q
T1JUX1BSRVNFTlQpICYmCisJCSAgICgoZG93bnN0cmVhbXBvcnQgJiBEUF9EV05fU1RSTV9QT1JU
X1RZUEVfTUFTSykKKwkJICAgICAhPSBEUF9EV05fU1RSTV9QT1JUX1RZUEVfQU5BTE9HKSkKKwkJ
CXJldHVybiBwb3J0LT5tZ3ItPmF1eDsKKwl9CisKIAlyZXR1cm4gTlVMTDsKIH0KIEVYUE9SVF9T
WU1CT0woZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCA1
MWVjYjUxMTJlZjguLmU2M2NkNTA4ODgyYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTUyMCw2ICsx
NTIwLDEzIEBAIGVudW0gZHJtX2RwX3F1aXJrIHsKIAkgKiBUaGUgZHJpdmVyIHNob3VsZCBpZ25v
cmUgU0lOS19DT1VOVCBkdXJpbmcgZGV0ZWN0aW9uLgogCSAqLwogCURQX0RQQ0RfUVVJUktfTk9f
U0lOS19DT1VOVCwKKwkvKioKKwkgKiBARFBfRFBDRF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFM
X0RQQ0Q6CisJICoKKwkgKiBUaGUgZGV2aWNlIHN1cHBvcnRzIE1TVCBEU0MgZGVzcGl0ZSBub3Qg
c3VwcG9ydGluZyBWaXJ0dWFsIERQQ0QuCisJICogVGhlIERTQyBjYXBzIGNhbiBiZSByZWFkIGZy
b20gdGhlIHBoeXNpY2FsIGF1eCBpbnN0ZWFkLgorCSAqLworCURQX0RQQ0RfUVVJUktfRFNDX1dJ
VEhPVVRfVklSVFVBTF9EUENELAogfTsKIAogLyoqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
