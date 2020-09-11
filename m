Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9512661B9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 17:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947C16EA89;
	Fri, 11 Sep 2020 15:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6B76EA8B;
 Fri, 11 Sep 2020 15:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gL1+7KXmNTtAtG6dn1jCiAwU8DId3ZFFXGs7L9mjXCe7KQmzk/5jTBI2Cz0Kx22K0mEfOTlF8LdmU677KMU+hjzAnRw6PWNMzuszXSn2oiKs/uKnLUwrZqzGpmRhjxJ/0cN8pIkbOJUaxshoExa8R0/NtnacBxMpiMN4Vqk+15R/a/rXSINIpJflTFoR7GO3laA+Tq9bq+VvshtMBmK6v2TxxGLF5D9Rf9UEKu8t3QaZedVYuVfHOKWuH5baWh5rHvJUfxyj8ns2MQzw6YW42nVFdgLFLbZMBxSOuq/qE0KZdrOt3nXyYVLIZr94ubwiOWapX3Ab/8di08/QM09lZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiOfwzziv75bRm1CoskdoM9zTw5ENVwGtmP9eCj0wes=;
 b=apRuR/q1VVt7Oi9lefA/LJdpnjG9K+bZ3Cu+ovXTg9KSVK18jaH0oiPw/jI7anZI5Gg/IYtzSC8On7uEQ7xpabtJ0I1p5mAsgRBFxKdDLNDSf0gEZhqncLiMWKoAV1MPRYOlumTnufO+kBeVxMvIST8E5uuASSgJ4s69Vfm3EZDFc8YhWDlkKoAZzBq1NDW4k22P3YvNqyJfgQ4n1F6ThJy5Iq8GFhcyfB/dC/Lyhtl5cWVSZxP5gLu5icN0ftzr0VDjV14d2GbDC7X+7oupwfMMG4z20A7O7N6Z6UzdP55q6x3PAFqck+arXkX+HY+zhe9Zo5lC7viO4xxwyqU0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiOfwzziv75bRm1CoskdoM9zTw5ENVwGtmP9eCj0wes=;
 b=sOxMrRYtbIJW/QLj3bAPldaq4v2PR3MFOPlWSs5x1L1iVCuKIgb9PFNeZ0U/1+rAoZVOZzIr3D2UKa2LMsEwyZge3Stcmebj7ApvruTRJhddGGxB2qH8BP9oDp1aPW7sOt08zWGQjhBROPyXEGfi08UOYGVtQ2fdCSYr4kWs3Dc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 15:00:02 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 15:00:02 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/amd/display: Add tracepoint for capturing clocks
 state
Date: Fri, 11 Sep 2020 10:59:27 -0400
Message-Id: <20200911145927.401322-5-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::37) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60::e9a1) by
 YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 15:00:00 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60::e9a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 336b1871-896f-4083-9001-08d856635b68
X-MS-TrafficTypeDiagnostic: DM6PR12MB4372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4372F8FDDB4CAD933458942098240@DM6PR12MB4372.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEJOkYMHXE8iJ9yQYXBgfTcLOdT1bQvBBWhRJfNX/dVPRyp0v1Al5hasXlPuex+5+JJcDtfmSE3NKTqDIY1uQ+4Ahtb3RBVbgDcESA+WqESuQRRxJq+dAxJd6A4krC5tsJ12vLS5qtH6lHyzdxBJkHVX65JWvz+xChEVGnUiemTqy8aYMp6s4KaK2eyt/agGofWCruXCTeXaTcMFrA76YyyzRTJfLgd4iNNtWlvetQ1VYCnFq0NN5QuT2CvsqoQr2zXIlDIkjeXEiIoC3MHndyvDfTWqyTaxLGsBbsqw0V3TK0Pz1skcoFiEx59S50/+twQVTTrOMLA22/QZRrdGvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(4326008)(52116002)(30864003)(83380400001)(316002)(6512007)(36756003)(6486002)(6666004)(5660300002)(2906002)(2616005)(1076003)(54906003)(86362001)(16526019)(6506007)(66556008)(478600001)(66476007)(8676002)(66946007)(8936002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: A0kFG49YUzAv3rmbjxwn9IBdHkA0VLy4DSZLwPQGnjLtU8Xxb6o2E2ce7JOOlBPHGN7O3V61tn4E2wZ+IOoID7cseolkSDSUuhu8pkcAxOQQb43g9zsYPGw4tVXADzdFyxVV+Zf6wCmJyZQcjVv1slf4CWyf3fI7o2YXdJEmboxISt6GRrENIvdAe1E/kOPcsfkMJmwRumerJCntHNgJ7YPY6Jn20zOFZmm6Yqr97J5RhNd58EjyY8ZGB8d5fV7fjhDAMLV1xBaQGdXjpZ6BBAj+X2HsE4lWglG5g1GfzXheFnhmuLXhLcj/9ijc3/9qbeuUU47SCGLnkYoQ5IjNm7ETPfhjFPk6ABTrMCS59VLSbA+D6+tIk/34s9yAh6Gwh1eXfFWa7e7ohtgim7Z1iAJgbPIVdVwnOuFsjHG4f47Y+tjJaVgbHiBCIoRI4TJY9I3uY3LUKuhlauZkIdVpDo/x76km1+Iovt0/8VIhD243FFheO13h961C5U/KbK4W68Un8YFVTjkUYauU+o8BmEhnrhykyNEZTh4Gh55YYihetVHAABDPvRoPBYf3PvsFvjDDYQq5ScS5VuMytPu6kU0X2MA1Ejf+EV0l7OyOoXf9C6u57efQBsbrRRC/KKPPB2A71E4HS7mefD/S0mcnWMSbb9fb5ATOdO1oXi2HoBs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336b1871-896f-4083-9001-08d856635b68
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 15:00:00.9589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBAyxt2aXq77xAqIwXIy25oA+FL+NZHPsKjluBICGZr8sN6K0wGRosBaDrPAxBw1S45PqiFCVooFZzNSU6PRwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clock state update is the source of many problems, and capturing
this sort of information helps debug. This commit introduces tracepoints
for capturing clock values and also add traces in DCE, DCN1, DCN2x, and
DCN3.

Co-developed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 198 ++++++++++++++++++
 .../dc/clk_mgr/dce112/dce112_clk_mgr.c        |   5 +
 .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |   4 +
 .../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c  |   4 +
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |   4 +
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |   4 +
 .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  |   5 +
 7 files changed, 224 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 53f62506e17c..fb22b233224a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -411,6 +411,42 @@ struct amdgpu_dm_trace_pipe_state {
 	unsigned int update_flags;
 };
 
+struct amdgpu_dm_trace_dc_clocks_state {
+	int dispclk_khz;
+	int dppclk_khz;
+	int disp_dpp_voltage_level_khz;
+	int dcfclk_khz;
+	int socclk_khz;
+	int dcfclk_deep_sleep_khz;
+	int fclk_khz;
+	int phyclk_khz;
+	int dramclk_khz;
+	bool p_state_change_support;
+	int pwr_state;
+	bool prev_p_state_change_support;
+	int dtm_level;
+	int max_supported_dppclk_khz;
+	int max_supported_dispclk_khz;
+	int bw_dppclk_khz;
+	int bw_dispclk_khz;
+	int safe_to_lower;
+};
+
+struct amdgpu_dm_trace_dce_clocks_state {
+	bool cpuc_state_change_enable;
+	bool cpup_state_change_enable;
+	bool stutter_mode_enable;
+	bool nbp_state_change_enable;
+	bool all_displays_in_sync;
+	int sclk_khz;
+	int sclk_deep_sleep_khz;
+	int yclk_khz;
+	int dispclk_khz;
+	int blackout_recovery_time_us;
+	int patched_disp_clk;
+	int safe_to_lower;
+};
+
 #define fill_out_trace_pipe_state(trace_pipe_state, pipe_ctx) \
 	do { \
 		trace_pipe_state.pipe_idx	= (pipe_ctx)->pipe_idx; \
@@ -444,6 +480,44 @@ struct amdgpu_dm_trace_pipe_state {
 		trace_pipe_state.update_flags	= (pipe_ctx)->update_flags.raw; \
 	} while (0)
 
+#define fill_out_trace_clock_state(trace_clock_state, clocks, safe_to_lower) \
+	do { \
+		trace_clock_state.dispclk_khz = (clocks)->dispclk_khz; \
+		trace_clock_state.dppclk_khz = (clocks)->dppclk_khz; \
+		trace_clock_state.disp_dpp_voltage_level_khz = (clocks)->disp_dpp_voltage_level_khz; \
+		trace_clock_state.dcfclk_khz = (clocks)->dcfclk_khz; \
+		trace_clock_state.socclk_khz = (clocks)->socclk_khz; \
+		trace_clock_state.dcfclk_deep_sleep_khz = (clocks)->dcfclk_deep_sleep_khz; \
+		trace_clock_state.fclk_khz = (clocks)->fclk_khz; \
+		trace_clock_state.phyclk_khz = (clocks)->phyclk_khz; \
+		trace_clock_state.dramclk_khz = (clocks)->dramclk_khz; \
+		trace_clock_state.p_state_change_support = (clocks)->p_state_change_support; \
+		trace_clock_state.pwr_state = (clocks)->pwr_state; \
+		trace_clock_state.prev_p_state_change_support = (clocks)->prev_p_state_change_support; \
+		trace_clock_state.dtm_level = (clocks)->dtm_level; \
+		trace_clock_state.max_supported_dppclk_khz = (clocks)->max_supported_dppclk_khz; \
+		trace_clock_state.max_supported_dispclk_khz = (clocks)->max_supported_dispclk_khz; \
+		trace_clock_state.bw_dppclk_khz = (clocks)->bw_dppclk_khz; \
+		trace_clock_state.bw_dispclk_khz = (clocks)->bw_dispclk_khz; \
+		trace_clock_state.safe_to_lower = safe_to_lower; \
+	} while (0)
+
+#define fill_out_trace_dce_clock_state(trace_clock_state, clocks, patched_disp_clk, safe_to_lower) \
+	do { \
+		trace_clock_state.cpuc_state_change_enable = (clocks)->cpuc_state_change_enable; \
+		trace_clock_state.cpup_state_change_enable = (clocks)->cpup_state_change_enable; \
+		trace_clock_state.stutter_mode_enable = (clocks)->stutter_mode_enable; \
+		trace_clock_state.nbp_state_change_enable = (clocks)->nbp_state_change_enable; \
+		trace_clock_state.all_displays_in_sync = (clocks)->all_displays_in_sync; \
+		trace_clock_state.sclk_khz = (clocks)->sclk_khz; \
+		trace_clock_state.sclk_deep_sleep_khz = (clocks)->sclk_deep_sleep_khz; \
+		trace_clock_state.yclk_khz = (clocks)->yclk_khz; \
+		trace_clock_state.dispclk_khz = (clocks)->dispclk_khz; \
+		trace_clock_state.blackout_recovery_time_us = (clocks)->blackout_recovery_time_us; \
+		trace_clock_state.patched_disp_clk = patched_disp_clk; \
+		trace_clock_state.safe_to_lower = safe_to_lower; \
+	} while (0)
+
 #endif /* _AMDGPU_DM_TRACE_STRUCTS_DEFINED_ */
 
 TRACE_EVENT(amdgpu_dm_dc_pipe_state,
@@ -548,6 +622,130 @@ TRACE_EVENT(amdgpu_dm_dc_pipe_state,
 	)
 );
 
+TRACE_EVENT(amdgpu_dm_dc_clocks_state,
+	    TP_PROTO(const struct amdgpu_dm_trace_dc_clocks_state *clk),
+	    TP_ARGS(clk),
+
+	    TP_STRUCT__entry(
+			     __field(int, dispclk_khz)
+			     __field(int, dppclk_khz)
+			     __field(int, disp_dpp_voltage_level_khz)
+			     __field(int, dcfclk_khz)
+			     __field(int, socclk_khz)
+			     __field(int, dcfclk_deep_sleep_khz)
+			     __field(int, fclk_khz)
+			     __field(int, phyclk_khz)
+			     __field(int, dramclk_khz)
+			     __field(int, p_state_change_support)
+			     __field(int, prev_p_state_change_support)
+			     __field(int, pwr_state)
+			     __field(int, dtm_level)
+			     __field(int, max_supported_dppclk_khz)
+			     __field(int, max_supported_dispclk_khz)
+			     __field(int, bw_dppclk_khz)
+			     __field(int, bw_dispclk_khz)
+			     __field(bool, safe_to_lower)
+	    ),
+	    TP_fast_assign(
+			   __entry->dispclk_khz = clk->dispclk_khz;
+			   __entry->dppclk_khz = clk->dppclk_khz;
+			   __entry->dcfclk_khz = clk->dcfclk_khz;
+			   __entry->socclk_khz = clk->socclk_khz;
+			   __entry->dcfclk_deep_sleep_khz = clk->dcfclk_deep_sleep_khz;
+			   __entry->fclk_khz = clk->fclk_khz;
+			   __entry->phyclk_khz = clk->phyclk_khz;
+			   __entry->dramclk_khz = clk->dramclk_khz;
+			   __entry->p_state_change_support = clk->p_state_change_support;
+			   __entry->prev_p_state_change_support = clk->prev_p_state_change_support;
+			   __entry->pwr_state = clk->pwr_state;
+			   __entry->prev_p_state_change_support = clk->prev_p_state_change_support;
+			   __entry->dtm_level = clk->dtm_level;
+			   __entry->max_supported_dppclk_khz = clk->max_supported_dppclk_khz;
+			   __entry->max_supported_dispclk_khz = clk->max_supported_dispclk_khz;
+			   __entry->bw_dppclk_khz = clk->bw_dppclk_khz;
+			   __entry->bw_dispclk_khz = clk->bw_dispclk_khz;
+			   __entry->safe_to_lower = clk->safe_to_lower;
+	    ),
+	    TP_printk("dispclk_khz=%d dppclk_khz=%d disp_dpp_voltage_level_khz=%d dcfclk_khz=%d socclk_khz=%d "
+		      "dcfclk_deep_sleep_khz=%d fclk_khz=%d phyclk_khz=%d "
+		      "dramclk_khz=%d p_state_change_support=%d "
+		      "prev_p_state_change_support=%d pwr_state=%d prev_p_state_change_support=%d "
+		      "dtm_level=%d max_supported_dppclk_khz=%d max_supported_dispclk_khz=%d "
+		      "bw_dppclk_khz=%d bw_dispclk_khz=%d "
+		      "safe_to_lower=%d ",
+		      __entry->dispclk_khz,
+		      __entry->dppclk_khz,
+		      __entry->disp_dpp_voltage_level_khz,
+		      __entry->dcfclk_khz,
+		      __entry->socclk_khz,
+		      __entry->dcfclk_deep_sleep_khz,
+		      __entry->fclk_khz,
+		      __entry->phyclk_khz,
+		      __entry->dramclk_khz,
+		      __entry->p_state_change_support,
+		      __entry->prev_p_state_change_support,
+		      __entry->pwr_state,
+		      __entry->prev_p_state_change_support,
+		      __entry->dtm_level,
+		      __entry->max_supported_dppclk_khz,
+		      __entry->max_supported_dispclk_khz,
+		      __entry->bw_dppclk_khz,
+		      __entry->bw_dispclk_khz,
+		      __entry->safe_to_lower
+	    )
+);
+
+TRACE_EVENT(amdgpu_dm_dce_clocks_state,
+	    TP_PROTO(const struct amdgpu_dm_trace_dce_clocks_state *clk),
+	    TP_ARGS(clk),
+
+	    TP_STRUCT__entry(
+			     __field(bool, cpuc_state_change_enable)
+			     __field(bool, cpup_state_change_enable)
+			     __field(bool, stutter_mode_enable)
+			     __field(bool, nbp_state_change_enable)
+			     __field(bool, all_displays_in_sync)
+			     __field(int, sclk_khz)
+			     __field(int, sclk_deep_sleep_khz)
+			     __field(int, yclk_khz)
+			     __field(int, dispclk_khz)
+			     __field(int, blackout_recovery_time_us)
+			     __field(int, patched_disp_clk)
+			     __field(int, safe_to_lower)
+	    ),
+	    TP_fast_assign(
+			   __entry->cpuc_state_change_enable = clk->cpuc_state_change_enable;
+			   __entry->cpup_state_change_enable = clk->cpup_state_change_enable;
+			   __entry->stutter_mode_enable = clk->stutter_mode_enable;
+			   __entry->nbp_state_change_enable = clk->nbp_state_change_enable;
+			   __entry->all_displays_in_sync = clk->all_displays_in_sync;
+			   __entry->sclk_khz = clk->sclk_khz;
+			   __entry->sclk_deep_sleep_khz = clk->sclk_deep_sleep_khz;
+			   __entry->yclk_khz = clk->yclk_khz;
+			   __entry->dispclk_khz = clk->dispclk_khz;
+			   __entry->blackout_recovery_time_us = clk->blackout_recovery_time_us;
+			   __entry->patched_disp_clk = clk->patched_disp_clk;
+			   __entry->safe_to_lower = clk->safe_to_lower;
+	    ),
+	    TP_printk("cpuc_state_change_enable=%d cpup_state_change_enable=%d stutter_mode_enable=%d "
+		      "nbp_state_change_enable=%d all_displays_in_sync=%d sclk_khz=%d sclk_deep_sleep_khz=%d "
+		      "yclk_khz=%d dispclk_khz=%d blackout_recovery_time_us=%d patched_disp_clk=%d "
+		      "safe_to_lower=%d",
+		      __entry->cpuc_state_change_enable,
+		      __entry->cpup_state_change_enable,
+		      __entry->stutter_mode_enable,
+		      __entry->nbp_state_change_enable,
+		      __entry->all_displays_in_sync,
+		      __entry->sclk_khz,
+		      __entry->sclk_deep_sleep_khz,
+		      __entry->yclk_khz,
+		      __entry->dispclk_khz,
+		      __entry->blackout_recovery_time_us,
+		      __entry->patched_disp_clk,
+		      __entry->safe_to_lower
+	    )
+);
+
 #endif /* _AMDGPU_DM_TRACE_H_ */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c
index d031bd3d3072..913070efbbf4 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c
@@ -195,8 +195,10 @@ static void dce112_update_clocks(struct clk_mgr *clk_mgr_base,
 			bool safe_to_lower)
 {
 	struct clk_mgr_internal *clk_mgr_dce = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dce_bw_output *dce_clocks = &context->bw_ctx.bw.dce;
 	struct dm_pp_power_level_change_request level_change_req;
 	int patched_disp_clk = context->bw_ctx.bw.dce.dispclk_khz;
+	struct amdgpu_dm_trace_dce_clocks_state trace;
 
 	/*TODO: W/A for dal3 linux, investigate why this works */
 	if (!clk_mgr_dce->dfs_bypass_active)
@@ -210,6 +212,9 @@ static void dce112_update_clocks(struct clk_mgr *clk_mgr_base,
 			clk_mgr_dce->cur_min_clks_state = level_change_req.power_level;
 	}
 
+	fill_out_trace_dce_clock_state(trace, dce_clocks, patched_disp_clk, safe_to_lower);
+	trace_amdgpu_dm_dce_clocks_state(&trace);
+
 	if (should_set_clock(safe_to_lower, patched_disp_clk, clk_mgr_base->clks.dispclk_khz)) {
 		patched_disp_clk = dce112_set_clock(clk_mgr_base, patched_disp_clk);
 		clk_mgr_base->clks.dispclk_khz = patched_disp_clk;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
index e133edc587d3..6348c52dbb03 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
@@ -196,6 +196,7 @@ static void rv1_update_clocks(struct clk_mgr *clk_mgr_base,
 	struct dc_debug_options *debug = &dc->debug;
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
 	struct pp_smu_funcs_rv *pp_smu = NULL;
+	struct amdgpu_dm_trace_dc_clocks_state trace;
 	bool send_request_to_increase = false;
 	bool send_request_to_lower = false;
 	int display_count;
@@ -211,6 +212,9 @@ static void rv1_update_clocks(struct clk_mgr *clk_mgr_base,
 
 	display_count = clk_mgr_helper_get_active_display_cnt(dc, context);
 
+	fill_out_trace_clock_state(trace, new_clocks, safe_to_lower);
+	trace_amdgpu_dm_dc_clocks_state(&trace);
+
 	if (display_count == 0)
 		enter_display_off = true;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
index f2114bc910bf..2d7a8250778a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
@@ -148,6 +148,7 @@ void dcn2_update_clocks(struct clk_mgr *clk_mgr_base,
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct amdgpu_dm_trace_dc_clocks_state trace;
 	struct dc *dc = clk_mgr_base->ctx->dc;
 	struct pp_smu_funcs_nv *pp_smu = NULL;
 	int display_count;
@@ -247,6 +248,9 @@ void dcn2_update_clocks(struct clk_mgr *clk_mgr_base,
 			pp_smu->set_voltage_by_freq(&pp_smu->pp_smu, PP_SMU_NV_DISPCLK, clk_mgr_base->clks.disp_dpp_voltage_level_khz / 1000);
 	}
 
+	fill_out_trace_clock_state(trace, new_clocks, safe_to_lower);
+	trace_amdgpu_dm_dc_clocks_state(&trace);
+
 	if (dc->config.forced_clocks == false || (force_reset && safe_to_lower)) {
 		if (dpp_clock_lowered) {
 			// if clock is being lowered, increase DTO before lowering refclk
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 543afa34d87a..da8a4b06cc09 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -109,6 +109,7 @@ void rn_update_clocks(struct clk_mgr *clk_mgr_base,
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct amdgpu_dm_trace_dc_clocks_state trace;
 	struct dc *dc = clk_mgr_base->ctx->dc;
 	int display_count;
 	bool update_dppclk = false;
@@ -120,6 +121,9 @@ void rn_update_clocks(struct clk_mgr *clk_mgr_base,
 	if (dc->work_arounds.skip_clock_update)
 		return;
 
+	fill_out_trace_clock_state(trace, new_clocks, safe_to_lower);
+	trace_amdgpu_dm_dc_clocks_state(&trace);
+
 	/*
 	 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
 	 * also if safe to lower is false, we just go in the higher state
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index b0e9b0509568..5d71ddeb3c2b 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -230,6 +230,7 @@ static void dcn3_update_clocks(struct clk_mgr *clk_mgr_base,
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct amdgpu_dm_trace_dc_clocks_state trace;
 	struct dc *dc = clk_mgr_base->ctx->dc;
 	int display_count;
 	bool update_dppclk = false;
@@ -264,6 +265,9 @@ static void dcn3_update_clocks(struct clk_mgr *clk_mgr_base,
 		new_clocks->dcfclk_khz = (new_clocks->dcfclk_khz > (dc->debug.force_min_dcfclk_mhz * 1000)) ?
 				new_clocks->dcfclk_khz : (dc->debug.force_min_dcfclk_mhz * 1000);
 
+	fill_out_trace_clock_state(trace, new_clocks, safe_to_lower);
+	trace_amdgpu_dm_dc_clocks_state(&trace);
+
 	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
 		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
 		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_DCEFCLK, clk_mgr_base->clks.dcfclk_khz / 1000);
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
index 29d69dfc9848..b29afee54645 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
@@ -669,9 +669,11 @@ static void dce_update_clocks(struct clk_mgr *clk_mgr,
 			struct dc_state *context,
 			bool safe_to_lower)
 {
+	struct dce_bw_output *dce_clocks = &context->bw_ctx.bw.dce;
 	struct dce_clk_mgr *clk_mgr_dce = TO_DCE_CLK_MGR(clk_mgr);
 	struct dm_pp_power_level_change_request level_change_req;
 	int patched_disp_clk = context->bw_ctx.bw.dce.dispclk_khz;
+	struct amdgpu_dm_trace_dce_clocks_state trace;
 
 	/*TODO: W/A for dal3 linux, investigate why this works */
 	if (!clk_mgr_dce->dfs_bypass_active)
@@ -685,6 +687,9 @@ static void dce_update_clocks(struct clk_mgr *clk_mgr,
 			clk_mgr_dce->cur_min_clks_state = level_change_req.power_level;
 	}
 
+	fill_out_trace_dce_clock_state(trace, dce_clocks, patched_disp_clk, safe_to_lower);
+	trace_amdgpu_dm_dce_clocks_state(&trace);
+
 	if (should_set_clock(safe_to_lower, patched_disp_clk, clk_mgr->clks.dispclk_khz)) {
 		patched_disp_clk = dce_set_clock(clk_mgr, patched_disp_clk);
 		clk_mgr->clks.dispclk_khz = patched_disp_clk;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
