Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F93EA7963E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 22:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2B310E8CC;
	Wed,  2 Apr 2025 20:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zX6cywBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B7E10E15A;
 Wed,  2 Apr 2025 20:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpuJ3VxCUAQRC2lbgwM+JKLVzL2KMSNCN4XyisHbxmC26qBj1fjtUmen7rFJESBcGhzDhFca/6XAsLa/APLgNXeIKPoCiUReWtKzhoO/RjdtjRp+zdcsjLEEmu46nQz+y5xqmpU8QZdJiMY3KZBXrPEe4KHw6Pbwc8YgF0Kby+DtxYqJQa9Kf23caJxcbVk2AwBQOhlJcRh13BetVW3OhMXIYNyNfe8iWBAVBZfwnkbTooDpyA0dRUoBsOAa2k6IQ1MYDXmB28NvPuCXHb3QJ5kUzPYxP9xMMln0+LQPatN1dPkloQg7ku6jBaOq+hhrFkp0ocIgzmlelB6Jb9lEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dlg65vjql6dTmmvxhzVx8UDjgRxQLftHt7Dv+inJtQ=;
 b=vgmob7Ghwms2sqzunHnNSTP0izgJkk9F6QawuhHs4uVq60fTIhjrq9X35+bHsKSF277BfW7lpW+PraQVOv95xA4lthM9RbTds6RNSxyfFEhVqphljOGKXnxMhuEEvNapT3iK1u2GRiVhjm6Umb43E8TBe/tR3+3qQpRdYawfrKFGw2W6uii8BhgznQ4XPG3TnDsanbsJBjpOQq5ti5wa1gyC2X+fHPmRbNSMQOp8j6H5sqHzu4wclrhGpEv0s+qZX6YFq5OWsfYRMdesdoFFok9WdFbhgUCY6kzElTru20XyEMWUeACiKhNIe4Lt2wMNv5L2m77L/cW1awOi7fpkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Dlg65vjql6dTmmvxhzVx8UDjgRxQLftHt7Dv+inJtQ=;
 b=zX6cywBZRFEedNTYK/FF/zviyv83WPaTr+G9uAgBJ+A7MRXwHyWrvekP1hsBzCZNP9H+Hf8dcuDOUoNIcdmuA666LErO0oO2Zp2IsNvZZe/Lr5OvVQvAf8ZAlgBYk9ZuDfLvX3XgMHGZbNm/K/lhOUvUEQwKHKpNYBlhtVwajKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 20:06:50 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 20:06:50 +0000
Message-ID: <ab83b8ad-2076-425f-974e-6352be7882b5@amd.com>
Date: Wed, 2 Apr 2025 15:06:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] drm_connector reference counting and USB-C docks
To: Chris Bainbridge <chris.bainbridge@gmail.com>,
 amd-gfx@lists.freedesktop.org
Cc: dakr@kernel.org, christian.koenig@amd.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lyude@redhat.com, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <Z-Cw0x7wa5w7tliO@debian.local>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <Z-Cw0x7wa5w7tliO@debian.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:805:de::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4211ab-1b1c-444c-1fd7-08dd7221e6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2VYVGpIelJqUk8vR1lOTVdDNWNxTDl0TEZmY3ptVEQvNmNiY0haWG9WYXpK?=
 =?utf-8?B?cVdEU2JFNkNhSGdOaGZ2M0taNWQ1V25LL2IvQ3A2M1AyWTR5ZG4wMjc2YURH?=
 =?utf-8?B?RFJKakF4NzVVcDhkT3ZEOThPdndENTA4bmZrb0dIdG1JRkp4bVRCSytpNkZG?=
 =?utf-8?B?WXI5cTluMU5ta0pqa1lndkdaU2w2TEtpSWNHZy9vcU1uTU5HcE9PVWNkdjdV?=
 =?utf-8?B?MTRLSW9HVERxTnRwTE1aQjlWbGpIbkpGb3dVMHVBYy8xTS9NSFR2KzEvM1p0?=
 =?utf-8?B?MTZqWi9FSUExNzQyZmZuMEdNZTR2RHExNTBPQmtnN3ZwQzBqVmRLMEtsTVhj?=
 =?utf-8?B?SmNqNkhPbm1BbEZ5ZDNyOXB2OHFaR004ZGRIOGxKTkIwYXpJbk9qY3BsK1Vo?=
 =?utf-8?B?Mmx2K2pqMzBJbGdUWEJPc2ZYQURXZmFPb3Axbnl1aE0vb0tUTmVGRGx6RnBU?=
 =?utf-8?B?MVNpRkdLQUlxS2t5b2kyeTVjbGVSWEgrU0JBZktzTmxkeFpKVnVEY1Rpbkdh?=
 =?utf-8?B?NzZid0xWVFdzNlJyTEE5dzdIdFJrdkhDRHhTbENocnY4M1FseVMvclpGQmpP?=
 =?utf-8?B?eDVwc3FXVUFNeGdwQko2R3FxdmFVUWs5Q0VveDdSQ0w5bk1uNXZPQXpiUXhp?=
 =?utf-8?B?TFduMFN4bFNCenRlUjlRVHJLaUUxRDNia09RTVkvclJucWhLM3QwVDVtcWNW?=
 =?utf-8?B?YTlWaGtLSVFvS1pwQ1J6UUtUcWx3QUN4NTYvOEF2VjJwV0h0TWk2a08wbkM0?=
 =?utf-8?B?ZkFaVUN0V0hOUGxjVk9vTlZrZlg3VUE1RUVVSjNXQjEvdTZUd1MvNWNydmd0?=
 =?utf-8?B?NlZFS3p6dFJOUDdVVm00SFpwZjU1bk94ekVGMjRsdHowb2RHTWVZQzFoMjZj?=
 =?utf-8?B?cDNQQXVnczdTMzlHUFUrTlpZd2Z5aEIrb3h1bEgyMnZoUEtndURQZnhaTjFy?=
 =?utf-8?B?Nmc5SGwzYWxpZFZMVmVIMkJTeEdNYjJRNW9xazczUGVONWp5VzNONUR3SWU3?=
 =?utf-8?B?RXNGTzU4YS9WSHpDN1RIZXJnNkxLY3dQVW1KNEdhd0llOFEyT2ZTNGxjTlp2?=
 =?utf-8?B?TVFaK1hHWWJKOG5zL1pzd0p3RGRGbm9GdmUwSXlOc2Vnam1manpEbWEwRFFV?=
 =?utf-8?B?N0twSk15WWZwZ3NxdFBTMUpTMGM5T2xmQ2VaVGc3RWhLeUc4L25zcFRFZlhK?=
 =?utf-8?B?Y1VWeUJPVGZwMDRSNzdkbTNYbUlJbzBMZm9hL0JLc0dOZnorVk1tU3Foazdy?=
 =?utf-8?B?cjI3U0dKY3JMSTRDVU5VVVgvVjFZd1IrczI0Vm5yMk54V2VVOTl4ak9YRERt?=
 =?utf-8?B?MGtXN3k4OUZaUjBGQW9mZWhqS0FiTm5ZM296V3VYZ3JaUVFyU1k3d3Q3MXcv?=
 =?utf-8?B?WUNWSDFpL3RqU1VMRkozaTdONGs3S08yNGM5aXpyNFE3N2RNS3VVWE04a0xK?=
 =?utf-8?B?R3kyZStneU8vQVNwbHBpTXI2QVQ1K21TU3ZxcENBck1UWmxWQm44emdFZTRa?=
 =?utf-8?B?a01ld3RJTmxjdlNDQXdmVnRJcVdXUEt0S2RVaXJZL04ycXVIOUdVUERwM2NT?=
 =?utf-8?B?SWpla216SDlscGMrUm5aTndMaUM4ZXptSjdpa2plMFQvS2pzODN4VGMwSFNL?=
 =?utf-8?B?d3ZjVU41cG1PaEhUUit2RHZWK0JhT3U3TEZIZmgwbWFSTHlmeFZteTFhdll0?=
 =?utf-8?B?dnE3OUF2N0RFSUVQemo2cVEvV0NJT2RXWVJKZkhMdldMRG9WeWVoaFBZK3A1?=
 =?utf-8?B?M1VMOEIzV05Ra0ZNa293VjhSWHFjQ25XQlN5UlFDaVJUdXFHZGhuUlJSQitv?=
 =?utf-8?B?NDYvcS9EUDJnZ0txbXNBczd5YnJWbkRUQUJ0YUVjd0hMbWt0RFVDTjBvd2RQ?=
 =?utf-8?Q?RN0D9guDIN3hE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5YT1pvRFljdjZqUitUVzQyRTE2TVdiN3NVdEVoaFgzMHZzemNPQXR1TWlp?=
 =?utf-8?B?ZlVMakhrcXNBU244VEY1aWRvYUtaZUhmd3IyczFmeXRJVHFLVVJMQkRRVTFQ?=
 =?utf-8?B?WjdFcTE3SmFmVGNmeG8rdGd1K0hIamZ2Y0JVdENHeFBVZk5zRy9BekFHb1FG?=
 =?utf-8?B?TWR5eXh6cjE4RUtEZHdnZVJnSUh0aWI3TU9teXJHb0MyeURDME5Db1FWRG9X?=
 =?utf-8?B?ME5DaVI5OU14NlU4QXpha1J0Zkk4K0prSnhCNWdhREZ5cDhKQlJXZzNzN3c3?=
 =?utf-8?B?ckd4ZDRseG9tNHYvYXFDMExXM2J6eUdTWjhTdEZvejk3VzJra3BGc29IUVlS?=
 =?utf-8?B?eE9aaU95L3N4VXBBRUtwcmFWUDc2NlB2Q09ROUNNOHRMdkxYUjZJQVFWd3Fr?=
 =?utf-8?B?M0U4ZHh2eDlFZy9WTmZMc3E3dEFRYnA5NE5BNEF5bmZTWkwvSGZBK2M0VHJm?=
 =?utf-8?B?WVhEZ1pzNDBHSFFMYllwWHpBWEp3ZDlQVnBuNjBLalhnMmhaZmVjYUZDSGNI?=
 =?utf-8?B?TjZZTlNWMGU5aXlkZ3pnM0p1SkFHLzBXSUhkVXJaWU4xNXc0d0RialNrL0Qy?=
 =?utf-8?B?V01SQVJKUU5WRmVWSTVwYVBmbDdUb3VQbDl2ZmlkZmtPOTFrV1BvbC9VNWlE?=
 =?utf-8?B?V25HUHBYSlNXK1FwR0NwVmNreEV4Mzg0VlpsREhkT1d1Q3ozUkIrT09lMlpX?=
 =?utf-8?B?dU54ZFhUY2VhbExSVXkyV25DckFiMGcrcDJjeG56ZHc3TEMwaS9UVmpOVjhF?=
 =?utf-8?B?NFBqSi9YbURjVzVjWGNZcUkxVVMvaStmclVzQmNPZmxERW42RW5kdjhuK2kz?=
 =?utf-8?B?ckdXeWFpajZ1MGdQaFVIRldlazVObDJOZjROTFNkVjNtd1JMdnFJdW8rclEw?=
 =?utf-8?B?RUZxT0ZvZzAwSlhzTzNCT0FYV25LT1VZcHRTZThsdVAyRnpEbEVuL1R1aW5W?=
 =?utf-8?B?bDM5MkhYd3FHQ2pjVHhyRUxEaFZmaWVoY0FOVmIwMTFCVk9IMERNSVhMcDUz?=
 =?utf-8?B?YUI1V0JSYmZOMjdkSzlnWWZEVWNTU1RxcWVoL25NMThLaDJ0V3E0WlM5UWNU?=
 =?utf-8?B?VDc5WEI1WFZHTG1KeWdHTytzbUhYVUttb1FoVE5Qa1ZGai95Tkh3S1p6ZGlL?=
 =?utf-8?B?dFpkSGlQMVhLRDBUTW4wYm53Y0t0THhiRTNrWmZ6VUFReE1tUGRmNHd0czhC?=
 =?utf-8?B?b2lUYzZhYkRncHRkUGFuaWhZVmc1VzNyaU91dXRLSzNaeEVaNW4zenphYi82?=
 =?utf-8?B?NHVDeEVxRE5oTWZoelJBZjdzUTR5c0oxbFhQV2tQSDFCZGd6WlhmSXdtU0Rz?=
 =?utf-8?B?STlZbExmbTdrZzhkNWxMdktKb1dZYXM3UGR3ZXlxYkQza1l0cnVWbVcrSGFu?=
 =?utf-8?B?SWd2YUxnMGhFS0EvTUcvVTA2bEpjMWlEYmxTZ2l1REorRXE4N1dkL3dOSnFN?=
 =?utf-8?B?VHpnSlZjZlZDL3FRRlgwNEwzdHhOaUJxK3p4R0VQUGZjVmlkTzFXYkJpeDdl?=
 =?utf-8?B?UmwrN0gzU2NOVnpIKzNVb1E3SmIzaG1PUy9PNW1Fbm1xd0pIMm5QdXJIRVhF?=
 =?utf-8?B?WitoNnRLbTUxVjRnSy9sbzduc2dPZlZFUW51ZzkwaWttNzV0Y0tDdzYwTkxG?=
 =?utf-8?B?RXN3QUtKMGlYV2ZKamhsd1ZYWUZHcmdBYlQvVWV0RzFIaHJVY3JYWCtFY2Rm?=
 =?utf-8?B?MlRKcDhpWUZjQTV4TFFRdW9hVVNNSFVEcmFKaWY5akxISlptdWo1bGltdFlW?=
 =?utf-8?B?NlFlbTB6bldYOWthMHJDK0l4eHpWS2psZzEySy9lVnkrUThCVjcyNjhPTEdE?=
 =?utf-8?B?a3p5d0FScGJVNDZtNUlTNi81bFdydlBVUE01dndRZXgvTGJtVFlyUzJsZ3dO?=
 =?utf-8?B?dVZ1QlkyNGI2L0pyV2lnVWVaQ3dLYVQvWkVVMGVaTm9qbm5rNDVoRGFYZHIx?=
 =?utf-8?B?STJrMkZlTWVwSm9uTldyekVTaWtrY2htZjFFaXZCUGFZZGlZV1kvZVdIRm5p?=
 =?utf-8?B?RW1zK2tNNkdWMmpxcHZPNE1DWWhCaHNFenRmajVtb1BTR2QwdG5QU3VkOEEr?=
 =?utf-8?B?Qy8waUozS0xVZGpWTEFTQ0owTVBrUUNXRnBHdlRkYm0xZUtrR1N4RWM1UExw?=
 =?utf-8?Q?lclbzRSNDzjc1T0goQ/Vl65NT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4211ab-1b1c-444c-1fd7-08dd7221e6d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 20:06:49.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSaWaSh/PjgKb/m1FvKNVB8qkJIFNctD6HabnE9fFR5PD+mwxUAWih2IDoqx+q9BkPR4aad7pRGHYUQ8OWS3FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247
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

On 3/23/2025 8:09 PM, Chris Bainbridge wrote:
> There is a reference couting / lifecycle issue with drm_connector when used
> with a USB-C dock. The problem has been previously reproduced on both Intel and
> AMD GPUs.
> 
> On both Intel and AMD, the symptoms are:
> 
>    - multiple connectors being listed in sysfs `sys/class/drm/cardX/` (because
>      the old connectors are not removed when the dock is unplugged)
>    - no display on the external monitors.
>    - "Payload for VCPI 1 not in topology, not sending remove" error if drm.debug
>      is enabled
> 
> On AMD, this issue is the root cause of a number of errors when re-plugging in
> a dock:
> 
>    - *ERROR* Failed to get ACT after 3000ms
>    - kernel NULL pointer dereference calling setcrtc
>    - UBSAN: shift-out-of-bounds in drivers/gpu/drm/display/drm_dp_mst_topology.c
>    - use-after-free in dc_stream_release
>    - refcount_t: underflow; use-after-free.
>    - slab-use-after-free in event_property_validate
>    - WARNING display/dc/dcn21/dcn21_link_encoder.c:215 dcn21_link_encoder_acquire_phy
>    - Part 1 of payload creation for DP-2 failed, skipping part 2
>    - probably most bug reports relating to suspend/resume and a dock
> 
> This bug has been reproduced on both Ubuntu/Gnome and Debian/XFCE. The symptoms
> are intermittent and vary (as above), but the consistent initial symptom is
> multiple connectors being listed in sysfs.
> 
> To reproduce, annotate drm_dp_delayed_destroy_port with something like:
> 
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5014,6 +5014,9 @@ drm_dp_delayed_destroy_port(struct drm_dp_mst_port *port)
>   
>          if (port->connector) {
>                  drm_connector_unregister(port->connector);
> +               printk("drm_dp_delayed_destroy_port %s refcount=%d\n",
> +                               port->connector->name,
> +                               kref_read(&port->connector->base.refcount));
>                  drm_connector_put(port->connector);
>          }
>   
> Boot laptop with dock connected, activate external monitors, suspend, unplug
> the dock, and resume. This problem is intermittent, so these steps may need to
> be repeated. But when the problem is hit, the drm_dp_mst_port will be
> destroyed, but the drm_connector will still be alive. (This can also be
> reproduced with just plugging and unplugging without suspend/resume, but, on my
> laptop, it happens almost every time with suspend/resume).
> 
> The cause of this problem appears to be:
> 
>    - calling setcrtc to enable a CRTC results in the drm_connector refcount
>      being incremented:
>    - drm_atomic_get_connector_state appears to add connectors into
>      drm_atomic_state->connectors, and increments the refcount
> 
>    - on disabling the external monitors, a call to drm_mode_setcrtc results in
>      the drm_connector being destroyed via call chain:
> 
>      amdgpu_drm_ioctl
>        drm_ioctl
>          drm_ioctl_kernel
>            drm_mode_setcrtc (via func)
>              drm_atomic_helper_set_config (via crtc->funcs->set_config)
>                drm_atomic_state_put
>                  __drm_atomic_state_free (via kref_put)
>                    drm_atomic_state_clear
>                      drm_atomic_state_default_clear
>                        drm_connector_put
>                          drm_mode_object_put
>                            drm_connector_free (via ->free_cb put destroyer)
>                              dm_dp_mst_connector_destroy
> 
>    - so the drm_connector is not destroyed until/if userspace calls setcrtc to
>      clear the CRTC (set.num_connectors=0). If this does not happen for whatever
>      reason (userspace process is terminated, frozen due to suspend, etc.) then
>      the drm_connector object will still be alive even though the corresponding
>      drm_dp_mst_port is dead.
> 
>    - in normal usage, drm_connector_cleanup releases the connector ID:
> 
>      ida_free(&dev->mode_config.connector_ida, connector->index);
> 
>    - when dock is replugged, a connector ID is allocated:
> 
>      connector->connector_type_id = ida_alloc_min(connector_ida, 1, GFP_KERNEL);
> 
>    - if setcrtc has not been called to free the old ID, then ida_alloc_min
>      allocates a new connector ID instead of reusing the old one. This explains
>      the "multiple connectors being listed in sysfs" problem.
> 
>    - the other problems occur after this, due to the multiple half-dead
>      connector objects.
> 
>    - UBSAN: shift-out-of-bounds in drivers/gpu/drm/display/drm_dp_mst_topology.c:4568
>      occurs because vcpi==0 in this payload, so BIT op is a left-shift by -1.
> 
>    - slab-use-after-free in event_property_validate: looks like it happens
>      because hdcp_update_display, hdcp_remove_display copy references to
>      amdgpu_dm_connector (which contains a nested drm_connector) in to the
>      delayed_work struct hdcp_workqueue without incrementing the reference count
>      (see pair of lines "hdcp_w->aconnector[conn_index] = aconnector;").
>      If the connector is freed, &aconnector[conn_index] will become a dangling
>      pointer. Actually, I can reproduce this easily by just booting to
>      gdm then plugging and unplugging the dock a few times, so it's
>      possible this is an independent issue that also needs fixing.
> 
>    - use-after-free in dc_stream_release - there appears to be a few
>      points where a dc_stream_state pointer is copied without refcounting
>      ("pipe_ctx->stream = stream;") but I don't know if this is the problem. It
>      could also just be that earlier failures have left something in a bad state.
> 
> I'm unsure of the best approach to fix the root cause. One way is to try
> and release the references by disabling the CRTC. I tried calling
> drm_mode_crtc from drm_dp_delayed_destroy_port. This was a bit hacky,
> but did seem to work, the reference count got reduced to 0, and the
> drm_connector was destroyed. Another option would be to call the
> drm_connector destructor from drm_dp_delayed_destroy_port (protected by
> some mutex so that it doesn't get called twice when the actual refcount
> goes to 0) - that might work to free up the connector ID, but I suspect
> there could be other issues with having the drm_connector object still
> alive and potentially holding references to other objects, even though
> the dock has been physically disconnected.

Thanks for the thorough analysis and all your thoughts here.  It sounds 
like fixing this is going to resolve quite a large number of issues.

Working up your call path, drm_dp_destroy_port() is what queues the 
delayed destroy work and specifically has a comment about holding the 
mode config mutex from EDID retrieval being the reason that it can't be 
destroyed immediately.

Perhaps could this be solved by reading EDID immediately when the device
shows up and caching it for all callers?  Then this could be an 
immediate destroy.

