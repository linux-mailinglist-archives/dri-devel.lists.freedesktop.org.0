Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F8C797DCE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 23:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660BF10E304;
	Thu,  7 Sep 2023 21:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB59810E304;
 Thu,  7 Sep 2023 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694121228; x=1725657228;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KJ9EyuXd0Ti87zkAV/D0TStZxl2bKcEA6PnQalJKzY4=;
 b=mq3m3fabonwAUiUM3vEE3yX1a2OpwWNEp5H2hArI04otaYdShxwF8B/1
 ArwpWmjeBn7RlYCQDmnk+4hVbbyHRvIStGPVHRK7GMQS2l12bV2NnATHr
 iilddk5OHU561ZTInBIagvpCRh7/oiAfcNW946cTmjWL74fO+jk7M8xz+
 QIYZKB3lF503M9LErWhcpCi/x/0YVHpYwM3GLQfnWbE+t/mE68FqSkcon
 UP3OEjnOy7ZDq41YOUJ7x46TE1QXrQ1X95YK3JmmuMorUv7XqiRs7HFdQ
 HAZtF+0KCn5RJhXKJMUKH+fwS4m083yWZDK+UFFMkM/uoPRfaXtLYejn4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="443903302"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="443903302"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 14:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771445728"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="771445728"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 14:13:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 14:13:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 14:13:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 14:13:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYTlqtwHkyMWoqu6uhtlaUFM7Q3bwuXH9TJMVC0q2mtGotbhRtld+JRb0/25KZh7a1MKp0n9h/nhRbHTanEyibO7sXkyWOjDOWhZr5uIuvNWXqn2HMIYD0+L0cTHbUZVQA5kngvc++25GLolAjVgVSVXrlKjIArK3ih4GNMKbnQCKbq6a/ewooob/lYN3pBzVIxAbJYb9KBkHvWein4mXC5ZKa+NHhQjHrb+FfV+3LvRNI1t740yp/k5uF5Dt/X34l0DOud4FDPHUB+J6VufQilST0JoJ6gl5OxqJh0SMWecsaHqcH3/X1Xh4nQhI6lG4X1D9sozavKl0Q7xWRlZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lDKfFahXiUkKCd6/gqW2s6KIH1CiKI3ChYvVYHMi/A=;
 b=m6kOUzEo+u47wvl8Xr4ad5NJN+FjHjyMZq4fB5VxmCUjqtZr+B1mxxTB30s1XpU6E2EuxYp2pM9P6ukFTZmh14N5vScZvL+KqAM4DUMNx9vh8Md6skqZsOf1XC4Lm9lZWQZn+1RO6NaZalACsYGayM3RoUJ3ZO1KimdBj/Zmakl2ZXtdJS/S+UBSeFhyamefbKAHfnugRGOfCah2eIdHTayTjIxKqKVfLzMlKZuyPg2BI7vQ0sFResfd68gb713nftBGWA0h+rwPB2c/uyiPQ97CGLGIbNAX6Mk9/pWkY5nFnJykZIaDJebf837MYYAh38K6y1l7K8ci2C9hDQTk/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 21:13:43 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 21:13:43 +0000
Message-ID: <1f416165-81e1-a1ed-9bf0-3601f27685ee@intel.com>
Date: Thu, 7 Sep 2023 14:13:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/huc: silence injected failure in
 the load via GSC path
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230816231320.1555190-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230816231320.1555190-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO6PR11MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 0887c44b-3d6e-403e-dd21-08dbafe750eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9coFldzxKmt6G0Z/Q4WZRUYtrZBRCeN7DQdwdpQKQOSsTONEkrb/A714tIeHl5FIbJdpFdQv6Pvawgjmup82pbjXNbdfIPRDMHv2JneHG5l4d1UQoc9bDlvqoTUA47/8MOTrHLV+v/HEYLDMMBj9NKqcXSrfnPR/NBzeGo0qi6b64phGF5Kwc4Y+6j5CQZWoiXPxW+2zkRWNXet/he7RsxxpV2MR9kLBI/Yj9ZupKzRtpj+/2tprhK4FJ/5WWaMUpAPZ9jKyjGNgTeM6PMlcMkgg9Dakqbp02/le6rPTZ2C0oowrULG1cw3RbUKkHykRA0w2xQ+irrv1duZDpjUWS7dyi9V521u1KGvDiZjOxvX2uLV2bDuwjyNmZRDlsMOUFz98zYfDSMA2NI+FZNXwyZ+TRBSfviXbmFPru5tciZaYpIzuolAZb+QXJrv5hlM+qQOCoNK9CEckqXvtGPx3lMLsu0aljR52fZRXUyTA8iMbSiOycR/5KrPfIimruNdqt+HqPhoRCg0StxFiwTBIm9+zh570QtTJMzF6iAu0Ove9UqIG4b7J5jgUMtZsonKup+cl60DDJp15ZxoyINpgQ5qpulAlA7KYWVwasMtYHRSKhuO0On3NJZc1GRfjqWoL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199024)(1800799009)(186009)(6512007)(8676002)(8936002)(316002)(4326008)(6486002)(41300700001)(31686004)(66556008)(5660300002)(478600001)(966005)(6506007)(53546011)(2906002)(26005)(66476007)(2616005)(450100002)(66946007)(83380400001)(82960400001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djJrbVBpVHJ4TXdYcGkvS3FZM1V0eTVFNmJMeWNteGFqOFFnTjZ0ZWE1RlIr?=
 =?utf-8?B?UkxUS2pwZXZLcEphWXZiRWxiak1oUmhWKzl4QUJadTRuaXg3VkR4K2RrdTRE?=
 =?utf-8?B?TGRxbldmbUdQWEcyWkwvcXhFQUdQZHBtem1JbTZUaWROU01mVnRmRWxUQ1BS?=
 =?utf-8?B?UGkyOFYrVzRNOXIzZTkvVkw3ZWt5akNUbkFpYld4cEJQQVVKNVpha0NGY0dr?=
 =?utf-8?B?M2FkbFBDdnVLMmgrVWJoLzBRZFh6UGIrRXZ3S1YwSkx2S1E4SkxsWm5lQ2NT?=
 =?utf-8?B?KzlnWlZJMkZqbGpJUGtDZEFIbW5xd2hwbVpIY2ZFNnUrV2hETlM3RXZoNmxt?=
 =?utf-8?B?dHg1dG80NUUvalZUVmh4b3JwbTVkOVNxR1poMFd6WVlNNExWOHhjSHQxbkcx?=
 =?utf-8?B?WVVzbXBtUEhKeDBzb1c2WlNHQnFLRzIyM3FEVUwxc1R3RTQvZVBXTEt5OGw3?=
 =?utf-8?B?UXBJQXN0Zkhnb3FzTFNtK0VibTlNM1FtSDFMZ1NIUXVFOWYwM0dXRE1KT3Fs?=
 =?utf-8?B?M0daaTJ0OHhpSGRTUWJpVU8rTjdZUWZvK1QxUS83WWxpOHF5Um1vTkRqZXd5?=
 =?utf-8?B?aitPSU5QSnZJTmxvQVZzaFU5RGNPd21xY0xBb1BTMTJsRkdvOTFoUU5INzFq?=
 =?utf-8?B?K2Z5Y2FJa21CRG9OTlFsVFZhTnJmM1NzcytrUElqWHVNRG9KaHoxQmVNUGFM?=
 =?utf-8?B?ZkJoemVRalhKc0pnRWJvK1plK1V1djZWTVY4dkcva3ZsL0tkMUV1V0Z6UXZ5?=
 =?utf-8?B?V1ZjSkJ1clJTMVNLQjBheGhOUmZ5aUd4Y2hTOS9FM0laZ1lva0JNYWlQRXY4?=
 =?utf-8?B?cGplWDluTUM0bWFhcitLRy94N3ZXSWplVCswL3BOcVZwbHBpdXZWaVhmWHhk?=
 =?utf-8?B?clVMcll1K0o3ZHl5WmJiTThPeVI5VnZxQUlJeExVL3FkSzd4K3RuYW80Q1pK?=
 =?utf-8?B?YkFuVnFXQWE2czhxZjcxQlA2MkJ2NTh2RmZSTHRROWhMK0J0alAyTTlkeHhM?=
 =?utf-8?B?SS9EcWorL2puNEppM1hqOTJWektycEw3ck1pM3JtblhiMzlRN212RjN0ZlIw?=
 =?utf-8?B?clRIdHhFclNBRitSU1JrZXRUZEpNRGtsYzNybUJoakt4MFhoajRMaXY5NkJS?=
 =?utf-8?B?MTVMVFVxdXFkdGFGSjF1c2NPWjR5RlBxYllpWUY2U21IQkZFbkcwVjRIcjVu?=
 =?utf-8?B?UnhtVXBUeHYrNkNkM3pyM0d3MDFtaXA1cEViNmRwTTRuUXpnZk1EaWQrZXpF?=
 =?utf-8?B?a1lralJra3FUMWpPWHI5T0l5dEZBR3NzWDZyOHNiYmRqM1JjM3VjVlZvbTgw?=
 =?utf-8?B?dDhkZXpMSWlXZzBNcUxmQXlSV0RORzNSRWx5RWhUZlFkd1l3K3BTbGVoMmEy?=
 =?utf-8?B?UVpiWjZrVTdVUXI2ZG1MaU8yTHRRWWZpMFdISEdLUXBYajEyOW13S3VFOURp?=
 =?utf-8?B?WlE4Z1pnWFYreDliVnE0ck9pTE5melVPVXo0YjdPWE5TS0IxY0xhdXpCVWdZ?=
 =?utf-8?B?aVNQTUtMbjRETUJNK3V4ck8zeDJhM1lzRXo3RmdNdURkWmlSbWZyV0Nod2xC?=
 =?utf-8?B?WmxVMGY3R1R3NGh0VlJIeDcxdDdrazBsQ2xsbUNhSDNjZUdRaUNoU1Z5M0tx?=
 =?utf-8?B?MWdqL0JsM3NmZ2RFemsvZFlzc1FBVVhacHQ3Z01uVklwRVlPYVU3Skc1UUtP?=
 =?utf-8?B?clNIcDFPZ1hwTjY0WVp0S3dTYmpNUDRuRU41R0VmTjBkVmIzT3pzdGFYVXgw?=
 =?utf-8?B?MWh0OGlEYlYrci9LZ2dRdnovekJQUkZVaG9BLzNneTE1T0tLV2xPTm91dnQv?=
 =?utf-8?B?L3pDd0F6cmR0cnMzVThQL1FxR2tLNEFObTNybytzWkZtU2ZxVTU1VlpIT2tP?=
 =?utf-8?B?YXhPWVNYczQ5T01tZDhQK0NjQVg0V25zL3dEK1c2bDFaZkR0c3BZdW9pQnFM?=
 =?utf-8?B?Rk1OV05iVmVxdHRpaFVXYXBiRVJoRzRqbWpTNXRsSnVvL05zYmpVWFBWYk1w?=
 =?utf-8?B?QjluWEFQRU9NZi9oY2dzeVVPMFlIUmZVR3hYcnExMkdOMXQ5VlhmWk1ySGda?=
 =?utf-8?B?dGV3YTFkNDVQdmVzYVJUNWJwZktwRXNYSWowVmJXQmRPL1hxMDhDOGJvbXBy?=
 =?utf-8?B?dzlmMUxQRHFINzhkdjd5ajRoblRMNCtUR2h2Rk9hZWMxVTRPdmpEbTdzZU15?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0887c44b-3d6e-403e-dd21-08dbafe750eb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 21:13:43.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHSdjCjFDCu32ouK/l2++TvwaVvaDBrzLUR+l8iB+ia9sI4+0xQj2HApgab0xaSIho1f3f2frbHXiLD9Il6HLL3gHkIHjZYnKG3V3eG8Hzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/2023 16:13, Daniele Ceraolo Spurio wrote:
> If we can't load the HuC due to an injected failure, we don't want
> to throw and error and trip CI. Using the gt_probe_error macro for
> logging ensure that the error is only printed if it wasn't explicitly
> injected.
>
> v2: keep the line to less than 100 characters (checkpatch).
>
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/7061
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> #v1
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

Although aren't we supposed to be using %pe / PTR_ERR(ret) these days? 
Not a blocker but for future reference.

John.

> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index f89a1f80f50e..bb58fa9579b8 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -9,6 +9,7 @@
>   #include <drm/i915_component.h>
>   
>   #include "gem/i915_gem_lmem.h"
> +#include "gt/intel_gt_print.h"
>   
>   #include "i915_drv.h"
>   #include "gt/intel_gt.h"
> @@ -156,7 +157,8 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>   {
>   	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
>   	struct intel_pxp *pxp = i915->pxp;
> -	struct intel_uc *uc = &pxp->ctrl_gt->uc;
> +	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_uc *uc = &gt->uc;
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
>   
> @@ -176,7 +178,7 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>   			/* load huc via pxp */
>   			ret = intel_huc_fw_load_and_auth_via_gsc(&uc->huc);
>   			if (ret < 0)
> -				drm_err(&i915->drm, "failed to load huc via gsc %d\n", ret);
> +				gt_probe_error(gt, "failed to load huc via gsc %d\n", ret);
>   		}
>   	}
>   

