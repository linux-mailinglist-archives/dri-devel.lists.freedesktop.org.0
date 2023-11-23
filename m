Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D077F59D0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 09:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7682010E6E1;
	Thu, 23 Nov 2023 08:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4E10E6E1;
 Thu, 23 Nov 2023 08:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYkIN1vcL2GzHiik0Zwn/qot5oCHgODeev3qEd5sSZyI8+0RofuwOG39ACSoYhh8Zv1dZUAzRxESGHSdwXOFLMQ73NqJBoB+L47+3LDe6kMOIsYM7ydaGnbcV0sc3FB3kb1VbtfoGjqRqgYW4RmUkprFqRwUkhK2Qv1GN4wuKL0Kw1L4S3ds0AisBvSB859OPQ+EB66OOFW4OHDvCax7x16lIToIu+Jii8cRq88LwqZE+f5WyfcqhWqAvFEiMfKF8cGPM/nObDeiJFkeLeGmzn8w936QCVAINOvl7HbaubU3egpEPIqyJRhzWfxkHBIJ7j87hBR8NnVeIv8gFRGB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/OGA91yjrWEzU130/irqVPfX6VtwaaC95LXnAOJN1U=;
 b=iip9M/pC0Xj9cLJQM5YR4tlD0PGWahuAqqMpHhpnGF60fA8wSrJPSAZpH3OJrWX7T+8Ff/PzaX1D8LlIHXAFxQ+wKYNrSlccZbmUDBVXjChqMSOVCwKDckpC+J544g67br7nMw6cQuDTKKzRxTHDSxiVDeQjLEK9cm2903RBwFJiGW9CRfn/NycrVuxi6+uwAKmeG3ydb+AxpSdYd7r/lhaaLRrHcFtZy6GCP8SJ32GV0W5e1TzZOztZUi0IiMmnufu50zq/R3DqIN7qDMX48kRCicVgpNSqm/wcOLTFEVJIBSZlVtpiIEUFgC3YLQj3rrhPbDf7LRodN2DMXs288g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/OGA91yjrWEzU130/irqVPfX6VtwaaC95LXnAOJN1U=;
 b=pyflYm4gvULif2hfcjCG/T3IHp7yKLjBjQH6o4TFdypbz8haxGFrvOW5CPl36hlTza2Wv6nhTEeiwkGPAgybxpnGSNpDG4wtT4OKrft+iOvbAHp5lqlLv9M9tPam757ADhf5Zvxola8hORM83o/00TKYRYnX/VWHQ2eYsdNW03o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 08:11:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.019; Thu, 23 Nov 2023
 08:11:50 +0000
Message-ID: <80ea6067-c531-4765-8576-265e565525fa@amd.com>
Date: Thu, 23 Nov 2023 09:11:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes
 kernel null pointer
Content-Language: en-US
To: Lu Yao <yaolu@kylinos.cn>, airlied@gmail.com, daniel@ffwll.ch
References: <20231122093509.34302-1-yaolu@kylinos.cn>
 <20231123012234.5783-1-yaolu@kylinos.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231123012234.5783-1-yaolu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2e7dae-e44b-49a0-9513-08dbebfbd86e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+O+GAheGHjpYn9uYY6ZIiySzHM1osl+e5hudzdASql7km+ddi7qI4ch0EdpdhzV3AX3MxV1TcyJ/lpoDic3rUis3D5MsMM16O6mAK0gfB+RvKRrJwApZiZali9tRlgIeGxGFK07iF0hxLFQZK+NzNBf1h43RASI67zg3sq1HjBusazIYdVFf2qVRjGWM06n3ozmt8PtUl43MJcRABwqYkDeAH10HUoh2YTJTIxhBIguYfOevETEgo5eL9Pr46TR2/TBwKGXNItjJY3cg7vn/MwnO8TdJHJUm2gzl4yP+Sqo0zGXd7v+SYiX8s/THGCDFJk6SiEHR2c3LCQQ2C2/4RSFls2FAqsLDkdDm6ewb6U8VNkLSTTtVTjKHllKL56WTvvAXOo2l2vBKBZ5B7UM0NSFd8O8An9hRHJDq7sLCAq+qNRmlo/Xt1v4DM/3BeawGYeRfmHI+73ehnj/6i6L5nUK+noDw9PNNQpj3rojl5XcdxnJJgAQP8fA1Ls/kNlxCXmqSk+gybdqopOVrRg4eVfTVcoukH9Rl1MSNWHodypebs9oHwdCBsAQZCkieQfEazoFAcq17Uom4fI60t7sdppOqU58uTi6+/lFAjnpMHrxK1ACw05HvtoRhzw2/KTV+QS8ZzDTqf0K8Wb/zZt7pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(316002)(966005)(6486002)(31686004)(478600001)(6666004)(6512007)(66946007)(8676002)(83380400001)(26005)(4326008)(8936002)(66476007)(66556008)(2906002)(36756003)(38100700002)(41300700001)(86362001)(31696002)(6506007)(2616005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ni9FdkdENkdpeDl3K2pJZmluNUdaMnlhNHNDOHRtZi9DNCtwZ2UyNUxqM1pS?=
 =?utf-8?B?REd0VW0rRmhGa21JM3U5bnNPMWdQNTNLVEhYUlZKWjJ3ZXpsWWJkcCsrZ2U2?=
 =?utf-8?B?VXZOL3lvb2lpQmtFeEZ1U0RZWjFVUVVzZWhyN0I2N2NzOEs2NFJRc2c3Q2hB?=
 =?utf-8?B?Q2J1TnpLL1hEUGtsY3Qramd6a2s4cjRRMnFLNXZoclVXeFdvaE51ZVQyWTdO?=
 =?utf-8?B?NmdzTGVPdmwzWUlvR1gzL1VIRldBNDVlMVFFaTJtOFZiYnBqd2xmNjVzRkEy?=
 =?utf-8?B?R2w5Y245M3NDV3pkTFhDT20zZ0JMYmFneFErSlozUWQ4citTemlpRCs3YjZW?=
 =?utf-8?B?Wjg2YVZJbW9RZElFZUZHcjlBYU5CT25BSnM4eHNQUGpoa0xWSGRiZ1RyeEdS?=
 =?utf-8?B?bVc0a2g5cFhLOHNoWC9hUDFJODNySW1Nd1ErMFpNQm9lTXU1eko3UVIzVitF?=
 =?utf-8?B?NFFsbWtPYUIxUjQwOHJGdzZWYXF1SGNxZVREUlFmcmJvbnY1NWo1ZUsvNWNF?=
 =?utf-8?B?MnBRbW5BWHhDWHBtSHZ0NVY2ckRheXk4OGlJYlJwTnIvWXR4QVFPZThPRzJ0?=
 =?utf-8?B?dmtFMnVneUdoL21MUXJKSnVqTnVKc1lzTmZPYkROSkl6Z2E2dEJ1c1RoSWxO?=
 =?utf-8?B?djNRU3pPRWJFYjBiby9Raks3TGZyUU8zYndyUUdZVWllR0pDb3NKcDRpb1I2?=
 =?utf-8?B?Mmc0MXcwajB2S2FheTZWOWxsTUpDZk4vOW1rOFUwb2ljVXlVQmZ1NDZaZnJw?=
 =?utf-8?B?QjhXZ1A4cHlDUVFsTnBFRmk3S1ZQNmFLYnBwZGNKNXJGbGkrcmo3NnVwL0pB?=
 =?utf-8?B?dys4Ujd6K0xxcnJxODNoUXlHU1NTTzFvRDV3b0xpbWpSWW9oc2RGNjFRT1VT?=
 =?utf-8?B?YmtPRE5oRkNDdmpBUitPWHZOeWhUZFU2b1Q4N2t2cERtanlQeXJ6ZWRSMkFO?=
 =?utf-8?B?VHZjR2pEcUJObEVlQlhwb1ZHNFFBeENDdFhSUjZ5dUx5bjdhL21zMXRIMUlB?=
 =?utf-8?B?MjFRVlF1LzVRakhtbXdLQ3ZjMnNtcmcrdU5uaG9UQlZHQ2lsaUNTRitSZjZT?=
 =?utf-8?B?bUdZeTRSM0VSUGJyNXpjVjMwRG9aVExCV2lUWkRtWFM2MmZ0VkxzeGd5N3VV?=
 =?utf-8?B?Z1p2dzAzemswMDlTU2M1Vi9yU3poUUZwZ1ZRWm1LSHM1LzFxOWZhcHNmVmV1?=
 =?utf-8?B?N0d0SFk0VENhVWNCckJkTFJscFk0eFlhQnMvN0F6dFpYZXJNZHUyUlFPaWh3?=
 =?utf-8?B?YUFmdGZZVXNTbHRBZVB4VEpRVVAzOWl2ZGI1bzdhMzgxeVR4eVE3VTVqMUpJ?=
 =?utf-8?B?SWFEMVdPZnBMR3BLL01rVDdXWmlRWjFia3YycXQ5bndZSkQ3NG10cVRweWxC?=
 =?utf-8?B?SEd4Mk1QbVB6cnBLUGpnMTZwN1VObCtiZWxIa2I3QXlFbm1PYmwxZnNvdEU2?=
 =?utf-8?B?ZWNxejROMStXQmhBWHk1dDBVZEIxQjVweW9NdnArYzBQbS9jOG5GdHR2QlFE?=
 =?utf-8?B?UW9Lb1BRT3pGRDhxSDZzL0pJUGpRc2dIbEE4bERPdjZHdHBOb0EyRnczUFNi?=
 =?utf-8?B?dTdtMnFycnkvYXUvdTNRd1JieDIvMURqallpT25Va0YxeU9UMXNjemVhWWlV?=
 =?utf-8?B?bzFRck9WNmVzZGZ4akdaY1cvNnRPOEx4byszb3VyTllVRmNEZktRRlMwTUJk?=
 =?utf-8?B?bFowbGQyeFB3Tkd3YlZENjBjRDFVRWpIYXhTMXJBL2hWYWJFZ0EwYWJQQVVH?=
 =?utf-8?B?a3pPb21rM1RRZFl6TCtBbW44dnlkNzlXb0JXMGVEMWxvYTJERk5ob29YM3dF?=
 =?utf-8?B?R1NkTDhVVS90alVHVnpyNnJmNklGNllUaTJYTXRIK2hna0ZZckpmSE5PWTZN?=
 =?utf-8?B?VTgrK3AyajB0SThKWjBzSVByOEtDNmd6czBDSk9IOWJHdWRvelhWajgzRDdW?=
 =?utf-8?B?blRiZGllYjBpK0xWZ2lIMlluSUgrMG9TM3ErbzB6TVJ1cHU0L0pKL21EaGg3?=
 =?utf-8?B?WGg5Mm5YenBYbmdneWRyWnVoamZJNmpPYjlsdnR2NTlmTU1Hend0NVMxOEtq?=
 =?utf-8?B?anpzS2pISFAvdkJiTzFEZEdlWGJyVW9ENGlyeHVDazMxQVlXWFJiRnI5WnZn?=
 =?utf-8?Q?EPZulcoi2np6+W3/VU1tns5cz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2e7dae-e44b-49a0-9513-08dbebfbd86e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:11:50.4874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlVNJOeoVDwaZtVOGaYtJp6QG0WrAvP1rP9UOmhRnpbv8qG8xKQZy67kPpGK3j5F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.23 um 02:22 schrieb Lu Yao:
> For 'AMDGPU_FAMILY_SI' family cards, in 'si_common_early_init' func, init
> 'didt_rreg' and 'didt_wreg' to 'NULL'. But in func
> 'amdgpu_debugfs_regs_didt_read/write', using 'RREG32_DIDT' 'WREG32_DIDT'
> lacks of relevant judgment. And other 'amdgpu_ip_block_version' that use
> these two definitions won't be added for 'AMDGPU_FAMILY_SI'.
>
> So, add null pointer judgment before calling.
>
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes in v2:
>    1. Drop dev_err message.
>    2. Change error code from 'EPERM' to 'EOPNOTSUPP'
> Link to v1: https://lore.kernel.org/all/20231122093509.34302-1-yaolu@kylinos.cn/
> Thanks Christian for his comments.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index a53f436fa9f1..e098cd66fa2a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -638,6 +638,9 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
>   	if (size & 0x3 || *pos & 0x3)
>   		return -EINVAL;
>   
> +	if (adev->didt_rreg == NULL)
> +		return -EOPNOTSUPP;
> +
>   	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
>   	if (r < 0) {
>   		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> @@ -694,6 +697,9 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
>   	if (size & 0x3 || *pos & 0x3)
>   		return -EINVAL;
>   
> +	if (adev->didt_wreg == NULL)
> +		return -EOPNOTSUPP;
> +
>   	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
>   	if (r < 0) {
>   		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);

