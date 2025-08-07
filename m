Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B4B1D953
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE27410E142;
	Thu,  7 Aug 2025 13:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="iO9WCwlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013071.outbound.protection.outlook.com
 [40.107.44.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB0510E142;
 Thu,  7 Aug 2025 13:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMGBlQP6ga70dDqAyP6xGfcat0fjIXKSFuPgFwR+4g3z8b5zpWxhElW+VRY+wb2OkLoSiAZ/TaE4t/CGT91+a4eDBQbW0ujfnRj7c2k/l7FQtZNZAGXT5zbURFCQjka1sEYnsC2C5SNJID0iN4LRDFYT3haxrybia9+Ju1H9pggpyfLMYcCA05FP6We7+VadwdT/P5d3KX5QwHgyMLoTqYMF5FeTqA3OljD55i/eVJhCwnyanQz1caQ6ksgI8sPucPXJUjzZWRbkJeBY3INRVg8+UHMQkS62irO1DiuUySNneV9KzKF4ZRkuBo8bVRPTV1MXhjaQhQFtvzylDkEc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP0gdHnWiQ5XC4jj5pNk2kq8/VQPDl9jZhPCRIr5L3w=;
 b=K/Zd4wgStT5elWNidi4ojezapGsY8bp3YKILR2Ce9AqvtkcfikSnYdeMGrBcmT0cMb8wEllUdsVmHFKz0z905lTQ5jSxe2ovJ17hBf1HzXBzld2Fs/6ermiddB9JcAXgeE94ONxa/icgSM/Z5KtluowDWhOeiCgklua4urK10SUq2n/gWPVTwb7fOpNKhCuvjG9ko3lh2R/k6NfgI3RFXAoXHw4miR38XsmBeQ1no0k5f8i+C7yor7izDBxBfu031rPuelSTtP4eG6m4+fWPCIJDZGjdRX3UiIWBPV3/qtmPHvX/f8dGnGD5sUkrsoepHo3rCtJrXQfh1+M4MQHeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aP0gdHnWiQ5XC4jj5pNk2kq8/VQPDl9jZhPCRIr5L3w=;
 b=iO9WCwlqT2H6y+gOv+REIMgXtanW7c8o0e4wMZuALZ+p0sMKC/MZMHVNEIx4Hw7VquY71PBW3gqtkqdLhy/BdFOpv33isGStnTX1Kj53NDCTElRTpXkZ/BKe0LYrs+AKerPgcyaBB76FTAbrPkFG51tzHI+4nzPzyxJJ9k8l71iwsi3skuOXyf7KMAsZyjNQRuyp6frecnAYOQiJePbiI78kYZjlSr3VT2/lFuRB0p4JQNwQ5safq4OjXKVcR6aRVxrPLui1RX3jLmg7DEkqrZebrc7exn6ssUFCTDXGI6nymtsfKJRQ8m9IJbmX9jh14k7fZeKZI4RmJMdRl849Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB6614.apcprd06.prod.outlook.com (2603:1096:101:177::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.16; Thu, 7 Aug 2025 13:46:56 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 13:46:55 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Qianfeng Rong <rongqianfeng@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm: Remove redundant __GFP_NOWARN
Date: Thu,  7 Aug 2025 21:46:36 +0800
Message-Id: <20250807134639.555274-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::31) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e34cc3-0aea-4453-6654-08ddd5b8df5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VZzZC1vEoDscXtOlwzfbXiwonc9nhM+7aZcdTf5bhI4/AEwBf+uwnKnp8Xnz?=
 =?us-ascii?Q?rHMLs8eKOfHzyqriD37uNdwb0OSm9XSLLjzroKO7CU/MT705gBq5aNLPNzNu?=
 =?us-ascii?Q?Xp/waNZol4fn6Q+21ncCZy1urh953JNcAXUdwypoZDAOPfxNPWzwQfZX4xWc?=
 =?us-ascii?Q?TAO+GlC+edeIFv88+bSCYdp0K2gGIANQ2daGm2MBMD4PGB2Jo43KUCFGV1S8?=
 =?us-ascii?Q?Gy//WLz6e1DanaeqamyOMONULOSu9HbkhKkr+uks7IuZfjr37r1i86UC69ZU?=
 =?us-ascii?Q?hWSlPcxV0c4Sxqim7fsY/Yer3PKoxjI5b40AQ4vFRwfiJyjIdOnHwbObX7gl?=
 =?us-ascii?Q?ShK05gjpUor0x1pMXIorOKhn4RaMfkQ/gSqbMHZdHJtFK6gTfyn2Qw2weJNw?=
 =?us-ascii?Q?vXylv0SYpw3wRF95U7my8gmPX26lwLVkeciU8jb0fIfrh7KsBMAHZyMqpXf6?=
 =?us-ascii?Q?AN+C2t/Abz7NJoXWtUM8vr96UIbf5PHXk8vMFPURJDD7SMdo28kz6GFWVNSj?=
 =?us-ascii?Q?vzi/vfyrJJrGat3POhWYwC4ReeZEkNo9sGq9yINrQGvH/7v+AwT28UaQ4m5J?=
 =?us-ascii?Q?AoD95yTsvvgpWBvE253dtN9ucVrYYrgdk0NrE3EaC42rSRTR716cqylLoRNI?=
 =?us-ascii?Q?ETYtDV8bteQvzr1h5qsoXlrhPdMeRk3i4EWRCUmRkdIOcjslwzmPSjfVvk2P?=
 =?us-ascii?Q?GHkYiIGb5ZyvB4KzL1SGaALqD7R/JIoYIj8UUivIKCB9OVlfXd5999HUAAFe?=
 =?us-ascii?Q?keC6uXynM8HxyZ8asSDQvW33lDZwMSng6vodkPO42a1ZVnAokcIX0hKCwwcI?=
 =?us-ascii?Q?luAiLVHeoAcEE3h+Az0rq9xCb3XL2WLA04F2EerPJo6lxUqkBw52DI1amtLW?=
 =?us-ascii?Q?NZo2kSYoy9LBJJ9QPj4c8ETQyuVl91rDUuALgSfkibXWtKvGBJxs22XKjASi?=
 =?us-ascii?Q?cB/Rvk7xYdNWRYhr3opPwN44JtEnJZt4/A65+lJ5dXcZmnqnolY6zl+UstTq?=
 =?us-ascii?Q?tXNJQRobiWAeJH+presk+VEMTyc6tiaJUm6zCgDxcTxdK3wEBVTy1w2tE2i/?=
 =?us-ascii?Q?D1iu9ZsG2kHjHtXFWl0FvGbUJpzZaUrUj7rSqcy1Ge1iuNO2urqPnP5mpGIE?=
 =?us-ascii?Q?/jjo9L1pSrzNvcC37l0XplHcS9LQhGguDwl4m3NG7rLjT32RgntgRaIYbgYv?=
 =?us-ascii?Q?RSxupxp2hvmyWEn1E08tXTmeHY1ZOAw3sDsPa4l6cWG0QCEOaYiWqHj/9fNs?=
 =?us-ascii?Q?oVTeSxs6JrQvhfTUpT55sdYTR3x9aASgb1cXI5c4TvaU1OB8iPhNy6m7Lh39?=
 =?us-ascii?Q?rLrjgMenZRYQcCBr/GgYIqwfDBPKrnpuolPB8R8yW0yvZZT35JMmwmaojKOz?=
 =?us-ascii?Q?OP6FBYde4cqJPY1AVx/s4mXhvY3AdooajGBLOzRJZx0wL1vdBnwVQFRqlttz?=
 =?us-ascii?Q?f1dLRS5tkQWg7NSXNE1VSS0YuRLZWn1c3S7As4jomvmgr5vvtZ2nSbvH1YBV?=
 =?us-ascii?Q?ZHzvFlM+YxwYono=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?43lEFtQZjzzS52c4D5UIDIrcKNbqvgQTuHaLyn1XhbKHSqhrOKSWwyyU4+lG?=
 =?us-ascii?Q?iza173tlmKPJKFOaBNOk9J/EnmC0CCF9julGkYvqszFqjoATP4krEa1fpE1O?=
 =?us-ascii?Q?IC4GOGk7MbsjeKAE/DeOqmID2Qp4ANQbU2R740ZbfxQFEx8a9QDut749NptW?=
 =?us-ascii?Q?ggHLSr1foxfrOkUk7Pz2+fZb+8+gpTgUX6UBadrCLCJ6GWwoWfyKtc7CmmB8?=
 =?us-ascii?Q?Ysx4ddeXKpa4siVne2FI3TC+TYZVyix0yZAk3YV31vvJWaup/M7Rp3Zio53j?=
 =?us-ascii?Q?pivGuIjpEEk/e32L//+q5m3kv6E9ktE9sYCmY0Vl4DCv52QU9DGkWCLMuUhh?=
 =?us-ascii?Q?7k9nTG0zV/I00yD2JLwENLY1eGn57JDhB5zPdHq7vciHvgNTBrdgcSdWjwP2?=
 =?us-ascii?Q?EoEBqeyV1KdjgZRJRkh59vxxHvl2yb7fb2erY9GGtLxu1lGFKXaAH0K3Ypp3?=
 =?us-ascii?Q?Zxb1CMb6q372MDkj+BxFiHLzk9NYdD6p/DNrnLoG2xukNzF25MYhNnkxjtxy?=
 =?us-ascii?Q?/MZJFANkIwAo2JCMDiX9FkW7Ksh7EBvfEHJd5/pgnbdLFd36c2KngI+wAnaf?=
 =?us-ascii?Q?aU47ZqLGOE/ii4AmdSgdKKQ47Az0dapQH48aQJHMVpF7UY+/KiG4LUxRJoin?=
 =?us-ascii?Q?VMXc4yTQfl2cvWhCkWHHhDTYO2pmI2Ff6ISJVnxSMNSBJqccCETCrh3rUmEO?=
 =?us-ascii?Q?ZJFhytzAGhJ2iBgWWxbqoSdi6w3N6BrWBtF3NRRDBfA3gYmjPpMLKNBd06tq?=
 =?us-ascii?Q?CyIcXT5OhG1E6QMN66RgChTIdCYpgmsXgssDzN6HfqI8664Uq1Rs0DqIXfsa?=
 =?us-ascii?Q?IjX9UDKdOQE0X9bqetvKHfr2nXVcCZ/FP8eab+tsjJRVHLYojj3jnPFBZmh4?=
 =?us-ascii?Q?IyB58g0/IOqHiC5W65M4+g1Lqm+oTrtmzx5mPFrJMh/dw7DjpUsIFzyWO71/?=
 =?us-ascii?Q?yZVRnC8sxxhAr059mOqqGh9PwL4/hiT4TTewd1NWTWUcIWrg7c3xtEs/4kav?=
 =?us-ascii?Q?Za2OJf0jFR8iGyZy4BHW1Yb49LcCT+/XiIXkHRlB7xVR277J98eidHjX36Rs?=
 =?us-ascii?Q?M6kyaOOeKzE/qOHVNpMpIReIcgOlhI+B8kV1ngMwcNE6FOxg785dVwnhCScD?=
 =?us-ascii?Q?OBBAgXFLNC4D+V3UpZhjE+dLxrUVhvpr364ZAaNozgidifSZMaTOfb4jIVDm?=
 =?us-ascii?Q?dZstYapkjP887cWXrD2Y5NhdTyCT5nevp/md5zUschMhqykkp8tmCtiONHh6?=
 =?us-ascii?Q?MLIOT8NE2JPcZOomZwOKqNScnWH0en9AcGfemoaDV1AIPKOoIdsU+1oIoOOx?=
 =?us-ascii?Q?2v2OdFGsyX9rksp5xPwWwD/6Xr8l2klW3lPZPlng9WV2k95E06XxOWe3LETp?=
 =?us-ascii?Q?1iXqxi4/e6CJroJD3GQyflU35KQKhqafVEqUbUIG5UIYs48xVoUYIs3hxl96?=
 =?us-ascii?Q?9QpFOscziVpbA5CcVWhgl3PRIrQQDQsBLNvFBVhAjH5suHMqC+0fD8HzVeXE?=
 =?us-ascii?Q?nRwsgaA/WBeenEP/w382FNH0u6AGapvoVv75Z3Dvo5+ujRodsDDZYF82b4EW?=
 =?us-ascii?Q?TiHaEoOqqHaWk7QkZ3A8LyZPqcNscJhbjUbLGTTS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e34cc3-0aea-4453-6654-08ddd5b8df5d
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:46:55.7238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUUBsmuiV6NSmO+IjoeerDv2eQ09MfPdlJVBAdNLp/JZgZWM4/KhDH6ejmigAeTLEr/QV4NneHbpoMRGe6Y4RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6614
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

Commit 16f5dfbc851b ("gfp: include __GFP_NOWARN in GFP_NOWAIT")
made GFP_NOWAIT implicitly include __GFP_NOWARN.

Therefore, explicit __GFP_NOWARN combined with GFP_NOWAIT
(e.g., `GFP_NOWAIT | __GFP_NOWARN`) is now redundant. Let's clean
up these redundant flags across subsystems.

No functional changes.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/drm_modeset_lock.c               | 4 ++--
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
 drivers/gpu/drm/i915/i915_active.c               | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index beb91a13a312..58eac20a8138 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -88,7 +88,7 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 
 	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
 
-	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
+	return stack_depot_save(entries, n, GFP_NOWAIT);
 }
 
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
@@ -98,7 +98,7 @@ static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 	unsigned int nr_entries;
 	char *buf;
 
-	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
+	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT);
 	if (!buf)
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 8d4bb95f8424..22432912db2e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -220,7 +220,7 @@ static void heartbeat(struct work_struct *wrk)
 		goto out;
 	}
 
-	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
+	rq = heartbeat_create(ce, GFP_NOWAIT);
 	if (IS_ERR(rq))
 		goto unlock;
 
@@ -282,7 +282,7 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
 	GEM_BUG_ON(!intel_engine_has_preemption(engine));
 	GEM_BUG_ON(!intel_engine_pm_is_awake(engine));
 
-	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
+	rq = heartbeat_create(ce, GFP_NOWAIT);
 	if (IS_ERR(rq))
 		return PTR_ERR(rq);
 
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 0dbc4e289300..402043cd84d5 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -727,7 +727,7 @@ int i915_request_await_active(struct i915_request *rq,
 static int sw_await_fence(void *arg, struct dma_fence *fence)
 {
 	return i915_sw_fence_await_dma_fence(arg, fence, 0,
-					     GFP_NOWAIT | __GFP_NOWARN);
+					     GFP_NOWAIT);
 }
 
 int i915_sw_fence_await_active(struct i915_sw_fence *fence,
-- 
2.34.1

