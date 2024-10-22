Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7079A99CB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 08:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5672910E199;
	Tue, 22 Oct 2024 06:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tTjmYTsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE29D10E189
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 01:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKhcFd26tnaqlv9Wa2dffhkBChpf722k8WXyLzKpbvq1kEaXZL3OaTx/cMHcvE4E5XOtu+6kjTyrl1srFGZuuUO08sww85uXQUeQcM092MEckZ47JYgr+Zj+8FSwndxeHbOAuVTnVR6nNlNQrcxn91zdhZn2+MgxGXFu3OXFCAMCGuxJHXxK3hFS79dQlO2+fu6kSXO6KtSElu90EYivrm02TM2F6NArggchujlT18gUlXwCrtRXZkBOfE6c1VYt/AnfRndH9ZdknXyLEOtbYcwAstrDWnv7BiAXxhl7hPznOujCGfZUAtLziJF/K/sTeEybwp/RVoPTgiDwY48P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJJxzB62zbqFxrJMSl25dilLZQZOYQF0Hh8UmoL6z0Y=;
 b=PfaUFdgdL888gVs0PzsiGEgPLuNgwWPDWoOS3waEPiGQBf9c8tFdjK89Tb2OlTXZXDykmUDYr54AZ7z0JRkYKsJMAk+5UD9ucmUs+cmI1wqU0Y+P37D8kjr2mQ+SD4Jh6fIjGymCrVtuRcEpWfgCbWVIw0qTL/AgLgv6km3925q16iTPTaWYHpxhbMPshwe5PuHlaGjjx4BAKLLMw+IDZr4FlhO4rk5qNYecXIkkIaXCjvwVzUbkAz+1chBEE5oNoHRXLUmVR/5dXsNoMxrEZCahQLk3ZLOSsJ8t2Rjl+309ggiN+qRyMJwRbtw5vLNjR9rv4+YUVSprHMFEGkqnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJJxzB62zbqFxrJMSl25dilLZQZOYQF0Hh8UmoL6z0Y=;
 b=tTjmYTsLtMlOv1vf9aW4h38ze9OXBBZzGh/594C2U1OSwIX1Bbob9wqmP0zK7l5fuVckCs6nQzNelLdOAJaLlX0A8wKNg5yjW0zHunLEVpi62X3rQ2WM/cAi4K8XaIIQfwlCC43D2JyHU6Q6sJljWrVLjXJykoMIBTofTnLk7MOdAUchpnOv8JLXSiEW/T7MyiEeRxwdNVisVSJT9JfKg6vRtpsCnxDN4IEW/90nYLewNcmd0Bu3DQhcCyWWf79RqbbGPRKxZLKrODhB7AMEucgu7sRQpk5zfhA4+PkfKRSP6HFN44Nk9Kgan9wPvw4IjDe2VTRnnAAs3AunUt34bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13)
 by CH3PR12MB7497.namprd12.prod.outlook.com (2603:10b6:610:153::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 01:35:58 +0000
Received: from PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378]) by PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 01:35:58 +0000
Message-ID: <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
Date: Tue, 22 Oct 2024 09:35:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
To: Luke Jones <luke@ljones.dev>, Mario Limonciello <superm1@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
Content-Language: en-US
From: Kai-Heng Feng <kaihengf@nvidia.com>
In-Reply-To: <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To PH7PR12MB7914.namprd12.prod.outlook.com
 (2603:10b6:510:27d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7914:EE_|CH3PR12MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: f4008687-d4ce-41e4-1180-08dcf239e0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDVKY3R0S2FoZmV3anBnU2FGTGFuU0FPblZ4Q21vK1MvMWpZZVdnSVFSbE5R?=
 =?utf-8?B?bjRNSHlZZEVsZE1zc3dDRTMrZ2hZcjRwTUJuaFpPblFHVTZxNXB3b3l2Wm9B?=
 =?utf-8?B?OWdBNWQ4dkJtcTBvVFE0NjFwK1Z0M1BQT0NyeUc1M0FwVHR3azRuSFBSRFo3?=
 =?utf-8?B?bDEyTDlNN1RMSkc3QjdNaWFKdzZMUWtwMFA3NFUxQ1MvamtvN2FQUTB1UzEz?=
 =?utf-8?B?SU96MUlVVjRUNDJROWQxeGJxSXZ3UU5KR1luNHhYcXpVc3g5NHFETjV5eVNN?=
 =?utf-8?B?Y21LbzlrakEzRXZDSkI4THcvUWoyWWxXOXJReWs3eEFOajlsQmJKd0VVcis0?=
 =?utf-8?B?K2NPTHpwYU43YmQ3OXlGK3dqL1AyUXBCNG1FU0dtSXcrbWRyWVgreWgyNFND?=
 =?utf-8?B?SlgrWHVuNTU1eGF2aUF2MlZ1TTdnWGFWYkgzL3RrcDEwOXowZUhKWVc4RUZ6?=
 =?utf-8?B?WWorVFcvcERudVRRQnJnZkVPazF0TzV4STZTenVZMUJNbngwQmZuN1VQQmlp?=
 =?utf-8?B?UWVnR25LUkdnNXdmVDBya2xhZE5SaHBDSWttUjBHN3ZyV21GVUZYeGt6WVkr?=
 =?utf-8?B?d3BOYlUxY3BPWEI4MllVOEsvdGZZUFN1VXBEY2hRTWFTZ3VRZ0ttUzVXemNi?=
 =?utf-8?B?UTBXamJ3cFhDMXYrSkdtVFRLVDc1Nkoxb0VyMURDV3dPRFhkc1dCd3EzMEJ2?=
 =?utf-8?B?UjhDbWlDZHFHSDh2OTloRmtKbi9oVTFpWlBFRjlicHozMWtzaVdqM0h5QkpG?=
 =?utf-8?B?aU5xdG1WdmpYRG80Zjhsbjc5UFNmaDY3MWY5QnE5VURndHMwSThsa3llWWhp?=
 =?utf-8?B?T0Z2aDA3dzZrTXR0TDZ1K21BbG1aM05FZmNMdnltM3NnUlgxbG9RYXdJcFBJ?=
 =?utf-8?B?ZFpvN2lkTERjTE1Rb2dJTWRmMFNWTkdkTW5VU0JIYmpsSmo2TVdDenJlWTZh?=
 =?utf-8?B?bmxUVlFUUjFTTVh1alVkeUg5SHlBb0hmMHBEV1VaejliV0V1d09PSDBLQlZK?=
 =?utf-8?B?b3JEUGN4TzQwQVdpRkJWNmQwRGRPbWY2L3FMOGhWWEdSR05yNmUrWm8rc0dL?=
 =?utf-8?B?MFRVbkpOTmkxVTlsNHlvVGxPTnhwbkJOZDlESjRoUXZuM1N5cXdMT3MxV05J?=
 =?utf-8?B?WkJ1bytqaCtOUGVBSTlMVnZ4QjRlbHY1OVlKOGZGQ1VrSkN6cWpxVG1hR1pB?=
 =?utf-8?B?RGg2TllNeHpkcTRpd0krdG1tdzZXazM3eUhsUDkwYk15aHQ2R3AzeGd3OVdo?=
 =?utf-8?B?bXM3UFdac2x3T2Y2ZFBXWUloODJsVmZ4dnhwQkRJemljd0crbmoxbXFYcmtu?=
 =?utf-8?B?Y09BQUtadEVBOHliTGUvZnYyTDMzRnB0VnJvbjZLd2VhVldiZkd1bTdMeFdW?=
 =?utf-8?B?OEQ0RWVtdEdkcHNnVXFQYmFzU2pmcWcyVHdnNEw5VENSd1BOMkRTTm9ETHlW?=
 =?utf-8?B?cTNiU0NrUGwrN29XQXQ2M2ZnTDA5d0xmU3h1WVJCdy9KdE9MTjlYV0d2dm1m?=
 =?utf-8?B?VjJuRnBneG1nZWp4TDFHL240Z2sva1FWNUFkL3hlK1lobC9QOWpKOHBDVTZD?=
 =?utf-8?B?ZVFjeC9yVW01ZDRTRzF3ZzJYUnp6anQ4ZHc1THpSM0xOTFJKRHdQaE9RN0Y2?=
 =?utf-8?B?Mm4xMGczL0FrZVp1cTJOK1c2R2ZuK0pQcnM0ZE0wcHpwUVY2NE9mbGNhMHJB?=
 =?utf-8?B?RnAzaXc1dUVsTng5SE9hSG9ZelQya0RQYmRvSnZTandyM0JPUzI3S2MxK2hp?=
 =?utf-8?Q?kjowUWw/s85RF2KnmiS4qFzmYwmwBxi11rYbDhU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7914.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tlc1TGdMNFM5K05SOUhKZHU2a1crYUx4Qnd4NzJhcTNaZTBkYXJzMHFVWmFk?=
 =?utf-8?B?VlYxZTJvd1RwVElTUjM3REVvaU5oV0VnT2I5Zk5TdTFUSlhzVk9RZDU3aUZT?=
 =?utf-8?B?a0FQZnB3OHA5Ly9PdlkwTEhDM3ZRcWtHaE5QMHF5Zm56aTE1NHpFS2RQSFlx?=
 =?utf-8?B?UVpPSzlBOFN6aVN0QVkzUkd6UTJwUXNqb0JpdzlMK2pGOHdHZnJaMy82aExL?=
 =?utf-8?B?alFPYlZMNkRlTC9yMDhjTmhFZXdrUTErMEFicXpTZDZXSlcxZmtpT1c5VWRX?=
 =?utf-8?B?c29xdGhsWWpoRXZJWC9Hb1V3TFBnUWFaOHRsUkkveTJSZno4NU80SW0wS3VF?=
 =?utf-8?B?azdrMnRQT2FqbjJ2WG9USnVkQ3lpV2IzNkZwNklyZDlQbWRBTWxqM2JvWVFk?=
 =?utf-8?B?RUw0TER3bUhtVHdQSTcyN0dJRE1vTzcrYkEzWm9Od20xU0xaV1F5RHhWYWNo?=
 =?utf-8?B?VVAxbkNaUitEdEFjVDVTT1ZLZ21jRVpNRC92bmo5VEVIQ2MyMjlydWVUY1M3?=
 =?utf-8?B?Q0Q5UEg4d0dOcUZCNk16RW9JcEFRQzFybzNLQTZiem5rZVJYejBabEhHQVlM?=
 =?utf-8?B?eEJ3alZXZUN6VXAyN3UwWEhGL0hCcWh3ZjFOQW45SmExN3JldCszZkRrMlBw?=
 =?utf-8?B?Qnp4c2FkNWpUWWlEMTVoK2pQdTNEZERUOGg5V1pWTTNhZ0E5NVJpSktROVVO?=
 =?utf-8?B?dzZsQXdENmpEd2ZicFRHMnJTaFo3dFc0K3p2QzQvc1Z4ejV5VVgySzVWakIw?=
 =?utf-8?B?TjNuQldkK0toK3JnaElFbG9USWJwUkpzL0s1YXVvLzRwSWM1d0NuRUdHTStJ?=
 =?utf-8?B?TC9XWTZlUG40WnBETldyVlBGSUNGeEp0LzBYTTV0bnVQeW1sTk9DNnJyVkYy?=
 =?utf-8?B?SVZ1cGdSMGR6U09CRG9rVHNkK05HeUNNa2ZNTEFKL1VKWU4wbkhuc1VsalVB?=
 =?utf-8?B?WGs1U3RHTG55QS9iZ1J2YzFObGZYMHdGeFp4N21zTkZlVmRRUGYrSGdibVkx?=
 =?utf-8?B?ZXV1NzhWczNLNllIUjZqOHRRMEhyT3lJWDk4aXI3aFN0UEl2VkZpaXpSQ042?=
 =?utf-8?B?WG5PdUlPaHhpemt0SDVBb2FvenRMSW43VGVGYVpzdTlvWE9QUDBjUmtBcVhi?=
 =?utf-8?B?SVpkMStUSFFlTklCN2ZSdUowQWtZN0ZQeDIwZkQ2TVUxVHBHWTNtUC8rTGhD?=
 =?utf-8?B?a3h1WEIxa2ZoM2hJR0k3enFuWGp2eGhsZzlZYmNXa2pRSzk0N0c2cHl6K2RZ?=
 =?utf-8?B?QVlabUxZL0gzc0xhY3RZRHBQeG80eE5FYzJQc0FvbXlhcVZSSnBHZ0kyYlNt?=
 =?utf-8?B?NTgxdUpWSlU5ejNodmRmY0s1dWJXWU1Mc3gydlg3ajVMYWZaSEtabHlBbTBu?=
 =?utf-8?B?NHdyTFIxRzRvZHlnQi9UZy9YVzdkUWV0bkhrQ3JmVllUSHRsUUtIbEZyMUJW?=
 =?utf-8?B?NWQvc1c5RGhKYlNIOVFxbXgzSXg2UkJ3VXJGYnM4TW01VnptY05iYW9NNVZr?=
 =?utf-8?B?ZExMRXgvbG9BL1VJVnRUbVlBZzNMbUNZcU1aL2VVTkUrY0diZFprR1pEemta?=
 =?utf-8?B?amlyeHZwVTArb3YyVTBGZkJKUjM1TWdlNnVPZ3FpRzV1RjFtczVCNERXTUI0?=
 =?utf-8?B?a3Q4dEh2ZWNObTFVUVhGSDVVVVVUdTRoTGlrYVJYcmIwY0pEYWN5bUo5ZXZN?=
 =?utf-8?B?QkxKTWh6eEVoOENoVks0bVBmWXFHc1R5ZXo3MmdQY2JOeExNU2pEWEtSdHZm?=
 =?utf-8?B?VnhjNk5uZGM2Nm16YmxKM08xVTZyWWlTdUhNSnNwV1J4WTgxenlvOFVGVGlZ?=
 =?utf-8?B?dVNveVpNK2s4Z0NnaEl5aW5vS0JJbHFOTUEwalFSSjhSbzRub1Vaa3RXaWta?=
 =?utf-8?B?RmJNV1kydko3VmNHclhqTzcwaWEyMHkwTkMra3pDWW0xU3VrNU12QXJ0ZitJ?=
 =?utf-8?B?dGJSSzlqUjU3V0R3dmVRajhoUlhWUXNmSWNLUzl2ZjNuaUdaTHY5SFo4Nklm?=
 =?utf-8?B?dkxGN2FuQWV2ZnZDRERCU3prZHJIbVZwRU1HdFhEd05zMzc4NXA5UFNsVjB5?=
 =?utf-8?B?ZDFRM1QrQzIwZ1E5b0VyRU5WVEQwQ2xGWDFERUx3dzB5Y3JNb2NneS9VVGF1?=
 =?utf-8?Q?Zb8+29ImvwwLRLF1FcEpi2yoL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4008687-d4ce-41e4-1180-08dcf239e0db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 01:35:58.2476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7M3VIRYI0rkK5csIKJoicm2k/sjQTcg2K9Ic+3tP1ftMG8ZFe5sV0rIDjRhPu7YF8wRdTRIZR7pg2tzThlt34Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7497
X-Mailman-Approved-At: Tue, 22 Oct 2024 06:30:58 +0000
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

Hi Luke,

On 2024/10/15 4:04 PM, Luke Jones wrote:
> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device.
>>
>> ```
>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce
>> RTX 4070 Max-Q / Mobile] (rev a1)
>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
>> Strix [Radeon 880M / 890M] (rev c1)
>> ```
>>
>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
>> boot VGA device, but really the eDP is connected to the AMD PCI display
>> device.
>>
>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.
>>
>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
>> Reported-by: Luke D. Jones <luke@ljones.dev>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/pci/vgaarb.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 78748e8d2dba..05ac2b672d4b 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>   		return true;
>>   	}
>>
>> -	/*
>> -	 * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>> -	 * other VGA devices, it is the best candidate so far.
>> -	 */
>> -	if (!boot_vga)
>> -		return true;
>> -
>>   	return false;
>>   }
>>
>> -- 
>> 2.43.0
> 
> Hi Mario,
> 
> I can verify that this does leave the `boot_vga` attribute set as 0 for the NVIDIA device.

Does the following diff work for you?
This variant should be less risky for most systems.

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 78748e8d2dba..3fb734cb9c1b 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
                 return true;
         }

+       if (vga_arb_integrated_gpu(&pdev->dev))
+               return true;
+
         /*
          * Vgadev has neither IO nor MEM enabled.  If we haven't found any
          * other VGA devices, it is the best candidate so far.


Kai-Heng

> 
> Tested-by: Luke D. Jones <luke@ljones.dev>

