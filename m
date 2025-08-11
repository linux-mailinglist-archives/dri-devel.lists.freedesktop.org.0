Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB59B20313
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B96410E3A8;
	Mon, 11 Aug 2025 09:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="eZ67PQCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012015.outbound.protection.outlook.com [40.107.75.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D5410E3A8;
 Mon, 11 Aug 2025 09:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwxlHY6Mx89UyX3ADs8z15cq/ZYl/Kpgl1OFpk6xUipRa0H9JT1wnLrCgCMOhiX+8epTmBsl+ooMHYEgfalQHq/jZlIjc8PQY9u6BT+IxlIbBwYWijosGp9RMtaogmU58wSAEBm3aLtEvi8YNsFu18HbKmjsi/SVjmV5kPfw4R0uavQoNSO6WhN+Hls/5GYt+1n0jaUeoUHEHHPilWHPZ5Qw6Th05IQ1lf9OMVILX1J+S3UQS3L2wCD+NW1SNC1HBW4rExlF065Qa9mu0T9BGuIXhT7qHTsFzug0yn7iGhvloG12b4/kOiQnNJV0YtlP4A20yyvqtkYX7TwYBeMHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qh9G9NWFrxgWgWWI9vBLI3vhz0iKsvpfrx/gLvPymw=;
 b=doit2DeOHMVDyhZAH0LQbV1VuPVJBzoyY6DIISJaga6A+QAIWP3ARm5X84yPVTwjpg1j34986m9B7HVtKN/70mb8PVMlpwJUPCjB+LCyEATuWxPOA786USes8t0VIC5s+YUxhtWtn6o7/3pw1WbDdkBDHlZGynYvIqLtY/Hdx75qwXz2jE3aJ3XSen8d0sWxVfc4w7HZmSBJffmtzzRhINimzXMOFn7qlcTHGK2jkJx71iCC7ua2+6xFRzdZXFgYqNhzHij4wS9FzmxisrMlydfLlOqT1LWWE7wp7imWfxlcmVAu4lQLT+Ogdi5A9vukrN1GSljaXy+oq40cjHvdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qh9G9NWFrxgWgWWI9vBLI3vhz0iKsvpfrx/gLvPymw=;
 b=eZ67PQCxepEFX+8SaCkh4w/xVVu7gRfZIzO+CqkPdb21/eIMV8l3PDXOHk6F9M5IBSQvvv+fjwNSgpkAAYtS+8rePaOzhCkuFKxEPaGc47PDc7MpC+BdhzvTEb5xCqbkY0HwIaxLObzXEGCZqYi+lW6wgGOUO4zxOxustS9P0syyMuir3AvVSjrYRoQpUNyG9IzlP4aN6kRL7f42Bvjhe+X0OYgc/wFk0nQHZpwdRFvYsy7KTniJ+GMwErmCxTZ60rddqCvzYMJcLe3I7/Yy/cQVMZwT8UJrfc39l3u4eQ9313ynvzBrOrdApnUrH9q7LL8EisN7V46NnAsLLjiLzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5128.apcprd06.prod.outlook.com (2603:1096:400:1b3::9)
 by TYZPR06MB6189.apcprd06.prod.outlook.com (2603:1096:400:335::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 09:19:24 +0000
Received: from TY0PR06MB5128.apcprd06.prod.outlook.com
 ([fe80::cbca:4a56:fdcc:7f84]) by TY0PR06MB5128.apcprd06.prod.outlook.com
 ([fe80::cbca:4a56:fdcc:7f84%3]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 09:19:24 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Zhi Wang <zhiw@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Date: Mon, 11 Aug 2025 17:19:00 +0800
Message-Id: <20250811091910.404659-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To TY0PR06MB5128.apcprd06.prod.outlook.com
 (2603:1096:400:1b3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5128:EE_|TYZPR06MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 006be41b-fb68-4c60-23ab-08ddd8b8296d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cKSPcLaS+ufbxyI3TXeqX7SCKHNX26I1CjzkP3t1E4f61fQPsX+3iPWUJ5Lw?=
 =?us-ascii?Q?KbY90LMAaBLMfUctcvV9CsV2H5ZfQuVDDK7PTUPhia0PRDTfn3iIi9a+HoQq?=
 =?us-ascii?Q?mnikK9YchXUjfy5VPvY/4vn0GOSZXVAiWTPuz74mSnR6cMCAzS5qn/iDnXt5?=
 =?us-ascii?Q?v/bves7zagM4dvDQ4D6EyVVwZ8YzuwedKSkcR73RbXm53VSRwKVq5rXFUBQL?=
 =?us-ascii?Q?uRBQy3Br2gv6owG/eSsPYC/Ylrdn+wzPBAtE/Q504Bb9dKsTjzjTEdqf/odo?=
 =?us-ascii?Q?vT8b7ddSGrkixZ+hmHqZuKfCPV39ViD3Q3P6oV6pfIokmhsDeHTNQ2LQ1NH4?=
 =?us-ascii?Q?jGNGaubfotKy8b+UG2BxJBPQcBWh/AFRCrAuoDPmHWu1tNk0OCbXuDj8B0K1?=
 =?us-ascii?Q?uocPkaBIDRycXNxPJPZdIsOQVLxCSAOUQxq/9PRfmX0oLyLIemDYMI7T9+hH?=
 =?us-ascii?Q?dAriTVp5nlxpYSUUN14p65FcRGaVYAE/YF9qy3+uURqHsTlp3gV6ElgP3YZq?=
 =?us-ascii?Q?G4WLN7LzJ9qjB+57oUpKi9uUchTOWWEstOEC1BO88uJ8EgKHo05sG+e+ZLdQ?=
 =?us-ascii?Q?EPKsA346LV5tyQn4f4WH3tkDtYEuDVidBgSs6WCGyUPpCbKwgMC1E6NYflrx?=
 =?us-ascii?Q?79aacQNY5aemPgoutkFvPCSE2k0baofVvTJO1vpbb18MAb3SkpQ+G5o6PClI?=
 =?us-ascii?Q?2Xs8OwboPAMDjZSXa0Sm+qlmbQpbSEDWQirDINKcaElbrxieIL4V4SVdub/e?=
 =?us-ascii?Q?//ZdZZxOVHXGHp1h82h8leiVNcvxry3WWY35UwG9304lEUzBi8g+w6Sj8VQa?=
 =?us-ascii?Q?8sJWxMTa1raBSLHzRfkr4YZ0+UU2MgqPngF/FhZO7BENEN/gaLZjc0PMYw1T?=
 =?us-ascii?Q?kREYSguLOzE3VX1PlG0KIKPMVpqR0kBG+kAE4MVSAl2ICz3c9ReWrU7ppRWi?=
 =?us-ascii?Q?JSz6g+/OJdDHSSkgBVtIZFG667Wr+CYwBiXjMmXaffP4d3st+VhGHrQQaELd?=
 =?us-ascii?Q?BZUZMo5vN2Ed4DJepsL6VrtEBS52IreoVwhOW0DMTXlvIzImb6ZlvbiC+Y5M?=
 =?us-ascii?Q?7nRqDZUscOdw56DkH9M8ft4SnQooVbMw62fUhyPDngfvi/mMPodte88Ptb0h?=
 =?us-ascii?Q?Kdi0i5ozskQsPWCuzOVaYVapf1xVMpqr3t/Cdd9AHE3ZQpIeKGs7TpuNpEaI?=
 =?us-ascii?Q?JLPQTbmYlEFeCBA0h/k1Ma6mRVg4QsUCsDuHXSW8BmwdDk06y+V30ymkt989?=
 =?us-ascii?Q?WE6Rt4k5sFG48f86etoUr3qXo18MzntlvHjNbr59kFOzAtfC7k02suLlrDjv?=
 =?us-ascii?Q?nSlYikVqaJh97G5sU26Fnl6QmBohSmvw/voTzkT8kX6YqNH+lEiH3mudOnfv?=
 =?us-ascii?Q?IycttxO8pZnK9gHQq4+MZFPVmC4krvP7sxIPzhw8JQqLHLr8tysUT4a6+IME?=
 =?us-ascii?Q?1unM7tKZ6JfaV6ViJZm0oIWsqGApR5ziMQsgD5uHlPne/nPhms853ryQ71DT?=
 =?us-ascii?Q?hR+UGcNWn/vGuek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5128.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YbMOQ0PDfw5IDYQBnsfcJhhBV4mE1W8hIo+kp2vmTiSsxZIQW1MQK2iRVP+d?=
 =?us-ascii?Q?mxOYM49LMr+RCIU9egKxJW8/jnga5LlYBicwZ65jurUQCxxC4ywQSSuvpe1D?=
 =?us-ascii?Q?x5XLnfdWi+dyVjTtCfHEcG13HBIWibH/dW8RPvjapFrrvLGl7zG/Jl/7NzHc?=
 =?us-ascii?Q?2ZOnGWmlEll256SozX0aFXwQLlSBLvdThKQO8V7tqu8T5akLYJYpSwMl77ti?=
 =?us-ascii?Q?0hs/oYRZeE5Dv7u2bSZmJu52tVaqMBVyWO/RlMCgyS68vw9DnMDK1yJSj5Yt?=
 =?us-ascii?Q?RysIIZbBDUCMaOxxlltlLLaZiOEYfunJqpQvHJycGwYGPC+yDLdONGuFrJh9?=
 =?us-ascii?Q?X1I8DmfbQ/C4aI40lAaP/LY1bJoDrJjlBU5cnZ1Rx95TgLvOrmkhyWqxImyp?=
 =?us-ascii?Q?H1NvB/63OjIB2saZkhHVJaoE8cyLBEt9O9q6fF/eml2e94JEyaEeia33SopX?=
 =?us-ascii?Q?0SQbYmYffp3l3n2B1f/GoA3ZkoeHyBPwwNa/1jZ2Vbp3hQL/BNfoYXYOvSk1?=
 =?us-ascii?Q?zEgJJm+cwBBqi23buDGG5Trr+b37hFP/Mry2V6XrXF/OfSQ7iqQCCcRmmvmA?=
 =?us-ascii?Q?Nb1HfgPqOaGD4xe/wnre16TKwCcK89oUKt4wPkzSsHeHSv3latn1cv+eCgUe?=
 =?us-ascii?Q?YrrxN1/Ure6dT2EPD9QuVaH6T8tVFlYgUHn9uIb1kU8jWYgJwlfc1g07HxAB?=
 =?us-ascii?Q?hh7jyjbf+Mmxo6UcHlD0hyJwiIt4315XQ48OsSN+BKjt+VCNFRdocNCmnd82?=
 =?us-ascii?Q?ILv7aoos1uBjUAiO0x1QiSa7ox+EkY18Te1Dtuq5YvN+2Kk28DRj6KcRG94i?=
 =?us-ascii?Q?0MWr/NRa/bIMawkdQEVfTE5GZoPWZzYxmxoOnBfi7LB+eTcD2fkkcfQwh3hi?=
 =?us-ascii?Q?8nnypB1keWXOZ/9qOllVYo8Qyx88tpey1KYaZtrFSSsY+UOtH/YLMSdJX67+?=
 =?us-ascii?Q?HtJS31B2DKc0MTZjSrVVWvqGEobjU27MUO2mwskF1DtZvJYi88L/C/DC2dHw?=
 =?us-ascii?Q?3Iipmmx6s9y8YTcIoXidd6/0F9w8PWC45V4wP7QWEeP9xTDIh2/Ds+e2XEMj?=
 =?us-ascii?Q?ztXDDUPrszvFkxhIIf1ptJHNCvzEay51/Tm8EiKSIUGdYxnZda30GAkLgYWj?=
 =?us-ascii?Q?b7NIeBP9Mr+oCUGvxy5FguBfyjq7lRoKkQGgoE+wTi+HFzv0h+3BgwpdosnF?=
 =?us-ascii?Q?ouxlnXehEz2qmr7kuXQ4O/s/2beXPWgFUzrjKq3+T5Gyy6c6QprGViz/41i4?=
 =?us-ascii?Q?765gcRTc1wgdtfSdJVoUpAqIVUlYFvjldgFLMQmRAyQDKHoH2GKO+WO2CWfz?=
 =?us-ascii?Q?xgFm0MwwuCfJ2k7cq2QK4mubsQdsWpsE+SKrtWNFOQGfXbvrTtcW4LPJYk7t?=
 =?us-ascii?Q?XJl72BkMAqltiHSduUjqhja7uJIle940QufZnkgRbgv8am7sACWzDvVdaRb5?=
 =?us-ascii?Q?CuQbpureW25TplJRc5aLcAcbPoysKeb9Lv1qJzeUFL0Mol/tRo5AhlrgdCTM?=
 =?us-ascii?Q?Id9RYpkYe9JLaWwCLcBJgN4j19favs8ehwlWeVD6kEAvQ3pc3c7yLIC58MCD?=
 =?us-ascii?Q?lAdDmBX3xqDVf+SbsMc6xh3sXVjvB0YbBtGs0rCr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006be41b-fb68-4c60-23ab-08ddd8b8296d
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5128.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 09:19:23.9444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btBFdJgjkbRKM5oEJyxzAJbX0SA+MUimF5VwtthSgIPqS5WbXTx3jOUi5v224Su6jw+7kgsSs9ddkha1ZIN32w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6189
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

Replace kfree() with kvfree() for memory allocated by kvmalloc().

Compile-tested only.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 9d06ff722fea..0dc4782df8c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -325,7 +325,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 
 		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
 		if (IS_ERR_OR_NULL(rpc)) {
-			kfree(buf);
+			kvfree(buf);
 			return rpc;
 		}
 
@@ -334,7 +334,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 
 		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
 		if (IS_ERR_OR_NULL(rpc)) {
-			kfree(buf);
+			kvfree(buf);
 			return rpc;
 		}
 
-- 
2.34.1

