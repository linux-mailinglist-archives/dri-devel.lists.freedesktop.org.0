Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3057A1174
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 08:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD7189FA6;
	Thu, 29 Aug 2019 06:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740058.outbound.protection.outlook.com [40.107.74.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270489FA5;
 Thu, 29 Aug 2019 06:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=im8NVAFjE1M5AsM98gB+adyJp2zh7aQj5WF5vZZUSemmfdy/7BaSkJ0RWpZAVOzDUS1DcZ7X7rEy2oM/iNpcGoyKUkwHa7z35FvtrZzUlrVfx60C+t//BDx972TOEoj4Q77K2QX5T5ifXgu7VMVWIRoIU5ihliaCUGl+OaKrs7tTIs+XB2JuOgSbV94tabRliQurPwTtVrBpVIRejK36FOyFi6JKVny4qo5V6SLzVAConQg1bVWORnnYLJXpMGnQHCOykIiKjTVXHb6FIwktHutbRvvFtxeXWOGrHZFlau/TXIj5DIbfW4QQjTaZVrS77VwaMDDetmDN7kE04v12Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuU3MD5G/KwGyScm4WY/+nb67CVxHL9Q8cXeaMI9nno=;
 b=Bmv5uZbEwoz7K9RKYkfOnsFOWFR2NlnOmbGyR2Kc+sp/GOXTlXal5tBn/Kz2SZMs7LK6v1XZKGYWlanD/9ZJQ6co507ySfYL7fZGPn15mieih8nTQ/QQENKkGExmnk9Y4SlX1DJhWwC1id3CtyorKxnUvPp2goK/teW8S90kXzHODJTcCw1+cB0MJ6nm0WEeqB5XePjekeD2PsBqhPqJApFXpudhz3wLS1JTiosyEnyjgSah/YoIRQxh9TBcr63n+PRS74/u7bjFMkbTNix/Y56BUD+Wtmbu0rowoysbVrJ2S2uzne0gL3JsGbJ7CpDlouNjp7pYJcmKbfP7hN4tfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=cray.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by DM5PR12MB1274.namprd12.prod.outlook.com (2603:10b6:3:78::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Thu, 29 Aug
 2019 06:05:49 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 06:05:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 06:05:48 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 01:05:45 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>
Subject: [PATCH RFC v4 06/16] drm,
 cgroup: Add GEM buffer allocation count stats
Date: Thu, 29 Aug 2019 02:05:23 -0400
Message-ID: <20190829060533.32315-7-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829060533.32315-1-Kenny.Ho@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(186003)(47776003)(81166006)(81156014)(26005)(2906002)(2870700001)(11346002)(53936002)(70206006)(316002)(476003)(8936002)(14444005)(6666004)(7696005)(51416003)(356004)(478600001)(76176011)(53416004)(305945005)(70586007)(50466002)(86362001)(486006)(48376002)(5660300002)(4326008)(126002)(2616005)(50226002)(446003)(110136005)(36756003)(1076003)(2201001)(336012)(426003)(8676002)(921003)(2101003)(1121003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1274; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32447f36-cf7d-44e3-ad31-08d72c46f09d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1274; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1274:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12746DF3BD9394FD6BA03A6C83A20@DM5PR12MB1274.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5ATGvrApfPfk/JJjeEjh6ymii2NrqmC+wTZx8m9aoa9Li2SP+PVsRtPwXaEBWl1D7R488p/lDk/k6XZhUQjiDMaROaMjv3jv7N3swE5MHIDA1aTZ4oNSsQ3tGGPOUK+C/X69kiIHla/rUPMbCN00n1BtpAyOQcsBCSRMAU+NhyMSqx7O+c7AG0oPivdKDWmeNEstjZH6wwtIwo/bJAng3ruqhUdvQlLs40I3tZBDVxtckgEJNBpE8DMSKIHY16BIgH0Yv30pzv0fZdqOw6bCOHoJOgcUuiNOTUKKm0yZ1sZma5AriJJJ9B098wkBZzE7YUtXh55JLYmLaVGU8bzzYsH/w5u0K8qRrbj1FdxqTVQq3lAEi25simORrik10Hvx9qlyI66cZm/dj/7btDyYhCQ5WhuzPBORwj9WkQFHLb0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 06:05:48.9206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32447f36-cf7d-44e3-ad31-08d72c46f09d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuU3MD5G/KwGyScm4WY/+nb67CVxHL9Q8cXeaMI9nno=;
 b=v+w/3TNRyMI/pOQ27dHWhM92m0fPeo7cp/AoLkIkFjtIxANizkFrQRwdisrN/yYH/oPNGvnV6yjGJiIXlgxj6VU6d5hIfnGYV64/NyPf6AOIvuCNnH2d9SGuXGAr2Bli0SZqKacTP2sdRxYPgykPu7f+HMicL1KwMyjVYPi+MXA=
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

ZHJtLmJ1ZmZlci5jb3VudC5zdGF0cwogICAgICAgIEEgcmVhZC1vbmx5IGZsYXQta2V5ZWQgZmls
ZSB3aGljaCBleGlzdHMgb24gYWxsIGNncm91cHMuICBFYWNoCiAgICAgICAgZW50cnkgaXMga2V5
ZWQgYnkgdGhlIGRybSBkZXZpY2UncyBtYWpvcjptaW5vci4KCiAgICAgICAgVG90YWwgbnVtYmVy
IG9mIEdFTSBidWZmZXIgYWxsb2NhdGVkLgoKQ2hhbmdlLUlkOiBJZDNlMTgwOWQ1ZmVlODU2MmU0
N2E3ZDJiOTYxNjg4OTU2ZDg0NGVjNgpTaWduZWQtb2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9A
YW1kLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Nncm91cC12Mi5yc3QgfCAg
NiArKysrKysKIGluY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oICAgICAgICAgICAgICB8ICAzICsr
Kwoga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysr
KysrKysrKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYy
LnJzdCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYyLnJzdAppbmRleCA4NTg4
YTBmZmM2OWQuLjRkYzcyMzM5YTliNiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9jZ3JvdXAtdjIucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3Vw
LXYyLnJzdApAQCAtMTkxMyw2ICsxOTEzLDEyIEBAIERSTSBJbnRlcmZhY2UgRmlsZXMKIAogCUxh
cmdlc3QgKGhpZ2ggd2F0ZXIgbWFyaykgR0VNIGJ1ZmZlciBhbGxvY2F0ZWQgaW4gYnl0ZXMuCiAK
KyAgZHJtLmJ1ZmZlci5jb3VudC5zdGF0cworCUEgcmVhZC1vbmx5IGZsYXQta2V5ZWQgZmlsZSB3
aGljaCBleGlzdHMgb24gYWxsIGNncm91cHMuICBFYWNoCisJZW50cnkgaXMga2V5ZWQgYnkgdGhl
IGRybSBkZXZpY2UncyBtYWpvcjptaW5vci4KKworCVRvdGFsIG51bWJlciBvZiBHRU0gYnVmZmVy
IGFsbG9jYXRlZC4KKwogR0VNIEJ1ZmZlciBPd25lcnNoaXAKIH5+fn5+fn5+fn5+fn5+fn5+fn5+
CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oIGIvaW5jbHVkZS9saW51
eC9jZ3JvdXBfZHJtLmgKaW5kZXggOTc0ZDM5MGNmYTRmLi45NzJmN2FhOTc1YjUgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oCisrKyBiL2luY2x1ZGUvbGludXgvY2dyb3Vw
X2RybS5oCkBAIC0xNiw2ICsxNiw3IEBACiBlbnVtIGRybWNnX3Jlc190eXBlIHsKIAlEUk1DR19U
WVBFX0JPX1RPVEFMLAogCURSTUNHX1RZUEVfQk9fUEVBSywKKwlEUk1DR19UWVBFX0JPX0NPVU5U
LAogCV9fRFJNQ0dfVFlQRV9MQVNULAogfTsKIApAQCAtMjcsNiArMjgsOCBAQCBzdHJ1Y3QgZHJt
Y2dfZGV2aWNlX3Jlc291cmNlIHsKIAlzNjQJCQlib19zdGF0c190b3RhbF9hbGxvY2F0ZWQ7CiAK
IAlzNjQJCQlib19zdGF0c19wZWFrX2FsbG9jYXRlZDsKKworCXM2NAkJCWJvX3N0YXRzX2NvdW50
X2FsbG9jYXRlZDsKIH07CiAKIC8qKgpkaWZmIC0tZ2l0IGEva2VybmVsL2Nncm91cC9kcm0uYyBi
L2tlcm5lbC9jZ3JvdXAvZHJtLmMKaW5kZXggMGJmNWI5NTY2OGM0Li44NWU0NmVjZTRhODIgMTAw
NjQ0Ci0tLSBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMKKysrIGIva2VybmVsL2Nncm91cC9kcm0uYwpA
QCAtMTMyLDYgKzEzMiw5IEBAIHN0YXRpYyB2b2lkIGRybWNnX3ByaW50X3N0YXRzKHN0cnVjdCBk
cm1jZ19kZXZpY2VfcmVzb3VyY2UgKmRkciwKIAljYXNlIERSTUNHX1RZUEVfQk9fUEVBSzoKIAkJ
c2VxX3ByaW50ZihzZiwgIiVsbGRcbiIsIGRkci0+Ym9fc3RhdHNfcGVha19hbGxvY2F0ZWQpOwog
CQlicmVhazsKKwljYXNlIERSTUNHX1RZUEVfQk9fQ09VTlQ6CisJCXNlcV9wcmludGYoc2YsICIl
bGxkXG4iLCBkZHItPmJvX3N0YXRzX2NvdW50X2FsbG9jYXRlZCk7CisJCWJyZWFrOwogCWRlZmF1
bHQ6CiAJCXNlcV9wdXRzKHNmLCAiXG4iKTsKIAkJYnJlYWs7CkBAIC0xODYsNiArMTg5LDEyIEBA
IHN0cnVjdCBjZnR5cGUgZmlsZXNbXSA9IHsKIAkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihE
Uk1DR19UWVBFX0JPX1BFQUssCiAJCQkJCQlEUk1DR19GVFlQRV9TVEFUUyksCiAJfSwKKwl7CisJ
CS5uYW1lID0gImJ1ZmZlci5jb3VudC5zdGF0cyIsCisJCS5zZXFfc2hvdyA9IGRybWNnX3NlcV9z
aG93LAorCQkucHJpdmF0ZSA9IERSTUNHX0NURl9QUklWKERSTUNHX1RZUEVfQk9fQ09VTlQsCisJ
CQkJCQlEUk1DR19GVFlQRV9TVEFUUyksCisJfSwKIAl7IH0JLyogdGVybWluYXRlICovCiB9Owog
CkBAIC0yNzIsNiArMjgxLDggQEAgdm9pZCBkcm1jZ19jaGdfYm9fYWxsb2Moc3RydWN0IGRybWNn
ICpkcm1jZywgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAogCQlpZiAoZGRyLT5ib19zdGF0c19w
ZWFrX2FsbG9jYXRlZCA8IChzNjQpc2l6ZSkKIAkJCWRkci0+Ym9fc3RhdHNfcGVha19hbGxvY2F0
ZWQgPSAoczY0KXNpemU7CisKKwkJZGRyLT5ib19zdGF0c19jb3VudF9hbGxvY2F0ZWQrKzsKIAl9
CiAJbXV0ZXhfdW5sb2NrKCZkZXYtPmRybWNnX211dGV4KTsKIH0KQEAgLTI4OSwxNSArMzAwLDIw
IEBAIEVYUE9SVF9TWU1CT0woZHJtY2dfY2hnX2JvX2FsbG9jKTsKIHZvaWQgZHJtY2dfdW5jaGdf
Ym9fYWxsb2Moc3RydWN0IGRybWNnICpkcm1jZywgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJ
c2l6ZV90IHNpemUpCiB7CisJc3RydWN0IGRybWNnX2RldmljZV9yZXNvdXJjZSAqZGRyOwogCWlu
dCBkZXZJZHggPSBkZXYtPnByaW1hcnktPmluZGV4OwogCiAJaWYgKGRybWNnID09IE5VTEwpCiAJ
CXJldHVybjsKIAogCW11dGV4X2xvY2soJmRldi0+ZHJtY2dfbXV0ZXgpOwotCWZvciAoIDsgZHJt
Y2cgIT0gTlVMTDsgZHJtY2cgPSBkcm1jZ19wYXJlbnQoZHJtY2cpKQotCQlkcm1jZy0+ZGV2X3Jl
c291cmNlc1tkZXZJZHhdLT5ib19zdGF0c190b3RhbF9hbGxvY2F0ZWQKLQkJCS09IChzNjQpc2l6
ZTsKKwlmb3IgKCA7IGRybWNnICE9IE5VTEw7IGRybWNnID0gZHJtY2dfcGFyZW50KGRybWNnKSkg
eworCQlkZHIgPSBkcm1jZy0+ZGV2X3Jlc291cmNlc1tkZXZJZHhdOworCisJCWRkci0+Ym9fc3Rh
dHNfdG90YWxfYWxsb2NhdGVkIC09IChzNjQpc2l6ZTsKKworCQlkZHItPmJvX3N0YXRzX2NvdW50
X2FsbG9jYXRlZC0tOworCX0KIAltdXRleF91bmxvY2soJmRldi0+ZHJtY2dfbXV0ZXgpOwogfQog
RVhQT1JUX1NZTUJPTChkcm1jZ191bmNoZ19ib19hbGxvYyk7Ci0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
