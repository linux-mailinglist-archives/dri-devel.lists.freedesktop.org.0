Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB3A38710
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842CA10E4F2;
	Mon, 17 Feb 2025 14:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jMkZrKJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0581310E325;
 Mon, 17 Feb 2025 14:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1EYxkn99bUAZcZZLFzSU4pG5GQZhCnPxifoHUPMaMCcOrIKUqYDg5QERqB7fJH0UKohUQN+FqfuAclj2Jze+6Q4aqwDu24larULX7HaKXFw1L6tSX745OywdC787RO2udv0WEGkUg4CcNNCI+PIdk0F/bNgla5Ac0CA7Nopo+ApFuG+jJmm8gbR6IIpocaIXFgaUU+j/CvqHpoi0x4Rp/V26MHU2rkekTJ9iBNJqj8Qd1r3y+PBqUTe98hR+9aw0Yv5ERMPmvfFUbk9haXaNyz5+JoTeLGwAIy499cCnJ7z7E52qUcI3raftCcEqtpI5M97U+Eo3MU5y/TiWX9WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jArcG+k6KqGxZRuMIsTAGVcRrZ1lMSpjmDJ5UIhphTM=;
 b=khQPDigi/zu+q0nslf5V98NjOI/c21ulW/gkiFJL5g2EIs/qhGn1gb/bSWuwiXgnhHr2lleUw3noJAtMfFTarX3bbHKEnHXbpLSC8UnpABCLlJCbKOlvHc+l/CcDNcfpFTkha7rElVfkZn85qcYX92xaCfKRHdpv4xu6l2Ft6tp4n89uJgQNNQGZ3vrkTjNynrarV3MP2flhp66EYs0EWB0Spy73oMUFLXcyqFQY+1UfjfL3ieKVb6iYJ6LNh0u2Tu9U5WkZ53yJLZot5+99y0RrTaQejbRhuj5ntOzODmaUe4iZBnC+7Xc78S7thcyJhK8Oa7tWeHP9NIyP/xkMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jArcG+k6KqGxZRuMIsTAGVcRrZ1lMSpjmDJ5UIhphTM=;
 b=jMkZrKJmvU8Fw2/Sx/0/R2NZdTdojU1dumylafpodlPv1MHMTo8ZbAnf2+2BUF8X2f7WweqcMmYebVl8VMYS/1wjljTOx+lN3IzJCLKLvxp0vSzX+8j27H+Fbh8wFT7IoJ8wq85TxaGX8bLvob9UA2+g1y/60xKLdGwS25E2Y1szosEsEARt/i3kcskima6yf0DXjoRQF3AP3ZcEZ5JPjg7+ifD0vKfOrAep0pciXYC3dx5cx9vco4c9eUXzc3w8bsCGqH9OUsYS3YQN9ZF00gDXJB4KC+Bb6dzdPJvU1RU5no+nps7g9dQjSSFYwboxKk2sqnRYOpuFp4FTtJ3yfg==
Received: from CH2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:610:20::16)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 14:56:44 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::73) by CH2PR07CA0003.outlook.office365.com
 (2603:10b6:610:20::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Mon,
 17 Feb 2025 14:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 14:56:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Feb
 2025 06:56:38 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 06:56:37 -0800
Received: from localhost (10.127.8.10) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 17
 Feb 2025 06:56:34 -0800
Date: Mon, 17 Feb 2025 16:56:33 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Timur Tabi
 <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>, Ben Skeggs
 <bskeggs@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] drm/nouveau: Fix error pointer dereference in
 r535_gsp_msgq_recv()
Message-ID: <20250217165633.00004d13@nvidia.com>
In-Reply-To: <b7052ac0-98e4-433b-ad58-f563bf51858c@stanley.mountain>
References: <b7052ac0-98e4-433b-ad58-f563bf51858c@stanley.mountain>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a90c20-a251-48ab-763e-08dd4f634b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CtaytH1l302ifTzWhKoixVRzhZ1cUOVwMQs20wdhRVfUVyw5Hc6K1nZNzCpu?=
 =?us-ascii?Q?TO+5jC78UbZydE4PHZI2Pn8/ysW72+wZmW3P2lbPVixz5BRzSwGwhfjZot8a?=
 =?us-ascii?Q?ouBgklUGvaB0jyyRxqIYc3enwpY0k3wQ7V2fyP1KVRVbw9N0HkVWIKzNskvf?=
 =?us-ascii?Q?9Mm8Wz0CTu+VciSuGJXFzaRFUO+GODi4N5mTW/hMzAdMcb66J9ImAw0XB1Tn?=
 =?us-ascii?Q?Y1dm/5H/Q/UDxi0EYHQjcr+Mv3KwVmyL4N2NzUxHCiczPafSmHGGP2VhXC1X?=
 =?us-ascii?Q?Kt6BL74SZTg8Ygrmf0daFpFbhM8Hiac5n4Yt7JijfcSsUyVZwdleLwl6hhN4?=
 =?us-ascii?Q?5qDKThXEQnwbfD9R9bW+ab7cGEEDRowTmq5KzyCbNCFOfDdZ0oVxnHNfmtyM?=
 =?us-ascii?Q?vBiYbNyJkuxHxujBNK6tN4otSUMrnOd7Q8w9YnjQTPyQkQg4kkqJiZmMg3fb?=
 =?us-ascii?Q?5CYAjuhF3u9v+QVEJwGcc7fI0yK2AsTLrEMVJb841AUDrOCSj/Woxm71x/oa?=
 =?us-ascii?Q?MB/3BEvwL0qokiz7qKsNJdv+tl2rRPB5lPVqMXBiL56xFp36puFgSH6jKqYe?=
 =?us-ascii?Q?IK1LLqNLBNJl0z0mjKe3Hin5t4t7dVmPdq03INSpZ/XJAduQsoEMueAj8cux?=
 =?us-ascii?Q?CoiEIxJ1NcQQvIf1qXT3rWoL5/cUvWVUlNSUJGuvePDCV0K/yIQ+2pwghj6p?=
 =?us-ascii?Q?GEtIPNYGtwhLFt3pOe9oXyaZ36mdWcYuflkfqurcxTgsJk4i9OwT9iVg1fDy?=
 =?us-ascii?Q?z6XFYkF5AnjULv+aFS1iUn2IAitFKqspiGnTwIVUWH6OWTx+OZCGs9lO/G14?=
 =?us-ascii?Q?OfnRVSfQwSHBehARi+DpgsGgL1DWx2YYQ1rtB1fFJkjcnquQXGErNOkrWfO2?=
 =?us-ascii?Q?9uOsZ6z2RcBzatz1Me2I6VDoBVd486EEuQcdABQ26cqGX+o5L+t4pKG4rsLH?=
 =?us-ascii?Q?G9C5oaYkJB94yvNU4D4fYy7C4C3/x9WlzR0kySJlIo7VbniWYdjTvXa72ZcK?=
 =?us-ascii?Q?JzYIJADxw2XYY+XnS8SOdiYQhb8efYV9dO5DhBy7MrP6v0mez8ITO3BROGlG?=
 =?us-ascii?Q?7DL7RKBNr9GKXQygbuYAkxUyB7RCsr3wVCdTdpJb/0UcqBoFpIP6h5tavsim?=
 =?us-ascii?Q?9RnZDD/C4o1O4CNRlK4tgBf9+QX9nWeNdQ9UkYElrhM4NGGUflGaw2IeMVAs?=
 =?us-ascii?Q?YnqmEFYFfkCeEAp7Khc4BRdwu6uNbJJUfERzj3soY60NL/tnIt+jAEYyNq4n?=
 =?us-ascii?Q?f3inlbEP2nNDsdxwRtehYqwYedzlyci4QizS5g0+nR1YIaXoXDQwtKn7YsRT?=
 =?us-ascii?Q?UsXViBxh5e9RHsqEJ3tB7UyUzsWW4+lNFl8OiO7dMznz/mrRHpyegCq7meSX?=
 =?us-ascii?Q?7zrm+ACz+HnVrYWfEQIyqP3hXZKPHfS6wAaCeaToFS0XBBi2KTRerE8SdcIN?=
 =?us-ascii?Q?ZL/j2FshcYCf7HyuUMkhK0eihBApCAP+pWDybDI+NhkpA10qhEGeA9EOzbv8?=
 =?us-ascii?Q?2bBnWaaQiE72jVw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 14:56:44.1982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a90c20-a251-48ab-763e-08dd4f634b80
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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

On Mon, 17 Feb 2025 10:31:21 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

Thanks for catching this!

Acked-by: Zhi Wang <zhiw@nvidia.com>

> If "rpc" is an error pointer then return directly.  Otherwise it leads
> to an error pointer dereference.
> 
> Fixes: 50f290053d79 ("drm/nouveau: support handling the return of large GSP message")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 2075cad63805..db2602e88006 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -348,6 +348,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
>  	if (IS_ERR(buf)) {
>  		kvfree(info.gsp_rpc_buf);
>  		info.gsp_rpc_buf = NULL;
> +		return buf;
>  	}
>  
>  	if (expected <= max_rpc_size)

