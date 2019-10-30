Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B3EA528
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 22:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DC26EB40;
	Wed, 30 Oct 2019 21:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700089.outbound.protection.outlook.com [40.107.70.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06956EB40;
 Wed, 30 Oct 2019 21:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg2X+3Ebd2yBZd4Lcq6imfJ2YlstiaxaYow2jN5D3zQzYjbzo5WudyGu5mNyR7MC7sGQWNj+DgPfT2bXYF7Yh3TxVAi2xOFzQB7KPKVLI/pVONt3Pi3eopW04IGIwnPgkLCri6FnkqX6EUTtva5DanYoXcu9e491lBm5H5+qJ46xkZ1f/V+xsWBupkr6lw1+MddvFhAhjMXx+BpjUEfZaw84JVpaX2u/+0HoV+O0yko8SI7fGBYjfgD9oVbe25TZPkM2ldoUJzUQ0j3Fhr2ddl8FcqYCkiAIUMYhHq19SJKIeHwC3j869TNMew6CSkZZzF2dQaOxF8D/IpsDjXE/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDN9iovwnkV3d972qVszi7+N3rEpDxY7LqteNEUGM10=;
 b=oRa0kfuO/3zvBYnATc0iuB0OL9/KXkKtL7WwnD3JX58FLgRuadvMP3wDoBOUOcuwBm5Kje5y6glGG6fj8rSv37mu5Re3+LFu8R/LHHFmw2+0WclQ88dcpia5yDdndhpC8CrzudslPoOd09Cea7DskSlC8QlA1hKSsdDXXfblFTRLudpI39qwbxXciolI8jnjRK8zloyQyWO9M87fd0uEJ5pMxSpE++wyP1+7Rqvl1gyeDSOlKlHIDTalhrhmztQId8O4qh2OhuInSTqpTLvlllqco01tzqFBbsfodcIGwA88LV8h3a6fIwDm6rXPFlFq67jl2fXaFpXvaao55yBemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0101.namprd12.prod.outlook.com (2603:10b6:0:55::21) by
 BN6PR1201MB0131.namprd12.prod.outlook.com (2603:10b6:405:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Wed, 30 Oct
 2019 21:09:27 +0000
Received: from CO1NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM3PR12CA0101.outlook.office365.com
 (2603:10b6:0:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.19 via Frontend
 Transport; Wed, 30 Oct 2019 21:09:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT042.mail.protection.outlook.com (10.152.81.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 21:09:26 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 16:09:25 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 16:09:25 -0500
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm: Add support for DP 1.4 Compliance edid corruption
 test 4.2.2.6
Date: Wed, 30 Oct 2019 17:08:43 -0400
Message-ID: <20191030210844.19803-2-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191030210844.19803-1-Jerry.Zuo@amd.com>
References: <20191030210844.19803-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(428003)(189003)(199004)(50466002)(11346002)(48376002)(446003)(126002)(6666004)(356004)(2616005)(2906002)(476003)(5660300002)(316002)(54906003)(47776003)(16586007)(86362001)(110136005)(478600001)(1076003)(50226002)(4326008)(186003)(81156014)(81166006)(8676002)(76176011)(305945005)(26005)(8936002)(36756003)(486006)(53416004)(14444005)(336012)(426003)(7696005)(51416003)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0131; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b8b70bb-c835-467a-fad6-08d75d7d7245
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0131:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0131BF6002C536F718E62888E5600@BN6PR1201MB0131.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCKhXa+QJXmpGTRDgJpR13y0IbdzGKbw3AJ4wWi0UcPq9jxJJV6b4oIa+YqbShKhcwKq5qWSBBYYwy4uDHDDfhDXnFftQWYYSP3B9iXyVIhpvvilKNMrCqBa95bhX7mRVWx3kUxhkMfFnYpL1AfSuc9sMtBx9BFnhUe/EyBlyd86gQ6KZRhmNOTgJHQ9dAhFTKmqDLwF+RF8ZOw7sXyQdgiBPRtV8UjJMwQ/haGYhrNdylu75ZACfya4O9o8D7tcwFyO4rS6c3n6Pq+GJN6AFuB855rQGFH8KKNoxwkaDcWxDIPp/jJGXWvPIQbSW+Lzb/RCG4i0AmjT3zLeaIs+D8nWB5G14KY7ZzCANAxlSC8s94Bl4pddXUomYtGcTIw/zmu5LbfxN/oqjUJBdpyHUGdcXkDVXn4Vm+rKhv4JcWRdhoqD+TP2NLZamBxRuJSB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 21:09:26.4077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8b70bb-c835-467a-fad6-08d75d7d7245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDN9iovwnkV3d972qVszi7+N3rEpDxY7LqteNEUGM10=;
 b=XqrHUfBP17mWJjVvVtVJHi4dfvq2cHJiZ4LDp2s0J7hrUdFq21ptV9WYJyem9FNBJBMb8K4pIYqTu/zlhcJDUEStPryKuUV4aUmQe8lG/WWnjIENna46/1WdSr9cldP89RR2B9Vw7DW/E9o3a3EHghGe3Psq4EYolLOXkLzgMLM=
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
Cc: manasi.d.navare@intel.com, Jerry.Zuo@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFAgMS40IGVkaWQgY29ycnVwdGlvbiB0ZXN0IHJlcXVpcmVzIHNvdXJjZSBEVVQgdG8gd3JpdGUg
Y2FsY3VsYXRlZApDUkMsIG5vdCB0aGUgY29ycnVwdGVkIENSQyBmcm9tIHJlZmVyZW5jZSBzaW5r
LgoKUmV0dXJuIHRoZSBjYWxjdWxhdGVkIENSQyBiYWNrLCBhbmQgaW5pdGlhdGUgdGhlIHJlcXVp
cmVkIHNlcXVlbmNlLgoKU2lnbmVkLW9mZi1ieTogSmVycnkgKEZhbmd6aGkpIFp1byA8SmVycnku
WnVvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDM2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMgICAgICB8IDE1ICsrKysrKysrKysrKy0tLQogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rv
ci5oICAgICB8ICA3ICsrKysrKysKIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCAg
MyArKysKIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBmZmM2OGQzMDVhZmUuLjc1ZGJkMzBjNjJhNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0zMzYsNiArMzM2LDQyIEBAIGludCBkcm1fZHBf
ZHBjZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiB9CiBFWFBPUlRf
U1lNQk9MKGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMpOwogCisvKioKKyAgKiBkcm1fZHBf
c2VuZF9iYWRfZWRpZF9jaGVja3N1bSgpIC0gc2VuZCBiYWNrIHJlYWwgZWRpZCBjaGVja3N1bSB2
YWx1ZQorICAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCisgICogQGJhZF9lZGlkX2No
ZWNrc3VtOiByZWFsIGVkaWQgY2hlY2tzdW0gZm9yIHRoZSBsYXN0IGJsb2NrCisgICoKKyAgKiBS
ZXR1cm5zIHRydWUgb24gc3VjY2VzcworICAqLworYm9vbCBkcm1fZHBfc2VuZF9iYWRfZWRpZF9j
aGVja3N1bShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1OCBiYWRfZWRpZF9jaGVja3N1bSkKK3sKKyAgICAgICAgdTggbGlua19lZGlkX3Jl
YWQgPSAwLCBhdXRvX3Rlc3RfcmVxID0gMDsKKyAgICAgICAgdTggdGVzdF9yZXNwID0gMDsKKwor
ICAgICAgICBkcm1fZHBfZHBjZF9yZWFkKGF1eCwgRFBfREVWSUNFX1NFUlZJQ0VfSVJRX1ZFQ1RP
UiwgJmF1dG9fdGVzdF9yZXEsIDEpOworICAgICAgICBhdXRvX3Rlc3RfcmVxICY9IERQX0FVVE9N
QVRFRF9URVNUX1JFUVVFU1Q7CisKKyAgICAgICAgZHJtX2RwX2RwY2RfcmVhZChhdXgsIERQX1RF
U1RfUkVRVUVTVCwgJmxpbmtfZWRpZF9yZWFkLCAxKTsKKyAgICAgICAgbGlua19lZGlkX3JlYWQg
Jj0gRFBfVEVTVF9MSU5LX0VESURfUkVBRDsKKworICAgICAgICBpZiAoIWF1dG9fdGVzdF9yZXEg
fHwgIWxpbmtfZWRpZF9yZWFkKSB7CisgICAgICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygiU291
cmNlIERVVCBkb2VzIG5vdCBzdXBwb3J0IFRFU1RfRURJRF9SRUFEXG4iKTsKKyAgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7CisgICAgICAgIH0KKworICAgICAgICBkcm1fZHBfZHBjZF93cml0
ZShhdXgsIERQX0RFVklDRV9TRVJWSUNFX0lSUV9WRUNUT1IsICZhdXRvX3Rlc3RfcmVxLCAxKTsK
KworICAgICAgICAvKiBzZW5kIGJhY2sgY2hlY2tzdW0gZm9yIHRoZSBsYXN0IGVkaWQgZXh0ZW5z
aW9uIGJsb2NrIGRhdGEgKi8KKyAgICAgICAgZHJtX2RwX2RwY2Rfd3JpdGUoYXV4LCBEUF9URVNU
X0VESURfQ0hFQ0tTVU0sICZiYWRfZWRpZF9jaGVja3N1bSwgMSk7CisKKyAgICAgICAgdGVzdF9y
ZXNwIHw9IERQX1RFU1RfRURJRF9DSEVDS1NVTV9XUklURTsKKyAgICAgICAgZHJtX2RwX2RwY2Rf
d3JpdGUoYXV4LCBEUF9URVNUX1JFU1BPTlNFLCAmdGVzdF9yZXNwLCAxKTsKKworICAgICAgICBy
ZXR1cm4gdHJ1ZTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX3NlbmRfYmFkX2VkaWRfY2hlY2tz
dW0pOworCiAvKioKICAqIGRybV9kcF9saW5rX3Byb2JlKCkgLSBwcm9iZSBhIERpc3BsYXlQb3J0
IGxpbmsgZm9yIGNhcGFiaWxpdGllcwogICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMKaW5kZXggODJhNGNlZWQzZmNmLi40MDAwNjRkY2MwMTAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jCkBAIC0xMzQ0LDEzICsxMzQ0LDE5IEBAIHN0YXRpYyB2b2lkIGRybV9nZXRfZGlzcGxheWlk
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCQkgICAgICBzdHJ1Y3QgZWRpZCAq
ZWRpZCk7CiBzdGF0aWMgaW50IHZhbGlkYXRlX2Rpc3BsYXlpZCh1OCAqZGlzcGxheWlkLCBpbnQg
bGVuZ3RoLCBpbnQgaWR4KTsKIAotc3RhdGljIGludCBkcm1fZWRpZF9ibG9ja19jaGVja3N1bShj
b25zdCB1OCAqcmF3X2VkaWQpCitzdGF0aWMgaW50IGRybV9lZGlkX2Jsb2NrX2NoZWNrc3VtKGNv
bnN0IHU4ICpyYXdfZWRpZCwgYm9vbCBjKQogewogCWludCBpOwogCXU4IGNzdW0gPSAwOwotCWZv
ciAoaSA9IDA7IGkgPCBFRElEX0xFTkdUSDsgaSsrKQorCXU4IGxlbjsKKworCWxlbiA9IGMgPyBF
RElEX0xFTkdUSCA6IChFRElEX0xFTkdUSCAtIDEpOworCisJZm9yIChpID0gMDsgaSA8IGxlbjsg
aSsrKQogCQljc3VtICs9IHJhd19lZGlkW2ldOwogCisJY3N1bSA9IGMgPyBjc3VtIDogKDB4MTAw
IC0gY3N1bSk7CisKIAlyZXR1cm4gY3N1bTsKIH0KIApAQCAtMTQwOCw3ICsxNDE0LDcgQEAgYm9v
bCBkcm1fZWRpZF9ibG9ja192YWxpZCh1OCAqcmF3X2VkaWQsIGludCBibG9jaywgYm9vbCBwcmlu
dF9iYWRfZWRpZCwKIAkJfQogCX0KIAotCWNzdW0gPSBkcm1fZWRpZF9ibG9ja19jaGVja3N1bShy
YXdfZWRpZCk7CisJY3N1bSA9IGRybV9lZGlkX2Jsb2NrX2NoZWNrc3VtKHJhd19lZGlkLCB0cnVl
KTsKIAlpZiAoY3N1bSkgewogCQlpZiAoZWRpZF9jb3JydXB0KQogCQkJKmVkaWRfY29ycnVwdCA9
IHRydWU7CkBAIC0xNTcyLDYgKzE1NzgsOSBAQCBzdGF0aWMgdm9pZCBjb25uZWN0b3JfYmFkX2Vk
aWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJCSAgICAgICBwcmVmaXgsIERV
TVBfUFJFRklYX05PTkUsIDE2LCAxLAogCQkJICAgICAgIGJsb2NrLCBFRElEX0xFTkdUSCwgZmFs
c2UpOwogCX0KKworCS8qIENhbGN1bGF0ZSByZWFsIGNoZWNrc3VtIGZvciB0aGUgbGFzdCBlZGlk
IGV4dGVuc2lvbiBibG9jayBkYXRhICovCisJY29ubmVjdG9yLT5iYWRfZWRpZF9jaGVja3N1bSA9
IGRybV9lZGlkX2Jsb2NrX2NoZWNrc3VtKGVkaWQgKyBlZGlkWzB4N2VdICogRURJRF9MRU5HVEgs
IGZhbHNlKTsKIH0KIAogLyogR2V0IG92ZXJyaWRlIG9yIGZpcm13YXJlIEVESUQgKi8KZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaAppbmRleCA2ODFjYjU5MGY5NTIuLjg0NDI0NjE1NDJiOSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aApAQCAtMTM0NSw2ICsxMzQ1LDEzIEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsKIAkgKiByZXYx
LjEgNC4yLjIuNgogCSAqLwogCWJvb2wgZWRpZF9jb3JydXB0OworCS8qKgorICAgICAgICAgKiBA
YmFkX2VkaWRfY2hlY2tzdW06IHJlYWwgZWRpZCBjaGVja3N1bSB2YWx1ZSBmb3IgY29ycnVwdGVk
IGVkaWQgYmxvY2suCisgICAgICAgICAqIFJlcXVpcmVkIGluIERpc3BsYXlwb3J0IDEuNCBjb21w
bGlhbmNlIHRlc3RpbmcKKyAgICAgICAgICogcmV2MS4xIDQuMi4yLjYKKyAgICAgICAgICovCisg
ICAgICAgIHVpbnQ4X3QgYmFkX2VkaWRfY2hlY2tzdW07CisKIAogCS8qKiBAZGVidWdmc19lbnRy
eTogZGVidWdmcyBkaXJlY3RvcnkgZm9yIHRoaXMgY29ubmVjdG9yICovCiAJc3RydWN0IGRlbnRy
eSAqZGVidWdmc19lbnRyeTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIu
aCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCA1YTc5NTA3NWQ1ZGEuLjJhN2U1
NGJlYmIxOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTM4Myw2ICsxMzgzLDkgQEAgc3RhdGljIGlu
bGluZSBzc2l6ZV90IGRybV9kcF9kcGNkX3dyaXRlYihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAog
aW50IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoc3RydWN0IGRybV9kcF9hdXggKmF1eCwK
IAkJCQkgdTggc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdKTsKIAorYm9vbCBkcm1fZHBfc2Vu
ZF9iYWRfZWRpZF9jaGVja3N1bShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAorCQkJCXU4IGJhZF9l
ZGlkX2NoZWNrc3VtKTsKKwogLyoKICAqIERpc3BsYXlQb3J0IGxpbmsKICAqLwotLSAKMi4xNC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
