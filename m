Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17823CAE9EC
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 02:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EF510E470;
	Tue,  9 Dec 2025 01:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KPTADJRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450CF10E45E;
 Tue,  9 Dec 2025 01:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhvDW2ij1gSUVSHceNfFMN8UBzn6an18SxkiXsWQx8wfD9XgitYJCW7+lEdQpBm3Ydsv1ynn+wL8MSwhK4heU/AulkGZjFC8McS1iD8KaT6Hf3q4GIx9dKhvMZnuVTHo2dG+RQTyE4eFlvTK37/ZpiYcCc6DLRgvlSouIZnYDTqY/B5HBd1j0wP/mGIBY1Iypbvzfry3ShSx4BMjyK4jUD9Sp8eL1/eP7My9UQZBdcb4XUK5O7+pkqa5UI5vCJEJ9FfbQdHchGMnY6AHtudkuBD5o891KJee8o2VB30BWtpC0LuI43LVXLGgCXnjNHFYxvXK5hupOY4AI73MzV18FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv8IZMdjgjxvY5WOrSzpruAqgreQS3i7lQqFLK9+zk0=;
 b=v6kHVqAsvxmXqnt//4rF6eRPypozDv+auNgSWTtmYPqfxiudhXGHTHskYbx5nLU0EvHSHPDpg/3j6p65Px2Km0ITkpjHAHjE01kozESRybZNx0uIUx9jRnnFj7rMOZUkAYOBoximpy9HaKhqHW6K3YflD55rw1jrkNpqVS0Rx5/WgRS3rYCALpExutuw/82hhrweM4+dhoal8FyEdhSS9LJYm5knNJl/zwTZCuwarWsIoWrat33X/H8c+j6wy7rStbFHM00xIYSpRISdv2/tpxOWBq6Aa/6G0eWIymEKdyBhejj8MQMmbHbbLHhJmxwon98HHD1eveTrhjqZMICbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv8IZMdjgjxvY5WOrSzpruAqgreQS3i7lQqFLK9+zk0=;
 b=KPTADJRpoemjXCI031uTsjbnAJgxZdFJPBC8gdLQ5k7eDnsbk199ZX8MCUkdqy+qVfwxJM51Iv5Nl1ZXU8N95drQjKcCbyx7R0YBWjvGd+GKwpngD5EZnUMy99w8MtYd2RxXY7WKF5OCeiBj5XzuzB1mOPoPCg7iSu5eYpyJf4Iir2K1MV5lj7vBAng+SVDe+NsVTBWUVGTYH/QqhbBUoN4IwgW4PjRv7vtItKS5OxOlBsc16hOC+yXajsJtNa1W/WzIEbJ4gcrr22eRtlYsKW6MJouqHPl9+939cA7che3agdFvLdgWlDv4DMyGi6Ny7TD/rS7CcbBzNwBxWzWEdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA5PPFB9BA66B77.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8df)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 01:26:32 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 01:26:32 +0000
Date: Tue, 9 Dec 2025 12:26:27 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/9] gpu: nova-core: gsp: remove unnecessary Display impls
Message-ID: <pjir6td3umd42nbowidfyxehentayumx2nc7rkxos5d3gjcayn@cvjvelmcj7ib>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-2-a3ce01376169@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-nova-misc-v1-2-a3ce01376169@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0160.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA5PPFB9BA66B77:EE_
X-MS-Office365-Filtering-Correlation-Id: af2deb44-d71f-466c-35a6-08de36c1fc4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i7134kvOdHcA56yMRC/nLSWpcZX1WYf9W1h3GX6TGWK7UtJKh7jsITVfNblo?=
 =?us-ascii?Q?43jFrA2xlOYCxDljstipCPdp7D16mVNXhXbz1bWdoMSxA6PGXTICFdoL0F/T?=
 =?us-ascii?Q?TUZH3XwVctfDqiqmDQlE9hQBHgmNDPMvHY0tVVrVO3yPGKCh3omezh0FTRGr?=
 =?us-ascii?Q?jwDezpeUYiXVrmB3e+kP5UX8HhAIb4q86gVLOec6Dv1hJEKbCYhNOuMlD2BB?=
 =?us-ascii?Q?AC/3RxJm65Z6GqyJBPJmHND2w2dnw/kekbi8BYfkme/e29sDeV5kyAlPKinf?=
 =?us-ascii?Q?YV04+OdQlTvF0YxcYmM4Ums6XR2xzAfcPSRUgCPKawiItZ2beOvkqbzH74pd?=
 =?us-ascii?Q?+k6OSo+caOl4FoV/MgYQ25ENZ9lqIwLn9wGV/QmHGjbEvodZ5J4ag3vN5Bov?=
 =?us-ascii?Q?J9YLwUIjESUEaY01I07P/cyl9xfKc/e+B/mOgeSGy/H19YMRFWdY7qrhKQGa?=
 =?us-ascii?Q?DE0CbPcXRYOoMzjFEUT8R0t066qj7y58xg7WxmbW5Y3tJLcA2imeLVbvG+Bt?=
 =?us-ascii?Q?6kNc8/2aVUnNi7hLH0yVC5YG3Z4ZUd0HSojPB5eGKsNJqtWoIjmDCtnM67G5?=
 =?us-ascii?Q?ZzFxiLrh/QNfWXYxNa9qn//9Ly94qd8Tsgx30HTTKwAmPLS+lT3PQWnuS7O1?=
 =?us-ascii?Q?KuI6D1gJZH/graAJkIeOXjo6i/noukI8AeAQEmBNwapwdYLkLqQdKUyh1c5d?=
 =?us-ascii?Q?NS1NtBX3PXrdR+/f3wCzzsD+RfVOQEOCnyad+3qrQZPgE1uh08Qyx0SgIfPS?=
 =?us-ascii?Q?ugrd9137b/ZuvVJisz1U8ifWhNorxW2IEIRifkDcQf6bl4arQqy/O88PJDny?=
 =?us-ascii?Q?3FkFdgViqc3wWbksCPCMeOzJRmoT23d+/yVbCFAZhGidnvLG6fcCwL86oOQB?=
 =?us-ascii?Q?JZkr9Szm2sjY4wDtrVWMuvN7bt9JPxv7glnZaWF4wCIsbmKCL5zPA7LCd8jN?=
 =?us-ascii?Q?6zznFLNqWyqhkcbChLKEt7BD2y24DddB880bOEq+LVr/FSO4x7AU+SLRrEVv?=
 =?us-ascii?Q?nSHX8uPu5HLRDxlhGT6PPwvdAZG5kmw10S+C4vh7lQmvhLkPc6Rwp6PJYeLw?=
 =?us-ascii?Q?QBazYL7C960UXYeVftHiBURBxsepMBmIR/kYBoD5NfgpJYgF2L/64gf99/Y+?=
 =?us-ascii?Q?598RLXqv+6l0iunU1U0FXp25+d8jw/+Xkb5/goXwVof5ObZX6yrMS5U4HXyL?=
 =?us-ascii?Q?2c/9h0RM7JW0IbDJ8jHdAJa7c03UFlQvmXrsS/Pz5IB5OfGeC32BygEWwEUY?=
 =?us-ascii?Q?V9ygZBfuRoAUYItAbDNgN5vCJ3GyDapDUp8mGUQH4hcOPM/2QPe3O+DeueOn?=
 =?us-ascii?Q?iTbxOAGNQsBQJlLu0rcNeS6SYZkznwwIjX/ezi8fwCTWCPMnRn96nbhbxiuW?=
 =?us-ascii?Q?DLd0roIM4sXzAJNTGd4QcPTzux6/vBJdutXIXwdNyZbf2ZZNE+dDZ8U0pKMu?=
 =?us-ascii?Q?/8Qa4zxTekp4xZb53hEai/qrW8GChU1e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXd37Bylc7tHmionCvWSELQChDaZ7tdLjWpmJyursG5qHCnbJQKtzxdswmyR?=
 =?us-ascii?Q?JBVgs2uwZB4pvg/Fl2paXNH6G7XD7soz+IlArBTKDEzDysrjM5KK2lP+z9k+?=
 =?us-ascii?Q?uE1dy8NhyDblch09t3XoqZl3mVbReks4b/FR/5rG87i5FadBTZYPHFw5g2S9?=
 =?us-ascii?Q?nFSUllEQmDoHx6kTcrFkjPQQYUvHQIOgZFQdT5K6/6LVGxAT5bxf+fxhxAxp?=
 =?us-ascii?Q?usk7oVHs2rbV66+bw4eCGe7amfJkzonuCHh+zl2jazzS5e+z/lvQ0HzyQPSE?=
 =?us-ascii?Q?GqMIaWec5hqMSibyBEQnRT3CP52QMevb38O9YKm5VCMLaZOefhAGFT4qsJqa?=
 =?us-ascii?Q?Djj5Jpqru5UNCpVDrh/rLa+CBdXo/7Zb8RKBpCEuli67jj5HGMUJ5OYwZeTC?=
 =?us-ascii?Q?Ikh/p0JIua7yV1rSk4qjjUuQgvnAJeCHBU0BLBlyDjUlXFI8c/y3K8sljfwO?=
 =?us-ascii?Q?DLjcwyQNuEFedYnAikaAROMbHR+JHFY27quCGiMGsNDUdKZuUpYAcZYplHFn?=
 =?us-ascii?Q?j07QGSrqnAjvJlrWOZZjs6ahblk+heUmXlbFCPfPh6eLBpLSucoRFoQsJSw3?=
 =?us-ascii?Q?Oi2vnlvcMsMDr7lKpZ4K+ZM5LTI0bn8nD+cUoUMC759toDHfr6n8pDpC8WQ2?=
 =?us-ascii?Q?ATKlv2Kl7T1BakmV4+42qoSt+BSiBNHCfsmj8YIrIKZkTfd8ZtA/t/HgxwC6?=
 =?us-ascii?Q?AdUpyAGUNeLFtYYldnDtrWGO0MbPZr8SMIxwujFjF3C/u8t9nLOO428yfNkU?=
 =?us-ascii?Q?lyHNkMcBGTw/qAaOeKNSUUs0eYL4QEd85y1eZj2uq7Fbvn1xWQZbXdJgy2CG?=
 =?us-ascii?Q?vgqf8VT7FOUKhGxPpGfHIe3Jbg2fATScT5f+HZQ717RmlzLS2PkKj1ZGASPD?=
 =?us-ascii?Q?GkbYq+mneNOIEXsU3RThjm69HSNtT2ixkzC1UAel7ThFr7TstnYzIyW1y+X9?=
 =?us-ascii?Q?auLhosSGoX+UQaZF6qbqkvUpOJLZqBVOAMRsbmv2FIhX+Zz4SrtOMwt5uWxh?=
 =?us-ascii?Q?31NRVRjeh1BW6TjYhpdS8waG3YX5CY7cH4yEK9+YX18vVscRVNtSrnXP333Y?=
 =?us-ascii?Q?PzEGkNEW1gLFJ2LW33cHnStxaRPQxwuTdAI4pTYAVOportsJfxZZm47euJz7?=
 =?us-ascii?Q?/j76UERS29I4SURMdcE00T9ALZ8ZCcnWCzGCI+QRvq5wdrkpbfez+QDva4Jk?=
 =?us-ascii?Q?7quZa5WLJAFGmHLj0ZKD7c6KHyO0Xs4x1rzc+cxqdz/S1xy6lUnYlDAan6gu?=
 =?us-ascii?Q?rBnUcAyYzC5I14UP1o5s1VxyTb/sx8BMRoFaUIwDawjtyVq8+mxVkiN+SmXy?=
 =?us-ascii?Q?XfHaEgs+me67n/584fGEAJZ1tT+5IxF40cUfuIJxbdxhgzUwY8fWDItV+YnP?=
 =?us-ascii?Q?dubwB1QfFSlopGxuNDeF5kcHcYLcDHw6rMg8XQ1sNzSf4lXivvr51DQphtVZ?=
 =?us-ascii?Q?n+HnDQVGwcs5Nf9xP1MTRhEcRH+0UYKTEg0DuntlIBU1CB/f3s5vmMmIjYW0?=
 =?us-ascii?Q?J/Tilji27QEe7iYdFoFJOTQ5dbNaZyYgS/IGenMmkV//z5tMXxYqjImMxPRJ?=
 =?us-ascii?Q?ywZogjgPNoMextHNdam0kK/3BA6HdrPsBj59keTr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2deb44-d71f-466c-35a6-08de36c1fc4d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 01:26:32.6205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjv6jgzV+pDTkN0tJYmQIBWY4yh5DnzxXznAYjlvyse4RtMzhSkH+nuDboFM5zM5TIxoJjh/N+twDzeCTBTF5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB9BA66B77
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

On 2025-12-08 at 20:26 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> We only ever display these in debug context, for which the automatically
> derived `Debug` impls work just fine - so use them and remove these
> boilerplate-looking implementations.

Nice.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs |  2 +-
>  drivers/gpu/nova-core/gsp/fw.rs   | 54 ---------------------------------------
>  2 files changed, 1 insertion(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> index 5ce85ee1ffce..fa983a3f480c 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -531,7 +531,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
>  
>          dev_dbg!(
>              &self.dev,
> -            "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
> +            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
>              self.seq,
>              M::FUNCTION,
>              dst.header.length(),
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> index 3baa5455cc32..24e4eaaf1265 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -10,7 +10,6 @@
>  
>  use kernel::{
>      dma::CoherentAllocation,
> -    fmt,
>      prelude::*,
>      ptr::{
>          Alignable,
> @@ -223,43 +222,6 @@ pub(crate) enum MsgFunction {
>      UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
>  }
>  
> -impl fmt::Display for MsgFunction {
> -    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        match self {
> -            // Common function codes
> -            MsgFunction::Nop => write!(f, "NOP"),
> -            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
> -            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
> -            MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
> -            MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
> -            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
> -            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
> -            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
> -            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
> -            MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
> -            MsgFunction::Free => write!(f, "FREE"),
> -            MsgFunction::Log => write!(f, "LOG"),
> -            MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
> -            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
> -            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
> -            MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
> -            MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
> -            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
> -
> -            // Event codes
> -            MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
> -            MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
> -            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
> -            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
> -            MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
> -            MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
> -            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
> -            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
> -            MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
> -        }
> -    }
> -}
> -
>  impl TryFrom<u32> for MsgFunction {
>      type Error = kernel::error::Error;
>  
> @@ -330,22 +292,6 @@ pub(crate) enum SeqBufOpcode {
>      RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
>  }
>  
> -impl fmt::Display for SeqBufOpcode {
> -    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        match self {
> -            SeqBufOpcode::CoreReset => write!(f, "CORE_RESET"),
> -            SeqBufOpcode::CoreResume => write!(f, "CORE_RESUME"),
> -            SeqBufOpcode::CoreStart => write!(f, "CORE_START"),
> -            SeqBufOpcode::CoreWaitForHalt => write!(f, "CORE_WAIT_FOR_HALT"),
> -            SeqBufOpcode::DelayUs => write!(f, "DELAY_US"),
> -            SeqBufOpcode::RegModify => write!(f, "REG_MODIFY"),
> -            SeqBufOpcode::RegPoll => write!(f, "REG_POLL"),
> -            SeqBufOpcode::RegStore => write!(f, "REG_STORE"),
> -            SeqBufOpcode::RegWrite => write!(f, "REG_WRITE"),
> -        }
> -    }
> -}
> -
>  impl TryFrom<u32> for SeqBufOpcode {
>      type Error = kernel::error::Error;
>  
> 
> -- 
> 2.52.0
> 
