Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FD4940A89
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27BF10E4EA;
	Tue, 30 Jul 2024 07:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Lj9XAYVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2046.outbound.protection.outlook.com [40.107.215.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FE210E4EE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf7S6uYNuv6kxyx30fnD7OGu0Cs7uZvPiJVPSC+h4A6d/szezgwVLZ9+VpP5tFW2qaipegBWlLS5/Ym11vUqRTOQR7bugk6S13GhPc0JOBTZaxUdkQXwdvdfihjkVjnQM0KJkshLfxLgDbMUDlNO/6ouLxDdVCPK9taGVRRpnA+sC/bTNOfEj4Sq41bzkD52vcidgl5Yb/nY1K3+wtjvk2CKfgamUxilfCvl8jkbbPELape+X+aeakYQ3X+zMo0Ive4UYBve7rz/3OqAQ6b/BqpwihCJJ7Qdv1YsrcIYc1chQVqRHTnoI9YmhdsSwsLCiCCM2ALEBeon5nGIZO1Dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMhwemUUoB/3WcjWcxAIFyG/JasZnHDkItVkTKGRmO0=;
 b=xgjc5uXUQXVGkYzbHX3w+50ObcgBsaEYgpuRyimwVBQWd7lM93WMqw/b6HT/wiZDlHPDm28I0jNK259Jr6OP/1DO2BrFt7htxJBI0LCS9pBGEcVTD8gFWbgUxEjJ7R3Af/poib88A7pNSO7qPJyVMU3d6f7vu96y9r7KSGH6Wp1c2SlWVsb++sq/1yvqDZkUet7duFKCndGUN7V3ShLSAj+uihjNq5VPycdZwjtOG+P+20g+LOE2oCJJ3e9eCg8hswO31P2LOyGfHyA7LKfw/M62kbKGqiZhWbU3rrzZBr/paM896MxywQ2S1Vzrvt3z3/1zFhOOrBbuIUvYR9WxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMhwemUUoB/3WcjWcxAIFyG/JasZnHDkItVkTKGRmO0=;
 b=Lj9XAYVuZ8R6ZsK6zx5iUmEGPzgVqZztdiTqwePe0+mRi9tMrS3J/gxLYaYbNbcJpZg72WcOuYJIEfIku37IdXbVejsYfkTt8LxBdC//QpmCvG+ZVQSf6oH0OMCsU21vzZsCXP3XDDfGtrXTws2BQh3B2OucLK9oOHgFKkP98lCWqavu7cB5AtoZrBuhE+yB4MQ7ahIhG5cvhOc14EIQi2gmyGZFy/tV7kD0Dn3I9iI1c9fzF388pQQlDjDiZHJWisT6t8ZAA4BW263oU06sEF/rEcqOTbakSFt9MdXY4kU76a1ZvpFq6MeDSBoxRC4/hgbPnMttM8k49To89xVIig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI2PR06MB5386.apcprd06.prod.outlook.com (2603:1096:4:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 07:58:29 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:58:29 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 5/5] dma-buf: heaps: configurable async read gather limit
Date: Tue, 30 Jul 2024 15:57:49 +0800
Message-ID: <20240730075755.10941-6-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730075755.10941-1-link@vivo.com>
References: <20240730075755.10941-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SI2PR06MB5386:EE_
X-MS-Office365-Filtering-Correlation-Id: 99971946-0b0a-4192-4e2b-08dcb06d6652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kqaTSyl0nuEklRGXrlP6kU9dvC8CrjW13PytQsT3RiGLtmBXfrTROZAvgF/8?=
 =?us-ascii?Q?L9sMyvARcVpm25NcGgcqMnnTP87gtsuSD86DOL52pQM9V89Lx/YE9LeTdc5v?=
 =?us-ascii?Q?w2joHuOekp9kp0VTOpKYtbclcSToLjZzG49cb35mBfflywL1pec4g1BH95tK?=
 =?us-ascii?Q?Z31/AgwWt4H+RLnBV8ZX6VX8E4gYyTlex/waVjzS1gWZ9TG0tIFI5f7f9rkc?=
 =?us-ascii?Q?QlxsBG/rnw8a1pDpM+ee8GpBglzZUYqu+H0edxV8WN2h0p7L821n0YzPt7bX?=
 =?us-ascii?Q?HGxrx4rlzQ+TOL/apfoJ3Uju2SmhBrPx1wG+0YQQ2L4MEF3q8etDWAD6Pf/z?=
 =?us-ascii?Q?X8wWtyr6LXE0TjWqUeIIeKko0BTxPNh3K6u4HIQi9CLG5QkMq7uuyQ0EIMFk?=
 =?us-ascii?Q?wA2h4rIRo+ykxiAAbRy02jfZglpciln3coPT8UaT4q5PTj5nTDJXJdD3ckUG?=
 =?us-ascii?Q?84Yla0Erei1MLo0Ij531Lj4elmxdQbJdxHto2C4Ii4zxyNMsJ2rVM6hcaBoZ?=
 =?us-ascii?Q?Np2MoAYSLo5T8YpDzzOIa+tX9bglA1moqDHsTpuGxJg5OWqUWxP707CQ/Ff4?=
 =?us-ascii?Q?kWlsVZjOUA2z/vYqmiu+mLEtQjEHjzh3z9BRj6/EYK3qYQH+xIySPFUiDI/i?=
 =?us-ascii?Q?BJd7u2JhuOSuH9xpQQHnm0vB+lVkCJxR18Tymdwqel0wTWj4giwcDWaaqtKs?=
 =?us-ascii?Q?aLyvlVcbKgDcFjCxxXG6TDYlIF3edRK0vmiHtDk+LcYKOSvAFZd//Gyym3Ng?=
 =?us-ascii?Q?hXSjciiTKj6UXN2uQTCZ6xL9H/9XnTjadTFirORAMWiVc+HZ87/yK5X5dTOD?=
 =?us-ascii?Q?H0Qqsn3lZU9P58b/4l4FyA0HYEo8TLfM/f2ytF5AtN8XRZaYldZX5J3wejSD?=
 =?us-ascii?Q?L1PQ2/yb3Coc+qtPCqsg9p2XRY6EX0xD2zGjrxaTSZzImU+K4xt8ksGMC77Y?=
 =?us-ascii?Q?e9f3RBqws4sVmkZWGghfe2S5Cg2H2DdkqUtpdD4LPT9koltHsthxL/lKewrJ?=
 =?us-ascii?Q?G3nXRiB8ruha+RRkT7qEXxlW/yyMr4pif/IXgFzSE7vVqiCwxkL8avxbSOZ7?=
 =?us-ascii?Q?LgpHkk9MVTwu1UIAIlJlLGg6MliOjCXbf21wKMhV2MB+qJsxz9bi6GrtSKTs?=
 =?us-ascii?Q?LHCCVY6OxHnHvK4jx0uZtlCJz7EUktqJEscAPhtxf57ont6sB9y7CU7TNl4Z?=
 =?us-ascii?Q?9px5ABx7jrvsR9D+jM7p11ZMMvDlsyN6YMajIFsFT4nQgKsekfTtE0lUcNu5?=
 =?us-ascii?Q?DYqhBD3Qnn7Crb1AR5jDkXyIG1RJvyWDTmgm/gMiSgqnuB35x8OPR+YrPgrn?=
 =?us-ascii?Q?E201Dk++P5XaML8ytba2gmul4uVd8oStPwuD8xt/pzwzN0U5sivEzMCR+hlJ?=
 =?us-ascii?Q?21/SqqZKm5LJ+VDo1+5JKOkqYLCpI8oc6X+o9KFtfSyGsve842q4V2A1l8R+?=
 =?us-ascii?Q?BnypV7leHr0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZqK6JJojZC9m15E9DrjVKd37EPpsoTZyk8yLyqMyq0/eYI3e+qiFCKNOrJG?=
 =?us-ascii?Q?SAEJ5jpDBp5VP1f+OXIktT/RAy2SLXdnyG+4lnrEyToiuidh/UV/3PnpZpjz?=
 =?us-ascii?Q?8mEx0VsCEGtLOOluo7WzcB+KhpM1zO2DueJiSnXDxVXXtoCWAO6wvVg0UY7R?=
 =?us-ascii?Q?FV2oaxt2ND1FwFoHO/+YlV4yE4LAwmm2lAwRFJ/MA9ajA1ovcaAyVQftuogc?=
 =?us-ascii?Q?7TNsYqbnx/65zkAVno5/SKGBJAZHtv/sbpMHpibxDlHAoa5pi5zgT1mjziS0?=
 =?us-ascii?Q?FR8q1viriYIpvM5uPcr+Ci/J2dsjwbyBx4gHLQcMwr+0xVqBDA3AqEwSgbt9?=
 =?us-ascii?Q?pUpBSY971O6fkhA3HY+PYrD6jVVWkSjdTJ/WIf6Pkq6gygpuR7M2g4L9z4bd?=
 =?us-ascii?Q?7aZ810q6ozNe5ErsoJKG1mSXHC9fcMr0W0saqoBG4JBdr5K+udi/uLrdg0V0?=
 =?us-ascii?Q?U58Olzn45wGfJ0vpaW3jG/SkESspxALZ3gosON7MDUo02FQ7doVV5YU2moOz?=
 =?us-ascii?Q?lK7b8J0wnIXfTWkJnxQSqOr1OrgXS01dct79OpNeqJYcrEpUY/kwztHe8WBJ?=
 =?us-ascii?Q?blpfDTXZgtvbUeHoehfFCbdHFCoSYzDb3ZbQTYpeAYWKuc7+vnznrLb/SVBd?=
 =?us-ascii?Q?iI1m9tZQ0TSpvCd+3rSpkwJJxvl/OoEnnL4VdB9fI+19NXYbuBXEGFWz720g?=
 =?us-ascii?Q?q9xtzjJqMP31OQu7fvuKVLMtdxhTX41S/JmKebygjlwLM3PYG8o+cI1oil0V?=
 =?us-ascii?Q?CAa1Ga6fDZhhMGNO8ueDcXb2ueCWgq106gxtg4S2fch/tc+eQW1h1PwSzFZp?=
 =?us-ascii?Q?jwBB3WZZJQxfK+cNdQ65WSG2UpnL/9owXKNc3qBf/NyLsztQr/YNRW8YBppA?=
 =?us-ascii?Q?a1LK9mqFVE9/PnlrZgoupDTsFBsNCx1lYbQQhHKuXBU5NwWGpkZnta1AVEs7?=
 =?us-ascii?Q?3Y73hgijbW+rN61SHG5sPXWOoNIvDPaeghjwLqtlTW870zViOPD7X5veemo5?=
 =?us-ascii?Q?Joh8Gi5bPZkmiA3j4g/S+HpeUQxOYaCt6+HfcpV98Zh/Jcn8TsBzGR7DsYVi?=
 =?us-ascii?Q?BfAbLl+ksfggmkh1mxmlsSrHce0bU/igT3xTZ7qNweiIdSqRg/j3UQMetW1s?=
 =?us-ascii?Q?4d/KW/O3df9jZSrmc84HRT+kJQXSIk+wGFo7Usj135i2NaViFlSE1QvwlIoK?=
 =?us-ascii?Q?6EETWNTS808VUWqnaq94oMUPSskdlXRMni0lg5MXJ2V60HfCzbozrO0hXLxW?=
 =?us-ascii?Q?+ncxb5vZglqfhuYBGb9Z9g6AfV+yHYJ2jNIyFPActMygdm6D3EvGIQ5Ge3Ak?=
 =?us-ascii?Q?h3TmKCnHjjYIMYXWY0GAORiIjOTQNrQasLziaS0cVyRCslJbyggYoHLkKoeh?=
 =?us-ascii?Q?pyiDV816XBvaPJsvJcwKOv1QDRR8R4vVqOsDfhHti6jLV/DUgHyeLAAxqWfX?=
 =?us-ascii?Q?msXHJ/ayggNdBzrVIumTUqFaDXmWnsFOgdlrIYQprS7G0t7/KzoHUc9ezlKm?=
 =?us-ascii?Q?zR8CShWDmrw1MQMVP2y+5ZSt0MMdfPaW4lljsy2RAMBFvkMxIDhAycJ3dDjV?=
 =?us-ascii?Q?yyVSwBzNIf9GmrlaZC4hFPOMciH2/5ni7yDn0hpI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99971946-0b0a-4192-4e2b-08dcb06d6652
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:58:29.5867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CWGcnBzisIgCBGkZCAx3UWENPTN3tDJ2J4o0x2JGfS16XFkaKq0LMR/hkTiO2VsN117nOGTEzKXdrodMvDOEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5386
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

The current limit default is 128MB, which is a good experience value for
I/O reading. However, system administrators should be given a
considerable degree of freedom to adjust based on the system's
situation.

This patch exports the limit to the corresponding area of the dma-heap.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/dma-heap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index df1b2518f126..2b69cf3ca570 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -417,6 +417,11 @@ size_t dma_heap_file_size(struct dma_heap_file *heap_file)
 	return heap_file->fsize;
 }
 
+#define DEFAULT_DMA_BUF_HEAPS_GATHER_LIMIT (128 << 20)
+static int dma_buf_heaps_gather_limit = DEFAULT_DMA_BUF_HEAPS_GATHER_LIMIT;
+module_param_named(gather_limit, dma_buf_heaps_gather_limit, int, 0644);
+MODULE_PARM_DESC(gather_limit, "Asynchronous file reading, with a maximum limit on the amount to be gathered");
+
 static int init_dma_heap_file(struct dma_heap_file *heap_file, int file_fd)
 {
 	struct file *file;
@@ -442,9 +447,8 @@ static int init_dma_heap_file(struct dma_heap_file *heap_file, int file_fd)
 	}
 
 	heap_file->file = file;
-#define DEFAULT_DMA_BUF_HEAPS_GATHER_LIMIT (128 << 20)
 	heap_file->glimit = min_t(size_t, PAGE_ALIGN(fsz),
-				  DEFAULT_DMA_BUF_HEAPS_GATHER_LIMIT);
+				  PAGE_ALIGN(dma_buf_heaps_gather_limit));
 	heap_file->fsize = fsz;
 
 	heap_file->direct = file->f_flags & O_DIRECT;
-- 
2.45.2

