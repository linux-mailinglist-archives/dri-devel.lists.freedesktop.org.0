Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC141908F6E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 17:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B2610E107;
	Fri, 14 Jun 2024 15:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LT6u8QFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9340310E107;
 Fri, 14 Jun 2024 15:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvesrJbfcEQjagUHHx/wrIBT+ZIo0p23JJxJ5/0FkAmNbfTCgIbeOUSkQi/7DLN9q+E/+l0GcQyrGQFDu1ubyZISINZfkk4Pb/KhpFjUE6mUXkVNxPSNWjXuq8gS4jnRvjDODU+9oBDuWyAev6CXC/00LMgST0FYpe3RS/Kz2RS9Q8KH9xHbQZynHGAnBcYQUDu7aelhzPr6i/dzT7ticCNe9f4lZ6as5mVVkldgUQvKarBy3t/oDbJh//+7p7XZiO5rOLjcvs7TMiuGpy0rJ+5xtM3mILBnR5VSO+wLxFFmJ7yQhFGD1XMRbmQ68oQ72n2WXfuu//ovjCMS890XZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdQknaGDFOMocVoe4+tnoaeHFsAs1eOZOLLCLTBovBQ=;
 b=ZRHUY8itJQBExmOKiWaRUl+uiS4FaS4xseJJDgESwXAjEM7xLu+mpNZPPYATp6RgVYPnjmweRNA3LnDOak/LAzkRrtGGaXQsDZZOMJDGoYcqyq9PXh3WIZ+PSevbrydlGbVPJpKnOJuMyboGrFa3uVszjie3h2w+lKVpcEYeppina6KgDO5lyJDm+RjjPysmObn7w1Y13D96vInRqCqz1ROMXR5xRdra6bf5u6Vqveez/JgC6h8ElzHyhY7NSQefwDoPWffLIn8EZDbDoWGv1L83LGpBCgYthLS32jLZ/ultLX/r+bh7lveVqzMsUrSIM2ZXMVqBoK/nP1OE5FlIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdQknaGDFOMocVoe4+tnoaeHFsAs1eOZOLLCLTBovBQ=;
 b=LT6u8QFSmJqcK2WMvyvMYHe8oOVs7mTu7Td5iTfEO+QaGhZ+J6FCAF6V0RccSPw/hmbbN6FWC4vdGat9tq7FLA9KdtrdYLF1Yk03eli/3fWBv8q7SPJvBbv3IAsUnvb5BJ6fy0XHNL4f2bsJ3+rtokSlUsGO/Y1PxcThJ1RDjyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 15:56:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 15:56:00 +0000
Message-ID: <c11cc0b7-7504-495b-a5c2-a907666895ea@amd.com>
Date: Fri, 14 Jun 2024 11:55:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Increase frame-larger-than warning limit
To: Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: alexander.deucher@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Qingqing.Zhuo@amd.com, hamza.mahfooz@amd.com,
 chenhuacai@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20240603222948.GB1802995@thelio-3990X>
 <mhng-f1fc5ef0-9e72-4b12-9a28-145bbc8938d8@palmer-ri-x1c9a>
 <20240613222225.GA1849801@thelio-3990X>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240613222225.GA1849801@thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: f71cdeeb-e9be-4067-53b7-08dc8c8a7caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2x5QndPaGVMVUlRdG4rL3BGNUozY1JFT0VzeVV5RXdveGZpR1gyNUNnVXlP?=
 =?utf-8?B?UXhCSGhGR0kxRjNtZW51WENqd00vdzg2VXR4S2VySnlSZFRyQUJOV0Jpb3A5?=
 =?utf-8?B?V3hsbHRhemtzSGFjZDlrWTNpcFBzeFhWWHg3a3lsYkx0Rm5uYlVvUEk0cVhj?=
 =?utf-8?B?OGpBYS9VeG1BUEQycUJNZ3B6d3JzS0xLd2xnUUEwbTVWRmhaNmx3aCtmaGRs?=
 =?utf-8?B?QTVLOGpqRjBaaWRvVUR1b0gySFJseVQ0WlZTUzl6OG5hdys1VHVlc2RxckF1?=
 =?utf-8?B?MjM0WGVKTHFnTTBjWGR6NExPSTA5WTFEK1RQOTV0Y215MHhDYlh6YkRvaVZW?=
 =?utf-8?B?YjFQZmJ0SmJmbFV6bVpwbnNUNlQxR3dMbUwwTDdUeHBrZnZBN2p2UUdIRzB0?=
 =?utf-8?B?Tk5YV3QxT0NxNExMZjhSYzFnamYva3N1UUwyb0NENnRFSmNDWklDV2hqejdG?=
 =?utf-8?B?dmJza3BPV0tBV0E0R2d2RHZqVGY5VmxEa2dUaDY5RUZxb0ZFV1RhL2dKeWc2?=
 =?utf-8?B?Tng2eTZKZ3pmTGdWMkhsQ05VWUVTVlA0azl4eXdZN2FlY1ZVUlI1OUt3QzZX?=
 =?utf-8?B?Z1FtMnZtajF1M1pVOVF0QlFIMnJoNHdxSk9FMDlkQ3MwUWMyNWltYURYQWRq?=
 =?utf-8?B?aVYwelpFbUN5ME5LYUZoeHVsQkpBMlV1b25HUnNzZXJHd0hwajcrQVo4R0ZC?=
 =?utf-8?B?WkVVOHNRSUQ0WCtzWHFMU3JMcFhDcjVLaWJhZ2FMQVp5cWUvQmdKK25Md09y?=
 =?utf-8?B?RUpiU1djOG5ldlVRT2tzSFQ4dWhkNXZDMVVhT1lZS2NSRTJ0enFmcm54WCtp?=
 =?utf-8?B?c1czRkF6engyMHFNc3ZESnIvcFloOVJHL004N3U4QTA3Vjc1UlhzTWRpc1g4?=
 =?utf-8?B?dTBjR1M3MnlwRitqVmcrSHZGaDRWMGJaM2FCcFZGeU14emh5dlVGQlZ0c0VR?=
 =?utf-8?B?VWJ1RUN1SGxjNVRJN084RnR0SDUzbHNDTlZCbWQreFRreldIaGxDY1NpNmN6?=
 =?utf-8?B?QVBBQTFmd2owY1FwN21rcGtOakdYaDh5TDFJdXBCc09xZmVsbkRmK1lUcjRv?=
 =?utf-8?B?dnpTeVVPZmx1ZkRFZ0hudWlnc0dWcjlzK2p0bWlZTi9KUnY4R3diLzVnVDRm?=
 =?utf-8?B?a2NsaUxwYTFzTFRZOGx1dW5qMlVLU0xNWTB4ODBGQVdOUy85ZHd2Vm1TZzN5?=
 =?utf-8?B?Y3RIR001NnlvMm90N1EyQUxMTmNnbVdLeC9aM1VyZnB1WENnOXkwQk5jOG5y?=
 =?utf-8?B?UEtTeHZqMEhaODhvamFMQUgyNU1NYVYwTHNHeCtGNi9FbUkrMitCTk4vTGpk?=
 =?utf-8?B?eG8xZkVvMG5rcXZyaUpKZ3VITjhROTNEdkNMT1F4N1Zyc253dEo5cVYxK0NO?=
 =?utf-8?B?bWQreFhTUWVkemsyVTNqRE5ZM05PazRvclRUNG9BU1hLUDd3aEJ3M25iVFFE?=
 =?utf-8?B?SUJMV2EvZHNDMndPdkhjSnF4SFBtOS8raHZPQ3VKVWlIaUNxS3EzenE5dHkx?=
 =?utf-8?B?T1lObjB6dGJCMkV3d2YwRGNNaWx4SWZDQlFNUk1lWkVybXkyalhUem1ZZXR3?=
 =?utf-8?B?MHlIREViV0ZkMW1DSEk1aUNOWDJxc3YvbVlwWkNNOUk0NTdNZG9jZXZTZEJy?=
 =?utf-8?B?NWVvUW11aG41TDREbWRFU0g2Z3YvSTBna1dhdDEwTDF4bUFrT2JFNVNUWURD?=
 =?utf-8?B?d29XZXo1dmlmQWVudEZuZzd0ZDVRNTVPR1pkVWNMUWcycEo5amxDV2lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dRK3p2YUxpVDFVT29sR1BwSHBVUldJWStnMHZSYlZ4cm1vbFpTWk4xaU9W?=
 =?utf-8?B?azBCdUtxQzBwNVJIU3dPL3lCbEpKUVdTR3ZTeXQxVjdha3B4ZWg4U0szVGVx?=
 =?utf-8?B?THNMOGN6b05DdkIyN0IyVUdtamtib1RsMHdvK2lhRWpLenlCeTBzdmFVbk1Z?=
 =?utf-8?B?c01xWmJJSmFoSlJSTEhNZnhRT1dtK2VTK0hKREZuOXJwenEwOC8rQ1RlVko0?=
 =?utf-8?B?NGtSS3ZFcXZLSmIzZXBvRmhiRVNsNDJRbFFWa3lETVFWaU9LMk9nUEcxU2F5?=
 =?utf-8?B?SG4zZUdLK1VBbEVnSjlYcWFBUlVHQmdrd21yR09kM2xNTFBKemYzblZnUDQx?=
 =?utf-8?B?NDNQK0Z1UGllSTFVTE5JdHVqZytjWVJGdE1RU1cyVWhzcytocklXU0ZIbzRR?=
 =?utf-8?B?TVo2aFhpU2dOQjdiVW00NXIyQ04rSHJxek02NkEvaTJuR29tQjZJRVpZc0tN?=
 =?utf-8?B?ajQvT1dJeXlWcDh5a0VvS3hEZFVaY3llVy95OTlmdWxXVHR5R3hGODNEU3Fr?=
 =?utf-8?B?Z3BBV1hXSGNoWjJsaTIyR0xGQ1JPR25RTU1TK3lkYzZsTldKQUErMHhxTHBy?=
 =?utf-8?B?em1FZ2JKYjlyWU82ZUJPaVBiUnFvR1BRQXRLMllHN0RobHl4RFJMaHBzWTVM?=
 =?utf-8?B?ZW54d2RvNVFmSjZtWkZSWGtyczMvN252WlhVWGZIVk5QbGk2NWhoU290bmg2?=
 =?utf-8?B?MTNHRE95cG1ZandaWWZiSHZQR01abFB2dm10bEQrbkFON0lZM01kbXFGM1hJ?=
 =?utf-8?B?bUR5aVhncGpna2Y3UjZybDRmNmwxYTFxVSszdjdGcWpQWWV2RFZZYjMrWXZ0?=
 =?utf-8?B?LzZ6LzhnRVRtVlVTaDE0RUViNThvdjFoYkd0TFFvQWRobG1pbitpWUZKQkVT?=
 =?utf-8?B?SlpTeUpOeGFYYzg4R0hyZ3lJeFI2VDRKbFgzVDJGOHI3K3hUMm1xM1Bqck1y?=
 =?utf-8?B?dU5wT1hNRVRlSUpFNmhGU3VlQ1BXa1pwSW1CUUFWbVo4eDlJVUE1Z3h5ZzFw?=
 =?utf-8?B?RzFhUHMyUkdCMnV1QWdkaUJKbEdCYlM3TGFmTkloMmdIK21zdXNhL3FsZXYr?=
 =?utf-8?B?czNCRldianYzb0NXdCtvSGYwT0xXdkl3b0ZIU1dBSytkaW5nRUhSQmhMMW1Z?=
 =?utf-8?B?RElvSk5sSk45UXJkcDhZY08wZVpZTWIrTHRXSHAwNE1ZbE5XYlJRR3d5Zi9l?=
 =?utf-8?B?eHFmWDJ6TlEycFY5Tnl5WE5IcStvUGlsMHZCalZ5YlhIM1VXZDhFWlVocUlx?=
 =?utf-8?B?VTFqTVkwbDV1TEFSNFVXVVRyWkxvQVJtdDdoTkJvbE1obUpXNSt3cWVZRlhi?=
 =?utf-8?B?UDA4MEpaOFFVZTNSYWZBZFVnUDFZUUNmaXBQVW44VFFvcE9SN0ZjQ2JoUmN2?=
 =?utf-8?B?Ump2TmRwa1c4RUljQWwxSC9iU2hjNklzVE9aNlZpdTY4YUZoWCtraktXSk11?=
 =?utf-8?B?aDQreE42MFJCL0RGK2JHMTl4MkRwcEV6eE5jWjdUdUdRajJYSHBSajNXVGVJ?=
 =?utf-8?B?NDJrd3I3cVo4dnAxcXVDY05HK2wwZmkvdTRwM2RjNHhFeitWVkJ0ZUFSK3Zq?=
 =?utf-8?B?cWpPdlZMWm1SN1REN1BleDVSaEhJL05LNENDVkxrMldWd3dxQW9NaDhzT2Vw?=
 =?utf-8?B?bkNwbVdiVk5UcmxMelhjWm9zZGI1MWNwWDNJYVFZandHS2pmUllHZmJuMFVs?=
 =?utf-8?B?cFJWMU0rZUlzMHlla1pGZVZPOXRMNFlVMGlDS0NyUE04alIzV2dCMFpPaE1i?=
 =?utf-8?B?MGg5S0FWVVBETzdOdlV0VXBMVXEwUmtuYjJVRUhuREtWeUdHL3N2SjltNHBo?=
 =?utf-8?B?Y3FybFpYbFR4QVpQL1VQMXd4M1dtVnkyWFU4MzYxSWQvTkZOYTRxQUpjUkpX?=
 =?utf-8?B?d1RqMXo3emhraFdIc3NTTGZWWGZSZC9BMWtyZTRFUlA4UFcweER4OEw0Qklr?=
 =?utf-8?B?R045ZHJ0UkZ6Y1kxQnd0enVReC85aUlRNzNHbjhlSlNpVlN3ZUlkUGp0MCth?=
 =?utf-8?B?K1Y4RzllTnpTaWxMcW15K2wrZ2pLSVN0LzVWRDhDUExIV1hWZ1hHN1NwMjE5?=
 =?utf-8?B?K0pVM2owazRDUVJlTXIvM2RORlFWRXlKaU4xREo3UFlmR2gzcjl5TndtRExL?=
 =?utf-8?Q?aMQS9syDaMlHtWEhq1XDzUEWL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71cdeeb-e9be-4067-53b7-08dc8c8a7caa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 15:56:00.7065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WtEYdh4UtakF4v/RXGr1UyYnjvu8eY3aaGiYy1uCVpzoH5IgWLArifI4k4siHu7wdrIvYlAXjoDIo1VehnW2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
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



On 2024-06-13 18:22, Nathan Chancellor wrote:
> Hi Palmer (and AMD folks),
> 
> On Tue, Jun 04, 2024 at 09:04:23AM -0700, Palmer Dabbelt wrote:
>> On Mon, 03 Jun 2024 15:29:48 PDT (-0700), nathan@kernel.org wrote:
>>> On Thu, May 30, 2024 at 07:57:42AM -0700, Palmer Dabbelt wrote:
>>>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>>>
>>>> I get a handful of build errors along the lines of
>>>>
>>>>     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: error: stack frame size (2352) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Werror,-Wframe-larger-than]
>>>>     static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
>>>>                 ^
>>>>     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1724:6: error: stack frame size (2096) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>>>>     void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>>>          ^
>>>
>>> Judging from the message, this is clang/LLVM? What version?
>>
>> Yes, LLVM.  Looks like I'm on 16.0.6.  Probably time for an update, so I'll
>> give it a shot.
> 
> FWIW, I can reproduce this with tip of tree, I was just curious in case
> that ended up mattering.
> 
>>> I assume
>>> this showed up in 6.10-rc1 because of commit 77acc6b55ae4 ("riscv: add
>>> support for kernel-mode FPU"), which allows this driver to be built for
>>> RISC-V.
>>
>> Seems reasonable.  This didn't show up until post-merge, not 100% sure why.
>> I didn't really dig any farther.
> 
> Perhaps you fast forwarded your tree to include that commit?
> 
>>> Is this allmodconfig or some other configuration?
>>
>> IIRC both "allmodconfig" and "allyesconfig" show it, but I don't have a
>> build tree sitting around to be 100% sure.
> 
> Yeah, allmodconfig triggers it.
> 
> I was able to come up with a "trivial" reproducer using cvise (attached
> to this mail if you are curious) that has worse stack usage by a rough
> factor of 2:
> 
>   $ clang --target=riscv64-linux-gnu -O2 -Wall -Wframe-larger-than=512 -c -o /dev/null display_mode_vba_32.i
>   display_mode_vba_32.i:598:6: warning: stack frame size (1264) exceeds limit (512) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
>     598 | void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() {
>         |      ^
>   1 warning generated.
> 
>   $ riscv64-linux-gcc -O2 -Wall -Wframe-larger-than=512 -c -o /dev/null display_mode_vba_32.i
>   display_mode_vba_32.i: In function 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation':
>   display_mode_vba_32.i:1729:1: warning: the frame size of 528 bytes is larger than 512 bytes [-Wframe-larger-than=]
>    1729 | }
>         | ^
> 
> I have not done too much further investigation but this is almost
> certainly the same issue that has come up before [1][2] with the AMD
> display code using functions with a large number of parameters, such
> that they have to passed on the stack, coupled with inlining (if I
> remember correctly, LLVM gives more of an inlining discount the less a
> function is used in a file).
> 
> While clang does poorly with that code, I am not interested in
> continuing to fix this code new hardware revision after new hardware
> revision. We could just avoid this code like we do for arm64 for a
> similar reason:
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 5fcd4f778dc3..64df713df878 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>  	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
>  	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> -	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 || !CC_IS_CLANG)
> +	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!(ARM64 || RISCV) || !CC_IS_CLANG)
>  	help
>  	  Choose this option if you want to use the new display engine
>  	  support for AMDGPU. This adds required support for Vega and
> 

This makes sense to me. I'll be happy to provide an RB if you send a patch.

Harry

> [1]: https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
> [2]: https://lore.kernel.org/20220830203409.3491379-1-nathan@kernel.org/
> 
> Cheers,
> Nathan

