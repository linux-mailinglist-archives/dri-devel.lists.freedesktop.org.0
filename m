Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C62B6D9E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3A672AF6;
	Wed, 18 Sep 2019 20:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680067.outbound.protection.outlook.com [40.107.68.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1C672B09;
 Wed, 18 Sep 2019 20:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0l+SAAauYiBO4RRymMnwNSpibxn4Hw3Y0JNIcDhaA64zFUsNcMvUHB4YToynpus7Qqu73XvTXJNs00b8gA9vxJBwn1rHj2aP+siHk3uRwb+fJE2qMhCJI1CN2aycbKcsiUR7EGoxg2UdMdxOqkhvu9lJ1leab8xcXdwXGWTNfYL3nTStIxg/QWAbdyuZyu8bJj5qZ4OHtb/JG/BygaiyDuy0L0ADGixw4FnhEYvOu/jGnVVlw3+Vg3Kd8ya+ubFvDye44Jpsry3bbjQcaNnbTEz5znwVTLIWOoKFH3XZMhSUd9qHQtj36rqQ1mfqSBp24wx0tNa6CUUtTX6YY3BSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLmdCRWOUR5MCoEs1obEACirivcB5+sy2aIFUQc4p+U=;
 b=B2JNse7NjbvbF2HM0hRU4gUR1w0fV7265l+uLmZWUPfNj8XSfoKbQX/mUwTyJ0et9tUra13xT7W4FbwuNVMsntPr+Z1eFziEnsK7sEj8ALTUN1wLyVuZzIOsfkkDKewqh98yuJgcVhdZkXptHbe1+Q3quHKfW6jxF4c9Qy2MSa7C7AmbcTZUwW4FjDsxbvFPONthO1xF06+jKVrt7BLNsgaj8e/Xdz1/wjOTDr3+Bze/31/bSQKHjvURh+uMxUmxz8alaw+m/wbX45Yaf9PNRTnHhF1FtQMpC6LsJByIccDhE0tslvem/X1hhFGCnIzQ1Vmso8LY/x51Mmrg7kXIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by BN8PR12MB2884.namprd12.prod.outlook.com (2603:10b6:408:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Wed, 18 Sep
 2019 20:27:31 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:30 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:29 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/15] drm/amd/display: Use correct helpers to compute
 timeslots
Date: Wed, 18 Sep 2019 16:26:47 -0400
Message-ID: <97921519cf0c4f0684fa11c81693f077930662d7.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(189003)(199004)(476003)(11346002)(2616005)(186003)(2906002)(478600001)(118296001)(305945005)(26005)(86362001)(48376002)(2876002)(14444005)(50226002)(8936002)(81156014)(51416003)(426003)(316002)(54906003)(336012)(8676002)(16586007)(76176011)(126002)(486006)(6916009)(47776003)(446003)(50466002)(6666004)(356004)(81166006)(5660300002)(70206006)(2351001)(4326008)(450100002)(53416004)(36756003)(7696005)(70586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2884; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e43ec94-c4e3-404b-cae6-08d73c76a173
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN8PR12MB2884; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB2884:
X-Microsoft-Antispam-PRVS: <BN8PR12MB28845D8F267306A251D933E0E48E0@BN8PR12MB2884.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: n/oNS2xOB9P6GudSO1ICFDKwlEhipcPiy4RkvTGFvV3sVtsuszHQtUqFZAQtFKoPs42YKQOxihpq0e0U38zr5fg1/wQCh8Nrn2dtgCWzEG3DaMVW7MILO6KrGriC3T2c3Us/K51ZFgFYpdHHcs0b1tYqYHB0pyOi3X+22+fZJuGTwrp+dmPmERyewhnOvN4apNrql6oSSXAzmwJwigT3nh62/2tg+3uKY7Ku8qwuncwFxn8tthDFex8U2Urk02MUK7aQlaWvOq5V3qucmLLkSzlohXYtq12W6tWn1mdb8T7wE65TIme4EeHmuEeu5eWlzEY6ererkyElwBX7Kmgo9ZRrYVcvLI9Y675njg0r3GKdJAOkbuKl0QSgB565y5WZmmqsSBcvFR8NKWCCp/1k3ehr2mNPhXAJyhQDlR6tfd8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:30.7871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e43ec94-c4e3-404b-cae6-08d73c76a173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2884
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLmdCRWOUR5MCoEs1obEACirivcB5+sy2aIFUQc4p+U=;
 b=G8JFFZmPX0k2LQ0VmTerTjSIm7Uwa3EsA0fmiM0sTfCTNwmzPCjMuuvSZVRZrQr3SWkjmde3FkbqiJOAwY1qc2/PAjtiMMX0mhQH1JXwEeJmY6FZwG6kC+TikoiuCd1naZOEEv1NxgAu3FCImnRMyxuZ91ZhwrIpj0Nf+bvfCMo=
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
Cc: David Francis <David.Francis@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKV2Ugd2VyZSB1c2lu
ZyBkcm0gaGVscGVycyB0byBjb252ZXJ0IGEgdGltaW5nIGludG8gaXRzCmJhbmR3aWR0aCwgaXRz
IGJhbmR3aWR0aCBpbnRvIHBibiwgYW5kIGl0cyBwYm4gaW50byB0aW1lc2xvdHMKClRoZXNlIGhl
bHBlcnMKLURpZCBub3QgdGFrZSBEU0MgdGltaW5ncyBpbnRvIGFjY291bnQKLVVzZWQgdGhlIGxp
bmsgcmF0ZSBhbmQgbGFuZSBjb3VudCBvZiB0aGUgbGluaydzIGF1eCBkZXZpY2UsCndoaWNoIGFy
ZSBub3QgdGhlIHNhbWUgYXMgdGhlIGxpbmsncyBjdXJyZW50IGNhcAotRGlkIG5vdCB0YWtlIEZF
QyBpbnRvIGFjY291bnQgKEZFQyByZWR1Y2VzIHRoZSBQQk4gcGVyIHRpbWVzbG90KQoKRm9yIGNv
bnZlcnRpbmcgdGltaW5nIGludG8gUEJOLCB1c2UgdGhlIG5ldyBmdW5jdGlvbgpkcm1fZHBfY2Fs
Y19wYm5fbW9kZV9kc2MgdGhhdCBoYW5kbGVzIHRoZSBEU0MgY2FzZQoKRm9yIGNvbnZlcnRpbmcg
UEJOIGludG8gdGltZSBzbG90cywgYW1kZ3B1IGRvZXNuJ3QgdXNlIHRoZQonY29ycmVjdCcgYXRv
bWljIG1ldGhvZCAoZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMpLCBzbwpkb24ndCBhZGQg
YSBuZXcgaGVscGVyIHRvIGNvdmVyIG91ciBhcHByb2FjaC4gVXNlIHRoZSBzYW1lCm1lYW5zIG9m
IGNhbGN1bGF0aW5nIHBibiBwZXIgdGltZSBzbG90IGFzIHRoZSBEU0MgY29kZS4KCkNjOiBKZXJy
eSBadW8gPEplcnJ5Llp1b0BhbWQuY29tPgpDYzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9s
YXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZp
ZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1faGVscGVycy5jICB8IDE4ICsrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCmluZGV4IGIx
NTFhNWE1MWE5NC4uYWFmMzE1ODUzNGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCkBAIC0xODgsOCAr
MTg4LDggQEAgYm9vbCBkbV9oZWxwZXJzX2RwX21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25f
dGFibGUoCiAJaW50IHNsb3RzID0gMDsKIAlib29sIHJldDsKIAlpbnQgY2xvY2s7Ci0JaW50IGJw
cCA9IDA7CiAJaW50IHBibiA9IDA7CisJaW50IHBibl9wZXJfdGltZXNsb3QsIGJwcCA9IDA7CiAK
IAlhY29ubmVjdG9yID0gKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFtLT5kbV9z
dHJlYW1fY29udGV4dDsKIApAQCAtMjMzLDExICsyMzMsMTkgQEAgYm9vbCBkbV9oZWxwZXJzX2Rw
X21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAKIAkJYnBwID0gYnBwICogMzsK
IAotCQkvKiBUT0RPIG5lZWQgdG8ga25vdyBsaW5rIHJhdGUgKi8KLQotCQlwYm4gPSBkcm1fZHBf
Y2FsY19wYm5fbW9kZShjbG9jaywgYnBwLCBmYWxzZSk7CisjaWZkZWYgQ09ORklHX0RSTV9BTURf
RENfRFNDX1NVUFBPUlQKKwkJaWYgKHN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQykKKwkJCXBibiA9
IGRybV9kcF9jYWxjX3Bibl9tb2RlKGNsb2NrLAorCQkJCQkJICAgc3RyZWFtLT50aW1pbmcuZHNj
X2NmZy5iaXRzX3Blcl9waXhlbCwKKwkJCQkJCSAgIHRydWUpOworCQllbHNlCisjZW5kaWYKKwkJ
CXBibiA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKGNsb2NrLCBicHAsIGZhbHNlKTsKIAotCQlzbG90
cyA9IGRybV9kcF9maW5kX3ZjcGlfc2xvdHMobXN0X21nciwgcGJuKTsKKwkJLyogQ29udmVydCBr
aWxvYml0cyBwZXIgc2Vjb25kIC8gNjQgKGZvciA2NCB0aW1lc2xvdHMpIHRvIHBibiAoNTQvNjQg
bWVnYWJ5dGVzIHBlciBzZWNvbmQpICovCisJCXBibl9wZXJfdGltZXNsb3QgPSBkY19saW5rX2Jh
bmR3aWR0aF9rYnBzKAorCQkJCXN0cmVhbS0+bGluaywgZGNfbGlua19nZXRfbGlua19jYXAoc3Ry
ZWFtLT5saW5rKSkgLyAoOCAqIDEwMDAgKiA1NCk7CisJCXNsb3RzID0gRElWX1JPVU5EX1VQKHBi
biwgcGJuX3Blcl90aW1lc2xvdCk7CiAJCXJldCA9IGRybV9kcF9tc3RfYWxsb2NhdGVfdmNwaSht
c3RfbWdyLCBtc3RfcG9ydCwgcGJuLCBzbG90cyk7CiAKIAkJaWYgKCFyZXQpCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
