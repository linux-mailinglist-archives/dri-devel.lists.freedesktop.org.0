Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B6565BE6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350B510E437;
	Mon,  4 Jul 2022 16:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3BE10E14A;
 Mon,  4 Jul 2022 13:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5wpjCfEuZYQm3EYiZ/yqt/tbadRxLTdbagjgQ2NRUiu/5m/c6tCY1MIRKqXOglRMiiGPI9w++tA6zqRF7gBISLG5FbTxvS4cx/K3/UB9et29hdJiRLaGuOjcw/Sa+r3kH07VDeoLJtceNPVLJmcudqJDbGvC3KQcar5z1uRql2Xxm/lqV9TIItB5AZdmKyxw2me9SUZQS17EbSnusO2qLzzomMErCdY1XzYNZByMyURIsxf4TwoU//7HKesM/6d3IBKMzJru6lUDmEyVtTHoNKxYN06qCA9glfuw0p3o8P78CVUDj8h8f6CNcv/FxrsVxHo0UlGyE4e2xhWBv42sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByN3piC/NabrzeYnre7gMCEI+G0kGabN9VOxcCZs26U=;
 b=aZZcuZyJj+wWqP1/5YzZBLKYnK4NftZyxArPOUebbDX4H71bouCjoAl/hx/y2CyASNXf4Bjgit6Gd6loB3vMXtJInfLNuvRWLQtDw0nSWqLC7raRDpfq0vVMk7zjJ6QyN4R3EZLS/bhuWlUYeSTOL+OvJ6lh609H5w54ODsq3bxGsqZtRrMwdCxyi3yILTm0ukwwm+bXxt/VMGO2iIMl4AtEJA63Y6B83tiaDi0eZKLg26SFVVRKyCWAA6mRVhAQ6I5cdqHA95tQ2Bme/AWfDhlZheaOGHSKw9PaaGEfTdfFlCI+yEkGCBcfSNsZtSWfteL3b0Znbe+EEDhUX47QPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByN3piC/NabrzeYnre7gMCEI+G0kGabN9VOxcCZs26U=;
 b=gqxCrlZwKIrv0KHf+Lk0rjfrBeXya1+hzY+ffJngwZAnwFBRoaZyCnQMJnmC1wDyQZITZyvhFzVVm12lGMvOIFah3gWBUCkU/LlMZO78b2tGQcG1yPc5aPxG+diCSG8tAhRXnm3GWP4/IZo59vxY7/BNcXSxBa8ARhdks88jd+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Mon, 4 Jul
 2022 13:49:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 13:49:25 +0000
Message-ID: <db6ab6f5-e3b1-f068-37ac-807e1ff074a8@amd.com>
Date: Mon, 4 Jul 2022 15:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amdpgu/debugfs: Simplify some exit paths
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 'Pan Xinhui' <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220704134532.103876-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220704134532.103876-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d23044-07dd-4581-7f2c-08da5dc4019e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oshKryzAF0lIBSmO1W8kPGXjQoI7vXwXMj2KDxPnzBlMaR6tPRjhUPdHzV56JiSwHvGTIZnt9SQi4AEWQMtk7qsi7GVXX7M5aIzBzE6KV6yUWI7Lob8DZVzFC3i0ZlxTg8KFD7qcupC4H6HCyJrEn1kUndYuPMPpEjXEc2Tc3KzQnI3yjLaHp03ZmM2MrveVixHuEy1OQdre9Eunxit/l/mNhWcJJ7c1svRAELnju9eIov+6zynpGoTO6ephuLpi8TuCvfkq4YKiyvLs1tE0hAar5esTgAdvKkRz0f8bIZZ5SjWOkGN55azxHeuB1ief/pBm8sGNApwz8zJf9FF+EUOhqim4F9tkeQuwjZHKa5WTO7reYqnMw3IL3z9YdqaZVJHvmTVN/9eRXtm9f4u6dTECvQ5286P4GZNkHvsLeQ+nz5DiRzBUq+7yfUFSExwjee47w0L72k7yEV6fw/yR5J2fEZx3e1pnItFise6dO0hXQ5eeVyfkF6XGPC1eDQQAjG9VuPNvnfwHolp/dAyBP8N2jRdmSUklFeeRy46+WlMEd2izGjzS5O+M1IEGzMj+/7gyoDR5boo9U1miQHaJVMPRJF5GYh+DvjMf9GfnCt3XPbP/VC53gioOqEbGMqq1ANp22fpKWu1oUzGP+EfU9vkoZGjYzO0sxDR1LWKXkvJKt8w+14o9a3klhjUDt5NAMg2P6GsmSSBbiUUPtpXh4o5J75os83iL+aWI824/sgnZ8hONteNobUnkBEcaDgROFhlg1DRyR+N80oGxTfo9QQVSVxqcHuOgbthCX5Kxkj5SXQWpEZQhmd/u2h8UZ2O/cp1uo40N4BoClDAK2np6P8bLkpfh1gUta2Gs9YgzLFYeqzPcLVhj3BLDxf4ScEo3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(8936002)(110136005)(66946007)(86362001)(4326008)(66556008)(66476007)(31696002)(8676002)(316002)(186003)(66574015)(38100700002)(2616005)(83380400001)(921005)(41300700001)(6666004)(478600001)(6486002)(6506007)(6512007)(5660300002)(36756003)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEMrYVp0YnRHU2cybElZd0NBODk0dHNUYnN4azNEQVJvS2dFT1JuaW8rL2lh?=
 =?utf-8?B?aldvOHk1OVV1L3RQaUZKRWo0M29YTkxaVHF0OWF3a1dPYlhxbWJOczY1VXRZ?=
 =?utf-8?B?cml2dzBQZUhPTEk3QXRFY0xoRk9SNmN1dmdpKy9jZlZOZE4rSmRPdU0wVWFl?=
 =?utf-8?B?NURJdmJoREZSL2x0VkJqdXFHTDNhaEtMZXpLRDYvYjFZcVk3S2U1bHNKQlpQ?=
 =?utf-8?B?Q0lRYUhyaktQdTdKTzZ0eEgrNGtXQmNCaHl6SFg1WlpNUjVYZ3ZROExLQlFI?=
 =?utf-8?B?cTRtTDkvNmJrS0pORlpnV1ZWWEdNOGZCYmh5WUhMQXMvam9ocjJrSFRndkt3?=
 =?utf-8?B?MGpzVzdCVlB3SzJ0TzdjZC9qWFB3djdXeXZoK28wT3BXbVNvNkE5bWRwUkZS?=
 =?utf-8?B?eWFmTmNpSjNpNmNTa0wvdUx5UEZyOUVBL3JtTlRRMDVpSUxCS1ArTTVldzJS?=
 =?utf-8?B?Y043WVVCK3dsWUE2eTBmcm1PTStNMkVLdDdsTHZVL1gyTzdaUE4rK21ncS9V?=
 =?utf-8?B?RWJSdUZrcG9vZzhvYndSUnlIZ1Q2QXROZXAyWmQ5dE1aR2ZsQmY0bG5nR3pY?=
 =?utf-8?B?cy8za09UeGh1d2d2OHJNb1dMM3kxdmsyTDZaRXQvcmdGZHBtWmEyc04yRjJ3?=
 =?utf-8?B?dGxYWllMK1VEM2pEc1Nrci9FY29ZdWc2eWxVRXIvb0YzVjR1R3dhYU5GSGxB?=
 =?utf-8?B?MEhzYTdNdVlVdFhhdFo4QW8vRDFrR2RtSUhOLzEyWDB6elJtYlZyR0xGMWJE?=
 =?utf-8?B?YnpCWlV6OU1TaTZrS2hobkxBaVJVM0RPbEd2ajhxRzVTSkxwZkZqVE90QXI2?=
 =?utf-8?B?eW9wVncwcFYwSFpqc091cys2NjYrNkZ6QTF2M2ZiZ0QxS3lPQkNPZHprYUVi?=
 =?utf-8?B?VHNUbkdrS3Z1K2ljTVJiNDl3OVNPU1cya0E5ZUNsRWQ2OW5oYWlDY25VaWV3?=
 =?utf-8?B?RjRhcHB4ZHZnMWhxemc2d1pXVUpaSnExSytxSWk5YW5lZ2ZZN2ZBQndyc09M?=
 =?utf-8?B?ZFZKNEVLcG9OWW1GRHdyeG83WUFDZHRLWGlqaXlhTnlEanZLbkRHcDFHaThz?=
 =?utf-8?B?S0g4dnhVT0lqK2R4L25jbUdIbHJnd1Y0NE9VR09KcnYwQ29rVTY5Q29LZVFt?=
 =?utf-8?B?U0YwbFhhSlBsV1A4Q3dydHpJNjV6QWxYS3VTT3BvTkQ1THFyZUIvQzIrZW5Z?=
 =?utf-8?B?NHRkdmp0a0ZtMk9rVmt0WjYvbFhlUURwSHdub2RoL2ZZSXNVa3IwQnZXTWNz?=
 =?utf-8?B?eEcwRy9nMEIxT3FwRmI5QzVDUFJRZGQ3R0FPbFoydHFuTDQwTWdBb2k0VS93?=
 =?utf-8?B?eHR6M0RGakRObU9tdXZxeFhlb1NFV1JDdzFtUFE5Y0p6V1N6bHRWQXpqcnFJ?=
 =?utf-8?B?NTJFaGh3RTZQK0hlOC8rekVwd2liWDRlbE5ZYllUYS9KTWwzd1crZmZlc2tx?=
 =?utf-8?B?Y1FWTHV2QzZaWm05N2JNcjZzYjk5ZU1HN2doR1F5MENPR0ZpNUloWExUNjQ3?=
 =?utf-8?B?SXd5dGs5VXlsaElRbTVxVEFqaFkzUEVGWmRtNWFQMU4rRWZpcHNlVWpMRS9V?=
 =?utf-8?B?NDdFV3FYQWh4QUdOK3pVMUtjbFZaWXhaT2duKzJITHlHZlJlNzM2K3NqOW1r?=
 =?utf-8?B?bExZeUtIc3owM1M2L2QyU0VDQU4zeGkrY0JSSEllTWhkTHRvUlN2dTB5UDBD?=
 =?utf-8?B?NExJNUxDNVlodG9ZSTJGUGhKbklBa05pMUd2aGhmT0ZxQUtaSDdYMzc2V1k1?=
 =?utf-8?B?aWhaYnlDUlpLSnZqYkFjMW50aDlhKzNjS3lFNXlZZFd2NER1emhHN090Nkk1?=
 =?utf-8?B?a3MxNnA3MXc2dWorUmFiWndkWGV2YndsQWpRNTdOeHFnVzZHZ01mMWlEMkxl?=
 =?utf-8?B?V2RKMzBhMmtNTityQjB2cFFpRDZNV2ZvTlVjdU5zazMwdjNWRFhVMDRXRjVE?=
 =?utf-8?B?T2VvRDIydnhydTZmc09HMExBQnlFYnVQMzRTdEw2bWErRXNUQXA1QUd5dXlV?=
 =?utf-8?B?T3o2N2hsZGJGV0pqQlV1RXZ1VVlNOVZPL1BadVdDT3o3aGN4eCtKbktZTDRF?=
 =?utf-8?B?T2FZSURrYWtzNVFHZnRIbTlGN0djQkErUW16U3NPZ3ErM1JURkVXTHBjN1hE?=
 =?utf-8?B?M1RRc0RCU3A1UWRGejhKejhtSmlZczdKd0VHWHlLT1hHWEpWU2RRcHNyK2Vh?=
 =?utf-8?Q?ttPOJ+1B7t66gVLaQ5G/mk/oVF7WbVWrflgx5q7k4frn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d23044-07dd-4581-7f2c-08da5dc4019e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:49:25.0202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOV5Ly27Vmiz1RN9WK21IUWL0JuAZ2TtXhd+lr2jmiyuwhicPngFDLel1bAbYOMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.07.22 um 15:45 schrieb André Almeida:
> To avoid code repetition, unify the function exit path when possible. No
> functional changes.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 107 ++++++++------------
>   1 file changed, 42 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index f3ac7912c29c..f3b3c688e4e7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -383,12 +383,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
>   
>   		value = RREG32_PCIE(*pos);
>   		r = put_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			amdgpu_virt_disable_access_debugfs(adev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		result += 4;
>   		buf += 4;
> @@ -396,11 +392,12 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -
>   	amdgpu_virt_disable_access_debugfs(adev);
> -	return result;
> +	return r;
>   }
>   
>   /**
> @@ -441,12 +438,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
>   		uint32_t value;
>   
>   		r = get_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			amdgpu_virt_disable_access_debugfs(adev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		WREG32_PCIE(*pos, value);
>   
> @@ -456,11 +449,12 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -
>   	amdgpu_virt_disable_access_debugfs(adev);
> -	return result;
> +	return r;
>   }
>   
>   /**
> @@ -502,12 +496,8 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
>   
>   		value = RREG32_DIDT(*pos >> 2);
>   		r = put_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			amdgpu_virt_disable_access_debugfs(adev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		result += 4;
>   		buf += 4;
> @@ -515,11 +505,12 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -
>   	amdgpu_virt_disable_access_debugfs(adev);
> -	return result;
> +	return r;
>   }
>   
>   /**
> @@ -560,12 +551,8 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
>   		uint32_t value;
>   
>   		r = get_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			amdgpu_virt_disable_access_debugfs(adev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		WREG32_DIDT(*pos >> 2, value);
>   
> @@ -575,11 +562,12 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -
>   	amdgpu_virt_disable_access_debugfs(adev);
> -	return result;
> +	return r;
>   }
>   
>   /**
> @@ -621,12 +609,8 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
>   
>   		value = RREG32_SMC(*pos);
>   		r = put_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			amdgpu_virt_disable_access_debugfs(adev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		result += 4;
>   		buf += 4;
> @@ -634,11 +618,12 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -
>   	amdgpu_virt_disable_access_debugfs(adev);
> -	return result;
> +	return r;
>   }
>   
>   /**
> @@ -679,12 +664,8 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
>   		uint32_t value;
>   
>   		r = get_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			amdgpu_virt_disable_access_debugfs(adev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		WREG32_SMC(*pos, value);
>   
> @@ -694,11 +675,12 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -
>   	amdgpu_virt_disable_access_debugfs(adev);
> -	return result;
> +	return r;
>   }
>   
>   /**
> @@ -1090,11 +1072,8 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
>   		uint32_t value;
>   
>   		r = get_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		amdgpu_gfx_off_ctrl(adev, value ? true : false);
>   
> @@ -1104,10 +1083,12 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>   
> -	return result;
> +	return r;
>   }
>   
>   
> @@ -1139,18 +1120,12 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
>   		uint32_t value;
>   
>   		r = amdgpu_get_gfx_off_status(adev, &value);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		r = put_user(value, (uint32_t *)buf);
> -		if (r) {
> -			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> -			return r;
> -		}
> +		if (r)
> +			goto out;
>   
>   		result += 4;
>   		buf += 4;
> @@ -1158,10 +1133,12 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
>   		size -= 4;
>   	}
>   
> +	r = result;
> +out:
>   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>   
> -	return result;
> +	return r;
>   }
>   
>   static const struct file_operations amdgpu_debugfs_regs2_fops = {

