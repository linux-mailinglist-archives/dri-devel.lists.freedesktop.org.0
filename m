Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B89108C1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55AA10EA50;
	Thu, 20 Jun 2024 14:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="311g0Olj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F1110EA4E;
 Thu, 20 Jun 2024 14:45:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye4KD+tVjl5ZflTprtJ0Kyib6TgmoxSFRAFZXFOlSm0e/Uk/LbVHDUCfaMZrrfBTqoCyvaVlo2NsggVGToNcylWo3ami8u9FOyAZ7v7jHgb26W1FZGt5w1/Gi3ouyznG+e1PF0v17y4+dcCfPzj0s2O+iV5VnhDfSZSJwDW8dbb5rhK8oLakshZ3q54BRJ8C+aW1IH5Nw88KIK1yIZVcKiJevKqGJ9Ql5cDTY18sJYgN4/agbqZqFlRlGQwXmF531zcPolxD44HaOobMhjwrcQVJqIr9bOAwtY+BCiEoZOWhBvYzu/oI/1VmxPvTBhOoDF7xNybs8rvaXGtyC18Msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaueb1BjYiuU4/jPtwpllTDmTQV+pl2rtgZ6IHr9MHc=;
 b=WmaAigk9s9fQ6p46dDseSPm/IoqoqmziE8Jyd1Tr3a0CMt4EZ2aElN9mt1Z4GEA+ezdLHbxZQC4ualXuzuVLVxZHXjGs7C4gbC5+GjPuvUT/AwXFZ9epbRi/d8jag/LJQk8BdQFskaZwKuO1UU0m513pfPXvW5eo+MMUbqIa7sPSLvCH/mAXcpAEWX4njBchiQyU4TIz7AcW4MXNWkSqp8bz5vxFFeduVqxvUDMKkJMPj/pbb16iixWvQivY8Y/FH3sbHgGPDC62Vzt1czggqpGhUcC30qniweo5/O4UJKZTM9zc7xuyyFLo2lg0HvcrXYObrIirOHkqXDwdTiuDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaueb1BjYiuU4/jPtwpllTDmTQV+pl2rtgZ6IHr9MHc=;
 b=311g0Oljs0Mq8pdh+LFyZHb2zwCIrMK43k1IKkHAJcWtN5FIF7YWVGkdvbGPhoJgf0+j4Upb718U3nTnlvADh4r3BMoLjLVFfaGqwjPoERAUvOSxpOOv9pOKpN7ira1Mdw+Xb7liwsVVdznnBtmA8H/w17buLEWvs+BFT4tWXdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Thu, 20 Jun
 2024 14:45:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 14:45:47 +0000
Message-ID: <46783eff-0283-402c-ad09-9917e6436632@amd.com>
Date: Thu, 20 Jun 2024 16:45:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/ttm/pool: Introduce a way to skip clear on
 free
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
 <20240620134656.14380-2-nirmoy.das@intel.com>
 <71e4aed6-d9d3-41cd-b043-277e9573cb3f@amd.com>
 <f81307fb-b63b-4f87-9e20-a8033faac514@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f81307fb-b63b-4f87-9e20-a8033faac514@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: e128bd88-db95-45a6-be21-08dc9137abcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVZiNllBV0wva2FVOGlmL3dnREFaaXpmeHlaOGUyaVhmT0NIWTdVOW0wSEtV?=
 =?utf-8?B?aE1XVU1XZVVoYUM0OTNJMS9iKzNyTnhVKzhMY3cxVzYwZHppUzNBb1JaT0pD?=
 =?utf-8?B?SW9HblRvS1ZxSCtoVmlCWHk3RnZRYTJvM3Bra2xWQWN6MlI4MFY5dU1Va2dO?=
 =?utf-8?B?T0RSY0hzaHYwc00xeDN0Rms5RW5EU1F1RWFYU1FFK1FDVWtJR1oxRG4vWkll?=
 =?utf-8?B?SGdpa3ZCNlg3WHVoRFdIdWhiOGpEQ0V3Z0hSTTJXOWpyYVhpYVN1c0JjWG1k?=
 =?utf-8?B?U21UbFo3TnBoNVZ2bkc5WFNudVRGWkdVZDVORGtYNzlpTlRqSXhIdHVxbXNZ?=
 =?utf-8?B?ZGY4MUthTEZtL1dXY2J1bDV6d1c0UHNwLzJPQWhyUlh5ejR1bzdMUnNjdUFQ?=
 =?utf-8?B?L0xITTFyT0RCSE9MTEcyaStzUGljaXBzQzBsNXRTWEdGYnA5OWdHaFFqalBH?=
 =?utf-8?B?eHFxNzJ4bFRpRnVxRVM3RktnR1g5aGVXWnFwK09JRWF6eG1XUmJDWS9qQzZ0?=
 =?utf-8?B?aER0Yk9oMUN4U01sMjVSaXBhRXdxalZ1emwyM2dYSEp6M2FmYldjbmZoRFlB?=
 =?utf-8?B?UXZ1U0wzWVVGZWZvQ2RUeFZUV05wUzNRR2tDYUFpNC82ZVVZdE55bzU3elpS?=
 =?utf-8?B?OUxJZTNnNTZlOWRQcVY3UmplK2RBbmkvUjNuRSt6WXpTQnFRd3lUTGtEbkJZ?=
 =?utf-8?B?YU9LQVZnd0ZiRXM5ak02eWt0czJzaGd2Nk1abDBYRHk0RGlvYXQ1SFkwaVZ1?=
 =?utf-8?B?aGptYmJ3dTlwNXM1aXVmRnJMaHA5cnlUVWxOSGRqaXp3eGYza1I1bTBrMHlz?=
 =?utf-8?B?ZkNobDFzK1Y5U3hWTlR3eTJWNWIvOWt6dlpOK0w4TVp5d0xyclAxQlJqbmpS?=
 =?utf-8?B?SGpFZVNmOXJLVWRldGI0Um5nZ003VDZueFltd2hjcmpwK0k4c2pkK0xlSHZs?=
 =?utf-8?B?K2Jtd1FxZEdwQUtZM1NzY1Y5d1lnNzl5SEVWanhMV2swa294a1ZWR0hKb0Jq?=
 =?utf-8?B?SW9yTXp2eHRpZXVaY3E3WDdGcEZ1RnpzYWV4MmNGVnR2ZTJjUk5ncHBncXJu?=
 =?utf-8?B?VEFvUDRMQUhRWWs0akd1TUlSRmZTZlJ2ak85RGpOMC9pWE5pc1pFckRUZnc0?=
 =?utf-8?B?cGJTRHR4K3hKYkd1aHhiYzN0QXhhcWpjVlQrZUhDVGZ2U2RGN1k3RDFYUHZ1?=
 =?utf-8?B?RXJreWNWY3g3aUpuMzJDQ0crdTJ0VVNQbyswdTZxVklQNG5iZzF1bG9odXhW?=
 =?utf-8?B?NjJzTnk0eGdYNDd6MHFOQWNTdmpnV0ZlV1crNXNUY2plZDdRU2R4TTVTb08x?=
 =?utf-8?B?ekgrWVJKY1FTV0daZ3hvenVMQk5mT0txTkZEaWFraEc2NXNGTDgzZWYzYmlz?=
 =?utf-8?B?V3czNDR0SHNUZDIxN1VBbVdDVHFqTktrVjFYbG55R0htcy9ISEw3Q2J2cStk?=
 =?utf-8?B?RWVGb3Znc1dXOExncUtoL2luUE91STdsVUpldXRkZ0gwVVR0RkhVVkNla1BH?=
 =?utf-8?B?Zyt6Z2RPb1RWYnppdUR3OW5YZ2RYTU5RNUd5Nit4K0xFK3VMUndPdi9UUElw?=
 =?utf-8?B?Z2QyVENqU0JWWm9CYzRYaTNkNjNjNTg0enc2UjI1ZVJ2VzJjY2FBemZWQkl0?=
 =?utf-8?B?c2dTdzVNR2JDenpuZEo0OVBhVVR6QktVMDlkejhmclNtMmlBNjNhVDJrL0Zj?=
 =?utf-8?B?bjlWY0hvQlRTK2VzNDVKcEVWVk9wY2dqWTM3bXdkMUZEdHpXd0g4by8rZC9k?=
 =?utf-8?Q?r1eFbOkxf0JB/jq2TBUQfjb8Sr6tlZFyrPslqv6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VHcVRQenM2NUpMTWRhR0hLQ05uNFdPUmFoTDBYeDJvZ3dyajdINXBjVGFx?=
 =?utf-8?B?eVpXZUpMUmZiMDlzdzVXSEU0YXJHdHpaU3JpSitkKzhhcWxoNmtPNDZvYnl6?=
 =?utf-8?B?SlZsNEppMTZEaG40clhSUTNzWWJwK1p6Y0NBb3A2NlpuZkxWM2xnQVhkcFpm?=
 =?utf-8?B?UkFzUFhkUXE1YXdvWFRXeXdLcTBMVDExZkVSUTVqb1ZvVkVZV2libkF1eGFK?=
 =?utf-8?B?QkIwSUI3WWIyL24xNnpseE4wZDJyOUNINDZGdzF6WlFqUllOMHNmRTVvRS9O?=
 =?utf-8?B?QlYxcnl4RHFXL0lZQ1hjSEphOGxOa3AwTDZJcko5dllYOXVtcmp0OUVBM3Q5?=
 =?utf-8?B?dHZ2L3RBM01TbnlFMXVoUGEwVEo1WWhMajNOQkRqaW4yLzVudXBhNUFkNEQv?=
 =?utf-8?B?MHJnNi96UkVvSTVtS3Y0NUNXTWpNUE9mcHFFTGphTGoxVURybWtxUmlHanhp?=
 =?utf-8?B?c0M4V1JqVW5iUzl5c2JYUGdvSHBiVDNzbzBaYmFybWl5RnM4cFp6elAyeWxW?=
 =?utf-8?B?ZXRnazc5NUdWK1l2QUtoWk8yZ3pKcXQzOUJ6Q2J4NlBGRnNhZnpZeitSUnBK?=
 =?utf-8?B?WmI5TW00UTFOcjBNRHY4ODlsUUJpbVQvcGxrdlBRaGpFQmdSbkI3dWw4TUpT?=
 =?utf-8?B?SEoxUFk5cXZ3TFM1Q2xHWHFBY0EyYWlSVXNaR3JuTFNsN3hUV3NmVkZjdUlJ?=
 =?utf-8?B?Zmorbk5RY09TZWZHVTZuWDRFODFHZ3ZvbkI3MzR4UUNSZ1V1NU1yOEl3R2hQ?=
 =?utf-8?B?OGgyZUxFN1FiY2ZndWIxMG5xZmtzNzA1ZDJwRXpraFpPRVkwOFBVWjMrVjlH?=
 =?utf-8?B?Vk0vNTBsWUVVLzFDTVQvNXhESkRYNFIzZGVYME1kZUtkcUtQTGRTS1dvU28w?=
 =?utf-8?B?aVk2RTFsOExTaHNwMzdMMFhmMVlWb1dUdnlKbW1IVEVpQ1lYOENQY3B2cXpj?=
 =?utf-8?B?S241d3dPbWdvRjBjLzdYdmw4a3EwcS9YVHk4ZVVkVWVlam5FRng1SEU5YXFL?=
 =?utf-8?B?SFdQN2ZzUXRSL3VrUWZpeUtsaFhtajYrVEZzTXVieE8rdTd5MTZuSTJKdDJH?=
 =?utf-8?B?STJncmE1OHlvTDNxK2xQSlYxTUJzWkNsVnFqRy9DejhYQTd0bmlQRSs2dGhF?=
 =?utf-8?B?ZlFwbzZkbENDWGl1WWk4WkxuQzFRdmt3UzVRVGp5RjVoY21NYVdQWlVZWTY4?=
 =?utf-8?B?QVAzUTVsU1daWURWNElaZmE3WHl1WWczN0NOWit5Mk1JTHR2TEdlRDRaYWdv?=
 =?utf-8?B?M2VMek5PYllFUWM3QU15Q1ZqTzdRQzhRVWJQcUZSeldHcUorbktYTFA4WEhl?=
 =?utf-8?B?eHdybXBKell1R3Zwenp0ek53RVJ5Y3ZYdjZHUDlaQnZWaGNuSTkwNkcwZFNI?=
 =?utf-8?B?eFJOUXRFMjQ3MTVTeDhQdENXWDcvell2Wk9SbHVWQ1NZT2pNcWlPM0k4aW1S?=
 =?utf-8?B?VU5GQ04zNkNqTktPSGRmM3R1dTBJK1NadE5SUjJ2REhRRkVzdkdJcTRHQnEv?=
 =?utf-8?B?b0Y0SmNraFJ2eFVlK0hLZDhpZW9PeWFKaFJ0MjRITDd1VVByZzYxcUFRVU1R?=
 =?utf-8?B?ajBpaXhTalBaWmE3bVF1eDQwUUZKdGpJMTAvelllQ0diNkx0WFZQUi9uNWJa?=
 =?utf-8?B?N1dXYkUyUDFDbkROY014RjFSVWZRMnhyYUdITEhjb21ER0g5eEJpRW1qS253?=
 =?utf-8?B?dzgyUGJUN0RYbENpdm1US0ZsOWxuNVp6TDVrbUZZdHE4M0l5TUhteXo2L2ZF?=
 =?utf-8?B?NkpLckZiSXRFSHZEUGdNOUNpczhLczdPU3prS0kyMlFrb0tnU3pHQmJwTDZy?=
 =?utf-8?B?eUdjVDEvNmJ2aUZPZmQ2eCt2cEdjQndKMDdpRUxrbXIySXppR2pQVUxKWi8y?=
 =?utf-8?B?TDJTTUZod0ZIandteU5FVFA1WXIxL1gwRnVnRDNhd1VqQjVOUVdoVzJlcFFS?=
 =?utf-8?B?MUh3dTBvSm5oNVVSSHV6TzdaMEQ3NnJyM2VjR2tpaXRQUm1oTTdDUktaSCt4?=
 =?utf-8?B?b1lINEFDNGV6MXhqTWdOSnB2RG1hWjVid21SVWVxVjZJSEpDcEk4VjJtWVl1?=
 =?utf-8?B?OG0xeGJzS2NhMlpGZm1TU3dRZjZRakZMQjlMY0xXV0VJY3V1L2RESm9UUWR5?=
 =?utf-8?Q?HGnJfLDEpyS/bm+cO6SND12zt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e128bd88-db95-45a6-be21-08dc9137abcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 14:45:47.2550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SY8+QW2Or4eaSwnf2l8n+a7U1E0uG1tPnP0ELvhEHnD0AHk/kqdIZglCN4WkNigs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170
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

Hi Nirmoy,

Am 20.06.24 um 16:37 schrieb Nirmoy Das:
> Hi Christian,
>
> On 6/20/2024 4:08 PM, Christian König wrote:
>> Am 20.06.24 um 15:46 schrieb Nirmoy Das:
>>> Clearing pages can be very slow when using CPU but GPUs can perform 
>>> this
>>> task much faster. With this new pool API driver can decide if it 
>>> wants to
>>> clear pages using GPU. This provides the flexibility to choose the 
>>> desired
>>> clear policy, either during allocation or upon freeing, as per the 
>>> driver's
>>> preference.
>>
>> We already have the TTM_TT_FLAG_ZERO_ALLOC to indicate if pages needs 
>> to be cleared on alloc from the OS.
>>
>> I'm not sure if we really need the option to not clear them in the 
>> pool as well, but if we really need this I suggest to switch from 
>> clear on free to clear on alloc again and just honor the flag.
>
>
> Perf reported higher latency because of clearing pages before giving 
> back to the pool. I think it would be nice if drm driver could avoid it.
>
> I  can modify this to move clearing page to ttm_pool_type_take() to 
> honor TTM_TT_FLAG_ZERO_ALLOC flags.

Both approaches have some pro and cons. IIRC we intentionally moved the 
clearing to the free function to avoid latency on allocation.

>>
>> Alternatively you could also split the pools into cleared and not 
>> cleared pages as well.
>
>
> Could you expand this please ?

Just create separate pools for cleared and uncleared pages (or separate 
lists inside the pools).

Then when you see the TTM_TT_FLAG_ZERO_ALLOC flag you try to grab things 
from the uncleared pool and if you don't see it try to grab things from 
the cleared pool.

Same for release of pages, just the other way around.

>
> I have another question. Our userspace team have  found that there is 
> higher latency for ttm_cached type buffer as well and using gpu clear 
> doesn't help much
>
> because kernel will clear pages anyways if 
> alloc_on_init/CONFIG_INIT_ON_ALLOC_DEFAULT_ON is active. I see that 
> only way to mitigate this is to use a pool for
>
> ttm_cached buffers.  I was thinking of using a pool flag to also allow 
> drm driver to create a pool for ttm_cached. I wonder what do you think 
> about it and if
>
> there is any other better solution.

Well I would clearly have to NAK a hack like this.

We only have a pool for uncached and WC pages because of lack of support 
for that in the general memory and DMA management.

The TTM_TT_FLAG_ZERO_ALLOC should control if GFP_ZERO is set or not. If 
the core MM decides to ignore that and clear pages anyway then you need 
to talk to the core MM people if you want to avoid that.

Regards,
Christian.

>
>
> Thanks,
>
> Nirmoy
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_device.c | 42 +++++++++++++++++++++++----
>>>   drivers/gpu/drm/ttm/ttm_pool.c   | 49 
>>> +++++++++++++++++++++++++-------
>>>   include/drm/ttm/ttm_device.h     |  8 ++++++
>>>   include/drm/ttm/ttm_pool.h       | 11 +++++++
>>>   4 files changed, 94 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index 434cf0258000..54a3ea825c2e 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -191,15 +191,19 @@ EXPORT_SYMBOL(ttm_device_swapout);
>>>    * @vma_manager: A pointer to a vma manager.
>>>    * @use_dma_alloc: If coherent DMA allocation API should be used.
>>>    * @use_dma32: If we should use GFP_DMA32 for device memory 
>>> allocations.
>>> + * @pool_flags: Desired pool flags
>>>    *
>>>    * Initializes a struct ttm_device:
>>>    * Returns:
>>>    * !0: Failure.
>>>    */
>>> -int ttm_device_init(struct ttm_device *bdev, const struct 
>>> ttm_device_funcs *funcs,
>>> -            struct device *dev, struct address_space *mapping,
>>> -            struct drm_vma_offset_manager *vma_manager,
>>> -            bool use_dma_alloc, bool use_dma32)
>>> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
>>> +                    const struct ttm_device_funcs *funcs,
>>> +                    struct device *dev,
>>> +                    struct address_space *mapping,
>>> +                    struct drm_vma_offset_manager *vma_manager,
>>> +                    bool use_dma_alloc, bool use_dma32,
>>> +                    unsigned int pool_flags)
>>>   {
>>>       struct ttm_global *glob = &ttm_glob;
>>>       int ret, nid;
>>> @@ -227,7 +231,8 @@ int ttm_device_init(struct ttm_device *bdev, 
>>> const struct ttm_device_funcs *func
>>>       else
>>>           nid = NUMA_NO_NODE;
>>>   -    ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
>>> +    ttm_pool_init_with_flags(&bdev->pool, dev, nid, use_dma_alloc,
>>> +                 use_dma32, pool_flags);
>>>         bdev->vma_manager = vma_manager;
>>>       spin_lock_init(&bdev->lru_lock);
>>> @@ -239,6 +244,33 @@ int ttm_device_init(struct ttm_device *bdev, 
>>> const struct ttm_device_funcs *func
>>>         return 0;
>>>   }
>>> +EXPORT_SYMBOL(ttm_device_init_with_pool_flags);
>>> +
>>> +
>>> +/**
>>> + * ttm_device_init
>>> + *
>>> + * @bdev: A pointer to a struct ttm_device to initialize.
>>> + * @funcs: Function table for the device.
>>> + * @dev: The core kernel device pointer for DMA mappings and 
>>> allocations.
>>> + * @mapping: The address space to use for this bo.
>>> + * @vma_manager: A pointer to a vma manager.
>>> + * @use_dma_alloc: If coherent DMA allocation API should be used.
>>> + * @use_dma32: If we should use GFP_DMA32 for device memory 
>>> allocations.
>>> + *
>>> + * Initializes a struct ttm_device:
>>> + * Returns:
>>> + * !0: Failure.
>>> + */
>>> +int ttm_device_init(struct ttm_device *bdev, const struct 
>>> ttm_device_funcs *funcs,
>>> +            struct device *dev, struct address_space *mapping,
>>> +            struct drm_vma_offset_manager *vma_manager,
>>> +            bool use_dma_alloc, bool use_dma32)
>>> +{
>>> +    return ttm_device_init_with_pool_flags(bdev, funcs, dev, mapping,
>>> +                           vma_manager, use_dma_alloc,
>>> +                           use_dma32, 0);
>>> +}
>>>   EXPORT_SYMBOL(ttm_device_init);
>>>     void ttm_device_fini(struct ttm_device *bdev)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 6e1fd6985ffc..6f33c3e7cdf2 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -222,15 +222,17 @@ static void ttm_pool_unmap(struct ttm_pool 
>>> *pool, dma_addr_t dma_addr,
>>>   }
>>>     /* Give pages into a specific pool_type */
>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>> page *p)
>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>> page *p, bool skip_clear)
>>>   {
>>>       unsigned int i, num_pages = 1 << pt->order;
>>>   -    for (i = 0; i < num_pages; ++i) {
>>> -        if (PageHighMem(p))
>>> -            clear_highpage(p + i);
>>> -        else
>>> -            clear_page(page_address(p + i));
>>> +    if (!skip_clear) {
>>> +        for (i = 0; i < num_pages; ++i) {
>>> +            if (PageHighMem(p))
>>> +                clear_highpage(p + i);
>>> +            else
>>> +                clear_page(page_address(p + i));
>>> +        }
>>>       }
>>>         spin_lock(&pt->lock);
>>> @@ -396,7 +398,10 @@ static void ttm_pool_free_range(struct ttm_pool 
>>> *pool, struct ttm_tt *tt,
>>>       struct page **pages = &tt->pages[start_page];
>>>       unsigned int order;
>>>       pgoff_t i, nr;
>>> +    bool skip_clear = false;
>>>   +    if (pool->flags & TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE)
>>> +        skip_clear = true;
>>>       for (i = start_page; i < end_page; i += nr, pages += nr) {
>>>           struct ttm_pool_type *pt = NULL;
>>>   @@ -407,7 +412,7 @@ static void ttm_pool_free_range(struct 
>>> ttm_pool *pool, struct ttm_tt *tt,
>>>             pt = ttm_pool_select_type(pool, caching, order);
>>>           if (pt)
>>> -            ttm_pool_type_give(pt, *pages);
>>> +            ttm_pool_type_give(pt, *pages, skip_clear);
>>>           else
>>>               ttm_pool_free_page(pool, caching, order, *pages);
>>>       }
>>> @@ -550,18 +555,21 @@ void ttm_pool_free(struct ttm_pool *pool, 
>>> struct ttm_tt *tt)
>>>   EXPORT_SYMBOL(ttm_pool_free);
>>>     /**
>>> - * ttm_pool_init - Initialize a pool
>>> + * ttm_pool_init_with_flags - Initialize a pool with flags
>>>    *
>>>    * @pool: the pool to initialize
>>>    * @dev: device for DMA allocations and mappings
>>>    * @nid: NUMA node to use for allocations
>>>    * @use_dma_alloc: true if coherent DMA alloc should be used
>>>    * @use_dma32: true if GFP_DMA32 should be used
>>> + * @flags: control flags for the pool
>>> + *
>>> + * Initialize the pool and its pool types with flags to modify 
>>> defaults
>>>    *
>>> - * Initialize the pool and its pool types.
>>>    */
>>> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>> -           int nid, bool use_dma_alloc, bool use_dma32)
>>> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device 
>>> *dev,
>>> +           int nid, bool use_dma_alloc, bool use_dma32,
>>> +           unsigned int flags)
>>>   {
>>>       unsigned int i, j;
>>>   @@ -571,6 +579,7 @@ void ttm_pool_init(struct ttm_pool *pool, 
>>> struct device *dev,
>>>       pool->nid = nid;
>>>       pool->use_dma_alloc = use_dma_alloc;
>>>       pool->use_dma32 = use_dma32;
>>> +    pool->flags = flags;
>>>         for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>>           for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>> @@ -585,6 +594,24 @@ void ttm_pool_init(struct ttm_pool *pool, 
>>> struct device *dev,
>>>           }
>>>       }
>>>   }
>>> +EXPORT_SYMBOL(ttm_pool_init_with_flags);
>>> +
>>> +/**
>>> + * ttm_pool_init - Initialize a pool
>>> + *
>>> + * @pool: the pool to initialize
>>> + * @dev: device for DMA allocations and mappings
>>> + * @nid: NUMA node to use for allocations
>>> + * @use_dma_alloc: true if coherent DMA alloc should be used
>>> + * @use_dma32: true if GFP_DMA32 should be used
>>> + *
>>> + * Initialize the pool and its pool types.
>>> + */
>>> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>> +           int nid, bool use_dma_alloc, bool use_dma32)
>>> +{
>>> +    ttm_pool_init_with_flags(pool, dev, nid, use_dma_alloc, 
>>> use_dma32, 0);
>>> +}
>>>   EXPORT_SYMBOL(ttm_pool_init);
>>>     /**
>>> diff --git a/include/drm/ttm/ttm_device.h 
>>> b/include/drm/ttm/ttm_device.h
>>> index c22f30535c84..1b20c5798e97 100644
>>> --- a/include/drm/ttm/ttm_device.h
>>> +++ b/include/drm/ttm/ttm_device.h
>>> @@ -291,6 +291,14 @@ int ttm_device_init(struct ttm_device *bdev, 
>>> const struct ttm_device_funcs *func
>>>               struct device *dev, struct address_space *mapping,
>>>               struct drm_vma_offset_manager *vma_manager,
>>>               bool use_dma_alloc, bool use_dma32);
>>> +int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
>>> +                    const struct ttm_device_funcs *funcs,
>>> +                    struct device *dev,
>>> +                    struct address_space *mapping,
>>> +                    struct drm_vma_offset_manager *vma_manager,
>>> +                    bool use_dma_alloc, bool use_dma32,
>>> +                    unsigned int pool_flags);
>>> +
>>>   void ttm_device_fini(struct ttm_device *bdev);
>>>   void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
>>>   diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>>> index 160d954a261e..9822996309e5 100644
>>> --- a/include/drm/ttm/ttm_pool.h
>>> +++ b/include/drm/ttm/ttm_pool.h
>>> @@ -66,10 +66,17 @@ struct ttm_pool_type {
>>>    * @use_dma_alloc: if coherent DMA allocations should be used
>>>    * @use_dma32: if GFP_DMA32 should be used
>>>    * @caching: pools for each caching/order
>>> + * @flags: flags to control certain pool behaviour
>>> + *
>>> + * The @flags can be:
>>> + *  - %TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE - This flag can be used to
>>> + *    skip clear on free when driver decides to do that on it's own.
>>>    */
>>>   struct ttm_pool {
>>>       struct device *dev;
>>>       int nid;
>>> +#define TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE    1 << 0
>>> +    unsigned int flags;
>>>         bool use_dma_alloc;
>>>       bool use_dma32;
>>> @@ -85,6 +92,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct 
>>> ttm_tt *tt);
>>>     void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>              int nid, bool use_dma_alloc, bool use_dma32);
>>> +void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device 
>>> *dev,
>>> +                  int nid, bool use_dma_alloc, bool use_dma32,
>>> +                  unsigned int flags);
>>> +
>>>   void ttm_pool_fini(struct ttm_pool *pool);
>>>     int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>>

