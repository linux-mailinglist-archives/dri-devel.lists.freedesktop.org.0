Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D2AC6291
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E265710E1A3;
	Wed, 28 May 2025 07:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cqEW3CXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DCE10E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:05:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtyeHUKFzhA27SFo5q+hEE2eJEu7HOfSmaVxFgnH1hfOGcGBjgq4HRqWUT1u+6e/Zs0IHYx1yz9KabYn2U0o+PfxIYewQ/df/t+R/WBnf46Otd1Bpb9BINTNHWaDjGAgeGkBAgL1q1Dzt0/Blw4I94RfX+utIyF1qMLaONLtrrJSqq59bloaDGpyVxJgMx/GMFsFq5TxUvGesbUWePw7feT0bFNm2lr+aYkjQJx8/Oiq00sy44+Os6y3UmyFweBrdibETLXnxoieGn744J+FA8xEwlrWvTK70CJ980uNiXeaj/BCrNSxg0EbLzK05T8uHv/wj0XdpXvQ/oTqUtq7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ8O9aEYyFSQrkkRD29n//y1MkAzcxiPthnNEFPfoog=;
 b=AW5IQhpVj0o4rQBWTxTFdTC9E1ph4X9yiPT3mWUiQ6/EFMaTNrn6m4Sepua5ZOKX/DAscQ+H7tuGibE/aeL0mqz/4wUmP3R0iD8mM7GwpPH08soDiAkLb3ow7NqUjDdgGbvYd7oWKZ9hRurKNu8Ib58x8szlNh41L6hFIHAfvYRK7FKTw+odZUm8Taqn/lVxNRHIOcb1XHEpxQldv0vkXJVXSH0vQ5macZxNtWY+bjGg0kcdIHGXvY6NGNnYiLzmUXdgkg8bvA3Ev7WxSiraoZgX5DKbEkqcZQ43KAN7H3mHOYjOnz0f5p6P9Zvh+MongGyGwHmzPiYtUuwTm6Azyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ8O9aEYyFSQrkkRD29n//y1MkAzcxiPthnNEFPfoog=;
 b=cqEW3CXG28fvGEuG3dzBp12rn+3FEDMogR3vrQE2aBKr860I9r50YpHUXfEa+RoNhC3uvX6GTjbjWtnRj4jCED7edCD+a7Tx5D0WhsU7ZXAo5/TYrha2hooFn62MU0e0Mz/bHT8hG+hLgCgaFeWHJgYn6dzQbo6tNIMQM4pI0tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYYPR01MB14051.jpnprd01.prod.outlook.com (2603:1096:405:210::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 07:05:25 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:05:25 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Adam Ford <aford173@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Improve adv7511_mode_set()
Date: Wed, 28 May 2025 09:04:36 +0200
Message-ID: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYYPR01MB14051:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a36339-e9b6-4911-d95f-08dd9db60530
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iHUpWulkPxu3mPN0Hk/cC/FnH0E6BPONR0rlzHXm0CoNZJAAe2ADbLihEDE/?=
 =?us-ascii?Q?H9m38BXrZGKIyUEWzRarzXjSMjSYOcel+L5Z7MzHTOWkTps39Qr3MWh64pvK?=
 =?us-ascii?Q?OSEri6uhzyh1Io/MG7HxPHPtdvlZ/v7lo34zzm9wRbDq50hShApxVXSchhI+?=
 =?us-ascii?Q?7Ey+pClJwJKsikfESH2/nhREylzr4DxWFqFqJqyo/1lOh5tgzEzB1ue71Li3?=
 =?us-ascii?Q?P4ax+NaYkGNQm0ya0A9EGduFhhd0XQYXm9ce7PcZZL6TZklYwaHej6tEswlC?=
 =?us-ascii?Q?gIPQi7f6Q95Acawyo+khnKJgCx2cNGKqOrTNUyNKbnOTRx+wHhfEDxR1o0Tc?=
 =?us-ascii?Q?lEJOIBfFdPHYM2j4WIfcsKNEdEFTHeM7dQVBXM6fpayPcJYCEyKajkWD1Hpr?=
 =?us-ascii?Q?bOmmGmpK0Fvyp8K/7lrDefipVfFrfrf7LESWQP7cUMKcx5O+VoD6DdTSwfA9?=
 =?us-ascii?Q?bE/4oQ8uFpVRTLgPgZOGNe07AaTlC4GHTX37Q6Qg1gSe6UhguFpvgq4y+Mp+?=
 =?us-ascii?Q?6K8yjV9oFma7obHGF3AgMonmMbgAwQED7bw64gvQEg+JpX7LOHELEr+LACv1?=
 =?us-ascii?Q?kOQld0HG3C1nGdC9BnwepPRzSGIT126CcB1Rb+46Ni59DqxK3MywzDazQarq?=
 =?us-ascii?Q?iGg1xROuYpAN5R7No+9QSlaoH8MKAkQTPvO72k6ogBVxyKRWaHcYLh3iJyjW?=
 =?us-ascii?Q?Q5Ui0ayFC+7UWKm3N9EXJ6tF+3NdtUXN5gUe7P5PQ2IBKlfp0cV2xDfcvNNB?=
 =?us-ascii?Q?jvfbZoWv+o1K2xni9K0+86oqqXc2fi8qdvVgBBiTA+IfEMD1lleThhKr3keP?=
 =?us-ascii?Q?gCww0fmfLvMQ+zsKDq1zGuT701G0+/eVCgcVoT63L5w0ZJHgLouG0KJ718G5?=
 =?us-ascii?Q?z8x4tCCJ428sbTbGxJyzoBYcJvEmLMoaso8VFZhp7UunlZGmaUnHOB7BonT0?=
 =?us-ascii?Q?8bWKfbtgTzwua2G1Qqk7zf3a9MC13c12R4e46vl5OK9c3pswiQ7nk9FJqy1P?=
 =?us-ascii?Q?h/engUuFs2bJixbkoOTBd6aUAQHv0E+9DUI/t+7CY46QPqvC+1MYfSqRFAnG?=
 =?us-ascii?Q?nSmeBR1+7U6/B9vrj9RC+6uv4WDfE8ny1qWrQ1xmDDq7S2488jfQalpc1peB?=
 =?us-ascii?Q?fTlCbF8NWcfWLC5+Q81UIe9v3zvsHRSuzbPNAka5rflEdhEnWTDuRAfGBSpN?=
 =?us-ascii?Q?D0ajWPlDc3yTjy5244DK72yeCECxSzxy1mEkMB/LkA3xgy1iylVrI7M4sd0J?=
 =?us-ascii?Q?P/g0+J4lqZzT3/uLXgS2K8p5nOl9/eSxL4hK3jFcrr3/uXsym5+/HagExS43?=
 =?us-ascii?Q?e06LKUFh9XbPSlTAc9SZoK2Jywn9H+JYV5lnoUj2esXRp2f8eIvS4HvDz6v8?=
 =?us-ascii?Q?cLur68gPUE/1/G92mXej5iU13pMhfLbrh2VF4P53bUdqJGtX4eba86bdz0MN?=
 =?us-ascii?Q?+tXSwGUNkjGyUvsmCT5N+kdAYMgANQIXjm2FghDLhMUjb+YfEQHEtw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1tQpuf3EM0fUyytDVvYszpIbJK0KWcvKi63H3kDkOVkjCDwCuvHaa+Q583o1?=
 =?us-ascii?Q?Gb1GzcCH254QwFUXih6kCwWI6UD7CART1A2gDxt4Ufeaj1HfFpAf+u24nUr/?=
 =?us-ascii?Q?1scYNpe45gSQA7ZPZapUC/71QVrTErQCXGKPvmX++hPl8DNbAk732Nywwxh6?=
 =?us-ascii?Q?g123RKEWuqZr5muAxML/JfUu/MyQXwAncQ4gWfP9hF/ofsKjyRybs2Zm9x/o?=
 =?us-ascii?Q?S2YoiYRs32raxwIJzmS5sMu5qeFcrR6pHl+N6iL6UCpQ7M5fZlw/11G3gtzm?=
 =?us-ascii?Q?/ZMFY+AC9tHyMB/1wpTuukgygM3VhTDIVyLoQFXEAdXZM+56eQcVdD61RlhE?=
 =?us-ascii?Q?25W7tskd9IOYxeytcAhY7rJxO4HObmZkx9kkAWx+ikTfLBMOqKehV7sRHAY3?=
 =?us-ascii?Q?8Y9mPXdIClQBeqzxilIl8AdFLo71OiHZtDnHSc7CVY3EaRnxVOTrDEG6R3kk?=
 =?us-ascii?Q?3OcsuisklhHmlEmC5mpaQtEjruTb66TVFyd0iyKa2SmNKxtWj/pGIotCnaWg?=
 =?us-ascii?Q?dU7nuIYzri4ghzlouYYNtuCvuv0Q7TjRHzeqred3cP4liloBPaaR7Y7WuhCQ?=
 =?us-ascii?Q?jZp93v5NrlS8DKURCSFI+w9TNV7Y3pNI62cRctbNt627Hauul/xYmg0Tz6Hu?=
 =?us-ascii?Q?9sChFq8/gYbdXJZ8yG2o39cfiA6of+8yNKj3QMBuQ3rWtRzBdZUMrN14sma7?=
 =?us-ascii?Q?tEW3TsV5cW5htZI8X/o+nP0kYG+CuJfUSUwy7dbIYkk1ddq77Duqn/ez+KLZ?=
 =?us-ascii?Q?RBdLvs2zyJLfbHIQZw8X+iM47eRBPHFYm44JBlQer4t87yJv/z7MICNImD17?=
 =?us-ascii?Q?WDm574vqPtyJsHo4gcUoBdOmzU1DQ/ngmVbKHRn8yW9JPOtOAKUXhCKv1iwD?=
 =?us-ascii?Q?fM8SutzbPCjN5tczOu6SdSRqEysjoT3Hywaa/IU9yy2/RR/K/62Uvw2DoyoJ?=
 =?us-ascii?Q?v0gHbNPnwrED6GFC989uu9Dst1TzLJuNCoxEOJgATMoxbX9e76tZXL4QVNGg?=
 =?us-ascii?Q?0X/s6rs09BWImbH/Bx4ZDxTeeToxVcHCp9Yp0542gLtY3ABPrIs35IO51/+n?=
 =?us-ascii?Q?m8rGxbUqS6B7trJzJRek3hkbUNU9hHjGHIX+oNLn6NnO6F84xK/BjVg9ffAP?=
 =?us-ascii?Q?aKuOuVo2w1thbWllYYSPMOuflwo7K2444XM1kEh+Q86Ed9HXqEtqA5bgKfUc?=
 =?us-ascii?Q?kx8/XG4Be3qcVM66K5e1HcHfd948wXI8wUphBo4RaZSuHq1GNd9FoQKyh3iM?=
 =?us-ascii?Q?i19k3xDv0cOxCdC1Cf/NkwB1Ryattx5J85c+z+qqTb95ZUz6ZHJLcdWpObFf?=
 =?us-ascii?Q?pYoqLKfr22slczC7ndDQ2SlOKkgpynLdyHwCF9fSu2Wc0Tg5lCCdgrGKDohY?=
 =?us-ascii?Q?hCzQm8ZyLg/JhnenNLHL0C9gFlEm+Aa5ytv/c58YO+hldctN+Sp9jUfMOUFN?=
 =?us-ascii?Q?TznyXiOpKdurRuj7Lewro3Epi+u7SxKY4SrBT6G50NfO/BhgYgElkWKGywKa?=
 =?us-ascii?Q?8mOfDnmhwMhXrVGiYkIAcwnixem9Ct+r/LEMq43XjbrHqEP2pPm/vkRyPgoK?=
 =?us-ascii?Q?u2c5lzDAI01uChS7nI4Y6CFmDaOcBZe2nWlixN02bjSyAPyrS/ERXCYHHoOZ?=
 =?us-ascii?Q?+izpAJUSWsrfSCMTBWJUWro=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a36339-e9b6-4911-d95f-08dd9db60530
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:05:25.7424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0U/NV1PTPzvDZ/cBr3Sks1Z5djW/JzW+t87g15FqU/R81wQIpoOa7h2OxjQFh4EI8a0bCdBjJjh4HEwkDi4R0nwS0tNW3DNq1qy0Nua8zkd3HxcT0GRNW+njE3Pw09f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14051
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

Dear All,

Currently adv7511_bridge_atomic_enable() call adv7511_power_on(), then
adv7511_dsi_config_timing_gen() that is responsible to update h/v porch
params.

But during the adv7511_mode_set() adv7511->curr_mode change and this is
not reflected into the h/v ADV porch regs, then h/w porch regs are keeping
the old values.

This series fix this issue moving adv711_dsi_config_timing_gen() into
the adv7511_mode_set().

Thanks & Regards,
Tommaso

v1->v2:
 - Added cover letter

Tommaso Merciai (2):
  drm/bridge: adv7511: Move adv711_dsi_config_timing_gen() into
    adv7511_mode_set()
  drm/bridge: adv7511: Rename adv7511_dsi_config_timing_gen() into
    adv7533_dsi_config_timing_gen()

 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 4 ++++
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.43.0

