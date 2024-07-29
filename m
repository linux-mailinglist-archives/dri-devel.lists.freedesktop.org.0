Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A095293F0E5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0416610E372;
	Mon, 29 Jul 2024 09:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z+559wMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DF110E371;
 Mon, 29 Jul 2024 09:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFoLPm7OiwF/cD7VtBTL1VE8wKopzNccxH/JERjWwF6K1e96gHcYU00VySvu+H8nrxs51vkl6p9dnTMRwJFj/G/q0JSxr6dU7RH9Q/8o62Ve8OvJmyWxDK82tvH9NBt7CjQiMNkFgj7eNyyOOd2JFGkKmQE+/UyQXNoIEUmFofU8QfLuy3xB/aDsHhAnHeZEblJ4QPLA8BwlIciZBDC5c3ASmGNsrnP63Fu/xP9wNMPSSdI1YUXc6B3Z8LX0IRt02ieuhSlzeBdImvgw9RCxm1FGQAAtBHeptmBQ3q5zKAgSnGjNvh1Ew+vCWCyiksYFPaaGMG9juWKlhWDhc6Kagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ez5zHb1ASZhOYrRqb5nNPrJOOu8t+3xJBO7EWyfIRQ=;
 b=SGoa7VACXnnHg630pImrHFX6G0rtrVf2rhOiEGZ4/y0Xvyl6akuN70tk4tNGK2Z0STuKldLDlfuRBaN/oCYmkV3X+7mKmvXisKJJGzF3x5krgZWNB4R0OA+CPYWMjD1P8qMVNIqc9OETXoyL+VJ3p5xXy4XtsiecEsmebvUCo+7nJzDY5NBzI7+7WJNSkG8t/+hQkz4N2f/QYmKVmnWlC1Iwh52c+V1kjQIeMqYNMUsqvnV4OT1ZIrXBvrBTfz8lxXVxMqzMxdL1pdAuu12GcHRmcxPf2tdGdMBFTMUvNzcSJ57vszZa4749+B3j9R4id4Ea9JbCYWl7zr3JlrH5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ez5zHb1ASZhOYrRqb5nNPrJOOu8t+3xJBO7EWyfIRQ=;
 b=Z+559wMtYm33Udl7a8pCLatx5Q5jz9DOO0hc98LWWfpgKHSv8k2k7UPEyu7N1OgPFBPs+rPq9SA6WhmKwLkT7maR41VSp46YsLgZOXEpSxXAK2o15IEU7Nj7FRKej7rigrPOudZK8eKbujQt+djXKpewrtCfcT1LeJaDWMighdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 09:23:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 09:23:07 +0000
Message-ID: <fb530f45-df88-402a-9dc0-99298b88754c@amd.com>
Date: Mon, 29 Jul 2024 11:23:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
 <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 5962bf7e-dffc-468c-3c71-08dcafb00e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NURPYTJVSlF3bnlNTWljSlpvY3hqazhESUpPM3ErN1FoZ0wxTHcxbnpwSnBm?=
 =?utf-8?B?dGp6bzVCVlFLNzJRSWtTc213VWY3Y29xcXowZ0FiVUxwY3hhZzlPV2UrdEhv?=
 =?utf-8?B?T09ONkNSdWl2OGFwVFVwL202VXNYVWdDWEdoaTMrUm1GNXExSVIzTklGUVdP?=
 =?utf-8?B?cFh6cmFpN0pGelA2ZnVDZGhuWlFXTEpSNkpFbEJIZEVDd2MvMWRaeHhKQnpW?=
 =?utf-8?B?K3F4NEpvamRERE9Gb0JlZGFNSW11Zk5hczhaODQvcElCVFU0YkxWRnpCc003?=
 =?utf-8?B?ZS9JYW0wbFU4VHdGUTVDY3gwVm1MOHByYkV2MG9QZGNMZit1aDgxTHpFOFZW?=
 =?utf-8?B?MitRaHlYZys2WUtKVGtxWFhsM2RnRTNBNkM1MHUzREp5RzF5V0greU5JeC9q?=
 =?utf-8?B?b05FYmNac1ZFZVBSdEtHNG1MUStjdlRFSmJFK0ZtazJ4YWI2cFBud1k4THl0?=
 =?utf-8?B?L2ljSFBiS0drdUoreGdiZFFuV0NUQktnb1FHVmd3aUptM1BqT3E3bmVNS3gx?=
 =?utf-8?B?RUlRWnJGUHFSK2RhZExybkY3RTRMaHlKY09zQWdiSDRNdmtjWHlFemFMTmhz?=
 =?utf-8?B?cXNvMDlLZVlzMHJDWDBwSFRpNUxOREVGZmxiWXZwaWI2dXRtL3B1eHZZSUhM?=
 =?utf-8?B?bmJ6VGVtZ0wxMmNrWTUrUld4Yi95OGNjVzhudllTU1NEckxidDhjN0lNWGx3?=
 =?utf-8?B?ZEdJazlRQ1FrNEVMNXpGaEplM29qdUhEOCtPbnRWMHFJYlRZR2xVRlhEYkk0?=
 =?utf-8?B?WTFzTm9FUlZwaW9kK0ZSclJXU25Ma2hteFgrTm5oaTU1VkM0b1c2UktpcDBY?=
 =?utf-8?B?dGF0VDQ4bGtIaVBBWXBORDloUFk4Z1hJckhBVk5SOEEzeGJqRzZQTWU5TUxD?=
 =?utf-8?B?R1FCK0FYSExMa1VvMWRVWE1EcmlqMWpyVkx3TVVOVjI2WldQRlNWU3dZM2xv?=
 =?utf-8?B?K2Ezdmd2WmhrbmlXanphRWdXd05oL2ZPWklWbCtEa0pVU0E1bmhSMGNhYTJI?=
 =?utf-8?B?Z1NURkg4azVDa3grc3huNm4zempwcEJ5NHNzbHE1SGkvd2Y3RXZSWVFMV0ht?=
 =?utf-8?B?Mk9adjc2b3krdTlKNlI5WUNKR3hYU1ozMFBaNXhqY2x2NC85d293RGhXVmlk?=
 =?utf-8?B?dURxdllPZlo5Z1RIOStSU2lLdjhtaldTRUtrclN6czRpcmhZMWw5V1ppSWl5?=
 =?utf-8?B?WHhFUGpJY3ZZYkdyVlgwQTdXeERaWVNzenFqVFJ2ZVFRY0RkUVNPTWorazdv?=
 =?utf-8?B?ZGM3MmNnM0R5bVgrL0ZBYXZLaXdLc0w5anFHcEJ1TDZtdUwxeVRGT1VCSDA5?=
 =?utf-8?B?S3JQUUlxQUZvbEMzS0JvUUJPWEJyRzQzZEViVHJhZ3I0eVZSTG16c2xkcTVi?=
 =?utf-8?B?dHpUbFhCT0xBRXVUUU1LVy9CNnphQnlxdGExZ2dZcDRKSFpJa29JUWVJY3pI?=
 =?utf-8?B?a0N6azlHTnovMkF4U3VIRFNzQjE0WkV3VVlzRVJCMjZPUGNZM1NueXZ1S3J3?=
 =?utf-8?B?M2g3czhSamw2QWIwQXczTXZuOVBlSFFTbmpZTnY4SDBVdzZIOGJacm9tcG5G?=
 =?utf-8?B?dktBaG9NcDQ1aWVKOU5YUVduMEpsbmdTbVloZW9CVWpzcFZoQjVqNUxibnVm?=
 =?utf-8?B?N2N0VTVPeFlKcUIyN3VTZTB4blIxV0VTYlZndVhMRDJhb2hUWkg1eE5FT3Iz?=
 =?utf-8?B?UWdkOEYxM1NFMC9rV2dleFJFQmJFZjAzYkFFdW5majRhVDhUSTlVcWhheGtV?=
 =?utf-8?B?TTAwMGFuZlFxZytWOXFNcmxENWZ6SFhUczBkcU5oYkc5T2ZmQTdsQUh1Rm5U?=
 =?utf-8?B?ZTVSUnlWbTBIaXdxOThndz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxFb3E3d0FZeWNINm5sS08wcURYWVdPU1c2Qkc2YmFRMHU5ME1sRmRvL2tD?=
 =?utf-8?B?R2RZd21ETS9UNlVhUkxvRDgxcnhhWjNGKzJpMzlpYXl4KzJLUzJiWXhSTWk0?=
 =?utf-8?B?N0dzZkRUYVk0TWRjZXVwK0lQUXhXS0RiVXowSXBwYzFweXRxQXBtcWx5dGY2?=
 =?utf-8?B?UGlRR0FmY1RiUERvMlBoalM0cUxISFpWcFN6WmpvNW1FdG5tbkZ5UitSdER6?=
 =?utf-8?B?ZW5NUTh4VmlEb2g1VDU5S1lIdzhic1hPcXZKb09tdDBuYnRnQXBmTTFhQzlQ?=
 =?utf-8?B?L1l3L09raENZUHFIZ1NIVmhTalBUdHB6TXlpVHlCRWhiZHdtcjBibzlrd3I3?=
 =?utf-8?B?ZmxXSVN6TDloM1pSajRMaWZrNzNHa3RZN0JmWFFJR2NoYng4K1RkRWp6ZjdC?=
 =?utf-8?B?TnZsRnhFa0ZLMW1qbmZOcjdPS1ZtYkE0T0p3RU9NeTdrUUYrWEV3dUQ5ZFZW?=
 =?utf-8?B?Q01WMzg2eTdVM1d5Y1NaV0NBRFo0ZVM1RDk2eS9UdlV5SHZlUU9BYXJsQ3p2?=
 =?utf-8?B?VjRoMmprUnpXNDZuTThrUUoyK3c0VEpBZGJ2VE1jb2xqTmJrSGxqeUNlbTJC?=
 =?utf-8?B?anRIallzNzk4ZWVpTFBOYnpBRVJFemY3TzROZ1Q2dzI4UVljTTZKcUtxUjEx?=
 =?utf-8?B?dmlJd3BldXVuekUxTEJqdlN1dGhVT1hZOWErN0ZkYmk3ZnJaWDRQcU83KzB5?=
 =?utf-8?B?YkM3d1hyY3hDekg0c2ZuYWp1UHhlZGZXZFNOSHZORWxjVW8vUVVvQy9SUjhr?=
 =?utf-8?B?UG9sZkRsM0ZKZkY0Vm4vcUkvYXUwZGFlbE9lY0QxVFN3MnNSU0lKSHZ3Q3Yz?=
 =?utf-8?B?Z0l4bjdIZE43K2l1RDBOZ2N0T2YyZEhyT1BCM0FkYXhsdVN3bm5aNGprS2hS?=
 =?utf-8?B?SkZyMDFFdHM3b0N4dG8xc1lJQS80bWpvOTlzSUx4SGs0VEh4MU91cUtPcVdW?=
 =?utf-8?B?WVl6WGN6bWtmbFpneWIvSUdHbldmc25PUjYrQmJMMjdYSjgzTGRVd2tOUUdT?=
 =?utf-8?B?RGUrWHhsM1drZEpEUlRiNnVVSnZVcWR1TCs1d0ZDcklrZjAzQjRyTVhmS0Fa?=
 =?utf-8?B?bTdQaVJ2Lzd3NWhxUytNa0htL0NqelBNc1FFeHdna05GZWVuSDJCbE8wZHph?=
 =?utf-8?B?NUliM3ZTejIrd2dKWU9pYlE2REM3a0ZDVXp0Q2xxSURrVjd3VVlnUVFFT08r?=
 =?utf-8?B?Y1I0WUd1ZUpENHNSQ1l5V3oxK0VhU0k3a2NrNHdYVUZjVEs1VE1kSi9SVHZk?=
 =?utf-8?B?aHp2bE9OSXZoVzV0VXJLS3BJWElIOVd2dDlGa1pLQllwYzVnTDdidG5NL2RS?=
 =?utf-8?B?U3VuVVNWdnBqdWJ1SkgzZkIwZFVNNnVGQ2JnaUVqMWRCZW1XcVhubjI4aFUw?=
 =?utf-8?B?Sm1tWHV3U0lacXJRVDhEN0NvNDVPbUJzWnlxcmJ3dGYvSWVDREs4WTNRZmdG?=
 =?utf-8?B?V2FwNm03WHN5R1BIbk9VM0wrYmt4M0JrTmhtVHA5d25GWGVPWXhEZnc1eUF6?=
 =?utf-8?B?TExlN080Q1FMNVBzTnY4RjV1RGFrZmovWVVnUnBHZTZFK054WDFpSW1IalFh?=
 =?utf-8?B?Z212RGY5cWJzMitudWZ1dlpiU2xhQVVtRVRndGdoYU00M0p2QTVTdUFRUUlJ?=
 =?utf-8?B?MEV5NzdxRmZFRW41cnFLMGNFck9nMDdkc05SelFHWUF6SVZMMGNxd3IvU1gx?=
 =?utf-8?B?cFVKS012czJmdkpZeWttemVpbmk0ajJYVEpHZVB2Y1Z3R0Z5TDhqMW9GRUp6?=
 =?utf-8?B?REhyYVVRNlJ3NVJFcTNFUHJGZGt6cHRPVXRZMm1QYmRRZzJKMmxiNlpmMC9X?=
 =?utf-8?B?T3FOSEl5OXYrelpNWHhjSmh4c25GYXhuVDdEcUN2ZlR0WlFEaXlYV25sYWVG?=
 =?utf-8?B?alo0a0dnTDRQMXgrbFlOOFBXYi9Hc0laTEZUeUhSMGZqbmovTlBpOElGajho?=
 =?utf-8?B?K2pGOEcxRTEyTnMxM2p5TTJ0Y2Nya1E1d2dlS0lTN1FMWXBXOTdYc2VKSUw0?=
 =?utf-8?B?WVE1VTBqeTNKTHRHa05RTnRkK2FQN3o3eGt3cjg2dW5MY0tjNzVHWUxhcU9B?=
 =?utf-8?B?YUZoSTRzUUJTMWxpcXB6Qm1wUjNkVWpkTE40bnVDTGNodlpPRk02S3A0Smpv?=
 =?utf-8?Q?Shgs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5962bf7e-dffc-468c-3c71-08dcafb00e27
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 09:23:07.1193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9FFV8UBEKEBCDbGUQCGlaChZ1lxrTu2+rSJhetMUEKGqyADuQvjTnlPbIyhzI7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639
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

Am 26.07.24 um 14:52 schrieb Alex Deucher:
> On Fri, Jul 26, 2024 at 3:05 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
>>> Several cs track offsets (such as 'track->db_s_read_offset')
>>> either are initialized with or plainly take big enough values that,
>>> once shifted 8 bits left, may be hit with integer overflow if the
>>> resulting values end up going over u32 limit.
>>>
>>> Some debug prints take this into account (see according dev_warn() in
>>> evergreen_cs_track_validate_stencil()), even if the actual
>>> calculated value assigned to local 'offset' variable is missing
>>> similar proper expansion.
>>>
>>> Mitigate the problem by casting the type of right operands to the
>>> wider type of corresponding left ones in all such cases.
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with static
>>> analysis tool SVACE.
>>>
>>> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling informations v11")
>>> Cc: stable@vger.kernel.org
>> Well first of all the long cast doesn't makes the value 64bit, it
>> depends on the architecture.
>>
>> Then IIRC the underlying hw can only handle a 32bit address space so
>> having the offset as long is incorrect to begin with.
> Evergreen chips support a 36 bit internal address space and NI and
> newer support a 40 bit one, so this is applicable.

In that case I strongly suggest that we replace the unsigned long with 
u64 or otherwise we get different behavior on 32 and 64bit machines.

Regards,
Christian.

>
> Alex
>
>> And finally that is absolutely not material for stable.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>> ---
>>> P.S. While I am not certain that track->cb_color_bo_offset[id]
>>> actually ends up taking values high enough to cause an overflow,
>>> nonetheless I thought it prudent to cast it to ulong as well.
>>>
>>>    drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>>>    1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
>>> index 1fe6e0d883c7..d734d221e2da 100644
>>> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
>>> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
>>> @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>>>                return r;
>>>        }
>>>
>>> -     offset = track->cb_color_bo_offset[id] << 8;
>>> +     offset = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>>        if (offset & (surf.base_align - 1)) {
>>>                dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not aligned with %ld\n",
>>>                         __func__, __LINE__, id, offset, surf.base_align);
>>> @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>>>                                min = surf.nby - 8;
>>>                        }
>>>                        bsize = radeon_bo_size(track->cb_color_bo[id]);
>>> -                     tmp = track->cb_color_bo_offset[id] << 8;
>>> +                     tmp = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>>                        for (nby = surf.nby; nby > min; nby--) {
>>>                                size = nby * surf.nbx * surf.bpe * surf.nsamples;
>>>                                if ((tmp + size * mslice) <= bsize) {
>>> @@ -476,10 +476,10 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>>>                        }
>>>                }
>>>                dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer size %d, "
>>> -                      "offset %d, max layer %d, bo size %ld, slice %d)\n",
>>> +                      "offset %ld, max layer %d, bo size %ld, slice %d)\n",
>>>                         __func__, __LINE__, id, surf.layer_size,
>>> -                     track->cb_color_bo_offset[id] << 8, mslice,
>>> -                     radeon_bo_size(track->cb_color_bo[id]), slice);
>>> +                     (unsigned long)track->cb_color_bo_offset[id] << 8,
>>> +                     mslice, radeon_bo_size(track->cb_color_bo[id]), slice);
>>>                dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d %d %d %d %d %d %d)\n",
>>>                         __func__, __LINE__, surf.nbx, surf.nby,
>>>                        surf.mode, surf.bpe, surf.nsamples,
>>> @@ -608,7 +608,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>                return r;
>>>        }
>>>
>>> -     offset = track->db_s_read_offset << 8;
>>> +     offset = (unsigned long)track->db_s_read_offset << 8;
>>>        if (offset & (surf.base_align - 1)) {
>>>                dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
>>>                         __func__, __LINE__, offset, surf.base_align);
>>> @@ -627,7 +627,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>                return -EINVAL;
>>>        }
>>>
>>> -     offset = track->db_s_write_offset << 8;
>>> +     offset = (unsigned long)track->db_s_write_offset << 8;
>>>        if (offset & (surf.base_align - 1)) {
>>>                dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
>>>                         __func__, __LINE__, offset, surf.base_align);
>>> @@ -706,7 +706,7 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>                return r;
>>>        }
>>>
>>> -     offset = track->db_z_read_offset << 8;
>>> +     offset = (unsigned long)track->db_z_read_offset << 8;
>>>        if (offset & (surf.base_align - 1)) {
>>>                dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
>>>                         __func__, __LINE__, offset, surf.base_align);
>>> @@ -722,7 +722,7 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>                return -EINVAL;
>>>        }
>>>
>>> -     offset = track->db_z_write_offset << 8;
>>> +     offset = (unsigned long)track->db_z_write_offset << 8;
>>>        if (offset & (surf.base_align - 1)) {
>>>                dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
>>>                         __func__, __LINE__, offset, surf.base_align);

