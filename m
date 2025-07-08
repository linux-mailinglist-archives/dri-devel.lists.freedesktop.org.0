Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6448BAFCE10
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12010E66C;
	Tue,  8 Jul 2025 14:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ner7a30G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C4110E66B;
 Tue,  8 Jul 2025 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751985945; x=1783521945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4buREu3b8Rt9C+gyj6M02jIjTtMlpWcgHFWfqgUv4wc=;
 b=Ner7a30G94eBCB+f9gOg4Niov1XACpPold4rxazCBNZMN1UU/X1vIv9x
 2PMqghxBtxr0tYNxES9Cs+lai162/OSVoF52GHf2Tw634sK7SdlDqn9V0
 hqD8RM+0eqedA70vDI3WYRnrfPrEN07RvYwu5teY2uTVBP1z12dNn2MNU
 nBlI/88lWoDY7rJG/nc+nDEntkFRLaKFiOdUlwxbFFFyZcHVu3MHCK98S
 hEaT4Q9G0IRkB/x1nGrbtas7aSprwgBPkac2IQVwH9Xt9IZqNFmdtfC4h
 sLpP2rICduP8PJmpEwFUUYV+SNc09tkpPTtRn0pUMsuXwU3XH465DxMW7 g==;
X-CSE-ConnectionGUID: lennrUlwSwOVp5AKNuLF5Q==
X-CSE-MsgGUID: 8iSthiwRRW6xnJVQNvpbfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65578773"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="65578773"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:45:44 -0700
X-CSE-ConnectionGUID: rcfgS5I4TcG+e6WtWkYxbg==
X-CSE-MsgGUID: iX7sdBzBRf2dZMKz4vDFTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="156101332"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:45:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 07:45:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 07:45:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 07:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iu65sb84HslJjAAWuYRAp/xOR1wH3d5ln0Wt2QEU8eUoLtVhufdwXbXkp7Nk7BYQOCr41MFTgScrIq3F9e7qHYyIiR4WGVHm76ws1FUoOrQTFSk/jurxkQP340XnzRyGkjDSiCIAo4LW7Oe1Y4zGGm5b+3QSs+Orw5+ZGnyXQxgJ7YZdLy9AuBU39kVeJminges0FdrGB/5p00cDmb17y7x20MYOnXvvnwte2t7LKmNbwU+OGdGgOZMLjE9m6kUIkR9b6iS+x1caHhLtENpKWumik2Iv3RF3AyjONEmXiA0b2zobkm2jRqJEvTpblnco83SCzdhOY1zP3vkdfedz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfAHkfEsN5maN7ghBZgsORBQvXIrBnGJIKX3UtnNNjI=;
 b=WucCjOszcJT0rUfOAhwOjIR4GTP/6gzvUzEjqlNznUy1kCqNGH1dD6gfPqBEau18HviLDrvVqQoDuIuEQyuMuZujwr0CjZZBhkvr2qmTlJNKI5AfdqHIeAmdgYG6a9TOWA0WqHCew0fcj74HBoFMplOlE2iErnClDmyWlXHu99xz8JxFx6BHwWHPvtKjltD0xOVYWtWaK8H0MoG43svojLZusBfAH0NMFEQZjfF5h9d69UP5ODR2Ta2/v8STXCjJJ5IDithNXLfHXedMYpmQu3SwdJSUARp6UaHLvcuPPyQ/b1uKzXqBkGvhLhMqNvVoYLJZqy9XQ13+80ConSuXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 14:45:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 14:45:38 +0000
Date: Tue, 8 Jul 2025 09:45:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juston Li <justonli@chromium.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/bo: add GPU memory trace points
Message-ID: <yd5moihvqr56bky7jo4tcke5fd5zwuovxs6hsf3fzdqk4iq3lf@edrvv4b6xqlx>
References: <20250707203849.545312-1-justonli@chromium.org>
 <20250707203849.545312-2-justonli@chromium.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250707203849.545312-2-justonli@chromium.org>
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a987189-5f02-4c87-db35-08ddbe2e1aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JXhAhsiHalyroKaw3CHobDDorHhXG0GL8bQ2h1LeZHamhFFzJ8wZ5pU9Smld?=
 =?us-ascii?Q?S8m2NdE00yuXpOZnhyVG1gg+ZN6UcNP7J6P2LMoI/cldDKvo+HFtba+dpgDP?=
 =?us-ascii?Q?X/V/o7LLbGE6UJ6CSyp7q1vxFwwm7xKx8C/fjdTUYfNBWiN031rtFWRvQG9h?=
 =?us-ascii?Q?eVTY45IA8p63ftTFsK4Fl5xbVN9w4z1EylUvaERnAiL6Yhra7DTW/uQyaEdc?=
 =?us-ascii?Q?nY/nbsHMjw8yaMe9gYhXsZ94OYZ7isUCEJOSNkXZ+3HkdBg1Ec3/gaeifAoK?=
 =?us-ascii?Q?VeRtURe9iS1TIsI6lLwSpnOBfOmT19J90/Tx7D9t62lfbHWSbloL+TCfAVQJ?=
 =?us-ascii?Q?jUKdNeaEYGBRQF24BC7nB7/c4BvPjvJ7/jXoO85ipGbR7SyVR5WNGST5xQW3?=
 =?us-ascii?Q?sUpouoyB2Bcf9OQ3LYGdJse6/FYKneVMBsAHJKGgykgMgYwkGGF5TGxaQ/Kp?=
 =?us-ascii?Q?dAJI1uAJf5p+YoqEOku6GUapa5+11+9ni8b/y1k19i2NyPDcF+5p90WrdXvT?=
 =?us-ascii?Q?NmeQWS19Um0gjGRLfSCFY7u8+IIs/l5xoWugxUxw32n1m1L9eS3x8zkDsy65?=
 =?us-ascii?Q?hc8+oSnrydcjLuPifitajG8fvjrgToA3mbj+9a5nG8dWt5PMzSL1RrJqgoYT?=
 =?us-ascii?Q?bg7meu/wKce4EbxpSiuGvHvO2+Ntf82CxP5aPfSPSqyw/EAkmW7M7VgZOeVz?=
 =?us-ascii?Q?PqF4Yx0g79qrhXnEzILw6FKa7el77nQI4O5KV8w/2CjuVN5mm6e6Hw/JiWFS?=
 =?us-ascii?Q?BZ3nfWtPQUBV7VLM9U2HzKQjD4Miv9GmiX6J1S7UKUlIVCnYDNbl+XPCOJQT?=
 =?us-ascii?Q?t5hSHGvbNE7uGbpW8GA86p33J6I1ZU3TJi8shYQBJIJKQvaHjKk4/EReh7BY?=
 =?us-ascii?Q?j1wl/aYcNWlLAtFDsQib3SGB0nA6C0CT3l4kC7CjV83hf64SzO2lOL+QoE7B?=
 =?us-ascii?Q?PIHcJpFIigNPZznyAgS8EcrPbtFED582Z/jCtjNl4/vJuH7JlS+ihMxUGoNC?=
 =?us-ascii?Q?2WjPGfkrznvwOAP0lwuGjbgqAxCd2jYgNPr8cLae7+Zq6qEHp/jqOK9dEwhR?=
 =?us-ascii?Q?lFWvUn7nkyUEsDsRzeOp3ev4R+0KiM6obmz7kTQuImV/fVIFrkc4zht2uNZX?=
 =?us-ascii?Q?e45rs1aExljTKg2mHQfFpEnL74bwEtCsdGYuH4I3pUrhsBZR/Mu/iVLWWvGg?=
 =?us-ascii?Q?pyl/g4E+oogTPnOLP87geWCpKx+KsHxk1/Vl/RVci1NNcf9rBpquioI3E8ab?=
 =?us-ascii?Q?vGANEIgOqAHuZe3APf6+2zywNUxtedFcqTm23kKmJX7bmE8Gz5FOVu7UjHap?=
 =?us-ascii?Q?wWGYH9BFpo+ZN+8bfA8wbhHuHHrV8XSjT56AfOrBO4iUImdZwI/2gsLlpcst?=
 =?us-ascii?Q?P6OewxicA499H1zVlEevPwbdmm1FsR1skbPnGwZpLITN1dcb7d4CNbLmKnMF?=
 =?us-ascii?Q?xQRXFqTGOq8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wkUkYkB4cK/zTGdObOnn81Z6q7tUjCnDW7qB4RjnzggMS/pgQvATPZ7JPiXm?=
 =?us-ascii?Q?p6T/RdRCQtIfSXRoK0DCzuCJ1cMYIUxdyEPcHYItFBkJL0QkGokOGUxR2i+0?=
 =?us-ascii?Q?Y/kvdVoAFKt/kWvOdRwirGAsWZmyugU8OdUH9h7ULND2LWIOXQoKn3uzEEhb?=
 =?us-ascii?Q?HPPv3sxj2Gk06vzAFYTQG+99qWmktO0hT0u1h0A2mrgQM72vT72xUAPlWe/Y?=
 =?us-ascii?Q?Pip/5A0Tnx+a8GOMacFyN7EuA4Cso/ud3T1RvWpUcWbMoAFiQwx2QgK6/z96?=
 =?us-ascii?Q?1BL+zgIZWcPlfor6JG3R8XFdcf2Pup+AgHXo3lxK1TNKL2/6+31jR3R3CFgU?=
 =?us-ascii?Q?ESll7sp6Td4n5FDA0ff6/xCwi8SlkjWoRA4ziLVJJwU8wwgsXyDCnsOCmDHI?=
 =?us-ascii?Q?/gLZEh3dG0L9i2200U7QGoZ4gYi1dUHCXh+wBxT9X4+HyDbFd2Ci0LqF1i2p?=
 =?us-ascii?Q?PQSDhfgIVx3FdDpR3ED8KkrCOx4HyYuzZZXduKiZqCJIrgIGi/7rnTXCumzS?=
 =?us-ascii?Q?aubNbyLZAbormw1GtJ5zBMMfItT3y82TOOssAi1L878I3wKnUlg7fYjNJ55z?=
 =?us-ascii?Q?09x8jB9MoU4tqOlxM19lEqJrmP1w/NDRHnFtroTC6yhX8BSQiPBNAV0rp7UF?=
 =?us-ascii?Q?VfhVDhHQ33cSr4jsAPwZYzt0gN0hRTEXs0Gva/9Yn+0PCB2PHxk/ETGmmGcw?=
 =?us-ascii?Q?4h/dCwSL0nmiBnJvKzqr9v+RCkBsk7jkN/Liur8CezHyf0ue8i6zvBoHbl07?=
 =?us-ascii?Q?MX0Q0wqZ86e0jdqCxu3afL3NmzU0XYiGGTzlE5WuI19W5+q+ByoWCC+YTVbd?=
 =?us-ascii?Q?TSf9ahybpR9D8e3CBpwqYPFU7rlZLspqoDewDP5c3hbZx5V8SloxRkUNrhxp?=
 =?us-ascii?Q?AaRTsZWh4laUgfhvqPSCo1CXOmLE2JAP5Q7G4ZeFGEtEPQPDZ3jYarNstZUa?=
 =?us-ascii?Q?3QxOlPjvrYfxtC15Buq/EYl52tLML5FBYgilqaDcdc7kK/KSoaIADEpF6m0Q?=
 =?us-ascii?Q?9FvVJczYBbwFMPEjO8Bw+bc1cUv+B4M3fzI+p8ISORSEcUlZ2nHh2pWshK39?=
 =?us-ascii?Q?n4bsOHFnLKz/0jKpzpHAwnlFtr7+N3k+fCJU2u08kRSIqZjUP8KNtDJ/D/4c?=
 =?us-ascii?Q?FN6Weh+EEiFevCQ4cJLsJuuw8/b30a3Gb4Wonw4is6BMHBShZKreYNzUtdp+?=
 =?us-ascii?Q?xpG+X/MtOmbVErOrPZ5G7MUCMpIyExogOCqBDrCXeLBVf/ZoZi2vFYSQHlBk?=
 =?us-ascii?Q?ogmINsSDMoLos+ZBW2yVRq90q0N7PnjqC/3U+vvNrreT0KIimyKr9x7tS5Q7?=
 =?us-ascii?Q?jrTsV87PhcpvXTqFBFbbSIQWSobu3e0no6u0YdA/q6jpQVtU7ItdGyx1uj9h?=
 =?us-ascii?Q?GMLcM7emtITnHWq+8BKesMHb8uTWuC2JWLSI/6cNfmYJJ86ckrMGcelRUCFm?=
 =?us-ascii?Q?mGB6PEnv+kEDnO4HL3Axu6lu1kqcT90WAY6GSeyNp0cQsbZ4nvFQVnesMlCH?=
 =?us-ascii?Q?uBRz298O5xP41vl974Trg8b41Pmagl6K05lHX6HZOgRarZSNIwMLnYTeT8Yg?=
 =?us-ascii?Q?OS2WSFKbtQ+d6gdWL6KoTu2qI3HHESTNr31VQzroo6QeGJ8bSjkKwU70hn4d?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a987189-5f02-4c87-db35-08ddbe2e1aa8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 14:45:38.2525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgMCUCWaduqkjFdoYGkG8kYboW3OFMJX3kD1WCs+rZGz0qDpxKWdfjOYX4O30wDrpl4hT8TC8d3eObkHYdsoFWuR66tVZxJyj88Vjblrmzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
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

On Mon, Jul 07, 2025 at 01:38:23PM -0700, Juston Li wrote:
>Add TRACE_GPU_MEM tracepoints for tracking global GPU memory usage.
>
>These are required by VSR on Android 12+ for reporting GPU driver memory
>allocations.
>
>v5:
> - Drop process_mem tracking
> - Set the gpu_id field to dev->primary->index (Lucas, Tvrtko)
> - Formatting cleanup under 80 columns
>
>v3:
> - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>   per-driver Kconfig (Lucas)
>
>v2:
> - Use u64 as preferred by checkpatch (Tvrtko)
> - Fix errors in comments/Kconfig description (Tvrtko)
> - drop redundant "CONFIG" in Kconfig
>
>Signed-off-by: Juston Li <justonli@chromium.org>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
