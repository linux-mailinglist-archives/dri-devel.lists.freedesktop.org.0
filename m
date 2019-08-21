Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B1984F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD196E9DA;
	Wed, 21 Aug 2019 20:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF756E98B;
 Wed, 21 Aug 2019 20:01:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2GiV5iRTCgbcIbRxfTH6wpXRgZriMVCK9tJ41LYMcZHIcxied6anozHeCSwCQheZLMuvCZ9aK1mZTxdjjSkyK0pcFJOostFZEOcYhfXyk/eL5Dq20CWKbUSgOddXBo+hAe3HkQr1x9BsqzMZpac88nqN0kYnTWqqBmL375OrsQMN/zWKs8cq1o9na791g2IWAY3LH2HoZONa+zLno6vmTfHF3e6VnBALfCNY4/Xfazkno9MpundGqwP7LKAgrVUomFZ4AI5CxV6bUqEJNVJ0fjfH4UdjqnElEk4hxsTyNvcR+0+/Q73C1O8SsBUvcGKE2ugTwJjK/AgBtiiHBTzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6lcmM8IbjEeihjHuyWQ0gbYWu4vsd2VOF/WuQZds0Y=;
 b=gLWPDOTyESoKy7mqxziu2NezpKV7DUEzMeVQodJIk+TriYQHYHE5HSKmyHcfma4O7HeUcZ5CY1dkxU/icB4LrA4kd9ioqx+eht0/y7UrVEmbZh5rNhfHZnmH1Lr2L6Fu7lcszikirXfPmoMEyLcZNrudlJBxGeIu7RdxIjxJByz4Cj1o+vsTEjDGX0iRdMIAfJw0Q98l7gXKGdbwfruGAc+e+rQRUWyOhSKeM6/xVdl76SB+pbmUQ27pPYjpFbKDBftoEvUGXXYcEkRJ+6rbGb+D1PmCX4j+ka8NxKhE3a5TNUTCbjhldWNwpBpB44gEeSxv3JBUPdYFi79iI4vNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (2603:10b6:403:2::19)
 by SN6PR12MB2720.namprd12.prod.outlook.com (2603:10b6:805:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:01:54 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:53 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:38 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 08/16] drm/amd/display: Initialize DSC PPS variables to 0
Date: Wed, 21 Aug 2019 16:01:21 -0400
Message-ID: <20190821200129.11575-9-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(81156014)(8936002)(50226002)(426003)(26005)(81166006)(8676002)(51416003)(2906002)(50466002)(53936002)(110136005)(16586007)(70206006)(186003)(336012)(446003)(11346002)(316002)(70586007)(2616005)(126002)(486006)(476003)(36756003)(478600001)(86362001)(450100002)(1076003)(4326008)(5660300002)(305945005)(49486002)(48376002)(47776003)(6666004)(356004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2720; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59d8bda4-8b18-411e-fbca-08d7267269e2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2720; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2720:
X-Microsoft-Antispam-PRVS: <SN6PR12MB272062BECBA07C65BFEFC620EFAA0@SN6PR12MB2720.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fKeouqdYrAi88XvWzNG+NnKN1sUzDfdG69N2ze7Dl+bXPVFVHu5Hp2ul9tiwiC7f6jJEbKVXDLbI2ZcAbGYw+EHURgnIIECdK/V213AlJwOMlvTNx6Ew8ADUk7g9tutoLioONX3//Yh58sxlnNkrnv6NQjbsTTG9tGZb7acQWy476xBbz7JaMmvZH7ySSeevOdhzJQJS3Yg4nwGjBk0brphM3tQ7D5oDRjisRB2DAkDZ0z/6h8z3LJcE/1O6iAyrtPf7itj1yEThzalomiG9Hb0lblbY565JxFHWmPsNIXxobXgd+9e1jVsvmtCHMwqrjqu2B06OtvpXRfYrjqoPvZbY5XXaDAJRH3lhW5UTGJ1XHgElpPKPyemn8HKfQFRxKCwYeV42c6uIpjrceycKjUskQBXTM8+B0y/BA/yAEVg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:53.8353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d8bda4-8b18-411e-fbca-08d7267269e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2720
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6lcmM8IbjEeihjHuyWQ0gbYWu4vsd2VOF/WuQZds0Y=;
 b=Pw0Hsk6Jn4drPGe3yHVhAyzc2iOrUHoNP5PsP39i/or+Pmov3PQJfzpT7VTbCfirEoGDZm/vIUsB3oc9bOPz5fpoTuZpX3oaAPnb7CQXZTRf6zcMIhrtj0dVm/KhCtMuASv8pbmVyUZQKt2n7U/4OIwhzkNGOuQ0Is3kYRb7ots=
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

Rm9yIERTQyBNU1QsIHNvbWV0aW1lcyBtb25pdG9ycyB3b3VsZCBicmVhayBvdXQKaW4gZnVsbC1z
Y3JlZW4gc3RhdGljLiBUaGUgaXNzdWUgdHJhY2VkIGJhY2sgdG8gdGhlClBQUyBnZW5lcmF0aW9u
IGNvZGUsIHdoZXJlIHRoZXNlIHZhcmlhYmxlcyB3ZXJlIGJlaW5nIHVzZWQKdW5pbml0aWFsaXpl
ZCBhbmQgd2VyZSBwaWNraW5nIHVwIGdhcmJhZ2UuCgptZW1zZXQgdG8gMCB0byBhdm9pZCB0aGlz
CgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3Nz
LmMgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2Rz
Yy5jICAgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jCmluZGV4
IDM1YzU0NjdlNjBlOC4uNjE5YWM0OGVkZDA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYwpAQCAtNDkxLDYgKzQ5MSw5IEBAIGJv
b2wgZHBfc2V0X2RzY19wcHNfc2RwKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGJvb2wgZW5h
YmxlKQogCQlzdHJ1Y3QgZHNjX2NvbmZpZyBkc2NfY2ZnOwogCQl1aW50OF90IGRzY19wYWNrZWRf
cHBzWzEyOF07CiAKKwkJbWVtc2V0KCZkc2NfY2ZnLCAwLCBzaXplb2YoZHNjX2NmZykpOworCQlt
ZW1zZXQoZHNjX3BhY2tlZF9wcHMsIDAsIDEyOCk7CisKIAkJLyogRW5hYmxlIERTQyBodyBibG9j
ayAqLwogCQlkc2NfY2ZnLnBpY193aWR0aCA9IHN0cmVhbS0+dGltaW5nLmhfYWRkcmVzc2FibGUg
KyBzdHJlYW0tPnRpbWluZy5oX2JvcmRlcl9sZWZ0ICsgc3RyZWFtLT50aW1pbmcuaF9ib3JkZXJf
cmlnaHQ7CiAJCWRzY19jZmcucGljX2hlaWdodCA9IHN0cmVhbS0+dGltaW5nLnZfYWRkcmVzc2Fi
bGUgKyBzdHJlYW0tPnRpbWluZy52X2JvcmRlcl90b3AgKyBzdHJlYW0tPnRpbWluZy52X2JvcmRl
cl9ib3R0b207CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfZHNjLmMKaW5kZXggMzc5YzllNGFjNjNiLi4xNmRlYmU2ZDg5ZjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKQEAgLTIwNyw2ICsy
MDcsOSBAQCBzdGF0aWMgYm9vbCBkc2MyX2dldF9wYWNrZWRfcHBzKHN0cnVjdCBkaXNwbGF5X3N0
cmVhbV9jb21wcmVzc29yICpkc2MsIGNvbnN0IHN0cgogCXN0cnVjdCBkc2NfcmVnX3ZhbHVlcyBk
c2NfcmVnX3ZhbHM7CiAJc3RydWN0IGRzY19vcHRjX2NvbmZpZyBkc2Nfb3B0Y19jZmc7CiAKKwlt
ZW1zZXQoJmRzY19yZWdfdmFscywgMCwgc2l6ZW9mKGRzY19yZWdfdmFscykpOworCW1lbXNldCgm
ZHNjX29wdGNfY2ZnLCAwLCBzaXplb2YoZHNjX29wdGNfY2ZnKSk7CisKIAlEQ19MT0dfRFNDKCJH
ZXR0aW5nIHBhY2tlZCBEU0MgUFBTIGZvciBEU0MgQ29uZmlnOiIpOwogCWRzY19jb25maWdfbG9n
KGRzYywgZHNjX2NmZyk7CiAJRENfTE9HX0RTQygiRFNDIFBpY3R1cmUgUGFyYW1ldGVyIFNldCAo
UFBTKToiKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
