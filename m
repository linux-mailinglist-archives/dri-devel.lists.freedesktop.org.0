Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7A7AF917
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 06:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540910E460;
	Wed, 27 Sep 2023 04:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B82310E39C;
 Wed, 27 Sep 2023 04:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695788023; x=1727324023;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S/VllZy4qC23E89UOpE3UCMTXadl8L+AZS9qI8Z4oMA=;
 b=k7fAUyIUPs1PhpY/r4/S0fmeAujFs+BN7Nhka2Y+j+2C29xl1regbkRs
 ZLPdjqVSXKobAcY3n8/DcGyosbCGTg5tgDbrirko7G/zTkLSZqnPlLtET
 x+4rMlGL0SkW/VFZmKkd+79ArO2cnQNkQn+SPHHUdhk0Qq0CCpRaoMjSq
 Lb0ky7V0cBMGBreQfbQRkRhZUf0Etz0cmc4P41ndU99wS0fMEaOZtvYAQ
 XSm20U6yWgPi1mVoeTY4wk93fe5nE8jSISMESyGeDsfsbpAUVLVb86gmz
 rcH0PZfzCCGe4DbyYubLomGhixEJ+k38B0qgdBpRkO9BmbTmClqDZUTnq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372058054"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372058054"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 21:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864650445"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="864650445"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 21:13:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 21:13:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 21:13:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 21:13:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brdOrje8ANmEYh++QcDO8G/QAgGZ3JoNoMuDP5SwwzGGLlFzHZ1KtpJU5INzyFOBn0LyQsGKncdDJ4gbYj/9JasF0pHDOFuU7PgvcHXfz25LWhQSta8YryzHQ4gW0TTgMsbtYY7ou34dAqNCvFLfbgQF72y1IARTA+FjY6rQqWlJ87x+hIo8RqPT6qm4AuBFKoFQsa2GhmXlgEivAWDaED9i/lzqOymxOSiS52TjG225MZ1nAJCVg6nJkww9To5o78mJN+nN8y63F02Kjjg03/SkKSXlV2+Xb7RIPSG3EdTXRktQtFdHxdVyXa+VWHA9enXqNWhVeQdeoBSmzx3NfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy1aroIXLx7aOdCu8zQhLy3swN3lIk6eRFzOl5zLyKM=;
 b=GvotTKLd87GE6V1PXRsUJe0hpkDrC1bAYJKlZzTNHDjVLo2nm2ik0jPS+LW8gdO6YNnjDelBNM12z+EQX9j7IlQMEF4w0HcH5cQjDeKR4Klt9kNzOLuUQij7n/7dD/yTVvezuCJctw0O46muylRJQeTo6u9cuW6GWqJtJb/HaDdSNzu9AHd4TalwraqLZ7H8ONa9Ck5iTh14bOCoTswN5tVBnk3djyVz44w6KvSFkcce9WBPWumSeAFemExPJbNC6ixl/fCDIMft9Gqxv0UAjwMOqzUcZoiAJcrT2jOwZuAwOaVIOi/xjDPDI5bHsXiK7yMaDQ5mPIXC5E9Q0hXuwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Wed, 27 Sep 2023 04:13:38 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::5fb6:7200:97a4:b7e9]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::5fb6:7200:97a4:b7e9%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 04:13:38 +0000
Message-ID: <f2bbf2f2-a966-d128-93b5-d3d58ea9b1dc@intel.com>
Date: Wed, 27 Sep 2023 07:13:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20230926142401.25687-1-nirmoy.das@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Tapani_P=c3=a4lli?= <tapani.palli@intel.com>
In-Reply-To: <20230926142401.25687-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR03CA0088.eurprd03.prod.outlook.com
 (2603:10a6:10:72::29) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: db27d8f0-6b38-46ab-be86-08dbbf10204e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohXzts+K6qhrpj4UHGmCNRhYISv6180oT5E77clphO+TFIDBa9s0iYxXmTgI7xprloufYDUiUTLndzZla5WCpA3/xAaIvwKJgawzsqp2pLYQpBTPuleubDIL+/j/NPsVKvaSn+6vsi8aRrs7+eVL2nZul9LGclRpbDChdS+5FJzuM7DtOTVKLOtsXSrxjulk4rWudWXoajLb2KD5SoDTAegasrN5kYN0RYIWAq5bGqkXMoXO2UI1M6v7ZhXz1EuF766+tcUTM7tJuDfKRKh363w45/J2Ouv4jemEl7V8CyD8ccef19bNxyru5+uPx/U4bequgyr0QOlN8bBTEb5GnlyTYtgiOfQBHRlIxzw2TgzNqlKTi1jdXbwr702gK2yjpjrxL12tFYSHTBwZ7MwzKizPERNjyId7IQneKgzz8Hc83ZM18bK5CJVjP/jr+Lyz2W8pLeDWOBBzj56+E9Xv3F5QT4nCSeYcIJl+Wi/01CBI+TY/mAmqSysNOPM0aXMuIB+kumTbf/6+qXcALDWwYeETlctW8I0tFbEBAhGYBLX/84VcDVC1nkA/KFNpTPkjHC08pHPhlweXpKTHXu1pdA5F3ayw5X8IaMVAaR2KBzHGjYVKpZfCZLl20+7oQMUKB4Ou4XdxOruxdoNB7gpD8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(66556008)(66476007)(66946007)(54906003)(5660300002)(31686004)(41300700001)(316002)(8936002)(4326008)(8676002)(2906002)(82960400001)(83380400001)(478600001)(31696002)(26005)(66574015)(2616005)(86362001)(66899024)(38100700002)(6666004)(6506007)(6512007)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEh0cVN4OHJVK1dDcHBJc0l1Vkl4dzFHMzF6UWtwekg5K2ozVWRXd081UzZG?=
 =?utf-8?B?TDA2Mys2TERRZmRhakVPcTRsNUw4SDVVYkNCYktreGV3YzYxdWphbWdlNDRh?=
 =?utf-8?B?RTh1WjJsYWkwM1RNUlQ1aHkwYjlMRy9sSG1zNnpGa21TT0oxbkM2YVVLMTZD?=
 =?utf-8?B?b0JzelhSZGI2QU1FaS9kS1crNlMzR0x6UDhzTVA4a1hlWWt4dkNBQzdFUm0z?=
 =?utf-8?B?VnZFNEVmLzVsQVlYR2NRR0lHRlV1d3ZQVFJqdXZHdUdRRkNTQ3Z0Zy9VNEg4?=
 =?utf-8?B?NXBRRjRLT1BsbWJUVjVDLzgweWRpMXI1eVhRRE1ZUHYwb05NRy9ld05jSHE0?=
 =?utf-8?B?cm45ZDZEWXNzTG5zK1QxQ2MyaVZGa0hQNkhnWmxFcDJvOTVFMGdNYkcxTVJJ?=
 =?utf-8?B?enIyWEFMRElZZDkwaVI0dGlBeHlEQ1FnNDZsSVJtTXVCM2paOEUxT2tBd1Bm?=
 =?utf-8?B?dEFQV0RaQW9pSnN5azhMbHdPUnNubnhiZUU4V0c2YmN2MENLaEZ6SW1Sbk5M?=
 =?utf-8?B?TDZmeUJLWE9VY1BucnpMRmd6eUYySHNtU0hSVlozY0NHUG96bTMvTGdPR09n?=
 =?utf-8?B?bkZjaXYwWUlXeDVWRWtqekthSVdTWkJwL24zNW1OUnJJT2VRZDVyVVF4TjV5?=
 =?utf-8?B?dElmbWVpc25SL3ZTZkNSNC8rVEh6U3B6QU1wTmhydGJwVUJYRml5Sis5b25T?=
 =?utf-8?B?QzJrRFhvTEpRTHVCdS9ZQlp6enJKQmZDcm8vT3N5cE5jVnVPWC8zVDYyQ1RI?=
 =?utf-8?B?RjZEdkdsYnUvL3MraFFSL21heElrUFk0alllT2QvTUg3SWVFMnBWK3gwYWo4?=
 =?utf-8?B?RVVNY285L1NDN3ExVS9ISzBxR2NKaWc2THZ6akdRbCtpTVdiRzBEbUpHK29P?=
 =?utf-8?B?SHQxQW0zWjFiU1VjWVVwY3FRb00vZ1dvOHpjY0hjUlUvaks0N3RCR2RUQTJi?=
 =?utf-8?B?bVE2RzRMN0lVNGMxMTdiOHBoOTYvOTV0cE9Ga2pONzNpS1dOVE9ScXNyZGRD?=
 =?utf-8?B?d1JCdFBET0wrMUZTQ0NMTHo5TmJjR3F3UlQ3WHhsUFV1UWh4Smw4eWx5RXJE?=
 =?utf-8?B?dk14L09ZNklsaDI3ZVRNbEU5UVpvbWpWdzZ5WWsxckdhRi9lTENLQWlxeXFn?=
 =?utf-8?B?L3BZTEJWK3JKdUxHM3JMRnBVNUlSOTdmNUdxTFphbkVFOTFvQ29mUzlSdUZC?=
 =?utf-8?B?K21UN1o2VGh6dGhJaldiN2VkcVQvL0o2NnhzejRUdGVwOThyd0I2N1dtUm5v?=
 =?utf-8?B?Vkl3N1dIWmFsakl0N0I4V2lOQXZ1SWVTRHFLbVBRQmlRUTNJVGsrd2VCOW9D?=
 =?utf-8?B?am4yQWdMZ3p2YkxZSGhXUEJvY1dhcGdZRWMzVFQ5ekYxSFBtTUYxcm1ydEl3?=
 =?utf-8?B?cVZpUmR3YldOb055NHpocFcwZmwydmNXbGlsbE5vVlA5S1BEdUhMQW5tK3JK?=
 =?utf-8?B?T2JoRVRub1BnbXFYUWZxVERGUjJUYTlIUnN0Z3JNdjkzRmErY0U4UTNRa0NT?=
 =?utf-8?B?d1l6VlJQQ0ltWFVPSzFXM0pzNFpBdTZnaFkvVEpoMm9NcyttSVAzT0VLNGpO?=
 =?utf-8?B?OTNxdFZDYzhYMWpRZTNVa3FVMG1tUHY1OENLWnJJa1d5Y2o0MWNDTHNvRDQw?=
 =?utf-8?B?dXBIRE1lbWZadjFqV0R0aHphazhValp2QjVrckg4SVZJaWcrNW5MQU9wckxH?=
 =?utf-8?B?YWI4M25FTThjQjVpbmdpMThweFBhaVdoUjFIVjZ6VEJwSndhR3pieGhkZ3Ex?=
 =?utf-8?B?ZnIzM1JYSXFFc3hFRWF6ZlhWRlFTNkkvYW9tNUwrczlZcUc0VnNjdC9qTDZx?=
 =?utf-8?B?TVdmTThXR3JLTWY3L2hCMm1JWVpiU1FjVW1XOVpxYzVBSm44VDJFZnB5YjJX?=
 =?utf-8?B?UGkzN0h1ZEFhSnBtSTRXcDluK0dHSHYvZzhEZ2FBMXRrd1ZjQ2hpemlzTXpF?=
 =?utf-8?B?ajQzc3RFNzJzWGJqcVhJVTFWNjlGbDAyK0lxT2psbG5rS2lLZ2hBNldsN2Qv?=
 =?utf-8?B?ZlhoNW9hbDRQUStveVVWbEJHYitWVzRtWDdpZmp1cVdtUWZ2QXNBZnhJajFW?=
 =?utf-8?B?K1pDQlZSbkYrbkpkc0VFMmZjQW5FYTBseEdXZWx3NllUN0Vlb2lCK2FLbko2?=
 =?utf-8?B?RGFkTlJTcHpQN3MyYUdaTG5tdU1kM0xMQ1Y0SWkrSkxJcy8xbktCbzdSU2Fz?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db27d8f0-6b38-46ab-be86-08dbbf10204e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 04:13:38.8071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qt/6vIdO4wccH2ZL02MksF4KvXxrPgn1tTJ36/DBHXncMP1fsyfHdf2TOpPdqFbEbZH1FxRgNRrNMO9rDkd+Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes all regressions we saw, I also run some extra vulkan and GL 
workloads, no regressions observed.

Tested-by: Tapani Pälli <tapani.palli@intel.com>

On 26.9.2023 17.24, Nirmoy Das wrote:
> PIPE_CONTROL_FLUSH_L3 is not needed for aux invalidation
> so don't set that.
>
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Tapani Pälli <tapani.palli@intel.com>
> Cc: Mark Janes <mark.janes@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0143445dba83..ba4c2422b340 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -271,8 +271,17 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
>   			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
>   
> +		/*
> +		 * L3 fabric flush is needed for AUX CCS invalidation
> +		 * which happens as part of pipe-control so we can
> +		 * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
> +		 * deals with Protected Memory which is not needed for
> +		 * AUX CCS invalidation and lead to unwanted side effects.
> +		 */
> +		if (mode & EMIT_FLUSH)
> +			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> -		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
>   		/* Wa_1409600907:tgl,adl-p */
