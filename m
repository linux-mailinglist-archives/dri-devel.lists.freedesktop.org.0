Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72356AA0A6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 21:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37F989130;
	Fri,  3 Mar 2023 20:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9E890CE;
 Fri,  3 Mar 2023 20:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNxpzm03YXdg19AaczfG9iJ9zDyoOp8upQuIy3eI3W/AlkS75gAuAEQPFNgS0jlWSo4/rebbeafvbMmt2L1cceAHXINdUOi31XiQxGY6XNxCsDm+EU1wLbj8NJLvmwWgUx2p1kL/lsNoG298FVSOStT0hlX8bVAkTzV8FmsESod2N0svWXUmZG3RctF5ZHD/+c7PYkC5kgPMf64eZPixMuBTm+4tUbCyhcReFPZU7SbKf8bpYl86OGJzOQklVVXngiB/4+U9T6ZCL7svWphICGiR7/nERtJGy20l/ARoU3EGZ6MbpO1/8HxGj/lxK3NSNEAqWvtq17k8AK+VREvOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwS9XM+Nm7QydglutoMe0oUAS5rzaMNA2aGdCbLgva0=;
 b=XYs4Bq8+KgwDYrt+aAcfZJCFfrMEpFo4nGAVhNhbEIGHcV2egILCtsKY0G8xAT7UbjKIjk2dFO0PhGC8YWEj+/foEiHNl/kc5oQXwUwCuEQxVrD3yToj/XYzA7GusQ6iea7ZIQaZKh+YgwUh23cxpRySN7rEdb86IRmNaOphZ6/7cb5a7meLh8CiwydoSrGzp7bIxKzyQlnJq4iEmhysSNzByfKoLI4Lz1EDsFQkZGSn4yG15PO30I51HvpH6YTqZlT4fqn6TWnwZACf6cW96NctWp1VNnJbIYegfCViq9fUiU67ORIpP6kUlpVFIhXnvLzl9oMxmmm55dzr41SNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwS9XM+Nm7QydglutoMe0oUAS5rzaMNA2aGdCbLgva0=;
 b=ZnV0MVZg/+aNdg94Q8A24GMR+4CkCkmh/lu0RmAEXEWEPW8D10pvC4MYLbButfHjCLTMl9aYf4F5kxUssVclkubw6l6xLJf133CTbzQ9xhy1zjv3uXQ2IL7qdrQvYOZ7rOqkGJwWAZd7ib0EscpFwRv9GseuaQ24SKh105tMsBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 20:36:02 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 20:36:02 +0000
Message-ID: <4d670a5c-b680-ba76-a640-88b3d945c0b0@amd.com>
Date: Fri, 3 Mar 2023 15:35:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Simplify same effect if/else blocks
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: Deepak R Varma <drv@mailo.com>, Joe Perches <joe@perches.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
References: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
 <33ecbe8971bb9c90d72c67d43ca740abac160908.camel@perches.com>
 <Y82GHzOUHgEqTUq7@ubun2204.myguest.virtualbox.org>
 <Y/+z22xM7NNjX8VP@ubun2204.myguest.virtualbox.org>
 <f15b10a8-11f6-6c1f-c94e-71796aad9155@amd.com>
In-Reply-To: <f15b10a8-11f6-6c1f-c94e-71796aad9155@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 796a42f5-67e9-4553-8686-08db1c26e74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9RwHoZ39k/SD+8lLX5alQvg9lvNz2n/k2pWRqpZJe+ytSsGl6BBFEsiTdRh/2S1UpIAHQRkJKCDoLG4zTXWTCFgk/zNVbMLrWt4hpWg3elSm7BsL6zlc7y5xfVq7wlhnLwV/ri92nEAh/n0hVIliA57dDBzlAqMii6GmCEHZMaAFwsxvowvWfTdmWsZ+Ww0iq7kKQ68KssmqvKUEYxEKVO3CcxW1nx0HlDMTVpkpKhrLxcCtG+afIEd539nojKs7InoNG/B5CwakRW7SqGayRoDiwHKvQK/Oi7J/c3qjFGAE2ax+le8RdWkXyWbpElOLy90ez6To0eVXFN066GdPEpX4CBfhjRzJQsEsnHk4msMwoqpU/M6cCY7Rf6Nbi2dyNvKVtVFlRRFHvEpp957LNIwYRNscYz8UIvNSaDEjzSxe4KqJ0OuBOr0KA1x8TO9ISL/n2tBVd+R39XoEC2V1XQtK8/zYKvjXPnvnMw3Ze0uQTdAPd8hPlD5YnGVmoxv71Uelwr6TywWjLfZlH65xMJdtmyU2P/+EeUxGbC/HdACYubZVLS/QAsyBCh2jG/YOHLwFsLZ4FNIBY8DPGSjcS1wY/wlZjCpR/3XgUoq+G96H93yALHURRAgfnyq31iOMh2nTX2afHuZ0nc1/MvyNfWpM6U0YyVbWGKqv5mwGa0f2Eq+KAYTNg4oTHrWIvaw3GNeh9CEYAZSKeI55sF6Jr2ySraM6q5aDzAQUGnbpFo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199018)(31696002)(86362001)(6512007)(36756003)(66556008)(8676002)(41300700001)(186003)(53546011)(66946007)(4326008)(8936002)(2616005)(6636002)(54906003)(110136005)(316002)(478600001)(66476007)(6666004)(6506007)(5660300002)(26005)(38100700002)(83380400001)(6486002)(2906002)(44832011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU5OMldnMm0rSWNLM3JVbGx6cDArVW9wYkxsUTRlcnVySnQ3VkxmcEg1RWdW?=
 =?utf-8?B?cXpRZERQcFQ2Z1gvekZoSVpjcDVGOXpKQlN0TG85VndxTU1NRXgycCtTdDhH?=
 =?utf-8?B?Y0paN1dUdTZxK2FnYm9IbjlSTlpiVXYyZjFBdHVyM3Qxb2xoTVozbGd1U1g0?=
 =?utf-8?B?SERRR01RYmRzakhXWmxVRkQvZ1JEeDR5S3hiY0dGdXRYSGN5UktJTlZXRXUx?=
 =?utf-8?B?aFZBWCtPbzVISzdPWERtSGl4Q0lOd3Mya0Q5TFM5dUo1SGlyV3E5TDBZZ2ZG?=
 =?utf-8?B?eFVRUUgrcDV6YnY5dmRGMHFIMGVidENYQ2FiTEkvQTJRa2V5eWY1Q2Fpc21T?=
 =?utf-8?B?YXFTRFlWZ1FuZDZiamdkY3dZc2t5eFhXZ1Mwbk1MSXhpTm1NT0E2U1pXbG1X?=
 =?utf-8?B?bUZaTkk4VWZFaVZNTzdhKzZRU3AzS1FOUFRSOHVpalBmRWx5eFJZTm1UTVBs?=
 =?utf-8?B?d3h5ZzltU0FlNC9GQkVoUjZvN3hWN0lTbFJ3ek8ydEhUYWNtbjFVSkRGMW5K?=
 =?utf-8?B?eW9WN2tuS3RxRVhRLzJjL1dFdTJZWlRWK3d1NlNmVCt1WE5YT2k3NnRxOG1K?=
 =?utf-8?B?dTRzamFrc2J1UG9rVlI0QzhxTnlJVDdkWThZWlI5MDFYN0lKWlpRYU94bnM3?=
 =?utf-8?B?RWtwSkxIMForWUtwWHRzUi9RM3B3YWpML2dCbFA3TEtJQkkxdlVoTnpWamh3?=
 =?utf-8?B?bWJVMGNrN3h6c0YrRzduZGprMUYxeFNXK0p3MHh0cHFYVHN6eXBvZ0RkS29M?=
 =?utf-8?B?NUo5QUJmeVBSVTJsZ2VoZVUzNU1ad1daREQwSy80OENCczJ0c25pYW0yQis2?=
 =?utf-8?B?eWMyQ01HUTNjb3FyWCs1ZjFFTHBYazJ5Y3cycVFGQUd4eDQwcFE2SGJYczRq?=
 =?utf-8?B?NVB3S0xTcjJIQW1XZjVFME5jZGF2S3NzUWlkYXVhVTh0OUd4a0tFRUJpd0dF?=
 =?utf-8?B?REt0WG90S05LaTNGTkUxQ2hITDEwNXJ3dU5tejROUUxpWXRnNHlzOC9obUpZ?=
 =?utf-8?B?S3lMR2FzN0YwekJHTng3eTI0bTY2VVRwOE1STHg1N05WbWxqcWxjTkRwc0xn?=
 =?utf-8?B?aldZWXhJV28xTExXc3JVM3pGcWd1QmVudVJ1cnlhT3NoVG1zVi9qUmNqc0ZH?=
 =?utf-8?B?M20xRVhwNnVETGZMQ21Ua3pMcDBvc3hVZSt6YXl3RGFlVXBxRC9MeXA2K2Fo?=
 =?utf-8?B?STI1a2ZCNTVnRi9oR00zeW1USEUwZko5Zy85cjYwNFphdU5GNGJSb1FmNm5R?=
 =?utf-8?B?cWNmOXAvLzZnejl5MjN0TXJobExpREFVTGpaeXVzRW52MlljcUlJQkREdjhD?=
 =?utf-8?B?NmRCVXZuWXZKRlZIQVQxclpEbnlhZnNUTHFHMzNGMWFMVFlCT3VuQkJVaHlT?=
 =?utf-8?B?ajVEZ0pOcTFaa0xkcmU2UkF5WER1NG9XaURJTjlzbWViSlRQc0NhZkxNOTdI?=
 =?utf-8?B?ZUpReEh2UjZPdDJYMjkrcFp2K1F4M3hNZXlvcElVWEw4cDJ6dngwaE1KU1gy?=
 =?utf-8?B?azRuLzA0RDJuMWZvd29lVzZSR3lleUVtb0hVRkVZWUd5YWNvalFFTjNRL2xS?=
 =?utf-8?B?L3RjeTVva1ZSV2JDdjlLb3NGZ0c0anZINi9XM1FQWTQxU3ZXbVBYKzFNOEha?=
 =?utf-8?B?TTBaK3lhcTRzcURZMU5ZbXZwUGF6TFBabGJCMHBWQUo4SWZNbVdBTmZRa1Zn?=
 =?utf-8?B?SFBOMTFWd25hMWRvRFphYkxmblVuMmxRckhQdm1udmZRYzlIOFFvSWJ6U21S?=
 =?utf-8?B?RThwL1B4TGdWMEZDRzZEL2RmQVhwYlN5SGJRTjFDOXpJc01jODBoVTMrUjN2?=
 =?utf-8?B?OVMvOXdwYUV1ek9RMk05SjFnWkJieGVRQWNvNlZ2NXhQQnMrTldybXF1MXV1?=
 =?utf-8?B?TVRVVHd1WlVTSDY0K2gyS1IyejFSUjRZdHpJNzJEUEpyQ01kQ2JmckJEUmtx?=
 =?utf-8?B?bDJzbmp4WlQ4TWNTamdaNVF0dmxTY1BvNGx6bW96Uk1VZVRmMEpXbjlCQWVO?=
 =?utf-8?B?aFF1SVFqWk9lRmVwTWlaWkdJcDRRUmluZXc4ZitZeW94WCtTMXAzeGRJT2xx?=
 =?utf-8?B?OXJLM1NFbWdKUEluYjQ0RWtMcnBaNDFJZDd2R3prbCtUbmRpajArYkVRWHJ5?=
 =?utf-8?Q?FHLg+JPVSa4A0V4qbLnenBqsl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796a42f5-67e9-4553-8686-08db1c26e74a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 20:36:02.0133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7EMzeqk/IL5JG40NY6G0WJnuMWMbu4c5Sp/MxXSBAACAoALG/YTs05KSLF231G1iTeUYEkWgEprFYq+dPZ08Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844
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



On 3/2/23 11:37, Harry Wentland wrote:
> 
> 
> On 3/1/23 15:21, Deepak R Varma wrote:
>> On Mon, Jan 23, 2023 at 12:23:19AM +0530, Deepak R Varma wrote:
>>> On Sun, Jan 15, 2023 at 12:52:10PM -0800, Joe Perches wrote:
>>>> On Sun, 2023-01-15 at 15:30 +0530, Deepak R Varma wrote:
>>>>> The if / else block code has same effect irrespective of the logical
>>>>> evaluation.  Hence, simply the implementation by removing the unnecessary
>>>>> conditional evaluation. While at it, also fix the long line checkpatch
>>>>> complaint. Issue identified using cond_no_effect.cocci Coccinelle
>>>>> semantic patch script.
>>>>>
>>>>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>>>>> ---
>>>>> Please note: The proposed change is compile tested only. If there are any
>>>>> inbuilt test cases that I should run for further verification, I will appreciate
>>>>> guidance about it. Thank you.
>>>>
>>>> Preface: I do not know the code.
>>>>
>>>> Perhaps Rodrigo Siqueira made a copy/paste error submitting the code for
>>>> commit 9114b55fabae ("drm/amd/display: Fix SubVP control flow in the MPO context")
>>>> as the code prior to this change is identical.
>>>>
>>>> Perhaps one of the false uses should be true or dependent on the
>>>> interdependent_update_lock state.
>>>
>>> Thank you Joe for the recommendation.
>>>
>>> Hi Rodrigo,
>>> Can you review and comment on if and what is wrong with your commit?
>>
>> Hello Rodrigo, Alex,
>> Could you please suggest what would be the necessary fix for this typo error?
>>
> 
> It's not quite a "typo" error. When I look at this code in our internal repo I see
> a couple missing lock calls here that differ between the two cases. I don't know why
> this was never ported over and am surprised it doesn't lead to issues.
> 
> I would prefer we keep the code as-is for now until this gets sorted.
> 

Actually I was wrong. Too many similar-looking snippets in this
function made me look at the wrong thing. This change is fine and
Reviewed-by: Harry Wentland <harry.wentland@amd.com.

Harry

> Harry
> 
>> Thank you,
>> Deepak.
>>
>>>
>>> Thank you,
>>> ./drv
>>>
>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>> []
>>>>> @@ -3470,14 +3470,9 @@ static void commit_planes_for_stream(struct dc *dc,
>>>>>  		/* Since phantom pipe programming is moved to post_unlock_program_front_end,
>>>>>  		 * move the SubVP lock to after the phantom pipes have been setup
>>>>>  		 */
>>>>> -		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
>>>>> -			if (dc->hwss.subvp_pipe_control_lock)
>>>>> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
>>>>> -		} else {
>>>>> -			if (dc->hwss.subvp_pipe_control_lock)
>>>>> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
>>>>> -		}
>>>>> -
>>>>
>>>> Perhaps something like:
>>>>
>>>> 		if (dc->hwss.subvp_pipe_control_lock)
>>>> 			dc->hwss.subvp_pipe_control_lock(dc, context,
>>>> 							 should_lock_all_pipes &&
>>>> 							 dc->hwss.interdependent_update_lock,
>>>> 							 should_lock_all_pipes, NULL, subvp_prev_use);
>>>>
>>>>> +		if (dc->hwss.subvp_pipe_control_lock)
>>>>> +			dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes,
>>>>> +							 NULL, subvp_prev_use);
>>>>>  		return;
>>>>>  	}
>>>>>  
>>>>
>>>
>>>
>>
>>
> 

