Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F138B440
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865846F4B1;
	Thu, 20 May 2021 16:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC8B6F4C6;
 Thu, 20 May 2021 16:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTHAcLWJvsG00rtz49pukPRS9iPqiO3Th5WpxBwgDGyUhKFoNVAlzqaYpFYGNmFcHNn3UukJ5vdpscQ6UcMJQj7Iqzl7cL6gknjSGOpw9cd1fBz1fgfKjEcjJuLUoOUS/vpgFUqGeCpzT9PjlDbolAr2s0uknTNvtUnuAmyq0HftHHHfo1kqJPessin9w64axx7wZRqIXjD6TPdGwX/6ybADVrENi/z0zCF3iiejqkF4stp2lNxKEko9ZXK8kGv5oA6nr4xadWYWfgK2UnkyiOwrnamQPba9NIh3L3tG0PX0ELvLnLJv4aTS0bM5r0pSU3cbzYu7ccPONrJxziK6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSYKFvmIAHklQj34gwBelk3Gr4Mg0sMlTTjO3Ep1psk=;
 b=gSjbUvcF9XaHzsoYwRF7D5EyMx26uxRwkd1PYfCkAbQnfcAFO+CnEPzxJNCXoas1bD0iS5ClWJXkst8AQ4T9GjIw441/wWccP8liRL9B0Yd/BtRTH/q3jiM5JwuFdaodSkM0GlS6awl1nuDfMTtBtFbTbrcbMC13CPRYkcFWnrukwvtdwTdvsT0jGOQ++i+LdBDLJ91jcw/DEpR5B/wz5Ze18Y8re/8PeUUUp22xbBSV7tlFuqR34S+HB0S1wIG2OwqTj3I/+G0z6xO8IqurI57rLP626/SUNTPgEWKYTlG5nrWXSV+73McL4PytaCdXviTOI5W3mOzG4R3NZsCt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSYKFvmIAHklQj34gwBelk3Gr4Mg0sMlTTjO3Ep1psk=;
 b=bSOTdzaIm83hiZQgCLLxTIV/hCX04IGVrLtjQXCD+lKGxRKZhMtJ95SAAcXSCV9uiGYn0cN6Ml5mkIfuiDRZmLw31logqr7CL6mWIX+kbMjdUG4sVUuKBGeQZpHrUJTeu/wYiw6uyz1l+OGqAqalRh80RkXQKFnF/nnGJYvx6TQ=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 16:31:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 16:31:18 +0000
Subject: Re: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
To: "Nieto, David M" <David.Nieto@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
 <20210520151254.959958-8-tvrtko.ursulin@linux.intel.com>
 <BYAPR12MB28401B22CACDC249926C0A19F42A9@BYAPR12MB2840.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <38a6d339-bca5-13f0-1cc8-db96f1b587bb@amd.com>
Date: Thu, 20 May 2021 18:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <BYAPR12MB28401B22CACDC249926C0A19F42A9@BYAPR12MB2840.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------F6CBFF1FC5F0B7F3DEE672AB"
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: PR0P264CA0265.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 PR0P264CA0265.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 16:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a236738a-2574-4b6a-15f2-08d91bacb19b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB493274CFFE49BC9F6F805FFE832A9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pw1x0lVHgp4FB7hGi7hOVIJv1i9B1Ri7NXVLFfmP/hzyPSpMUo4450PzGcmE659ymk0gEXCbvrtyWDKxkOfpEBtmWnsjq4uj0IohwR0duAOE/alPI3RE7OeXmnmm9O5SM32gVrqfZw+p77Zz0EzmWh1UQ/0XZm00NCmJcrtBuMFBpcg0AO5aP/eOj9DOjbk6A+/ujV8w5R5rO1yluaDDs53gdJtw7yLAl5Ju5sHZ1kdeMvKJ8h0Hebe6GWc6vmdS3J9t9yFURxU64gAavSOikS6AZwzzAiHX/BuzewG/XukLtZLU99KNzHq2dppk/UIzHM+wtrqvJ5ACHgP2UMqUQ+X4bOOt7SGXBbxli7b5VfKZA20h/kX4pIQrtHJBchQ8dT8IkNqCAHhWgFOpa6YZA7cV1GyTvGblq5Rsmq3X4n198C3jaFWs/D+NP/yutRyLww/yQACgbGDq2txemq4OlrbiCjyXNctWlhE/x/oV76pS8c3Aa0W4XSm8ZMZ2D9c8pWdnKrl8ND4fEOCd2GpVLr7/Ur+DnuKVBzqmtlseZa3Z4tuP5ov5FVkOkvA+5z8lQipBvJKrOAo7y4J2L6q8y9SpmILWUKgB/TjpJbjRjvymm8gAfbq9n/aCuaxv78bDzACUyLCi4mhNfSGIBPpZAkuBH354xIyFiUR7U/GpzS4GxIT/jKWoiT3smi898MgM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(53546011)(5660300002)(33964004)(6486002)(83380400001)(66574015)(31696002)(30864003)(66556008)(36756003)(66476007)(2616005)(19627405001)(52116002)(31686004)(4326008)(478600001)(66946007)(38100700002)(316002)(186003)(86362001)(16526019)(6666004)(110136005)(8676002)(8936002)(2906002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHd0dFg2VGFaZ1RjWDNoM2w3QUEyRzlqMHBSVndkeC9rR3RKS29nbStER1NP?=
 =?utf-8?B?MHpya1JMZkdHcVlvRlZvbU9oSGxLSTF6NFFTZjdWU0Zxbk8ya1Rvbm1DRng3?=
 =?utf-8?B?RmdabHpPRE5rc1NCKzNMeWtzQWowR1VzV05IbityR2ZVb1ZOVlFvV2dDUkNP?=
 =?utf-8?B?ZlNKYlVFS1JDSWNPVlBjbWd1ZmVuUHZpd1dtQjM1SWs4SllMdFBIMnR5ZHBt?=
 =?utf-8?B?eEJLZVdoY0ZpLys2dkV0MFVlR2JMT0YwTjdVUVQzdXZuM0RweFprY0dRODV6?=
 =?utf-8?B?cjhEdjUxUWN6WDhIcGJSTFhzZFpUWjVqNTluMEZ1Y1QxSWFsQnAvSkxJOVlH?=
 =?utf-8?B?M2djS2U1SkFJSG9JenpidWVyTitvWC9QZWNWbTMvUWRtN0Mzdzl5SFhOcisy?=
 =?utf-8?B?cnFRd083aUlBR2RRTDZBVWZQZnJZdDVTOVdPQWRFYnY1TENUR3R6bjJNWjB4?=
 =?utf-8?B?UlBJZ2sxclZVOHNKK2VId2YxUWNWenRSVWRpa0xuMVRMM1o4M1IvR1hIK2Ny?=
 =?utf-8?B?akZvemlQb1V1aXhuaXpmTEZsUlR5S0lJREV4VjhGWHRlUkdCWEN2VFVCWHFO?=
 =?utf-8?B?aUJZSDMxSy93UTBoRWc5MEdpNU1GTWVoYnc0R1hON2Q5S1c5eWEva2NkN1NL?=
 =?utf-8?B?WUlhaXI1Sy95aWJCaXIvdTlnQ3RweWVwMWtWQkt0MCtYMWNoV3pGbnhEQTh0?=
 =?utf-8?B?SGxtaE80NWVTOERSbndJTG5LZk52WGtOaUw3VGVUMEtOUlBvMHZyT3dwREJ2?=
 =?utf-8?B?ei93VTA5R3lVL3ZqRGUrVDFWMUkwY1hmeXlKOGc5NXRidEowbjJIY2NpaHY5?=
 =?utf-8?B?ZkUwaEJMbURwUjBZZm4wTGlOV0dYRzAvZDcydVZ1WjJ1cEdGWUJyRXRiSzht?=
 =?utf-8?B?QVJSc1VmZzg4QzArdTA5UWdZemo2dGcxNVZvSU5McGU1ZW85NmVuc2l0TlVO?=
 =?utf-8?B?cmpDcDA4QU5JajVDMEttNE44WXlzcks1SklmTjVRc1pUN1BuQU5PTVlPN1Bq?=
 =?utf-8?B?WVNqTlpaTk1ubjhoam9IdG5mMW9XdUlyTG9ReGlYTlhvOFo1a3RHYUMvV2dt?=
 =?utf-8?B?eHV4WmVDRHM2Tjc1K1NtVWRibldyZDJoL2JDWjNGR3M5ZzU3YVF2Rk9tVEVS?=
 =?utf-8?B?bTdPeVVMc3J4Q3ozR0kxd3VqazU1MENtc3Vkb2RBN2FldWlYQ09hSk4zV0Mx?=
 =?utf-8?B?bStRVWdqYSt6bXh6QjN0eUJuQktBN2paQ0p3R3gzT3NnRFlCOS9UUWZ3ejRD?=
 =?utf-8?B?ek1CQk9GTlp6Z3BIZktZc2pCUjNVZW0vTkpkSS9mZURhR2lybUR3dDVnL1kw?=
 =?utf-8?B?Zi9iLy85S21vM1NubFpsajdlNSt1czRjSjFWV2dicGdSOC9GQ05odUsrWEln?=
 =?utf-8?B?cW1lamRpbWZFR1FURDEvSGYwN3lrVEVlU1k5UkY4TWkwQjd5Qnd2NUw0NUcx?=
 =?utf-8?B?MmlRZFlHaGd1aXlRVVBKbHhCanRZUDBJZGZLVDVNM2dWcTd6ZWdxbFNmNCtr?=
 =?utf-8?B?Z0MvQzBYNGxSekxhV1VGK01XUUhnb2NUVXdPZmJVQjdwaUw5cldyd2ZlYVJ2?=
 =?utf-8?B?Z2gyNTY2aDJwQUtKcFhhaWhyblNCZi9EZnNtR0FHUG1TZ0hzbFc0T3ZxSXVN?=
 =?utf-8?B?NGFWWGx4Wk5RYlZzWWZMVzM0THhFUG9tNVEvZHphNUF2c1JnVE5jRlo5UHBr?=
 =?utf-8?B?cHp3S0k2c2wrcS9YRFQ5QkMrU2swUXN2RjVYcWZBbDM3WW1LZzUrTXVyY1pH?=
 =?utf-8?B?cExPbDlxUDBqek9HOXp6d05QdFNsZmFRdEhwS3p2aFNMYlgreDRmR3ZLOWNv?=
 =?utf-8?B?clZSN0pJTVdrN2NwSHUrcTNOUUFXSXdnN2hIQmZ3S2NQTFhZbVU4dGRYSGNr?=
 =?utf-8?Q?Q5DkYDLh1dPr9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a236738a-2574-4b6a-15f2-08d91bacb19b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 16:31:17.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWh7Z7Kg6ks0MjeMbXzcogXsEj7/e7jpgsemOXk9BCzVy0GDucu6L7pP7hG2oPRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------F6CBFF1FC5F0B7F3DEE672AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Yeah, having the timestamp is a good idea as well.

   drm-driver: i915

I think we should rather add something like printing 
file_operations->owner->name to the common fdinfo code.

This way we would have something common for all drivers in the system. 
I'm just not sure if that also works if they are compiled into the kernel.

Regards,
Christian.

Am 20.05.21 um 18:26 schrieb Nieto, David M:
>
> [AMD Official Use Only]
>
>
> i would like to add a unit marker for the stats that we monitor in the 
> fd, as we discussed currently we are displaying the usage percentage, 
> because we wanted to to provide single query percentages, but this may 
> evolve with time.
>
> May I suggest to add two new fields
>
> drm-stat-interval: <64 bit> ns
> drm-stat-timestamp: <64 bit> ns
>
> If interval is set, engine utilization is calculated by doing <perc 
> render> = 100*<drm_engine_render>/<drm_stat_interval>
> if interval is not set, two reads are needed : <perc render> = 
> 100*<drm_engine_render1 - drm_engine_render0> / <drm-stat-timestamp1 - 
> drm-stat-timestamp0>
>
>
> Regards,
>
> David
>
>
> ------------------------------------------------------------------------
> *From:* Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> *Sent:* Thursday, May 20, 2021 8:12 AM
> *To:* Intel-gfx@lists.freedesktop.org <Intel-gfx@lists.freedesktop.org>
> *Cc:* dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; Tvrtko Ursulin 
> <tvrtko.ursulin@intel.com>; Nieto, David M <David.Nieto@amd.com>; 
> Koenig, Christian <Christian.Koenig@amd.com>; Daniel Vetter 
> <daniel@ffwll.ch>
> *Subject:* [RFC 7/7] drm/i915: Expose client engine utilisation via 
> fdinfo
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Similar to AMD commit
> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> infrastructure added in previous patches, we add basic client info
> and GPU engine utilisation for i915.
>
> Example of the output:
>
>   pos:    0
>   flags:  0100002
>   mnt_id: 21
>   drm-driver: i915
>   drm-pdev:   0000:00:02.0
>   drm-client-id:      7
>   drm-engine-render:  9288864723 ns
>   drm-engine-copy:    2035071108 ns
>   drm-engine-video:   0 ns
>   drm-engine-video-enhance:   0 ns
>
> DRM related fields are appropriately prefixed for easy parsing and
> separation from generic fdinfo fields.
>
> Idea is for some fields to become either fully or partially standardised
> in order to enable writting of generic top-like tools.
>
> Initial proposal for fully standardised common fields:
>
>  drm-driver: <str>
>  drm-pdev: <aaaa:bb.cc.d>
>
> Optional fully standardised:
>
>  drm-client-id: <uint>
>
> Optional partially standardised:
>
>  engine-<str>: <u64> ns
>  memory-<str>: <u64> KiB
>
> Once agreed the format would need to go to some README or kerneldoc in
> DRM core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: David M Nieto <David.Nieto@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 68 ++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drm_client.h |  4 ++
>  drivers/gpu/drm/i915/i915_drv.c        |  3 ++
>  3 files changed, 75 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c 
> b/drivers/gpu/drm/i915/i915_drm_client.c
> index 1e5db7753276..5e9cfba1116b 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -9,6 +9,11 @@
>
>  #include <drm/drm_print.h>
>
> +#include <uapi/drm/i915_drm.h>
> +
> +#include "gem/i915_gem_context.h"
> +#include "gt/intel_engine_user.h"
> +
>  #include "i915_drm_client.h"
>  #include "i915_drv.h"
>  #include "i915_gem.h"
> @@ -168,3 +173,66 @@ void i915_drm_clients_fini(struct 
> i915_drm_clients *clients)
>
>          xa_destroy(&clients->xarray);
>  }
> +
> +#ifdef CONFIG_PROC_FS
> +static const char * const uabi_class_names[] = {
> +       [I915_ENGINE_CLASS_RENDER] = "render",
> +       [I915_ENGINE_CLASS_COPY] = "copy",
> +       [I915_ENGINE_CLASS_VIDEO] = "video",
> +       [I915_ENGINE_CLASS_VIDEO_ENHANCE] = "video-enhance",
> +};
> +
> +static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
> +{
> +       struct i915_gem_engines_iter it;
> +       struct intel_context *ce;
> +       u64 total = 0;
> +
> +       for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
> +               if (ce->engine->uabi_class != class)
> +                       continue;
> +
> +               total += intel_context_get_total_runtime_ns(ce);
> +       }
> +
> +       return total;
> +}
> +
> +static void
> +show_client_class(struct seq_file *m,
> +                 struct i915_drm_client *client,
> +                 unsigned int class)
> +{
> +       const struct list_head *list = &client->ctx_list;
> +       u64 total = atomic64_read(&client->past_runtime[class]);
> +       struct i915_gem_context *ctx;
> +
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(ctx, list, client_link)
> +               total += busy_add(ctx, class);
> +       rcu_read_unlock();
> +
> +       return seq_printf(m, "drm-engine-%s:\t%llu ns\n",
> +                         uabi_class_names[class], total);
> +}
> +
> +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
> +{
> +       struct drm_file *file = f->private_data;
> +       struct drm_i915_file_private *file_priv = file->driver_priv;
> +       struct drm_i915_private *i915 = file_priv->dev_priv;
> +       struct i915_drm_client *client = file_priv->client;
> +       struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +       unsigned int i;
> +
> +       seq_printf(m, "drm-driver:\ti915\n");
> +       seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> +                  pci_domain_nr(pdev->bus), pdev->bus->number,
> +                  PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> +
> +       seq_printf(m, "drm-client-id:\t%u\n", client->id);
> +
> +       for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
> +               show_client_class(m, client, i);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h 
> b/drivers/gpu/drm/i915/i915_drm_client.h
> index b2b69d6985e4..9885002433a0 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -98,6 +98,10 @@ i915_drm_client_pid(const struct i915_drm_client 
> *client)
>          return __i915_drm_client_name(client)->pid;
>  }
>
> +#ifdef CONFIG_PROC_FS
> +void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
> +#endif
> +
>  void i915_drm_clients_fini(struct i915_drm_clients *clients);
>
>  #endif /* !__I915_DRM_CLIENT_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_drv.c 
> b/drivers/gpu/drm/i915/i915_drv.c
> index 33eb7b52b58b..6b63fe4b3c26 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1694,6 +1694,9 @@ static const struct file_operations 
> i915_driver_fops = {
>          .read = drm_read,
>          .compat_ioctl = i915_ioc32_compat_ioctl,
>          .llseek = noop_llseek,
> +#ifdef CONFIG_PROC_FS
> +       .show_fdinfo = i915_drm_client_fdinfo,
> +#endif
>  };
>
>  static int
> -- 
> 2.30.2
>


--------------F6CBFF1FC5F0B7F3DEE672AB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Yeah, having the timestamp is a good idea as well.<br>
    <br>
    &nbsp; drm-driver: i915<br>
    <br>
    I think we should rather add something like printing
    file_operations-&gt;owner-&gt;name to the common fdinfo code.<br>
    <br>
    This way we would have something common for all drivers in the
    system. I'm just not sure if that also works if they are compiled
    into the kernel.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 20.05.21 um 18:26 schrieb Nieto,
      David M:<br>
    </div>
    <blockquote type="cite" cite="mid:BYAPR12MB28401B22CACDC249926C0A19F42A9@BYAPR12MB2840.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          i would like to add a unit marker for the stats that we
          monitor in the fd, as we discussed currently we are displaying
          the usage percentage, because we wanted to to provide single
          query percentages, but this may evolve with time.</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          May I suggest to add two new fields</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          drm-stat-interval: &lt;64 bit&gt; ns</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          drm-stat-timestamp: &lt;64 bit&gt; ns</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          If interval is set, engine utilization is calculated by doing
          &lt;perc render&gt; =
          100*&lt;drm_engine_render&gt;/&lt;drm_stat_interval&gt;&nbsp;</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          if interval is not set, two reads are needed : &lt;perc
          render&gt; = 100*&lt;drm_engine_render1 -
          drm_engine_render0&gt; / &lt;drm-stat-timestamp1 -
          drm-stat-timestamp0&gt;</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          Regards,</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          David</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@linux.intel.com">&lt;tvrtko.ursulin@linux.intel.com&gt;</a><br>
            <b>Sent:</b> Thursday, May 20, 2021 8:12 AM<br>
            <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:Intel-gfx@lists.freedesktop.org">Intel-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:Intel-gfx@lists.freedesktop.org">&lt;Intel-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; Tvrtko Ursulin
            <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>; Nieto, David M
            <a class="moz-txt-link-rfc2396E" href="mailto:David.Nieto@amd.com">&lt;David.Nieto@amd.com&gt;</a>; Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Daniel Vetter
            <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a><br>
            <b>Subject:</b> [RFC 7/7] drm/i915: Expose client engine
            utilisation via fdinfo</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">From: Tvrtko Ursulin
                <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a><br>
                <br>
                Similar to AMD commit<br>
                874442541133 (&quot;drm/amdgpu: Add show_fdinfo()
                interface&quot;), using the<br>
                infrastructure added in previous patches, we add basic
                client info<br>
                and GPU engine utilisation for i915.<br>
                <br>
                Example of the output:<br>
                <br>
                &nbsp; pos:&nbsp;&nbsp;&nbsp; 0<br>
                &nbsp; flags:&nbsp; 0100002<br>
                &nbsp; mnt_id: 21<br>
                &nbsp; drm-driver: i915<br>
                &nbsp; drm-pdev:&nbsp;&nbsp; 0000:00:02.0<br>
                &nbsp; drm-client-id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7<br>
                &nbsp; drm-engine-render:&nbsp; 9288864723 ns<br>
                &nbsp; drm-engine-copy:&nbsp;&nbsp;&nbsp; 2035071108 ns<br>
                &nbsp; drm-engine-video:&nbsp;&nbsp; 0 ns<br>
                &nbsp; drm-engine-video-enhance:&nbsp;&nbsp; 0 ns<br>
                <br>
                DRM related fields are appropriately prefixed for easy
                parsing and<br>
                separation from generic fdinfo fields.<br>
                <br>
                Idea is for some fields to become either fully or
                partially standardised<br>
                in order to enable writting of generic top-like tools.<br>
                <br>
                Initial proposal for fully standardised common fields:<br>
                <br>
                &nbsp;drm-driver: &lt;str&gt;<br>
                &nbsp;drm-pdev: &lt;aaaa:bb.cc.d&gt;<br>
                <br>
                Optional fully standardised:<br>
                <br>
                &nbsp;drm-client-id: &lt;uint&gt;<br>
                <br>
                Optional partially standardised:<br>
                <br>
                &nbsp;engine-&lt;str&gt;: &lt;u64&gt; ns<br>
                &nbsp;memory-&lt;str&gt;: &lt;u64&gt; KiB<br>
                <br>
                Once agreed the format would need to go to some README
                or kerneldoc in<br>
                DRM core.<br>
                <br>
                Signed-off-by: Tvrtko Ursulin
                <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a><br>
                Cc: David M Nieto <a class="moz-txt-link-rfc2396E" href="mailto:David.Nieto@amd.com">&lt;David.Nieto@amd.com&gt;</a><br>
                Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
                Cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a><br>
                ---<br>
                &nbsp;drivers/gpu/drm/i915/i915_drm_client.c | 68
                ++++++++++++++++++++++++++<br>
                &nbsp;drivers/gpu/drm/i915/i915_drm_client.h |&nbsp; 4 ++<br>
                &nbsp;drivers/gpu/drm/i915/i915_drv.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++<br>
                &nbsp;3 files changed, 75 insertions(+)<br>
                <br>
                diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
                b/drivers/gpu/drm/i915/i915_drm_client.c<br>
                index 1e5db7753276..5e9cfba1116b 100644<br>
                --- a/drivers/gpu/drm/i915/i915_drm_client.c<br>
                +++ b/drivers/gpu/drm/i915/i915_drm_client.c<br>
                @@ -9,6 +9,11 @@<br>
                &nbsp;<br>
                &nbsp;#include &lt;drm/drm_print.h&gt;<br>
                &nbsp;<br>
                +#include &lt;uapi/drm/i915_drm.h&gt;<br>
                +<br>
                +#include &quot;gem/i915_gem_context.h&quot;<br>
                +#include &quot;gt/intel_engine_user.h&quot;<br>
                +<br>
                &nbsp;#include &quot;i915_drm_client.h&quot;<br>
                &nbsp;#include &quot;i915_drv.h&quot;<br>
                &nbsp;#include &quot;i915_gem.h&quot;<br>
                @@ -168,3 +173,66 @@ void i915_drm_clients_fini(struct
                i915_drm_clients *clients)<br>
                &nbsp;<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xa_destroy(&amp;clients-&gt;xarray);<br>
                &nbsp;}<br>
                +<br>
                +#ifdef CONFIG_PROC_FS<br>
                +static const char * const uabi_class_names[] = {<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_RENDER] = &quot;render&quot;,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_COPY] = &quot;copy&quot;,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_VIDEO] = &quot;video&quot;,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [I915_ENGINE_CLASS_VIDEO_ENHANCE] =
                &quot;video-enhance&quot;,<br>
                +};<br>
                +<br>
                +static u64 busy_add(struct i915_gem_context *ctx,
                unsigned int class)<br>
                +{<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct i915_gem_engines_iter it;<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct intel_context *ce;<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 total = 0;<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gem_engine(ce,
                rcu_dereference(ctx-&gt;engines), it) {<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ce-&gt;engine-&gt;uabi_class !=
                class)<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total +=
                intel_context_get_total_runtime_ns(ce);<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return total;<br>
                +}<br>
                +<br>
                +static void<br>
                +show_client_class(struct seq_file *m,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct i915_drm_client *client,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int class)<br>
                +{<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct list_head *list =
                &amp;client-&gt;ctx_list;<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 total =
                atomic64_read(&amp;client-&gt;past_runtime[class]);<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct i915_gem_context *ctx;<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rcu_read_lock();<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry_rcu(ctx, list, client_link)<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total += busy_add(ctx, class);<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rcu_read_unlock();<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return seq_printf(m, &quot;drm-engine-%s:\t%llu
                ns\n&quot;,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uabi_class_names[class],
                total);<br>
                +}<br>
                +<br>
                +void i915_drm_client_fdinfo(struct seq_file *m, struct
                file *f)<br>
                +{<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_file *file = f-&gt;private_data;<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_i915_file_private *file_priv =
                file-&gt;driver_priv;<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_i915_private *i915 =
                file_priv-&gt;dev_priv;<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct i915_drm_client *client =
                file_priv-&gt;client;<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pci_dev *pdev =
                to_pci_dev(i915-&gt;drm.dev);<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i;<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;drm-driver:\ti915\n&quot;);<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;drm-pdev:\t%04x:%02x:%02x.%d\n&quot;,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_domain_nr(pdev-&gt;bus),
                pdev-&gt;bus-&gt;number,<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCI_SLOT(pdev-&gt;devfn),
                PCI_FUNC(pdev-&gt;devfn));<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;drm-client-id:\t%u\n&quot;,
                client-&gt;id);<br>
                +<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; ARRAY_SIZE(uabi_class_names);
                i++)<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; show_client_class(m, client, i);<br>
                +}<br>
                +#endif<br>
                diff --git a/drivers/gpu/drm/i915/i915_drm_client.h
                b/drivers/gpu/drm/i915/i915_drm_client.h<br>
                index b2b69d6985e4..9885002433a0 100644<br>
                --- a/drivers/gpu/drm/i915/i915_drm_client.h<br>
                +++ b/drivers/gpu/drm/i915/i915_drm_client.h<br>
                @@ -98,6 +98,10 @@ i915_drm_client_pid(const struct
                i915_drm_client *client)<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __i915_drm_client_name(client)-&gt;pid;<br>
                &nbsp;}<br>
                &nbsp;<br>
                +#ifdef CONFIG_PROC_FS<br>
                +void i915_drm_client_fdinfo(struct seq_file *m, struct
                file *f);<br>
                +#endif<br>
                +<br>
                &nbsp;void i915_drm_clients_fini(struct i915_drm_clients
                *clients);<br>
                &nbsp;<br>
                &nbsp;#endif /* !__I915_DRM_CLIENT_H__ */<br>
                diff --git a/drivers/gpu/drm/i915/i915_drv.c
                b/drivers/gpu/drm/i915/i915_drv.c<br>
                index 33eb7b52b58b..6b63fe4b3c26 100644<br>
                --- a/drivers/gpu/drm/i915/i915_drv.c<br>
                +++ b/drivers/gpu/drm/i915/i915_drv.c<br>
                @@ -1694,6 +1694,9 @@ static const struct
                file_operations i915_driver_fops = {<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .read = drm_read,<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .compat_ioctl = i915_ioc32_compat_ioctl,<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .llseek = noop_llseek,<br>
                +#ifdef CONFIG_PROC_FS<br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .show_fdinfo = i915_drm_client_fdinfo,<br>
                +#endif<br>
                &nbsp;};<br>
                &nbsp;<br>
                &nbsp;static int<br>
                -- <br>
                2.30.2<br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F6CBFF1FC5F0B7F3DEE672AB--
