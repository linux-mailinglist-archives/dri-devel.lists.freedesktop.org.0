Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9878AB9C92
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2575B10EAAD;
	Fri, 16 May 2025 12:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VzYcp7dU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A75010EAAD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 12:50:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZZGRSanTmg6iwhMe7oGyogTjem71pdxHlLOOL+MI3a6k74CiXRp2pkrlnuuG24oTVp+Ow7cFHG8tz0xuMZs0v/PKeNH3XssoFBPvJPdWItWvCAk4BwgDh69+NQoQuTmqR8B93cS7c4DM20gZlLXXBk+DeIGNZiIcm79qSQnPncqyrcOZavAUg3Htj/pP9F1yczmDxHwl7XK8qnttj3Kb4uG2/KGuRNmWLW5Y7ROJVgCHqAkjYOIdektCjyjd7PJhBAasjrT2lXRIQ7NLempbSsJ0Gk4vcb+YE16+i7gFLvIPvt5sd+5z1LE2nKWaFlFjVUUvGBctdhpjcCQrCKvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCOliCDFiza2YXF/6yogjX8ZCITtgDW9sZwjVVE5EJQ=;
 b=O/ueFMTl93ZP2vrB5a2lYu6b8yBJEdPvZ8LGVx3pTM62Z09c5aMxzSscNufXNLMMwHlS0PFDCHQUMFtIsVxzhtSVMSUBmdmuR00fZBaBv+GUWsMKYOo1yXeYTnP2yU8hNzWln2ZeDFkP33veMbV0FGO1ZUrTgIqtZjENPJf5AvhRC42pHpFvd5Evtva0yV6wa5NCIyFcoKda5UwAqVtxGOaA9pikK9fLaKWLxQGDj4JoD+5oLvconJ0RJ8c5Y347ytDMPGzpcMpufGZH2LWMDHAwWoAq3LAQldzcdUwti/1x7XS02vSmwb3mhpNd6nqu3Wj6GvtKn3VBbNj0MJsvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCOliCDFiza2YXF/6yogjX8ZCITtgDW9sZwjVVE5EJQ=;
 b=VzYcp7dUV9Y4FZj6pXoQyafuHXBXOBavJbhc3wi1ffK87mk9w9WsAWOterkCyuCqApVxQBjBn7kC+hdtjZ9rfbEFr49dPXOIyxHegT4PdvGxFBSmHMCcza8VqNWZQcbLa20LFLMk/Zpbu6jai8yzqjm71pVYUcQX9dh/4avCtr+BOnfAz8prX27T/PC6sxRxZjBcrKciVNW5jgJZqukse4rJAHQmLNYkvY2PikSZthLFwFzg1ZOG4hIJjBT31gjI+iYeudUH6eUPVPM3ROAvW0GWhh46B2Wlqhx33eHjvajwsMHbbUH6O+JIds0CCYvF09RDXeR45kMzMRhXs6Rkfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 16 May
 2025 12:49:55 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 12:49:54 +0000
Date: Fri, 16 May 2025 09:49:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Zhi Wang <zhiw@nvidia.com>, Alexey Kardashevskiy <aik@amd.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <20250516124953.GD613512@nvidia.com>
References: <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
 <aCRmoDupzK9zTqFL@yilunxu-OptiPlex-7050>
 <20250514230502.6b64da7f.zhiw@nvidia.com>
 <aCYsNSFQJZzHVOFI@yilunxu-OptiPlex-7050>
 <20250515192127.GA580805@nvidia.com>
 <aCbZATrK7EPyH4qt@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCbZATrK7EPyH4qt@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 99866117-8bb5-455c-7975-08dd947827de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0A88D7Xk+4Dbcoa0kk5LY4CRSr3WKbN1QYlt1yWoEDxXzPBhjfJVtp2Yy70Y?=
 =?us-ascii?Q?zUz11APEe6lFpVGs+yeUiSpTj0mIgBnpo/kfpGHEvYtoZKUhLbQKjZMl1sEE?=
 =?us-ascii?Q?CV9td+Qee3912GrSa7VjI2rwSX37M+KjgE7QlYbf0dVRrlwuzIX2fDEJfAmE?=
 =?us-ascii?Q?5U9i+jOQiSLuQgiRai82kf/cVWWIqbxaWR8ZuzPZOtbO4E0sZmdR0VTzMH8h?=
 =?us-ascii?Q?vz00nwGeg+ZGvc++i5/wu2CfNwCOFwLRlCJu8/9OwprXgJAdqz/8x9TCL7OD?=
 =?us-ascii?Q?51JuCuxp+vntQSDica86aKKREJnGpWDKPXX2dw8CYdZosK72MgXpHl8JVC0d?=
 =?us-ascii?Q?73Wsoc2Pilt/JKr4GCTSVMnsPgmZLMQi3Q3pE1ksHyjgRqs5sKl7h9/dZHHZ?=
 =?us-ascii?Q?5oZuF7m7bNPfFIBFU3P2Q9gv5d+wWDT+elyxQaCGYVk/ruzEvhAViQYTa47C?=
 =?us-ascii?Q?LDAKS1AYyzvz5nuKNCgYmIBJESsoMtI5OHZ39/+gzegWQszJGjSGQcVFfgfd?=
 =?us-ascii?Q?WKE0cRbY/MqDFENIrh4rYFoW8lj0IqnDdnfPhh2yD0+AoDppCsbQCkLq4nb1?=
 =?us-ascii?Q?QCwz7GORKJhNmbdhaSAftCzGHZi0SbkzOMhdvJEyA+QqZ8jPInkU98tLCJez?=
 =?us-ascii?Q?T2XFOX5VT2YyKO19J6lyXJnH0w3qr8IXbQy6/0ahKikb4aR6pOWLb6xvwDRY?=
 =?us-ascii?Q?F4yzjvQwN0qOQ0x0MVEhuRcWmeLbeshyh7/cKS+ZFP6KZ/j9FeeM1FMJtdhE?=
 =?us-ascii?Q?iGCDCVQyHFX96jSaU9l2huSIWbADOrU+5mfZ8CpMcwtU+soxueEHNyQl1Von?=
 =?us-ascii?Q?91t7lvYpBAQcf+ggO99EH5zWblwNgQCAzwYt1Z8voCDoahtrYUZks9M+FVIK?=
 =?us-ascii?Q?0t3jUkYT0vcnzTPz3h35Kgaq4WyR0eC9UjMTJ0nCnNyxwXokkkljBUKv42Ib?=
 =?us-ascii?Q?ki1o2CZOB783irbyzS1V2znb1kKx/Y4oGXWemCEBtJeR46eHlwW5IoA/jDYr?=
 =?us-ascii?Q?6EZy0Heb5j+okEOeprp2jGHS5lc1zLFv4blKBKcO1J21NJNfhZtCAxqYIzUF?=
 =?us-ascii?Q?wSwZec69g0bUMaXurPv3Je/LObXvsc6NiCWF50VH14WlfGK2uGFe4M50UGYW?=
 =?us-ascii?Q?MiymA/rokXkXwNtIeroSNDxt2ZxIIS375xPBo1xvaa6kfhYWEmUZ6ydiHHU/?=
 =?us-ascii?Q?vqb8BL20SyMOGUFfZxn0Tv+eVHmwHe5e1nGJYlWCqX2fDe+sgfXVDFkDqlRo?=
 =?us-ascii?Q?RD4rPqzOmq/v9zJB+rBvZFw43UeANuyjyYGHOclcW5vjcefxgghj4jb16Har?=
 =?us-ascii?Q?U8NlWa40wQv7DEVMslb0BXpUYZoAs1tXRWmb/K1j2oxUmw/4QziHBawfyIBB?=
 =?us-ascii?Q?Fidxp8MS1VqMllg4fyYc3nJ71ed1KgCsFvQ2GlSUpuYR1zkaSY/tjtJrVnBh?=
 =?us-ascii?Q?N0a533mpn3g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LGVK2F8W0Wm3fJq3ZH963qAVxDpJoZRHn4o5ndnnNZH/Njvb7ymARfuw+Czd?=
 =?us-ascii?Q?rU6fY25yEtam3E6LXUVvmWcc2WylEzpf83sB+Ot4GwHFAIfMQSTR8nhWrgnb?=
 =?us-ascii?Q?m4rcBXdsv/PpVq7jqo0JZ+FlzoZd9RBFiIUp04odOR5kP3cA3Ku5ktCoxQrd?=
 =?us-ascii?Q?7mhCdLGNWPpfqLMOCwfpg1OfUWqESkMMIkuYetsGuN9Jf0Wj6c3mcnKwCiR7?=
 =?us-ascii?Q?OBVvHfUewD9FCZgpEtyDWW23nIyf4bfXYNwQpzfF3mgaicWutsgnVjWijEAT?=
 =?us-ascii?Q?50AtqDWBGt8Fa2kDU0CxnG8+BhudVe4R9mAiQX0cwapU8d3PnE5Ah8QhheO9?=
 =?us-ascii?Q?DXaE3QJcSPZmXpqMd5U92ecN2js83z0bcqyjaVBxnTyj7FU4KZsX5Sp7yDDy?=
 =?us-ascii?Q?u/FqbiWlIpZbI366Z9ev41YeQJsutysF/QLqv/MRUmD5N50zSJ2fxaVIw4EH?=
 =?us-ascii?Q?b9EZ1X/TcKmlFiMMXl73xRRYsLPu3IRNpJAQKhqSlOq1g0sjCrWh4rBhuS08?=
 =?us-ascii?Q?PC8XBkHmJO1f26bx2egFq9nonFXHwHItp6ALJE+Nj8LO8IgbYgim5HVbeVcQ?=
 =?us-ascii?Q?4fRrMQX6vPrR0MaOFP7CuzXuCgt/B87G3VAxfOS0wS/70YcUwaiFOITqjsqs?=
 =?us-ascii?Q?jMavqJ+D+qHlv+5bFlxLfiVz1vStPbR2H4GNmPPdydSxbfXvryRPupu83J2I?=
 =?us-ascii?Q?jtNVn70+3k1iDTkw4vSBEHYcizEoP0My4+bCWy8nC0EvQEjLdRyB5MqC1B3c?=
 =?us-ascii?Q?gSdUEi1ZvExUQaicrVVJ7CKG4ltYW6sA0+3NT9wf4qJmFmGvvKQR8Bu02Bx2?=
 =?us-ascii?Q?5uu235zAA1l4xNl0mlWiqam3dZxIx+ZLzbdp1i6N8pLIgtcPbzYKISQVrhwj?=
 =?us-ascii?Q?GASA5nc30bbVRL2QveY7fym+ItFOVXaN94HuucZGS5YrtU/+j0ddVFomRgZ/?=
 =?us-ascii?Q?P/VMNInvVl57yJDsY4Q2CiI0WEYPgcDTzG+MgX9VWZsGjekLiPWciAQnkm0X?=
 =?us-ascii?Q?58aQYmpPpvG+EumBIVsOt5/Ak1OsQkrmsMSpNOouQQ3bmYRSbI64C5YnhU0o?=
 =?us-ascii?Q?qNkrR9ikpV5BdFDYb1sBzbQojEbYikYKjyjRA137a8Kbr1Xbm8yGwgFTVaKf?=
 =?us-ascii?Q?kCbHlZz3qLhe0jrKnNTVE063hrrdF2yfIwJ//DKtwFM1GPakbnRKf3GgItcK?=
 =?us-ascii?Q?LycW0tLTZ0rePXdEL+YO4tHUy1oe5P5BkTtPQZvLqHZduOrDq2SXa4Gekigk?=
 =?us-ascii?Q?bzusr7gpP6c65BVxD4papYI7WmyvyCLujluSuMgrOTBWw8HiWnymc9cwV0kH?=
 =?us-ascii?Q?f6QScR0RRbujCtJw/DXa4w/XlETbpurBKkU4c2rkncq+yrHRykYYo8zATLT2?=
 =?us-ascii?Q?1LnlXep6JKSLfE89xAuqC0dHsgdglZ6bfVjQE2E2BqaZYfTYIuDpE3KfJvB4?=
 =?us-ascii?Q?tvAmTjkCs/qHQTW7Yk6ZwiOFT7EU9kzThORcgcymRezw/RvVXY3gGB2C7pP3?=
 =?us-ascii?Q?zobk7N238b4zs5M+gHQ99tl8UlHsR1Krmf54uyVPdigca/LG9gx7Qe9fXD94?=
 =?us-ascii?Q?bxnKHikjOdKIOq/6oXWPQ0tdT31QZF7G3xm500mz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99866117-8bb5-455c-7975-08dd947827de
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:49:54.4226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHDieHybEthLyfPYmZGKux0H70WkxopgOQkWV1RZOpH6ipjgKvxAGwv7uUgjSCwU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407
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

On Fri, May 16, 2025 at 02:19:45PM +0800, Xu Yilun wrote:
> > I don't know why you'd disable a viommu while the VM is running,
> > doesn't make sense.
> 
> Here it means remove the CC setup for viommu, shared setup is still
> kept.

That might makes sense for the vPCI function, but not the vIOMMU. A
secure VIOMMU needs to be running at all times while the guest is
running. Perhaps it has no devices it can be used with, but it's
functionality has to be there because a driver in the VM will be
connected to it.

At most "bind" should only tell the already existing secure vIOMMU
that it is allowed to translate for a specific vPCI function.

Jason
