Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA4C7E8535
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 22:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8BF10E13B;
	Fri, 10 Nov 2023 21:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F26810E049;
 Fri, 10 Nov 2023 21:42:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/LtWbgzJh/cBNdMrz8TukbyyTaldA3qrmhzzozD/Ai8G9NGakYjGPWyoGmr1NP/83kp4If5EEiXfbzqEEXaIVMjIFjCRjJKPA4yoZhfiIkf/UMAP/NY1wvDhrnxOrMN+z29/+XTzaRlht4V6y2uNPwvyHlLQ7/tMl4po4rwrljlHS4DE96ktVv/Mk7UslcXErPevOxNqBUWUMmP6Dl74ZXM8udBPYB9tWF1SthuUXIpTkT87C4MaoTMxNng1gNzNRWGnri7F29vXoKTBXdn3a81toxvw2pxUbrGbZnPUdGLm3ZpW9kWpao3rpA/GWJGZggJrYwKMi8ElZyY7q9BJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLAecrq/PO8GEfZcEb1UYPRE2GGY25ecvFpuxsdXKgY=;
 b=MFX1jjnubBgzA8DvYvGWpj1pN0ORTVvIu6y5z6PHcjqwKfp5RKmeqfISukHWsAjGLXNYiNSUof2VZ16SVLPky2zCgN3GVX0C9TcqdSmJRYj2DM1o2X7jJrEqbqtfESpIo7NTqGZk9ktCk8DlrGPZxQ84mVfDuevX8Z/pKxQWMge75RgkPirOiy4wnLNteKEfGBIJ6BE2Ja8qmmjBCuKPNukZhe79LnI+37SMixhW/azubrWei3c5+SbSRQZqHTozxMqO2g/CCsHaKqQhaTv3p2ROHVf5yUl5hkOD0sahcX3bfNf7AJYsOYpyI1H1LL9DtyeiqgY8LrbbDOxCZm0J4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLAecrq/PO8GEfZcEb1UYPRE2GGY25ecvFpuxsdXKgY=;
 b=JD28p97Ebg1qFihaRX9FCxCAhu0/qhAbWMD/BnaUsao6C1TOu3cW3iIewh7mKi2nK8hACKugAj/MhYzp3d1UtemgNpzzVK5w6H69233ESFkXVNMX3ctgAyVJFLxQfHVIeQlz397/T6fBAmQy4cLbQLZbSpsL9B27olpJq6MSL68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 10 Nov
 2023 21:42:14 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::194a:56d:a41d:3c79]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::194a:56d:a41d:3c79%5]) with mapi id 15.20.6977.018; Fri, 10 Nov 2023
 21:42:14 +0000
Message-ID: <70155289-6232-4112-bea0-f57c679fb377@amd.com>
Date: Fri, 10 Nov 2023 16:42:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add a debugfs interface for the DMUB
 trace mask
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20231110171811.11656-1-hamza.mahfooz@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20231110171811.11656-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0164.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::27) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 276a4324-72e4-43a1-befd-08dbe235e747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eBIHdC8A7dvNyFiIkIGLn8gTDhu7xLfbl2VD3uzR6yaA+q8HRTSKEF6urvrbs8pN73LK4ISdwqobDslZFVie2kXPSrBFPgenIaxLm6VgtElSY34QKM2GdWGzgBYqG0BoxSCUFEwBJ7lNx5G/DhuJtbZWlu5pTW8E5G60sk6WjPKjBkJUklsvqGbCEqqMRB9agLzo/3y8tpXfyvZMzC25fkPHFZUl+rFjfrsIzn5sweU02CAevQYJHHjdad3xnnPGiBuDsHGHtdyrzBnCeZNoCflO7ujwvCJVSgh4xFaV+uptJ0tI7QP0WDQ7J4aO/BeZlJW8FsKF1ZVPMSXTBhq4fyeWn2x4vuEpjwxBUj6OUiFEw34Hs2AgUwyfpjtl5wQeZu0XFkfVDv4H1VqAZCfDU9O0nQXKTBEXuFYDDStoS9wIf0YgyvumBYRGBWOC+u0GoyQ2UmbrLVtWlbnt9AMdjM7XJYMtXvivWmYjzFf+c0g/yHMf8/ZYjfvwbmvZTS/WMak1mG+Kw+f8Xh55Bh9TWS7N1qI+R/NdTqkLJo+NeDrU4CWgeXsSIvN8WVFc3VUK1EIjU6fOu3/m5u9Y/ackRGOoxFvvjhc7SpDjdcOckk1FB2zj49G4THr32Rx7ihWxUgjboRirfYqzOLb4zRBwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6506007)(83380400001)(8936002)(8676002)(4326008)(6486002)(2616005)(53546011)(31686004)(6666004)(26005)(44832011)(66556008)(66946007)(66476007)(316002)(54906003)(478600001)(6512007)(7416002)(5660300002)(38100700002)(4001150100001)(41300700001)(2906002)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTY2ODJoeG9KY2NLWUJtVmU4amtXRm1MeFZhaWk2TGZRRVNtUzdEQXJnMkJs?=
 =?utf-8?B?OWdMUzhiaWF0dVNDT2JjbEwrUmJGOGwzTG5PUnM1eHRJWGRzc0JlRm4yVjl3?=
 =?utf-8?B?RWVLV2twRGcreFF0UC9QR1pEUGdSMmkrcFQ3T2dMdHRmOUZrNTJpUWIzcDI0?=
 =?utf-8?B?MnpUdFJNZEJ1UFNSZGl5YXIvL1U1TFE2WWZlZ25aVlNpSWlLVXBKVndLRkZm?=
 =?utf-8?B?MDhNelNsUEVzOGhhazhRVnk2M2c3VlV1MUxoUVNMWWJaZFJjR01sZmU0U3Z2?=
 =?utf-8?B?RXo2elN0VEo0djA1OEZROFM5dFdmUGpHeHFqQ2E2N2NINE5UL0dva1kwbEIy?=
 =?utf-8?B?SlJWQUlCdER2RkIxRTBZVFlKQXpyR0lKSVE1MVc5cDhzVXlKVHJsWUwwRzFL?=
 =?utf-8?B?VTFWV05ENUhIR1FBT2VBQnRwbVNtVFhEMkl0bU9MY1Z6QmFNRFh0TUg5VVQ3?=
 =?utf-8?B?UGVTODZZSkxwTkI3d0g5YTVYZmJEaW1pS2tpS2lyZy9GL0V5NjB6RVJFRTdS?=
 =?utf-8?B?K3pLSXhsdXFRaGNqSzd0T0dHUXVtY2JnYjVkVFJwa05GOTNCUEJQQlBCejY5?=
 =?utf-8?B?eTAyTnpkSFBGMkhoZzB1RXQzcWV3bjZ3UDQ3dzE3M3dybEd1a3d3emsrVXhC?=
 =?utf-8?B?MFZWUmFTNStKR0dVVVllU2k2TTl4ZWlLSjZhUFBKUDlDcTVDelBBYUVNRllH?=
 =?utf-8?B?VEtpOFdScmNYUjNyRzhnOWtZRnIxZzlZVUpqR29JVlMxWU9mOWVNS3BGQy9n?=
 =?utf-8?B?S2xEMGFUaWlkTEFyamFqT1BiL1VPb3N2WUdBTXRKdjVFL0lQWStEdWQvQ3hp?=
 =?utf-8?B?TG9HQVdFT2NYQ21taVNnMW9GVWJyanZkRC80bmtEY0V5TTlRUXhCY2paR2Fp?=
 =?utf-8?B?clBQTkkvUEZiSnhURUhmSzZnYlhsRXM3dnkwUnAvT25NbFVlUXRrR0VPcUNt?=
 =?utf-8?B?clRuRk1FYzFUQThoUHJiWDVrZnBsTlBWMENaZWd4M215MGE4VUc1TlFWdCtD?=
 =?utf-8?B?anNRVWE2NTRyS0VDbnZQbFlQV3FTWHZCN29LQXo1WUF5RUlUeFVFb1FpV1Fj?=
 =?utf-8?B?SGNRbldLbm5PcWQ4YVY3b3BJak1YcHkydStpZGl0djhNQ1Rpd1VGaWJWeDBP?=
 =?utf-8?B?L0FaSE43QzhvRDBuUHptZW9tNXp1UU1Za0ZLT1VxNTJaUnNWek0xdS9nSWxN?=
 =?utf-8?B?U2FUUVNxQ2paU2xyYjkzbTFreG82TFNLMEhyczhZbkZFb0Fqc1JQWHd1QS8z?=
 =?utf-8?B?b24rZER0Nk54amZrZWFsKzdlL1VOd2hkRk11aVlQT2JIaFFjbXFxQ0ZSYXVO?=
 =?utf-8?B?bGYxdkp6QlVwZVl1L0ZwMGQ2NlV6UDBBU2JzTVhYaHJZd2FJRTVrOUJwSmVB?=
 =?utf-8?B?YTg0NGlvbE9lYzNGZHB5b1M1dmZaRW5ETzM2ajg1MnlZMlo4azl0ZllzelBM?=
 =?utf-8?B?Ulh6OS9UWnMzR3VzSW5IdXcvNGhDUEJKWmNGWFdQUlhyTnRCeUlFejJuQURW?=
 =?utf-8?B?Qy8xT3YxZlFWUXR6T3lDZ3NRU3dUU2sreUEvcUZJTzFqbUFmekZvbWYveXlY?=
 =?utf-8?B?SUlUZHUycFJOV3BPTDJia28wbTl1Szg1Sk14YWl2dDNGTG5OMW9tcVlrQ1Bq?=
 =?utf-8?B?dnhhbnRtSnJtWnFLRmRpN3h2aWdHc3pwS0U0YzJNNGIyYlVIbHVUbUl1aHRZ?=
 =?utf-8?B?dWtoNVZENDhzWktFQ1Z1ZENhZDFvSVJ2YmtRK0pCZHRKNkpYRk5UNklwR0l3?=
 =?utf-8?B?cVl6YUhaTWJvSGRWMXZUeFg0azFBdkFaREpFUkNRSk94OUZZUE84eHdobFp3?=
 =?utf-8?B?bnZrZEZQQzZiQXVMekFDbHllcldOUEp5Q0crZHM0UzAzN21VVEdvUS9leXFq?=
 =?utf-8?B?ekJVRFdLdWQ0MjlkbE5abUhLV2k1V3FrNzZ5UCtEWUh2ZGJaTnpucmI3NXlr?=
 =?utf-8?B?WTRXWk9UTXBjelRxZlhIZ1FuSUZpWXVkU0hvZ1BSTW5xOEtCNFRUM1oyTkJG?=
 =?utf-8?B?ZmxjeThiUUlDQWRraFEvVEN1K0RjcmpSR29ML0QzSzlEYWtQdDc0amVkRDAz?=
 =?utf-8?B?TG1wZjZDMW5CdG5Da0g4dzNEVEU1UFdackMrcFNzd1FnckJqRm43eW94b3JE?=
 =?utf-8?Q?m8dMZ1zaROZ5WSLSHBwD+W9h7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276a4324-72e4-43a1-befd-08dbe235e747
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 21:42:14.6546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+9wXxAVZMU75bVrhsq2EIkTItPoIGUTqp/ftohsCdZFZAV/zcCSWLU+eRX/7bd6ZA6hrsjBjofnEqbcUD2OjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: linux-doc@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Reza Amini <reza.amini@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Anthony Koo <anthony.koo@amd.com>, Mustapha Ghaddar <mghaddar@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Wenjing Liu <wenjing.liu@amd.com>,
 Tony Tascioglu <tony.tascioglu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 Maxime Ripard <mripard@kernel.org>, Hersen Wu <hersenxs.wu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-10 12:18, Hamza Mahfooz wrote:
> For features that are implemented primarily in DMUB (e.g. PSR), it is
> useful to be able to trace them at a DMUB level from the kernel,
> especially when debugging issues. So, introduce a debugfs interface that
> is able to read and set the DMUB trace mask dynamically at runtime and
> document how to use it.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   Documentation/gpu/amdgpu/display/dc-debug.rst | 41 +++++++++
>   .../gpu/amdgpu/display/trace-groups-table.csv | 29 ++++++
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 91 +++++++++++++++++++
>   .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   | 40 +++++++-
>   4 files changed, 199 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/gpu/amdgpu/display/trace-groups-table.csv
> 
> diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
> index 40c55a618918..817631b1dbf3 100644
> --- a/Documentation/gpu/amdgpu/display/dc-debug.rst
> +++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
> @@ -75,3 +75,44 @@ change in real-time by using something like::
>   
>   When reporting a bug related to DC, consider attaching this log before and
>   after you reproduce the bug.
> +
> +DMUB Firmware Debug
> +===================
> +
> +Sometimes, dmesg logs aren't enough. This is especially true if a feature is
> +implemented primarily in DMUB firmware. In such cases, all we see in dmesg when
> +an issue arises is some generic timeout error. So, to get more relevant
> +information, we can trace DMUB commands by enabling the relevant bits in
> +`amdgpu_dm_dmub_trace_mask`.
> +
> +Currently, we support the tracing of the following groups:
> +
> +Trace Groups
> +------------
> +
> +.. csv-table::
> +   :header-rows: 1
> +   :widths: 1, 1
> +   :file: ./trace-groups-table.csv
> +
> +**Note: Not all ASICs support all of the listed trace groups**
> +
> +So, to enable just PSR tracing you can use the following command::
> +
> +  # echo 0x8020 > /sys/kernel/debug/dri/0/amdgpu_dm_dmub_trace_mask
> +
> +Then, you need to enable logging trace events to the buffer, which you can do
> +using the following::
> +
> +  # echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
> +
> +Lastly, after you are able to reproduce the issue you are trying to debug,
> +you can disable tracing and read the trace log by using the following::
> +
> +  # echo 0 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
> +  # cat /sys/kernel/debug/dri/0/amdgpu_dm_dmub_tracebuffer
> +
> +So, when reporting bugs related to features such as PSR and ABM, consider
> +enabling the relevant bits in the mask before reproducing the issue and
> +attach the log that you obtain from the trace buffer in any bug reports that you
> +create.
> diff --git a/Documentation/gpu/amdgpu/display/trace-groups-table.csv b/Documentation/gpu/amdgpu/display/trace-groups-table.csv
> new file mode 100644
> index 000000000000..3f6a50d1d883
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/display/trace-groups-table.csv
> @@ -0,0 +1,29 @@
> +Name, Mask Value
> +INFO, 0x1
> +IRQ SVC, 0x2
> +VBIOS, 0x4
> +REGISTER, 0x8
> +PHY DBG, 0x10
> +PSR, 0x20
> +AUX, 0x40
> +SMU, 0x80
> +MALL, 0x100
> +ABM, 0x200
> +ALPM, 0x400
> +TIMER, 0x800
> +HW LOCK MGR, 0x1000
> +INBOX1, 0x2000
> +PHY SEQ, 0x4000
> +PSR STATE, 0x8000
> +ZSTATE, 0x10000
> +TRANSMITTER CTL, 0x20000
> +PANEL CNTL, 0x40000
> +FAMS, 0x80000
> +DPIA, 0x100000
> +SUBVP, 0x200000
> +INBOX0, 0x400000
> +SDP, 0x4000000
> +REPLAY, 0x8000000
> +REPLAY RESIDENCY, 0x20000000
> +CURSOR INFO, 0x80000000
> +IPS, 0x100000000
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 13a177d34376..06a73f283e9d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -2971,6 +2971,94 @@ static int allow_edp_hotplug_detection_set(void *data, u64 val)
>   	return 0;
>   }
>   
> +static int dmub_trace_mask_set(void *data, u64 val)
> +{
> +	struct amdgpu_device *adev = data;
> +	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
> +	enum dmub_gpint_command cmd;
> +	enum dmub_status status;
> +	u64 mask = 0xffff;
> +	u8 shift = 0;
> +	u32 res;
> +	int i;
> +
> +	if (!srv->fw_version)
> +		return -EINVAL;
> +
> +	for (i = 0;  i < 4; i++) {
> +		res = (val & mask) >> shift;
> +
> +		switch (i) {
> +		case 0:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD0;
> +			break;
> +		case 1:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1;
> +			break;
> +		case 2:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD2;
> +			break;
> +		case 3:
> +			cmd = DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD3;
> +			break;
> +		}
> +
> +		status = dmub_srv_send_gpint_command(srv, cmd, res, 30);
> +
> +		if (status != DMUB_STATUS_OK)
> +			return -ETIMEDOUT;

dmub_srv_send_gpint_command() explicitly sends out DMUB_STATUS_TIMEOUT, 
so it would nice to check that instead of sending out timeout error 
unconditionally.

if (status == DMUB_STATUS_TIMEOUT)
	return -ETIMEDOUT
else if (status != DMUB_STATUS_OK)
	return -EIO; // or something else more suited

> +
> +		usleep_range(100, 1000);
> +
> +		mask <<= 16;
> +		shift += 16;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dmub_trace_mask_show(void *data, u64 *val)
> +{
> +	enum dmub_gpint_command cmd = DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD0;
> +	struct amdgpu_device *adev = data;
> +	struct dmub_srv *srv = adev->dm.dc->ctx->dmub_srv->dmub;
> +	enum dmub_status status;
> +	u8 shift = 0;
> +	u64 raw = 0;
> +	u64 res = 0;
> +	int i = 0;
> +
> +	if (!srv->fw_version)
> +		return -EINVAL;
> +
> +	while (i < 4) {
> +		status = dmub_srv_send_gpint_command(srv, cmd, 0, 30);
> +
> +		if (status == DMUB_STATUS_OK) {
> +			status = dmub_srv_get_gpint_response(srv, (u32 *) &raw);
> +
> +			if (status != DMUB_STATUS_OK)
> +				return -ETIMEDOUT;
> +		} else {
> +			return -ETIMEDOUT;
> +		}
> +
> +		usleep_range(100, 1000);
> +
> +		cmd++;
> +		res |= (raw << shift);
> +		shift += 16;
> +		i++;
> +	}
> +
> +	*val = res;
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(dmub_trace_mask_fops, dmub_trace_mask_show,
> +			 dmub_trace_mask_set, "0x%llx\n");
> +
>   /*
>    * Set dmcub trace event IRQ enable or disable.
>    * Usage to enable dmcub trace event IRQ: echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_dmcub_trace_event_en
> @@ -3880,6 +3968,9 @@ void dtn_debugfs_init(struct amdgpu_device *adev)
>   	debugfs_create_file_unsafe("amdgpu_dm_force_timing_sync", 0644, root,
>   				   adev, &force_timing_sync_ops);
>   
> +	debugfs_create_file_unsafe("amdgpu_dm_dmub_trace_mask", 0644, root,
> +				   adev, &dmub_trace_mask_fops);
> +
>   	debugfs_create_file_unsafe("amdgpu_dm_dmcub_trace_event_en", 0644, root,
>   				   adev, &dmcub_trace_event_state_fops);
>   
> diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> index ed4379c04715..aa6e6923afed 100644
> --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> @@ -818,18 +818,54 @@ enum dmub_gpint_command {
>   	 * RETURN: Lower 32-bit mask.
>   	 */
>   	DMUB_GPINT__UPDATE_TRACE_BUFFER_MASK = 101,
> +
>   	/**
> -	 * DESC: Updates the trace buffer lower 32-bit mask.
> +	 * DESC: Updates the trace buffer mask bit0~bit15.
>   	 * ARGS: The new mask
>   	 * RETURN: Lower 32-bit mask.
>   	 */
>   	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD0 = 102,
> +
>   	/**
> -	 * DESC: Updates the trace buffer mask bi0~bit15.
> +	 * DESC: Updates the trace buffer mask bit16~bit31.
>   	 * ARGS: The new mask
>   	 * RETURN: Lower 32-bit mask.
>   	 */
>   	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD1 = 103,
> +
> +	/**
> +	 * DESC: Updates the trace buffer mask bit32~bit47.
> +	 * ARGS: The new mask
> +	 * RETURN: Lower 32-bit mask.
> +	 */
> +	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD2 = 114,
> +
> +	/**
> +	 * DESC: Updates the trace buffer mask bit48~bit63.
> +	 * ARGS: The new mask
> +	 * RETURN: Lower 32-bit mask.
> +	 */
> +	DMUB_GPINT__SET_TRACE_BUFFER_MASK_WORD3 = 115,
> +
> +	/**
> +	 * DESC: Read the trace buffer mask bi0~bit15.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD0 = 116,
> +
> +	/**
> +	 * DESC: Read the trace buffer mask bit16~bit31.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD1 = 117,
> +
> +	/**
> +	 * DESC: Read the trace buffer mask bi32~bit47.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD2 = 118,
> +
> +	/**
> +	 * DESC: Updates the trace buffer mask bit32~bit63.
> +	 */
> +	DMUB_GPINT__GET_TRACE_BUFFER_MASK_WORD3 = 119,
>   };
>   
>   /**
