Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD807930BC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 23:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6545010E19D;
	Tue,  5 Sep 2023 21:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B010E19D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 21:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693948156; x=1725484156;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3sMuLTXtZIWQtRwRA/kxDEMDSlElb3rYtQ+980IBJi4=;
 b=GkXpZOct0m7NlYqm6/V3sxnbJMqGSrwia+lURiEpzfTkalRk9ZfL+mql
 ecQcMZhkGrFoQmcj2bbzaIcMU6hHM1U/wObHqe1fHo0FsbcIp7nmoSSkT
 k5J3Wvq1KjUOfIO/E72vnurWnI99AysmHmdRF+sFDHeC6AdOQS5z1kFuF
 nEJ+s+zJgBtWvtPZlJG2Gly2fJ38DmlUnuhRG6Tn8rB+vIbu8/J0E0o2n
 chwjFQ43jE49/oXNxP6r1FeIanuqV4C8menWaPAVVLFdNZtTzb2k+v6r0
 5nOO8x1mUNoFpbdFBFEu+/RYB42swIOJCH6vQLV13f0NEC2iHzzHJuG3w A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407901202"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="407901202"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 14:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="734801601"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="734801601"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 14:08:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 14:08:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 14:08:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 14:08:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 14:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYIQ0u/yhXkyvzNhKV1IW6t5M3EdLnLcvQ291+dXHL1Jt2Vv6qkAvgUXwzSpDWFsfhpCvEJin+wPXQE3Q3FQ7OPM2pm46Fkighxh15jdo2qgJ6IMCsfzn+kxlrEK6fzxOnTzmLCY6AgC9K9e0rhXZ+Owy4FcuyMTdwB4VHfoRXI3riJjAm78B5lEDXEcHCH5QdawwVYaseDTvECHd4Z7q2foIsjHWrrPOiAM/QSkSeCNDKIzUe9MEGObRZ5mRwzRVA0mTyOC5pJohKskcgNbgnR3tb8lt1nItyHaI26X4JjUIFZUqCEG+KVP3RDjxajdC0s1BLYmyEPSOVEzkq275Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sMuLTXtZIWQtRwRA/kxDEMDSlElb3rYtQ+980IBJi4=;
 b=jAefFowr04iJOeGT+xyhipDfp6fTxUyF61BOz+A2DX+oJenGU4BTwN7AVj/11RjBSm9yKsUd+I07rGIpo8YFGCOhmajqJ+FBNOwpFNBUY5jz3dNUt7u54ZSiZOsfPwvfS1dvsDqRxTD6HgOzbSENokMZyO0WVjZcPk1wIx7C0JjakYXpcd72/EphVEa5VuNoNQjbmcLe/r06hXAOo2IzH7kb0DqsSNCdTIyU9ItwyFu19WEh87/fTvGZPqtnkt7xjdBYnb0CdDE26akH31EGYRoyeSuHSPBzFZ2U7ufdELe0F9TwZzFoOLlrc9TvRxVooKK2WX/l6pXmWg+6AFwHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 21:08:48 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::e12e:7690:e251:1aa5%3]) with mapi id 15.20.6745.021; Tue, 5 Sep 2023
 21:08:48 +0000
Message-ID: <d86d43a4-3bb4-e0fe-a944-94cd30a18800@intel.com>
Date: Tue, 5 Sep 2023 14:08:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-4-dongwon.kim@intel.com>
 <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
 <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
 <535626da-0958-7c42-7bc1-6f7c0f805634@collabora.com>
 <a07fc333-3481-6ab3-f22c-f64054b49beb@intel.com>
 <2d93796d-c9b6-51ed-2a93-fa1e64f9e2ea@collabora.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <2d93796d-c9b6-51ed-2a93-fa1e64f9e2ea@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: e715ac35-e3d0-46f5-138f-08dbae544c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E0+qcVx0oakNGmzYQq35bJHyCePy6a9dCcOc6qTCeB711pfBTfNz8fghD3AKnYzUisIyoR4zR1DBICMvWNLbsRua5DUnxXyqFu4HlQpUz8OCyaUHpd4P4poRIBCBRHxpehB/h5y63DIM7VNihOpILikpZ/efEtfBq5A04/Cr6lEQFQZxbroKzbV81jFAI1fw5ISxesmM0LR6godmYKLOBJPa/o0MPQ51WR/yXzt6T6Km3YV7ibr24Fci8JVa0QlqPlcMpua0WTsPB1vdUCuy6AOaUsUXxLxqTxa74xXAu9cLqYhMTCsODQRE1+GTWPnSoYlPyG0AImUKmIn5J2KZkTjGzRu2dI3MEhU5P7VC0cmK6Mgom1cGV79ITM9AOQ32xFBC2k5m3rlv789XuJDyWAu8hRWOOHfGgLDQ+l6/xSdQtvu1vdZNhH5DI07SkP6ipsBRg9hsHAqi0+jQI4kB32ShqfcI+FvGTPUxHqxSMDYDHt28ex3qcX84eoFGeP3SmePtaow6cm8k4a8iaeMX+rtoMX2M8YhKQPUnImz4HhXLBeT7ub+PSbhhLlVF9qRqKQoTJ+Evu/haAV2oLKZncJH89tv2L3kQuQSjxLxfZWAotWouU9gdqIuHcM8ysd0AQVfnCo0yNpcxTNhSdO4KkGJeYRSAcoGkt3VvU2Ji4dM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(84040400005)(1800799009)(186009)(451199024)(2906002)(82960400001)(38100700002)(36756003)(86362001)(31696002)(316002)(6512007)(41300700001)(6486002)(6506007)(53546011)(66476007)(66556008)(66946007)(4326008)(8676002)(2616005)(8936002)(966005)(31686004)(83380400001)(5660300002)(26005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak9MVS9LTzNwTm5nQjNqZXVuZXUrMXNhMGV0VTNXSUxHM1NkeE5SNUlxc0lx?=
 =?utf-8?B?VDFQZlgvRG5sVmVRKzZVK2VsaDRuQ21zUlVVK3VRK3lHN2ltVlRIZkExc3hR?=
 =?utf-8?B?MHYyVVFiamxJTDlqeUY0MmRDMGQxZmF5Z09kRWVLMHluNFJlenQ3eGVqSmYv?=
 =?utf-8?B?SU9RYXNmMHBWdlhSRUp1MmMrUGZuK2R3YzBQYVlHM1JtOUdKZVQ3YUZHZ3lI?=
 =?utf-8?B?ZEQyM0ViYWxXb082UXg4bDJtS09VZ2ZNQnk5a2RGNHF5d3UzdGRQYzZscDli?=
 =?utf-8?B?Y2IwR0FsZWt3dVZ5amFCS0RVWW1HZ2MzblJudVVvSGhlUDZ2cytUOFRBWWhM?=
 =?utf-8?B?cTBUYmh3QXFZQXZyUUhJMk9nekZUL1A4OUkxbWIvNUYzZS80RGtjNE5OcXRZ?=
 =?utf-8?B?RTg2ZllBa2Z3Y0ZOd08vTWdaeDVlSjhVNnpaSjNVWHpRYVRTSm9JUThQZDIx?=
 =?utf-8?B?djlCTmFSSjBUbDI1Wm10R2FXVWxOKzJGcnlDbUU0ZnQ3emlLbU9ReDllSVoy?=
 =?utf-8?B?elVnRHFCRno2ajlzWm40SjdOUXdlTW9ScXNIUUhYMWl6UGVVTXFyQVJQb3RS?=
 =?utf-8?B?eVVHdWhTemswVm9mY21jR2RrbzVPUjl1R1BqbDM5WUloYmh4aVNkNTN2NzZk?=
 =?utf-8?B?dDYxaDdUMzZNeURQajhSekM2a3NGMk14T2I1RkdYVldvWHQrOFdzOXlIeXpp?=
 =?utf-8?B?Wk5sR2N2WnhxTkdCM2c1VCszRjRFSjAxdk1jSXI4WlMycWorRmUwb3l5ZXVo?=
 =?utf-8?B?NytrVkxzYVRSR0d6RVNWeG16eGIrMkFxSDVTQ2tNd0M1UEIrTkVseGUySFVS?=
 =?utf-8?B?em9aVVUzSDBnWnZ0YlF5SkpVNkRUWk5IOEdkMktNeHVUZmhOSFJnTHhJRFZq?=
 =?utf-8?B?bXJGRTR6cTBZciszMFIxMnZmT3FldElFRk9kREtJVXRSMU13VUV6OHJCRTBV?=
 =?utf-8?B?QlhKNzVLTmdQbm0xMVlPRHd3MEhlajl6NHVqY1REK3hmT2hOcUozQXB6UTZ3?=
 =?utf-8?B?aXZuak55eU5EcVIvVHFzblpLZ3Fka3R0Q2s0ZHJOOTNJdVl1YVNFOHVtT0lU?=
 =?utf-8?B?bXovYnlES1dmd3Nsc2N6U2NJSC9iL3NsODVyWktMM2pkcG5BYXl1a0FoWlNE?=
 =?utf-8?B?TFZIRml6UC83SXFrZ1JDOGpjclBpMm1wM3RlZzRnNnZpTm9WalRPTjQ5MytI?=
 =?utf-8?B?MXJpekNyU1ZuSE5SNXhsZUlOMExpY1c1VkxJKytBT1FGaDg2UDRvSWZwWVkw?=
 =?utf-8?B?YWIvTnJlazlmUTZ2ZFFQUEc2dlA0UzA2YkRzUnJqT0tCNnFDRDlROWhVR01p?=
 =?utf-8?B?UnhGdGFaS1YxcEdoRnNzR0ZuYUdFMG9yWWo3NE00R3NsZ1lGTzNZTkRjd2tV?=
 =?utf-8?B?V0M1T3drTHg4Wm1ZSjBXR2VNQlNoV3BRZlNJcVBlTlh2bXRxNVBxK2VqTlNa?=
 =?utf-8?B?eldRNkZvRDBNWExTZFkxU1EydzJ1TDNyY3NkTlZncFJWaE9XeC9FMWs3WEJx?=
 =?utf-8?B?Y0hld3grUzZzRjAwMENUczk4ZmhYNkMwaDI4a2JlTTlCeUgrY21MTVpKTjNz?=
 =?utf-8?B?R3JGN3FUb3NGbGdiOXhnc0xENCtqVXkwUHQ4MW9OMGxOTGZCRmtrYWo5dEh3?=
 =?utf-8?B?bGxXTGlvL3hCQlhYS2ZudGE3OWhmUXlDY2NMWE0vT294Y1pLdTVQZUJESUhm?=
 =?utf-8?B?dWhuTnNuSDRzbnAzUVZaS2t0bkE0ZTFDd1VONHdxSnNML2pPRTBBN3hwckhk?=
 =?utf-8?B?VGVjMkJPdnBST0FoRmc3bGhJZWwzdC9VbWlqNTJaZ2xZb1pyQWJBVnJuVzRI?=
 =?utf-8?B?S2ZldGlmRjYzQVpGOW5MNUZGN2FMbmFWblJHWURUTXdPNVAwUmZXYWdGdk9y?=
 =?utf-8?B?UitPazBYYlNsUWlqczhxSUdwSlFKUmV2dElLeFJjWEdVTWNhcmM1ZmtaR0d1?=
 =?utf-8?B?NXZVc0pjRHJERVNuQ3N0czRvTUV6L0dKMXQ1TFBIdjVCR043cmRPNzRnd1lE?=
 =?utf-8?B?RVZ6cGV2L2Q1bFFLbGpxYUJFTEdLOUpoNTdNNkpnTENFejlCTTRlaXM5U0hq?=
 =?utf-8?B?VkFBR29oM0ROWlpMcW02SFY3T05aUFhwSkRlU2ZKZUpjUzVLUi9sUFBLc1Nw?=
 =?utf-8?Q?ix5BlnnuFo+ohPRuNDCUod8CA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e715ac35-e3d0-46f5-138f-08dbae544c55
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 21:08:48.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IzHSan9AeVfp5MQLtsLx4QxgI1vgjPZ+PZnCXTuRcmcvzc7BP8m2StbRn4Qa7mmKRQFUlckb1kffTDU6yQiAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 8/31/2023 3:51 PM, Dmitry Osipenko wrote:
> On 8/24/23 20:58, Kim, Dongwon wrote:
> ...
>>> You can do fence-wait in the guest userspace/Mesa after blitting/drawing
>>> to the udmabuf.
>> There is already synchronization between QEMU and virtio-gpu driver on
>> the guest. Upon resource flush, virtio-gpu waits for the response for
>> the message from the QEMU and QEMU sends out the response once rendering
>> is done. The problem we are seeing is not that the rendering part is
>> reusing the buffer before it's displayed by the QEMU. Problem we are
>> facing is more like some frame is often not finished when
>> "resource-flush" is issued. So unless there is a way for QEMU to wait
>> for this fence (guest drm), I think we should have some synchronization
>> point in the guest side.
>>
>> I saw other DRM drivers, omap, tegra, vc4 and so on are doing the
>> similar so I guess this is a generic solution for such cases. But I do
>> understand your concern as the primary use case of virtio-gpu driver is
>> for virgl. So this extra wait would cost some performance drop. But I
>> have a couple of points here as well.
>>
>> 1. Wouldn't this extra wait caused by drm_gem_plane_helper_prepare_fb be
>> minimal as the actual
>> rendering is done in the host?
>>
>> 2. Can we just make this helper called only if virgl is not used as 3D
>> driver?
> The problem you described above shouldn't be resolved by your patch. You
> need to wait for FB to be released by the host's display and not to
> before GPU finished rendering on guest. I.e. you're swapping display
> buffers and your dGPU starts rendering to the buffer that is in active
> use by host's display, correct?

I don't believe the guest will start rendering on the same FB while host is
consuming it because the virtio-gpu driver on the guest won't release the FB for the next
frame before it gets the virtio resp for the resource flush command and the host (QEMU)
will hold the response until the rendering is finished.

And having this helper clearly fixes the issue we encountered (some old frame is
sometimes shown..). But you might be right. The way I understood the original problem
might not be 100% correct as it's based on my assumption on how things were fixed
with addition of the helper. Then can you help me to approach to the real problem?
If it's really fixed by the helper, then what would the original issue be?

>
> Maybe you need to do glFinish() on host after swapping buffers? But that
> will block host for a long time.

I can try glFinish everytime after it draws a frame on the host. But..
If that is the issue, then wouldn't I expect some skipped frames, not old frames?

> For now I don't have solution.
>
>>> Virglrender today supports native contexts. The method you're using for
>>> GPU priming was proven to be slow in comparison to multi-gpu native
>>> contexts. There is ongoing work for supporting fence passing from guest
>>> to host [1] that allows to do fence-syncing on host. You'll find links
>>> to the WIP virtio-intel native context in [1] as well. You won't find
>>> GPU priming support using native context in [1], patches hasn't been
>>> published yet.
>>>
>>> [1]
>>> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138
>>>
>>> Note that in general it's not acceptable to upstream patches that serve
>>> downstream only. Yours display sync issue is irrelevant to the upstream
>>> stack unless you're going to upstream all the VMM and guest userspace
>>> patches, and in such case you should always publish all the patches and
>>> provide links.
>>>
>>> So, you need to check the performance impact and publish all the patches
>>> to the relevant upstream projects.
>> QEMU has all patches regarding this (blob scanout support) but guest Mesa
>> patch for KMSRO is still outstanding.
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592
>>
>> I understand this specific patch would need more
>> discussion/justification but
>> what about other two, are you generally ok with those in the same series?
> The first patch should be dropped. The second one could be useful,

Yes, the first one will be gone. I will upload a revised version of the second one
only with proper explanation.

> you'll need to provide step-by-step instruction for how to reproduce the
> multi-display issue, please write it in the cover-letter for the next
> patch version.

Thanks. Always appreciate your feedback!!

