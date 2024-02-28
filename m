Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8486B170
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B1510E5E5;
	Wed, 28 Feb 2024 14:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMiNHSdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E94210E33D;
 Wed, 28 Feb 2024 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709129707; x=1740665707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EOAUVrAioHOHFpNI7q+MFHgVVkkbHaQmElyNQNMZt0M=;
 b=RMiNHSdUWEqGyfnGXTShGra2xyynsU5UHdC05/IxAjhdkQ10tWN00gTt
 hJhQV5pZCc7OCVep3jzTv7ioTkh87EAH1MJEI9c7agyFX5NE4MvI0Lpau
 Dyyg/2JkpUg0eqywjIHTRhwD7dDzay+4rUoOyL/2essUGHL3I2pH1ZCTv
 JrWft+sSL63I3Ybr2g8wQiBZ4cxGQPjYqejuQvmUICC7A88nQMkAsYYtz
 MEH0KyR4AU/2GnUB7dNNjEW8sOV1TS9hcH9h4APPWpj/Zw4F2/FArKA3d
 WQdpApuOLRoyMKWAJDthUM2TyX32VAaSFoWjEX2PgXyKYyDZT3tI73p9A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3403750"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3403750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="30631553"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 06:15:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 06:15:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 06:15:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 06:15:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 06:15:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRVhHfuGiRjNOfqqSmFF88G18tBFeT3RqSXlDZKt4Oz46RC1ot1UQpUTpr62lfkB06VuFJ2zI4VtG9vIaJfPtRXzkuXRxWcStnv+3zEibM+4SNNn39oI8KbSzQ7iLZQ2Ktjy9+KBdPfNjOL0ayv/1H+qj9JhcmXQwpUlDnK3gv9GYlO+xUOp8pAT47qN7R7Uqw+Jhb4B8YMYY2FZUoUjZqjXaXX9OkNK9qKM2iI4nXoaC8MslTZ6NZPnBbQYfG3ql3+m0pAgF9pHFzRbuqsb0zOVGzojDsISTCuNsnC4/qc/qWh17jWlkFLgeU5JIvP24VpZh6i95XuUf+mlxnXL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZNfmNcbu7oH0R4Pj1A7vtES3f0E+BZYkgBosI7glys=;
 b=EoJN1AGpuLPr02mf+mcpJ9ZWR2XOepO9v2OVVMMnwfWr56+xLm+zJJVNrjLKruq/ltRpo3COYPj93jeSTdXgUPh/rDHRQ+tm+JF2rubXXX2q7fmV+IESfX2NxGOAbGvP5+lOg4IDn6oeE/6M2heYOey8+jeXCZm174czdDDQspphIdnPXfWj+6VOoRdVf6E+GaY3fjXqFk30bzQI1j8/eafT6rhlOuMTkCn4z461dNfNfDmcEsyaWqQujxo4ODWUvAoI751XOuPm8DQT8siaDXWId1FsjEMGjohklu3iQ2m2xm2y8EkBTQvGth8UhE5GDXVmr2yp6dOeHmB4G5HYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.12; Wed, 28 Feb 2024 14:15:03 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 14:15:03 +0000
Message-ID: <b943f531-272e-40b8-8f5f-1f21d2f7aae5@intel.com>
Date: Wed, 28 Feb 2024 15:14:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: check before removing mm notifier
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, <intel-gfx@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, Andi Shyti
 <andi.shyti@linux.intel.com>, Shawn Lee <shawn.c.lee@intel.com>
References: <20240219125047.28906-1-nirmoy.das@intel.com>
 <3c1a25f9-b1ee-4832-a89c-68813cc72416@linux.intel.com>
 <96eec421-090a-4420-ab94-098414334e29@linux.intel.com>
 <5f37d10a-d27f-4365-9411-7d5692633df6@linux.intel.com>
 <ab30e804-fb48-4283-b427-36278b406fb8@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ab30e804-fb48-4283-b427-36278b406fb8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: 120104ee-ab58-496d-780e-08dc3867a7db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipfXRl3XDsqI0EgPsR4eiAnYvsYIiYuEpJpW/wSnboA2NDFSFf8LToKOYgyf2S8vSh0AeGt9Xcgy4xZmo03cYwh39t3e8aqBWI8LiYtqKwGJjsk2z0CYg0YZvB5nHUQTcjBaqmGRAx4AkZHFRrKBL3a959IAdrn31crszsDghI37xcd4FCmN8AWSNvSqgkWztPjjpRp5346ry0SAU5N1xIIzzEGIjJfMSYeAwdYbzKRNYCpiSNVnadjxJBDx3S/ubgopEblaK1uxBzlfSpDVUwyFA4u4UtS5Jmek0DjXHYSdpzz4lTTvnhpwlbNg1lJeqiI9pzBA2+CM86QQJNTBT7fUZ0nssk1tmYb38fdDRpV/gfGI9nn88qx6H+TBZ5wneiem5T1EQ2CDg8SEaZ/CRhrGpe5DesoQtke8OpCS1FEv6qfr3E5vFDDIaKaRfWgDgKKi5ZYJ02ltvTnp/tHmTdC9kT5r3VadweojlC26KylvP7PKZaNzxXcdkwLrkvK5SFjfG5RmFkMDbGMCzkY5ezfasEJC/sofVyk1E/lTHRnr4AMdDaxMS7ThT5yZqSdrDj79PuRd1NRQVAnC4v3URWFgMHqoIeY7nz/tySx1Ri0JFKuFTFOLJ+A1XnFSORVOulGKimxGifW2vptuLtDu4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk91Q0VPZGVTZHcwSU5LTE01c0R3WGFnaHlEb2crKzdQQTlHdStCMXhxNFpP?=
 =?utf-8?B?RURxQ0tSTDZtU1dqcUdwS2NsSldiQWdWWmM3b3Vabzc3c3A0akQ0UzJ0UHRI?=
 =?utf-8?B?alFhS0RHV2RTOGY0Z2xQckpBUXR0OHd6SGxTVGJSd0ZDU2M3Njd3aFRsUHhn?=
 =?utf-8?B?R0ZGUTRUR2FnWStUSERKd2JvNHVzMGY2amRYVU9QcnhubzB0QjA5UW9ZRExp?=
 =?utf-8?B?TGhla3NtbG5LMmljMW10c0piYnFOSkJyWHgwSVIwb1h5KzIwTUtJa2tjVk5H?=
 =?utf-8?B?ZFgwSzk2Y2RtU29vZSs5cmZrY1AwamhSRkVrYVJibjZHcGtvWGx5b0xybHg0?=
 =?utf-8?B?TlFveUdFRHF5Zjc2WEFHWDJyRTAvYkVJbURGbXRLYlRabDB6bVMrV3VJekdL?=
 =?utf-8?B?L2RRK1IxUUIvNmFQalc3a2FrUVhIcXl1dFFpTzB3OFozeTB5UnlWdFR0Y3Bw?=
 =?utf-8?B?TzdJTjFKeW5CelVBT3AxTDR0YjRkbHlMQUhsLzJpUUF5OVl4SjZWSDQ2Q2o5?=
 =?utf-8?B?Ynpvc2xzSTZWV0p3MDl6Mkx2YTZNdlljaVdZT21DUG1yS3Y2TXY4Z1BpTTB5?=
 =?utf-8?B?K2orUXhDWVZMemVtdVpJUDE1OVpQMGJ2SVE2N2NOY1FjT1VyM2ZLeUFWTk5x?=
 =?utf-8?B?amhiTVZpZFFvSmEvNjgzVXR4YTNEb3JCcnJFOVlRLyttWUNudzYrRytwdlZL?=
 =?utf-8?B?YlFNN3prMmJ4NnRoZ1BVcTR3K1REeU9vWWdEY1VUMEkyQ2JOZlFudytJdTEv?=
 =?utf-8?B?RVZpbkxJQjRyeVJROU5sRjRWblJXMWdPbFhTU1AxN05oOEpMRGhWa2MrZXVJ?=
 =?utf-8?B?N2crVEhucFRBUFF2dUNWQ1ErKzI2N1JpTXRLYUw5VHUyUzkzUW5XNkFyNk9j?=
 =?utf-8?B?SGxjOFlzVkwraHRIWjJWT2dnWW9teFoxSXM1akE2aHRMVkRTTzA0Nk1LR0JT?=
 =?utf-8?B?Sy9uUDQvQVA4bGNvWFAvdGJybVc5aGtUeTVYZnB3Qm04amVRUWdSSkVDaERB?=
 =?utf-8?B?R3ljL3ViNi8xdFVnU2l0c09ISmRoRVdlMHlGaWZwZXUzdldrSVRBVFNRRDNP?=
 =?utf-8?B?Ukw2VDh3L0FnbjlFMFZQcHVEOEhHTXpFRGJraWJGUVZ2Y2E5UXBBUkc0Wmg4?=
 =?utf-8?B?OFJvY0R3UEVGd2Y0cU9WT0ZQMkt2NHhQU2dxeXZ5ZGhPOTBCS1JxeXJra0k2?=
 =?utf-8?B?bWp6VzhuaUNKQnRNMDNJalJiVGZRb2xFN1h1TUVvOGJJaEJCSVYwT1IvY3hM?=
 =?utf-8?B?SHgxUHExUFRjblhtVDhFWU9DWDdRTXRMQ3lkVUE5a243NUg4eHhEcDRiS2hs?=
 =?utf-8?B?U29oVnFHTUpaak85VkhvZ1F6ekVrQ3RZVDVHQ2pHcUNlTXhxOGZ3dm1SSE9E?=
 =?utf-8?B?ZXkwWnhlSCs5Y1NUK0xzMlROS3U4Z3YwRU9weEg4dFN6QkQwRmJtM0dCaHo2?=
 =?utf-8?B?Z1JmOWRJaEZXcmVpRnVMaWRkUmwyaWlFT3hwdnIwYkorMWNOQmlTRjVqUURn?=
 =?utf-8?B?dHRJTTBUUFB6NWdEOUdwZVlzam9YOFVkcmxyemZXeWhPMlNQVG5TSlZwejRV?=
 =?utf-8?B?TmwwNElYaW1BVGVRNlNzNUpHeXMyWDl2QzVLRjY5ejZJNVFkWldpYWtheEQv?=
 =?utf-8?B?V2xSdjYxeUpjTnpMV2E2THhUYkUvUVVEM2cvNEFpbWE2ZkJFTmNxMUN0OUZO?=
 =?utf-8?B?YktocFhJSmdBUVlUUHBKaU9DUE5RSDFIVDduRnpiRGZ2Ly93a3VPMkEyZUgr?=
 =?utf-8?B?Y2QxaWpPbW50RlF5S2RVcENaMTV4SHI5S1IxTDVGczBDencyYkdtSnh6WnNw?=
 =?utf-8?B?S1ZUNHMvWDN2bUtsRVJkY2lScUIrVVRmYlVuNGtHYW4zUWVEWFR6ZXdraGhU?=
 =?utf-8?B?cC9FSGdPWklPMndWOTltTHNlWTdESk5tNTg1M2Z6QUVNY1pzL0QzWnRiYTR0?=
 =?utf-8?B?NW9nd1NmUjRUMFZSOHB3RE5pU0N4NTRwb0w1SWd5ZzdTZ0Q3eGxRTTVDNFlT?=
 =?utf-8?B?M2tlS1ZTQVFUOWYwanFjT3hLNmhlblhTM0NscSs0UnBYLzcvcGRDbWVzQVBW?=
 =?utf-8?B?NC9uVmtjNnZtOVdmRHFrckZIVEI2ZVRMb3lrb3lEUmQ1eVhRZVdXeUxzNE8y?=
 =?utf-8?Q?16HFjNt/MoZN9n9uyd/vi/omh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 120104ee-ab58-496d-780e-08dc3867a7db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 14:15:03.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9M/DNya05po3UqxVuCHTX7KT5Ccjd12l6qn4/8znmYzFVxzdcj0X38eN9SxCipgJoUy0S2xQ30GIrkHkaMq0Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
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


On 2/28/2024 2:24 PM, Tvrtko Ursulin wrote:
>
> On 27/02/2024 09:26, Nirmoy Das wrote:
>> Hi Tvrtko,
>>
>> On 2/27/2024 10:04 AM, Tvrtko Ursulin wrote:
>>>
>>> On 21/02/2024 11:52, Nirmoy Das wrote:
>>>> Merged it to drm-intel-gt-next with s/check/Check
>>>
>>> Shouldn't this have had:
>>>
>>> Fixes: ed29c2691188 ("drm/i915: Fix userptr so we do not have to 
>>> worry about obj->mm.lock, v7.")
>>> Cc: <stable@vger.kernel.org> # v5.13+
>>>
>>> ?
>>>
>> Yes. Sorry, I missed that. Can we still the tag ?
>
> I've added them and force pushed the branch since commit was still at 
> the top.

Thanks a lot, Tvrtko!


>
> FYI + Jani, Joonas and Rodrigo
>
> Regards,
>
> Tvrtko
>
>>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> On 2/19/2024 1:50 PM, Nirmoy Das wrote:
>>>>> Error in mmu_interval_notifier_insert() can leave a NULL
>>>>> notifier.mm pointer. Catch that and return early.
>>>>>
>>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> Cc: Shawn Lee <shawn.c.lee@intel.com>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>>>> index 0e21ce9d3e5a..61abfb505766 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>>>> @@ -349,6 +349,9 @@ i915_gem_userptr_release(struct 
>>>>> drm_i915_gem_object *obj)
>>>>>   {
>>>>>       GEM_WARN_ON(obj->userptr.page_ref);
>>>>> +    if (!obj->userptr.notifier.mm)
>>>>> +        return;
>>>>> +
>>>>> mmu_interval_notifier_remove(&obj->userptr.notifier);
>>>>>       obj->userptr.notifier.mm = NULL;
>>>>>   }
