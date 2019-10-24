Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C432E3CA2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 21:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849556E78E;
	Thu, 24 Oct 2019 19:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720060.outbound.protection.outlook.com [40.107.72.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21A06E78B;
 Thu, 24 Oct 2019 19:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvbHKrl6vsHRt1OxmWgtVN+bQeMP6RkZyoUEXfz7GoocwXHStRrDKmK1Le2qxAkqTeSydZwkY975ul2MI/Xc7F17Sy0Hk6sX6AYGP1BVrFxX1SzDwXaDWpk/S2+5rdVgqy9PMChsB8h0ahqP7fCtf06G0f79m8Lfkc34YiWVUS4KEtMHzLG2u3dLNeeJL+wsj4vnMPEvMAxLI4pEuku7vL2ygpN2vD4VHEb76D8q6NsWy+xoupmj1qHVckoZRDf8gZoLikIcWVmevvLkQ+xTsTeOWpCGHlimiSepuybCr+xgFmpzzQjeMih/UUAe77LFQUCN+ZIzZkuavkfRfJwBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mpk4S0bnzFnyYoMy/6ptbMwhOLF48GAOZwi0dLClAHM=;
 b=Tb7hlWxHVVkTDiDOHMOo/JhDxDmcTZGz38zCLw3LB91HJPptSh8kgGBhy0IkH2woAHCySQjukoPAbzJ8lpTcdbF8ZFwL5e73I1zYp1aqnzfKnJWLXQmyuQraBfF8FOPMpNcRyiHtTlRhc22cYVvKr2Q9kCPczOz80ydYfT+qXbgzG2uyqpeMpNMnMCbwVIaF3/Kiie6SvtaUaED1LkW8E4nZ4hxj2IqH0E6lyIqu+FDqCjoV0IuLo4nsgweGL6B7LjQCkmkhXwFXC8F1NL2w2oUIdsl2ax4Qd+73aZMVYb8dfIcbsiTisLCcXkYg+64mb7ACWkpCZmX9nlYLXZPLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0049.namprd12.prod.outlook.com (2603:10b6:300:103::11)
 by BN7PR12MB2673.namprd12.prod.outlook.com (2603:10b6:408:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22; Thu, 24 Oct
 2019 19:57:36 +0000
Received: from DM3NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR12CA0049.outlook.office365.com
 (2603:10b6:300:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22 via Frontend
 Transport; Thu, 24 Oct 2019 19:57:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT036.mail.protection.outlook.com (10.152.82.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2387.20 via Frontend Transport; Thu, 24 Oct 2019 19:57:35 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 24 Oct
 2019 14:57:35 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 24 Oct 2019 14:57:34 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: If amdgpu_ib_schedule fails return back the
 error.
Date: Thu, 24 Oct 2019 15:57:30 -0400
Message-ID: <1571947050-26276-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(428003)(189003)(199004)(7696005)(53416004)(126002)(81156014)(81166006)(36756003)(70206006)(5660300002)(70586007)(50226002)(4326008)(44832011)(50466002)(48376002)(4744005)(16586007)(8676002)(47776003)(478600001)(54906003)(316002)(110136005)(8936002)(76176011)(51416003)(336012)(426003)(11346002)(446003)(186003)(476003)(2616005)(86362001)(2906002)(26005)(356004)(6666004)(305945005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2673; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a8335a1-ee2e-44dd-ec99-08d758bc6a77
X-MS-TrafficTypeDiagnostic: BN7PR12MB2673:
X-Microsoft-Antispam-PRVS: <BN7PR12MB267377ABF24A4D1A9E78DB68EA6A0@BN7PR12MB2673.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 0200DDA8BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWAIT9X9vYpXS/5XHX+e7cLxq7kKggKRfn9UhCWSu4bELDy39dNOOj1EbuPIalTndRFOvJEIuyKsfNivcJ8FN3Efv/WV9zt0vY72jBVDqZjMrrlYRVWBY+b07LyOx/+RR6ct/hbfsL+ox+wu3N6tzHdB0k3G1XQUw9rFPANVEIU6Lcq+s1964jQ+9DKjKfDvi6jJ+oQX11tF5wt7WAZDpCw248XHzMRVp9CYx5BfVM5sFR1sL/U9pYVyg2RbhVyTuvUuEYae+99BIAqbS5beD30fbELujT0BCEUmlyhfChWRfAnv/U62/TXo90I4bZTQvyMMTI8Tu7ME9o/k6iK+rom22eZ6w8zDE25a22SXSePi//xZ4DHzqfWA0i04k3qMCi8AYlO9IW1W0b6SH8buOEB1UprCM+YZRtiGnvxjrVK9FyicTCWXRlvZ5WNmya2m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2019 19:57:35.8623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8335a1-ee2e-44dd-ec99-08d758bc6a77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mpk4S0bnzFnyYoMy/6ptbMwhOLF48GAOZwi0dLClAHM=;
 b=ItrCK0f0y+2lxa8mM7UONtK09qUQoHzb1nGSSqaXq2R4CEx3T8BfYjjwkeHKSqOGSHaTQ5gVES0Nae7h3UQXxbXs0aiS3hUkeHpZGWzbi0+b2cO+RR1GP3BOlpysUtYmfuDu2puZdlwR+wFx0NmU/KfqlS5Oq6SefR7NmXHHJBM=
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
Cc: ckoenig.leichtzumerken@gmail.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIEVSUl9QVFIgdG8gcmV0dXJuIGJhY2sgdGhlIGVycm9yIGhhcHBlbmVkIGR1cmluZyBhbWRn
cHVfaWJfc2NoZWR1bGUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfam9iLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCmluZGV4IGUxYmFkOTkuLjk3NjliYjUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKQEAgLTI0Myw2ICsyNDMsOCBA
QCBzdGF0aWMgc3RydWN0IGRtYV9mZW5jZSAqYW1kZ3B1X2pvYl9ydW4oc3RydWN0IGRybV9zY2hl
ZF9qb2IgKnNjaGVkX2pvYikKIAlqb2ItPmZlbmNlID0gZG1hX2ZlbmNlX2dldChmZW5jZSk7CiAK
IAlhbWRncHVfam9iX2ZyZWVfcmVzb3VyY2VzKGpvYik7CisKKwlmZW5jZSA9IHIgPyBFUlJfUFRS
KHIpIDogZmVuY2U7CiAJcmV0dXJuIGZlbmNlOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
