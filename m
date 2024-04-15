Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F18A4762
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 06:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE501120BF;
	Mon, 15 Apr 2024 04:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kklkDddo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931CC1120BE;
 Mon, 15 Apr 2024 04:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713154588; x=1744690588;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XyuULeIUaL3ZRMjQPOVthKTNhUukUBy3SOlvtPv9Ets=;
 b=kklkDddoYvKpQ7/+U9l+NLXlhXxtVqLpqt4DjcqLTf2DU08Y6OvHeUyc
 dCJf5iwmvuhp57PbXWTtXGS3r94X9zJ7yUMZvW5VKnXsNkXhK0QRrPQxH
 Stb4Mq8V5kSVAJg8nPjln13GDga2dBIiEWTbBaZBEIM0dS8HMtQpKUpqo
 PX1khK3ZWgLC7aIbwbHLxMzLsY1BCEOLn0eIb7+dligycXy2PO2wxWbR0
 /fFbQVn1rOuvr2IGGV+F4aa6BqbzF+m2uqTT+d0mWbUt/ZZ2KVw38lNkv
 NS3Ua0z4bjDNiCT3ne0UM6fQi8SaWkgNp5uBm9+/pnpqnbtPLsvYtEh5Z w==;
X-CSE-ConnectionGUID: pXsO8OU5QauRP/yNAsB5Cw==
X-CSE-MsgGUID: MT0y+QcJTiGgtlS++N42mA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8635972"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8635972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 21:16:27 -0700
X-CSE-ConnectionGUID: 9tUXDEUKToamKz9aAjsOHA==
X-CSE-MsgGUID: ZKWQxceJSWa9w72ul4YUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26419301"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 21:16:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 21:16:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 21:16:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 21:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEGVhMBQ1lvfpkw6Lvz5h5B4KtOTRSTKg6MUNuLCXKK+6rBCapWihpcowhjQqie/4Foxcz6BdOuMG8S5w6RaXD8ADe0+beTKQAtt9KONKw6q0EZrDIJpVMhukXNwyRO5WoZYfHWRVaZbndD/HAMhC3W5ZyKHjiViw6EWkGTUpwNpdGIK96dhgwqXY+J8PkGMu5bbBrqZSI6H1xkYYC/JT0ABZIjbTSdas8+6OLGG3y4yCXFBRhZFQXEXV3rtp8pwMoPu4aQ1E5f7X41Og5BTci871DBDr7DR6Xe1QIjvJu0EamQYHNGIxn4XSkFwdXquDIYgMjNmRr2S2riwxDm1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdlskxDhohuCfbSYrluEqa4IQfIpHAeq1zskmGBG6sk=;
 b=gHguH9NbUJFsJQVX2VMeI5alr4Rwb7PbZMNbGTJkUQ5vSm9qz2yZDfnzSxvQPCh4zAxxSHcL3ceweiQYf1PhBjRfgw8BZ9lG7xnmgE0P/n/oa17jGISIzQ9/SBxOZPp4FxIYTrosNYnALif6icg94pq5Y+IUfWiEB1rm+4z42WuxTITTn6xh+uXyWdt3WnBtzRD9vQzZy35TuQM27dFjdA2+0rcTeVf0AiE6gNWqPyYxeKa4H/3JfChEw6XTmHOwtYAku6Cp2/tjIZvyJ9wD6ancZSoJ3nggNw+zHCLphZAf6PRRlpa0lXLN5+3YxTubIg4B/UDSFXbq8TtESZ+yiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 15 Apr
 2024 04:16:22 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 04:16:22 +0000
Message-ID: <a10be737-2f2f-4132-9793-3a6a6adf90ea@intel.com>
Date: Mon, 15 Apr 2024 09:46:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/irq: remove unneeded semicolon
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, <lucas.demarchi@intel.com>
CC: <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
References: <20240415032733.39584-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240415032733.39584-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MW4PR11MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1b17a4-d309-4e44-ad71-08dc5d02ce87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnRNL/99LciYNeSVS9hqQJBH5/viKHW93x0hKCmWxm7aTuDZvd1xnzjtyR7mKPhAAKdp5U8DhyZfeH9gkHUymdMq4xnZDCk6jU2QcvWl5UJe51QkB7QMOriy0oxyxdPQbDB+arKlLW0Q1QTjfsnrUO2ZHYiP/L2yjzF91Ev4P15LywX6y7eM33PRqiRkxv36CdaZQ9hadHUHvmi5v+2T2U6bw4/NChXyqg3iDuzkF2OIaTplo8zvd+LutwXtyY3Q8xLUf9nB52Xv2ZKEug0cstgVJP+1rhUNfiaXD2pF5eXjuhAzU96NufOh8ISPZGgeG2V6YzVJ7jHR81rRBRFfptiWsr/HsC9mvNyYt1rUnaVLtG4Qp7/5C/R9hWbRJ+j4IAy7lH9ruoyu28gqHhZ+mABAbancxAu3wTGuhrUc6fVZoXMx2QSKeV3wRdjiLKbekYKC6ARLxcQQ6gLDdIvKDreGboZtRdJALdODko2R6haZnh6qh1i9WJqPn8uWmytLB8AwNffEUnCKo8vSyPLi6IgmqEwpTYUasXnkR7k2guTZhRj9PHVfwvUDGrT4stYBCq9kedoVPFPPxFBgiImtt1n4hc0PU+egB/DApwY2zuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxpWWFwUmVocFNyYkl5d0d4c0VDYUQvNkVMSnJlVWh0bGdhMlJUUXU0a3Yw?=
 =?utf-8?B?RGdZc21kaDI2SlRqZ3dXcTVQaFc4bm9BZ2UzWUhBd2dlczdBVEtHYVJzbDl3?=
 =?utf-8?B?d1JwU1N4b2JhMXNwQkhrbEMwUGNWY3AvMkhmSW5tNzdFOElRaFJ5TzNJbTRy?=
 =?utf-8?B?STVwS1BIenlPSHlGS2xwZnJIaHdkZ2FITER1c1J4V2d1NFNpRWdSZ3BNMmha?=
 =?utf-8?B?Q2lXSGd0cCtZcDVZRlducW9FQXVKTkJOMEJ0US9Sek9hdXB5VCtHaGZleEFF?=
 =?utf-8?B?RlhuZWtVUGRvRGR1eWI5TUx1aW5mRDg1aTdKaWlZdG02OGkrNVNqT0g3WGhV?=
 =?utf-8?B?ajljOWVRcU5UQlBVZ0U0bG5qd0wwNlk4MkwxTkVOT3JlanVHQzVESEd1MEZa?=
 =?utf-8?B?WFBhRGpGeG10dGpmUkttT21jU0hWdUNxVURBTWQyWktkbjBSWGtadW12NTRG?=
 =?utf-8?B?SnhpOGNKaDFQa05qeE9yM25qWXB3N1ZVUENlODJZY0NFeDhHMGhJRC9kNlUv?=
 =?utf-8?B?eTF5TDlyeHZrNlRGUzFSdFpWemIyUjVRUm5pb2RlTDV3eXpHZmtIWlFkOE93?=
 =?utf-8?B?c2FQMEV4aWhod1dyTG84TmRSejJaWXRCb3gySTB4NTF5UEtoRDJVeUMwbjJE?=
 =?utf-8?B?Z2EvajVHZnptRWp5N0VaQkR6YUt4ZC9NVkFEeVkxdERNY0ZHRk1zaDd1TWdG?=
 =?utf-8?B?OUxJRW5YdU0rNGlaNGhTeEd3QlNLVFU2MVp3S2dwaUo0cHhoOS90MWRxNE1j?=
 =?utf-8?B?SFVKdWtsQUhQRURNUm5CQ0JLWFQ5R0xBSjcxbysrNlliOG1kYlB0Qklyc3Z2?=
 =?utf-8?B?ZmRGai9hcXJ1Qi9yZlgvTWJ3SFE1QjJ6MHFhemRMalR0Q1Z1cWlSNmZsRThN?=
 =?utf-8?B?WSt5U3JvTWRoWEFXSnV1SnowTEJza0xLUjltaUNiQ1loY2pSQWZZbTArNGxY?=
 =?utf-8?B?OWJkQ05neVppamtJUWRuSlc2d2F3dEMvZFA1SE93elVrdGN1UngzbjFYMmJI?=
 =?utf-8?B?b1UrOVdoUlcxYkYvUUdGWWFDSm5wT09lS2VUUmpoL3NuYVE1enFQaE1hL2lh?=
 =?utf-8?B?SW9VUXBKRjNaZ2ttQ3VMcUhIS2pzUUNJSmhhNTFwQzYvYjM0UzFDUGxkTU1y?=
 =?utf-8?B?SmlvRk5GWlhFM0RqSjI2cnZmaTZIWUszdFVrbmFOWEZ4MVRxU0VoZ3FnNnYr?=
 =?utf-8?B?MExEUnVYUGExcEVmemtRNmFYOENCN0I0b2tCckd2VnpHNzlCcExVaE1ZS1RI?=
 =?utf-8?B?RUN5MmdieTZEWjZPWlNWS244bWdjZ1JWNzB0MEFtV2VyNGFVRlFRMUxZVFVa?=
 =?utf-8?B?ZTFCRk1mOTZOa2xGY3lGVFNTVXZqWXE1L3l1TEFtK2c2VElKci9HbkNUWWJv?=
 =?utf-8?B?RWM4cXJNWkNYTGpWRjdPa3FWcll3SlhEVkU4TkFPY0o3ZzFLZWJXWExWYmlu?=
 =?utf-8?B?cHRUVDZzR2FYazdVUkNzcVMwRVYya3Azd1FEd1dRZHBQSGtSUllzT1lMckpV?=
 =?utf-8?B?ZldKVjY5eDlxNHBkOTh2WjNrZGovQnNHa1hQemFnOVU2TnpVT3dIZWt2b2M4?=
 =?utf-8?B?NGR2WUFpMldoYVZ0TmlUdFZLcWtBVUQveVQ4M0doUXgwdjArYnBmZXV3WVdh?=
 =?utf-8?B?T043cVRVTjlIMWYzWGI5bEllaUdUZlBpb3RoV0FnSkVRYThqV2tsNmI0UmRT?=
 =?utf-8?B?K25rQVQ4MTg2dUdCKzdhYi95V0lCL25BY2NUQ25Hd1JJMTBwakQ1MHZwYndO?=
 =?utf-8?B?cHhPL1VMS2M4UTVqZjZJMjhDZG1oTW83ZDhjWXl1UTdFWXRqYVlSKzlsV0I1?=
 =?utf-8?B?dzBUaHQ2SC9sYytNMnBNVmRsN2RHbVRsazdXVjRDR284VmhFMm9rYUFuZkFE?=
 =?utf-8?B?T0ZLRmVhMUF0a0JJSEN0VkdSd29LZkRTNnFFRmloY1hzTVAvQ1ZPTFJKY3RK?=
 =?utf-8?B?UVpDd2xZRStLbUUxdm5rS0NTV0VJMzhpQmdCbDkyZnVDOUxaWisvall3Mzlk?=
 =?utf-8?B?dGg5TFQ1c2NFUFBiZ1MrL3BZNWpuYlpBUWdSR04xN3FyaXI4UitETndPWjdi?=
 =?utf-8?B?Nm5aTGFxcDhHc2hJZ0dyY2RWcHdpcHVVdkpBMVdKUXdDaG9uM1FoTnh4anhZ?=
 =?utf-8?B?L0JYcllWcEpXS1dTaXdMRXRtNExTa1lobllQWlVpcG9sRUdsSXdLWVUwVHU4?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1b17a4-d309-4e44-ad71-08dc5d02ce87
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 04:16:22.0068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6K5MOhCzPqIhYm563ndECfxaknVC9kQPNv/NzMwcPIg/rYks793ha+Gnc1QwsWfRsofXQ5dfGMJj7vFCRoLbagEovLnjv3kkOfreLvhPFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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


On 4/15/2024 08:57, Jiapeng Chong wrote:
> No functional modification involved.
>
> ./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.

Specifying a specific line number in a commit message might not be the 
most resilient approach as it could become outdated.

Maybe rewrite it as:
"Remove unnecessary semicolon in pick_engine_gt()"

With that,
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/gpu/drm/xe/xe_irq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 996806353171..5b1a2f46a1b2 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -276,7 +276,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>   			return tile->media_gt;
>   		default:
>   			break;
> -		};
> +		}
>   		fallthrough;
>   	default:
>   		return tile->primary_gt;

-- 
-shekhar

