Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D63110063
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B8E6E7EC;
	Tue,  3 Dec 2019 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790079.outbound.protection.outlook.com [40.107.79.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB486E7A2;
 Tue,  3 Dec 2019 14:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EA9P6TcbvVTaH81R0eDAcn3hHKEGUJVLhGH2MFceIChXLH6utJOUvw1eMpKSrEZPpr/YqHmoXnrUD1GZh/SvfVSR23t5vdjd8mrhPuJ+KhiLO7A10xch+ONqE9qNxwaY0u7QZ0Kc++/44/I5sKv0ggJyA8pJBXDkTc0KJCucptxs4+mCzDluSC9zbpRfa0MVS0zyEOvANVn3Oi6FjEfVIFCGO1d1iOI7crtzZcFPrXFnJGOggEqfQWSKhorhwEKjDG25IkQPjlZYzuYh/XvDW9rZfd3ruqfa6Pc0VsOxCYwED0ypgZF8dUl90qWRCXdyiH8kFiFKuG/jeKTohTi8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/HT817ZMNkJ47KnSRekp/GgRnTzoJTf6S0ZEI3tdxg=;
 b=XJYF+PCnSGAq0uiQug8PjsicxNb+FQaZVT8YMuGp6ukbLMIJs8iZ1AfHOC0XRCdDI0BF7aYGGM2xy6swEXNpjRydpOQK96gjwXztIimLE5KPEUE7l4USHSGH0F58TNuyvlqjSnDCAc5Y3AVR07NfcWY+iMZtqjyReVMM7h29fwUrPoSjcRGHQIKICaHUUpo/bhfXCNMyTvHUpIGbjwkSZDVXYGs+1OwG0/ikBYC2aFBmFsaMq2FA3FUzXa1kJ3qmfGp32pBkMM9h7es46F6zmfkCbGWY9mb0UsOz/wT7YwLJmk74k9ovtY6GKR0e1T2KJdry1eYC8vDCAYswtBwpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Tue, 3 Dec
 2019 14:35:49 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:49 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:46 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:46 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 13/17] drm/amd/display: Add PBN per slot calculation for DSC
Date: Tue, 3 Dec 2019 09:35:26 -0500
Message-ID: <20191203143530.27262-14-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(428003)(189003)(199004)(2351001)(11346002)(356004)(6666004)(53416004)(2616005)(305945005)(2876002)(50466002)(36756003)(4326008)(48376002)(86362001)(2906002)(450100002)(8936002)(50226002)(6916009)(81156014)(426003)(446003)(8676002)(336012)(16586007)(81166006)(14444005)(7696005)(51416003)(76176011)(70206006)(478600001)(186003)(70586007)(5660300002)(316002)(1076003)(54906003)(26005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1849; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ed0d6f-ea7b-4973-1443-08d777fe176e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1849:
X-Microsoft-Antispam-PRVS: <DM5PR12MB18493D6A47CF76E42D898C51E4420@DM5PR12MB1849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLO+JoYyC+p4mh3qymJRzVJO2MzWsc0aLjDeq7UCRLowWZhKZ+fV8WLbj0O2tEDHrzWTc1HOzzTevJ/EiTszyLxvj6fJd4xWR2RdgEtS8tZR2rdbS3Bz0n4seOFtVvOLQbcCLLsdpDnXeXBieCwY3ZabCtys6I0Pm1uw7R8oLxBJqCYg0YmBpDf+eemFN03icINjbIm57YxXi16XH9exCvN5H9EPb3A+tttIcAXW5bDmyYCjB7eucE8t2qNuP1KAn0ssur4WuPbB7GxBOEuIkQ4gsNDdS1PdpBrP390psz9BiD0OVcy5E6hUWeRQYl+ktsmZticAxoqa/oykyB6IgYi3A1cBZb3vmYyns1q/BQPTOMXoYAYm6hrA7Cke31A7ui2ZsOyuMEbfM6P8NKDp+7MwO6H9cv2w1NYC9Nggo4AU7bbOTQmfGO/z4Bxbj/2B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:49.3862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ed0d6f-ea7b-4973-1443-08d777fe176e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/HT817ZMNkJ47KnSRekp/GgRnTzoJTf6S0ZEI3tdxg=;
 b=BDCwkKjS7aOyVQ6Pb2sAYP2ck7pNVzORJ4n8kT02feNGdVE38bvhss8eplVXqIkjlHNHbwJAo/0Xh/Sr0jHDkajQO9ENuxGDg4GQNtLPsvieAso4wr1G5t9zMq4ZKnELw31saH2tXKNKg9sjc/Z8VTgKkfygX7n7O44x3r1gZ8I=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KTmVlZCB0
byBjYWxjdWxhdGUgVkNQSSBzbG90cyBkaWZmZXJlbnRseSBmb3IgRFNDCnRvIHRha2UgaW4gYWNj
b3VudCBjdXJyZW50IGxpbmsgcmF0ZSwgbGluayBjb3VudAphbmQgRkVDLgpbaG93XQpBZGQgaGVs
cGVyIHRvIGdldCBwYm5fZGl2IGZyb20gZGNfbGluawoKU2lnbmVkLW9mZi1ieTogTWlraXRhIExp
cHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDggKysrKysrKysKIC4uLi9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmggICB8IDIgKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMK
aW5kZXggNzU1N2VkZWU3ZGIwLi5jMzc2YzhjY2QzOTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5j
CkBAIC00OTEsMyArNDkxLDExIEBAIHZvaWQgYW1kZ3B1X2RtX2luaXRpYWxpemVfZHBfY29ubmVj
dG9yKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAkJYWNvbm5lY3Rvci0+Y29u
bmVjdG9yX2lkKTsKIH0KIAoraW50IGRtX21zdF9nZXRfcGJuX2RpdmlkZXIoc3RydWN0IGRjX2xp
bmsgKmxpbmspCit7CisJaWYgKCFsaW5rKQorCQlyZXR1cm4gMDsKKworCXJldHVybiBkY19saW5r
X2JhbmR3aWR0aF9rYnBzKGxpbmssCisJCQlkY19saW5rX2dldF9saW5rX2NhcChsaW5rKSkgLyAo
OCAqIDEwMDAgKiA1NCk7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5oCmluZGV4IDJkYTg1MWI0MDA0
Mi4uYTU1M2VhMDQ2MTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaApAQCAtMjksNiArMjksOCBA
QAogc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXI7CiBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5l
Y3RvcjsKIAoraW50IGRtX21zdF9nZXRfcGJuX2RpdmlkZXIoc3RydWN0IGRjX2xpbmsgKmxpbmsp
OworCiB2b2lkIGFtZGdwdV9kbV9pbml0aWFsaXplX2RwX2Nvbm5lY3RvcihzdHJ1Y3QgYW1kZ3B1
X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCQkJICAgICAgIHN0cnVjdCBhbWRncHVfZG1fY29ubmVj
dG9yICphY29ubmVjdG9yKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
