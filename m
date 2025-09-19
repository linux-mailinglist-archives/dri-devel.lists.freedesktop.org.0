Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD7B894E5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 13:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B0910E235;
	Fri, 19 Sep 2025 11:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cqO/aliK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010020.outbound.protection.outlook.com
 [52.101.193.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953F10E235
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuRhEtgagb1PQHfgducu/eXvdwc9kF9wvTap/pbqlzK3VP07iHd9Z5QbkgR509Zl4432OKxg0xDAQ3JH/f9HEQoxsFwO/LTDgzhxmgJsSG62QNkX+iPIy/IPssC/FQBqNlrDa+NEUDN9MiS0yeU5vZhmJ/z4paKSE5TBWcbnZUAMg/Jr9Sc7UuaPAuVsyMXe3PmPvxi3mX0yRDZddMtpcVltAzBppkYXT3nU6CIF6pEt29uJ0QPXbOgNh+sURR/b2/H5Bf2ku+BRZgmAAIKjmRlHG3H4w1a68jvMpkztcXBvpARlk9Dn/sbQ2Q40NytaCarei9ZzyaK0cAB3lYq86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuB+XOHpmlMsb0Esq59vdOcdpU+n/Y+/yD+2lmV6xHY=;
 b=Y/TelKo0AYfqKpnmTGUN8ynKpgsLrUY76bZUNvFt2XmZfVjOJ43N7dgXS+cPD2WwRE2C2S4d8cXLKUHkffP/HwD3XZbHnUTSb6Byw2f6hJblKXP+nyCM+5JwhIPxr+4bMbNvDt4rgpB4v67Uz5h3e0jbSzCAsdF1NUQVCeSLLNQrK52z6xIwpuctWBlAiZrXHP2T7Y0U90jr9Fws74p0h+c/CTQDaD8E/x/BV1S0CDYwB34UJ7SpsxFevQ2AlxiPsSTVC/S4/0ZfmUY9tYoBfEI9NaeLyRguVQdupRh/rOjQi49xhaqQETIetVBQd75uyDX8OuhN2kjZfQlC2PUxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuB+XOHpmlMsb0Esq59vdOcdpU+n/Y+/yD+2lmV6xHY=;
 b=cqO/aliKWRGQQAFwBJmlq5+updTRg/qcK3MR8dVqVwRaNdn28jMiKHQ2cL40c0NWWDRi84PCgVWFdiXfC0Gkndumdr0uTJyAmv5Bg4YmKUJjhRyydvWA5AX2eV3bUlyb7FwrMjEGSbWt9Ijjlbtudivcv8G/RAoLxOCGbMgKLz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8921.namprd12.prod.outlook.com (2603:10b6:930:c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 11:50:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 11:50:54 +0000
Message-ID: <c8cf218e-0dfa-4a15-81b3-6f5424edfbbb@amd.com>
Date: Fri, 19 Sep 2025 13:50:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/sw-sync: Fix interrupts disabled excessively long
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: Maarten Lankhorst <maarten.lankhorst@canonical.com>,
 John Stultz <john.stultz@linaro.org>, Simona Vetter
 <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250919104503.1388351-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250919104503.1388351-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c83d297-7e91-4223-0e4f-08ddf772ca18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmEvOXZibmJudHl0SC8xU1ZTeGltVmplUjVEM3hCSW4zUGtud0tvcVBOeDJT?=
 =?utf-8?B?UjI5SkJvdG05VHBKNVJjblFUM1lJc0I5R05ocm9hL1BkQjNqVFE5cjZPZXJ4?=
 =?utf-8?B?cFJxUXVValRoN2J0bHhveFEzUHF1djZLeEtFcTdISWN5SVBBbUlmZWYwOVhw?=
 =?utf-8?B?bStBT1RkbVJLYnJjbU1pQy8zdE1mRTZvUmd2WnMvNkdGbXVFOFE5WG9PUTdL?=
 =?utf-8?B?WHpPSEFNTGpMOHgyZS9LOFkyMUZ3OHp0Mjk0QUNpN29zSE5veUdnZ0dPbkNk?=
 =?utf-8?B?Q3JaNEJCSURxdmF3Q0pvWkYxblE2Q2tuR2ZaN3hFdEZGSXhzenV6ZWNLczlK?=
 =?utf-8?B?WFVMRllFT3RvNER4Q2FDUGpCbUYvYWxVSXJtN1I3ZXZQL0xIdWNrR1EvUGF6?=
 =?utf-8?B?QWl3TnFuZ2g2V3lWZDNHVGxoV3o0M1NvQUR2SkxGOG1aRDVkVnVqdit2aTBT?=
 =?utf-8?B?U2dFcTRxczE1NXkvdzNERE9HZzcvUld3MXp5cCtIOGZZRThpVnFZYUN4cTBQ?=
 =?utf-8?B?RWhJUWFXa0lvWEhGb1NEeDdqYlhXS3lzMVNSOHpXblRTMGdiT2hEYWNUSHc1?=
 =?utf-8?B?UTRPdWN6cHI1VkJjUDlSL1luNE1pQk1wcHA1TkJIS285NHFEdnJlN3Byb2ZR?=
 =?utf-8?B?M3JwUmdzRzVMWUFtS0lMWmJNSzY5di9qa1N0K0IrYVJYMlVVUGY1clFGMU00?=
 =?utf-8?B?STdoam9RbElmZ1VUUTdlMUdNRk5BTkUwQnNEME1TNjMrNGQ0NnRLczBVNXlK?=
 =?utf-8?B?b2hGdHQwQ0YxS0pTcktaaW9uQVplTjNMVldXNEptdnQ4ZnBVS1FRVHlhZVc5?=
 =?utf-8?B?Ly9NNHhIdXdzSFF3YWY0bVZQTkhDeVFvczljcVBvdENZY2RsVTYrZEJ1L1Zl?=
 =?utf-8?B?NmRyNWFxZVFUR0hYdlBvU3pzNWZYbDA1WHpFMmh1dGwxRlQ4bzNCS0lUUk1W?=
 =?utf-8?B?alFHdUNOVnlsMmRMRjRuK09zaDZWM0tMWllLZmplSGxyRWxwZkJMbDZWNG5h?=
 =?utf-8?B?eUVOU2Yrd1VVdWJoR0JRT2kwUnV6S2UxT0xDN0p2d0N2Y1Irc1FKdmhsMy9H?=
 =?utf-8?B?dVozei9EeTFBSEJRdDFGY0RMZUlkZENDeml1YVBsQUxSams3ZjRvNDNaUFA5?=
 =?utf-8?B?TDNsNjNFSnlHbGtMNERpTjZ5anlOWURaUlkxb25GTEowK21QSkJxVll4d200?=
 =?utf-8?B?MEpuamU1MlFYc3JMRDZCL2FZc2hRS3FHLzVIS2FhalprQWJKbThuOVdwWUht?=
 =?utf-8?B?WUpHM09YUFZ3Q2xGTTc0SkxCVjE1UCtUYVZoaG82enVqcXhDMG5EbGp1Rkhu?=
 =?utf-8?B?U0t3bWhnTkVwZVN2YnE3eFp2SUpSdjJOY2tYRm82S1hMQ3JBaVdraEdBeFR3?=
 =?utf-8?B?NjdCSEJnVnVKc3BFVDl0NW5DM2w3VFlvNWtySkkwRUMvamRNSm1IM3ZXOGZQ?=
 =?utf-8?B?OG5RbXU3SnZ6M2ZmTm53MUJVWExlRURERWdEd0FOK0lkY0hlR0NsTVZ2VE8r?=
 =?utf-8?B?VzBLKzh0ZTBPdzVDSWY1dVlGRk92dVB5d1V3alNNcE4zMXV3aHYwbUtoL3pN?=
 =?utf-8?B?ckZydXFHNnBHa1ZrYS9tV01ySGJwelpSTDFab0JVNUxZT2NUUFNDMFI3YllL?=
 =?utf-8?B?SythYWN2aXhRSW9vTUxpakNxT01raC9ORlp0RW93WWlBOUVhdXVvckVXZ0hF?=
 =?utf-8?B?OS9CaHNJbWo1QVF6K1R1Ym9HOWJsZU9EcUNpYitwOCtQK2VMYlVvWEVDS3NC?=
 =?utf-8?B?L3IrY0UwVDNVNTdjSHQzNGF6NmZIN0ZmQXVldmFZcE1Jd2p6RGJtZkRnRytl?=
 =?utf-8?Q?uEf+X43rht6LMsE24VnWHfNP1ptGQR/6e5uDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NYakFINldVaWtrT0VnOW5jTk5xYy9udHRFT2l3VTQwejJNUnhhOEk3aGZq?=
 =?utf-8?B?OGluL0p4cUJJL25MNGorRG5KQW1PcThtR1RVUXhVY2dDZU5reTRIWGhxeGFV?=
 =?utf-8?B?dnE0a0RtTHNlSC84YmJnQUlrZlBLVE1wdUtteTQ2MTZFYXZZMklOckhaRG1U?=
 =?utf-8?B?YTUxYktSeDlTNS9kK2JqMEtPQnlHRXovZTdoOW9RNVVzSlBuZ0NYMDZ4V29m?=
 =?utf-8?B?UGRFK2hDVGxoSVAramg1eVIwbnlJSUFTS3A4K3p4VGNqTmQ5bFlrOEFCU053?=
 =?utf-8?B?c1Nxc0ZiK0dpK21WdFE4aW91VXVuYnExdHJwQStFeFc1NlZXbmxnMjNkeHp3?=
 =?utf-8?B?RHZvS05LUDl0a2JTSVpsdUIvMDFETnB0bmQ5eFduS3BjRGtjTG9KVXpOOEx1?=
 =?utf-8?B?M0NJSkVaWm9HV2s5aExVcStocWRsTHJ6Qy9uWGx0SlV0Q25OVFdaaFBLYjdS?=
 =?utf-8?B?M0t2eHgyTWVyNmlxZEFEVFROSnRXd3FiamU2VWlkRGdjUVFrL0N0TWZvMDBw?=
 =?utf-8?B?WXVZNTZZcDRwdVBobHJqSUxZL0UxVzN3dzl2OEE0d3VjaXBadmhuQWs5SGNo?=
 =?utf-8?B?Wm5mZXh1ZzRROUZuMXBzTGJZRVM0Rk16b3Z3QW1FQzN3ZnNwR2pRTnp3bjEr?=
 =?utf-8?B?QThLMExSZS9rZGtFanNHb2dzajRCS01oZ0tpQzhzbXlRSkhvVHlSdS9JNDhR?=
 =?utf-8?B?MSs3KzNDc0w1V2Z0ZVdXeXUxYWFocjlTTVd1ck9iUktGR0VENEFwWlRhM1ND?=
 =?utf-8?B?dkE2YmJqWE1UMERzajhEcVRhU3pkK1dpbDhxckRobUVyUFB6bVU2UEJYeXZO?=
 =?utf-8?B?eis1eHBhR1dhUncwdEpzRDYvbmxUREJubjVPbms4eUhTVEVvMWxHa3NTaXNu?=
 =?utf-8?B?RDZlUVpUNUo2TUlwUEpDWDNtRmh1VHBzVmJUNXlZY3BMYWk2MExYUGJpYUtl?=
 =?utf-8?B?b044R0xtTy9mNnhJaFhhQkthVnhoQ3hZbnhUUnV5K2ZDdHZYbk04WUxHMHM1?=
 =?utf-8?B?dWUrM1lOR1cvano5WUFycC92RHA4SUxBOTM0c01YNTR0Ylh1TFdlWXJjTkxi?=
 =?utf-8?B?TngxRURyTU5IZ3BtOHpEeStXcWJuVDhIeC93TkdPZG82UEJma05PYmhBOVd3?=
 =?utf-8?B?ckY4dkdQTVZjM0ZTaVNxL2VmTDFzcWsxWElGcnEwMU9yVDZ2MEZ2NDgwWDRy?=
 =?utf-8?B?SFF2a29ZRHBIaHhsMHgvWGoydkt6d1lHeE43Tno0ZGNtNk5YYWg1V25IVHhH?=
 =?utf-8?B?Mks0NVZwaGt2ZkpsNmZLMVU0dTYreFgySXl0bi9WTXlJZlBqZVdhcVNieEJn?=
 =?utf-8?B?STZlbkhoN0I2MndaeGJIUFhoV2ZqcWRPWlYvZmwvU3ZiTzZHbzZJMU9ydHlv?=
 =?utf-8?B?NTlYL2NoaTJLQ09BM29pbGJ0cHIzZzZaQUZsWVVmVlJRU0xDenhxdHR2Nkhz?=
 =?utf-8?B?MTFjS1pEd3k5ZDZNdmlUeDlOV0Nic29oR1lEanhwMXFjR2libkFaT3JnNGhH?=
 =?utf-8?B?MzA2SkpMajFxSnZvTjNiOVc3ek1rRkdndXRuN2ZnMHFNWU5McU5yaDdIU0VQ?=
 =?utf-8?B?NTdYODA4K0N3Wi9pUGpGRzJ4SWlTbkllcWM0NWFheDJXUUlXYUhkbkdxbjdL?=
 =?utf-8?B?NHRTNlQ5OTRCNkZyRkw0YWt6TDljM1A3ekdtRHlMYWVWZDNpT3FkQlREZ3Zj?=
 =?utf-8?B?dlNsWnVsWGFzNjFrMmVJWis0eU9GeWE4NWlVU2VUbmtmQ0M2R1QwOFdZRlk5?=
 =?utf-8?B?QzZTdzJlKytadTZ1YzR5eGtpbmpkeUZSNUdGY0plczkzK1MwQklaNk51M05O?=
 =?utf-8?B?MEVVczVFQ2lndXdtSE1jdVlTV3JiWFNndmlhZnoxRkpXQ3RoT0wzdTV1ekYy?=
 =?utf-8?B?a3dVeGxVeUJoQTcwOWFmcjlwajR3WmtIZnZOalhUQjA1TkplNWRNVTdUaXow?=
 =?utf-8?B?dStNcFgzMlJTTk45aitHWXovRm1FbVM5WkhaN05zOVRDZmNIbDIrcEVjSWZ6?=
 =?utf-8?B?aVZBNjgveDlybTVhQUVaZks5K09SaUlrYXFjMVkzVFdxOFNGT0VFV3NERWJU?=
 =?utf-8?B?RGxiMGYzaUl4Z0FZYnpLNmZRdVJTclh2V1R5WmE3MURRMGo0K3F4LzF6SVlu?=
 =?utf-8?Q?9HCIZNS+DemGEZELjNV6zEtp3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c83d297-7e91-4223-0e4f-08ddf772ca18
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 11:50:54.6657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqfB7DZK9SSL59nQuLPmvUjGXNUxaH8ROR9J2ciGNxRJTSrPdB4S3BSativamNVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921
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

On 19.09.25 12:44, Janusz Krzysztofik wrote:
> When multiple fences of an sw_sync timeline are signaled via
> sw_sync_ioctl_inc(), we now disable interrupts and keep them disabled
> while signaling all requested fences of the timeline in a loop.  Since
> user space may set up an arbitrary long timeline of fences with
> arbitrarily expensive callbacks added to each fence, we may end up running
> with interrupts disabled for too long, longer than NMI watchdog limit.
> That potentially risky scenario has been demonstrated on Intel DRM CI
> trybot[1], on a low end machine fi-pnv-d510, with one of new IGT subtests
> that try to reimplement wait_* test cases of a dma_fence_chain selftest in
> user space.

The purpose of the sw-sync is to test what happens if drivers exposing dma-fences doesn't behave well.

So being able to trigger the NMI watchdog for example is part of why that functionality exists in the first place.

See this WARNING in the Kconfig file as well:

config SW_SYNC
        bool "Sync File Validation Framework"
        default n
        depends on SYNC_FILE
        depends on DEBUG_FS
        help
          A sync object driver that uses a 32bit counter to coordinate
          synchronization.  Useful when there is no hardware primitive backing
          the synchronization.

          WARNING: improper use of this can result in deadlocking kernel
          drivers from userspace. Intended for test and debug only.

You can actually use the functionality to intentionally deadlock drivers and even the core memory management.

Regards,
Christian.


> 
> [141.993704] [IGT] syncobj_timeline: starting subtest stress-enable-all-signal-all-forward
> [164.964389] watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 3
> [164.964407] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_realtek_lib snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore i915 prime_numbers ttm drm_buddy drm_display_helper cec rc_core i2c_algo_bit video wmi overlay at24 ppdev gpio_ich binfmt_misc nls_iso8859_1 coretemp i2c_i801 i2c_mux i2c_smbus r8169 lpc_ich realtek parport_pc parport nvme_fabrics dm_multipath fuse msr efi_pstore nfnetlink autofs4
> [164.964569] irq event stamp: 1002206
> [164.964575] hardirqs last  enabled at (1002205): [<ffffffff82898ac7>] _raw_spin_unlock_irq+0x27/0x70
> [164.964599] hardirqs last disabled at (1002206): [<ffffffff8287d021>] sysvec_irq_work+0x11/0xc0
> [164.964616] softirqs last  enabled at (1002138): [<ffffffff81341bc5>] fpu_clone+0xb5/0x270
> [164.964631] softirqs last disabled at (1002136): [<ffffffff81341b97>] fpu_clone+0x87/0x270
> [164.964650] CPU: 3 UID: 0 PID: 1515 Comm: syncobj_timelin Tainted: G     U              6.17.0-rc6-Trybot_154715v1-gc1b827f32471+ #1 PREEMPT(voluntary)
> [164.964662] Tainted: [U]=USER
> [164.964665] Hardware name:  /D510MO, BIOS MOPNV10J.86A.0311.2010.0802.2346 08/02/2010
> [164.964669] RIP: 0010:lock_release+0x13d/0x2a0
> [164.964680] Code: c2 01 48 8d 4d c8 44 89 f6 4c 89 ef e8 bc fc ff ff 0b 05 96 ca 42 06 0f 84 fc 00 00 00 b8 ff ff ff ff 65 0f c1 05 0b 71 a9 02 <83> f8 01 0f 85 2f 01 00 00 48 f7 45 c0 00 02 00 00 74 06 fb 0f 1f
> [164.964686] RSP: 0018:ffffc90000170e70 EFLAGS: 00000057
> [164.964693] RAX: 0000000000000001 RBX: ffffffff83595520 RCX: 0000000000000000
> [164.964698] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [164.964701] RBP: ffffc90000170eb0 R08: 0000000000000000 R09: 0000000000000000
> [164.964706] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8226a948
> [164.964710] R13: ffff88802423b340 R14: 0000000000000001 R15: ffff88802423c238
> [164.964714] FS:  0000729f4d972940(0000) GS:ffff8880f8e77000(0000) knlGS:0000000000000000
> [164.964720] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [164.964725] CR2: 0000729f4d92e720 CR3: 000000003afe4000 CR4: 00000000000006f0
> [164.964729] Call Trace:
> [164.964734]  <IRQ>
> [164.964750]  dma_fence_chain_get_prev+0x13d/0x240
> [164.964769]  dma_fence_chain_walk+0xbd/0x200
> [164.964784]  dma_fence_chain_enable_signaling+0xb2/0x280
> [164.964803]  dma_fence_chain_irq_work+0x1b/0x80
> [164.964816]  irq_work_single+0x75/0xa0
> [164.964834]  irq_work_run_list+0x33/0x60
> [164.964846]  irq_work_run+0x18/0x40
> [164.964856]  __sysvec_irq_work+0x35/0x170
> [164.964868]  sysvec_irq_work+0x9b/0xc0
> [164.964879]  </IRQ>
> [164.964882]  <TASK>
> [164.964890]  asm_sysvec_irq_work+0x1b/0x20
> [164.964900] RIP: 0010:_raw_spin_unlock_irq+0x2d/0x70
> [164.964907] Code: 00 00 55 48 89 e5 53 48 89 fb 48 83 c7 18 48 8b 75 08 e8 06 63 bf fe 48 89 df e8 be 98 bf fe e8 59 ee d3 fe fb 0f 1f 44 00 00 <65> ff 0d 5c 85 68 01 74 14 48 8b 5d f8 c9 31 c0 31 d2 31 c9 31 f6
> [164.964913] RSP: 0018:ffffc9000070fca0 EFLAGS: 00000246
> [164.964919] RAX: 0000000000000000 RBX: ffff88800c2d8b10 RCX: 0000000000000000
> [164.964923] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [164.964927] RBP: ffffc9000070fca8 R08: 0000000000000000 R09: 0000000000000000
> [164.964931] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88800c2d8ac0
> [164.964934] R13: ffffc9000070fcc8 R14: ffff88800c2d8ac0 R15: 00000000ffffffff
> [164.964967]  sync_timeline_signal+0x153/0x2c0
> [164.964989]  sw_sync_ioctl+0x98/0x580
> [164.965017]  __x64_sys_ioctl+0xa2/0x100
> [164.965034]  x64_sys_call+0x1226/0x2680
> [164.965046]  do_syscall_64+0x93/0x980
> [164.965057]  ? do_syscall_64+0x1b7/0x980
> [164.965070]  ? lock_release+0xce/0x2a0
> [164.965082]  ? __might_fault+0x53/0xb0
> [164.965096]  ? __might_fault+0x89/0xb0
> [164.965104]  ? __might_fault+0x53/0xb0
> [164.965116]  ? _copy_to_user+0x53/0x70
> [164.965131]  ? __x64_sys_rt_sigprocmask+0x8f/0xe0
> [164.965152]  ? do_syscall_64+0x1b7/0x980
> [164.965169]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [164.965176] RIP: 0033:0x729f4fb24ded
> [164.965188] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> [164.965193] RSP: 002b:00007ffdc36220e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [164.965200] RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000729f4fb24ded
> [164.965205] RDX: 00007ffdc3622174 RSI: 0000000040045701 RDI: 0000000000000007
> [164.965209] RBP: 00007ffdc3622130 R08: 0000000000000000 R09: 0000000000000000
> [164.965213] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffdc3622174
> [164.965217] R13: 0000000040045701 R14: 0000000000000007 R15: 0000000000000003
> [164.965248]  </TASK>
> [166.952984] perf: interrupt took too long (11861 > 6217), lowering kernel.perf_event_max_sample_rate to 16000
> [166.953134] clocksource: Long readout interval, skipping watchdog check: cs_nsec: 13036276804 wd_nsec: 13036274445
> 
> Avoid potentially expensive signaling of each fence when removing it from
> the timeline from inside the loop under protection of a common lock and
> disabled interrupts, do that only after interrupts are re-enabled.  Each
> call to dma_fence_signal() will then disable and re-enable interrputs as
> needed for processing of each signaled fence.
> 
> [1] https://patchwork.freedesktop.org/series/154715/
> 
> Fixes: 0f0d8406fb9c3 ("android: convert sync to fence api, v6")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/dma-buf/sw_sync.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 3c20f1d31cf54..638c2f756299a 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -224,13 +224,12 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>  
>  		list_move_tail(&pt->link, &signalled);
>  		rb_erase(&pt->node, &obj->pt_tree);
> -
> -		dma_fence_signal_locked(&pt->base);
>  	}
>  
>  	spin_unlock_irq(&obj->lock);
>  
>  	list_for_each_entry_safe(pt, next, &signalled, link) {
> +		dma_fence_signal(&pt->base);
>  		list_del_init(&pt->link);
>  		dma_fence_put(&pt->base);
>  	}

