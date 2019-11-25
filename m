Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F9108FA0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 15:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1579289F0B;
	Mon, 25 Nov 2019 14:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8060D89EF7;
 Mon, 25 Nov 2019 14:10:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9XJEtEhxDYvqV/HIFb8BrJk5SDGWHo1MKoEqvgxnNkJVg6d0YHkj2wHzFvg0K8GKaqK4wm6mdEYHOLrO+pfrBqJv3roNflRkPrIOdFDW7Eq+6z9kVApeY5TFSdgc9wDIgHefjs6inWSSce6SjVLSr2OYN+GLdh69ASgl/BJSW6Geyh86cKxf5Q/sNXp/MwgahQNnabZoNzsAkxGPOwyfv8gf0Uefap9Kh6mQsiQ3hX9UwmqSgmCxftbqsm9XlWOokw1SmkLQhxjt29/OINywFsxGw5p9BQbhEXo553fAJjEwXybvWHoL1Lu7aSJy5ir+M2+OeH7dkPCK6nsUkK8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7dYvhNij+Dzqiq5Nno6Ls+eEraxP7Qi8lC4jZPMFqg=;
 b=lXKI9tddS2wphiP0HuJIvw4n+pc1li2OAL3tQ+F5rWUZMLBu+ILnR4FVVjqn1EC7fhAvIBPNzLl0AnftygZDMIvsg32MAlIjGkwkySZrO0tP1UnGiglRfSFEBiSsX/FMIrFjR22//0UEueBFIfUHcqMVuQIs08SbZSMZd06DgggPMAQO9jeLAu1L8ytM7InDyHswRWiLFe3J+97FdYuipms3TcXPoyRQIti+zgFV8j/+7Poe15XmQMUrNzCkEJocNIIj20MZUmuB2zx6/wUTP7Sxwfe3oFkI7/2+o85D3NoxVNOgrdt5qOqiyWYb8AlmowH1HVHLEANkFn17xX6pVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:405:4c::34) by DM5PR12MB2517.namprd12.prod.outlook.com
 (2603:10b6:4:bb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Mon, 25 Nov
 2019 14:10:45 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::203) by BN6PR1201CA0024.outlook.office365.com
 (2603:10b6:405:4c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2474.16 via Frontend
 Transport; Mon, 25 Nov 2019 14:10:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 25 Nov 2019 14:10:44 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 Nov
 2019 08:10:44 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 25 Nov 2019 08:10:44 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: 
Subject: [PATCH v3 2/2] drm/scheduler: Avoid accessing freed bad job.
Date: Mon, 25 Nov 2019 09:10:41 -0500
Message-ID: <1574691041-5499-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(428003)(189003)(199004)(316002)(305945005)(76176011)(2870700001)(26005)(81156014)(81166006)(4326008)(50226002)(5660300002)(70586007)(8676002)(86362001)(5820100001)(356004)(6666004)(23676004)(1671002)(50466002)(70206006)(7696005)(446003)(2906002)(14444005)(47776003)(44832011)(450100002)(2616005)(11346002)(336012)(426003)(478600001)(36756003)(54906003)(109986005)(186003)(66574012)(53416004)(8936002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2517; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b28cb1-8789-41a0-28ff-08d771b1435b
X-MS-TrafficTypeDiagnostic: DM5PR12MB2517:
X-Microsoft-Antispam-PRVS: <DM5PR12MB25171B37D68F3C3E9DBDFE27EA4A0@DM5PR12MB2517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0232B30BBC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VO4a/IeA8bDt3pKkZ060bYwu/clV3tcc1we7y6mn+x71vJWPs9H+b1A6BblLvRnI/Do5hVlnFm18oJd9qcqmB+IUscywXcVIx8QSe/AlPFvwM//m8r+Z6FBtZ5t/Qax+7zo1+BRt0+ZirGHGqgOwaToUtfAv1wCDIX4I5avWXy2G3dnJnEM5uQvN2vDMo6ntGz+GFT2B27n8uc7WJvAosAE6dopEOEcNOVPLcrYnStpuieDSQnvFnYm4U7qGgU6t+z+mmWIXsrX6Kmo/IKdFoscdLpcVflAFyNc1Cu+JDZONhO6czDBvEN7QgWe0Yg4JprX+LuB4XWJHmK9w+fvxgJLfOwxzPuNYQiLIHDO8TFjISYDH9mYQeSrIoiR4aEq9jrWUzNfZ6TkPZtIR802QpO/9A1VVHYsvyuLvDExqhdm6nKiyWvswnkHs/aYmwOq6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 14:10:44.8982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b28cb1-8789-41a0-28ff-08d771b1435b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2517
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7dYvhNij+Dzqiq5Nno6Ls+eEraxP7Qi8lC4jZPMFqg=;
 b=AYuHx7CWlbRmHL6Ntw7RAD2FAVmMe3+u/iLW5D+alNk9572wSzEv3ORhzm+ZveNqsZRpjCytyGTbFqXq7rqhFoviu37lbfsa5Brw7+CyyMHsI7pqAB7QqpbWbprYugkmtdlHkc1a0rGpHm6mSSmPgoNw6u53ZelzRrOFsqiTBgg=
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
Cc: Emily.Deng@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmxlbToKRHVlIHRvIGEgcmFjZSBiZXR3ZWVuIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgaW4g
c2NoZWQgdGhyZWFkIGFuZApkcm1fc2NoZWRfam9iX3RpbWVkb3V0IGluIHRpbWVvdXQgd29yayB0
aGVyZSBpcyBhIHBvc3NpYmxpdHkgdGhhdApiYWQgam9iIHdhcyBhbHJlYWR5IGZyZWVkIHdoaWxl
IHN0aWxsIGJlaW5nIGFjY2Vzc2VkIGZyb20gdGhlCnRpbWVvdXQgdGhyZWFkLgoKRml4OgpJbnN0
ZWFkIG9mIGp1c3QgcGVla2luZyBhdCB0aGUgYmFkIGpvYiBpbiB0aGUgbWlycm9yIGxpc3QKcmVt
b3ZlIGl0IGZyb20gdGhlIGxpc3QgdW5kZXIgbG9jayBhbmQgdGhlbiBwdXQgaXQgYmFjayBsYXRl
ciB3aGVuCndlIGFyZSBnYXJhbnRlZWQgbm8gcmFjZSB3aXRoIG1haW4gc2NoZWQgdGhyZWFkIGlz
IHBvc3NpYmxlIHdoaWNoCmlzIGFmdGVyIHRoZSB0aHJlYWQgaXMgcGFya2VkLgoKdjI6IExvY2sg
YXJvdW5kIHByb2Nlc3NpbmcgcmluZ19taXJyb3JfbGlzdCBpbiBkcm1fc2NoZWRfY2xlYW51cF9q
b2JzLgoKdjM6IFJlYmFzZSBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dC4gdjIgaXMgbm90IG5lZWRl
ZCBhbnltb3JlIGFzCmRybV9zY2hlZF9jbGVhbnVwX2pvYnMgYWxyZWFkeSBoYXMgYSBsb2NrIHRo
ZXJlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+ClRlc3RlZC1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMjkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwppbmRleCA2Nzc0OTU1Li5hNjA0ZGZhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwpAQCAtMjg0LDEwICsyODQsMjQg
QEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KndvcmspCiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAogCXNjaGVkID0gY29udGFpbmVyX29mKHdv
cmssIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciwgd29ya190ZHIud29yayk7CisKKwkvKgorCSAq
IFByb3RlY3RzIGFnYWluc3QgY29uY3VycmVudCBkZWxldGlvbiBpbiBkcm1fc2NoZWRfY2xlYW51
cF9qb2JzIHRoYXQKKwkgKiBpcyBhbHJlYWR5IGluIHByb2dyZXNzLgorCSAqLworCXNwaW5fbG9j
a19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwogCWpvYiA9IGxpc3RfZmly
c3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsCiAJCQkJICAgICAgIHN0
cnVjdCBkcm1fc2NoZWRfam9iLCBub2RlKTsKIAogCWlmIChqb2IpIHsKKwkJLyoKKwkJICogUmVt
b3ZlIHRoZSBiYWQgam9iIHNvIGl0IGNhbm5vdCBiZSBmcmVlZCBieSBhbHJlYWR5IGluIHByb2dy
ZXNzCisJCSAqIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMuIEl0IHdpbGwgYmUgcmVpbnNydGVkIGJh
Y2sgYWZ0ZXIgc2NoZWQtPnRocmVhZAorCQkgKiBpcyBwYXJrZWQgYXQgd2hpY2ggcG9pbnQgaXQn
cyBzYWZlLgorCQkgKi8KKwkJbGlzdF9kZWxfaW5pdCgmam9iLT5ub2RlKTsKKwkJc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKKwogCQlqb2ItPnNj
aGVkLT5vcHMtPnRpbWVkb3V0X2pvYihqb2IpOwogCiAJCS8qCkBAIC0yOTgsNiArMzEyLDggQEAg
c3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndv
cmspCiAJCQlqb2ItPnNjaGVkLT5vcHMtPmZyZWVfam9iKGpvYik7CiAJCQlzY2hlZC0+ZnJlZV9n
dWlsdHkgPSBmYWxzZTsKIAkJfQorCX0gZWxzZSB7CisJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7CiAJfQogCiAJc3Bpbl9sb2NrX2lycXNhdmUo
JnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7CkBAIC0zNzAsNiArMzg2LDE5IEBAIHZvaWQg
ZHJtX3NjaGVkX3N0b3Aoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCwgc3RydWN0IGRy
bV9zY2hlZF9qb2IgKmJhZCkKIAlrdGhyZWFkX3Bhcmsoc2NoZWQtPnRocmVhZCk7CiAKIAkvKgor
CSAqIFJlaW5zZXJ0IGJhY2sgdGhlIGJhZCBqb2IgaGVyZSAtIG5vdyBpdCdzIHNhZmUgYXMgZHJt
X3NjaGVkX2NsZWFudXBfam9icworCSAqIGNhbm5vdCByYWNlIGFnYWluc3QgdXMgYW5kIHJlbGVh
c2UgdGhlIGJhZCBqb2IgYXQgdGhpcyBwb2ludCAtIHdlIHBhcmtlZAorCSAqICh3YWl0ZWQgZm9y
KSBhbnkgaW4gcHJvZ3Jlc3MgKGVhcmxpZXIpIGNsZWFudXBzIGFuZCBhbnkgbGF0ZXIgb25lcyB3
aWxsCisJICogYmFpbCBvdXQgZHVlIHRvIHNjaGVkLT50aHJlYWQgYmVpbmcgcGFya2VkLgorCSAq
LworCWlmIChiYWQgJiYgYmFkLT5zY2hlZCA9PSBzY2hlZCkKKwkJLyoKKwkJICogQWRkIGF0IHRo
ZSBoZWFkIG9mIHRoZSBxdWV1ZSB0byByZWZsZWN0IGl0IHdhcyB0aGUgZWFybGllc3QKKwkJICog
am9iIGV4dHJhY3RlZC4KKwkJICovCisJCWxpc3RfYWRkKCZiYWQtPm5vZGUsICZzY2hlZC0+cmlu
Z19taXJyb3JfbGlzdCk7CisKKwkvKgogCSAqIEl0ZXJhdGUgdGhlIGpvYiBsaXN0IGZyb20gbGF0
ZXIgdG8gIGVhcmxpZXIgb25lIGFuZCBlaXRoZXIgZGVhY3RpdmUKIAkgKiB0aGVpciBIVyBjYWxs
YmFja3Mgb3IgcmVtb3ZlIHRoZW0gZnJvbSBtaXJyb3IgbGlzdCBpZiB0aGV5IGFscmVhZHkKIAkg
KiBzaWduYWxlZC4KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
