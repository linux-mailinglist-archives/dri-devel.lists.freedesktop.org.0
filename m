Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4F984F8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5F6E9CB;
	Wed, 21 Aug 2019 20:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810044.outbound.protection.outlook.com [40.107.81.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053306E98B;
 Wed, 21 Aug 2019 20:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4WU9JYWbJ6hV/tokZQejyK2TDIS2Njlnz8dONxeBXQSJ0H3PBoCtR6jbm9qx7C2bH8gXou74y6TGscdRvKnh6EiCFrrHc3Dp62oYrsYj0l1RX2JaQ3Kxq5gXbr7rcpxq5I1tJ51O49KExd+9tApN80tGo9xc3Ej6lFpbOmjBAkvuePjdS9KomWwSlI2QmfMSi/LQz2cOS4zT77kOqbq0g5RVFs6KBDF6PsSQivvvYReoF8o1FKbnhFza3IJqP0wR0P4B3dmf6niPPKItwtUN0cO0gP5UcqDyn1phg2FHGKV6VViZ3ShbUL5udustOrUYROyCzBOTc7rVKsnLEbddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFAsHpa3ext33fE5IDOFYu6iuG25mNSu022aZ7tu85g=;
 b=nNni7pf0yN1F4QrY3w3wMECH6O/gcelsfTlt0BFnRuP5E2ow6wig21kSJVlNmR4R0+KrnWYGu+a9lop6LHg5QigMjdfyqRY8qdLGVlTm2egwJoYQEjZX9F36xfiTuticmSCbvllYMgzsONF3CraPfJDEqGa4WyUnEfvDjScf+uVz/JeSEjBQu0ubIFYaTP8Q911sgpxZqwda74Lq26pkvcsifNe8XoSP6XcLd2xFcCN2/bMlXmW4rIqqpga0qMA/GKppVHOEIiU449CzJpa162Ovhmd2Fm+Jg6YQSSgLVmhPiEspQfmAACxXrRrI4F+Nrn7/RHiU+51H+TvKCua6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0008.namprd12.prod.outlook.com (2603:10b6:403:2::18)
 by CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:01:56 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN4PR12CA0008.outlook.office365.com
 (2603:10b6:403:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:56 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:39 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 09/16] drm/dp-mst: Parse FEC capability on MST ports
Date: Wed, 21 Aug 2019 16:01:22 -0400
Message-ID: <20190821200129.11575-10-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39850400004)(396003)(346002)(2980300002)(428003)(199004)(189003)(4326008)(6666004)(48376002)(476003)(50466002)(86362001)(478600001)(5660300002)(47776003)(1076003)(126002)(53936002)(2616005)(316002)(49486002)(76176011)(305945005)(11346002)(426003)(50226002)(446003)(356004)(8676002)(8936002)(81156014)(81166006)(51416003)(110136005)(486006)(2906002)(186003)(450100002)(26005)(70586007)(70206006)(16586007)(336012)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af487aaa-b63f-43fe-a2ce-08d726726b29
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1270CA53404291627F599EA0EFAA0@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Qos4A3YDCz9esHt0GjVy5B8etZiE0C2VQVpNMYLwh6euLfE6l2hXRyxjcKpg7EfC3HZ8Bp5Iyf+BcoPi7QY4iwDYNf0vmz0DZs98EZ+PB9E5v2d1E2T2sy7Sezrdzda66//iIsuwqcS4le2CeBsnijeva157tsj5T5RtfyNRulr1P80+IW5pJbwk532XcPGvF4zgW7/DxG97UiBHjxK1G1iKBKcRBvBljx86YGDfiCcVupqrXsLj2I/ddd2LIpVHimLAb622i4YMTzCh4ArhXxBBa0szPUcpP06HfDcasRvcKu8Bgid9rfpZiJoPRX4BWOh2A0N2fN6yjlTJwMPto3exgR5SQCQLJ3BgcRVRLjITKYbzZHKLlZqS7O4+QyerwnvSs3LYpEQ1qYPIM5QyPTF/JiJQiZyKT4O1lOJkrzo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:56.0190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af487aaa-b63f-43fe-a2ce-08d726726b29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFAsHpa3ext33fE5IDOFYu6iuG25mNSu022aZ7tu85g=;
 b=ogXaAchBhG9G4nIIoou0lfBHzpH9dHfD6LrNefW/5eOCADU6yS2iIx9ZzCSzjR69UdkIlF5lzm+09DJXayKbW4KQePxUNBm5Om6RerWBWVf2zGh9OWZaIQ3pnw23Dt5EUahq3EOhoC2GW7kP/hmJdnEQ5jb5frp95h5gsjlW1zw=
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

QXMgb2YgRFAxLjQsIEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5n
CmlmIEZFQyBjYW4gYmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3
b3JrLgoKVGhlIGJpdCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNF
UyBhY2sgcmVwbHksCmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBv
ZiBEUCBzdGFuZGFyZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERT
QyBzdXBwb3J0CgpTdG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyB8IDIgKysKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAz
ICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwppbmRleCAzNGE1YmRmYzU5OGIuLmFkNWNjYzA4YzQwYSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC01NTIsNiArNTUyLDcgQEAgc3RhdGlj
IGJvb2wgZHJtX2RwX3NpZGViYW5kX3BhcnNlX2VudW1fcGF0aF9yZXNvdXJjZXNfYWNrKHN0cnVj
dCBkcm1fZHBfc2lkZWJhbmQKIHsKIAlpbnQgaWR4ID0gMTsKIAlyZXBtc2ctPnUucGF0aF9yZXNv
dXJjZXMucG9ydF9udW1iZXIgPSAocmF3LT5tc2dbaWR4XSA+PiA0KSAmIDB4ZjsKKwlyZXBtc2ct
PnUucGF0aF9yZXNvdXJjZXMuZmVjX2NhcGFibGUgPSByYXctPm1zZ1tpZHhdICYgMHgxOwogCWlk
eCsrOwogCWlmIChpZHggPiByYXctPmN1cmxlbikKIAkJZ290byBmYWlsX2xlbjsKQEAgLTIxODAs
NiArMjE4MSw3IEBAIHN0YXRpYyBpbnQgZHJtX2RwX3NlbmRfZW51bV9wYXRoX3Jlc291cmNlcyhz
dHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAkJCURSTV9ERUJVR19LTVMoImVu
dW0gcGF0aCByZXNvdXJjZXMgJWQ6ICVkICVkXG4iLCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291
cmNlcy5wb3J0X251bWJlciwgdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZnVsbF9wYXls
b2FkX2J3X251bWJlciwKIAkJCSAgICAgICB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5h
dmFpbF9wYXlsb2FkX2J3X251bWJlcik7CiAJCQlwb3J0LT5hdmFpbGFibGVfcGJuID0gdHhtc2ct
PnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuYXZhaWxfcGF5bG9hZF9id19udW1iZXI7CisJCQlwb3J0
LT5mZWNfY2FwYWJsZSA9IHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmZlY19jYXBhYmxl
OwogCQl9CiAJfQogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5o
IGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAppbmRleCBkZGI1MThmMjE1N2EuLmZh
OTczNzczYTRhNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCkBAIC0xMDgsNiArMTA4LDggQEAg
c3RydWN0IGRybV9kcF9tc3RfcG9ydCB7CiAJICogYXVkaW8tY2FwYWJsZS4KIAkgKi8KIAlib29s
IGhhc19hdWRpbzsKKworCWJvb2wgZmVjX2NhcGFibGU7CiB9OwogCiAvKioKQEAgLTMxMiw2ICsz
MTQsNyBAQCBzdHJ1Y3QgZHJtX2RwX3BvcnRfbnVtYmVyX3JlcSB7CiAKIHN0cnVjdCBkcm1fZHBf
ZW51bV9wYXRoX3Jlc291cmNlc19hY2tfcmVwbHkgewogCXU4IHBvcnRfbnVtYmVyOworCWJvb2wg
ZmVjX2NhcGFibGU7CiAJdTE2IGZ1bGxfcGF5bG9hZF9id19udW1iZXI7CiAJdTE2IGF2YWlsX3Bh
eWxvYWRfYndfbnVtYmVyOwogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
