Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339FC32B78
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC6510E31A;
	Tue,  4 Nov 2025 18:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DzEqUkgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8B610E31A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y69SF9j8vG0A89tEZLBgFIPlFxESQXaFae2jNpxlYpy+ROcMjp8b2cVQG4GFC0zDP/ZiwrGqCseP0x1H+EpmoeQ6wnJ9jdFy0a4s9NncivGF179sJ5qHC+OTXSc1BuhFAYc37XM0FYuhLRoXIliQPLN0ikVDrG+SwBLReehYvdYoPS6OZVeRDDvfCR9kvqqs7E/4ZDD5z/HoMm5NLTBkJZOb3hFSKSIkDJoYL8bOjBwSnP8+Op/NuQmNDrVPrt3SkPCseDu1w/QtQ4g20XB3WOhlKgyi71v797j71JR/mTTDvZevVWpq3Sdc8fUwBY1uAKfd8riF5J1aeIL5Oq8r8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+K9D5dE9cjYppVgXw0NRtm42Fo7w44w1rWw8UICH2I0=;
 b=LY57WVywFkNLKXA2aZEBLVnJzs1Png6p88m28vqofIuBYCYuFMuntpS3nrheFK6zrc5/fKJ3Ezjgyf9zGKPqkDmP1qj5WFkFP5WE//oYs/G3Q95paYKdPhHBVqCJJi2z8Ce/imEwpZ3iVFdqzTq+pt8a99EEPZvPjC2/ync5rqJHtkeIK91RCT5qgDa8hTgmSOFDqrJmghKGiE/C0Uo1ey4dQnxw9bXPpJBT2e+msljMJpbSd3yc3VKpWYSJJJHazLlRZTZDVN2FuQrBLxcHwaq4JwGqyLyXRgUq6nPx6HMTmcvNd6fp21K2SmaSyA7sLFL3dsWv8N7ITg586ypnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+K9D5dE9cjYppVgXw0NRtm42Fo7w44w1rWw8UICH2I0=;
 b=DzEqUkgghncTZPLfhpygu5JQpPWJSXwEk6PHKarpMMa4BMzjgXoZp6pqWOapJ7jOs1KKQq/1hVYWLxWuIC1jutQGZJCmwFK7fXSoL/0BVt/qmRzyuZz28KJQff/iSWoNVtUyvqtZduIh7Vngxn2U2lfdKqkAzOwT8dVpren4sco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 18:58:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 18:58:32 +0000
Message-ID: <6011b225-ac26-4e64-ae35-db35055f7552@amd.com>
Date: Tue, 4 Nov 2025 12:58:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Support preemption requests
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251104185340.897560-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251104185340.897560-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0164.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf49754-3348-4b34-e2b2-08de1bd42656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2s1Mk1ZYmVJZ3FqRHFZZWdKS3ZiV1VIUWROaVA1Z3R4ZDJqUmNTUHdiVjlm?=
 =?utf-8?B?RXZpRmdoTWRQU0pncDRjY0syWmk1RzVtT0dpTy9xN0JFV2Fsd0FDaHI1cThC?=
 =?utf-8?B?c1Jtanl5ek5RdWJGTjdCRkJINzhkVW1SaDlHMkhIc3ByV3RFTmcvV0xITldv?=
 =?utf-8?B?bGlsaUtyUnk4em1sTis5V2dhUCtmN0VTcHd2YW42aU5LQ2E4TFVNNTF5RDZk?=
 =?utf-8?B?eEpTYS9LVTNTRmRXamdCeVhTb21ST3MwSXpsV0x0cEJsdlRvSTlQMHlkNjNh?=
 =?utf-8?B?ZTJlY1dPaGNMdHlzdnlaSUZjK1RIMGFWQy9ZTlNadkN1Q0ZLOWgvWk9oUStu?=
 =?utf-8?B?cG1tbXFoc2x6MkhQZ2hrSWU5NGg3OVVEMUxhalkvaTZ4UGRMOERMUGYxVDVT?=
 =?utf-8?B?WjFROXd1WldnZ0lKS25HbVUwMHhmTjdIamVlMWJYK2o3UXo3WVBNbUJpV1Vl?=
 =?utf-8?B?cmVHQnlUQmtoUy9hYWNRVkg1VFMrSVdsUDE0UlN6UUoyQ1V1VUk1UE0yais2?=
 =?utf-8?B?YkZPT25tdEgrRGhid3QzU2tRMEdFTG1kaWR4RjN3ZmVtblB3K0dYbHlTTkVr?=
 =?utf-8?B?TFJKL0VxWWdiTGNwcXFNN1RGK3Bsd2E3ZW1UYTEzMW9kQzdMVUE3NXBhTDFW?=
 =?utf-8?B?ZVZNS1AyNjNjRzhKclRtTktuWGs1RytZTmI2dkgxVmNTaGV2R1Bkd0dwc3Aw?=
 =?utf-8?B?aDBqVFBXcUppRk1qMnp2dXp2TGZTbTBldjBTL3NNZEFiU1NVMkpIcFJwQ0F6?=
 =?utf-8?B?d2JtR2IrQjA2eWh4RVN5SEdzSzA2cDdJcjUyazErSC9FSk9tYVF2bE9BbFV2?=
 =?utf-8?B?dVRpY0VrbitzdW9BZkRzSDhvQ1BzQ2dmMHkwZUJ6LzNCN2Iva3A5WXFla1Jt?=
 =?utf-8?B?ZlRleEx4ZmJ4aHRjelptZlZCR3h2TlQ5ajNkV2JDQUw5WG1tR3h2NHU0STRT?=
 =?utf-8?B?bi9ZWFVoTVd4NTZDbDNjUXh2MXo0aitaUlRPV0lTdzd2NlJIRGhGUU14NTZO?=
 =?utf-8?B?c2FNb0VVWVBIMTIwR2NaOHc0NGZpQ2srbUtKR054MlFWSmhzQ1JjVHVPeHZs?=
 =?utf-8?B?UFM2R3RoTWxpQVVuR3RzbzRUakJ1TlVYa2VnMm9zMHdxQWI1N3hDdlgwM0x6?=
 =?utf-8?B?VmlidUtRWWVvaEhseFNUd2RhL0pGYTR2cE85WHJpY1RHVHJtMzh2TUVLY0gy?=
 =?utf-8?B?Z056YWFFVzA1cWt5MGhjU2VVNVZrKzNUdTFyVGJvZnV0WXd1WTNmRFczTmpM?=
 =?utf-8?B?cFlDbEdHcVdKSmtVcW1TZUdaSVhUc1ZzQVdNL1d1VG95YUhXSHNZWTljM05D?=
 =?utf-8?B?N2FwdkkrRWdoNldFQXQ5OTNzTEN4ZGxwdDd0SFdhSGFzUWk4blJzNksxeXRo?=
 =?utf-8?B?dDJJNytDaWJSSVpnUit3UmpmaisvNWM3cTNKY045VXVNMXVjQjdiVFR4YkVW?=
 =?utf-8?B?ZFhacGtacjhjTmc4Wkg2bkR6RzFpcUQzdk1iWGs1UHlrUnM2S0ZFbE9nUGpa?=
 =?utf-8?B?SnVMa2p3OXIvbXB1N0tDR3dKT0x1Q1J0MXJTQTJYQkdaWXFRVUtBdEh0emVp?=
 =?utf-8?B?VmlYLzJlMmVVN2hLZDVKTE96bEZTTDVaUzVpeWFzUlZtOEJYUFA0eVk2NCt6?=
 =?utf-8?B?WVdIcU1xVXM1M05xUTVpdUo4Zlc2NEJVTFlacjM4ME9aRkdVL3hHVjlPVHhM?=
 =?utf-8?B?WjdYek9keStKQzg5TU45SXhpZmk0ZU1hV1JFSHlOUTQ5aFVPUmRVc0dIcXFZ?=
 =?utf-8?B?N0ZXdUorUWZEZU9ERStUbmRDZFBYM3ZrUnExTDQzdUc2QzBORXRxdzBsNU1m?=
 =?utf-8?B?N0lHL3FBMWxZeTJqOU41cUhyUFVsUlNqd2RFM21IMFJiNnZFZ1N0UmJ5ZXcx?=
 =?utf-8?B?cUh5QVBEdTdYcVlOVDY0UXNURFdwOVg1Ui9FNWVxWVZITXZFZktmUnZuWENo?=
 =?utf-8?Q?+FaRC3YiWu5h2ICyOlm5VEjBUe9tD9EM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2ZYV2JxalZPLzFPTEo4K1pidS9GL0VXK3F6bmZzNDRqZEhIcCtOYmhyRzAv?=
 =?utf-8?B?bXY3Q3FOTllrT3dsVzBXeGxyb25ieWhBZ2FXTWFZcGc0Q1BhYmNCcytHTnpG?=
 =?utf-8?B?NjRxdngvZUlRaEFkQ1JIdXU5Vyt4SmdzOEVXanVjSlk4RFNXb0NIaWpjdXJR?=
 =?utf-8?B?bDRjZ1VvWExLR0tVRmJRT094cUR6bzFRSXZ5WlFVdldtek1LdjlGYU94ZG1T?=
 =?utf-8?B?dlN0MnVhTkFRMDdsL3lud00rTWdBMytOeE15SUpmVlF5WmplRXJsRzZCTzhF?=
 =?utf-8?B?TVNnVW9aTlU3WWZtRlBZbjNiUkNHS3BJbit4R1cxOEtyTGxJdG5CVkl4SGVE?=
 =?utf-8?B?Z0VCRldmc0VHTGlZRjFwMGRwaVVjSnF0U3NZMEREc2RuK2d1NDRWK0NjT3NH?=
 =?utf-8?B?QjRtNUlHQ1o2RVUrT2xRWnZud1l6ZGhGdlAwVURzQXFNQWNoeFZ1M0JxRkdO?=
 =?utf-8?B?ZWhHTlVzekdhbnlEL0dKUk1BeVFPUk5JVUpCTG5RNVg4K2ppOGczdWs2V3k3?=
 =?utf-8?B?aTVjNGxwUnBtUnF2bkxjci8zTVQzZFc1VkpNNHZDYnlpTk9yVmdPNE9qMVlt?=
 =?utf-8?B?T0RuSFo4RWZyREJIeDFJOWQzT0JDNlJxZXhDci90U0gyYnZzYTRaUXY1UDhR?=
 =?utf-8?B?K2tqNGpoU25tZGMwRHpqZ2p6TWt6c0V4TlYrMUUzcUZBZVpoVUcwWFEybUJ1?=
 =?utf-8?B?bmJpeUo1UDE2aE9aVzEwSDZxN1lqaURtT3NYVzA2dHlXZlFoc0pIVjhoa0JZ?=
 =?utf-8?B?L0J5WWVVVjMyeVFqRVNzZWZhbTBYZzYxMHk1Qk5rSDFjMHZ3Z0I1TXhsbXpQ?=
 =?utf-8?B?RkRHOURZMWtsQ2ZkaFVlcWpJWmdWaEFqTjBCOUE5azl4dEw0OXA1VnRQelF5?=
 =?utf-8?B?R3hOeEJEUWRHVlJBWXN3Nnc4WHRhbWcwZnZ4R0lCTGxraUtwVUowaVFZUHNP?=
 =?utf-8?B?OXBhc1dtT2xIREdLS2dTZUNxOUlMWlp0UXh6YWZVMnNVdHh1NnpKUEtERk9s?=
 =?utf-8?B?ZE9FZStrUWx6MXRsUVJxMVpsUDRnUzd3a045clFTM29sQk1BSmxNSDNuUzFK?=
 =?utf-8?B?Q0RNbEM0bWdQVGtUcVZFdzh6MjRPRS94WFN2NmdudmpoNXZyNzV5MHd1bG1s?=
 =?utf-8?B?ZGZLdFhNUWFHT0pYUWxXLzF3cXJob0lmTWpXVFNkN01nWFZiMHo5aTJVWnhB?=
 =?utf-8?B?dWRmL1l6RGs2bWMraXpMVW12dk5XWERyaTUva2svMG5hVDhkQVdYQjZWNTF6?=
 =?utf-8?B?eE1HelBYMlNpZW5LRnJuRnNTZlV2V3FlQXNxRjRHQU1tWTE1NFpGbEFFMXRz?=
 =?utf-8?B?RmVaRTI4SU1vS0JxVGo3ZnRmYVJjS0NEWWhqQlp2VHVVaEUvcXRONWdiNnpp?=
 =?utf-8?B?bS9QL2w4S09XYkxFRXZOVTlvWVUvZFBScW42Yk40UlYvWDJuYXBzR2ovb25Q?=
 =?utf-8?B?THpkTmlWbmxDYVZTcHBlVzJCTkZ3TTA5R3I3WlcxUTc1T0xtaS9sTVVSdUQ0?=
 =?utf-8?B?S1lCemJhWmFyMjNCQTB2RXFqdnZXcmxEb29Sa1FlZ3N2dEo2dzZBa0ZQOGw1?=
 =?utf-8?B?QU44b2g0RzZwQnBTSmdkMWs4NUZzYzYzdkk5U05uRjlwbkpKOHZnc2NtUmlN?=
 =?utf-8?B?UWdRMVZVVTJVamdLTmRhd1Jtc2NmUnB2ZkRwNG5jTGRLc25LdHZQdEY5dkVx?=
 =?utf-8?B?TzFVcjRZT3R0QXFMSUtCZm9pS0xRcTErOUJScVNGOUczU1lsWWpwRkxERXpo?=
 =?utf-8?B?SlRiTGxRSm0waEpvN05XT015K2N4UFBDelVDaVNucXhRRHdoOUdObFBDYWdo?=
 =?utf-8?B?VWRBQzdOc1d4STJ6N25GWjJtVnhmenlwZW5JUVRuUDFkQ2hzSURLL1VEQVM0?=
 =?utf-8?B?WS9iWngxbzJZVXZrRE10b2s2N21QOVU0TitocFNIUzJocEo4TDdrWXYzcEJ6?=
 =?utf-8?B?UVkxNzZ1WlFwbURsWHRLNlQvdEZ3U1ExTGNOWStycmtGQXdQSmp5Y2hGWU5P?=
 =?utf-8?B?VC9BQjEwaEU0akJDc3ZGWHdVampGMjl5RkpoVlo4ekpSZ0ZWYmhaVjd2RWd6?=
 =?utf-8?B?SkZDcGZ1cE1aQTl5cFNZWFRtRndpV2MzaEpSTTdHNkttelFlcmJCZ1hPRDQr?=
 =?utf-8?Q?DGZbfqBsZb7Gz9aCMhX5pjakq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf49754-3348-4b34-e2b2-08de1bd42656
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 18:58:32.5753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eT9NELXnk6O73QO20Yr0vxAsin22RpiaYMA7RoHMDWSXDEfJ4MYf+qxMS9xqBbSXgbYTtSLuUTAgnCH1POsiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560
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

On 11/4/25 12:53 PM, Lizhi Hou wrote:
> The driver checks the firmware version during initialization.If preemption
> is supported, the driver configures preemption accordingly and handles
> userspace preemption requests. Otherwise, the driver returns an error for
> userspace preemption requests.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c    | 95 +++++++++++++++++++++++++
>   drivers/accel/amdxdna/aie2_msg_priv.h   |  3 +
>   drivers/accel/amdxdna/aie2_pci.c        | 63 ++++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h        |  8 +++
>   drivers/accel/amdxdna/amdxdna_ctx.h     | 17 +++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>   drivers/accel/amdxdna/npu4_regs.c       |  4 ++
>   include/uapi/drm/amdxdna_accel.h        | 16 ++++-
>   8 files changed, 207 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 69cdce9ff208..d493bb1c3360 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -210,6 +210,14 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   	hwctx->fw_ctx_id = resp.context_id;
>   	WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
>   
> +	if (ndev->force_preempt_enabled) {
> +		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, &hwctx->fw_ctx_id);
> +		if (ret) {
> +			XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
> +			return ret;
> +		}
> +	}
> +
>   	cq_pair = &resp.cq_pair[0];
>   	x2i.mb_head_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.head_addr);
>   	x2i.mb_tail_ptr_reg = AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.tail_addr);
> @@ -601,6 +609,11 @@ aie2_cmdlist_fill_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
>   	return 0;
>   }
>   
> +static int aie2_cmdlist_unsupp(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>   static u32 aie2_get_chain_msg_op(u32 cmd_op)
>   {
>   	switch (cmd_op) {
> @@ -621,6 +634,8 @@ static struct aie2_exec_msg_ops legacy_exec_message_ops = {
>   	.init_chain_req = aie2_init_exec_chain_req,
>   	.fill_cf_slot = aie2_cmdlist_fill_cf,
>   	.fill_dpu_slot = aie2_cmdlist_fill_dpu,
> +	.fill_preempt_slot = aie2_cmdlist_unsupp,
> +	.fill_elf_slot = aie2_cmdlist_unsupp,
>   	.get_chain_msg_op = aie2_get_chain_msg_op,
>   };
>   
> @@ -680,6 +695,74 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	return 0;
>   }
>   
> +static int
> +aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
> +{
> +	struct cmd_chain_slot_npu *npu_slot = slot;
> +	struct amdxdna_cmd_preempt_data *pd;
> +	u32 cmd_len;
> +	u32 arg_sz;
> +
> +	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
> +	arg_sz = cmd_len - sizeof(*pd);
> +	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
> +		return -EINVAL;
> +
> +	if (*size < sizeof(*npu_slot) + arg_sz)
> +		return -EINVAL;
> +
> +	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
> +	if (npu_slot->cu_idx == INVALID_CU_IDX)
> +		return -EINVAL;
> +
> +	memset(npu_slot, 0, sizeof(*npu_slot));
> +	npu_slot->type = EXEC_NPU_TYPE_PREEMPT;
> +	npu_slot->inst_buf_addr = pd->inst_buf;
> +	npu_slot->save_buf_addr = pd->save_buf;
> +	npu_slot->restore_buf_addr = pd->restore_buf;
> +	npu_slot->inst_size = pd->inst_size;
> +	npu_slot->save_size = pd->save_size;
> +	npu_slot->restore_size = pd->restore_size;
> +	npu_slot->inst_prop_cnt = pd->inst_prop_cnt;
> +	npu_slot->arg_cnt = arg_sz / sizeof(u32);
> +	memcpy(npu_slot->args, pd->prop_args, arg_sz);

Am I following this right?  I would think this should be:

memcpy(npu_slot->args, pd->prop_args, npu_slot->arg_cnt);

> +
> +	*size = sizeof(*npu_slot) + arg_sz;
> +	return 0;
> +}
> +
> +static int
> +aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size)
> +{
> +	struct cmd_chain_slot_npu *npu_slot = slot;
> +	struct amdxdna_cmd_preempt_data *pd;
> +	u32 cmd_len;
> +	u32 arg_sz;
> +
> +	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
> +	arg_sz = cmd_len - sizeof(*pd);
> +	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
> +		return -EINVAL;
> +
> +	if (*size < sizeof(*npu_slot) + arg_sz)
> +		return -EINVAL;
> +
> +	memset(npu_slot, 0, sizeof(*npu_slot));
> +	npu_slot->type = EXEC_NPU_TYPE_ELF;
> +	npu_slot->inst_buf_addr = pd->inst_buf;
> +	npu_slot->save_buf_addr = pd->save_buf;
> +	npu_slot->restore_buf_addr = pd->restore_buf;
> +	npu_slot->inst_size = pd->inst_size;
> +	npu_slot->save_size = pd->save_size;
> +	npu_slot->restore_size = pd->restore_size;
> +	npu_slot->inst_prop_cnt = pd->inst_prop_cnt;
> +	npu_slot->arg_cnt = 1;
> +	npu_slot->args[0] = AIE2_EXEC_BUFFER_KERNEL_OP_TXN;
> +
> +	*size = struct_size(npu_slot, args, npu_slot->arg_cnt);
> +	return 0;
> +}
> +
>   static u32 aie2_get_npu_chain_msg_op(u32 cmd_op)
>   {
>   	return MSG_OP_CHAIN_EXEC_NPU;
> @@ -691,6 +774,8 @@ static struct aie2_exec_msg_ops npu_exec_message_ops = {
>   	.init_chain_req = aie2_init_npu_chain_req,
>   	.fill_cf_slot = aie2_cmdlist_fill_npu_cf,
>   	.fill_dpu_slot = aie2_cmdlist_fill_npu_dpu,
> +	.fill_preempt_slot = aie2_cmdlist_fill_npu_preempt,
> +	.fill_elf_slot = aie2_cmdlist_fill_npu_elf,
>   	.get_chain_msg_op = aie2_get_npu_chain_msg_op,
>   };
>   
> @@ -749,6 +834,16 @@ aie2_cmdlist_fill_slot(void *slot, struct amdxdna_gem_obj *cmd_abo,
>   	case ERT_START_NPU:
>   		ret = EXEC_MSG_OPS(xdna)->fill_dpu_slot(cmd_abo, slot, size);
>   		break;
> +	case ERT_START_NPU_PREEMPT:
> +		if (!AIE2_FEATURE_ON(xdna->dev_handle, AIE2_PREEMPT))
> +			return -EOPNOTSUPP;
> +		ret = EXEC_MSG_OPS(xdna)->fill_preempt_slot(cmd_abo, slot, size);
> +		break;
> +	case ERT_START_NPU_PREEMPT_ELF:
> +		if (!AIE2_FEATURE_ON(xdna->dev_handle, AIE2_PREEMPT))
> +			return -EOPNOTSUPP;
> +		ret = EXEC_MSG_OPS(xdna)->fill_elf_slot(cmd_abo, slot, size);
> +		break;
>   	default:
>   		XDNA_INFO(xdna, "Unsupported op %d", op);
>   		ret = -EOPNOTSUPP;
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 947daa63f064..1c957a6298d3 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -176,6 +176,8 @@ struct exec_dpu_req {
>   enum exec_npu_type {
>   	EXEC_NPU_TYPE_NON_ELF		= 0x1,
>   	EXEC_NPU_TYPE_PARTIAL_ELF	= 0x2,
> +	EXEC_NPU_TYPE_PREEMPT		= 0x3,
> +	EXEC_NPU_TYPE_ELF		= 0x4,
>   };
>   
>   union exec_req {
> @@ -372,6 +374,7 @@ struct cmd_chain_slot_dpu {
>   };
>   
>   #define MAX_NPU_ARGS_SIZE (26 * sizeof(__u32))
> +#define AIE2_EXEC_BUFFER_KERNEL_OP_TXN	3
>   struct cmd_chain_slot_npu {
>   	enum exec_npu_type type;
>   	u64 inst_buf_addr;
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index d7ccbdaf47f5..ceef1c502e9e 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -183,6 +183,10 @@ int aie2_runtime_cfg(struct amdxdna_dev_hdl *ndev,
>   		if (cfg->category != category)
>   			continue;
>   
> +		if (cfg->feature_mask &&
> +		    bitmap_subset(&cfg->feature_mask, &ndev->feature_mask, AIE2_FEATURE_MAX))
> +			continue;
> +
>   		value = val ? *val : cfg->value;
>   		ret = aie2_set_runtime_cfg(ndev, cfg->type, value);
>   		if (ret) {
> @@ -932,6 +936,25 @@ static int aie2_get_telemetry(struct amdxdna_client *client,
>   	return 0;
>   }
>   
> +static int aie2_get_preempt_state(struct amdxdna_client *client,
> +				  struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_attribute_state state = {};
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_dev_hdl *ndev;
> +
> +	ndev = xdna->dev_handle;
> +	if (args->param == DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE)
> +		state.state = ndev->force_preempt_enabled;
> +	else if (args->param == DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE)
> +		state.state = ndev->frame_boundary_preempt;
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &state, sizeof(state)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
>   {
>   	struct amdxdna_dev *xdna = client->xdna;
> @@ -972,6 +995,10 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
>   		ret = aie2_query_resource_info(client, args);
>   		break;
> +	case DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE:
> +	case DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE:
> +		ret = aie2_get_preempt_state(client, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> @@ -1078,6 +1105,38 @@ static int aie2_set_power_mode(struct amdxdna_client *client,
>   	return aie2_pm_set_mode(xdna->dev_handle, power_mode);
>   }
>   
> +static int aie2_set_preempt_state(struct amdxdna_client *client,
> +				  struct amdxdna_drm_set_state *args)
> +{
> +	struct amdxdna_dev_hdl *ndev = client->xdna->dev_handle;
> +	struct amdxdna_drm_attribute_state state;
> +	u32 val;
> +	int ret;
> +
> +	if (copy_from_user(&state, u64_to_user_ptr(args->buffer), sizeof(state)))
> +		return -EFAULT;
> +
> +	if (state.state > 1)
> +		return -EINVAL;
> +
> +	if (XDNA_MBZ_DBG(client->xdna, state.pad, sizeof(state.pad)))
> +		return -EINVAL;
> +
> +	if (args->param == DRM_AMDXDNA_SET_FORCE_PREEMPT) {
> +		ndev->force_preempt_enabled = state.state;
> +	} else if (args->param == DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT) {
> +		val = state.state;
> +		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT,
> +				       &val);
> +		if (ret)
> +			return ret;
> +
> +		ndev->frame_boundary_preempt = state.state;
> +	}
> +
> +	return 0;
> +}
> +
>   static int aie2_set_state(struct amdxdna_client *client,
>   			  struct amdxdna_drm_set_state *args)
>   {
> @@ -1095,6 +1154,10 @@ static int aie2_set_state(struct amdxdna_client *client,
>   	case DRM_AMDXDNA_SET_POWER_MODE:
>   		ret = aie2_set_power_mode(client, args);
>   		break;
> +	case DRM_AMDXDNA_SET_FORCE_PREEMPT:
> +	case DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT:
> +		ret = aie2_set_preempt_state(client, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 9793cd1e0c55..a5f9c42155d1 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -110,12 +110,15 @@ struct aie_metadata {
>   enum rt_config_category {
>   	AIE2_RT_CFG_INIT,
>   	AIE2_RT_CFG_CLK_GATING,
> +	AIE2_RT_CFG_FORCE_PREEMPT,
> +	AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT,
>   };
>   
>   struct rt_config {
>   	u32	type;
>   	u32	value;
>   	u32	category;
> +	unsigned long feature_mask;
>   };
>   
>   struct dpm_clk_freq {
> @@ -164,6 +167,8 @@ struct aie2_exec_msg_ops {
>   	void (*init_chain_req)(void *req, u64 slot_addr, size_t size, u32 cmd_cnt);
>   	int (*fill_cf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
>   	int (*fill_dpu_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
> +	int (*fill_preempt_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
> +	int (*fill_elf_slot)(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *size);
>   	u32 (*get_chain_msg_op)(u32 cmd_op);
>   };
>   
> @@ -197,6 +202,8 @@ struct amdxdna_dev_hdl {
>   	u32				hclk_freq;
>   	u32				max_tops;
>   	u32				curr_tops;
> +	u32				force_preempt_enabled;
> +	u32				frame_boundary_preempt;
>   
>   	/* Mailbox and the management channel */
>   	struct mailbox			*mbox;
> @@ -223,6 +230,7 @@ struct aie2_hw_ops {
>   
>   enum aie2_fw_feature {
>   	AIE2_NPU_COMMAND,
> +	AIE2_PREEMPT,
>   	AIE2_FEATURE_MAX
>   };
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index d02fb32499fa..b6151244d64f 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -16,6 +16,8 @@ enum ert_cmd_opcode {
>   	ERT_START_CU = 0,
>   	ERT_CMD_CHAIN = 19,
>   	ERT_START_NPU = 20,
> +	ERT_START_NPU_PREEMPT = 21,
> +	ERT_START_NPU_PREEMPT_ELF = 22,
>   	ERT_INVALID_CMD	= ~0U,
>   };
>   
> @@ -55,6 +57,21 @@ struct amdxdna_cmd_chain {
>   	u64 data[] __counted_by(command_count);
>   };
>   
> +/*
> + * Interpretation of the beginning of data payload for ERT_START_NPU_PREEMPT in
> + * amdxdna_cmd. The rest of the payload in amdxdna_cmd is regular kernel args.
> + */
> +struct amdxdna_cmd_preempt_data {
> +	u64 inst_buf;	    /* instruction buffer address */
> +	u64 save_buf;	    /* save buffer address */
> +	u64 restore_buf;    /* restore buffer address */
> +	u32 inst_size;	    /* size of instruction buffer in bytes */
> +	u32 save_size;	    /* size of save buffer in bytes */
> +	u32 restore_size;   /* size of restore buffer in bytes */
> +	u32 inst_prop_cnt;  /* properties count */
> +	u32 prop_args[];    /* properties and regular kernel arguments */
> +};
> +
>   /* Exec buffer command header format */
>   #define AMDXDNA_CMD_STATE		GENMASK(3, 0)
>   #define AMDXDNA_CMD_EXTRA_CU_MASK	GENMASK(11, 10)
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 7590265d4485..1973ab67721b 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -31,9 +31,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>    * 0.3: Support firmware debug buffer
>    * 0.4: Support getting resource information
>    * 0.5: Support getting telemetry data
> + * 0.6: Support preemption
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		5
> +#define AMDXDNA_DRIVER_MINOR		6
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index d90777275a9f..986a5f28ba24 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -64,10 +64,13 @@
>   const struct rt_config npu4_default_rt_cfg[] = {
>   	{ 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
>   	{ 10, 1, AIE2_RT_CFG_INIT }, /* DEBUG BUF */
> +	{ 14, 0, AIE2_RT_CFG_INIT, BIT_U64(AIE2_PREEMPT) }, /* Frame boundary preemption */
>   	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>   	{ 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>   	{ 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>   	{ 4, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
> +	{ 13, 0, AIE2_RT_CFG_FORCE_PREEMPT },
> +	{ 14, 0, AIE2_RT_CFG_FRAME_BOUNDARY_PREEMPT },
>   	{ 0 },
>   };
>   
> @@ -85,6 +88,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>   
>   const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>   	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
> +	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
>   	{ 0 }
>   };
>   
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index 8ad254bc35a5..62c917fd4f7b 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -443,7 +443,9 @@ enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
>   	DRM_AMDXDNA_GET_POWER_MODE,
>   	DRM_AMDXDNA_QUERY_TELEMETRY,
> -	DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,
> +	DRM_AMDXDNA_GET_FORCE_PREEMPT_STATE,
> +	DRM_AMDXDNA_QUERY_RESOURCE_INFO,
> +	DRM_AMDXDNA_GET_FRAME_BOUNDARY_PREEMPT_STATE,
>   };
>   
>   /**
> @@ -462,6 +464,16 @@ struct amdxdna_drm_get_resource_info {
>   	__u64 npu_task_curr;
>   };
>   
> +/**
> + * struct amdxdna_drm_attribute_state - State of an attribute
> + */
> +struct amdxdna_drm_attribute_state {
> +	/** @state: enabled or disabled */
> +	__u8 state;
> +	/** @pad: MBZ */
> +	__u8 pad[7];
> +};
> +
>   /**
>    * struct amdxdna_drm_query_telemetry_header - Telemetry data header
>    */
> @@ -613,6 +625,8 @@ enum amdxdna_drm_set_param {
>   	DRM_AMDXDNA_SET_POWER_MODE,
>   	DRM_AMDXDNA_WRITE_AIE_MEM,
>   	DRM_AMDXDNA_WRITE_AIE_REG,
> +	DRM_AMDXDNA_SET_FORCE_PREEMPT,
> +	DRM_AMDXDNA_SET_FRAME_BOUNDARY_PREEMPT,
>   };
>   
>   /**

