Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9063669DEB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CE910EA55;
	Fri, 13 Jan 2023 16:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECEA10EA4C;
 Fri, 13 Jan 2023 16:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kD5+P29wk/VSRIbCdOGVvdr17pXV1r4c4+Y2/A7hprC3mUrhG7EK8IM7V4U2jLdh71FkUKWD6pmPJw8ItdfWlacfdaw67XVQ28LMw626akYuG90S/GYPtceFu9JBTyTJ9ZTeIyr7D/3fGWfMQQEhajpBJtHnH8aLiTc8QlAA/C6bFhJ/lCBmENQaBhwBWwpmYcyQOOX2Rv1+t8GwgYToeEb+RctMQIxTOS17IMNOrq5WNJqFuNvtAp3T6Ms+iG2iERgiIj4btQHFwpnJYsJBSeBMGR8JWlIZipV5TFtOQU+bWUuCUsikywUwneCEvDWmu2MELqVR/cdedX6u21gWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGZRaSifNH9Gy2SRNlWvPBm9yXwCta8T7yMCdFycRxs=;
 b=JiEe0R0+giFPDZUZnvt+AmkF/oOaGz5HMExJCR965cALPHN8Wl+eUodXi1B3R9/SWviS2fSp5/18WH19fq3X16ovzLSnGOCVd9IigDkV3S6fgOzzqHVQnsXaiKHekfg3HU/RgSFEnl2WHGS91DakWw4ShOzJhVfQtnpmNw5w3FbIavwhR+wfr/1/rTa8/OycCLOiIOn+pTPlOrlHTPeW1hfGqHXUF0XrIzP4sr637USJSy19cgcNiaRn45E0OQ3kJb9dlEZtJK3uzFSpcg5HQdejmzQQqILpyjoH8XLFwMdBcg0piCIFwPKjdjzqyW0nLA3jstcE1nv/RBH3tNj2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGZRaSifNH9Gy2SRNlWvPBm9yXwCta8T7yMCdFycRxs=;
 b=Or4S/etfFOWuTL1LWZyw63SdUji2KDTfgindD/FFIjoEwLVDtFaSWj27Aoxlvz4BTYraGsL0Q6y849JOVHNs7vPYck9teSgXr3lwdEkXi2AsIaiYzqXf/XRay777HxoNWB4LP2F6dfqgxDCIBorkrVVXQV+VUcE7vE3Ymhyu3n4=
Received: from DM6PR07CA0062.namprd07.prod.outlook.com (2603:10b6:5:74::39) by
 IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 16:26:48 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::52) by DM6PR07CA0062.outlook.office365.com
 (2603:10b6:5:74::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:06 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:06 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the pixel
 encoding is not RGB
Date: Fri, 13 Jan 2023 11:24:25 -0500
Message-ID: <20230113162428.33874-19-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a24aa9-b16d-460a-f7fd-08daf582f80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjBfcGSDdj9cYApyGgGecDT5MKzICdVBaCiYTDyjod2RfK3awkrEn8Fyiq8ufYpUlslTCrl26DkOk7UKZRIKrmxXmWT8LtpzCO5+ijhm/t1G+y1bxuX7RxuktX2a9Z6l1kbgHLEW6XoAojZE1Gykd3gnZxUJPSzOtEMcuFTjk3WZ6FVjrEOja/Yh2GYwS2BtYivAWzVL+kBjEe4TuCZH8Tp2ASyTDVeRsULKmWuajAx898BEBZMt8/mTLv1P3YbZkXyDVtl+8hqHGdoYSxmcR3COfA1VY3VVSu0RatvEaOAYZz5fDn71Tu0lP//+RuhU9Y59cV4XWtQnCCz8sp3iKV0enQ0hRvCF2hkNMB5N1rH4dpEix3v4okuWPF88h2v9HKxJOuBbeshSn3aXNqw7RRI4ClvrL2mqlTPoat0fO562qhNyFN/KCD4QUMQe+KTSu7i0XOQFsMIcYWTqoI6SUy9zbEJ8ytyuR0Rs6mGot4ETUu8LtiSiQ19m2T1FAQRT4u7HTeOFLtAreMS6SPDpQ/hpAKTadKLp7Y1mCw2rvLPnsyTCF6SEfG44R/3fO30Oh97Kz8xDIXy5axGSvuP7Iff21SCJ7hkPd+ZEJF+355SNA+LugCRshfUCmQmoM+bjxpdSEhyCh/bHBTq/5I91yWSexcLLB1qWlVQ8f/IJrwKCphW0ctkBWArP7B84A+AM/4MTAXBIKGY1yjZ5iytnVYNYkVKcn5brNHVO47D0ZfI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(426003)(41300700001)(356005)(81166007)(478600001)(47076005)(40460700003)(86362001)(1076003)(316002)(110136005)(54906003)(2616005)(336012)(70586007)(40480700001)(26005)(186003)(7696005)(82310400005)(70206006)(5660300002)(36860700001)(36756003)(2906002)(6666004)(44832011)(8676002)(4326008)(83380400001)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:48.1587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a24aa9-b16d-460a-f7fd-08daf582f80a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

Userspace might not aware whether we're sending RGB or YCbCr
data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
requested but the output encoding is YCbCr we should
send COLOR_SPACE_2020_YCBCR.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f74b125af31f..16940ea61b59 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 		color_space = COLOR_SPACE_ADOBERGB;
 		break;
 	case DRM_MODE_COLORIMETRY_BT2020_RGB:
-		color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
+		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
+			color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
+		else
+			color_space = COLOR_SPACE_2020_YCBCR;
 		break;
 	case DRM_MODE_COLORIMETRY_BT2020_YCC:
 		color_space = COLOR_SPACE_2020_YCBCR;
-- 
2.39.0

