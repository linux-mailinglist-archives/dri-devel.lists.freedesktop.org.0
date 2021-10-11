Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C34292E1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 17:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D477C6E491;
	Mon, 11 Oct 2021 15:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A86E491
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 15:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRZfyhM9HgrWpMsAVlQ1h6QztKZhIJyBlR2lzl1C9zN2bMizWWwOKR7at33BwIm2D9XXW4nzgp6mwgSQ4D5o1ycotV9+yr7xIRwwYY8q4qiGdnJjPUyOVoQQpE8a/w0PYAljSupqW2dOKLuWlTm2ANMcEQDyscCSUCbQXC1whpiLnHbOIfUhxGWCDbVnFqTsvT+rDc3h3YbbDZl53NeGN8e7udWeeXiXIrIyY00l+uyHdrRtC5Ukcze8Km9gbTVny7yJVqs9OdwaxbnO4y9FrUassBjBBLtz3vTRHQ4lGeKIK1QvhAxLQxwH9TaHtYCvCfnSIhlTZ7LNbWcJ7MyXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr8cgYp5GeD9SwzfDyUSwini0eynO141tzggy8vUiUA=;
 b=HQbzUUZBYZYtqBdBN7OynRyC8uovkZOvrslQgy+vgXUtBYHowlbMQUNAeGyyZwTw3Z9KOYe1mpQDrFAGTRgr/TdxQhE29mmCpUHpk1U/osIVNLgzaMU/bzzeUFMu8+YPqcrSKrMbqUQKuhcM4SQZwZGGSYjB7rMvWLR/K0YEHcjHXd3TnZhS5xQcAXEAkcDHp06w2WOrqS2XGyLdKNNSJQbQWRBN0x/Q4mih+Ci4xjzXvf9zED4B+mVMfa2O06G55hFyzf8WEJf8qSm7kVpvs9l/IwpM4EH+JvAScSI/YrCQ/l+29vygqRcLlFhPGghA94i0jkgClGexr3AE0W70HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr8cgYp5GeD9SwzfDyUSwini0eynO141tzggy8vUiUA=;
 b=Z+cPCja4TdmGfASugxYgmjOS4ZRT9pyvnuIusi/wurR5Ef1ncWxvXZMCUCZT88DnBCtIW3k0iEXZyzXt5bKgrVol0fF7u5QygMQuIyYb7kCdziRHosDvWMo6hyIvCWiOx8RQ91i9WkbF0MpeFJ8aA9EH9yb4Klk4H+owOgmqQgk=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 15:13:55 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:13:55 +0000
Subject: Re: Fw: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <87a6jjyhuo.fsf@intel.com> <YWAmZdRwnAt6wh9B@kroah.com>
 <02fc9da3-ebac-2df1-3a54-d764b273f91b@amd.com>
 <DM4PR12MB51368C12F6338C6F245D54B28BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
 <c4f1464d-19b6-04a3-e2d8-a153bfbb050a@amd.com> <YWBfvILqkBQ8VSYc@kroah.com>
 <936fed94-e56b-e4a6-6d1d-9830e8907d6c@gmail.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <50dd8132-6a72-4291-6f52-e3e14067f463@amd.com>
Date: Mon, 11 Oct 2021 17:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <936fed94-e56b-e4a6-6d1d-9830e8907d6c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0060.eurprd07.prod.outlook.com
 (2603:10a6:207:4::18) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [172.31.54.68] (165.204.72.6) by
 AM3PR07CA0060.eurprd07.prod.outlook.com (2603:10a6:207:4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Mon, 11 Oct 2021 15:13:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afacb965-1920-4bc4-e2a3-08d98cc9bde9
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5230E197E3D2AA6E6542DF858BB59@DM4PR12MB5230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foL+of8zRT+EgDrlyeijtMTtLj83H0Gj1bj5Y92QhSb4gN2hCbEOXe8fQCJpXgYP1DDTNxweyrVL6A5mjIPAfJ3BZ9sE3XAvHcHf8s9ur4ArVPbxV/JT7MV70fgLNGSJTSjI0rwC4TEQuzWjB7KOgdng4EqvTt7Y/yV9ptxpX9QtUETvc14wjHq7PVah9TYBh72oiKn726kT23JN440wunA1vBikaeB+hM1/Hb2jNYsEe3sp1/P0HvnWNg9Wq5OKuTuQtcmKbHGB7NuyCoPW8yWEMFahAgYah1CcZiB/vkOVwPJSqdv3tSFS0KJSU8gu9SkK5dwscVC9MZ3tq8a0hAXHpWvy86Tef+ABgRs4az3/tkwrksVpKHwpIq01hjBkoDEwVRiyLvBKERFTgoeZoaKLpRqxpbCC0sQR1Z5aQ2M53tjlp5Ai7A/2iPkvyq3UdQsMamax7WK30Uwymk4DcEm5QhATywV+T27eXI7EsMrxpj8YFOyN+ItTUVgP6NADY/stDFChvlSxSSr+my9Zoq1N/anicbor8uH33bmaK9oBqW9MfhOrIpmdo200F+1FvVnUksvsJ9/45hMZW3b3aF2+p9503AditjHsAm9G1s6nczfZrxHGIRGyv6jOS3AcHfKO+l6SpYsC95eAx8bgKxYCv8Fo5WEWA1dIY4unDuEamEq7G1TvwU+y+1fwGxMSnFPLtDbhoA6bkcVV/H6Ca+VC9oB8+dMGrde0BiW1wDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(31696002)(26005)(2906002)(956004)(2616005)(6486002)(66556008)(36756003)(66476007)(8936002)(54906003)(53546011)(4326008)(66574015)(8676002)(16576012)(6666004)(31686004)(83380400001)(508600001)(86362001)(110136005)(316002)(6636002)(38100700002)(5660300002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFdIalM4UTZ3MCtLSEtWRFJGOUhsbGJyRW9Samd6c3RSZmtsSm45QkRPVjIr?=
 =?utf-8?B?V1c0U3BGOC9oR0M3ZHE2YnhvWFpSc3F2MEVNZWNGVjVOT3Y5eXN6L1FZa1Jk?=
 =?utf-8?B?d1pnMk9NNDZYN2ozS2JUdmx6S2JuT3REN3BuVzdsWHVqL0NCZ1puLzJKb2dm?=
 =?utf-8?B?NmR6dFpUU2dLSGV4MFVEdnBQcXVHR3krRlNCVzNkUXlPOEE4dnpDUW1GbWJ0?=
 =?utf-8?B?VXc0cW4rVmJsNGRNaUs2Wml0SDVHZnViTjYwaVdHcDZONWZpZHVCMU9xRnRF?=
 =?utf-8?B?L3c5UzNtUllzUmJoNFIrZzh1YjEveXUrMjZyai9xNjc3RG5SWlBFMUg5OGNh?=
 =?utf-8?B?MnlhcE1wWit0RlpXVlBXdlR2d2RnbDN6Q1k2R1VrdG5UVFpvZGxZa2kyV1lv?=
 =?utf-8?B?Z0Y3TzF3MTh2M2tzK0VWK2RURlJqTll2MnFXZFcxYTROejdFUFNDZWFuVEF0?=
 =?utf-8?B?MDYwaDVyajZxbUxQMVFjOW5FdzVNRWs3ZEVlSG5sSXJ0N1Q3T0xoNXJudkZ2?=
 =?utf-8?B?alVBaklYa1NoOFBVemZaMXIwd2ZlRU5OZXNqRjRDU1RGMU1QdGZHMkdrbUc4?=
 =?utf-8?B?SVFRVS9lNWxWVERaVFJmbGtJODdPRy9OWm1zeENXS2o2SGtKYzhuR0dFSG02?=
 =?utf-8?B?clkybTJFWldsTzl0NEZXa0NGSjBnZ096RFlXZktFTFZCN0NrazNBOGozTXFM?=
 =?utf-8?B?bGdOc0t2QUpQc2JyQ2JjVVM5SXRrTXl2R3NLeVBuY0tOOUNNSHRUSndyaWRT?=
 =?utf-8?B?UzNPdUNtd21MVGplSndHVGUzVU54VVU0RittMGQvdzF5NEwyMWNHWDU0VTlK?=
 =?utf-8?B?MU12aWErY2Vsa21hN1lneUw4NnpDWVBzNnRDOEwrOEorS1VSaktCRnZBZUdS?=
 =?utf-8?B?OFhpblE2OURTa3dEWTB1cjgvcE9DNFAvZUkrZkxjUlhTOHpPeGQzTDB1YzEw?=
 =?utf-8?B?VTZNU2VXaXZBaXROS2hhSmFNT1dESXFrWCtTQVdjbWt6bG1ZSWdaQ0luUGsr?=
 =?utf-8?B?MWIvc2F1T0dkeUltNWNMN2F6QWNqZlJMc1JwbVNSYVhuc1RlSlNmblhuRTN3?=
 =?utf-8?B?UE1aeWpZYS8rNmtLZlVpNm9HZXVENGdpV0JxanMrN0xlZnYyQTI2Z0hIZDV6?=
 =?utf-8?B?UERqTEo4MWY2NEh3bkxhaWxNMlFhcHBCVGJKQnl3WXdGLzZqdU1CSTR2TWxL?=
 =?utf-8?B?SzdWS2NhTGorSTgrQmRaaFBDQ3I4Nldhbm9BVTJZTWtMM04yblJXVFpTZVBX?=
 =?utf-8?B?MmFrVTdPdWxzWnRaMWZSVDd2VVpjVUZkdmZYaTNvLzl6WGJqRVR5ZXR5SHp0?=
 =?utf-8?B?RXVNRWk2ak5CUUVFUzNiOHRGMUU0c0FjRnYwdm1COUY4SDNSN2Z6QXJiWXpN?=
 =?utf-8?B?TGhsRWY0Rkt3eDRaV2xmYUhVRFVFVHF6S3JyaW5hckVrRExsMytHVE9zclUx?=
 =?utf-8?B?MERjZ2FCZzZCTTc2MXhHSVE4MFVjbldmc0NYNWJId1ZHZDR5OWtZSm1wNkhC?=
 =?utf-8?B?enIwL1JyRlRTWWI1RzcxdFFHNERtVmZjV1FlbDR1SDlDRHVOek91NjBNNXZE?=
 =?utf-8?B?R3h3UlZtaE8rT2lBaCsxbzM1UjUzOVdhMnBxR0k5TzRJQndob3F6SndZN2c1?=
 =?utf-8?B?MytHc3NJOHdWZVpaVDN4ci83NnNCeWpXNHRaZnVDNllPbXB5c1d4TnJDVlRX?=
 =?utf-8?B?Z0w0aVpFV28xU3NoZ2dXOWpjKytoR1lsMXg2T3UwblRveGRuLzVJczlvVlQr?=
 =?utf-8?Q?tf7sAWXMo0ZmkcO2yk/5tU+StCFkG4BwzRnAcBz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afacb965-1920-4bc4-e2a3-08d98cc9bde9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:13:55.4422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jj5VBY6gIMWq5ja0bBDlCk09boOIZ+Bw/fgSAA63Qx9iuEiWo7fY95WNFtGQ2t04VKjHqKPIB+RXCF/h529M3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230
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


On 10/11/2021 4:19 PM, Christian König wrote:
> Am 08.10.21 um 17:11 schrieb Greg KH:
>> On Fri, Oct 08, 2021 at 04:22:06PM +0200, Christian König wrote:
>>> Hi guys,
>>>
>>> thanks Nirmoy for forwarding this, there is seriously something 
>>> wrong with
>>> the AMD mail servers.
>>>
>>>> On 10/8/2021 1:07 PM, Greg KH wrote:
>>>>> On Fri, Oct 08, 2021 at 12:40:47PM +0300, Jani Nikula wrote:
>>>>>> On Fri, 08 Oct 2021, Nirmoy Das <nirmoy.das@amd.com> wrote:
>>>>>>> Debugfs API returns encoded error instead of NULL.
>>>>>>> This patch cleanups drm debugfs error handling to
>>>>>>> properly set dri and its minor's root dentry to NULL.
>>>>>>>
>>>>>>> Also do not error out if dri/minor debugfs directory
>>>>>>> creation fails as a debugfs error is not a fatal error.
>>>>>> Cc: Greg
>>>>>>
>>>>>> I thought this is the opposite of what Greg's been telling 
>>>>>> everyone to
>>>>>> do with debugfs.
>>>>> Yes, that is not good.
>>>>>
>>>>> You should never care about the result of a debugfs_create* call.  
>>>>> Just
>>>>> take the result, and if it is a directory, save it off to use it for
>>>>> creating a file, no need to check anything.
>>> While I totally agree to the intention behind that I'm pretty sure 
>>> there are
>>> some consequences which are a rather bad idea.
>>>
>>> First of all the debugfs functions return a normal struct dentry 
>>> pointer and
>>> keeping that around unchecked means that we now have pointers in 
>>> structure
>>> members which can suddenly be an ERR_PTR() without any documentation 
>>> that
>>> they are not real pointers.
>>>
>>> What we could do instead is something like returning a typedef or a
>>> structure with the dentry pointer embedded and then document that 
>>> those are
>>> special, can be ERR_PTR() and should never be touched except for the 
>>> debugfs
>>> functions itself.
>> I agree, and am slowly working toward that, but am not there yet.  If
>> you look, I have removed the return values for almost all
>> debugfs_create_* calls, only a few remain.
>>
>> For now, just treat it like a "void" pointer that you have no context
>> for and all will be fine.
>
> Ok in that case we should just document on the saved dentry that this 
> pointer is not necessary valid.
>
> Nirmoy, can you take care of that?


Sure, I will send patches to document and clean our drm core debugfs code.


Thanks,

Nirmoy


>
>>> The other issue is that adding the same file twice is unfortunately 
>>> a rather
>>> common coding error which we don't catch or complain about any more 
>>> if we
>>> don't look at the return value at all.
>> How can you add the same debugfs file twice?  You have different
>> directories.
>
> We had multiple occasions triggering that:
>
> 1. Code accidentally initializing a component twice.
>
> Except for the debugfs entry and a bit memory leak we had no negative 
> effect otherwise and wouldn't had detected that without the error 
> message from debugfs.
>
> 2. Driver not cleaning up properly on hotplug. E.g. old subdirectory 
> not properly removed and re-plug.
>
> 3. Driver trying to use the same debugfs file for different devices.
>
>> And really, who cares, it's debugging code!  :)
>
> Well especially cause 3 once took me a day to figure out that I'm 
> looking at the wrong hardware state because the driver was handling 
> two devices, but only one showed up under debugfs.
>
>>>>> And then throw it away, later, when you want to remove the directory,
>>>>> look it up with a call to debugfs_lookup() and pass that to
>>>>> debugfs_remove() (which does so recursively).
>>>>>
>>>>> There should never be a need to save, or check, the result of any
>>>>> debugfs call.  If so, odds are it is being used incorrectly.
>>> Yeah, exactly that's the problem I see here.
>>>
>>> We save the return value because the DRM subsystem is creating a 
>>> debugfs
>>> directory for the drivers to use.
>> That's fine for now, not a big deal.  And even if there is an error,
>> again, you can always feed that error back into the debugfs subsystem on
>> another call and it will handle it correctly.
>
> Problem is it isn't, we have a crash because the member isn't a 
> pointer but an ERR_PTR instead.
>
> And adding IS_ERR checks all around is even worse than adding NULL 
> checks.
>
> Regards,
> Christian.
>
>>
>> thanks,
>>
>> greg k-h
>
