Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21D83E136
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951A010FD16;
	Fri, 26 Jan 2024 18:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959EF10FD1C;
 Fri, 26 Jan 2024 18:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwvjCsoNXpDXX6A1cd7Ub+jOcxc3ZZ7194HvjdCCYMjpO7HgHb+pYIQhw1QGZy2wtxqoyvn6x7cWi0EclBE3h6zwoUojsoyjFEcAAWq5rNjoBHbKJCLMT+VopqLIpWs9asemwKEelkArqAUtpYMrbgd72CvSJ3svTG3t03EqiX5QEz9wHc/zVXRJt5KIWz0kX1yi+groegbZOgdK9BC0NCis2jSAxaZKsBZuEsp3gzClJLC8upcvDPzVZfUff/hRH3kbcuYbPiZE9XJSC8Y0mtvA8DFW3mSzanY4XmkrYqIFVBYmXGkEOkgMSNrfRNcL0qrUWwWMNL3SBOwU+CqaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am2CK7X8wCiASCkS2lYx4ubpGkYeVK9TnMEYYMLLDLA=;
 b=J7uk7VKthAQ13z37URgwUWWy0CF/IlBFZHbo5oyD1ZlrGbi0vgNUEt1lY4pTaJ4SVKwiDi/fKucMaFVrdY/RAHCnLZ+szwK/wKyXmLRAtt1lQcr6U2VVbkd3RmdMpkz2v1o8wwBTvAfJe0fP6tYHr2V6Kl8Nglk0u04owYMugg8x0kyXeRJoBw9IXkMsRc23ftkKQij5R9mXIRgPI4ynWeA24EjA4qQiPJ2f8/2ewgTIBqJUGn/wzCIrrtK46bsq/ZG6Qs3XJCYM139aoOKnh82AU6YZieU+Spt4klVdL1vZqSNDnmmvrmWKSfogdsZRoFGUBkSNoZSZhY/UICwd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=am2CK7X8wCiASCkS2lYx4ubpGkYeVK9TnMEYYMLLDLA=;
 b=tCqMLB1MUCp20IppBh6TXN59XuAhawkKP/2u3s7djyNeEKC3ZIp+D1HciGGLN32I3tGRX2F48Jhlhg50zRvJP80XUXGVouASVJH81Zx3LYXfrxJFe7gKHID9eqW2blcLaWQhA5xxZOyDO0jGQ4KxshNSO2nykvYUBZnJVAWpyiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 18:22:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 18:22:39 +0000
Message-ID: <5fdad82b-3f14-4bb4-9f49-b8397419204d@amd.com>
Date: Fri, 26 Jan 2024 12:22:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] drm/amd/display: switch amdgpu_dm_connector to
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, alex.hung@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, jani.nikula@intel.com,
 Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com
References: <20240126163429.56714-1-mwen@igalia.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240126163429.56714-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:510:325::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 5756b7c2-b8ff-4a58-4c28-08dc1e9bc75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpudk0gFkEOZWXspfRpUgKqP+51l3NCL0HgMkJkNV//i1GABmYDYVZiUYI7WbpVJue8WZbh4KnH0ie3EPNHegmUFvdM0GgX3oCw1arsq+xtc5x43kAk7xCLgqjntu724s7HbfG4XeIeCLxro8xbDLkZOz/uOLmF63hQsC6PVtSJhxP4tRra+ruv5ctmsAm8ODpeFBbOI0h6sEU1H9F5x5QPZXyA5TnUozVhU9iFPLi5+Bd6cPe1vBtlq0uLAzhr44eawzkILR2u1Es7cb6vUSWME6TkYmj3ImHyUdVN8i1HnuulJbhAR9cQKB/fptPwLxmCqBw9W3FX7KWa/zRpJPc0P0+CkRG97ioNL2yngN7RCE/ixihfWgl6FNYlFoAkuhz+nyWsllCWOAhxV/mvZUGryEX73pyvhe2wFQnKmx+l7Q7ZnYfI5VnZLdIo/gokobPbHmVxbwP6Y5H3IsfcJoJ7bIy4Bz5nk3RTMjRF+gha5S7vTp0zAyefMrdPYLnx8B2rBhBfVkdwqUoOU4mqJ3TzrKPq073d8YYwJzfFxTtr8ftdl3yBzEjLy3I/6KCLqwCjGDdHmdwiLnNEOX31RGwBzrwoMuKzB/odHE2TcK0I49boeaPPbV3R+WvHTYvzzOZrSU6xmN/4a6lTi2BHBMJpd6OqWPm+qTm2Il0q8l13OSfK9ZzJf2HRtg+zRqHisETR6+sZ/79IcPGH7EHOAVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(86362001)(66556008)(6486002)(31696002)(316002)(66476007)(6636002)(478600001)(38100700002)(4326008)(6506007)(66946007)(2616005)(6666004)(5660300002)(6512007)(26005)(8676002)(44832011)(8936002)(53546011)(83380400001)(36756003)(921011)(2906002)(31686004)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3E3OWtBRDRRLzQyWkhNOEZpRlFiTDE2a0xDWUFScksrQkw2Nnk5cWpOZGhB?=
 =?utf-8?B?c2t3UGxxWHR0VVJXS0puV0o2RGJod09wZG5KMHMwRVFZcFZGOWt5MDNBbUpS?=
 =?utf-8?B?SmtPZjQxV05lV3FQaTRCSXBKV0VoMnFUdFBYQkM0RkNROWlPbFFoL0prWmJ0?=
 =?utf-8?B?UldEU2FSellTK3RXRW0xZDNnbWVqcWllazVIdEFJazZNK2RYKzM4UDhZckM0?=
 =?utf-8?B?cTZMZ05uOVZGT2wyMGpRbjNPd3FyS0tLY2RmSStoOXFybXRkelFCQld2NUY3?=
 =?utf-8?B?bnIvMEszQ3RuTHpQUnFHZG5xNmVSNlVXSlU5ajZPMnBPMitKTFFGdmV6cC96?=
 =?utf-8?B?NGRtdHpuN05OdG9NcWY3aGtUUkQvUVlJaXJZbHJTUVo2ZURaRnBIS1J0RitT?=
 =?utf-8?B?UzdBYkJqdnIvb0YwekxDM2N3RjQ4ekZjVFk5NTdFQWtKWVM0QXhVZCtYT0VQ?=
 =?utf-8?B?V0ljZlRPTkpnYmk2NVQyYmxhdHhvMFlMY2ZuOTRVQ2RZTHZWS3UvelJWUGpF?=
 =?utf-8?B?QWlnNGI2ZHVRNkFZZW82WnlEY1NVa0ZZUk8wMExlQXhvS2M0Rmd3T0FUeFl2?=
 =?utf-8?B?NlBvSFlPajFPbkRaU2hQTXV6VXFsRmxwbkNqUG1MR0Z1RGRQa0JUdEdDQm9u?=
 =?utf-8?B?UUtuUkMramdkZkxzUGo0dXpmRWtaNHdLNDZYSlJyUEZZbGJsMm52d1g1a2tF?=
 =?utf-8?B?amdzR1k0NE9kWDVHU0RTdXpKaEJEVjJZaDVEeWlrWnN1V3VuUUt2NUovRnZn?=
 =?utf-8?B?c3FSTEZmeFZVTmRvS3JCR0R1bWhPWXV4WVhsVHUrMUVXZzJDQkZNdzVZbzZk?=
 =?utf-8?B?dUxURzlsVDhYZFVaNDZrUUh2UzBUSXdDQ1VRL3ZBKzRzWTVkRStCNUkrWVJ5?=
 =?utf-8?B?NXM2N3R2ZlliaHRJd043RnFUQkV4aEhIa3RqM3VidVV5YjlNaTl3b3piMGRE?=
 =?utf-8?B?dndUY09VYUhLR2thd3pib2xoU2pVMFo0S04wenZ4L2d0KzIzb29yZjA3ZXZB?=
 =?utf-8?B?QXZxZVNiejVwNTBURGF4RDRubzdqSUI5TnlPWTh1UUZNZ1dNdjM0bWh3ZEdM?=
 =?utf-8?B?VjZBTUU1cnRTdXVaVll2RHVmbjNvZ0lQbTVSV3FWc3k4a3FNM2NUSEdvSWNS?=
 =?utf-8?B?T1RPcVJjVGhUakJ0TWliRXNUbFlmRmlaZHhVcGwrSmo4Z1NZMHNNTGZWb1hW?=
 =?utf-8?B?MkR3VHUwL01RS05uQmNzZ1hkdUw4TmlPMkhIWDZ6SWNNaDNZaEpOcWR4ZXBi?=
 =?utf-8?B?WEFzM2tWeUtuN2lHQnZYODhIQWkyRHF6R0tUczVmYm5pOVdvQ1lCWnZYcmFv?=
 =?utf-8?B?MFNoS2E2cXMzSGUxMnowNnR5ZGRIQWxaTmg0ckpFMUZBVUVRbitqeUkrWlJi?=
 =?utf-8?B?UUNTb0N0OXowVHZtcTJMVWM2Nmd3c3F1K0kvNGp3UjBTd0o5TGJWNlQybytk?=
 =?utf-8?B?ckllRkVCT2V5aGNGUzdrQmVOcXZaWE9mUG1sYkVJR09GQmdMa1lTemNIUDJN?=
 =?utf-8?B?NWtGQ1E1YTdQdk5xWlJ6VWlQZmE4N3FsYW8wN0wrRGZvVGFoeFByQnZFb0xy?=
 =?utf-8?B?U2NZY2tnRmVjdzIyMVlSV1QvYmhCTmpKSytOZTRCSTZiTlRtUkdEOWJUN1NS?=
 =?utf-8?B?TFg3aVhBakhTamRVMm9YRWUvZXRZbzRybnFQd1Q3RXA0NVVoWE1yaW01TytW?=
 =?utf-8?B?SldDK2FsYzJiaDdmK2NndjJVbWZreWxONk8wa2V3RThDdVdtMVNmL1R3YThp?=
 =?utf-8?B?aWpUcGZITDdRWlU5U0ZHQksvYUxaV0JobVAxTW9IcC8rNUk1K0FaSVNYaDly?=
 =?utf-8?B?KzdqYjQ5SmNKOTZMSHp6d3pxNnVlQ1VJeUFWWE9Ka2RPbjAvNUkrREVzamFP?=
 =?utf-8?B?MmJwbmdOTXorRHNSalYrNXVhUGdDd3FXYUdUS2RrRzZlbGJpWGR2cHJDK1h5?=
 =?utf-8?B?akNnNm44UlFSeVMwV0FMNGkvUDJUQXJXS2EzcnJsYmMwaVNac01oNHAwQmtu?=
 =?utf-8?B?aGordkw4ZXRyVVh1MmsvdWNBTjJteEllQUxiOGJhejFSd09Xbk9Wb2JrZ2VH?=
 =?utf-8?B?VXpnZFFoRktGY3ltTG9qbUZjTi9EZjNlNHhiZ0YxU29maHV4M3BtL3BUY1pV?=
 =?utf-8?Q?SFUehP/s2IuYBF9QVlxaFCb+V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5756b7c2-b8ff-4a58-4c28-08dc1e9bc75e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 18:22:39.5524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZWRt0PrmoXakSsiIU3lZYLcMJ/Atma5hgr03X5tb1ckvtk/uDv7o/bGMqpmPIXgsIgTnqQ6dqNVRxQieMlh6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/2024 10:28, Melissa Wen wrote:
> Hi,
> 
> I'm debugging a null-pointer dereference when running
> igt@kms_connector_force_edid and the way I found to solve the bug is to
> stop using raw edid handler in amdgpu_connector_funcs_force and
> create_eml_sink in favor of managing resouces via sruct drm_edid helpers
> (Patch 1). The proper solution seems to be switch amdgpu_dm_connector
> from struct edid to struct drm_edid and avoid the usage of different
> approaches in the driver (Patch 2). However, doing it implies a good
> amount of work and validation, therefore I decided to send this RFC
> first to collect opinions and check if there is any parallel work on
> this side. It's a working in progress.
> 
> The null-pointer error trigger by the igt@kms_connector_force_edid test
> was introduced by:
> - e54ed41620f ("drm/amd/display: Remove unwanted drm edid references")
> 
> You can check the error trace in the first patch.
> 
> This series was tested with kms_hdmi_inject and kms_force_connector. No
> null-pointer error, kms_hdmi_inject is successul and kms_force_connector
> is sucessful after the second execution - the force-edid subtest
> still fails in the first run (I'm still investigating).
> 
> There is also a couple of cast warnings to be addressed - I'm looking
> for the best replacement.
> 
> I appreciate any feedback and testing.

So I'm actually a little bit worried by hardcoding EDID_LENGTH in this 
series.

I have some other patches that I'm posting later on that let you get the 
EDID from _DDC BIOS method too.  My observation was that the EDID can be 
anywhere up to 512 bytes according to the ACPI spec.

An earlier version of my patch was using EDID_LENGTH when fetching it 
and the EDID checksum failed.

I'll CC you on the post, we probably want to get your changes and mine 
merged together.

> 
> Melissa
> 
> Melissa Wen (2):
>    drm/amd/display: fix null-pointer dereference on edid reading
>    drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 78 ++++++++++---------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 ++-
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 23 +++---
>   4 files changed, 60 insertions(+), 54 deletions(-)
> 

