Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E38426D8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05334113150;
	Tue, 30 Jan 2024 14:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF7511314E;
 Tue, 30 Jan 2024 14:23:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvQ391GeCclD+7kbAbGT9OhI3iKw58DT2K/h8nLFplnR0c1/i7fKe3k6UdkuVjPFahurOafcfkkW/hea4rI2D+ruLpXjuhCwPW4pwiEnfMpZpy1RnmPYbfCFZBenpQaSIW2kPliUAJ1qQ8ujhmzR+PTZdC/T7NSFDYV0imA7livbPbchO7zWW0HtFi/YSpYuq3V0lcsyGNxaJP30Z/E/ee8AExxJv69VjDENOptMsTIDGmehw1fHk+EHzIYalW/KTKdhtEnqE4pjV3QgrWhVr2DU2YV+H+CX2p0l+7KJ0Hrrq8svOEodvRnD7ROb0oOVoEmJ3ovwfBK659zsO6z3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2rCcywr7dw/yC/vDiH7ocw6cJBpdN7ePTafQfOVw5Y=;
 b=agaXHdDHg4Jub2XSzc9UJ5+0KGeA+zedtvKY6s3dQ1pDoKJyA7arJljFC64QeHQAc0CQjvkOwEGlqGGwPv6v26Cp37/xXsWbna4FR1A1bjBPUHbLUnFd/S/nhcdpeIUTdQ/m0znMPT8ov+zqt9GZ0L7nMDiClEScYY1GcpSB6d40kJDrUwDJMqzbq2UiUG0Ar05esZT5sLypkiTSDDftOe2H8PmcCchfZV3o8ke0W84IV3I+dtvYwM/e6aKLA9B3UYbsaeazONKkk46R9taja3y60dmrV2WLrGulzcT1J+TZQM7syLJt+nhSQp96IP+M73dZ4BkPzm302lWrJs8Vlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2rCcywr7dw/yC/vDiH7ocw6cJBpdN7ePTafQfOVw5Y=;
 b=lCJJiGOKPXEA4PoJtWnzDWEifZo6Qys8qmW8MfD8iuGw5hUEXRwjN/cNWQv87ILwq+IlkMwJ6IrTZiH7dRXXIbLlO+OLb/SxCAuWQG12bKePmxGULaeqnKPQJq5+Sf39j9ZORHDBjkVltHlLLibHw5RrKq8mjEF/Le+ycVhHI5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL0PR12MB4993.namprd12.prod.outlook.com (2603:10b6:208:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 14:23:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 14:23:38 +0000
Message-ID: <97c50e01-ee33-4ac8-975c-f645c2ed49c6@amd.com>
Date: Tue, 30 Jan 2024 15:23:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/virtio: Implement device_attach
Content-Language: en-US
To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>, David Stevens <stevensd@chromium.org>
References: <20240129103118.3258781-1-julia.zhang@amd.com>
 <ZbjZJ3qQzdOksnb2@phenom.ffwll.local> <ZbjaebswTCxmlwu0@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZbjaebswTCxmlwu0@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL0PR12MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a28ce12-3304-42d0-14ff-08dc219f0ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lnEwszdm2nhs6g5Fr9nY4aMvILpcvbq1JPH7eE4LR/67SE2N01nAyGVaz5iP+Y8uHzkysWBJljgYl/e/NKXZFl+yaDGU1xYQsF8r3HVW2+IY+2g28w4x4L+hMNeFG0UQsXauDYhZ+BSWZxFCWIkI/IpmMPlNc00ii3mwz/M15lJswvVi5OHgkAKO6kzny2EJ1uwmaENk1+CxKCJj/m3/u+dj+Goi4jXeoBUrtsd9R9IhonVeNz2cNphSFzHHKTyFuN9JKzerFnnLiwHohYAipbxYUvmjJWJK9HlgFl6LGCTeGmo0bMxQeNWqTCntg8iz7U18q+0bO1wo8quKqDRExte88ZZkj8e09tJlGfza07BTnKgMZf9XKn/9e07kdEPcwHl5oTpErTXWLH3gEtXtYtA1HBH2GWUL1qcb9jxH6j7HP2pEr94uWCgB2dEpsEYdKBDMYwq7VAubyqa0QLrWjLr5SKyaFCc6AnQlIlkMnB0M3FABWq7O0XIWXg+QPzvtrLKj5MLIOth6MQyBqiBBeuayjSCs9Fht8fhkh+jodU0wpcH7P0Qc5pcIwTIrNKewnX5jI+1gKtkwVTFZ2gE9yaV6SlqVX8ANEQn1kpwVqftXjEFgErMUsIUXZ3xeFtcuTFPihH5W+L5gpMICoYJ+wdd28eAsthlQ8WHiwTav2eo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(136003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(2616005)(7416002)(6512007)(26005)(38100700002)(5660300002)(8936002)(2906002)(6506007)(8676002)(478600001)(966005)(41300700001)(6486002)(66556008)(110136005)(66476007)(6666004)(66946007)(316002)(31696002)(86362001)(921011)(36756003)(31686004)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUN5amFyelo1Z0JKazFZTU1rcGs1TUtIelBvZkR0eURUZzQ4c3E4djVzRUtH?=
 =?utf-8?B?QkdNR3NIUWl2dVdMUWV2UThSU0VqTjhXVTJ3N0M2cngxdHpaQTFQMDBxRFZv?=
 =?utf-8?B?T005WDVtOFQ4RVdJaHU3SGdWVFdPWEY4ZGtIS1VmWmtjT2hZelVRU1VCeXB4?=
 =?utf-8?B?WERJOUJDZjdjWmk1V2kzME8wVlVLZElWMHIrcnpxVlV2WHJHMUlmTUFVckI3?=
 =?utf-8?B?OU5qTW8xSDkzbHg1NFpubjVsZnpjRDVGVkhXMTk3ZlIyc3NJLzFNZEpRMm9N?=
 =?utf-8?B?Ni8vTm9KRnJUY0Y1Vk9ycyt0d3pIV3lVK0tEcWx4SUU1ZHBMWEs3bGh3VDZV?=
 =?utf-8?B?T2NhaDJTUzQxcFp4QnNTU0FIWFFnREhNckpoa1pQdHBUaXJ0QTA5Nnk4NjJP?=
 =?utf-8?B?eWZoc1cxeGRhWCtzVTdyS1dZRXVIbjR0ZDhOVElBNXF4MXVrK1VDSmFxU0gx?=
 =?utf-8?B?dFZiSUFWd0paTVIwanhvRWN6c1RmVzdselVNY1VzeGN0am0xQ3RnN3M1TEhQ?=
 =?utf-8?B?RmRWVkVuQTh5R2VxMjI2WW5SQ1B0cVd0V2F4V1Rkd2pvb1F4YnZuL2R3VVBV?=
 =?utf-8?B?MmgzUGhTUHlQUCtxVjliY1NEMmVyS29oMW9TSGY0NE1JSjZySm1Ua1RKK0ty?=
 =?utf-8?B?a1FZR2xoSmNpSU9qeTQyUTVmSDhmZTgyVW1CY0I5eUJGVk9taFQ2RllHT2lY?=
 =?utf-8?B?T2VqMk5iUm9Oc0lJVm16WEtwUzloZnNnZFo1UktwSG53eGJHaWp6YkdhWFVM?=
 =?utf-8?B?dkpBS3ZLbmx1SE1Mc3ArZndsd3Y3ODV1aTlNQlJtNWhaSDRPYmZKR0ZHUVcz?=
 =?utf-8?B?Z3FzTTQ4TE1WcUdJbUJGSEpFdXpCRkRBSzlDUldHQ3dGZHhWM1BqSFM1dThP?=
 =?utf-8?B?bnhXTXRQMTNwRTR3MHVnVDBRb1NSMHBwWW5TNHhZNFZaZkM4REZ6OG9HRUc5?=
 =?utf-8?B?K3NFRUhHbER4RUZORUJ0TGtYanBDQmpkUWJ5U1NUbGV6Tzl4NDhTYWFUVjl5?=
 =?utf-8?B?NEJqSDA3NktXZEJocU83NG9HRGlMNTVVQTQrempuTUo5NGhXTk1XbklXNkpD?=
 =?utf-8?B?UDhyMFUxVE9sZStSTkRxdkpYMGRlbXVRZnNtY0RRbTdOeHE1a1E1aDdvVzlx?=
 =?utf-8?B?eEF4Z29oMHROeWxVKzJlLy81aGhhbGkvdGFiaXFnYkV6cDhvZjQ5UUZXbnc0?=
 =?utf-8?B?eUI5NXhWVUNIOUxqaE5QUWJ6VWlJTmVJV2htRXRXMkwzekNyZmIvUnkvckhQ?=
 =?utf-8?B?bWc0R0RMMGEzbWdGQlNLc1lWL1gxWnUwczdpcThkWVN2UDdjSWFhWUxVUTNI?=
 =?utf-8?B?Q1dSZk9ZbWFjR3JPOVE4UmlDbFNac0RLNmVnN0FKRzBzVVZaM0w5ajNFcHNz?=
 =?utf-8?B?VC84Vk5qVHVORWFzaXNMek1JM0hSWXl2SVdJZTVvUG01U3hnMFA3bkV5L2Zt?=
 =?utf-8?B?YWdGL3V3dE10WHF6T0ptZURncVdYTk92Zk1IbE56SzM1WGREWE1qSkpZOUxU?=
 =?utf-8?B?bTRiVEZPTEducE94ODZjRnRzaW5TMjFtU3A3MDhiZ3ZZZ2hLQjlxS3JSM3Bi?=
 =?utf-8?B?aWh6Mk1aamZhMzF3a1JlT21DZERWb0Q3dUF4YkJubjdYZTE1ZHNpZGhyUzFD?=
 =?utf-8?B?ZGNMSGFnK3liQXJjc2QwNWRBUzZHKzVmbjFVN0JwNnE3blRQNE9mNzJ5ZUdn?=
 =?utf-8?B?UHlGZWZDOXhoTkFkZnVOK2xYdWZhMHloejlWR0lSQkJNWU5ZTnJ5eHltZmpP?=
 =?utf-8?B?TU9OOEY1S0JmMHBwOFc0N3BhUUozMmN3SFhOOUp6L2ViVzZhaTMxNlNqb2pp?=
 =?utf-8?B?cWltVkNtcHlFRFBhN1JPdjdNd3M1dzFobHVHUHltYm9aWmRGemFHOVFoWDVv?=
 =?utf-8?B?MjBSUi9QQisxdHdLQU1tdFc4S25GZkVJNWoveFZTcnVDZzVUNSt2REEvQ2Iv?=
 =?utf-8?B?QTVEaFNnQ0xFTmxHd2hPUXc5cmd0RWRGTjAyajZpMm54OXY2YTFxbnJjSHF0?=
 =?utf-8?B?WG5MQ2s0UnpRcUl1NnBqc2ladkp1Nkd0M2t0MSthK3BDZFJLWThjdHEzd0Js?=
 =?utf-8?B?ZWJqUm5Pc28xWHJueFQ4cTl3SnZKUzlGamVBUGIvcmVuU0ZLajQrelFUd0tt?=
 =?utf-8?Q?/0Kxllksrr6U3Qb4Z5x5yrq7D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a28ce12-3304-42d0-14ff-08dc219f0ce3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:23:38.0988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BlaZ5zjhSUllO4p/bu5IOLJT89t2qqcCUbT8FR4A5tUiJlUW/NuxeBK5cMpEnVX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4993
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

Am 30.01.24 um 12:16 schrieb Daniel Vetter:
> On Tue, Jan 30, 2024 at 12:10:31PM +0100, Daniel Vetter wrote:
>> On Mon, Jan 29, 2024 at 06:31:19PM +0800, Julia Zhang wrote:
>>> As vram objects don't have backing pages and thus can't implement
>>> drm_gem_object_funcs.get_sg_table callback. This removes drm dma-buf
>>> callbacks in virtgpu_gem_map_dma_buf()/virtgpu_gem_unmap_dma_buf()
>>> and implement virtgpu specific map/unmap/attach callbacks to support
>>> both of shmem objects and vram objects.
>>>
>>> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
>>> ---
>>>   drivers/gpu/drm/virtio/virtgpu_prime.c | 40 +++++++++++++++++++++++---
>>>   1 file changed, 36 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> index 44425f20d91a..b490a5343b06 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> @@ -49,11 +49,26 @@ virtgpu_gem_map_dma_buf(struct dma_buf_attachment *attach,
>>>   {
>>>   	struct drm_gem_object *obj = attach->dmabuf->priv;
>>>   	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>>> +	struct sg_table *sgt;
>>> +	int ret;
>>>   
>>>   	if (virtio_gpu_is_vram(bo))
>>>   		return virtio_gpu_vram_map_dma_buf(bo, attach->dev, dir);
>>>   
>>> -	return drm_gem_map_dma_buf(attach, dir);
>>> +	sgt = drm_prime_pages_to_sg(obj->dev,
>>> +				    to_drm_gem_shmem_obj(obj)->pages,
>>> +				    obj->size >> PAGE_SHIFT);
>>> +	if (IS_ERR(sgt))
>>> +		return sgt;
>>> +
>>> +	ret = dma_map_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
>>> +	if (ret) {
>>> +		sg_free_table(sgt);
>>> +		kfree(sgt);
>>> +		return ERR_PTR(ret);
>>> +	}
>>> +
>>> +	return sgt;
>>>   }
>>>   
>>>   static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>> @@ -63,12 +78,29 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>>   	struct drm_gem_object *obj = attach->dmabuf->priv;
>>>   	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>>>   
>>> +	if (!sgt)
>>> +		return;
>>> +
>>>   	if (virtio_gpu_is_vram(bo)) {
>>>   		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
>>> -		return;
>>> +	} else {
>>> +		dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
>>> +		sg_free_table(sgt);
>>> +		kfree(sgt);
>>>   	}
>>> +}
>>> +
>>> +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
>>> +				     struct dma_buf_attachment *attach)
>>> +{
>>> +	struct drm_gem_object *obj = attach->dmabuf->priv;
>>> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>>> +	int ret = 0;
>>> +
>>> +	if (!virtio_gpu_is_vram(bo) && obj->funcs->pin)
>>> +		ret = obj->funcs->pin(obj);
>>>   
>>> -	drm_gem_unmap_dma_buf(attach, sgt, dir);
>>> +	return ret;
>> This doesn't look like what I've expected. There should be no need to
>> change the map/unmap functions, especially not for the usual gem bo case.
>> We should definitely keep using the exact same code for that. Instead all
>> I expected is roughly
>>
>> virtgpu_gem_device_attach()
>> {
>> 	if (virtio_gpu_is_vram(bo)) {
>> 		if (can_access_virtio_vram_directly(attach->dev)
>> 			return 0;
>> 		else
>> 			return -EBUSY;
>> 	} else {
>> 		return drm_gem_map_attach();
>> 	}
>> }
>>
>> Note that I think can_access_virtio_vram_directly() needs to be
>> implemented first. I'm not even sure it's possible, might be that all the
>> importers need to set the attachment->peer2peer flag. Which is why this
>> thing exists really. But that's a pile more work to do.

Yeah, that is really just speculative. All importers need to set the 
peer2peer flag just in case.

What happens under the hood is that IOMMU redirects the "VRAM" memory 
access to whatever address the DMA-buf on the host is pointing to 
(system, VRAM, doorbell, IOMMU, whatever).

I'm also not 100% sure if all the cache snooping is done correctly in 
all cases, but for now it seems to work.

>>
>> Frankly the more I look at the original patch that added vram export
>> support the more this just looks like a "pls revert, this is just too
>> broken".
> The commit I mean is this one: ea5ea3d8a117 ("drm/virtio: support mapping
> exported vram"). The commit message definitely needs to cite that one, and
> also needs a cc: stable because not rejecting invalid imports is a pretty
> big deal.

Yeah, I've pointed out that commit in an internal discussion as well. I 
was just not aware that it's that severely broken.

Regards,
Christian.

>
> Also adding David.
> -Sima
>
>> We should definitely not open-code any functions for the gem_bo export
>> case, which your patch seems to do? Or maybe I'm just extremely confused.
>> -Sima
>>
>>>   
>>>   static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>> @@ -83,7 +115,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>>   		.vmap = drm_gem_dmabuf_vmap,
>>>   		.vunmap = drm_gem_dmabuf_vunmap,
>>>   	},
>>> -	.device_attach = drm_gem_map_attach,
>>> +	.device_attach = virtgpu_gem_device_attach,
>>>   	.get_uuid = virtgpu_virtio_get_uuid,
>>>   };
>>>   
>>> -- 
>>> 2.34.1
>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

