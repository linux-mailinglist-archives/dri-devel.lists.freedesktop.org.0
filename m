Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020E9B7A8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 22:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1186ED38;
	Fri, 23 Aug 2019 20:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B806ED39
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 20:28:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMzWM5GokugsqEVI4pjnFeXRQbVAg8CG0CrzeEdMSyfqGxSp2GGucrRldw9QwgsCcxfaVMZ1gxs0ap81PJGI+jVJYw7m68KT1WAXZwsycSGUggRH2MeJqM6Mk/qlerXTUDkq8mB6s6phpO9wyM2uF5lbvWGROHmvUs1Cc096Aisd1HDF7svdY8e8h5Xh0+1FguMn+HcG6UwAiOkIXeAqRXikfaOcu0j91teprJEdC7EYaK5VnbUSVXGM3uBQP52JLvSL/0b2EhSz86Dd7tKk5YBAcZoggJDzNpCdFe3m7AojXhW9uBG45eIfyaOUwyErLCnidutcav4ikRE333Mvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=503SnNrIrZaREh/JhtQyArsr1JUos9V//6Iu7blBjgk=;
 b=AdppCSof/j1mIK+DXIRo3XOXBaqV1SztpQT0x/E4z6oycGXkL6vjcjYAa/k6SXH3HVgCeZTWDl2FcfBxj+h7ktVHWsyIM4Nz4uHbJvm9w4Ckeklh9tzSYy2tJ5de5DrkFEeIaIIJsliQ2ZiJ9oHbMB5xTexv3cteLBnsyk01uaAnLbaVmHDmUg3Annyu7ddhnf7feN6jJymzeRSA9RdV9Vs5IAaV3PzyOw/aIQJGQKrYHfalmxy6oPTfn9IsYEUdJjkUqt3nKOEjeS4t/iy+6NzIKHQy3yCfSEcoeI02iW2NAZvOaEjSvdCiHIhnPypT4+h5vCqtoviVZJbN2hkoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0045.namprd12.prod.outlook.com (2603:10b6:903:129::31)
 by BN6PR12MB1268.namprd12.prod.outlook.com (2603:10b6:404:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Fri, 23 Aug
 2019 20:28:17 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by CY4PR12CA0045.outlook.office365.com
 (2603:10b6:903:129::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Fri, 23 Aug 2019 20:28:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 23 Aug 2019 20:28:16 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 23 Aug 2019 15:28:12 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 4/5] drm/dp_mst: Fill branch->num_ports
Date: Fri, 23 Aug 2019 16:28:08 -0400
Message-ID: <20190823202809.15934-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823202809.15934-1-David.Francis@amd.com>
References: <20190823202809.15934-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(47776003)(16586007)(186003)(26005)(336012)(4326008)(70206006)(6916009)(70586007)(476003)(2616005)(11346002)(76176011)(2351001)(51416003)(5660300002)(1076003)(446003)(316002)(478600001)(86362001)(81156014)(81166006)(126002)(53936002)(8936002)(50466002)(426003)(305945005)(8676002)(6666004)(356004)(2906002)(50226002)(49486002)(36756003)(14444005)(48376002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3db06f4-f241-40cc-d992-08d728086e04
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1268DCED461E6F623F0AD40AEFA40@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0138CD935C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VrYeZbjOZpdD3U4Y4DtGsiYa4R+EaOxY9DcTYVNw70jNP2I8vNeZZLc6vK/mA3+XX4ef2FzG67I3vEPoSkdKAoSCnRwasSFXCdV+IZQLr/4yQDh3HT/5KJstsL31ghyx1ZsphkXlWid1k1jVDbDtAyQtk5s4Yzb9tCE41FKozlpzSM98Al092yh8mflnQdsC8N4gGHUNsDBi9tFaHcwKiBR6TEMmfXGHhbU/E1O057t+/XxdehMzAUqegxodSe2Q88fflB8vWYjqUc81jXF8oYtc8bwbbidwKZXjMbroj78yY3oltq5ATkM+EK4tPAFpw08Ts7rxdaylh/45v8g125kJvo0SHIfO6mb7zUTKKPwxR0HZQFldcmmv9xuj3c8zkrik47q9hsNdr6WLQ+GCpgb8BISW6NBZVvFWhhFjfZc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2019 20:28:16.5474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3db06f4-f241-40cc-d992-08d728086e04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=503SnNrIrZaREh/JhtQyArsr1JUos9V//6Iu7blBjgk=;
 b=Ke9+8u8sv3nidn1GCyRNsskW6B4BnrAiioksFxj4ZcS6LVFedRvJZs4zBncjpl1IilS6PaO77Lu6MyBnWukRJEtrx/cbMjAQxUGzol6dHuQB581+H+Xr4mOtSdo6RfRh+nHW/pjEE/Y65lAMMYViziilGCFU4/CMUkQRXLKxuCM=
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

VGhpcyBmaWVsZCBvbiBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJdCBpcyBp
bml0aWFsaXplZCB0byB6ZXJvIHdoZW4gdGhlIHBvcnQgaXMga3phbGxvY2NlZC4KV2hlbiBhIHBv
cnQgaXMgYWRkZWQgdG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMsCmFuZCB3aGVuIGEg
cG9ydCBpcyByZW1vdmVkIGZyb20gdGhlIGxpc3QsIGRlY3JlbWVudCBudW1fcG9ydHMuCgp2Mjog
cmVtZW1iZXIgdG8gZGVjcmVtZW50IG9uIHBvcnQgcmVtb3ZhbAp2MzogZG9uJ3QgZXhwbGljaXRs
eSBpbml0IHRvIDAKClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpp
bmRleCAxMWIwMmY2YjllOGEuLmEzOWU0MmM3ZDg2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCkBAIC0xNjY5LDYgKzE2NjksNyBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfYWRk
X3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQltdXRleF9sb2NrKCZtc3Ri
LT5tZ3ItPmxvY2spOwogCQlkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0KHBvcnQpOwogCQls
aXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1zdGItPnBvcnRzKTsKKwkJbXN0Yi0+bnVtX3BvcnRzKys7
CiAJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAl9CiAKQEAgLTE3MDMsNiArMTcw
NCw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hZGRfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFu
Y2ggKm1zdGIsCiAJCQkvKiByZW1vdmUgaXQgZnJvbSB0aGUgcG9ydCBsaXN0ICovCiAJCQltdXRl
eF9sb2NrKCZtc3RiLT5tZ3ItPmxvY2spOwogCQkJbGlzdF9kZWwoJnBvcnQtPm5leHQpOworCQkJ
bXN0Yi0+bnVtX3BvcnRzLS07CiAJCQltdXRleF91bmxvY2soJm1zdGItPm1nci0+bG9jayk7CiAJ
CQkvKiBkcm9wIHBvcnQgbGlzdCByZWZlcmVuY2UgKi8KIAkJCWRybV9kcF9tc3RfdG9wb2xvZ3lf
cHV0X3BvcnQocG9ydCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
