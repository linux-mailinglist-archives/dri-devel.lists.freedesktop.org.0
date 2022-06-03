Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB953C6C4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 10:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813D010FD05;
	Fri,  3 Jun 2022 08:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993FB10FD05
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 08:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZur69XOh3hgpOv0+6xlMCp30aHJJ/qO8Y6B47qITSWgHY7ui6WyNk8k98/+EVDrAqfDmtnJVaLnPmji0ghWb845WolAfdmYN2402s9LHIqwQxCcbClHFM6efG1jBsmUURVe6FxdJwvMhVQ/6OvZgVNWdfXlWJyQAif1DKoC0ennB1NGY9aAeChqTDtshaA16F7Jwy2T8qzrL53sjca7vH5CQQ2p002NByfBRnV0k2DNSIMeN2wdVwyIs+h9lRrVPgs3gJA6Xn/rRI7/DXuI0ZpL82xCSGtQBrowbvSu8M2a+wcRnjWc8YCUa50rhyFJltZiHBYEMFWZn3TWjM5B9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCP7/uK0rWEFHDwPhjEUZvvDpktxeEdGeJomWPeTlWs=;
 b=lzDBB9r6L5zGk5kTRr6P9h/97wCtsY9+B7QqDvoS+nCWHQeWG7RxnCgqix0ei+lVuIcxMbKQFTdhMmcwEHjJ6jMgKnvLFoaWdeLqmveHZDyZjXwSIF9F6poeJJ3ofuJ/P9/1sgQjCuKrOSfdw94aouTNPb4GrVAAUMXu+cCOmzEOOsMXXmsMPBd3trmmYAUz6iDMFQWrepj0nK7s7RB74pqURKP4jTLsbWMarvWfun9gPL+jdmIIR8o5qWL0zhezxWD0ynwvxF0iaT7HfbmTNBFoATuZF2ctXKXH5XL/RF+XdS0STK0Sv+p9tK0cPpwXXuxv+x3+P9YoUTnPKnG7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCP7/uK0rWEFHDwPhjEUZvvDpktxeEdGeJomWPeTlWs=;
 b=V+a88XtGhaXs5ivUmwq6J2iRx4oz1h5Kh0mKfssHw13WFVJqUbJIXRPqhf9J+CxO4k3wmrrdx5waCxzUJyS3m/wkx6uZ9WjxDVW4aiB4MiZq4Ht9/l7ICcpM6znnzbVmLfo/rEKm/AW09ac2fvSlx7Kr3jMFFQQYW5QFeiBG1s8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2866.namprd12.prod.outlook.com (2603:10b6:408:68::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 08:11:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 08:11:42 +0000
Message-ID: <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
Date: Fri, 3 Jun 2022 10:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfcacce7-8aaa-45e5-2b91-08da4538b126
X-MS-TrafficTypeDiagnostic: BN8PR12MB2866:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB28667F3FD876255D69F65F9883A19@BN8PR12MB2866.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JE4rO6rnnvNWrU/lFihWc3/ZZbCVzwd2UagSNMv2OyCftVte5gkZUwN5o5b2vqDtXHiLuWo6MbFaQKdoegm6pTGjCFBVAnLF84x/K+wf/RTwF1+Q8b1Le9aDCu6K3ynw/BRcpYYRW9XUJ+Cr1NLVK7NYIVcWHP15JX/oJyALFKgt7Y0bzMm47Tj7mKLonFw/n+BX5/jmJh6p3f/gJr35uPmg4jgEjh0D2EP9NcpyVvJgma8EBvJ7Fh1k7rGatXk/Ko/ZMej9di0+SXPoYJtzlCvtnIkqr5xBb/sB+EfrE3O3W1hL7vvsI2C4sP0tzfX1yRVHe1/Ht/DVlq/WqVfSvukcRPzhi//ubB05UKqiSiuPwEhy3AopF7WvZrlf0Tof/KNQDm5ikNiCc1eQWmwo6cb3k3fzFAM91nho12CHZwgPGdkV1CacNnyl1uMqEFPFBvcJJ+OC93dF+E+eQ6jErUJA8TfIK6c3q4HPhFPzJdLcH0EuglhFklMP8iYvSUgzPzh8YpiJg/p6MC3w6hGL0ZBOcdqVyHD8nqrWdmoW+lKIUyHK9QtkeYLfbNlxS6t5aEaflnAlObyUZTs0EekBpUd3o2PiaH/wXXTb048WGp64G3eLCmiI8qqLRUL4lGESeNaC+eKnbjyqPkbrybMp4Kt6NiYMkSJwdC6O7hTR5N83jhOKr7b6xHmEwERw8dnEFgdEF05pdaDcX4FaCj3cCd2xDJcCIK/Y47PekqBKStk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(316002)(2616005)(6486002)(186003)(31686004)(83380400001)(5660300002)(6512007)(36756003)(2906002)(6666004)(508600001)(8936002)(38100700002)(4326008)(8676002)(6916009)(66556008)(66476007)(31696002)(66946007)(86362001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFza2dPZkIzUWlvRHlOTm5BSmtkdWppUmt1VnV2OEFqeDdtczdRZldHd3dq?=
 =?utf-8?B?ZWx1d0VRZzdDdEl5TktTRDVZTThYTzFWMDQvWGQ0VWt3UnoxYklRUUZPd1ZK?=
 =?utf-8?B?QXgyeGovZ25hUnUzeXRhSVl0bE15UzlnVnI4QjAwZk0vcmNVYnFxYk5sNGsx?=
 =?utf-8?B?T0VTQlBJY0VCdXBkSEhKUVEyN0RJdzRXTUI3WmxiS1Jlc284TWJCbU1FdHNt?=
 =?utf-8?B?RUNVYUljdW8xdFpHNFdNOW9icnZ0WmczSmYrQm1uMmFnN0RseFN4am9GQUpv?=
 =?utf-8?B?ZVJDS1pVdVkwL0NxeFhUV1pCTDl5bWxMTEx3dHBoa0c5Mlk3QzM3RUExSkJn?=
 =?utf-8?B?Wm0rdk9NRm1vV0wydWFlZ2lSSGlBbGp3S1FrOE1tUHY2T2hRamtQTk9FeHlC?=
 =?utf-8?B?dE1WTW5xOWZSdnpmczU4ditYOVdhcVhBT3lyeENnU1hpS05rb0JBZUc3a2NX?=
 =?utf-8?B?WXNwanU0MUduQlFleWk1RU51YnlvMkFPOXBsUjNkTytTYS9GK2NNVHVldjAx?=
 =?utf-8?B?VFBsVlh2Qm10RDNRUE9IbEh1Y0RXbXdFTzdneG03MUN5MVR3V1FLdVBWYkwz?=
 =?utf-8?B?MWpIL3lENVIzVk5UcWluSHJIMGJUaDRnUWV2aUR5MFppdlZaRXFQMlpwUkZ3?=
 =?utf-8?B?SkVpbE93OGVBc2tKNHJzWStYcFRsMEpCOXNPUnRGUVltc0hGWnpJNDF1MHNX?=
 =?utf-8?B?WGFkYUFVTmorQmtHOTJEUG1sY3cvd1JBWk8rR0llWjVOdUpIYm0yNEQ2ekNH?=
 =?utf-8?B?YzNpQUtrVTZ6Qk9XZVl6eE00TTdRUEYzMUIyUmtuaVMyVzF0UG4rZDdNNjdY?=
 =?utf-8?B?eGpBR2xZMGprTGdCaUh2UzdnZ1hlMHRnQWJsSTJ5WEVWbktuMlFHaHFPU2hm?=
 =?utf-8?B?eUxSQXZDYzc2ekhMVHZ0UGtWMmo3Y3hxcXBvUG9NTFlqUUZrZjhQeVVmNHdk?=
 =?utf-8?B?dzdDeFB6VE9Sa3EzaDZyNGZERTlyb2NoZEUzL0lKc1phbGp3SG5PQXdmK0ZF?=
 =?utf-8?B?OC9RNUR2MmxCMjdWRjRsSUoxUS96Nld1SEJPMjNyZk1FTXZ1NWJFSzhwei9h?=
 =?utf-8?B?WUVRQWZuUVQ4ZlVuN2Z2cWhMZW4zNmJia045emE5dVE4Ujh2YlFwQmFtOTdV?=
 =?utf-8?B?R2tZa1Q0N0lwRHM1SXBBZ1QyU2ZKVnAreXpEVGtuZytBdkFoYkNZNFNJa0k3?=
 =?utf-8?B?Z09ma2dCVUY4T0E4SzlRMkcyUkdaRnc5K0wrMWdUQk9aUGkyU2N0NlAweFhR?=
 =?utf-8?B?WHVHdjlEeU1qY3NCUE1Pc1MvdHZ5MlJtdUhlcHNqMkNXLzBhdnJGYXpzSTBS?=
 =?utf-8?B?YU5OdndNeThIRG1pNVpWaXFCQ1dETHhybFpLYndCQUxsUkRTZ2t0NHlPR3VT?=
 =?utf-8?B?ZlNXeGhtc0w4eTVadFNRUUUyMi9nQnNDVEdIVnVmeVZodjN4b3U2a3BCZlo5?=
 =?utf-8?B?ZTZ1RWtLbndZWDF1STJFNWhzc1U0cnZTVUJtRGNid3NuZmlMajNCdmlheHBq?=
 =?utf-8?B?anA5U0xKemFTZWp3bm8wK2hQWDhCUlFDcjMySmsvUEpaUTdnS1VSdjdPNEpx?=
 =?utf-8?B?TGFiVWFFWk5XZDFLalh6d3dNWHlyVzZmd1hsT2ExV3F1Q2NYREMrMys1QVVR?=
 =?utf-8?B?TnIwOWxCbW44aXRFVkRPVFNLMUltN2J3eW9tTGVqMlFrbUU3VStnc2pvYkdk?=
 =?utf-8?B?TFZVc1lhZ3M0MUgwWEd3anhvTm10WFI2UGhzU0VaRVU3SWRpRlM2TU9pWkxw?=
 =?utf-8?B?SnVVYlQ1Tms4KzB4dUdrVHNEeEJPSE5pbVI0N1ZzWVp4ZFhKcDcwMVZKb1ZT?=
 =?utf-8?B?VFlsYmMwYjNaTXV5bFNjSFdUa09qVjNuYlVhQWFRS21yMW5xUWd0dkJPTVIz?=
 =?utf-8?B?NFY3RytuakZ6T1NxOGhOcEsvaGtlTEpDQWl5alVsVk84ODJFL3RnUGFTdTgv?=
 =?utf-8?B?NTBhQTVpS3FaQTZYSWpmNEdBTDhuUy9ZTDJxczBIY0FFWjZQakZaSEtlK3Zs?=
 =?utf-8?B?QWV3Q0taaUhudmE0dTNYSTFnUlpic1E2a0ZDWmNzTTlPL29WMVVBZVRsRVVj?=
 =?utf-8?B?bTBtUFRBai9YRW5pQTJPaWg5VHhLdy85Qlg5aVBGTXdRaldyaVh1TmlDUldE?=
 =?utf-8?B?Z1JIYnVrRXNrVmhnSElqbzNXRlBLUGlOdGp6RzVvZ1pnZnpRZjNpUVVGVCtY?=
 =?utf-8?B?V0g2OE5sYjdiYnN0TnQwMnBETTIyM3JNTWlkeXBiMTJORC9FZmhNaTkrd0hX?=
 =?utf-8?B?NGNFaWFOVGZaWktjKy95NWpGUVBtUm9EVmxmRUFEM0tKOFJtTm9VNWdYM2Ez?=
 =?utf-8?B?TUJxS3RXYTN5SlFRZFQwS3huS1lMckZPVXhRK3hTanlBT1Nhb0Z0M2xpalc0?=
 =?utf-8?Q?CQUR+I/3pGz4zJ8oWfoTHvkZxUFbNMeDjuK1W4RinA1vt?=
X-MS-Exchange-AntiSpam-MessageData-1: KBMzqlJsVZI93A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcacce7-8aaa-45e5-2b91-08da4538b126
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 08:11:42.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysUgOjxr0PTKxEzkUCU8QD2GOM2Aqn3/ybKN0QQA5yiGzajL8E7sgO4ftGUx4Td3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2866
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.22 um 03:21 schrieb Bas Nieuwenhuizen:
> [SNIP]
>> The problem is we need to wait on fences *not* added to the buffer object.
> What fences wouldn't be added to the buffer object that we need here?

Basically all still running submissions from the VM which could 
potentially access the BO.

That's why we have the AMDGPU_SYNC_EQ_OWNER in amdgpu_vm_update_range().

>> E.g. what we currently do here while freeing memory is:
>> 1. Update the PTEs and make that update wait for everything!
>> 2. Add the fence of that update to the freed up BO so that this BO isn't
>> freed before the next CS.
>>
>> We might be able to fix this by adding the fences to the BO before
>> freeing it manually, but I'm not 100% sure we can actually allocate
>> memory for the fences in that moment.
> I think we don't need to be able to. We're already adding the unmap
> fence to the BO in the gem close ioctl, and that has the fallback that
> if we can't allocate space for the fence in the BO, we wait on the
> fence manually on the CPU. I think that is a reasonable fallback for
> this as well?

Yes, just blocking might work in an OOM situation as well.

> For the TTM move path amdgpu_copy_buffer will wait on the BO resv and
> then following submissions will trigger VM updates that will wait on
> the amdgpu_copy_buffer jobs (and hence transitively) will wait on the
> work.  AFAICT the amdgpu_bo_move does not trigger any VM updates by
> itself, and the amdgpu_bo_move_notify is way after the move (and after
> the ttm_bo_move_accel_cleanup which would free the old resource), so
> any VM changes triggered by that would see the TTM copy and sync to
> it.
>
> I do have to fix some stuff indeed, especially for the GEM close but
> with that we should be able to keep the same basic approach?

Nope, not even remotely.

What we need is the following:
1. Rolling out my drm_exec patch set, so that we can lock buffers as needed.
2. When we get a VM operation we not only lock the VM page tables, but 
also all buffers we potentially need to unmap.
3. Nuking the freed list in the amdgpu_vm structure by updating freed 
areas directly when they are unmapped.
4. Tracking those updates inside the bo_va structure for the BO+VM 
combination.
5. When the bo_va structure is destroy because of closing the handle 
move the last clear operation over to the VM as implicit sync.

Only when all this is done we then can resolve the dependency that the 
CS currently must wait for any clear operation on the VM.

Regards,
Christian.


