Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426F6CDA34
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C2B10E4BA;
	Wed, 29 Mar 2023 13:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBA110E4BA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtwBIoX2D37DW5Sgi9wRDnqb7Vo+MygWpODxSGx1FaBispKJ+VZyYIQxifJ1ehuX4oWUdQFi9YuFk4KCyC+b3UsRrUL27Sq56m3WBiRns3BwyaleqvT0kERGBnzKwhgY9kfRLaRf7zHONtPA6SENWQwPz83BC4yW3Mr7AEijRKeTgyIHSCjI4UlNSGyHPOBlvYmyFItq5+NXsFP9cT6CpdSvmjMjkBCabhTFiZuTlI2qQoOYj6lfTW+wcvrbmqfxysBB8M4pTdgwigYhx0FLgKjeDrkam9aaDgmBC8z+xfjmKH8ps2qlBV30riob4V+compnvjVptNLcyPEvlpEczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9OtoTMLsupxOVOe+8qQ1XONW9dnyYnvy0nSOknJ7PQ=;
 b=m39QKEcRWIC/xe+/3ca8lHy9LdJIllTjde9oiGekADvgvxVT4ma0zFZKnN/DH3mVLFFbk7G5VrIpT8BuK4K1ZIJTO3Tmy2OcKqYJi7GqGJ24lsJrADFUIW/1jnmuXS9SkB3qD3TsX0ii+a7raacbEfIg8Jd5FNZmbZFXZYPP1qKfY+QPQVpHePvM3hi/uXo6enfzOa5L6n8B6JtkT0Xqn7KN4Bn/xex+iFfgdH9WH6kOUU6oJUGzINmUJRo/NZ4KeLkcUf7FH/RzuhgmYz+y+Et4YTH45mfhHskW6En8P+DHn/7M3ssBZbDr/zJTvWkuzEwVeLu/FJyZYmlXX+7FKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9OtoTMLsupxOVOe+8qQ1XONW9dnyYnvy0nSOknJ7PQ=;
 b=fHK9JrS4y6FT85AmasS/Gt37alUombJd6GGl64dhMSU6YwIZcqA3hiFcay4Y2BtOAwKIJDALC7q/rME3f6P1T1UAV5v9gPJoTRpRkqkc8vKFrBu48t1C7DAuydpdgZMW/4dKWrWGe3JM5s9XU24ewmSRcU1wQFKpqk6ocM6F/Gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5392.namprd12.prod.outlook.com (2603:10b6:5:39f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 13:15:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6222.032; Wed, 29 Mar 2023
 13:15:02 +0000
Message-ID: <a1a57732-6b1c-5572-e59f-ca5e33c5a323@amd.com>
Date: Wed, 29 Mar 2023 15:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drm: test: Fix 32-bit issue in drm_buddy_test
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Lu=c3=ads_Mendes?= <luis.p.mendes@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20230329065532.2122295-1-davidgow@google.com>
 <20230329065532.2122295-2-davidgow@google.com>
 <ceb0b1e8-6c7a-8564-156f-fcf0f0e4a95e@igalia.com> <87fs9n4x02.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87fs9n4x02.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: e6dffee3-e5e4-48d2-59fe-08db30579b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /oCntLyk0U5JsAGCVrmrUIsafujDRsUb8+yilF3hjQuTDOrUrqElk5w74uYmRxCwhraWrzoG3d06HdLG2192f5QQ+o293cGWAneW5Aq5sT+K1WDVhO+fPEnSP6fK30oA04g5oFyNPnzCmqYzsDTFJI/YtZR5aucPeKnN+iok+Jxi28W8qcsNCGOAJKG1SWR++Jgvph9Qbdij8O2zY9bMuFoIXxdsAtwlePwbu99NkwE269QQdE0BI69LbZDFKJleDSazpo0fmQgUFKA2FBghuPNWOBZ9TRc6LqiGTwuLtFJu83LNiqpzeAA30/H+9iPyw/4XG/EFI7mKYHPL4T9L+GD/N7xJ1Xr0dt02w09JE8eU6dGXyHLQEo/Oi1u6KV4VKSOXtgfUNPmUCg1AvFN97lt/4ZQPEyOggmD8h4jURXhjKGceqTrTLcghcw7F7hayw4JcuTSHUna/jGcWrZLPDeADHS4DrTyNkopRZjHxJ+XOdzraX7gRw8hWn7uixdLonii9fzxOgOv9cj5yJOEQo8RKsAb4Y2sQBjNNbffvyNPNsyvD4auUTNFVngWcgAj9U9yZSiLpE7voeahBSAx0MlwTh0qNnac2pErf+62tKoICkgIc8u4rYHx/HdWUtTck
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(316002)(6666004)(478600001)(31686004)(2906002)(66899021)(6486002)(38100700002)(6512007)(6506007)(966005)(53546011)(186003)(66946007)(66556008)(110136005)(2616005)(66476007)(921005)(83380400001)(66574015)(8676002)(4326008)(41300700001)(8936002)(7416002)(5660300002)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0s2RHhDdHZEcHQ0NVQrTVVWbjgwOHdHYXY3YUUyOTJmbkQ5NVFHekZxMFBH?=
 =?utf-8?B?ZWxpb2M0ZmNMcTF2L0hvYyt1cDBOZzlWRzUyMlZiSGEvNHVwQVovNVhXMVN2?=
 =?utf-8?B?YmpUTGVTdXJiVmdORzJVNjQ5QURvUmVpS0FvVERyQU05NEZlaGVmazlrK1ZO?=
 =?utf-8?B?bUk3V0R2QTE1WThmcXN6K0JSQmFJWDVxZmd0TW8zSFc2TW8zNXM5dWx1czNT?=
 =?utf-8?B?NzhaQm9tVFZCVnA4dHh3WXJaZWhXalViVlQzdFlvV04vTW10QWhjM2NnVGQw?=
 =?utf-8?B?SVI3ejIwbEYwQXZXeXlqc0NJb1JvV0RIeGo2aXlzcmhxQ2JKYWJ1ZVpTVTht?=
 =?utf-8?B?NENQSFU1V2p0UmprNkVtTTBKaCs3MVVaNmlJRGRpNG5RcWFUaTFlamR2VFI5?=
 =?utf-8?B?eUlTaGZBbWY1b05ubm51MjExY2FDa2NCbVhUczRYdDBrUzlTQ3JQOXFiUHpB?=
 =?utf-8?B?ODVUa3dKZCt6a1lqeEZFYzh2UjV1N3hjWlFXMnRYZ0FaanF3NWdSSmtpcS9z?=
 =?utf-8?B?WEgzc0tsTFE1QVpzRkxDeUx5VFBsMnVhT25EQ1VrMWsrRFRLOGN4ZHozQVVP?=
 =?utf-8?B?VDRndzRuM0xmWDNsT052bkxwUDlOdjk0Nk42TzI4cnp3NW1kZWdpK0xMUWZm?=
 =?utf-8?B?a2lxRkZvQzNnRHJhQ1ErOWljWDVTWUhQKzFGTU9hWDZrdWZQeWxBazhtbEpt?=
 =?utf-8?B?MmFkeU1QbHRZVUFxUEM3bURJYVRZbkhuZForWEJsSlhFZjZ1dEVIb2tiU3cv?=
 =?utf-8?B?RUp1dmJQcXVTWS9EMGNnODZWSmgzbUxFSys0ZU9nTGM1bjB4eUZreVh5V1Qr?=
 =?utf-8?B?YnozNWhhL1E4V3JSWVhkbVVjZGxRQUZpZFRwSUx5eURBeEFMTWFNbHMvWXpa?=
 =?utf-8?B?SVFwcXQ2Z2Vham45eHFHMkUyUjlIckNDTnlORW1BQ0JmaTBTQmRaeG83UjQx?=
 =?utf-8?B?WGpOY1NjaVd0OU8rWTcyNUs2Zm9yODNRb2JrVk1NQ1hwcDVBRjNsa09XVW4y?=
 =?utf-8?B?YnFnV0lrU0VJbFpnL25udGhLL2JNNVRFTlhVUndKSmIrL2NLS2t0TXFuaEc1?=
 =?utf-8?B?cnRSbi9qSU1jNE8rSHFCdFRDMWQ4ZXh2S0Y4ZThoOEJCOU9hUXpyRDlqMUw2?=
 =?utf-8?B?WVM1UDRkV1BidVdXNENFdVdsYlQ0bzZWS1V1SWFlaHV0K2Y3T0I2aFVJZ0FF?=
 =?utf-8?B?Q0VGalYvZ1FIUlh6bUNhVXVkVWhNMWl0cmpBQnI3QkdISGlUcWkyZStia2Nz?=
 =?utf-8?B?OEpDSUJWOWg5ZHcvdHRKWE1Hanc0K3NtZDh2NGg3cVRrZ0pWSnZVZEoyeXNp?=
 =?utf-8?B?ME9SckZTVk9BVnprRFM0NEdpd0loaHBLMENPNEt1d0NPdkxEVXY1OGZBckQ4?=
 =?utf-8?B?dEtoNEtYeDJDZzVQUTU4c3pCNXIvWTRiNVNqNXp3RzRXYzQyM3pUUmdwNTFW?=
 =?utf-8?B?OUk0b0UwUDBxazNIejVmdTlqUURMbzRqQ01waUhDUzJJNEpjWTVlUit5WUVk?=
 =?utf-8?B?bW1tOTg4L25XUmVwYWhhNkpEa1lJbTYxS2ppakRjZ3pPNEM2NnlwVTZXbHFs?=
 =?utf-8?B?U2hUMFpsSFVZVlFRalRTdUFmUnVYV3ArcmZBYWFpUDlZa3VKSHBwNWkzcWdI?=
 =?utf-8?B?b3FyWnhVcjFmaTNzWHJhNEtBemwzcVZMWW1WU3QvVkFnM3FiZDBrbVlMQ0NS?=
 =?utf-8?B?Sjk4ZDB6ak42SGxVc1dwV3Y3c2owOUxrYmcxZ24zdWRZcXM4aGpxa1h3TmNY?=
 =?utf-8?B?NjdrSXJ5UlJ5NUpqdnIxdTYyaHBWWTJma2paREdxVHV3UVRaU2FHcEtXSGhz?=
 =?utf-8?B?Qm1kUWZ1ZnZDc3VISE5mZjlrelg4dkluenZ1UzVDbVlMSG04WTdYSThSdU9q?=
 =?utf-8?B?Kzlsbk9TL1p5WWI5eE00TlF6QmRvZnNFd0lodVgvRlo0MXJqejhpWGNITUR5?=
 =?utf-8?B?U0RTVGkramVnR283SWtiUGFTaDdkVVV5ZDVJNDVOOUlJMzdydTFVSFhPZWdi?=
 =?utf-8?B?YVV0OVFMQitJZTRBejBFeldFbnNuOVBNNlpyUTBJSWZNUEdVMUZpUE03M05k?=
 =?utf-8?B?U1oxODM5WTBMenQ3bmpIZ29KQXVkaW95UU8rbzJmMG1YNldzaUhib2xWcUN0?=
 =?utf-8?B?VDdLZy9FYlhWMStPTDh1UmdkSkU5YnpncHZRelFtNlB3eHVlMDRUaG9WMWtF?=
 =?utf-8?Q?nBr+3j8suCxVdWIdMsE1RvhPmBD+6RcOHQKxZyaGKJpt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dffee3-e5e4-48d2-59fe-08db30579b18
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:15:02.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9B824B9nyLHQmaMYzg8ULXDg9QeL5RvvM/gaoPRje+MxLb7+F/wzHeHht1YG3wB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5392
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.23 um 13:28 schrieb Jani Nikula:
> On Wed, 29 Mar 2023, Maíra Canal <mcanal@igalia.com> wrote:
>> On 3/29/23 03:55, David Gow wrote:
>>> The drm_buddy_test KUnit tests verify that returned blocks have sizes
>>> which are powers of two using is_power_of_2(). However, is_power_of_2()
>>> operations on a 'long', but the block size is a u64. So on systems where
>>> long is 32-bit, this can sometimes fail even on correctly sized blocks.
>>>
>>> This only reproduces randomly, as the parameters passed to the buddy
>>> allocator in this test are random. The seed 0xb2e06022 reproduced it
>>> fine here.
>>>
>>> For now, just hardcode an is_power_of_2() implementation using
>>> x & (x - 1).
>>>
>>> Signed-off-by: David Gow <davidgow@google.com>
>> As we still didn't consolidate an implementation of is_power_of_2_u64(),
> I just cooked up some patches to try to make is_power_of_2() more
> flexible. I only sent them to the "CI trybot" for a quick spin first,
> will post to lkml later. [1]

In the meantime I'm pushing this to drm-misc-fixes unless somebody has 
some last second objections.

Christian.

>
> BR,
> Jani.
>
>
> [1] https://patchwork.freedesktop.org/series/115785/
>
>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>
>> Best Regards,
>> - Maíra Canal
>>
>>> ---
>>>
>>> There are actually a couple of is_power_of_2_u64() implementations
>>> already around in:
>>> - drivers/gpu/drm/i915/i915_utils.h
>>> - fs/btrfs/misc.h (called is_power_of_two_u64)
>>>
>>> So the ideal thing would be to consolidate these in one place.
>>>
>>>
>>> ---
>>>    drivers/gpu/drm/tests/drm_buddy_test.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
>>> index f8ee714df396..09ee6f6af896 100644
>>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>>> @@ -89,7 +89,8 @@ static int check_block(struct kunit *test, struct drm_buddy *mm,
>>>    		err = -EINVAL;
>>>    	}
>>>    
>>> -	if (!is_power_of_2(block_size)) {
>>> +	/* We can't use is_power_of_2() for a u64 on 32-bit systems. */
>>> +	if (block_size & (block_size - 1)) {
>>>    		kunit_err(test, "block size not power of two\n");
>>>    		err = -EINVAL;
>>>    	}

