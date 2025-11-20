Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4CC76201
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 20:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B0510E2B4;
	Thu, 20 Nov 2025 19:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwhVFzNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70EA10E03B;
 Thu, 20 Nov 2025 19:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763668240; x=1795204240;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FdZ0GVGNB8ZnOyDnx2HZn5hJ9vWAp9wF/zuR93Zd9dE=;
 b=NwhVFzNWBREAPNIyXGtO3S09FqKGipUcQ7+lO9ILsuxQFKzrESHufyoQ
 vQgtR/V7fWzJ0Gpr8Mq5O0FahIsSUWjksTTb//AaiTPJfRzwHbdydunWh
 bJyyJC26KNNNHq3A49ddd/jhL5oDf/itaPAswnyKakT2V+YB81lZ6NbmL
 lVDLGTT2YIrtKuvPIRjqxdSpCkolpqpIOexOY5Rogdy1b77aEK8Qd3MdJ
 qAeGQ86oA3tDZrhlgFfptC4E2i+oJ6J1U2nrXdl6f1SokOOT5oF2X8aQ2
 GuiFhLtotH+CcWzlJ4r6BfIByzjoB4okshi7g5c07LQ4z3Ds6t6N4VLdf Q==;
X-CSE-ConnectionGUID: FDTunE0cR4+CxVRrlnHv6w==
X-CSE-MsgGUID: eKR0RFTqSbuc6nL8KyY6og==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76078994"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76078994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:50:40 -0800
X-CSE-ConnectionGUID: YMtxzqHJSeuhpFOMe0GOgQ==
X-CSE-MsgGUID: 3hayWcWOSEalcjfyOveOrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="222415512"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:50:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 11:50:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 11:50:38 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 11:50:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXbIwYjh4qmQFJaKJ45LsTm/UKVu/i6vIPNL5LlbARWPM7c1R5Sd8ZI4bGICegkIEf6hSW1KSKpcgbNhU6xP2EeUvsjoxGWdhhKSQrfjRMOIEIitb/LWg/AgeFDvYP9yJHSyv2O5rpYRi2NG/vx3hwm5ljKDj3BNZy8MN6/fMKf/MF86I6p5WoI4Sa5/PjopGN+puJxKX3ex+zxU+bODJMkyH9QxKWnj7Gup7mFARANoQzYTFvA5G6DshFCQItKIL13LdA3Hd8i9L3hxaigUFSBgCGm32+s6IfQbQ1ZMoDMu7j/BA3GhnD5T+WBLCu2KSnz2iEgzMQwkEdkMqBFn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn6tPiYz+FJeRZ5mrKP8sEAVKzV5rY9PoVikJ63uW1c=;
 b=Y5blBPQ/gGr/8jweFixkNhSVcYUrj0DQiyV4OG8tfUyJt7qeK05LzAJgx5Ea3uTZ8vzcvUILmXpCd7LRfs7MLQBpCYQh+67xDWAZjR3+UDaA/Y5Ihg3ebylPQDhenpoRJl/QvM+7P/IJZkNj2UNImRLUp4Gr2mgzCoScV95aRUIFmqKjQc97Q0n6uWdk6fwkJ+zNisP1BNSzDAGkaj73Z1oZzok/UayOFTZNfb6RhiRxve5BXX0HPu7anFJtYhVyBfNyaxjD3+OjovwO5hJEWOhD9xGQO/W0KoGuWPnRFfvIidghuPXbYBepHbk0Ve00a9sNd3nEg+63w1YK6qz60Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 19:50:35 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 19:50:35 +0000
Date: Thu, 20 Nov 2025 11:50:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 6/8] drm/xe: Do not deregister queues in TDR
Message-ID: <aR9xCKn3MCEOt1Hl@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119224106.3733883-7-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|CO1PR11MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c0fd07-957f-4c1d-1b1d-08de286e120c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zjKjuxK9nCttjnYGZgv3SKnH4trhSkYSVUGpvaZfumP1v8QwLQft2TkVsIJi?=
 =?us-ascii?Q?D2iW8VKD9lKptsvpuXirakoNCXXKJkrdshk7mjXPOY2N8/SGxv8qxXR5TvRe?=
 =?us-ascii?Q?mpfDcppE3VfBJXBiM0b13gMkDfG9Am31cAztcdwnWuiUoixESGNlaJiCAdtQ?=
 =?us-ascii?Q?V9UlNQE2IuvECFhLgiP/VvnYkwNPpkkw4PTbyJLMXfX6QnVgU1V80DdHEF/n?=
 =?us-ascii?Q?J1wiTqzNvMYCnhWWcYtB+EERzo3xcmsw0+b9Dsk1zDoxOdbjs3MPnc+zYWLa?=
 =?us-ascii?Q?WIwRrcSQIl2mLjLfiIjImEjP7VlnPifMxOhy5g9CmQEK3BvIIizV0xreZyzg?=
 =?us-ascii?Q?MNkVw8HFc2QySDEZ2xJFzspyKZlyN8Knvyn3UPCAp0psYbi9Zwig328WKVjW?=
 =?us-ascii?Q?WI4NZpsIlbkMjQK4KZbbQfoT8aKng5Q40SyJ6wgQLOd4UkAVG1MzSdEVqRMi?=
 =?us-ascii?Q?yLfBF8IyPj0UnedBPCWjhfrTASkA12Fs+DM2XtZMOVe4yQDmWa3DS0oCUNVe?=
 =?us-ascii?Q?mIZSRc7z4/hTgNzDBARm3d6G2gCeOjBqJ7pbGmtaKOFwzAavrE4pM1ftW4sQ?=
 =?us-ascii?Q?nkhn27HjjZp1ifURPNitwbNEDZDllpPxJpFyinT+ckpAMxh0aH/Yex47wzZ1?=
 =?us-ascii?Q?7cs44A/ku1iJH+ZbE5D0XRlzo9AVZVA0qOWnJPRSMj+xzb0lXRrlx7Mv7ktK?=
 =?us-ascii?Q?hgRNZYXlXg4czRvGQAPwBPEs9FGSjbzbn/7+hE30K3LrcBf/0vddpnYWj1Sx?=
 =?us-ascii?Q?YLuj9kgJfy5YSVpzftvyCeBky+9km4w8BSqi4uYk1E/qG+ItEVxYuAot0+bS?=
 =?us-ascii?Q?t5ru1CioNJ55ikKJcAnKMueVoqXQEDE/1wZQ0k30IBcZd8XOhuYNyGf33zTO?=
 =?us-ascii?Q?TMA+2F1WyiVe4/v3+7c0p1Van9wR6TTA4xt+D/ZrZQNYxd2ObrkhTk8eaTbg?=
 =?us-ascii?Q?+iYlqDbxRm7VDekLryTYALtf6TJgUvN6UsG3m6IY0FLm2lL1AL/xGhd3HG2Z?=
 =?us-ascii?Q?8D3JyTElf5og6kMbcpLvfhXRI80N3SdoRJgM7P9Jh9rUxmyQv8CCiPOkTKgy?=
 =?us-ascii?Q?2DctbrMKkbE3ai7Sc7JLBP1Jp4Wuzv6Sp3ebm9HaphXug/NJ4EoeF+hQMM0G?=
 =?us-ascii?Q?FU+Vti8v7XXmccQCBcw4mWSxsf1Wsd8XIG4+gc/Fzxf+SUQCZU/CTocdBqeY?=
 =?us-ascii?Q?W7at10wdSQDEzsBqWalaVT6FPCznMEroidFoJI5qnbBEMxM47hk4au+qz+fs?=
 =?us-ascii?Q?cYsYKcZw8Mu/I2q1h0sy/RkATpQX57Q+q6IRfc1nfOY0oWlhPpiYclGAXMSi?=
 =?us-ascii?Q?5P5QwunQbNzWQd69TyaUSn6X1+MwWBsyW4W3MfUFnpDAto+NJY8rvlbPRZLu?=
 =?us-ascii?Q?G6J9hM/xN+8sy/glw5SNwLjlJKO/MxhUumDC1gz6fStKaLli0NOOnqkoGaPX?=
 =?us-ascii?Q?qRLmjb6AQafu6iZueh6zCmAuOvBRwjBP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mdz1aJsUGi36BJRAXvTA92Jy6UQaTrNEpgZUGFR6oZ0kqNMQOLnH69i0A2GX?=
 =?us-ascii?Q?e3H6Mz3q/saGdPIEaWMHy0JFn9kihH5Eni6dp65zFkHR4nZHa5UNWf1UPuuL?=
 =?us-ascii?Q?8wnXqVLhG0xjr/DvE/RLrjFPkrB2+A1kEpnCTrsbm46GapyePsZCXMsMu3JM?=
 =?us-ascii?Q?TuENauNmbSBfDeMZS39KorHrfJpL/EJVWRhBrRcDJZ5obHnXSrPv+/K9B04A?=
 =?us-ascii?Q?OTAhgX/JFyrXycYZeZB24DEnroBEaG6yeqbcthVRuS2x0C7vvlBZPV3E1Cl/?=
 =?us-ascii?Q?xO+ppgH6Vg9q3GFH6lYa3Sj9VeB8JZfu4LnciA1luNlNcEixoqgASCakkFry?=
 =?us-ascii?Q?IyXJVRxlHmfz8dtn4ufhX9NtOAcYg+waMCnYmITY/bSDOszLIKGI+n35gFXv?=
 =?us-ascii?Q?gb5cJBHor+12zY6qi5TH5/UvHuwUiPwXx67irDfNStr5Rk0fjpc/5XsYvtuI?=
 =?us-ascii?Q?D/TAIzgIvG7ve6ofyyQDa4BiZycBH3aAVOnJeGEQKLILBTpR+IX7JB+2vbnN?=
 =?us-ascii?Q?jNxuJwjnLNJtgNHrYCHAwDC1gD6oFBGdBUj5hFovg8c96hQqfLw8Pn51whg1?=
 =?us-ascii?Q?H2acnrs1Ky+m/2qWRkcR9dkLMHD018FALzmaoDS1clahxkGbmZ9sgQumsFgP?=
 =?us-ascii?Q?2DgTrbvhFK/yOwLrMJXbFqCn/E8L2KUYFn+IrRxbC3r0jie6xVixXLYDRorH?=
 =?us-ascii?Q?XqHck9H1UDXh3lg5tVyZHIgCoAdQt2pvA92FF38/fpsK+UKKD+b/0qv8pBLt?=
 =?us-ascii?Q?ZrnMHYZ50FzyeNWwrfEPp7GHcLRx0wqHyXeL0QB1OAeQPL9FsRn7p45Fqz/E?=
 =?us-ascii?Q?9UD2pGZf2IXVr9Lm0sPi3uaWjCFUBIf6c3zoDiMaH8HWZbKi3pmBrXBHURy+?=
 =?us-ascii?Q?00+WN+QN5H/VGgMdGNbFB68Cm0BkDRZiPdeuWKB0kW9N0GuT59ftsCqxbQ/U?=
 =?us-ascii?Q?000U9s3MWdBbwM9K0G6JCshqSnIKnerQentt1bpoKdn8tvIC39mKhxrXqG7K?=
 =?us-ascii?Q?g/OZ6YQKfgDVKUxp4i7GQOO2wgmvva2KSS3R30L5AdiEYaoB5KfqMh73e9vg?=
 =?us-ascii?Q?HJogYU2nenk3ThtH29LtqenhqSrWgrLy93JOHpSUYrpTddUrMqEwLsRwDeKp?=
 =?us-ascii?Q?JgmzK3HY7EOKJAgAhIrhVRmknlX3njOkUb9DhUTpoCDdGkHpylf/KbAsaNFK?=
 =?us-ascii?Q?+7iNZnel5dK7t25P6yuAupdfKx6RNPM850xmV351jBhwXdUEiCvpHhCskxZS?=
 =?us-ascii?Q?GbbwVGvQp2qwIjJTN7UB/rNrAz8mtv/OtBeWn5gINDOzxqCUs+C8oN9ezGbZ?=
 =?us-ascii?Q?BtqROLfzUZ/B2IJhmRRsBXvQLwfr+bR8/IvxY2vqyWcryb1xugg9zCGizsEj?=
 =?us-ascii?Q?xBaXEOKkjg9WgSjvQBzBg/38XQhtWKEPpMcCv7+iag1VN+kHc2RdZcrtdMqS?=
 =?us-ascii?Q?nfJwasAC2MRmSjv9U6ZbnLLm9qiVFObHE9YCzG/WkfZv4v2Rln3gneG1iPhU?=
 =?us-ascii?Q?m/1gQu6sWsCFEWC0f7YQ8JykhvS5SBr5Y3wJ7NxE29Drz/Pf+bvyAXjbBvSB?=
 =?us-ascii?Q?cFu04RqxOJr8LaiMd2C2GFP1PD/iqBwFHgWNh62unhT+E5C7CWHRAVpHlSFL?=
 =?us-ascii?Q?h5ND81DN3uGxs3k0b152ajw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c0fd07-957f-4c1d-1b1d-08de286e120c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 19:50:35.1710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wRkdLVoEOpjKCUDsDwymQW/A63my/Y3L7AlxhM/n9Ha3LSUJr13EFLAqUj+v5yBil/uWB4nuq9B1cVck+kESX86R/6JT0O1oNro4J8LyZ1fdeIO53LazNPvDoG79TI5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
X-OriginatorOrg: intel.com
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

On Wed, Nov 19, 2025 at 02:41:04PM -0800, Matthew Brost wrote:
>Deregistering queues in the TDR introduces unnecessary complexity,
>requiring reference-counting techniques to function correctly,
>particularly to prevent use-after-free (UAF) issues while a
>deregistration initiated from the TDR is in progress.
>
>All that's needed in the TDR is to kick the queue off the hardware,
>which is achieved by disabling scheduling. Queue deregistration should
>be handled in a single, well-defined point in the cleanup path, tied to
>the queue's reference count.
>
>v4:
> - Explain why extra ref were needed prior to this patch (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++-------------------------
> 1 file changed, 9 insertions(+), 56 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 648c9ea06749..5de300b66767 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>-#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
>-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
>+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>+#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>
> static bool exec_queue_registered(struct xe_exec_queue *q)
> {
>@@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> }
>
>-static bool exec_queue_extra_ref(struct xe_exec_queue *q)
>-{
>-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
>-}
>-
>-static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>-{
>-	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>-}
>-
>-static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
>-{
>-	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>-}
>-
> static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> {
> 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>@@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> }
>
>-static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>-{
>-	u32 action[] = {
>-		XE_GUC_ACTION_DEREGISTER_CONTEXT,
>-		q->guc->id,
>-	};
>-
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>-
>-	set_exec_queue_destroyed(q);
>-	trace_xe_exec_queue_deregister(q);
>-
>-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>-		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>-}
>-
> static enum drm_gpu_sched_stat
> guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> {
>@@ -1225,6 +1190,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	bool wedged = false, skip_timeout_check;
>
> 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
>+	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));

Is it always guaranteed? What if we get here because TDR is triggered
by some error notification from the GuC and befor we get here, the
exec_queue gets destroyed in the CLEANUP message handler? I am not
sure we can we be sure here that it will be race proof.

Niranjana

>
> 	/*
> 	 * TDR has fired before free job worker. Common if exec queue
>@@ -1241,8 +1207,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>
> 	/* Must check all state after stopping scheduler */
> 	skip_timeout_check = exec_queue_reset(q) ||
>-		exec_queue_killed_or_banned_or_wedged(q) ||
>-		exec_queue_destroyed(q);
>+		exec_queue_killed_or_banned_or_wedged(q);
>
> 	/*
> 	 * If devcoredump not captured and GuC capture for the job is not ready
>@@ -1271,13 +1236,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>
> 	/* Engine state now stable, disable scheduling to check timestamp */
>-	if (!wedged && exec_queue_registered(q)) {
>+	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
> 		int ret;
>
> 		if (exec_queue_reset(q))
> 			err = -EIO;
>
>-		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
>+		if (xe_uc_fw_is_running(&guc->fw)) {
> 			/*
> 			 * Wait for any pending G2H to flush out before
> 			 * modifying state
>@@ -1327,8 +1292,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			xe_devcoredump(q, job,
> 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> 				       q->guc->id, ret, xe_guc_read_stopped(guc));
>-			set_exec_queue_extra_ref(q);
>-			xe_exec_queue_get(q);	/* GT reset owns this */
> 			set_exec_queue_banned(q);
> 			xe_gt_reset_async(q->gt);
> 			xe_sched_tdr_queue_imm(sched);
>@@ -1381,13 +1344,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		}
> 	}
>
>-	/* Finish cleaning up exec queue via deregister */
> 	set_exec_queue_banned(q);
>-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>-		set_exec_queue_extra_ref(q);
>-		xe_exec_queue_get(q);
>-		__deregister_exec_queue(guc, q);
>-	}
>
> 	/* Mark all outstanding jobs as bad, thus completing them */
> 	xe_sched_job_set_error(job, err);
>@@ -1933,7 +1890,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	/* Clean up lost G2H + reset engine state */
> 	if (exec_queue_registered(q)) {
>-		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>+		if (xe_exec_queue_is_lr(q))
> 			xe_exec_queue_put(q);
> 		else if (exec_queue_destroyed(q))
> 			__guc_exec_queue_destroy(guc, q);
>@@ -2067,11 +2024,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>
> 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> 		clear_exec_queue_destroyed(q);
>-		if (exec_queue_extra_ref(q))
>-			xe_exec_queue_put(q);
>-		else
>-			q->guc->needs_cleanup = true;
>-		clear_exec_queue_extra_ref(q);
>+		q->guc->needs_cleanup = true;
> 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
> 			  q->guc->id);
> 	}
>@@ -2488,7 +2441,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	clear_exec_queue_registered(q);
>
>-	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>+	if (xe_exec_queue_is_lr(q))
> 		xe_exec_queue_put(q);
> 	else
> 		__guc_exec_queue_destroy(guc, q);
>-- 
>2.34.1
>
