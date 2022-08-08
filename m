Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F158CFDC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 23:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535608FE9F;
	Mon,  8 Aug 2022 21:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C728FDCF;
 Mon,  8 Aug 2022 21:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRw27B9/sLM+NtPPZoSILFGcRxZZSiMZeuZb7oAOxVMZslQvocZiKCW6mCxpvMeDlDnM3ypGsn+zSwFEDyeDokLXl5j/lu1xt5eRvNtu4Whb7Ht2ZAmOxyV3h65p0NEPfM5txz2HU5YYYSWhGBLjHcU4Ui6Itm+F99mBs5mIWGC0Bnp3QouP67JQZYMQz1hftgIcVAYtudWQp5HSD6ZfGUkDEhkkNC5HJTcyDOXGr7EgTwtlECkpndj5/EouShZsmQBtdP7EMGgszij6Ai9CbzCOrUIOM7JiCIklNrmlC5raIUf1FxD56jTRnyo1Ofe/8r2zhufZf2pmyE63Pv1/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeuUhcNR18apm/1OCer/90xjT+ZhEK44traeznIQS8w=;
 b=gu81TuSKUvpOrkhFbPkvsDRYM4ZNRD3LQpeOWusGwJTugFg+TXARacUWBU9uQ0AtzgsliOSPj3TXAzAX8sQPzD6isKi9ACkj6xn2+L4XMQ/ofC8fJfIcTeli8UgLKGNJFGo8nZZec9no/LsxKZ2EC3Dg8gzzCjBVRhzitU2uceQh3aGs/WXyBr+lmKPd79+yA3uI+tk7urfVMFGsFPEhDkgZHQBDPOtAphaFyLkMYi6/ZFFy1D5RD0FjDiOem7WLzPeinUqcyjpobCboVUzF/XsBVsyDRmoLro03mHKrJT/zUNcWg8mk0ncrNgWI9CwoHc8g8A68HoIjJqeYf9ZU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeuUhcNR18apm/1OCer/90xjT+ZhEK44traeznIQS8w=;
 b=3jgTw0h5X7BJQ2LHq0LysoO6zWzNNIlBPDG2e7GWKk4N9sKA8/MGw5nDYqIw7WnkiIWHLXXlg73nxknDWrEPxwHwSJYDdl6Q5QmlFP+XmHUi9WTgkP6bXbaAM4fVESGpeQa4ujugCJvLt1GXDmML02CUJYhOTFVuNaS7UYs1Eik=
Received: from MW4PR04CA0347.namprd04.prod.outlook.com (2603:10b6:303:8a::22)
 by BN6PR12MB1940.namprd12.prod.outlook.com (2603:10b6:404:fd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 21:42:41 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a::4) by MW4PR04CA0347.outlook.office365.com
 (2603:10b6:303:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Mon, 8 Aug 2022 21:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Mon, 8 Aug 2022 21:42:41 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 8 Aug
 2022 16:42:37 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: include soc._clock_tmp[] into DC's scratch
 region
Date: Mon, 8 Aug 2022 17:41:52 -0400
Message-ID: <20220808214201.345621-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a2a30e-38a7-41c7-824e-08da7986ebb0
X-MS-TrafficTypeDiagnostic: BN6PR12MB1940:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHPV8FUOMQiKzoniVLmoTXW5Npa2qgduwL8Ldj1PT1ogOEZT2vZRlc1In/ZRZNKK+L+Ys6HQuMkVHEBJdP+H6ENG8HbESsTUqoy9+dyGB8kTgm1EAlLmiGKf4P9oz73loMgh3JuICUlnZoUYNVrOYPD4ShjQ29115u/JBP8zOIEAJxRKWZ5nxT3WmnpDcweMu2il0wkNmz9lardqWNGNhf/TDETSkQpiSBL3/2hef6nSvy3QjnQJjCF2i4DpXepl5OWqDMyCtBF4kbxXwTgdM+NYBNT4H0cT+9CCTYLYSaws7Q2VE4sCfm9cjbJo2yYCviRhNZNMvJ6Wvbfx+QZT15l1rj5VRlIzsLzlVogHi8qkLPDoHQ6odwdOx9wlyjXixVVVIVk5uMUwT/0V+f6DCbSWG9oIKllkpCUzfgHmjTI6ZZagIivzhhZ5ijE7W+HXJrswGUkmbF++LSs4kQhSJiRbinF09VEeuuTsBGpIYLb8OKoWhQd8q2Z1Ke0J6RVF/l0fhH2nR+mITklJxed3oWFlYggKrdV3lFQG8ipFPFlXei9ddTu/RzcFPBQGfUS6DjvgoYqs5qkeSJbS4Y8qNCPleUL2Ahz5iJA34rmcZBmEyHvaRKyE09YKOebzghgK6BQQ/cIRsN4mXpHYAdFo4Hrvygw9Bl9/bQuvC4WYmjsUZoZV7IJo4r8+JEY8eJkbkKkA2n3X1s4NT18k16vjcumWY2KorAlFY1WsOhUJfxy6gzcAgGy9Gq80qRyweJpLx7uoGPfSTp49u0kHfu4VgghYcNZkY56hg+AT3qHDbJgkm5YV8hWr2sUjRzNEKZ8qyp42lq3QzRlOe7TSwuq8704Hhz6bdpCoHhufLjjo1GoUe7n5Q9T5g9VwAeVkb9NH
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(40470700004)(46966006)(36840700001)(6916009)(478600001)(316002)(41300700001)(54906003)(40460700003)(2906002)(4326008)(82310400005)(40480700001)(70586007)(70206006)(8676002)(5660300002)(8936002)(44832011)(30864003)(82740400003)(36860700001)(81166007)(6666004)(16526019)(356005)(36756003)(86362001)(47076005)(2616005)(1076003)(186003)(426003)(336012)(7696005)(83380400001)(26005)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 21:42:41.1263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a2a30e-38a7-41c7-824e-08da7986ebb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1940
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
Cc: David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>,
 Magali Lemes <magalilemes00@gmail.com>, Wenjing Liu <wenjing.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>, Aurabindo
 Pillai <aurabindo.pillai@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Melissa Wen <mwen@igalia.com>,
 Dillon Varone <dillon.varone@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Dmytro
 Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we are using soc._clock_tmp[] to temporarily store and modify
data from soc.clock_limits[] before copying it back into
soc.clock_limits[] (because modifying data directly in
soc.clock_limits[] causes unintended behavior). However, this approch
has a number of downsides, such as:

	1. struct _vcs_dpi_soc_bounding_box_st's creation/destruction
	   aren't well defined (which could mean more unintended
	   behavior).
	2. Throwing temp varibles in structs everywhere doesn't make
	   for a particularly readable codebase.

For these reasons, we should get rid of soc._clock_tmp[] by defining a
struct scratch within struct dc that, contains within it all of the
temporary varibles (including _clock_tmp[]) such that it is obvious how
they are intended to be used.

Co-authored-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h           | 11 +++
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 34 ++++----
 .../amd/display/dc/dml/dcn301/dcn301_fpu.c    | 40 +++++-----
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 77 ++++++++++---------
 .../amd/display/dc/dml/display_mode_structs.h |  6 --
 5 files changed, 91 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 77f327569b8f..61879f36379b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -898,6 +898,17 @@ struct dc {
 
 	uint32_t *dcn_reg_offsets;
 	uint32_t *nbio_reg_offsets;
+
+	/* Scratch memory */
+	struct {
+		struct {
+			/*
+			 * For matching clock_limits table in driver with table
+			 * from PMFW.
+			 */
+			struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
+		} update_bw_bounding_box;
+	} scratch;
 };
 
 enum frame_buffer_mode {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index d34e0f1314d9..d680f1c5b69f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -2234,6 +2234,7 @@ static struct _vcs_dpi_voltage_scaling_st construct_low_pstate_lvl(struct clk_li
 
 void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
+	struct _vcs_dpi_voltage_scaling_st *s = dc->scratch.update_bw_bounding_box.clock_limits;
 	struct dcn21_resource_pool *pool = TO_DCN21_RES_POOL(dc->res_pool);
 	struct clk_limit_table *clk_table = &bw_params->clk_table;
 	unsigned int i, closest_clk_lvl = 0, k = 0;
@@ -2247,8 +2248,7 @@ void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 
 	ASSERT(clk_table->num_entries);
 	/* Copy dcn2_1_soc.clock_limits to clock_limits to avoid copying over null states later */
-	memcpy(&dcn2_1_soc._clock_tmp, &dcn2_1_soc.clock_limits,
-	       sizeof(dcn2_1_soc.clock_limits));
+	memcpy(s, dcn2_1_soc.clock_limits, sizeof(dcn2_1_soc.clock_limits));
 
 	for (i = 0; i < clk_table->num_entries; i++) {
 		/* loop backwards*/
@@ -2263,25 +2263,25 @@ void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 		if (i == 1)
 			k++;
 
-		dcn2_1_soc._clock_tmp[k].state = k;
-		dcn2_1_soc._clock_tmp[k].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
-		dcn2_1_soc._clock_tmp[k].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
-		dcn2_1_soc._clock_tmp[k].socclk_mhz = clk_table->entries[i].socclk_mhz;
-		dcn2_1_soc._clock_tmp[k].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2;
-
-		dcn2_1_soc._clock_tmp[k].dispclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
-		dcn2_1_soc._clock_tmp[k].dppclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
-		dcn2_1_soc._clock_tmp[k].dram_bw_per_chan_gbps = dcn2_1_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
-		dcn2_1_soc._clock_tmp[k].dscclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
-		dcn2_1_soc._clock_tmp[k].dtbclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
-		dcn2_1_soc._clock_tmp[k].phyclk_d18_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
-		dcn2_1_soc._clock_tmp[k].phyclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+		s[k].state = k;
+		s[k].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+		s[k].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+		s[k].socclk_mhz = clk_table->entries[i].socclk_mhz;
+		s[k].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2;
+
+		s[k].dispclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
+		s[k].dppclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
+		s[k].dram_bw_per_chan_gbps =
+			dcn2_1_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+		s[k].dscclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+		s[k].dtbclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+		s[k].phyclk_d18_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+		s[k].phyclk_mhz = dcn2_1_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
 
 		k++;
 	}
 
-	memcpy(&dcn2_1_soc.clock_limits, &dcn2_1_soc._clock_tmp,
-	       sizeof(dcn2_1_soc.clock_limits));
+	memcpy(dcn2_1_soc.clock_limits, s, sizeof(dcn2_1_soc.clock_limits));
 
 	if (clk_table->num_entries) {
 		dcn2_1_soc.num_states = clk_table->num_entries + 1;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
index d211cf6d234c..241d28d0b7fb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
@@ -322,6 +322,7 @@ static void calculate_wm_set_for_vlevel(int vlevel,
 
 void dcn301_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
+	struct _vcs_dpi_voltage_scaling_st *s = dc->scratch.update_bw_bounding_box.clock_limits;
 	struct dcn301_resource_pool *pool = TO_DCN301_RES_POOL(dc->res_pool);
 	struct clk_limit_table *clk_table = &bw_params->clk_table;
 	unsigned int i, closest_clk_lvl;
@@ -329,8 +330,7 @@ void dcn301_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 
 	dc_assert_fp_enabled();
 
-	memcpy(&dcn3_01_soc._clock_tmp, &dcn3_01_soc.clock_limits,
-	       sizeof(dcn3_01_soc.clock_limits));
+	memcpy(s, dcn3_01_soc.clock_limits, sizeof(dcn3_01_soc.clock_limits));
 
 	/* Default clock levels are used for diags, which may lead to overclocking. */
 	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
@@ -348,31 +348,33 @@ void dcn301_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 				}
 			}
 
-			dcn3_01_soc._clock_tmp[i].state = i;
-			dcn3_01_soc._clock_tmp[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
-			dcn3_01_soc._clock_tmp[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
-			dcn3_01_soc._clock_tmp[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
-			dcn3_01_soc._clock_tmp[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2;
-
-			dcn3_01_soc._clock_tmp[i].dispclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
-			dcn3_01_soc._clock_tmp[i].dppclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
-			dcn3_01_soc._clock_tmp[i].dram_bw_per_chan_gbps = dcn3_01_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
-			dcn3_01_soc._clock_tmp[i].dscclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
-			dcn3_01_soc._clock_tmp[i].dtbclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
-			dcn3_01_soc._clock_tmp[i].phyclk_d18_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
-			dcn3_01_soc._clock_tmp[i].phyclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+			s[i].state = i;
+			s[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+			s[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+			s[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
+			s[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2;
+
+			s[i].dispclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
+			s[i].dppclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
+			s[i].dram_bw_per_chan_gbps =
+				dcn3_01_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+			s[i].dscclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+			s[i].dtbclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+			s[i].phyclk_d18_mhz =
+				dcn3_01_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+			s[i].phyclk_mhz = dcn3_01_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
 		}
 
 		if (clk_table->num_entries) {
 			dcn3_01_soc.num_states = clk_table->num_entries;
 			/* duplicate last level */
-			dcn3_01_soc._clock_tmp[dcn3_01_soc.num_states] = dcn3_01_soc.clock_limits[dcn3_01_soc.num_states - 1];
-			dcn3_01_soc._clock_tmp[dcn3_01_soc.num_states].state = dcn3_01_soc.num_states;
+			s[dcn3_01_soc.num_states] =
+				dcn3_01_soc.clock_limits[dcn3_01_soc.num_states - 1];
+			s[dcn3_01_soc.num_states].state = dcn3_01_soc.num_states;
 		}
 	}
 
-	memcpy(&dcn3_01_soc.clock_limits, &dcn3_01_soc._clock_tmp,
-	       sizeof(dcn3_01_soc.clock_limits));
+	memcpy(dcn3_01_soc.clock_limits, s, sizeof(dcn3_01_soc.clock_limits));
 
 	dcn3_01_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
 	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 149a1b17cdf3..0e62eb823e34 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -597,14 +597,14 @@ void dcn31_calculate_wm_and_dlg_fp(
 
 void dcn31_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
+	struct _vcs_dpi_voltage_scaling_st *s = dc->scratch.update_bw_bounding_box.clock_limits;
 	struct clk_limit_table *clk_table = &bw_params->clk_table;
 	unsigned int i, closest_clk_lvl;
 	int j;
 
 	dc_assert_fp_enabled();
 
-	memcpy(&dcn3_1_soc._clock_tmp, &dcn3_1_soc.clock_limits,
-	       sizeof(dcn3_1_soc.clock_limits));
+	memcpy(s, dcn3_1_soc.clock_limits, sizeof(dcn3_1_soc.clock_limits));
 
 	// Default clock levels are used for diags, which may lead to overclocking.
 	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
@@ -633,34 +633,36 @@ void dcn31_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 				}
 			}
 
-			dcn3_1_soc._clock_tmp[i].state = i;
+			s[i].state = i;
 
 			/* Clocks dependent on voltage level. */
-			dcn3_1_soc._clock_tmp[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
-			dcn3_1_soc._clock_tmp[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
-			dcn3_1_soc._clock_tmp[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
-			dcn3_1_soc._clock_tmp[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2 * clk_table->entries[i].wck_ratio;
+			s[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+			s[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+			s[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
+			s[i].dram_speed_mts = clk_table->entries[i].memclk_mhz *
+				2 * clk_table->entries[i].wck_ratio;
 
 			/* Clocks independent of voltage level. */
-			dcn3_1_soc._clock_tmp[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
+			s[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
 				dcn3_1_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
 
-			dcn3_1_soc._clock_tmp[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
+			s[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
 				dcn3_1_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
 
-			dcn3_1_soc._clock_tmp[i].dram_bw_per_chan_gbps = dcn3_1_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
-			dcn3_1_soc._clock_tmp[i].dscclk_mhz = dcn3_1_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
-			dcn3_1_soc._clock_tmp[i].dtbclk_mhz = dcn3_1_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
-			dcn3_1_soc._clock_tmp[i].phyclk_d18_mhz = dcn3_1_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
-			dcn3_1_soc._clock_tmp[i].phyclk_mhz = dcn3_1_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+			s[i].dram_bw_per_chan_gbps =
+				dcn3_1_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+			s[i].dscclk_mhz = dcn3_1_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+			s[i].dtbclk_mhz = dcn3_1_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+			s[i].phyclk_d18_mhz =
+				dcn3_1_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+			s[i].phyclk_mhz = dcn3_1_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
 		}
 		if (clk_table->num_entries) {
 			dcn3_1_soc.num_states = clk_table->num_entries;
 		}
 	}
 
-	memcpy(&dcn3_1_soc.clock_limits, &dcn3_1_soc._clock_tmp,
-	       sizeof(dcn3_1_soc.clock_limits));
+	memcpy(dcn3_1_soc.clock_limits, s, sizeof(dcn3_1_soc.clock_limits));
 
 	dcn3_1_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
 	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
@@ -727,6 +729,7 @@ void dcn315_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 
 void dcn316_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
 {
+	struct _vcs_dpi_voltage_scaling_st *s = dc->scratch.update_bw_bounding_box.clock_limits;
 	struct clk_limit_table *clk_table = &bw_params->clk_table;
 	unsigned int i, closest_clk_lvl;
 	int max_dispclk_mhz = 0, max_dppclk_mhz = 0;
@@ -734,8 +737,7 @@ void dcn316_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 
 	dc_assert_fp_enabled();
 
-	memcpy(&dcn3_16_soc._clock_tmp, &dcn3_16_soc.clock_limits,
-	       sizeof(dcn3_16_soc.clock_limits));
+	memcpy(s, dcn3_16_soc.clock_limits, sizeof(dcn3_16_soc.clock_limits));
 
 	// Default clock levels are used for diags, which may lead to overclocking.
 	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
@@ -757,7 +759,8 @@ void dcn316_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 		for (i = 0; i < clk_table->num_entries; i++) {
 			/* loop backwards*/
 			for (closest_clk_lvl = 0, j = dcn3_16_soc.num_states - 1; j >= 0; j--) {
-				if ((unsigned int) dcn3_16_soc.clock_limits[j].dcfclk_mhz <= clk_table->entries[i].dcfclk_mhz) {
+				if ((unsigned int) dcn3_16_soc.clock_limits[j].dcfclk_mhz <=
+				    clk_table->entries[i].dcfclk_mhz) {
 					closest_clk_lvl = j;
 					break;
 				}
@@ -768,39 +771,43 @@ void dcn316_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 				closest_clk_lvl = dcn3_16_soc.num_states - 1;
 			}
 
-			dcn3_16_soc._clock_tmp[i].state = i;
+			s[i].state = i;
 
 			/* Clocks dependent on voltage level. */
-			dcn3_16_soc._clock_tmp[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+			s[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
 			if (clk_table->num_entries == 1 &&
-			    dcn3_16_soc._clock_tmp[i].dcfclk_mhz < dcn3_16_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
+			    s[i].dcfclk_mhz <
+			    dcn3_16_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
 				/*SMU fix not released yet*/
-				dcn3_16_soc._clock_tmp[i].dcfclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
+				s[i].dcfclk_mhz =
+					dcn3_16_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
 			}
-			dcn3_16_soc._clock_tmp[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
-			dcn3_16_soc._clock_tmp[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
-			dcn3_16_soc._clock_tmp[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2 * clk_table->entries[i].wck_ratio;
+			s[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+			s[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
+			s[i].dram_speed_mts = clk_table->entries[i].memclk_mhz *
+				2 * clk_table->entries[i].wck_ratio;
 
 			/* Clocks independent of voltage level. */
-			dcn3_16_soc._clock_tmp[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
+			s[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
 				dcn3_16_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
 
-			dcn3_16_soc._clock_tmp[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
+			s[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
 				dcn3_16_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
 
-			dcn3_16_soc._clock_tmp[i].dram_bw_per_chan_gbps = dcn3_16_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
-			dcn3_16_soc._clock_tmp[i].dscclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
-			dcn3_16_soc._clock_tmp[i].dtbclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
-			dcn3_16_soc._clock_tmp[i].phyclk_d18_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
-			dcn3_16_soc._clock_tmp[i].phyclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+			s[i].dram_bw_per_chan_gbps =
+				dcn3_16_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+			s[i].dscclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+			s[i].dtbclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+			s[i].phyclk_d18_mhz =
+				dcn3_16_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+			s[i].phyclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
 		}
 		if (clk_table->num_entries) {
 			dcn3_16_soc.num_states = clk_table->num_entries;
 		}
 	}
 
-	memcpy(&dcn3_16_soc.clock_limits, &dcn3_16_soc._clock_tmp,
-	       sizeof(dcn3_16_soc.clock_limits));
+	memcpy(dcn3_16_soc.clock_limits, s, sizeof(dcn3_16_soc.clock_limits));
 
 	if (max_dispclk_mhz) {
 		dcn3_16_soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
index 8538588e7754..c596187a1e09 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
@@ -179,12 +179,6 @@ struct _vcs_dpi_voltage_scaling_st {
  */
 struct _vcs_dpi_soc_bounding_box_st {
 	struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
-	/*
-	 * This is a temporary stash for updating @clock_limits with the PMFW
-	 * clock table. Do not use outside of *update_bw_boudning_box functions.
-	 */
-	struct _vcs_dpi_voltage_scaling_st _clock_tmp[DC__VOLTAGE_STATES];
-
 	/**
 	 * @num_states: It represents the total of Display Power Management
 	 * (DPM) supported by the specific ASIC.
-- 
2.37.1

