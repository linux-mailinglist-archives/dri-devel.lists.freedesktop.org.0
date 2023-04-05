Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DC6D7EEB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A37310E987;
	Wed,  5 Apr 2023 14:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BEC10E989
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCYn8g0b2AbMx/0C9yU/Ph43xr3JKznmlVtn7Nz+ZNKe4bTjcLLDnFsZsx5D/QClPhDytVFzb7lIxAr/PPrWb7iIMWJSQ3y2C4X4cfJX8rD/IgaHNfnown+hkG4ngWd+irEO+SWftr2DWLcjAlCk0Lzv26rGvgz0+f8AntmTLudDtgbRvebxh+a7IEzcM6WRQWMWWm3U61PO8iaTt72jDX4k7x4FC8MfnosSzDoDj35ZplR+D/JuUaMjiFBEVksSI4BUu+jaLnEO2FDzRFkbH4vc0gyQ6t2ftorlCtwZIb84Ryo3yuDfcBpVp6sw6ukrbRsMfnzRuCA8cYh6brcV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INSvVes12oim6c/N1vy4SGbvRUSVDv11ZE30GMkAWOU=;
 b=JYw58WLAPVuBnZTFBd90ca6YTC57rjZnFljAWsuG9npYKc1n4MmWVSm9nj8OWD7KrPdNWaJ1v7XR+6aHGpztamJCAELYz0uBzrdgvk73g5BpgeF9wQMQtcbY8ZkWRqod2PAn2cdFHlhwp+fOpg4mvW5ZNN/vftvJhhNeHIN5uqxoKTsslz8JDDdED5RbSY7DNCRha6Pbv7gIFr8hki2N+qb4Rj08BxwXV0z8Tc0IU7zeIw+kTYHBrrUuKIQVvv5ZhePq1NvjjLECy5QZ3VlpVNQ/bt6BhuEHe7yCtsB0gFPvqb83lPGI+QnY+43xJsLDSgUzKokMw0Q/VAtZk2vXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INSvVes12oim6c/N1vy4SGbvRUSVDv11ZE30GMkAWOU=;
 b=Nk7Ueb4/JPB4x07LgQOR1uo6L/oD9SzncQel9iYVAshSVdFh9bda1l926rUI9gh3glreBscpL4F0iekrrgyAfz4dNmZXyEbTiA39fBD+P3Y9XSx3JIbc8PVKomGV9ARXNqu9Z1hk/ZqOlxNgAEedHY8GVTwrIkb/aHfP8F9d7Wg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 14:14:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 14:14:19 +0000
Message-ID: <20502c4c-c987-3117-119a-2fd38ae5f607@amd.com>
Date: Wed, 5 Apr 2023 16:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Mary <mary@mary.zone>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <ZC16Q8MhHEcutX1b@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZC16Q8MhHEcutX1b@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 8893a67c-cc2a-48ae-24ee-08db35e00bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XhIcQy0YBAxRM6hrAWIZTRgtPXS/EbsbxjQM5yetl2NuyS629JB1WnEOwstmkZc1QI+06zwWQiCyWzgLc3ZpVwFFYHctD8vc2sSGXAxTKO+6ZQhaRIT10YJ9MGH49Hh1aGrKPaJkysggvNZ5fZflZwRfCHq0C37XJ6ltRGUDgotRo9wMTRb1O2nOEw0DcRxHllX8jVeLilDVdl3cSkkRK8JA9oc0fbmMHlWy+VTEqTduW9UbF7y19cJWg6PBo1cmcChV40M4LfT33pztpBZ3/1irn6WXM8jXbVks40926UyAtRd3dkbwvL+GZg9Y3eGgnRM60KnCygy8Q5SUvxCzefTESD/1s8Zea3k/9/zk/Vhjwb/37tazK0IYUnA7qFpjKyTKT5zCrLKt0P7xIsVwehTBY7fBCdBeVjfFGfOen8oqK0cLQYTXbQ5kD5XYV7CZejKfY6CpbbwTHpW0xUv6HMAoGJ9gsiMQv/9ZHMrpii6QStYqsHei7tTTGiIVy9GEJ32LixCXiM7pvRRRfW6JunGvsu7XD+HBcZG5drCLLLTd3i0Q0mp7d2KUwBEkZC+tweFNPfAOL7f8le48HwlBMMpmhRp+n4VoHogBzoo25RTDZ8SlvH4T9/T/47EYRkCq9Kh5nuyGw13wc/A+ubd6ygp/BUMV5Vjv+asO0qQ9I7KF1M0Bdja5W9WZX81mBdJP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199021)(31686004)(2906002)(86362001)(5660300002)(38100700002)(66946007)(7416002)(478600001)(66476007)(66556008)(8936002)(110136005)(41300700001)(186003)(316002)(36756003)(8676002)(31696002)(6512007)(6506007)(83380400001)(921005)(966005)(6486002)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnh5c0RVM3dBQVZVSi84aEh5ZlZYNHhSNmIyMUh0SVpyaCtiN3ZCMzNrOG90?=
 =?utf-8?B?Q0ZiWnEwU3VORlZQaGVoL2hya1dkMzZWTmRPSzZuNUxwU2M5MHhvRXU5YkYr?=
 =?utf-8?B?R29sdzFuNmMwUkh5ZXRzcXBsd05BTDJwQ1JqSGR5MCtMYnkzRUdnM0NaM01s?=
 =?utf-8?B?NHV0aytza1VUeUFncUNyRll1YnpFMm5SSTQ1WmpaUW5pWnhCNDFEWFFIMVFz?=
 =?utf-8?B?dTdXdHRtUnp2Z2J1REFoVllRNjQzZENKekpwM2x5M3hhQlA1d3pMdmcyOENM?=
 =?utf-8?B?dTQ4M0I0MHk4U3lwMVAzWlJZQ3RMdXgvdGd5NE43dEVzQ1I2UGpSRElvNDkv?=
 =?utf-8?B?ZUpQWEk0TXBiYlZPWlBSTFR2STZiRzZ6MFA2VlJtSUZyVXpFbFVPM0NGT3hn?=
 =?utf-8?B?LzBISXRJd25CUG5GWTFab3JGR0hKdFY3bDJSV29NUjlmMEcxOXpSWEYzdnlP?=
 =?utf-8?B?bGpsbXljYjJTQkpZbmhBMzl3OHc0TFlTMGpaK1ovVG9LbWF3d0M1Rlc4MWQw?=
 =?utf-8?B?TFlVWkdINGYrY1BKKzhzZmVZWkxHUzlsQVhCRHJPVldsangwbFZ5ai9iVWZG?=
 =?utf-8?B?Z0V4N3lwd043RHVVY1hOZHMrT05Wc0Y1L2NOMHUwMkoxRE5JZThnT24wVkpW?=
 =?utf-8?B?YjY1MUE3aVpGUzZVNGlPOUxhbXoyWGQ0MUR0OUE5K0lXbXlzQnFacGloOEkz?=
 =?utf-8?B?QTA1U1h4TmVlYlF4RTlERUc2elpWL0YvZkhYTC83RkRVR045aTB3a00zUXFw?=
 =?utf-8?B?UVFnalJjTm02Q2hzbFBCSHF2ZkxNZzExSTU0NjljZzIva2lRUFpyVmNNRk1B?=
 =?utf-8?B?UjFNSzNNR1ZCRHFPUVZpL1F6RGQzN1dUZlJvb0pSaTJnNE16SVo5Z0RZV3JQ?=
 =?utf-8?B?WW1SLzJvZFk3QVdLekNyK3NJTlQ5R0ppVGNyN0dTbWhKaFVFY1NCeXF6RTlt?=
 =?utf-8?B?NXVNRWdwbEFKbzIrQXgwc0xWUk5mZDdqRXQ1T1JVRU01ZFpuVlhIUTNZS0lp?=
 =?utf-8?B?ZTlXNkF6eFBUOWNWdXZnUUxHNEpBTU9ERVlXVzhUVG1ubk5JWVlHYWVrMTNL?=
 =?utf-8?B?dlZROUVlUXhiRDd4N3R3UHVub0tGekQ0Uk5GZ1d0VFlkbUVzTm1WZUN4dFhr?=
 =?utf-8?B?OXMrM2lZNERHT0pRbFFleUJ1QWdkcnd4TlAzaXRIUDUrdmk2aG5jRFNaajJN?=
 =?utf-8?B?T2RHeU1vVWxjcFZ4MlV1WGVHRjVPVXI1eXhkT3ArWlhkMytxdnp5bGpFVFhS?=
 =?utf-8?B?SUNURU93ZHBLNXRPMDh2SzhOcHZ3cy9NclF2ck8wTWVKbUtPc3pQR3pycXVB?=
 =?utf-8?B?andxRnZRNEdzWmc2MFJ3QUhnbnZkZG91WWUyVm93T2tZYU5vS3Nxb0lNc1lF?=
 =?utf-8?B?QmNHbGsxV2ZsaU9OMGlEQ3l6UUNXakF6ajFhK21OWUZrNTdkS0h4alJ4VlFl?=
 =?utf-8?B?T2ViS0VrMHNhdDhmM3U1djNkeUh4OXFaaktTVHR3UXNmeFlLVGV1WU00TW9N?=
 =?utf-8?B?dXdHc2xBcmk4ZmRNcFExUlVoUWZkTnhUUTIvTkhLdzJHU2dqQ0tJZWdGczBy?=
 =?utf-8?B?dkx3V0NRL1ZGRXh0VW9ueTdtVFlpTEJMNTg4YitsbkpNb2VzWmRDZjNOUEtk?=
 =?utf-8?B?bndOMWFILzExSVZ3RkhuRG5vck5aT3hEUDA1VEIyYmtyNDJnRkgvMzkzVjho?=
 =?utf-8?B?b0RZRHZTRFJSVTI5aHdkSGp3MlRDOVZpVVlFVllSUUZWdTRoV0hOemdwSG1V?=
 =?utf-8?B?UEdVZWZWb2R6Z1Avd2N1WStOVmtoZDN2OXV4M3AyVE1NUnRFSEZiSFlOR0NB?=
 =?utf-8?B?Y20zYWkrQ0MxaDBlTXAzYm1leTJoSDZSNWw3LzRHTTc4L1J5M056ZDVNYWFR?=
 =?utf-8?B?eTJ0V29YclpKN2xsRUwybW9aWEJlYncrTW11ZXU0K1plKzZWUDRjbldnak0x?=
 =?utf-8?B?bExnTFl1RXFZYVVHT3hnR1NvMVhlak5JakRSTzBRZWM3c2NyVHpFUXlKNTdQ?=
 =?utf-8?B?SUxaNkZyY2NJVDFVcU5OQTZLSElTOUg3b0RwV0QvV0FFUjZremJwNFVCODZK?=
 =?utf-8?B?SGpwamhMWXI5N3VHWWVzNWlxd2JkWDAwaEk3NnVJeFJ6aXo5Rmg1ekU4UlM5?=
 =?utf-8?B?eFc2aFRBTXpJTFlLbFFBdTR4UlBhV3JCczBONlMzZ0doRkU1eGM0UTlwc2Qy?=
 =?utf-8?Q?QsJIb08Aqlbtd+x/hmwWfVdKRsDZUbtuE+1kWrHDFTg1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8893a67c-cc2a-48ae-24ee-08db35e00bd1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 14:14:19.1971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuN51GNP278rC9aU/qcPvn+vuwJYq8yjL0qcuqZaxbfZEoKE1zZFsPCMOsDQ4VMI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250
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

Am 05.04.23 um 15:40 schrieb Daniel Vetter:
> On Tue, Mar 07, 2023 at 11:25:35PM +0900, Asahi Lina wrote:
>> Some hardware may require more complex resource utilization accounting
>> than the simple job count supported by drm_sched internally. Add a
>> can_run_job callback to allow drivers to implement more logic before
>> deciding whether to run a GPU job.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Ok scheduler rules, or trying to summarize the entire discussion:
>
> dma_fence rules are very tricky. The two main chapters in the docs are
>
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#dma-fence-cross-driver-contract
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
>
> Unforutunately I don't think it's possible to check this at compile time,
> thus far all we can do is validate at runtime. I've posted two patches for
> this:
>
> https://lore.kernel.org/dri-devel/20201023122216.2373294-17-daniel.vetter@ffwll.ch/
> https://lore.kernel.org/dri-devel/20201023122216.2373294-20-daniel.vetter@ffwll.ch/
>
> Unfortunately most drivers are buggy and get this completely wrong, so
> realistically we'd need to make this a per-driver opt-out and annotate all
> current drivers. Well except amdgpu is correct by now I think (they'd
> still need to test that).

There is still one potential memory allocation in the run_job callback 
in amdgpu which I wasn't able to fix yet.

But that one is purely academic and could potentially be trivially 
replaced with using GFP_ATOMIC if we ever have to.

Christian.

>   And Rob Clark is working on patches to fix up
> msm.
>
> I think best here is if you work together with Rob to make sure these
> annotations are mandatory for any rust drivers (I don't want new buggy
> drivers at least). Would also be great to improve the kerneldoc for all
> the driver hooks to explain these restrictions and link to the relevant
> kerneldocs (there's also one for the dma_fence signalling annotations
> which might be worth linking too).
>
> I don't see any way to make this explicit in rust types, it's really only
> something runtime tests (using lockdep) can catch. Somewhat disappointing.
>
> For the other things discussed here:
>
> - Option<Dma_Fence> as the return value for ->prepare_job makes sense to
>    me.
>
> - I don't see any way a driver can use ->can_run_job without breaking the
>    above rules, that really doesn't sound like a good idea to me.
>
> Cheers, Daniel
>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
>>   include/drm/gpu_scheduler.h            |  8 ++++++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 4e6ad6e122bc..5c0add2c7546 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1001,6 +1001,16 @@ static int drm_sched_main(void *param)
>>   		if (!entity)
>>   			continue;
>>   
>> +		if (sched->ops->can_run_job) {
>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> +			if (!sched_job) {
>> +				complete_all(&entity->entity_idle);
>> +				continue;
>> +			}
>> +			if (!sched->ops->can_run_job(sched_job))
>> +				continue;
>> +		}
>> +
>>   		sched_job = drm_sched_entity_pop_job(entity);
>>   
>>   		if (!sched_job) {
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 9db9e5e504ee..bd89ea9507b9 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -396,6 +396,14 @@ struct drm_sched_backend_ops {
>>   	struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
>>   					 struct drm_sched_entity *s_entity);
>>   
>> +	/**
>> +	 * @can_run_job: Called before job execution to check whether the
>> +	 * hardware is free enough to run the job.  This can be used to
>> +	 * implement more complex hardware resource policies than the
>> +	 * hw_submission limit.
>> +	 */
>> +	bool (*can_run_job)(struct drm_sched_job *sched_job);
>> +
>>   	/**
>>            * @run_job: Called to execute the job once all of the dependencies
>>            * have been resolved.  This may be called multiple times, if
>>
>> -- 
>> 2.35.1
>>

