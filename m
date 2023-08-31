Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F8978F372
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B09C10E6CD;
	Thu, 31 Aug 2023 19:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A397A10E6CC;
 Thu, 31 Aug 2023 19:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAwQEmHFG634pnc+7mIn/7ck3Az055aG0+Yn+JBOA6g2xwYXDe3JugyPKPN0DbJ0heZY+ew5eKRYG7OIUhUaHDFh8ZMRxz10eQYGJC3zaZ3p+5bU6lq3MCn3MsnNwyFffQraHKvqPBjadCNtI5tixu3wHh0X1K8abvb5qkRZhCVu+h/YinJ4qPvVFu6LYkGcdPzFFAYt/XwM6aooqzVydtVIoFE0Tab8P4cX4tze0jHsND7J5cAk3Wf13yLCKnWaXC/X2vG/6Lh3Dja80iNbJnurR8V3XBHwstW5k8SeeVVcO3qeI6lnuTzZLDonK8K/PlP4h7p4MjrhMUtYxvR9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPt/2+Caib+CQ2sVodXIXOm8LykQ9DOPiSx6tD3J0zw=;
 b=VIlO03jm0FjhI8rq4bASuq/uJz+h5JcCpjv83ecnRzieqHcnZ4vEfbsNpPGbN50ut9snOGkE5B1R6sCHXq49xR/ijbfdK9ellwFHTqv491reEy536TXSqII0Qnck238BPGy46WDX4m6HPaAMUXKCk2DaCe+5EsnX8SxCp7eb/iTaVDLjg95EivxkyLrJm5zigwQxM9DBFG5wHyzi9S2Nv0ECiEuDcva4GMVo/GH9oxKygGzU0vjBP7J7j40XiYnKoV2vcDsLyxdSRMdia/ocDXNqPeM//r8ks0FsAQCURAECaw2W0qsuY+GCR6U3/rFNGukvI2vyj7bN+fKEI0GP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPt/2+Caib+CQ2sVodXIXOm8LykQ9DOPiSx6tD3J0zw=;
 b=KJiJ1H5nnVBFDiGFqQH1YTHJv5+sBSCWUo6AzCdey3tg8DIw6bvmZBKqMIL6p7J/19PORbcPTBZX3953DaKANHQsWhdRsROAAEeJvh38TtG287a+AO7DfUPya4+jzy5hfrkoyeqrdvyxp+XkWIi6IyPIHvs2HG4Z1O+7NLgOQlo=
Received: from SJ2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:a03:505::24)
 by PH7PR12MB5710.namprd12.prod.outlook.com (2603:10b6:510:1e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 19:39:04 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::35) by SJ2PR07CA0022.outlook.office365.com
 (2603:10b6:a03:505::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 19:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 19:39:04 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 14:39:01 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/amd/display: limit the v_startup workaround for
 ASICs older than DCN3.1
Date: Thu, 31 Aug 2023 15:38:42 -0400
Message-ID: <20230831193844.154254-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831193844.154254-1-hamza.mahfooz@amd.com>
References: <20230831193844.154254-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|PH7PR12MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: f48e3f57-d8d5-495f-e7a5-08dbaa59ef1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PViyb30tqUBzp6AbuFkZ3mKZTbrznUUwtBjtGbkmKqMwSoVpL/jEkMAio9oET6I5knyBvU1tq93UpSdSFHTkA79pz8WX0P7hI+zmVlVxgKvwkysFdUCs4O083wYhw3EqH/tRut/5jhRBfyt5Go7R41IotFzyg/Zbh+zBljsCm9v3oRrvSl0ujW7oHfB+TvoL1AZTIqc9dr61VXEtmEfU+ly1uCID7I20qe9vpRzQAdgM+x+2HFDB5QVEKWcQcVGt0pj2ywXDTg5Wz2Mgu08mHVEJp/95hR1RWihATk8U/769DQMMH+CuX3hWqsb/7E7ydpGTreR8JMu2FBchGaE3Q2gzwgKTVej8kPRMKaoeQ3NEWUr/8iB+bau7bqAFaGRpBUgnpWreC4MrT3SXuHcRmDMrqCT+SokFpg4R0RXWwdsVCd1DA/ukK1te0qDISYAcAX7hGAPSjuAvDEhyuguZU4UxP73jMl3z5s6jumCvA+TQ3u2kngayj/vbADgFIhAklKZL4DoMyoGaDXX17n92u3wJ0i0D5leB1pRuy1eb/JX8va5h2kgEwjUEkBkmJlQMCY9wcYIftGkq7NgAgCgo08+rT56I8uoqBchdbe1glysRMaXwFRKkqFrTLIgwRDaPFNeD6Dmr8YrBODZV4NALbXLubs0shuI4bxSzq92PM9smf5t2fHSat9Yo1VegVZn7YaU5JPMlrECpVodu7NEIoeK6qV6uYyqcnpqN3S+lC2NGJraogQtluHU19NAbXJiOKSNSfHpm7x1MiIRT1oO3ZVNIpnxO3JaLsB71qvF2lSugAkEVAX/mWSL8CXSvJYUy
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(1800799009)(186009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(82740400003)(356005)(6666004)(36756003)(40460700003)(86362001)(81166007)(36860700001)(40480700001)(47076005)(2616005)(1076003)(2906002)(426003)(336012)(26005)(16526019)(83380400001)(478600001)(70206006)(70586007)(8936002)(54906003)(8676002)(4326008)(5660300002)(44832011)(41300700001)(6916009)(316002)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:39:04.2176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f48e3f57-d8d5-495f-e7a5-08dbaa59ef1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5710
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
Cc: Daniel Miess <daniel.miess@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Nicholas
 Kazlauskas <nicholas.kazlauskas@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Sung Joon Kim <sungjoon.kim@amd.com>,
 Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since, calling dcn20_adjust_freesync_v_startup() on DCN3.1+ ASICs
can cause the display to flicker and underflow to occur we shouldn't
call it for them. So, ensure that the DCN version is less than
DCN_VERSION_3_1 before calling dcn20_adjust_freesync_v_startup().

Cc: stable@vger.kernel.org
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index 1bfdf0271fdf..a68fb45ed487 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1099,7 +1099,8 @@ void dcn20_calculate_dlg_params(struct dc *dc,
 		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =
 						pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
 		context->res_ctx.pipe_ctx[i].pipe_dlg_param = pipes[pipe_idx].pipe.dest;
-		if (context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
+		if (dc->ctx->dce_version < DCN_VERSION_3_1 &&
+		    context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
 			dcn20_adjust_freesync_v_startup(
 				&context->res_ctx.pipe_ctx[i].stream->timing,
 				&context->res_ctx.pipe_ctx[i].pipe_dlg_param.vstartup_start);
-- 
2.41.0

