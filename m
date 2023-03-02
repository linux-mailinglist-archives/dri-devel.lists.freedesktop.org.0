Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD26A86D4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5A210E223;
	Thu,  2 Mar 2023 16:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7507710E1FF;
 Thu,  2 Mar 2023 16:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmA5jBHoNuqcLq9eii3nVe9tgwXGZpXcJ7yfI+oDwVIATn5N+xDSCUWDiYN7I6Ueo83ZhqrnFLKRlMP4ubQLONAE0XTbCfPF94EQPIipposuBN1tzbhhw4FlxU7n7uXH3/TCPPIOSQpFxfbPUcZi2UpJKAualSthYz86uBsTJ3w3HXA5zEz4FeL5T0IDLPY3peTpygBPqFqPWhCqeKOWCSV+J3j7ZQxsZEtg64ajqovfwZI+b9wK1C1xrAdZumK2UEA3GfgAKE9nQ/0njfiT7JXHlRyGQqxAGlQiDvoRQ9pAiM/xhuBAHotV/f1KGJI7Mh9Cd/rjLLfBxjaB5XrXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYqSOg0yXfuFGcbZrIclt6q/IKOnuVwHYkpwsz94jqQ=;
 b=lsgFupxhrZYNJ6JxjvoP8ssGn0GIDKuaV6t/HjfaL7my+g97q2A9GhiWSSOweBabjHW7e3RXthdmNfwjpKUkLUiydVMmUixj1RsY9a2aHgX2caA6/0eN7UYBxyW6Ri8K59bNKAqoFXLkcBXhXIQhBalWOLKPXz4FFINixeXq6OVUJJSfMZDDTqvXeNAyTLYQz1Oosov8/5W1mlKhc1Fd2h9xHhjTRrPzE1711kiiytOPTddcMaVOir9VkHKSrhLCdBdF2BP0Bjj1QqhKFSfRFu9c1eJHVIv74SYYTBmZ3JmfI3dKF4lVpPJdPH8H1AgMylVrtptzFw6qRoxFy/5k6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYqSOg0yXfuFGcbZrIclt6q/IKOnuVwHYkpwsz94jqQ=;
 b=UP++Yn7GuVsP23LSonzCVKsGjb681zqeuUTTOeQLk1jth5g8fkh2HJSTGPijqwS8Rendj26vVcZeFYf31KwledPAndO7fsy82UvJ80hA9Ysg+70SMzGPFMUGAj7Gu001XqeHK6DudvtBMSu9tv6wOqZeartStAn4i7spCzKlBk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5948.namprd12.prod.outlook.com (2603:10b6:208:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 16:37:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 16:37:34 +0000
Message-ID: <f15b10a8-11f6-6c1f-c94e-71796aad9155@amd.com>
Date: Thu, 2 Mar 2023 11:37:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Simplify same effect if/else blocks
To: Deepak R Varma <drv@mailo.com>, Joe Perches <joe@perches.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
References: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
 <33ecbe8971bb9c90d72c67d43ca740abac160908.camel@perches.com>
 <Y82GHzOUHgEqTUq7@ubun2204.myguest.virtualbox.org>
 <Y/+z22xM7NNjX8VP@ubun2204.myguest.virtualbox.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y/+z22xM7NNjX8VP@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 6959d28e-9c9a-4c68-e641-08db1b3c6cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BCZQ3hFBRb28lLC1nIKbqYxakyNl3irs+t9saG1YMdQzzZSJei57hIVn0nwbdtro3WEjWxS6eSvxqp1+qy55jztjwPWa9fD6dDhgo1GLwlXQ6s8pYbzhgRP2Le3Dws8AxdmzW8qbImoFu4EvRzSJRM+YgclEsGAU2slu+H6onKQ4yll692vZUL9GN2Cucy/S15Kt8r78xwrYPB4O6XOH+AaQyzDM3amcHlAHLJCZv/hNmQDw0ZggAMha+k8HTzrCl4o6bKyXYgdw411WoOhjB4Mhoy1ylPeF+9CsesjuoQJVsd31e03+VLx+unVB7TVqcQP18ArPDM8VxWcOtzHvyxbwISHIya/aYcl/3XJMPnR6aeJGXkwP6mK4VseFAm1LuF4aFEvajtMRWiSbiQmPE/BnJ2TQ4awGk+OXhG8e+vwK0MRwM2Iv4XqpNTEOhRyiZQa6LtJ1NIvPOnaQVCqqkxdGsMxGShPP/Eb5jEsEA9Vq9iJB3VhFsoRqBApy3gqeqQZD7KbnJzk/PxzjUdBAXWzWjdDnCJkPBX+/IStIOgrwkdiXM/SnuD/9t57aMUuDfRB+1vk8J9kCummdYOTh+FSK5pZ3UK0iSOWLhb7zAnFXuAtVuVi3UBtZtnWUzws0wnnXQD1rF3ba/pcyV0bWUjzyJdy25RHkoLpank2u5CpiHxMWLGjbOM2DQSKQm7UluknBzID/AGQVmO4YnAkrQ8Uil1hmZgmNrmJfAY8N+mE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199018)(86362001)(31696002)(36756003)(2616005)(186003)(4326008)(53546011)(8676002)(66476007)(66946007)(6512007)(8936002)(41300700001)(6636002)(54906003)(66556008)(6486002)(110136005)(478600001)(6506007)(5660300002)(26005)(6666004)(316002)(38100700002)(83380400001)(44832011)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zjh5bHBMU1BGSFlXU20yVVQremNrcDVxUmtUQStjai9aNERZQWRmZHdSVlla?=
 =?utf-8?B?YmxrSzNxVTdkZnc0Nzk1TlB5ZlpEZ3l4RFZyeWFUdFRyc2txUEZhNjkreTVZ?=
 =?utf-8?B?aFk1bVVvZmlHK2k5RndXTzVuZVpZc2hjdmRQOFAyL1lBbmorUE9lUDRmSlVP?=
 =?utf-8?B?OW5FNzFnODZzemoxVVRTUnB6NXdpSEtpa1MrbHJWOUZJNnlOc3pCaEphNFdE?=
 =?utf-8?B?ZEZkZHRGRlJKQnZsbFpuMDR4MXZ0cUswR29aTVFoeHFnd1ZPeWxpWjFGNis5?=
 =?utf-8?B?VEZRSC9hc0VqdlRTcHhvbWhRRThyc054N0RCaEpOc0VNNVVYbnNMelIrMDZo?=
 =?utf-8?B?SVFjUitXV0pjQjQ2OWpPOU9VMkxuQm1mbjJ0RjNwN1RpT3JWVVNyVHJCVVhV?=
 =?utf-8?B?Sy9EOTFCMFBrZjhjOGIzV09ZUGMvV29KbFRySUZjSWlMZjk2VzN0ZEZXT3I5?=
 =?utf-8?B?K05wUnRRTldsdzBNZFA4a3ozY2dmVVVLNXV6dFYvMTVWTVFoY2xaTS9OL0w1?=
 =?utf-8?B?QnZNbXVkWTJjb3cwdmZnTS9sRTRJQTJ1OW1qWEpmUGw2R3ZWQUVqdW80ZW9T?=
 =?utf-8?B?b1cxcjFFbXdaeE5jL21ML2Y2US8rVk1hM0QyZjN2UTZ0eVlJakJRSURZQ0tY?=
 =?utf-8?B?SU5Udm5QSEt2SE8xTXFkbEN5QmtVa0tHdlNKMk53YTlkUEs4VHdUUjVDNW85?=
 =?utf-8?B?WUZ6WTRmSVJrbDJ6WCtCb2tqV0RWSTczTGNZcXRFdXZockgvdVhER1h0Tjdx?=
 =?utf-8?B?VDhHMGlYd3RXOXR4RHFCbEJSVEJIa2F6anpuL054bE1FUkNMMmtjTEl0VDhI?=
 =?utf-8?B?UUg4dDFBL25VdU1sTXQrSlZxUTVheG5zcGVEdUFHeEJuUFF3K2JSMytNZmRh?=
 =?utf-8?B?enRzNnRoaHAzaVJ4WDY0NWpsSC9NaUYyV2lMTnA5U01wVTBSR05jU0tMUStw?=
 =?utf-8?B?b0Q4TmJrSGhnczdSQnpUUE5rL0tpbmJmbkFOSGc5b1FkVDhLN1o3WTB1dFFh?=
 =?utf-8?B?bEZ2eE1rVzNJNURSRW0wVjdxWS9FVWZyQTI2WVdVSjE2aWpMRDdEQkozL3Rt?=
 =?utf-8?B?QTJveWcvY3FmOGhXVG5RWWtHelN0Y3VRSHVmSlhvWktrS09PRnduUDg5WFdq?=
 =?utf-8?B?M2JhZkxGZ3BiZDdhN0plTG05Y3YvY2lTNmc2eTFZMTZtNldHOVVsTjFvQnlv?=
 =?utf-8?B?dmFRMTJnZE5IUm16eTFDMFhOMFhlbkJ3Z1ljWjV3K1p0ZGpEaGxna3d5amt6?=
 =?utf-8?B?TS9qKzRleWxvQjI4NHNwZldFaVNnamhScTF0b0tPaHM5UUlZbkZTME90cmJr?=
 =?utf-8?B?RXZFZUxJajBwZmdZVmUrM3pEWFhDUE90T1ZvSTJQYnRHOUVOd2pRZ2xTa0E1?=
 =?utf-8?B?QjJhdmNHOEVVYXBMWjd2eDFuNEJkL3dibzZjQzBQTzh1MWw1alNjUHZaUU56?=
 =?utf-8?B?bENmTUMyb3VxeUlhVnVmNFZlRVFvMHZOMjRZb2JuOThLVjVjRy8rSytCNVNO?=
 =?utf-8?B?bXBkMk4wRkFENStIMFZuZGx4UHpMTGFEclM4Q1ltTnNIejl2ZkdDdjVHLzNi?=
 =?utf-8?B?ak1yTnhYOVluM0ZTekhrU3B3Q251NTVXZ1cvMWtON0VWZzc1YlRkOTQ4Y2ZS?=
 =?utf-8?B?YTZpbmYyVmVabkN5eDVoQURablRsdWVzdjRBMVR2am5wdS9RZW1EMzd4ckx4?=
 =?utf-8?B?dlNPdWRzWXhONlpUc1RFbTRoL1VUcVpFTm5tWlBHVzlsbE8rWjlPNXErUm0z?=
 =?utf-8?B?akpPOG5VSCtkK2taQVQxWUpvQStTbVlQcTdoS3hMZDVjQTRwR1dlNzdsZzI2?=
 =?utf-8?B?VTNXeTZmNjMzSW1GZzJzNUtmTDIyVmNHbzA4cHVMREdibkRIRks2Z2pycTBR?=
 =?utf-8?B?OGpiYzZrc0dtMEhiSWR2TU9yK2k5ZFFqYjgwNExsZTJzaCthUkhOL3kwejlN?=
 =?utf-8?B?TGxGSDVWeDJkV2RJV2NNcFJ6L2FLdjNwTFdTMDRScGw2VXFnYWJUTytmcUgx?=
 =?utf-8?B?THVmVGJTTHVyejhETlp1VDNEaGhlS1RKaVFEN3NkUTlrQytCOGNWbXZUSWFE?=
 =?utf-8?B?UVFjQi8rcmI5ajNzWWRHcVhyK3pPdXU0MDl0bHk1aWkvbTRJano1Q0Q2NDk4?=
 =?utf-8?Q?JR0zgtQ3w6g+BA4WjvaZudkes?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6959d28e-9c9a-4c68-e641-08db1b3c6cbf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 16:37:34.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An7Gglp00PJt+iOslAvBZw95lM+ji012vCIblMEGBrRMOkItEG+KgplZFDqP9l6aFi8waRKndA+8S46aVbdTLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/1/23 15:21, Deepak R Varma wrote:
> On Mon, Jan 23, 2023 at 12:23:19AM +0530, Deepak R Varma wrote:
>> On Sun, Jan 15, 2023 at 12:52:10PM -0800, Joe Perches wrote:
>>> On Sun, 2023-01-15 at 15:30 +0530, Deepak R Varma wrote:
>>>> The if / else block code has same effect irrespective of the logical
>>>> evaluation.  Hence, simply the implementation by removing the unnecessary
>>>> conditional evaluation. While at it, also fix the long line checkpatch
>>>> complaint. Issue identified using cond_no_effect.cocci Coccinelle
>>>> semantic patch script.
>>>>
>>>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>>>> ---
>>>> Please note: The proposed change is compile tested only. If there are any
>>>> inbuilt test cases that I should run for further verification, I will appreciate
>>>> guidance about it. Thank you.
>>>
>>> Preface: I do not know the code.
>>>
>>> Perhaps Rodrigo Siqueira made a copy/paste error submitting the code for
>>> commit 9114b55fabae ("drm/amd/display: Fix SubVP control flow in the MPO context")
>>> as the code prior to this change is identical.
>>>
>>> Perhaps one of the false uses should be true or dependent on the
>>> interdependent_update_lock state.
>>
>> Thank you Joe for the recommendation.
>>
>> Hi Rodrigo,
>> Can you review and comment on if and what is wrong with your commit?
> 
> Hello Rodrigo, Alex,
> Could you please suggest what would be the necessary fix for this typo error?
> 

It's not quite a "typo" error. When I look at this code in our internal repo I see
a couple missing lock calls here that differ between the two cases. I don't know why
this was never ported over and am surprised it doesn't lead to issues.

I would prefer we keep the code as-is for now until this gets sorted.

Harry

> Thank you,
> Deepak.
> 
>>
>> Thank you,
>> ./drv
>>
>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>> []
>>>> @@ -3470,14 +3470,9 @@ static void commit_planes_for_stream(struct dc *dc,
>>>>  		/* Since phantom pipe programming is moved to post_unlock_program_front_end,
>>>>  		 * move the SubVP lock to after the phantom pipes have been setup
>>>>  		 */
>>>> -		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
>>>> -			if (dc->hwss.subvp_pipe_control_lock)
>>>> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
>>>> -		} else {
>>>> -			if (dc->hwss.subvp_pipe_control_lock)
>>>> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
>>>> -		}
>>>> -
>>>
>>> Perhaps something like:
>>>
>>> 		if (dc->hwss.subvp_pipe_control_lock)
>>> 			dc->hwss.subvp_pipe_control_lock(dc, context,
>>> 							 should_lock_all_pipes &&
>>> 							 dc->hwss.interdependent_update_lock,
>>> 							 should_lock_all_pipes, NULL, subvp_prev_use);
>>>
>>>> +		if (dc->hwss.subvp_pipe_control_lock)
>>>> +			dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes,
>>>> +							 NULL, subvp_prev_use);
>>>>  		return;
>>>>  	}
>>>>  
>>>
>>
>>
> 
> 

