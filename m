Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E72748420
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 14:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3634B10E35A;
	Wed,  5 Jul 2023 12:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515AE10E35E;
 Wed,  5 Jul 2023 12:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAY1ckqiSnTYtZ3Dhp3Wfbpx30deyueBIi7Df5fEtcUgToI2zquDC3t2S99JMdK1Spkjw/9gg+tAtlycUGMUiO2ckFeq3TtvxoyJ1uOTn6ut3alM2ismAMNM8qWxRijvD/xKsOHjzEX5TXVg85q6dLeKBKv4ua2ZGUdrxoOLAfVppRuoc9DrrhSNgJl8YVV0Nlv7nieAFjRbNLp4TlzDjR+ttp4Tr9B8Ottk+0lWbE4mLeEDa3MTBHu1aTEdy8qX8668sN3joKsXWrMYOHidsPBDrVzBaz9bJ90EYK1Rpm3kNPus6RtxlDojkX1YOgwPJ6L4IjA3ALinQqpIhzjmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ux7G+qQlguQJ5DKMACbemekk06jXlLI17YXfq69YHhI=;
 b=iSxdeYpyKwVIc0/Crg180RHnpwSHOvuQetxpRdZa3tNH2trxFo/muIf2X1NOzfqpa0ivaWFxcxWLIz0OUhAmI7iTr11kOYggiWLL8OQE5YloiVBAVwXGgGXDOeBPKKuF/GkxmYtqOoSj4uskPcx1ld02++zmR5LDu/MZAmnD78qzlnnbQNOMMRvkerZ9KSNxnmuDohazL6ct28MqNPDEg8BvzWIYphXwzfUWsQcG6vQ5LLt9lJBA1SnZ9CyHtAFkRRfE00OdCvV1c299rNOzp6vyeih+x8HMH2xl8qi69WHMSkeKAe2lAo53emZ4TbeqXivXhI0pYhEN8Zkn7svbxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux7G+qQlguQJ5DKMACbemekk06jXlLI17YXfq69YHhI=;
 b=Am1OcRv3IQoVQ7ql6mqMbynDqHt2eksFZc0kSBG8NgRdlrx/w7qrxXpbrueaQ7n2L3s+KXAhcZcVw9T/TuhyanvScWUrDSO4n11LkwnUb9oO1glPbEZhjfKpVulNY/6/+4/cL8Jot5lyAsmOMCyPKmEWBLQc6zbfeBk91e64tp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 12:27:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 12:27:09 +0000
Message-ID: <cf414be3-40fa-7a7f-1d31-9c8efd54d587@amd.com>
Date: Wed, 5 Jul 2023 14:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230703123557.3355657-1-arnd@kernel.org>
 <f4bc3739-3ff1-6fa7-5d7d-890f451315bf@amd.com>
 <788147c6-defd-496a-8174-1571b73d1a71@app.fastmail.com>
 <f1b190cb-3af7-178b-baeb-b59363868779@amd.com>
 <9b03246d-b46e-4b91-968a-e9ffc2fc26db@app.fastmail.com>
 <7b55040f-f2d2-372e-cf8a-5ac4a456fdb1@amd.com>
 <2dff4d81-9b45-4d69-9e30-972f2c9318d9@app.fastmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2dff4d81-9b45-4d69-9e30-972f2c9318d9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: 111f3ed5-e2e3-49de-fcc9-08db7d5326c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhueXVkpMsCkN9m/7aBA4pcUi0DLKjUT/WYXmozGBt+Jy7SkH1eXSQiHCgAaeQ2YyGvIkiOqPoINkBSJSjTKOnKt/O2CytLkbtd3wrX6Iaeu/7bSYPg6p7zurjc88p90rcgStopnuxMj6Pr+G/fJX4BZMVG0ImMHIqvWcviNAfunLgMksYAsWH1CtAKh3EjTT1bJonw4QZxSyt4gvtlNPmUR8K25TMRpiRCGWv3M3cf74BLFf3wEuirIzGBUbCumTuo9JDOjQ2kvzxd8wxgA7uPAwbrWyR3fsJnZ974aMiYKcalZBFL2K6CC3fe55B1tECKeiDqgFo1dX0nKeRwRVADfJbIF/ZXUafTlbq7zDwSwqMp0gS/z2Go93pZSFz3gW/0ZfaUzGo3a5agXHzHOurHbHbmjfoyLKFALxHag/jijUMtsutuGVzsjK5xDO4MXSSpTlbA7emRiMoDUzjWeiBtlPuIpOGnbbB5oGWDNGcvmF2plQE0u/80uwUMjpWYz+pZyNgQMqJuf558VmNAiPFS2zhNbYqDgycprtJDjzlw2WYm0ybSFJ6DVodSh5weOa+cc9B7Hdm8vkP5JfdBkmTaDEg2O5KgjyqN+1z/Nek1abWgU7A6wITyjohVFoSYDyPzgvixSQ5g2bkKo3XhQRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(316002)(186003)(6506007)(41300700001)(54906003)(38100700002)(478600001)(110136005)(66946007)(66476007)(66556008)(4326008)(6666004)(6512007)(6486002)(36756003)(2616005)(66574015)(2906002)(86362001)(31686004)(31696002)(83380400001)(8676002)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFNqRWdqZUNtUjFLcktCaXNzRG15SDBMZWgxdjJmcGNremp5Rm00YjE3dXBD?=
 =?utf-8?B?N3lPZ0Q5RGVsalVYUGh0bGhRb3RKS3k5SFNoWkI0a3NGQTJIbXh2d3NiR3o4?=
 =?utf-8?B?WFhrN25oWFBPTEZNR1lZVEhXRmRiOUYzdjR4M1NOZEp3MTIzU3Zua2NQMk5T?=
 =?utf-8?B?TWliWHY1a0o4ak9CaFU1bENzRk1qTEl3UkttUzdRVVJWZEJZT0VFbVVVYlJ5?=
 =?utf-8?B?QjJkYlFUUFAvOXR2ajJvYXpTMmIyVlhqaEtYS014UmhCM2RjUS9JQmpmQjZU?=
 =?utf-8?B?TDRTaCs4SU9ycUpJQ3pwNE9mMkVmZXk2U0I2VHZRMC9kenR4c0x4bTZ6YXBN?=
 =?utf-8?B?a0czMXRmMEVqdnpMSk5sYzM2ajNHcnNRUlhtOCtYNjJ6WTRwQnYvMEpkeEE4?=
 =?utf-8?B?Q2p1KzF5TjdmYTNJaEdJN0g1Wkg2Q1d5SUZsOFdwbHVjVDA4czBmV3IycmN6?=
 =?utf-8?B?cys5dTdyMGtzMFlQMTBLYzk3MXcwWDd0YnBaeElzMndVeFpLb1dKZWE3bnUv?=
 =?utf-8?B?am96TzRHT3FzQUtDUjdOTmpaMHhrS3hUTzkrdGIrci9TeU1YeXNSMnByQTNp?=
 =?utf-8?B?Um1pMFkxTzcrWmVJTGR0em1zcFZSUEtqanorY21PaWh0dXFmdmVkaDNIWlhv?=
 =?utf-8?B?L0V4NWp1K3F4Nmo4M3Z0UXQ3Q0FsRjNQdHpjRnZ0R2VEQlVGK2NIVkFGRlp3?=
 =?utf-8?B?VUQzbHVhbFhuOW5xeTROYTFuazd2azEvOVBTVzJFTjllUU4reUVNdlhLWHAx?=
 =?utf-8?B?WHFzQVFOeWFMOUFLUWk0QXpBdW00VW5Nb3B1WGtaQW5NODkxa0UyTW4rN0xp?=
 =?utf-8?B?dVZOcUVTQTBkVGtISVgxVk1PdUdzbW9aMjVDQUg4S3BrbzA1bVhjSVVueG9K?=
 =?utf-8?B?MWxlMmhOZjRsc2U2c1ZveUo4ZHJHNlRRYjVmTGpNTTVqWUJxWkhRNkcrall5?=
 =?utf-8?B?OHg3SjJrWXViQXI2S2hWL3FNY2o3eWJNOEwrZ2w5bEtGKzFlTjFqVWJJak1i?=
 =?utf-8?B?TFFvSmY3bWRORW1oR082alFiRDhRditBeVJrTjhPYnZOZVZxa01zWDlpNUw0?=
 =?utf-8?B?dy9RTXpNN3lDNHA0OVdHSW9Ia2NUbit1ZjU4M1g2RE9iWTFmN3BpMXYvWVd0?=
 =?utf-8?B?bHVFSGJScEZ2YkJDMUZ0U0xhNWJ5czV2bU1iNDVvemhwWi81NnJtelJCbHE0?=
 =?utf-8?B?UlJUaHN5Q3VCb0x3UmhxT21QdW5UaGFLZ3RwaFM5bmZpS0RVNzVyRUdFZWdZ?=
 =?utf-8?B?WjMxNVhzZDFnbWZrcC9tb01TTWNnM1NiU0FlWWF5N3dhRmVrdUViZjVSTllp?=
 =?utf-8?B?aUVGbDE3dkNzRXg2REpxYjVXblAyYXVuWlNiMGxyTXh2Q3MzRmdDY0F6R05a?=
 =?utf-8?B?UDVqdjV4c3NOQnB0OTFOa2gvbk1zanV4MmowRWxocEE3Z0x4eE0yOERubDNP?=
 =?utf-8?B?SGdiU1dpalVodVFPVVU0eDZ4SjlOMUJYZlpuR2o3Mjc2T3hvdlYrMjBqczNx?=
 =?utf-8?B?U1AxZ0haUExDWUozay9PNFdtSGdzVXordlRWd1lvQWVUN0hTYzdUcmgydzMy?=
 =?utf-8?B?S1FzR1duU3dIMmNzRjZvU0FoTlh1VlJKU2pBUU5tYWEyOWRNbGRuSHh0YXBh?=
 =?utf-8?B?Rk5xTmsyRkR6b2ZRL0VVNzFUdzg3NG9XRi9odUNYWm8xNUhUbUFoK0gxekFp?=
 =?utf-8?B?MHM0aG8yY1JreXNwSE5vOVpvNFByenJmWnc4VUxab0Rndnl2emhVV0QyZksy?=
 =?utf-8?B?MlVaTWJWOExWbzNmY2lZUy9jdlhIMTJWR3BsR2ZkS2Y5OTNiRUw3b3gvVk15?=
 =?utf-8?B?SUZwaFkvaUJYTmdmU2JVQzNQbzhwajdrSXFPNy9NYnZ0WjB2c20rNWh5QlpP?=
 =?utf-8?B?L2hZb3BoeUx2czlSd0xZMW5pU0oxS1JDQ0NEMnpMSFNnMkJXM0tpdVpoMWlK?=
 =?utf-8?B?MHBZZVJPeTIvN0ZGOWp2VTBhYmVtMVI3UmN2TmJ2ZGxPRWxFSXdwWng5ZWJY?=
 =?utf-8?B?VmVXZnFXTk4rbHl5Sm54bkhWOWEwTXZCRjNTVFhkVm1rRk5sNEtoMjNyaDA1?=
 =?utf-8?B?SFB1RFVrVXBXcEx0UnZuM3JEdTM4eXNxMXRoOXZSNEtJOWJlb3cvTHNXL0E2?=
 =?utf-8?B?K3h4SDA1a0hqb3hRWGVJaVFWR2Q0dGVQYnUrVzNpT0tVcXFvUFRhWW9IQVVE?=
 =?utf-8?Q?znZXD1QDBEqV8yLKzgUO09qYLAYJ3O0Rmw9nUO+rG/e/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111f3ed5-e2e3-49de-fcc9-08db7d5326c1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 12:27:09.1949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MD4oYActsXZrtKMeo8uU5geWEzXxuMwBzoS2STzSeu7vfpZ9ViinG1XWi1aTLRv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, dri-devel@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
 Shiwu Zhang <shiwu.zhang@amd.com>, Le Ma <le.ma@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.07.23 um 17:24 schrieb Arnd Bergmann:
> On Tue, Jul 4, 2023, at 16:51, Christian König wrote:
>> Am 04.07.23 um 16:31 schrieb Arnd Bergmann:
>>> On Tue, Jul 4, 2023, at 14:33, Christian König wrote:
>>>> Modern AMD GPUs have 16GiB of local memory (VRAM), making those
>>>> accessible to a CPU which can only handle 32bit addresses by resizing
>>>> the BAR is impossible to begin with.
>>>>
>>>> But going a step further even without resizing it is pretty hard to get
>>>> that hardware working on such an architecture.
>>> I'd still like to understand this part better, as we have a lot of
>>> arm64 chips with somewhat flawed PCIe implementations, often with
>>> a tiny 64-bit memory space, but otherwise probably capable of
>>> using a GPU.
>> Yeah, those are unfortunately very well known to us :(
>>
>>> What exactly do you expect to happen here?
>>>
>>> a) Use only part of the VRAM but otherwise work as expected
>>> b) Access all of the VRAM, but at a performance cost for
>>>      bank switching?
>> We have tons of x86 systems where we can't resize the BAR (because of
>> lack of BIOS setup of the root PCIe windows). So bank switching is still
>> perfectly supported.
> Ok, good.
>
>> After investigating (which sometimes even includes involving engineers
>> from ARM) we usually find that those boards doesn't even remotely comply
>> to the PCIe specification, both regarding power as well as functional
>> things like DMA coherency.
> Makes sense, the power usage is clearly going to make this
> impossible on a lot of boards. I would have expected noncoherent
> DMA to be a solvable problem, since that generally works with
> all drivers that use the dma-mapping interfaces correctly,
> but I understand that drivers/gpu/* often does its own thing
> here, which may make that harder.

Yeah, I've heard that before. The problem is simply that the dma-mapping 
interface can't handle those cases.

User space APIs like Vulkan and some OpenGL extensions make a coherent 
memory model between GPU and CPU mandatory.

In other words you have things like ring buffers between code running on 
the GPU and code running on the CPU and the kernel is not even involved 
in that communication.

This is all based on the PCIe specification which makes it quite clear 
that things like snooping caches is mandatory for a compliant root complex.

There has been success to some degree by making everything uncached, but 
then the performance just sucks so badly that you can practically forget 
it as well.

Regards,
Christian.

>
>       Arnd

