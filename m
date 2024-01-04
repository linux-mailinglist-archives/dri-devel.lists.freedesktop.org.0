Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC691824566
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516F210E49A;
	Thu,  4 Jan 2024 15:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFF310E49A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 15:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuPwLOhpf+QGxg9YfK3U0HzQggsDRoJo3WCn+064XaxjEtljLl78ZZY183w23/Jc2l8VtYh71DIvwCp4JIILp3zZhj145OIkLVuBSRA3jCRWEypLklFY0f5e16jfJpFD9ucUbmwJ4JOuPgJnRB8+NZbOr6XZMiAMyVusF4IPk7QOKbws8YyZcgZMaF7uqrI1CjZN3Nops+yxOLyil5X6imfYv8/1WyeAWMTn3v0Yc2M/1lLqedoel+aFFmzKSbrhQawN7WkfrW858dgbPJQ4SOVo0kYqFNdJr8kBX7uHLG6uEK4U3W8cYYZG3kyCPWy1VcBjL7Km5lbuCUtmuSvhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MXviN6U4Kg5W7BpABFWXXIYBmTeUCKOmRtmmr/5sDo=;
 b=OjLWG0COSIIytN1xKCXWBpKb4dXvGxJ7U3FTrzgCSKndaQQHkDvmZOo+DisEZxf7C7vKlG6GiVs/dRXzs/RJBqAmT2/MGjd0UbluyrY08leoExfu31w2GnjWl0OuQQHmlf+gFIHVVLIKPq2c22usP09wJ9+t3+FyVwKd3oALONGVwnKm8usou2HsPi/G7iXQPRKGvgEEhUEoqODjoRcvHFnIMhu6iAJWCYEsUEI8C/3wLH1BRHW4x0s4AAE84gI6ZhiEuMnXgy+bVFJiSmXoceCCCGYcc49fxaD4Zj36UPA5Gf63KSEIQN66a0rVh5L85WJmzDHXLy0flVKoOiUaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MXviN6U4Kg5W7BpABFWXXIYBmTeUCKOmRtmmr/5sDo=;
 b=3xtvudvosbH7/ABDMhpfryQhPlJdNAVa4Ckmo0vmDK91oPA81/ffrThHWq7PTf7PMMicnAQRiOP8i7nnSkKzuH6/MW0wldg0GnJp69oU08TDn83+FIsDocjr848a8ZMPF7pEy4hjhP37T47qc2FasBTppOySLbfoa+UGhVOC5L4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7511.namprd12.prod.outlook.com (2603:10b6:8:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 15:51:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 15:51:45 +0000
Message-ID: <d1988a18-d400-4a55-88bb-045d6eea4f41@amd.com>
Date: Thu, 4 Jan 2024 16:51:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: DRM TTM stack trace dump on ancient hardware
Content-Language: en-US
To: Olliver Schinagl <oliver@schinagl.nl>, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>
References: <0660cc7e-fa24-4dd7-8738-f89c774b05e7@schinagl.nl>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0660cc7e-fa24-4dd7-8738-f89c774b05e7@schinagl.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 029cc93d-7f42-412e-7651-08dc0d3d0dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3ckm6OCkVSvn1Sh9qF2OmhQ27Xv+wCdI0hl9upCsJhTmTWvapc9GGN4EoxKSgXADYB3DnBJYz6W+MdK95wFDgpotxV/XRBSHb9FuJOUmst5aXvnelEXYYbnGn160acm/yjrzvj1wzd/sYah+8mNj0JgGocwJ5vCOzCoVUJoJAFH8mJhJfU/9ODVlEd9iFX5ggOytGfYei/M+gFYfqtDqWZRpakv5s1rPk5KUXSMdYn8gTspbqPy/AQyPnCLtxh2oqDZG9UpaMvjGVFv1jCt+WMiWQHNHIIQ4s9BcpErdPHIh011ERKXoPZy6bkZUCqMI9YmxZS/8CSJgfBQtb9ZJQa5n84CLJ2cjasCVMmHoPGyT2KfT7uhMtpAuZIuIYZCK1fMRjP4qhkQ80JWCRkuBjdeFDEz9TbXu3xfZOmU8tnG7I2tuBFhPIoS3o8PvFgMd8clErDMx9aebBPkhGad3Xk1M8YurOYvJMHQ2NrsoA7pKvmVOD8hJIGNBSdrCgqTB8atnYp4y6qya4Ii8y4ThjMICgA3KwIYocYoiaslwmR+CU89IgIlDoXqLlWK+YjZ+wQ1IGBODvABVo9pf5cNN3BgAKQ+KzHDcJmbd81Z4gKKKWVGpe51djahPeo/Gpk4vKW8gg3DNla9eWT3fFJIEY0BM7G3uwvxCli8aoJhfdbL8aEe21KQDVlrytV1+8iA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2616005)(83380400001)(26005)(41300700001)(6666004)(38100700002)(5660300002)(8676002)(110136005)(316002)(478600001)(54906003)(8936002)(6636002)(2906002)(4326008)(45080400002)(66476007)(6512007)(6486002)(6506007)(66556008)(66946007)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnFncVl3Y0c0bS9OVmhWb2RHcDVDTGRaTGhKZW85aXNhSllCL1kwSk81WUxr?=
 =?utf-8?B?NVJNY0ZpNlc5RDFhQ2JkRmljek1jMnp3a0tacVM2b2lGSkxDWm5JUkxkQ0tC?=
 =?utf-8?B?TTVJMW1UVFBhc3FDcW90YWVUTTRjcE1IOTRUZjZWTW1EZHNkT3FoU3REY25J?=
 =?utf-8?B?SmJ1SWhxaGdEb05nUjhzU29tc3BUTC9VU3NZVm5kZkZJbGxmTHR6QVJLd1lD?=
 =?utf-8?B?eVk0NnpIaG1OckxSdWd4RGVKZlVHeXF3YVdCZUVrVmpVYW1pdzlGdURJNkRr?=
 =?utf-8?B?UWtYSkVYM1pVaVdVMEUxS0NMT1AyZFBnOTRKZW9NeXg0KytyRWw5aGVScG5F?=
 =?utf-8?B?QkJzT2FyOXIvZi8zNUVFNnQzRkxHLzJPT0NUUFhWZkVKeXJ5SjRGdVNNVHdD?=
 =?utf-8?B?bFlINHV3ZHFBNmo5T0x3Vi9xVjd6Wm93eEZHbVB4cC9oV1lIb3lsVmNTNk1P?=
 =?utf-8?B?SHVGdHpFWjQ0U29DWmxPblUzNHBEOFZaQml1Ym5LWGRVMXplQmJFdmVHaU9J?=
 =?utf-8?B?V0lIS3hjb0QyanB0RkhjOWhwZ20raDBnc0hZajVaaUVDQjBaOVlMb09HREJS?=
 =?utf-8?B?d0N0ODJpYUZFelJ6bStCcFZmenkwTzl1VitqSlVqWm15RUF0c0JXYnRxVS9a?=
 =?utf-8?B?Nk1Zb0ZNSlBxUlAvUWdWQjloTU1aV3RuS0Q3VjFqcHM3eU85ODVrWU8rVWp5?=
 =?utf-8?B?bW5rT2hocXErVTFheDdNc1BPdkRDSXpQaXY1ZHlpcTFRNW5sZjdsQ1YySkxU?=
 =?utf-8?B?RTBUd3RTODhkOHV6MmN5U1g3MG1nN0t1aDdTWWtBQkRKa3AyYjhBRzdhM3Nx?=
 =?utf-8?B?Vy85TFNsNnIvVGY5bDB3SXJnb1VOcEF2YnAxbHRUYlphTGd3cWQ1amk0M29G?=
 =?utf-8?B?TEVLOWN2QnhRU3FjcitNOE9sNnJYTVN5aU0vblI0WWlYZkxKMHN3RWoyZ0kz?=
 =?utf-8?B?V3dJd05ucTUrbnNNanNVSmxWZG1kU2NMeE5lNHVCT3FWMmhPLzdOUG9SK3JK?=
 =?utf-8?B?bWJ5dDhhRGJmV2VXSERzZ2dSbDh0MytJQ0hLVk5UMnVjbFVDOW1iL2ttZUZ3?=
 =?utf-8?B?NUJHNTB4TmpVOENuRVpidkFpS3lxaW5aK3M3d0RYOHd2QVdEU3BuTFNBRlcx?=
 =?utf-8?B?bFY3WUkrS052NkNicnRKdndNMDRHcldVc0xaZ2M4L2tIdkE0bzY1UEpnTU1X?=
 =?utf-8?B?MS9yMU53MldScVgxYW9FcEJObWVoL2N1bzJ3RTRyTDZkRkJua3k3Qm1ETnU2?=
 =?utf-8?B?TnNpNjBBZzBtM2xVOVNMT3M1aTNlR3pPYmlHNzVJZGVyYkRZTFhGRmZJL1Vz?=
 =?utf-8?B?aEdaODk1UUZraU1yTWpRQ3ZxeFAxNEJ4OTZPSmo5dmJRWVc3dHQ4aHJTN28r?=
 =?utf-8?B?QWx3RWREVWtOODJ4cUlpRHRNbDV4dTlVdWEwOXJSeHNsVXdodXh1dGJZUjdo?=
 =?utf-8?B?cXFjV0sybFVaRk94WS9YdHAyU3F4MnEvYWEwWWVqeHQzbCtxd0dscTEzUjZn?=
 =?utf-8?B?ZkU1UmtsbUgvTUI0SlQ0TmxmSGd4cHF0cUZ1cVJZVDlRbjZLdFBqODltcVZ6?=
 =?utf-8?B?VVFIOUdoOEZoM0dEa05tSHI4b2FyMnc0Tmc0MWFsRElwcUpqYTExc2lxcEQz?=
 =?utf-8?B?Y2M3dTZUWHB6K1BxQXUyWnpmODNXVDRwMm11TXZFT3lGZlBGU0M2RXRoT2pm?=
 =?utf-8?B?N1V1eUFTVE9STW1mbmVyNlFiN0JtVEpSTzViOWU4VTZySUcyQTJLRWFRWm1Y?=
 =?utf-8?B?a1ZHaTNRb1N5T0ZqQ1B6bUlCaCtlNUxZOWNCOXVrMWhORU01ZjUyR2FzcnB6?=
 =?utf-8?B?cmJZdTZubk1GWmd3Y0VseGc0SXY2NGZyczhDQ0dBTEdIRkYwYU5iVTNILzNs?=
 =?utf-8?B?SXd0aHRyVVZudThmZEsrZXgxOWRHZk9tQ1ErMjNUbjl4ajBiZUFOU2pnMVk5?=
 =?utf-8?B?b3BoNExUenEyY3NubEtZdE81WWNaZG9JbE1BTGZtRmxZYkZoOUI5VHNPN3dr?=
 =?utf-8?B?NWJuVzRuMmZBNGZLMkYwdlNDV3dTMUpHeWlYUnFuYlVUQWdtVjRwNFo4Ym8y?=
 =?utf-8?B?aDFNMU82WEFiQytiME9wN1ZEckZ5Y1Z2ZlVIRzk0eUR6a1BvdzV2eGE4RE9D?=
 =?utf-8?Q?0Dd1ZNwqu3t9pmVyblgCOH5yh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029cc93d-7f42-412e-7651-08dc0d3d0dab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 15:51:45.5210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NppnEDXPUGrHX2kg9OXX6nwoKyO0La0Am8KOjvDjueF23Vto7CAKHy9B1omQ/GO0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511
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
Cc: Huang Rui <ray.huang@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olliver,

well as long as you don't explicitly disable the support for the older 
hw generations the R7 250 is still supported and should still work 
perfectly fine.

What you see here is basically some reference counting issue, most 
likely in the display code.

Question to Alex and Harry is CIK already using DC or the classic 
display code? If it's DC then it looks like we either miss unpinning a 
BO or grabbing a reference to a BO.

Regards,
Christian.

Am 04.01.24 um 16:38 schrieb Olliver Schinagl:
> Sorry for just dumping this here, but for those that think this is 
> important, just rebooted after a weird btrfs crash (remounted r/o, no 
> dataloss it seems), probably a new kernel, and got duped with the 
> following. Things 'seem' to work fine however. I don't even know how 
> or where to google for this one.
>
>
> My graphics card is I think the R7 250, or some old beast like that, 
> and I also know i'm probably shouldn't be using amdgpu on this oldtimer?
>
> Linux 6.6.9-arch1-1 #1 SMP PREEMPT_DYNAMIC Tue, 02 Jan 2024 02:28:28 
> +0000 x86_64 GNU/Linux
> 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
> [AMD/ATI] Oland XT [Radeon HD 8670 / R5 340X OEM / R7 250/350/350X OEM]
> model name    : AMD FX(tm)-8350 Eight-Core Processor
>
> [    0.000000] Command line: BOOT_IMAGE=/arch_root/boot/vmlinuz-linux 
> root=UUID=d rw rootflags=subvol=arch_root radeon.audio=1 
> radeon.si_support=0 radeon.cik_support=0 amdgpu.si_support=1 
> amdgpu.cik_support=1 LANG=en_US.UTF-8 ivrs_ioapic=9@0000:00:14.0 
> ivrs_ioapic=10@0000:00:00.2 noibrs noibpb nopti mitigations=off
> [    0.091847] Kernel command line: 
> BOOT_IMAGE=/arch_root/boot/vmlinuz-linux root=UUID=d rw 
> rootflags=subvol=arch_root radeon.audio=1 radeon.si_support=0 
> radeon.cik_support=0 amdgpu.si_support=1 amdgpu.cik_support=1 
> LANG=en_US.UTF-8 ivrs_ioapic=9@0000:00:14.0 
> ivrs_ioapic=10@0000:00:00.2 noibrs noibpb nopti mitigations=off
> [    1.490484] [drm] radeon kernel modesetting enabled.
> [    1.490565] radeon 0000:01:00.0: SI support disabled by module param
> [    4.627771] [drm] amdgpu kernel modesetting enabled.
> [    4.627955] amdgpu: Virtual CRAT table created for CPU
> [    4.627967] amdgpu: Topology: Add CPU node
> [    4.650039] amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from ROM BAR
> [    4.650042] amdgpu: ATOM BIOS: 113-C6620600-S01
> [    4.650054] kfd kfd: amdgpu: OLAND  not supported in kfd
> [    4.678004] amdgpu 0000:01:00.0: vgaarb: deactivate vga console
> [    4.678007] amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) 
> feature not supported
> [    4.678010] amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not 
> supported
> [    4.678715] amdgpu 0000:01:00.0: amdgpu: VRAM: 2048M 
> 0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
> [    4.678718] amdgpu 0000:01:00.0: amdgpu: GART: 1024M 
> 0x000000FF00000000 - 0x000000FF3FFFFFFF
> [    4.678878] [drm] amdgpu: 2048M of VRAM memory ready
> [    4.678880] [drm] amdgpu: 11487M of GTT memory ready.
> [    4.679218] amdgpu 0000:01:00.0: amdgpu: PCIE GART of 1024M enabled 
> (table at 0x000000F400400000).
> [    4.680506] [drm] amdgpu: dpm initialized
> [    4.680527] [drm] AMDGPU Display Connectors
> [    5.209956] amdgpu 0000:01:00.0: amdgpu: SE 1, SH per SE 1, CU per 
> SH 6, active_cu_number 6
> [    5.521572] [drm] Initialized amdgpu 3.54.0 20150101 for 
> 0000:01:00.0 on minor 1
> [    5.670853] fbcon: amdgpudrmfb (fb0) is primary device
> [    5.731643] amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame 
> buffer device
>
> But kernel dumps like this are usually not a good thing (tm).
>
> [   32.161704] ------------[ cut here ]------------
> [   32.161708] WARNING: CPU: 0 PID: 603 at 
> drivers/gpu/drm/ttm/ttm_bo.c:326 ttm_bo_release+0x292/0x2e0 [ttm]
> [   32.161726] Modules linked in: xt_conntrack xt_MASQUERADE 
> nf_conntrack_netlink iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 
> nf_defrag_ipv4 xt_addrtype iptable_filter br_netfilter bridge rfcomm 
> snd_seq_dummy snd_hrtimer snd_seq snd_seq_device overlay 8021q garp 
> mrp stp llc cmac algif_hash algif_skcipher af_alg bnep it87 hwmon_vid 
> edac_mce_amd kvm_amd ccp snd_hda_codec_realtek kvm 
> snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel btusb irqbypass 
> snd_intel_dspcfg btrtl crct10dif_pclmul snd_intel_sdw_acpi btintel 
> crc32_pclmul btbcm polyval_clmulni snd_hda_codec eeepc_wmi btmtk 
> polyval_generic gf128mul asus_wmi bluetooth snd_hda_core ledtrig_audio 
> ghash_clmulni_intel r8169 sparse_keymap sha512_ssse3 snd_hwdep 
> sha1_ssse3 platform_profile snd_pcm i8042 ecdh_generic aesni_intel 
> serio realtek sp5100_tco snd_timer crypto_simd mdio_devres wmi_bmof 
> rfkill cryptd pcspkr acpi_cpufreq k10temp fam15h_power i2c_piix4 snd 
> crc16 soundcore libphy joydev mousedev mac_hid vfat fat sg crypto_user 
> fuse dm_mod loop nfnetlink ip_tables
> [   32.161780]  x_tables usbhid amdgpu drm_exec amdxcp drm_buddy 
> gpu_sched btrfs radeon blake2b_generic libcrc32c crc32c_generic xor 
> raid6_pq drm_ttm_helper ttm video nvme i2c_algo_bit 
> drm_suballoc_helper crc32c_intel nvme_core sha256_ssse3 
> drm_display_helper nvme_common xhci_pci cec xhci_pci_renesas wmi uas 
> usb_storage
> [   32.161800] CPU: 0 PID: 603 Comm: Xorg Not tainted 6.6.9-arch1-1 #1 
> e215ab44d1af91c0f0e686ff953f296051be417c
> [   32.161803] Hardware name: To be filled by O.E.M. To be filled by 
> O.E.M./M5A97, BIOS 1605 10/25/2012
> [   32.161804] RIP: 0010:ttm_bo_release+0x292/0x2e0 [ttm]
> [   32.161816] Code: 49 8b b4 24 40 08 00 00 48 83 c4 38 48 8d 53 30 
> bf 40 01 00 00 5b 5d 41 5c 41 5d 41 5e e9 26 29 68 d1 4c 89 e7 e9 5b 
> fe ff ff <0f> 0b 48 83 7b 20 00 0f 84 a6 fd ff ff 0f 0b e9 9f fd ff ff 
> c7 43
> [   32.161818] RSP: 0018:ffffb02cc0cdbc18 EFLAGS: 00010202
> [   32.161820] RAX: 0000000000000000 RBX: ffff9291c073fdd0 RCX: 
> 0000000000400033
> [   32.161821] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 
> ffff9291c073fdd0
> [   32.161823] RBP: ffff9291c073fc58 R08: 0000000000000000 R09: 
> 0000000000400033
> [   32.161824] R10: ffff9291622bb780 R11: 0000000000000000 R12: 
> ffff92914c98eee0
> [   32.161825] R13: 0000000000000001 R14: ffff92917835c848 R15: 
> ffff9291c6418788
> [   32.161826] FS:  00007f0691a205c0(0000) GS:ffff929627c00000(0000) 
> knlGS:0000000000000000
> [   32.161828] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   32.161829] CR2: 00007f0690d78c2c CR3: 00000002df620000 CR4: 
> 00000000000406f0
> [   32.161831] Call Trace:
> [   32.161832]  <TASK>
> [   32.161833]  ? ttm_bo_release+0x292/0x2e0 [ttm 
> d3be1c6b438b7d4abed1793b797fc6e1ac6a8908]
> [   32.161844]  ? __warn+0x81/0x130
> [   32.161849]  ? ttm_bo_release+0x292/0x2e0 [ttm 
> d3be1c6b438b7d4abed1793b797fc6e1ac6a8908]
> [   32.161861]  ? report_bug+0x171/0x1a0
> [   32.161866]  ? handle_bug+0x3c/0x80
> [   32.161868]  ? exc_invalid_op+0x17/0x70
> [   32.161870]  ? asm_exc_invalid_op+0x1a/0x20
> [   32.161875]  ? ttm_bo_release+0x292/0x2e0 [ttm 
> d3be1c6b438b7d4abed1793b797fc6e1ac6a8908]
> [   32.161887]  amdgpu_bo_unref+0x1e/0x30 [amdgpu 
> 2f3ce605d8443bb7ca6dfe278dd999d24fdac211]
> [   32.162520]  amdgpu_gem_object_free+0x34/0x60 [amdgpu 
> 2f3ce605d8443bb7ca6dfe278dd999d24fdac211]
> [   32.162978]  drm_gem_object_release_handle+0x54/0x60
> [   32.162984]  ? __pfx_drm_gem_object_release_handle+0x10/0x10
> [   32.162987]  idr_for_each+0x71/0xf0
> [   32.162991]  drm_gem_release+0x20/0x30
> [   32.162995]  drm_file_free+0x1f8/0x270
> [   32.162999]  drm_release+0x74/0xf0
> [   32.163002]  __fput+0xea/0x290
> [   32.163007]  task_work_run+0x5a/0x90
> [   32.163011]  do_exit+0x377/0xb20
> [   32.163014]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
> [   32.163019]  do_group_exit+0x31/0x80
> [   32.163022]  __x64_sys_exit_group+0x18/0x20
> [   32.163025]  do_syscall_64+0x5d/0x90
> [   32.163029]  ? __count_memcg_events+0x42/0x90
> [   32.163033]  ? count_memcg_events.constprop.0+0x1a/0x30
> [   32.163037]  ? handle_mm_fault+0xa2/0x360
> [   32.163040]  ? do_user_addr_fault+0x30f/0x660
> [   32.163043]  ? exc_page_fault+0x7f/0x180
> [   32.163045]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [   32.163048] RIP: 0033:0x7f069171ce2d
> [   32.163074] Code: Unable to access opcode bytes at 0x7f069171ce03.
> [   32.163075] RSP: 002b:00007fff0d3ba328 EFLAGS: 00000202 ORIG_RAX: 
> 00000000000000e7
> [   32.163077] RAX: ffffffffffffffda RBX: 00007f069181cfa8 RCX: 
> 00007f069171ce2d
> [   32.163079] RDX: 00000000000000e7 RSI: fffffffffffffd08 RDI: 
> 0000000000000000
> [   32.163080] RBP: 0000000000000883 R08: 0000000562be99f3 R09: 
> 0000000000000000
> [   32.163081] R10: 0000562be99f3690 R11: 0000000000000202 R12: 
> 0000000000000000
> [   32.163082] R13: 0000000000000000 R14: 00007f069181b680 R15: 
> 00007f069181cfc0
> [   32.163085]  </TASK>
> [   32.163086] ---[ end trace 0000000000000000 ]---
>
>
> Thanks,
>
> Olliver
>

