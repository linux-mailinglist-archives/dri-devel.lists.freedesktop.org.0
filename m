Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A1838132
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 03:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6AC10F3B4;
	Tue, 23 Jan 2024 02:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC4610F3C9;
 Tue, 23 Jan 2024 02:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705975585; x=1737511585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LRM8EPstnky4A2ipfKUSFQ1F4Gm7OLi9VuIIEVZa94s=;
 b=gERkh5tzmwgDn8+CelxQYafhgw3g/GrP1F6WAbK+ZQAnkARp1NeG47hZ
 hElMnXFrGG+sZTdEKWfuiB3SA/rAbpU3u6pDJAwynsaYwwCT3lYxeXGBz
 iEmcxo/hCOEZX5drLL+0dpNEDg4IAXSFwLqSMZXpQqxrc4VAq4HPr6GH4
 ogK9Ssbwm04KBkTfR0Qboq7kbb08nW5CqRciUlDIoP+ckaPnxW+syAsVb
 ppAbY+AJLADczXtACyGObdSHvddlJbFuun3ZInq/87+6TPoVmd/XNwjPa
 EMm6RWUQmswCRoo80jbssmLy7jAWoHEKVbFkHtCluNtoss2TBVLm3V8TH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8042056"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="8042056"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 18:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1117072957"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="1117072957"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 18:06:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 18:06:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 18:06:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 18:06:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFZZql7LdB0xrkpfXzgYSkaLDHRbSeF4GB2WB9xdHyshxjCkRfxObj5uOKEPACjDi0e6lpUr7jg8ArTMyYDoX6S0L8h6XXf58+bbYub7/ik0DkSqSLlCLrZSSThi/EP2RAsFoZdS2Agq20D0hdHNo6CLjg1bUHCwmDua45fL26ZAI615eaLj/gO5+YB4hBHvVlDkc/86ygHY32IZ5rM0jfm5nrgpKaYgnyBmVSmnBzUtxT9hawCWLfuzo9Fp+y3me7RTMWKzzPNksrzc2I3tL12xpAiq9EsnAXh8JmktAi1hc/kGBW7E5yzop9LAY0X+fAG7g7aipjmJMm+qoaTFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V87ydG2JUAjD8zRi79BtYQG/2/GKKIG9GSPlPPKlF4s=;
 b=NafpswdYfW5NwyT6vB91kcaKRoqT+mG9vk5qvMXyNec/Rwpcxz8zZhwYDBOqZxKGdpQADwbi0phX2aAlGLMlfArVsWeqSfDsLaxXRGnp6p6CLRstimIDpa+0FLBiy7Kph09T5PWlk4AGPEeqGHnylyq8uOhQ49zbI9LacqrmSntNSSK/luZBvTQSUSk/6BWPSdzlkVNc7Q030fCnn80AviPR9noMZiLdrujflHcoHo9jSk/w0MMMpwAF5YM33cQwd1B6WvoHLyUJfWLkDjoZqzHpbBjzwZ7H1ZLMOA1ZQ2QaaB5eaojKJXHhqqRmHDS3vpx3YVtcjL0VPHgUSrD+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 02:06:15 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d%7]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 02:06:14 +0000
Message-ID: <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
Date: Mon, 22 Jan 2024 18:06:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] drm/xe/svm: GPU page fault support
To: Oak Zeng <oak.zeng@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240117221223.18540-22-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::19) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CH0PR11MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c83c59b-b1e5-4018-ac14-08dc1bb7e103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bdko4omU0EyVWh4rC7Iu8LDz+31zkiyQklmFl94FHbzJIUTudP37UC/fVQleIDA84FY5YeuM/7S81kHJK0zfwvX67hrFwqCrpcBTTyidGr/htgubk4KpuPlz5GlAV10EDIVg3tySzTxPHbnBj4r8tq2aPyoBOcjuKPIzPxECaZmSxQIBxzNSz70+zJ/5Bmbhd4yghphXMAQAtE1ZN/sB/3SJ9Dhdt3925roVhNFnFz9DzAXg1lFV7SjYJ/ts77LfRoFMZjUxeoo5K72gikCvWM9MG5QUUtUQeSTf9iA5kQn99PeYyHi1aNTujxZnIXE+HJGa9cAGUS/9omNtm7pG46HkHY7oveiKrLpJY/m0fyTDn0/yeqYldwwM7HMnwl3F6Lu8LRJp0etFuCRP7ly+KfNGWqg/lPIiSrHgTOk71nywyq/Yl5v3zjEFfUiZncqmN7vIXMLkhQ8g4IkNiKT2uBfnbYufMuh89tvp1WhRuqxBI7LwBJjQIZpCdk/fzb7qbSE2Z5Jx7HzirgpUOYSvaingigCqh0SgU04JBD18lTEyGxjKKJrx0bydntJRvqUmGMf+0xDi1pWVq9/fafVHw9s+eodpQK3UIoZrHpEgvY2pFIyK9kR59KO4KXP4dnJW+l0d/equMHkVcN85HcBUQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6506007)(26005)(66574015)(83380400001)(2616005)(41300700001)(6512007)(4326008)(31696002)(36756003)(8676002)(8936002)(316002)(2906002)(86362001)(5660300002)(66556008)(66476007)(53546011)(66946007)(6486002)(478600001)(31686004)(82960400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTZyMDU5VjljOFpTeUV5RnZSSXZIelpHcE5aWC9UTzBwR0Y1eW1DUW9JRlZS?=
 =?utf-8?B?bEwwVG5YUXNJbGhjUGlQRzZMWVRiTFdzWGZnRzR2dFEvUnFVT3lQYTZWTlFL?=
 =?utf-8?B?WEFCaTFFQ2pRSUJkTXIrRU5EUTZCcHhwSTR5TG0vZEJWYy9IcnZuVi9vWnY2?=
 =?utf-8?B?U0sxZ3ZyOHpoLy90SUVyZjBoVEI2Si81dkZuYXgwU3ZtQVhJS2NKdEhpVXdu?=
 =?utf-8?B?WjAvUVdKTVNKU2J2SDRQTnIzNDRPbFJVUHFRbXZEQXJwNUJicS9rbEs1THYz?=
 =?utf-8?B?RDFyWVVMVTNCQnBOZ1U1d1R1MFp1cWtpQVRLd3d5aWdNV29NU0pLM0xPb21D?=
 =?utf-8?B?WWhjTFZxWEFMMkpjcjlJM2k5WWhlV0J5SGZPT0xHK3V4elYyeldsZkNYNStL?=
 =?utf-8?B?TzhLRkUxVXhncmd2cEVYUlpRRDdGdCtJazMrNWRHdHFDRWZwQ2lCdnVuK3N2?=
 =?utf-8?B?ZVhEZVZXcVZvWUw1bmVRWGtSZlNNWjE2cWR0K2EzVy9QeGNqcVJmaHpySnV2?=
 =?utf-8?B?bCtkRDZkbFl6bnRocGhJdzkxUTJGM3IxSFFta2ZkaVZFUlZyTERkUytsRGxv?=
 =?utf-8?B?bmQwVU5hc09yY0N2SXFMVmhJRWJMLzBpb1VldC9ZU0JwVDJOMDZqSHEydjBh?=
 =?utf-8?B?RmRwNE1hcit3Z0tTdW5RcExmRkczcDAyZ053bi9kVGhmWXczWldFL1dzaDlE?=
 =?utf-8?B?YjBxK25iZ0tyY1pKck9DTzdaOVN6bnFMcTk4UWJzUFo5RmhWUm5kS2poZXBx?=
 =?utf-8?B?L1JmOHk2RUxEMG1wK2owQlBrcXVvUTFpQW5nbGNTWUlmdFBVUzBxS1BBek9M?=
 =?utf-8?B?Qy9hWVU0SHB2aFJQZjN1SkNuTFovUzhGNnBsNHFKUUF0R2YxYngybE9MWjhU?=
 =?utf-8?B?UlRQTFAzcWNNaXd0UzNYc1lIamQ1L09YMlRTaFZXOUlXbmZMc1hOa3BYZEFa?=
 =?utf-8?B?bG9ENk53RXdmb1hGVHBlVDRKUk54WlF3YWw0YjZ0SmZKSUlMNGJnandqTURF?=
 =?utf-8?B?SjVSWWNPcnc4anhZYm1ON0tqWjZQNGIzOTQ0WHZpVEk3SkkvUDZDcXFpU1hG?=
 =?utf-8?B?SjBuNVRXWTVzRk9oMlN0bnlCaFJQSGdQZ1JuZUthSkxHdGh0S1ZQUzExQzhl?=
 =?utf-8?B?VjdXajhPVWw0cU1qMUtCVTFhSE55TXdPdHFEalkvb3dyeEYyVnhXWG1VclF2?=
 =?utf-8?B?T2NqdEVvb3ZGYzVjMjFra0diYndmMVNNeXVoeDJqUWVha3FxQm8zdkVrbVUv?=
 =?utf-8?B?dVpuUE41WHBxVGJXN2FkbnVIVmxLZDRhVXUrWkk4eXEydGNqZmFSd3g1Ymxy?=
 =?utf-8?B?Ym9VV1h1S3FSRW5pMGRHdUtKd2M0Z3F3L3I2U2NWUkY5MFZ1cXdKWVVQRGl5?=
 =?utf-8?B?Zlc5RFlYOUlRMnc1cWl0N3B4T3NwS0VQVXdnOG8wUzJkSnM1ZkpFRXZQT2Zh?=
 =?utf-8?B?SEZ5d2JMVEJSRks3TndxRzlVYWl1M2FNWndxR0dYUWNncFBQZ25YNVBsbkdw?=
 =?utf-8?B?a2NDd2J2R0lXbGNPWkhIVFlLSDd5S2prRGdURDBUUEJPenlxMFRySzhZby9C?=
 =?utf-8?B?eTN6MFM1aW5vdy9TRWE2eDk3Tmg2VldaTklPdW9TTnRtYmpEYUhXZmEybkhR?=
 =?utf-8?B?R25ySFBWQStIcE42a25GRGEzNC9HaEF0K1VselM3MVA0OWVYSE1oSy9hNC9J?=
 =?utf-8?B?QjhFRklxSVRyT1JaK2FzK0h6VE1aQjdyWjdpL0pjK1B5WlpxajAwaitUelYv?=
 =?utf-8?B?TXZsMW1DYmk5VE9yelJkMnpRQ0wxVGxFeURHcFNrUnd1M3EyRTg2bXJ3eEdK?=
 =?utf-8?B?cUlBUWY4cVdRUk1KSEVrdTFGeWMxVi9RdjRaZDlsQXNGT2d6VkVpSzE5eW4y?=
 =?utf-8?B?NGs3MVhlc1UveWdoOXkvdzdxNzlna2ZMN3RFY2xEamtGZnhwVEtETzVwdkg4?=
 =?utf-8?B?MktSNFlNYzhVNVl3em9zS1hjMmNDdFFPSnUwektEbTg1YzBkSVZzb2ZCNHJN?=
 =?utf-8?B?QUYydFA1SW82N3RMeWJsTjFZOUxnUDV4ZWpqQUVDMzBZelVzTms1ZWtXUzNx?=
 =?utf-8?B?V1RxUUpPbGo3NUtDUjlsdDJZTys2YXRUd2NJS1hoL2p2dGlEUzhBUm0raGxh?=
 =?utf-8?Q?xaKJ5KC6JusIRutYbWfLlbHYZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c83c59b-b1e5-4018-ac14-08dc1bb7e103
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 02:06:14.8935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiMw24TNqlQgNwTpBl5MueL+CgYhg5nwWn8loCbmlzkdRgsbJpMSwCRF/dkO5iIx0gsrSu+aAq8hn6NzyMgvIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
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
Cc: matthew.brost@intel.com, krishnaiah.bommu@intel.com,
 niranjana.vishwanathapura@intel.com, himal.prasad.ghimiray@intel.com,
 Thomas.Hellstrom@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/2024 2:12 PM, Oak Zeng wrote:
> On gpu page fault of a virtual address, try to fault in the virtual
> address range to gpu page table and let HW to retry on the faulty
> address.
> 
> Right now, we always migrate the whole vma which contains the fault
> address to GPU. This is subject to change of a more sophisticated
> migration policy: decide whether to migrate memory to GPU or map
> in place with CPU memory; migration granularity.
> 
> There is rather complicated locking strategy in this patch. See more
> details in xe_svm_doc.h, lock design section.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c |   7 ++
>   drivers/gpu/drm/xe/xe_svm.c          | 116 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_svm.h          |   6 ++
>   drivers/gpu/drm/xe/xe_svm_range.c    |  43 ++++++++++
>   4 files changed, 172 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 467d68f8332e..462603abab8a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -22,6 +22,7 @@
>   #include "xe_pt.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
> +#include "xe_svm.h"
>   
>   enum fault_type {
>   	NOT_PRESENT = 0,
> @@ -131,6 +132,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	if (!vm || !xe_vm_in_fault_mode(vm))
>   		return -EINVAL;
>   
> +	if (vm->svm) {
> +		ret = xe_svm_handle_gpu_fault(vm, gt, pf);
> +		goto put_vm;
> +	}
> +
>   retry_userptr:
>   	/*
>   	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
> @@ -219,6 +225,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   		if (ret >= 0)
>   			ret = 0;
>   	}
> +put_vm:
>   	xe_vm_put(vm);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 0c13690a19f5..1ade8d7f0ab2 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -12,6 +12,7 @@
>   #include "xe_svm.h"
>   #include <linux/hmm.h>
>   #include <linux/scatterlist.h>
> +#include <drm/xe_drm.h>
>   #include "xe_pt.h"
>   #include "xe_assert.h"
>   #include "xe_vm_types.h"
> @@ -206,3 +207,118 @@ static int svm_populate_range(struct xe_svm_range *svm_range,
>   		kvfree(pfns);
>   	return ret;
>   }
> +
> +/**
> + * svm_access_allowed() -  Determine whether read or/and write to vma is allowed
> + *
> + * @write: true means a read and write access; false: read only access
> + */
> +static bool svm_access_allowed(struct vm_area_struct *vma, bool write)
> +{
> +	unsigned long access = VM_READ;
> +
> +	if (write)
> +		access |= VM_WRITE;
> +
> +	return (vma->vm_flags & access) == access;
> +}
> +
> +/**
> + * svm_should_migrate() - Determine whether we should migrate a range to
> + * a destination memory region
> + *
> + * @range: The svm memory range to consider
> + * @dst_region: target destination memory region
> + * @is_atomic_fault: Is the intended migration triggered by a atomic access?
> + * On some platform, we have to migrate memory to guarantee atomic correctness.
> + */
> +static bool svm_should_migrate(struct xe_svm_range *range,
> +				struct xe_mem_region *dst_region, bool is_atomic_fault)
> +{
> +	return true;
> +}
> +
> +/**
> + * xe_svm_handle_gpu_fault() - gpu page fault handler for svm subsystem
> + *
> + * @vm: The vm of the fault.
> + * @gt: The gt hardware on which the fault happens.
> + * @pf: page fault descriptor
> + *
> + * Workout a backing memory for the fault address, migrate memory from
> + * system memory to gpu vram if nessary, and map the fault address to
> + * GPU so GPU HW can retry the last operation which has caused the GPU
> + * page fault.
> + */
> +int xe_svm_handle_gpu_fault(struct xe_vm *vm,
> +				struct xe_gt *gt,
> +				struct pagefault *pf)
> +{
> +	u8 access_type = pf->access_type;
> +	u64 page_addr = pf->page_addr;
> +	struct hmm_range hmm_range;
> +	struct vm_area_struct *vma;
> +	struct xe_svm_range *range;
> +	struct mm_struct *mm;
> +	struct xe_svm *svm;
> +	int ret = 0;
> +
> +	svm = vm->svm;
> +	if (!svm)
> +		return -EINVAL;
> +
> +	mm = svm->mm;
> +	mmap_read_lock(mm);
> +	vma = find_vma_intersection(mm, page_addr, page_addr + 4);
> +	if (!vma) {
> +		mmap_read_unlock(mm);
> +		return -ENOENT;
> +	}
> +
> +	if (!svm_access_allowed (vma, access_type != ACCESS_TYPE_READ)) {
> +		mmap_read_unlock(mm);
> +		return -EPERM;
> +	}
> +
> +	range = xe_svm_range_from_addr(svm, page_addr);
> +	if (!range) {
> +		range = xe_svm_range_create(svm, vma);
> +		if (!range) {
> +			mmap_read_unlock(mm);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	if (svm_should_migrate(range, &gt->tile->mem.vram,
> +						access_type == ACCESS_TYPE_ATOMIC))
> +		/** Migrate whole svm range for now.
> +		 *  This is subject to change once we introduce a migration granularity
> +		 *  parameter for user to select.
> +		 *
> +		 *	Migration is best effort. If we failed to migrate to vram,
> +		 *	we just map that range to gpu in system memory. For cases
> +		 *	such as gpu atomic operation which requires memory to be
> +		 *	resident in vram, we will fault again and retry migration.
> +		 */
> +		svm_migrate_range_to_vram(range, vma, gt->tile);
> +
> +	ret = svm_populate_range(range, &hmm_range, vma->vm_flags & VM_WRITE);
> +	mmap_read_unlock(mm);
> +	/** There is no need to destroy this range. Range can be reused later */
> +	if (ret)
> +		goto free_pfns;
> +
> +	/**FIXME: set the DM, AE flags in PTE*/
> +	ret = xe_bind_svm_range(vm, gt->tile, &hmm_range,
> +		!(vma->vm_flags & VM_WRITE) ? DRM_XE_VM_BIND_FLAG_READONLY : 0);
> +	/** Concurrent cpu page table update happened,
> +	 *  Return successfully so we will retry everything
> +	 *  on next gpu page fault.
> +	 */
> +	if (ret == -EAGAIN)
> +		ret = 0;
> +
> +free_pfns:
> +	kvfree(hmm_range.hmm_pfns);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 659bcb7927d6..a8ff4957a9b8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -20,6 +20,7 @@
>   
>   struct xe_vm;
>   struct mm_struct;
> +struct pagefault;
>   
>   #define XE_MAX_SVM_PROCESS 5 /* Maximumly support 32 SVM process*/
>   extern DECLARE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
> @@ -94,6 +95,8 @@ bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
>   void xe_svm_range_unregister_mmu_notifier(struct xe_svm_range *range);
>   int xe_svm_range_register_mmu_notifier(struct xe_svm_range *range);
>   void xe_svm_range_prepare_destroy(struct xe_svm_range *range);
> +struct xe_svm_range *xe_svm_range_create(struct xe_svm *svm,
> +									struct vm_area_struct *vma);
>   
>   int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
>   int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
> @@ -106,4 +109,7 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
>   
>   void xe_devm_free_blocks(struct list_head *blocks);
>   void xe_devm_page_free(struct page *page);
> +int xe_svm_handle_gpu_fault(struct xe_vm *vm,
> +				struct xe_gt *gt,
> +				struct pagefault *pf);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_range.c b/drivers/gpu/drm/xe/xe_svm_range.c
> index dfb4660dc26f..05c088dddc2d 100644
> --- a/drivers/gpu/drm/xe/xe_svm_range.c
> +++ b/drivers/gpu/drm/xe/xe_svm_range.c
> @@ -182,3 +182,46 @@ void xe_svm_range_prepare_destroy(struct xe_svm_range *range)
>   	xe_invalidate_svm_range(vm, range->start, length);
>   	xe_svm_range_unregister_mmu_notifier(range);
>   }
> +
> +static void add_range_to_svm(struct xe_svm_range *range)
> +{
> +	range->inode.start = range->start;
> +	range->inode.last = range->end;
> +	mutex_lock(&range->svm->mutex);
> +	interval_tree_insert(&range->inode, &range->svm->range_tree);
> +	mutex_unlock(&range->svm->mutex);
> +}

I have following question / concern.

I believe we are planning for what we call 'shared allocations' to use 
svm.  But what we call device-only allocations, will continue to use
GEM_CREATE and those are in the BO-centric world.

But you need to still have the application with one single managed 
address space, yes?  In other words, how will theses co-exist?
It seems you will have collisions.

For example as hmm_range_fault brings a range from host into GPU address 
space,  what if it was already allocated and in use by VM_BIND for
a GEM_CREATE allocated buffer?    That is of course application error, 
but KMD needs to detect it, and provide one single managed address
space across all allocations from the application....

Continuing on this theme.  Instead of this interval tree, did you 
consider to just use drm_gpuvm as address space manager?
It probably needs some overhaul, and not to assume it is managing only
BO backed allocations, but could work....
And it has all the split/merge support already there, which you will 
need for adding hints later?

Wanted to hear your thoughts.

-Brian



> +
> +/**
> + * xe_svm_range_create() - create and initialize a svm range
> + *
> + * @svm: the svm that the range belongs to
> + * @vma: the corresponding vma of the range
> + *
> + * Create range, add it to svm's interval tree. Regiter a mmu
> + * interval notifier for this range.
> + *
> + * Return the pointer of the created svm range
> + * or NULL if fail
> + */
> +struct xe_svm_range *xe_svm_range_create(struct xe_svm *svm,
> +									struct vm_area_struct *vma)
> +{
> +	struct xe_svm_range *range = kzalloc(sizeof(*range), GFP_KERNEL);
> +
> +	if (!range)
> +		return NULL;
> +
> +	range->start = vma->vm_start;
> +	range->end = vma->vm_end;
> +	range->vma = vma;
> +	range->svm = svm;
> +
> +	if (xe_svm_range_register_mmu_notifier(range)){
> +		kfree(range);
> +		return NULL;
> +	}
> +
> +	add_range_to_svm(range);
> +	return range;
> +}
