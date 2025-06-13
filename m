Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219B6AD9457
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEA210E43D;
	Fri, 13 Jun 2025 18:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b9Ss1gRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1626C10E43D;
 Fri, 13 Jun 2025 18:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/1PX2MVRxw6/Fha8PVIRe7mOSd340aVf+ol4YdvBCIUfINeECQVxzQ8hP0fXDq1fFg9ov0qvb8Zmfhz7cCmXBDWs4zAZ0/TNcHrudDePsIOJgQyodCabbFK93gf5XDBXwj7WyqLa9WyyTFXO18unqaMU5TLO/WIKHyYlCTsaYI6fW8Q0u/zkfvyV1pbyEj8ZkmIB6Y8OXiEnxLfzTTpEpuN8s3OPozE0b+Z0LOm+3AlFUdoTVtRTV3JDZ/X/Xn8uJz0CJhem2w89IbXZJpPnrQLnAAJKpI50t3Y4eH9jtY4AVdbX7vIM6jwSmBsHA9hoYHZKXTDi3cEm/SRGhOtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTxlMoGEmE/fn6D72aoIgM5zDSB6CLorL79ZcPW8pGs=;
 b=t21xItjTrUdesHkh9RF1YzDgjDMDxu5jQWi+RkLxlZEUyedGTpK1Ql1hiIl55k8K2Q+OBVRe38ve8yg/qWGPDLQ+hKuUCMR1SGggHtFyw2OVOPGBv6RCYcxXr6gCXd3AbW4S5eyWWJ+MoA80Ocegtbz4+v0bbKlBIsvRfkJuvwnwW+K6l1RwiY2/soToLsESZfPv+niRf9neaMSr8u2wNbIImiY3DkGnh4i094nFATmryyyeycwCJbKTdo4yGFhThXFincndCCFFnhNug3u2YI3maKNHZ3w4QB2JN012bRbCGAHvd2u1fTbRvPamk+ndgqEp890/nxLpgZSxQkjhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTxlMoGEmE/fn6D72aoIgM5zDSB6CLorL79ZcPW8pGs=;
 b=b9Ss1gRvp556dots/sZkbN3IIvbevYVg45ygIjqtiOEtQVPZIVhCFxCJpl728LVkBKvBei3Xi8tEGABxXxOWxb1sokthRs7tGMbR6KNz4ipMVwkzu6SIDeyhaCuwfzfTDuv4YeuSXG8q54/1LZ9zfrmQ3SkYLRy6pSt6dgHPOFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8845.namprd12.prod.outlook.com (2603:10b6:a03:538::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 18:23:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:23:56 +0000
Message-ID: <4e5b6615-6ef6-41fa-8794-e274d509b37a@amd.com>
Date: Fri, 13 Jun 2025 13:23:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] drm/amd/display: add drm_edid to dc_sink
To: Melissa Wen <mwen@igalia.com>
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-14-mwen@igalia.com>
 <e8f4fb73-cb63-4662-b041-4719785c5b37@amd.com>
 <jau2ceehoydonrbqfsgsdhvgcoltqtxq6ahms3zenwqhlgu3k3@zno3kendzxg6>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <jau2ceehoydonrbqfsgsdhvgcoltqtxq6ahms3zenwqhlgu3k3@zno3kendzxg6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b49b490-03a7-4c79-de87-08ddaaa7754c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW9hTmJvRHFyYTJPVWlPMDEzYkJKWU4yMUdaZFhSRi9RUFI2Qm1RU2M3d1U1?=
 =?utf-8?B?Y2hLRElDbno5ZXo4NTJCYlRseUNYNW9GVlBzeUE1K3RabExjRittbVJONnZr?=
 =?utf-8?B?UnNkcGNjUDc5RGZ6OEljdGM0TnVDOHhwT0pscFA0SFpEVXl6ZFliVEp3SWxD?=
 =?utf-8?B?V1M3WTBYcHBjSEtFT0xQSkh1cWlhdWJvTkJjanhNeUl3Q3pOL3FwdXNRUjA0?=
 =?utf-8?B?MzR4NlZaOU1XeEEyZk1HMzc1bUg2bnlIVU52MWlnbjdnSktVckZNM0IzUmR6?=
 =?utf-8?B?YjdMVWlHM0dETldLUGtuckIrd0lZdkdMVUFuMUVmamszMTZzTXRMTVZxNE1t?=
 =?utf-8?B?QXBWczZOMGlNRDRvdDJwZFdSZy9EUmF4R0xQL2FkMTRva3VOWUlFQkxBVndj?=
 =?utf-8?B?Sm1NYzdtMHpoaExmd1E2T3AvS1VsMUlHSDU4emtDTEdTK0NiaTdqOFR6TWwx?=
 =?utf-8?B?ejd3azlrUTBpMVlWNlF2a0Z4dnA1allIUG1GZld3RlIzVmxCTXA3ckZYTEtY?=
 =?utf-8?B?VGdqRkVhWWdKN1RUN3NLa2RwZnhGVkVZWXozTDBYTHJHZ25LYnh3bndwRzFE?=
 =?utf-8?B?K3RxN1ZvUWxWZ1Q5RSt3TGV2UmRHekw0dFAyWjVJZkw5K3ZYeWhtQVJpNlk1?=
 =?utf-8?B?MWlvYnU4SGlBUDcvWWU0VnA3WEl0c2txVS90WndodTFlcmorbXBZZlVzb052?=
 =?utf-8?B?WmJjRjJxQXUzcWFpMm5nRnh6SDdJc01qakhHdy9FNHFKVlBGNlhKRlBTS3pR?=
 =?utf-8?B?ZDlEZDBYQlZ2N0tPTFZ6TXp1WElwcmY0SkUwZ0NPbXBMa2ZBS0xtbzlyNFgr?=
 =?utf-8?B?VnhhV3h0YlhIeExYcUphcCsvZnlPRi83NitHS1NrVzZyWFR3RFJUUXVrYjRr?=
 =?utf-8?B?OWF0R1ZSSWJ2enFoNEIyejNXWXUwclgzRGdZY1Ryd0IvcFVBb3VUK2JFN3o1?=
 =?utf-8?B?V0NvdzA1NXEzRXh5N1RqT0puZ2VFemIwaXlmSi93Y01DR09hTHZXTVU4RWdL?=
 =?utf-8?B?c1ZiUGs5alhJdGZRV2J3ajNLUUFmNUcrT1JTa21oZ0tybkpUb09WZ3ZEM2xB?=
 =?utf-8?B?TWwvZkNKWlUzdmRhVGFuTFk5dFhYaERwNG5vNUM4ZEdnSE51YnNURkdVOXk0?=
 =?utf-8?B?U3hmaUpqSHRndk9adXhzTS8zeTNMU0l1Y3JkTjhHam1NczhBajNQYnlqd3NU?=
 =?utf-8?B?aU5lZ0k1TWdOcld1OVU4M09WYnkvUzgybnUya1BNTGU4U2tOcTFid25GWWF4?=
 =?utf-8?B?RXlaWU0xMHVNL3VvNXkrWWNaT1dabUJrVmUyRUZibEpIWkdVNjdjOHhMZ1BB?=
 =?utf-8?B?MEpoc0tCOXFUSjlMU2R1UWU5SDJnZ254UmZlcnA1WGJyTzdvVHc5cnFKenJ1?=
 =?utf-8?B?cWd3NUxZZHVrV0ZwZkpPdkNKSmZTd1pGOUxxZmorV1dPNyswVHZuYWJYR0Zx?=
 =?utf-8?B?eG9rS1JnRUVVQmFLRCtNdzVFd25VdEpEVURXRnBKTE8yaXVUb2xtRU1KN0pQ?=
 =?utf-8?B?dUNpV2RiVm1SMTc5ZEYwcmJaVUxmQnkzZy9mUkhacThkR2dWK1o1L2d3TlFs?=
 =?utf-8?B?SnBlblJyeGkvNDkxYzN6a1k1YmJlczVxckpoS0pHbzZocERvZUtKOFFDNGRF?=
 =?utf-8?B?b3RGUFZqTEhlZ0ZyRGc4VitSVFd6MWhQUWhHVk5RUCt2VjcvNmFRb2hGa0NM?=
 =?utf-8?B?OVU4Q21QZlNYUFRLVTdVdm5NMXM1czlLWHJWQVJGSkFydHQvWnFsNEw0TVpt?=
 =?utf-8?B?TEU3SktpOU9nUmM3Z05BOVc1WHloTnI3STgrM2J1OXBZR3VUaTJRUTB4Nlh6?=
 =?utf-8?B?bVY4ajJzaGRkK29CUFM5WW9QUWdIM2JMMTgvVzBoWDZDMjBicE84OENjcWxi?=
 =?utf-8?B?ZU54NmZZb0ZyVVlLZ01ENmg5VEJNOFJNR3dFaVJKLzBkSFpsTFN2akRsSUVB?=
 =?utf-8?Q?fhn4N4Km4oE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmxlSTVUSU5UODBpZ1VlQXZ0UlR3ZWkzZzNrRzg0UVBWVUducDd2RTB6ZURP?=
 =?utf-8?B?OFF1Mld3LzkzM1phTzVBVnNzb0pMbDI3bDUvVnBlekZCWnZDRHZkZkJSY3Ev?=
 =?utf-8?B?YjViQkZZcGlOOUdOVWRoVCt6NE12NldYdDZyWTZvWkpERW1UUEJPUXJ6Wkxp?=
 =?utf-8?B?YUVtNE5EU1ZjSmNBQjlGVDg0ZTFkRnM4SnVBeGtsS1Q3SXBHbWV0cEh1bzhG?=
 =?utf-8?B?dTJaOGMwN2IzQzZCS1E3SFc4d2d6OXoxdlYwMW5kWmF5WHFsZXJMWi8yK0Vu?=
 =?utf-8?B?bjgrZHk0Nkljem9wZlJsWU9na2hUYmwyY3E3MFNhUGsxNUtGbkVpVXhiemox?=
 =?utf-8?B?WFlNY2FLVVBwdWNRK0JIdUtkdk1GaHNVQmxIUk5idkViMkVRUk4rUHFEVWhy?=
 =?utf-8?B?T0p4YytjTEpkNm1kYXZPMFZSeHRDNWMrK2pkeGc2b3hoWDRXZWtsYzJHcnQ5?=
 =?utf-8?B?cjRKQng0Umphdmt2MWM1R1M0QkdUeHVQd3BKejJjd3J5dVZ5NHdqSlAyamtJ?=
 =?utf-8?B?eENFYkVUUmMxNnBpRlFjSE5kck56WU53K3M3N1hQSDZzc2hLeXJoaWU3NDVx?=
 =?utf-8?B?RUxpN0NLSlJnVUlBTy9FWS94R2FCZVpLakY5L1FxOExzbGduNkNxM2xWZ2ZP?=
 =?utf-8?B?aU8wMlc4bklsTjJQZkppZHplT1Z3ZEY5Tmo5UFJYbXYrN0FjWDlrK0lqQUFL?=
 =?utf-8?B?NFRFK2Y2S0p5UktRRmxwajRnSTlGODBpQ2g3S2VCUlhHVmsybkVpamp5eEV2?=
 =?utf-8?B?eXZVS2Q4T2xOK292UCtmblVWYjZUa3FRaUk2YTc0ZTNzdUVkQjB1TlRvYklQ?=
 =?utf-8?B?Slh2K2h1Q3ZoQVp2MjFJMXNlVWNNa2NrYjZvdG1FUTZQamMrQ0ZLOHJaQ3h6?=
 =?utf-8?B?a3Z1QkgrNTN2VlNqNm5qZCtFcUwzTjN5aVpVYVlHQzFaUnAzYTlxQTF2OGsx?=
 =?utf-8?B?dWlNUGM4Ukg2Z0lPTkRpUVJDbFBFY1liZ2JjSWxESVhmUm9rVS82V3dqYTNi?=
 =?utf-8?B?Wm9HQi9WdjVTYjgyYWFXMzY5cHRrMDliakk0RW16d0Q4TW9mUlBuSTFkTEdi?=
 =?utf-8?B?TXZiUW9XYzgwYTJRSEZscE5DZnpseVJuWFRjUkpWMU9SM2ZVSGV4QnJ3Q0lx?=
 =?utf-8?B?U1EzOXIyaCs2UEFmcG9kOU1GblVZZEZjRU96Z2wreE1CMjFSVDk2TXZLMW5Y?=
 =?utf-8?B?L3JoUUpqWEJSMHNZSzhsTVpSaks0elE1S1RiMmxWeDFpR3A0U3JMYytyU29w?=
 =?utf-8?B?UWs2ajBmMVd4RElpNEJGMWppQWwxdkh2c3hGME9COU5uNmNxN1VzQWRpNUhT?=
 =?utf-8?B?WkllWnZvdlJTcERQUHFXMFRXb2VKVzJhOEIrbnRvcW5GN1VrUkNQU3l4dTRE?=
 =?utf-8?B?S0dOSFJpZE03bFdtRXo5NWx6QlhZeHFTVVBJVWU3NjF5NXhyNXRWSS9CK1hO?=
 =?utf-8?B?ZXAweklDeFpRNkd4YUlMeENtYklkZ2tHSWhHTU9WNmVhOFdNRm9TeFI1NXlN?=
 =?utf-8?B?SnJRWXR6WnJwVnpoc3dKK3FBeEJHY2srNHhEeWJWektQbmYwVDUxeU0wL2F6?=
 =?utf-8?B?SEIvMUFRRzl3d0dNQ1h6K3VZc01abksyUEZHOVQ3NmVqY0lCSUhVUFprZXd1?=
 =?utf-8?B?eWoyc1haVkhPZHNDemg3L0lCZ05PL2tTSitDc0UxOE9ZdzhEdWZ1cnZ4T1lj?=
 =?utf-8?B?TkNBVVJ1UEpMYlFzTTBsb0pFbVoyejhaTy92NTNZcDN1U3J0dHNNREJvdVhM?=
 =?utf-8?B?UjJDSjNLQ1JLWXlGQUE1VTZwclMwV1A2Ymg4S09LR2dwOWVDLzVvNUNvWmNu?=
 =?utf-8?B?VkN3UmMxVjBkM1FyMi9DaDVFZnZrYU1QUEZBb1dPaWh4dmcwSURvUWxTRjQx?=
 =?utf-8?B?RW9mcytmSDlZaklzQzk4R2tvMnJOeE1pMUdHQVdkNTl2Vk9IdGJCTWxEcDZm?=
 =?utf-8?B?UzNGWERCMmZGQ1N2cHQ5dzlUNkUxelNwbXp0SDF2a3JkSTJGNURndTJhRUV1?=
 =?utf-8?B?WmVOb01SWnZyVk9xVVFQQ3NiZWhadVdTUVV1V2hlWnV2dmVFbGlZYXV3M2tj?=
 =?utf-8?B?elMrYkVtWWFETmtRLytKNHg1S01WMUNhZzlyZUlndzFUOGFRUXc1bEVRV2dp?=
 =?utf-8?Q?/jvrDuaB1NlHuMZ8bUVRvraaG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b49b490-03a7-4c79-de87-08ddaaa7754c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:23:56.3368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7tqtvqUyZBmJnPTGzSv4QYKP7acQKi0hjuSOZxUI8+tyJ+H/Rqus7Nozs2ly3EovAy8mlcyLfxLQHJ29xBe0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8845
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

On 6/13/2025 12:42 PM, Melissa Wen wrote:
> On 06/13, Mario Limonciello wrote:
>> On 6/13/2025 7:58 AM, Melissa Wen wrote:
>>> Add Linux opaque object to dc_sink for storing edid data cross driver,
>>> drm_edid. Also include the Linux call to free this object, the
>>> drm_edid_free()
>>>
>>> v3:
>>> - remove uneccessary include (jani)
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c | 6 ++++++
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h | 1 +
>>>    drivers/gpu/drm/amd/display/dc/core/dc_sink.c   | 3 +++
>>>    drivers/gpu/drm/amd/display/dc/dc.h             | 1 +
>>>    include/drm/drm_edid.h                          | 4 ++--
>>>    5 files changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>> index a90545b176cc..9e86dc15557b 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>> @@ -1,6 +1,7 @@
>>>    // SPDX-License-Identifier: MIT
>>>    #include "amdgpu_dm/dc_edid.h"
>>>    #include "dc.h"
>>> +#include <drm/drm_edid.h>
>>>    bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>>    			  struct dc_sink *current_sink)
>>> @@ -25,3 +26,8 @@ void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>>>    	memmove(dc_sink->dc_edid.raw_edid, edid, len);
>>>    	dc_sink->dc_edid.length = len;
>>>    }
>>> +
>>> +void dc_edid_sink_edid_free(struct dc_sink *sink)
>>> +{
>>> +	drm_edid_free(sink->drm_edid);
>>> +}
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>> index f42cd5bbc730..2c76768be459 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>> @@ -9,5 +9,6 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>>>    			  struct dc_sink *current_sink);
>>>    void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>>>    			     const void *edid, int len);
>>> +void dc_edid_sink_edid_free(struct dc_sink *sink);
>>>    #endif /* __DC_EDID_H__ */
>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
>>> index 455fa5dd1420..3774a3245506 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
>>> @@ -26,6 +26,7 @@
>>>    #include "dm_services.h"
>>>    #include "dm_helpers.h"
>>>    #include "core_types.h"
>>> +#include "dc_edid.h"
>>>    /*******************************************************************************
>>>     * Private functions
>>> @@ -65,6 +66,8 @@ void dc_sink_retain(struct dc_sink *sink)
>>>    static void dc_sink_free(struct kref *kref)
>>>    {
>>>    	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
>>> +
>>> +	dc_edid_sink_edid_free(sink);
>>>    	kfree(sink->dc_container_id);
>>>    	kfree(sink);
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
>>> index 86feef038de6..cf56a0405a4f 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dc.h
>>> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
>>> @@ -2466,6 +2466,7 @@ struct scdc_caps {
>>>    struct dc_sink {
>>>    	enum signal_type sink_signal;
>>>    	struct dc_edid dc_edid; /* raw edid */
>>> +	const struct drm_edid *drm_edid; /* Linux DRM edid*/
>>
>> Don't you need a forward declaration for 'struct drm_edid' in dc.h to be
>> able to do this?
> 
> I understand that, as it's just a pointer (the compiler knows the size)
> and there is no circular dependencies between dc_sink and drm_edid, we
> don't need a forward declaration. So I think we are fine also because
> dc_sink->drm_edid dereference only happens in dc_edid.h that already
> needs to include drm_edid.h for drm_edid helpers... but let me know if
> I'm missing something.

Did you compile with CONFIG_WERROR or at least W=1?  I feel like I've 
seen issues with this in the past that the compiler doesn't like having
unknown types, even if a pointer.

But if it works with W=1 / CONFIG_WERROR I must have been thinking about 
a dereference case and thus no concerns on my side.

> 
>>
>> Also you're missing a space at the end of the comment before the '*/'.
> 
> ack. I'll wait for more comments to send it fixed.
> 
> Thanks for reviewing.
> 
> Melissa
> 
>>
>>>    	struct dc_edid_caps edid_caps; /* parse display caps */
>>>    	struct dc_container_id *dc_container_id;
>>>    	uint32_t dongle_max_pix_clk;
>>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>>> index e7a9a4928b97..8617d2285f38 100644
>>> --- a/include/drm/drm_edid.h
>>> +++ b/include/drm/drm_edid.h
>>> @@ -469,8 +469,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
>>>    			      const struct drm_edid *edid);
>>>    int drm_edid_connector_add_modes(struct drm_connector *connector);
>>>    bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>>> -bool drm_edid_eq(const struct drm_edid *drm_edid_first,
>>> -			 const struct drm_edid *drm_edid_second);
>>> +bool drm_edid_eq(const struct drm_edid *drm_edid_1,
>>> +		 const struct drm_edid *drm_edid_2);
>>>    void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>>>    			     struct drm_edid_product_id *id);
>>>    void drm_edid_print_product_id(struct drm_printer *p,
>>

