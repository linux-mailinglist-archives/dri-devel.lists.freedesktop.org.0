Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA45B145C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 08:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBFB10E960;
	Thu,  8 Sep 2022 06:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CB410E960;
 Thu,  8 Sep 2022 06:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GppTbNNRH071R90nqdmhXlP3IOedsiJnsNjcB5TSaWPL4677D6uvCLvB18n2sWamPoUGBU9H96DWwohn9wdcPr5ZqDgWgeNUdhSJlBqIStezb3hYfXuX6hjak4B4Yt7MLS9DQOan7zEiYRtBRzcWPIlpmgMyCcWyNrNUA5lqo5D7ig3MDVkNJper7FcrcdaXL3mHieuualX/qsFovbTJIodaGqELU52BtKb2ebIvaVmB9vL2wdalxTI+ziCTz6oaClMdQAhwLOqWsJDkbgkOb8fbN5oZDUOGUzTGwsZQQKQOU/qXKtlnUmaLWsfxdYH6v8xRmLGTY6dWpuRvWbhakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0DcJYKsRpt0fDO42dXC6UTzd9xp9togtZoQEeqHORQ=;
 b=F18AB+u8gp4NqgxrLPLnXFbqRxLGNzk1hik7/WktJGnVkpaW4kcGQ72qZR72V33H691vZmYsmGnfCh3u05W/9jxiQa/xNciu5wiIFkbHI4hhTxmE5PzumwygSWiNzFL1JYboX/9wvORcgBNENAvu3kker1kpghb1miSgIZWk1GDmWyVa0C63+sdRgJ1nhkl5xl1qV/FmwqWLORMQ3sg3pkvdmuxZYNID2gfkb4tCQlJ2r6WWb/XxnYXOOeTCnNpjU3N3CIICqtRWBpPfGgZeOCvkBevXHO71B9wsoTI6DELgcO/eIsWWDiZKmnk0HdhlywXHzfNMdEqyxIvk+550ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0DcJYKsRpt0fDO42dXC6UTzd9xp9togtZoQEeqHORQ=;
 b=dPurlQNGBU8SGuxMlKjEv+DPX6dJV+6Xui+VNkpzL+rohV8PlCQ4c7E8uQ6njYnuV+zIA0CTBTSCz8jCpKur+FubpxvHc06jFKuAUIIqE/lzfMjQxcDa/S9eEvB2jiXM8Lvdj4oREsscF9O44jI6cN2y2DQITDx4dveFVozWeoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 06:04:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.015; Thu, 8 Sep 2022
 06:04:31 +0000
Message-ID: <291548ba-3fbe-6a7d-eda1-ac12f1e799ff@amd.com>
Date: Thu, 8 Sep 2022 08:04:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
 <b6ade0fe-367a-21f3-1942-a9d7eefcf1d3@amd.com>
 <b0b4f3a0-0df5-8d2a-c1a0-ad6d721e9cba@amd.com>
 <YxemSP4IrQQtmHps@phenom.ffwll.local>
 <6988c6c3-892f-799b-0114-c2c8462c7ace@amd.com>
 <YxjOOLGVbFvtrwrF@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YxjOOLGVbFvtrwrF@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0060.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::37) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9f338d-aed7-491c-7cdb-08da915ffed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3ovdp+lbsvPa1KVnECAXTHhIWS5D5oSIKToAMN1RJLnvt0An+KebPRK99z3G8RFwuNS0AYrvO2M/E9sau83p95wmoeGxeLXxoPTYm/UXyVqqog7+DYvxe3w4TgT4C8CG802p2xjDjS1KcJY6vzAKOdwNYVOq3bCGQhHbDrs8hDuhUitpJdxJEb2VCA/j7RslNyqvVkQwYpEUqFxspgjE0MIZZJArBRvfeHmP/0qLLdowbD/qA981yW4r0XX6ogzKHXf2TQ/qHrZ912orxnh7KyMtussdyq2m5mkTYHPq+0mIyvEL+uIdGY4vKFUjJV00Nu0zznHPIaBUKOpdXmN3gaSVtrLyj3Y7wl+FG6RnwzaEghguVcoSS9JEtmEgIR7YKK6fgDEa7bYhjvzi4NJ1OtJj4n8pTWhmqLEzFOXjxw/czJAOCdQHjwDsXbYN10Bg5OiUcLUz0YZshJg8tQUp1y96jVtuJKSl3mws7+wP/auUwXkcLr+jG10nhLrB9VLNBaAgTjVf4dip08XLAaxGNHFqTuURcItT+jdwSmjOa69Xq2qQI2shupUwImYdBLvLezGxDCitK4ZWgul/v8KYKJqb4Xy4d7g118eKv+6mrPEomUEKvGi2iZx07TrGWu5YFoE8tuRNSGtvrpFy40KMG9aFJ5ra4pxvr11Mmek8SulRXLsgOcS6qMUB2lAHyNczrF8bvVVVqmBJrt5epvchuAxOJX5hzmnopWYO6ATdZ8ji2GFSu+ERklM9GS03DgQ4je+mj51LDU8vHBcmTUU4hxOIV3MtWZ5dsEUYFHMCpo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(31686004)(8676002)(66476007)(4326008)(66556008)(66946007)(2616005)(38100700002)(6486002)(41300700001)(186003)(6666004)(6506007)(6512007)(26005)(478600001)(6916009)(316002)(2906002)(36756003)(86362001)(5660300002)(8936002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDZMZjFUYlJjcEJvT1cvdVBvUnkxRGRrK2RrbzBnYTI0TW4rTXBObDg0U2Iw?=
 =?utf-8?B?WTc2VDFxZ3RJcFZiUXFhTFplOGE0TnVBeGVGNHVaSXQrUDREZWRuVDZla2ph?=
 =?utf-8?B?SDRGNEFoU1VUL1NHUWN0Q24zNVFQWkkwamxibWsrNk5SY1llYjdVZWVLT0dT?=
 =?utf-8?B?U3VkZ3RTb0ozYVhNSUNDUXhnb1JSN0hZYUtKOXZXRWl2enRmSlFUQ3paUXhw?=
 =?utf-8?B?cndNUjVYd3YwQjd5T3NHLzR2dVhnV0pTYlRRc1Q3QkUxdW54M1NZRGhNVERO?=
 =?utf-8?B?eUlUaVI5b1Ntem8vRi9DbzRFRDhPK0pPbEQ4eWFvUjVsbHU4M1F6ZnNSd2lh?=
 =?utf-8?B?aksrTWVSNzRadEF3eVVid2h4Q3NUNlRFd29iMEJOeW5rTitUSEw5dW9Xa0pJ?=
 =?utf-8?B?KytHakxNcHlBZnFpbEI2QzdLbFlhNm9WMVJXMEFWZUJOSkZZZEc0L1VzNWJa?=
 =?utf-8?B?RFk4c3FUQUFGMmV0eUZUd1ZxU1JtM1NjM2JjNzJDa3NSN0M2Wk5EQUpud29y?=
 =?utf-8?B?Y0hKbFozbVpaOVJoSFNKbkM2eXZ3UWZROFh5V0NicndwSnhtV3FUYXdvaXBB?=
 =?utf-8?B?R1dBZTBRVnFTUWdUUEpqOXFuVDNMZmJLcHd6SDFJczYrM3lQWFdyYTU1cmt6?=
 =?utf-8?B?Y1BCanV0eldRMFIwdDEvbEZGNXgrTXJ6Y3NZV3ZkbmFjUVZEYzBBY3RoWFQw?=
 =?utf-8?B?NUxSVUJMMFRiY0gyQVhaZjFnSTZLbGozVG9BOXBVak0zOWMrNWhGQ2ZaMHlt?=
 =?utf-8?B?QjNFd2xBZFJLUFh5Mit5MjZlWU1yNy9iVWVrQnVLZldXSnBMWVNDK2xpT0l5?=
 =?utf-8?B?WVhKQ0c5c1JaVElSbENHN1dZUzFoRVhDSDloN1JZOFlOWWVNS1dtZ0hCdCts?=
 =?utf-8?B?citDUnBzRkZJd2J5OVVGNldJUEVUYmdRM0J0ZVhGSXJYZUQ1bWJHRU5IbnlE?=
 =?utf-8?B?WlFvcDU3UG1CeVFQbUk5dko3MUdJdktYcW4rc2ZJUXFHNWRIaWw1ZjBXRVBm?=
 =?utf-8?B?ald3R2Zjd3p4VXFSTnRnQWdneTB3azdpcEdoc2VTN3hhc3hEcWFRTzBhbWxm?=
 =?utf-8?B?RTlJVEdQZ1BjM09hZUtiQ01kOUE0eldyV0FkeWRWRy91ejFUV01CTzUzcDdJ?=
 =?utf-8?B?VnBPemhvSUxkbVJaMkZGT3ZXWHFNZ1Y5NHh5RTJFejRxeG1yRlZiVndoZ3pY?=
 =?utf-8?B?eVRlam5ESGZsVGwwUjBRM1l4KzhnRVU5Z2FtZXhwU0tRWlNDY05kK2FVSVlh?=
 =?utf-8?B?OFprT1I1d3Z5M3dKT3JTVnZyNjBqcUpTL2Fhc1R5Y2lzcFA5SFF0SHpRMVhr?=
 =?utf-8?B?TnJ1Y3BDb1Q2c3VzdHp5c2xGejgxM2NOeUhiU3hQY2xQOHU0T0x4WWovcTN4?=
 =?utf-8?B?a3doRVZPSktnWUdMWXp0dEwxM3FUNFM2WU1QRUczK0g3a0hXbGt5eGRxRkhq?=
 =?utf-8?B?NXVRSFVFY25ibS9hd2lXdjhpeWdpQjRTNVVKOG1kZ0RjMitNV2NqbmlOUEMr?=
 =?utf-8?B?bGwrdlFwaXVBSkljaXVMRVhnSjUrNGloa3VmUlMrZi9kQ2RzNjBLbFBvcUdl?=
 =?utf-8?B?N2dGWi80L0R6L09kUXllNTk5azVwK01tTnRibzR5NVp3aVBkVU9GREpZVCtU?=
 =?utf-8?B?KzZVTjhDSzU5eXRjTkZZY2RPU3JlQUtpRHJBQTVlNlk0Qnc4V1Zab1dCbzRZ?=
 =?utf-8?B?TlIrQm1QL0RHOFY1alVWamZWU3R5NGVJL2Q0ZkNrSE53R3gzbnFtUXd0QmtB?=
 =?utf-8?B?Uy92cUNCL2xxSE1lbHZVTEtlUHJ5a0ZYRjhtK3RCNnJucWNDQzluNFVSbDh5?=
 =?utf-8?B?eG9FK3RQYmh0N2ZVenlyZXVUWDRXT0NqM3JhQ3c0Y3BFayttaWUrWFhyWHE2?=
 =?utf-8?B?MkNpY3JKdlo3Q25qTzRWWmk3dStscERBaFY3dThueHI0YXREQUpiQnNwRnpa?=
 =?utf-8?B?bkxjYVdLa2l1RW94OVEvSCt2VXI5dXJvMzl6M1p3YzNMalpDQi9jLzRpUTRH?=
 =?utf-8?B?cmhlMlJPS2E5dEtoVXZlSnJGY29IdXRZakt6alBVNERuZ2lvNngwYXJLZ2FH?=
 =?utf-8?B?dlJNY3EveFV5dnptRE9FVW5jcTZzWjdwYXF6d1ZpV2REMm5RYjZHTERtNkNi?=
 =?utf-8?Q?33dTv94oEle6XtvceMpcnxVxj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9f338d-aed7-491c-7cdb-08da915ffed0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 06:04:31.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS6U+8GaN0b6bKEmbaKso1P6f/gCuxWvTZEJ0MgCsyjdet45d2dr6pW6Fv7KjNS7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858
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
Cc: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.22 um 19:00 schrieb Daniel Vetter:
> [SNIP]
>>> I'm a bit confused why the bloat here ...
>> Drivers do have specialized implementations of the backend, e.g. VMWGFX have
>> his handle backend, amdgpu the VRAM backend with special placements, i915 is
>> completely special as well.
>>
>> Here we only move the decision if resources intersect or are compatible into
>> those specialized backends. Previously we had all this in a centralized
>> callback for all backends of a driver.
>>
>> See the switch in amdgpu_ttm_bo_eviction_valuable() for an example. Final
>> goal is to move all this stuff into the specialized backends and remove this
>> callback.
>>
>> The only driver where I couldn't figure out why we have duplicated all this
>> from the standard implementation is Nouveau.
> Yeah I didn't read this too carefully, apologies.
>
>>> Also please document new callbacks precisely with inline kerneldoc. I know
>>> ttm docs aren't great yet, but they don't get better if we don't start
>>> somewhere. I think the in-depth comments for modeset vfuncs (e.g. in
>>> drm_modeset_helper_vtables.h) are a good standard here.
>> I thought we already did that. Please be a bit more specific.
> Yeah rushed this too, but the kerneldoc isn't too great yet. It's
> definitely not formatted correctly (you can't do a full function
> definition in a struct unfortunately, see the examples I linked). And it
> would be good to specificy what the default implementation is, that there
> is one (i.e. the hook is optional) and when exactly a driver would want to
> overwrite this. Atm it's a one-liner that explains exactly as much as you
> can guess from the function interface anyway, that's not super userful.
> -Daniel

Arun can you take care of improving this?

Thanks,
Christian.

>
>
>
>> Thanks,
>> Christian.
>>
>>> -Daniel
>>>
>>>> Thanks,
>>>> Arun
>>>>> Regards,
>>>>> Christian.
>>>>>

