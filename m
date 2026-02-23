Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGxsNQhwnWlyQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:31:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B77184A32
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC59610E1C8;
	Tue, 24 Feb 2026 09:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k+g7/cjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A7510E1C8;
 Tue, 24 Feb 2026 09:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb3ChV46bcqBCYa68hLGzwxacCb4sETmGUgeK4N+kY/VQK0yRMwuOZJJAM7I/mV/VqZPOh7LJEzDCdrqo2XkzI/s4t9mJ5ahKrERORRxqBPArgN0HighRISj1islVAuNCKG1ZWIorZAz1m0uqHy44DKJqKxgDpQp2aTkTb6H0ooizAHIe4apSdvd272RgFRbYwsCrQhCkavKNGOPl8YYY71TY+2FwOz/KeRuOc3wNOXmuIu1ygMY7FiSxQuVkDVyRlArm7xTp3UYgFb1WF7aCOXuZWAwEN3zIWaJZQDv8tS+XDbSjOexUCnsslpWp1f6wEwcQ9RKoX7Rx8Juvf1cXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+51yilevSJ5b3oQ0HALqlc6znRMx58Bc13TCNuQ2LOU=;
 b=coYMWFIYP+Kc4irTFgTkG84DJCqUfVi1m/1wMTq844MsHC03D6YC9SJEUs2lFi4s5szEcNIVXVIwttzTkl61QnjG3ZrlDqDh5ZxhZXlJmQaY6Fkl4DedScfYFdc2IyYVj6FEzexih4lCQcU2z2XGB3ojcHBBHCJ3xJvf2u0uzX4qxat4Mfcy6Jc1PL4etpxqrk0HbnxxXG2HedbaKortpg1B/Kj+JvI60lUU0Eol4qXaOnvlaFUnXWY9B5CiC2jUPWL0R9/6+HkfY4YJnCVcMwWq3xc648zDdgqkodR2hynrY4yj2RRbLB/HLiES6+L5as5XdFV1/j9550nZFytYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+51yilevSJ5b3oQ0HALqlc6znRMx58Bc13TCNuQ2LOU=;
 b=k+g7/cjtoJ34jqBrQf71hnh8CpIv2DVjjxmDwyK+7OvT2r3AHrU5SSPnhRy3CuC1358nNNTkAT0Mjqy+88ZuBd8nu4vAC99HXuVb/PAdo6JEMQzVKFDjkmNCJDsNnebvAcTwiJ9ogkXAQY3h7xYHwLWIgoPy1wWOV6zW72e4meeJdii7KENMUyx++z9ICyjGv4YPa7km0uyn9TtKietqOwCd9V0bbscRzmXDJjeVg+4kgHocB+3djd5L6BJs2sAApoGI7EgOabcLaQNwKSgnXclf1ANA+Zm/OgPSXuK4kEiZI+yLdsqrRnho59bVSH2QzEsktVjHX3vjkaPwLxCjUA==
Received: from CH2PR19CA0019.namprd19.prod.outlook.com (2603:10b6:610:4d::29)
 by DS0PR12MB8456.namprd12.prod.outlook.com (2603:10b6:8:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 09:31:42 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::f7) by CH2PR19CA0019.outlook.office365.com
 (2603:10b6:610:4d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:31:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 01:31:23 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 01:31:22 -0800
Date: Mon, 23 Feb 2026 21:57:15 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, "Intel
 Graphics" <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20260223195715.GF10607@unreal>
References: <aZyhDuaF5vi05KBY@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aZyhDuaF5vi05KBY@sirena.org.uk>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DS0PR12MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e17f256-aabf-4c6a-bcc5-08de738784f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f2mN7yv4czVqogywa5a21lS/boQr4ft3zCzvDJXueC+i5bU9+0uv0w46xRPO?=
 =?us-ascii?Q?YM8u7sinK9/kAg8333b9gG0ZE9jtIJUCBlQ6bMQJeCki1VxPff+XRqifXCZl?=
 =?us-ascii?Q?DKaoZTf2poemGnEgsPMq+pVRqJsTtxwdEnP1blCW6u/vuTGg4nzcb6ReDadK?=
 =?us-ascii?Q?kA4fwp3BLrcoFzBnljKGbDakdk1zsFTm1Xb+ctdhVKfliy5bVoCdvB/3f5pb?=
 =?us-ascii?Q?Fv961O2qJIozdxYe14iZTpbUki/jPtU/2t29wV3+kzAzdVwMxuV68tI5+qYW?=
 =?us-ascii?Q?+VTwxchKdMVdl1qpg6YVYTfuXIf9fO9v3cnnetjKIk2jDJdNKxRtGBPFr6tc?=
 =?us-ascii?Q?+J9/VSiACph+Xba2GhZyTchCyeDZlIxotSlLnAgswCaQR1+O6xgkX7I4Pz4b?=
 =?us-ascii?Q?WMgVPGK/O0uUZQe7y67gWWQkzdMPYd2x4W1QTPjTqBRkBC0OB9W3sZ/+Js/M?=
 =?us-ascii?Q?ivdJqDgurdlDBu1+KXaiOs8QmYSXmjsrTiwIdE5C3tw5Fq7gQHBvy1/l2oia?=
 =?us-ascii?Q?leJjaTumbBP05m8tV4JAIECs3Z2O1nOqCJrPLJZtXXCFVKwH4Ud3zAG8u1i6?=
 =?us-ascii?Q?lNUv7ZLGLoDYdG5Rd39mpfyGx4va1XxQvsnbW18ZnMWEt9b5R3JwTeDdkuPW?=
 =?us-ascii?Q?fqFoFU80rMcKbAP8XGdqBTEJsGhvSVJq1FLRJnOCOGQTWDlVnMPfRfQkmb5x?=
 =?us-ascii?Q?y6ie4Er9qBhWDK5uwtFnjaRggBTn1XehTBMw3pXZUCYK+zqEWR2v7njZTz5L?=
 =?us-ascii?Q?puTlgJ2PtUtvStEhQCy81Mri1o/ns5Ts70gfU7550GnXGObn+2PltCHtuEYU?=
 =?us-ascii?Q?hELLoPKlslyrCkKxpjvNxBo0+27Q3tZhzyAjwxv3NaGQ6M7X8JSXvVNgaiie?=
 =?us-ascii?Q?SL7jNtxikmoT6GD/yPW+BNRFmF7LRzRCdqG7h5Em8j1ft8str6lj3c4P/Vff?=
 =?us-ascii?Q?Aq64+5sWIi1x4iNgUgSphlnJ2JRBAAtgWeC9cvJ6iXmIsbGaElzG5nJXeJkQ?=
 =?us-ascii?Q?6q/tKWGhbxZHH8I8wxLXgJGr78XxXDEovHND68DUF7jo+M9Ulp1gqKcZN9CL?=
 =?us-ascii?Q?wieXUERPVWwRw3zsD4RCj0hCIOEUOHE6t6HgcuhK8ZaDDRjMUcgfKZKE1jwL?=
 =?us-ascii?Q?HV2sELp3a2nejhJts6EG+45KJvMYSf4FeSrI8oWV4qjVZk5Z0h2rJbHwrfkz?=
 =?us-ascii?Q?E5kkGoTpn0KOorDjgMayfhw/+MnCSv6JOCb8LigLzne7pfGfTPUOx11gCavm?=
 =?us-ascii?Q?iP/hn4CXCp6BnfyNPTrLkjuQGeeUDGvoGWl8SbUg12UIfDLIT3ixt3761S8n?=
 =?us-ascii?Q?eekTJmZPgKvI3/jEYy6SshMq6VgFVRNseFX34j5PxUyMwm5A25zRHsEnvnrn?=
 =?us-ascii?Q?H2YjVGdOyRkyI7cJGcMy+u+AgnXbbX767KEP4rZYG0ihUKFuWhhT1MNm9cmt?=
 =?us-ascii?Q?ArIybqcpOa7w0735H8xfefG4oHOF9C3i6icTE93VJQsKnculDlOfyyNdczWy?=
 =?us-ascii?Q?NdwLgaAwKGG1YsbPtrNR+7fffHVf0t4GG9i/hw0WRfuXbWSfSl11p67+ihb8?=
 =?us-ascii?Q?6xHbQjnduDHhBv7XLUl8Vr1qsHDl2Q0a+ZeRW6sxsibmrjkvLGn20LxtpU6S?=
 =?us-ascii?Q?xXFjzmE7BEPIjvnnWPeyxTU/5XBoErN4CGSpXOcPGYsIWMrqDP3eTLKRvU9t?=
 =?us-ascii?Q?XwNNjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dhoO4rn+nCh+Qo9aCm8TcFAVoaLSHI2Gqx3Ks0nLS+EZPJ5YtpQYn3SGJAWzDXbMeSzMS6o015XYw7Sd6jy2FPVAKuoyTBCT/EIEKBtUpa1zUVut7DtdD1vtHwZV5buJ7eekfz/WejiseCOlIEL3LtCx+HIvOJQkMzcrUdx6QKkwTdh8HsOdeAccdrj7aqV6WElGOnbKQRcWp4I1cfFH37ZlZ7uPfSZb3DQ5WHhLn/xzE4fFVx3TFWQV7f85fbkVeZkDqtzZQhWq/3SLHdaldDi3HCsp5uq/6AeEWfDLywLyKj0Ibxg6g1/5DiIDY/7nQiaGYWo7pInxwCZTPnUQjjWecNJZS8XX18IN/8si0LPDSbyb1EeLOwzXZltibVdIsZTF/llczQ74Br+N7V4vNUPMlc2k35uB4q13qjg65JPaeX+A+lbMwIscpf6o7kdI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:31:42.0126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e17f256-aabf-4c6a-bcc5-08de738784f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8456
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leonro@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35B77184A32
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 06:48:46PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c: In function 'rdma_user_mmap_entry_remove':
> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c:249:17: error: implicit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-declaration]
>   249 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>       |                 ^~~~~~~~~~~~~~~~~~~
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/infiniband/core/ib_core_uverbs.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> /tmp/next/build/drivers/infiniband/core/uverbs_std_types_dmabuf.c: In function 'uverbs_dmabuf_fd_destroy_uobj':
> /tmp/next/build/drivers/infiniband/core/uverbs_std_types_dmabuf.c:170:17: error: implicit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-declaration]
>   170 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>       |                 ^~~~~~~~~~~~~~~~~~~
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/infiniband/core/uverbs_std_types_dmabuf.o] Error 1
> 
> Caused by commit
> 
>   95308225e5bae (dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidate_mappings())
> 
> interacting with
> 
>   0ac6f4056c4a2 (RDMA/uverbs: Add DMABUF object type and operations)
> 
> from Linus' tree.  I have fixed this up as below and can carry as
> needed.
> 
> From 89e7d4987e08a46f2db151cebba258a1bc01d628 Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Mon, 23 Feb 2026 18:27:51 +0000
> Subject: [PATCH] RDMA/uverbs: Update for semantic conflict with drm-misc
> 
> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c: In function 'rdma_user_mmap_entry_remove':
> /tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c:249:17: error: implicit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-declaration]
>   249 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
>       |                 ^~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/infiniband/core/ib_core_uverbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The change is correct. The
dma_buf_move_notify->dma_buf_invalidate_mappings rename was merged to
DRM tree before merge window and ib_core_uverbs change was brought
during merge window from RDMA tree.

Christian,

You should take this fix to your tree. RDMA tree doesn't have rename patches
yet.

Thanks

> 
> diff --git a/drivers/infiniband/core/ib_core_uverbs.c b/drivers/infiniband/core/ib_core_uverbs.c
> index d3836a62a0049..d6e99c79cf183 100644
> --- a/drivers/infiniband/core/ib_core_uverbs.c
> +++ b/drivers/infiniband/core/ib_core_uverbs.c
> @@ -246,7 +246,7 @@ void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
>  		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
>  		list_del(&uverbs_dmabuf->dmabufs_elm);
>  		uverbs_dmabuf->revoked = true;
> -		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
> +		dma_buf_invalidate_mappings(uverbs_dmabuf->dmabuf);
>  		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
>  				      DMA_RESV_USAGE_BOOKKEEP, false,
>  				      MAX_SCHEDULE_TIMEOUT);
> diff --git a/drivers/infiniband/core/uverbs_std_types_dmabuf.c b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
> index dfdfcd1d1a446..149220a1599cf 100644
> --- a/drivers/infiniband/core/uverbs_std_types_dmabuf.c
> +++ b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
> @@ -167,7 +167,7 @@ static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
>         if (!uverbs_dmabuf->revoked) {
>                 uverbs_dmabuf->revoked = true;
>                 list_del(&uverbs_dmabuf->dmabufs_elm);
> -               dma_buf_move_notify(uverbs_dmabuf->dmabuf);
> +               dma_buf_invalidate_mappings(uverbs_dmabuf->dmabuf);
>                 dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
>                                       DMA_RESV_USAGE_BOOKKEEP, false,
>                                       MAX_SCHEDULE_TIMEOUT);
> 
> -- 
> 2.47.3
> 


