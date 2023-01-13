Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA89669DCE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B501110EA4A;
	Fri, 13 Jan 2023 16:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7112C10EA41;
 Fri, 13 Jan 2023 16:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuSEALY0bpMRJP8omt+52Ewn3SyhR0I6enhz3+bYAM7dQ1D0vP1wDah3M5MPBEkKgUg9pMbwr+sfE5KsAHvnHSwZnmpME4SLGoXp67ByxD0qjUWw676HVaN0iXpdIPQ4ihUD8uqP9NhnIjYd9XZi+Z1gnBwR/asJuxt8tRYBZxYUmxyiK58pesQY83dE6lwQom9muMzqrO9BcNDLf3t/GhlehfnJULurQCCHqKrzP9PO+BD0k2Z2Jz/1A+QsfTjhVPifC3GZdhOvhjm1uXVz2+h5gCxG5kvrdRMrcL2B8zKzymWvOwFh6KmNit62H3l0HBOuVZ9tFBvFzdWcFFxVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldQ0m3ile5oExLguZb0+RnZJ6kVP37CXjOcvdS45bVA=;
 b=EPBPILSHxsS6Avw8zK6dTqMZr5x1nDWO/ZzT/9+aOL8qVuPauW1rNfU2CcByS9aau22Ncyu9BraWyVeZhHqgoTBpqXCw7PFfjK3H49neGyfbcZ1B3iswgPvWBOrZZvZrbgNfnAzYeoTMoqOdQZroFPyVP/r6qTLjpv0iMcfJ6WkBERFWkUvWdZfaQ6513MjWr/tYFzhL19JdeZKPXdE/tVh7qYW1Q+/MEwbA1UMKV7OpfBH7eLWGJOqtt23GEywsPRhM4DRRZbzerdItdCXYtF4Gz1v18AoUfFck3A9QwIVeK/YKfAS8Kld6wNGI52S+V8oXyxsLw2cbpe47kfgEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldQ0m3ile5oExLguZb0+RnZJ6kVP37CXjOcvdS45bVA=;
 b=L581/7G4yuh82EqW+eJ8wE9xsY7JAYP5MyB/hCKD7Ey4KxnXNIOqFyEyGvNUCTJA1fPbcrGN1D6D90AIVEn1969izfQ/G8gCEADvuGhkbR3noWOUiaHiGIh6GphRwN51gP1Zq4wF/bWw/j+qkMnb7aybGo/fStez2mms1ndOYIE=
Received: from BN1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:408:e2::31)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:25:14 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::55) by BN1PR13CA0026.outlook.office365.com
 (2603:10b6:408:e2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:25:14 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 08:25:08 -0800
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:07 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 20/21] drm/amd/display: Calculate output_color_space after
 pixel encoding adjustment
Date: Fri, 13 Jan 2023 11:24:27 -0500
Message-ID: <20230113162428.33874-21-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc1e048-875b-40cc-e80d-08daf582c045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: htZKSkdXBFSm6or4sdM3rL2CY3U8LTMx4jg/coORFBpPUe+oH5xU8cI3wrIOH36b7BOKfamSMI2blQZltyXFPepKrrtMvBBdKLXHDxebDwJwcMFXmTMtFHkgc/g57HUjjoV6gsd0LHkpAIqZ7ECksOYHQUj1ofi+vjfYt/YMQdSwhqyv1shWzjPdFI5UVuWirh/jzrn7HICemW+eEVvsV7v1QR+lP05RXFmhhP1sbd4rsmLZxRwbLuU8hBr+y0SXGqKq4QuXlNhSTY/Yjz4zrLIJo02cjkPiMV86Jcj3qwpxbLjixeOOl5amfZEHrY3E+S5YcbEuHsjwJhtUqqXwDgx/EW7A995dY7CVn0VVbycAQVzSnzFLE2Wczvm1gkOSX/VGRzWSOYJbWLoGBs0HH6YeIv75nqyth+eq9nyll8h90LXY+e7GZBtX4gHxcSlem4RUqR8wcRKZ4wnegysvRUSEoxT6u0jIDYm5Yym+If/mcx/f2cq0domQON2Ufu68xw9mMu3ZUlWlIKjeO/L+PIj+w2ZD8G3BomP4GGaBCUTWJElAySyF2+j0GTygOgzFM/ycafusbLwA3VCOPKd2cqZFn1g0hqeFLyZ5lVWLUjojTekZC40npH94BYSaGykecgMwL8ZIzA/+JEolczsfmOTM2MLP8o2rLsxJ4qF1BuXL8s2Xmn4+sdbQB53Ryu5HlI6QeinRxtyj3ap+IaNY7mplV838zqkBO/r5m8POfnA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(356005)(44832011)(2906002)(86362001)(81166007)(5660300002)(8936002)(40460700003)(82310400005)(41300700001)(40480700001)(82740400003)(36860700001)(47076005)(426003)(83380400001)(54906003)(110136005)(6666004)(478600001)(2616005)(8676002)(4326008)(316002)(7696005)(70586007)(70206006)(336012)(1076003)(186003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:25:14.6238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc1e048-875b-40cc-e80d-08daf582c045
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
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

Code in get_output_color_space depends on knowing the pixel encoding to
determine whether to pick between eg. COLOR_SPACE_SRGB or
COLOR_SPACE_YCBCR709 for transparent RGB -> YCbCr 4:4:4 in the driver.

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 16940ea61b59..eb188487f0a7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5341,8 +5341,6 @@ static void fill_stream_properties_from_drm_display_mode(
 
 	timing_out->aspect_ratio = get_aspect_ratio(mode_in);
 
-	stream->output_color_space = get_output_color_space(timing_out, connector_state);
-
 	stream->out_transfer_func->type = TF_TYPE_PREDEFINED;
 	stream->out_transfer_func->tf = TRANSFER_FUNCTION_SRGB;
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
@@ -5353,6 +5351,8 @@ static void fill_stream_properties_from_drm_display_mode(
 			adjust_colour_depth_from_display_info(timing_out, info);
 		}
 	}
+
+	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 }
 
 static void fill_audio_info(struct audio_info *audio_info,
-- 
2.39.0

