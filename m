Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F984E2B1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 14:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0413D10E27D;
	Thu,  8 Feb 2024 13:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="06fIXoDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F3210E27D;
 Thu,  8 Feb 2024 13:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxUlX5ONh0x4LczUPmPSreO1CrmNRSMib6/GXBWa6yzeLH8GX2rYy/Dgj9Hny4FanAR7e0z3DKRRKpncP+Ug36jXayZs2WLHeJ085qKyn+nyv/CJl8flj4UvkQLADb++wR+qG+60Xt6JhLz1qx6j/ks4drUqG50y5mVtDIrhqPAp7UKtKVO+O/RZI9bWYn4oZGh+cBF5iDswr+gddmdilHS5w7T2yiz1Rvzdq5CoTfv9P0diy178JzU8hyJwenTra8vfh1vKkaKt0BuaRAc9oLg677bKYJlr6CK3mwhhZukYvto1pzvDqMBGb50LKZY7J4jL/WjJGG5jqA+4+VOfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ah0bD2NrHB/fjldPfiC54P5JbWSFsfBhOSNnCfjzrM=;
 b=LPLT9Nfn0MFqKxBOFBaZIhqxMByrOKKx6EAVVomxIu9WGR04BazfJ/XgPlZgpa8jfMd+CtAHNP/UGJe85mWOWeH/qSfOih5wxzq0fB6/kuyucgA6dIGOAQcvAGGh4eX60y0JzZK9GKC3q+rAYjhedefy0qFW5YLfL3y4nGo5V/qmSv/4fd+U4bJWTVz6nfaj/3a/pyFkwJ3Gw03jg3fom/hcw6eU3BFjbESTXJ3Ej44Myob7d+GNyTbkv7POeQE9cm3D6+yFI+JhgFfMT1Mg9Q87U9rqU4Cw/q43QUkYpy0VzRaI2V/ZgYICw0ik1Jv+kAoWFEquZtGaSaZy14FBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ah0bD2NrHB/fjldPfiC54P5JbWSFsfBhOSNnCfjzrM=;
 b=06fIXoDjeeNIKkiZbvjoAzXTl1EtJhhtv0bpLVubVNOlVY6PiVQY40iX/760Ej1bX29oFx1DG+Jvu+7UXqCfJAnCd8EYjWnnoZwZ1Cx1epcPZP21Dp+atVU7tDwaRGjmr22UPG0uXaoZ5GLSoePcJ+GwCjym5B4Ur9EXCX5orVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6188.namprd12.prod.outlook.com (2603:10b6:208:3e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.10; Thu, 8 Feb
 2024 13:59:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 13:59:09 +0000
Message-ID: <21166026-22ea-4bc3-b1e0-d8896f5820ad@amd.com>
Date: Thu, 8 Feb 2024 07:59:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
References: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
 <07ed1fee-cb73-49ba-bef6-ca16b4c808e4@amd.com>
 <86b5d704-9e0d-b989-1469-665e41d9b342@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <86b5d704-9e0d-b989-1469-665e41d9b342@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:806:121::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: d80fff14-3fe9-44d9-26d1-08dc28ae1f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMwhivHESmp1wZUl2o4NKSwexzzJ0O+QIZEpclBgevareh3yTOd+m/EgcVsOWFfXKqFFYbNKgV5V1/qfoeRHvCe+aaXXr8K0MXbXbQ+NPumLto54dGRs1UDE0shXdPgRzPkb5uA3wxLYcVW/v5ehLMCGGePQ1aclR3x7+nXIWBroH/trFV0vfUIyH+hTCDsoWc9LwDPBWob1JN70PKrJl4wlOnNoYabBbXUNCCAjiE6dzoYokYYAUphtmfyREvPo6DMcXbUfzq4qABo50p7mXMJnu5O4RC0hdLkRZds2yOs7P2tjVaj2tJEA4CxGQPsICN2dt9dYoWzAXS0wPkeFvlKGTxUxq5JSx3RlUYxKgS0VPG5oWYJ2NQFrOFMAIH5MiO6tL8pewGuJ6T4qYfffGzx300A84XE3qfDI1L/GIb/0CzMG5GD4WhVLPiw6d8d2h9TItobe/qNeNmGjxjz1WDst69eYqGl9zgDD99d1RruOIyncJeOoy5V48i01/2SUvAtouZ8mVE3yL6t2YeKpvzAqRrbH+I3E5cLhz409uwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(346002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(966005)(6666004)(31686004)(2906002)(110136005)(5660300002)(316002)(41300700001)(44832011)(66946007)(66476007)(66556008)(53546011)(6506007)(6512007)(478600001)(6486002)(8936002)(4326008)(8676002)(66574015)(2616005)(83380400001)(86362001)(31696002)(38100700002)(36756003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEU2VlowVHQ5U2RGbTR3ZGM5ZWtCYmdvQzFaL3htNTkyWW5IUmNTOVFid0Nn?=
 =?utf-8?B?a0ltaUZnc2V6V0VpSG1DUDFKaEM5bi9Rd1hoZklGSjlYN1hIR2VVNDNVa3FP?=
 =?utf-8?B?UXpRYWFjT0NCaDZRRHA5OUhHNHplWmZJNXpvbTNyWjJVTXFqeEtCT1dkZU5F?=
 =?utf-8?B?OTR0eVBTc2ZkZno1NDV3MkZyWklha2xkOGlCQW5XQzVmdU9xNW5FVGN3QnE5?=
 =?utf-8?B?TWFFVy9TSjJvSjVSSUw5ajM0dW05TmtsWmYrQkJMWGpjOCtoY0ZXTi81cGlM?=
 =?utf-8?B?VFBYL3F4SXM3QnQ5aGNXejN2Z01nZzdsS1NDekViL0hCUll3aGd1dWRiZ1hy?=
 =?utf-8?B?bmc0SkkycE5QY3g0dHJLd0tRL05DMWE1RnVDUjl4dTlLT3l4L3hzTGpwM01X?=
 =?utf-8?B?a3o4VmlZbFY3aFRKVE5JaktKNVV1Z1piWUFqUURhZkFJYjBEbk5ZSlNTQ1Mw?=
 =?utf-8?B?NVV4ZDNpOFVCanN3b2x0aWtKUXl3NHYxZHVlbGxYTGh6Sy9BTzFjT1BZOVgz?=
 =?utf-8?B?SVo3M3V4OE1KcnYzblYwVTFRSXdUUFg5WnRxcEFJNEQwakM3R2lFK0o2VHZY?=
 =?utf-8?B?enVsS2ZHUUxvTFpkUWZDZEhiYWpQK21jUi83Zittd2d6eU0xSjR2em1Eemgr?=
 =?utf-8?B?TC9ZNzFmUUMrVHpzOTQvMU16SjhuL1BMakxVSS9RWUtMYXBBUzBnOGhWNkVk?=
 =?utf-8?B?ZGhSdjNCV0tKSmN3VlpObUphUW5tZ2Q3V1Mydnl1azRaazVob296clBPc2dR?=
 =?utf-8?B?dnVEVmVsZUJBY2lVTHJEQXVtQTF1SzNQSDlGdnJXYUtteHI3d2NMQ0EvRGpH?=
 =?utf-8?B?cVpkMUZvZGpZU3VxdXlOcG5ualVSL0Q5UmhpdXJxZFlUY1lnM2pyLzVZcXBo?=
 =?utf-8?B?aUJkclFvTTFVRVZlcFhxalowa2d0QUZkZkZtbVk0Z05SUksyMmFFYXlpNmpx?=
 =?utf-8?B?N25mbncxTTlBYk1aN2FIVFlhZnQ1RkxqR3pBQzZSa0J5R2ttYkJyQmlrdzBL?=
 =?utf-8?B?VnkvZWJldzArdkxhYjE0NkhnR0tLZkl3YWxDUWd5b3ZoR0RpTGFGcGZnM1Zv?=
 =?utf-8?B?cWFRU2JJUkMrSUlGSlRkY2FVYTFEbW5BdVVPWVdWdVB4WVFVSlY5dE0wb3VB?=
 =?utf-8?B?V3BtUGNxQzQ3UkpNNnJBcmpmbkd0TnRadzN6TE9IdXl5WVJDRld3UG16TjNO?=
 =?utf-8?B?ZEk4M3VSVHgyY0lnT3lrN2pQUE02UmlHTThOR3g0aWRPSUhFWnQzYVBQdHNQ?=
 =?utf-8?B?VkpCdUtMR3pzMk5LSlJFM0gvQWxtOURQaG9WQlpiUXdoaVg1aURRaDRLcjBS?=
 =?utf-8?B?Rzl5cjJqUjV0Ykh0V0RWNnUyUFNGOGVKcW8rTjhLaDhhWEZuelVPVElLUXFu?=
 =?utf-8?B?UHpETHZja2IxNVVXRnVyRDNTeTZnWXlDTlFScmVGMW1CWnpuRnJKbktIaXFR?=
 =?utf-8?B?SmFtUzZSME11a0ZoOU56MUo5a29YM1lZeWxmakNSMG1lMG44ZHBEeEplTmVR?=
 =?utf-8?B?K3NFZEdRVk42Rmg2NHJaMytpQzZWK0gxVWZleTVSTUMya000OGJjWm1iSmFL?=
 =?utf-8?B?Nys1dzNzQ2YxdkR2WlFFdDJGL09ONlF4cVU5bzJmQkZKQTRuN05tYVNSaHpY?=
 =?utf-8?B?Y014aUlGZFZobjJjc0xpSUxKTWszMU84MWxtazVpRGt5NFZUUDRyampLWnpq?=
 =?utf-8?B?WUNzenBRV1RrcTR4STBScHJPL2xOcjJUa093aFQwU3drSUFVSHRMTFEwY1Iw?=
 =?utf-8?B?SnJxc2xVRWZHaE93bE53TWR6VTJXWkp0NTFoWjZyUnBYL2hQdUhIa1R1UmFt?=
 =?utf-8?B?dVVvbWpwNmFqQ3JVRW9lR3I2b2J2emZkNEZHVVlIQUphQ3NZZkVBUm1hYStN?=
 =?utf-8?B?eTk4a0FTOVd5Nnc4TDlveVRpNEFWeGVubGN5cG02MlZacEdOT1FISUJTZTFF?=
 =?utf-8?B?UDVMTW9NeGpEYXN6OUptOGp6VHJubGszZWs3U2F1YmJRaVpuMzk1bVZlTnVW?=
 =?utf-8?B?NHdMWEtwbkN6cVgvQThuZVo1TUcwRDhGSzZVRElvMy9RUU5HUzk5K0FGYk85?=
 =?utf-8?B?MGpXSDRMUGNjeElXcDBwT1JhWTJvNDQ5dTdKVU1vN1Rrb0JzRHRBanVoUVhQ?=
 =?utf-8?Q?pzKqI07YDgGRnMWJfoMGjccU1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80fff14-3fe9-44d9-26d1-08dc28ae1f0d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 13:59:09.1300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5LyEwejC/X2momCyDYMUYIK6ekzEfStQGNjLOhIxHyp/ZMFAi50eFQ3kbWFab4/JOR18ndKfVcGYN/ZyMw8uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6188
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

On 2/8/2024 06:06, Arunpravin Paneer Selvam wrote:
> Hi Christian,
> 
> On 2/8/2024 12:27 PM, Christian König wrote:
>> Am 07.02.24 um 18:44 schrieb Arunpravin Paneer Selvam:
>>> Few users have observed display corruption when they boot
>>> the machine to KDE Plasma or playing games. We have root
>>> caused the problem that whenever alloc_range() couldn't
>>> find the required memory blocks the function was returning
>>> SUCCESS in some of the corner cases.
>>>
>>> The right approach would be if the total allocated size
>>> is less than the required size, the function should
>>> return -ENOSPC.
>>>
>>> Gitlab ticket link - 
>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3097

Syntax should be "Closes: $URL"

>>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Acked-by: Christian König <christian.koenig@amd.com>
>>
>> CC: stable.. ?
> I will check and add the stable kernel version.

Should be 6.7.

> 
> Thanks,
> Arun.
>>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index f57e6d74fb0e..c1a99bf4dffd 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>>>       } while (1);
>>>         list_splice_tail(&allocated, blocks);
>>> +
>>> +    if (total_allocated < size) {
>>> +        err = -ENOSPC;
>>> +        goto err_free;
>>> +    }
>>> +
>>>       return 0;
>>>     err_undo:
>>
> 

