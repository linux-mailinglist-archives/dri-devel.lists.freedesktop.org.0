Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FEC2661B8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 17:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA626EA86;
	Fri, 11 Sep 2020 15:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2356EA7F;
 Fri, 11 Sep 2020 15:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efPzwXfeB++ssAF/sKm6J8JqM00VS9+T5NgXGqQyY3MgOabYvsuzO6RW4pBNtdoKs4suNcKHAaZsrXeScxOfIiKb3TE4HUWBODsfbxc5nSaKU1tIfJl2g4aWFrhPrGQ++Ti/s9txKvRy0RwtHPRwzAbseZHzElDdksZJZ6H2sUH//gXWmTKVw/eOwIPZKjsh7dEO85SDj0bt03RJtCZsGtS/BHKDSuc2zefpnnfvJQEo8ESy7OFhZaJgAm5yq4kWZS+Qv03xgOTcjk9aeOedJcCgw0cezqJ8kTlLNL8pw+bjoA+ovqi9wafY4wJJb8if5ILk4b5om5+N/iJFe1Mukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dODFAEWpJwE7o6RftnyaGtifeCeyXmRhnXRtvEwanU=;
 b=iNpHFD2x0lBTEjsSTuCl5VqHNgp7yOIctQswiFq0zdJP2Q4AKsQpOn0uIG4X5pHzY4uiqne1vICDAC7IW90SXaCSuES80bavdmMmOETtUDC9R4oxKpzAQJBNjoKxbefHvCo3IJSu1Kg3rTXwlOybKmqxo3ch6zvRMtAVGr8omA/ZU/0MQk4N5G0OhRWgyPFh4o8wbiOL7tO6Hg+vKC2NsudDPOlfz8KR2mU6xAf+Bep5WWcJ3qkoJxwa5IfRuFO7uKEbPctoOMbvY26Cm6u58F5kc1QD7kMIBZUVwzwpSy+JDDDPhOlhQxckPEvNbciTeLoCDZFgvoiFWUk0e/UgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dODFAEWpJwE7o6RftnyaGtifeCeyXmRhnXRtvEwanU=;
 b=UZu3ytUwOhKLZp8Xj1yG62gGaXDm92gULJvqQOpKA6E3IX4C6JtSoAZb1g0gVXVj+uLJexHHuXI2lVaJ0GO/aDegwopNhH6lZuXlOGo8VR/LP5wWkeJvJsuVXz411+4qgceVFQ9s30v6ciXYaWVPg4IZNUnQnth6FYUKr3hSvbI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 11 Sep
 2020 15:00:00 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 15:00:00 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/amd/display: Add pipe_state tracepoint
Date: Fri, 11 Sep 2020 10:59:26 -0400
Message-Id: <20200911145927.401322-4-Rodrigo.Siqueira@amd.com>
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
 Transport; Fri, 11 Sep 2020 14:59:59 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60::e9a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72150368-9587-4fcd-aa14-08d856635b05
X-MS-TrafficTypeDiagnostic: DM6PR12MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB308238B7626B21BCE24BE07398240@DM6PR12MB3082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ridkh2R6r4DXOGyTHNvPLpYCUgzs9xHz2yqXWGvhQrSnmYh+UF7TgH1r8ABDBpr9DfS3fxCUSnzWs2ORKN4zxa1qk9ZY0U96RcebM+YIOAZk2WAoEmHg0gHJnd1UfFF5IMyztSMOkh9WsOFAkcusMmHbw5FOaBXG4i558AN0B357exLDRV1GJhT03eHHqDmppLno36g8w0kW2i9DwuKjG3K2tTRM6pidwiQnIfCI+3fTZWvPoNi7ABCvLMQhmkucvcvKzF5yb9U28jj7pbYZa4L5tWM27N+fUVCoEKrgOQzAzVxVTRoN7tL57Tx/UULoED46Ml86IEXotV8lyQcsAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(66476007)(86362001)(1076003)(52116002)(83380400001)(2906002)(6506007)(8676002)(316002)(66556008)(5660300002)(186003)(6666004)(478600001)(8936002)(4326008)(6486002)(36756003)(66946007)(6512007)(16526019)(54906003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3RkuP2Q2tUjX0FSaCdXyu/BwyTjUf5vw9dSpRrywZ8jNkFMhaE519WKq1H95wp2UyMkQ21OfAF1KYELtSF7c1FJLIetYLxL11iBBkGPyF1kLrasA4Fis5xGUVuZEBphj5caPq/wGzdSaGSHMbVkKwkhV66LfXZAFiMP30Bd8yIQj0se57iaIYsStoKYDveR2flTSYIY5GITvIIgoC6eO6avuwN/lRUZoLRKhWJgLNo4haSxA+5tSO8Du9kzOQTDpqVQZj7GQNnrdPhAgtAuP6Iuk5Tn+/TDcHqkNikWPbcLwz7Unre9dBGZkK7NTaLxmhGGbeHGWv6g5xCaM9rVHp+CQ9wjU/SVHW3Ahn0oBeQvsfcJ/A4x8k+3WM+SBTCvbXMTUCg46e7ykvjGVbotRWaZqUvJReMM1fhGdQ659Wg5R6423on9zPHRZVsEtl4+jL3qBjcw6rBPgFjfIXp9L/Ke6SOwUnnCDjTGJLo/+a9r8mGy5n3miDImvDKuMsO6KrYgsU07PSvIXk6qWcVKJayjoDrTpu8AMco+reFctg7BtG+889H9kMqVAv3ZNw2DSthml3YrTxhn+Aecn+3DNYKBDu2YtgYaMnBbNGte+j+MuRhPOdsbHnOLjse1Xe6PcU14v2wwb7P+9qvNeoJIeutHPx536rL4qTdRkH9boyxY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72150368-9587-4fcd-aa14-08d856635b05
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 15:00:00.2889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfloReA1XblLksckXwpQ7hHnqSQsouKbcrgsibkcPSNR8cJjF1d3YKvVLEIa+PBgE/B+m3P/1ZvGvXrhD33pYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
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

This commit introduces a trace mechanism for struct pipe_ctx by adding a
middle layer struct in the amdgpu_dm_trace.h for capturing the most
important data from struct pipe_ctx and showing its data via tracepoint.
This tracepoint was added to dc.c and dcn10_hw_sequencer, however, it
can be added to other DCN architecture.

Co-developed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 172 ++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  11 ++
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  17 +-
 3 files changed, 195 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index 5fb4c4a5c349..53f62506e17c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -376,6 +376,178 @@ TRACE_EVENT(amdgpu_dm_atomic_check_finish,
 		      __entry->async_update, __entry->allow_modeset)
 );
 
+#ifndef _AMDGPU_DM_TRACE_STRUCTS_DEFINED_
+#define _AMDGPU_DM_TRACE_STRUCTS_DEFINED_
+
+struct amdgpu_dm_trace_pipe_state {
+	int pipe_idx;
+	const void *stream;
+	int stream_w;
+	int stream_h;
+	int dst_x;
+	int dst_y;
+	int dst_w;
+	int dst_h;
+	int src_x;
+	int src_y;
+	int src_w;
+	int src_h;
+	int clip_x;
+	int clip_y;
+	int clip_w;
+	int clip_h;
+	int recout_x;
+	int recout_y;
+	int recout_w;
+	int recout_h;
+	int viewport_x;
+	int viewport_y;
+	int viewport_w;
+	int viewport_h;
+	int flip_immediate;
+	int surface_pitch;
+	int format;
+	int swizzle;
+	unsigned int update_flags;
+};
+
+#define fill_out_trace_pipe_state(trace_pipe_state, pipe_ctx) \
+	do { \
+		trace_pipe_state.pipe_idx	= (pipe_ctx)->pipe_idx; \
+		trace_pipe_state.stream		= (pipe_ctx)->stream; \
+		trace_pipe_state.stream_w	= (pipe_ctx)->stream->timing.h_addressable; \
+		trace_pipe_state.stream_h	= (pipe_ctx)->stream->timing.v_addressable; \
+		trace_pipe_state.dst_x		= (pipe_ctx)->plane_state->dst_rect.x; \
+		trace_pipe_state.dst_y		= (pipe_ctx)->plane_state->dst_rect.y; \
+		trace_pipe_state.dst_w		= (pipe_ctx)->plane_state->dst_rect.width; \
+		trace_pipe_state.dst_h		= (pipe_ctx)->plane_state->dst_rect.height; \
+		trace_pipe_state.src_x		= (pipe_ctx)->plane_state->src_rect.x; \
+		trace_pipe_state.src_y		= (pipe_ctx)->plane_state->src_rect.y; \
+		trace_pipe_state.src_w		= (pipe_ctx)->plane_state->src_rect.width; \
+		trace_pipe_state.src_h		= (pipe_ctx)->plane_state->src_rect.height; \
+		trace_pipe_state.clip_x		= (pipe_ctx)->plane_state->clip_rect.x; \
+		trace_pipe_state.clip_y		= (pipe_ctx)->plane_state->clip_rect.y; \
+		trace_pipe_state.clip_w		= (pipe_ctx)->plane_state->clip_rect.width; \
+		trace_pipe_state.clip_h		= (pipe_ctx)->plane_state->clip_rect.height; \
+		trace_pipe_state.recout_x	= (pipe_ctx)->plane_res.scl_data.recout.x; \
+		trace_pipe_state.recout_y	= (pipe_ctx)->plane_res.scl_data.recout.y; \
+		trace_pipe_state.recout_w	= (pipe_ctx)->plane_res.scl_data.recout.width; \
+		trace_pipe_state.recout_h	= (pipe_ctx)->plane_res.scl_data.recout.height; \
+		trace_pipe_state.viewport_x	= (pipe_ctx)->plane_res.scl_data.viewport.x; \
+		trace_pipe_state.viewport_y	= (pipe_ctx)->plane_res.scl_data.viewport.y; \
+		trace_pipe_state.viewport_w	= (pipe_ctx)->plane_res.scl_data.viewport.width; \
+		trace_pipe_state.viewport_h	= (pipe_ctx)->plane_res.scl_data.viewport.height; \
+		trace_pipe_state.flip_immediate = (pipe_ctx)->plane_state->flip_immediate; \
+		trace_pipe_state.surface_pitch	= (pipe_ctx)->plane_state->plane_size.surface_pitch; \
+		trace_pipe_state.format		= (pipe_ctx)->plane_state->format; \
+		trace_pipe_state.swizzle	= (pipe_ctx)->plane_state->tiling_info.gfx9.swizzle; \
+		trace_pipe_state.update_flags	= (pipe_ctx)->update_flags.raw; \
+	} while (0)
+
+#endif /* _AMDGPU_DM_TRACE_STRUCTS_DEFINED_ */
+
+TRACE_EVENT(amdgpu_dm_dc_pipe_state,
+	    TP_PROTO(const struct amdgpu_dm_trace_pipe_state *pipe_state),
+	    TP_ARGS(pipe_state),
+	    TP_STRUCT__entry(
+			     __field(int, pipe_idx)
+			     __field(const void *, stream)
+			     __field(int, stream_w)
+			     __field(int, stream_h)
+			     __field(int, dst_x)
+			     __field(int, dst_y)
+			     __field(int, dst_w)
+			     __field(int, dst_h)
+			     __field(int, src_x)
+			     __field(int, src_y)
+			     __field(int, src_w)
+			     __field(int, src_h)
+			     __field(int, clip_x)
+			     __field(int, clip_y)
+			     __field(int, clip_w)
+			     __field(int, clip_h)
+			     __field(int, recout_x)
+			     __field(int, recout_y)
+			     __field(int, recout_w)
+			     __field(int, recout_h)
+			     __field(int, viewport_x)
+			     __field(int, viewport_y)
+			     __field(int, viewport_w)
+			     __field(int, viewport_h)
+			     __field(int, flip_immediate)
+			     __field(int, surface_pitch)
+			     __field(int, format)
+			     __field(int, swizzle)
+			     __field(unsigned int, update_flags)
+	),
+
+	TP_fast_assign(
+		       __entry->pipe_idx = pipe_state->pipe_idx;
+		       __entry->stream = pipe_state->stream;
+		       __entry->stream_w = pipe_state->stream_w;
+		       __entry->stream_h = pipe_state->stream_h;
+		       __entry->dst_x = pipe_state->dst_x;
+		       __entry->dst_y = pipe_state->dst_y;
+		       __entry->dst_w = pipe_state->dst_w;
+		       __entry->dst_h = pipe_state->dst_h;
+		       __entry->src_x = pipe_state->src_x;
+		       __entry->src_y = pipe_state->src_y;
+		       __entry->src_w = pipe_state->src_w;
+		       __entry->src_h = pipe_state->src_h;
+		       __entry->clip_x = pipe_state->clip_x;
+		       __entry->clip_y = pipe_state->clip_y;
+		       __entry->clip_w = pipe_state->clip_w;
+		       __entry->clip_h = pipe_state->clip_h;
+		       __entry->recout_x = pipe_state->recout_x;
+		       __entry->recout_y = pipe_state->recout_y;
+		       __entry->recout_w = pipe_state->recout_w;
+		       __entry->recout_h = pipe_state->recout_h;
+		       __entry->viewport_x = pipe_state->viewport_x;
+		       __entry->viewport_y = pipe_state->viewport_y;
+		       __entry->viewport_w = pipe_state->viewport_w;
+		       __entry->viewport_h = pipe_state->viewport_h;
+		       __entry->flip_immediate = pipe_state->flip_immediate;
+		       __entry->surface_pitch = pipe_state->surface_pitch;
+		       __entry->format = pipe_state->format;
+		       __entry->swizzle = pipe_state->swizzle;
+		       __entry->update_flags = pipe_state->update_flags;
+	),
+	TP_printk("pipe_idx=%d stream=%p rct(%d,%d) dst=(%d,%d,%d,%d) "
+		  "src=(%d,%d,%d,%d) clip=(%d,%d,%d,%d) recout=(%d,%d,%d,%d) "
+		  "viewport=(%d,%d,%d,%d) flip_immediate=%d pitch=%d "
+		  "format=%d swizzle=%d update_flags=%x",
+		  __entry->pipe_idx,
+		  __entry->stream,
+		  __entry->stream_w,
+		  __entry->stream_h,
+		  __entry->dst_x,
+		  __entry->dst_y,
+		  __entry->dst_w,
+		  __entry->dst_h,
+		  __entry->src_x,
+		  __entry->src_y,
+		  __entry->src_w,
+		  __entry->src_h,
+		  __entry->clip_x,
+		  __entry->clip_y,
+		  __entry->clip_w,
+		  __entry->clip_h,
+		  __entry->recout_x,
+		  __entry->recout_y,
+		  __entry->recout_w,
+		  __entry->recout_h,
+		  __entry->viewport_x,
+		  __entry->viewport_y,
+		  __entry->viewport_w,
+		  __entry->viewport_h,
+		  __entry->flip_immediate,
+		  __entry->surface_pitch,
+		  __entry->format,
+		  __entry->swizzle,
+		  __entry->update_flags
+	)
+);
+
 #endif /* _AMDGPU_DM_TRACE_H_ */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index dc463d99ef50..0c9f177e5827 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2644,6 +2644,17 @@ void dc_commit_updates_for_stream(struct dc *dc,
 		}
 	}
 
+	for (i = 0; i < MAX_PIPES; ++i) {
+		struct pipe_ctx *pipe_ctx = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (pipe_ctx->plane_state) {
+			struct amdgpu_dm_trace_pipe_state pipe_state_trace;
+
+			fill_out_trace_pipe_state(pipe_state_trace, pipe_ctx);
+			trace_amdgpu_dm_dc_pipe_state(&pipe_state_trace);
+		}
+	}
+
 	commit_planes_for_stream(
 				dc,
 				srf_updates,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 8ca94f506195..464d0ad093b9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1020,15 +1020,22 @@ static bool dcn10_hw_wa_force_recovery(struct dc *dc)
 
 }
 
-
 void dcn10_verify_allow_pstate_change_high(struct dc *dc)
 {
-	static bool should_log_hw_state; /* prevent hw state log by default */
-
 	if (!hubbub1_verify_allow_pstate_change_high(dc->res_pool->hubbub)) {
-		if (should_log_hw_state) {
-			dcn10_log_hw_state(dc, NULL);
+		int i;
+
+		for (i = 0; i < MAX_PIPES; ++i) {
+			struct pipe_ctx *pipe_ctx = &dc->current_state->res_ctx.pipe_ctx[i];
+
+			if (pipe_ctx->plane_state) {
+				struct amdgpu_dm_trace_pipe_state pipe_state_trace;
+
+				fill_out_trace_pipe_state(pipe_state_trace, pipe_ctx);
+				trace_amdgpu_dm_dc_pipe_state(&pipe_state_trace);
+			}
 		}
+
 		BREAK_TO_DEBUGGER();
 		if (dcn10_hw_wa_force_recovery(dc)) {
 		/*check again*/
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
