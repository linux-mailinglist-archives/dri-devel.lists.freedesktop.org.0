Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEC0B247A9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6203810E0CB;
	Wed, 13 Aug 2025 10:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uEYqNj/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3949710E0CB;
 Wed, 13 Aug 2025 10:46:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkdXH6fYMwn2rshPmrI2E5gePsKHGM6A7UvFQuNvoMH5H6bnjVHHniR26ISblZkcLugLzatpYSFruyXlfC2XSW/ejrtHNwTFu/Tv2+aG8eNyq/UGCayFcU1wmQZ1yMBq8uvv+pWQQAvcVE+yIOWrUFoN0cHM4amh5G5wJIZp+TOcugjtHGNsnnSnbPSs/0KM1LczKD5xhV9e27/DEAwXTbk/7Fl3OZn8NulIENQLhWDkWDQfftid2I042fUH6JPp3pf1+UclUDczzB5/uXuSyBtT+g9eC30pCnm/tOxg+cgyMKomAwCNF7Tjo+W8Cvig2BTTEpPolMQ4iukER7uG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi6IbE1tsa5FQAI3D5l0OyfcvUdsv0FxooZijSMQZkU=;
 b=E2k7u4lIU/ynZ7zx2k7DAEUjOrLDHinJUBhWkogDJAXLhcS+9nCCaqhdhtfXXc0uMXzP4kl/SHYDfDxZJJLfaE0xI9zyZaTiu5GAd4QDq78P8e8F4FmoIMPTvdPotUx/8Nb09zFn/RklEXkIujt67/Y9ozryt7HyWhgAFBM+czSvw01dKJ+fSvI7tiMyzhQ7syWL9vFqv3acTrzY3KVgOyghIvbZdQEj7732WRleVkhmqra4fdcur0ED2CX8axGhvEA34pFEMhPzKq4q8/HB4Lec3jWXysZaniDGfmTZ8//qq4U0bBMPV3UcQ62PVArS+SuIsbVzS18Z2UyFOI0jcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vivo.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wi6IbE1tsa5FQAI3D5l0OyfcvUdsv0FxooZijSMQZkU=;
 b=uEYqNj/p0jhpFHY4+qdePwmaZig2b7MY0GM0Utf3F4nKFhbRn4diBRxy8NSLJPgbo46P3Js0wjcQoYmbC23juMeXB8pldQOago2WxLuiU51NrOpuYvT5VbujVfwuUg5nr/X29Vz1QAVD3jMauhCo17VPeRjE21UQbByhnilc7WqhSoXhMHQPIj5gfSWKaEpHXKMM+9fIzUIk3WQnQuFz0AqvRpe7dnv+GZ+90sZdV4lcxiIHSIqtXUrhpt+K/HuZaoN82gC+6YqbXvbC1Xh6g/rYSvd/IosFYTeUwtg9GnQjgY49OEGtoAE7O4H27QDqCVG3N9v6qePJmrBRyaeLHg==
Received: from IA1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::15)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 13 Aug
 2025 10:46:41 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:461:cafe::3f) by IA1P220CA0001.outlook.office365.com
 (2603:10b6:208:461::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Wed,
 13 Aug 2025 10:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 10:46:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 13 Aug
 2025 03:46:27 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 13 Aug
 2025 03:46:26 -0700
Received: from localhost (10.127.8.9) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 13 Aug
 2025 03:46:24 -0700
Date: Wed, 13 Aug 2025 13:46:22 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Message-ID: <20250813134622.000069a0@nvidia.com>
In-Reply-To: <20250811091910.404659-1-rongqianfeng@vivo.com>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|BL1PR12MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bea0430-6a3e-465e-2752-08ddda56b021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cNh3Am7leWWOzjFEyBXlwB1N9wjXpW92joBgPR7ScvVQdl2Ppp3/9CercSFk?=
 =?us-ascii?Q?kk3tyoamqMHdHZL7TVpRxlRBB3nPF1inS2BdKtgSBqnrayGEI6yZTuNZKB8a?=
 =?us-ascii?Q?AI5bT7OP4dmwk4zfPD7ERLMo1V9HyMFIbdO5yJBdSLmA5QZ26y1ULHciOzL1?=
 =?us-ascii?Q?VsMy+JqtFCG5eNEg8Hz/gA1PT/tgt6pbyFy6StANuN/uwYw33iJ3wnoEWGKG?=
 =?us-ascii?Q?zshLOgzh8s0IR9mwZ4OeORFvqrmgktnm5Y55e/t89Ul8FevVh8ddxal8WS8F?=
 =?us-ascii?Q?4O0iG51RCBJzhcEiWsoZVbAOdxjMm9MY3xuh3Uf2bHsUY+hHHl+/SKhfyLoy?=
 =?us-ascii?Q?fx78CTmgyf+dQNTw5WfG68B6oOH6OLEreo051njFzgKytq85hoBPuHe4KhGH?=
 =?us-ascii?Q?PE6JT+cKtZaoeFbdb95f+0Zf5K/IKWf53VJCTwC3cVxTzEO8P+2HWkXx+U6i?=
 =?us-ascii?Q?IU3xnTxnbvazuFJwkKxkhhCh8/Hr6kJVyIkg91c1lLTBPTV22e33HqJehW8N?=
 =?us-ascii?Q?TBznfSoOhO/ZGTsdvsOovcHQHYjQ2LnvguPB4OqZsnwbduC3kfyEby/C4IOi?=
 =?us-ascii?Q?lfB9nReP+mqFQxZqIL7GXh2b3RCyZqYuJwQeY33jfoXIDY0XT5GZS2co4Z48?=
 =?us-ascii?Q?bIWzrehCvkkwodecNd52x0sb68na3Ld+f8uPHmY1z58Yyjpy3icOTF1HSJKy?=
 =?us-ascii?Q?3Zq8X2WsR58hHCzriujL4zO44FozDoxkWp6DR5SByCwTFbwcoktg/RszbzhS?=
 =?us-ascii?Q?2V2HamRnwF/2XLyoka16B4gDrXW5cWTNfHWZzkajDNGGSQAnjQVQZy9Gp9bs?=
 =?us-ascii?Q?v0+AuDWHkiiCq3x0h1ZDFx6a0AmHN+AvMg2OdUMsuD7KRc9yMFoV8O1mdQUb?=
 =?us-ascii?Q?7SrPET/gMLtGrDEYaWgn5o77c68Cqc43IdfWeVhCNS1zj10C4qdk3g8+XywE?=
 =?us-ascii?Q?A+3liQoiPscjU6JVMkdsYO1frCTvVRx6dosLZqUN3lDFIPDsKGDLKvRL5eyO?=
 =?us-ascii?Q?bUV3aP8zncitJnXDLe04dmHA0/77xj7CTAh/49RadzcNX9DEumIylipAD5U8?=
 =?us-ascii?Q?DCtQyODv4Scm6YVsheEYpGNRmbjXIkqj+4285S61VoqKnsacVEHiL1IOcpiF?=
 =?us-ascii?Q?lMhJknsRA96OXFH2rJ2IIxqrwaAPVYogToNRLy73wKv72bVXiTkZHfW988jW?=
 =?us-ascii?Q?UTqYQEM0GS/RycVuUXex8G8VA3A/u1XUa7WnTYtToSLpYyCEOo0FzU29gQWJ?=
 =?us-ascii?Q?ZquEis+HpGNZj8W+0RyLmGzQ8SpSBIcfJQlZjPG+s+lPdLfB5Vb/NwW756j5?=
 =?us-ascii?Q?3YlKmcqkTm9llMduxHbYze960GtM+LG//XrWiqkhwuLKcq4GC2A0xhtiRZml?=
 =?us-ascii?Q?xtgIE0aDMJmfPxhJ2sizTOK6oJfHdnFPQkH1UTa4OjGVIPO7bn3KuXHm5uhz?=
 =?us-ascii?Q?5oxs3lCwEqUWcyffLUWX+9NfeDtybdRKe5Ds3PDGhY/eCUxWVpiFuSv/y0/s?=
 =?us-ascii?Q?N8Bg42TqKwhzVoRqjCtORbW+9Ijnox7CVGNF?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 10:46:41.1533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bea0430-6a3e-465e-2752-08ddda56b021
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851
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

On Mon, 11 Aug 2025 17:19:00 +0800
Qianfeng Rong <rongqianfeng@vivo.com> wrote:

Acked-by: Zhi Wang <zhiw@nvidia.com>

Please add a Fixes: tag.

> Replace kfree() with kvfree() for memory allocated by kvmalloc().
> 
> Compile-tested only.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
> index 9d06ff722fea..0dc4782df8c0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
> @@ -325,7 +325,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
>  
>  		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
>  		if (IS_ERR_OR_NULL(rpc)) {
> -			kfree(buf);
> +			kvfree(buf);
>  			return rpc;
>  		}
>  
> @@ -334,7 +334,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
>  
>  		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
>  		if (IS_ERR_OR_NULL(rpc)) {
> -			kfree(buf);
> +			kvfree(buf);
>  			return rpc;
>  		}
>  

