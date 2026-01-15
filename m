Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077EFD22328
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 03:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D731B10E6A9;
	Thu, 15 Jan 2026 02:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuUoFAnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4893E10E0BB;
 Thu, 15 Jan 2026 02:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768445646; x=1799981646;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5rggWCnHGfJKdXZf3vw1bR2fOdp+SBqcLaNW/okztaQ=;
 b=SuUoFAnB+N4IYMwIcVCFc1yqoIXOb1NOLMGEiE7GPswf2HvD9uB5OP5y
 kUPZFqZqL5fMYGq/kwo8O5u4sz17s6xQKRU/3lZFK+01bgiqwTcRDx83A
 S/d32Yfc4MtPmfAZRDat2rsMwuCo8Sedrl08w5ziJHGCoW+sAf0W8PSpK
 6Q1TxByZAGswJs9OogIScP8/9h/k7wNizGfqw/MhrtVeXkxYtRaOHcW3r
 UnttvUp6M5Hye0pT79dPBBbfBXIQD3KgTkkeI6hFAwzJJdPEwx1yEVINl
 8zqDgT/zHyW9HdyEi+eGlg8AXzE3W6PWQ3a2TMYEjVFh/3MlY7IfRPbQp A==;
X-CSE-ConnectionGUID: o7767eXfRIWs921+M6X2rQ==
X-CSE-MsgGUID: CIAHWjv7RN+WtsC9KBP5KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80399239"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80399239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 18:54:06 -0800
X-CSE-ConnectionGUID: OsZpYjzsTdmH968f+umyNA==
X-CSE-MsgGUID: Eyo9CeUzTBOfr+ohelWPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204461161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 18:54:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 18:54:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 18:54:05 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 18:54:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn91flmAnf005kPf+8QsSbByMmjIK/OLQMaRQ8LoWoNxrbxW/C1ts1pSbwAZG655ZvmE3LQ8Rs+k2g6kKyxaWBtr4g5eSqfgJUpXqN1tHUFINf3nl0LrUKGf1PU2jLnmtvne+wQsZ+iJWOWdKxTaBqCyqizuQz7HIzAsTAl4Kd/9Z8Utq4j9Cqzo9L8gO7xHV3bJfi3A2LBBnrtLiQauYtcq79runn8+fUHTJnOUq74wP96khUTwJY1TOrWtekTdNBrVW6TFAt4bB8Ts0Hu0qXRKfWcRXJ7vrlq9eCOnkaxBksxdsaYtaHnBBmnNtdk0GNt8YWUbZmNcn7t0Lgl40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnYeziFkqHXt/ny8+WNhs9wH2bOXgGB54lv87lWZ+no=;
 b=q2W2drbCUbqLusN3MY1pgCwQ+Anduvdp8BY/NdIIfDXJoE0VrDHHy3Z/xTr0laWQiez/Kb8r/aGfCn3Ek4melKwgcgjSlp58h4OIVZkS4Lni5fufkC7Tj9lv/NiFaDGUz3un8XckBGgCscmHJhkiFY9PorDRuuUT6X1/fTNXZF6yRM1lScScZM+izl2PLD/ghO8Ns9nNd8tRtkB40TVuZwnN8ow9EwoCVUrY6wQ5roieUf32w5XOm0B34XfUP22rpX15MoGNh3Gk0DHPtbMNxE6AV4cikNRsYs4x47wXQTShNvZbjOiUj+jixLqvfHgZ4KGAgdqWEFxEgL1F3ZKFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7941.namprd11.prod.outlook.com (2603:10b6:208:3ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 02:54:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 02:54:02 +0000
Date: Wed, 14 Jan 2026 18:54:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, <linux-mm@kvack.org>
Subject: Re: [PATCH v5 2/5] drm/pagemap: Unlock and put folios when possible
Message-ID: <aWhWyEUlp13PycO0@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-3-francois.dugast@intel.com>
 <ce644d03-2257-4bfc-ae3e-3d6e578c3cad@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ce644d03-2257-4bfc-ae3e-3d6e578c3cad@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb1c9f3-bdf4-474b-887e-08de53e156ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vFVDoI7Vjc+XIv95tQv3RLeIptR8GnOhc5PY5lBAjtAOASkE3cHknJuz96P+?=
 =?us-ascii?Q?JQ+kWo3Fiz9xW2uqYxg/+1hw5skMc87+6WuwIJi0CuubFgxGVDC1H190tGv5?=
 =?us-ascii?Q?i63k4cDe794I3gQvSX+z68g+9R0VrF0+uXFLVh5S8cSgMdEcAkIqojhJORNV?=
 =?us-ascii?Q?ZM47+o0zfeSFLR3s8lfGEBqR+RFM7qhiHwtRNiC2K7vel8j1yl4UXCyVVWlt?=
 =?us-ascii?Q?7lzt57pOJKbCRVWNl5OLEN1ZostthedRj+iV+bEOIZKC9UE4ubosP+1D9z6p?=
 =?us-ascii?Q?led99Z7D/Gb1iZ99J3HyMkc+kpP4yBRzfuE/lGUkI9X/SB9TlI528QKff11U?=
 =?us-ascii?Q?AghQP0VDGQ4BQRouOLGxxQc3O0OzlJj8B3sa1qrLkNX7/SM1ypXIZgandG1F?=
 =?us-ascii?Q?BWa9I/xrDbZbAseOdubChXpEpMdjaia1nrXiSRdoC8zOGI3IKbVVQ+ZlVBdD?=
 =?us-ascii?Q?4YQEgtv2I6VQt6FR8PSEzUV6mHTz4akeW6d9juWjwdKZJFBiHuYzxLieyHAe?=
 =?us-ascii?Q?zhIVq2AFSLn4/k6MEU4sYwWFtSPxpbLfcllnlJr0o1EzxSIeWvT6IJyJXlbL?=
 =?us-ascii?Q?3NaRwKYVDKPbV1TRGKwhqX4+hBXuhiv+D/tosXVLL3Clww38ITSO1MVDdL1o?=
 =?us-ascii?Q?hGmQeuHO4gdEnxLhtzzzxJwmYh276IH63OAdXlWFlBmXaVdq25s7uDOpHKJI?=
 =?us-ascii?Q?a5EdDQl2ygRXn8JvezCrMQjvy0KdJ94ROPI2Jv4ud843QKtEWkHrGOykMqN8?=
 =?us-ascii?Q?oixLnz/SKYZPa6pvQ9AKvqMmIVnHXOUPF3MLL7HfJPVS90wzKGDdqhbaRAIv?=
 =?us-ascii?Q?w/CtTKD8FssNT0Uf6JRvQ+0htFnTafbEuUfGS4kD58528wZePl9Yn18ljDip?=
 =?us-ascii?Q?6GQeQcdm86OgrWtRYgNY0b96NWpmTW3hRgo+7XWLjVZt1kWGplK4thukrYNZ?=
 =?us-ascii?Q?BWVSGIxzlkNG7A0mOwKQNHRVcl36nS1yheMiuyIzixsGONyyDaBkTQrTiJUC?=
 =?us-ascii?Q?VNyhKGoEO15TNCotgw3t7F34T+a1PeT0Fx/oc3OORdZUj7PL99wImok+qmYG?=
 =?us-ascii?Q?ETOV3AdTUshd661NbPcLjr9QI6Mz8ViHl9LvB5kXfZOhT5V4W1StbmNx90lM?=
 =?us-ascii?Q?5q5KrtxcpOvGGouv+XF4SLIl9y//AJ1esqYQobTEe7CGXTZLDHfPSktQieru?=
 =?us-ascii?Q?Lvmd1TRJ5KhSc+7kAD/nxSrGly4rhGN1s9CK9aVyY5p0PsBngLTgxEvebwKC?=
 =?us-ascii?Q?Sa6+TMSojbqJ06niyqRziVIQJAycgay7jjnQlVJfyD1ptLKQVBgBBxQNGn0N?=
 =?us-ascii?Q?LlsKe/gg+k1Jo+P/lDgdzo/lfXg5tUhZKP5tdsG5lXXAKIQ/mtno1NKDn2jP?=
 =?us-ascii?Q?TGHwJhZEEMAZWbLBkObpjdSzUmzwfqBDxZUUOfAexvni1XB9i6MSU0P1cOe4?=
 =?us-ascii?Q?OdjWI++NVoJ5gKOBbh0r1g8AlRZeNEJYU3kPsxSABZ7PqK5uidzcjORwlJJj?=
 =?us-ascii?Q?wAqogGxb/qGpsR0EhWztLuM06WTGGDc7rFLOoTGFkp2Zy7I0PZ8kvqn38Ww5?=
 =?us-ascii?Q?zr65fPzXdencgfqoQfU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRDCWOdCDXdEoCMS4hs68pvezsBHSJBj/Zqucnkrh1JTW3xFKcONCDPtJ2Tc?=
 =?us-ascii?Q?hDq8t/W1wMG09S20Past3lOVX+69Eu0ijIsYiWLDGB/DEXfazZAXP4uSfeU+?=
 =?us-ascii?Q?bPDDswyTO7uerNE1r/aw+ifmzL4cbicsCxqwVIi8OKjkVQmRT6rxuS72o80x?=
 =?us-ascii?Q?T9ekvlmZ2tE6YpZTpuzZSMvZB4FpnKX0jN/FZWIKTmxWVc4j6S9b8B4nBF+B?=
 =?us-ascii?Q?tn8VtLi8K7MuxkP9Vrnl3PfWmA4v3T8WYsjKFLYYQLocsD7CEo9a0fQspOhS?=
 =?us-ascii?Q?m90c4qVcJ1VnvSknMaiOGTNA4kPRSpo7bdoPgOGn18F58q6KWXOf45pdOb2B?=
 =?us-ascii?Q?e1AQb5iIJU/qmNCqrLTI9pl0koXkeV6VlBL4dgQCSPWuYsSvolOe8djSOX9m?=
 =?us-ascii?Q?yf5Wz+APRD6u7SWDwqlt9K0J/HuyQRlIGzufaavcY/K4KHryOFc1adsm71o8?=
 =?us-ascii?Q?rTHtsmSdAKl43fxex6k591G6yta5/w272jKDkozq1kWho3tODhcZh3mLGZBJ?=
 =?us-ascii?Q?bXDleSmcwix+WutvZFEO8CQZY0xVXrF4t6OZhZ9luf3P8Vks2jzv/jj4PsoC?=
 =?us-ascii?Q?yPUb/G/OtNO5JMvjEplToDrPScQJucY8DxK/ughIRMCQ2mpwIUaDOSFvxvur?=
 =?us-ascii?Q?pgR+UkhktscTREEpnhDnRQfu+eeC9ISFAeEkG+H5RnRxfizR7oO9fc8LFLUG?=
 =?us-ascii?Q?rO9y9wlrNyzfNYFo5HHHeQBPn2/ZeDDaMlPV8+EtHDhprSFcI5YyM7/fahV4?=
 =?us-ascii?Q?42zvpL4g9OVXji3v/ZtqonrvgqJH62T05aaC0jXUPcSrtkoEINhzLsHNPYGc?=
 =?us-ascii?Q?HIMC0g2MA9WIh8dOvGltJUVT5Nxhm90CUVIp7Tp8gKUUcfgH3LUh1p6Vmu5S?=
 =?us-ascii?Q?vTaw47QzUj03kKBY0qwnoxWwegjeTjlmvODQ63Y/LH+ZlR8SWdI/gTum30nT?=
 =?us-ascii?Q?eJyyvZs7lV7PEaqNN7t3aLg7Zo/VquHrHjLSss8ftPLg5wwICjH/I3atKh2J?=
 =?us-ascii?Q?AL1OTh1AD+bQ4JSgokCl1onq8Ba4uuQ//Es8CiacvOaMndmU3o0EN4xQIZFb?=
 =?us-ascii?Q?EFiQF6UkPxJu03zJbcTNPRqssh419ve4JoEvfPzeGw6ZymjB1dXGhO/u8Y8I?=
 =?us-ascii?Q?HUXLYpDEZTQCk5L30ySswzI4TcGBYtAo0IFpZ4J+j/zhGY1LOtJfVHtKgDrW?=
 =?us-ascii?Q?F0obr1sPg6AZ6qAwRkPhwOV1lfApW3OOhBo49G3RBIJyl5L7KWsPy/wR6RjU?=
 =?us-ascii?Q?BzXavczZDtHWCrisUnZtGMsmDbqeIN/KRIBs40tlR0ZEKvJLI+3413tTWfw3?=
 =?us-ascii?Q?5WHOxbZS5J/S+BkWlHg63QbFnP0eorBIdg21bCJbB3nzAtjU4NA9fhAd1AJE?=
 =?us-ascii?Q?T/jq0N/qgd1ZDCwhB1619WJdr/PPD0cdxKJBTl9P4PnAGpwSbzLvwXCpH6zk?=
 =?us-ascii?Q?kyLRaGbGmbc3r5MDobkaHQuF2EJC4OQ96H7OTmV0fN3QFpeje5qqk89MXAbM?=
 =?us-ascii?Q?8YA7ymai3bOQlHbfDhNDusCEXSAGvNuCeyhAHbpK6Wp78/38zOJPTxye/wp2?=
 =?us-ascii?Q?GCoqntKUoc/Uc0NSeLlpPYaVq3bGROx/xbN/P5TKwW8rVLQyOt6UncJl1/pe?=
 =?us-ascii?Q?vht/SZ1V4s+DpSCsyblIEO72xLYZjE7jZU5g5nM3CYN5j31O+Jwivx4ptMW6?=
 =?us-ascii?Q?wqPweajv3f35X7dHbaH6J9TN5VuzgTqJ7NsE9ejiBKMLtNmU+vCAjk1AsJ0D?=
 =?us-ascii?Q?ph35v1Irv/nr+G/HbUUiYTu9eM2C5FE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb1c9f3-bdf4-474b-887e-08de53e156ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:54:02.6701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb3d/rgCmKeMt/RdaUgVQonW9AjUjhgRZnW2MAQ4SrGfbmV6GFeTKpwTC5dthCl2D6qWO7RgOknKv8vZEKuQug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7941
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

On Thu, Jan 15, 2026 at 01:41:11PM +1100, Balbir Singh wrote:
> On 1/15/26 06:19, Francois Dugast wrote:
> > If the page is part of a folio, unlock and put the whole folio at once
> > instead of individual pages one after the other. This will reduce the
> > amount of operations once device THP are in use.
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: Balbir Singh <balbirs@nvidia.com>
> > Cc: linux-mm@kvack.org
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c | 26 +++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index c497726b0147..b31090b8e97c 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -154,15 +154,15 @@ static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
> >  }
> >  
> >  /**
> > - * drm_pagemap_migration_unlock_put_page() - Put a migration page
> > - * @page: Pointer to the page to put
> > + * drm_pagemap_migration_unlock_put_folio() - Put a migration folio
> > + * @folio: Pointer to the folio to put
> >   *
> > - * This function unlocks and puts a page.
> > + * This function unlocks and puts a folio.
> >   */
> > -static void drm_pagemap_migration_unlock_put_page(struct page *page)
> > +static void drm_pagemap_migration_unlock_put_folio(struct folio *folio)
> >  {
> > -	unlock_page(page);
> > -	put_page(page);
> > +	folio_unlock(folio);
> > +	folio_put(folio);
> >  }
> >  
> >  /**
> > @@ -177,15 +177,23 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
> >  {
> >  	unsigned long i;
> >  
> > -	for (i = 0; i < npages; ++i) {
> > +	for (i = 0; i < npages;) {
> >  		struct page *page;
> > +		struct folio *folio;
> > +		unsigned int order = 0;
> >  
> >  		if (!migrate_pfn[i])
> > -			continue;
> > +			goto next;
> >  
> >  		page = migrate_pfn_to_page(migrate_pfn[i]);
> > -		drm_pagemap_migration_unlock_put_page(page);
> > +		folio = page_folio(page);
> > +		order = folio_order(folio);
> > +
> > +		drm_pagemap_migration_unlock_put_folio(folio);
> >  		migrate_pfn[i] = 0;
> > +
> > +next:
> > +		i += NR_PAGES(order);
> 
> Is this just a wrapper on top of folio_nr_pages()?
> 

We might not have folio order. This is a macro defined here [1].

There probably is a similar macro elsewhere in kernel that does the same
thing, I can look for that and clean this up in a follow up if I can
find one.

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/include/drm/drm_pagemap.h#L9

> >  	}
> >  }
> >  
> 
> Reviewed-by: Balbir Singh <balbirs@nvidia.com>

Thanks!

Matt
