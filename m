Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908CFAFA7B5
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 22:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BED310E135;
	Sun,  6 Jul 2025 20:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XOb+Bd9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0B410E089;
 Sun,  6 Jul 2025 20:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKTtIvajtvph4wkqAhSfhUcaiqrOXpGxXUXkdnYzmgnzHu4cPnhZGT01tve3SCoTHBpvbwlzvmsduwmWGEW6IoIGaMdkKM5oQwGSzMj0RjT3NSTyDitBFjCqV+yoWvLDzmPA9WroNEz1XgUvmAHgtSujS4LSz80CK5g9F3iCgq6fd9MOcBCJlFiZJQi/NDsj3Em2Ai+B0LTo63UuV4Bs+KxlqPBcUmhg481G9ICk7Nof1+6B7deYHC/nAYpPK4kc0d8a/Ray0ZGOPfknhi1NAIE+Yu3XhXhrWGxYRloj3TTaAYpVvi074QPmu1A9qnzv27Y7IyPNQgWkZ2KhZCO8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXU3rJ4L4IeO3Jl6cjF2UqUL5mcgeSDywRdnX3CJ91Q=;
 b=NJh1MVKvPieGCT3zGdULN/GNUZzFh6aum1kNBGCo+iVRh1IT4c/ppgilOUrHa9xXnA+Oxq863EQ7eABzjl7QNW6QF3Q7MZGrnbDo3IKSjN5fr7dlnMfXNXYhokd5zAHYx8wII71z+paOXXk1W1d64xQeXjeSFJ4dB5s8sD1djsPSnlBSzhirGn+pyW9EMaEvH81dj6NUnc8Bklc8Fyr39JVOGnTygVYhlShFI1PTJgADYoAmgP+Raj2f1Em4pXeA3W1TZe9hzTJokxLi/Fsv9dGxx8JT2aUdEZUxOVywxUv2/+StZbYqncvEPf12kEMWXzer3iApttdDWLOX4AWG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXU3rJ4L4IeO3Jl6cjF2UqUL5mcgeSDywRdnX3CJ91Q=;
 b=XOb+Bd9BeQPj3wCpla8PSddAxKxuF/VZpkCZ0UizMkM4prl6e8W9B6lsIFgmAz6ZvYCvJbyyjFj2EUqFdSkY/GepAIBTOX1OTiyUFI0ByYf3NMIq9dB/Tg81Lx9FxIUEHl1XNF1gpkpMj2DCTV98LnYeV71uzPm3Ctl6U69M8t4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6877.namprd12.prod.outlook.com (2603:10b6:a03:47f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Sun, 6 Jul
 2025 20:40:12 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 20:40:11 +0000
Message-ID: <2c609512-ebe8-4a61-a666-44b308975d72@amd.com>
Date: Sun, 6 Jul 2025 16:40:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PM: hibernate: export variable pm_transition
To: Samuel Zhang <guoqing.zhang@amd.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, rafael@kernel.org,
 len.brown@intel.com, pavel@kernel.org, gregkh@linuxfoundation.org,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-5-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250704101233.347506-5-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b42433-3268-4079-0580-08ddbccd4dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFVkM3BBczJ0WTBMOHdyMm9uOFRPbk5RTGRFc3FBMTJkZnJYTHdia3V4UHdC?=
 =?utf-8?B?RjZMMDh2ZFdkUk5RRk9PdXNFY2ZhOWh6YVBKS3ZuTnYxWlZFRkpYRGdsN2Jy?=
 =?utf-8?B?SjVrWk9PTG8wY2syNE1kU1B0K25RSjRFbk9xL1RqTlEzQWcveEo0WWtnUG5E?=
 =?utf-8?B?RmRiQVR4Mk95QWJaL0V4Zk5UcTRQZkd3K21scm5aTnphMTlaWWQzRXZ5bSs1?=
 =?utf-8?B?VFJXMmRER2NzK3NWVi9lRzd5TUJaS29XRTQrZEdzUGlXckVHZnQxME9zYzlQ?=
 =?utf-8?B?THU0NDQ3bXJmWnk2SWpvUVlSRXIzTGt5dUhlbGJsbDZ0ejFwbVZPbVJWR3JI?=
 =?utf-8?B?SjZkYmdHT1R5akIxaTFHaXFNbkxUSDVQbWRLOFRrMUVDRWFsSWNJdk1rbitD?=
 =?utf-8?B?T3hFNHhDQTludGVYVkZZeWFyZ21rRWdPMFhwSXNMUVJWZzdpSEpITGpyTk8v?=
 =?utf-8?B?WHF5U1RPUG5idi9pT3FxT3pSTENIUThGRnJKcmhZV0Z0eXU4NG9MZUlFVVFO?=
 =?utf-8?B?WFAwZGtCbGVFK2JjT0VnNXF1T0wyRklzVG1kUUwzYkIrcUtzY0Q3a0NiVzVz?=
 =?utf-8?B?bGIvYVB0cy9TRFJuQk9MWkZOVmg4RnNvTlBTMkVmWkhqbjhsclBvYlhpeC9G?=
 =?utf-8?B?aXhRMkIzR2xkRW5IcmovTmtibC9ZbGczOVQ5L3JmSHhkQjFDeTJPcEdsMjRZ?=
 =?utf-8?B?OTR0UXVqdVRWRDRkUGNSYXpDZytDYXR4aUZYRzJXWlgxcFRkVkN2Vng0TGlj?=
 =?utf-8?B?OVhNdTFFNGZyaDRZZ0FTdjk4ZkwrTkRHcXMxUTBkNXgrTEUyZUJ0cEt5bVpU?=
 =?utf-8?B?dGFFQlJFa0FKRlFnTzNvSGcvNE1ORjVvN3czREZ6S0VLeHlYWm1FNm5oeWZx?=
 =?utf-8?B?V2MveE9MSTBNaDFRcDhhRFlSc0M2eTJyUXdRdWZqS3lzL1h1c3VjYW5DTWFx?=
 =?utf-8?B?bzZmVjBLa2pPU0Vlcy9GR214RmtlelRKdDlNaUVzWHNsNldlTkVad0NTaXpH?=
 =?utf-8?B?ajFQL0N0LzNsY09JUTJTRUdVNE9sSWpweHpCYng3S1VGZmpOTng3VllEVUhz?=
 =?utf-8?B?SWZBeE54c0I1am9JTStHenZrSTFVSUw4UDhYNGNEZVNId0k2MmxmQ2hXVlFV?=
 =?utf-8?B?cWRKeGUzeGhhUVVVV3ZkeXJ4TzlGVTJ6QlE4Q2plQ0lKRWtzWmpDSEYwWGhW?=
 =?utf-8?B?VEZGeGpwTWNEWDdKd1NrQk04RWUxcWVZU1JOZVA4dDZLUlNndHh3WS9tcVVr?=
 =?utf-8?B?UzZaalBVVVNuNVpWWWoxbmpRM2F6Q3B3REVhL1Y2RzZtdmp0Zk01Zkc3WVc4?=
 =?utf-8?B?aUNwS3BxWktwNFFneGVSanpOVFZteWZTMFU4TFgvRHhlNEhFSVZLUkFBc3lC?=
 =?utf-8?B?VHBXcHFjUXl0K0hwdTh2bFJwZlJVbkp1U0NObmJva0VrZmYyNFR4L3EyaXBv?=
 =?utf-8?B?OC9yV0E5bG1mWEZkV1dDV2duNXBteDg0UVpIR1Z0SndIOTRqcit4UldJZVkz?=
 =?utf-8?B?SExPbHlXOCt3cUJNenI4anJOL3hrclYxWWNZN3ltYkFpMEI0b1dlemEzWDlG?=
 =?utf-8?B?S25JcVJRU3NENWhYK25CRE16TTM4SnI5V1dubzhzR1o1a2JTN3RCN1FuUG9k?=
 =?utf-8?B?cUhiZi9vVVUydWpzeHo2cW16VjQzUkMrSDF2T2tuQzc1VTdYcFNrR0dRTVIr?=
 =?utf-8?B?dTFiMlhNUHNSVGo0N3dYcGhOMGo2L2NHTjExK0p6MkduNjVyNVcrVEYvZFZD?=
 =?utf-8?B?cEd4R2poQjMvcmZDemtQcXIrTDVpbGJrdnV5N3J3VDBlYmc3TCtnT2hhK1Rl?=
 =?utf-8?Q?bS1yGX6m84MNIRU7Ync55xoLz/khpC56+k7R4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUpxaFBiMW9TVEJwdE5sN3YrdVZmS2IxOE5UdUh5ZTV1d0dZVnJ2dGZBS1ho?=
 =?utf-8?B?cUdrWGdMK0ZUYXViY3hJcnZZdTVQMWo1ZDNPSVRYQ1B6ZmhoMTRreDJ1ZDdR?=
 =?utf-8?B?NVNXSHEyZCtHQWdKcTFrZGluYXhTYWI3dmQ1enZJZzU0Nmcrc21MOEtGYjl6?=
 =?utf-8?B?NmNyRFpJQlJNeTFPVFJrNTdoV29IdHpKNHAwU3l6ZlRmdFRTNGxMWUFaS1Rs?=
 =?utf-8?B?cEZGcmJiWC9PTlMxMjZWNmJ1MWkzQmJSbUg0Z0c4YXpablhqM203SGltdWZ6?=
 =?utf-8?B?S09GRmdzR0x2dUYzQ3Z4M0pPYkZxUWd5NFZPdHBjYkJnZGpzNmZDYVFLb0RC?=
 =?utf-8?B?eFI3ckZlcmRqbk1haXd0Y0xNRVN0cjE1a1BqT2lzYjQzOE4wVUJsaUxySzVC?=
 =?utf-8?B?andzbVBFQjJVeE1sSFB6U0k0U1RvVkJBZVdkSCt6ODZBWjNxTGRtWm51ejU1?=
 =?utf-8?B?T0JCeGUwM1BHUFE0UXNIaS94bFdYTWxqSlRwNW8vSTlVd3puTjlZdnBDSmRU?=
 =?utf-8?B?WGg1elhjOGhUWEFwdXpiaFE0UDdNK0E2ejB0VGhVc1R2WjlocFhNN0UzMzUv?=
 =?utf-8?B?VVprZ21ya3VRYmNCZktmMXpjRGFZYllDMmtUNWtqb0VFa2hkNnJ1NzdUbUhI?=
 =?utf-8?B?TldCM0hOY05TTkMycm1jTWJYcGdIYW9tUE4wU2FoZHkrZXNZOEVQK0FVUUhi?=
 =?utf-8?B?Mlg0WEhrNEN0NHZXaTlCTHkxVll1TDIzQVJuWHRHUllsTjdlSWZrai9vbXp0?=
 =?utf-8?B?YlRHZm1ibWxTRW5QL3NybnpkcjRMTXZmeUNJRWVveEdLSEdoUXpSbnZrM3ZR?=
 =?utf-8?B?dzMyaEcyQnhGTFVhckJnNkJUejUrNmtUMWo3TDNJYUZSSEg4MWlCaTFia3pK?=
 =?utf-8?B?VlQvWHNUbEplVTIrL29UdVRNMjZDT1FKZm5hTVhQUXBGMzRMVnc4d1g2RzQr?=
 =?utf-8?B?ZG5NMVFsQmdLOWhEVVFpTEZJZXU2ZFluNmxDclE5b1g5d0ROb0ZPaE5lRVds?=
 =?utf-8?B?eCtCeEVZZURGenMvdGtlYkllVDRVVzNLYTBCN05nNTBPZUNFbGRickpOaE9r?=
 =?utf-8?B?WE5TMUg3a1l3RHQ0dktmOXQ1SHp5TlhuRElxM1VvSkNlMXhwOG9yYXlCUlNs?=
 =?utf-8?B?ZEpEMmtad2ZJdExvNDF3dXBMSlBCWVZtd3lUYnFDVXp2T2xMTFJKTDlHRklp?=
 =?utf-8?B?VDNxTTF5eGFxOENNVFZzdC9xbzVXN25ZUUs4bDJuTjUvNGJVMGFXekNIUHls?=
 =?utf-8?B?OVFiaUxBSjNRaUJscldpSmdWOWFQVlFhSlFFbmJza1Vnd2VPMmxJMm5Hc1pu?=
 =?utf-8?B?M1Npekh4UXNBYkFNOUVzOVJtam9kbzZLWTBTYlNNQnV5SHYvV2JRVktIbjdZ?=
 =?utf-8?B?dDVYR0JKZ1Bobm8veXAzbjR4VnZ1REZOTFluYks4TzhwVCtYTHVKSytGa09i?=
 =?utf-8?B?OVJqejZjaGpOWGhseUJ5ZlhIT3dDT1JWUzc1T1B3Y2JMY0J4OE1yM2kxaGNp?=
 =?utf-8?B?NGNnWmRHVEh6bm9iNk8yeVVOK0pPOWxZMm1PRlRlL0V0SGZPTmpsVEtPczZO?=
 =?utf-8?B?SEZmTC92eGs4a2g2MkpsbFhkekJXTk1uaEthWmQ0NklnTkdZdEpuQlIrNmNR?=
 =?utf-8?B?Vk1PTUx5S1VtSGFzazAzTmNHaUZVSDZ2cHBYU1o2WU5QaXlXRDlYZG5WdlhZ?=
 =?utf-8?B?dS9ETTBoZ0JESUVaTTZ3NXJsU21BVGYvekVTalVTcHpZVHdadlg3TEJacnN1?=
 =?utf-8?B?MUF0ajBWU3B5V3dtd2M2N0l2Zy9CZnF4b004T3BJcEpGNTA5ZGpVUXE2eVpy?=
 =?utf-8?B?K1pvZVAxYjJTZEV6Vk5UZmZUT3NKQlNuU0V0cGovNHJIZzNUTGZ3THJlSXRC?=
 =?utf-8?B?c3U1anFkSDY2dEhXZUt2bFE2dzhBK005R25aM1BjbjBTYXhMZmxzTWpjb092?=
 =?utf-8?B?NXR6N1VDTEptSlNudml4ZzhHRC9QcElJcis2U25TNkxYU0c2a3k5QUc2ekZI?=
 =?utf-8?B?MTd3MXJtdTYrU0JhaEFsTktCdjQvc0NVTk9IRDJGdUUyVE91RmlLTVkyQ2Ny?=
 =?utf-8?B?TGVQN0FKTUs0M2p2d1VNcjFWeGZScTNFYmhtNU1SRHh2Nis3MkFzQysxMTNq?=
 =?utf-8?Q?g6UhhmIeAj5ZC2bfU3ysOkHCW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b42433-3268-4079-0580-08ddbccd4dc2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 20:40:11.7936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHn+BOODElZG4orNDjrFh3/0LwAkjErVPn2eB0BsMnQchnp/MJEUYTZhNsbY7qLpJju+wn7VBM7b+3/9slPWQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6877
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

On 7/4/2025 6:12 AM, Samuel Zhang wrote:
> https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588
> Per this kernel doc, dev_pm_ops.thaw() is called mainly for resume

Proper way to do this is to put the URL in a 'Link' tag above your SoB. 
That being said I don't think we need to reference the rst file.  Just 
reference the html file.

Something like this:

Per the PCI power management documentation [1] dev_pm_ops.thaw() is 
called mainly for resume.

.
.
.

Link: https://docs.kernel.org/power/pci.html [1]
S-o-b: Foo bar <foo@bar.com>

> storage devices for saving the hibernation image. Other devices that not

that are not

> involved in the image saving do not need to resume the device.
> 
> But dev_pm_ops.thaw() is also called to restore devices when hibernation
> is aborted due to some error in hibernation image creation stage.
> 
> So there need to be a way to query in thaw() to know if hibernation is
> aborted or not and conditionally resume devices. Exported pm_transition
> is such a way. When thaw() is called, the value is:
> - PM_EVENT_THAW: normal hibernate, no need to resume non-storage devices.
> - PM_EVENT_RECOVER: cancelled hibernation, need to resume devices.

If these events are being exported out for driver use I think that we 
also need matching kernel doc exported too.

That is the comments in include/linux/pm.h need to be converted into 
kernel doc.

Before you make any changes like that though let's see what Rafael 
thinks of this approach.

He might not want to export this symbol out and would prefer a new 
helper for drivers to use like:

inline bool pm_aborted_hibernate();

If that's the direction he prefers you'll need to make kernel doc for 
that instead.

> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>   drivers/base/power/main.c | 3 ++-
>   include/linux/pm.h        | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 40e1d8d8a589..d50f58c0121b 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -61,7 +61,8 @@ static LIST_HEAD(dpm_late_early_list);
>   static LIST_HEAD(dpm_noirq_list);
>   
>   static DEFINE_MUTEX(dpm_list_mtx);
> -static pm_message_t pm_transition;
> +pm_message_t pm_transition;
> +EXPORT_SYMBOL_GPL(pm_transition);
>   
>   static int async_error;
>   
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index 78855d794342..f01846852a90 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -657,6 +657,8 @@ struct pm_subsys_data {
>   #define DPM_FLAG_SMART_SUSPEND		BIT(2)
>   #define DPM_FLAG_MAY_SKIP_RESUME	BIT(3)
>   
> +extern pm_message_t pm_transition;
> +
>   struct dev_pm_info {
>   	pm_message_t		power_state;
>   	bool			can_wakeup:1;

