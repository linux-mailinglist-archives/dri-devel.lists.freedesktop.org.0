Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9767A816CC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBA910E747;
	Tue,  8 Apr 2025 20:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YahgGlhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC910E747;
 Tue,  8 Apr 2025 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744143831; x=1775679831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dTzoRrFAJgBL9nEzt5bqNEpG7l0iLV8xJfvgKVnImtA=;
 b=YahgGlhgGwJ2zdUsg9zQSivceq/viR6ncOFyJ/WerGOLKoE1c2jZAv1q
 KbDWR7GiKzHHB3qSmzgx6Ovc2DiONa9okvvpdTVgtpzkW4V3Ngu/W38uD
 7QM5QMNG0Tsr7RgqaqR3mZU77bJhDodN0w0SRtia0kBHcd9WesgWjsX0A
 n+7p12RBfh5wjSsYkgHEQTgSlDaIFZ/hg8Zb76HFRdvLVRU6a2oC4YLPY
 WAoKTNFUDjcmIvwIwFDwq9z6A0sVlrByvUwHHk22HSsBi9sng0jwDl6Cq
 I2bUQfsLs1Za5SWnzCgIhSHJKyldjQ+bWFkskj3PrCuAGPCzh78U92RUI Q==;
X-CSE-ConnectionGUID: at3ab9jjTZuagqYsNu/IHA==
X-CSE-MsgGUID: ULWdH1nlSIiQAGFdL53VMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45689731"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="45689731"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 13:23:51 -0700
X-CSE-ConnectionGUID: NN2pYMjyQAeBdgM8M8i1XQ==
X-CSE-MsgGUID: KqrlCQfqQ1mXGDWu88qs/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="128279572"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 13:23:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 13:23:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Apr 2025 13:23:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 13:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mzxfc9nJJ7wbw5q/4pHBmD4ucuscRMRnZ/7+Dcr8TyMIT+W6X6v16oX2uQDv55UrrZASOtSxAsZHxGIiab3MgdnXbhlkDWK82VjP/gNP1tKEu6+eXbj3s7FUMkzBrVe8Juw/ASiXuSqVvDpu3Wl1sbeqASiyx1dZLWq8BoM+oEbUZ3bkkW1kGeVnessjbEODpmWv3etMChkEdo6EWdp87TGFEKmrjYhw9Ru3vbav+1QPMzVbQO2/ug7og6eyvXtC13Tb+k8Cj0r9NgoDs4FvxuK9ZkwciwgmKnenbdh91vAFdn3OKzI78KtyxxQ0ykBqv5krQQXesjwdaQBDs5PRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTyKgFGKrMiXM/eR/mRB3EoW0VAtZxOWBN5YMDAckow=;
 b=Mq+qkbznqb2g0RwtxDUQhRy8koHMKKhDgpZCVzcECPy00elF2SVokDVLcDnlwUf5VJUSuVQeGgfBXi+r8qnWsBy8+JoEyIcor1S/TWeKqEWKaWq3FTHK55YUHjiFtBgz0vhmknI/ihUFWjQzfRK30jTfqDRbZD9NDd8pQD3lQovYo07e4eNeNHhW5EwtgUNnGiDsB4xbMvzhFb0Knn5zhEfG2EzG8ekCfawKA9lLWFAZZzMPjd+uLtWuKLL3ZlmXaMeYXM9QYMTM2O6EWPNQYGXvx6PMXgxJzMOfVu512n/c6PDqJRrbRPyk2aqU5pt+w+6P5Bv43t84MjNc83iPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB7675.namprd11.prod.outlook.com (2603:10b6:610:122::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 20:23:48 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 20:23:48 +0000
Message-ID: <db1ca8a8-a4ce-471e-aba6-7d43be1db08c@intel.com>
Date: Tue, 8 Apr 2025 13:23:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/huc: Fix fence not released on early probe errors
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20250402172057.209924-2-janusz.krzysztofik@linux.intel.com>
 <c1b77ca1-1851-4e3b-be37-267388a7501c@intel.com>
 <1889382.atdPhlSkOF@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <1889382.atdPhlSkOF@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5ee342-f66b-46b6-5d7c-08dd76db44da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STV4YW5JU1RNVGZoSmhsOWtnN0tmTWM4KzRGUW1tejJhUlNORmt5SldXZERx?=
 =?utf-8?B?bzgxQ3ltZVYwN1drbnF1K25hNTVQSk1TNUpiSFJ6WlJkczZSZzViZmk5REFV?=
 =?utf-8?B?TkdPR0R2RSt2aldlY3llRy93UllNRlZxVmxycWpJOG9OaUtWTHZrbzF1STQz?=
 =?utf-8?B?SU5FZ3lweDFQdHZYR21Ob1VvZDJHVmNzOGlGT3ZLQlJuK2hjeU01ZU1mdFY1?=
 =?utf-8?B?NXFpY0tQYVdJNHhPeXZKNWVrVXpGYXVRUEZOQjZNZjNUWW5kdW12MS9iOFhz?=
 =?utf-8?B?dnRsdzhVd3pqMEZ1b2p6QnJhVWd3UldWMzRMejhLeVNoV1BQZEtsMkUrYlBs?=
 =?utf-8?B?VW4zQk1PRHVJZmI0ZUt1TVVlSWZpSEFVSVBhVGRHOWlVeGlQbnNaZ1cwK2NQ?=
 =?utf-8?B?YUdtNUIwRThBVzRLcnViNGR4K21id2VoT0xmSzArV1R5NG1lOXRNNUNrS3du?=
 =?utf-8?B?TlZOQmZSVFZXd3poSHh0cllGdyt4U2lNYkJTc2g4UjJ3ZFY0UXVkUHJCSHdU?=
 =?utf-8?B?K2hYd0toakhpTEVBZ3YyZERkTUpJaVZwNTFnRmRZcVUzOGQxQ1lQcXR2VFlC?=
 =?utf-8?B?UEUwQWQrQkwxSEZlQm5iNmx3RVA5dmlkS0ZIR001elJxUndkcWlZYklQOTVv?=
 =?utf-8?B?YzVKamxDMG5HN0JJRk1FUW9seEE2amYrT0VLNklyMHZqOG42TG1QQmtLamdn?=
 =?utf-8?B?Znc4bitDUFV6U1pXZU5KRWxNMGVjMERJL21lR1FXWTI1cFozeVdDYXFmaStD?=
 =?utf-8?B?RkxBRmg3Tm1pVVVGb1lzZ0QzV05MVG53UENJVUdYdVVXL0M4cUtEMFgrRlgy?=
 =?utf-8?B?dTFseVBVcnZucUlYU1UwaWxMdlUwbS9RVmU2UEc4aWFTc2YrYWlLM1ppbklM?=
 =?utf-8?B?UzVOVFIxTm52K2FzS3owUHpaUkljQ2xqTUwyQzRYMk1HRWRTMmQrSmcyd1lH?=
 =?utf-8?B?dWhPRGhZdU8rdHh2ZmI3aSt6UXp6TUlmeUpTWXdZMjl5RVZXanhLZEwycEhD?=
 =?utf-8?B?R09za3FtWlNMajNJaGVPSVBEK1l0QUtEMHEwaDJYNGVwenMwcGdDU0VjL2kr?=
 =?utf-8?B?cGxNL1RIU1BKZkgrYjVmL1dKU0hBWWltYW9nZWt0YzZGRkZEM0JlSHJnUGxH?=
 =?utf-8?B?NDdscUUxQ1Via25zNjdjbFFZRlozTjJWWEVkOFlRdDRNVCtHWkZBZ2VWNmcy?=
 =?utf-8?B?NDdsd2R2MkJkYmZsYTdKTDBCZEF1RjZHV0U0L245MVY1djUwNk5IK0U5YzFz?=
 =?utf-8?B?Sng5cTZQTHUxVEpVd0pOcXBLWTR2TjdFTW43R1NoRnQ0YmpqZUh6eDcxRk16?=
 =?utf-8?B?OWlOWU9MTi9JdUFzVFZ4MXpkUjU0TThGbFdiaDFrYXdjVzVUQWI2RG82dWtB?=
 =?utf-8?B?TFg1NWhPNmdFRzBpMG9pUGsrQ3drMkVTanNCL1NhbFQ3WWZybjJTY0JLN1Qz?=
 =?utf-8?B?YjIxUk5FQlBSWHpMaThVQXpIdXZDaE5hWGJOb2NUV0pMcjFkWUwySmIrVnc3?=
 =?utf-8?B?QkVEU3N4MUFjekpuZlR6SklBZ3Vka1UyajNKRXg3cWlEQmFNZ2RiRHFVZFNK?=
 =?utf-8?B?TE5vSTlyKzErUmNzbTk5c0FSSTJBc2dXNXVncEdHTlloWUk2MS82YWhmUm56?=
 =?utf-8?B?cUp6VkpQcGwxdU4xYUlDMDFPdEd4NGw5L041aHJSd3poblFVVi9BSUpIbURF?=
 =?utf-8?B?MFBjYzFMRG42Z1FwQ3JjRnFWVzMzR3BQR0ZSMXJtMXhZMXRpRHZpTXZQREJK?=
 =?utf-8?B?VGRDZ1Q0cXc3OFJoWlU3UnNaeVlZbjJVeG9JK0o0c3h6aWRjcVVLaWhSbzNk?=
 =?utf-8?B?ZjJoZEFPN3kvMFJza0RwZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnNFSUdMekFsMytybWFQbXplbHVxNUxuazVOTDZGeFRtTEtRRkRFbWFWNW96?=
 =?utf-8?B?ZTJIc0x2RmZxZms4ejRpT2xxcStxSGhCdDlyMkI1UkhvOHUvL1NZUVR3cDFm?=
 =?utf-8?B?YUlwOUJsbUNxL1drVzZGWkVHdkZkYnlqVkk5YkpMbnpkWXk1U3pNbUVDeVVs?=
 =?utf-8?B?dGVyLzJxbGpIdS82YlRMWlVYcFBxMmt2S2pxdm9wTCthcWV0M2NON1FqTThL?=
 =?utf-8?B?ZENpYkMvRTFoVi9SaUptNWVvNHRER1NZc3FkdmgzaVR6SmJyVDQzT0Y1a0ds?=
 =?utf-8?B?Q0Vod0V3UUVBYmZrWVUyeEU1QnVGclo1bjA2bGh0Um5BYytDbHF6d1RIdTJx?=
 =?utf-8?B?U29hMW5HTXJUZEtpMFYwRFRpTjgxcG5kZlNXSS9Sc21YUjhBQlVsOUt5K280?=
 =?utf-8?B?ZnFPQnJBbzY4UU51SVRoWHQ2RTRRb1VjVTErRkROL1dwbG8xQ2s1eXVOeXN1?=
 =?utf-8?B?QlZiMFkxR21Ob213clZiZW1JaVRtQ0xoWnZvRDJBNkRMRnM4M3B1aEFQeG5S?=
 =?utf-8?B?TTkwTWpRQi9ZaG5sbWpBTEdnWVliZkdHUGw2SkdsdkxxRHR3OWxtK2U3ZGto?=
 =?utf-8?B?UkRTZ3JPY0VwZkJwNWg0cDRLMlJyQ0ZWcEJIY0ZkbjdscnBqVGh2ZWc3NzlJ?=
 =?utf-8?B?ZFVoZ0ZKemhmaXZaRnFnOVhEb0d1OWdGUEcwRGExNmtpVG5mWE9mVnVseG8w?=
 =?utf-8?B?SStpY28zcEJvVTd5Tk90OUk4MjRGeWwrVlBORVpDRm9wbU80NlVBZXV1bjUy?=
 =?utf-8?B?Q0lwdWcwMGIvMjFtcytDMVFVZ3FjRXIwQ29iSHQ5TzNJb2FKQ0JZY3g1bWRY?=
 =?utf-8?B?RjR5NFJ4aURaSnNZZUNhbmpua3RadGZ4RjhnYUxUWWdwMzc4bnNkUmxoMDhY?=
 =?utf-8?B?QlRTZmtJQjhRdFNXU1g1MllyU291VHFDWXU0YWNBYVVmY3JHODFqZ0VPOUlG?=
 =?utf-8?B?Q0tadVJGVTkvNFJCVDI2MkI0WDFkTFZCWERrdFlUbHRzN1hEQko5alJhRUtM?=
 =?utf-8?B?SVpUdzlVQjhGUDBFaU9IdzhLenczOGtnaThFSVJuNlhKRWtpWkpzU0IxeEJs?=
 =?utf-8?B?ZzhhK25jNkt3RUNuUy91YlVLUzdpTHdOR0JPdmtHMzA2a2dUMU1jamljY2tj?=
 =?utf-8?B?akx0Qy9DZHZYYmRwNGFZUlNLWUpvOURpK1NRMmh2M1lPZ0o1SFJMT2xmTkhz?=
 =?utf-8?B?SEFpeUEyUVFFZU51cTZEdEVtVVRjaXY5YXphSHc1R29hUlY5QllHTXJUMXd1?=
 =?utf-8?B?TTlRM01ISEtEa3VkbHZzaFk5cXJibTg2UG5zU20zektOdWpSeHlocHd3MWFn?=
 =?utf-8?B?dUg4QkdsSGlXOWxDd256empTSzNPb1dpRlliZ213dzZYcFRJNGRjc2dRYTNx?=
 =?utf-8?B?aVNRS0hIdWwwOW1RaU8zZHlEWkR1OUZIVTRtM2RFWGEwWjgrUnh2Q01QMWVJ?=
 =?utf-8?B?Z2ZyVy9USmVDa282djhMelUwaklPa2VoblJTdUhBWUJiY0hVMWNlZ29QTzNS?=
 =?utf-8?B?VmljUjF0OXpqYWdSWkpIMS9uM1dZa05acGQ3SW1YcG1xRDQrUHJXbVh0MlFU?=
 =?utf-8?B?VFU5eEQwaHlLZmVmM3VFNUUxZ3N6SFhhRStXZ0hLUkxWMXpPUjc1S2J6Vy9G?=
 =?utf-8?B?VGNkMDcwdjBDS0tldnF2c0drMGFQdnp1QnkxdERVdW0yZVM2Z2I0dm40RmV0?=
 =?utf-8?B?QzBvZjlsZVIxRW5DZ3dvY1dGYW9JaTFkSnM5T3JFeUEwZlhhNU1tajJvamlo?=
 =?utf-8?B?YUt4NW1FSUNkT2VIazRySmFyUlJibUVzRjR3NUlhcW13YjN6UGRWdVNGR29i?=
 =?utf-8?B?U2owK25RWlFJeTkwSzRTOTlGQ3N6NWt4SVVFOVJLUkxCS0t5QVVYbEZFN2ty?=
 =?utf-8?B?WDh1UUJmL3oyd1JxeWRBbjI5ZjgxSWFaU25UanZkellWTGREUDVDMHoyWXBR?=
 =?utf-8?B?MjNjQ2paaE5BeXJta0VmN3hZUTF1dGh5YytKcHVxZTlaU2hDWi9hOU0xYW5r?=
 =?utf-8?B?NVBJOFl2dXFwbE94elJqSi9KZktJRHIyRGdGdjZCaTdzaS9MMHo1NTVLYlJO?=
 =?utf-8?B?TzBNTUNmOVBwQVFDb25McVlEYUcxdHV4NjhQL3VKT0JNZ3Q3T0oza1V1eTNM?=
 =?utf-8?B?R0hqWDVmWFZXTVBUQzh0ZmM3YWdCaTZDd01YT25aRTNoMU5HaTZTL3JmNW1C?=
 =?utf-8?Q?b72BUBn//10ZEq1wwYy6rmA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5ee342-f66b-46b6-5d7c-08dd76db44da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 20:23:48.3191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6u/JrfhNLQTv43hzDHkvxHjX6+MWLfELuDLCojLWnJgWe3wc8sP4c9txENbbG3iEkGVLY5zRFEUEWDkFUYvajtpvo0iJBDjETmOHCPsmgy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7675
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



On 4/8/2025 7:07 AM, Janusz Krzysztofik wrote:
> Hi Daniele,
>
> On Thursday, 3 April 2025 11:12:12 CEST Daniele Ceraolo Spurio wrote:
>> On 4/2/2025 10:20 AM, Janusz Krzysztofik wrote:
>>> HuC delayed loading fence, introduced with commit 27536e03271da
>>> ("drm/i915/huc: track delayed HuC load with a fence"), is registered with
>>> object tracker early on driver probe but unregistered only from driver
>>> remove, which is not called on early probe errors.  Since its memory is
>>> allocated under devres, then released anyway, it may happen to be
>>> allocated again to the fence and reused on future driver probes, resulting
>>> in kernel warnings that taint the kernel:
>>>
>>> <4> [309.731371] ------------[ cut here ]------------
>>> <3> [309.731373] ODEBUG: init destroyed (active state 0) object: ffff88813d7dd2e0 object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x20 [i915]
>>> <4> [309.731575] WARNING: CPU: 2 PID: 3161 at lib/debugobjects.c:612 debug_print_object+0x93/0xf0
>>> ...
>>> <4> [309.731693] CPU: 2 UID: 0 PID: 3161 Comm: i915_module_loa Tainted: G     U             6.14.0-CI_DRM_16362-gf0fd77956987+ #1
>>> ...
>>> <4> [309.731700] RIP: 0010:debug_print_object+0x93/0xf0
>>> ...
>>> <4> [309.731728] Call Trace:
>>> <4> [309.731730]  <TASK>
>>> ...
>>> <4> [309.731949]  __debug_object_init+0x17b/0x1c0
>>> <4> [309.731957]  debug_object_init+0x34/0x50
>>> <4> [309.732126]  __i915_sw_fence_init+0x34/0x60 [i915]
>>> <4> [309.732256]  intel_huc_init_early+0x4b/0x1d0 [i915]
>>> <4> [309.732468]  intel_uc_init_early+0x61/0x680 [i915]
>>> <4> [309.732667]  intel_gt_common_init_early+0x105/0x130 [i915]
>>> <4> [309.732804]  intel_root_gt_init_early+0x63/0x80 [i915]
>>> <4> [309.732938]  i915_driver_probe+0x1fa/0xeb0 [i915]
>>> <4> [309.733075]  i915_pci_probe+0xe6/0x220 [i915]
>>> <4> [309.733198]  local_pci_probe+0x44/0xb0
>>> <4> [309.733203]  pci_device_probe+0xf4/0x270
>>> <4> [309.733209]  really_probe+0xee/0x3c0
>>> <4> [309.733215]  __driver_probe_device+0x8c/0x180
>>> <4> [309.733219]  driver_probe_device+0x24/0xd0
>>> <4> [309.733223]  __driver_attach+0x10f/0x220
>>> <4> [309.733230]  bus_for_each_dev+0x7d/0xe0
>>> <4> [309.733236]  driver_attach+0x1e/0x30
>>> <4> [309.733239]  bus_add_driver+0x151/0x290
>>> <4> [309.733244]  driver_register+0x5e/0x130
>>> <4> [309.733247]  __pci_register_driver+0x7d/0x90
>>> <4> [309.733251]  i915_pci_register_driver+0x23/0x30 [i915]
>>> <4> [309.733413]  i915_init+0x34/0x120 [i915]
>>> <4> [309.733655]  do_one_initcall+0x62/0x3f0
>>> <4> [309.733667]  do_init_module+0x97/0x2a0
>>> <4> [309.733671]  load_module+0x25ff/0x2890
>>> <4> [309.733688]  init_module_from_file+0x97/0xe0
>>> <4> [309.733701]  idempotent_init_module+0x118/0x330
>>> <4> [309.733711]  __x64_sys_finit_module+0x77/0x100
>>> <4> [309.733715]  x64_sys_call+0x1f37/0x2650
>>> <4> [309.733719]  do_syscall_64+0x91/0x180
>>> <4> [309.733763]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>> <4> [309.733792]  </TASK>
>>> ...
>>> <4> [309.733806] ---[ end trace 0000000000000000 ]---
>>>
>>> That scenario is most easily reproducible with
>>> igt@i915_module_load@reload-with-fault-injection.
>>>
>>> Fix the issue by moving the cleanup step to driver release path.
>>>
>>> Fixes: 27536e03271da ("drm/i915/huc: track delayed HuC load with a fence")
>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13592
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> May I ask you to push this change?

Sure, I've pushed the patch to drm-intel-gt-next.

Daniele

>
> Thanks,
> Janusz
>
>
>> I'm kind of surprised that this issue only showed up in the last few
>> months, given that the code has been there for 2+ years. Did we change
>> something that caused this to show up? I had a quick look at the patches
>> merged around the time this issue was first reported but I didn't spot
>> anything that could impact this.
>>
>> Daniele
>>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc.c | 11 +++++------
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc.h |  1 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  1 +
>>>    3 files changed, 7 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index f30c90650b7ec..9659e6a301e19 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -317,6 +317,11 @@ void intel_huc_init_early(struct intel_huc *huc)
>>>    	}
>>>    }
>>>    
>>> +void intel_huc_fini_late(struct intel_huc *huc)
>>> +{
>>> +	delayed_huc_load_fini(huc);
>>> +}
>>> +
>>>    #define HUC_LOAD_MODE_STRING(x) (x ? "GSC" : "legacy")
>>>    static int check_huc_loading_mode(struct intel_huc *huc)
>>>    {
>>> @@ -414,12 +419,6 @@ int intel_huc_init(struct intel_huc *huc)
>>>    
>>>    void intel_huc_fini(struct intel_huc *huc)
>>>    {
>>> -	/*
>>> -	 * the fence is initialized in init_early, so we need to clean it up
>>> -	 * even if HuC loading is off.
>>> -	 */
>>> -	delayed_huc_load_fini(huc);
>>> -
>>>    	if (huc->heci_pkt)
>>>    		i915_vma_unpin_and_release(&huc->heci_pkt, 0);
>>>    
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> index d5e441b9e08d6..921ad4b1687f0 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> @@ -55,6 +55,7 @@ struct intel_huc {
>>>    
>>>    int intel_huc_sanitize(struct intel_huc *huc);
>>>    void intel_huc_init_early(struct intel_huc *huc);
>>> +void intel_huc_fini_late(struct intel_huc *huc);
>>>    int intel_huc_init(struct intel_huc *huc);
>>>    void intel_huc_fini(struct intel_huc *huc);
>>>    int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> index 90ba1b0b4c9d2..4a3493e8d4333 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> @@ -136,6 +136,7 @@ void intel_uc_init_late(struct intel_uc *uc)
>>>    
>>>    void intel_uc_driver_late_release(struct intel_uc *uc)
>>>    {
>>> +	intel_huc_fini_late(&uc->huc);
>>>    }
>>>    
>>>    /**
>>
>
>
>

