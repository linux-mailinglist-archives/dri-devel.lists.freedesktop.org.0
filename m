Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AAE6C6A54
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 15:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868A010EAA9;
	Thu, 23 Mar 2023 14:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AD110E0D8;
 Thu, 23 Mar 2023 14:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpdaudWFRcBR7zdRBjNGAOpuFT1AAWw4C+qf383l5vmDemB7bd25CAk9i+fQ1JC30R7USEUsTZsPfttYPg5CGKQxfq6Y2WMKKBtsfTOPc+wjhvsa5eq0o1qfyRF/fsQdmy6kzAi1/mQWNo8XS0P4Xco4QMo6jyhxu5JPmU/62BLNAX1kb2LmwbWZw6fjfp2uVRJ38i3cz1+P7+azvesU2BxQS2QvtX6Thzzvn43OYsGTefgbSt2HJ6IXyJdF2Hi9totHBI6KzVgYzpfoCB8md8v0ISJpB/4bw7+hwLVxh9CpYOmhI4fh7VPWCQ3mKp0WOOtw52JCQ1xKs1nil5rmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LFsMmD+KjlkXbHOF9wBDesHzgfttEtAMGzOmk1T9vg=;
 b=JoWuY/mKpjCY2mls8MxSuaYYjU4+U8y7TRklKC6MAVIBFcFtfU3QmZWbf9k3n8gukOcysL/nASubiO7WbdNPGXZqEYREFe859il4YO61Z9KvXXQb/FtQ4Dcpr36wvCnMgB5a+BwM/xQWVQx7XiHeD8Mg8DGokXBonrsZmq9aYNfOjKm16uZfxokhpnLylz1dgcxX55jCH99fMGIPmNccVTYiB/ilxpzMdWqmU5AAzli0IGSi5gMyC0n7+Q8oAcwv86vLRME9Ul+5YW+6nmWwvjKJduaLj7LVADlCcZWhcQvKccJf3QlZ1w5gy4SJmMVpFDFD5uLHGYFUmEV7v2cHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LFsMmD+KjlkXbHOF9wBDesHzgfttEtAMGzOmk1T9vg=;
 b=X3QEWxyU1/YrnCzBbbJ7KewaPOWmRP3m3ejh3BRxNujpa0OJ5OF4rFGYopVn9M58X7A3jMeyU3xd24TJcwW4w3gY1vOKc+12wuQB8yJ42rGZGLK0p7oQiT9j3jBZseLw4VPb4wcu/jvX1/DreS4wlPcTOU86yKbPodKvCJZohJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7854.namprd12.prod.outlook.com (2603:10b6:806:32b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 14:00:33 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 14:00:33 +0000
Message-ID: <d903e74a-428a-e854-7944-879f1af08b1f@amd.com>
Date: Thu, 23 Mar 2023 10:00:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/32] drm/amdkfd: prepare trap workaround for gfx11
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-16-jonathan.kim@amd.com>
 <3b49982c-b339-3b43-afcb-e6f48b8fb70e@amd.com>
 <CY8PR12MB7435CD78C62BCF8DF1A2B64385879@CY8PR12MB7435.namprd12.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <CY8PR12MB7435CD78C62BCF8DF1A2B64385879@CY8PR12MB7435.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ab860d-98c5-4d96-4fc4-08db2ba6f809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MHjKVF/nCOf0e5EMmayAhk0NSTULPe/te23M47Oql2pGF0rlbzHROh5ke2yiq8M+LrIENtS8ZocwQHlZiLqssaJwmPQ2Q4WKICrI1YEPUBQVaNuKUpRJWuqChZNwsLDPM3KPhuSoz3mtotSPofgsI8as+goSQnLt6Wdg0tDsYBXCKMLV6xqgiz7FxwH1senKHZXPP5BkwKRHbajphN2TUTQFPF6Ag4AyKt+nou+J1Cj1IjUvaZOJhRmXejBdFNXIrQg6Nwx7MKRTzyeCzCtq2ugPmRzA8V288HxJmn8h8asBQ1AUCFd9wL8IXRz1zfJqDwNwIzh05K6NFljEV7leOdhVXAR0n15D38nicc3v3AGzZ35DV3Ed4S4FZy3k44V5pNMxKhkcLgqyHsacU5/dWT6nV8ZLrWbU30z5Oeo1syNA5Yx4+Z+agmz2O8pRfOhZiCz62Fy9eujakqk5QiqRFiW3/wbCXh64OjomLX99AMqG9Q5BbCTbfAH3li7kDvtyzZB3OoPrh8ZOdmcBOj5+KgV1z3yvH70c4W4g/b/Mve+ZMg6G0eoUR6JxqFLJjjBHTED0ATjocDj7qJFD85AAMcS9rn10T1JtNQPJ0sVFTzzht3gTIr2CUvrnmyPqnkvQc7YtmD9FqNPdP0NhGnHEVwaMEOQzixtA2YscxS7PiczLNfqBDk0UCh/KPP+7x5gi/+OBmmN273E69kJsjz+eGWi/HovFy47322DEcwRLq3d4hKoWndHbtjQnWizo7bQe3tEO/XC6BBiWsG/cGJckQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199018)(31686004)(30864003)(41300700001)(66556008)(5660300002)(66476007)(2906002)(44832011)(8676002)(86362001)(31696002)(36756003)(38100700002)(6486002)(26005)(450100002)(110136005)(478600001)(316002)(8936002)(66946007)(83380400001)(6512007)(6506007)(2616005)(186003)(53546011)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JaK1NkK2QvZWdZdkpONWM0UWF3MS9VK2trWURjR0wzNW02SHFmdmh6azB1?=
 =?utf-8?B?V3dkaE5aeGpGQVdYSjNoMmwyR0NDWXpGQWhtNVBBWGZtNjRubUkxMUhzUWxB?=
 =?utf-8?B?NjY2cHNwbWxuUlh4eXVBcHZ4NEdJZVNOQ3VPWmMycjRPZ042TkNUU3l6STJ2?=
 =?utf-8?B?bmZ5d1Q5TVBWYTFrZ0RZdFhSbmdNc3k3cng3SWdUZVdFNkk1UjlwL24yR1JW?=
 =?utf-8?B?T254UXp0ZDNBZCtWKy9pbGFHMTJLN1ErQXdrQnlTdHZEeEk3R1c4L1EvY3pa?=
 =?utf-8?B?RlUxNXNqakZKbTNlRFBQZXR1MkNOZnppMU5NNEYwVGFXWUZqM2tLMFU0czRn?=
 =?utf-8?B?RXVKL0JONDRRUDJiaFU3MzQxL2xYTDVCRFFlU05HcjhLQmpxbWRvbjQrUlRJ?=
 =?utf-8?B?Ly9Ddm0vRXdTb3BKaUl2Z0hJdUFBb3dHbGpqSFcrMVFOZDdVNGVuMmJlRkwy?=
 =?utf-8?B?bHB5V3ZZMUMvcGdUZUt0cDZ0VVBhUHNnL0pod0hCYW1zVEFZQ0k0MDk5M3FU?=
 =?utf-8?B?UEJ5UGNrWnZsVHZHRDBIckxQbHdZQzBxSmxsM1IzdUQ5TC8wb3UrWWFOTThw?=
 =?utf-8?B?c2w0MEg5Nkc4aVlDckJLOGlXaGdvV0FDWjlQMHB3bnFDejRJanBicms2eTNP?=
 =?utf-8?B?VUgvMGxlNXhNbkJGWUliZ0lxY0M5Y3hUT0VwcEV1dU8wTUV1M0JmWVd0Tmxy?=
 =?utf-8?B?VHRMWVdMK3djTWxhSXZwYTNtdDBXS3RtdjArQWxWYXNsbDU4NWhEZkdWTGo5?=
 =?utf-8?B?dzlvc2VSd0tDakttOHN5REQ1K0tHcDhZeDJhRVRkbitCdTdNakVuMFpZbkdm?=
 =?utf-8?B?UGRGT01rT25zcW9GRzhRMWlXWiszWWRzbm9uMnJ6Yllsa3ExSTNCRXhHRzdN?=
 =?utf-8?B?c2VnSzFJdkpHMEdPZVlLdE9pU1BZS3dTYWtPY042cEpJcU5KUk9jLzgyaDJY?=
 =?utf-8?B?Q0xHNjluK1F4WFoyRDkzczRKb2tCaUttZjRTOTNSbVZ3MkN2eFVjeE9WMTda?=
 =?utf-8?B?RE1CVExzTmoxTTBHTDhGUStxVWRMajFTQ21MbEF5QmRoOGZ0bXk3NWw5T0t3?=
 =?utf-8?B?Ylo2OWh1R1dwYkR6Y2V1cVU4eG9laW1SU3hxSTV6alN5SGQ1anRGOE9ROGtF?=
 =?utf-8?B?UlBJZkFUTVBzeEd0QVpFNzNKZ1QrMElEODNLMGFiVURKdlB2bldGbUJtOWhx?=
 =?utf-8?B?dld5MW52UW52Mm5IMHRqT1BlS1RqWkZwZWMwOFE2ZmdFVlZBNjgwbGxZMEVH?=
 =?utf-8?B?WW1PRitQbFplMGErQjhURDJDZllpaTRuYm54MG5jVXB3RWRjQ2Y0VGk0am9X?=
 =?utf-8?B?NWMzNzFvK1c1cTJMak81UkdHMXl5UmNvMXV4cHN3YkU4VmVLQ1YwaUw4MG44?=
 =?utf-8?B?MVp6RG5QT2prSDJBOGtVMmlHVFRMYjBuN0ZkUjhaVS9NL052eW94KzIvekVL?=
 =?utf-8?B?TERnTVRWUWpuK2hMWlEzaEsrUU4wMmt0all2UDVMM0ZFazl3SkV5V2d6eWxC?=
 =?utf-8?B?Z3pNcFpVN2pRRDhsTFJ0S2pJWmNUWFExUVF0Z21JU0xNdVViZTVPT1VJOWwv?=
 =?utf-8?B?V29CNUN6bEhMTnJWS2tTcnZHU3p6b2J4L1ZQcnVkLzkwV3pjeWpNR1B3R1NK?=
 =?utf-8?B?V3d2Y0lBOXY0WjRtQTJOTGg3ZlM1NW9oR082NXVrbzVzRkdsRUhFMndMNEkx?=
 =?utf-8?B?emJpNjJsdHVWN09JSXRsdGE4WXREa2I3Mzd2NC9XREVRNmw4NjNJOW5RSDVZ?=
 =?utf-8?B?WlpYNCtoeVBlQWlUaTE1Um9nanZNa05CMkZYVVNTa0hBY3FOd1JwWTUxd3R2?=
 =?utf-8?B?aEhVcTU2eC90UnZySEdBK3dZcmxhTCs5RGo3K0FXQzBadVhaalVkKzFyZSt4?=
 =?utf-8?B?ejRtMWN3L25XOFVOc1g3NEU2ZDljd2NWZUpaNVFtOEwybmtJOCtDcFJrSjBV?=
 =?utf-8?B?REtMajNnM3lBLzQvdEVtdWs4R1VRTDZxcEFnRlNjUTkyMzEzU0RwQ096Sk1Y?=
 =?utf-8?B?K3M2aWVUbmd0bjVncGpZSGN4TEFXZWc2ZGxRTC9tRURzY2ZUSWNObWdNTWdF?=
 =?utf-8?B?VGJtTW9ERnhqU1lJN1NiWmlWTFlvcjZ5VGQ5K0dod1kyUCtXOVRyT01wczJ0?=
 =?utf-8?Q?9m7L91AXQYrftBBSkr1biTwxf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ab860d-98c5-4d96-4fc4-08db2ba6f809
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:00:33.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGpQrVAPtxfYdkTWFjiHJPvny+5PiDq1hURtsf14rAOaVm8N8KEa59wu9VpJ509ZPQlp0Yks68oW733y1Ii0OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7854
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


Am 2023-03-23 um 09:50 schrieb Kim, Jonathan:
> [Public]
>
>> -----Original Message-----
>> From: Kuehling, Felix <Felix.Kuehling@amd.com>
>> Sent: Monday, March 20, 2023 5:50 PM
>> To: Kim, Jonathan <Jonathan.Kim@amd.com>; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH 15/32] drm/amdkfd: prepare trap workaround for gfx11
>>
>>
>> On 2023-01-25 14:53, Jonathan Kim wrote:
>>> Due to a HW bug, waves in only half the shader arrays can enter trap.
>>>
>>> When starting a debug session, relocate all waves to the first shader
>>> array of each shader engine and mask off the 2nd shader array as
>>> unavailable.
>>>
>>> When ending a debug session, re-enable the 2nd shader array per
>>> shader engine.
>>>
>>> User CU masking per queue cannot be guaranteed to remain functional
>>> if requested during debugging (e.g. user cu mask requests only 2nd shader
>>> array as an available resource leading to zero HW resources available)
>>> nor can runtime be alerted of any of these changes during execution.
>>>
>>> Make user CU masking and debugging mutual exclusive with respect to
>>> availability.
>>>
>>> If the debugger tries to attach to a process with a user cu masked
>>> queue, return the runtime status as enabled but busy.
>>>
>>> If the debugger tries to attach and fails to reallocate queue waves to
>>> the first shader array of each shader engine, return the runtime status
>>> as enabled but with an error.
>>>
>>> In addition, like any other mutli-process debug supported devices,
>>> disable trap temporary setup per-process to avoid performance impact
>> from
>>> setup overhead.
>>>
>>> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |  2 +
>>>    drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  7 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 -
>>>    drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 64
>> +++++++++++++++++++
>>>    drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  3 +-
>>>    .../drm/amd/amdkfd/kfd_device_queue_manager.c |  7 ++
>>>    .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  3 +-
>>>    .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  3 +-
>>>    .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  | 42 ++++++++----
>>>    .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  3 +-
>>>    .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  3 +-
>>>    drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +-
>>>    .../amd/amdkfd/kfd_process_queue_manager.c    |  9 ++-
>>>    13 files changed, 124 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
>>> index d20df0cf0d88..b5f5eed2b5ef 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
>>> @@ -219,6 +219,8 @@ struct mes_add_queue_input {
>>>      uint32_t        gws_size;
>>>      uint64_t        tba_addr;
>>>      uint64_t        tma_addr;
>>> +   uint32_t        trap_en;
>>> +   uint32_t        skip_process_ctx_clear;
>>>      uint32_t        is_kfd_process;
>>>      uint32_t        is_aql_queue;
>>>      uint32_t        queue_size;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
>> b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
>>> index fbacdc42efac..38c7a0cbf264 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
>>> @@ -197,17 +197,14 @@ static int mes_v11_0_add_hw_queue(struct
>> amdgpu_mes *mes,
>>>      mes_add_queue_pkt.gws_size = input->gws_size;
>>>      mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
>>>      mes_add_queue_pkt.tma_addr = input->tma_addr;
>>> +   mes_add_queue_pkt.trap_en = input->trap_en;
>>> +   mes_add_queue_pkt.skip_process_ctx_clear = input-
>>> skip_process_ctx_clear;
>>>      mes_add_queue_pkt.is_kfd_process = input->is_kfd_process;
>>>
>>>      /* For KFD, gds_size is re-used for queue size (needed in MES for AQL
>> queues) */
>>>      mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
>>>      mes_add_queue_pkt.gds_size = input->queue_size;
>>>
>>> -   if (!(((adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) >=
>> 4) &&
>>> -             (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 0))
>> &&
>>> -             (adev->ip_versions[GC_HWIP][0] <= IP_VERSION(11, 0, 3))))
>>> -           mes_add_queue_pkt.trap_en = 1;
>>> -
>>>      /* For KFD, gds_size is re-used for queue size (needed in MES for AQL
>> queues) */
>>>      mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
>>>      mes_add_queue_pkt.gds_size = input->queue_size;
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> index ee05c2e54ef6..f5f639de28f0 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> @@ -530,8 +530,6 @@ static int kfd_ioctl_set_cu_mask(struct file *filp,
>> struct kfd_process *p,
>>>              goto out;
>>>      }
>>>
>>> -   minfo.update_flag = UPDATE_FLAG_CU_MASK;
>>> -
>>>      mutex_lock(&p->mutex);
>>>
>>>      retval = pqm_update_mqd(&p->pqm, args->queue_id, &minfo);
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
>>> index f6ea6db266b4..6e99a0160275 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
>>> @@ -37,6 +37,70 @@ void debug_event_write_work_handler(struct
>> work_struct *work)
>>>      kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
>>>    }
>>>
>>> +static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
>>> +{
>>> +   struct mqd_update_info minfo = {0};
>>> +   int err;
>>> +
>>> +   if (!q || (!q->properties.is_dbg_wa && !enable))
>> Should this condition be:
>>
>>       if (!q || q->properties.is_dbg_wa != enable)
> The latter part should probably be q->properties.is_dbg_wa == enable.  q->properties.is_dbg_wa != enable would always skip a request to change the queue's current workaround state.

Yeah, I that's what I meant.


> I think we can just drop the latter half of this test condition as a redundant queue workaround update is harmless.
> It's a static call from a process wide call and the process wide call is static itself and only gets called twice, once on attach and once on detach.

Sounds good.

Thanks,
   Felix


>
> Thanks,
>
> Jon
>
>>> +           return 0;
>>> +
>>> +   if (KFD_GC_VERSION(q->device) < IP_VERSION(11, 0, 0) ||
>>> +                   KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0, 0))
>> Indentation. It would be more readable if the KFD_GC_VERSIONs were
>> aligned.
>>
>>
>>> +           return 0;
>>> +
>>> +   if (enable && q->properties.is_user_cu_masked)
>>> +           return -EBUSY;
>>> +
>>> +   minfo.update_flag = enable ? UPDATE_FLAG_DBG_WA_ENABLE :
>> UPDATE_FLAG_DBG_WA_DISABLE;
>>> +
>>> +   q->properties.is_dbg_wa = enable;
>>> +   err = q->device->dqm->ops.update_queue(q->device->dqm, q,
>> &minfo);
>>> +   if (err)
>>> +           q->properties.is_dbg_wa = false;
>>> +
>>> +   return err;
>>> +}
>>> +
>>> +static int kfd_dbg_set_workaround(struct kfd_process *target, bool
>> enable)
>>> +{
>>> +   struct process_queue_manager *pqm = &target->pqm;
>>> +   struct process_queue_node *pqn;
>>> +   int r = 0;
>>> +
>>> +   list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
>>> +           r = kfd_dbg_set_queue_workaround(pqn->q, enable);
>>> +           if (enable && r)
>>> +                   goto unwind;
>>> +   }
>>> +
>>> +   return 0;
>>> +
>>> +unwind:
>>> +   list_for_each_entry(pqn, &pqm->queues, process_queue_list)
>>> +           kfd_dbg_set_queue_workaround(pqn->q, false);
>>> +
>>> +   if (enable) {
>>> +           target->runtime_info.runtime_state = r == -EBUSY ?
>>> +                           DEBUG_RUNTIME_STATE_ENABLED_BUSY :
>>> +                           DEBUG_RUNTIME_STATE_ENABLED_ERROR;
>>> +   }
>> Braces are not needed here.
>>
>>
>>> +
>>> +   return r;
>>> +}
>>> +
>>> +static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>>> +{
>>> +   uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd-
>>> spi_dbg_launch_mode;
>>> +   uint32_t flags = pdd->process->dbg_flags;
>>> +
>>> +   if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
>>> +           return 0;
>>> +
>>> +   return amdgpu_mes_set_shader_debugger(pdd->dev->adev, pdd-
>>> proc_ctx_gpu_addr, spi_dbg_cntl,
>>> +                                           pdd->watch_points, flags);
>>> +}
>>> +
>> You're adding some unused static functions here. This will cause compile
>> warnings until the patch that starts using them. You could avoid this by
>> reordering this and the next patch and moving the function calls into
>> this patch. That would also make it more obvious where the workaround
>> plugs into the debug code.
>>
>> Regards,
>>     Felix
>>
>>
>>>    int kfd_dbg_trap_disable(struct kfd_process *target)
>>>    {
>>>      if (!target->debug_trap_enabled)
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
>> b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
>>> index 53c5a3e55bd2..0c09f1729325 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
>>> @@ -35,7 +35,8 @@ int kfd_dbg_trap_enable(struct kfd_process *target,
>> uint32_t fd,
>>>    static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
>>>    {
>>> -   return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
>>> +   return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
>>> +          KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
>>>    }
>>>
>>>    void debug_event_write_work_handler(struct work_struct *work);
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> index 2517716d7cbc..be1985b87ea7 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>>> @@ -214,6 +214,10 @@ static int add_queue_mes(struct
>> device_queue_manager *dqm, struct queue *q,
>>>      queue_input.paging = false;
>>>      queue_input.tba_addr = qpd->tba_addr;
>>>      queue_input.tma_addr = qpd->tma_addr;
>>> +   queue_input.trap_en = KFD_GC_VERSION(q->device) <
>> IP_VERSION(11, 0, 0) ||
>>> +                         KFD_GC_VERSION(q->device) >= IP_VERSION(12, 0,
>> 0) ||
>>> +                         q->properties.is_dbg_wa;
>>> +   queue_input.skip_process_ctx_clear = qpd->pqm->process-
>>> debug_trap_enabled;
>>>
>>>      queue_type = convert_to_mes_queue_type(q->properties.type);
>>>      if (queue_type < 0) {
>>> @@ -1679,6 +1683,9 @@ static int create_queue_cpsch(struct
>> device_queue_manager *dqm, struct queue *q,
>>>       * updates the is_evicted flag but is a no-op otherwise.
>>>       */
>>>      q->properties.is_evicted = !!qpd->evicted;
>>> +   q->properties.is_dbg_wa = qpd->pqm->process-
>>> debug_trap_enabled &&
>>> +                   KFD_GC_VERSION(q->device) >= IP_VERSION(11, 0, 0)
>> &&
>>> +                   KFD_GC_VERSION(q->device) < IP_VERSION(12, 0, 0);
>>>
>>>      if (qd)
>>>              mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q-
>>> mqd_mem_obj, &q->gart_mqd_addr,
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
>>> index 4889865c725c..c2a7226fc588 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
>>> @@ -48,8 +48,7 @@ static void update_cu_mask(struct mqd_manager
>> *mm, void *mqd,
>>>      struct cik_mqd *m;
>>>      uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
>>>
>>> -   if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
>>> -       !minfo->cu_mask.ptr)
>>> +   if (!minfo || !minfo->cu_mask.ptr)
>>>              return;
>>>
>>>      mqd_symmetrically_map_cu_mask(mm,
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
>>> index cb484ace17de..8248e77751e7 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
>>> @@ -48,8 +48,7 @@ static void update_cu_mask(struct mqd_manager
>> *mm, void *mqd,
>>>      struct v10_compute_mqd *m;
>>>      uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
>>>
>>> -   if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
>>> -       !minfo->cu_mask.ptr)
>>> +   if (!minfo || !minfo->cu_mask.ptr)
>>>              return;
>>>
>>>      mqd_symmetrically_map_cu_mask(mm,
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
>>> index ac7c8fc83c94..18ab613e787c 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
>>> @@ -46,15 +46,33 @@ static void update_cu_mask(struct mqd_manager
>> *mm, void *mqd,
>>>    {
>>>      struct v11_compute_mqd *m;
>>>      uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
>>> +   bool has_wa_flag = minfo && (minfo->update_flag &
>> (UPDATE_FLAG_DBG_WA_ENABLE |
>>> +                   UPDATE_FLAG_DBG_WA_DISABLE));
>>>
>>> -   if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
>>> -       !minfo->cu_mask.ptr)
>>> +   if (!minfo || !(has_wa_flag || minfo->cu_mask.ptr))
>>>              return;
>>>
>>> +   m = get_mqd(mqd);
>>> +
>>> +   if (has_wa_flag) {
>>> +           uint32_t wa_mask = minfo->update_flag ==
>> UPDATE_FLAG_DBG_WA_ENABLE ?
>>> +                                           0xffff : 0xffffffff;
>>> +
>>> +           m->compute_static_thread_mgmt_se0 = wa_mask;
>>> +           m->compute_static_thread_mgmt_se1 = wa_mask;
>>> +           m->compute_static_thread_mgmt_se2 = wa_mask;
>>> +           m->compute_static_thread_mgmt_se3 = wa_mask;
>>> +           m->compute_static_thread_mgmt_se4 = wa_mask;
>>> +           m->compute_static_thread_mgmt_se5 = wa_mask;
>>> +           m->compute_static_thread_mgmt_se6 = wa_mask;
>>> +           m->compute_static_thread_mgmt_se7 = wa_mask;
>>> +
>>> +           return;
>>> +   }
>>> +
>>>      mqd_symmetrically_map_cu_mask(mm,
>>>              minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
>>>
>>> -   m = get_mqd(mqd);
>>>      m->compute_static_thread_mgmt_se0 = se_mask[0];
>>>      m->compute_static_thread_mgmt_se1 = se_mask[1];
>>>      m->compute_static_thread_mgmt_se2 = se_mask[2];
>>> @@ -109,6 +127,7 @@ static void init_mqd(struct mqd_manager *mm,
>> void **mqd,
>>>      uint64_t addr;
>>>      struct v11_compute_mqd *m;
>>>      int size;
>>> +   uint32_t wa_mask = q->is_dbg_wa ? 0xffff : 0xffffffff;
>>>
>>>      m = (struct v11_compute_mqd *) mqd_mem_obj->cpu_ptr;
>>>      addr = mqd_mem_obj->gpu_addr;
>>> @@ -122,14 +141,15 @@ static void init_mqd(struct mqd_manager *mm,
>> void **mqd,
>>>      m->header = 0xC0310800;
>>>      m->compute_pipelinestat_enable = 1;
>>> -   m->compute_static_thread_mgmt_se0 = 0xFFFFFFFF;
>>> -   m->compute_static_thread_mgmt_se1 = 0xFFFFFFFF;
>>> -   m->compute_static_thread_mgmt_se2 = 0xFFFFFFFF;
>>> -   m->compute_static_thread_mgmt_se3 = 0xFFFFFFFF;
>>> -   m->compute_static_thread_mgmt_se4 = 0xFFFFFFFF;
>>> -   m->compute_static_thread_mgmt_se5 = 0xFFFFFFFF;
>>> -   m->compute_static_thread_mgmt_se6 = 0xFFFFFFFF;
>>> -   m->compute_static_thread_mgmt_se7 = 0xFFFFFFFF;
>>> +
>>> +   m->compute_static_thread_mgmt_se0 = wa_mask;
>>> +   m->compute_static_thread_mgmt_se1 = wa_mask;
>>> +   m->compute_static_thread_mgmt_se2 = wa_mask;
>>> +   m->compute_static_thread_mgmt_se3 = wa_mask;
>>> +   m->compute_static_thread_mgmt_se4 = wa_mask;
>>> +   m->compute_static_thread_mgmt_se5 = wa_mask;
>>> +   m->compute_static_thread_mgmt_se6 = wa_mask;
>>> +   m->compute_static_thread_mgmt_se7 = wa_mask;
>>>
>>>      m->cp_hqd_persistent_state =
>> CP_HQD_PERSISTENT_STATE__PRELOAD_REQ_MASK |
>>>                      0x55 <<
>> CP_HQD_PERSISTENT_STATE__PRELOAD_SIZE__SHIFT;
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
>>> index 86f1cf090246..50da16dd4c96 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
>>> @@ -49,8 +49,7 @@ static void update_cu_mask(struct mqd_manager
>> *mm, void *mqd,
>>>      struct v9_mqd *m;
>>>      uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
>>>
>>> -   if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
>>> -       !minfo->cu_mask.ptr)
>>> +   if (!minfo || !minfo->cu_mask.ptr)
>>>              return;
>>>
>>>      mqd_symmetrically_map_cu_mask(mm,
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
>>> index 530ba6f5b57e..58b40bff3e0c 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
>>> @@ -51,8 +51,7 @@ static void update_cu_mask(struct mqd_manager
>> *mm, void *mqd,
>>>      struct vi_mqd *m;
>>>      uint32_t se_mask[4] = {0}; /* 4 is the max # of SEs */
>>>
>>> -   if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
>>> -       !minfo->cu_mask.ptr)
>>> +   if (!minfo || !minfo->cu_mask.ptr)
>>>              return;
>>>
>>>      mqd_symmetrically_map_cu_mask(mm,
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>>> index 8f1e2f9023db..75521d96e937 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>>> @@ -479,6 +479,8 @@ struct queue_properties {
>>>      bool is_evicted;
>>>      bool is_active;
>>>      bool is_gws;
>>> +   bool is_dbg_wa;
>>> +   bool is_user_cu_masked;
>>>      /* Not relevant for user mode queues in cp scheduling */
>>>      unsigned int vmid;
>>>      /* Relevant only for sdma queues*/
>>> @@ -501,7 +503,8 @@ struct queue_properties {
>>>                          !(q).is_evicted)
>>>
>>>    enum mqd_update_flag {
>>> -   UPDATE_FLAG_CU_MASK = 0,
>>> +   UPDATE_FLAG_DBG_WA_ENABLE = 1,
>>> +   UPDATE_FLAG_DBG_WA_DISABLE = 2,
>>>    };
>>>
>>>    struct mqd_update_info {
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>>> index 5137476ec18e..d8f032214481 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
>>> @@ -498,8 +498,12 @@ int pqm_update_mqd(struct
>> process_queue_manager *pqm,
>>>              return -EFAULT;
>>>      }
>>>
>>> +   /* CUs are masked for debugger requirements so deny user mask  */
>>> +   if (pqn->q->properties.is_dbg_wa && minfo && minfo->cu_mask.ptr)
>>> +           return -EBUSY;
>>> +
>>>      /* ASICs that have WGPs must enforce pairwise enabled mask
>> checks. */
>>> -   if (minfo && minfo->update_flag == UPDATE_FLAG_CU_MASK &&
>> minfo->cu_mask.ptr &&
>>> +   if (minfo && minfo->cu_mask.ptr &&
>>>                      KFD_GC_VERSION(pqn->q->device) >= IP_VERSION(10,
>> 0, 0)) {
>>>              int i;
>>>
>>> @@ -518,6 +522,9 @@ int pqm_update_mqd(struct
>> process_queue_manager *pqm,
>>>      if (retval != 0)
>>>              return retval;
>>>
>>> +   if (minfo && minfo->cu_mask.ptr)
>>> +           pqn->q->properties.is_user_cu_masked = true;
>>> +
>>>      return 0;
>>>    }
>>>
