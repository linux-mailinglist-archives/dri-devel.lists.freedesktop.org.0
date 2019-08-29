Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783BA116C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 08:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC80F89FA7;
	Thu, 29 Aug 2019 06:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800084.outbound.protection.outlook.com [40.107.80.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EAF89F9F;
 Thu, 29 Aug 2019 06:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBuRjwJCzGUUBJZCCQ74Iq/c6lhLLjrizY7gZPeOIw+emp/FOGtXMzxYRDTBnP/i1wYO5XWPxcNEvuThcOlDPmrOr658eBNO0K0Rynos9JXPszEpNqHolpMHXP3fKFjKVQsry1hOgdpbGp9vWNsLMMbeAxcPYAQP4D4oNbNplrkKSo4R1UJzmlPWpVzrabkAne0+8lzXsGfcz8A1CtX6Kp6pmbVDLmtpVKHoktwk5IxNP9I+TQUw3+MOjUC/QBuIulogXXTs50DqnK0YBQHMMPcoIkciHglQ8j90rwIDkppsWg/c7pv/CV2oMBIavVhOKj6CKaoPt8oynpvXP36Gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUTefRHhP4jPk7HjUkR/MCUopIKc0hLAEG/HgFFHU9k=;
 b=HHSUYJaynJcMpFJNf9Cr+QYZ21ioyqd7V/VTlmrJZ+AAnvl0hxmIcDRwYx+AN/vfdUwrzsEJQHvP43RiuTeC5p3/yDVwKjflXYLQCCcSmeK8yh5QRqDJTYOj2Ys7uvOJRDKmBqZbUUkAqQo5V0pwdxG/9+PPAyVyLtXURsz2Vq9+oez2Oly0cRmEapqpM9RZPBMGLpIKpWk/5vHQwmZvsWq/qC1wBwnhJfPfEXrRR0PwzEVy67dHO5b/86ahk+yYLjxGark1Fy1mUdxl/XcwV1VKCbT7LCBm9/LGJV9f4ZHlYBACLu6o2IcKnxBosTWwT1b/mj/P9RO4P0bYZNxAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=cray.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by DM6PR12MB2715.namprd12.prod.outlook.com (2603:10b6:5:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 06:05:48 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 06:05:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 06:05:47 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 01:05:45 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>
Subject: [PATCH RFC v4 05/16] drm, cgroup: Add peak GEM buffer allocation stats
Date: Thu, 29 Aug 2019 02:05:22 -0400
Message-ID: <20190829060533.32315-6-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829060533.32315-1-Kenny.Ho@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(6666004)(5660300002)(2870700001)(11346002)(478600001)(2201001)(86362001)(2616005)(1076003)(186003)(36756003)(26005)(70586007)(81166006)(336012)(476003)(126002)(356004)(81156014)(70206006)(47776003)(486006)(53936002)(76176011)(48376002)(305945005)(446003)(426003)(2906002)(4326008)(316002)(8936002)(51416003)(7696005)(53416004)(14444005)(50226002)(50466002)(8676002)(110136005)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca76ff9d-9db3-4111-832c-08d72c46f000
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27154493C51CA0D3E26A7B2D83A20@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0XM5WBzGTx5oyxJL4ThUvtNyfVdJQT+9HZj6FIfo9Lt+T2MGu8sERR+OMKA5rkx49ngJRhzijBAGVVzhEGelxnatHFzdSQPu2V5p5tvQr8ZE6tOXuZMhHvBEcivPcaz2dGCFv3hvuSKTcTU9/Z8TWAjzP2UF4wYOD7OMQjbfWjpqV5Ov8CSQUtxqj76Q6HjQ7rMNTDZ7U883movIFZcnKbcNzw5RuqFIPqNhrk8bMXNMcxBOnjhDBL63gZggut6o/fXCBj8tBHiINuwrCC9YHCN/40dTjrWVvEZGaA3gB8CekE6aRqkw33mZj8/BOaN0McmFrmuYglo6rkF9PmkflX1yPvaKam9X0+oH7tF/Ug27ECu//wFyoGTRcwff2ukJsYGsQptSYgHbFc8sWXKi77YA8DxN430CxbGiCxyEkf0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 06:05:47.8790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca76ff9d-9db3-4111-832c-08d72c46f000
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUTefRHhP4jPk7HjUkR/MCUopIKc0hLAEG/HgFFHU9k=;
 b=jzN+mFFc+4qYtHsla0OEKe6D2wdCWUaDHzLWG1MacGiGMvwRFwfjAFZlCCdj7B8DxMvqJp425EksZ7z7zOgbBjzIs8icunjae/poGS6MbJ1gFUeOvgJ7cjshpAeimyC0P4KJVxY0UV17Z+qElRvQ8tQmXCgSjaUepAG4t0rv3xg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; cray.com; dkim=none (message not signed)
 header.d=none;cray.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtLmJ1ZmZlci5wZWFrLnN0YXRzCiAgICAgICAgQSByZWFkLW9ubHkgZmxhdC1rZXllZCBmaWxl
IHdoaWNoIGV4aXN0cyBvbiBhbGwgY2dyb3Vwcy4gIEVhY2gKICAgICAgICBlbnRyeSBpcyBrZXll
ZCBieSB0aGUgZHJtIGRldmljZSdzIG1ham9yOm1pbm9yLgoKICAgICAgICBMYXJnZXN0IChoaWdo
IHdhdGVyIG1hcmspIEdFTSBidWZmZXIgYWxsb2NhdGVkIGluIGJ5dGVzLgoKQ2hhbmdlLUlkOiBJ
NzllNTYyMjIxNTFhM2QzM2E3NmE2MWJhMDA5N2ZlOTNlYmIzNDQ5ZgpTaWduZWQtb2ZmLWJ5OiBL
ZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L2Nncm91cC12Mi5yc3QgfCAgNiArKysrKysKIGluY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oICAg
ICAgICAgICAgICB8ICAzICsrKwoga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgICAgICAgICAg
ICAgIHwgMTIgKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12Mi5yc3QgYi9E
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12Mi5yc3QKaW5kZXggMGUyOWQxMzZlMmY5
Li44NTg4YTBmZmM2OWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dy
b3VwLXYyLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12Mi5yc3QK
QEAgLTE5MDcsNiArMTkwNywxMiBAQCBEUk0gSW50ZXJmYWNlIEZpbGVzCiAKIAlUb3RhbCBHRU0g
YnVmZmVyIGFsbG9jYXRpb24gaW4gYnl0ZXMuCiAKKyAgZHJtLmJ1ZmZlci5wZWFrLnN0YXRzCisJ
QSByZWFkLW9ubHkgZmxhdC1rZXllZCBmaWxlIHdoaWNoIGV4aXN0cyBvbiBhbGwgY2dyb3Vwcy4g
IEVhY2gKKwllbnRyeSBpcyBrZXllZCBieSB0aGUgZHJtIGRldmljZSdzIG1ham9yOm1pbm9yLgor
CisJTGFyZ2VzdCAoaGlnaCB3YXRlciBtYXJrKSBHRU0gYnVmZmVyIGFsbG9jYXRlZCBpbiBieXRl
cy4KKwogR0VNIEJ1ZmZlciBPd25lcnNoaXAKIH5+fn5+fn5+fn5+fn5+fn5+fn5+CiAKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBf
ZHJtLmgKaW5kZXggMWQ4YTdmMmNkYjRlLi45NzRkMzkwY2ZhNGYgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvY2dyb3VwX2RybS5oCisrKyBiL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oCkBA
IC0xNSw2ICsxNSw3IEBACiAKIGVudW0gZHJtY2dfcmVzX3R5cGUgewogCURSTUNHX1RZUEVfQk9f
VE9UQUwsCisJRFJNQ0dfVFlQRV9CT19QRUFLLAogCV9fRFJNQ0dfVFlQRV9MQVNULAogfTsKIApA
QCAtMjQsNiArMjUsOCBAQCBlbnVtIGRybWNnX3Jlc190eXBlIHsKIHN0cnVjdCBkcm1jZ19kZXZp
Y2VfcmVzb3VyY2UgewogCS8qIGZvciBwZXIgZGV2aWNlIHN0YXRzICovCiAJczY0CQkJYm9fc3Rh
dHNfdG90YWxfYWxsb2NhdGVkOworCisJczY0CQkJYm9fc3RhdHNfcGVha19hbGxvY2F0ZWQ7CiB9
OwogCiAvKioKZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9rZXJuZWwvY2dyb3Vw
L2RybS5jCmluZGV4IDg3YWU5MTY0ZDhkOC4uMGJmNWI5NTY2OGM0IDEwMDY0NAotLS0gYS9rZXJu
ZWwvY2dyb3VwL2RybS5jCisrKyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMKQEAgLTEyOSw2ICsxMjks
OSBAQCBzdGF0aWMgdm9pZCBkcm1jZ19wcmludF9zdGF0cyhzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jl
c291cmNlICpkZHIsCiAJY2FzZSBEUk1DR19UWVBFX0JPX1RPVEFMOgogCQlzZXFfcHJpbnRmKHNm
LCAiJWxsZFxuIiwgZGRyLT5ib19zdGF0c190b3RhbF9hbGxvY2F0ZWQpOwogCQlicmVhazsKKwlj
YXNlIERSTUNHX1RZUEVfQk9fUEVBSzoKKwkJc2VxX3ByaW50ZihzZiwgIiVsbGRcbiIsIGRkci0+
Ym9fc3RhdHNfcGVha19hbGxvY2F0ZWQpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlzZXFfcHV0
cyhzZiwgIlxuIik7CiAJCWJyZWFrOwpAQCAtMTc3LDYgKzE4MCwxMiBAQCBzdHJ1Y3QgY2Z0eXBl
IGZpbGVzW10gPSB7CiAJCS5wcml2YXRlID0gRFJNQ0dfQ1RGX1BSSVYoRFJNQ0dfVFlQRV9CT19U
T1RBTCwKIAkJCQkJCURSTUNHX0ZUWVBFX1NUQVRTKSwKIAl9LAorCXsKKwkJLm5hbWUgPSAiYnVm
ZmVyLnBlYWsuc3RhdHMiLAorCQkuc2VxX3Nob3cgPSBkcm1jZ19zZXFfc2hvdywKKwkJLnByaXZh
dGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR19UWVBFX0JPX1BFQUssCisJCQkJCQlEUk1DR19GVFlQ
RV9TVEFUUyksCisJfSwKIAl7IH0JLyogdGVybWluYXRlICovCiB9OwogCkBAIC0yNjAsNiArMjY5
LDkgQEAgdm9pZCBkcm1jZ19jaGdfYm9fYWxsb2Moc3RydWN0IGRybWNnICpkcm1jZywgc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAkJZGRyID0gZHJtY2ctPmRldl9yZXNvdXJjZXNbZGV2SWR4XTsK
IAogCQlkZHItPmJvX3N0YXRzX3RvdGFsX2FsbG9jYXRlZCArPSAoczY0KXNpemU7CisKKwkJaWYg
KGRkci0+Ym9fc3RhdHNfcGVha19hbGxvY2F0ZWQgPCAoczY0KXNpemUpCisJCQlkZHItPmJvX3N0
YXRzX3BlYWtfYWxsb2NhdGVkID0gKHM2NClzaXplOwogCX0KIAltdXRleF91bmxvY2soJmRldi0+
ZHJtY2dfbXV0ZXgpOwogfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
