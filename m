Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFD6CAF32
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 21:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0819010E744;
	Mon, 27 Mar 2023 19:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C13610E72E;
 Mon, 27 Mar 2023 19:53:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzC2FGniQ7gYks/YnreaUMCPAKzrqkxOZoVlet/0hqPR9YYqHPZLmR7XXVG9OzON0DOrXjUlNGZsw8E4fCGJ+F0lfn67UcVyq44WPREZPifPA1r+eo/5hA1L0KAiFSTuYFzNHwClTH65FfmxOIBJdqp2iFJp0RbpZx0p/pNrGJMi3ZfS2Mk0QxhwNyUuzoOLYRwBseTwMZcoq3kNuCJUcuqHMOkskwudVUAEAHRo8rUt+3RBwkH2gauBNmyhwaT0J+kSCq3mnA4swc22LOO6aehtAvQ4hhxiRlHnTJRQLxg6+r+bUo267WvD9lErd2QiuONJTYJ/mFTxzuy8R3yB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISVic8cyayu0IiXfokaRS+4jsl6rytuY2Y1tCC/URqg=;
 b=NkFY50cCQcdZ+i9jly/n6GIAv+2eJcMtDAFFs5hMvtuHxrzGFpdZNye/YQ9VbLmklEhlSyFcn9pNwYIBUMQJm3nKlSB2nKNhlBhhYx4OhMqNrpQNFR8mk3ZLgDFgcS3ZVS2zhzhTKsZ0ZqABy+0E2vXbY9oZpVuvWbHehKzLwDiwnvSTkLO1i37msiGqByo35B0QHqJLw7C0ZyVZJoD7vJtNI/NtectSfSWgt5V2t6yPstCcvI1xdcojrrrMIIPbN50PoUV/ExAy7ilCF64zl8b+kr+6uYwh7Yc9kGdbYp+j2ejm8Js31L3/6oaVBNwSiGu3uds7nPrfSPUPeAdgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISVic8cyayu0IiXfokaRS+4jsl6rytuY2Y1tCC/URqg=;
 b=XJiqOO0q9v3hnOoo8d0zCIGDoRCnWNfPWffUsBhDCSLZPnN9LuQiRP6SST+zM0rLRof5ocvvquffJflAIJZiecUx/84aDURAOQKFKfbEk3z5UfZG3Lzde3wnvbn1P1lVk+LzhkBPDagWxKclEWkgL29L5JwEFjVLPnUk1z8p4EY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB7626.namprd12.prod.outlook.com (2603:10b6:208:438::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 19:53:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6222.032; Mon, 27 Mar 2023
 19:53:46 +0000
Message-ID: <6f7e5632-9080-f032-269f-06c6d96f4d88@amd.com>
Date: Mon, 27 Mar 2023 21:53:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/nouveau: Fix bug in buffer relocs for Nouveau
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>,
 Tanmay Bhushan <007047221b@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <87r0taa8l3.fsf@jogness.linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87r0taa8l3.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e3ca65-2f15-45b5-b5cf-08db2efcf9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQPpe7kfeFsGnLnz1URe+hnPdWq3XsxldSu0kWw5AZnDjONIwx9C2tAZfMNWRa32kj4XGkfR8MQTqicZdaA3Lubs2WNztY1S7174IyftUSvm/YjlQ49cDw+MtWC0cUlpFeRG0PvD4H9FCaUEVwQedjdXPRtnRgQEaV5nHKu4/vRCVjZgaj8VssFycCkVCUCGBU+I386CiROcw+lFMBg7XmN87F54ZIOhkDCWn43rEJNUUnUFyLu+hGuGu4GZRdiFPO+ei1/F6m7izBx07YklcJOgX0ex1qNg5ZOX2fDcGX6DMulB/piK/BZ6yD3kyNnXb9fCRVfad/yZResNWxl5vEnq1k3uAbtMVaCrcejACYnPLawMl091BVstZy2B6nD4RJa+BrmlwVMQzhtlnZahgIqOSCaQ7LW0wIDpX1IeS2iMKyIVh0cBDHsZd38wPAA2rWsQQ/qskfhnzwJJD/HLN50fbTe7qFI5E/Y0ukJiWotUrQVTqP7GMBikA4boK+UytXytsaVHtoQxAuwwZrMgfX2CQVDhKs/TrFc0EedJBhr7f+JaYcakVo5vbYvGrQawe20Bwgx4JgjlXmqcDfoQ+xYI0h/i6UNn7G8evoVFeufuGnpWRvLr72EiU7cgWrc47JM8fCcn11bB28Rws3v6KGl3y1L0C3PRgElf2ucfkvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(921005)(38100700002)(36756003)(66946007)(31696002)(86362001)(66476007)(66556008)(8676002)(316002)(186003)(8936002)(7416002)(5660300002)(2616005)(41300700001)(6666004)(478600001)(6486002)(6512007)(31686004)(6506007)(110136005)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjRwVXh5YWdVWnpTOUxCaGpFS093aW1wQnVmMkxnK2V4ZW03bXIxbW10Q0tT?=
 =?utf-8?B?RmplUGlIU0JXT296V0hSampyOE1GQU5ZZE9mb1g2OVRTM2dzYkZBc2dMRm5G?=
 =?utf-8?B?cWhmOUhtdHZVM2hqbGtIa3E0UklSTjRRRkF4ZG5jTmRacGIrTWlMemprcmNj?=
 =?utf-8?B?cW1taS9QNFZVSjd5TE8yeVh5RklIMnowd011QWF5anU0emVUMmR0cTlYeDVS?=
 =?utf-8?B?UkwrWXpXdHpGemRpLzdmaFZvWGU1YnVNU2YranpPVTlDQzBPNjJ3NVJpUGhs?=
 =?utf-8?B?emdDemtsQXlxYWJBQTZOZTBad21Md3lua2xPTHJoUXBtelNqaEYzdVpHTHBB?=
 =?utf-8?B?dHdrM0FNZC9ZVnk3elQ4d3VaR2lwVmpsd2F6TmJzTCtscjNHK2U1a0hGNVp3?=
 =?utf-8?B?a3JXa0JaS0NPdnBJUnFnUDNMVncrb3BlNkRMYXJORlo0bkxPZnd5QmQxNlJz?=
 =?utf-8?B?cVNjSlNMVWdkMW1PUzNhTlJ5aFpHeXk5TCtXTFdBdGg1eHZqWjJNTXBCZ3Zn?=
 =?utf-8?B?MDl1UG5mVWxDUmgxUzc1V0pOSnE1S0NJUU52REcxaTJ2SHpySmJ1RWFrSG1o?=
 =?utf-8?B?Y2VocWxoYWcvbUR4dDcwaTdKcEgrZlc3VzFwcmdiV05HVGJuMGdZZktoNUpH?=
 =?utf-8?B?RzQxUXczMkZIRjBrU3RmNmQ3MDBYY05ieXI0RkYyUGJDS3JpbVR1WDlMamtV?=
 =?utf-8?B?ZGRvdnYvRUM3YWRLMFlzcXJrZldTcFJFdVlHQjdJb3pSL0htNkdBTWpUTkps?=
 =?utf-8?B?UGdnb25SNkpVZG5uVG11UU5hUWx1YktpRWxXRU02SVcvb2tYU2J1YTN1WVFN?=
 =?utf-8?B?MWJOMzBtQ3BpS0xLSlBmZVBlZDJDeDIxcENlN2pYblNGdVdTQnB1UTVzaVdq?=
 =?utf-8?B?MVFuMHgwTHVhUWZOd0FxLzF2M211eE1yZlg4ZitLZC9sbFJxQnI4WnkyNnlt?=
 =?utf-8?B?R1RNaTRQaDQySjZMTHplMlJySm1UbGRPRU1ZTEorQlVHQ1ovR0NGSlhXSlM0?=
 =?utf-8?B?U3JOOG54MEMxbVkvWjFFV2plcE03bG5vSEhJUlF6N3pkdVdackN4eml6ZE9h?=
 =?utf-8?B?SGM5N2E1NmEzd1NMMHd6Zk4wbkd1ckxTSGNtYzBxeVpQTEI5ZVlZWlkrSkNI?=
 =?utf-8?B?NnBpd2pOTDBqZXpCVXVVUUxJcE9MWDZIdU5BU0pheEZGSHcyL3pPM05XdWx4?=
 =?utf-8?B?L1RLUXd2RHJvZTcrcTkwcjljcG56ZDYrN2xaS213R0lUNFhrY0U5TnFwbk82?=
 =?utf-8?B?T0RCWnZoVHFBeVl5Wmxya2JsaXlROFVRSHRmTDdkOUVBbWRWU1pBMVNDN0l3?=
 =?utf-8?B?Y0V4YmF2NHNteVBzTlpQelgzcUpQMXlFY1FwNk5EdHdMdWV6N2dNYUZ0b0lh?=
 =?utf-8?B?a2Z0bEhJRC9saDE2MDl3SlhvZnV5cWM5U0tRelI1aUNXb3JseW85VVdrTVFK?=
 =?utf-8?B?VllxNlJyOEVRaEY4SHQ0SUoxT0EyU2FZenBZYUMxbHVtbndvdFoyNzNkVU9L?=
 =?utf-8?B?RVkrV2JtRGY0aFJvS2hWckpYR2pieko0YUFocEVKazFvdzk3RngyaHgwbDdq?=
 =?utf-8?B?ZjIzVU1XdEhMZ2FQUkxxM0FYeXZzNlBSOHgvaU56Zy9BSUhZSzVWelFleWlY?=
 =?utf-8?B?a0Nic2xPOVAwYzJzazc3ODNYYjlsWVM0aXZWZzBBWVY2YytNcGl6QVFDQlRx?=
 =?utf-8?B?cWVvU0hWV1JnSG1SVG1FM0NSVGhpTXFLeUxnUWNyK29PakdHZnlhWndPUzBT?=
 =?utf-8?B?akVzOVBrbTZmTm9CSkI3dXdYeWJuOTk1SGtmNmVucFl6UTJPeTNJY3I2SGQ5?=
 =?utf-8?B?cTRMSWF2WDRkTnNZY21wOUtXWk1vQVJDaTU4bmRoZUE0RGlNLzR4ak9KSTRI?=
 =?utf-8?B?QS9IelBWMzJNSnNFWm56bEN5T2trSWdDeFBhZW95eldiS1E4ekhpY1h1SlRr?=
 =?utf-8?B?NUdYVzdpaFQrQThEbUV3TFA0cUFGLzFLNEU5UEZ3Y2VTNGgvNmh0SG1kN3N5?=
 =?utf-8?B?WmJPZ1dVRjhTMlJncFNNTCtGUTFHVzZ2TmdJWjNCZWF1cE1aenUzYlEvWXUy?=
 =?utf-8?B?RzVuY3F0NUQydmQ1VWNaWUJxak4zN0lvUzBYa0hVWkNEcXE2bHRhckVzbUNT?=
 =?utf-8?B?VXcwUDB0WlhDRTZtNFY3MUQ2S3VUSzBFWHZGZFdrRWlCNDhua3J5NUFvTHBR?=
 =?utf-8?Q?JOkzuyL6GLGLDlOz5RZZM4GwC5AGhSZdY9JJYTNYDtoR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e3ca65-2f15-45b5-b5cf-08db2efcf9b2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 19:53:46.1199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +R8IXgHH7vNGltrRi3m1C+a3lXlMYxfGRGIMrUmmrXzrJ4ChP4Tlz1rWrfqAQx48
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7626
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

Am 27.03.23 um 10:42 schrieb John Ogness:
> On 2023-01-19, Tanmay Bhushan <007047221b@gmail.com> wrote:
>> dma_resv_wait_timeout returns greater than zero on success
>> as opposed to ttm_bo_wait_ctx. As a result of that relocs
>> will fail and give failure even when it was a success.
> Today I switched my workstation from 6.2 to 6.3-rc3 and started seeing
> lots of new kernel messages:
>
> [  642.138313][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc wait_idle failed: 1500
> [  642.138389][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc apply: 1500
> [  646.123490][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc wait_idle failed: 1500
> [  646.123573][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc apply: 1500
>
> The graphics seemed to go slower or hang a bit when these messages would
> appear. I then found your patch! However, I have some comments about it.
>
> First, it should include a fixes tag:
>
> Fixes: 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")
>
>> Signed-off-by: Tanmay Bhushan <007047221b@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_gem.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index f77e44958037..0e3690459144 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -706,9 +706,8 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>>   		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
>>   					    DMA_RESV_USAGE_BOOKKEEP,
>>   					    false, 15 * HZ);
>> -		if (ret == 0)
>> +		if (ret <= 0) {
>>   			ret = -EBUSY;
> This is incorrect for 2 reasons:
>
> * it treats restarts as timeouts
>
> * this function now returns >0 on success
>
>> -		if (ret) {
>>   			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
>>   				  ret);
>>   			break;
> I rearranged things to basically correctly translate the return code of
> dma_resv_wait_timeout() to match the previous ttm_bo_wait():
>
> 		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
> 					    DMA_RESV_USAGE_BOOKKEEP,
> 					    false, 15 * HZ);
> 		if (ret == 0)
> 			ret = -EBUSY;
> 		if (ret > 0)
> 			ret = 0;
> 		if (ret) {
> 			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
> 				  ret);
> 			break;
> 		}
>
> So the patch just becomes:
>
> @@ -708,6 +708,8 @@ nouveau_gem_pushbuf_reloc_apply(struct n
>   					    false, 15 * HZ);
>   		if (ret == 0)
>   			ret = -EBUSY;
> +		if (ret > 0)
> +			ret = 0;
>   		if (ret) {
>   			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
>   				  ret);
>
> With this variant, everything runs correctly on my workstation again.
>
> It probably deserves a comment about why @ret is being translated. Or
> perhaps a new variable should be introduced to separate the return value
> of dma_resv_wait_timeout() from the return value of this function.

I'm going to take a look tomorrow, but your code already looks pretty 
correct to me.

And sorry for the noise, missed the different in the conversion.

Thanks,
Christian.

>
> Either way, this is an important fix for 6.3-rc!
>
> John Ogness

