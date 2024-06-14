Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF8C908601
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E886310EC92;
	Fri, 14 Jun 2024 08:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pEFrp11d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B3510EC92
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+2AZ83sRn8cE2oJR9zE1rVGXnFxT2iOnIfCdEETeCvEi/jz+PhpDcYZK/ml8W8bi6oQS1FX28QkuACfs8TsBAdISaIig3sAkvNAYvLSMFUOSDpHkCZtWtX9920dzymQAX+39BIw5hYLftSJbz/KAlQs+CF4jwIRHArD8RyZ6pAXbqG/5gVoaFlzJPOBIGTgmEjcnCE1Ulzyf6Cayk5In4tMbBLLYiOBwjwdZc3zWrRU6Ct6mW8XTuXROMbnzyaeU433q5F45i+ltmP8dvGs8xszHnKK9fNWN/ExKznEmb/Zt9YvEVIbmz/L8MRQrIBSERTFaUDA0jPbGFlH0dtq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0veTHPXEpYQ6QnLLr65WWc/pdNUbOBSCmkjT/jlrQ4=;
 b=fW/lCV7KflKLWFdtiPKlxlRiXaxB/m1qpLDPxvskTyalELwg0otzWFiTmB/UC0jtr0ylARVPKpBs9WJZTPFxsihUX9eT1JE8ADQYRKI3PnZuh3qVzsiog9tB+FEoBKNVjERtRoBmoQCxMZ+PSR2RaeIVxDuE0y810EOvNjU3+ASql854/PLBfgm4eZ4aEEBWuMlbrc8pFum5brGVA15U2jz9miDg+cVXBjnnFVtdrGFy1SjrcB/LAs+vxBdv1IqayvN3iMVba55gdEyNsLW3wp/rFcoRDXC2i/HsBhrbcfpLyi+Qgs5tBFEnSskgSWuVuWB06b8qpqvHjNPZTcZJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0veTHPXEpYQ6QnLLr65WWc/pdNUbOBSCmkjT/jlrQ4=;
 b=pEFrp11dDIMPjw+YwnQ/2PyNFZCTjzL69zyG4x5gEB5m00cVRlyeeFf8Bzi7a1HJtK/Voppxe0QI65ug2t735YYuTXujaJgjC5NZMoMIOGmhZKIQSSJCdrZRi7ZRl/15EuguA0wI5E0NjXQDBDFyfhx6K08RhIgVDPA6oNm0X3c=
Received: from PH8PR07CA0007.namprd07.prod.outlook.com (2603:10b6:510:2cd::23)
 by LV3PR12MB9332.namprd12.prod.outlook.com (2603:10b6:408:20f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 08:17:45 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::43) by PH8PR07CA0007.outlook.office365.com
 (2603:10b6:510:2cd::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26 via Frontend
 Transport; Fri, 14 Jun 2024 08:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 08:17:44 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 03:17:41 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v5 2/4] drm/sched: cleanup gpu_scheduler trace events
Date: Fri, 14 Jun 2024 10:16:28 +0200
Message-ID: <20240614081657.408397-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: fff0c60f-e604-45db-a48d-08dc8c4a7838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|82310400021|376009|7416009|1800799019|36860700008|921015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?asu/A48DQ3bvcueXqkdZeW84lHdCVoS7J6d6BlZqVR+e5uAEWnsKkVLrE9nO?=
 =?us-ascii?Q?cZLxSEWmWpljUSAcQOj632rokWu4ECaFpjt5gSolNSFovvdMGPFNS4HZb+mk?=
 =?us-ascii?Q?WmMz8rGsI8Cf3DMZ2Xyz6fcV/WHR3LzAyWMerxOky2IkL2R3XFP+b1dURKjr?=
 =?us-ascii?Q?EP1jOiLOpuULWu+H1C8313unMewPKT1STwZrG0JlX2Kwpzroi3Sp/FZFTYTG?=
 =?us-ascii?Q?Ou3+0LRuiyvYFPIufGyYG776bsqJkA07zqKJTi2gaM8xz3yl/rlsP6/PD2gQ?=
 =?us-ascii?Q?9qJigt5tgB1YmYlmzuZm8tuhHBm1K2+XY4KOgl/yVtQxoU9Jrb4AgvmBTmzt?=
 =?us-ascii?Q?p+3PXXKAU/+2xQz/a4UvxHBPT3yU1IndtXRByGDXroaT6utgB2COT2hmXljW?=
 =?us-ascii?Q?8TBHI4WHkNLY0V7avHYG7/Un4SHVBwghSJtp3+VYVB2L+p4iDe9rRRCijoah?=
 =?us-ascii?Q?nSyk7uJZrhrZzv5a9ajrMtJuw6wjXOZbdYf+52IJxb0P37U5WItOseIhImDD?=
 =?us-ascii?Q?DSd2pBEArUsx4xfNwO9fZ808cFNt3Hlsngn4/09TwXFX8Je/gPNnB/a9gaQw?=
 =?us-ascii?Q?Ee0XqPjtP0XxVC5OJ1r7eNIEdHlEnCJ0v3vARoHPd7jr6WooIK44eHdCOHGK?=
 =?us-ascii?Q?z/18bcsj0hKyIuOVvjZDfVPVqlE67BKkSIWt5aj5Fa71p1uZb949l1ZlRRAS?=
 =?us-ascii?Q?1lVtFHClmzudzdceNexPDptqyalrKpW9OuIJg4UU7Gy4LnQvubHlNFjcwBLi?=
 =?us-ascii?Q?ByVMbXn1I83J2SWuZG+ztzLIcZh6b26TKZnYHQGzZBrveMVwaPFwioEEqaww?=
 =?us-ascii?Q?R0kdQ1Wrw7Qelj9/HIAB4f5MsEb+2cMpkQ4PzcfhGnZRtZ+uYNk1ie4dBtHW?=
 =?us-ascii?Q?9qFEYfW7NFzolhh2J4/GjALxIKZUO4exoCtYdUeKOnTNwP/0UzFHxY0JROLs?=
 =?us-ascii?Q?WRIcOGQOllnyoB2VGCg0g6nimmFEGqg9lPJf/w8GLrwEoySZXF16/+n3+ENB?=
 =?us-ascii?Q?0DY9Av3C6by5PCE59WqU7zd+q6NcGpceuVRJ4NOOQKmDWM1M9FeDNaMexrHS?=
 =?us-ascii?Q?tNFzdsI7hWf27D7zSPhoF3Meq7vHeSQ5CKDjgjLx/JKbh1nco6XnXaS0R8PA?=
 =?us-ascii?Q?3bfZuf/huZRyxhTI2OzgUT98pGrGFfbGQ40ozXWO/TyvvlA1TPgmqynskj7U?=
 =?us-ascii?Q?HFddpX10AkUmQvM1cS2P1k1u+t9vxdn1lK+PHPuilTUTVouhhyG6eFvvKDsC?=
 =?us-ascii?Q?diy/lQPiLqXDJXUGaPQ66ubZ8xrtnZ6w7qlHBFHYiMSDnyYuMSicXpJuplTg?=
 =?us-ascii?Q?NetJPfjEP5IMktlZcbAUU0f+F0vBg+07b9Jgoe3WhrTGI8SN01XJ2uhrcaFp?=
 =?us-ascii?Q?+SjN2/14kD2b62cNNhCOpRhQZbDsOr/AK4Vf34PmhB+mGrKXwQ6RpTdJoBuR?=
 =?us-ascii?Q?pzn7o5MedxA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230035)(82310400021)(376009)(7416009)(1800799019)(36860700008)(921015);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 08:17:44.8151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff0c60f-e604-45db-a48d-08dc8c4a7838
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332
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

A fence uniquely identify a job, so this commits updates the places
where a kernel pointer was used as an identifier by:

   "fence=(context:%llu, seqno:%lld)"

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 45 ++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 1f9c5a884487..f6da377cdb99 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
-			     __field(struct drm_sched_entity *, entity)
-			     __field(struct dma_fence *, fence)
 			     __string(name, sched_job->sched->name)
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
 			     __string(dev, dev_name(sched_job->sched->dev))
+			     __field(uint64_t, fence_context)
+			     __field(uint64_t, fence_seqno)
 			     ),
 
 	    TP_fast_assign(
-			   __entry->entity = entity;
 			   __entry->id = sched_job->id;
-			   __entry->fence = &sched_job->s_fence->finished;
 			   __assign_str(name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
 			   __assign_str(dev);
+			   __entry->fence_context = sched_job->s_fence->finished.context;
+			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
+
 			   ),
-	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+		      __entry->id,
+		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -69,9 +70,9 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
 DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
-	    TP_printk("dev=%s, entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __get_str(dev), __entry->entity, __entry->id,
-		      __entry->fence, __get_str(name),
+	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->id,
+		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
 		      __entry->job_count, __entry->hw_job_count)
 );
 
@@ -79,37 +80,41 @@ TRACE_EVENT(drm_sched_process_job,
 	    TP_PROTO(struct drm_sched_fence *fence),
 	    TP_ARGS(fence),
 	    TP_STRUCT__entry(
-		    __field(struct dma_fence *, fence)
+		    __field(uint64_t, fence_context)
+		    __field(uint64_t, fence_seqno)
 		    ),
 
 	    TP_fast_assign(
-		    __entry->fence = &fence->finished;
+		    __entry->fence_context = fence->finished.context;
+		    __entry->fence_seqno = fence->finished.seqno;
 		    ),
-	    TP_printk("fence=%p signaled", __entry->fence)
+	    TP_printk("fence=(context:%llu, seqno:%lld) signaled",
+		      __entry->fence_context, __entry->fence_seqno)
 );
 
 TRACE_EVENT(drm_sched_job_wait_dep,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
 	    TP_STRUCT__entry(
-			     __string(name, sched_job->sched->name)
+			     __field(uint64_t, fence_context)
+			     __field(uint64_t, fence_seqno)
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(uint64_t, seqno)
 			     ),
 
 	    TP_fast_assign(
-			   __assign_str(name);
+			   __entry->fence_context = sched_job->s_fence->finished.context;
+			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
 			   __entry->id = sched_job->id;
 			   __entry->fence = fence;
 			   __entry->ctx = fence->context;
 			   __entry->seqno = fence->seqno;
 			   ),
-	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
-		      __get_str(name), __entry->id,
-		      __entry->fence, __entry->ctx,
-		      __entry->seqno)
+	    TP_printk("fence=(context:%llu, seqno:%lld), id=%llu, dependencies:{(context:%llu, seqno:%lld)}",
+		      __entry->fence_context, __entry->fence_seqno, __entry->id,
+		      __entry->ctx, __entry->seqno)
 );
 
 #endif
-- 
2.40.1

