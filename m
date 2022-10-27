Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75760F000
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 08:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2339410E4F2;
	Thu, 27 Oct 2022 06:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765C510E4F2;
 Thu, 27 Oct 2022 06:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3edfHBADtyjkCqn3CerSRIz1rAdLjAFfvG1qWRsbtxyfyivqKVTQ7uvXSDS4qm5lejGgUW4qDQJBUoEA/LvMlPcgYkEnqt+XcU6u/YaSVWxiHCPUtL3Q89BOwVnKLIDl91ab7nIqQPT2Krv/g5InMwM8csxtbzqp42dU9xrNQspurb9xJjhiDX2AUxnlkCyjGcczS5BWVSO+A5lWvtlXZziLkf/Jysgbnd6n8V8Nw11bdW3qVmha1ZdDqP3tTxWCy5y6CN9SfWb/D6m1iYnBmPcTuYpScBQjfuRlIz/i/uX/RIL85vGjaPVuXVqlB78/Rsv8ZjkGdp3lrmyydTRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4u9tW1jCx7yN+GgrFA6gfx61XNtmQzPBMfSSKrMYuE=;
 b=JtYYFQHwoWlzTiSd1GxN67z37z1nGhKfJcW+jLoHoI6IUDIhBEeXv2T+cTI7xAad2wMhxAfzMzln4YjejLcg+kIxnjPDJXPQ/cEhQG7MEPHawof0Eoe5J68Hyrwf0FQ5xKDSCWoNH9yt2aIoffXGH6J+h9YS1P1tUpKXF/UijonB5RSnua+vfIKseQEzuhHuz/jcKXoXqtvpTFtsAGsyaMCxqfhPyvlBa59Y7bw7KgUnnJ+4VISpYfALqmxp34kAct3qgtmwjh2GEiz0sjvEj8O4Ej05az2mI5TICoLMjrXXIg+OImR25FNVBy/q0zVxeEVlwDU2zGs4CKDeLH2zGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4u9tW1jCx7yN+GgrFA6gfx61XNtmQzPBMfSSKrMYuE=;
 b=hPIYXqHe57qrNZxm4MDEOELuRqihH+48jB7yg0Ic8DrODLQhb+6ldxNc6Fa6hEaiZbgeGOnGP2JuYy3lGR6PV/6hcs+tBYPefaJAnK3mKyXzROB7VIeCaRWYmd/oKdOxNrZwVFp2MUQm0FFns8+ke6Q3So/KtxvyRGJUqGhVgBg=
Received: from MW4PR04CA0112.namprd04.prod.outlook.com (2603:10b6:303:83::27)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Thu, 27 Oct
 2022 06:19:07 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::c0) by MW4PR04CA0112.outlook.office365.com
 (2603:10b6:303:83::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.29 via Frontend
 Transport; Thu, 27 Oct 2022 06:19:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 06:19:06 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 01:19:01 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] MAINTAINERS: Update GPU Scheduler email
Date: Thu, 27 Oct 2022 02:18:35 -0400
Message-ID: <20221027061835.39784-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 2553727c-ed72-4e47-9b24-08dab7e3274e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +60/plozNp2AKT4d9k7GyVfgGM4aNn+6FBwRs6VFQ4vp78IOL8fe0dTjWOIszls3Rywiy/PFXBoWusgE1LkXmk8FWDHh/sf5pYVhwBkcicyxr8qAQHDKFVMqm46EnU5yYvdNPyNZOo32Rt5TmGWNfDHlsmiMLL8HTUzEQdbTJTtcjOhjddA+dDJHHZrTzW0BEuTriQen3gNAz+SiYf5nOKaCHRQ6jRX3rKqyY97QEIA3WWzLgShoR/3Ud6EiC0wkmVehoSGpxTU/99tvxpmgGbhTO1hiuLmrvvERntCOqErLE5po/oPdBsIslx89CCEwYH4rYgbG+OMMgTxbnoAw3kMy+GgG2ocWQnFTI+1/rmUiefVionlMjP9EVLDCiEftKyei3m3fAeFGuN8W1t6ATEHaNRGFPSycf6HY1OB2A7xIGAc0H4W0q9GixpndAtXdLCa13ZZBKIZzYRnzmiPvW66OsbdMH8Phgh1Jj4FvHDO2mXJz40R+Sde26i+Hot7UQWgGiFFT1W3EHvHNuHKAnwsmp5eU6hgA4jj/kKBs2zuesdd7ZwB3XebqsJpo7v/BE8OjBQEDOGsRxwsp8NfFPBYYAM6h1/TU28tAMo2Xm9vK9EJ/9xd5jABaHFWKG5otgXShK5MzMr4UikhahRY/gDpNShdDwG8muC9xq9aYZXCBJhqWr4XseDHZqGo0BkunSj2J/aL6+wHR6fCE7Lc0RV+9IilyA4w3lmisZXLSw0VtVEGGvSntd6nmEaJJB1kf3lcrN0VjMSebc3+dFnH/tHVRAnDma0VWhTjymVQPe6VctkB18ULkETVNVHPaf/9D
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(40460700003)(356005)(40480700001)(36756003)(86362001)(36860700001)(4326008)(82740400003)(81166007)(70206006)(8676002)(316002)(54906003)(6916009)(44832011)(5660300002)(2906002)(70586007)(426003)(15650500001)(8936002)(2616005)(66574015)(186003)(41300700001)(4744005)(16526019)(1076003)(47076005)(336012)(83380400001)(26005)(82310400005)(478600001)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:19:06.9550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2553727c-ed72-4e47-9b24-08dab7e3274e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update GPU Scheduler maintainer email.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b1f3d0893393bb..1997006d1e25a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7109,7 +7109,7 @@ F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
 DRM GPU SCHEDULER
-M:	Andrey Grodzovsky <andrey.grodzovsky@amd.com>
+M:	Luben Tuikov <luben.tuikov@amd.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc

base-commit: e1e7bc481d49c3e3ada11029ce0d9b85a0a539d7
-- 
2.38.1

