Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0057EC3D08C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B32A10E9A1;
	Thu,  6 Nov 2025 18:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EVMqJf/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97B210E9A1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMdImSM+x34eqh4NASHcJjp9nXwU4djWXbDI9K968t8AqxmsVAlQN548olYXwkGZ5FDP2Z76L3L7enzOIeQC7nN6Xa0m+BhkzdCVjeeR3iJg3qIPnCOVkXSdYF8DaJq/DIfbQer07tF4mQCI1ppHrdE6oaChb6VvPlNYf7lMnNXIRoj48eZB5IVcCLphznIKgChUGVxMRqB80B2ElzdTaTQrbOGCKssQQlEAu0klQ6vlkYEt+HGRugbQne/Xrgy9nrLAT6XW3qEynyLlbHVfRhhaV897TUt6XACoU8dip9q7w/IhXCMHf529XNcrMS6UOHhMBtbxl17jXLW+xOuKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNUD4SmZhwaWjLx3jKfdoutYk0P/DV99CqEjfViTn9w=;
 b=Rg/5tlA5aA5571A8gtaLk5NtTws2rRoNBDbGo98MFEO0RmGyCqSNOlEbLzwuDRoSa4mxSARWftxWmY/FNI7VZLYvJNbDaN9HFk53c4+vDUOe98Vv8rQOJAVjDYkB9vkzbZE76WGwuXk8gngGbd8SsSxTlEa8lybp6pRRd2eliJSnGfmAcG3YYtKXBFuv8UK42fUkpKVgaj9FzZidrwY3u59tN9VSuHiAhoEecX8R1Ji4PhA5ehMNphfxrtFbaffunkz4f18gp5/x32Iv5SNZ4/ai9ndfgWxuB9d88Xv6dHTmaNTVu9VHAwVpTmbiKyW64jGsi8FFNQSho56XNzrynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNUD4SmZhwaWjLx3jKfdoutYk0P/DV99CqEjfViTn9w=;
 b=EVMqJf/NlELQ7hr2q7f3vOLQ06XUF5JbjLP6i25nAqc7OcptvmTPzTu1Ha7bVqZLwDXOgTq2sYx8nyOfrI8yF0NEv9OJAM2pH+io8cOPUy+FG8xyrrCaQoI8b+o2cVwLkINUt1oAJ/1sOITyGdjs00YsP4f7zSLE7as36F1ngH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 18:12:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 18:12:38 +0000
Message-ID: <d21ece5b-d27b-447f-8a8e-5d672fa0c473@amd.com>
Date: Thu, 6 Nov 2025 12:12:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Treat power-off failure as unrecoverable
 error
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251106180521.1095218-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251106180521.1095218-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: bf19eae5-19ec-47b2-dfb0-08de1d601167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmZnZk9JVU1DMXRuc3loNHZqNHJ2bzdSZXZwQUNiQXI1Tjc3Yk9ScmY0Qk1S?=
 =?utf-8?B?M1dVdGp3UXZBK3BqR0t4WC94dHgyYXZFUExQNm5FZ2lrTTEyMFNmUnMrckNG?=
 =?utf-8?B?Zk0yeUpocXY1NGQ1L05Idmx0bFJGUjN0ZXkvZ2Q3VUdxdXBlTlNJU1N0NnR6?=
 =?utf-8?B?cGIzVSttY2h1L1dzMjNvcjRqTzB5M0xCWW5OYmQ1ZUN1Z1RwK25YMjFOeFhJ?=
 =?utf-8?B?ekNsbXkzb2I4WStiVmViQWJRT2RjNTVGTVVIODZwSkZxelgzZmhUUU9id0ZH?=
 =?utf-8?B?dFlMQmJyQnlsVVJLMVRNSTg1VjlOTFhvZTc0c21mZjJ0L002d0hjR04rQ3Vw?=
 =?utf-8?B?S0JaSTJZdG9oOTJsUEVrTFVBTlpQRHh3THc5ZW9CSUc2S0NOU1ZPL2dzdzNG?=
 =?utf-8?B?Uno2cTY5dnJDQUZ1RmxvNWlXN2ptT3lqdm5aUWYwWE1YV1BQc3F0SUFlSE9G?=
 =?utf-8?B?NTVBSEdiazE4RWhZZTBCc2JkUUxhUVl4YUNZYjlIMGZWd0xVa0pvZ3FGaitH?=
 =?utf-8?B?cFpCL21nV0IyQk94VklOU3owbjM3QnpsL05NOCtzYVg3RnZSbmRBeEgwa0di?=
 =?utf-8?B?TkRBOS9HWUwvNTJUYlBLV0xZM3RCMENZSllWenFYb1VpQWpHbzRFSWxpMEpD?=
 =?utf-8?B?Znh1MEFBd0ZNemdUaGUzUzBBcW9POElSU2QxMUp3d1ZGNXBhWmFRQzdOV3Ji?=
 =?utf-8?B?dVpxL3JCQlVSRVNLMUJLak1nc2w0TWdQaXNmRW91cHF6SkNFcTdtV1lsMFFa?=
 =?utf-8?B?QjUxSERGdjE4VkoxcWFSU3U0cjBtcUNvbUoyTVZQWXllTzlxd2wzVDdybTB0?=
 =?utf-8?B?RVRGaE4rdzB2V0pDRDdTTFA3R2Z1UUt3OGF6MHkzb0NUQkh3M2Q5S1FVYm40?=
 =?utf-8?B?UkJnckN3VW40ZjA0cHZQZ3ZiOHN5Yi9pMWZkM3pYdTVSTWpCMmRJR25rckFZ?=
 =?utf-8?B?TWtEUG8rbDhyRzRlZDRlV0t4aGdqY0xGM3RmMXNDT2NFcGkyWk8xYVJkZElI?=
 =?utf-8?B?cmRJWFpGRUVaRFR6NmkrRzJ5bHBya3czL3VmaTJsSUU4dFBkNGtpejhWSzZk?=
 =?utf-8?B?N2lDeUlySFVzeU8zSzRTQktiN2hNUG1hZXQzN24waGZsUUhGQTJJOUZHMFkr?=
 =?utf-8?B?Z0Z0UDBESnhnMHNabUJMQVVEYWkvbGZCK203YUJPcVdMRHlyRU1yellNODA1?=
 =?utf-8?B?eTIwaFRpMnJHbm5uV3dTOGU5Ymc1WXdlNmxMdDNuVlVabWVBa2VWN3NneUEy?=
 =?utf-8?B?eEpxMnVjUWwyNVprZWliYWlGWHYzQWhjQXcrbURIWit3ejlabTRBM040YU1q?=
 =?utf-8?B?amJWTm9tYmNUUTFzbUFaR1k1S0xTT0JPaVcrOFdzVjlPMkhuWlJVSVFNdmpV?=
 =?utf-8?B?QjdIY2I0RlExSHFQRWdtTU1jeTVvRHFVOFNiTVZPR1hXRXY0Tzg2Umowb0xw?=
 =?utf-8?B?UzVscWJXOEt1NkV6UzdCWmQ1SkpIVnFpOFY4VlVLNXV5ZmhYUFg3U1VvV3A3?=
 =?utf-8?B?TWJIdGZINDBQWVk2YXF3eHo4QTNpcHBtMXJzRzRqNnhNb09uWG1KYmI4Vitm?=
 =?utf-8?B?ZW82VVJMbEFOaHZpUWUzb0hveXpLYU9HdnUvZE5Vb1RPRFVOR1phdXRpd1Rr?=
 =?utf-8?B?Ui9pbW1rZTc3NG5OczNrdVdMWkl5Z00rT1BwdUJRMEc1VDNRTVVuYUdvS1oy?=
 =?utf-8?B?QmxmWm1QWndxZ2xwTzFPQ0h3U2dDRVV5V1VKSFF1QlBRdFlCWi9FdkU2Z2hh?=
 =?utf-8?B?cndKOTVEYWVxT3JOc3lqSm04WnBVSWczVjZrQ28xYjRZYS81MHJlUloxU2h6?=
 =?utf-8?B?WFNvQU9XcVBmbDJ6b1lvaHlPZmsxYVE5MnhXVGZTMzV2VzBXQmdpbVhBdDcz?=
 =?utf-8?B?d1dxbWY3OTJ1Z0VkVUhsV2x5MWlWOGEwMVJpakxUOEVZRVFjQ3VpVi9PWWJG?=
 =?utf-8?Q?0qnvZEl2jZdUP97pBErKjzXcNT/vZQUZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3ZCRzVXQXhKNGw3a1U3SWJTelVhUjQ5WDlXdFUvVVluTE9KYkwwYzVESk5B?=
 =?utf-8?B?UVpGMEw5RkUrVElycTZ4bHkwblA4Z01Od3p0WEpLdVVjQnZHK2FQVVFDa3hz?=
 =?utf-8?B?RWxtdFBVT0RvZWdYUVN1RUFkckJINHpSUFpNNnpPTE9ZK1N6TXVZS3BmN1dS?=
 =?utf-8?B?NUNxVWVCT25oY1lxR05Lem1Fc2oram5EY0xzTFo4NmJQa2ZMZmszM2ttK0tr?=
 =?utf-8?B?aFJwQVlEbkJpeFVNa3FtdEtuWFJGcW0rVmxOOEZaeDllWjBKcGxMUTh5dWo2?=
 =?utf-8?B?dTg2OGpoUlNhaDVYOHkwV0hHWlBtSzRPSHZjMlJlWDAxdEZWdHdWRkdkRjF4?=
 =?utf-8?B?Y21sdlFnT0NDeUM0eXVmY01ZaTVoWEZxTE9uOS9MYnNzbW5NL0pLQi9JM0o0?=
 =?utf-8?B?NmUzekJZVkZOM0lxWktPYmZ5Um1rQlhQZWxJb3R5anFzeXJzSGVDVXFBT2ZE?=
 =?utf-8?B?Z0xNTm9aYUEwTkJyd0QxbElFSzlWRStHWFNtWUpGeSs2UHJ6TFZrK0lWM3BP?=
 =?utf-8?B?MHNaQzVnajdzZzVoNC9aaWJjMzZVWHByWUlxWWpzcDd2eEJlQzZHYXlrYVgw?=
 =?utf-8?B?bk1kYmYvZHlrYk8vVTJJQUxPWUJpRFN0bjAxbHZQNzJGYU5BQTdUTDhXb2Zj?=
 =?utf-8?B?SDFkQmh0ZHVqVHVNclg3OGdzSGJhRWRLaVUvN1NIdjRqdElmUXpvWDdlSFUx?=
 =?utf-8?B?Mlpmb1VlbmdBaXNYemtENDQ5M0ROeWtpWlJKRGcyRUlsMHdYSzRUaE14UW0x?=
 =?utf-8?B?L2dyb2JtbVU2bm9Fa290SVVIQmFyRC9VeGU4bTFvS3ZabEpsNk5aYzU4S0Mv?=
 =?utf-8?B?R0szeDkrd3hraFc2eFRjZGRTbG0wQmdzMk9COFBTR3RHQWJQWDEwNmV5ekY2?=
 =?utf-8?B?bnZIQmZ2cURPRGJRR1A0WjdvRWtWSisyUXZNMUxZQTQySW42Rm9uRUJlWmQx?=
 =?utf-8?B?R2tiUzJMU2hOMVF1Y3kvTCtuVy9xbjAzWGxHL25iYnBGNXhJdUxGdGFYWGhF?=
 =?utf-8?B?OVVxQlJlZU0ycUloQmhMQkhrc3VhWW5oRUwyOXN0SC9ZeE5oM0xoL2xWRmtm?=
 =?utf-8?B?VEUvNmwySDJFejFSeDRhbGRHblFrd2FUODEzU3hVL0IrTjlycWROOTZXbTU3?=
 =?utf-8?B?SWtLMmhxMjJlVkExT1Y2TGtUMGYyK1plVWRweHQ0cW14cTlOT1Q0NHBkdjYr?=
 =?utf-8?B?YWdQR2xBQzJkam1ldEY3N0I2T2YydGJ0TDZnMHNTMnJScGJtWVdzU1dOUllV?=
 =?utf-8?B?WmtmRFhrdVpCU1crRWQzUWw4RzUwTHpSNTlVK25ZeE5WSmFCOXhMcDRuMHpl?=
 =?utf-8?B?d0hlbWRWd1plbFJrVmliaFRmVW1sdTE0dW5QUndQVml6MEEyN2VDU21Rb0RZ?=
 =?utf-8?B?Wm5GVTUwblcybndvYk1GS1NKbXhlR2pNVEV0T0xvdGFNY3JuQXNzWGRCbDJq?=
 =?utf-8?B?RGNneVRGZXoxWC9rUHhtUHkwR2owTVZzd05UdFEzS094cFh5MEg3RHdyOTZh?=
 =?utf-8?B?b3I4L1owdlgrTDhEaVJEUHVLdWE5N0J3RVZZQjR6NDhkZXhqKys4WHI1NVNn?=
 =?utf-8?B?bDdoOEl0eVpJVXRNUEhQOG1WV21qZ1FqODhzSWNxdmlYbWJhcXM3ajZQaDZk?=
 =?utf-8?B?TXYvK0lnY1BXZThOcGJBa3FvNEJyOGQ3RmVOZElOMzJ3dTY4ditCblJxKzg0?=
 =?utf-8?B?WFhVSXV2S1FidFdYcWxVVTM4YzlpRW82am1jTzF1akVvZktFUTRCdm96eXU2?=
 =?utf-8?B?L0d2ZThZVCs0YmxWRzRpVGtkK2k1ekdtcDBRRWI5eTV1NW8wLzdnSnN6S3Nn?=
 =?utf-8?B?bytKLzJsT3Rwb1M1eXBHNjIvaVA1anJyRjRxWThGMFVVZ1BHcGp5YmZyd0hR?=
 =?utf-8?B?ak5kV0kyQzc2aVJvaDJYVlUvMXNsaFFMbzJ2NWhHVzcwbjBoODFOZVIwenlZ?=
 =?utf-8?B?N090c1BJMVFzVXdndFpxa2dnV3QyUnplOTZLTGhiWjdyUnoyNzZIY1FGV0sr?=
 =?utf-8?B?ZFBxSWJqZEZSZjlzZXlrYlBuZEUzaGpOQmdzL2VpZjZyN3lRTStpd3I0OUFt?=
 =?utf-8?B?TldXdUJ1Z0wzVjlmdUVFcXVhR1dGeDJuYVhLNFZCb2VCT0Z0U0swdHZhVXVS?=
 =?utf-8?Q?oBCaPWVfocMRvrgR4brWoykXX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf19eae5-19ec-47b2-dfb0-08de1d601167
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 18:12:38.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70FLLzSmOg7bw1DS2D5F/O+B5B0LW1Hpew9Xkbd0k5ChKnBZWadI8qI82tAk1cOepzeKJ+3YBN43Tc88haT21w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
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

On 11/6/25 12:05 PM, Lizhi Hou wrote:
> Failing to set power off indicates an unrecoverable hardware or firmware
> error. Update the driver to treat such a failure as a fatal condition
> and stop further operations that depend on successful power state
> transition.
> 
> This prevents undefined behavior when the hardware remains in an
> unexpected state after a failed power-off attempt.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Presumably all versions of hardware in the wild can handle receiving a 
power off command if they're already powered off?

> ---
>   drivers/accel/amdxdna/aie2_smu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 11c0e9e7b03a..bd94ee96c2bc 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -147,6 +147,16 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
>   {
>   	int ret;
>   
> +	/*
> +	 * Failing to set power off indicates an unrecoverable hardware or
> +	 * firmware error.
> +	 */
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0, NULL);
> +	if (ret) {
> +		XDNA_ERR(ndev->xdna, "Access power failed, ret %d", ret);
> +		return ret;
> +	}
> +
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);

