Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C86F8728
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FE010E638;
	Fri,  5 May 2023 16:58:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CDD10E638;
 Fri,  5 May 2023 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683305917; x=1714841917;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6yy1bgBGVzrrkKmSxTy04q2jAw0NmmHLYqMKeolX3Mc=;
 b=XtwHYHdhpz4v1GJVttazO79xlne7sdyjDr95qe5CkFe1tu0cxUe1vy0n
 TUJh/u0NvygAxF8ZVtTeTd+wVcbKeaFvfL0gLuIIlwGaBbp74QBr6CqeG
 vvCh0b5tTCS386KYV6+0wkRHpLuhuyxmoOu7rGu1UN8S+m+CZzCNJpeWc
 iwdt2Gb9yW1GDjmogRydAhSpAPMkB7+VHnVHGW5L3hl2w7zDc+jEGsQYI
 YRJlpT+maWxtw9Z2Ob1FHGuPcofbIQ3Ee7DR/F0k5jmjVYPRvnkMGTwq8
 UYljj9RJiR3I0p09vUvytKKnoGJmKtwet44pvNt/+wRVgpwTixwTMR5L6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="346720459"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="346720459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871928549"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871928549"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 05 May 2023 09:58:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 09:58:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 09:58:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 09:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeTE63fLEnPuRd+XYQoO8MwU1/leVjuQR0KoTKViizcu09vL+xZSyhRPy4umpkiwEgt/t3DOAVh3LbUf1aAGdXfxskTGhFBPzQ2Z6I1e4YKNXhjK+tAuHup1JJhhHNTBICtgFh2IOXeC4vR8+/kEvc0IaqpEPKzXRewh1eGvLle9RTlQHkrZ/Nf5KSzw5dTzhPe0XdwcvLZ6YpQ2ZoZvGU2Hj4cL/22VXsfovsAbHG4/JIoXDEqaIVq8dd+CqlDnFuCgJvL/W3+HvLcPG6MbI3zIzMMvgsty1hCzow5cjB3/VemA3nl6Tye5V7rYBSiwrHV42htugA6bH9fzFA99bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+09c6f81qXdtUpYLaaftOHjC5gnRSI9qsIHpjWpwto=;
 b=VoSf8NeTaz8NZRcUIUUHRC0LY2ueyuphrAem9D8wPBY2cc6ipHK6njzIOhqI3Dws2ycU+au42OHvoVlQtnJrpIx0DPaZXDjxGgSIsC6eiRbrbY/qf+IqxlS6aEEEjwjyxEMKSfaBbf2bzKVaI3nGQ94PZ9E99BXltoqpben6Lennzxy0zYKe/XznO+6Sbx65EQSj74+GdFzCFPoRm1LGGUTqSKlw87MIeExJw4s4XOIfH2gds87Zj5CF4HImqqI0Pjz2tDKgRtHNPBYZoTuulmsWB5PjLD+nw1ESMHXFFsq2g7ISjP4ueQK7GWlQ0rAb5SSR21vhFUIBbHncmQIcGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 16:58:31 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%8]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 16:58:31 +0000
Message-ID: <2c5bfdab-1adb-b022-ca58-92a90f2a13d5@intel.com>
Date: Fri, 5 May 2023 18:58:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH v3 4/6] drm/i915/uc: Enhancements to firmware
 table validation
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
 <20230502234007.1762014-5-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230502234007.1762014-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4d47d5-bdb0-41de-1833-08db4d89f459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qalRLe1hMrzavGM9FD6TcXE3v6fcWiGDYnxq+hbJa9vR0n6UC6HWxFiUnR1sD8P25xpUAz12vjw7j+DpRV18PjOdaX2sVV38nJAJrjGeISwf58bOpZZkBKiO2fRqQnV/vaWtYOpG62qv0T7+czP+0YwCESKl3Q2sa8UZbDGbg+EEORwzH4qMZlzh8VkxsjaCyB8lq0ZcKL8Pis608w00Ra1EzPF7rdx/sNcpnd5syroTS6HZIjUP/JXXx1ijrlT5sPNgrkFLUyCr3ZD9418g3jRSxpDmzWbTrRNgdwYrJmqScNTAlLvMiDP09UEJkeYAOYSZR2yXa/JLIuP0ggV8iBk1VMhXKEqmqlxSOMinAzC32OyBYPpDZW6BrT7fLr19U5fbb6NVzGZVoPW4YgmnFVrHFzdxq/Xercg7xAmtCU0wGb3DmSv3RueK+9jj2KcmJP6x8llJvjGFNdA5D0aUBUAKKcR6lzCyWnG7Cs8P+N8Yoaxv1juKXjAtKUVeQ0K3HVa5DGSk1b68mFrL6TAYIst1UUdJmNwEplu8SqTWGlk/09uvwvOLvdUP8OL3gSL4HigLHsQrw/I3Otr91nv5ftArBI+ofDOJdzk6rIPmEOiqlec4ZonEz2Mk4C3UQTd41UDWeL+PdEJaycxr5fe/tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(36756003)(86362001)(316002)(450100002)(31696002)(4326008)(66946007)(66476007)(66556008)(6486002)(6666004)(478600001)(41300700001)(82960400001)(5660300002)(8676002)(8936002)(2906002)(30864003)(186003)(38100700002)(6506007)(53546011)(2616005)(6512007)(26005)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emJlaHJ4TXlmTmdnUVh2c2FsV0FneTJ5YmREeVBobzUxV3hpMmpMKzZuNVVl?=
 =?utf-8?B?YldIbkxqZUN0c3M1WXpObjEyamMwU0xpTjdJaDBZZTZQelBSSUp3MTZoMGRx?=
 =?utf-8?B?akJZclNRN1h6Z2psUjNQMzBPMVZ2VlVCVi9mczdndHV3RXVkY0FzVUlXbmlF?=
 =?utf-8?B?WWxsckdCWHpxN0NzV3crdTZPU3VZN2hOaC8zM2pHNVN5bm5SWkRXZDl6VDlw?=
 =?utf-8?B?TGNYVGN1cWRTNEg1V29HVHBIdytwclFoU2F5cVUwYXhvWEcyaWd1c2dyK3Rk?=
 =?utf-8?B?dm9mdFJqNWVUQTBLZGdabTBWOWVzcFhwTHl2UWlYTmlSMDFqeTZqdlRYYmxO?=
 =?utf-8?B?OWNtR3VrWEk3dnFQUFVoRFN0NmUxdzZKdlZ2cXp0ajlRaXdaRnhLa3YzS3RY?=
 =?utf-8?B?Y1hPYjR1czZ3LzJiVzZDTUlhUUk5dlVNaU9vR08ySnZ4ZUl2KzJiRXVwV0dq?=
 =?utf-8?B?bndza2RjcTVPK0JQVE84eG45K1FRbTFHUGxyb1k2NzJVcm5lWS9QcDRTczFn?=
 =?utf-8?B?YnJ1a203SHBnZWlVcm16QTVxejRrUVNzWUVpeW5rRk94ZzRiT0JoRG9iY01L?=
 =?utf-8?B?ems2MFZpbGV3aXphemRDbHJldklNcE9KajhuK1IvaE9YZFFqRWFIL1ZQcW0x?=
 =?utf-8?B?MGVNT2RtTHlNM0RmTytwdGs4SmtqVkxTYVRGOFk0S3lpb0lXVnZkOFcxazhJ?=
 =?utf-8?B?ZkJTTGVpWDVSVUQ2K3RLYTBxYUJDRHhlUHdmQnJ2eHdJeTduSEJoY3Q5TklC?=
 =?utf-8?B?YVcrZjd3VGFMYWVHa3ZFeWMrWHoxaFd0NUkrdS9lekV6RjN2azJuVUdDZzFq?=
 =?utf-8?B?bU10VWphU0wrMFRXK2VtaEF6UzJKek5EQ2UvallJanRlb3N5YzVleTQ4YkRM?=
 =?utf-8?B?b3NMNEpDQTV0K0gvZlVKdk1KUVZuWmNqbHVKVUN0bGhjWmQxV0wreGdUcXND?=
 =?utf-8?B?WVQwelcrNUpZSmlhR0xHd2RxTU4vRkpJNUQ4QklVSDJOdmxvMDAwY0s0eFNB?=
 =?utf-8?B?ZWtwNTFqOGxNUlNRUXNPYUhqRVpBSnd5c2Y5L0JmUk4rcTdheS9IT2VteThB?=
 =?utf-8?B?ZGM4VGJpOG9hR1haZ1FVSHlqUTkxREtjNGx3cVRYNG9tcGIxV0dkYm5mTjJ3?=
 =?utf-8?B?ME5aQkltNkUraE5KeTlsMzUxTXdFU2FGTjFhSXlZU0pvRDg0a2lCR1R3UUc0?=
 =?utf-8?B?aFh1VnRWVHh5bzNRRW0xY3lyMWVuaU05bDA1SE9MSkRNL1NSZk5PUk1mRlVI?=
 =?utf-8?B?UVFkbWczckRSamptMCtMdllOSDVDZFIrSi9jK21JUkJXd2tqc2RQMG1teXBv?=
 =?utf-8?B?NHZqcmxudmJYbTNaSjB2Qi9qMEk3UVM1bXFiaXZiZUh5ZzdXQk5KYWhzcGd3?=
 =?utf-8?B?eGFmWGxxa2xpRjZoOENZYlpTazgzdG5WbWhxc3lLWEVyOXJBR2VocWEvVW1G?=
 =?utf-8?B?WE9WQUpKSGcybmRsMXZYRTI5bk0xSTUrdTA3OVZFbng1VUhuYVVCM0tPWmU0?=
 =?utf-8?B?WmVsUTJoYjRKMGdNakprNjk4TWoxRVY0ZHRSOGllZlZPclhSM1hoSTBXZGdU?=
 =?utf-8?B?alY2dmZEcGo4WGRPbVZZVDR2Ly9mbCtGRVJZYkpnRUM3WXVQN2gwYm03ZmZy?=
 =?utf-8?B?Y3BvbHBIa0syUWRvRXh1Y1B1Zk5tL3ZBOEpOQkVVdkh3endtZ0hVQzZJUnFa?=
 =?utf-8?B?SnlCR3c5UFBhSjNyNUVOMWJuMkpxak9xYittc2NCWVlvYXlCRkdUVEtiby8v?=
 =?utf-8?B?WTJ5aUJCL1ZMMlhhMFowdm5CZ3lqQWVKM0I0ZEhvbUxabDQ0MDF5N0RUekUy?=
 =?utf-8?B?ZndJRURzaGlKSW90c0d3REtiaDJSdkY0QWZMaWdHWGh1TzloeXNqYkRGdExJ?=
 =?utf-8?B?TytOZmc2YXVyOFJjVFdtUUlRdWt6UVU2Y2xRbjhhaDlWL08rbEZsbDhyWFV1?=
 =?utf-8?B?MXNPSmhtME50Y3BkMFcrNDNhamNSVUFnNVBOazh0ZE5mVGhRKy9oSlJoU2Jm?=
 =?utf-8?B?WnhYS1Z5VjVhTTkvRnp2Q1krV1NyWHZ0ZDZiY2k1dGExdUtNeXA3U1c0Vk12?=
 =?utf-8?B?TDBTQTQ3NzRpZjF1SUFVbFRuYTUyanhJQkF0aGpaNzd5M085RmNqYjJHOUFm?=
 =?utf-8?B?QzZzZmU5a2orNjNyU2dKQkM3VXYwTExRMzFONStVQ0pEOHJCUTdaeFEvQWF4?=
 =?utf-8?Q?nYY6HDJc12Z4ayysURUGpRQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4d47d5-bdb0-41de-1833-08db4d89f459
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 16:58:31.0836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98uR+jbNFZ84DmWBDtdEV0YmGqy2BlhdgxqryPkusebOCQwWhTK3fLThusZ5bpj834ncZ1QUdlWexA3yf8Qdnv/1bjPOr5add6eR7N4KNHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2023 1:40 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The validation of the firmware table was being done inside the code
> for scanning the table for the next available firmware blob. Which is
> unnecessary. So pull it out into a separate function that is only
> called once per blob type at init time.
>
> Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
> It was mentioned that potential issues with backports would not be
> caught by regular pre-merge CI as that only occurs on tip not stable
> branches. Making the validation unconditional and failing driver load
> on detecting of a problem ensures that such backports will also be
> validated correctly.
>
> This requires adding a firmware global flag to indicate an issue with
> any of the per firmware tables. This is done rather than adding a new
> state enum as a new enum value would be a much more invasive change -
> lots of places would need updating to support the new error state.
>
> Note also that this change means that a table error will cause the
> driver to wedge even on platforms that don't require firmware files.
> This is intentional as per the above backport concern - someone doing
> backports is not guaranteed to test on every platform that they may
> potential affect. So forcing a failure on all platforms ensures that
> the problem will be noticed and corrected immediately.
>
> v2: Change to unconditionally fail module load on a validation error
> (review feedback/discussion with Daniele).
> v3: Add a new flag to track table validation errors (review
> feedback/discussion with Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c    |   3 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc.h    |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 161 +++++++++++++----------
>   3 files changed, 99 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 996168312340e..1381943b8973d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -432,6 +432,9 @@ static bool uc_is_wopcm_locked(struct intel_uc *uc)
>   
>   static int __uc_check_hw(struct intel_uc *uc)
>   {
> +	if (uc->fw_table_invalid)
> +		return -EIO;
> +
>   	if (!intel_uc_supports_guc(uc))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 5d0f1bcc381e8..d585524d94deb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -36,6 +36,7 @@ struct intel_uc {
>   	struct drm_i915_gem_object *load_err_log;
>   
>   	bool reset_in_progress;
> +	bool fw_table_invalid;
>   };
>   
>   void intel_uc_init_early(struct intel_uc *uc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 55e50bd08d7ff..64e19688788d1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>   	u32 count;
>   };
>   
> +static const struct uc_fw_platform_requirement blobs_guc[] = {
> +	INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
> +};
> +
> +static const struct uc_fw_platform_requirement blobs_huc[] = {
> +	INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
> +};
> +
> +static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
> +	[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> +	[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
> +};
> +
>   static void
>   __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   {
> -	static const struct uc_fw_platform_requirement blobs_guc[] = {
> -		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, GUC_FW_BLOB_MMP)
> -	};
> -	static const struct uc_fw_platform_requirement blobs_huc[] = {
> -		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
> -	};
> -	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
> -		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> -		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
> -	};
> -	static bool verified[INTEL_UC_FW_NUM_TYPES];
>   	const struct uc_fw_platform_requirement *fw_blobs;
>   	enum intel_platform p = INTEL_INFO(i915)->platform;
>   	u32 fw_count;
> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   			continue;
>   
>   		if (uc_fw->file_selected.path) {
> +			/*
> +			 * Continuing an earlier search after a found blob failed to load.
> +			 * Once the previously chosen path has been found, clear it out
> +			 * and let the search continue from there.
> +			 */
>   			if (uc_fw->file_selected.path == blob->path)
>   				uc_fw->file_selected.path = NULL;
>   
> @@ -306,76 +313,91 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		/* Failed to find a match for the last attempt?! */
>   		uc_fw->file_selected.path = NULL;
>   	}
> +}
>   
> -	/* make sure the list is ordered as expected */
> -	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified[uc_fw->type]) {
> -		verified[uc_fw->type] = true;
> +static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_fw_type type)
> +{
> +	const struct uc_fw_platform_requirement *fw_blobs;
> +	u32 fw_count;
> +	int i;
>   
> -		for (i = 1; i < fw_count; i++) {
> -			/* Next platform is good: */
> -			if (fw_blobs[i].p < fw_blobs[i - 1].p)
> -				continue;
> +	if (type >= ARRAY_SIZE(blobs_all)) {
> +		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
> +		return false;
> +	}
>   
> -			/* Next platform revision is good: */
> -			if (fw_blobs[i].p == fw_blobs[i - 1].p &&
> -			    fw_blobs[i].rev < fw_blobs[i - 1].rev)
> -				continue;
> +	fw_blobs = blobs_all[type].blobs;
> +	fw_count = blobs_all[type].count;
>   
> -			/* Platform/revision must be in order: */
> -			if (fw_blobs[i].p != fw_blobs[i - 1].p ||
> -			    fw_blobs[i].rev != fw_blobs[i - 1].rev)
> -				goto bad;
> +	if (!fw_count)
> +		return true;
>   
> -			/* Next major version is good: */
> -			if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
> -				continue;
> +	/* make sure the list is ordered as expected */
> +	for (i = 1; i < fw_count; i++) {
> +		/* Next platform is good: */
> +		if (fw_blobs[i].p < fw_blobs[i - 1].p)
> +			continue;
>   
> -			/* New must be before legacy: */
> -			if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
> -				goto bad;
> +		/* Next platform revision is good: */
> +		if (fw_blobs[i].p == fw_blobs[i - 1].p &&
> +		    fw_blobs[i].rev < fw_blobs[i - 1].rev)
> +			continue;
>   
> -			/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
> -			if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
> -				if (!fw_blobs[i - 1].blob.major)
> -					continue;
> +		/* Platform/revision must be in order: */
> +		if (fw_blobs[i].p != fw_blobs[i - 1].p ||
> +		    fw_blobs[i].rev != fw_blobs[i - 1].rev)
> +			goto bad;
>   
> -				if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
> -					continue;
> -			}
> +		/* Next major version is good: */
> +		if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
> +			continue;
>   
> -			/* Major versions must be in order: */
> -			if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
> -				goto bad;
> +		/* New must be before legacy: */
> +		if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
> +			goto bad;
>   
> -			/* Next minor version is good: */
> -			if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
> +		/* New to legacy also means 0.0 to X.Y (HuC), or X.0 to X.Y (GuC) */
> +		if (fw_blobs[i].blob.legacy && !fw_blobs[i - 1].blob.legacy) {
> +			if (!fw_blobs[i - 1].blob.major)
>   				continue;
>   
> -			/* Minor versions must be in order: */
> -			if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
> -				goto bad;
> -
> -			/* Patch versions must be in order: */
> -			if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +			if (fw_blobs[i].blob.major == fw_blobs[i - 1].blob.major)
>   				continue;
> +		}
> +
> +		/* Major versions must be in order: */
> +		if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
> +			goto bad;
> +
> +		/* Next minor version is good: */
> +		if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
> +			continue;
> +
> +		/* Minor versions must be in order: */
> +		if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
> +			goto bad;
> +
> +		/* Patch versions must be in order: */
> +		if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
> +			continue;
>   
>   bad:
> -			drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> -				intel_uc_fw_type_repr(uc_fw->type),
> -				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
> -				fw_blobs[i - 1].blob.legacy ? "L" : "v",
> -				fw_blobs[i - 1].blob.major,
> -				fw_blobs[i - 1].blob.minor,
> -				fw_blobs[i - 1].blob.patch,
> -				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> -				fw_blobs[i].blob.legacy ? "L" : "v",
> -				fw_blobs[i].blob.major,
> -				fw_blobs[i].blob.minor,
> -				fw_blobs[i].blob.patch);
> -
> -			uc_fw->file_selected.path = NULL;
> -		}
> +		drm_err(&i915->drm, "Invalid %s blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +			intel_uc_fw_type_repr(type),
> +			intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
> +			fw_blobs[i - 1].blob.legacy ? "L" : "v",
> +			fw_blobs[i - 1].blob.major,
> +			fw_blobs[i - 1].blob.minor,
> +			fw_blobs[i - 1].blob.patch,
> +			intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
> +			fw_blobs[i].blob.legacy ? "L" : "v",
> +			fw_blobs[i].blob.major,
> +			fw_blobs[i].blob.minor,
> +			fw_blobs[i].blob.patch);
> +		return false;
>   	}
> +
> +	return true;
>   }
>   
>   static const char *__override_guc_firmware_path(struct drm_i915_private *i915)
> @@ -430,7 +452,8 @@ static void __uc_fw_user_override(struct drm_i915_private *i915, struct intel_uc
>   void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   			    enum intel_uc_fw_type type)
>   {
> -	struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, type)->i915;
> +	struct intel_gt *gt = ____uc_fw_to_gt(uc_fw, type);
> +	struct drm_i915_private *i915 = gt->i915;
>   
>   	/*
>   	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
> @@ -443,6 +466,12 @@ void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>   	uc_fw->type = type;
>   
>   	if (HAS_GT_UC(i915)) {
> +		if (!validate_fw_table_type(i915, type)) {
> +			gt->uc.fw_table_invalid = true;
> +			intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
> +			return;
> +		}
> +
>   		__uc_fw_auto_select(i915, uc_fw);
>   		__uc_fw_user_override(i915, uc_fw);
>   	}

