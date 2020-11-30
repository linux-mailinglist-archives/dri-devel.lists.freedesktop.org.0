Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0E2C880C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 16:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FF16E524;
	Mon, 30 Nov 2020 15:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84D36E524
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+rRbAIWGTFNH0GMLOYYYD6y4h77vZz2JZ0t7uTyEwxhLGm2Qjx766vevZQS9P4IGYTq9zb+wczpvYc+GI4o3thFnnNKlpgoQG4egKuTjqEJN+/KOlTpgshe5c3a0EeYi02tp0JDPF4qbEP3MhyvGT3aPUqusrW1hMaLBzTPvATRYDU3V9EIIxBxzKSbxGpfCpybT6BRvQsucIq53CZThbaGglcnK3pDUuTkndAp0irlTk8XKmOMERjyEzzOpZ4qIe24Koikg3EdqtFGA1kP6fwduIGQk+92iZFEigmUlq30+9WY8sPyg63NyHqs9Uk4+rwTlVaMNcc9rzmUMRPKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfEhbljiruvMaHkyunv0QcY/+WwNOcbMiP3TQ/S95rU=;
 b=DtmdDfXPJ7s8Y1a6XnZpbN54nls35C4xpVzrXI0sxND0KOPAxmQOC0hglVRisNIqE6UNAYXA/L0jIRsXUrM8vfZg2W2/4gi831qrAHH87wkrYi7S4vedjlXU7fH9NaEIk3vJepY4pGwAWSJL5W0aSj6X+TGBfY/6uqJQIxXES1YLqRxYvgGzLaztaLHBaeSPuzE8X2eWAqemtaiDP6mI7a0wTvqwygG6zv5RuWKojs8WnJfzLUfGejvRdJ5Dmaow3Bi5QVZdRVbRcPzmGEsXnnGoAbUBnRSv7Lmxv4v8MwdKXWpNktKzLlEvq8+SdT2k8i45GGj9D0+yF5Ss24KTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfEhbljiruvMaHkyunv0QcY/+WwNOcbMiP3TQ/S95rU=;
 b=LW7atGCXiPNKRf24MRzyIzpjDfguQ5B+PRtHB0uSlUU/8wBwL3JFLfZ2Dnn61JRo7nl0RW0PM1f40Qda5VjzzH3DBPfjBCDrpzOxHRCIR7Rlc+W5fZTm0traDNCUG+KThLc2w5FmlFg/6rEbRDa88v5RJzK24rag5G/nBFcTfLY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:33:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 15:33:19 +0000
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
Date: Mon, 30 Nov 2020 16:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201130153048.GS401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P193CA0027.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P193CA0027.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 15:33:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67f28359-13b6-4379-205d-08d89545437c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24510D6F255565CA800382BA83F50@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySRzcJ98jRghZ90U0X+6Xpm+pxf0/BINgCnhv9qr4sQEv7Jw2omKX+TyLujtDjCqgdl49Q6/OHvPAZ1LBFH8WzJknF7A8wq7CD03xMMs9Vu3MNCXgg7Tm9dNfVTFj0QKkgKXJIOD01ydXzjedYYkrl9G4VkFHvgVoY7a0dnaUg41B4khNI7q6wxPo+mWwSYUNQB9eVMlP5URryJiwPGnx3I514+NlZytaIJLopjjAJ9lhHcMU0HgepL3XFfhVJyqIKYoJdAfZunP9Ua0IIRaU3dkG8qiHL37J9kI+P9I2TiVuYSNEW400vghw1DvZjQMI5YfoltEH/W3AWn9FIUKaJQNnG4Rmz+bSgdt/lfCprQV2aWaERkId22xRHMiJGX2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(31686004)(8676002)(8936002)(6486002)(86362001)(110136005)(5660300002)(316002)(6666004)(4326008)(2616005)(31696002)(478600001)(52116002)(16526019)(186003)(66476007)(66946007)(66556008)(2906002)(36756003)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TnZUNHBKWEppZnNoQTJOcFNBS2xKZS9vVkxmdUxJL3k1a0tHdHVaZ3lFczZn?=
 =?utf-8?B?djQrT0VqZHArK3ltb2F5VDVOaitxSmEzTW9mVVREOVVMRjVuQlR1OUlxS0Iz?=
 =?utf-8?B?dUhpeUdXajkrY0k4UG9VOEVYdHl1OTNGaE9sM2hZLzRWZ1UxWTFwbXhhc3Ju?=
 =?utf-8?B?VkowUit1RUNZTlZDOFlHaE1uT05zOXZhMTdyc3ZqMDI4UktvYjNQVWZJS0gx?=
 =?utf-8?B?L1F0WHI3ajdKNXdoTEN3eFNVK3dFT0NTYTdBMWlQY2dyWEcvLzVLcGh0SG92?=
 =?utf-8?B?a0VrcnFCZDYwQklubk92ZGpuQzlLRGRtRUh0ZUtUU0FTazlkYllFSEdKeVJN?=
 =?utf-8?B?RmFUODNBU0luMy9iMnZTQVNLVnV5d21ETEROZjNyTEdRSG9zL3FxMmVLUndp?=
 =?utf-8?B?VFFwY1l1Yzg4ZlV3VmM0WEt3R1BocjdpOHl2dXFtSVhZdU1LbWR4Nzc0VGdq?=
 =?utf-8?B?c1E4SC9ZejZmNEhURnVhMDdsbi9NN1o1V3M2WFdoVEV2U3hjVHBsL2FBVGtE?=
 =?utf-8?B?MUxzZW9PVlJaQncrVWZweXZybG11Uy9pZXZWZ2xjOERZaStUYzJHcmdNb3Rw?=
 =?utf-8?B?QnE0UCs0NjQ1a1h2dTNCMFRLRW43Mzd3SS9aVnlHaUtkTXZQNk1BYkh0QVZN?=
 =?utf-8?B?RS85WExwS3Zwa0tPKy8ySjZRbDZrWk1MUHp3V21MSVIzQ1JUU09NNmpxcGgv?=
 =?utf-8?B?SHVpMjk3bUhDM3Vnb0dPUnpJN3NWRkxSeHdGWEJQNzdZUlN2cFNJZHZYWDJB?=
 =?utf-8?B?K0RHSUpBMXZqUW93NEpYekhPdU85bzZwMEMrRXJEanBUajNnMFhpNTVQREJl?=
 =?utf-8?B?NnNCcTIvaVhTN0kxRk9pZEozUEMrZTltRmhxdXByK0RQQ2wzL2NZaWlwRXBa?=
 =?utf-8?B?QS91bDhEaXBNVDBCSktuYSttODFmdjIydUxPQ2RIdVZ0eHJlQnJYM2x4a1NJ?=
 =?utf-8?B?Mnk0V2pQRHZENjRQMHJTRzhUS1BvMlI5Ry9uWDFEYzZuTVZPRURFcm0ydGhv?=
 =?utf-8?B?SHRaWC9mQ3JlYWdJWjV1WlZlREhEYTZGTU5TclA0MDFGbUVURi9YRm1SVldl?=
 =?utf-8?B?WW40ZVQ3OUJrT1Q1YjU2YllrbDNOR0htU0Z4UkY4ZzZ3QS94Z1UyOVZCN1hN?=
 =?utf-8?B?MnRRZlJ0V2pMOFpxMHNvTFNqcVRUMjI3RkVtbEtNRHVudEgzaTZGMFpqNlA0?=
 =?utf-8?B?MlpmeWl1ZUdvQ2dkdFVaVEhlNk9pV3h5Rmxta3F1RFBadmVCcm1LUjMyS2VY?=
 =?utf-8?B?QXpBcXlzQWJPZ2FhMTFLeHR0djlldHExVTBDajc1bjJxM1BDUURwR1lVYTB2?=
 =?utf-8?B?bXJiL2EyZDUyUEJBNkFneGxIQVhqVTRLTFk2SldzcHdxQU1YTmFvTmp1WHRD?=
 =?utf-8?B?a25MQXNmbW92bE0vVXJ5bHRmdFdiL1MxaXMrUjhmcm1GaVBsRDNuWUo2Q0dP?=
 =?utf-8?Q?7038atCE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f28359-13b6-4379-205d-08d89545437c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:33:19.5792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgtcPw8Uw6s8kvWBYp70KFyjhenfY6fAeuexqVUw5BPy9Jt7mnE0wEfEcqWYVRdx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.20 um 16:30 schrieb Daniel Vetter:
> On Mon, Nov 30, 2020 at 01:04:26PM +0100, Thomas Zimmermann wrote:
>> Mapping a GEM object's buffer into kernel address space prevents the
>> buffer from being evicted from VRAM, which in turn may result in
>> out-of-memory errors. It's therefore required to only vmap GEM BOs for
>> short periods of time; unless the GEM implementation provides additional
>> guarantees.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_prime.c |  6 ++++++
>>   include/drm/drm_gem.h       | 16 ++++++++++++++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 7db55fce35d8..9c9ece9833e0 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>    * callback. Calls into &drm_gem_object_funcs.vmap for device specific handling.
>>    * The kernel virtual address is returned in map.
>>    *
>> + * To prevent the GEM object from being relocated, callers must hold the GEM
>> + * object's reservation lock from when calling this function until releasing the
>> + * mapping. Holding onto a mapping and the associated reservation lock for an
>> + * unbound time may result in out-of-memory errors. Calls to drm_gem_dmabuf_vmap()
>> + * should therefore be accompanied by a call to drm_gem_dmabuf_vunmap().
>> + *
>>    * Returns 0 on success or a negative errno code otherwise.
> This is a dma-buf hook, which means just documenting the rules you'd like
> to have here isn't enough. We need to roll this out at the dma-buf level,
> and enforce it.
>
> Enforce it = assert_lock_held
>
> Roll out = review everyone. Because this goes through dma-buf it'll come
> back through shmem helpers (and other helpers and other subsystems) back
> to any driver using vmap for gpu buffers. This includes the media
> subsystem, and the media subsystem definitely doesn't cope with just
> temporarily mapping buffers. So there we need to pin them, which I think
> means we'll need 2 version of dma_buf_vmap - one that's temporary and
> requires we hold dma_resv lock, the other requires that the buffer is
> pinned.

OR start to proper use the dma_buf_pin/dma_buf_unpin functions which I 
added to cover this use case as well.

Cheers,
Christian.

>
> That's what I meant with that this approach here is very sprawling :-/
> -Daniel
>
>>    */
>>   int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 5e6daa1c982f..7c34cd5ec261 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>>   	 * Returns a virtual address for the buffer. Used by the
>>   	 * drm_gem_dmabuf_vmap() helper.
>>   	 *
>> +	 * Notes to implementors:
>> +	 *
>> +	 * - Implementations must expect pairs of @vmap and @vunmap to be
>> +	 *   called frequently and should optimize for this case.
>> +	 *
>> +	 * - Implemenations may expect the caller to hold the GEM object's
>> +	 *   reservation lock to protect against concurrent calls and relocation
>> +	 *   of the GEM object.
>> +	 *
>> +	 * - Implementations may provide additional guarantees (e.g., working
>> +	 *   without holding the reservation lock).
>> +	 *
>>   	 * This callback is optional.
>> +	 *
>> +	 * See also drm_gem_dmabuf_vmap()
>>   	 */
>>   	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>>   
>> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>>   	 * drm_gem_dmabuf_vunmap() helper.
>>   	 *
>>   	 * This callback is optional.
>> +	 *
>> +	 * See also @vmap.
>>   	 */
>>   	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>>   
>> -- 
>> 2.29.2
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
