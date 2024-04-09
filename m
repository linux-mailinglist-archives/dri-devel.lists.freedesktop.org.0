Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226689DF42
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F95C10E821;
	Tue,  9 Apr 2024 15:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BeLT0oNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2122.outbound.protection.outlook.com [40.107.102.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DFC10E6E7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXY7YebFidL3ljwwGxw7QhmtW1P/lcmn94vKqxIpQnpJq2xnljCH4HyLfskCYJ0HO8U4LbwAF/4R1F6SiIGAYSXmSec3k2DbvrWuJAFyMNU6me0gFkIj2Vk/Gr1xpzXiECuPej1nHoukhzKEEdxE3zZoeCWj/xDCMy4UfSvbyo6wBZs89mAWFbuEbqr9wq1xKvafuY7tTMsROlBq3yXvuw49O+lt6t64uKKtksOCFwH8fusM97Y7aI/TUc4K8AgLhbbYsjlGJqHi68FA/JbCUszRyEvokTn2N88n/TrgKkeUAy81XY/U9RPvwimLmsEyKkCJinvPCC7N9gTvpFoiqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzJMaBu9yeXpH7IyyNCB9XetP04HG0RmYP5kALA8sI4=;
 b=gAjjxQ3BHNP149hudqpVHXFJRMEDbGLIELd/4+9cgU/WH7p6zVmpflO9NpmjOMrSQFSzI4ZErey4wHH7tEahhq0JQ2/EZBAREkUQ9lwRNIuqQUEiKHC6fQCZv9KZ+4wy9suonwNKvvKMnRm7uxYrkX8UUf77AEaFvI/LuG2qLP0lbngcQl2qnYilpypfnoF/wWwDcu19lZqBOVBowGqhXnAQvdhbdoMX7GtAvgeadmh/zzDBqAjHQH9NQQC4rfQuD4rcxiRWOKwgVVELTtrSKbi+BT2SyjWx0zoPMmc3a3975/2CcCoc+gtjgwtdk1ZUmZ0WnIwMOoUbmRZbz328jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzJMaBu9yeXpH7IyyNCB9XetP04HG0RmYP5kALA8sI4=;
 b=BeLT0oNNCaFHx2W8ldwnfc2f+fCpqMn5VrHjNVACCTzr31yHvzTIYv3/TN6tzvSbzSvHZpQXCYLKkvDRDZO5CF58afN498eBGgidTPpo4PSKp64G4Y/b9bRNr1kkk4l0q8g6fN6ES4xXrE47bL0CJDyn87v32z5ID7jIRPCbwVw=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 15:35:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 15:35:05 +0000
Message-ID: <42aea61f-52d7-4cea-9944-7130ffcf9c15@amd.com>
Date: Tue, 9 Apr 2024 17:34:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: Rong Qianfeng <11065417@vivo.com>, Rong Qianfeng <rongqianfeng@vivo.com>, 
 Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org
Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6935:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQwPNWDYyrUqKxONMsorqS+LM1yAzs46r3dJir9uH5EzWYtsZ76S0rRFYYxJBd4nzaSCfzdOYlBsY3Oy/OmrpO16o3lA+41QvPq04bB/986zx05HzKc395n2jUr0iW2Ser5xF4XrTKisInxb/Vko66QGR0aCWWQOqiXk0/YCv0j2ZbdOhWaUt1nT04c2ucLezvvB9MTL3fmQOukU4osyOYWnzMn+glqfd853g/+r4vrDEiHnVduS/rkW2KGkwyr8/UO/AodT/Dlr4CaYis74VFhjK3Mc9QUV0HeBA06HgBYxTcZh+OHfw6oOshScITNZLmZOlQVXY9Mvl4IQut1HeX3OBSu2Rtio7JXayBkYXgaCR7FkK2ulqYcfD/DhzynnN6HooynJmfPirCix0IFAJsUvViiBJ321xhCkql8Vhq52Xt0rizazBzmYFLSG/Fi58/5EcleP6OsVuI0oT6UN0LUirKRCdJ2E6690lwgIhB6H+AUgGgVeJV6LKDIQjlvQqrwqVzS7znypeucRjbOTWb8zQ1X2qJZ/fmRJsVuBHm4AFjwyFhbOUWDAn+cI0iBN70AS9jWU2TADP0uTwmFlSBUZEKR08c18kEL6RgfLcCDirfZCoPRpWp3pJWVAwW75dreiMAenvD3gSI9O2HLcev2Vi1xLcb6qLbmirJnOMUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVc4czlmR3lDMCswWU9LQXRHVXo4RHF5ZiszYkI2bnNmZEc5K1g4S3NKY2xm?=
 =?utf-8?B?QS9QV0lib1NIQlY4eDZBZFZWM2pJTXZ3UWdiN2hPanA1NDNKN3VNTzYvVEFW?=
 =?utf-8?B?YnNqTWxJeFcrWUxLdzAwRWFvdCs4NDNCL1dYaWhHeVJmc1hwQ0VKSGFxSDQ0?=
 =?utf-8?B?QVU0OFpnSWkzY2lOeVEvWEdvOHdhZnhRS3hpWXpBSytWOUNQV3NMVWk5cDRS?=
 =?utf-8?B?L1FKUFJwYk5LOVZ1NFlGU3RKeDdnY2ZsWnJscU9MZmtINlNzMERJSFkvNFhx?=
 =?utf-8?B?SmZlUXJNUTdBL2ZCTEFKYzdjNDRSSHpXSTE5L1BDZE9FVFFmRHZaRE85eXFP?=
 =?utf-8?B?dzNDdEpXbk5sOGYwZWY1VTRSVTVGVFd0K3dDVEkwN29ZblM1Yk1wUEl4Szd6?=
 =?utf-8?B?THU1ZmVTTUJveFpWNTM5TVB0d3ppcjR0UVlLTWhpRmt0UC9TeHhpTWIzMGJh?=
 =?utf-8?B?M0FjbHVLNVJGR0NXNTBzVG9kMS96QlJROUhUUUF4a0FtQzVCUTJDeFU5a3pa?=
 =?utf-8?B?bWQ1SWc5ZnlBbjBwZEhtQ0dySUdxdnNvVUdjQytEZTNsb1NxVURQSEk0MCtS?=
 =?utf-8?B?TlpJL091Q3RmbWFxcXJYc1RGb3ZET0tsZUh3aXorcUtyVjdXT1NuT0hCNE1C?=
 =?utf-8?B?Kzk0dmRGV1dOS2hiSXNyOHVITElUWEVKSVRQVGlyUHFXTDVNbGRXNlVMQjNJ?=
 =?utf-8?B?SjZmeERsTjJuRWVkU3NpdkRVSVNIQ2dIMTFCNEZmQVpRVmRXOVFUcERpMW15?=
 =?utf-8?B?VTNwa1FYaXNCQTFmN2g4aExGN2NpQVFYcWVyK3N6Y1p0MlZ2cFlLamVkQXlk?=
 =?utf-8?B?Q0NqMEJvWkJIOXpxSzRzdlNBY05YN3Y2N3FnTkpRejJIUG5zcm5zVTBKMkhv?=
 =?utf-8?B?ZC8ycUpLRy83UjRPQmI3QUFLb0Q0cFpKRlVFM1czZkVrQXNFSkY1U1QzQ0Fj?=
 =?utf-8?B?dEZzc0k1Z3lycVZ2aDhIeW1iZk1iZ3ltYzVnaWVMZkhwZXNrMGdHSnVhYUhX?=
 =?utf-8?B?YW9WZDFCVUlZcFBhcnZEWmlhbmhCUXdqcUNpRk9Ec2g4czI0ZHJ6a3JJRVl6?=
 =?utf-8?B?S25uZTMzcExINE1zVHAyendaZy9oVXJ5TnRZanp6TGNucnduZXRpK3RwYjBQ?=
 =?utf-8?B?bWs3b2x0MVBIbkptcVhxR0l3dDFUZFJQL0wvVHRyb3A3SHkwM3lXSnlRVkNv?=
 =?utf-8?B?dDRkQWNpRVhMNWtOd3F4L3l0djhkc3ZLZFVDVDBQUG0xNURLd3V3bjRET2wy?=
 =?utf-8?B?NlVZNVovLzErRksyYjhzcEFmeFhvOGdCeXMwN09qdHZDNGZNR2w0ZXRjR3BS?=
 =?utf-8?B?TXl6SUNmTys2QUJwcGM4THpUblFmVXZaN0wyVUFDN1crOWNYSk9tZ0pSa3F5?=
 =?utf-8?B?NCs5Uk1SM2tSWktxWVNWaXh1QStraU1FOG90cVZZNkRwbHoycWtOL3BhLzhw?=
 =?utf-8?B?cHprb3NOYWNKOURUMzRDSk8vc00rTnM4cGdCVVFMVWNrdit5c01KL0tsQjc5?=
 =?utf-8?B?UnNrQmZ6cFBjYm5ldm5FeG8ycWpWWWNYa3ZDWE1hZVJGN3VQdktuR1QzZXRa?=
 =?utf-8?B?NDdnMU1BNk82T3orOWdXdHdRWTdyT1RQR05yQUtnUU90Qkg1bHdWS0E5M0NH?=
 =?utf-8?B?bHNvTFc4OVAyMHVmMkhLT0tKaExLSnlvay9VS3I4YVQydklSMGVGa09SNWxy?=
 =?utf-8?B?VzZmVHpMMzJMaFk3cnlaOXlEUFJ3YncrRVFJSVRZbklzaVZ1T3NQTGIzU3F1?=
 =?utf-8?B?WEtMaDB0RTJFK0p6Mk9uZksyVXgrNWJWZmVtYTBSMjNIRUtOYWpobVYvTys0?=
 =?utf-8?B?UnhRUkVPT0pySnNRNTN3dUpQN0N4cG80d001UG8xYkFiWjZCNm91OVgrZExy?=
 =?utf-8?B?ck4yemJwNytmbWVLSCtndW8wWW1CcHpiUUxTRWpMVktVOHJZQ3o0VzVka0pU?=
 =?utf-8?B?NGpZS0VTTVY1aFgwQXlpWmp5akJrVi9Pd2RlaTBYYnBaMTduc2g0a2NBNE5D?=
 =?utf-8?B?alJDbTEvZEtNZ3gxelNXMlh4anVWUFlmRlg5bTBWM0xQR0FMaE93T3ZUWlhl?=
 =?utf-8?B?ejE2MkY5YWw4U1kxL2dtWXlrOGxnTHdiaWd3bGdWeEJUZy9PenI2ZGNORGpi?=
 =?utf-8?Q?6ZFrgaJqwYxD0OtJtShE/LfFi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd98731f-1ac4-41f3-a20c-08dc58aaa11c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 15:35:05.3677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNDwPIN0nNSmxS9YJcOVy7Hv9+yHXg9YW4W5+Uto/FmZfbxgfvqm8XwVpGgQsScm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935
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

Am 09.04.24 um 09:32 schrieb Rong Qianfeng:
>
> 在 2024/4/8 15:58, Christian König 写道:
>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
>>> [SNIP]
>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>>>>> offset and len.
>>>>
>>>> You have not given an use case for this so it is a bit hard to 
>>>> review. And from the existing use cases I don't see why this should 
>>>> be necessary.
>>>>
>>>> Even worse from the existing backend implementation I don't even 
>>>> see how drivers should be able to fulfill this semantics.
>>>>
>>>> Please explain further,
>>>> Christian.
>>> Here is a practical case:
>>> The user space can allocate a large chunk of dma-buf for 
>>> self-management, used as a shared memory pool.
>>> Small dma-buf can be allocated from this shared memory pool and 
>>> released back to it after use, thus improving the speed of dma-buf 
>>> allocation and release.
>>> Additionally, custom functionalities such as memory statistics and 
>>> boundary checking can be implemented in the user space.
>>> Of course, the above-mentioned functionalities require the 
>>> implementation of a partial cache sync interface.
>>
>> Well that is obvious, but where is the code doing that?
>>
>> You can't send out code without an actual user of it. That will 
>> obviously be rejected.
>>
>> Regards,
>> Christian.
>
> In fact, we have already used the user-level dma-buf memory pool in 
> the camera shooting scenario on the phone.
>
> From the test results, The execution time of the photo shooting 
> algorithm has been reduced from 3.8s to 3s.
>
> To be honest, I didn't understand your concern "...how drivers should 
> be able to fulfill this semantics." Can you please help explain it in 
> more detail?

Well you don't give any upstream driver code which actually uses this 
interface.

If you want to suggest some changes to the core Linux kernel your driver 
actually needs to be upstream.

As long as that isn't the case this approach here is a completely no-go.

Regards,
Christian.

>
> Thanks,
>
> Rong Qianfeng.
>
>>
>>>
>>> Thanks
>>> Rong Qianfeng.
>>

