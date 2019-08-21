Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DD9850A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085856E9FE;
	Wed, 21 Aug 2019 20:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720075.outbound.protection.outlook.com [40.107.72.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7496D6E9ED;
 Wed, 21 Aug 2019 20:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1eh0WG/Ud7nK5Ql1EnJMce1GfpnlldH8pwRqt7HZJkYtx1LgZJhCMw3YoMzY4rY6Xz+FlUWq8KJ+nOTYIyyeVzXfqkP0LvsBNG2wR/Sx60+tEg9sI5bDD7t8l/mj/Pi0NoSIocVUEAMok5SlbXRrWnQdh8PWFDP1zgrPaMBpHDi2M4Ryfz1ZZttlnQfYBvcsQAKUmTGusebpnGPVyclsdmtKRnEM3bJrUfSlNWaBYdu0EDhBjFSfxITPKrRNEOL4iF0o0dX4sKUjhg+j3wOgy3oQ2Af1fFsZd7C70IpR9JVzq8Iq6FpTFQTtw7R7JeXAl84bZJeGmAHT5fvbCHzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIOQCXzZMMk4zbtiEaTFAFHv2xGdqyRxGN8x3R9ewBk=;
 b=RIywKyOYwXPxS896P13DX0qqsEPapNXmEgFHGzL8loN/TN81W5llQ7D3YcVTOzEwa47FStyFevC+ppmQ7A+s3jVDfEorh4tvH+FyjGl2fZqQ3s5OfilCkubsyqai9e2x3tCvmrbTrGbhVdRThpuFfimdnvRtJjbvUG06XZxwT7JPibmJ0WqVlVJrARnVwT7MlbeI/iDAvM++pTV5BTd0XTdDBGcvZl6At8Gps17/XfawpBX4X1RkGR0DTBXBJ8pICniixbqTADf4ZAuULqdzTu4i6bAnT5BS7WJSL6Zd6dpNZJNdM15vIXWKnp/f12L8C2L1jvf28GGomGRwGQyG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0008.namprd12.prod.outlook.com (2603:10b6:403:2::18)
 by BN7PR12MB2706.namprd12.prod.outlook.com (2603:10b6:408:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:02:04 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN4PR12CA0008.outlook.office365.com
 (2603:10b6:403:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 20:02:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:02:02 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:41 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 11/16] drm/dp-mst: Fill branch->num_ports
Date: Wed, 21 Aug 2019 16:01:24 -0400
Message-ID: <20190821200129.11575-12-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(428003)(199004)(189003)(48376002)(50226002)(186003)(476003)(1076003)(486006)(16586007)(316002)(110136005)(5660300002)(478600001)(26005)(126002)(50466002)(76176011)(70206006)(70586007)(51416003)(426003)(4326008)(446003)(2906002)(53936002)(36756003)(47776003)(336012)(8676002)(81166006)(2616005)(450100002)(81156014)(356004)(6666004)(49486002)(11346002)(8936002)(305945005)(86362001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22eb72c7-d6bf-46aa-2dff-08d726726ef7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2706B3A6F6D330C25B5986D6EFAA0@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YnQ3sXpBwT33YcAjsOZbXRtTWBKhaw+ZOMGZzb0y0BdmQ3B0AQYIS5WXP/KLWKB3cyK5eWTTDtJsBrIKz15eEl3EWroPaUNlmo+6oCqd2MjVAS4eZGYbufO9fN+GfyvBizP/C56MfOMUvT/72MUkQIArR4q7xj4Cw6MpLplgFAIGKh6tfvaaI4j4Mld0F9UBiNZArhzJiVsM5XSSjargU9/6uWDlKXa0jw1SUNxZbHXCvRq0ZC9LSbCKtfInFmU5ukuYih6Kq037I9tYPFiroboos5Fsu0/WJcpt8cIa5C8d5auMc7JYO3BukBEZkd2j34smrrnVLqxi12IdohZQ7j+kvmINnfLxNke/Wn7vaC3zd++kJzFijQckku9Xk2SfH6qybPC4k33Fq43XPDj5e4nnJptAm0AXso2+1RNRFjc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:02:02.3983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eb72c7-d6bf-46aa-2dff-08d726726ef7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIOQCXzZMMk4zbtiEaTFAFHv2xGdqyRxGN8x3R9ewBk=;
 b=vC8GtjnPZfgMnrKYZNbq+MYahJQC2Aesot6v1nVQhDBFEaVUDqKvOJDIL/IGZ7m0poDa8Qjf2JmxkEiK/uwMBrUNatB9Jn9gDtAUeVKHxl9BFz7SlSPTfWkwh2Ki0+O0unGWf4lC9p9MtT7hQtXNUm5G2i5Cde1KfWASy2ZoO64=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWVsZCBvbiBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJbml0aWFs
aXplIGl0IHRvIHplcm8gd2hlbiB0aGUgbGlzdCBvZiBwb3J0cyBpcyBjcmVhdGVkLgpXaGVuIGEg
cG9ydCBpcyBhZGRlZCB0byB0aGUgbGlzdCwgaW5jcmVtZW50IG51bV9wb3J0cywKYW5kIHdoZW4g
YSBwb3J0IGlzIHJlbW92ZWQgZnJvbSB0aGUgbGlzdCwgZGVjcmVtZW50IG51bV9wb3J0cy4KCnYy
OiByZW1lbWJlciB0byBkZWNyZW1lbnQgb24gcG9ydCByZW1vdmFsCgpTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IGFkNWNjYzA4YzQwYS4uN2RlY2I1YmVm
MDYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTkxOCw2ICs5MTgs
NyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICpkcm1fZHBfYWRkX21zdF9icmFu
Y2hfZGV2aWNlKHU4IGxjdCwgdTggKnJhZCkKIAlJTklUX0xJU1RfSEVBRCgmbXN0Yi0+cG9ydHMp
OwogCWtyZWZfaW5pdCgmbXN0Yi0+dG9wb2xvZ3lfa3JlZik7CiAJa3JlZl9pbml0KCZtc3RiLT5t
YWxsb2Nfa3JlZik7CisJbXN0Yi0+bnVtX3BvcnRzID0gMDsKIAlyZXR1cm4gbXN0YjsKIH0KIApA
QCAtMTY3MCw2ICsxNjcxLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBk
cm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKIAkJbXV0ZXhfbG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsK
IAkJZHJtX2RwX21zdF90b3BvbG9neV9nZXRfcG9ydChwb3J0KTsKIAkJbGlzdF9hZGQoJnBvcnQt
Pm5leHQsICZtc3RiLT5wb3J0cyk7CisJCW1zdGItPm51bV9wb3J0cysrOwogCQltdXRleF91bmxv
Y2soJm1zdGItPm1nci0+bG9jayk7CiAJfQogCkBAIC0xNzA0LDYgKzE3MDYsNyBAQCBzdGF0aWMg
dm9pZCBkcm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQkJ
LyogcmVtb3ZlIGl0IGZyb20gdGhlIHBvcnQgbGlzdCAqLwogCQkJbXV0ZXhfbG9jaygmbXN0Yi0+
bWdyLT5sb2NrKTsKIAkJCWxpc3RfZGVsKCZwb3J0LT5uZXh0KTsKKwkJCW1zdGItPm51bV9wb3J0
cy0tOwogCQkJbXV0ZXhfdW5sb2NrKCZtc3RiLT5tZ3ItPmxvY2spOwogCQkJLyogZHJvcCBwb3J0
IGxpc3QgcmVmZXJlbmNlICovCiAJCQlkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQp
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
