Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AC67CB0B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D29C10E8E2;
	Thu, 26 Jan 2023 12:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECE810E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7m5VlGQ6VuRQn1yHNmyuwysfcX3inou1BSyeq3lwl6auleW6+8CDgO72JxKONNCGSb+8HsHNCk/6fyM7n9a3hue9O5ETqYOi8o1wwBx4dqZGPqaiof8Y/Pdn67MtkqaOZcb635qLiNV9LFTS9Vgis5172ZfFtEyrje29o1ctVFH7kZadH5XBQ/vLw5+ZdPjuEvK9AEQ3sNRwhqjnNM4QJ4ceaMbvvvi0zHj+6glYbnFI8flK6ElgU+Y1nm/5op18fY+M5QsmM1tkYsrNrI+RyuDjgqvYzbwro2wKXolBDBecP/p+4dtV+xxpSQ1LmlMWWtntWfJuW/JT1wD0TWKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3+RuiyNocPtr14COYnNaiN5O8MztP9m/+yhU7KOz+4=;
 b=kK8FhDHq3JWrTJY0wVggh6vXjCYAyRzEYUYy74kZSEUhduXs0xaO1QGPf05IBIhbGUZuwhWdonFb54/Tqfkl9DYy5L4Jt7te0OGm3twIBF+7KonLWdbYQspOc7TShaumIHHkb21/xg9c+wjIUyg63hMap1pj8FL9g6OqEPFnhWm/97qUPtKQXfMVg/mTxRSZYhQ8CPTrXkB9dZwRJGkOQOsSjH5fSYw1u5s0q9Rt2FiGN3IliEXeGc4ssudUrBEEaebjYRISGHBKo1Ak0EPBNhCTw5qK4jF5jTmDEpv5VZv3K0xo1nNZ10FPoPleyEQ7bw8mppQcXETtHgvvhJUg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3+RuiyNocPtr14COYnNaiN5O8MztP9m/+yhU7KOz+4=;
 b=dwKyxWmEds/0/BNbA49+snyfIHAcTmOvcktt1W1YIbattZOxtiAxZvecBnl8+/adjQ+QPdkWHkBkTHBuQS10Uymhc+hcFTIs+ncGPSZ+/JByPiPx+zRQEzwnjnEUJklEdIH9fLALYU0MQI0sfKg3mIYgOkXtc9nFzbfKYge00PI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4560.namprd12.prod.outlook.com (2603:10b6:806:97::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 12:45:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Thu, 26 Jan 2023
 12:45:10 +0000
Message-ID: <d0401ae6-b38e-19ff-b681-945db1c36c95@amd.com>
Date: Thu, 26 Jan 2023 13:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <817fcd6b-4823-6fcd-ea5b-8068a261a3bf@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <817fcd6b-4823-6fcd-ea5b-8068a261a3bf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: 5792048e-fded-4719-ba38-08daff9b28ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uOddix7Zjj5RjY6sQgJ7hGbByVg9O3Q3bU/qcT3KtHVZ3a6Tdw8tGl/MgkH0jolj1Sl1LPaihdpf0IVPf4VhoZbMMsvFZJUGG4JSE4VXmGSqmU0n/WmP6y1P4/cs+TmygoLhhT869YLOhp1e7h8zwzvI6OEnhlr4CFyfC3M7pIKBqVJ5fTi06yjn6XdbFBmh3S4oWqDUwl3EE+86WK1OqY/ueXyEuzJPDTgTfwJKLaanOR7q0IbIEwmiK9oInWdnSiwnEs9weh3LhGe5OAMDFqOAgQZmVa8v/UP+ytQo3w8tgLeCQIqeVzKKNncANJP0fy+C4ayl9ryYtpfWxwXsECWJyPLUcublPDMl+OZ+PR1XETjmbRNHel5CN+FDxBQ2/0qlLUvi4u1V/g5mw9Dyi+kmNlQSev0vJkYfKGAopHIfXdcN0O2gTB2WbXlujy2uXtsOplNlCTrtj01LJzqm50BcURdf7C3rOfiBDqzljxMynlGNamQBouFF5015t7q9npYgaim38b9kki4r4iZeG05TgzM2/XMfuNKBRDUFS8DNBBpz+Mj6H8GdkM10EjtpauLjiDUlJm4tfIWSogk8gaekUBzy9Nv3SqCwhM4GHrc1Cj47P7s1DlNGWPVfkiq5HNru56n85qmY4NKVxlTzcnQ7hF1TT5RtcwIsc+XJbrNW1d0eP4hA5I9civksFnR52I5k4rzesHRTwxEPZZdwTeC/f4jbzYw99Fu04A3JW8MLcSi1MnlNCP1fdO4eFXD7ASmiyO7pjz4C6guBLXXswTOxvVaEHSy95JZ56dsI1E3AU7O8JiHjsNWVoSdVaFmd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199018)(31696002)(36756003)(8676002)(316002)(54906003)(478600001)(6666004)(6636002)(6506007)(53546011)(6486002)(5660300002)(2906002)(4326008)(66556008)(66476007)(66946007)(8936002)(41300700001)(38100700002)(26005)(6512007)(2616005)(83380400001)(86362001)(966005)(186003)(110136005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnN1ZmNPbXpudWE0aktxcHh1MHNUMk5KUHBsUWtoU3dmWjN1eGlLSzJGZ2Rr?=
 =?utf-8?B?ekxERkxMb2lzZFVJTGp5SW5YS3JhR080dUoxZmFTZWRRTXhWb1UxN1JxWlZB?=
 =?utf-8?B?eS96ZWpCbnEzenBBbVFPL0xJUHNGRzNpZndBTnM2UGRib2hCelRUdG5YeWxV?=
 =?utf-8?B?dU5ERGF5L1ZXREo1WlF2VEtvK3ZuOFdCSVQ3RVQ1aUd6YXhicHN6anljcXps?=
 =?utf-8?B?VC9FYjR4OU9PSmxtdXJlZUdxRko5UFFZbDJENDExUFREVkw0amIzK0JFTkxo?=
 =?utf-8?B?MkNHWTdIZGRrNFd1WTNKTlJtYlpUQmxoNFo5NzU1MlUyTXJEM2lLS3pBSEdm?=
 =?utf-8?B?N1RxMEFxMEVUcDNPWjVFVWVMOEd2cTFDM3Bqc0hkQ1h3VGJzMWZESFNIeUNz?=
 =?utf-8?B?cVFjNXJicGlRK1RkRi9Gc0xjNkNVSFVaM1FCOE9CdlFDTEZxTFM3eWNQaitT?=
 =?utf-8?B?YnE2K0tMMW9tdXpoa3NQSHEwb0xiVW05OXJQM3g0dGNNZ0R6VkZ2TVJKajd5?=
 =?utf-8?B?VVlvMlRSQkc3SFY4WjNud1hLWlkyejZ5cTI2Y0hNOWFjL2dEaGxVM2N6YnFZ?=
 =?utf-8?B?Sk85NjN1VCtFQU5mQW1xUURFV1UrOU5uRUlyR1hQSTNtODF2eFBsMW53cFdn?=
 =?utf-8?B?VWJZdGEwTEF3QTlyM29odjBFS2hvenVHanYzcjNoV2ZlZlJobFFlWVNDZXpE?=
 =?utf-8?B?TWF2V2VoTGtmcy9CRXZkK1NzZ2dHRzNiWEtycWJZQnZHdVpVWXoweG5mMG13?=
 =?utf-8?B?Q0VVZWRaUkRoZk1WeHRISFJGOWFzaDNiNlNNRlBGRUx3TXZjRXBUdW0xZU9s?=
 =?utf-8?B?WmprTmx4MmlYYTJEMVRPeXNzOTRtdWFYSXNPck5POGRlVjgzV0U0Wm42YXJ1?=
 =?utf-8?B?YkxSenQwbUhIQlp6cFBpNmNrZGg2VnJjS0IvWEpHeW43SUl5MHl3YTI3djRn?=
 =?utf-8?B?ZHNHOXplb1RyOHdZdDJuTXdjUkpkMmtwN2EvcEZza3JYQ3JRVWhXV1JQUHVp?=
 =?utf-8?B?bVI5RnhRSVZhZ3dMWnRSaGV3NzZIZE9FRXNFbE83aExQUS9ucEJWeHhWMk1R?=
 =?utf-8?B?K1pQczJrQmE4SUF5TnVNRnBoVFBGZkFJSlB3U2hYOGJPYytRVFgzNXJHR0NN?=
 =?utf-8?B?dWMvQzQwR21LeWFTbko1WXFJa0h4TkFVejlvc1hycTZsdGFzd0RlVGdHVVFY?=
 =?utf-8?B?TmxnSEpqVDlmVWR6d0V4UW0rdE1wTEQ1RzRvd0R6NjRXUitTRnF6ZWR4ODZ6?=
 =?utf-8?B?a2M3WkZaTEJJZm9CZTdScnNWYXF5Yk1TSDRQZHRHaXQ0cGc5OFJMSFh6Smp1?=
 =?utf-8?B?RVQyb2swaXdzdmdsdFVqUlRzTis1Vnlod0RMS1N0ZnZqRGloVWFDZGtvOVJJ?=
 =?utf-8?B?N3RMTjl0YmQvdm84NW1xN2ZPc09paE4xalczZ1F0dStjZW55MThXTDBkUCtD?=
 =?utf-8?B?dzBEMFpWdlBueFBKZ3JhNExFTE02bWhlWHFxSi84bStHOTM3MUptc2hLZE1p?=
 =?utf-8?B?b2IzR3RqbndhQ2FZOFRzdGZCUzlXeTBvelhqWHZRbkNLKy9iaWd5VHlrZTdq?=
 =?utf-8?B?ZkdFejQwUTF6RHRndlp4RHNoaFBtNWdESVhFVXMvSUR2eURhM3lqYzhnTHV4?=
 =?utf-8?B?a3ZLdjkzQTRYdFR5Vkl1U1RCZURkWkw0dzlFM1lPeGRrUkI3MC93YmtOMGlZ?=
 =?utf-8?B?NEo4dlpJVVlVTmJTdmRPcWU2U3BHUUlzMkVLSzNwM1NydmNiby9EQWZxNlM2?=
 =?utf-8?B?QVM4WFRHU05ZbkMzY0hzcERUY0RQM24xN21USld2UDVsdEFsL0plTm1vZy9q?=
 =?utf-8?B?SHZHekc0cXNvRm1GVVVaWXhWZmdiL3BsVy8zdWFMaWtMMUg5SG11TUg4NHNZ?=
 =?utf-8?B?R09qamhIU0FqdFBFTDJ2UDNLY0ZyUlBXSFJzaUhqd3lKK0tYSUd1S1BHTUJM?=
 =?utf-8?B?cUNWREY1cEFQZXdGSUNES0Y5eEYyK3VDVDhQdmw3akRoeFdUMU9yR2ZDb3B4?=
 =?utf-8?B?bnBoRU9qMm9wQXc0c2FlNDNrMlFhN0YrZDVLeE14MksvamVOQlJCbDhiSmcr?=
 =?utf-8?B?dmVPYlJFNUNUOE1KOXQrOU8vN0Y2RXBUaUErb1QvTTBIR3oxZ1hOVEsyYXEv?=
 =?utf-8?Q?qTum53HhAe5b0fGgmLSTd/Yfd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5792048e-fded-4719-ba38-08daff9b28ee
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 12:45:10.2625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTOGGx9e+l1+YNKaqKiVJL31y1/8cJycuasaeRQFFhL3rnrON15SL3LxuUFUeuda
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4560
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.01.23 um 13:40 schrieb Thomas Zimmermann:
> Hi
>
> Am 26.01.23 um 10:49 schrieb Slivka, Danijel:
>> [AMD Official Use Only - General]
>>
>> Hi Thomas,
>>
>> I have checked what you mentioned.
>> When loading amdgpu we call  drm_client_init() during fbdev setup 
>> [1], the refcnt for drm_kms_helper increases from 3 -> 4.
>> When we unbind vtcon, refcnt for drm_kms_helper drops 4 -> 3, but the 
>> drm_client_release() [2] is not called.
>> The drm_client_release() is called only when unloading the amdgpu 
>> driver.
>>
>> Is this expected?
>>
>> There is a comment for drm_client_release with regards to fbdev :
>> * This function should only be called from the unregister callback. 
>> An exception
>>   * is fbdev which cannot free the buffer if userspace has open file 
>> descriptors.
>>
>> Could this be relevant for our use case, although as 
>> Application/X/GDM are stopped at that point and no fd should be open.
>
> This looks like the bug to me.
>
> I'm not sure why the client code takes the module reference in the 
> first place. Drivers invoke client interface directly. Shouldn't that 
> imply that they have a module reference already?

It's not the client code who takes the module reference, it's the 
DMA-buf code.

As far as we have narrowed this down GDM/X is inspecting the existing 
configuring during startup, while doing so they export the BO initially 
created by fbdev with DMA-buf (probably to give it to EGL or something 
like this). This DMA-buf export is what's adding the module reference.

The problem is now that when GDM/X exits the DMA-buf should be destroyed 
again, but it isn't because obj->handle_count isn't zero because the 
drm_client interface keeps the handle around even after creating the DRM 
framebuffer object.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> Thank you,
>> BR,
>> Danijel
>>
>>> -----Original Message-----
>>> From: Thomas Zimmermann <tzimmermann@suse.de>
>>> Sent: Wednesday, January 25, 2023 8:48 PM
>>> To: Christian König <ckoenig.leichtzumerken@gmail.com>
>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Slivka, Danijel
>>> <Danijel.Slivka@amd.com>; dri-devel 
>>> <dri-devel@lists.freedesktop.org>; Sharma,
>>> Shashank <Shashank.Sharma@amd.com>
>>> Subject: Re: Amdgpu module is references even after unbinding the vtcon
>>>
>>> Hi Christian
>>>
>>> Am 24.01.23 um 15:12 schrieb Christian König:
>>>> Hi Thomas,
>>>>
>>>> we ran into a problem with the general fbcon/fbdev implementation and
>>>> though that you might have some idea.
>>>>
>>>> What happens is the following:
>>>> 1. We load amdgpu and get our normal fbcon.
>>>> 2. fbcon allocates a dump BO as backing store for the console.
>>>> 3. GDM/X/Applications start, new framebuffers are created BOs
>>>> imported, exported etc...
>>>> 4. Somehow X or GDM iterated over all the framebuffer objects the
>>>> kernels knows about and export them as DMA-buf.
>>>> 5. Application/X/GDM are stopped, handles closed, framebuffers
>>>> released etc...
>>>> 6. We unbind vtcon.
>>>>
>>>> At this point the amdgpu module usually has a reference count of 0 and
>>>> can be unloaded, but since GDM/X/Whoever iterated over all the known
>>>> framebuffers and exported them as DMA-buf (for whatever reason idk) we
>>>> now still have an exported DMA-buf and with it a reference to the 
>>>> module.
>>>>
>>>> Any idea how we could prevent that?
>>>
>>> Here's another stab in the dark.
>>>
>>> The big difference between old-style fbdev and the new one is that 
>>> the old fbdev
>>> setup (e.g., radeon) allocates a GEM object and puts together the 
>>> fbdev data
>>> structures from the BO in a fairly hackish way. The new style uses 
>>> an in-kernel
>>> client with a file to allocate the BO via dumb buffers; and holds a 
>>> reference to the
>>> DRM module.
>>>
>>> Maybe the reference comes from the in-kernel DRM client itself. [1] 
>>> Check if the
>>> client resources get released [2] when you unbind vtcon.
>>>
>>> Best regards
>>> Thomas
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_client.c#L87 
>>>
>>> [2]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_client.c#L16 
>>>
>>> 0
>>>
>>>>
>>>> Thanks,
>>>> Christian.
>>>
>>> -- 
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>>> (HRB 36809, AG Nürnberg)
>>> Geschäftsführer: Ivo Totev
>

