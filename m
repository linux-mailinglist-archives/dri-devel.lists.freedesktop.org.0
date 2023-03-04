Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2B6AA778
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 03:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A1810E16E;
	Sat,  4 Mar 2023 02:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795BB10E16E;
 Sat,  4 Mar 2023 02:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677895225; x=1709431225;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sz1M88z+nSJ1vAQmy5R6fxxfox7STHsBiWCPhfLbwE4=;
 b=FQZSEpOKHeRsFPOP4ql4qmMUQVmlr+cVwJi2GnE+udNWv0h9O/J8l0eC
 gBAqG11E68uCC6XzlM4+ooKlDvPfEgTSwsPfz7CKzV4V0V5rYRVbYs+F1
 aNRzHnsW4+oYVj40AFudlWKVf+ec2lKgOvXvZW/l3NKnvsoNwA7JywaCQ
 GRn6yQKA9+ew0F4D07+adq/Sjyt8pRbEU/445gdT8U8NEamtfLwg3f5Nd
 0wXy6nlSk8ZUCORS6M5g2vMq9TngvNXuCS3Jb+QvtvDRjZx4O5hZMLOJb
 Heb+eRUsh/ZbIgdXhqBznH4c+S3mbZrLYDqVcQl98atvGyYUbfqbwdEHF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="315605131"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="315605131"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 18:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="652984350"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="652984350"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 03 Mar 2023 18:00:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 18:00:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 18:00:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 18:00:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+MW/fsfBN8A8Y+t2pWOg0NVv737t1d9HDdIQvW2oc/M4WtllVyPjLQ9DhWTGlw54/Lv6lPZjqFAFMeo13f5U65mQPDFpHUcCfkKIjNsBJ/02COO13wvNl1TBW2tkAY/dK7AnlujEwTYw3A/LR3Mf8SuA44EB6bzqe8NlV3iU+yEY28IGshTLp7EN1Xruh7V9Kt65p1MqhtIB2RdjjCz6cUcSp7Vg73OOc/OOyXXaDC2tbYzK8iR9qS/e1s9U0SZ6NknKPm5LCAPpwhVz2rusJHHSs3oMsBR2NOpSyLRNAmrh1CLkRr0jt+JUoYAn7OX6TrsReMB9eVdoCXgeyYPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl14KEib/3z0L9k6hFwiBBTibqielDE+t5D8XuCyukQ=;
 b=ewwBVFk9aqD8ykHgBTni+vWsvkvkrQ+vhQNrf9IffNJLMJXAk/xGo6IJZssSxyRl7jRflXshDQ/RUGJvZCxN4q+fHQ74mPhiikJtkZK9JTzIaBIKUQlt3JeO1lDKyjNMc2BE5F2dxZ0kYwmk3x58gAfLSQMIGpvKxK1tWeRgUKv+oA7/7TU0vX4/f1Fs0cmmYbuKfuMluZCpdMLrv7GtVsCmC63rV0QZXHFdPHM26wxYj+3+C2OYapiR63BTE92RddBoZbqnNGevM75TwK+RctQK38Ov31SJpPyjLsEY0ZqaDnQPUDPy/JJ1FdkQwVqEyR7Kds8WpVEaBPouGeXdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.23; Sat, 4 Mar 2023 02:00:11 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 02:00:11 +0000
Message-ID: <60f5c71d-2eb5-d467-3d5b-39c1b31e1208@intel.com>
Date: Fri, 3 Mar 2023 18:00:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 8/8] drm/i915/pxp: Enable PXP with MTL-GSC-CS
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-9-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230228022150.1657843-9-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: b30386e1-05d5-4e0c-2069-08db1c542fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /KC5YV04mj7UxeeJX/x6fI1zniV/CW2pz8cuGZgwWsN8LxCePohA3EzLTR4gXfF3tgKg/nFXe8weBw0dy8McWFygOLgx1K8Q2OUN6iH0Bit1Yr8abM1Tj5m7MgXVq4JSs/fOKrC08pbZ+a0UdcZARob9UTllWZ6S+ZSSK5N8Mt+Liu5WyDUdNPUE+fKeP6QdGS4OwIhGUgGXEyBhPHAYa2yyujfF2cRUAyt1xRKpIeV+I1fc9NYfG/0SZzWdvIKf8yz5r4PMSt/Ct+jNWZTW1LFcdB1tosEznSk2YTIpeNLTY2cbEhPFC2C7VTVqfbKdKb1hXI8yoqIQTRAv1UL8FzjJsbTbFvDP+b4L/hhW6c/2t2EBrkBsNunSMv3rthEBpGJIcpD2QqL8eAH67I0zZLoXjq6uBimJgVEYASp5Wyis9371R3Y9oYKBs9gbVSSfEcxZOyWTt8YRdX6P13/sENxdb5MA3fFvZHVH6Ww0zLit7KdDuuoKuAkHy/xXyVjQ7/M/72kLFtgGuRnYi50Fv7Tk16Xps7xg99S4P6XAb5wcW9sA/Vg9Hdy4Y4Bqwor8JEDfK4zPqTEfMGzjd0zxRx9EVD8ehdCyICBo/O641MZqmLjVgInfJwrdZr4G3ZSp8vI9tyzVGJp4yxC8M4NiCYZSPzVaUGITRrXpsH2WiN3r2fgt3Jfxn9CTMiTfXblx5IdvuMEwHtTE5/0bOZzAwJbnZBYQYZ2W3GF3V4M2/xI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199018)(36756003)(82960400001)(6486002)(186003)(6506007)(6512007)(53546011)(83380400001)(26005)(41300700001)(66476007)(66946007)(8676002)(66556008)(4326008)(2906002)(8936002)(5660300002)(38100700002)(316002)(86362001)(31696002)(478600001)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHpub04ranBLdURickp2bjdnQUM1ZlQ0cEV6c1VhUGNvdGNQT1JQbnNWWGs0?=
 =?utf-8?B?RG1TMWV3emFkQjN4K3pjOTJQa3ViVkEvV0o5QW9rNC9CR055U3pNdTN4dnY4?=
 =?utf-8?B?RDA5VTB3VENQdFc5RjdaQ3ZRZFlCWTZ5YjZuOGswZHE1QXRBWldaQ2I5ZU14?=
 =?utf-8?B?dEVMNEtPWUMwcTJoclR6TjZPaXhaaWh0Q3hiRThYcm9YR2o0OHVjQlpuQjhs?=
 =?utf-8?B?SFE0cjBHb1JIN3RXSXU4bTB3T09PajFTUTdSWW90SnJETncyZ1VyTXpGZnUr?=
 =?utf-8?B?b3ptcVJZQmk3VC9sTDdIelc0T0NNQVFUMjB5aE9WZDFrdlovQWhyTmM3MTFN?=
 =?utf-8?B?eXBtaXRxTGovNWFjd0NEdm03VmIxMU5NZkZ1cms1dVhPVGZRU20yQys1R2Qr?=
 =?utf-8?B?R0RjQ21vWGVBZlVYWlpFdzZuaEEwM1RLc0w4QkRJbWFFY2dYT2RZN3FaVHBF?=
 =?utf-8?B?cW5SdXVUamxZSTVQOFhJY2xoZmFlTjQ1Z1BkaFFkWjNCK3pjdGx3MGU1RGg2?=
 =?utf-8?B?N2Z5Mk1WRW5JRkdSSFg1Uk1TNm1nR3Q0NmlwajYyTWcxVmQ5Y2pXZ2VvVHlV?=
 =?utf-8?B?M3FHMExaSlFIRXgzMzVRSVVVOTNqWnJlYXdmaWRKVlh4QWkrUVRUaFVMY3px?=
 =?utf-8?B?YnIvNW15YjJnc2RQMTZkaDBmL2grK2tvaDY2RVRnM2t0TWI2ZzJ0LzBKZkV4?=
 =?utf-8?B?eVBkR01UdG1xajlrL090MXkzSEtHSVI5eEQ5U090YUFjV1EwL3VvQ1RpQnFV?=
 =?utf-8?B?OGN4RW03YkJoZml2NTd1R0tKb0JMclY2M0pHc05WcklyYnQ5ZGRpTDZoalFZ?=
 =?utf-8?B?N3k3WUF1UUVxTGJ1Tncva2hvVlozRzFhTHNPSk9IN3QvYWtXYkQzMWpFMWhR?=
 =?utf-8?B?WlBlYzZSQjV0OVN6MW5xOUhGU0ZjY1U1K1VxR1F1bzBUc1AzL1hzWHlpMUtO?=
 =?utf-8?B?Vm5lU3doQ3AxOUdoQWZhODJVZlBPU0NqelBRcDZhK2JRUDBCSEFZRytpM05C?=
 =?utf-8?B?YmxlV3FqSGlpM3pVaFlwNW9FanlILzkyVnJqS01TMGhPcTd4eENzUWxjZm9n?=
 =?utf-8?B?SUJ6b2NEK1U4aWlWRGlnUjBOUm1qejhZU0x6eVBsekhURU1odzlkODRUaFFT?=
 =?utf-8?B?RVBLbmcvaXFMMjFsdFAyNVhIZjVBeGNCbTd2TW5kcFNFbzlpOFNTaU1tK2hE?=
 =?utf-8?B?OHM2ckpnbVlRcTRBQzJITEt2bldGTkxqQkVvSG9HTmFNemd2WUtRYWtXVmd1?=
 =?utf-8?B?SHdyOWpYYkxmM3FVS3J4WW1HaDJPVFNDMTVDMmZuNzRXNURScFZZOWxGK0VM?=
 =?utf-8?B?Uno0VTBjVlkyYllGcEhQeDgzay9iOTlzNUtjQS9qUXRDSmJMWVJlbklZM0c4?=
 =?utf-8?B?U1JBemdlVDJGTVdnMkgwRUI0akcrYVdsZ0VYTXpTdlFQL1VaYlF5WDRVZTJu?=
 =?utf-8?B?dzViV1ZLQnRPQ3NWOENBcFlNWGx2TkUwYWo0d2htU01ucHlBeHdyMDYwM0FU?=
 =?utf-8?B?aXBBd3RORWF3SkZ4VExackpvcXhtaXpLK1RDN1RIcENFOXA1eWlSSmdsUDg0?=
 =?utf-8?B?MmJBVTJGYjlTekVmb080V2VVN1FwalJmdCtDRkNaZ2dhWHBaVjAzaGdKV1hD?=
 =?utf-8?B?Si96a3V2KzRzZ3F6dmVjZzN5R25sdlZ4WHYrUjdEd2NKNzYweGVtelRWNFJk?=
 =?utf-8?B?OWluYXlwVG9WUm4xQ29hbXc5b3BYaG15SXNDNEE0YW80cXNoSTRPTkFONUFh?=
 =?utf-8?B?M3hhWnJmRWtXc0JOUVEzOWlGOUNRSmJKeE9MOXY3a0dnYVh6VWd6cmVSOHpx?=
 =?utf-8?B?TmdISS9EcE84T2tBbnBSMTBaNE01QUF0UmVYeEFMSVJEeEdxR0FZUmxKS29G?=
 =?utf-8?B?WnVwQXl0cU9SK3Mwd2p5c2NqZmUxdWxPMStCdE9SUVNhMFg4dHY0cHVxVHhK?=
 =?utf-8?B?YmxNQmtyQ2dpdThWbUFXVXpLcmd5RURHeXM0MzE1MndGUTAyK0FzV1Q3SEdi?=
 =?utf-8?B?eXZORDN4Skk0ZHFrSlFiNUdRbWtnS0lna0xYbUVKbUpwZmtweTh5VnI0blhv?=
 =?utf-8?B?dTZtUEVTZHdkbXgxWnpVeG9EeGNaS3RraEpGVVU1OWI0aVhlUFpyaFU4cVpJ?=
 =?utf-8?B?Y1JSRFo2VHYwa3FsZGlxRmo1YThtMkFpYVVsRHY4RFJrZ1NWL2ZEU3ZEL3Vw?=
 =?utf-8?Q?ufQ1KlLSR6iJOZN+e6bKZxI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b30386e1-05d5-4e0c-2069-08db1c542fe9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 02:00:11.1101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 199TxqavzSUmtLnNvU00w3JPwon959NgZCw+cR/0uDGoa54Dd52cYSE0LNXqVhO5GZnazqrUllotPhKQX1pm1nK/3lER89fJYZbHGT94r+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/27/2023 6:21 PM, Alan Previn wrote:
> Enable PXP with MTL-GSC-CS: add the has_pxp into device info
> and increase the debugfs teardown timeouts to align with
> new GSC-CS + firmware specs.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/i915_pci.c              | 1 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c | 9 ++++++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 2 +-
>   3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index a8d942b16223..4ecf0f2ab6ec 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1150,6 +1150,7 @@ static const struct intel_device_info mtl_info = {
>   	.has_guc_deprivilege = 1,
>   	.has_mslice_steering = 0,
>   	.has_snoop = 1,
> +	.has_pxp = 1,
>   	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>   	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
>   	.require_force_probe = 1,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> index 9f6e300486b4..ddf9f8bb7791 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> @@ -14,6 +14,7 @@
>   
>   #include "intel_pxp.h"
>   #include "intel_pxp_debugfs.h"
> +#include "intel_pxp_gsccs.h"
>   #include "intel_pxp_irq.h"
>   #include "intel_pxp_types.h"
>   
> @@ -45,6 +46,7 @@ static int pxp_terminate_set(void *data, u64 val)
>   {
>   	struct intel_pxp *pxp = data;
>   	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
> +	int timeout_ms;
>   
>   	if (!intel_pxp_is_active(pxp))
>   		return -ENODEV;
> @@ -54,8 +56,13 @@ static int pxp_terminate_set(void *data, u64 val)
>   	intel_pxp_irq_handler(pxp, GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT);
>   	spin_unlock_irq(gt->irq_lock);
>   
> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
> +		timeout_ms = GSC_PENDING_RETRY_LATENCY_MS;
> +	else
> +		timeout_ms = 250;
> +
>   	if (!wait_for_completion_timeout(&pxp->termination,
> -					 msecs_to_jiffies(100)))
> +					 msecs_to_jiffies(timeout_ms)))
>   		return -ETIMEDOUT;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 4ddf2ee60222..03f006f9dc2e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -44,7 +44,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
>   				      KCR_SIP(pxp->kcr_base),
>   				      mask,
>   				      in_play ? mask : 0,
> -				      100);
> +				      250);
>   
>   	intel_runtime_pm_put(uncore->rpm, wakeref);
>   

