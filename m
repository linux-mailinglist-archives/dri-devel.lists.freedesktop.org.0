Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50087C65DF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E84310E158;
	Thu, 12 Oct 2023 06:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F371C10E158
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:49:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcRhC4D1g3VY55Ij2nI6a1OPENLt2wKtjjDu16WySuohqNBkx432ww8wUVJ01kSltH2Ww/cXZyFpqEme/2bLfQfVd2UH9rGPawS0ouPtjAT7SoF9Njg3he2JbpY1EwkgmxKVIPrCFy4OW84lD2TrCNb0zd7pbPCvuro5RIqu/eS7V3VHjpNWl5CDjJs5f7fiE8njEAqj57q2kCBgN5l3+v0OfMrYPAH4JZMJnZ0EdvH3PGnASa7xuAWvAm07gxctOi76okyZvviIJCWanrIPjIrDJ2rb/9Wsv22GoeMcdXMQADZ9RozJ/80//4VCLP4CKe0KkOSTlAhF3JP04ttb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0rcKqqRnLr3rgbHxWwdaXYBjoSWRTeCAVTBFXarmrM=;
 b=mp6sDFOorb9RVpUtdK0AGlntv5sSJ5C2swOHVgD9GHq6cSDtzo2MzDu+bEekdVsOHYCkcDaAr4cnvZSL7y88WRSl7t0YaHGTB2uGhJgZ/s/+wEFMOggB0EYKOm5/dTFDHVLLFZwGQxiBdNX9MMuk/NlKrMf1WvsZ9L7hRw7WQ1oPZp2bhC1a+yTcu/Zg5/Gv3I0cry3vsmVIvX00IgBFZ0i5GQWAwyL013gNGy5OxhrXH42iv7wIGVG0hFd99kX8SrdkoqOhHY6EhZkKG59o4gKSSGea3Ro+5foLeHIwIU5NpHU5sL4N+H9SZfyW82SIn80z0YsO1zBR4H/Dp3A0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0rcKqqRnLr3rgbHxWwdaXYBjoSWRTeCAVTBFXarmrM=;
 b=RtRNy4A2+OW7HoFbxOsXtNMhY2p5eTHSQJAnN7QPieB3Q65MiU3GohCQMwSRk5uNznnfSOQGilZPRyY2A+Df8AXe82eqkkbnCzqGIr6BULjxOxnOqq22O+AZXoG++6SrpWJ0hmp8eDZFUuhUOUFS0C+KMnsob9gxSiRoZb8Bvcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 06:48:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 06:48:59 +0000
Message-ID: <067ee7e8-6dc3-4e84-84fe-bc00e1193848@amd.com>
Date: Thu, 12 Oct 2023 08:48:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] dma-buf: Fix NULL pointer dereference in
 dma_fence_enable_sw_signaling()
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <ZSarP0/+hG8/87//@work> <202310110903.FE533CBCD@keescook>
 <0d63e8aa-5836-40e7-8f8a-2be10fbaac4a@embeddedor.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0d63e8aa-5836-40e7-8f8a-2be10fbaac4a@embeddedor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: fd69f58b-3cc5-43a7-09fa-08dbcaef4ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yz0x1Z0if7U3mtcZIZQyxZtyZUcOgRVjCBzGS9fLCxBw7P4O2gEI9wqKac0P9TEOXr7Yj//D4k64YMhq1oA6muds55a+4AhMCvy3bnEwNkh1FgLx1io+Z6n9aqNU8E+W5fNEP9rGPOH/rYyFVzsbEPGVWCp0zULTJJOGiZ8ahYMLeP6CwwS6xXfebgGoPw3IxICxUV1kB7Sz2OqOoD9dnjRgpTkajM2H8Wi29EGMCXTKhsvq20f6iw9yvXxUwdpp9AwbjBQ38nsShXp69aVI1axFEJBlo11Y1CXLboN3wA7lRW1sKC8pJwrfqigymFEt+vjnzXXBqu4LvzXH5kvq1PcBZqKpp/vTLoDNTmVjsN/1pc+EmycZqjw1MS29XyLyQEpsKnTBHwzhAr5NS1v7MFf943D1g4NNnYziENmaTIwE7rXaWi1TrsTpr6NgTw3ZHo3O2AQNT7RgYcE0GdWiD7GUf02uWs1Ezq1Oo/IW1sbQ3TqigNvcjESaSNs1d1PE83FP0lKGp4vbvix3Q7B/xdD6KaQQ08BIQkxQy0XQ/7n/zYVk3obiPo8Asak2opSV5QgOM+YzvNJyuIH1vZWKZzoS8aH++qM5e6EwLAthFIUwwJ1rIoDbBdVjU7IJ7y8uo9zMvyseW6adccmaTSYZZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6486002)(478600001)(38100700002)(6666004)(8936002)(66556008)(66476007)(54906003)(110136005)(316002)(7416002)(66946007)(2906002)(31696002)(41300700001)(8676002)(36756003)(5660300002)(4326008)(86362001)(26005)(6512007)(2616005)(83380400001)(31686004)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnNseFdSMVh4SU9vdng3cVB0eHcxdlVNREpySno2elEvVUloT2Frczk0bU1y?=
 =?utf-8?B?QVNHbUNKYUFCTGQyKzFDMEM4VkNGeEorOW1QK0ZRN0ZsRmtNRUlqd0UybFVY?=
 =?utf-8?B?aFdBV200bEJOZjB3bWg1NEV1eDlwTkwwcGM3QXQ1Mm0xOC9qZWQvTnBBMTgr?=
 =?utf-8?B?TjVjR0lZT1hqSGJDcGhGOVVNRkY4bVZpQTc5YXVydFBpSVpTV1Z6c3dpaEtK?=
 =?utf-8?B?Zit0eEkvdW5rMXJNYmo2aGdVajE5V3ptaUhBaFRXc1NXMk1JaGN0YVgrZGE5?=
 =?utf-8?B?b2h1SW9ncFp2dTQ3WnlNdkZObTlaSGJ6VEpYOVJyRFRhcVY4cjNYblpCMksx?=
 =?utf-8?B?NWliQzBpTjVrMkpxLzIzdy9Yd09FamJxREovK1liRWxYa2dmSGptR2RWRVZl?=
 =?utf-8?B?Z3EzZWdMZFgrdG1ReFhFUDBOOHZycDhLV0RZYVBOSDNWbjF1L3hwVVc4Sk1m?=
 =?utf-8?B?VFh6LzY4RmNyaTg0aTBNWVh0aVplU29yNkU5QzhrMWJnRnVWWnc0bW5OWEtW?=
 =?utf-8?B?MWhPdTU2VGFtMHZLRXNqZGc2TUpEZTZ3TUozRTlmZEdGcXpKUlBFMy8vZm1x?=
 =?utf-8?B?QThwdW1lT3lVZS95L0VhdkdrMFJYNDRPU1QzaFlnbXF1TkhqZk1SNXNtckxL?=
 =?utf-8?B?WGNCelNtUkczQ3dvZmtmSHVidEo5S1JVczBISldlanFBajZMYm1nMldZM1Ja?=
 =?utf-8?B?ZlRIbWF2bWpGWnQ5ZWFXU1RyajJGQWdDVHV0YkNPeVVFVFVndElaaHowaXhy?=
 =?utf-8?B?OS9zN0xDMjFmNlFORlNTMWFCbDhWU0RoZEsxWW4yT3VSK2JmbENNKzJwWnRi?=
 =?utf-8?B?Vmg0NXJRTld1a0ZzNk1nNml5Q1lKdU5mNlNsVVdyOWYrdzE1WkZaUkJlaEI5?=
 =?utf-8?B?ZkxmaWIzWWR5K0hsNDZ5Q1VLa2pDZk5Nc01LdDhmaWdYc2JXNndPRldGSTZK?=
 =?utf-8?B?a1dXSzR5cG1ablRseDhxN0d2TWQ4eGs5N1ltR0xqU1NKSkRicUxmNG9JQ3I1?=
 =?utf-8?B?RWpsa0NJWHhESUJKaWx4eUo1bVRtQ0s4MFpIWnd6dEZXUldpQm5mSGE1ZVc0?=
 =?utf-8?B?MGd6eHRLWkRFMGVjZzI5bCtYdjVRVVJ1NWZPWGN3ZjNyVnZONFZMdXMrREdz?=
 =?utf-8?B?dkFGb1JsWW8xVTBta1Q1MXQvaHJ1RENzYXVBcHhOaVYyejV3N0h1WThFS1J1?=
 =?utf-8?B?Y3M1QVNURHFJU2srQzRwUGtxbTZqU3Y0NThMMlk4Y0Y1Vlkxd05PQWQ4am5i?=
 =?utf-8?B?K21WdkdSK3NVNk12ZXFTL3A4MENuaElJME9YK3U3eEpXQWJTZUQxWUFzL0ZO?=
 =?utf-8?B?MVNURWZMaGI3QXFyUTg2S2ZkWURXQWhIMys2OE1Ob1dDODMwOTJjaGJ1LzZX?=
 =?utf-8?B?MEhFRFlsQW1EeDdLRFRTUHE2QnNidWxlZDA4SytkWC9nc0JUMWZ5dko0eXBH?=
 =?utf-8?B?RlZwU3huM0pxMjhwdWlxaE1TS3lLQUxMd212Skp0dlBhNzBndGw2RXdxM1Zp?=
 =?utf-8?B?VEJuY0t0SUczejBZMXE3cStNL1FRd0QvWTNsQ2pjUVV5eDQvSmkyZklUMWN6?=
 =?utf-8?B?dFhZSnk1bkZkRk1VNHdISm9iZS8zZUM5R0VXRitobE9vS0ZJQ3FaNXFXcW1N?=
 =?utf-8?B?bUVReDd6bHJtS2U3K3N4bkVMaGpjeHhBZlRGYWxCdmhWbnkxZmNNWklZZVZu?=
 =?utf-8?B?Slo1T092dzJTTk9zYWVBc0pKUHBIRm5hanoxWVlPSTRXdGNzVVl5cUpBaXVK?=
 =?utf-8?B?VkY3K3p5WVlaU2pCaGFzb2JBTnNpZ0IvZWU5U0d1TCtEL3Nqb1Y5dldxc1ZI?=
 =?utf-8?B?cldRaGROMjErTTAyejJ0dDJza1E5SlN1QTVhUG9ZS3Frd2UwZXFoQkM3clJx?=
 =?utf-8?B?ckl2S0RQQUxnb2U5UUxOaVQySFczOXJhemZkWmpHQmgwbTliUkJqWnRyU0d0?=
 =?utf-8?B?TWdFRXZ1aTVDbmR6akx6Y2lRV3dOQkdVays4SHJYajRUMHN6aWFxTkR5NnJ0?=
 =?utf-8?B?Vnh2YjB3eVlOU3Z2MkNPTmVOWHRDQlNOcGNQMUNLcFlKa3FaQTVsQnBUaTVX?=
 =?utf-8?B?c3JMUjJJVWJyR0VQbXNPV2FnMExjazk2WTRMODhWVGFXbVhHVGh3L1psdkdw?=
 =?utf-8?Q?qLeU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd69f58b-3cc5-43a7-09fa-08dbcaef4ff9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 06:48:59.2053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5H1w3RP/Cu4mytWgZq5HBboMKLluJOe0gPdqSfxkt3GO0U0Chk1OIeJr5SZKxA2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-hardening@vger.kernel.org, Arvind Yadav <Arvind.Yadav@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 11.10.23 um 18:13 schrieb Gustavo A. R. Silva:
>
>
> On 10/11/23 10:03, Kees Cook wrote:
>> On Wed, Oct 11, 2023 at 08:03:43AM -0600, Gustavo A. R. Silva wrote:
>>> Currently, a NULL pointer dereference will happen in function
>>> `dma_fence_enable_sw_signaling()` (at line 615), in case `chain`
>>> is not allocated in `mock_chain()` and this function returns
>>> `NULL` (at line 86). See below:
>>>
>>> drivers/dma-buf/st-dma-fence-chain.c:
>>>   86         chain = mock_chain(NULL, f, 1);
>>>   87         if (!chain)
>>>   88                 err = -ENOMEM;
>>>   89
>>>   90         dma_fence_enable_sw_signaling(chain);
>>
>> Instead of the larger patch, should line 88 here just do a "return
>> -ENOMEM" instead?
>
> Nope. I would have to add a `goto` to skip 
> `dma_fence_enable_sw_signaling(chain)`.
>
> I originally thought of that, but as other _signaling() functions have
> sanity-checks inside, I decided to go with that solution.
>
> This bug has been there since Sep 2022. So, adding a sanity check 
> inside that
> function should prevent any other issue of this same kind to enter the 
> codebase
> and stay there for years.

I'm trying to remove those sanity checks for years since they are hiding 
problems instead of getting them fixed.

Calling dma_fence_enable_sw_signaling with a NULL pointer is a coding 
error and not a recoverable runtime error.

The test case should be fixed instead.

Regards,
Christian.

>
> -- 
> Gustavo
>
>>
>> -Kees
>>
>>>
>>> drivers/dma-buf/dma-fence.c:
>>>   611 void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>>>   612 {
>>>   613         unsigned long flags;
>>>   614
>>>   615         spin_lock_irqsave(fence->lock, flags);
>>>                    ^^^^^^^^^^^
>>>                     |
>>>               NULL pointer reference
>>>               if fence == NULL
>>>
>>>   616         __dma_fence_enable_signaling(fence);
>>>   617         spin_unlock_irqrestore(fence->lock, flags);
>>>   618 }
>>>
>>> Fix this by adding a NULL check before dereferencing `fence` in
>>> `dma_fence_enable_sw_signaling()`. This will prevent any other NULL
>>> pointer dereference when the `fence` passed as an argument is `NULL`.
>>>
>>> Addresses-Coverity: ("Dereference after null check")
>>> Fixes: d62c43a953ce ("dma-buf: Enable signaling on fence for 
>>> selftests")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>> ---
>>>   drivers/dma-buf/dma-fence.c | 9 ++++++++-
>>>   include/linux/dma-fence.h   | 2 +-
>>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 8aa8f8cb7071..4d2f13560d0f 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -607,14 +607,21 @@ static bool 
>>> __dma_fence_enable_signaling(struct dma_fence *fence)
>>>    * This will request for sw signaling to be enabled, to make the 
>>> fence
>>>    * complete as soon as possible. This calls 
>>> &dma_fence_ops.enable_signaling
>>>    * internally.
>>> + *
>>> + * Returns 0 on success and a negative error value when @fence is 
>>> NULL.
>>>    */
>>> -void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>>> +int dma_fence_enable_sw_signaling(struct dma_fence *fence)
>>>   {
>>>       unsigned long flags;
>>>   +    if (!fence)
>>> +        return -EINVAL;
>>> +
>>>       spin_lock_irqsave(fence->lock, flags);
>>>       __dma_fence_enable_signaling(fence);
>>>       spin_unlock_irqrestore(fence->lock, flags);
>>> +
>>> +    return 0;
>>>   }
>>>   EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>>   diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index ebe78bd3d121..1e4025e925e6 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -399,7 +399,7 @@ int dma_fence_add_callback(struct dma_fence *fence,
>>>                  dma_fence_func_t func);
>>>   bool dma_fence_remove_callback(struct dma_fence *fence,
>>>                      struct dma_fence_cb *cb);
>>> -void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>>> +int dma_fence_enable_sw_signaling(struct dma_fence *fence);
>>>     /**
>>>    * dma_fence_is_signaled_locked - Return an indication if the fence
>>> -- 
>>> 2.34.1
>>>
>>>
>>

