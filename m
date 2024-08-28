Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCF962B48
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710910E572;
	Wed, 28 Aug 2024 15:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AivFT1P1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6887D10E55F;
 Wed, 28 Aug 2024 15:08:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd1ij5ljwzFfyromBUBunz6zXBrlsYCeTJ77oVe2FyHwSfkEgGn1V8b+o6tIzqGdN0PSASVkmKKpMq3wXE84lnxn+L8CQZOyhKX/MMnb3XqcKeQQTtouUZmJCLInj7+dubx33p6xNpBCcevYAJB5FxmvDZKB2rQERxfaqp1UTQ+qhXELhl/kNO1BXs+d7DD47FaopD/Ukb3mngQ/kjpn4mjdSHT5+PTUQANVbKgPcgJTUBA2u+W4dAswhfWKXyWeQEE4JeTrxhDsAXnB0Tp6uZWWHzMeAYZ99Y9o223SUX7M5KB0yI/M0QkgKKjWVyg9ZxncePfjKTcBF8YH4E8TIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=its2RUQM6WUhSOdTPJUdZecbF5CZR/eQUB5mFIHubW8=;
 b=klYaqzvH/6EZmhFpWMAdQSKTRZmJ0NV3d+o1Mmu/kT9EV17ZJPfVVvzY5GT54wvjspCWk33YKViUTydDsKewLmtGTC6PDm+xEU7J0UQieLgRoku2gIQeTNLK/2EI7WaEq/XFqkN6ZtiPn5pup6EpCZYf96zftIS4UzJzTi/dJ+yqL19eaquRDjwvW7iqt3DyPWbjarBF6j6puHTkrrtHDzPmO0eAVhkxXtt625We6sl09t10D2MUTM1PKWTc6GVtgAi2ch1IFFohIR4+P0pahzUGIMO+dWQxKZjb8meVbPFTqhZ+NjF8XduKkO2m+G9tmbyRbdl5HEWrBvMrAUMUDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=its2RUQM6WUhSOdTPJUdZecbF5CZR/eQUB5mFIHubW8=;
 b=AivFT1P1B9X8C8mKv4HFtgr0BrpoOKhyNT7O2OuX4jt2IWO6wzrWPfNy7sOXO+tY4j2Mgi6PGopcVGCzuvslj39W9wUlUSdcX+NGT9Vass/Gkd/AAwOTFKgRmxDEu4xdUCmKol4b9bonxE0m1vz9VnftNN7t25RwoPCqX8BTs54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 15:08:38 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 15:08:38 +0000
Message-ID: <26c9f07b-f2fc-4ab1-9e1d-5825615b0dc6@amd.com>
Date: Wed, 28 Aug 2024 11:08:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate
 valid GUIDs
To: Alex Deucher <alexdeucher@gmail.com>, Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20240812122312.1567046-1-jani.nikula@intel.com>
 <20240812122312.1567046-3-jani.nikula@intel.com>
 <Zs8kJOC2pH7gSfET@phenom.ffwll.local> <87plpsydda.fsf@intel.com>
 <CADnq5_OoY-Wt56=_XHjZGgZk2LrgXB5U34TOcjWqyO-+Ou9W8Q@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CADnq5_OoY-Wt56=_XHjZGgZk2LrgXB5U34TOcjWqyO-+Ou9W8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0177.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 047f8498-81c9-457f-86ba-08dcc7734b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU9uUWd0V1p3YytQTXU4UnFxR2ROTStmMWtGQzlVQlNhZTJYZVlMalBmY2hJ?=
 =?utf-8?B?MWJDY05WOWZFQVREaTlsSlZybmFWT1VwV1J1UTN4UzRCclU5cDdmK29DZCto?=
 =?utf-8?B?Y1hsWjk4YXd2Z1hLVTlTK01pTzhlakt6aVVIYU9aMHZLcWNGYXd6L0FkRmZF?=
 =?utf-8?B?eGNQZ1cvUzVIL2MvL0NaNDZEMjQzVmNKeCs0L21qV3NhSTNYSDA0NXl5OGVs?=
 =?utf-8?B?c1NrRmtkMlZpWXdLblprZHc1VnZEMGJmL2xsT1oxUFh5RmxLOEhLS08vZmlk?=
 =?utf-8?B?SDBkRUNWcWVhWXFEdWU2Tk9LUTZ0N2s3Nk9GbWJCQnR4R2pvSHhpOThia1VV?=
 =?utf-8?B?dVBoOE9tbFdvL0QyS2lNUEFZRUV4dmRRRW1ZbXdVU05FcVZPa21vZkNnN1JW?=
 =?utf-8?B?OHRLNHZ6c1RrdWY0Q201L0M3V2Z1K3hWSVF3cU1FMEJQY3VFRU5DY0E5MTN6?=
 =?utf-8?B?RlZ4Q1lvQ0xkT2tncXJpbWl1K1dSMVVoQWswNDlhSEVIZ29PQ3IyaTM1bEZQ?=
 =?utf-8?B?T2JNcWw2ekdBdnU3Q21CbFZjR0ZuUjd0eml5aTVqQzNNbXdpbytaK3ZCeSsw?=
 =?utf-8?B?cHhvUjNQOXlqYWFhZ1pFeU9yc2Z3Mlc2dkpZUHZLcllRd0o3c0xHV3FzNGxh?=
 =?utf-8?B?Y0U0V0kwSm82NGhDclB2MTl0OXByc3lZMG8zL2JIQ3NvQmdmMGZCT0FGaXRj?=
 =?utf-8?B?NUtYTHVGVUlCZnVDYmhWN2lzOFRtWFdBY0FSVjhpOVY0M204RDNwcElzd2Jp?=
 =?utf-8?B?U3RjdlpkbWIzNG5uaUdJeGFydWxCaTZwc3lQVm9KWEVBTzdMNk5pMnk1elZk?=
 =?utf-8?B?d0Q0NHV3K3pCRHBWMDV4ZUVYY0ZDN0FQRXVTOGZIOGZjcWdYS3dIYUx0bkx5?=
 =?utf-8?B?SFNBSlNIUFJRZVh2UHJiaG14eWpqcE9DdFJncWxTOG9RT2QrWCs4L0svUGNM?=
 =?utf-8?B?VWUyODUwQkRzL0ZyNldtZkUwbmJQSVM4ZFNVNi8vQkhuelNYcjJ3K1JRdzlz?=
 =?utf-8?B?Qk1xQzAzOEN5TnpzU215NjF0SHdiZGxPbm95cmJ6a1BhM1FaWWxHOWRodmFw?=
 =?utf-8?B?SHFZNERHWjl1dUlOOC9lUERyWUpZclF6dTZzSFJBcVRoa1ZqMzdLd2VUV2hi?=
 =?utf-8?B?UHkvUElrejQ2SDdaM0trU291SWdjUTE4TlBMQTVXZk9kSWxodTlGT083UEJp?=
 =?utf-8?B?ck4vMXhmS2JSaGdPRnFoOW9zampOZzVwV1h4bmVWeEpLV2gwSjFjb21jVTA0?=
 =?utf-8?B?d0ZKaXBLK2VoUlFvRVJESk9WTVRMWmNkRW4zNkd1T3hNTjZaYlkxaXV2ZndQ?=
 =?utf-8?B?djYxN2xaYjRWSUJqOVF3cHMxUGlQZTlhNkJwaGVlS1JMQlprODBmOUROMmFH?=
 =?utf-8?B?NXBpQ2N3dTRFTURRZFJVU2laS3hKb3IxRkdnUlA5MkNNSGR0QnM5ZTRDVERW?=
 =?utf-8?B?RGtHWTRXY0k1VXJVMWc1UklpY3lHNmtrVlhWbzFXN0hyZjJua1RnNFZVbm9i?=
 =?utf-8?B?dklaTytkS2xTMXovU25QSUF0LzVBb0ltQjlCNm1KM0FXTkNsZDFOWFhKYnNC?=
 =?utf-8?B?bjRrSnN1ZEczTjF2aTVDT3JvN1NCNndVTDRtM0JTRXdQcDlnWm1YTHk4V0o2?=
 =?utf-8?B?NERPcDVxbFJlWnkzNkdZMnN4TjgvWVRaaE1aSDF1Z1JUdllabFEzMm9qYzVw?=
 =?utf-8?B?SDQyME80Q2pNYjFaMGFXZlVHd3VBUllsOHlHS05Ndml5UkZPOFZDV3VaektN?=
 =?utf-8?B?ZmQ4ejBzOU5WR01pZFd5ZGdKM1BHMWQ1NkNwNkswMHFuY1dLeDNCUTQvMFhI?=
 =?utf-8?B?QU9jdEZHWlE5NmFWUG9wdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnpBMHg5S2E1WGg0NzBLV2hWWjRWM3BVTXc4QmlVLzFWdzVzdXJuTUtPVm5O?=
 =?utf-8?B?SzNnTng5LzYwR3NkRVFmUDNvVWxERDBxTGpuWG5IOXFNM1l6NndYVFcwdzZH?=
 =?utf-8?B?djZrM2NhdzJ1NmY0eDJpWm9LRkROYXEvZUE5N1BUK1VFU1FyU2pyMzljeEpG?=
 =?utf-8?B?dWxiNDZlYm1LR3IvTXBhWXpuRGg0ZC9NNzJ1SEpHUkE5YUtncmVDMllIZkJk?=
 =?utf-8?B?cld5SHE0eWU4bHozYmo5NVFoYk5rUjB1ZW5Oa3BMTHA3eHN5aS9nWEttZkUy?=
 =?utf-8?B?b2lhRTFzb2hlb2ZUclM1UWRIc1VuV3U3bGIwbmQrNUVFTDhkQ3lkZVl5MmFk?=
 =?utf-8?B?ZVFIWGxNSFRuVU5BUVVpcG4wVjFOQ2dIaEFtZXBMNldGMktRMXgvUStib0hs?=
 =?utf-8?B?dHNyS3BJUGdFNWs0dUhiWGp6TFgzYlNDV1ZZTkxSTWgzeVRmOVROeGJTbHZk?=
 =?utf-8?B?eTlsTUtiSGlNOWo4bTY1dTJiVnl5QVlQTjl4Ym1Jck1XS2ZCZWFMTjRqVGVV?=
 =?utf-8?B?RkFPOXRKUExod1lYbU9rMFBjcXpaWmYrMHF5dHJsUDM4bXV1VTA1LzZ6cWFw?=
 =?utf-8?B?dEFUMWRvb0Iwd1lZNTErRnVmejIyVEtRZU5oN1J2RTlEUi9NaGRWU0tTTE5P?=
 =?utf-8?B?Q1MwZnhiMGgwUjQ5bHJUb0UwbXhiT1VnZ3hYL1BoRHUyRU1vaXA0MnpmaDdW?=
 =?utf-8?B?eVRteUxET2pEcWplVkZ4YkVnanBwb3NoTEZ6dEdhYTBnZytnS3NIMHlKODJq?=
 =?utf-8?B?YVhzR1NpeGtkL0JHM3JyWUJkZkRXQ3hwc2hhWnltMnhnczVBSHN5ekdQOGNh?=
 =?utf-8?B?ZFZoYUh3YkZ3VXdvaklOL2Y4RDRuc0x0YktsQ3VwMGlZTnlLU1huRXJic2xu?=
 =?utf-8?B?cEJSV1lHNmt2MjBra3l5WnNBS3hoYTcvaS9keTVEbDlpT2lFMGZ0bjVDVkVC?=
 =?utf-8?B?NW8zeWdpbWNDdGI0aTduQU5wd3h6blVuaGJOdXNhMzRVeWpnelQzeU5vU2F0?=
 =?utf-8?B?MmZMNVdDOUpjbjlDN1ViWlFUT1BaOXB4Q05kSE1DeEpjRmJoa29Fd2Q4TmpB?=
 =?utf-8?B?N0tLbWcyWFV3WDg2bzZGN3BKanZxbHNpYnQvVTNzRzFIM3VtTVY0NVhYWTlG?=
 =?utf-8?B?Z3JoT3N6SVpmVHdjVTJLcU41NXRZdjZ5VzFDOHc0UlphS2QzeXVZdXRCNWhH?=
 =?utf-8?B?Tm5ib2VxTFJvSzR0WEo1N1gveG5pRFFPMjZuUHlacEZnVC94dzlZOFUrRUQw?=
 =?utf-8?B?ZjBpd3g2SWdOYnVCTTB1U0NEYkRTZ2dqbGo5VGJJM1pFcE1GTUtKMkhMZzZm?=
 =?utf-8?B?VEFSdjdnNHRXZ3ZqOGZRWGpwdmFFdVVDTjdQbkZqcmxUcTM5amd5S20yUmlY?=
 =?utf-8?B?ak1lTGs4VU80MW4welE5Z0liQlZqS0hnckVxTi9LUjZZTGNxVXpBakhmUms1?=
 =?utf-8?B?WWlta01NYnkvcDBCMnpieFRkRFQwbnRWL3JGWmZRTVJ6czY3VnBIWHhCN0FJ?=
 =?utf-8?B?YWpPNTFxQmo4RXAweW9KajNsak5RRHgwQTJqT2tKdkFiTlA1OGpxWTJZZFk1?=
 =?utf-8?B?V1QvaGFpS2pEN2laK3ZybTBDdjBQdGRmMjNUaXg4V20rQjE3bHZLdTRlSGNX?=
 =?utf-8?B?SVZpcjBGU1N0emVMbWw3Q3RPVkRmTUQxZHZhZ1ZmMTNGTlN2YWt1WDAzc1Jo?=
 =?utf-8?B?aXEwQnlQcUd4c2E1Qy96d1plWHQvU3VkYmtqN0RoMVdIRkZFMlJKV25ndGNK?=
 =?utf-8?B?Z1Fjd1NYMWRkVjlYU2x0MmYrRThTd3gxOFVlWmFzaTQybzVEWU4xWWhLN3gy?=
 =?utf-8?B?ekFoMUJLcUUxTjVueGRzMzVXQXFQNTh1T3NlMW02UmNvcko0V1JTTGZPVGNt?=
 =?utf-8?B?eHRQWGhUUW5uZFMrTUdsUnJRQU9aak5vdXlXUXYxK1p3NlhSNnNwMEdqMDhS?=
 =?utf-8?B?eGl1TlpuVEd0Mkc4bklKYkdHZWhNUWNhUEc2RHlJakVPWlQzd21WZjZzZXdt?=
 =?utf-8?B?UzQxNGpjUVowdng1OXZsVmlVT1grQVhrWG1FYkZ4Y25MWE9mOW50K0Y1alJU?=
 =?utf-8?B?QlFhcjBiMlBSYzF4ekRzRWo2ZFBDSkZMM1dyL09rZy9NOXJnUG9sUEM5ZHFw?=
 =?utf-8?Q?MzPTqLtCxJ6DQ5M8rA17j9wV4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047f8498-81c9-457f-86ba-08dcc7734b71
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 15:08:38.5439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBFVBxuj8j0kKheUJh5p0SvqMv8HAV7bphVNqxurfTSkpicWsY7+lIqLTV5fn4keEmKWyzyVSEbOxGaG4enVOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424
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



On 2024-08-28 09:58, Alex Deucher wrote:
> On Wed, Aug 28, 2024 at 9:53 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> On Wed, 28 Aug 2024, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>> On Mon, Aug 12, 2024 at 03:23:12PM +0300, Jani Nikula wrote:
>>>> Instead of just smashing jiffies into a GUID, use guid_gen() to generate
>>>> RFC 4122 compliant GUIDs.
>>>>
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>> ---
>>>>
>>>> Side note, it baffles me why amdgpu has a copy of this instead of
>>>> plumbing it into drm mst code.
>>>
>>> Yeah ec5fa9fcdeca ("drm/amd/display: Adjust the MST resume flow") promised
>>> a follow-up, but that seems to have never materialized. Really should
>>> materialize though. Patch lgtm
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Thanks!
>>
>> Cc: AMD folks, ack for merging the series via drm-misc-next?
> 
> Unless Harry has any objections,
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

>>
>> BR,
>> Jani.
>>
>>
>>>
>>>
>>>> ---
>>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++---------
>>>>  1 file changed, 12 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index 72c10fc2c890..ce05e7e2a383 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -2568,9 +2568,9 @@ static int dm_late_init(void *handle)
>>>>
>>>>  static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>>>  {
>>>> +    u8 buf[UUID_SIZE];
>>>> +    guid_t guid;
>>>>      int ret;
>>>> -    u8 guid[16];
>>>> -    u64 tmp64;
>>>>
>>>>      mutex_lock(&mgr->lock);
>>>>      if (!mgr->mst_primary)
>>>> @@ -2591,26 +2591,27 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>>>      }
>>>>
>>>>      /* Some hubs forget their guids after they resume */
>>>> -    ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
>>>> -    if (ret != 16) {
>>>> +    ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
>>>> +    if (ret != sizeof(buf)) {
>>>>              drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>>>>              goto out_fail;
>>>>      }
>>>>
>>>> -    if (memchr_inv(guid, 0, 16) == NULL) {
>>>> -            tmp64 = get_jiffies_64();
>>>> -            memcpy(&guid[0], &tmp64, sizeof(u64));
>>>> -            memcpy(&guid[8], &tmp64, sizeof(u64));
>>>> +    import_guid(&guid, buf);
>>>>
>>>> -            ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, guid, 16);
>>>> +    if (guid_is_null(&guid)) {
>>>> +            guid_gen(&guid);
>>>> +            export_guid(buf, &guid);
>>>>
>>>> -            if (ret != 16) {
>>>> +            ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, buf, sizeof(buf));
>>>> +
>>>> +            if (ret != sizeof(buf)) {
>>>>                      drm_dbg_kms(mgr->dev, "check mstb guid failed - undocked during suspend?\n");
>>>>                      goto out_fail;
>>>>              }
>>>>      }
>>>>
>>>> -    import_guid(&mgr->mst_primary->guid, guid);
>>>> +    guid_copy(&mgr->mst_primary->guid, &guid);
>>>>
>>>>  out_fail:
>>>>      mutex_unlock(&mgr->lock);
>>>> --
>>>> 2.39.2
>>>>
>>
>> --
>> Jani Nikula, Intel

