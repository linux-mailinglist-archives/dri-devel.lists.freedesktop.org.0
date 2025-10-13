Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959CEBD5596
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 19:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E52410E39E;
	Mon, 13 Oct 2025 17:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZoFoewFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE8810E39E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760375165; x=1791911165;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7fZDM8vGagUByx/l2wZoO782G0y0W3xukf29mrT+TrA=;
 b=ZoFoewFQdj1vW9RfGA/Hwlp+TYzf6Xsugg4W9UTKS58zrdDLYjxHEISE
 J/xUoeVkSb2RjHNT3tomVb7CjumIYwEN1qO3nWg1qV1mU7BedZwno5amE
 yBrYDpJs/qryxIAqeDF5VTQrncFJ5j//UQ8SgdkJ3tsK6rMhfKhRMdDvT
 H6qfbFEpLhG4WQxsTlOyE14+M9ry4oL8lHbIqD6U0182rB6956cC4v3d7
 33bM9sv2z+DXAs2V0KGI0qAehbA8TdSuSogA+6yZGxgeS9hKFQRZ7z0KR
 sDDKBi8FTa72xI5XjH1fB6OsaAsuAZ2gDb08I4t1ViKbkV4rrC3BxCRPp A==;
X-CSE-ConnectionGUID: qtBkSWc7RVC6wH1tilbjow==
X-CSE-MsgGUID: hCmAJjZrTkOyGcY4rXjAmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62674598"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62674598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:06:04 -0700
X-CSE-ConnectionGUID: Nw8lDUv4RjS59r57YSWNVA==
X-CSE-MsgGUID: 97V7inSGQdWOBFYOvqNalw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180888742"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:06:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:06:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:06:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXwgf+TWC/QBEsuO6V1az1C4SnlDvg9uEPyDvIyjD4GS8i/eGBC0AfsPP0RU26f36/FyQm6ozHkhniKwnfr8JNWeaPz/D14orCnN+waOUVv0SLC9AfSRdgUAp1fmd7Fvj0BCw5DefByO/W30E4WAaKD2gydB166CJw84tjzEKh9o0VUQYPYp9NETP4l65gVLJE8SPEgaZSzUfu9ul8yE9mQ/6Eix2wCAY6u8flwE6R+yP9/GBUdzdzwgNMe6HLbet+FKgW6lNriL8yK2whi4qEKmxiDu1r3Wa/qMHAzQu3ztGuKGgtQ19LdbKq96L3YuGR5+8aQDf3kgugwIObmhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zvpne6Cz2E0BZ69/Xth1qJLFBn9knKoJ101WGnRW1FM=;
 b=axwyznfjk2WdtjDeyLSIxovLYv34GyXyEJDvmao6ZXUh05CPiANfXYKZArtNYpqaKpZEG4YkTq6jOC5wbzqxuAS3MvSkjFPUafkx7dG923u3kibl0uhaUTg7i2B0MWpgdU/85maT+tnecBk4LMb+zvKRZ85VsRIxhYiKA35Q0UXTzQkc2o6udaZfgtHiJzH+oLmHyfTccSPM6RUQG3hjkyF9qqsrNXLJSyMAnuB4yuuGv/2ua7mCSQCHWSzsNk7by+IsgBL01p80fmRjSDOebZ+q9l1WseIkhHxwiLoZWprt87hYieqnJIDPEhMX269GG6xTI/RFDxVOd2OzDKdbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 17:06:00 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:06:00 +0000
Date: Mon, 13 Oct 2025 10:05:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <phasta@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Rob Clark
 <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Danilo
 Krummrich" <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies
Message-ID: <aO0xdLWYdPOKE9r2@lstrano-desk.jf.intel.com>
References: <20251003092642.37065-1-tvrtko.ursulin@igalia.com>
 <6c150c95531b3d401b1dceec8d328a6d77b6849d.camel@mailbox.org>
 <fa1cf2f6-a82d-46f4-b1ec-b07e678cad76@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa1cf2f6-a82d-46f4-b1ec-b07e678cad76@igalia.com>
X-ClientProxiedBy: MW4PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:303:6b::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: cc30c71b-508d-42b0-f327-08de0a7ac8b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZPL+pDz+PpnnhhyKL9szZuQzhF5ddkve6yVXmWg0KnogtPNhjVVLw7Ekqh?=
 =?iso-8859-1?Q?9q8f4YRA/FLvrDjyK9Wx/wpBtjV2//r7FTXM/fEqIxXES6a132JoT7vnZc?=
 =?iso-8859-1?Q?Pjox7H1upi5iKBLsdTwh9fw1NMrE6XW7UF+lcHygQm/8Pj5drTgC1+v/Y6?=
 =?iso-8859-1?Q?K9INVEvZ6S+FVwDH3zkSwN84iKXZjQeptZbkcDT8bkjwThFCokqJvJ56Q7?=
 =?iso-8859-1?Q?vkLWtJJebcxfGd88VkVtSt4nlVngTC3sfa6K7s2DwV2JvELi2xW+Qk2JE1?=
 =?iso-8859-1?Q?oDntViJDV5iNLL1/usmKmIMps1ctdRFgQn6tmEQ2LxUNUY7yQnYUa02kxk?=
 =?iso-8859-1?Q?1AuCSe26fRV0vhN6UV0GkJd/KviVfMqRCRYrVKy/a7g770De+WQA5U1AZB?=
 =?iso-8859-1?Q?q3SpnMcyanOaE1kMtTI/Vdxj2MoFBNpGUZKrHNv7I5U54BXwdWllCTwuWL?=
 =?iso-8859-1?Q?lSj8bNIejO5Mt8B5VCGjvPQpC+F4HmKr55LsFAdH1ZJCMGv5YaKQF8X99Y?=
 =?iso-8859-1?Q?axXjyzU/hTRi5n3aU91n01I5IkZeAx90vSJN2/y3BFQzTInAn7NBWZiR4N?=
 =?iso-8859-1?Q?dyw1GW+MubpgL6fvca+Fc0IdE8HXyXsyw35+ODWwBW41BKZagOZW49GmKq?=
 =?iso-8859-1?Q?FG8ENtrwIUIvvnEo/3jErH6a+Y+IsMxDl+665T/YKFeJn3gUeiRu9ducQB?=
 =?iso-8859-1?Q?VSEz75kFU8/l0DykNcnlGTzyISWT+PsMR60gbuOJR4Vkwflc/7uErLqPPO?=
 =?iso-8859-1?Q?lsBZTEUrUkFwhY8OUVDi+iyO1Cks8SK+tlf+KSZkcpqGQisf/04/QcrYVS?=
 =?iso-8859-1?Q?z/YIIJ40KNAV5cs+/aNfKi+Zb5TYjkOXSj7t/LravnU9yDOAqBmDgh1bc4?=
 =?iso-8859-1?Q?CR7E1FKtOl24hNnZ+MJB+dbCbJKFWEqzUIV3Q4isq9lCSxXiSz5clUWa9H?=
 =?iso-8859-1?Q?saPfPM2JEpy1FNHjRz8Y6GDlFa2/YGQUWSuNio5ptNFFqlua2Rai/yEWzF?=
 =?iso-8859-1?Q?ld7QwJXBQZBeNNP3npOR3H23o9xJww4ahLo2uFTlp819yDe15d0Yiizu/m?=
 =?iso-8859-1?Q?dbjNM6iZOSJIixCDbhxbMdtCtmwu5sfDWyVAO7vwfy+U/YQdBr0KXOsJTb?=
 =?iso-8859-1?Q?FKB0o29Vrkckcv2O7iTVrJOvGNr8YaQBAmQCdmr/HRW9UOvy/fF4IIM+qH?=
 =?iso-8859-1?Q?epQgbRKp4/9bUC1HJ4UA9ORZjDtm2GDPayHwLYwcKEWZgdBKvy7HpwmuPP?=
 =?iso-8859-1?Q?0pBijSkCz9A5srpXsEUP/38wgjFnopUjIZJtitdQFpfAjfYObzecboSbYN?=
 =?iso-8859-1?Q?hwmTS0+AgnfVt+Wuu7d7IYQy5hqIYymIDKPwzAIE1/fM/a74iGjJJ3RW9u?=
 =?iso-8859-1?Q?ABvPFAitaNmNfzABP0bMYmOvHtatbr27tRW10rqMg76Iwe7wk8+oGrtuhy?=
 =?iso-8859-1?Q?ZCpUHDuSdSeXXRt/q5UG6dbMmU2VCvhLfAg9aiinqeSdhAdz9LHm9/Iex/?=
 =?iso-8859-1?Q?DZ6NNy1vdwNhkz5rTeWWIZmFv4ylv+oiJX1bAq2SxrRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XxCUt9cRn/Jr7535JwFhqOVn9qWiJzPpoqkkJhabrHMJmkAGzsU3t4AJgz?=
 =?iso-8859-1?Q?TNlKC00RLa1EofF3ZArK/14F++BjDj+rqOCXicd3XQxE1133LkVkf0jI0G?=
 =?iso-8859-1?Q?V4eyGYMeQCNN5qibYOTNPNSectEnP88kEKpQI+97elg10+aDDHQVJo/oZx?=
 =?iso-8859-1?Q?4D/42Cpf3M+0lJ0uM90uadcLE9pJSFQbpdBi1oQi1zQ/KxaOFP20ZFLRtq?=
 =?iso-8859-1?Q?HIrdo1rB9d5zImwy78G0JjDHkj03C4nsTnTv0gycUK4gVjKuYQHynyGDt3?=
 =?iso-8859-1?Q?76LXHox2JR7hudiyWrUmgH08ZTpyUsPfF9Hnuk08JSJfK679b8rxxgTxl9?=
 =?iso-8859-1?Q?FB1/i0J6kZd0Vrnuo+WwUNs1kOV7fZ4bB7IDaCgx0nc5mbT4m9N9R8Mf0h?=
 =?iso-8859-1?Q?sdMMXa51TxNwakNz3Govo7YYRzgTpQGSdsBmuH1kWcpQ8Gd5MwmlYuCBlJ?=
 =?iso-8859-1?Q?LFwkbwGwuT1icv2HEu658cGwcsSUthQgdD0O7ZEpK8I7HtN4CzxNpzyNZ1?=
 =?iso-8859-1?Q?5JrEHown+TN2hz4kazF5oEWwcQrkVEk7S7Yz/tgYQ/Npid/7bXtOlK0gEk?=
 =?iso-8859-1?Q?5w3HlUVjHWYPMts+7dhEy/JNiHhWMSL6sQXRxWJ0aIkRbhaX4sBuggDiPc?=
 =?iso-8859-1?Q?LgIByCswtZGneqNHdvKB9AxVfXI1eIux62NZCOO0ox7TfKuwjLJkUPvfX+?=
 =?iso-8859-1?Q?2IXBB/yeuWw3N3PVcncMmVKVkRH8pjyeDqCTzZWowgcKzuKzSLUiDWFc7V?=
 =?iso-8859-1?Q?/Oyw+1mcV0ApsCCzh//M/s5VVzPOBso5Y5qf5De2mPocI1H3NW4hqaUQyZ?=
 =?iso-8859-1?Q?YdgZiigr8NO7wHZo4R0VieU550mR/oStf+NtJSKROXcg2NqQV3+XMKdJ2c?=
 =?iso-8859-1?Q?KqDEO5Lixj0Zf3pW7jXDan35mstc+9Gc3AqXg3r6ZylGdkkMePnBGBU3Ae?=
 =?iso-8859-1?Q?otKYjJWSUs3XxdkIM8Vu8geXShYE7qe0voRXrrAfaWD1J9VT0kcUY4NAbY?=
 =?iso-8859-1?Q?utotonaqCcmUbk+1VCT43GMp5XpUN7uB7aw/pjG5trayvG6ewfm45oFX/Z?=
 =?iso-8859-1?Q?MXZgcv/fY8M57uL22ZjlmNs1UJL44j8Wa6+6Vmfqwgs/Tt/y4SUY5SDsaS?=
 =?iso-8859-1?Q?MKQHF4/GwsKzPPbnzXOROF4V8bstXGAbKumKjXR4Bt1klm9nl8BjVmx/HZ?=
 =?iso-8859-1?Q?AH8yT5AggC0cUAG8APV9wRgaq8hV3PBV/vReZWGIFTlGzZ9WOga0ki7Muh?=
 =?iso-8859-1?Q?fLjLlqO5OXP9h3cGAzfvvPnRuQKfVA9Dkeght0FaJc55RqYNRecAEYN/MZ?=
 =?iso-8859-1?Q?MB/hyjk/h+7YbikN63kdfS+DYWqfXGIwK8GLvGHBkW8ewxswWp6Q8/JvLK?=
 =?iso-8859-1?Q?2ng+0uZ1I1ZYYF92G9u1gEzDQjasW+0KcWKH2XVTibaLU/5AyXvC1umyrd?=
 =?iso-8859-1?Q?uBaM+qQvlZ6GIMc+/wPWxmgiuUxo97QsN6iuw4uEj6HE8hZ3KxyDqiMGVy?=
 =?iso-8859-1?Q?hIPDFJIonVZNsVT/jW3WUgodBy9eXWLDngCbJ9ScSI2805Txh0xJItrKkD?=
 =?iso-8859-1?Q?NHlwIZ4oO0/9hPl/6wErh/6fkX7Y74zD+pnzWZmBIaIKwg6OlyggX0itq9?=
 =?iso-8859-1?Q?8CQN7Kd+ykqUl+9BwzAFVkYtaTdItrXOqlkYI9cg70Ms2RhRD67kEFyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc30c71b-508d-42b0-f327-08de0a7ac8b7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:06:00.4818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmClO61zZwTOmVYO7mYnwlo+iBXG2dIwrLS+nFywFgcQz9LhFl1vLP8WMkQ6biL6zkDJj8Qof7r5Spondy0FIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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

On Mon, Oct 13, 2025 at 06:01:49PM +0100, Tvrtko Ursulin wrote:
> 
> On 13/10/2025 15:39, Philipp Stanner wrote:
> > On Fri, 2025-10-03 at 10:26 +0100, Tvrtko Ursulin wrote:
> > > Drm_sched_job_add_dependency() consumes the fence reference both on
> > 
> > s/D/d
> 
> I cannot find the source right now but I am 99% sure someone pulled it on me
> in the past and educated me sentences should always start with a capital
> letter, even when it is not a proper word. Because in the past I was always
> doing the same as you suggest. I don't mind TBH.

Drm_sched_job_add_dependency breaks grep / searches, so I'm with Philipp s/D/d

Matt

> > > success and failure, so in the latter case the dma_fence_put() on the
> > > error path (xarray failed to expand) is a double free.
> > > 
> > > Interestingly this bug appears to have been present ever since
> > > ebd5f74255b9 ("drm/sched: Add dependency tracking"), since the code back
> > > then looked like this:
> > > 
> > > drm_sched_job_add_implicit_dependencies():
> > > ...
> > >         for (i = 0; i < fence_count; i++) {
> > >                 ret = drm_sched_job_add_dependency(job, fences[i]);
> > >                 if (ret)
> > >                         break;
> > >         }
> > > 
> > >         for (; i < fence_count; i++)
> > >                 dma_fence_put(fences[i]);
> > > 
> > > Which means for the failing 'i' the dma_fence_put was already a double
> > > free. Possibly there were no users at that time, or the test cases were
> > > insufficient to hit it.
> > > 
> > > The bug was then only noticed and fixed after
> > > 9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2")
> > > landed, with its fixup of
> > > 4eaf02d6076c ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies").
> > > 
> > > At that point it was a slightly different flavour of a double free, which
> > > 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
> > > noticed and attempted to fix.
> > > 
> > > But it only moved the double free from happening inside the
> > > drm_sched_job_add_dependency(), when releasing the reference not yet
> > > obtained, to the caller, when releasing the reference already released by
> > > the former in the failure case.
> > 
> > That's certainly interesting, but is there a specific reason why you
> > include all of that?
> 
> Yes, because bug was attempted to be fixed two times already. So it is IMO
> worth having a write up on the history.
> > The code is as is, and AFAICS it's just a bug stemming from original
> > bugs present and then refactorings happening.
> > 
> > I would at least remove the old 'implicit_dependencies' function from
> > the commit message. It's just confusing and makes one look for that in
> > the current code or patch.It does say "back then" and it references the
> > commit so shouldn't be
> confusing.
> 
> The discussion is long for an additional reason that Fixes: targets not the
> original commit which did not get this right, but the last change which
> tried to fix it but did not. It sounded more logical to continue the chain
> on fixes but dunno. Could replace it with the original one just as well.
> > > As such it is not easy to identify the right target for the fixes tag so
> > > lets keep it simple and just continue the chain.
> > > 
> > > We also drop the misleading comment about additional reference, since it
> > > is not additional but the only one from the point of view of dependency
> > > tracking.
> > 
> > 
> > IMO that comment is nonsense. It's useless, too, because I can *see*
> > that a reference is being taken there, but not *why*.
> > 
> > Argh, these comments. See also my commit 72ebc18b34993
> > 
> > 
> > Anyways. Removing it is fine, but adding a better comment is better.
> > See below.
> > 
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Is there an error report that could be included here with a Closes:
> > tag?No, it did not come from any such system. Could perhaps put a link
> > to
> the report as Reference:
> https://lore.kernel.org/dri-devel/aNFbXq8OeYl3QSdm@stanley.mountain/
> 
> ?
> 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: <stable@vger.kernel.org> # v5.16+
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_main.c | 14 +++++---------
> > >   1 file changed, 5 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 46119aacb809..aff34240f230 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -960,20 +960,16 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
> > >   {
> > >   	struct dma_resv_iter cursor;
> > >   	struct dma_fence *fence;
> > > -	int ret;
> > > +	int ret = 0;
> > >   	dma_resv_assert_held(resv);
> > >   	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
> > > -		/* Make sure to grab an additional ref on the added fence */
> > > -		dma_fence_get(fence);
> > > -		ret = drm_sched_job_add_dependency(job, fence);
> > > -		if (ret) {
> > > -			dma_fence_put(fence);
> > > -			return ret;
> > > -		}
> > > +		ret = drm_sched_job_add_dependency(job, dma_fence_get(fence));
> > 
> > You still take a reference as before, but there is no comment anymore.
> > Can you add one explaining why a new reference is taken here?
> > 
> > I guess it will be something like "This needs a new reference for the
> > job", since you cannot rely on the one from resv.
> 
> I was mulling it over but then thought the kerneldoc for
> drm_sched_job_add_dependency() is good enough since it explains the function
> always consumes the reference and dma_resv_for_each_fence() does not hold
> one over the iteration. I can add it.
> 
> > 
> > > +		if (ret)
> > > +			break;
> > >   	}
> > > -	return 0;
> > > +	return ret;
> > 
> > 
> > That's an unnecessarily enlargement of the git diff because of style,
> > isn't it? Better keep the diff minimal here for git blame.
> 
> Given the relative size of the diff versus the function itself it did not
> look like a big deal to reduce to one return statement while touching it,
> but I can keep two returns just as well, no problem.
> 
> Regards,
> 
> Tvrtko
> 
