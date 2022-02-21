Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A14BD91A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A860010E82A;
	Mon, 21 Feb 2022 10:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F093310E811;
 Mon, 21 Feb 2022 10:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI2CeO5fpm0S+n39ytoxRzbGoXriNykxZlC2N0s/u3N8zalOjh3KbRneoh3kpq+ndNFKDfUfuZ/G8o2Ro12PskWL5MmPyM3wrH7EsD+EQI22OD154oNfaz24Y62wACJvbwoZ6u+m4en/V7ztbA/4hn4sTr6jMi4F0gyLLEbAoGWo30byFDJWMmb4omWs2NiZhMkvvGtYryknO68eyNwBcjeHzscOfBhp0yXakqHOUk5zFHxfKnOunzQX+jJzhiSyrcn4ObLIeEeMM7vS9xd2gkEHzyQa5OTcu9/m7gL91/9QIHZMX3MWh/NhffkPoFi3T9284J+glirB2T4EbtHZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8clvoOxm7+7c4D3BTExzoWieZO0+85MDo0X8K3ZTpQU=;
 b=hBoOX0Fgt8vCz4qU2fE2wXOCD8sG6oYmQVp1vHIpTX66kjJHHf2+3RTiQZB0UjZf6wSb9Ng4HAPfqzesqJxXeMebcvKyLQhbYNG3d5cNWq61jrWzcKEbVeNeAreltooznDHHRXHBJav41SK9mf2YXNESPRkFc3bx5qtkjdysFz8NNB05atL7wlbwGVDcFEGKXluzJVcpD0bbYaicAzwwotCiq3dSFBA87VzMgr6vTCFdoDxagKxK0PNu+dmkysl992rwq35aq2BuLf4MmGedCBge4nafImnHLtHJ6blm43DuiXwodI+UeBvhmV1Fiog0DRTCxCc2jDC1PesGTT3u0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8clvoOxm7+7c4D3BTExzoWieZO0+85MDo0X8K3ZTpQU=;
 b=n7s6/xC9A4cxE56plItJVZN4f65cFr5gyMDonlpWcPLSDLexY6rLV191bi4Old7KWf9W8EGhpsD0gaQY310hGpT4Hjs0hidACKaZugDn+r4Clk5bPG2nWbqcpoTrOt+IdBzcy5h4WjCy8hMiEcqimFroJhgQ0a9UcakRFRD72RE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5475.namprd12.prod.outlook.com (2603:10b6:5:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Mon, 21 Feb
 2022 10:32:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 10:32:16 +0000
Message-ID: <6e0ebf4b-ffd7-df55-8ae9-472878f22605@amd.com>
Date: Mon, 21 Feb 2022 11:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm ready by evicting
Content-Language: en-US
To: Qiang Yu <qiang.yu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220221101239.2863-1-qiang.yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220221101239.2863-1-qiang.yu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9353dc55-295c-4a2b-7277-08d9f5256e19
X-MS-TrafficTypeDiagnostic: CO6PR12MB5475:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5475325AC0A88F62DE191309833A9@CO6PR12MB5475.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDjcX13Ims5hef8r+rjd7fgrcenwO1VvyhUE/q1nJDIGTZdxKCltD68dzhJ3yrFnKVP26mUWtiv4SIiy0xdViQZusCgrL/8YS43Oe5KgBqaLANPqzSprLtuFeIKFEdd8NfLbvUNavRmJFIAuP+N8gmle6ODFghWHy9sS+MY6D9YXDISmWYdYXmFm1psrq9e5IguWvlCJzJDBZhQAOYa8QgWCVB3lkslWv1cktNzRJq2iO/Vr48efL9MuIn/fz4lNSM1n0IiMohy4xEz+jSJpo96ihmk0Z/OdHv9+oO/qEfWtVHg475p3h9tAcwPCR0Pho9cpUPYaaGxgHPk9N5Y1S4u67pAd2qcg0adCfAFyNs7f7y7/g5p5L0XAIGi5iSeX7iX75IFbSd5wf9iObvYRWRTYF5pqtbjSo9Sl3ik6FtqqeYGaOMj+pPgF5Erd6p8FpkfUaSTVTSwgi1qq+WpcovZkhHtbpzjdBIq5jtREc2Ouua8eqENxuRwrGefNYGGzS9DAJRKn5Y3KQDLvejboBPNgPtr3xtOyakMNxNiPHIUQL4Tfjgwh0jlwIFe+5peR2MD5F7mNkx2o8Yq4VCIOX+vojl6i+NM44fpIS2A5eI/x2ivZJxlC5Y0few5FyuBzL7ZQbdYbT5JPodmXAh2aFKcfnCu4aLJ5FcJk70zmblRiRNouMA0IpplvPItUAnkHYixE0CwpptWALC/oxG1thNPM/rrYYzGZHfawzPyJKtXtn5n3yXJdDyUdvC6+JG8r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(31696002)(2906002)(2616005)(8936002)(38100700002)(186003)(26005)(86362001)(6512007)(316002)(66476007)(31686004)(66556008)(6666004)(83380400001)(110136005)(66574015)(6506007)(6486002)(8676002)(508600001)(4326008)(36756003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNKOW03cThGSkJBS1ZueGJzaFlZeStQNmtmNlB1azBubGdocmgrNTJ4Yzd3?=
 =?utf-8?B?L05DSHFYblpiMVdFK0VXc1hDTis0Q0hPOFRBWm10bm9taW5hMS94S2Y1akJF?=
 =?utf-8?B?bUxGSy9WRUxpQUFnZi9nTm5IWmNjZnNQUi85emQzQWdTQnpwZjVzcmF1dUFR?=
 =?utf-8?B?Nm9ZY2VVZWNVaE4xRkpCQXF4RjJCdmF1NVJPdm15T0ZuSWZMN051NVozZkdp?=
 =?utf-8?B?OWc2S2x2d3d1dGhBdkV2OHBhRUEzdFIweHpTaTFLbFJlM0t6Q1FyNlQzVVh0?=
 =?utf-8?B?cW0wMDVuek9WQmwvK0h2TWJDTTF1NjhoVWtJeEZkWXBVZnk2c2NWR0lPQk1U?=
 =?utf-8?B?NHlRN0xYNHh4TWJTdS92Z2N2WVEyUkIyNzNxc1Q2UEpVUjhhTUQ0YlI2L1NI?=
 =?utf-8?B?M3RNTm1QQ3ByRkNWYWtuR3IyTEFkZGZVVGlDSUdPcWNXTVV5VURTaHgyYUxX?=
 =?utf-8?B?cnFEK0w0d1NTa1RjdWl5a0phaUhpdzJPRlo4eWZkOWVwS003U0o3UWkxUHUz?=
 =?utf-8?B?WjZINDllZndSNGZ6dTlRdk05NDNUMUZvSTUzSkVidXhPaURjcnM5dE5WdlFy?=
 =?utf-8?B?d2tiMGI2VGRhb1VDRWNKOUk4Q09rTDYwYWtIaVVPQVdRTjAvNXVkdERybmpU?=
 =?utf-8?B?ZEd6UlhpeW0zc1ovR080UCtZNXFJZm1VeGJQampnSEpkM1NtVS9VR2hBc1Y5?=
 =?utf-8?B?TzI3RC9TTlRxMGpLT0owc2V1QXd0T2NyL0FvYndQaTJodFdMZEVyMXdVS0dv?=
 =?utf-8?B?L01GdXVEZGRpUm1TdXdsaXUweHorSHNMZUhQdkZsSXljOEFaTWwyK0J0V0Jl?=
 =?utf-8?B?MHpKOVVXeWZQRnhPOEVPNXh1bXVZSGJ0VTd1MWZhMndhYnBXMzhyYzM2K2tu?=
 =?utf-8?B?MnpYUUxOTUhqQ3RWZWNkdWxFWHN0SzJpSVhRd014MWdUakpaSHVwd1hmcXZ6?=
 =?utf-8?B?cGdVK2JFeDdFUjZPU2JWMDliRERHVmcxZ2ZyditxaGxZMGlseUxKYWpNRG8w?=
 =?utf-8?B?UkJUNFZ0d1JTdWU1NW1vczdKNjdOeVB4bGozUWJKcTc3Q1dROW1aajBMQTcv?=
 =?utf-8?B?T3lWemhwR1REUW9qdy93MmhrWE90dWIxNENORU5vSWtPU0J5SThqSlhHMlNi?=
 =?utf-8?B?ek1PQndtekFyMkZtcFAwOFp0VFFzRU1GMlgyL0haTXpaMmlFcFpsYjdsdHNL?=
 =?utf-8?B?VWp3SXFqMFpGWGh2emJkWFVERCtPUU14TG8zWnYxNDdsbWIwRURjbzAwWEp3?=
 =?utf-8?B?T3U0eTBkaEFyVWVCcGZvUVFOQWF4YkQ3YXFxSWlwZm1CNW9BTENWemFoTWph?=
 =?utf-8?B?NUVhcTlqQmhiWWtFU09GRGsya3Q0VTBCRExtbXpIRVJIaVZ6Q0FCZTliWElh?=
 =?utf-8?B?Rmo3UGNwOFBZZzU0aTNPWDBRaFVQbkRMY3FTdkJObm5xRGpYV2o5ajRHclN0?=
 =?utf-8?B?aUNwcG5jVkx3K3hNVkQ2OEdEQ2VjTjI1TDZlMjlMNXZpQVMyWEMxY01nTEEz?=
 =?utf-8?B?R1pmb1lIejJWN1dmemJGaFAxMHh1QnhVMmQzNklLclFybWZ2RU8wU1NaL05v?=
 =?utf-8?B?VFpXT0psekhFU3dwRmlkc1prT3FjUDlsUHJyUTVhbFliaVZYOGFlMTJFT1F2?=
 =?utf-8?B?RUI4eE1EUHh2d3RvUDhRQTZ2bC9PSlNIdmMxYmdwdERCeU8yRUhIUVNjeHp2?=
 =?utf-8?B?elFROUNva0RRUDRjbkpSdjJjVFNvcklDKzVLK01tSkxENFBBTlR1bGppMCtv?=
 =?utf-8?B?dDhqcCttcm94R1Y1VmxCYWw0VHYweHRjdzBlREFUa05ZUHR2UWxlbHFhSEVR?=
 =?utf-8?B?SHQ1YTBEVFdXdzczTnVPemU4RXB0dHRLa2JDUFA2UmFtZkE2Wm5ZRi9IOW5T?=
 =?utf-8?B?Rk9YRWN0TnpCaU5mUU03VDBJcTFjS3hlS2dlaTdURHIxTGtnZllGUkhjTGht?=
 =?utf-8?B?OWh3WmVoYTdHT3NURXJLQ1NRUi9NRVNYSUEvVUNuaE9JQUQycWgyN3dGaTVx?=
 =?utf-8?B?b3hncFE1RHVWS2VJNU5RTVJZaWcvSGYvTVlueDd2OTlkQkJTZzJoVUVQVTRw?=
 =?utf-8?B?TTF4ZTNBQVUvYXNzcVhVc3YwYjg2cHNWSUR2ZFFmVmJVUVdDdUpaWnVPbGk3?=
 =?utf-8?Q?OI8o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9353dc55-295c-4a2b-7277-08d9f5256e19
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 10:32:16.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tlt1Aufo+vZlj0sno3JcJPl0o4VNqymRGIfTeX0lT4WaSCEuWGu4mWinpKvtTvOS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5475
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 21.02.22 um 11:12 schrieb Qiang Yu:
> Workstation application ANSA/META get this error dmesg:
> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
>
> This is caused by:
> 1. create a 256MB buffer in invisible VRAM
> 2. CPU map the buffer and access it causes vm_fault and try to move
>     it to visible VRAM
> 3. force visible VRAM space and traverse all VRAM bos to check if
>     evicting this bo is valuable
> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>     will set amdgpu_vm->evicting, but latter due to not in visible
>     VRAM, won't really evict it so not add it to amdgpu_vm->evicted
> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>     ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>     but fail in amdgpu_vm_bo_update_mapping() (check
>     amdgpu_vm->evicting) and get this error log
>
> This error won't affect functionality as next CS will finish the
> waiting VM ops. But we'd better clear the error log by check the
> evicting flag which really stop VM ops latter.
>
> Signed-off-by: Qiang Yu <qiang.yu@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Good work.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 37acd8911168..2cd9f1a2e5fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -770,11 +770,16 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>    * Check if all VM PDs/PTs are ready for updates
>    *
>    * Returns:
> - * True if eviction list is empty.
> + * True if VM is not evicting.
>    */
>   bool amdgpu_vm_ready(struct amdgpu_vm *vm)
>   {
> -	return list_empty(&vm->evicted);
> +	bool ret;
> +
> +	amdgpu_vm_eviction_lock(vm);
> +	ret = !vm->evicting;
> +	amdgpu_vm_eviction_unlock(vm);
> +	return ret;
>   }
>   
>   /**

