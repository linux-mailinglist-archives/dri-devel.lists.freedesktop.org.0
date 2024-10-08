Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D399418D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1699010E4A3;
	Tue,  8 Oct 2024 08:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bNeyP3Be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4354010E4A3;
 Tue,  8 Oct 2024 08:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssEQI4IF1rOgyMBETJU33Rm4RFSBJ4X41uceRLCBdoFi9Gq8hERjotg87XEQgCnGlJppi9pFztD7pF26pMzF+JSdSaR87wrvGXkAKvSd5+QnAA0X/hLXQ4U7SE2YCYSUkPy17C4f8vTpE+DH+A6xfILKk3GDIFaKRoc2YurQwAtLVQFMyD73h/fn8q7TcjDrq2yxSiGh70tC54aHk6Sykfl+xAr4YfWOJPMoq6b9DzlweCPLgBOGGF+nFaI/LRzm/f0qQ2Uk/1cHW3CHoQc1Q0zsiVWEUqx2wixkwIyYyCDXummcUoPbKKgrGdZT54OnzfJ/sIRgj5DjknGT4gOamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWSWBRlcINzjAYjnj340U8ZIQISQyO1yBClH0F6f6vI=;
 b=izy6zLOyV99D03fJJMwf73VCwzkOYLSNwwe+A0BwY0wKO5qE72L9eA/VO811VJxt5AiVksRJ3ZHc/RF1WPteRcz4I/QK/LXxPh7Zk9XYOt2TQDdiqLUCLs6hTNEbKy67E/moV4+hXDE42rLYLVXXJns3cwRulSDVIDEGLmWUKoZG4w0BiV4IlbPx7r4N71Qbzh6GCgYX06RmQ+KUkN+3Ol/QNUmK++3+V1byvCnFwxn/2flF9AQBBa3i6ffYE77x4xHe5c1gOYjBQoPqvdg1gHfskWj+/iVPup2jjBRy72qvklXhngkqQiIfVMmb1vDjMWeXeOAe1Otv7lOec7iiNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWSWBRlcINzjAYjnj340U8ZIQISQyO1yBClH0F6f6vI=;
 b=bNeyP3BesyrHUwiDlSQPq83thCsHQxbeGxmExhMFdwJ+h0CR3pjwztA9fWHi509paktWTqr65wWRgD/ScF/eYbxles+VOJe0gMC+LKVMv829CWi/GX8zXmGwwV7sDsQ+b7dPeYbcI/4XQLafM5m7KNLtyEratknt8QWPcOcooX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 08:27:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 08:27:15 +0000
Message-ID: <c3cbe908-ef13-4d76-afe5-bce4a3a55195@amd.com>
Date: Tue, 8 Oct 2024 10:27:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] DRM_SET_CLIENT_NAME ioctl
To: alexander.deucher@amd.com
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
Cc: robdclark@gmail.com, amd-gfx@lists.freedesktop.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, dmitry.osipenko@collabora.com,
 jani.nikula@linux.intel.com, tursulin@igalia.com, simona.vetter@ffwll.ch
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c159ca-fd07-4b27-f22d-08dce77303d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGtmelhucWlMcVgzWXBiUlN2ckJ6ZnFtVmpFUlMzKy8waWNLZmFJWlo2Qnlt?=
 =?utf-8?B?OEJFdTY2MEVZTHJDL3JxZ245aUVGTnV0dm5RV0FaUmVyUDRyTGp5KzlqcEcy?=
 =?utf-8?B?NCt5M0daMnY1MG4rd20vci9iRzNydjBlRi80cEZ6OEtkdGZZd3pDR3NiVFRn?=
 =?utf-8?B?U1RHRzVCeUVVTEo0N1VIbUVrTDBjWnFYUnRXUFVwb2NnZUx6UHVTSmNQQmJ5?=
 =?utf-8?B?K1RUcTd0MkZrR0FaOTNVSEJNQUpPYUh1SUhpODZXZ0t0YTM2ZFVzSlJRbHlH?=
 =?utf-8?B?ZzRmZnpPa1pKQ1dpV2psNGE1WGxYMWJXTUVndmFaL2ltWmVhaEJCZXFGNHVC?=
 =?utf-8?B?OC8rWkllTm1iMDM5QWRKK2t6N3ZVSzZkQWJZNlU5dE5GbXlRem5mRWdWaGFQ?=
 =?utf-8?B?NWNtQXZzQmlnbXNtWUdpUGE1NlNqWU9pbVUyNDA4aXViMm5JcnF6YWVIZ2dr?=
 =?utf-8?B?OWdhWW14dGtSWG1CT2g5YWlpTTYzVlNHNE1xRTUwQ1NSSkVsODJicHNRQXlx?=
 =?utf-8?B?WDE5T1NHVnd0ZGNLc01CTXJLWTFrSEVaM0ZiUnp6VzVPTmcrbWx1MXZCczIx?=
 =?utf-8?B?RE5sQ01mRXpPNHhGR3Npclp3eGJ2WjlEYXduV2FyemhvT0ZOaHpmbzZmeDF4?=
 =?utf-8?B?Y3RZcy9sb3ROcmV2Qktyd0hURVJNUHRxamllUHlBcGx1MU9ISEo1Z1JxdWZq?=
 =?utf-8?B?bGxNSE1jbXFGbUlHYVE2eEFqODRLeVlmS1FsWFl6YmkyQ1RVaWVVZ2lNeHk0?=
 =?utf-8?B?bkxNT2kyZ2JROTdnbFFQYXRnK3M0UW04cmh3WVJ2ZWMxWDYwblhSbDdMbzZY?=
 =?utf-8?B?dFllMFN1VDBiK3ZmN3FmU1BabC9BMkIrNzlDZ3F6ZFRld0tROWY3dUpHREVh?=
 =?utf-8?B?YXN4SUIzTmtDdGNIU09CVG1nVDJXQk9XbjlwVzRnVXRPSVhiQnNFZUljTVJv?=
 =?utf-8?B?MlowQXJ2NWdRV2lpcTJIblhkcFRweGlMbk43NThaME1SUE5oUnc4a0tIOGJa?=
 =?utf-8?B?YWFYSXVaVklRTm1wQkdyVnNXUkMxQ1AvYlRGa3RCUzFoeXJnd1lzNGRQbVA2?=
 =?utf-8?B?OS96RGR1dExrQzVsM2I5KzJOR29HOTR6NzBNbWg5SW11T1dzd1c3L0IzcFlL?=
 =?utf-8?B?S2xhRk9lb2ViTEl3V3kzb0NvZGZ1ckdqc0J1L1ZYdi9wR1A4cVRqZUlhTFp6?=
 =?utf-8?B?QWliQXhicWxlOXFNbllmZTNZRmtqaS9GYytUZ0hJVEhnZ0c1NG4xejVZQ2Ix?=
 =?utf-8?B?enNFZG5YY1g4MTh3ckVBM01sSFd3TVFlVFZ6MDd4WE9nVXlpRWJIZkY5STlt?=
 =?utf-8?B?UlB0aFQyQ2tTY1NUcnE4YmNrRENibnZHQng2VWFzNWwwd0ptakord1VPSVMr?=
 =?utf-8?B?MTdnNk9uZEJjdkJGNHphRzVaMVowYVZYellpbTg2d3JCbWdnRmI4SC9ob2U5?=
 =?utf-8?B?Y2FPbWxRQlNjOEwvNGV1NURxcDRZK2JmeXNvVG5sb1lmcDNnRExzZlF5N2RQ?=
 =?utf-8?B?WThjSTRoODB6YWtQeUpNUS81cm01bTRNVW1GNVlxc3cvamI4WGFZSW5HdVVW?=
 =?utf-8?B?eXZpekl4T0YvN2I3WW53emExOTREeXdQQkJMUERoL0lkQ25hbGltWHZvakNp?=
 =?utf-8?Q?BE98a2Xcm7YB5maMXFDntrpqY20V/KdbgXznpjhsl0Vg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG9jRGcwclVQYnJLZGg0WEcwekdGS1VMcVhxOTBSZVN1QWhFdjAxMEZCUExp?=
 =?utf-8?B?ekVxTVpRWEpOMkJSSUUzT1JTQ21JVkRKVUk2Zk9IU2tiQXFpaXFoMmlmS0E0?=
 =?utf-8?B?TU5xd3Bwdktkc1MrVjhORkhuYVpIZHlmUS9mdnVKOHdSOFJ0UWNrUFNNWDVh?=
 =?utf-8?B?dVZuU09Vb0ZCS2dJZWQzMVpMSUNvMzhYZlhyRE5yOGlpaFFLS0NwaFZUOWlB?=
 =?utf-8?B?TTZ3R2cyRW9GOGVpYU56V3Q1dVJjazdiVldtK1ZRU01VeEFmSWNPTXBBSnB2?=
 =?utf-8?B?ZldtTEgrTGFnUTZoWlhuM2FtYTd0Q2pzQ3JIN3VDVUhFUEczZ21pQkUwVi9Z?=
 =?utf-8?B?K1lpTmR0eVVuTlcxVWJhR0JiazJzK1lBYTJUTGE4Q1JLVi83eGNuYzJMYlVl?=
 =?utf-8?B?Y0tScXIzaUxmdmNPZlBYZzMyQmZ3QzV3REttTzEwM0ZUQVB2VzBmRjU1clZl?=
 =?utf-8?B?Z0ppV0FubUYxZk0xOWtzK2lOTzF5bjJUenlsYkViNVM1UFE1eFZsdEgzMlJM?=
 =?utf-8?B?bEhZZFJRMURsS2YwYXpndUNtditkbGtvTWpUMFdnMkFkbDRjMW5FLzhQVmNl?=
 =?utf-8?B?Y1ZXSXFPNUZGUllwbmpOSHZPNEFvMDhBeC9IM2g3T3MyVEw0SmdoZTBHTGhF?=
 =?utf-8?B?aUtkUlEzaWRpR0grTzBDN3pqSDdVcjh0a0hWVlprTDhGenMvaFlSWmhjQ1BQ?=
 =?utf-8?B?MTVJM0UrNDRZTHg0cE5zek5NWWhzay9HSTd1dFFxaS9EZ2NrY1JrK0FsSVJR?=
 =?utf-8?B?dktVdzVWdk4yZjNXN1ZNREtEc0cyd1didHRmRGlZSjAwWXlBLzhFcjY0eWUy?=
 =?utf-8?B?R2tud1BmUi90OHdnODRGSTlsTWNjRGk4TWdLM3l5WmVqWU9ic05TUUhoVmNI?=
 =?utf-8?B?aERUMjdBNE9hTkc4QjZrR0owN2hyazYzQUkyYTBKckhScFh1MmhiV3kxN05G?=
 =?utf-8?B?MzYwZ0I4RFUzMXdVcXE0T3QrTVdrY1Q5Q3FuNDlJTVkySm5oQ29lTVhPdDVy?=
 =?utf-8?B?QzBqWFZsODEvNncvMXZFVGpIbmhmUXdSYkR1VkF3bzlDMERWSnJYbnpDTTZZ?=
 =?utf-8?B?WXZzMk9mYis4SE9xYnB2eVVQcXpaZWtsVnZhMlNEWkpGcDVFYnZSdGk1RUlm?=
 =?utf-8?B?eGtlRFVaeEEyYXd0YmlOTTl3Qi81WWE5VytNVlZ5STFra0Y0VmhQdldtbnZD?=
 =?utf-8?B?Um5zZ2MvWitiMVdvVStXalpWejcrS0RmemREeDZVQXl1RCtKcW1ickx4elJW?=
 =?utf-8?B?VVFJVFNjWDNiekJXNkwweUZTdlVFeHlOOFgrNDJZYmQwWmJsbnhSVUViZk0z?=
 =?utf-8?B?N1BCWElNK0NWdGZ2bEg0cFh4RWhGYis0azFUeS9HQXJsMnh5K2IvZHlWNzJi?=
 =?utf-8?B?c1F2N1ZTRk1PTDR3TUNtVmlSZytGcGNvVFF2UFFDZFBYd0pqamtLRmdGWlND?=
 =?utf-8?B?NmVkRVh3bjJxNytVT0RCRFhpa0xPSVRRRHNMM0loNDFoRnJUZzRHYlk0eU9z?=
 =?utf-8?B?Uzh0RDNlRmd2dkJGWEZ5Wmg2UUo3dGVWUW91TEJ4QUtFRVNEb0lzaDNadnRu?=
 =?utf-8?B?STlCZks5TGRKRzVOYXN4VTczaWdjRWFLWDlNQ0NSMy9KOTZtUjl4NUNQRlBO?=
 =?utf-8?B?QjdtcHpHUTZ5TFcxTTZnTEkrS1FTUE5JbUpOckFQeFRZRkg1ZXFDUEE3SUcz?=
 =?utf-8?B?U2tjSUdzV0VkZ3dDaENPNDhhUE03STREQlNyTStHOXFtNVA2K0hZSXpxTzFK?=
 =?utf-8?B?R09KV2F5UnIxcVFrM1N1Ujk0WEUwN1lQNS9pajhjSndhYnBGQzFKSXJCQlZW?=
 =?utf-8?B?cjRIMXlOa0c4cFdsVTZmSkdpbXJoV2NDRjFnMUtMcCszMG9PVVNremJNMWRo?=
 =?utf-8?B?dmJtL2hBdmxuc0dPUzJ5SW4zSEtXQmJUQ3pRL0FEWlNwNGNwZWZWdTcvQWRI?=
 =?utf-8?B?dS9JZmtVMVFDWFhpZ0I5QlcwNDk4UmtJcG5sbFMvakpqZEJMOUxSQktBTTlr?=
 =?utf-8?B?RkIvSXpYdit2cVp2YTBrVk9Od21LZHdtcnBOUFg5THRTZGFRSXdkMXlDVEVE?=
 =?utf-8?B?dk5SSUc4NlZycGFQQVU5MVI0VU9QTlYvamYzeG1ORnJQdDNKbUhPcitwMlA2?=
 =?utf-8?Q?o7XNd45XmT8JKubm+/LCJk5rc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c159ca-fd07-4b27-f22d-08dce77303d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 08:27:15.3602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAocSknup0AgNN/QI7qSMxqTsskdBdiDN1nu72fE6LEscRehYJHFNYTb36yJo3mq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
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

Hi guys,

I've pushed the first two patches to drm-misc-next.

@Alex any objections to merge the amdgpu changes through drm-misc-next 
as well?

Thanks,
Christian.

Am 03.10.24 um 14:43 schrieb Pierre-Eric Pelloux-Prayer:
> v5 of this series which is adding a new ioctl to let userspace associate
> a free-form name to a drm_file.
>
> Having this name is useful when debugging or tracking resource usage; in
> particular when using virtio native-context driver, where a single process
> (say QEMU), uses 1 drm_file per-guest application.
> With this change, fdinfo and other tools can map each drm_file activity to
> the guest application.
>
> virglrenderer MR using this new ioctl to associate the context "debug_name"
> to the fd:
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428
>
> Changes since v4:
> * patches 1, 4 and 6 were slightly reworked based on Tvrtko' suggestions.
>
> v4: https://lists.freedesktop.org/archives/dri-devel/2024-September/471695.html
>
>
> Pierre-Eric Pelloux-Prayer (6):
>    drm: add DRM_SET_CLIENT_NAME ioctl
>    drm: use drm_file client_name in fdinfo
>    drm/amdgpu: delay the use of amdgpu_vm_set_task_info
>    drm/amdgpu: alloc and init vm::task_info from first submit
>    drm/amdgpu: make process_name a flexible array
>    drm/amdgpu: use drm_file::name in task_info::process_desc
>
>   Documentation/gpu/drm-usage-stats.rst         |  5 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 67 +++++++++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +
>   drivers/gpu/drm/drm_debugfs.c                 | 14 ++--
>   drivers/gpu/drm/drm_file.c                    | 10 +++
>   drivers/gpu/drm/drm_ioctl.c                   | 51 ++++++++++++++
>   include/drm/drm_file.h                        |  9 +++
>   include/uapi/drm/drm.h                        | 17 +++++
>   23 files changed, 172 insertions(+), 42 deletions(-)
>

