Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 638F111005F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584E6E7BC;
	Tue,  3 Dec 2019 14:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165CC6E7AF;
 Tue,  3 Dec 2019 14:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKCTAbLroXrS1jL/VM0rf9khob+WOGt1FDia46yEQYp8Sl2JYfrGsiZm945qWLmvOIc/vbRTb3+qaQVbfE+b/so5TfKHTWyLhuciqcBtZbLUPEvEmADxhnp65NWjZJcxShCI+N/k+qQ2JYOyVLMGDVxG699HYInO5WpLiSQ7JRStybZ5XZmM2a3zB/psVbPL44rwB268l6NdMexuAlFpASKvm7k9nvotWd9Sbn1ZTMKsieTwrybfeXAukBYsOfVX/YaNI/7gpcVIOc3SGqAunGObEsh0eDsN6uYgpcuwePoIaqK1jv5aHeGVfuH5bpIM9pQ+29oSujQJPD5HtNe1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRvDXmonNfJBcpWUQ/Ic7ka7r6zhFZfN82wF/1n7LNI=;
 b=I5ZrWBDADRGX2pIYXj25e060CrIt+peXD9v+E4/w77TrNiYaSf1Ne5kIasv9x5TpGsRjZhEjvbIQyoAbVpze08t1voWwZB95XDVifQSbSYOyRWhVQleOLA9CtGjjMq4593ihmw4moXBE83EU9GaD2eHMr/nA6a2hF/hxceGE+Sid18zmXJPuYdjSS0sCFe7cIGD1elHlrH87jU6ycEOZiKehEe5oxf4v6rv7C2MU8iGpB2xoYyMuEdhYolGS1Tjd1t1fjwL4FE34DXaCrGlCiCxXR+BtonxCFhFtfUhE2jpdGCROEQYlW/m4paiHjgO8PK6d0403m0eXXyxGH7A6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17; Tue, 3 Dec
 2019 14:35:51 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:51 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:48 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:47 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 16/17] drm/dp_mst: Add helper to trigger modeset on
 affected DSC MST CRTCs
Date: Tue, 3 Dec 2019 09:35:29 -0500
Message-ID: <20191203143530.27262-17-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(428003)(189003)(199004)(2351001)(6916009)(26005)(7696005)(76176011)(51416003)(50466002)(426003)(81156014)(356004)(8676002)(11346002)(48376002)(2616005)(336012)(446003)(6666004)(1076003)(4326008)(81166006)(50226002)(186003)(478600001)(8936002)(70206006)(5660300002)(54906003)(14444005)(86362001)(305945005)(70586007)(36756003)(2906002)(53416004)(316002)(2876002)(16586007)(17423001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4194; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b353ffdd-9ba9-4b60-1bcc-08d777fe189a
X-MS-TrafficTypeDiagnostic: BY5PR12MB4194:
X-Microsoft-Antispam-PRVS: <BY5PR12MB41947A53BC86633BC5C46208E4420@BY5PR12MB4194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYNd8LAtjgAmt02vwZ0vvaGquGhethUdywnUxcdPbEctabO9RxbEedF3kKvX4ORyCpg7YooYnv6Fgr2JIyIECGX53Zpz35e/blYr1eJsVoT692DXpePCBstinqhF0adqWaYPLGC9IdQnEjWF6Jf665woGvQgrRBiSSHorvGTSFnzCOmA/lCAePHVUA3cpHk9nuYtVEwt3QAsIds+3GxjcUUQ+BHz6oWMHxKGbl1Al+rqrrxSOgrbExB7kTS1N3g/7C8bJjjyeePL2gfPPHT4hc3fLcaEOb6HzRIYQauxN1njNR9hRmTO7WMjQpn8FqrwqJ9q1Rwfz5NbfeLchqdtI0csFjMptfcmbtOcPQoCXVC+wY8INkY6izzpjseIeIrWGovC+Ithkkhf37/F7pDQH+viw6XZiR0MqO3rnMuTjvVjnThb6XSmVs5AlQ0WaDnL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:51.3465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b353ffdd-9ba9-4b60-1bcc-08d777fe189a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRvDXmonNfJBcpWUQ/Ic7ka7r6zhFZfN82wF/1n7LNI=;
 b=X6OUajaq9YfduryV8wKk9HCDFKUeE0g6aR2ojpPn5beZrEQjXSXibp3UMZASo5AOlds65OUbREHWbab/kTtU7/m2d23z5iQn0oTVVHcd+dfsw2vDdMzdzpxv4QG6rLcysa30j95EbrndT7+vSaz/Y5pzstu1g4bHU59ziGJNLZE=
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KV2hlbmV2
ZXIgYSBjb25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgY2hhbmdlZCBvcgp1bmRlcmdvZXMg
YSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRoYXQKdG9wb2xv
Z3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5nZSB0aGVpciByZXF1aXJlZApi
YW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWluZywgYXMgdGhvdWdoIGEgbW9k
ZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFtIGRpZCBub3QgY2hhbmdlIHRp
bWluZy4KCltob3ddCkFkZGluZyBoZWxwZXIgdG8gdHJpZ2dlciBtb2Rlc2V0cyBvbiBNU1QgRFND
IGNvbm5lY3RvcnMKYnkgc2V0dGluZyBtb2RlX2NoYW5nZWQgZmxhZyBvbiBDUlRDcyBpbiB0aGUg
c2FtZSB0b3BvbG9neQphcyBhZmZlY3RlZCBjb25uZWN0b3IKCnYyOiB1c2UgZHJtX2RwX21zdF9k
c2NfYXV4X2Zvcl9wb3J0IGZ1bmN0aW9uIHRvIHZlcmlmeQppZiB0aGUgcG9ydCBpcyBEU0MgY2Fw
YWJsZQoKQ2M6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+CkNjOiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tp
IDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYyB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8ICAyICsKIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDc2YmNi
YjRjZDhiNC4uZmIzNzEwYjcyN2NjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKQEAgLTQ4MDIsNiArNDgwMiw2OCBAQCBkcm1fZHBfbXN0X2F0b21pY19jaGVja190b3BvbG9n
eV9zdGF0ZShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAlyZXR1cm4gMDsK
IH0KIAorLyoqCisgKiBkcm1fZHBfbXN0X2FkZF9hZmZlY3RlZF9kc2NfY3J0Y3MKKyAqIEBzdGF0
ZTogUG9pbnRlciB0byB0aGUgbmV3ICZzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZQor
ICogQHBvcnQ6IFBvaW50ZXIgdG90aGUgcG9ydCBvZiBjb25uZWN0b3Igd2l0aCBuZXcgc3RhdGUK
KyAqCisgKiBXaGVuZXZlciB0aGVyZSBpcyBhIGNoYW5nZSBpbiBtc3QgdG9wb2xvZ3kKKyAqIERT
QyBjb25maWd1cmF0aW9uIHdvdWxkIGhhdmUgdG8gYmUgcmVjYWxjdWxhdGVkCisgKiB0aGVyZWZv
cmUgd2UgbmVlZCB0byB0cmlnZ2VyIG1vZGVzZXQgb24gYWxsIGFmZmVjdGVkCisgKiBDUlRDcyBp
biB0aGF0IHRvcG9sb2d5CisgKgorICogU2VlIGFsc286CisgKiBkcm1fZHBfbXN0X2F0b21pY19l
bmFibGVfZHNjKCkKKyAqLworaW50IGRybV9kcF9tc3RfYWRkX2FmZmVjdGVkX2RzY19jcnRjcyhz
dHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5
X21nciAqbWdyKQoreworCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlICptc3Rfc3Rh
dGU7CisJc3RydWN0IGRybV9kcF92Y3BpX2FsbG9jYXRpb24gKnBvczsKKwlzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0
YXRlOworCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNy
dGNfc3RhdGU7CisKKwlpZiAoIW1ncikgeworCQlEUk1fREVCVUdfQVRPTUlDKCJbTVNUIE1HUjol
cF0gUGFzc2VkIFRvcG9sb2d5IE1hbmFnZXIgcG9pbnRlciBpcyBwb2ludGluZyB0byBOVUxMXG4i
LCBtZ3IpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwltc3Rfc3RhdGUgPSBkcm1fYXRvbWlj
X2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUoc3RhdGUsIG1ncik7CisKKwlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5KHBvcywgJm1zdF9zdGF0ZS0+dmNwaXMsIG5leHQpIHsKKworCQljb25uZWN0b3IgPSBwb3Mt
PnBvcnQtPmNvbm5lY3RvcjsKKworCQlpZiAoIWNvbm5lY3RvcikKKwkJCXJldHVybiAtRUlOVkFM
OworCisJCWNvbm5fc3RhdGUgPSBkcm1fYXRvbWljX2dldF9jb25uZWN0b3Jfc3RhdGUoc3RhdGUs
IGNvbm5lY3Rvcik7CisKKwkJaWYgKElTX0VSUihjb25uX3N0YXRlKSkKKwkJCXJldHVybiBQVFJf
RVJSKGNvbm5fc3RhdGUpOworCisJCWNydGMgPSBjb25uX3N0YXRlLT5jcnRjOworCisJCWlmICgh
Y3J0YykKKwkJCXJldHVybiAtRUlOVkFMOworCisJCWlmICghZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0KHBvcy0+cG9ydCkpCisJCQljb250aW51ZTsKKworCQljcnRjX3N0YXRlID0gZHJtX2F0
b21pY19nZXRfY3J0Y19zdGF0ZShtc3Rfc3RhdGUtPmJhc2Uuc3RhdGUsIGNydGMpOworCisJCWlm
IChJU19FUlIoY3J0Y19zdGF0ZSkpCisJCQlyZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsKKwor
CQlEUk1fREVCVUdfQVRPTUlDKCJbTVNUIE1HUjolcF0gU2V0dGluZyBtb2RlX2NoYW5nZWQgZmxh
ZyBvbiBDUlRDICVwXG4iLCBtZ3IsIGNydGMpOworCisJCWNydGNfc3RhdGUtPm1vZGVfY2hhbmdl
ZCA9IHRydWU7CisJfQorCXJldHVybiAwOworfQorRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X2Fk
ZF9hZmZlY3RlZF9kc2NfY3J0Y3MpOworCiAvKioKICAqIGRybV9kcF9tc3RfYXRvbWljX2VuYWJs
ZV9kc2MgLSBTZXQgRFNDIEVuYWJsZSBGbGFnIHRvIE9uL09mZgogICogQHN0YXRlOiBQb2ludGVy
IHRvIHRoZSBuZXcgZHJtX2F0b21pY19zdGF0ZQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKaW5kZXgg
MjkxOWQ5Nzc2YWYzLi4xMGU5YzcwNDkwNjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApAQCAt
Nzc5LDYgKzc3OSw4IEBAIGludCBkcm1fZHBfbXN0X2F0b21pY19lbmFibGVfZHNjKHN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCQkgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9y
dCwKIAkJCQkgaW50IHBibiwgaW50IHBibl9kaXYsCiAJCQkJIGJvb2wgZW5hYmxlKTsKK2ludCBk
cm1fZHBfbXN0X2FkZF9hZmZlY3RlZF9kc2NfY3J0Y3Moc3RydWN0IGRybV9hdG9taWNfc3RhdGUg
KnN0YXRlLAorCQkJCSAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKTsK
IGludCBfX211c3RfY2hlY2sKIGRybV9kcF9hdG9taWNfcmVsZWFzZV92Y3BpX3Nsb3RzKHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCQkgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xv
Z3lfbWdyICptZ3IsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
