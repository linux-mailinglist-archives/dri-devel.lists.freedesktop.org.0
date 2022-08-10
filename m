Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DC58F118
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D8D112373;
	Wed, 10 Aug 2022 17:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE74112373;
 Wed, 10 Aug 2022 17:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXceh7NE264nzes4E8f2gIHrscE/Pq/APyMg3N91bBygc+SWKxbEie9CcU87TE9FAruz4K+IShGxpMm1Z+DBaf1LAbMHI3nos62hZlCt6rzkjJE1FZsptFDQVTlTeNnOtp+LjlNZrXW6SaSuIJRcJD6PXKDWkXgc1NfeBsp+Ol6rkpdvmXQQYAte1986ptXI+lvEPt6WxYYdTzpkn0XKopZmt5T37rQuhkgd6GDYuGTSj0mBbk5RaTLox7lmTkij+ZbafnWhnuSplHMwIYFd5BwmKWvaj6CpFEP44I2kaCmAaCLavnBY+ho1K7ujEQLso139guy+YKlxYqF0J4Ge6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTKUcsyDY54dknSFD98thMM2QymJNzAhEEwLm4fQ8t4=;
 b=SjTx1csrHalILcEozsDCdYRrh2QLyOo+cHtnT45UkYREy/WkxpAee5AtwO83rZhu9z3BCTjANgi4wzUAxBhqah1Bwzk52/zszWFSoLIbkH3qKstnVSe8rwByCj2By1NJykim8OkG0CvgQGMS9ZzGkln/aYZoDlF4Br0LhKuh6QDoo4UI3TS3H5x3aDhxkT4918L9bcc71KgMWMzWrpCiyIdbSaxF50oXO4DGqf9hSEzRov8FCKp4G9xqnfTmqA0Jye+wtvlldZsmv1j2HXXMdScRLnhy9WHk7sNsx3wiqCqk9gdeJx6zYNli1L8McYBTZxOsKRbbFsh+6y0qfEhvPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTKUcsyDY54dknSFD98thMM2QymJNzAhEEwLm4fQ8t4=;
 b=v7GAlRPiUfiX8DhlR4Tyn7ZTi4MtgiG4GMFD1SJ1iOYADrmpVd/sJqa3vYPVq6+AfKe6NSVJH3SFUYX+h5jtZyJsAXWQMzWDBOC328RD4ogKEeT1EGCnGMXW9h8AWmoUOBfd1hbd1lvh/PjiRMqF5LCpfDg+tIepVSPC8jvhhJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4697.namprd12.prod.outlook.com (2603:10b6:5:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 17:02:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 17:02:08 +0000
Message-ID: <c78e4774-6319-a9ce-978b-4489e1913da3@amd.com>
Date: Wed, 10 Aug 2022 19:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH] dma-buf: revert "return only unsignaled
 fences in dma_fence_unwrap_for_each v3"
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <CAKMK7uFnMSKXcU+v_g-Sh62O5MB1uY=K2H-Fq7-5UYtmmjCZ_w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uFnMSKXcU+v_g-Sh62O5MB1uY=K2H-Fq7-5UYtmmjCZ_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2876b1c-b542-4f3d-7d80-08da7af20f0e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4697:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjFKhiIkv4IfnJ2VOU1kM1J83F8UwqCBM4x6oHV5eEGiOlhlBnOyKjG5vet3lO2nLDHHjz//27oK/W5GBfeDwuYv2W5lIPYDyoUusw8CAib1vmFJVi72Ip9KlFInQnwr6dEVhkupbset6F0w95zQr805u82NLqtq8RyM/M/dFzNc/gygHIoawoDmJzSOSI5HyykZG+6WOyebJ8oP/tI/os+0o+may8lY+bnZ4iFbt2jaeowvXU35VqYwavjyHMDnKFUzLMvDkpSSg/voQp7cSBcBHo0sgLvxRCQ2kfNHsP5cBxoDXo5dbmiXB/W7xDwhuGA/v1N0UcTfevGE/qPEXcBRyZpY/ieZfCgFiZuwAC4xbJ9pauIAlh/Buro0apzwWSYjBPgjdN+ZAC07spb1qA9BuvS9zMNzjZYjMlcjs0Y3/fUmtxtBC3nju7SWRAnXHYTugs6C5zEobxHINQDcPi8UECI3sMTvotJeNH/iypgv0CY3QejgJZZxmGdl0n2NDatoKc58O+7I6gmWUeTkrUFeArlHsHYJ7aIvZKlmvM45zG4J3a37YgcNseBMlWjN1sOEef9Im+tDAHtQYnkkcSnm1sdaZm1IHml99DtuD670kysRJPShX40Qjd8dVTrBgW0thb+zul00EifhYg4uCpTmBZ6IikcWSP9IwvFlyzA/mItdMi6vsMW9q8Xdskglcw6xYgKJ2hjyZIlHOiq7C2Mr6snMevjGacIBrKNdXyr2FKwthaMQtVhd2IIy5ZQvg1NG621+H/6Is69I84lpc0TDCDileWl9Vrh7+LMxkH0eQtS/p3TD2yXajNZrJ5t5GPqgSF0Aq/XjoiDWay33Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(186003)(41300700001)(8936002)(31686004)(83380400001)(5660300002)(66574015)(2616005)(36756003)(66556008)(66946007)(31696002)(66476007)(38100700002)(86362001)(2906002)(478600001)(6486002)(316002)(110136005)(6506007)(4326008)(8676002)(6666004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHBCMVNGVUlGeU00Y2tBN2pPNjBXL2lFUWVBQjA0Z3lmb3VhLzROUVJEbzJR?=
 =?utf-8?B?dkJUSkVJZG5Wa3lKUUwvMUpXdUM2RkFwWVhhaFRRQzhGd09OdytMcTBXNFNh?=
 =?utf-8?B?My95c0ZjaU5XZzk5UmE2SmUyU0R4SUE5TUg2VlFkRjJtUk9CWHI4WFVqVXNx?=
 =?utf-8?B?Y1pGN1lhbW15b0E2YzZFeXBKSXRaNTNYakJLckhSQ0ErY3ovZERXRkJOZkVQ?=
 =?utf-8?B?SXVYaXgrbDBiVFE4Mlc0TUhOVno1S0lHZDgvemhyUVRxdWM1ZUJiem1RWUtv?=
 =?utf-8?B?eWgvbjhTR3FpOUFDdmNueG9lZHd6NXR1MktnZS9vaGlpcUo1UmthaFptQXBk?=
 =?utf-8?B?UTZ2aDU5SkFFZ0JmZFFZRnZ5L08ybzFOWUdiclU4YTJSMVBQMUplRTc1MFRO?=
 =?utf-8?B?d2NldDgyeWQ5MHNWdUp3N2hyNEh2V3lwTWo5VHpsc1NpUENxS0hFZkdUc0VG?=
 =?utf-8?B?N1ZxSm9RY2dNTUZtcFdKSHRIakRlbzE5aFhnYXE4eEFETTZlaUpWZmJqZkUr?=
 =?utf-8?B?TTJPUXJLTHdVblRRSmFMUDI3Z1Z1L2V3cm9ZcStqZTF1TEFaT2c1cDdVR1l0?=
 =?utf-8?B?SERxM1BUOHZrODNEZ3NycUZpQnBjdW1xYkQrUFQ4ckVTbncyb3cyNkdJQ0h6?=
 =?utf-8?B?MHRxbFBXZXFOckNjd0JJNHorQ2YxVGFEYThlcUFINkFJZXFuc1JrVzNYNDJ4?=
 =?utf-8?B?TFBYV0ZtOHV0VEI4Q2RNcjUwMDl5VEUvU0N6bmVDekdjL0J4VjNSVFN2UHF5?=
 =?utf-8?B?NklUWFJCd09xaktSc0UyaEpqWmora1cyNmZzWkZVSUNpL2tQQ01jbEF6NTVE?=
 =?utf-8?B?b2h1NlZ0UXVMODlEeU92U3lIYzMrOExrUVhuZG03aW9meFBZU1BpSHhWUlYv?=
 =?utf-8?B?VWxxSkdEc2dsckh2N1BvMzhNUXlhTDZRWUdUeUtEbEd6K3YwS0xJUytUYjZF?=
 =?utf-8?B?WnRyUnNhR2Z1UjBGU1VrOEpWbHNoK0hZOGNBa0tmeUZUZEp3UklmRXdlWlMz?=
 =?utf-8?B?dWJQdzJ0MVF1aHVOdlpoYm8wMnRoYVRja2REaEZzakk3SVh6N0NqUDhXbExs?=
 =?utf-8?B?ZlZ0Z205ZEwxem5xZWd1cGNwcUhEZ2lPUm9jZWtucFRVVE1BQXhBb1JydDY0?=
 =?utf-8?B?Mi9sMEx0RDRXazQzR2k4MytjS2huVXg0M2pIUnBocmZ0M0NKMWhURDRTZ2s0?=
 =?utf-8?B?M0U0ZmZmTWlpcFM0aTZkeDBaOUtBRHROeWJ3UThpVFBPSFdBV1gzZ3VzOWVV?=
 =?utf-8?B?TkZMTGhPTXZYZTJRR29oOEdvSmI0cUgwRkU1NDNiSms0RWo3RlBZSzJveU56?=
 =?utf-8?B?R01ESnlON3hOV0F3NmxMZjlVMExmeFUzRWRxNXdtcjNSTjE0b1hpQ3NjdGxk?=
 =?utf-8?B?cEIyNGFITkgxZ2k2MXplbWxTVkJnbUJNQTQ3cTRZN05NZzk5UFlLQS8xckxi?=
 =?utf-8?B?eWx0eis2K3JPUnBKZmFValFLNFhiTGVDUVZlVllGUFQ2WFJSS011MG1oWGxK?=
 =?utf-8?B?Q01PZy9jSnVKeks2cW1XNDRMVThJOXZKNng2RUZiRmNLVllnV1VUeFNoZjJG?=
 =?utf-8?B?dGtTbXZNcXhqSWxHVHlSMUs4Q2JzTTJvTW14a0VpalQwdHZ1Z0NOMWNSbkQ1?=
 =?utf-8?B?R3VMcEdic3Z5THZZdjdWNzJLTStpRUlERGttVEE2MFhpcWJRMTVmN2xFWDhC?=
 =?utf-8?B?bWNDMlV2K2FQSEJ1VFJwa1hzc2g0SFZSVzNpWVo5SXVReEdrbHFHb0NHMXZo?=
 =?utf-8?B?NHRTakJXZUE5Zm5xZmlZU1FhS2hSZkFsS1JxMEJ1R1hsRThYSnNYQkx3ZXlw?=
 =?utf-8?B?U3NsTkRrVE1PUzNoZGt5a3lDS3lHWlZlMGdCNWJPdytQbDdrSk5XZmZXR2xJ?=
 =?utf-8?B?UEYrR0pSb0M4SXVGRS9SZzVlTW9PYVZ4SURmOTBkNTA5VHZXTWZsMmdvVk9h?=
 =?utf-8?B?MEVRY2dkcExkMmE3cHhqWmIra0ZIQ1BuaVRvSFlBK01vQjFBUzlCbFVPTFMx?=
 =?utf-8?B?bVpLd3k0TnlyY1Z0clBtWk5KdWFJdGUzL3JkaXpSNmFtdERxV1NlOXFnS0ZD?=
 =?utf-8?B?WFk1VXhIOHdqeE5lSWdtWnBWT1p0NXNuYzN3S25hRXdTMXBnSUR1ZWg3UE1h?=
 =?utf-8?B?TUk1cURBWHA0dVpjM29EUE8yVzJyVi9hckh3b1ZuVm1VTFVrc0NwaUlRbU5v?=
 =?utf-8?Q?hmvf6ZEOxXTmsICiGIEKC7/pfncJlxovZnhQyu7CifT+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2876b1c-b542-4f3d-7d80-08da7af20f0e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 17:02:08.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJHvifcS+4LgiJBhDok8O0ix0hbFPpwtN2IEAN4hxnWl+OKSFQuQBXYvM5CX2hB1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4697
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.08.22 um 18:54 schrieb Daniel Vetter:
> On Tue, 12 Jul 2022 at 12:28, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
>>
>> It turned out that this is not correct. Especially the sync_file info
>> IOCTL needs to see even signaled fences to correctly report back their
>> status to userspace.
>>
>> Instead add the filter in the merge function again where it makes sense.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
>>   include/linux/dma-fence-unwrap.h   | 6 +-----
>>   2 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
>> index 502a65ea6d44..7002bca792ff 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>          count = 0;
>>          for (i = 0; i < num_fences; ++i) {
>>                  dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
>> -                       ++count;
>> +                       if (!dma_fence_is_signaled(tmp))
>> +                               ++count;
>>          }
>>
>>          if (count == 0)
>> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
>> index 390de1ee9d35..66b1e56fbb81 100644
>> --- a/include/linux/dma-fence-unwrap.h
>> +++ b/include/linux/dma-fence-unwrap.h
>> @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
>>    * potential fences in them. If @head is just a normal fence only that one is
>>    * returned.
>> - *
>> - * Note that signalled fences are opportunistically filtered out, which
>> - * means the iteration is potentially over no fence at all.
>>    */
>>   #define dma_fence_unwrap_for_each(fence, cursor, head)                 \
>>          for (fence = dma_fence_unwrap_first(head, cursor); fence;       \
>> -            fence = dma_fence_unwrap_next(cursor))                     \
>> -               if (!dma_fence_is_signaled(fence))
>> +            fence = dma_fence_unwrap_next(cursor))
> Not sure it's worth it, but could we still filter but keep the fence
> if there's an error?
>
> I'm honestly also not entirely sure whether error propagation is a
> terrific idea, since every single use-case I've seen in i915 was a
> mis-design and not good at all. So burning it all down and declaring
> the testcases invalid might be the right thing to do here.

This is not about error propagation.

The sync_file has an IOCTL which asks how many of the merged fences are 
already signaled. When we filter signaled fences here the result of this 
is always 0.

We have an igt test exercising this which reported that the IOCTL 
doesn't work any more.

Christian.

> -Daniel
>
>>   struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>>                                             struct dma_fence **fences,
>> --
>> 2.25.1
>>
>

