Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1A8113EB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 14:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863DC10E286;
	Wed, 13 Dec 2023 13:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D60210E286
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 13:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dpy0gpQczUwGj76PKeP+1ZXxp+pJ8ec5IwpFzNppjn0BZtejoe7qBwRy1Qb4g1SRL34I4xw8fjBCnk/JzEXuWYeOW3eBFk2JKz9udDYUarqN4EB22blJ9wdIyfh5OX5Qgy3mf3zICH7NSJ4LAZS9xrOL06G+9C5Vuy6dHYd5y7VqJrwlYu4t6PyagzCd7+Ph5LqZgy6L4QIQqHd8zIKwQ+xnO2/7/4JHA68TqNuc07w5PN3K5zqvVLH/XHSxRBnJR6zTciJpdrohu/+ai2p+5MTAWHiNZn5ugjF5ijPyl/BFoLHCFAysMIMamUa9kESqvEZZLxCaK/MEGUaP2uB55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=959RlqaNHZFPTzWiCYmR8CRuOuvZOPyVf4+d9qW21eE=;
 b=GiV+MPBBmH179z5up7qBMNoDqo/tuAkpZBJBqr2SF7TKMXnR5wMTSP+aQH/Gu2iFq0dyIkakBTwjATGV8FEclsw/UiGWGJQpT0FgN6Kvx7fA/z759UQ+fHv5laSqgpElHlR/9z8yZnbJQ+AIZxUoBCRbXNaaOuhH4uZUaOokfQo8umTFjATxv7MAx4MIyX73X+sfe3SIxtFddt6Z6QZHvroCNx+35pOqB0E+IOa/rXmabLiDPu+ioK2bQiLAhCNHEqERpyy+wjAHdNeNSTEJbQtepHAdGrthpnxmVmcYIlY6K4aoL8gJCeI/DJ0SgjBiApsnfYho70YaiyP9hDmsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=959RlqaNHZFPTzWiCYmR8CRuOuvZOPyVf4+d9qW21eE=;
 b=wOmtkwUXQwR3hXS7L3NBVA8pFFFdlSdXlMpLaWaD75RxkD/x84xxVyXVRPtacF4Hs6gO9VeU4YhSRVIaF8Ei/McHAnf97hKiyirElD95EHQwTzj0uAUk8I2LwpeZ596Zb3Mh0d6QQUUt1AOp05WBF7U16YPy8EJXVhajgpr0LtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5677.namprd12.prod.outlook.com (2603:10b6:510:14d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 13:59:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 13:59:46 +0000
Message-ID: <f2f2b676-295d-4792-a26d-7fafb7340f36@amd.com>
Date: Wed, 13 Dec 2023 14:59:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Content-Language: en-US
To: Joakim Bech <joakim.bech@linaro.org>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell>
 <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 19176b9f-e92d-4621-7f03-08dbfbe3c38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KpIYws6ptnnE5G3HSmOjucw0l0+uVzoyzOBYUiWiWzzs0oLgk65snyrXbGCkvO7ugwZ+C9Qi/0vPETvzny8cZ42LwCe+cgAGtMF0uhzwLslY1bPWZIbE4t8yzjRBURbQaMZIfWDm3+uAAqgALqeARBf5xKnh8kG9wIu0LQrWOpkqOF0k5dAjQt30TjamAvr8MfOh3rdXpjGEctNHMMBDHvdCwuGgHIAbGDXXFH0Gzn+FDyuktnZkH0J9CmJK+3B18h0+pZ1Qm38FRM9rxMeywFsVbEzrEoJQMGfA1NFYkCg7af6YFoCWdWaZyrmpjbxzdDCYcqaa5HwfIG1dpzwImp2u9YNSlgrcz1ttmnh4YUq67cThaivtTRIBAHiMzbmbCwpBI2jSSMDvxwakYCj+NpYu61wIJX6bckBOXZnzmGGCh8U8rkndwjVby6TFHRmYYbDZELuBhj5WecKoAWwLLnrddIVk/rAfQ7zsXQcS+q0nbp4HDJM35JQU6gRLo5TlyQgUDATCtGDIQNBYCnjDYOkJg6N8cNJTp+zor4AjxMkVw5+gS0kGE7oKgE6s2PynZCE9phRTaXXw97cl1v6+m7CF3bopF5l9gP/95EZJ9ZUBm4TVNwsFCgcS43AKHFejgADvd68JlJ3f2m7ews0FzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31686004)(66899024)(110136005)(66946007)(66476007)(38100700002)(31696002)(36756003)(86362001)(66556008)(26005)(83380400001)(6512007)(6506007)(2616005)(2906002)(7416002)(6486002)(54906003)(316002)(478600001)(6666004)(5660300002)(8936002)(8676002)(4326008)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzZSSjJvWCtzMTVrSnh2Qnk2MmI3N1VYd0MxalF2VEx4M3ZmRGUwTTJJaGhB?=
 =?utf-8?B?aWEvZ0c1SkdjaVYwZ2dxQnI4VlpZRkU5RldvUms0MmVFZVJJWisxTC9LZFk5?=
 =?utf-8?B?R3ViS1NsbVVVeDlRUVZmSUJoU0VZWmNYRFJsNGgybG4xOEFMblE0R2xFT0Fk?=
 =?utf-8?B?TnlrYUNGdGh4SFZXcFFHMUM0eElmYWdTUXZVaXhCUk9nZHMyRU1SUCsraW02?=
 =?utf-8?B?dEJHY0xvTGhBM2NtRmFWK0hNb0NZU0hwekRFNHFTUU8vbm1XNVJmSXRpMmRI?=
 =?utf-8?B?RTZJUlF3RUp4THlJWWRhd1M3dHV3WWRvQitnNUJyV0NpTUFjZTdSam5Jcmo0?=
 =?utf-8?B?RDkxRy9RVERSRlIwc2twOFJjTG4vQXl5eXFpdTBpTW5UdnFEY0FvdEp2Yytm?=
 =?utf-8?B?YTVrYTlJL3ErR2NaUlJXVG02Y0pPUUI0Ym9FdVlaNDJUdGhRR2s1d1pEaUJL?=
 =?utf-8?B?RnNNUWRyQ0dKUmV2K2FlQ0lkbGpwSUl3QkI1WUlCK2cxQWZVVmkvdTUxV2VW?=
 =?utf-8?B?N3FLUmFYSTNDbW9QUXhnRHZ0bWNaQTE5UnhDK2FLSStIM0FCUzB5UHVGeHNB?=
 =?utf-8?B?YnFtc2lPTFdweWFwZXM3cFgzbWVKRit1ZmZLNTlKZU9LUXZyQnEyQlZhMUxy?=
 =?utf-8?B?R3oramQ0NG5QSE8wRldkeVMrODZ2YU00amdvREZOdmM3NzVDTG16VjhjckNL?=
 =?utf-8?B?dHBia0VpclR1c050YXhsUHVCQWFuSVNaSVl6c1dqRWFWVmpVdWc2cW02eFlK?=
 =?utf-8?B?UHEvUTFKcXN4d05Wb01SdnYrdkk0M0VyN1ZLTklTQXFMUUMzUDF2T2R0MWg4?=
 =?utf-8?B?Yi8rNmU1K1YyejRDTTdSVXRRL1lMSlJ1SzFrSFVRWXpsUnBIMHQ3VEcvVzdB?=
 =?utf-8?B?NlBiR3NFUTJrWFBHM0pwOC83WEYwSHk2MUxhLzRwelMrS2FqNVpRa3dNcGFk?=
 =?utf-8?B?MGZaS2JxSmV0clFWdkxXUWJTSzhOY05vMWpTZXdNOWlxaTJsVERBbEVIeWFU?=
 =?utf-8?B?M0VpMUdVaGpBbDgvbXQra09XSDgzY01MZFkzbXByRnVlVnBES3k5RHFYZzkx?=
 =?utf-8?B?UGpGRXlaUU1JRE1wNW9pbzcyZ0lTUVkweVdmYXhPR04xQmx6ZWNxdmthbCsw?=
 =?utf-8?B?QTNCeC84NE9aV3FGZ2ZldzhLdDFxYTFrT1ZYVVl5cDJyMlhGRE9rUHRNVjMy?=
 =?utf-8?B?L0pUYXdzb3B5MFBoRysySXdFamp6cTM0QU81eGxSQWI3TFRCWFpQb25qemNo?=
 =?utf-8?B?dmxpdUl0UVlEMVZlcDFFR0tDUU0wMmtXYjhBOGZ6SmRiLzVHa2lJTmIzTml2?=
 =?utf-8?B?eFhKeC9QOVNxM2lxcVkrdUQ2SWNzR2l3OFJxd2syc0JGUmticEp6Wk5rQjlX?=
 =?utf-8?B?SWR6cGF1Tll2b3JWRzhUTG12b3l0WUFmSkNEQXJwWjVnSGowemlkc0lhbnUr?=
 =?utf-8?B?Ymdwemh3WmRHTThSWm13WmRMcEovOXZab3FETysvUXRHNHRkSk4vQXl1YWdB?=
 =?utf-8?B?RVZZV25hQ3RsLzlTVHFZenBXcmd4N2J3R1dqa2w3ei9RbFF3Z1NtL29ZQTBM?=
 =?utf-8?B?Q05MTXViTXZ1Y1ZoSnp3RE5KNnJIQkdqb3ViKzZ4TkcrTWtweUlWSTdWZ1VP?=
 =?utf-8?B?dGhxRDB2d2lXK2t1Y2Irai9aM0JWb0pjNDA3cWN6Ui93YlF1OXZCQngyS2Vv?=
 =?utf-8?B?ZXNadVp5a0tsNDg1dVNxNVZsN016RFBkSDZJNDg3clgvbklIYlZhcEpIYlpI?=
 =?utf-8?B?L25CQ3FRU1NsYk1SZVpXQXJxdGdlZDZVWEJVTURvZ29RQ0ZtS3FiZlcwVm5I?=
 =?utf-8?B?NWZpaGVMVlZlVW9FRVVyZ0hGbXhhV0NGU2pUcVdnbzhJaU9XeExZMmFYK1lp?=
 =?utf-8?B?TlJ4V0NnbUgreEpOZzRQQjR6cytLQVJzWS84Qlc5N0pmMGp5bGQ3dm1aUUhM?=
 =?utf-8?B?M0lJdjdRTWtrWEx0TnMzNHdLMGhOYm5scTIyZ1lqTmtFcEs4aTdTbWM3RkV6?=
 =?utf-8?B?WWJ4OTZPRExaRE9mS0p0QmhSYVdQNFlGTWtVamMzdHhJUlFlUWRIbVBmR3g4?=
 =?utf-8?B?RnZXR1NoVUUwaDNFV1NrYTJMSkZ0WXZBaW5SZUZFd3NWZ3E2VlNCZFlGdmla?=
 =?utf-8?Q?hRm8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19176b9f-e92d-4621-7f03-08dbfbe3c38c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 13:59:46.1743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/l27ZpzoJzCatgjft+ydWH2RcVITPsWcrpanm+tRHhAa7/4mFWAHoSS/r7Z7GSv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5677
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.23 um 14:22 schrieb Joakim Bech:
> On Wed, Dec 13, 2023 at 01:38:25PM +0200, Pekka Paalanen wrote:
>> On Wed, 13 Dec 2023 11:15:49 +0100
>> Joakim Bech <joakim.bech@linaro.org> wrote:
>>
>>> On Wed, Dec 13, 2023 at 11:05:17AM +0200, Pekka Paalanen wrote:
>>>> On Tue, 12 Dec 2023 16:36:35 +0000
>>>> Simon Ser <contact@emersion.fr> wrote:
>>>>    
>>>>> Is there a chance to pick a better name than "secure" here?
>>>>>
>>>>> "Secure" is super overloaded, it's not clear at all what it means from
>>>>> just the name. Something like "restricted" would be an improvement.
>>>>>    
>>>> My thoughts exactly. Every time I see "secure" used for something that
>>>> either gives you garbage, refuses to work, or crashes your whole machine
>>>> *intentionally* when you try to do normal usual things to it in
>>>> userspace (like use it for GL texturing, or try to use KMS writeback), I
>>>> get an unscratchable itch.
>>>>
>>>> There is nothing "secure" from security perspective there for end users
>>>> and developers. It's just inaccessible buffers.
>>>>
>>>> I've been biting my lip until now, thinking it's too late.
>>>>    
>>> The characteristics we're looking for here is a buffer where the content
>>> is inaccessible to the normal OS and user space, i.e., Non-secure EL0 to
>>> EL2. I.e, the content of the buffer is meant to be used and accessible
>>> primarily by the secure side and other devices that has been granted
>> s/secure side/proprietary side/
>>
> I'm using the nomenclature as written by Arm (other architectures have
> other names for their secure execution states).

AMDs GPUs call that "trusted" which is only minimal better than secure I 
think.

>
>> I presume nothing of the other side can ever be in any way open?
>>
> I'm sure there are lots of examples of things running on the secure side
> that are open. The OP-TEE project where I'm a maintainer has been fully
> open source since 2014, to give one example that I'm familiar with
> myself.

On AMDs GPUs you can actually write shaders which works with the trusted 
data and can read and write.

What is prevented is that you copy the data outside of the trusted zone, 
e.g. to the CPU. When you do this you only get garbage.

Only engines which have the proper decryption key can send out the data 
(for example) to a display device which has authenticated itself using HDCP.

Just a few infos how this is done elsewhere.

Cheers,
Christian.

>
>> Maybe the other side is even less secure than the FOSS side...
>>
>>> access to it (for example decoders, display controllers if we're talking
>>> about video use cases). However, since the use cases for this exercises
>>> the whole stack, from non-secure user space (EL0) all the way to secure
>>> user space (S-EL0), with various devices needing access to the buffer at
>>> various times, it makes sense to let Linux manage the buffers, although
>>> it still cannot access the content. That's the overall context.
>> Yes, we know all this (except for the exact meaning of EL0 etc.).
>>
> Great!
>
>>> As for the name, it's always difficult to find a name suitable precisely
>>> describing what it is. "Secure" is perhaps vague, but it might still a
>>> good choice, if you carefully describe what secure means for this
>>> particular heap (in the source code and the documentation for it). For
>> Carefully describe, as in, re-define.
>>
>>> example, the definition of "secure" for a secure heap as here could mean
>>> that buffer content is inaccessible to the host OS and user space
>>> running in normal world (using Arm nomenclature). I wouldn't have any
>>> problems with calling it secure if, as said it's defined what we mean by
>>> saying so. But I'm all ears for other suggestions as well.
>>>
>>> Safe, protected, shielded, unreachable, isolated, inaccessible,
>>> unaccessible, fortified, ... would any of these make more sense?
>> "Restricted" sounds like a good compromise to me. The buffers' usage is
>> severely restricted.
>>
> Yes, restricted isn't a bad choice. We would still need to describe what
> we mean by saying it's restricted, i.e., what is it restricted from,
> since I'd guess that "restricted" by itself also could be a bit open
> ended for a lot of people.
>
>> It is the opposite of "safe", because accessing the contents the wrong
>> way can return garbage or intentionally crash the whole system,
>> depending on the hardware implementation. One example is attempting to
>> put such a buffer on a KMS plane while the connector HDCP state is not
>> high enough, or a writeback connector is connected to the CRTC. It is
>> really fragile. (Do KMS drivers fail an atomic commit that would
>> violate the heap rules? Somehow I doubt that, who'd even know what the
>> rules are.)
>>
> I believe one of the goals with reviewing the patches is to highlight
> issues like this and try to figure out how to avoid ending up in
> situations like what you described by suggesting alternative solutions
> and ideas.
>
>> It is protected/shielded/fortified from all the kernel and userspace,
>> but a more familiar word to describe that is inaccessible.
>> "Inaccessible buffer" per se OTOH sounds like a useless concept.
>>
>> It is not secure, because it does not involve security in any way. In
>> fact, given it's so fragile, I'd classify it as mildly opposite of
>> secure, as e.g. clients of a Wayland compositor can potentially DoS the
>> compositor with it by simply sending such a dmabuf. Or DoS the whole
>> system.
>>
> I hear what you are saying and DoS is a known problem and attack vector,
> but regardless, we have use cases where we don't want to expose
> information in the clear and where we also would like to have some
> guarantees about correctness. That is where various secure elements and
> more generally security is needed.
>
> So, it sounds like we have two things here, the first is the naming and
> the meaning behind it. I'm pretty sure the people following and
> contributing to this thread can agree on a name that makes sense. Would
> you personally be OK with "restricted" as the name? It sounds like that.
>
> The other thing is the feature and functionality itself offered by this
> patch series. My impression from reading your replies is that you think
> this is the wrong approach. If my impression is correct, what would you
> suggest as an alternative approach?
>
>> "Poisonous heap" would be fitting but politically inappropriate I
>> guess. After all, "poison" is data that is not meant to be read by
>> anything normal.
>>
>>
>> Thanks,
>> pq

