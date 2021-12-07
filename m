Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FACD46C811
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 00:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B796E0E6;
	Tue,  7 Dec 2021 23:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF456E0E6;
 Tue,  7 Dec 2021 23:15:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="218391634"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="218391634"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 15:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="657943462"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2021 15:15:31 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 15:15:31 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 15:15:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 7 Dec 2021 15:15:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 7 Dec 2021 15:15:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idAjmJmo9qg1pKPJw6DS5cZB16OLh+MH+9uuQU45S2COxXG/JTEmJEvcHeVmUETyhJ1CiRD1HwkYZ05vUJu/16ZfEtyh11NP8wjRZ4btu4gtpOAoAHSjeX19Ipsj4HZb/iAMbdv2Dz7EP9ZuOgtIJcBeeVneHLeKb+2sGXkq0eT+gn/LpPC2xOkLiescNButEHFXARMQ4fiqODAsMX+QV284CN5ws9fmFT83VbyZ+wY1sjO78N4GEN7jwhwW5OlUcjGwP3kDTX6xqkuUgLIFjKO5zDCiGxvuLYOonPUhQLEIyO9Gif2XoYN6a/dCumdQXfJFbnCMt7f6bpRsLL+OLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TP96hbGA1dua38o23LrFY+a+5RswDPm+QXSIa08UGJs=;
 b=PAIZpOl2Ia76onKfNVqZeOy7qDwV1NgIUQzpxotHpw7uTM3/4JIyTGIgGUYOaMghdrZRU7eqHAF+NcGm8KUWj4dNyFbcKhTyzzIIVmOaA7xQM6OWk+kRgSiX7IN3mTYxRHicRx6CDV2VJ2VbUFVaDP44TF0Oquea8YXX1NPzwD2pEzlj/Z2ZBdaZ1WucPQwAY4jycL4uOpIOj0yJ87PEdCaRg9jpSHegRpxpezHxmVvyRegQH5I2EaGCkzmFPFbATT+1I0CBhciEHD2u8XtruWqn+mO0eeWJxpOjNOFYRTVltUzzmXoqWRGCAG12kBR+wzHnHKtw5Uv1ffFL9lNAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TP96hbGA1dua38o23LrFY+a+5RswDPm+QXSIa08UGJs=;
 b=bVRzHlqS+SHi31WIF1TNaIHDWWZblzj/i14YY8lm5A+2SyPnA2mz7X9AJVrkpVTXe360ltqF+2WqzJcXbN9+Bp7GeZASCnGPybLfb9f161bII0iG5ASZ+A0kWps6uQIAwlpAeY+mBi7z6AGTkXWkTI1mmgy+twqVNrj9ublXK0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 23:15:16 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::d8b9:b1c1:dd29:82e7]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::d8b9:b1c1:dd29:82e7%8]) with mapi id 15.20.4755.021; Tue, 7 Dec 2021
 23:15:16 +0000
Message-ID: <c91e8065-56a6-d758-5089-2405c5841858@intel.com>
Date: Tue, 7 Dec 2021 15:15:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: make GuC FW a requirement for
 Gen12 and beyond devices
Content-Language: en-GB
To: Adrian Larumbe <adrian.larumbe@collabora.com>, <daniel@ffwll.ch>,
 <ramalingam.c@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20211207175301.321119-1-adrian.larumbe@collabora.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211207175301.321119-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:300:115::28) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR11CA0042.namprd11.prod.outlook.com (2603:10b6:300:115::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Tue, 7 Dec 2021 23:15:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49883992-c62f-435d-829b-08d9b9d76d96
X-MS-TrafficTypeDiagnostic: PH0PR11MB5643:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB56438C701649A310747B1CC6BD6E9@PH0PR11MB5643.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySbc2bH50fUnjYiseT0Z03IhiNpSU+t1LHmfqryljvUF2Bf7DLOnsC0mX4VpzTPIidfDIscNniVY8DfoGL2oFtqg8sMjtVlmbUDzUeWKJFEaJ/hq/dcPwn+t4QHsT4q9Qj0i6Y7PcPMZkfku1IX1FhVSyl6qaaJsBteoZQy3oqeTVBwK5BHMKqwzUm04rqC+BNUv0PbVtstxSOEAgdC2KxoG61YNM0PsBFVVzYZvZOaC3KkX35Wknyczz+uxE1AZw7UCDK+DYLJS/K0/ELoi5i5Zd5O7ICzdguNLGu81PvXhtA8FhBNOlbvtUbgPCSFTQENbFtPDPpN2eMliSWadblpsy1mOnkuGrGxOXa3yJXXCUU2kbJt6zl/Xf8bvJlignc7AzGbvA0Q8QoN0gsZNtSniYsfX9LwKQ7XO4eoTx1EpOtRIocdnUGlC2i8QJnZ4FTVKxPRr6SV2d5tlR3wkWf4aLbKB7WKrrg/dgltAYXnAn0m/hbUf6faU5fZXHn4Ql+Oj80EqFMeO8i85tDgBiW2tIccxH9m+/rlVxnHIv1jnClqpx4y5S1SKeajWYPerpQPC7mb63NDgTTW+JxaXO6KNfNj19GcrZ5myxlqFjPKt3ZiKeLCiH8s/lcuVbZvhER/wze59DBHzkpAKJwvZUgw2ilXCVrNfgV8LGHVn4oqFJVgAxIjUZ2nn4XRcPre1wbaNQEDFlnhXyfklbLd4i+oswewp8UF/5qvUK7i0rqh3bOPOQCEg6FDNCbt9d6xU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(83380400001)(26005)(31696002)(66476007)(6666004)(66946007)(186003)(2616005)(8676002)(66556008)(6486002)(36756003)(956004)(316002)(4326008)(82960400001)(53546011)(8936002)(38100700002)(86362001)(508600001)(16576012)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVZDVFNMMnkrQnFTOXgwWDNSaHBuRnNtZUZVOFlzSExTTmQ2UW1VRmVtQ1gx?=
 =?utf-8?B?Q0RRekNEZlB3dis5VWY3KzhKZTVuNzRrTnl5dkNzSWZVWGZka2t1NXVRTHhC?=
 =?utf-8?B?VUtaUlJlQlRFeG96OGJONTRHZXdxWnRoQVRoQzVETisrcmkrRXhaYVRUZDBz?=
 =?utf-8?B?Qnh6TE5YVmRENkZxNE5nUHo2M0pnS1F5N0o2ZlMvcVJ6TnFwNWJWbFIycVZQ?=
 =?utf-8?B?Y1FCb2dXVDg5STgwNUxaNW0yMkpsUEY0Unp5MzZZMW5iNE5Vb29rMUN5SHFO?=
 =?utf-8?B?TzJTWENJTENHdSthUEFWclJzUjA0bWJITU52MnF6WGxSYXhGVXM3Slo4V1NZ?=
 =?utf-8?B?TFIrN1dOM0dPcjhzd1M4cjNndlFqZkN6NENOdEZwcjJLckZoNFJTOGcwbW9J?=
 =?utf-8?B?eGZWcEJmMVZGUWVwMEtkaXMvazIvdUJKS2hyd2FHMmN3SnR6YndjY3pDS0dQ?=
 =?utf-8?B?aWEvK0RJMXRPZWZldGk3Y0QwaDJGNmo3N1AzTGZtK3lHREptazZJSEZtRjQ0?=
 =?utf-8?B?MjY1ZU1ZeWdiV3dBdkdhNHExSEhIdXQ0WjNtNDRDOEpkcFgyYWpySDZiWGJp?=
 =?utf-8?B?VisrbUoyZGFudmwvdmMvY2p2czBFNnpDMVRlanNUSVhMWC9rdjBCZTJ3N0o5?=
 =?utf-8?B?S3hhTUdzVnRlNktoaUp1TEs1dS9PQ2daaUUrMUlrNFU4d0RUV0FrL2pIRFZQ?=
 =?utf-8?B?d256bHZwVkY2L2p0TjNIdFRmSzIvbDdPZE04VjVEaFpzcklYV1lpdVBzc09s?=
 =?utf-8?B?SFIvS0FRMjh3aGdVREwwY2NreGw4QWtIUE9yZXZQWTRLV2hQWGZCaW04NHNR?=
 =?utf-8?B?MkppMkh0WUZFQlgwT2lpczcrajRPak5IL05PQWNiY0dyT2dEWVZ4Y2dySGh1?=
 =?utf-8?B?YVJ3dUJMdlV1eGRGMnFKTFJSdThBa2xHRTNDRVpPTVJldUl5eWxZL3hLODlO?=
 =?utf-8?B?TXlCZTJEaUZGSkVGZDBLMDB1YVprN2Y2YVFESjBWZVpXenBTVzU1aUZ0Ymlx?=
 =?utf-8?B?L0dibFlTbTRWZ2tmdS9Da1YrazVGTUQxdUFCSExlM1dKUUV3MFVkNTNQMXEr?=
 =?utf-8?B?YWRXMHRYWDF4dllNZzQ3dnVjZUR3QllPT01qQXh0M1ZSenBwelh4dUhTQjh1?=
 =?utf-8?B?Zkx4aVN6TDhxcGVpZUxQS2JaOGVISEgvY053eDZoNHFTTjFSZUFGSG5kVW9C?=
 =?utf-8?B?UGVYbW5ZQkl3eWtvWWtVRnVlVlpFTGozS0ExbkgyOVVKcDBHUC9zaGE2OTMy?=
 =?utf-8?B?VDNRaGQ4bndEYVNkN2VSelkxbElyYXNnMk9JTEtqV1ZqaThzeFlPM3ozYTRO?=
 =?utf-8?B?WnB6WnpVb1o2aXl3ZXNIMUFIWDVSTmsvU2lVQkZBR0lMNmJKc3ZtZFRpWGlM?=
 =?utf-8?B?K0hpUHJuQzZ5TVFTM015SDJYdHkrcDk3T0k2Q095alc5SFU4RW03T2NvK09t?=
 =?utf-8?B?K2RPMHFOclF2MVIyZHI5Z29GYTVxdUxQSjYrOXFMWm9saC9LVHA1WkJXV3ls?=
 =?utf-8?B?amtmWkl0RVl6TWJxcEtzL3VEbEF1aW5pTXdPOHJrVjVjdTVYQWdJbmYxa1Rz?=
 =?utf-8?B?dWIzWlNLeGtJaFVkU1duaXh1anVsR3dSZlNJbjdha21YUkJwSVE5VkdYMzAv?=
 =?utf-8?B?ckJueWNLT2MxeVFVOEhJK3M2YnlzeGpqRTg1d0IvSmI3cHZ6Y0krdDUzMFVa?=
 =?utf-8?B?aEFuNHR6S0F1RjhhL1Z3WXZXWmNmT0NLZDI5Mm5EdkFMMW9PWkdwejg4cVIv?=
 =?utf-8?B?Kzl1bGpyanM4aFBENVZNaks0cGV6WUwxVitUdk55Z1F4N09mUi9pWUlLSEd2?=
 =?utf-8?B?WDdXcDRpcHNTeFd2TFZyRkFJTEtSZzNmQ0l4QXhjUFpYbUpoUjRYUTNRbUJ6?=
 =?utf-8?B?Wjd0bEs5MU1zMTZXY0tLYTZkVmJUYmRWVnBxL1g3c0RSM3NsYXU4RjNHMWNt?=
 =?utf-8?B?THdaRDZiNTRDS0tENWRFRTJrSm42SUJZWmNJS2o2TDhiNEg0Q1ozQnFaREph?=
 =?utf-8?B?anNSQjl2OUprOUlCdnFaM3BwN1JKY0p4anhaSjAwcVY3MVczay9LWFZycVdW?=
 =?utf-8?B?Yjh5MkxUdlFkbC9BY3M4WS9TN202SGY0TGV3TzFGclgyQURxZlNRUTZ2Umgz?=
 =?utf-8?B?aWRyTFpNRmdRREViT3VrVFhQNTdoMWpwOGl3cDkrMzlocUhxZC9ZdlF2cDVw?=
 =?utf-8?B?YnQrSjlYM2NOb0x0R0FUdlJsRWVzTzRzN0tKS001UngybnkwWmdqYXF1OVFJ?=
 =?utf-8?Q?AaAHmtTQSnCfBHy70qDuyqI9Vl98moEM5aHpkKFRyA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49883992-c62f-435d-829b-08d9b9d76d96
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 23:15:16.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sw0I0BPjt0w6owKIkekpaebgeLFEyTTNuXGyeXDRq7gIYlTwxe7WPimp7RY+LLYc5uq1PLOqzLAzcxPPxvQLH/hsXzONXwEdsUYxyEdL6Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
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
Cc: daniels@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/2021 09:53, Adrian Larumbe wrote:
> Beginning with DG2, all successive devices will require GuC FW to be
> present and loaded at probe() time. This change alters error handling in
> the FW init and load functions so that the driver's probe() function will
> fail if GuC could not be loaded.
We still need to load the i915 driver in fall back mode (display but no 
engines) if the GuC is missing. Otherwise you may have just bricked the 
user's device.

Also, we do want to be able to disable the GuC via the enable_guc module 
parameter.

John.


> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 20 ++++++++++++++++----
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h |  4 ++--
>   drivers/gpu/drm/i915/i915_gem.c       |  7 ++++++-
>   3 files changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 7660eba893fa..8b0778b6d9ab 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -277,14 +277,19 @@ static void guc_disable_communication(struct intel_guc *guc)
>   	drm_dbg(&i915->drm, "GuC communication disabled\n");
>   }
>   
> -static void __uc_fetch_firmwares(struct intel_uc *uc)
> +static int __uc_fetch_firmwares(struct intel_uc *uc)
>   {
> +	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>   	int err;
>   
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
>   
>   	err = intel_uc_fw_fetch(&uc->guc.fw);
>   	if (err) {
> +		/* GuC is mandatory on Gen12 and beyond */
> +		if (GRAPHICS_VER(i915) >= 12)
> +			return err;
> +
>   		/* Make sure we transition out of transient "SELECTED" state */
>   		if (intel_uc_wants_huc(uc)) {
>   			drm_dbg(&uc_to_gt(uc)->i915->drm,
> @@ -293,11 +298,13 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
>   						  INTEL_UC_FIRMWARE_ERROR);
>   		}
>   
> -		return;
> +		return 0;
>   	}
>   
>   	if (intel_uc_wants_huc(uc))
>   		intel_uc_fw_fetch(&uc->huc.fw);
> +
> +	return 0;
>   }
>   
>   static void __uc_cleanup_firmwares(struct intel_uc *uc)
> @@ -308,14 +315,19 @@ static void __uc_cleanup_firmwares(struct intel_uc *uc)
>   
>   static int __uc_init(struct intel_uc *uc)
>   {
> +	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>   	struct intel_guc *guc = &uc->guc;
>   	struct intel_huc *huc = &uc->huc;
>   	int ret;
>   
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
>   
> -	if (!intel_uc_uses_guc(uc))
> -		return 0;
> +	if (!intel_uc_uses_guc(uc)) {
> +		if (GRAPHICS_VER(i915) >= 12)
> +			return -EINVAL;
> +		else
> +			return 0;
> +	}
>   
>   	if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>   		return -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 866b462821c0..3bcd781447bc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -17,7 +17,7 @@ struct intel_uc;
>   
>   struct intel_uc_ops {
>   	int (*sanitize)(struct intel_uc *uc);
> -	void (*init_fw)(struct intel_uc *uc);
> +	int (*init_fw)(struct intel_uc *uc);
>   	void (*fini_fw)(struct intel_uc *uc);
>   	int (*init)(struct intel_uc *uc);
>   	void (*fini)(struct intel_uc *uc);
> @@ -104,7 +104,7 @@ static inline _TYPE intel_uc_##_NAME(struct intel_uc *uc) \
>   	return _RET; \
>   }
>   intel_uc_ops_function(sanitize, sanitize, int, 0);
> -intel_uc_ops_function(fetch_firmwares, init_fw, void, );
> +intel_uc_ops_function(fetch_firmwares, init_fw, int, 0);
>   intel_uc_ops_function(cleanup_firmwares, fini_fw, void, );
>   intel_uc_ops_function(init, init, int, 0);
>   intel_uc_ops_function(fini, fini, void, );
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 527228d4da7e..7f8204af6826 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1049,7 +1049,12 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		return ret;
>   
> -	intel_uc_fetch_firmwares(&dev_priv->gt.uc);
> +	ret = intel_uc_fetch_firmwares(&dev_priv->gt.uc);
> +	if (ret) {
> +		i915_probe_error(dev_priv, "Failed to fetch firmware\n");
> +		return ret;
> +	}
> +
>   	intel_wopcm_init(&dev_priv->wopcm);
>   
>   	ret = i915_init_ggtt(dev_priv);

