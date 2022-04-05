Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D744F296D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 11:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856510ED77;
	Tue,  5 Apr 2022 09:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9BB10ED77
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 09:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UccaucU6PXLqjMGbn2kR42JyUocNRZKXoPOOZCJfhSZklVhFhp2mOHca0Ia2fL4sKBvpsgTQVLt6KBtS6C2tVJ8zM98yZSAppWbY+JEVb9jDSpNsq1THfiHVySGrDkSeAfSHAogHipVPUrzKhlJvcynO+FgAtr8xbvJf1gqumbTMDUNH7KwoE2kVUCo175PiWGJkyIUyBsEO/T0DlU0CXQbLq+OZ5ccrMyTpSs3bYO7NR5jMHVgivEMY9uEahrsg3vbvb9k02mPq/WmfEtEHwXA94T6WfSFHaO/j0bGJPnAzdJpY3/4XxK9eamp43ifUlLsW43+a51XUuoH7cs8eZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n+I5cKN2PVkwkG+2ie7bfc2ECPPopvBhtgHerEvfFE=;
 b=DVVK4hkM8T0epqkynxfHholFpVFYZpq2Yd3GtBm+rdUvs+s1W7naNSgk5NhuMRIjxX0e4hn6aetpxYZROKcKbmG6dzksE1ZR/1nnkoUSbJeSb6FWE9UrcC3fCUQEMnRWzADXm9gU7bYcE1TXMow4ZkmiliOT2euGz3k8hl7hYwltK2BLbPOVfGLBcXPT4Y9vwxgSfqw99Y/rlMqTM0TmxsEY60GF4C/yJYQqhgCoMlWtpjUwm3nEs9nQ0fI/l29SG3JZCp5KR3HZOqpAq8wKjUswhFWyIF/U9ymFnMJBlDtpgwvNwsLjslqiSC7/jnb8xQu0HFIrOOjmBv0goHpGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n+I5cKN2PVkwkG+2ie7bfc2ECPPopvBhtgHerEvfFE=;
 b=x+lUH/+8s64YDL4rxlGB80aKXnPQr97kr0R6/VxW7CEQLzkvW0fZtLt4t44CafuaU28f0H2ei5SdUPFis0Hgq5dxGYJOyjMNIim/WAPZvBSYsRhdpbZhcPSYJn6IR2CpcvMwKbD0BNRdfpX5Ona3T1TD973Osx+lHYA8ikMEQNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB5553.namprd12.prod.outlook.com (2603:10b6:208:1c9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 09:25:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 09:25:41 +0000
Message-ID: <0fe76123-e2a0-908d-49cd-8fc4f442123f@amd.com>
Date: Tue, 5 Apr 2022 11:25:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 23/23] drm/ttm: remove bo->moving
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-23-christian.koenig@amd.com>
 <YkMtmPFWiaLFEnWg@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YkMtmPFWiaLFEnWg@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0015.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43519298-befa-41ec-689d-08da16e64094
X-MS-TrafficTypeDiagnostic: BL0PR12MB5553:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB55531088224E7E5778A9153A83E49@BL0PR12MB5553.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyM1qMn0KKZEw8XPsQJykPRZVznGPUTZ5XE3VD7jKkwNttyPgaQPOEfREt9FVy81CFZpBImszt8hxDc8MQjxn7nOR33NyXT4bwQ4cfZdWgPFQSUHci6AB79PzVoKEe5b9cnhJ3QGvaQhHVlw18Bl1eYUyQ5skPQmizuAvoYtDLNxnumA/+KldIudtCQlLfma3O1ggJJ95AL0NeQ0YW8BKZah7QaqX/GqUAMwGiEVKMxayg7MEqEj3VHiKB2Jx/CzENcAbIEiUoBLMZZ4nB9JTpl/PAZwHPpKP0zGFID3340oxJqSWVQmQs4Jh/VzpVqj5d7D8+NTAnzO+9ayTW44o8b7MyVOmHeQwJUVaDip84nd6TpBYAyDSCHlaXzom2intLNXd7Q+helRHar0tfOkupaO6Tp8OIYrfjNXpYsMbqIULtHNFE5emAmkdOraIBhH3gtSm+vXS667SzK4l739VC1I7MpA5H2fZ+4xAfIkb8AWDYgQHITQsstmEk6mR/ce6b9VKNmxcvPPS3wbGNGrxccE5cq+BEWPQHzvewl9IPiGuiS7vtBwZHdmqOj1QU7vQX24WPa7+EszHwyWeOtO7yBr2Lz4/y2aA8BWuIW98aA5rGK6hoTscwMPAHZvwcyylCvsUtybusWsEJekowzqkfUeKWphgURQ+dAHJlUI3k7x6ixGC5DY/ReLOo2iahCvvmMPiBfXFLDApnShEL/pF/34kIDcI4MtU63VKi7XMQM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(316002)(31686004)(2616005)(186003)(38100700002)(31696002)(36756003)(86362001)(66574015)(110136005)(4326008)(8676002)(66946007)(508600001)(8936002)(66476007)(6512007)(66556008)(6486002)(6506007)(2906002)(83380400001)(6666004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1pnSWxSelpKa0crbnhsc2UvWFhTWHg3OG1zNWhFZWdRODYwNHhVT1ZNSHdM?=
 =?utf-8?B?RTM1ZFo5bll6NXEvNHlualNwNGhEc3pRSE5RZ0d1cnEvdHBLaWlVTVF0bjl3?=
 =?utf-8?B?SEVyY1FSb1YvMlJlOG5GZXZ6eVNOdW1odHp4ejJ3RGpvN3ZLWm5lV2Vuc1Bz?=
 =?utf-8?B?eDdpcmZmNzNFOVZnUU5QanVaQnNQU0dQbWl3ZTY5dlJ1ZURTeTFoeFdnNElO?=
 =?utf-8?B?RGJMVGk2MFBRK3JURktFL2N2SEN0OEhZRERBOGx1Tmc0Z1Z2cHhiM0NWVzBi?=
 =?utf-8?B?dUpBTXo0aTdzRXRpWkdmS0tjUU1wd3pLdlRNVjIwVEdNVUlYdEd2UmppRWp4?=
 =?utf-8?B?dzRONkZpRjV4NUxuOW41VzgrY0pkUUVXSGJzSVNpSm1uYkxVeFdSVnBKWWkr?=
 =?utf-8?B?ell4YkxhdGZuTDB5V0x5ZU5NOVZzaFpROGsyR2RiSG5Qa2Vpb0d3em1tbm0w?=
 =?utf-8?B?THBsWW5YK2UzallIOUQrTTBIQTZKaS95OTFjR0Nobm5UL3ZOamFpVUxPYUJn?=
 =?utf-8?B?Z2g3b2lscTFydmthUjM3MExsMDF3QURBMlN2V28rL0hGUWlZUlo2Q1IxMlg5?=
 =?utf-8?B?NDdlNGFrandxUm93RHFWZXg0QTdtUDg4K1l0VFV1OHdDSTNHaE5uV09rbVdH?=
 =?utf-8?B?Sm0vUFFBUnlyeXA0Vk1NSHJKMldqaFFIYVVGaEsyVTNDY2s0NjloVEg4ZmNW?=
 =?utf-8?B?SHcwc0dZdnYxZHZvZlR2MkNmdlJQWEcrODRPbHFyaUFoL05QTXJFYlZjQ3Fu?=
 =?utf-8?B?STZTUUl6eStvZ0tlbmJyMzNnR2MrMHhqaEx2QmlmcUwxMjc1Y1ozMytHVWtG?=
 =?utf-8?B?S3AwVEREOWJGVmpEQy9ienhZUU1MbGNZZ0VNMnU2T1VIdXF5SzkrSlNIQ1lT?=
 =?utf-8?B?OHl4N0I0VkJhOGR2ZnJCSkNJL0NFRVlLOE1VRDA3MjlDdllUUmVJWXpCWU9I?=
 =?utf-8?B?L2tDNjFNSGxIYWliZ1ZZNWJvRU1YTnBtQzM2VHZKVE1GUTFRM2xMQWpLZ2VZ?=
 =?utf-8?B?ZXgxUmlyM0hqOHR0cDE2OXdCVFBBWDBIYUo5RnhRMHJvejFaMlhnZEZrNGNE?=
 =?utf-8?B?SU81dHc2ZDh6TUNOQ296UW5wWUFiOWNTaEV3TStjNUFZeURNaVhCNHU5NGht?=
 =?utf-8?B?Q3FMVUhMZVJOWDl4NkptRmxHY0dCQU1Na1AyYXdpRkQ0ZEJ2TXRwL0JMNTh0?=
 =?utf-8?B?d1Z3TjlralU0TWYvZGVXQU5KOWx2eXg0QXhBY205VUxYODdqTGpCdVZOWDJO?=
 =?utf-8?B?Y2doM0g5K2RJRUxNMXl3WnlsTG83YlcrNXRMUUdwYXlUV2pEeGtIb2s1NEZm?=
 =?utf-8?B?ZXdIbVNGem90Y1FZN1RjR2IvODRXbmwzbkx1ZjVvL1dtWWVNT1JidSs3SlJq?=
 =?utf-8?B?emFWMmxiOGJkS3ArbGhHeG1LSUcyZk9SYnVPRFR3YWkwaHhOUktWRDlJWHNh?=
 =?utf-8?B?NHB4VnVhWXpQZ0wwNnhhYisvZGRWeHNSdVNmZW43a0VjblE3c3lKS2MxQW5P?=
 =?utf-8?B?QXBvdG9teVZtUkRHbENZTzdvVzVTVTBBZmRnaGhPRzhPb2hzOFpOcm43TUVD?=
 =?utf-8?B?SDZJSFRDdVRnQnZvbzgwTTdmc0pxcnZTajZPT2dhejJ5T2JyMzZza1J5V3dJ?=
 =?utf-8?B?aFdDaVcvd3VtU1l5b0VYQXJqd21zQi9WR3RrTHhWNXVFQXoyUVc5bW1MbHBY?=
 =?utf-8?B?dWpEd01CeHNzdDl6NnNRRFZWWVdaVzNZdEd4RkkxRmJIcklqZVc2UDI2Z0tx?=
 =?utf-8?B?OWNZSE9lTmIwWTA3azB5RXhTUERnTVE0eW1vQnI2MlVCdWpYbTc0Tm81blg1?=
 =?utf-8?B?MmJUTkNERlAxL3JBaW5HaGttTW5wc1NBZkVMR0plbEFRRHZ2c3R5Mmprc1lL?=
 =?utf-8?B?WWlsRlRjVDY5ZjdLWHZUaGNScDVFNmVHUnJ1c2U4dDJVZ2NuOUFqWkJIQkFx?=
 =?utf-8?B?T1cwN3NnRmpOQ29UM2RKcDEyb1BYMGhVaHQvMGJkbGtZN0N1MXJOaFlGQVlZ?=
 =?utf-8?B?cjUvNWhvSm4rSzBqemdWQjUyanJHdmdySERuVmROWHA5TnRrVGNHRW9BcUow?=
 =?utf-8?B?ckptd3g0K3ZVSThva0tOd1NlS1FuRHEwYzdUUkpWN1ZFcTJSeFlCRTBza2RP?=
 =?utf-8?B?R1ZOanRTb2ZqcHRFblVMMjA4a1lOM05EeGcvc3F2NjRIK0RHcW1neDMxSVpC?=
 =?utf-8?B?OWxibGRzU2h6VUN1czZaa3p3N2IrcWNYMWY2b2xJK0xPTkFMQUVKdkJONDZD?=
 =?utf-8?B?WDRiTUFXRFNRK3RLeFVLSVhESHM1dVBNa0NUVCtKVjRzUFZSaDVUUGVzbWI2?=
 =?utf-8?B?ak1SUEZnblhaUy8reVczZU54OXJJQzhEZVNnbmNTdDcyMERING5rZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43519298-befa-41ec-689d-08da16e64094
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 09:25:41.0447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nueYaCxhpA9D/9Uwy+Co6F+0qS6O2WOYR677hG58V6iwF6smQ054/L3JYzNbID0D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5553
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.22 um 18:02 schrieb Daniel Vetter:
> On Mon, Mar 21, 2022 at 02:58:56PM +0100, Christian König wrote:
> [SNIP]
>>   static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>> index f999fdd927df..c6d02c98a19a 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>> @@ -1163,12 +1163,6 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
>>   		*num_prefault = __KERNEL_DIV_ROUND_UP(last_cleaned - res_start,
>>   						      PAGE_SIZE);
>>   		vmw_bo_fence_single(bo, NULL);
>> -		if (bo->moving)
>> -			dma_fence_put(bo->moving);
>> -
>> -		return dma_resv_get_singleton(bo->base.resv,
>> -					      DMA_RESV_USAGE_KERNEL,
>> -					      &bo->moving);
> This seems to be entirely misplaced and I'm pretty sure doesn't even
> compile interim.

Mhm, removing that is correctly placed as far as I can see.

What VMWGFX does here is to update bo->moving to please TTM, but since 
we now drop the bo->moving fence from TTM and always wait for all fences 
with DMA_RESV_USAGE_KERNEL before allowing CPU access that workaround 
isn't necessary any more.

>>   	}
>>   
>>   	return 0;
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index c17b2df9178b..4c7134550262 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -97,7 +97,6 @@ struct ttm_tt;
>>    * @lru: List head for the lru list.
>>    * @ddestroy: List head for the delayed destroy list.
>>    * @swap: List head for swap LRU list.
>> - * @moving: Fence set when BO is moving
>>    * @offset: The current GPU offset, which can have different meanings
>>    * depending on the memory type. For SYSTEM type memory, it should be 0.
>>    * @cur_placement: Hint of current placement.
>> @@ -150,7 +149,6 @@ struct ttm_buffer_object {
>>   	 * Members protected by a bo reservation.
>>   	 */
>>   
>> -	struct dma_fence *moving;
>>   	unsigned priority;
>>   	unsigned pin_count;
> Aside from the vmwgfx thing this looks good. With the vmwgfx patch split
> issue (I think it's just that) fixed:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Is it enough if I explain why we update VMWGFX in the commit message?

Thanks,
Christian.

>
>>   
>> -- 
>> 2.25.1
>>

