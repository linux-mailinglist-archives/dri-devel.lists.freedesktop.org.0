Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7BA29B41
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 21:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CFD10E202;
	Wed,  5 Feb 2025 20:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="syp2JRvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE1E10E202;
 Wed,  5 Feb 2025 20:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUEhSlV7k+YyFcAMETDglLJaT750uMubIUI/LQEwFwUs9E8zAFnUrOemAAGR/JR5t+qL8o+6bAKc5TpR8bkupHB8oPDzqoYxFrv6qQSGqEdTl4Atgop4UoX5d44GInfCslVII2oJF15fMG/qIMes3pbNjHueweIpkR18XT6Y0U2nbsql1/SegiqxVPDtT1BtMgcq00hXEqbyZqZGanzv0DOawyYUqpV1TkR7sgsmZSrcom5KZBT4cESYrMCoEakCOncq+hdqsmL4CtVQKpDI+iNUypF56wiqKxzdkgjAm0lI5TCzvzKzAAP2kpkN0bfT3Jy4epq6qic+LuPZ97Id3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4CxEX86f1Lq9mrAbN5qY76KutdlUk0eXTCOL82FiMA=;
 b=aO/BaI8u86XQEE3TWs7cwXWe+IJ3x5sKET35aX+7PkBJef9wmqWlfjG8CeelGOzdfShIGlIsV9YEuaBvuIkwULnIu/koHHxZSPFgYnyaLFbi1iXMTRK/a3F1JJqJNMKk7GsCS7nEB5TbHx2Gq4TnHS3JjQztqv+FOVoIrBNTN1/j1U3V+b8kklicSTGImPFwWgCkO8MINLWVaAMibqJ4A0IdNCr40e+GNX32cKdKdJHUlvDTWpfo3kRyGfGuwIoafL1AIWVGkuIMImxMyjAHVUu3aRvAOsYLHBSLasBbZV1TlZ9Z3tuzk46+xygiqYOaO605aJdQLIzQozqmuFhefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4CxEX86f1Lq9mrAbN5qY76KutdlUk0eXTCOL82FiMA=;
 b=syp2JRvHBSnLr33DNcARu62SX9LZDDprGQan0IcpWZgTp+XOYstAG/lyuUlNdkr8ypPQEEnhE2ubZBFgC7ckxltSCBDH7N59YV5GhYMWR+NsnWwiXGcxF2mTAaLed9U4B/TDZ5AvKjq0d0/OXtax2Wlys6D9LgtwcmF1eLenJXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ2PR12MB8112.namprd12.prod.outlook.com (2603:10b6:a03:4f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 20:33:16 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 20:33:16 +0000
Message-ID: <30fbb0d6-b911-4a99-bcdc-38e2ede5eaa0@amd.com>
Date: Wed, 5 Feb 2025 15:33:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Refactor find_system_memory()
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250204222140.3883013-1-superm1@kernel.org>
 <65b47db9-883b-46c6-919a-e84c3ffde401@amd.com>
 <0451e510-f8e4-4539-a3ce-cc9fbe71964f@kernel.org>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <0451e510-f8e4-4539-a3ce-cc9fbe71964f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ2PR12MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 05737265-dc0a-4d60-f762-08dd46245205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkZrUCtwVEtWYjEyOWM5YzlQaWJsRUpDWEZlaXBJOEcrTEtqZDJ4aDlwMGNl?=
 =?utf-8?B?MzRKVXZBdGIxSWVOU1kxY0hEaVg2aWlLT09UUzJYUDVqRzBIYmNLRFNRbVJJ?=
 =?utf-8?B?QWRvTkdrQVloRExKL05hdGtwdTB4RlhialFUNzVEUnRxVytGWU1vZnZoQ0E5?=
 =?utf-8?B?eDY4QnZBMnJEMjZ6Y0NkUkpBTEN0SE1tMzlGOWpIdG1vcEJMSkpKRHhCYzB2?=
 =?utf-8?B?Q21PUE5Eek9wUzJ4bithUFlkSnNqYW90bEFaTndnK2RqTERkWE11U2NxUi82?=
 =?utf-8?B?Tm9NRE5kc3NIakt2V29lSjlTRHFubzVsTTVFcDAwbkcvYmZQUGV2Z29nUE1V?=
 =?utf-8?B?ZU95a1h2MnRvYjNwRlQ2YW1pbkF5eE43T2FvNUlITVFyQ0ttUllYZ3duU1JS?=
 =?utf-8?B?aEp1VDNRR0VQL3BzRGsyWmdoM2NaS2V5QmVIVXczS044OTFUaEpjUFI2Vm5E?=
 =?utf-8?B?RUU3NWFucnBWeGlZNkhWN25ubDdXVjVTVktEaElNOC9qNFVUTWNXSzdaVkpF?=
 =?utf-8?B?RjRMY056WHhlZTVXQ2hjTHJDMVc0YTFPUWxLYXdMSWN3d250UnE5UlJBbDhC?=
 =?utf-8?B?V1JRdHFHWWV3dFZSQ0ZBSXNQeTg3dy9wRjFHTzcxZVdFcVk1TG1HQXJVL0M1?=
 =?utf-8?B?VkMrWkw4WnNnaUJQbHZKNE14bU5hNlI0TVVsRnU3Q0lXdGwyWFhIWlNYZHll?=
 =?utf-8?B?M214VEY1N2lsaHZaUFU4ZlcvMWtXbi9HOTdQUFJ0dFVlUVJpNGl6WG1zQWl5?=
 =?utf-8?B?VHl4eHB4MmFwQ2lYVzVTS3dOQmVsaVlCM1BxQkU3cERrUU1YSEFPMzVBYkll?=
 =?utf-8?B?U3lrZVVhSmVZUFA3OEVUU3RSZ1ViRXRPTHhtSDdjNDNZRmlzT3J2Nk5RNisr?=
 =?utf-8?B?eUcrNDBVdGxVdGgybkViN2xTdE9udFpUWGdjVm1NNEpaOEZEYWgrOS9HVGR3?=
 =?utf-8?B?VmM0V3haeG94M2NjQUQ5UGQwUnVUWFBpRWJ4SUVRMEV5NlRmMGp6SGFSU2hL?=
 =?utf-8?B?czBzdHErNnB3YVQ0Q1pPamt3Mlk3czRWN0l3WHI1Mmt0YUZyNUs5K0g1MFJw?=
 =?utf-8?B?VkNlNHFQaUo2V3VneWN0ZmVUb0hEMGwvYTU3SkF0aEtvNU82ZWViZmwvL0h6?=
 =?utf-8?B?U2RaRHhmMFBXMlZFZ2JZVFpEdmpycHVvRmpzSytpUW55a1p0TmZ4b3lSODdp?=
 =?utf-8?B?VTJLM05jYkQ1cFhaUVJzbGozMDFZbTlKNlp6eGx5aUxPcWZ2d0pudHp2bXJr?=
 =?utf-8?B?OCsvdmJoWWx1L3pJdjJnckw3b295ZVFhTElyemNINmVXTjkyUkRWd3E3QzFD?=
 =?utf-8?B?dkZMcld0ZzFjWEdGaW9jYjJJa05yNjJRU0RkbHluSnFGTnlzVnFpWEY1MXdl?=
 =?utf-8?B?TFZsTEV6ZDhkM2xXMFZBK25iS2NIRjJtRWczVCtFd0RhU3E3R3U5WVJLTnI3?=
 =?utf-8?B?UWx0RHc5RXZqUDl6UCs4RmdsSzM0SEdqblZkT25ha3lLWVlxSFpTWW5waDVO?=
 =?utf-8?B?QjN3YmxFWXN5WGc1S0VZMmlGVmwvb29MWFJIOERQd1E4cEpqYlhiT21Qd0ZR?=
 =?utf-8?B?RUtvUWhwdjVBUm1ja1RvR0ViTTR6dDZnTkJFQVlYVlFIV3lIa2NXM2ZFeXNR?=
 =?utf-8?B?eCtxbCtFd3pvT2JhOVQ5Vnp4UzFvMUV3d1BlSkRoN1ZGRnJXL2FtQ2x0Y2FF?=
 =?utf-8?B?SjcyNjZVRUw5aUNEb0d4bk5kbXVnRWhkNGdMZFdBMGsvQmpLQjVQMGZtTmNk?=
 =?utf-8?B?K3NtTm5lYlVzNzlRS0VaR29aa0hhSlJkZlI4dTVPbEpvNUlRajF1c0g2MjI1?=
 =?utf-8?B?ZS9sb1o0MzJ1UnFHZ3BkZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXBmQjh2VGowNHdFOWpPZGxnczNSL1lRa1dhdmgwZktNS0NUeTBHamJ6RjBQ?=
 =?utf-8?B?QzZVdzhwZWRPY3VLY0pvVC9PUjhCNTNZVHVUTmtoT3A3a3h1Lyt1VUI3dmly?=
 =?utf-8?B?dk44YnN3ckt6SUVkVHZxZEpvVmlEZXlRcEl1Um9HM25iRjV2aWpzV3puUHBa?=
 =?utf-8?B?Tyt6azAvODhsVW8ySVc4YzJRZ3J0L3NiMWFqeXZLdVliNmZKZWMvSVdGanlL?=
 =?utf-8?B?NmNMRmVNNWgyM1NLdGN6bXhuTEx5UjE1aDJ5TkpZaTY3TnFZRk5DOTJqMmkr?=
 =?utf-8?B?WHJIRDBIQkhnMDF3Tk1wUFBkMWpPNzVVd1lTUW1mK2phUDNoQWtlaU9KZnhr?=
 =?utf-8?B?Y2QvTTNza3dWeFNlSGt2b2RGeDNmVlZiK0prdEozSHhNdDZFRlpKWlhZMnRi?=
 =?utf-8?B?OHRhbGRBTzEvdTJYYUlxRDhnN2pRdnBMZUQ4RU1sdmlDS0s3QzR4NEY1S01B?=
 =?utf-8?B?WVFVMWZydGZ3LzBVcW9rYXNyMm5ueVczQURrRTVleldnK3VJNllBcSsvbFpN?=
 =?utf-8?B?Z3hlMnpJWGZ1N29OZnJia3FCR3VWcVJraWhVVlVHTlNyWTFIK0J2ZFF5VmxT?=
 =?utf-8?B?N3FUcll1MkxxU2tTMHpEOWNEaDNsRHUwZXovSm5LNGJCVU5GMU5iNFg3ODBm?=
 =?utf-8?B?RTBjbzFzeUJkdFVyQkZ3T2FGdENuS0ZVZG5EaXF2T01Dek5LS1V6Z3pZOFJr?=
 =?utf-8?B?VTRaajBXMzhyb2hiaHNGNFltaDFOOU0wdDdoY2ZwU3MxdWJxQ1lIaTgvckVR?=
 =?utf-8?B?TU5JaUNZc0V6MVAxNVcxVklJQmhzb1R1N1N2ZStmN3Z3UmN0Znd5SklFdlU2?=
 =?utf-8?B?dFhIV3FlWTY3Yk8xZ2tvTnF3aUpuWjFlcU5UaVZBSittYUxGVlRuZ2tTQ1VS?=
 =?utf-8?B?QS92M2pOMjFMTkEramRjT0REditPTlZDclJxU0tDMTRnajZQaGVhRjlQTWpM?=
 =?utf-8?B?aWFLQ3dNNzh1WGgvd3REVEQrc3dMOWxJT1RjRFlZY0NMQ0FQNFdWZDhMNWxO?=
 =?utf-8?B?a0tSaFF3K3BhVzMzTmxkNFEwNDJhVWU5SVFSR09wZ0RQYWVmbklFNVFwVDV3?=
 =?utf-8?B?K3dpYWhUZVZMT1RSbXZlTVBQaVRlVXNHNE5DTkNUZnlEdjNndjQ0UWo3UnlR?=
 =?utf-8?B?L2dpS1Jjdkh0TlhSdzIzdEZOZkdqNkNUbkNCN25wd0Z4ais4TTVwQUoveGI1?=
 =?utf-8?B?ZmdJWDVGbFM4Z001allXRkkydk52aHVNYlJDZ0ZZZnF5cjZIS041aXVFMUx1?=
 =?utf-8?B?RWpuQXMyT0Z1NURwQkloSDdmd01rU2ZLelpJUEd3amlmOElsWUJEaFlsTlNv?=
 =?utf-8?B?cnhzamhZVThZY1lDajhzY2JULzZBbUR2dUlna2l3Mlh3YnJCOEQ0NWJkNnBS?=
 =?utf-8?B?R3hhdXZNRjd2emFrQXpXQVYvcVU5NGxnL09aZW5SaldpdGRPbDhGNlg0YXZp?=
 =?utf-8?B?ZUFJUHcwaEhJQTI3SFJCakVndWpkOEZFVzF1VDFSTW9kaWNxQStGb2hoSi9V?=
 =?utf-8?B?UlVuQnJoVFY4ZzZTQ3QvMVpxT3RFaEhpcTlxOGRoVXJzQ09ZN0xwSG1SekFD?=
 =?utf-8?B?RVlHU1lMakY0bitCdGZleEhRMXVyeURtbzdaUWNaZWJFY2xqOFJxRk84ZG1U?=
 =?utf-8?B?SEtveFFpS2o1eGJlVFAwM0x3ckg1RWZ3RGk1bXM3WEozb2xHYTNEcEFMajM1?=
 =?utf-8?B?WUt6WHM0Zys2d25SZ29jMXF4L3oxR3loUzAyd1Y1cWtPTjVYU1RpNVRsWkhN?=
 =?utf-8?B?NFB2QmVWdHB3NlM2aDZOb2k4ZUg1S1Y3MHZFT1M2VGYyY0lFYkNDMnc5ZDgv?=
 =?utf-8?B?cWZRUmp4NS9kbkJ1dmYxQ0JJM3I4dHJTcmZiaE5tblF4ME41YmtmQUdvTXlo?=
 =?utf-8?B?b2RQZlNuN2hRS2YrVmhXRWZidlkweTNzNzR1bGk2Mkg2OTlGdGhZcEpSRzNS?=
 =?utf-8?B?RkljNVV1SjRPQWNtbmh0N25GS3dNYzhDSm5HK3JRcmxEdnVvNzVOK3NEbTNO?=
 =?utf-8?B?ejlPcGdDc3lHcGljays3ZVFrcHR5dmF3QlpyWWlZLytmZDNVUTU4cEtucEky?=
 =?utf-8?B?aFlnLzgxbEczL1NzY2oyL0hOSzNOMU4vYjM2UWo1UnBFMm44QVdCckc1YUQr?=
 =?utf-8?Q?Yji6hwvopjwcHDKDsPG5jvjIc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05737265-dc0a-4d60-f762-08dd46245205
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 20:33:16.7046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIZTtsIh6keF6CcfpxFO4+hNulrDFpsjPI5fzuUZDiLx58B5l9/hAa190COO14NqGAqNCp8P/wMkZ9dfoPRs9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8112
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



On 2025-02-05 14:31, Mario Limonciello wrote:
> On 2/4/2025 17:19, Felix Kuehling wrote:
>>
>> On 2025-02-04 17:21, Mario Limonciello wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> find_system_memory() pulls out two fields from an SMBIOS type 17
>>> device and sets them on KFD devices. This however is pulling from
>>> the middle of the field in the SMBIOS device and leads to an unaligned
>>> access.
>>>
>>> Instead use a struct representation to access the members and pull
>>> out the two specific fields.
>>
>> Isn't that still an unaligned access? I don't understand the purpose of this patch.
> 
> Unless I added wrong, it looked to me that the offset it was pulling from previously was incorrect.  So I was expecting it should be aligned (and less error prone) to pull from the correct offset from a struct.

The way I see it, the offsets that were used before were correct and match the offsets in the packed structure definition. I'm annotating the offsets from the end of the header in the structure definition below as proof.

> 
>>
>> One more comment inline.
>>
>>>
>>> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.8.0.pdf p99
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 27 +++++++++++------------
>>>   drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 17 ++++++++++++++
>>>   2 files changed, 30 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>> index ceb9fb475ef13..93d3924dfcba0 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>> @@ -968,24 +968,23 @@ static void kfd_update_system_properties(void)
>>>       up_read(&topology_lock);
>>>   }
>>>   -static void find_system_memory(const struct dmi_header *dm,
>>> -    void *private)
>>> +static void find_system_memory(const struct dmi_header *dm, void *private)
>>>   {
>>> +    struct dmi_mem_device *memdev = (struct dmi_mem_device *)(dm);
>>
>> I think it would be cleaner to use container_of to get a pointer to the structure containing the header.
> 
> Ack.
> 
>>
>> Regards,
>>    Felix
>>
>>>       struct kfd_mem_properties *mem;
>>> -    u16 mem_width, mem_clock;
>>>       struct kfd_topology_device *kdev =
>>>           (struct kfd_topology_device *)private;
>>> -    const u8 *dmi_data = (const u8 *)(dm + 1);
>>> -
>>> -    if (dm->type == DMI_ENTRY_MEM_DEVICE && dm->length >= 0x15) {
>>> -        mem_width = (u16)(*(const u16 *)(dmi_data + 0x6));
>>> -        mem_clock = (u16)(*(const u16 *)(dmi_data + 0x11));
>>> -        list_for_each_entry(mem, &kdev->mem_props, list) {
>>> -            if (mem_width != 0xFFFF && mem_width != 0)
>>> -                mem->width = mem_width;
>>> -            if (mem_clock != 0)
>>> -                mem->mem_clk_max = mem_clock;
>>> -        }
>>> +
>>> +    if (memdev->header.type != DMI_ENTRY_MEM_DEVICE)
>>> +        return;
>>> +    if (memdev->header.length < sizeof(struct dmi_mem_device))
>>> +        return;
>>> +
>>> +    list_for_each_entry(mem, &kdev->mem_props, list) {
>>> +        if (memdev->total_width != 0xFFFF && memdev->total_width != 0)
>>> +            mem->width = memdev->total_width;
>>> +        if (memdev->speed != 0)
>>> +            mem->mem_clk_max = memdev->speed;
>>>       }
>>>   }
>>>   diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>> index 155b5c410af16..f06c9db7ddde9 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>> @@ -24,6 +24,7 @@
>>>   #ifndef __KFD_TOPOLOGY_H__
>>>   #define __KFD_TOPOLOGY_H__
>>>   +#include <linux/dmi.h>
>>>   #include <linux/types.h>
>>>   #include <linux/list.h>
>>>   #include <linux/kfd_sysfs.h>
>>> @@ -179,6 +180,22 @@ struct kfd_system_properties {
>>>       struct attribute    attr_props;
>>>   };
>>>   +struct dmi_mem_device {
>>> +    struct dmi_header header;

Comments below to annotate the byte offset of each field from the end of the header.

>>> +    u16 physical_handle; // 0x0
>>> +    u16 error_handle;    // 0x2
>>> +    u16 total_width;     // 0x4
>>> +    u16 data_width;      // 0x6 (matches the original code)
>>> +    u16 size;            // 0x8
>>> +    u8 form_factor;      // 0xa
>>> +    u8 device_set;       // 0xb
>>> +    u8 device_locator;   // 0xc
>>> +    u8 bank_locator;     // 0xd
>>> +    u8 memory_type;      // 0xe
>>> +    u16 type_detail;     // 0xf
>>> +    u16 speed;           // 0x11 (matches the original code)
>>> +} __packed;

The bottom line is, this patch doesn't change anything about which DMI data is accessed. It's still an unaligned access. Now I think your patch is still a decent cleanup. But the justification in the commit description doesn't make sense.

Regards,
  Felix

>>> +
>>>   struct kfd_topology_device *kfd_create_topology_device(
>>>           struct list_head *device_list);
>>>   void kfd_release_topology_device_list(struct list_head *device_list);
>>
> 

