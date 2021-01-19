Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714742FBB97
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 16:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED4C6E2D7;
	Tue, 19 Jan 2021 15:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5408C6E2D7;
 Tue, 19 Jan 2021 15:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4bmy6Ms4idFeBQqHjHrwCZ90SF+vn9fqyW8JV/UQpgsqNH+CKIjv8AJ6ztEnDFZnQTOSHfbw6Ap1SQlqwbFMpT7ATCa5k/WSuIc3pDkDsiSA2iLMxSPZGkZ+IxGEa0Zxljr6OLnRjaHm8sepq9qi7udW3V31edB/fjtThvQceDZ/M/wq2IPAnkkjcOpd1c6tZP7ffXUrstVvNSur3soI/0FtrK6yB+vA5gV/2M1+zHX+/nCb+2rKPl0ZLvWuCtH07rix2OPSFU4M2oCY+ddNbONkIjFxCMqCHUYBFbKGADZm8zymou2kRoQpoeIfwYPA0o2ZpM71hLdUB+vkG7yIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvRY18pXv0wKjYkKKZKb8hLotSimHDLicixLefdIhoI=;
 b=EV+d1aqJuq4phVAMgBdaTU2BjWuVIcKctnmsgNqtJdfQN2Hsp2Hk2T4abvf2Y+jODkvawf9rQIZvHibqo9zedOJoswPmNvAJ6xB5rIx/dDWziz7AvPwRGHYFOXRGRyJq5Qg4LJp5I0EeXosSkzShIFQnKqig/q3D1BHqaF2h03kLLtioQpjtPtpUJOvYDHCxMHWnKYso+DGVKagepEXO84CrjBHWygE1twtjoTv0VwjToiHw0hTor5HSLvmkFkA0602tkeVGLuQ2BVJ22R6sdP2/G4c24VyR9nKznpKJMPTEQ+ZCISS3RgKyN/Mg4NvH4kLOurlxrGtKJGiSHxwJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvRY18pXv0wKjYkKKZKb8hLotSimHDLicixLefdIhoI=;
 b=ArHUOTKQONYDT0nQPGvSxqi6GxiYQrebzpOHFURQ2rcOa6CPPlvrBAK8CINCHw5SK8Hd69dZEwkOcNhuxC8Xje3LUIewq2d2HJqpA9K5fCfmcGymWP4I82zI1RPM0yvsC13hBuILS0DgIo5QotSdp6R+PQflM+LK/2Her/BH4Nw=
Received: from DM3PR12CA0097.namprd12.prod.outlook.com (2603:10b6:0:55::17) by
 BN6PR1201MB2513.namprd12.prod.outlook.com (2603:10b6:404:ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 15:50:40 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::d1) by DM3PR12CA0097.outlook.office365.com
 (2603:10b6:0:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 19 Jan 2021 15:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 15:50:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 19 Jan
 2021 09:50:36 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 19 Jan
 2021 09:50:36 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Tue, 19 Jan 2021 09:50:35 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/display: Add module parameter for freesync video
 mode
Date: Tue, 19 Jan 2021 10:50:27 -0500
Message-ID: <20210119155029.18943-2-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119155029.18943-1-aurabindo.pillai@amd.com>
References: <20210119155029.18943-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 052c63ea-1af4-4415-2afc-08d8bc91f7f1
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2513:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB251307FC39FD8AA0A85A0B6C8BA30@BN6PR1201MB2513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GG/GR7W+7F9HSSeXcdySlcFeIjyBYRjzkvAQnTWAUOSDVGwLKtSbrXoE+Qax/Sj0XN5CF0xQiciepJmg+QKM3RISVyDd+dhQM8FkdzgGk+5+Gsl5hYgCEUUx768kG/IAYHGujPa/sBEqROwFZ5jtPVGZ9gF6v+D1uZ1Vf+dTtuvHyMKyJ7sVfpTRvVb8cmqHzyy338YSW6ewLTn1Au3jpgZCV1DZCu+puuQ4aESP9rNM3qol/qVeK928H4fmt1WoY5+4fnDQf6QUJ+aBidSIAVltU+3k10EHotruWYsV8AYk2TxCi1q0PjTciQ0Jz5DYBAiMpBJU0K06+MmW4fpYMDIrIIpFhcGEXx9QfR5M56kP8qyTWmQaWxRO3OlN7vq8NMiZKa5Kzyk2ppMt70zO1+nD/gAQPH/g79sQ82s0femWveZOqfDIGosQCvf2Uu8C6roz6aNJM9vtYHvnQahvuw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(86362001)(6666004)(356005)(5660300002)(336012)(1076003)(4326008)(70586007)(36756003)(7696005)(44832011)(83380400001)(47076005)(478600001)(186003)(26005)(2906002)(2616005)(316002)(426003)(8936002)(82740400003)(66574015)(81166007)(110136005)(8676002)(70206006)(82310400003)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 15:50:38.7933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 052c63ea-1af4-4415-2afc-08d8bc91f7f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2513
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, thong.thai@amd.com,
 christian.koenig@amd.com, aurabindo.pillai@amd.com, wayne.lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KVGhpcyBvcHRpb24gc2hhbGwgYmUgb3B0LWluIGJ5IGRlZmF1bHQgc2luY2UgaXQgaXMg
YSB0ZW1wb3Jhcnkgc29sdXRpb24KdW50aWwgbG9uZyB0ZXJtIHNvbHV0aW9uIGlzIGFncmVlZCB1
cG9uIHdoaWNoIG1heSByZXF1aXJlIHVzZXJzcGFjZSBpbnRlcmZhY2UKY2hhbmdlcy4gVGhlcmUg
aGFzIGJlZW4gcHJlY2VkZW50IG9mIG1hbnVmYWN0dXJpbmcgbW9kZXMgaW4gdGhlIGtlcm5lbC4g
SW4KQU1ER1BVLCB0aGUgZXhpc3RpbmcgdXNhZ2UgYXJlIGZvciBjb21tb24gbW9kZXMgYW5kIHNj
YWxpbmcgbW9kZXMuIE90aGVyIGRyaXZlcgpoYXZlIGEgc2ltaWxhciBhcHByb2FjaCBhcyB3ZWxs
LgoKW0hvd10KQWRkcyBhIG1vZHVsZSBwYXJhbWV0ZXIgdG8gZW5hYmxlIGZyZWVzeW5jIHZpZGVv
IG1vZGUgbW9kZXNldApvcHRpbWl6YXRpb24uIEVuYWJsaW5nIHRoaXMgbW9kZSBhbGxvd3MgdGhl
IGRyaXZlciB0byBza2lwIGEgZnVsbCBtb2Rlc2V0IHdoZW4gYQpmcmVlc3luYyBjb21wYXRpYmxl
IG1vZGUgaXMgcmVxdWVzdGVkIGJ5IHRoZSB1c2Vyc3BhY2UuIFRoaXMgcGFyYW1ldGVyIHdpbGwg
YWxzbwphZGQgc29tZSBhZGRpdGlvbmFsIG1vZGVzIHRoYXQgYXJlIHdpdGhpbiB0aGUgY29ubmVj
dGVkIG1vbml0b3IncyBWUlIgcmFuZ2UKY29ycmVzcG9uZGluZyB0byBjb21tb24gdmlkZW8gbW9k
ZXMsIHdoaWNoIG1lZGlhIHBsYXllcnMgY2FuIHVzZSBmb3IgYSBzZWFtbGVzcwpleHBlcmllbmNl
IHdoaWxlIG1ha2luZyB1c2Ugb2YgZnJlZXN5bmMuCgpTaWduZWQtb2ZmLWJ5OiBBdXJhYmluZG8g
UGlsbGFpIDxhdXJhYmluZG8ucGlsbGFpQGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnIGF0IGFtZC5jb20+ClJldmlld2VkLWJ5OiBTaGFzaGFuayBT
aGFybWEgPHNoYXNoYW5rLnNoYXJtYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyB8IDEyICsrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCAxMDBhNDMxZjA3OTIu
Ljc3MGU0MmZjYWE2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTE3Nyw2
ICsxNzcsNyBAQCBleHRlcm4gaW50IGFtZGdwdV9ncHVfcmVjb3Zlcnk7CiBleHRlcm4gaW50IGFt
ZGdwdV9lbXVfbW9kZTsKIGV4dGVybiB1aW50IGFtZGdwdV9zbXVfbWVtb3J5X3Bvb2xfc2l6ZTsK
IGV4dGVybiB1aW50IGFtZGdwdV9kY19mZWF0dXJlX21hc2s7CitleHRlcm4gdWludCBhbWRncHVf
ZnJlZXN5bmNfdmlkX21vZGU7CiBleHRlcm4gdWludCBhbWRncHVfZGNfZGVidWdfbWFzazsKIGV4
dGVybiB1aW50IGFtZGdwdV9kbV9hYm1fbGV2ZWw7CiBleHRlcm4gc3RydWN0IGFtZGdwdV9tZ3B1
X2luZm8gbWdwdV9pbmZvOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmlu
ZGV4IGI0OGQ3YTNjMmExMS4uNWM2ZGM4MzYyZTZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCkBAIC0xNTgsNiArMTU4LDcgQEAgaW50IGFtZGdwdV9tZXM7CiBpbnQg
YW1kZ3B1X25vcmV0cnkgPSAtMTsKIGludCBhbWRncHVfZm9yY2VfYXNpY190eXBlID0gLTE7CiBp
bnQgYW1kZ3B1X3RtejsKK3VpbnQgYW1kZ3B1X2ZyZWVzeW5jX3ZpZF9tb2RlOwogaW50IGFtZGdw
dV9yZXNldF9tZXRob2QgPSAtMTsgLyogYXV0byAqLwogaW50IGFtZGdwdV9udW1fa2NxID0gLTE7
CiAKQEAgLTc4Niw2ICs3ODcsMTcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKGFibWxldmVsLCBhbWRn
cHVfZG1fYWJtX2xldmVsLCB1aW50LCAwNDQ0KTsKIE1PRFVMRV9QQVJNX0RFU0ModG16LCAiRW5h
YmxlIFRNWiBmZWF0dXJlICgtMSA9IGF1dG8sIDAgPSBvZmYgKGRlZmF1bHQpLCAxID0gb24pIik7
CiBtb2R1bGVfcGFyYW1fbmFtZWQodG16LCBhbWRncHVfdG16LCBpbnQsIDA0NDQpOwogCisvKioK
KyAqIERPQzogZnJlZXN5bmNfdmlkZW8gKHVpbnQpCisgKiBFbmFibGVkIHRoZSBvcHRpbWl6YXRp
b24gdG8gYWRqdXN0IGZyb250IHBvcmNoIHRpbWluZyB0byBhY2hpZXZlIHNlYW1sZXNzIG1vZGUg
Y2hhbmdlIGV4cGVyaWVuY2UKKyAqIHdoZW4gc2V0dGluZyBhIGZyZWVzeW5jIHN1cHBvcnRlZCBt
b2RlIGZvciB3aGljaCBmdWxsIG1vZGVzZXQgaXMgbm90IG5lZWRlZC4KKyAqIFRoZSBkZWZhdWx0
IHZhbHVlOiAwIChvZmYpLgorICovCitNT0RVTEVfUEFSTV9ERVNDKAorCWZyZWVzeW5jX3ZpZGVv
LAorCSJFbmFibGUgZnJlZXN5bmMgbW9kZXNldHRpbmcgb3B0aW1pemF0aW9uIGZlYXR1cmUgKDAg
PSBvZmYgKGRlZmF1bHQpLCAxID0gb24pIik7Cittb2R1bGVfcGFyYW1fbmFtZWQoZnJlZXN5bmNf
dmlkZW8sIGFtZGdwdV9mcmVlc3luY192aWRfbW9kZSwgdWludCwgMDQ0NCk7CisKIC8qKgogICog
RE9DOiByZXNldF9tZXRob2QgKGludCkKICAqIEdQVSByZXNldCBtZXRob2QgKC0xID0gYXV0byAo
ZGVmYXVsdCksIDAgPSBsZWdhY3ksIDEgPSBtb2RlMCwgMiA9IG1vZGUxLCAzID0gbW9kZTIsIDQg
PSBiYWNvKQotLSAKMi4zMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
