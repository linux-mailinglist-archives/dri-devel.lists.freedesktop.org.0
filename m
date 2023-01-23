Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3AF678BED
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A4210E206;
	Mon, 23 Jan 2023 23:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5CF10E062;
 Mon, 23 Jan 2023 23:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674515962; x=1706051962;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XDqFDfwZPfRl0acsFR8Z/N4hXvtuP7ErQ93c4APf/3s=;
 b=L8HMJbVUtwBBvWnWIoATUUj30SSRtSRElHrmjaC470VwTES0cJc6WAmD
 reI8HDqZphdfECYWNEOTngdY02R/3Y+AVw6/Sw+DdvChrYXcKa3Kq9ubc
 I0BA+Nl8ugMljAtKuvMghzZcLJTzr5dbX+PUS2J3fp30Iep9QdrVnzfT7
 tUGVhBP8SAbCzntQn6YkV9qVjgslUv0n7K3sE76AHC5YYHYR78RFH6nxz
 QSat/yKfULIiRYuGhN4sMiSUtdoTLMWRHIJT50S+UM0o/aya5gW0t/DbZ
 NW4Qspvc3AiL7/KsyeOEjf0lAliHZhy3jV/dnc3JM3CMccqWezzwnjgHN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305847186"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="305847186"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 15:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804371011"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="804371011"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 15:19:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 15:19:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 15:19:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 15:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hre0SuIsLg2W0J6aKxSR8Pj/wgbBfdYj4y/qXrtF6dJoXAev0MZnXAHTdMlQKJrngIPlFZXQ39LRvTslPf3KFrolnYP9OiE3SeAz0yicfzu4MOgQW2WYwsD0flIpWEXpytOspYeF11e7gDQ+T7eZAxvzu1JZks6A8i0XoI2PNUbvx/HVksPRLnnHRbuVUthiGCIyQEZ8+NpfanMAtf8/xb8hpmysHZ/2m5rWPFiKQYqMz4sEBko8e/TUeMhQfQxr5U/nn4w92lYEq+7BJKA0tI0Xq9BKPgEyrrmNB+YRJDFJlgJvzCa06+lOTpLr2jSb7MIbEGUyR02HrOd0ejSovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHzIMk+fPjlCUj2CqgK3dfa0EhkZrQ/bOacerWT6M3o=;
 b=B4qVCEdsKwWUnqqDquaqrFeMPB5JnSpmXA2imZ5tk5Ur7gc1las38c9e6HP6P9mtir4Np0MYjjhP1gLV/WW3UjJt4/7ohB1Fak21hZ6w8mAdqA/5Bms1/kP6xKEk08bd0kupmBDL4y8Je/VL9uaz0pSwn6oLTCjkzwCROgaVaNxZuShxSmam1g598Q6jMcZKWJrJi4a2KWypuZZG+ifOlooGmy5vYTwf01NLf9ttJGPk+yJe7buGUEHvovRPPiUrBp1ROhHCH9UXdv8Vvm0mFLN6RCVpEF1bRFm5j5THiCrvSdlw4tqAdZHur9Bdi+dFChv6s7GVtxXBI+Y7iaAQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 23:19:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:19:13 +0000
Message-ID: <d23dea31-3a67-882a-96fb-6b48605038f3@intel.com>
Date: Mon, 23 Jan 2023 15:19:10 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 8/8] drm/i915/guc: Update GT/GuC messages in intel_uc.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-9-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN9PR11MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: a82b67a5-7a25-4707-6353-08dafd983d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: viFTPxaZNosgCJ4dXQluyl4Y2v+FBoYKeZrJg9ts+53tWotYUuayF4xE+DewANCBHWLgAPmmvnw65K5ZH2HZd3LybnsPOVFvstHDnuk2nIpvEoCe9i3vzKv3BsuMLNmp/lC3uQjVR+GtDGugU8xZmeoNkAbdUEnirXd3l9imd78NXxMDFr4OmaNqGM7wpitnzmhrQdNy6dAxB7jEoHu/Sbuz2IwOF8o8/8BMnpn/EGn0BoyF+/PitbIhyQYQZ0s/B4ephJ3QHq1ZlA2oM2QvAvS1Hp8jSNtjEL8bLk8+j/LjXe4E1XrI1TKahwT16vmKog6ULedluLTauDS4eXxtx0404OUYr0WQ70Z5hFFsjv80JT4zl3aIrmSfFheAwPspXPplZdWn+vwown0YFhiN+lQcyj63EZNylEOk0tGvJHihwFjxAaBzedBeaBEXymMuciX5Wj0SLSDhfZyJ0jEPUznDREcJERPdGNktAr0fliVWbs7QAs1yOW82tmM61HP5ckbTZiYBg5VAi1pClQNhF31VTFWcmpwYUR/YbQMgYiqldQj+4DXrq6pyNZw83oBQCZO7C6qkLGcUja6q9AA1IZ2vZEuX/aockEQntzW9+uoHwjfDm2UkRNMYboWtYeC/9bXa0n7tOGAkTjOHvFRi+qoXsL1hNjh7rnNmfBapSNFFbgN0LzHvLQWGDJFGkTo4x1OVaX1wgl3jLAy/IRMHBThd7ARxxINhgEaOk1EvQ7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199015)(36756003)(86362001)(2906002)(5660300002)(38100700002)(82960400001)(83380400001)(8936002)(41300700001)(31696002)(66476007)(15650500001)(6486002)(450100002)(478600001)(31686004)(6506007)(53546011)(6512007)(8676002)(186003)(26005)(2616005)(316002)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmF6OWtCWXpPRGxENGtUcTNZYTVocFNFSk5HeXRCdHdwdGZmVE95d2JzVUQ1?=
 =?utf-8?B?Smp4b21HWndFZStoUzgrMDhPRldoYWIwWlpXVGhjeFVxZFMybGRRclZ5YnBi?=
 =?utf-8?B?RVN0RVZ2OXN4RU50ZEw0Z0xzbU5XOFgwS2hTcWNhUE5qUDFZNlE1ZkZpRzdX?=
 =?utf-8?B?YkRpcGpUdEhVK2lzclNyTEs2NTZIV0ltWUFMYXBnSWtjUmU1QmNNeTBpajZO?=
 =?utf-8?B?dkpydmovTmQ0NW0wb1V3TGNtaDNRTU0zcHhIS0pIemxrdFIyOGJubE9aWTRu?=
 =?utf-8?B?b1RMSVMyUEdxY1BOL0kxK0krd3dFczFDa0s4QVRXN2UyNW1jckdxNVFNcWVR?=
 =?utf-8?B?cldWdkFDaTZPc2dWdkxWTjFsUXNGYjVNWFdnR2hZZFBkUU5MOE1LcktwY3c3?=
 =?utf-8?B?MmdNM1cyeDhmYzkzNXo3a1Z2YXZ4TEl2eGJLVGNHRjhWczZ0NHdiTjNocUhk?=
 =?utf-8?B?QkZueW42QStYYVBjQWNZeXZpMnoxa0w2bDhaVEJYaDFJYk1pZy9PdkE1cUg3?=
 =?utf-8?B?WmRrdHoreWoxWEZuZytoZWQwVFdqSGRheXhVTmNsVjE2OGF1K2xHRUV5bzh0?=
 =?utf-8?B?YjhtTE1kOHV5V2F0cDdUbEJRcWxGbUxtUHZpalhqcFdGL3AzeGVkbDQycTU4?=
 =?utf-8?B?ZjlBSm1CbnN6ZENrZFhmUTl4cFlZN21qSktCU296RFdRYnB3TkJGQ05PcG1p?=
 =?utf-8?B?cUFHVEdPQkl6ODZYczR5YkZER0FqOFZjcmN0cFFLcTl4MXZ2R0oyQndQcEdp?=
 =?utf-8?B?WS9QVDdIMjNoL2FJdzBVSG50Y0RBYVNlOEQxeHkyTmpxZ3A2cmZhUklRd2Vh?=
 =?utf-8?B?RjlJaG9vQmhSZ0JSVi92QmRRVDN5cXhHS1Y5ZXgxYXB3bG1nN2VzVUhqcHlH?=
 =?utf-8?B?REFQbTUvSCt2OG5xTWswZ3A4RitucWwrRmowNllpeTNUdmVueHBzK0RGTW1N?=
 =?utf-8?B?YmE4OTg1TUhROVZCanptbDNIOUZPZWMybjYxUDZFcllEYUJXUDl1aUtodFI5?=
 =?utf-8?B?VjVJVTlPbWRkZUFMN2V1NU1XSkxUZm9PeDhIVnB5T3VadTNTVmhGajJsR3lE?=
 =?utf-8?B?Z1c0bm0vVEorQWJ3dmk5QkY2cFFPNDVjRmZSaGs4dGNhZ2taWHRtVktlTVlv?=
 =?utf-8?B?WFk1OTY1RXlkeHRjZTJOU1ZNQ1lwdXVKZjVjZjh6cFgrdFdPREg4V3c4TzQv?=
 =?utf-8?B?SGFwOGJEWGFkamw4UFNOeFpKMHl4cjJsTmhnZWpwL0F6MWxKOVhMWjQ1MGZU?=
 =?utf-8?B?TGRaektKSm1qVkc4T3lVZ0FPNVFUNm53dDRKVUdmT3J1Z2JqQWpiSDNnLzBM?=
 =?utf-8?B?MVE5RXZXY3o1VjRMVExvUWxCcFJwZmJHcmJjaTZqRUIyU3lOUks4ZU1ramFk?=
 =?utf-8?B?Q2RUcURsU01mdlF1R3dvNTVKTVRxUEt0RllNRmdzaDA5NDk5dHhhU1ZNcHpx?=
 =?utf-8?B?YTRNWGhDTC9RMlI2UkNGNk9WUklJeFNVK2xpeHNXMGRjYzB4d3Z2RjRYWGZm?=
 =?utf-8?B?azY4bElXMGs5TnFJTDZqeW12YnVaRDlZV29GSHpSdytFalNlZEE0NDI1WDFu?=
 =?utf-8?B?UjNOYm9GdGF1UVJvV09laVZ0RGV2b09Lam8xQmIxUk9UdzIwVmYzeSt4TENy?=
 =?utf-8?B?bzMxdzJDazRPeSs0WlRsVVMzajVCeEw4V1BQTGNvUzF0alBGbytLRTQ3MmNk?=
 =?utf-8?B?RE5XZXVTTFhFa3JUNGx1SHBRU1F6TFBCTHJWeW8rRFE5TzdsZFJudnVueHlZ?=
 =?utf-8?B?V1FDV3k4ZkVtVU43UFZKRHdtdjRtL28va3hIVUxJa2tSaThOSmkwczFDUFl6?=
 =?utf-8?B?KzRERGV2c1N1MXY4NFFjVllpVU5tb21OL0lmdlU1SlhQeDVmWlgvMUFqZElj?=
 =?utf-8?B?c0s4UExGclIrUkhEOXE0dFlUTXVhTWxxUHVndTRlbzYxbk5hQ3F6d05IMWt4?=
 =?utf-8?B?ZmRFVnpscFIxRitqaXJJZjFRdytKa2VqREVWWXo5OTE5U2QxWVZHNEVQeGhy?=
 =?utf-8?B?eEZLRkQwcnByRnNGWmZ1VS92V1hYU3BaUmdmb0ttckdpME4yOG9YbE55WTI5?=
 =?utf-8?B?dzlVTTV6K0pvM0NzY2Y3WnVRMlJQQ2V3L25pNVZUSG16NlBnRjdIK0JWVklF?=
 =?utf-8?B?QVQxem1QZ0E1VVUrWXM2bWNaY3UzeG1PbklaM2xleXlEYlkyYW83TENrQlJh?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a82b67a5-7a25-4707-6353-08dafd983d41
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 23:19:13.2773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79CF13kcBSDE1g338hPVZtpQlR23A6Cgp/R7KQIjOQLGEKRnxeEpuugfvNdzQpBNA4gGhshnhypzk8gXsUtn9xJWXBjVgBWW+SaISvUB6zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
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

On 1/20/2023 08:40, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 74 +++++++++++++--------------
>   1 file changed, 36 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 9a8a1abf71d7..e94f0d7119c4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -6,11 +6,13 @@
>   #include <linux/string_helpers.h>
>   
>   #include "gt/intel_gt.h"
> +#include "gt/intel_gt_print.h"
>   #include "gt/intel_reset.h"
>   #include "intel_gsc_fw.h"
>   #include "intel_gsc_uc.h"
>   #include "intel_guc.h"
>   #include "intel_guc_ads.h"
> +#include "intel_guc_print.h"
>   #include "intel_guc_submission.h"
>   #include "gt/intel_rps.h"
>   #include "intel_uc.h"
> @@ -67,14 +69,14 @@ static int __intel_uc_reset_hw(struct intel_uc *uc)
>   
>   	ret = intel_reset_guc(gt);
>   	if (ret) {
> -		DRM_ERROR("Failed to reset GuC, ret = %d\n", ret);
> +		gt_err(gt, "Failed to reset GuC, ret = %d\n", ret);
>   		return ret;
>   	}
>   
>   	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
> -	WARN(!(guc_status & GS_MIA_IN_RESET),
> -	     "GuC status: 0x%x, MIA core expected to be in reset\n",
> -	     guc_status);
> +	gt_WARN(gt, !(guc_status & GS_MIA_IN_RESET),
> +		"GuC status: 0x%x, MIA core expected to be in reset\n",
> +		guc_status);
>   
>   	return ret;
>   }
> @@ -252,15 +254,13 @@ static int guc_enable_communication(struct intel_guc *guc)
>   	intel_guc_ct_event_handler(&guc->ct);
>   	spin_unlock_irq(gt->irq_lock);
>   
> -	drm_dbg(&i915->drm, "GuC communication enabled\n");
> +	guc_dbg(guc, "communication enabled\n");
>   
>   	return 0;
>   }
>   
>   static void guc_disable_communication(struct intel_guc *guc)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> -
>   	/*
>   	 * Events generated during or after CT disable are logged by guc in
>   	 * via mmio. Make sure the register is clear before disabling CT since
> @@ -280,11 +280,12 @@ static void guc_disable_communication(struct intel_guc *guc)
>   	 */
>   	guc_get_mmio_msg(guc);
>   
> -	drm_dbg(&i915->drm, "GuC communication disabled\n");
> +	guc_dbg(guc, "communication disabled\n");
>   }
>   
>   static void __uc_fetch_firmwares(struct intel_uc *uc)
>   {
> +	struct intel_gt *gt = uc_to_gt(uc);
>   	int err;
>   
>   	GEM_BUG_ON(!intel_uc_wants_guc(uc));
> @@ -293,15 +294,13 @@ static void __uc_fetch_firmwares(struct intel_uc *uc)
>   	if (err) {
>   		/* Make sure we transition out of transient "SELECTED" state */
>   		if (intel_uc_wants_huc(uc)) {
> -			drm_dbg(&uc_to_gt(uc)->i915->drm,
> -				"Failed to fetch GuC: %d disabling HuC\n", err);
> +			gt_dbg(gt, "Failed to fetch GuC fw (%pe) disabling HuC\n", ERR_PTR(err));
>   			intel_uc_fw_change_status(&uc->huc.fw,
>   						  INTEL_UC_FIRMWARE_ERROR);
>   		}
>   
>   		if (intel_uc_wants_gsc_uc(uc)) {
> -			drm_dbg(&uc_to_gt(uc)->i915->drm,
> -				"Failed to fetch GuC: %d disabling GSC\n", err);
> +			gt_dbg(gt, "Failed to fetch GuC fw (%pe) disabling GSC\n", ERR_PTR(err));
>   			intel_uc_fw_change_status(&uc->gsc.fw,
>   						  INTEL_UC_FIRMWARE_ERROR);
>   		}
> @@ -382,7 +381,7 @@ static int uc_init_wopcm(struct intel_uc *uc)
>   	int err;
>   
>   	if (unlikely(!base || !size)) {
> -		i915_probe_error(gt->i915, "Unsuccessful WOPCM partitioning\n");
> +		gt_probe_error(gt, "Unsuccessful WOPCM partitioning\n");
>   		return -E2BIG;
>   	}
>   
> @@ -413,13 +412,13 @@ static int uc_init_wopcm(struct intel_uc *uc)
>   	return 0;
>   
>   err_out:
> -	i915_probe_error(gt->i915, "Failed to init uC WOPCM registers!\n");
> -	i915_probe_error(gt->i915, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> -			 i915_mmio_reg_offset(DMA_GUC_WOPCM_OFFSET),
> -			 intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET));
> -	i915_probe_error(gt->i915, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> -			 i915_mmio_reg_offset(GUC_WOPCM_SIZE),
> -			 intel_uncore_read(uncore, GUC_WOPCM_SIZE));
> +	gt_probe_error(gt, "Failed to init uC WOPCM registers!\n");
> +	gt_probe_error(gt, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> +		       i915_mmio_reg_offset(DMA_GUC_WOPCM_OFFSET),
> +		       intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET));
> +	gt_probe_error(gt, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> +		       i915_mmio_reg_offset(GUC_WOPCM_SIZE),
> +		       intel_uncore_read(uncore, GUC_WOPCM_SIZE));
>   
>   	return err;
>   }
> @@ -451,18 +450,17 @@ static int __uc_check_hw(struct intel_uc *uc)
>   
>   static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
>   {
> -	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
> -
> -	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
> -		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
> -		 fw->file_selected.ver.major,
> -		 fw->file_selected.ver.minor,
> -		 fw->file_selected.ver.patch);
> +	gt_info(uc_to_gt(uc), "%s firmware %s version %u.%u.%u\n",
Given that this function does not use 'uc' except to convert to 'gt' and 
the caller already has a local 'gt', could just pass the gt in directly 
and avoid the conversion.

> +		intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
> +		fw->file_selected.ver.major,
> +		fw->file_selected.ver.minor,
> +		fw->file_selected.ver.patch);
>   }
>   
>   static int __uc_init_hw(struct intel_uc *uc)
>   {
> -	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
> +	struct intel_gt *gt = uc_to_gt(uc);
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_guc *guc = &uc->guc;
>   	struct intel_huc *huc = &uc->huc;
>   	int ret, attempts;
> @@ -514,8 +512,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>   		if (ret == 0)
>   			break;
>   
> -		DRM_DEBUG_DRIVER("GuC fw load failed: %d; will reset and "
> -				 "retry %d more time(s)\n", ret, attempts);
> +		gt_dbg(gt, "GuC fw load failed (%pe) will reset and retry %d more time(s)\n",
> +		       ERR_PTR(ret), attempts);
>   	}
>   
>   	/* Did we succeded or run out of retries? */
> @@ -551,10 +549,10 @@ static int __uc_init_hw(struct intel_uc *uc)
>   
>   	intel_gsc_uc_load_start(&uc->gsc);
>   
> -	drm_info(&i915->drm, "GuC submission %s\n",
> -		 str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
> -	drm_info(&i915->drm, "GuC SLPC %s\n",
> -		 str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
> +	gt_info(gt, "GuC submission %s\n",
> +		str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
> +	gt_info(gt, "GuC SLPC %s\n",
> +		str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
>   
>   	return 0;
>   
> @@ -572,12 +570,12 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	__uc_sanitize(uc);
>   
>   	if (!ret) {
> -		drm_notice(&i915->drm, "GuC is uninitialized\n");
> +		gt_notice(gt, "GuC is uninitialized\n");
>   		/* We want to run without GuC submission */
>   		return 0;
>   	}
>   
> -	i915_probe_error(i915, "GuC initialization failed %d\n", ret);
> +	gt_probe_error(gt, "GuC initialization failed %pe\n", ERR_PTR(ret));
>   
>   	/* We want to keep KMS alive */
>   	return -EIO;
> @@ -690,7 +688,7 @@ void intel_uc_suspend(struct intel_uc *uc)
>   	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>   		err = intel_guc_suspend(guc);
>   		if (err)
> -			DRM_DEBUG_DRIVER("Failed to suspend GuC, err=%d", err);
> +			gt_dbg(uc_to_gt(uc), "Failed to suspend GuC, %pe", ERR_PTR(err));
May be worth adding a local gt given that the above conversion is now 
being repeated?

>   	}
>   }
>   
> @@ -718,7 +716,7 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>   
>   	err = intel_guc_resume(guc);
>   	if (err) {
> -		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
> +		gt_dbg(gt, "Failed to resume GuC, %pe", ERR_PTR(err));
This could be a guc_dbg("Failed to resume: %pe") given that there is 
evidently a 'guc' locally available from the function call just above.

John.

>   		return err;
>   	}
>   

