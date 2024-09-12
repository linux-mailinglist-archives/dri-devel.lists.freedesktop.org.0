Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616797622C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CBD10EAE7;
	Thu, 12 Sep 2024 07:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="hv0ela+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2052.outbound.protection.outlook.com [40.107.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E8A10E721;
 Thu, 12 Sep 2024 04:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP3m9GOhWyQ8UWPgx0EpQr4KogfbaEZnsZRtT5DKMIkoiQDSQhcxFYUMhH0kfE3q2q6f6Vo0V3yGnAjlFUP1ZhzxSm1xjUEXxkSQ4RkzOLkIuCap1ZqUCJQnc6r2BSgMjLwuNOyqqhaXiEjwEyVFlkTDZtRBIFeldPI1qXf1q4kJoSjzK/sBNEGnYgZ2qRWhvULlcY+pN1OW/5zlzptIX1UVjuvvHta17toF0hc1C8DJ41PJHwerbZtjs1ggpEvEDkTGySed+FyIKCUJobplJ2bqa30AYc4Y+jLyx76K9grDVL+3EaEZCdXg9lSLeEAbphuqHEJXax7g8cjdgB/TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2ZG7Rokpn3ocPjOAULaoJrHC46P9xn2RDCWmnk2r3Y=;
 b=mAg2PKJvN04KF/nGMMV2BSMIkCs8+uxZ1n9XxKO+jgZ5BYqEvY3h+MVkTB0Kg0kQb61gItSJMFrtp3ecYOnQ17/jmKFiIIXgL7mUiTvXCXqHcY7QoDbM4GZ62sofuebo7C+KUn6XMtF8F9PvwbDNvad0n7DG+i0Bq1A/yGiDEX4u+sZpFm2aFKkjmAxLW2CSQJzeg+atggLj3nE6o7jmEoEHov9BDc2Gc6vnSOsA25qweuP0EfTkHDi/1s07fLXQXRnNf24mQtEfkwPT55h0QiH4pfOq4lMf0mx9pHWtMpdg7B0zZTkOJgG0q3+KuIw9eicfxuHcjLTZOUJuXiMURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2ZG7Rokpn3ocPjOAULaoJrHC46P9xn2RDCWmnk2r3Y=;
 b=hv0ela+tue8H7t+Xhi6N4CLsoHFm1Hb89fdrBNHoybKAzCi1+M7fjEsUo+9keUTQfk2E3EGTOg1xvDBX7uC5XBuxLpz1dRTG/9zz4Flo5JDLCEa9E280IcA9dhUAkqM2ehJuOB3dCprmpx16sL0A412wn6duNtOK989RqtnqlrbEIfrsC/Yq+g7HD2Zh/FYRsX/cftTZEIV+rrX+mtqZTHBBJ77+mzGg9tK7quu3WoMmArBo2D8tYpSaqePW30zpy8P8fnGTYCYvhCF3LuHrXilIN017jfuOadqNoGI3odakBm8VrN7RioRJVcD8+JwsLsWYPJ3IXCGkw6A87zkclg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by PUZPR06MB5888.apcprd06.prod.outlook.com (2603:1096:301:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 04:24:38 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 04:24:38 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, airlied@gmail.com, simona@ffwll.ch
Cc: sean@poorly.run, konradybcio@kernel.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com, Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] drm/msm/dpu: Fix some typos in comment
Date: Thu, 12 Sep 2024 12:24:25 +0800
Message-Id: <20240912042425.4703-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|PUZPR06MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: f70d3c1f-8b2c-4afe-a448-08dcd2e2d070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+WaYLft/iSYHeWIbz7KRZvZ2X2aEc3Ynygx2GLX7IoPJMnJnD3kqBHdNzJir?=
 =?us-ascii?Q?BaWhPbH6Jyu4NRBFZ17Qwru1xChLEITeDuLw6oyfFZEt2EDR5rHTXJ5vDN4V?=
 =?us-ascii?Q?p3QLtMoWyJ5kNkCmXc6yUYAC8boZ5cJELWKObYUkcuL0KPUBKoal1WYvz6Ua?=
 =?us-ascii?Q?UO/scwyfXP2IrwwAZXKFFb4TN5SfDJnZ6KSaX2kvU5RgtRN07zTR+CjMAcCY?=
 =?us-ascii?Q?QQwQgj4eRUC0KRjQfNIkwPyRnwt9UefBiysdAoY1t6lLWDvblOIfkT4hUuJc?=
 =?us-ascii?Q?7azHPZkaU2L2axrUCtshDEtFDWcB5Xv41NG4MAmSyieyw4Bj8X1ClgkwSHHQ?=
 =?us-ascii?Q?V19DwdimZro4V+Zi4+8geW4muvTFdkReBlLT5D2ePpJdhtWV295JNDOrB5Dt?=
 =?us-ascii?Q?faupdKWdaofnemzOfinaVk5cwIFafsTJilH4HlTkMumEceoiIl9sRF0bKIcJ?=
 =?us-ascii?Q?AU2fDDyEbZGLngslcBqf8ubxpI25XdCTQLj0BU05XSNQpFwimgGpaoUWfTXa?=
 =?us-ascii?Q?1+QLDnJ1We80l31XqvVeUs0O+MNuvh2ljdIWR7QeJh53T0IzxBWeeJBV7ZJe?=
 =?us-ascii?Q?eWPwCyrNmhOV0JF1uK6Y//PfDFB8UIIG8D/YnOibYDhIEutkV/1d0WN3SKMa?=
 =?us-ascii?Q?yuef1wj4m0cebdqTx0JKioRxExPFLK3APzP9fQaVqHhQoQl4TBEGSwwPhyCG?=
 =?us-ascii?Q?PQVZCS9BEC1ZA1vcscj/XfIVv3a1VkTSFUbMipSNS3b+2RQHK0E60I9V35Su?=
 =?us-ascii?Q?qXy7b2fzRV0wOkZbrtTHZi30LvAbLPQ7ZaThPw/i+HAXytPNPYHt0PlUZLOb?=
 =?us-ascii?Q?rlXIdml9G+5tmjxzvnge3WYgXn+VFI4VUpEpl3ZO6ji0MjDqIYDVXbrq89bK?=
 =?us-ascii?Q?c3kKCP00aLFLoyEGPGLPw0kVepuyLofGDMKqYKdldA75JSILzyJsGkLU6ItX?=
 =?us-ascii?Q?SV1SMibclF+KcOIFBmBXmjKKOqraGlutAHdoougTs3XNfY4SRIs79181HV84?=
 =?us-ascii?Q?x2e/eajEyLSv5L4Bj99a0Oga4rEH5jFqAs0ZEGtdIrRDH8pxskAI2fnhsZg/?=
 =?us-ascii?Q?p1iF4bzVMmT2LMRLDf7xqmsB06L0AI9GBQzn0bQC3KQhZPRvkfRpiouFKr5S?=
 =?us-ascii?Q?LUmLtMBPKcybo0OtQobWQSj/amHsG6KMIFzjvdBhWaVSMuaI9Lr38hM0ee50?=
 =?us-ascii?Q?oDvxg/ZdQO1geG3wpMTXDHp0Tme7eCPh7Km5391r9RQHrbFBOPfQFARD7aXe?=
 =?us-ascii?Q?E8Uq2XfXA15d3BQ1nZrh7AyaHS9ipcjqJ2oEPuTNbKqnBIn1Kp5PMXadUlYo?=
 =?us-ascii?Q?+FzrfDYP+0xqCOEFUIMlJAgoA1JljtGsW2XIlu+nT5Vz7EtncDR7PZWnFwFZ?=
 =?us-ascii?Q?YX+sFXa3SrYPQ5XjlXE5VtLJoGN9o2drEQ5VT7FTVFFvolnx9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5899.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X+LqvFC4wKvjtVMajZDe7pC8galr0IhzUGmpW5fgSlOTMIcpgfJ2GH1mEmUF?=
 =?us-ascii?Q?fOKUEZ+uNj8ie6AlRXlFGMMss1ZFdeX6GYci3TJGnI1KAdxVvPEJhVKc9pK5?=
 =?us-ascii?Q?99gEvkGTojHmhgKhkkTUl464tTvy6wgVUAMLB8HfZVar/Tf8It3ph6QJXyl/?=
 =?us-ascii?Q?Aua+rTDNO6TVd4PNkvooUcAGmb1724AGiwi9wbK/AcERxWLR3LzV4WlCYvsp?=
 =?us-ascii?Q?B5rThNiibZump9j3zIFZfrNwFllKIIVEmmwKBd8v/gUZRYPi3+0yfavU0xC1?=
 =?us-ascii?Q?LCBR7N4kl6VZrhPJSdMcqe1r3k1xFTXJll0dWgQGJkyNhSU5a5EUyX507H0a?=
 =?us-ascii?Q?8FUguOdaB+xBJPHJ/phOsyPYf/vmpHQ2Hq0tRaD3q/B1l9lYpNXL2orZGrCd?=
 =?us-ascii?Q?zOdK2Uin6CZtPR3LUgMLzDYacCR0+ZBKHl8dgI9OVnoYajk/JBfk+9fgN2xK?=
 =?us-ascii?Q?GgmNEUFeifjvS5GSQeqDdEmCXZfgfmrwwsPgAY3aKvWet9fE5VRRuo8ea9yB?=
 =?us-ascii?Q?MuyOeRiG1iFeCue15L5fPYg9LDEUPu+vg4oBRaeJvE3sFJEvJDY6/lFnOoKb?=
 =?us-ascii?Q?NT/dxrc7meCxdMIJIOl3PFwU4tQG2YLVJMeoQYZZlEMlEg3etbHEQplJsJBJ?=
 =?us-ascii?Q?lkfEcLb0ho5SCxrHi6pnA6R42kr7GRgextvuWOn/ZMBWqKkZ10ItnVg1Yr4m?=
 =?us-ascii?Q?RpZF7Q5AemBooqEVnCMsfua2qlAqS9IOv2fEM9uJNLXQZ2I0ju2JHkbADYXb?=
 =?us-ascii?Q?AZex8m3wIs4E0+jrNxPzhjUsuT1s4xZLMaMfZoEL/z4n8pa9JRzVTwMnrWP4?=
 =?us-ascii?Q?2JOXXXHm8ntJ5Xewn8pOq58yTY5UM9E8I7EliwfuxErLwazWTQM8SaqbGsei?=
 =?us-ascii?Q?5pnGX2eh7ye4h0+Dn2SMbcdBJ07Oy98NvaAexMb7cSMCIkTNVroGbxHoJMEz?=
 =?us-ascii?Q?i351zTO8/LoEFpYb2+IGfcaNcH7MIdcsafiCC02122sHJjvlwJ1200SC7K+s?=
 =?us-ascii?Q?a/+InYm2mEjRNuFOKat5JmDkgnc3xjnAB8TZwGYhdd+KRHzEvwZ5rdY1pKpQ?=
 =?us-ascii?Q?3mx04mIRHpprIGbXFEQOdr9XLoMYVniB4LCVEfP2CRXeHzAG8hFn4D6XnIOc?=
 =?us-ascii?Q?d/UjHlU9ZfntAKok6sr4pT4X3m3GAm4hUOMyahm62VC8AluZrZBFhdwkfwvw?=
 =?us-ascii?Q?QOi3N3PV3SkcLlIR73EP7FN2UAZOzPddJzj183w3M47oE3hyGk1v1xv+osRP?=
 =?us-ascii?Q?vkeKCFLawY7fb1piZ0ICjxh2s2N+Q9Fo+gRraSvqwyL3rJ5yM0BCkETZ+GcP?=
 =?us-ascii?Q?H7bfqXnmjLi0Z7abYGb6JvidWVEHejOnl8yCrGD5A+6Ur5p8vxRQuod2nvSF?=
 =?us-ascii?Q?EGsy7DJHpTEafHXpgFJ5rubvyMOQojPpbV+8lu9nymB2GPRkBdLk1il+paFV?=
 =?us-ascii?Q?PSrrFIuhZ7d6N48XxDYU0tXA3C//6G/uump1LsLQodEVrK5E/4mtDvvgqLNj?=
 =?us-ascii?Q?Isf+XCcC0siizTJQENe8YAbu+MQPUqXSTpJgcmKJpUADqOn8Vdhq3XAoYF5H?=
 =?us-ascii?Q?DPXZ4DwuDB14p/vBkCfbefo9MIw9BpjnZTQfMnlt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70d3c1f-8b2c-4afe-a448-08dcd2e2d070
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 04:24:38.3136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciriEMYQuCOaAaYV+SPpGeLrgbNyjKnEINzY+BuYhv2GkPxhnknO+lztyODQVFHdpVzq6aICmZDqvgSLr9u/ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5888
X-Mailman-Approved-At: Thu, 12 Sep 2024 07:08:16 +0000
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

Fixed some spelling errors, the details are as follows:

-in the code comments:
	collpase->collapse
	firwmare->firmware
	everwhere->everywhere

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_power.c | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index 7705f8010484..6b91e0bd1514 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -307,7 +307,7 @@ int a5xx_power_init(struct msm_gpu *gpu)
 	else if (adreno_is_a540(adreno_gpu))
 		a540_lm_setup(gpu);
 
-	/* Set up SP/TP power collpase */
+	/* Set up SP/TP power collapse */
 	a5xx_pc_init(gpu);
 
 	/* Start the GPMU */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 465a4cd14a43..076be0473eb5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -533,7 +533,7 @@ int adreno_load_fw(struct adreno_gpu *adreno_gpu)
 		if (!adreno_gpu->info->fw[i])
 			continue;
 
-		/* Skip loading GMU firwmare with GMU Wrapper */
+		/* Skip loading GMU firmware with GMU Wrapper */
 		if (adreno_has_gmu_wrapper(adreno_gpu) && i == ADRENO_FW_GMU)
 			continue;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 9d6655f96f0c..c803556a8f64 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -64,7 +64,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	char name[32];
 	int ret;
 
-	/* We assume everwhere that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
+	/* We assume everywhere that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
 	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
 
 	ring = kzalloc(sizeof(*ring), GFP_KERNEL);
-- 
2.17.1

