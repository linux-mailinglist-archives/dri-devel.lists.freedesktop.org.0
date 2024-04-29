Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683D8B5DC4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 17:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCB510E97E;
	Mon, 29 Apr 2024 15:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zku+yxx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B133710E84E;
 Mon, 29 Apr 2024 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714404734; x=1745940734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MJInxRr9F9Tj6YXbB8lQyCjnWiv++FW44QVbSykjK/o=;
 b=Zku+yxx8MO5PzuHHuUFUKVZXXhwOKiR9xEG+71xrGbj2iBdpIiAMdQTC
 bGClndP9Ij1HLJY0xgeXlMcRxzSJx+A/R/gYPYnTEwuYobUdqF7a9ymM9
 Td5dMAGPfCZ+mG5VTYxI+YshJDiKcxhPLHm1Q7U8bhuGT5FwQNpHnZY0Y
 O31UtP2e64shpQcsZ4UrPyDTOI3hCiABgpbMCwyz2yZYfUc4zC+ViDTAS
 wDs/BS0S9QXpvyg+pzaZnhoEtVC4eWjAifG4pESZnirQFlPA1Nn0FWP8G
 xKZhCNqVISb0sV8GGUqrJK90N2uuhGHXZ1rQTzNxogoTn8hSPy/9B6lq9 A==;
X-CSE-ConnectionGUID: f9DBlhjUTxSBSwMEP/iY2g==
X-CSE-MsgGUID: +baHdcLvTO2pChaSuPWsPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10290919"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10290919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:32:13 -0700
X-CSE-ConnectionGUID: pYl6IsRERWSbJOFzHoMatQ==
X-CSE-MsgGUID: YcXqlsaETYyM3o6FGgiwNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26762095"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 08:32:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 08:32:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 08:32:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 08:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNayVh7FrYWFqT7zmEdx4SjA3X8OSMf3sjLhY5OQSwSgQVSDM31ZOfJ3Pr3gTNSe/wcY+U2dSHnvBmQdZ4PCpS8bmtjoONihbmY5cSYHu2U4Ykpz35hfnOEUodgNn2QFrlbw3LRxfKTFcBVmNZEaJe7xE5QQiUA92S/shkjC7X6YcQ++oorg3s/fHIsHsQc1rHMjE/VM8Js8aHBbK4UMRje5+Kh1fXww2Cx+dJyEecokvhgMQc19YZQilQP4QH8USSHRrOEPc5keqyDqyJNYdthRdexRsgXxL0uBvh9oao059DE6qSH+a7ZxfzXDXU8nM/M5H1d5Rm+aKdsKRwTQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaHv06PPzBe3KvLpPefPATGGt+k3tv9Spyhx0FnI4Nk=;
 b=T0aQ9rUBL9Iq+LPzsK871sG0Gp1XwEGuhvQLePoQYbVF7I2PncuZjpVoEDuw2f06ehuPbasN+5Zz2q/3nGDaWSvBScl+8EwGtOi3i8JBXkn+C8ecI4wwRdUUnpXUcTCb2ZtyEYluqPgyr7IgzuICdGGjpqariI86jeISKmi8qFNCu0UKkRHNp9lmRWVNYMHM83idF0FUvhrlg7GbbXHoTJpyhTedwLSiCduuPkauitgnzjt6o9QjFq5/xkRvRG+u86fHVi5AmcA2TUAFf4lenoIGlob6DvpY27fA1H4nGx25z9uXUtbjDaiMTYpx8NV49Xo6jy+Qzlcv96y6U4pGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Mon, 29 Apr
 2024 15:32:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 15:32:08 +0000
Date: Mon, 29 Apr 2024 10:32:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Farah Kassabri <fkassabri@habana.ai>, <intel-xe@lists.freedesktop.org>,
 <osharabi@habana.ai>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm: print top commit sha after loading the driver
Message-ID: <45wxpwjv6fqzbnsivojrr2dbspnftinois7um3rrtku5j47le4@lobf5qyr2f2n>
References: <20240424100706.269523-1-fkassabri@habana.ai>
 <87bk5s4ekb.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87bk5s4ekb.fsf@intel.com>
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d4cae0-2767-4ca5-a5fc-08dc686187f7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c7thiPlqSOnC6m2JNrleZ1k6eQXAbx8TafxjuJj7if+rhQnjJANwxb3cXUeE?=
 =?us-ascii?Q?futAPUOOSu1sNqcCs4eLBnxxyfDCKTBRQxvsyJc/vRitQY7Cp0woESoj0vYI?=
 =?us-ascii?Q?JXqErPzdIdZ5XcxZOE7OTsYjIeG6L0XjCUusiU6m9h38uMKXRh3SsemQjFBB?=
 =?us-ascii?Q?pTn0cSIoCvfquN5HzhhDZbfST9q628+V4F3GMCJa2tBtuYjst8vDdiBxecKM?=
 =?us-ascii?Q?ibQV/y2htWdo8ojCV9pV1TBbc+M6lAA83MHg0fPHDsrdMLXccQLDVUANoi89?=
 =?us-ascii?Q?4UgM7Vnu/j4psIgwL/4VutIlM2DhG7TJEWswXuCefjC6W+JZP4TDxNykiRDu?=
 =?us-ascii?Q?95bM0zdQLkMq8gA34vk9eKUDcgSUJrFvBlgTVdhtj/jVmhYv77Vhxf8rEQLt?=
 =?us-ascii?Q?hnLU1QbcUMGpKuOCPbeWBO31/+vaQ04KjIpsoWaF/1azUKsriE2WnjPRvfjS?=
 =?us-ascii?Q?AST+edUtE5gY8hc7/mqGzZ8EElD+cbopI2gZynhbnz0oEyQp+pt50qCg1jC1?=
 =?us-ascii?Q?NqeYOq35yd1SSek+OOCnbVXDRjbQMYs+QjL8MNUI4peoSQJRWvKc12mIQ+6f?=
 =?us-ascii?Q?WkMAeCAoPD9iSbEeHBQBKfVlS+FL548D4LHIKhSVWTdpkx9m7NZ1RYxamojY?=
 =?us-ascii?Q?nVtApbwjmB93Mqs4Ei8apeUy4VCj3SmB6Sg5RJrMO8mSRN5E0XlsA8LoiKYw?=
 =?us-ascii?Q?7VdZrhx/8cOMZ7NWrxBdHinHdJFkvyDCHAeX/7LRHXxyyTiS2OlqHahwqv7O?=
 =?us-ascii?Q?4JPQQ4TXTnQAsXDdRHEPTr5PbD9knaIFTa4X4fI4QWKi+AFSvQMBd4IS4DLj?=
 =?us-ascii?Q?sZ5+j+6oOm7WQh4Z0gC7Ptp0FJdJNM3qlatk/CKfcOhaZcD+8VxzgxoPh9j5?=
 =?us-ascii?Q?cmX4FCiUbyH7x8g4WleupgCyIgY5M7JYFduBiil+xB3f/cvffudL/mFOAgYp?=
 =?us-ascii?Q?ESDAp/DqCAgh3Ri+8PAlE7DREIpX2HIQ/h6CMyDFJKGm7VSt5OP5JLakMppn?=
 =?us-ascii?Q?0ss+Xh2R/bztA2UMLO7rrdGb69eYDmtySO+jqBGNCWHjPxkr4M+N0DKnptaT?=
 =?us-ascii?Q?Vsyy6HevdnZ1AH2BioEC3tqDjXVplGzJ1ZxzvZTDMY5KLWnq52wHmgCWQfKa?=
 =?us-ascii?Q?vGyIJU/Sfi+z1UgjZgVUPKw0c0LQfDOlDCBJiEhNYYrPLd/YQKgQS72mex4m?=
 =?us-ascii?Q?ZOApBa/kUIO9cAIz1tvvEEZ5x4N7g5wGImP7cysbGRL5C/+clUd9QWJfoy/S?=
 =?us-ascii?Q?GfsquapdxRS6gPqlQYIxxdbtMv8iSU+JF8HW+KGmrA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9uAyGudGjO2zRRGgWjSeD1tC4mp4wh462GEe2meyxJSk9xxaPxCPtz4trnSc?=
 =?us-ascii?Q?K22FdOWONa2J1Jsx08O6EQ32YONL6eseZIeUZnlQD0NZsRJzCmh956R5TZwk?=
 =?us-ascii?Q?dndsKQyr54bGxN420eYhCXNaNko5VntkKYAxsLMGXRlAjqluQgGrPT29iGXq?=
 =?us-ascii?Q?2IvSuLu1rk1HHoxtRPTSmhAmQ349vV2gk2yWr14UfkrKtk7vYZknHnf1Wdii?=
 =?us-ascii?Q?uwQ1pGvkwCHl7zhF7mEDyesVny0ufNXx6G7Yhm+gEgULQEokzLRPpE03zieg?=
 =?us-ascii?Q?87qXw1NGt5Sz2hFU8ClZPa758bstwHSwBZ3ykjEb9Ab0L/vr8PGQDbKpP5Qs?=
 =?us-ascii?Q?HX5xwVz+d/lELqcAyByzI7zc97VLmwtxTlAd/X295XbVweVO0GIL7tjobEQI?=
 =?us-ascii?Q?0Q0HW99nEHPsipO3EIxiHQdO0wlmSooqg82J03AMmdhKnkQBYVYJ1Be3SKgp?=
 =?us-ascii?Q?f3Lx5HT8RXpv30A0lKdAZXq9VYgxKzqGNd5vscHtgVLursOYjqKkrw7DvHEA?=
 =?us-ascii?Q?iEW2wwxByK4otq8m/0e/5GtfG08wBWTuaTc8RpQRiNzpWb1BoPfCOM3aJ0e0?=
 =?us-ascii?Q?yr0ropbr4+9ISxnA9Z3y/xIEVb/jpyaREcgocBRyoPSbnIQtM+SQp0VyYcW1?=
 =?us-ascii?Q?1k3lv8rTs4TXG0NPErmhC0UpP+Y+rpUTwJ/o75ISrPuTtmgteAJ8jqSbMNIQ?=
 =?us-ascii?Q?/n/7lvCFGrQ1qftMGcuLwSjP3QUmOpO9h/kvHi89GrRcyNShMsprx8tyUAzT?=
 =?us-ascii?Q?uVaDrtJpdRr2Tf8zJiWRbwHgLhXvxGiPf7q/WgBknJLbN8eWx+e52vmsWh2l?=
 =?us-ascii?Q?hjAupXSgxN8iNWJnzSl/WueNwkCBvhMrEXDRMe8dfVZ1dBZpljgpGVvd38Zp?=
 =?us-ascii?Q?ONGC87I2VeoF4cDcZ3APp+CmUBWExYcG62k2axKgySpT7XuW+ZXhczGeyZAD?=
 =?us-ascii?Q?ACB3jBiAyuONQfP3NrXibhJG836TK15tHwV0efrP8mdI6K4tTnu/GBGSl+nu?=
 =?us-ascii?Q?fScEauye2TYPOdPpkx49zFMm9kPBvqFdsjOAgRjOjJxW31I7+GeEsWldW39d?=
 =?us-ascii?Q?VnU0nN5af4wsbSnGBcmthNgsOMCpyaFstFLM/T9UZVbenwjO4C5hEAFKBcG4?=
 =?us-ascii?Q?eWGYpXoJtPJDqiwGeX6+YkEP0S4yGfeM0iuSd52Lopwy1D00ZwlBIYYSgSuf?=
 =?us-ascii?Q?n0UpsvSeJ6FmeD/O1Zs6aVrFwUJ40puvkO1TDHYUSWaZaGwIa34nZlXzO7SH?=
 =?us-ascii?Q?mBhExMbpZAgc8+gHvgE4fwoGJCulsiUaH+BSlMQEIDTTPp6qM8GCeNykN5x2?=
 =?us-ascii?Q?65pmp1DXRa0pShObWuPLlnb7GKvzeH7ueBrf/6korOiXlB4ILZ72nbRr5pQL?=
 =?us-ascii?Q?M7Dq1ATsS0A3oT+tMV8AAwj4VcjBgZVlAP9xdwYFO+Lk2a+/sYfmTI1WG44y?=
 =?us-ascii?Q?8/5z99Cieo8I3CFPnIHtL8aeOUnQIrwpiv4EvLsc2aUdgLxRiy+t983qLJnL?=
 =?us-ascii?Q?WlWKGNRtQR0fd78VnKz/UwZ7hoGaQk6/nQmLGytsa08nbT4380ytdttPtjUI?=
 =?us-ascii?Q?/jaZAFKdSapqAPMXkse1s8NnLhBEwXScsWCha9BgSpLdSU6p16wpFJz4ejaW?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d4cae0-2767-4ca5-a5fc-08dc686187f7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 15:32:08.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s70nubw1MWVExDfGSOu3mCz492fKcXxuOg/7s5G1pqLGkAGWnfxXoFoWG30k616VpL7esA7Wb7PMHS/PEE//r5aE+xCIy5ZL4NOmFcf+tRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
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

On Mon, Apr 29, 2024 at 02:02:28PM GMT, Jani Nikula wrote:
>On Wed, 24 Apr 2024, Farah Kassabri <fkassabri@habana.ai> wrote:
>> Add the last driver sha to the existing log message
>> which prints the drm device info.
>
>The commit message fails to answer the most important question: why?
>
>Especially, what makes drm devices such special snowflakes that they'd
>need to be the only ones in the kernel to print git commit sha1's?


the closest to what was added here would be srcversion:

         $ modinfo build64/drivers/gpu/drm/xe/xe.ko  | grep srcversion
         srcversion:     0EA08A43AC399A0D942740

which makes more sense and doesn't depend on the git tree checkout and
other possible problems with dirty checkouts.  If you want to print it
on module load to be able to tell from a log, you could probably just
access mod->srcversion.

but I'm not sure what we are trying to accomplish here and the commit
message certainly missed that. Please Cc dri-devel on changes outside xe
and provide the motivation in the commit message.

thanks
Lucas De Marchi


>
>BR,
>Jani.
>
>>
>> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
>> ---
>>  drivers/gpu/drm/drm_drv.c | 6 +++---
>>  include/drm/drm_drv.h     | 2 ++
>>  2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 535b624d4c9d..e0f7af1b6ec3 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -947,10 +947,10 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>>  	}
>>  	drm_panic_register(dev);
>>
>> -	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
>> +	DRM_INFO("Initialized %s %d.%d.%d%s %s for %s on minor %d\n",
>>  		 driver->name, driver->major, driver->minor,
>> -		 driver->patchlevel, driver->date,
>> -		 dev->dev ? dev_name(dev->dev) : "virtual device",
>> +		 driver->patchlevel, driver->git_sha ? driver->git_sha : "",
>> +		 driver->date, dev->dev ? dev_name(dev->dev) : "virtual device",
>>  		 dev->primary ? dev->primary->index : dev->accel->index);
>>
>>  	goto out_unlock;
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 8878260d7529..7578a1f4ce74 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -407,6 +407,8 @@ struct drm_driver {
>>  	int minor;
>>  	/** @patchlevel: driver patch level */
>>  	int patchlevel;
>> +	/** @git_sha: driver last commit sha */
>> +	char *git_sha;
>>  	/** @name: driver name */
>>  	char *name;
>>  	/** @desc: driver description */
>
>-- 
>Jani Nikula, Intel
