Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C8A468F6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D160710E9A4;
	Wed, 26 Feb 2025 18:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYbE+vGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EC010E9A4;
 Wed, 26 Feb 2025 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740593351; x=1772129351;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aVVO4qbJHGlQ9Vk93tFck35Ml0P0ZQz8U4Ivs69TEmk=;
 b=PYbE+vGKIG4ZVem2Z3ivCj2j38KK+ndUo85zrPDBLujTy7JzSn9g1oki
 i0I4pJmPsw+tuUaWF5HjFCwoxF27TsjkLmgb3vHVZjPGLlxTzTfiGj+el
 lbhCXGRQfr0k4Ai+qhE1etTr+95YoNzm2Yneq09rwpc61U+BroDnWgkxS
 xoCHtsdjODgKQsDobLi5QsHWQJ+8nk6wYKiKTWy1Qdf7L9yv5iKbKOwTD
 Ijn+ppfDFQWC0puqJ+Xqtujj097o5irH3NUAzUsFqoIjliF5B050zrowZ
 qPSUmXaYF9d2JK6fCMFfbt9q1zbCjyYbVwxPqrXTV8G+hm/ZHGeY6wzuq A==;
X-CSE-ConnectionGUID: Th13oa7XTb2yOviw9Mg81g==
X-CSE-MsgGUID: 2C0Kl5GyTVusngfho8eMJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45109800"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="45109800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 10:09:11 -0800
X-CSE-ConnectionGUID: /hiUdZ4+QuCyhlBcJMGuHA==
X-CSE-MsgGUID: 2sdU9u88S6K8KxorHnqm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122036139"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 10:09:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Feb 2025 10:09:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 10:09:10 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 10:09:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI7jI/O4bUBsZZtjg8FFjnA8c4x41oiKuOV6XckAGkRdmkzQgQuNrl/hoNwUmuCsTo/XtCYpQs/Ha7KlrEm69Bw7T2y2vKy9kAQ2h2D5uHBhfI4yBY4QQ1AUQCKjt/lngUdzK5ptuTIpDn4KNXguiM9Z4geqm+Ofsr0+lVDOOiUoUnMaJAOyhGxTDqFxOfEq8CqHK5rh1l4meRwRaGIISh2OL2RGURi29udm1sE1AyatU8SBPVg3TbRPTVJoazqepTKFgt0dNLERCOc/h1rfzU8k0wZnzdQ9pXK8RwWUdgxUcGffG5xTv19SEN23+ylP4Xl5q+2kH1z35B8wy7heaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVVO4qbJHGlQ9Vk93tFck35Ml0P0ZQz8U4Ivs69TEmk=;
 b=O+4d6MmZ/YLsX6QWFTX6kmk+ryvFTNzLd8ArojEJ1ZvgSPIScSwcNgJ1P7nX7dFSMaS2HW1G3Zvyx5LYZAgXkfYF7/lmUYG6YB0++pNGsXkExbGEwY52NVhIx9RSewkBEDmPn8hUItCNtA2g82BobrnZwqIFQe2xKNgRsajPOVQlT+cQ2h2tWtwDlsHa8oKMV7N+NzlZsMmSul+BaFpHrioZ47krrM5tyJ1RaNZB5dKjvGT1k+T+mvvQKpye3PJF+yFM8jE/gTEMmT9E/VWU8GWIXIVXOzzmTudnfUiv4z2yj0Nso0GfxGAz9GtNlSAFnQO2WjaAlz6Qo8LoDflcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 18:09:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 18:09:03 +0000
Date: Wed, 26 Feb 2025 12:08:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] drm/xe: Fix uninitialized pointer def
Message-ID: <4k7g5jn56f4adgyihxj2r3arjo563hzsdyrrtet43jasper5gi@ux2cuab7pvmb>
References: <20250226160524.566074-1-colin.i.king@gmail.com>
 <6hrfddlbvpk2nxhwcx73nm6cmet272fhxulvmfeiqfiansq6tf@rdgyjn5fofov>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6hrfddlbvpk2nxhwcx73nm6cmet272fhxulvmfeiqfiansq6tf@rdgyjn5fofov>
X-ClientProxiedBy: MW4PR04CA0145.namprd04.prod.outlook.com
 (2603:10b6:303:84::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a2db52-28c1-40ba-982b-08dd5690a6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uqLqUcQlKsGetNXIosSOiiwMfbBdn8WpuC4gV1FghaGDat8Pq9tc7axkowL1?=
 =?us-ascii?Q?HIOCU3ncZl1cYFjRVhytYvPRXGfI63jLjxgfJlTe9FKITmDJtdRoctT6R0Wu?=
 =?us-ascii?Q?+1pD2Tyf4YQyp5sXeIzJOMzD6yH4pDbUSpEZh5dRnCYdYEysUu4tdBWKt5gt?=
 =?us-ascii?Q?nqd1IQOv93SI8rt0+KtboKZt1ZfslazxLRNtiGxkrbMZ+TDe9RzSQ45sMMhL?=
 =?us-ascii?Q?Zc+BOIRZlbqygtW5nveKgHTfplu2v0bMd/IY/VpPbQsXkYJddb/fzl0GpAJx?=
 =?us-ascii?Q?i0wC19zLB6h28GhazVytdUGfRSvFtskMjPcrSM1v9UaI4QNWxQWprNHTeckr?=
 =?us-ascii?Q?guLpenTHOjQkNe6HAv4bILyVlptBnMZETNnb6e/XYsrVD4S6TBmcah0Bb6v/?=
 =?us-ascii?Q?VuC9neITWTw+MigHxO0SEsgJw6WfDfrmcXZzkgoRXB+URijyEkj5jE4h1Xw1?=
 =?us-ascii?Q?/sQvI9FwPXMFc6z9P33pzlVsvFKMi2YWyZ6hXD+SVqafl1Vbg+t/kH2A480I?=
 =?us-ascii?Q?X1Ga7C9LhrIYISef+H5kFBuGTshSIilVwZlZX0sa/97YXIqaqGDm7S88w4Hr?=
 =?us-ascii?Q?ueheFaBTP4xGcEq64xiPTOu33jZuv2TGzDS23v3n99AU8HrLuqmBqmym4W3A?=
 =?us-ascii?Q?aUZb3/oxgvwlm2O0yUpWLTvdyFAi+xdbhBZDO6i9TJplCkdg2Lye2AwWGyD+?=
 =?us-ascii?Q?FgKKyIwQmqxzG/3Yw4xVs29fslOhdcY8G59pncOucOBiuIc8MQKa4w0dKhQC?=
 =?us-ascii?Q?vpznABEBlhOi1CYk58p8P5ooONpy8lyk3DNlFywWgtgx+bspKyg137u3a9uk?=
 =?us-ascii?Q?CSDkNrovQEecu/yO84g4nbtXYjSQe7T/xqfCsDTyctfN1O7lR3WzRgew0d/n?=
 =?us-ascii?Q?QnDidW1kioHyyqnoyqkBO9853ibLwJNxbSc2MhQ0xWSFFTRJwdGlOSC6zfsd?=
 =?us-ascii?Q?zjDcpw/8e4NhSntcCN35x0B9pyQqgNTIL3W1zUIhwA32ZC/+DoeZShE51Mta?=
 =?us-ascii?Q?jngMnCKc6ucM34XJC7sJZFjWcFLyitm2MV+na7wnBlCCcbvfbHEaROPehuC3?=
 =?us-ascii?Q?WhlFfEijcMAcGXwnd5tz6e6IkubEvRzGxnTy0S8dI40w7nd8pOKifakRyv/m?=
 =?us-ascii?Q?GeH0EzKd7LW2Jb1vFg8lslTXisgGQ7ICQK0qir//sWZe+7qiVD/EdfRhgvfc?=
 =?us-ascii?Q?A+XJ37/UNdkkI8LPk2Doqz/l8M95jPVGDlaLCFVZ3r4SuPX5H80LTBVR8HXV?=
 =?us-ascii?Q?1ARfQD8CeDhftg+pNPshxGPjGqXZjsi/L8pz9rBtQfG4gHtQ6I66S38vm+Eo?=
 =?us-ascii?Q?CyRX+5ylLGcOAVpoZ8VwxeGyOXcCvG8NPUqIlK/OnxPog5Lough2CpZtVTtY?=
 =?us-ascii?Q?fKHmqqPUcaYNEqoJFGhrXlUfyKwx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?glTvUZLDXIW3gZsIXHViWjX9wN78P8+/4U/UlxW05nrTcauI8K4Hk/cx2IdD?=
 =?us-ascii?Q?meysCpF7gwfDGfQx5o0OaSszc8lf9/rxFj7jJ/b7ZpmgpS/11iKK6UDvoj4O?=
 =?us-ascii?Q?xXoFAnw7+V1ABGHLT9R8X+7s3vtOKL6wA/4OtFdoyinKLA0AqWsqbshpp+zY?=
 =?us-ascii?Q?e9SgW/47BVQjI6Ms+iY7eOqQXSaRlUFYUvfXqtnpHo2nOScmaPhogPraZ0aS?=
 =?us-ascii?Q?D20bvBmQS1jLZUzh5xPxLkZ9vSCCPBYAPXp8BrkgwTgXcRR3reodafname9u?=
 =?us-ascii?Q?wJ8iP+zGmPyTuH8g5tr1qW6evYArYdh0k6RA1XhYX5tgGV7P3Gd3ikJKE0Nq?=
 =?us-ascii?Q?UXHs1syX2ZwWBv3xy3y+ns+sd2fnfZzRiDBVvXrGpy6aeQSxASSOmOpNKBUa?=
 =?us-ascii?Q?24/1yxQ+QfYB5cZncjTufeEETFeUxTVtJw7tVp880EPv07+ZwgH9SNwbJCLL?=
 =?us-ascii?Q?Ky+V6CX6iMUKyASl2l124dF3iLhtwNoft1bvTrbF4d0jzUcsWCTGyGv/wzm/?=
 =?us-ascii?Q?pPvDiKXB+xQFlO0aw3oBO7mzotHPP5uRgnGByI/qEXpALpA/8vJEysUjUjfB?=
 =?us-ascii?Q?OIehhAs4Rk9Asq9iiwkfQC2Z++/5D9EKHEWkpYoQQ0LRNfRfBcDrkU6tElkT?=
 =?us-ascii?Q?JpVykPQ5QYh8X+rfEBnUsvAjI4/E0mYz4+41P4opgkQN7HHHiby9ysve0jen?=
 =?us-ascii?Q?aFkaflPuxfErxeyDrjHbOJmsRQ3AxgAizKtFe2NyT9XT0fuxOC2iwNZWNk9F?=
 =?us-ascii?Q?EUV8K2P4nBXx7OXTjIjWHZkhjL6liPr6DUpd4GtZd/CZewzk2sW3msn5lTw4?=
 =?us-ascii?Q?poFga6soVXO0d+8X+Mk39kS0K0DRTfN/b2eYtLP+9/MzjcDGdVxiO+ByU5Ic?=
 =?us-ascii?Q?z/GuY4lyLoULdnNohYVBaauprfFUMQrxwS+PreX8NtYEFFoICT2oDjd9W3bP?=
 =?us-ascii?Q?6x+600av+0lEULXrEwCa4Mo8rJoTxLot4nx6qE5q8qhujX46A8S2JVMjTEpu?=
 =?us-ascii?Q?Zsocp9Q7eJEjbJlYGk7nIcFHQfPJzHLfH/UYAsYdBZrLwiuhXepDlcTZoQsz?=
 =?us-ascii?Q?9oxZNal2oMAgZifTjYXCIm8WGaPhs/w1OyFsDb6aYyKRn6ir1R+XKzCSIs91?=
 =?us-ascii?Q?5fNKg3HEbQ5nKcVNmJB5zLux/cFR34FoJ59/1F0GVLY3+crXGYtldKvaVi8N?=
 =?us-ascii?Q?7Ybr+NuNYxN2a0YnNzMaDeAtEUuckL4505f3g6d2uimH66EuzQ8+ne1Ocknj?=
 =?us-ascii?Q?LdRJ0G5kMjWQ51w7bkklY09Z3c3PmMNXHaHjQ+w9w1zejieIeXZ7fzHgvrwE?=
 =?us-ascii?Q?LSjfIlW+Hd5mXFVNgySeVMTk0NsG+f0pI/4/5aWRVSiV4EymycUI0HF/ppse?=
 =?us-ascii?Q?LxZjjGKBOZzrD3IhGHmd/I5sJPquaccayR9p8zjv0XHOQ9seTeLHYLo1fgDA?=
 =?us-ascii?Q?7okmbc7dF1vy9SZ4SLjMOgk45VMRLH4BXzLofxCpPb7/AHBGiRUU5R59Cz2e?=
 =?us-ascii?Q?4Zk3h7D59v6BakJn70uLgSdJF032kezFE/VesVXgFL+MAZB6nZ2JR4Pzfu9n?=
 =?us-ascii?Q?pCqwHkq5fnzM5FkPfhquwc2QlXqc9BtOlicAExreBxH1ITTgvJr90A1xPURE?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a2db52-28c1-40ba-982b-08dd5690a6c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 18:09:03.1547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6YKgjIhAugb2JwJ8ww7gUPLmJOwFxxvVrvVDzT2IXrPyGSYLyxx2QAfZSUq9NluHrJY+Plblbzsh289W/7E9c1EY/dprlLDQp0i1U2Sbzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
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

On Wed, Feb 26, 2025 at 10:28:56AM -0600, Lucas De Marchi wrote:
>On Wed, Feb 26, 2025 at 04:05:24PM +0000, Colin Ian King wrote:
>>In the case where a set of checks on xe->info.platform don't assign
>>a value to pointer def the pointer remains uninitialized and hence
>>can fail the following !def check. Fix this be ensuring pointer
>>def is initialized to NULL.
>>
>>Fixes: 292b1a8a5054 ("drm/xe: Stop ignoring errors from xe_heci_gsc_init()")
>>Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed to drm-xe-next, thanks.

Lucas De Marchi
