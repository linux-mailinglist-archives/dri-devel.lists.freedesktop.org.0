Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKGHNOOTrmmmGQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:33:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E723634B
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABBC10E15B;
	Mon,  9 Mar 2026 09:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HgXg7MGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013011.outbound.protection.outlook.com
 [40.93.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF9710E15B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxPD7YqMTcrhgr/5w/9+hS4YLj6e4cg8w5r4aQhpE6//1z4G5pHccXNyPRqMVqpItO6cmaXk9p+vJR9SfkC2EV9QyEVi/TIq5mIyO0XaXk6bZ/N9/8hkF4bDmTArnqLKDx4mGUTeYCODPqATYRN7cOM05fgfIsA/tsdLkfXejiVlkn98bNKSj5+kHaMQLcQbrf9v5WAn+xgK/iRDlH596OK7dScpYBQWPbNCRMO8L/mK7aXdmAAeeRIVPJ/hoodtTrc6vAO107rKLiCwn5rV1jouCPSwJCqbBs6p5FU67rrYkiyNb8jgzF34Vy3PCXlLmXQNCQ0V6TKVdVnXFbm/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RFfIKgMADVmIruHsdJ5DXpOIJQKnJ0c6W8ASuNMoFI=;
 b=rWl57359VxIyHPItO0PhkZTfewPiMLdjXsuHSR42MObcMh55gnhVzXUwQI1ffuFZSyzAYh1APivbOfpaJ2kgBHbFgZSWZCWMvSbF4O7nZP22Shyu9FTwIxliek7CgxEFoWj32uCg56kMQQa4rt18xVIEy3Ddy6vAflZhqfb8RbUFuxHcYi/uTKGUWecMFh6z/581MeuUSQUAugA3IUejwKtlqeAZ0GShs7w1qmx6RVg+LJjQkFmGtWOYhbXRuQRC0/T933lDL1xeVYdK6Bxb6NfknXo3pKscoRCqoPPxce7wf08NJcqp05BKa3xjBpV9BzS4OFmaExgbnI/oM1VyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RFfIKgMADVmIruHsdJ5DXpOIJQKnJ0c6W8ASuNMoFI=;
 b=HgXg7MGXJ8jKbSIPzblQ8fjYALULqeTG/7iNoL1b4EqGEbbvPlwOXWTpkG9S9CMgB9R28hzy+P1Y+Vx9VhjFLhGksXUbSVeEWycYX4RjzY3PmfgGtVmZKK/u+VxRhVTKcleSl3S6RbY8h2h6ZyjMts2C8tzpDtIYwZZ5yE54JpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:33:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 09:33:16 +0000
Message-ID: <f5bbdfe4-c9e5-42f7-9849-4c9d57360183@amd.com>
Date: Mon, 9 Mar 2026 10:33:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, dakr@kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
 <884567da-e884-425a-b0d0-c9a6211bc2ae@amd.com>
 <20260306155504.5cc6157e@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260306155504.5cc6157e@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 341c5ccd-e3d4-44d7-6449-08de7dbee43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: gZ9T2zTeekUPU7cmXqJX/ciZErnR6X8/CgvuCcNDqAtQPrslz6S3PFNInIqWIv8wzicyA5/VhFIIjZOVM8R0oIv8WZ4/m9Avkz4GFPIeXTh5re4St+U18sYvjZ57wnAlzU3JfahseREIrk45TT0ZXrgop20PyUQXbAduNBgdcrlSB7cgTZhWh5ShjLhFJm/HTPNH1PuTMlw597aOpXmrZx3IIN97RpoDI7IN1SJhbxIH1QtKXaFoEfIAJsIMk93Q2poIFDbdL+0+hp8DfwgP6+KiIeUlTG3X9JRCIIhTZbkIuzkGQ+ot/t+P0+JyR8ri7qzZKUMW42DpBoegbZsom2gM27HLwCy9pK9HfrcB9nNtj/p16dhc/0pqPeakH8ExlLKnFaIGBLpAEZFEQghJxatPZrxTz0GZ3R6c8PUbsP/MdBLHwAUC9iDd87oEIeQkC11OW7uYV3GXTpDoqdoU3UScac0USWRFDD0rEZB54FG1opXrMXy+RBS7AwpbteJTZwBCF2BgTqRu2nIjSyHlZErm/ujr6AfxUBw2+ZJt5ZjFjB4SGnKg3Wr1XneQDp6ItZL6PSWySqhx9MzkHZoQ3cvhujvGeigugf7I0OynAi2O4t7PiLm0kd1QiVzbeaKcPlVYIFQpYpl9cAmAIxGJ6SphqFGn0k9n57cHxDDvmTzSP5p1WvnjkxJ+duJdfbK0piufjHD9MUa7nZ6FFQ/3w0fTOnDtbY7/3bdIZna2jmQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXhjM1FnTFJGSzhiU0NNNzNqSWZrVUdmYWJFa082eFc4dXltUWtycW5OOFg2?=
 =?utf-8?B?ZEcvQWMwQzhoR0RRTnE5NzN0THRiYms1aE5jbnRuWTBWdmVPYkNiaHdUbGR0?=
 =?utf-8?B?QnhOblBMQ21HUHFIZXJtUFJweGIwZlJYYm81Y3hFOE9ycm81eDJZdVRlN2xB?=
 =?utf-8?B?eWJDNW5oTzhMTWN1bXVORjdJZWdGTDBZVEF5dytpMzVBVVZ0ZjlxVVdZdHp2?=
 =?utf-8?B?WXArd0R5TnVSZExobGprcHBGL1ZRakEzRVdURS9KZjh6Q0NPSEZEMEc3WUpn?=
 =?utf-8?B?TENpdUNYaEhiN2I5SXhkL3ZCNnp1eHkwQnhVTHMrNWFtSzkveGlWVGlnakh0?=
 =?utf-8?B?Unp3anNkb0dFZWNpdDl1SmpNQWxQY0ljYm9heWFITm9xbU5PRWJ0SVRxcjYy?=
 =?utf-8?B?cnh0cUsrallEeTdUbEdNYnFHcTdvZ1JUaHJzOHZXeUtwNk1ISElrZjZpUEJP?=
 =?utf-8?B?bzNnQjh1UTc5TjBqa0w1ZFk4alYxVUs3azRXYVNrdFZNdjAzQmdxcHlzWjVs?=
 =?utf-8?B?L2NPRnpCV0l1UTk0NWkzSW5kQWpHc2Y5ZzJ0NzFzbGQ4NzVDQ09HZnNjT3Z2?=
 =?utf-8?B?SXpLQjJWVWErUEdocXpPbEliZTVHSzhlQmkwRWtheGQ3NytKN245S0g3WHc5?=
 =?utf-8?B?dHRVbmZoaFlpNnF2VlU5UUVucUhKL2VMQUZNQ2lpZjJYT1BIemxWYTFiZHB0?=
 =?utf-8?B?ZlRPdmRmMFhhWHpWMmN0QUgzMWZKSkIyWVJKakh6VHpZVDY1U3E3RFpsMU5a?=
 =?utf-8?B?ak44TkNNNW5pNjI2ckJDQ3RXc3hXK2VQS3oySnVJTmNmdHZWbUVFTTlSZHE5?=
 =?utf-8?B?bzlkV0hpd1ppUzdYa1k1eUtHWm8zUWEvVjdlK0JrQzczVWJSamsyek03Tnkv?=
 =?utf-8?B?YlpwOUlTbStuR0gxMWNlSENsTU5MbFl3eWJ0OUJXNlROYjBwMy9Rb1VUakdr?=
 =?utf-8?B?NlZpc3Q4eksxRk5GU3c2YlZCVWpRRmx0TThVSHByMCsvMmllcHViaWhhMm9C?=
 =?utf-8?B?WEgraVdCMzBFSlk0ejQwMWhrcmdJWkVVUDRtbjhoTUJxa2RQbGQ5RHVQKzZq?=
 =?utf-8?B?WWFITkpFNUNiVW56VmludzFVN1ZEeWsyYk5zSzRmRzRlUXpwNC9IaVVodjNX?=
 =?utf-8?B?TExIWmdPQzVrMFNlclZtQ1BOQVVPb3YzVU5rdll1K2JueXh6M3dNU0dReGE5?=
 =?utf-8?B?emJyaENoNGlrRzBaa2U5cW45U0tsZENTN2EzWnpOcTUxc2VrczJNS0RpMFhM?=
 =?utf-8?B?THVvOHhURExOQnhtZ2MvRnFlRXl4ZWpPMk1CSzcwTjJVeGVsMk42MC9IQmVv?=
 =?utf-8?B?MTdLNmEyWFpVU01oT3IzelltSlQwaTI2TTVxVFNzVVdobUJGUzV2eWhITFBP?=
 =?utf-8?B?bC9WU1htNUtwVnB5Wk5RQjU0SVR2d2xjZHZKUjU4ZUt4RHBWVXM4WW1hNUVa?=
 =?utf-8?B?Z0JJaWJvcEl2c2lYMmxZeGVQSXhjbmlXUnZWN1BGOXBibVRsM3A5MXp3c1p4?=
 =?utf-8?B?S2xIYlloc0Z1WTJFcXJvTCtwTithZnNlNkhYVjZqa2ZpVXVLM3dnL3RBamUx?=
 =?utf-8?B?ZytacXpWREdCai9ER1d0NHFvcHNvVXVsM0o2QkhvMU5Id1IyaGpuaVRZdFE1?=
 =?utf-8?B?emJTNldFQXNNbGZkMHgyeFRIWEpoUjk0YVM4RUF6WG9MYVE0WlVXcW8yOC95?=
 =?utf-8?B?TVdKS1hYWDZQWTlwVmpsWnJQenRtUk5hUk5YQUFZSE9qVmJnSThuNS9nYWdi?=
 =?utf-8?B?Wk9uWTEvRUE4U3Fwa0JUd3o1WXExN1piRThTRFlhRE04SzdYMUQ4eFJLMUhK?=
 =?utf-8?B?UjZwUU0wWnhoUGt0RkpMMmZQNUFXRW9iQ0xaMjFKV2NEbC96UU5CVmhUdGNO?=
 =?utf-8?B?NWcyTDRKZWRIZmpsRklGcFhiMFNaK2gxSTY3eGs0SlpRWUt4NE1wZndTQUNj?=
 =?utf-8?B?Z2U0OHVKTnJVOC9OUk1JTGNoU2kxelFtNTdhZ0pXSTdkdUdWK3htSjlFSEtz?=
 =?utf-8?B?eGFsci9MOWJUVEx0TW5VcHU5Z25wb25OS3RvNXNqa3F5aFc5VlFTWEhNOEFu?=
 =?utf-8?B?dmVwaGZ0cWl1WS9MbkdLVStKSkFYL0U3RVJ3clE1aUFaeHpxVGtjVUpyR3NO?=
 =?utf-8?B?TGkreW1qRzM4QmxSUVEzT21CcHRqdTZUOFFFb0FTL2RFdElrQm03Uk9UZW9m?=
 =?utf-8?B?RU9xTVY1RGNtNjBQdjhmWUREVHpnazZTQVl3V21CcTNabksvWU9IbzBuZzhM?=
 =?utf-8?B?TzZ6TWxxMS94UitlUm1YS0pQeEJ4cDQzY2tlVkxPK3l5TjNKbG5ObHZNOUg4?=
 =?utf-8?Q?ugfiwCm/wtLCmFrdqE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341c5ccd-e3d4-44d7-6449-08de7dbee43a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:33:16.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fBafYr6NMzrj8ohifRAeZyvAU3znXjE5Qonoi9t+5XS4Xq7QsMPQDHAevh+NHdC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
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
X-Rspamd-Queue-Id: 443E723634B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/6/26 15:55, Boris Brezillon wrote:
> On Fri, 6 Mar 2026 13:54:15 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
>> On 3/6/26 13:36, Philipp Stanner wrote:
>>>>>> (which
>>>>>> is the thing that would be attached to the HW ringbuf. The
>>>>>> reason is: we don't want to leave unsignalled fences behind,
>>>>>>  
>>>>>
>>>>> Not only do we not "want to", we actually *cannot*. We have to
>>>>> make sure all fences are signaled because only this way the C
>>>>> backend plus RCU can protect also the Rust code against UAF.
>>>>>  
>>>>>>  and if the HW ring is
>>>>>> gone, there's nothing that can signal it. Mind explaining why
>>>>>> you think this shouldn't be done, because I originally
>>>>>> interpreted your suggestion as exactly the opposite.  
>>>>>
>>>>> I also don't get it. All fences must always get signaled, that's
>>>>> one of the most fundamental fence rules. Thus, if the last
>>>>> accessor to a fence drops, you do want to signal it with
>>>>> -ECANCELED  
>>>>
>>>> All fences must always signal because the HW operation must always
>>>> complete or be terminated by a timeout.
>>>>
>>>> If a fence signals only because it runs out of scope than that
>>>> means that you have a huge potential for data corruption and that
>>>> is even worse than not signaling a fence.
>>>>
>>>> In other words not signaling a fence can leave the system in a
>>>> deadlock state, but signaling it incorrectly usually results in
>>>> random data corruption.  
>>>
>>> It all stands and falls with the question whether a fence can drop
>>> by accident in Rust, or if it will only ever drop when the hw-ring
>>> is closed.
>>>
>>> What do you believe is the right thing to do when a driver unloads?
>>>  
>>
>> Do a dma_fence_wait() to make sure that all HW operations have
>> completed and all fences signaled.
>>
>>> Ideally we could design it in a way that the driver closes its
>>> rings, the pending fences drop and get signaled with ECANCELED.  
>>
>> No, exactly that is a really bad idea.
>>
>> Just do it the other way around, use the dma_fence to wait for the HW
>> operation to be completed.
> 
> But in practice you don't just wait for the HW to finish most of the
> time. You instruct the HW to stop processing stuff, and then wait for it
> to acknowledge that it indeed stopped.

And how does the HW acknowledged that it has indeed stopped? Maybe by sending an interrupt which signals a DMA-fence?

The point here is that all acknowledgement from the HW that a DMA operation was indeed stopped, independent if it's the normal operation completed use case or if it's the I have aborted use case, *must* always take the same HW and SW path.

It is *not* sufficient that you do something like busy waiting for a bit in a register to flip in the abortion path and for a DMA memory write in the normal completion path.

That's why MMU/VM inside a device is usually not sufficient to prevent freed memory from being written to. You need an IOMMU for that, e.g. close to the CPU/memory and without caches behind the HW path.

I should probably write that down in some documentation.

Regards,
Christian.

> And the HWRing object will only
> be dropped when that happens. There's of course a fallback for the case
> where the STOP operation fails (with reset, etc), which would just
> delay the drop of the HWRing. But the point is, when the HWRing is
> dropped, you should be guaranteed that the HW is no longer executing
> any of the possibly pending jobs. Now, of course you can decide that
> it's the driver responsibility to walk the list of jobs that were
> pending after a STOP has been acked and manually signal all fences, or
> you can assume that the HWRing being dropped is what provides this
> guarantee. And because the HWRing embeds you DmaFenceCtx that
> auto-signal on drops, you don't have to do anything.
> 
>>
>> Then wait for an RCU grace period to make sure that nobody is still
>> inside your DMA fence ops.
>>
>> And then you can continue with unloading the module.
>>
>>> Your concern seems to be a driver by accident droping a fence while
>>> the hardware is still processing the associated job.
>>>
>>> (how's that dangerous, though? Shouldn't parties waiting for the
>>> fence detect the error? ECANCELED ⇒ you must not access the
>>> associated memory)  
>>
>> The dma_fence is the SW object which represents the HW operation.
>>
>> And that HW operation is doing DMA, e.g. accessing and potentially
>> writing into memory. That's where the name Direct Memory Access comes
>> from.
>>
>> So when that is messed up the memory which gets written to is
>> potentially re-used with the absolutely dire consequences we have
>> seen so many times.
> 
> But then, I'd argue that the HWRing (and the underlying FenceCtx
> keeping track of emitted fences on this ring) should live at least as
> long as the HW is assumed to be running commands. That's IMHO the
> guarantee we need to provide: don't drop your HWRing object until
> you're sure the HW has stopped pulling stuff from there. I can think
> of the following two cases:
> 
> 1. The HW has a way to prematurely stop stuff that are currently
> executing. First thing we do is ensure the HW can't pull anything new,
> then we issue a STOP and wait for an ACK. When this ACK is received, we
> proceed with the rest of the cleanup. If the ACK doesn't come in time,
> we flag the HWRing unusable, schedule a reset, and wait for this reset
> to be effective before dropping the HWRing.
> 
> 2. The HW can't stop what it started doing. We make sure nothing new
> can be pushed to the HWRing, we wait for the in-flight ops to land. If
> it's taking too long, the timeout handler will take over, schedule a
> reset, and drop the faulty HWRing only after the reset is effective.
> 
>>
>> Keep in mind that this framework is not only used by GPU where at
>> least modern ones have VM protection, but also old ones and stuff
>> like V4L were such things is just not present in any way.
> 
> I'm not questioning the fact signaling fences prematurely can lead to
> terrible security holes which are worse than deadlocks, I'm questioning
> the fact this "dont-signal-before-HW-is-done" guarantee needs to happen
> at the fence level, rather than at the fence emitter level.

