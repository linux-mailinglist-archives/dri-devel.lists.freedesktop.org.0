Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A498382C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 19:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5363C6E504;
	Tue,  6 Aug 2019 17:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680064.outbound.protection.outlook.com [40.107.68.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DE86E501;
 Tue,  6 Aug 2019 17:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlCFjFDbvuufSaaJS5PKRuYyKbwTLq81PcWi41LZXQV07pUENK1kwOsr8g7sGpAMZ0uZIiMEX88Gcm9fA+93x1YsApYXR1LXyfm6bnUQtuVMETm7fjCIcveimWHpp1G4zYNpYKyXKt8wM46Ywn19f99gvqefwLrXo05UkyuABZfyuew01iE2tDtiVwax0/znaPgL5KD5WgvL4PXYQkVvew1lXMoXBEM1qdGE5724ATwfl+G9+qpbsClXX76+YpxFRXJvQU0I4PV/7F0u252ikH5MLKxFumq0sO0Y7dCevsLGWLN/qF6TBlc/L0yrY+gOKYDZgj04r8NqdgStgPRvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUKVk2ZE8nwPZ1LhyQ07nkU/pVIiQ7q6jRq+pAUmKcM=;
 b=TVaS76WGi+ZfffUpBNATeoZdrpYzqSpjqjyEVysHsCPrMnlD+IBbP0uCEYuPrT1nIEraHTxw7mAttK/UhIzJH674iNMaizaKFtu9B7IqKDafLaXWmi+UxnNvLZS1VX9s6ddsF7mbRVw/3S+ifVwZNLRxZn/d+42KNqF/JezdPDvNpLKexJlpd5thcbas1dtP5XjjJl+wrVBiCESfOIsjXvXZ7hPBHsjQ9hpEn9bWWP5QYNicvceFqYyrrM15FW//5CZZXZwIlE79C55Vash2SONTZxt0V+oMOr4GZBdTHFTYzEse+nvRS455GERjF9+VDeK3WHf7Btva6S+1cam3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0004.namprd12.prod.outlook.com (2603:10b6:610:57::14)
 by DM5PR12MB1530.namprd12.prod.outlook.com (2603:10b6:4:4::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 17:45:55 +0000
Received: from BY2NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by CH2PR12CA0004.outlook.office365.com
 (2603:10b6:610:57::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.13 via Frontend
 Transport; Tue, 6 Aug 2019 17:45:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT014.mail.protection.outlook.com (10.152.84.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Tue, 6 Aug 2019 17:45:54 +0000
Received: from hwentlanhp.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 6 Aug 2019
 12:45:53 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <hariprasad.kelam@gmail.com>
Subject: [PATCH] drm/amd/display: Add number of slices per line to DSC
 parameter validation
Date: Tue, 6 Aug 2019 13:45:49 -0400
Message-ID: <20190806174549.7856-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <CADnq5_OL1+bJUGh44AY48DP=G=xTtdrf+kO2233qjJzudWhw_Q@mail.gmail.com>
References: <CADnq5_OL1+bJUGh44AY48DP=G=xTtdrf+kO2233qjJzudWhw_Q@mail.gmail.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(199004)(189003)(2906002)(76176011)(44832011)(68736007)(70206006)(50226002)(8936002)(70586007)(8676002)(316002)(1076003)(81166006)(81156014)(14444005)(2870700001)(53416004)(53936002)(51416003)(476003)(36756003)(126002)(47776003)(426003)(7696005)(6916009)(486006)(2616005)(11346002)(336012)(4326008)(86362001)(356004)(478600001)(54906003)(48376002)(305945005)(6666004)(2351001)(5660300002)(50466002)(26005)(186003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1530; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67ea6083-b8ab-4f03-5408-08d71a95ee50
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1530; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1530:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1530B28C4855582F06B7C6458CD50@DM5PR12MB1530.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0121F24F22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uPKfIagK7X91CwB0caabnoEYD7hDSl28l/UgFOW0g0CLFcGlxNp7RY99A77wie4wvGCPi2dx4jYD0eh+rZ2Rf1ENN1Xhv1bavpXCXuknuTMScRVO/64o+145I7sfBmazUIlfKNtYUfotHAlTpz0w/gZortPsDDcCN6FSoRFUZXQpB89unrhfMlN/XdC3WlU5IltMFp5CB7XD4OCnDXqrXiu2fxF48g3kFdW/TLBgpprZmoUiaYJBRI+9GAAXnLEKDS+InsnYlJXTza4KvacIVT5joZ7GKSipfjh2UzwlsEgXA6NyWACuhjIr678j/NBNadoJui7HW4orySyTkIWVY++8ViQU8ZqevbO+69vWcDwPf5CPjpRSQQ6sFA2h28Lz7xcgAAgisfLlKnv9fdVhAvWiKI2YydHTqpwY3iWaDv0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2019 17:45:54.5424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ea6083-b8ab-4f03-5408-08d71a95ee50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUKVk2ZE8nwPZ1LhyQ07nkU/pVIiQ7q6jRq+pAUmKcM=;
 b=fijginM+BsMt7HvPBaaPQPYUHKSDbfLcH2eIWMmzr8hFV7nYIi/1Bv+bZ4vUJno/E3XVp2MXjSL45eD684K+4QQURsI+nqldAPump7hKw0fRM+sOLobHYA5NGijZYjDGClGj2vSOicycb2I4j9qQETR4XJ61PVAyYbZKXcciN98=
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
Cc: sunpeng.li@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com, airlied@linux.ie,
 Dmytro.Laktyushkin@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, colin.king@canonical.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KTnVtYmVy
IG9mIHNsaWNlcyBwZXIgbGluZSB3YXMgbWlzdGFrZW5seSBsZWZ0IG91dAoKQ2M6IEhhcmlwcmFz
YWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWtv
bGEgQ29ybmlqIDxuaWtvbGEuY29ybmlqQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEhhcnJ5IFdl
bnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Ci0tLQoKVGhhbmtzLCBIYXJpcHJhc2FkLCBmb3Ig
eW91ciBwYXRjaC4gVGhlIHNlY29uZCBjb25kaXRpb24gc2hvdWxkIGFjdHVhbGx5IGNoZWNrCmZv
ciBudW1fc2xpY2VzX2guCgpIYXJyeQoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9kc2MuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9kc2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9kc2MuYwppbmRleCBlODcwY2FhOGQ0ZmEuLmFkYjY5YzAzOGVmYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYwpAQCAtMzAy
LDcgKzMwMiw3IEBAIHN0YXRpYyBib29sIGRzY19wcmVwYXJlX2NvbmZpZyhzdHJ1Y3QgZGlzcGxh
eV9zdHJlYW1fY29tcHJlc3NvciAqZHNjLCBjb25zdCBzdHJ1CiAJCSAgICBkc2NfY2ZnLT5kY19k
c2NfY2ZnLmxpbmVidWZfZGVwdGggPT0gMCkpKTsKIAlBU1NFUlQoOTYgPD0gZHNjX2NmZy0+ZGNf
ZHNjX2NmZy5iaXRzX3Blcl9waXhlbCAmJiBkc2NfY2ZnLT5kY19kc2NfY2ZnLmJpdHNfcGVyX3Bp
eGVsIDw9IDB4M2ZmKTsgLy8gNi4wIDw9IGJpdHNfcGVyX3BpeGVsIDw9IDYzLjkzNzUKIAotCWlm
ICghZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2VzX3YgfHwgIWRzY19jZmctPmRjX2RzY19j
ZmcubnVtX3NsaWNlc192IHx8CisJaWYgKCFkc2NfY2ZnLT5kY19kc2NfY2ZnLm51bV9zbGljZXNf
diB8fCAhZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2VzX2ggfHwKIAkJIShkc2NfY2ZnLT5k
Y19kc2NfY2ZnLnZlcnNpb25fbWlub3IgPT0gMSB8fCBkc2NfY2ZnLT5kY19kc2NfY2ZnLnZlcnNp
b25fbWlub3IgPT0gMikgfHwKIAkJIWRzY19jZmctPnBpY193aWR0aCB8fCAhZHNjX2NmZy0+cGlj
X2hlaWdodCB8fAogCQkhKChkc2NfY2ZnLT5kY19kc2NfY2ZnLnZlcnNpb25fbWlub3IgPT0gMSAm
JiAvLyB2MS4xIGxpbmUgYnVmZmVyIGRlcHRoIHJhbmdlOgotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
