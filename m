Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DBF110042
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359216E793;
	Tue,  3 Dec 2019 14:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770049.outbound.protection.outlook.com [40.107.77.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228D46E78A;
 Tue,  3 Dec 2019 14:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlYRjzFxFKxfv6CLtChbTfFrw7FPMiXI4lMgu8hbjrAXde0NKl7YHSrOJ90DoHvScm325T3RxGgoEkS+0YgTYnSigzsyCu9ABax5gliSAhRdPcISBfJfSpVnhO9AWKBNIgdRbsKT+2MJZEKTCXbkd7XfHHMldy5m7YN+ZnelRldy5ZNtDs20spaUOTA/9IhCvjjIYJzJ4ZW7XP6dWe6DndmTs63DYcd3UN646vpGu9RrT4o5KIjdYTJ6Uab1PnFjs6i/9ShoaWiGJId/k2OoNPt/7d+YVZ9FNNL4xSA2QDf9jobDcV/czgKSR5a9n/jkk2H+5bcvUhbdqa2AarHiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUrAf/Cth9DMADJ+K/FnYrRHZ2g3ZpcYnYIgZXGUrZM=;
 b=LpKgmycFG2j5J6GVz9+LHi23hxc88TFvuA3hJJH7WaY6SP6lYQUCa303TEkJFA2vZxFwOL6i/X/oKdgy9MhQy2d2rJlF1FgVi37P5mW4d6JxcT77+Kk3+1Fqvwm7uzB3XOV2vPO0nGZBkExleh8PPaR88fuKq69xtRZXBCK0pcGM/7lz7aTPmo30xrNMwUzEItfOAO8lhYF4Ob4PR1+oA0lYd9lEQ1f9cjZ+dfCiUKOBfAaUJvNtSdfOUDKc+mNRYKiyKXRcYUMt5OwvqEkRj9za74JJq5N6K2hwV9F67GXawubKAGTAgior/0i/8+XqlVbvb0jcUSo+/EH877l53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by DM6PR12MB3593.namprd12.prod.outlook.com (2603:10b6:5:11c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Tue, 3 Dec
 2019 14:35:42 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::202) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:42 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:41 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:41 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 02/17] drm/dp_mst: Parse FEC capability on MST ports
Date: Tue, 3 Dec 2019 09:35:15 -0500
Message-ID: <20191203143530.27262-3-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(189003)(199004)(6916009)(53416004)(446003)(8936002)(2876002)(1076003)(70586007)(70206006)(450100002)(2906002)(36756003)(5660300002)(478600001)(6666004)(11346002)(426003)(305945005)(50466002)(48376002)(2616005)(81156014)(356004)(186003)(26005)(81166006)(4326008)(336012)(2351001)(76176011)(51416003)(7696005)(8676002)(54906003)(50226002)(16586007)(316002)(86362001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3593; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b659b06e-1f72-4279-db45-08d777fe1373
X-MS-TrafficTypeDiagnostic: DM6PR12MB3593:
X-Microsoft-Antispam-PRVS: <DM6PR12MB359307D268210479CE9CBB03E4420@DM6PR12MB3593.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DfP9QrhwEYpXBN5wyOcHPLJ7+symQKI284c5VMo3fuqQdSyH+Yo8SpR8sm/u2B/1xC9BmpH5Ah9ourLOOsNzPf7L6n/tcVWkvG+wPdVYUbUQIifRiJn70iW37MX7hI4bqBuyiaSMIaGvInx6HeN/MMhVOZZ8/DKKdPn3yj3ZDqNTcDMmYoGhguu9r/waLsWOhTtKBDaCdxJLNKATzOr8snsmWL4oqbQ5cZVsRhnBVrhz2SJ4Cb0Nv1r5Tz3ge9RB0IsdugO6SHBqfqCs6VnoauoW2gpp8EIrWwq4XRxUhfZjL0s2P/ydltK/Audm552RYjIN43cWusKJ0U6lMCaLYJaTod4GCkW0uvYfWja3zU8K/l0vBWSFnWw6t3G9ICKOoRBsL8wjZcO/6tC2cubBvBYJW35BTvyUIxfdeBpOcCODkhACAlytFpYvAFZRr6JF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:42.7148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b659b06e-1f72-4279-db45-08d777fe1373
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3593
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUrAf/Cth9DMADJ+K/FnYrRHZ2g3ZpcYnYIgZXGUrZM=;
 b=ionndk0acie49HRvYfMfsojeB36vMPSf6XxIxBEKZTQiQKawW/RaBpeWROAAMucZAoNSewLZKUBRTiULUIp3vrVdIQ9+EmkFEMeXH7w/KqyKRjj45OtPhSQnzrwdqNGEne1Ddmr7lqNV1rc4DfDvkEmGYES/0hrY8b7ySSspAak=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKQXMgb2YgRFAxLjQs
IEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5nCmlmIEZFQyBjYW4g
YmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3b3JrLgoKVGhlIGJp
dCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNFUyBhY2sgcmVwbHks
CmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBvZiBEUCBzdGFuZGFy
ZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERTQyBzdXBwb3J0CgpT
dG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCiBpbmNs
dWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgIHwgMyArKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5k
ZXggMjYxZTJjMTgyOGM2Li4wNmFhZTliNTJlOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYwpAQCAtODQ2LDYgKzg0Niw3IEBAIHN0YXRpYyBib29sIGRybV9kcF9zaWRlYmFu
ZF9wYXJzZV9lbnVtX3BhdGhfcmVzb3VyY2VzX2FjayhzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kCiB7
CiAJaW50IGlkeCA9IDE7CiAJcmVwbXNnLT51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVyID0g
KHJhdy0+bXNnW2lkeF0gPj4gNCkgJiAweGY7CisJcmVwbXNnLT51LnBhdGhfcmVzb3VyY2VzLmZl
Y19jYXBhYmxlID0gcmF3LT5tc2dbaWR4XSAmIDB4MTsKIAlpZHgrKzsKIAlpZiAoaWR4ID4gcmF3
LT5jdXJsZW4pCiAJCWdvdG8gZmFpbF9sZW47CkBAIC0yODk0LDYgKzI4OTUsNyBAQCBkcm1fZHBf
c2VuZF9lbnVtX3BhdGhfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAq
bWdyLAogCQkJCSAgICAgIHBhdGhfcmVzLT5hdmFpbF9wYXlsb2FkX2J3X251bWJlcik7CiAJCQlw
b3J0LT5hdmFpbGFibGVfcGJuID0KIAkJCQlwYXRoX3Jlcy0+YXZhaWxfcGF5bG9hZF9id19udW1i
ZXI7CisJCQlwb3J0LT5mZWNfY2FwYWJsZSA9IHBhdGhfcmVzLT5mZWNfY2FwYWJsZTsKIAkJfQog
CX0KIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1
ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKaW5kZXggNjg2NTY5MTNjZmU1Li4wY2FkYTAxZTgx
MzkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApAQCAtMTU2LDYgKzE1Niw4IEBAIHN0cnVjdCBk
cm1fZHBfbXN0X3BvcnQgewogCSAqIGF1ZGlvLWNhcGFibGUuCiAJICovCiAJYm9vbCBoYXNfYXVk
aW87CisKKwlib29sIGZlY19jYXBhYmxlOwogfTsKIAogLyoqCkBAIC0zODMsNiArMzg1LDcgQEAg
c3RydWN0IGRybV9kcF9wb3J0X251bWJlcl9yZXEgewogCiBzdHJ1Y3QgZHJtX2RwX2VudW1fcGF0
aF9yZXNvdXJjZXNfYWNrX3JlcGx5IHsKIAl1OCBwb3J0X251bWJlcjsKKwlib29sIGZlY19jYXBh
YmxlOwogCXUxNiBmdWxsX3BheWxvYWRfYndfbnVtYmVyOwogCXUxNiBhdmFpbF9wYXlsb2FkX2J3
X251bWJlcjsKIH07Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
