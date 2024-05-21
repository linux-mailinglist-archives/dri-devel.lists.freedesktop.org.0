Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723CB8CB212
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 18:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9CD10E193;
	Tue, 21 May 2024 16:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kB5CE4Dr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF7610E193;
 Tue, 21 May 2024 16:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI/IwBkmU9t/1mUhu3zMlL5QET3v4lBm56kRbO3X83B6f47bE6wDyOBgGN1gFposhgOECDPhWWU3yozsd9ryN/fszkBrN4XaCOr3Yxz38y0mDIc5GgJySTcAMwVZo5KhUZEE5nYv/+iwDzs/RV8nruxyya0L4CknP3h1iJu9jtIMwhO771ul1tZGKVzwnALGjSXkXfmsVqwAHAN2bHSnxLJ86nN6feaMbAwYBQXuDRGAIBC7mwNGjJxqKjWCQvkNwTmDATpBB3WiCf2tOrWsEFBODVA1HkQOXQCkzvUbhHOqeuQVMvZkQRBGlZ41hYzBaVksR5LS2YKjmsJtzbuQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSv8Gw2r9/yFV4YRjin0ir/YeqmqqJe0ZIxeKGnB4Ro=;
 b=IsYoNOWAD3OFMxoSnavf9pM2dmzpFyqli7IT0ks3p6IVYZU2D+P1kBl2QI5I4+EImbeUYmg4/fW1Pz2wRecUoiLTwGgiu2y9MLjHHE9LxA/QesGByXpjle4/rWxJtkGjUQHS2etBsrEU4qZyZIUR3TKXNVFCXEpcuEXMoQ8QTTHQKuvjqGJ9RRdHYmIEe+BA1yvXRz1ETZEHQc1bVeY4YgwSgZwslsztLuDNwZAJf8wbOPX+ZKaLGW7CFtB+CuvHHdShQ6HqudM1arCCL44P9xXpXKwhzzerWLMw6vVIy8udnFsBTxYyTsdy2kgPLLL6R1M9QCDtqRHt4lMtOF4w9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSv8Gw2r9/yFV4YRjin0ir/YeqmqqJe0ZIxeKGnB4Ro=;
 b=kB5CE4DraID0BGY+cxVVjMa6p+ea6yFJvF/ANSWNhGkicUg3U4PQiXzt2t+zFyvx8Pikj1KQlB8bygiPUG/UiDS4dXCoq097ayzApck26Jp6DP04UWBXNdyTvBLWVCq+N1ee7GBM+q5t5Y4RRTCp52f6u/ZNhDgB+Iif34EVcXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 16:21:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 16:21:11 +0000
Message-ID: <a35f2f5b-024f-42ed-9d59-48efcf4516a8@amd.com>
Date: Tue, 21 May 2024 11:21:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, amd-gfx@lists.freedesktop.org,
 Harry.Wentland@amd.com, dri-devel@lists.freedesktop.org
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
 <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
 <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:5:120::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 879a4a4a-04ca-4627-aadd-08dc79b206f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkdQN3FNOXJvRmhoZXdrbXVnSVhtaEpHcm4wOFR5QzVKQ2Y3dW5QWFBUSndD?=
 =?utf-8?B?OE1RUDBTRGoyTFNVOWFzRE9YdzQ0NG1MMUdpbWJ6Y2dIMENrdklKUUlzUFh4?=
 =?utf-8?B?VGZraG4wTFR0ZXg0Mkc2V3NYb1IzR3VOcmloSVdYWVoybDVsS21XcGpnUStm?=
 =?utf-8?B?SWFDSFRKYjhyNEtmcmd0TVRFaG9IUUpNRUczTUlvUjJYVTlCdlM4RG5GY0kv?=
 =?utf-8?B?Ty9tUE95eEJucDk4TVUra2IyTXBYV1NlK2ZGUnMzUzZicisxSVI5dDFQS3dS?=
 =?utf-8?B?RVU3NHV1NzZuUEJVVDRLb0FIMWR6TU1TMTRTRU1pZWl0NWhjcmJkMXNTMEdQ?=
 =?utf-8?B?dWEvaERxYkhaNnVEaUx4WWhSK3dYSHdEaWFpWnM1V1lzV09rZmFJNGhwejJ6?=
 =?utf-8?B?TVd3emRhUmh6dUlSd0ZkODNrTnkzZnJ0RUh4aDlodjZjWXp6UVJ5SWJaR1kr?=
 =?utf-8?B?RFhRN0dMZWJGV21NRGpwZHJ4OXBPTVBnMWdiOEt4UG8rZ2VTSDlhbEk2WXYr?=
 =?utf-8?B?QzhTSEJveUluQUxSL0h0Rm9JWEtKdlpMUWM2VzVudmpKbFBrMWx4TC94VVQv?=
 =?utf-8?B?NFNEZWo3eEJWemVuK1B4MEplQ214WTRVU2tUWkFUSnlIeGllMkswbE42cG5k?=
 =?utf-8?B?THVWRVpxSk82RGR6ODdiQ0lrRWIyNUhpck1NWUIyd002dmg1OFA5NW01VUMz?=
 =?utf-8?B?SVZZVW1xRDhsaDg4TGJvQ3M4NXhnQzUvbFV6VUxNQUp5YnMxMUU3b3hoNGZG?=
 =?utf-8?B?T2VDaHlqQlR1UFp6UDU0bFc4S3Y0L2dMUmlKamdDSGcxYlFET1VtNXd4c3dt?=
 =?utf-8?B?aGh2TmVYWUdqbWl6UlZUZ1FkUjJYYm1pc2V1UWs0NmN5eU4rQWVGNW5iTmdi?=
 =?utf-8?B?Z2IzNnpObDcwc21iTlRsUDBVYkNJbkYrWnF3cTBINCs5VjkrMDZlWU12UjAz?=
 =?utf-8?B?d05qaEhLRERMK1Q2QU56TnQ5SkJIQlRQWk1zT2EvMzRCNytya1BTcjRCbzdN?=
 =?utf-8?B?Mm1WWVdaNW9iZ0d3WUx2dUVnYXlxRHR3VVhocE5Ccjh6TjE0bzYyTTF6Nk9U?=
 =?utf-8?B?Z1lYS3E5ZEVDMnFuVkVtN3hudDV0NGlxSCtFWkRHKzVaOG02TkhPR0tqZkpU?=
 =?utf-8?B?SXg3Zzdqb0V3R0x2QzFNck5kVzNTSDNqcEN3dDE1eTFqcm9yR01XQ2Z0azRv?=
 =?utf-8?B?MXRKZ3J0VW1NODNJTUpuUUJOUEN1YmF1NGE2S0NES1hack9sczJUU1NkTnpI?=
 =?utf-8?B?aFV3U1IxVVZ4bUNwak1oMUc0Q0xzelVIdEtsOGl0SGY0K0hrT3hubGo4eCtZ?=
 =?utf-8?B?TUptbXhEYUpzbE1QcWg4R0RucHdoNDhuUnJSWUV0L2dreG5sSkF0ZU9idnli?=
 =?utf-8?B?SzBEREQ0VTZGVUhsWGhFKzRVNXQ2aFl6ZDR1S3FscFpJNGUvOUdqYzRITU96?=
 =?utf-8?B?VDhPNmtzTHNFSmZGTEtLWkNEdVJVbWxoSVdTK2lIZHBpR1I2a2Zaakc5UHFi?=
 =?utf-8?B?VFgvRU01NEZjRFdxTWdlSDE2Rmc3VmR2eGJWQlpxL21YU1BySUh3ZWNDQVlZ?=
 =?utf-8?B?Q2d0dTJReDJNN29QNGpOVXNTWlBhWjdUbWRURzU2Zy9RRkhFQlhEb1hEMVVS?=
 =?utf-8?B?RjdYc0hXakdDc05FTXQzZVpCWFFEN1lNSVFiUWtDcFF3QWJQNVBsUDlPNVBQ?=
 =?utf-8?B?UVdaam1ScEwzMTNWN2dIUFNNTFc2cUNHV0hrYUxZbGpTMzQ3d09EK1V3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2NrekFvOVUwUFg2bkcxRW9lQUhTU1BCaHV6aC9FT2p1U2FYQ2RJeXpEakVp?=
 =?utf-8?B?ZXpaS3BHYmhIVnoxSk9hbUhRR3M2WWdrdnc0RlZxMzdZc1hEcUZEM0szSkxk?=
 =?utf-8?B?TmtaaFJLWGhiUUZQK3BjWFA4QVlINTdla3B4QTFCcWoxNmVaS1VHdlBmSWI0?=
 =?utf-8?B?R3RDVkNtb2hvek8yV0JRS29TUG5HSHM3ZjR0NnRQclRlNi9XYTRyZUFGOGR1?=
 =?utf-8?B?SUxFZ0dHTGNicWMrajNtR2w4ZUUyMVVjZitIQlArRi9VZGJZZjJkdzQ4cDNl?=
 =?utf-8?B?SkJZRGlReDJvUDhlb29ub2gxdisxeEhDVnVZenhFWG5UWTdUbkQxeXhXVm5j?=
 =?utf-8?B?MnJVQW9XQVQ3N0svdTM3WVRKdmJTaFNHQnQwS3JPWkdXZzJGV2RxMHZoaCtF?=
 =?utf-8?B?T2RkdENxaXEzdmNhSHpaL2FYQkNMQitlYmI5VUNzTXFvVXJ6UWN2VkoyTUZJ?=
 =?utf-8?B?TFd3cjZ2N1BkM3B5bHdjQzR4Q1ZrNjFNL0NmRjcxWm5uMjJyTUlTU0UwNFF2?=
 =?utf-8?B?eE16Qk9mZURJdnZUM3RZN2dpNEQ5L2VRYnA0OStFM2Z3WHl6NXRWeGQwWktI?=
 =?utf-8?B?bW1QZkR6T0NuNTBybnQ1Y0JzZ3ArZEVkN1BGY09lTnVxR1pZZHlla3JLWUgz?=
 =?utf-8?B?QnAxdzhncEhNME1NWWpCaWpQcXlsRmtmdmliNEVtT29PUThpc09TZkR0dTl4?=
 =?utf-8?B?SGU4MVV2VGc5N0t1aWRpS1M3M2Z3ektzWmV1Z2h2eEVJdkVsdDhoMVoybHk4?=
 =?utf-8?B?T213Y1FRNWx2Vy9rcE9zV2x5Y3g2QUdLcStHbTh1SUluUWRPY2lRS2NVVllu?=
 =?utf-8?B?Q25LRVZWa09RaGN4VmpuVDd1RHVQcVNmZFgxeGpxbUNoM2pCck4xT0xqcGtS?=
 =?utf-8?B?MForOTJTZFpZcnpkU3crUGErYzRPK3laNCtmekFvZkJhaWZvMHVuMXQ1QTc0?=
 =?utf-8?B?NWgrWWdCSEVER3VQdTFORkFZeVVZK3Myb1FZUFovZTU2eTZXQUF3amVLc0lo?=
 =?utf-8?B?L3ZmUVIvL3Z1MFByMC9zRUNKWkU1WmZ3WFRIWDJpc1ZNVHhxcmF4akhEc1VF?=
 =?utf-8?B?M0krWExhR2ltdW9penJTQ1g5dTg0L1RCVlZJQ1Ztam16NmxBVWtKSFlWV0dD?=
 =?utf-8?B?RkwxZk9EWnhjMWlQR0dmbkJ6WWp5V3kwWDVRNzBBT2tUUVg3VlZkcnVkT3V2?=
 =?utf-8?B?aUJEV2FDOTVDeFNEL3ZTTjhJUHJjQUlyTVp1VXA2UTBQdGcxUm5zMmJJYkxX?=
 =?utf-8?B?dWp1SE1vclpGZ2tOZjIrd1hpQit4bVhza05PZitKOFV4cXRPM1dsOUhTM1J1?=
 =?utf-8?B?bnpqYXA3WUE1dlJ4bzZkbm9IQ0lvZHZGSTMyckFBMVpST3dDa1hIeFo5WllS?=
 =?utf-8?B?K096OGpOQVpmcU0rZUs5dTVkVkxPWXBKUW85QUdRR1JxeDJ1M2J5U0diM1ll?=
 =?utf-8?B?cUFBUXNlVENtYWR1Y1VKTWU4RC9WMGpER0FTUWkzS3JFMW9oczJpTVo3d0Zo?=
 =?utf-8?B?MHFjKzNzbytTbGs5MzUwSDVDNXlpUHBtRzFnUlZVWUVYVVBTSmQ1K3FHcEFZ?=
 =?utf-8?B?dW8veTF3VEZvbTVSR2d1Zk1GWkdVOFozT1dWTGEvUnA5alppbFFXWHBoY09L?=
 =?utf-8?B?Wk5CUDN0UTFRay84S09jQjVkYmc5RGN0eWIwRXVRdTdLRS9BQ1NrVFlSOFJt?=
 =?utf-8?B?cG4rZVNsZnFiZXV5V2c5SU93LzhnVzVJVzFXTmczckpSNUtENGV4RytHekM3?=
 =?utf-8?B?NXFVeGx6S0xvOTZ1ZWRZWFZHZTJwTEgyMGkvblBCZ2JnMFFQMTRLZ051aFpm?=
 =?utf-8?B?ZURjeWNCazJOOVc5Wmo4SVQzdWhwUzZYMkp2ekZsbkhaSDlLcTZIK2JicEFm?=
 =?utf-8?B?Mm1HVmlIUXhjdGJ6cFdEdTNtUTBNVHE3MnYyMCtETGlXbGt3dkxuQ01sZHl0?=
 =?utf-8?B?a2hTZmJzVSsyRXZOMTUyb1BuSEkvZTE1WHpvbThYNE96a015dm11RWR5OUI2?=
 =?utf-8?B?ZlJaalpsM25YNkkwNThXeVN6YTJJQTl3aVp4L0k2Unp1OG1QbHdESlQ1R1ZK?=
 =?utf-8?B?WmxtNkF4QVorNWo2amRLRnFYM3JhajUvUkZGNi9xNzhHK3JKTzF3YkN6dzlV?=
 =?utf-8?Q?0b5NB4VxVGUp997cCqNnA8QKH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879a4a4a-04ca-4627-aadd-08dc79b206f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 16:21:11.0050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe5qn8tGk8f3nEGr+cxCwjeIK1u2mT8sFT+KmaIsoZvMkOcyRwnpwC+FZcuwBS5dgEClD5VrymkjUblL7jj6Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590
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

On 5/21/2024 11:14, Xaver Hugl wrote:
> Am Di., 21. Mai 2024 um 16:00 Uhr schrieb Mario Limonciello
> <mario.limonciello@amd.com>:
>>
>> On 5/21/2024 08:43, Simon Ser wrote:
>>> This makes sense to me in general. I like the fact that it's simple and
>>> vendor-neutral.
>>>
>>> Do we want to hardcode "panel" in the name? Are we sure that this will
>>> ever only apply to panels?
>>>
>>> Do we want to use a name which reflects the intent, rather than the
>>> mechanism? In other words, something like "color fidelity" = "preferred"
>>> maybe? (I don't know, just throwing ideas around.)
>>
>> In that vein, how about:
>>
>> "power saving policy"
>> --> "power saving"
>> --> "color fidelity"
> 
> It's not just about colors though, is it? The compositor might want to
> disable it to increase the backlight brightness in bright
> environments, so "color fidelity" doesn't really sound right

Either of these better?

"power saving policy"
--> "power saving"
--> "accuracy"

"power saving policy"
--> "allowed"
--> "forbidden"

Or any other idea?

> 
>>>
>>> Would be nice to add documentation for the property in the "standard
>>> connector properties" section.
>>
>> Ack.
>>

