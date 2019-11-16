Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7146FF5EC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB306E1E2;
	Sat, 16 Nov 2019 22:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800054.outbound.protection.outlook.com [40.107.80.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5883E6E1D2;
 Sat, 16 Nov 2019 22:01:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIxMR/lkNL4JunN1bMO7RGTUT7kHdwjhyp8Z+Nvtis567cBgQkpUQxKC+rjsOaEpfjZc0zIttaQaa6XzV1qAOWxhd+w1gqQqXYUImWoEh89HgNbxVOHrpjHTTkbCsRe43PT8UKX4yNKcsYFA4Q51/sXyd6utg2Dj5XFtMQqrs1xMpcHRFvWrb48nmcDBMs3pOVPurTwXELpF5gBbRZoEMTQRD58Vo7kHEJbgrWbJFjyKRISZpTs8VpQ5QGQSxcZ04M8AFTKNbTw1z6f5mCqbT7BQlfqaFJuVmD3wtyXsAg7ELFg1pU7YWSWE+NA+tEHsgc94F1RK10z0pcGrIovzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgyghqZPyHZGC3zf3py8T8uMDqL40rRqKDDvrEGsZH8=;
 b=kFPDGJBGOpjHKm6aIvIbNFTkY7fUcwBmyzrpf4muNKXIJ/pFhTE0vHzf1z3WoWaGlEUhTkALilXu1j/qjkhEADAEx+utLSOROIn68UMB1gIOHoeE89qz+QGoiYhkzcOO5fk8niO8LuQi5s2Rj1YfLtF0Ccp44rtQX6H3Qrka3Bcs/1czwz5xdDuIhjZJOBC0YQuNDzfMECfKfRprrG6mLt6XL0H23JUpiUx4upJzJyAtfpsJIT4j22tytqOtxuQuZVVlrIT6VVWncSlvDeF8FMuIKtbuXIr3vmlNYDHHEA/irIWM+2tkmI/sQhOoy5YYYY5UFlmvauvFz6hFkykUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:910:16::17) by BN6PR1201MB0177.namprd12.prod.outlook.com
 (2603:10b6:405:4d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Sat, 16 Nov
 2019 22:01:37 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::204) by CY4PR1201CA0007.outlook.office365.com
 (2603:10b6:910:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:37 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:35 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:34 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 06/17] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Sat, 16 Nov 2019 17:01:17 -0500
Message-ID: <20191116220128.16598-7-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39850400004)(396003)(376002)(428003)(189003)(199004)(186003)(336012)(26005)(4326008)(8676002)(7696005)(76176011)(51416003)(6666004)(356004)(8936002)(2351001)(36756003)(50226002)(86362001)(6916009)(81156014)(70586007)(70206006)(2876002)(2906002)(5660300002)(305945005)(16586007)(81166006)(478600001)(54906003)(316002)(426003)(48376002)(50466002)(1076003)(53416004)(2616005)(446003)(476003)(11346002)(486006)(126002)(14444005)(47776003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0177; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca4ec11f-d531-4dff-b469-08d76ae08d7f
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0177:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB017765068BCE51987DE7E6CCE4730@BN6PR1201MB0177.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7nIHU9hWlRktgmOadTMmL5ihAGKp4VU8SuRhXzcD1gAuuQqBjjGWtTJMrAJ/5U0jarAhJDxytAZCZSdMevQ72DXL345F7TJsvKRoZY08PCtpi57fTlb+eGpBCdv0ky/eExVgg2MEzjLozJI4m0V3C9JeA/L71h15AkQF0PUX5Gpc/DoRMgoE9oONhmC4mT7w5WT4WfI/zaWyjqKtliuVFIDBFEs6234E36vadyuGIXDYB+SIU5p3VuuNQYvtp3unoLijIT0s8xloHFmNJlP5+SkHrlkCD27v5smd+NZQuxNoEoHfas1JHzGZI6I4ZbJc4tepTr3RhRpzHboAMPjFt3GHQIhlrfgh6pfX4A1znLCDc75D8gtogaNIW3SpmdWekEkGB00g6a8XvV44FKqJQXJpVLc8nLG68sLkzakjQqgXh1kLZEaDUqwOqq8LuDz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:37.3807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4ec11f-d531-4dff-b469-08d76ae08d7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0177
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgyghqZPyHZGC3zf3py8T8uMDqL40rRqKDDvrEGsZH8=;
 b=gdI7u2IknckzE+2HIv0uXxqjyYbEJYruWF9XC80VxjuJfEcxr659uHrMfbNRw7RARST1K7Ht30YOtFZA9r9ivOatns+iKuQFMWXwj+B0dKaIuAhI8zcXQWJDnatzkbrM1aftFeGHjes0mUavkwnMCn/1FGDYiQSiGcsgbWPhOd0=
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
Cc: David
 Francis <David.Francis@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
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
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBhZjFjZDk2OGFkZmQu
LjAyZmE4YzNkOWE4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0xMjcxLDYgKzEyNzEs
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
bmRleCBkOGY5YmEyN2I1NTkuLmQ1ZGYwMjMxNWUxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCkBAIC00MjIyLDYgKzQyMjIsNyBAQCBzdHJ1Y3QgZHJtX2RwX2F1eCAqZHJt
X2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCiB7
CiAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7CiAJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqZmVjX3BvcnQ7CisJc3RydWN0IGRybV9kcF9kZXNjIGRlc2Mg
PSB7IDAgfTsKIAogCWlmICghcG9ydCkKIAkJcmV0dXJuIE5VTEw7CkBAIC00Mjc0LDYgKzQyNzUs
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
YTc5NTA3NWQ1ZGEuLjVmZjU5ZTliYmJiMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTQ2NCw2ICsx
NDY0LDEzIEBAIGVudW0gZHJtX2RwX3F1aXJrIHsKIAkgKiBUaGUgZHJpdmVyIHNob3VsZCBpZ25v
cmUgU0lOS19DT1VOVCBkdXJpbmcgZGV0ZWN0aW9uLgogCSAqLwogCURQX0RQQ0RfUVVJUktfTk9f
U0lOS19DT1VOVCwKKwkvKioKKwkgKiBARFBfRFBDRF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFM
X0RQQ0Q6CisJICoKKwkgKiBUaGUgZGV2aWNlIHN1cHBvcnRzIE1TVCBEU0MgZGVzcGl0ZSBub3Qg
c3VwcG9ydGluZyBWaXJ0dWFsIERQQ0QuCisJICogVGhlIERTQyBjYXBzIGNhbiBiZSByZWFkIGZy
b20gdGhlIHBoeXNpY2FsIGF1eCBpbnN0ZWFkLgorCSAqLworCURQX0RQQ0RfUVVJUktfRFNDX1dJ
VEhPVVRfVklSVFVBTF9EUENELAogfTsKIAogLyoqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
