Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD60711004A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F194D6E79B;
	Tue,  3 Dec 2019 14:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720077.outbound.protection.outlook.com [40.107.72.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B186E6E79A;
 Tue,  3 Dec 2019 14:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsosUfT2bhT6DCInXPTOL/QOScJiPEBpYorzW8C7/m4OMXzjJjxlEjM/J6sJdxaRJSb2lSXKzCDaNOl6tR7iWCu2aZEv0LduiZ0JmXkjJNJ42LmYK/SwRm0TGwMS23Ktx7oZ0SpO9HoEWIKtLHj2x+YaCyT8RlUmhVpXvYltYYcXGUuPafrPU9QtNy9UF0M/gxba1/xc17MBCGk0FPVYITotlV/B0gpb21j3B2dhVCLiWaBfXNU6PIy7ZGUVjTdDcc8qK1g/J/ec7DfpLXnKyNA6h+FjkYFC2XjycMuQG1CTmDVbFVLmTf2UUx+sLZEx4XPu5J8X7FgEXQnGAYfelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NlOTG3/uWiM+y3cYZNoNSd6OZOdSCN8mOi11eGW+1g=;
 b=UKAivbtwtwxVi291x++RnbT5dn3g4F1+mImMATRByumuC1wsDAWvQUMUPe2aK+kpLfiuqeMxFYCoDxPv3v5nF8QX9ixfj+xs+awIs14LIMEVM2OBKJpvWOYBNqxzA110s/FOVEA5aP1uyi+w4MWzHcD4CsKSKjQYnSYB0iN32hzi7Wg5X9DzxJpHI8qrzYmQxOBuqkPl7SKr3f9/O6nZLfqL+9k4xo+kppZyxxNW8P4FZ5z+B3GjxUjlmm5LU8iC2UbconSfWbXG8oNWSiJSJqBqYcX0CNy1KzPyT0oNUztgxyvoOgSwDBBA7pSm3OmDMQbXAdRhn8YFjMB+64oZ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by BN7PR12MB2772.namprd12.prod.outlook.com (2603:10b6:408:26::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 14:35:44 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::202) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:43 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:42 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:42 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 04/17] drm/dp_mst: Fill branch->num_ports
Date: Tue, 3 Dec 2019 09:35:17 -0500
Message-ID: <20191203143530.27262-5-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(428003)(199004)(189003)(70586007)(5660300002)(70206006)(4326008)(2351001)(81166006)(81156014)(8936002)(450100002)(1076003)(6916009)(8676002)(6666004)(53416004)(50466002)(50226002)(48376002)(356004)(316002)(36756003)(16586007)(54906003)(478600001)(76176011)(336012)(186003)(51416003)(11346002)(446003)(26005)(2906002)(2876002)(305945005)(86362001)(7696005)(14444005)(426003)(2616005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2772; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66741e87-9021-4d20-2e98-08d777fe142d
X-MS-TrafficTypeDiagnostic: BN7PR12MB2772:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2772FDEBDFD5775FC4946AE1E4420@BN7PR12MB2772.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TS7OO9W+vZ4l7JhMqEfdi2lt5J73MoU13swcpGkxARWo/wRH8TOHu7w+GePqBELQPFk5D70gydHpGXzqv8cwg/n+qCJRbFxoTDeUGcWU6ruiKzVkqaRunQ+q0uOA9rQUnzm1NOQWkBiNvriAoYN1aRO1RY5mFx/wB5UcmzeJtaIZTaAxoX/QT2QFRD4VCHzzlk05fzCnuVb840UqdrCXEpXlhP//a7rJ4l1qk1C2DYZiEG0IFP3WOVxWdmSND4LP9/LiphNCm2moqOq0NWsK4GU4JOi7r/eRzFXd71svIzE5RP7hLCR3rOmk/+kRNgE+RELXB4Abe4JvmmFnutO/vlJqL4/AE+NTXc22qtdFWSFrfuNvMKF9LfRvMxyv1XJ5fttN5DVAwf5U1yQUEl3cesaQ0DwTXBduyAs+zjoUfk3H0xB88l5wO5L28MpP1Bf9KtiakcmSXzfWYnwEk7FHcJiq3He2rnv9d5UUnmtEt3PhK6vbeylIle+qBiYHLjQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:43.9277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66741e87-9021-4d20-2e98-08d777fe142d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2772
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NlOTG3/uWiM+y3cYZNoNSd6OZOdSCN8mOi11eGW+1g=;
 b=U1WfL6fYoqUWV34IK/km+mm6jNmqXz4jcjhVQje6tL2QQHInQBdTRyZ+TGKZ+dpbXeJ2OFeMpeKi2kv7Dua4dswL+8hmhq+qGTRqH1SAxkeOFYwLrmyn6WEsioGlYGTMZh5VG15nnF4EJfZdUJyjTXBearTT0ag1iEIyy5ghJ4w=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKVGhpcyBmaWVsZCBv
biBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJdCBpcyBpbml0aWFsaXplZCB0
byB6ZXJvIHdoZW4gdGhlIHBvcnQgaXMga3phbGxvY2NlZC4KV2hlbiBhIHBvcnQgaXMgYWRkZWQg
dG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMsCmFuZCB3aGVuIGEgcG9ydCBpcyByZW1v
dmVkIGZyb20gdGhlIGxpc3QsIGRlY3JlbWVudCBudW1fcG9ydHMuCgp2MjogcmVtZW1iZXIgdG8g
ZGVjcmVtZW50IG9uIHBvcnQgcmVtb3ZhbAp2MzogZG9uJ3QgZXhwbGljaXRseSBpbml0IHRvIDAK
ClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTog
SGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRh
IExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggMDZhYWU5YjUyZThhLi5k
NzRiNzY3ZDBmZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtMjEy
OSw2ICsyMTI5LDcgQEAgZHJtX2RwX21zdF9wb3J0X2FkZF9jb25uZWN0b3Ioc3RydWN0IGRybV9k
cF9tc3RfYnJhbmNoICptc3RiLAogCWJ1aWxkX21zdF9wcm9wX3BhdGgobXN0YiwgcG9ydC0+cG9y
dF9udW0sIHByb3BwYXRoLCBzaXplb2YocHJvcHBhdGgpKTsKIAlwb3J0LT5jb25uZWN0b3IgPSBt
Z3ItPmNicy0+YWRkX2Nvbm5lY3RvcihtZ3IsIHBvcnQsIHByb3BwYXRoKTsKIAlpZiAoIXBvcnQt
PmNvbm5lY3RvcikgeworCQltc3RiLT5udW1fcG9ydHMtLTsKIAkJcmV0ID0gLUVOT01FTTsKIAkJ
Z290byBlcnJvcjsKIAl9CkBAIC0yMjU2LDYgKzIyNTcsNyBAQCBkcm1fZHBfbXN0X2hhbmRsZV9s
aW5rX2FkZHJlc3NfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCiAJCW11dGV4
X2xvY2soJm1nci0+bG9jayk7CiAJCWRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnQocG9ydCk7
CiAJCWxpc3RfYWRkKCZwb3J0LT5uZXh0LCAmbXN0Yi0+cG9ydHMpOworCQltc3RiLT5udW1fcG9y
dHMrKzsKIAkJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxvY2spOwogCX0KIAotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
