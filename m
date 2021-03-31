Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90C350020
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230B96EA7B;
	Wed, 31 Mar 2021 12:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787F6EA79;
 Wed, 31 Mar 2021 12:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1V2wUXEQxbsVIfcWq5WF3CmJkZixG3bcsfxMHSyPtQel+O0UlVLovHUDVmgsmALN7d9yXA0QCw41A1Anh154ttsCDHX6mnF4BO3Nucq1dm9d3Y+ZDbXFclohKuG34jU6ClAlZkmE2Vjdnvx4phDtU2tj9Kmq4x7hBIWOFa0VohclF53Zz0v0evisQVDcq1URF/W97/Dig1YgErPgSMYWpgbMTtwPEr7NihFgrRPaiRnP8Tyyxpl5AiKc9mJ0jh2Wxai0oaeKb9DyM6sLOJQJInd9YLmQ8dFxK9JdTV/YAZzjAF/SBOiUzpA5ZPmJ6/z1xgvU8KM/V7rtPdXsKpkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDnZbrWhHnzhk/0VRdslz1FfOq2fFmJjzSy8aw6UYIg=;
 b=g07Jev88S4d4ko8J3zXjoJOyeGJH6Xh8ZBRe86rKO7od/KsDDkMcW8I8fgyqhpvcY3RugtRRxfBXkHJxoifwLRf2GjWF8aAp24EfLbNqbCxkBBu7CJdpOHYC414nr4u6uL53wCLLlPShyUDhMxs13l4njX4kecg1PwO7HAndyJubPvBG95qJj5m4IOS/HF1QcQ6eaN/RYd2Ck+cmTiRTNFKr9bh0N4IuXvv4TmwqNInoPa+9svUbHznZ7ONHSLmc8pBgCn62Zrcws1D5KI1OMX9/8CC8Kd/A6JE0drUiEfi+8UXDP9i4EqPyckmgEfhQVGELqUmIkA/LVPhY7tGl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDnZbrWhHnzhk/0VRdslz1FfOq2fFmJjzSy8aw6UYIg=;
 b=3pBftkyK1pWvcj+G0Zg4apHZBQE5ldHqZ99jsGonWQdLhWmQr9nyu5Lk6g51b7zJaJ4rgmBeFgx3u1UQ+z2Y5pO8PfpSN8JOAkRSRkPVatBIW9/WHhBNXlLFHQBNWksFta4tdAaL0fcj8+847P+WdIhCF6xwtkLCiihvuWW4Ydo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB2937.namprd12.prod.outlook.com (2603:10b6:5:181::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 31 Mar 2021 12:25:22 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:25:22 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Zijlstra <peterz@infradead.org>,
 aric.cyr@amd.com
Subject: [PATCH 1/4] drm/amd/display: Introduce FPU directory inside DC
Date: Wed, 31 Mar 2021 08:24:59 -0400
Message-Id: <20210331122502.1031073-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
References: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3]
X-ClientProxiedBy: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:1683:1bc7:ac8c:6a3)
 by YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend
 Transport; Wed, 31 Mar 2021 12:25:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0355c519-04e8-4b98-9490-08d8f4400dd8
X-MS-TrafficTypeDiagnostic: DM6PR12MB2937:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2937EE870C68D0053D7540B3987C9@DM6PR12MB2937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bianiauR/CImr+q0/5u6YCSyQP9bp6eHwZ6rJLGyWS7pI14U2UPCkOH5/Fmq9kmE2rhv0V6dzbl7/DBJxC6eORiaWX2zXcWrKq9T55+6/kFdyj77U+3VaReECdU0OMikKZohxE64554tiGhY5HHTO5uokeyC8aZp54KzeTeFNje1EdYsMcOyhQM/0NWWQfxXFnFyDP5k9fKHkTgMTBixBs5Qv5ngXc9kWLaKMMHeop5EkXtL72BcSGUHmDJi2zm5lM06GO95qwUX0zNuAvwSm5jen/me1Y6ksPT58TQOq1uCbu7tGjmkD+dDqs6sHGmbi+ZuHOfCv/ATfGD75fXrvAMpX/8V6g9Rrys5aRPB/OIaeY4qWsaFGwmNyhLJHSA5i6WMmOhMHizr7x1i9VxBh7Rz6tSsPyLtnVRIvGRhar2aVDCRoXR4Y3b/oqjP7cbn/DI1rF61MYZ8i9DMyK/YFGPWy+Z8wENfP0nXQ9pnWjkt0PsnUUwzeADUUwRhbq1dsHRSUgx69mj5ZPbQCAWnXty15rXxU/kQxLqparI1ccbxHQhD1DPNKWWph8QxzH3GdyhQv7azCO9EFZ/CnmSJTP5JaeguLwdCR0icBSofvgr6331vlakr2kFYOx+uh1iYBfah99TBhqjBlq0gYSyhExEPrwlOo6TWFEUtYrTNDK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(38100700001)(2906002)(6636002)(30864003)(6666004)(4326008)(5660300002)(66946007)(36756003)(8936002)(83380400001)(478600001)(66556008)(66476007)(6486002)(8676002)(186003)(16526019)(6512007)(52116002)(1076003)(2616005)(110136005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FdiMsIg6Mwj003wbI4y3N2vITcSt+MCoGbKmy8DKgfsKKDElVi16bBHf1Z81?=
 =?us-ascii?Q?5IoMmWQyrPjyX86CsoovOx0MQyjFkilW6pu/wvaDpYqV4+1SJUSh7l/PhM+E?=
 =?us-ascii?Q?QIf78LxO5ESgrzmCzfHkg3Rae2VmQjt+1m+7fTOwm1fBgmnPpNKvketiA/VJ?=
 =?us-ascii?Q?6ruQkTQVVBPgFlc2DFCuQR0H/SUbNE0b2IC6qODhlanU1ai8gYiCr6bdNP+L?=
 =?us-ascii?Q?PS7u2WVmc9GqZu2LluE8qTItMR5BOZO4RmOUREU0jWNKHStS/NRpaVrL6Exb?=
 =?us-ascii?Q?4lhVLgXkRzVZ11UvLecHRQTrsz+ah5u6YYt+3EorEG8WABb5G1+cyU/xrY8g?=
 =?us-ascii?Q?eJ71+Y7EKl33Sizxk5kuTWiNMRLAWX6sKUNEs7d8eEyzCIITy+oasSNLXjzX?=
 =?us-ascii?Q?JdxhanTwd994EDU/abxSm1h2pkjiTbgIs8L7xEab62sqbjLnZGwi0pkWSbpf?=
 =?us-ascii?Q?SRWP4p30TmAwT2I/VFiJPeej1iiFrAuCrBBnfiy1mSEnwBCwdIv+TSUTJ3+9?=
 =?us-ascii?Q?6knk8Zy1N0QfeYk2f0FVi0bzLkCpoOa2vfuhMahAgVU8dIhTgQkxUJqMr/Xs?=
 =?us-ascii?Q?1mNsHGrgD5K2gBzBTiKx9s5/EZgp/dhTia0zjCI6zV6JtHCrdPw/7OMw3L8n?=
 =?us-ascii?Q?QSRt79HHZsWoQfUZ3WefgRDCPIhOGLabWLr53OwjSYHkdDGh3p6hojd4104A?=
 =?us-ascii?Q?zkHEm4G/OfvYEl9cmJrkeBYYGfw8Sk6dWnfE7RMFgt0SO4j1OLrEY1tM7/r0?=
 =?us-ascii?Q?I9+2OFCZz2n6Ata2vxiqGNOE4z14N2G2sOxXy2qA7hedvXR1kWZ7sm8s7KuB?=
 =?us-ascii?Q?nrN5FbPXZiLaD9LbAUvfR8lOXlal4Pp591DqizCka5/LN/TypimChNf1ZUV0?=
 =?us-ascii?Q?DKuvXcvRor37/QwszDobEZAeI5rPHcFAtyMD6slH4wkOwbZykTInPaQ5pDM7?=
 =?us-ascii?Q?WLdB0FdB4BtXxTirZ9N9o3fSrLmPJNMD6Hv92yKOJw/Nzo2I5HQhIxV1Mdfr?=
 =?us-ascii?Q?s2ENj7SB2cbjabM91I/0Y+ATL7d5PhODVmIkaxday/+JEuyxY4j30fIO0/Xx?=
 =?us-ascii?Q?BHbis15NrLZkQHvLETwE0oFzugDQSuWfpqMCCOGC9BPtDEi9t3O335RfaczX?=
 =?us-ascii?Q?PB42Ms5NDQx8KPEeSgnmFxsDRg4HfYyMrdSljIw7QMS3VvroxixpS/fYsewU?=
 =?us-ascii?Q?GahawPeqktSNgH25TzuZ8TbZZiyqW2Q1lvJReCxeuRM1uBqSyW9rCvlt95uF?=
 =?us-ascii?Q?UI3fOoEZjfwEe56q+p+KLVvscIAClHXa2GwQG7rRQ1gslu/RxTlfBeSV4EXK?=
 =?us-ascii?Q?I9j0hBDI9TdFBt9ZFHE8LQ7zYPlsKaO1B/fpj3HzMpW2ycEkx7uwtyuhZeSK?=
 =?us-ascii?Q?7nkwFWiO72k35yMHX509sNtNlweK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0355c519-04e8-4b98-9490-08d8f4400dd8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:25:22.2415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHOBu3aaorvPX3paiP9boCWZzQkFQ68GUqys8R1uU4KhFYDMewNw2Kd+eVbiYg3QXXHz5hJCUODcQC+eGf6A6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display core files rely on FPU operation, which requires to be
compiled with special flags. Ideally, we don't want these FPU operations
to get spread around the DC code; nevertheless, it happens in the
current source. This commit introduces a new directory named
fpu_operations that intends to centralize all files that require the FPU
compilation flag. As part of this new component, this patch also moves
one of the functions that require FPU access to a single shared file.
Notice that this is the first part of the work, and it does not fix the
FPU issue yet; we still need other patches for achieving the complete
isolation of this file.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |  1 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 39 +-------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |  2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |  2 +
 .../amd/display/dc/fpu_operations/Makefile    | 58 ++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 89 +++++++++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.h | 33 +++++++
 7 files changed, 185 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index f33847299bca..7d5b70ed5aca 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -35,6 +35,7 @@ DC_LIBS += dcn301
 DC_LIBS += dcn302
 endif
 
+DC_LIBS += fpu_operations
 DC_LIBS += dce120
 
 DC_LIBS += dce112
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 8fb29f754e44..b58edd012038 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "fpu_operations/dcn2x.h"
+
 #include "dcn10/dcn10_hubp.h"
 #include "dcn10/dcn10_ipp.h"
 #include "dcn20_hubbub.h"
@@ -1974,43 +1976,6 @@ void dcn20_split_stream_for_mpc(
 	ASSERT(primary_pipe->plane_state);
 }
 
-void dcn20_populate_dml_writeback_from_context(
-		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
-{
-	int pipe_cnt, i;
-
-	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
-		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
-
-		if (!res_ctx->pipe_ctx[i].stream)
-			continue;
-
-		/* Set writeback information */
-		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
-		pipes[pipe_cnt].dout.num_active_wb++;
-		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
-		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
-		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
-		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
-		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
-		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
-		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
-		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
-		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
-		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
-		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
-			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
-				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
-			else
-				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
-		} else
-			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
-
-		pipe_cnt++;
-	}
-
-}
-
 int dcn20_populate_dml_pipes_from_context(
 		struct dc *dc,
 		struct dc_state *context,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
index c8f3127bbcdf..6ec8ff45f0f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
@@ -58,8 +58,6 @@ struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
 		struct dc_state *state,
 		const struct resource_pool *pool,
 		struct dc_stream_state *stream);
-void dcn20_populate_dml_writeback_from_context(
-		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
 
 struct stream_encoder *dcn20_stream_encoder_create(
 	enum engine_id eng_id,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 8e3f1d0b4cc3..9765cb1d6328 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -35,6 +35,8 @@
 #include "include/irq_service_interface.h"
 #include "dcn20/dcn20_resource.h"
 
+#include "fpu_operations/dcn2x.h"
+
 #include "clk_mgr.h"
 #include "dcn10/dcn10_hubp.h"
 #include "dcn10/dcn10_ipp.h"
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
new file mode 100644
index 000000000000..7f6f90c3f267
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright 2021 Advanced Micro Devices, Inc.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# OTHER DEALINGS IN THE SOFTWARE.
+#
+#
+# Makefile for fpu operations component.
+#
+
+FPU_OPERATIONS = dcn2x.o
+
+ifdef CONFIG_X86
+fpu_ccflags := -mhard-float -msse
+endif
+
+ifdef CONFIG_PPC64
+fpu_ccflags := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+fpu_ccflags := -mpreferred-stack-boundary=4
+else
+fpu_ccflags :=  -msse2
+endif
+endif
+
+CFLAGS_$(AMDDALPATH)/dc/fpu_operations/dcn2x.o += $(fpu_ccflags)
+
+AMD_DAL_FPU_OPERATIONS = $(addprefix $(AMDDALPATH)/dc/fpu_operations/,$(FPU_OPERATIONS))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_FPU_OPERATIONS)
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
new file mode 100644
index 000000000000..32b23a182428
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "resource.h"
+
+/**
+ * DOC: DCN2x Overview
+ *
+ * The DCN architecture relies on FPU operations, which require special
+ * compilation flags and the use of kernel_fpu_begin/end functions; ideally, we
+ * want to avoid spreading FPU access across multiple files. With this idea in
+ * mind, this file aims to centralize all DCN20 and DCN2.1 functions that
+ * require FPU access in a single place. Code in this file follows the
+ * following code pattern:
+ *
+ * 1. Functions that use FPU operations should be isolated in static functions
+ *    using.
+ * 2. The FPU functions should have the noinline attribute to ensure anything
+ *    that deals with FP register is contained within this call.
+ * 3. All function that needs to be accessed outside this file requires a
+ *    public interface that not uses any FPU reference.
+ */
+
+static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
+	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
+{
+	int pipe_cnt, i;
+
+	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
+
+		if (!res_ctx->pipe_ctx[i].stream)
+			continue;
+
+		/* Set writeback information */
+		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
+		pipes[pipe_cnt].dout.num_active_wb++;
+		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
+		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
+		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
+		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
+		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
+		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
+		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
+		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
+		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
+		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
+		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
+			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
+				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
+			else
+				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
+		} else {
+			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
+		}
+
+		pipe_cnt++;
+	}
+}
+
+void dcn20_populate_dml_writeback_from_context(struct dc *dc,
+	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
+{
+	_dcn20_populate_dml_writeback_from_context(dc, res_ctx, pipes);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
new file mode 100644
index 000000000000..c060f909164b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DCN2X_H__
+#define __DCN2X_H__
+
+void dcn20_populate_dml_writeback_from_context(struct dc *dc,
+	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
+
+#endif /* __DCN2X_H__ */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
