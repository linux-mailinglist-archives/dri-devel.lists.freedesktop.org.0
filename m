Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B29D568
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5250D6E28A;
	Mon, 26 Aug 2019 18:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680077.outbound.protection.outlook.com [40.107.68.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E6C6E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPcvOv4xc/x7qUDynaHZjN6RotDQysoTm8AKhPucnc7y58U1fe42PPu48EVhIxXDQ+pE+nU70nseAsnJkcFhKeTerX/yXWPC0fiNdoQmVF+bcjvTGAzDoRWSV7CntQfm6w+0HAGLWGj0g+5kFGtVvhqVtEub+qQA3ejAB/7NrPBZ8POq/aEz9NWjUOoZNfjx9EjIYS8M4qOCQ2qPge5DqAoMI9ybs841syAFtXxyq4RJZJ9BLDk8IIWnJADl4RR4DBD+NlHcZnybKQqg3XbBzd+567XIj3SEpc/BrOFsKEVrv0Kk2UWU+kelXUiP1hXuD7/k4FYPCjwcSY7DJpJ/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipZkMogiVTtH6unVUU46wQQJlQTxfLxLr28XtWrgkv4=;
 b=XZF1n9rC4dK5Fim3FIo2wwXSt6KWlARkmHeK/7WHAohWu25PAlIf4dolzFW1RQVmgqjxFSww8kNJ0Te6so6G96/PYIOJb+unP7PgH9HUbOMX7AxWT/qHuEPNVGLEVvQ31CRjHimf0gl8XDJH23Oti81qDYgHZUg9MG74lnZxqIcRf9xmAcBNUEE85W8jRrxvsjMyxkACbsUwaWY3CMN/FdMMqAsbVyD1a0WfV05kwSjeK1bFJN+o3rKsaV5khleNoOHchiYmpnEef8D8lWyoFpr8eeb3cfWpQCYikQcnDQxHqO+ch5k7Y9k46bAwclik8Z6XivNGGDIJpj0UQpvATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0009.namprd12.prod.outlook.com
 (2603:10b6:301:4a::19) by BN7PR12MB2706.namprd12.prod.outlook.com
 (2603:10b6:408:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Mon, 26 Aug
 2019 18:05:19 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR1201CA0009.outlook.office365.com
 (2603:10b6:301:4a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 18:05:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 18:05:18 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 13:05:15 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 4/6] drm/dp_mst: Fill branch->num_ports
Date: Mon, 26 Aug 2019 14:05:05 -0400
Message-ID: <20190826180507.17802-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826180507.17802-1-David.Francis@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(14444005)(26005)(70206006)(186003)(70586007)(53936002)(6916009)(81166006)(81156014)(426003)(2906002)(476003)(11346002)(336012)(2616005)(126002)(486006)(446003)(50226002)(5660300002)(2351001)(8676002)(51416003)(47776003)(76176011)(36756003)(8936002)(478600001)(48376002)(16586007)(316002)(50466002)(305945005)(86362001)(356004)(6666004)(49486002)(1076003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21daea10-9e96-48ec-8e9c-08d72a4ff4a7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB270638D0EDF6FC519F2A68BFEFA10@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: e0HlDAlSXG8wfJkxFZRGNhqD39Ss8Bwvy3dvexwEgzXU8b9lbbMiAu+nbnOhCprDayhbCtFZji7zVIgfKzRf9cD3iIizRUySk90l4RezMmeOkLdz6wS/tKm4AxVk4+5WurZwIS+FkmLoKLiBIvFZV3VBUd2Cpew7H2W8EmHS335f0j0QHEbx72EuneS/7TZEcJL4n3cpAHuGTWu4U+SAgts8PxFAzFGNKgrRy34DTLTJfzipq4bSKjzK871U78UUALr6JAE1hmywGvzunbN7gt2kLKoAnWfykmAvzjIoHXArMa0HAzgyHOvcC1E9VcZxEe5XOrrRpQhJObPfhUiQppH1cZ2eYZpe0IQw2bUUB6qVyKjCxmD35Jv/FhdGNci/fFdk0zc861b0sTwKtfoA6HXzhQAG5+wYhcUl2lfdhTc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 18:05:18.9727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21daea10-9e96-48ec-8e9c-08d72a4ff4a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipZkMogiVTtH6unVUU46wQQJlQTxfLxLr28XtWrgkv4=;
 b=r42c5TA7F3UmJw0DOPTrcoBIvOdq3EJPp2WQXCr1qqJCZBLuDcUOZqU8ZZ5M81Pmw0ZEMcOpHhddM7fiQ+BagfTEq357lAG06LvAL/DAm5ndQc+CcO0v+e/gGNCrKvmPtxCaUS4Xu0tDXHckRhkkMd7BbUNBsGtiBySAZ3/BOBE=
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
bmRleCA5ZjM2MDQzNTU3MDUuLjUwMjkyM2MyNDQ1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
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
