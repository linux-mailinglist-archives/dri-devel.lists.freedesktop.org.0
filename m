Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF87DCD7C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BD610E4AC;
	Tue, 31 Oct 2023 13:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429C710E4AA;
 Tue, 31 Oct 2023 13:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDyTW9RQu8D0bY8zkYp8EsTg3Sr6AwVUMy9KTjT0kTozpRlV6FJFZ0GXltHGdu1EAm5P0TA+O8M3u92+PvaebMwjn3yYCI/qPGWGTc4/hZKC9j/aL2hRmqFO7T1ebzbpVWHj7/caj3VLVtdNq7Pz22t+4/M0ssplv6JL5ybe7CXECx/BqzTuZgj8MRZP7SfSWnBqTi1fGST5rpYwR21j4YHfUgV7WRADQfwRoln5OHzFG2CjMwf1c4cPpcpGSZZPMCSIi3TTwcjmvaANaK/t6F5KwEBi78D7QF1rEyWicSyoGV6sOmlKXQuu+zlem7v/AAB2wZhI5Q1DRm1xKKzyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJBB/vdySjFgWGcr3bofS/attC01lHNF9fORikUOfG4=;
 b=ZznEeAK+OA+qrYT++ynY62hvu+U8ILrQq8fdFFYOPp7qw3d+HTguTIxTP6wKh7wtfTaOuDyE9XfOXZ9iKPyfwWub9h34/1OPdq2ghbewwzhmPc9c/QJ3KJQD1uk0NLEJ0Y3QV2bYHqbocNAnoUOYmyjEXbT4jpzxwpDLoFIl0e0tnn9dBYk0V73oQ76FLDZUX2YIVlgIVTMHRKTPhqHbDhNf8Y40n45xETWz+cvWO4F8dbdXUatyCcCxdYcVTagQCqtjz7o+ZHkJZKKsWm03U4bqNB/byqfXettY3tq/myn0lL/0bcVdZrL+Q6hojOMOjXqO4kvXBbExl7XogNYc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJBB/vdySjFgWGcr3bofS/attC01lHNF9fORikUOfG4=;
 b=aWBiGbhV6kgyNh5eQ1B/XYzSJUZIUiv3/sWHz4lkab8i6TavKtkQjO26WPnYf5RnAeTd932mkKf5zAwoEIgJN3rPV3n2Vg5hqAvJYGpBeB8t/FfcD2I7gP68M2J8oiUESypdH5tQRaIDHFHTlQpjkAt29v70bH/hA1tiP+Sv8f0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4060.namprd12.prod.outlook.com (2603:10b6:5:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 13:02:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 13:02:23 +0000
Message-ID: <64c5cbec-d29a-407e-9926-7fcc1990e436@amd.com>
Date: Tue, 31 Oct 2023 14:02:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rx7600 stopped working after "1cfb4d612127
 drm/amdgpu: put MQDs in VRAM"
Content-Language: en-US
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231026173320.552430-1-alexey.klimov@linaro.org>
 <CADnq5_PFHZnR2aT0+iTgQE5vob9JqLk031JVY42Mx_u55D986g@mail.gmail.com>
 <CANgGJDqKZUL6xA0oVsNQ-McpOAD3jkxqhfFXuoycLBQ=8RFaMg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CANgGJDqKZUL6xA0oVsNQ-McpOAD3jkxqhfFXuoycLBQ=8RFaMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4060:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f079487-21fd-4ff0-31ff-08dbda119faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+vTwGNNcCgq/kUcKDFH2iFtsdIx4rDtweKgfW95sALXjHL4BC7IblWKPxy6QHj7nwaOyPUXHVoGtudCvLkT75N4o3tiFbjEV8Fmh/cd2SsmtgRBj47GrwlicV819oOPx/muyB0xupLb9wizWBBWfGJ7yeBxPLgUyOhcFZGMb47WN+oevWzkJBKLnijcoirSzcKCUEStqvLZNmxM2kE0d+kqH+PGy0/U2br9aLwVA8TG5ZxOq0vKqaaO2K/RpG7et/2FbBy/l6H8N1ThxgXQ5M4DPG8vB67EgCHwnEEcqpuitKNCzy+pgpx6NRBaJHuHHL37gQ1wg7cnh8GALtX27WuOzq/nOW5ThOnFyn4z/UPb41FqHaU7XjbL+H9QlV6HQhBi7gdcQMV9r9D6grKqUXTPIxlXFX2ZZMSm8VkPmmC5iTrGY3KWuwKBI2prsaj4xJ2rHWlMZWA9LJ9+6eoYityDOb8FkAefrd7hWh5lztLBlLTkpC86CYZ6C5PNlkxgEXN+dsPbkDnIfl//WtOlt0cOz5q0QaG/5ghBG6Cn8zy6JN28HOQlVokmbzkuri4FTPJPGwLuRPZFWsnVV5r8JWlqQNsLNbZfHfI8jiEB+JYRvqOiX6YPkZ1ybmXu/EgpCF7Ndgj5mk2LcrWLHfSgBeZxlcPC5+lafXWuc5oxReA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(36756003)(86362001)(31696002)(53546011)(6666004)(6506007)(6512007)(26005)(2616005)(66556008)(110136005)(5660300002)(66946007)(66476007)(6486002)(31686004)(966005)(2906002)(478600001)(41300700001)(316002)(4326008)(8936002)(8676002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NENHSVdJVU5KNjdQZ1F2U0E0b3o2L2JEeS9jZlFqVjM4a1FGYXVyc1VKeXgz?=
 =?utf-8?B?amVIYlY0U3U2R0lVMVhxUksrcHJjVUpkOGl1Z0tVT1BSWTR0dVY0dXhqakp0?=
 =?utf-8?B?V2Z1RE0ycXRSNFRwYnRWckl0YmFiV1RIZitLUlBFSkZHellGaUFKalVFR3FY?=
 =?utf-8?B?L1ovbnA4QnhjOEQrbmdEMHdBUk1kYmdqR2Zqb3VNcXhiRUpKL3k0SHpQallj?=
 =?utf-8?B?aDJ2eis2Z0VGbkVGcnVTa1NUcWdHMEFVT2hpbExzdnJ4Q0VYQnJ0NTlIOEpk?=
 =?utf-8?B?NGEyYVNWcXlROFBINForTEF2U21WWlU2S3VoQjF1ajRpb0k5azc4cnZnakNp?=
 =?utf-8?B?SXgrUVJRZVNlNFY2YzJneW5PVUwvOStzMURab3A1UWRHUTFtWlhUT2g3WlBQ?=
 =?utf-8?B?WjErY1RmWEt4aVJuRHdybXlEbXFSY3RHRHpCSmpUcFdpTVdOY0Z6UzNoK212?=
 =?utf-8?B?TUZidnJxR0NuVzlEUnRxQ1lTaUdDM2tWQUg2MDV0QWk2THVTMWp4am5GTU13?=
 =?utf-8?B?ZldtNG9pajAvOTlvYmx4c0ptY3ljZkZtR2pKTXRRKzJWOHlOUDRzajZ0NzVq?=
 =?utf-8?B?eWRGVDFCbVhvWE81NTd3NTNoLzRGR2dVS0dJU0dlNVQ1U2w3L2IyZHUyT0FC?=
 =?utf-8?B?cDBKemNDMTZWNStra3B5bGNQUWV5aC9MelNlVUZpSFlqcHVId0dQbXhtRWE5?=
 =?utf-8?B?bGQ2L0s5NXk5bUxsRHNyQ2RpWVROUi83S1JGd2p3Q1pCWHV5NlZCQVg0NzNC?=
 =?utf-8?B?NTJwSUFpeUE1ZHZpcTIvMHUxenhneXd5eWdmUmpwcy9MK3ArQVBnV213MDM1?=
 =?utf-8?B?T2tQWTQxUXBJM054TDFZZUxaZHFtcWpZd1J5blNIMHpVQ01rc0RsU2J1S09S?=
 =?utf-8?B?RzI4UENucExVeUZFcWlWa1RpVklmRzBMdTNVZUx3clRTcUFLcGlLZXlUWmsy?=
 =?utf-8?B?M055bm1RRFNFZnEvUWh3Y2kvempMRUphTC8xOXYrbnhzOCtNc3RsZlRJQUky?=
 =?utf-8?B?RHJoU2ZUZlgzY2tGRnFKNHV4QlhIbHN2QVNkRDlOTWdHbnR5cHJNenpjNVpT?=
 =?utf-8?B?SURneUJtRXk0cjlJa2paUUdjd0VVS1UreWs3UlVUYWlKS3V3YktBbFhtOG1I?=
 =?utf-8?B?K0tTVTZ4OHNYR1N0K3FTWEdGcFhpalRyaTFwMFBqUFVuZkhUNlFWdUdKV0tB?=
 =?utf-8?B?MnYzWll2S1orRDd5RTVnVWwyeVo4N29vMVBtRHBhVnA0dVAzQlRMa0RqVVdt?=
 =?utf-8?B?TEsxVWk3UlByTE9wMSs5eG9hNnZ5VHFWdElaeElQYjhvWVlWbmdEa002czNW?=
 =?utf-8?B?WTVERHAzMkNOeVVvd1lTMU94U1hZNTh6VnB1ZmxrU2dKSlNlTnFodkVmR0ZG?=
 =?utf-8?B?WGNvWERqcFNUYU0zV0txcEliWXlGSmRjT1NaN2xLU1FseEN1c1YwVU9ZZlZa?=
 =?utf-8?B?cTRhbDUzRmxvN0JyU2tOTjhUTWZGVXQ3Yld3SGxiSTZmdEpGZ0RQNjNFNDVJ?=
 =?utf-8?B?Z0MzaDZ5Uk8wZngvTFJrQjZSWWw3RHlLMXhYamNtaXFnaE1Za2lyVFhSVTZk?=
 =?utf-8?B?UHJ0VWd3WGsyOTdqZ01hV2ZzMXEwM3BtaExkeWhHbWlucWxhYVJQaU1CZ212?=
 =?utf-8?B?WWx1Y3UxUkFDaEI2TXBwd2UxK0JtVGV1eWxlYVhpNXpnUFhSQjdGZUlIakpY?=
 =?utf-8?B?WmoyOHBxOXl2VU1NTFlvM0R1YktIWXA4ZXkxSXZYQTRubnUyU245WGM1RkVR?=
 =?utf-8?B?WEZnQk1IMnE1alV0ZU1sWnlVRkdFY1JCY2hLRkNWYThkSWkwakZBMEJwelMz?=
 =?utf-8?B?MC9qYThrSHFyVEU2ZGlVN2xMUis0ZU4vT1F3V2Z5dGh0ejNGYnVZNW8xLzFp?=
 =?utf-8?B?VU5jUU5CdW5pNWtpZlhuWE9tUXpBYlpnbS9rYW4zNkpZUDlucE5VaDRwSm5C?=
 =?utf-8?B?MGdzRFgyTWVBZkJEbzY0T1lJaUhQSmFHWFMxVVV2bDcxbTdybDJLREJneW1o?=
 =?utf-8?B?Z25RZHYxN2RVRjFRMXZjejBlUlNOT08yNzgvUUhpZ1EzM1I2ZldLT0ZOcDF5?=
 =?utf-8?B?MFN2cDFiZ0lzYjBPRHU3VUF1Z3Fwb2FCN01vZXdtT0FOQUVYdTJOcWllbnZh?=
 =?utf-8?Q?1gJQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f079487-21fd-4ff0-31ff-08dbda119faa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:02:23.3425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EK1eZZjDBXS/enAq7LspG4t6DZ6X8l01//wv+cSEe/l2EKRYQN00UGLfuwE2Iy+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4060
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
Cc: mathieu.poirier@linaro.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, klimov.linux@gmail.com, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, leo.yan@linaro.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexey,

trying to answer some of the questions since Alex is currently on vacation.

Am 30.10.23 um 17:01 schrieb Alexey Klimov:
> Hi Alex,
>
> On Thu, 26 Oct 2023 at 19:53, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Thu, Oct 26, 2023 at 1:33 PM Alexey Klimov <alexey.klimov@linaro.org> wrote:
>>> #regzbot introduced: 1cfb4d612127
>>> #regzbot title: rx7600 stopped working after "1cfb4d612127 drm/amdgpu: put MQDs in VRAM"
>>>
>>> Hi all,
>>>
>>> I've been playing with RX7600 and it was observed that amdgpu stopped working between kernel 6.2 and 6.5.
>>> Then I narrowed it down to 6.4 <-> 6.5-rc1 and finally bisect pointed at 1cfb4d6121276a829aa94d0e32a7f5e1830ebc21
>>> And I manually checked if it boots/works on the previous commit and the mentioned one.
>>>
>>> I guess the log also reveals warning in error path. Please see below.
>>>
>>> I didn't check any further. This is simple debian testing system with the following cmdline options:
>>> root@avadebian:~# cat /proc/cmdline
>>> BOOT_IMAGE=/boot/vmlinuz-6.6-rc7+ ignore_loglevel root=/dev/nvme1n1p2 ro nr_cpus=32
>>>
>>> So far simple revert (patch is below) returns things back to normal-ish: there are huge graphics artifacts on Xorg/X11 under 6.1 to upstream kernel. Wayland-based sway works great without issues. Not sure where should I report this.
>>>
>>> Please let me know if I can help debugging, testing or provide some other logs regarding 1cfb4d612127? Any cmdline options to collect more info?
>> Please make sure you have this patch as well:
>> e602157ec089240861cd641ee2c7c64eeaec09bf ("drm/amdgpu: fix S3 issue if
>> MQD in VRAM")
>> Please open a ticket here so we can track this:
>> https://gitlab.freedesktop.org/drm/amd/-/issues/
> The patch was there during testing and I will open a ticket there.
>
>> I think I see the problem.  Please see if attached patch 1 fixes the
>> issue.  If this fixes it, that would also explain the issues you are
>> seeing with Xorg.  It would appear there are limitations around MMIO
>> access on your platform and unfortunately most graphics APIs require
>> unaligned access to MMIO space with the CPU.  We can fix the kernel
>> side pretty easily, but userspace will be a problem.
> Does it mean that we don't have unaligned access to PCIe MMIO space on
> this Adlink Ampere AVA arm64 platform?

Yes, that is perfectly possible and makes that platform unusable for 
most gfx applications.

We had tons of reports for different ARM boards and HW generations and 
even looped in some ARM engineers.

Essentially if you want to run high level GFX stacks like Vulkan and 
OpenGL on a platform with AMD or NVIDIA hardware your platform needs to 
fulfill certain requirements:

1. Correctly implement the PCIe spec!

     We actually have tons of boards where people attach an PCIe root 
complex to the ARM CPU and expect that to work. The problem is that this 
isn't PCIe compliant!
     You actually need the ARM IP for PCIe for this to work correctly, 
without that the root complex can't do system memory coherent 
transactions for example.

2. Be able to run all types of memory accesses on PCIe BARs. For example 
some platforms can't do large reads and writes (vector operations) to 
PCIe BARs, but can do them to system memory.

     This is actually not a hardware requirement, but one of the Vulkan 
and OpenGL stack and applications based on them.
     You can work around this by disallowing CPU access to PCIe BARs, 
but that either cripples performance or even results in applications not 
working at all.

> Do you know if it is related to the thing that PCIe BARs are mapped as
> a device memory and not a normal memory? (and they should be mapped as
> normal memory)

Depends on what you mean with this. When changing the mapping type 
results in allowing unaligned and bigger accesses then yes that would help.

We will upstream the patches to make at least the kernel side work as 
expected, but that's fixing only halve of the problem.

Regards,
Christian.

>
> [..]
>
>> Just removing the addition of the AMDGPU_GEM_DOMAIN_VRAM domain here
>> will revert the behavior.  Since this is an important optimization and
>> we aren't seeing any issues on x86, I'd prefer to just limit your arch
>> to GTT if we can't resolve it some other way.
>>
>> Try patch 1 and if that doesn't work we can fall back to some variant
>> of patch 2.
> The patch 1 alone doesn't fix the issue. Both patches 1 & 2 do work
> and amdgpu initializes. Still issues with Xorg and wayland works okay.
>
> Apart from that I observed "amdgpu: [gfxhub] page fault" one time:
>
> [   12.432567] amdgpu 000d:03:00.0: [drm:jpeg_v4_0_hw_init [amdgpu]]
> JPEG decode initialized successfully.
> [   12.442516] amdgpu 000d:03:00.0: amdgpu: [gfxhub] page fault
> (src_id:0 ring:72 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
> [   12.454080] amdgpu 000d:03:00.0: amdgpu:   in page starting at
> address 0x00000000044b0000 from client 10
> [   12.457317] usb 1-4.4: new high-speed USB device number 4 using xhci_hcd
> [   12.463548] amdgpu 000d:03:00.0: amdgpu:
> GCVM_L2_PROTECTION_FAULT_STATUS:0x00000890
> [   12.463551] amdgpu 000d:03:00.0: amdgpu: Faulty UTCL2 client ID: CPF (0x4)
> [   12.484914] amdgpu 000d:03:00.0: amdgpu: MORE_FAULTS: 0x0
> [   12.490474] amdgpu 000d:03:00.0: amdgpu: WALKER_ERROR: 0x0
> [   12.496121] amdgpu 000d:03:00.0: amdgpu: PERMISSION_FAULTS: 0x9
> [   12.502202] amdgpu 000d:03:00.0: amdgpu: MAPPING_ERROR: 0x0
> [   12.507934] amdgpu 000d:03:00.0: amdgpu: RW: 0x0
> [   12.512716] amdgpu 000d:03:00.0: amdgpu: [gfxhub] page fault
> (src_id:0 ring:221 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
> [   12.524355] amdgpu 000d:03:00.0: amdgpu:   in page starting at
> address 0x00000000044b1000 from client 10
> [   12.533821] amdgpu 000d:03:00.0: amdgpu:
> GCVM_L2_PROTECTION_FAULT_STATUS:0x000009BB
> [   12.541464] amdgpu 000d:03:00.0: amdgpu: Faulty UTCL2 client ID: CPF (0x4)
> [   12.548499] amdgpu 000d:03:00.0: amdgpu: MORE_FAULTS: 0x1
> [   12.554059] amdgpu 000d:03:00.0: amdgpu: WALKER_ERROR: 0x5
> [   12.558700] [drm:mes_v11_0_submit_pkt_and_poll_completion.constprop.0
> [amdgpu]] *ERROR* MES failed to response msg=0
>
> I am not sure if it related to clean 6.6 kernel or to additional patches 1 & 2.
> I did around 20 boots of clean 6.6-rc7 version and didn't observe this
> page fault.
> During 20 reboots of  6.6-rc7 + your patches 1 and 2 -- this page
> fault was observed one time only.
> Couldn't say how reproducible is this. The log is attached.
>
> Let me know if you want me to test/Ack patch 2 if you are going to send it.
>
> Thanks,
> Alexey

