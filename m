Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46AAA1188
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 08:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1CA89F6D;
	Thu, 29 Aug 2019 06:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680078.outbound.protection.outlook.com [40.107.68.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871DA89FCC;
 Thu, 29 Aug 2019 06:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coyR3PhhGdQ289VT1xTyJr1eM4Q7ipslx1vH1JDbXnRw6UPnNEGiIMTdx0/Uzc8NJUHPmi4h77tl79hoBTUOJO6O0Yrae8cigKDkxAdEhu8JMhhOmILGGeRrg+l81rStPFNNQkcaOr+aDZL4WJHki+F2CLFV1Pmij6DUCc/amv/41VHJCFmgZhlSoGH2hdGO8dj3ZUCoqId9eRkh+pUmOWutkzbnxhLkXqyKpDgdnsGRct9/6XnDBuKUcFttol/2qYWgRfCiF2w+OpZuhWDs3irPr8S+V0pceQj95vae8TyVys1r9LEc1JOzJyDka3W/pbr3XgBej44lOTAmPQP99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHCdRB4lz61FKBEyUmCsgxLGy00PpWlSb12BZmjdJis=;
 b=NY0n9LhvvIMRtwDd1XAbI3uiAEQ0kWhyBWYHDWnc5yPm7VzqtotUWE1/LKU2urUliibhLfUI/WB5T465fLaG1pntLRXVtKEWuCNpEfzG7LXwdOE3oW8MKcVqaIKxiwHV3+H5BoZcIr+KooHOGdLAwF5VI2e/q0zgGBqqT87JgPh1JpxTv+f8Nu+Qy4Q/upe+FW8R6u/yUVSwy3w6tdf+o5AWCwOsrbc4AMuNlLxMREQmLy3evoFEpuohGzrO0hxku6SGnEFFH9iOZ4RUP6hmCct8jtprD99mqrdi3AunJJvU6eT7VNtxVMl2kUiYHxn8760xZ4yjHtHkuTIbRmQxaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=cray.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:70::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Thu, 29 Aug
 2019 06:06:03 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 06:06:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 06:06:02 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 01:05:52 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>
Subject: [PATCH RFC v4 15/16] drm,
 cgroup: add update trigger after limit change
Date: Thu, 29 Aug 2019 02:05:32 -0400
Message-ID: <20190829060533.32315-16-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829060533.32315-1-Kenny.Ho@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(189003)(199004)(486006)(476003)(2616005)(126002)(426003)(478600001)(11346002)(356004)(6666004)(8936002)(50226002)(110136005)(305945005)(336012)(26005)(53936002)(186003)(50466002)(446003)(5660300002)(15650500001)(51416003)(2870700001)(7696005)(2906002)(76176011)(81166006)(81156014)(8676002)(36756003)(1076003)(4326008)(70586007)(5024004)(70206006)(14444005)(48376002)(86362001)(2201001)(53416004)(316002)(47776003)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1b87b45-2a42-4107-bde9-08d72c46f8a8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27192B32E746774F37DB2A2783A20@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1ND1aj3G7PS92B3emWO4t1VvMpq3pbGoTv7Du9foPdf8l39vpF6WH0EOLRWPR2Vg65v3H6Mqbfi7u+DQKWJBpuUC1IW8+rJ5G5d650vN+BlN0fRC1xyanHtFzAjPCuxnOfDvcovTXXMVUerMf2U7LFtXqRIxKQXVCZxxsl2xugwNIn0BZctQyqLla8iPN1yyI3qtwJiwi6vME7tEHGAccfnEs3MjkCu6yz2VjkjCiiLgt57GxL0p1BpdRoVI1bENQUhgteMcpE301gBny8w7rGBPgoSVVZz/JZaRRtL2QWBK3xlY+hLnAQ7fPYOjgN++rS9PNTLcMAim2+z/7pyLgFbC7T4E8rN7/22WBu6tN74qWJYqQaZ0Q+75E2vnPX4EbbQP5lCoF7ijrcXOpWfeBpRv8d7fJesg8KD3HuV/JWM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 06:06:02.3166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b87b45-2a42-4107-bde9-08d72c46f8a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHCdRB4lz61FKBEyUmCsgxLGy00PpWlSb12BZmjdJis=;
 b=FJ9CEsUTHTD/c5M5pZrVBNiKuLyw9sbcWxOEpBEirse0l0Cr25+3m1lhDDVGAQgWlLxXYAk+7s/cYuFKwPn8F2u+HEe57hYsX+dcWtRjvAI1NIHCsYGeXwX/cY560Y/KalEekkK7L4cnggGJGgY0dh1hIkASoCSEGVtNeox7F7M=
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

QmVmb3JlIHRoaXMgY29tbWl0LCBkcm1jZyBsaW1pdHMgYXJlIHVwZGF0ZWQgYnV0IGVuZm9yY2Vt
ZW50IGlzIGRlbGF5ZWQKdW50aWwgdGhlIG5leHQgdGltZSB0aGUgZHJpdmVyIGNoZWNrIGFnYWlu
c3QgdGhlIG5ldyBsaW1pdC4gIFdoaWxlIHRoaXMKaXMgc3VmZmljaWVudCBmb3IgY2VydGFpbiBy
ZXNvdXJjZXMsIGEgbW9yZSBwcm9hY3RpdmUgZW5mb3JjZW1lbnQgbWF5IGJlCm5lZWRlZCBmb3Ig
b3RoZXIgcmVzb3VyY2VzLgoKSW50cm9kdWNpbmcgYW4gb3B0aW9uYWwgZHJtY2dfbGltaXRfdXBk
YXRlZCBjYWxsYmFjayBmb3IgdGhlIERSTQpkcml2ZXJzLiAgV2hlbiBkZWZpbmVkLCBpdCB3aWxs
IGJlIGNhbGxlZCBpbiB0d28gc2NlbmFyaW9zOgoxKSBXaGVuIGxpbWl0cyBhcmUgdXBkYXRlZCBm
b3IgYSBwYXJ0aWN1bGFyIGNncm91cCwgdGhlIGNhbGxiYWNrIHdpbGwgYmUKdHJpZ2dlcmVkIGZv
ciBlYWNoIHRhc2sgaW4gdGhlIHVwZGF0ZWQgY2dyb3VwLgoyKSBXaGVuIGEgdGFzayBpcyBtaWdy
YXRlZCBmcm9tIG9uZSBjZ3JvdXAgdG8gYW5vdGhlciwgdGhlIGNhbGxiYWNrIHdpbGwKYmUgdHJp
Z2dlcmVkIGZvciBlYWNoIHJlc291cmNlIHR5cGUgZm9yIHRoZSBtaWdyYXRlZCB0YXNrLgoKQ2hh
bmdlLUlkOiBJNjgxODdhNzI4MThiODU1YjVmMjk1YWVmY2IyNDFjZGE4YWI2M2IwMApTaWduZWQt
b2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1f
ZHJ2LmggfCAxMCArKysrKysrKwoga2VybmVsL2Nncm91cC9kcm0uYyAgIHwgNTcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2NyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2Rydi5oCmluZGV4IGM4YTM3YTA4ZDk4ZC4uN2U1ODhiODc0YTI3IDEwMDY0NAot
LS0gYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCkBA
IC02NjksNiArNjY5LDE2IEBAIHN0cnVjdCBkcm1fZHJpdmVyIHsKIAl2b2lkICgqZHJtY2dfY3Vz
dG9tX2luaXQpKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQlzdHJ1Y3QgZHJtY2dfcHJvcHMg
KnByb3BzKTsKIAorCS8qKgorCSAqIEBkcm1jZ19saW1pdF91cGRhdGVkCisJICoKKwkgKiBPcHRp
b25hbCBjYWxsYmFjaworCSAqLworCXZvaWQgKCpkcm1jZ19saW1pdF91cGRhdGVkKShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAorCQkJc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLFwKKwkJCXN0cnVj
dCBkcm1jZ19kZXZpY2VfcmVzb3VyY2UgKmRkciwKKwkJCWVudW0gZHJtY2dfcmVzX3R5cGUgcmVz
X3R5cGUpOworCiAJLyoqCiAJICogQGdlbV92bV9vcHM6IERyaXZlciBwcml2YXRlIG9wcyBmb3Ig
dGhpcyBvYmplY3QKIAkgKi8KZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9rZXJu
ZWwvY2dyb3VwL2RybS5jCmluZGV4IDE4YzQzNjhlMmMyOS4uOTk3NzJlNWQ5Y2NjIDEwMDY0NAot
LS0gYS9rZXJuZWwvY2dyb3VwL2RybS5jCisrKyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMKQEAgLTYy
MSw2ICs2MjEsMjMgQEAgc3RhdGljIHZvaWQgZHJtY2dfbmVzdGVkX2xpbWl0X3BhcnNlKHN0cnVj
dCBrZXJuZnNfb3Blbl9maWxlICpvZiwKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGRybWNnX2xpbWl0
X3VwZGF0ZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybWNnICpkcm1jZywKKwkJ
ZW51bSBkcm1jZ19yZXNfdHlwZSByZXNfdHlwZSkKK3sKKwlzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jl
c291cmNlICpkZHIgPQorCQlkcm1jZy0+ZGV2X3Jlc291cmNlc1tkZXYtPnByaW1hcnktPmluZGV4
XTsKKwlzdHJ1Y3QgY3NzX3Rhc2tfaXRlciBpdDsKKwlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7
CisKKwljc3NfdGFza19pdGVyX3N0YXJ0KCZkcm1jZy0+Y3NzLmNncm91cC0+c2VsZiwKKwkJCUNT
U19UQVNLX0lURVJfUFJPQ1MsICZpdCk7CisJd2hpbGUgKCh0YXNrID0gY3NzX3Rhc2tfaXRlcl9u
ZXh0KCZpdCkpKSB7CisJCWRldi0+ZHJpdmVyLT5kcm1jZ19saW1pdF91cGRhdGVkKGRldiwgdGFz
aywKKwkJCQlkZHIsIHJlc190eXBlKTsKKwl9CisJY3NzX3Rhc2tfaXRlcl9lbmQoJml0KTsKK30K
Kwogc3RhdGljIHNzaXplX3QgZHJtY2dfbGltaXRfd3JpdGUoc3RydWN0IGtlcm5mc19vcGVuX2Zp
bGUgKm9mLCBjaGFyICpidWYsCiAJCXNpemVfdCBuYnl0ZXMsIGxvZmZfdCBvZmYpCiB7CkBAIC03
MjYsNiArNzQzLDEwIEBAIHN0YXRpYyBzc2l6ZV90IGRybWNnX2xpbWl0X3dyaXRlKHN0cnVjdCBr
ZXJuZnNfb3Blbl9maWxlICpvZiwgY2hhciAqYnVmLAogCQlkZWZhdWx0OgogCQkJYnJlYWs7CiAJ
CX0KKworCQlpZiAoZG0tPmRldi0+ZHJpdmVyLT5kcm1jZ19saW1pdF91cGRhdGVkKQorCQkJZHJt
Y2dfbGltaXRfdXBkYXRlZChkbS0+ZGV2LCBkcm1jZywgdHlwZSk7CisKIAkJZHJtX2Rldl9wdXQo
ZG0tPmRldik7IC8qIHJlbGVhc2UgZnJvbSBkcm1fbWlub3JfYWNxdWlyZSAqLwogCX0KIApAQCAt
ODYzLDkgKzg4NCw0NSBAQCBzdHJ1Y3QgY2Z0eXBlIGZpbGVzW10gPSB7CiAJeyB9CS8qIHRlcm1p
bmF0ZSAqLwogfTsKIAorc3RhdGljIGludCBkcm1jZ19hdHRhY2hfZm4oaW50IGlkLCB2b2lkICpw
dHIsIHZvaWQgKmRhdGEpCit7CisJc3RydWN0IGRybV9taW5vciAqbWlub3IgPSBwdHI7CisJc3Ry
dWN0IHRhc2tfc3RydWN0ICp0YXNrID0gZGF0YTsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Owor
CisJaWYgKG1pbm9yLT50eXBlICE9IERSTV9NSU5PUl9QUklNQVJZKQorCQlyZXR1cm4gMDsKKwor
CWRldiA9IG1pbm9yLT5kZXY7CisKKwlpZiAoZGV2LT5kcml2ZXItPmRybWNnX2xpbWl0X3VwZGF0
ZWQpIHsKKwkJc3RydWN0IGRybWNnICpkcm1jZyA9IGRybWNnX2dldCh0YXNrKTsKKwkJc3RydWN0
IGRybWNnX2RldmljZV9yZXNvdXJjZSAqZGRyID0KKwkJCWRybWNnLT5kZXZfcmVzb3VyY2VzW21p
bm9yLT5pbmRleF07CisJCWVudW0gZHJtY2dfcmVzX3R5cGUgdHlwZTsKKworCQlmb3IgKHR5cGUg
PSAwOyB0eXBlIDwgX19EUk1DR19UWVBFX0xBU1Q7IHR5cGUrKykKKwkJCWRldi0+ZHJpdmVyLT5k
cm1jZ19saW1pdF91cGRhdGVkKGRldiwgdGFzaywgZGRyLCB0eXBlKTsKKworCQlkcm1jZ19wdXQo
ZHJtY2cpOworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCBkcm1jZ19hdHRhY2go
c3RydWN0IGNncm91cF90YXNrc2V0ICp0c2V0KQoreworCXN0cnVjdCB0YXNrX3N0cnVjdCAqdGFz
azsKKwlzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAqY3NzOworCisJY2dyb3VwX3Rhc2tzZXRf
Zm9yX2VhY2godGFzaywgY3NzLCB0c2V0KQorCQlkcm1fbWlub3JfZm9yX2VhY2goJmRybWNnX2F0
dGFjaF9mbiwgdGFzayk7Cit9CisKIHN0cnVjdCBjZ3JvdXBfc3Vic3lzIGRybV9jZ3JwX3N1YnN5
cyA9IHsKIAkuY3NzX2FsbG9jCT0gZHJtY2dfY3NzX2FsbG9jLAogCS5jc3NfZnJlZQk9IGRybWNn
X2Nzc19mcmVlLAorCS5hdHRhY2gJCT0gZHJtY2dfYXR0YWNoLAogCS5lYXJseV9pbml0CT0gZmFs
c2UsCiAJLmxlZ2FjeV9jZnR5cGVzCT0gZmlsZXMsCiAJLmRmbF9jZnR5cGVzCT0gZmlsZXMsCi0t
IAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
