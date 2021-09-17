Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835840FDB4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257B56EE50;
	Fri, 17 Sep 2021 16:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DA96EE50;
 Fri, 17 Sep 2021 16:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/f7pza4tSAZOClugKwW3tIv85LIZ3jzDDHtvqcPIoKlmVIK3Dt94z5VbLku4SpeumSOQ46g4ifkscEm601tp9sksLiu3ZdLeHtLvg1pVidb9Us1KpPXYPhXWOchpM3+UWPkbcog2r4rQUaJCkEc5QboIK+oE2HjGp/klU0nzTJb9OfZdwr/iQMkNKiKpnTQqJzg+g6y87WKP+Yy72gFpCq+t4wUZFt9p7EwGRNUmMXHKyiTDTh0SdQCEs1u5Pz3l9Ucmo00JkH/kYlny08qSkG35sA6wfIfaKiVh/4/q4LnDLFmtdID6/6E8Q/XXEAU+Fr7890I1xyQK56DPFAp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=j+JSUv4VAzY27oUubqiXR0pjtOkrzFlzd0/XTPbcolA=;
 b=d6p8pxw8dRdRdRtI0DxQO+KjYIyq+HcVZUm81i5MmXOwsW4u0A71jOhVZK1SFdzCaWpqmhh81FioRWDtEo9q98w3AI0beWQbxz2YWgXzynmUZ9JvHBslsBbs4XkEcuamFCJFkNsGS3C5z9CCG7vEAhGOk/mPzjeWc8S+M2oYG74pqGIBdYh/1Jh/7a6ITy1O2/QE+cAHLioXeJgXbiprSaVnveeuIoKeGH8Ym0U7LZuBlBAPjoZREbQwvyCeTNhnL1fg7f5lNh2cI6KstQ/MciLpO8T49No/5NG6RJwKb4UocxWviT3iYW8NfSs+A4+2xyHieo0hCLTAxEbGzFfj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+JSUv4VAzY27oUubqiXR0pjtOkrzFlzd0/XTPbcolA=;
 b=QzByFYRIBN+xZqbhH+9X+bAZN7tVTspnFgW/4F73fiAtTQRcef+qTaqogN7g4oTkS2PLRUQR7raiEe259gP6dpvCr8TGm92HNJ7ZwAESlJB5TV3hNshYPM5PTmJA1EjqZIlPJnT4/2N599CuBLGdgSpF4CqL2/Sze+b9gdI0jlw=
Received: from CO2PR04CA0203.namprd04.prod.outlook.com (2603:10b6:104:5::33)
 by DM5PR12MB1564.namprd12.prod.outlook.com (2603:10b6:4:f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Fri, 17 Sep 2021 16:15:56 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::80) by CO2PR04CA0203.outlook.office365.com
 (2603:10b6:104:5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 16:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 16:15:56 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 17 Sep
 2021 11:15:55 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/2] MAINTAINERS: fix up entry for AMD Powerplay
Date: Fri, 17 Sep 2021 12:15:39 -0400
Message-ID: <20210917161540.822282-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca6ec183-66b7-451d-3167-08d979f66e23
X-MS-TrafficTypeDiagnostic: DM5PR12MB1564:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1564A4FCD8B9F8F477C5EE1EF7DD9@DM5PR12MB1564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7jENjHiJ6H7d8vvG/WyUmdTQfeNNgRBkeC7Udbv2IldyVDW6N70WhjRMaBtuK2sDpa2hksYQAjN3x9rL16nW+a0FPZcurXdp7v5R31bKjugF+B6P6bWKbSoHvxWkSl7nzIXKqT6t9/npbwrL+eF9MKnoP0acSvTtdzoo61I7I4yFoxNIFQ+7FL4K4wh7tDKqwqnYlRiTLkQdidDp6omVwZ5yLtdPufBnPP5pvNBJM+BIinzo0tNGM1dHE893VFF6MWc432V8bbVLE9Q/9fhejZ9KfqwFrWQw6qkLDkHodKkweviUcfM2Uf1XezQPt8vnmVZzHuftmpDSHm/Ov5HfAOdxuKp2O5jiTEAT/R+ho/dUNtRpMKKpq7M44eywsBJNaD+EUE3wxaRceJQPMtHGwaoF0RhWnyxLFUjo7SbuPTbf+glUOzOHbwiDeebRgiw4IZhlzzFGrvzfOHsX7Ee4u+KhuF70r13VetqpVNSsAqMSJWKbe22bLPDTBXCpe7LvTIwZtVBm1RapXIzJzAh5KOBnaLL2IQFUcvYERJS1jc8+ia6L3AIUSxVSE1R60zKb1CqfZr+Nmk05uJjGqqj8kuV4kQJbity+rM+tvDV7sKDQ65jY8U31cbdgDghz9Hmi7Ju7Mjf9vB2/HEcsH86edtwrwLopyUt4kqMpEm1uoHpPMmTs5vB1Z7j+agEFs5z/rzWRSx1QZRMcI0V0f7mVGotwHloppm7hipgMX9TStA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(36840700001)(316002)(81166007)(4744005)(70206006)(8936002)(82310400003)(966005)(7696005)(70586007)(110136005)(82740400003)(426003)(2906002)(336012)(2616005)(8676002)(6666004)(1076003)(86362001)(186003)(36860700001)(83380400001)(26005)(36756003)(16526019)(5660300002)(4326008)(450100002)(356005)(47076005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 16:15:56.4722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6ec183-66b7-451d-3167-08d979f66e23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1564
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the path to cover both the older powerplay infrastructure
and the newer SwSMU infrastructure.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 851255b71ccc..379092f34fff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -972,12 +972,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/amd-pmc.*
 
-AMD POWERPLAY
+AMD POWERPLAY AND SWSMU
 M:	Evan Quan <evan.quan@amd.com>
 L:	amd-gfx@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
-F:	drivers/gpu/drm/amd/pm/powerplay/
+F:	drivers/gpu/drm/amd/pm/
 
 AMD SEATTLE DEVICE TREE SUPPORT
 M:	Brijesh Singh <brijeshkumar.singh@amd.com>
-- 
2.31.1

