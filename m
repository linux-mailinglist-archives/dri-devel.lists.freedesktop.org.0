Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68D691861
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 07:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5132B10EC5F;
	Fri, 10 Feb 2023 06:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFE810EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 06:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3gUiOVIIJnpPpwG7h1a2IrPrrBHngaDAfmt1Jl6gPGSOPrsmQiHi969EMq9P++AHgTkfF1/734xeo72kE7k4yKUFR69h2pB9DXdXEUQ1LfWNsIAeb0Bl9dmJZBDRR9flfsiMWMUyoE9pxfgC+6Qu81ZJdktlw7GIymAIT1Txs55N/zvHroQD+u7ywbC0MRVzaghAB+z7CShZjPxzGAD7VKifDaJg/mcwUJhpYCLqsrMVOY2Q0IXyqs3X0lZg8t4eRU6jYZ90uEEbi04K9PubgCIaKIRpWHncH3n7rEo5sDiDlA/OdvgZ947KW3z4ZVn8JLAaNNyWvG4gvTX4TWcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/KDKLH6x+1xJi/tEYgyot2ZMbhmEP8PDWV5WEq1PYY=;
 b=AHEel/Gt3LVnfxl2uicXnHlOJJaVdWOFU/Umjd8DLWZH0c0zxWNwz74R0YKqVi/oAX70cczGFZp4Rbec6JOkX9qJSarIVzsBcm83pFB8uupq8QVME1jl8hmvSeyLqnf2LFWpdbPkHgT6jpROqYIFosNcP+ROjjgcsDvY8IB7O4FQzW2xyEBdCKQuLCwcTPCUyR8g8mLzDSQ8pfTxRGwDMui4uChtWw4TLxG8+j7VilWshA9baV2snt4shqRapn8ISS9mkaaURQqgKpT7pV+vLttBneOYs/2g++wZDqI1xL5WV5/yTNqgQ1FUWAQSZgfdCNvGmOZ546p9kTfMCzydMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/KDKLH6x+1xJi/tEYgyot2ZMbhmEP8PDWV5WEq1PYY=;
 b=tt1P7TR3+vzk59XIJgUyCXpA6qtC+dg8HUEcaRLlAdcRrqM24fyeSb1zOKaS0d/rpltDnWceeXf4fQkOnD1y6UqFzoU5yQcTxYPxOvHu/DLiecVVRK/z2ZHpZT6gFfoE3QZiJ975sgOHaOGR9nPUxsK/5OFXgZAx1+si0p9oHEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 06:16:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 06:16:06 +0000
Message-ID: <a9fec448-e1f1-f927-659c-3a50651478dc@amd.com>
Date: Fri, 10 Feb 2023 07:16:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/vmwgfx: Make the driver work without the dummy
 resources
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230210023437.2214816-1-zack@kde.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230210023437.2214816-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: df7fd011-0fb2-472e-5886-08db0b2e4b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYIi/t4pKsDTTtHnDrB8JRoO4XlLkpN5xptVz+fKhxsO+iLF3MhjOkpwIKoXZn+yONBHUPV+KfzSEybtQTh/kYENuV/xSMLVYN0fmUHyD3g/P+R+kHtayKGYainanxf6UVoey6/kFrxtci7eADK2wLyzjZxWVhLv4RYVqORtRM9G2KFftx/xlzVKIlcPBzJ9RYdBWC+0ZylXvKqHhlGxzKxVcXlBysBorJHaL3xWTUxyfWJ1zZ0OBAx3GkglQzdFDHPv3+asmkpHJXc4Q4O96JCjVjZSrcL08unpMuhVEoXQ5yFv5nxCJupIRDLa+6aVlmUjbzbdS8STawmgaXusks42jUo/68xRfdS6MzGhhVQS499e/i7wC1MuAja2FQjs/Gmfgrefs7XVNIdKIIntFlP+erxkcQrJTAB6fEOMso2Pw7lVVON0ZHeLHCAR6EnHGm5hF/lTUNdR5wsGwpsNaIdEYAUmxTTcR2IIXtDvNZ7rktc2YQHLh2U1w2UlVx2bgEyOEZZmHshrkvZaFVD+xTvPuawvXt1kmNu0W0/sSUj1jNujoiL7dsAaGj9AjOqQ94M2jUsnmdFi3CJ4GP2usmuVDDEv77wq/s+EoS3SKbbA3Lr/uF7Cp2KeqWRHsdnpLIIcN+zW97Qn+0ufQoSC6Fzlf6kJWYfN28YsSli6di/fNA4lHKuiCPO+F0KwaS9nnvQUCOfMk2MvjPWlJQkeLHNcyWgVicm4GCCe99PqXtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199018)(66476007)(4326008)(66946007)(8676002)(31696002)(316002)(38100700002)(66556008)(66574015)(54906003)(86362001)(478600001)(31686004)(6506007)(6486002)(186003)(6666004)(83380400001)(6512007)(36756003)(2906002)(5660300002)(41300700001)(8936002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2RqUGF2R0VJcFV0RkYwZ0R3NzRZWDB3QlRPZWpaQ0toQjBKR0xKMDM2c1FH?=
 =?utf-8?B?TWFFTjhTNUFVUGFYbDd6YmUvb1ppVTVkVmpueFVSYTVVZCtmTEZHRUhYM2tr?=
 =?utf-8?B?SUpaajNMbU5ZUTRtWTI4S1A0QWhlODBmOCtxYWpaSSs1bVdmcnhIdk5SUXdD?=
 =?utf-8?B?VzZ0QzdhK0cwd1NWdHlGVDVNUVNoRUtzRUdRQ1ZjakxJZkFJQ3BJVnA1a2pK?=
 =?utf-8?B?c0tSa1NEcE5NQWdqNFJldS9wMUR6bjNrTWtFeXFTTnN3ekpha2F4U040M2Qx?=
 =?utf-8?B?Y3dxMlloa3VuZzNLUmtyK0xEU3N0cXZiZVRGcURPcS8rQVlyZzRtVG1UOGUr?=
 =?utf-8?B?OERTamIzdkNNQ2lJU050aEVhWldsNzlsbE9lcHBZOHBrMnlLdlVBOG5kdFlL?=
 =?utf-8?B?SlBkZUxYWW10c0hNdGh4WEN1eUJMdjAwNEdEbnlXeU1QaHRmd0ZLMDNiWjlt?=
 =?utf-8?B?VE44YU1iVjlaRzBiN3MyK1Nvb0NaU2xZNTkyOUZFenFETGZQcWdkcWVBV291?=
 =?utf-8?B?TExzdzIxVVRHdjJBQXloL1U0V0JrMFNmVkMvQVJDa05WZThBN1dGZkhOdExi?=
 =?utf-8?B?ZkdnRGZBUUEwOUhNdVVrV0doK1JscnppdXdpZ1NuREorTHBMc0ROZ24rZUR0?=
 =?utf-8?B?SFpHcHdpajZNZFhUNUppVXlJQ3lMUDRydWxHR2ZlSDdvYWl3K3hHSllTU24v?=
 =?utf-8?B?amhZS084WlNYUkFnNk5GQ2xpYmswaGNJaWxRWmxseG8wKzJnSW05b0NKOVRR?=
 =?utf-8?B?cTFzSStuRm5namVaNTlIWURYRUtJNTh6QnloS0t4alJsdFpCcS9CUUFuc0do?=
 =?utf-8?B?ODJaSDgyYWk2OERiZzRGZU5CUnpCdmhNVllUWmUyc3ZCd3JCN1FNSXBVNzRP?=
 =?utf-8?B?UHhmVWVMQUh3NEoxYjYva0F1SEFoQ0wyaU1WNzFsRVFaQk9xLzVmZUdndk1j?=
 =?utf-8?B?YmNqcEtHdlV5TzQxVDRrT2JDaDZndjVRSXdHSVpEOG80TG5FSVdBRVpSTDNN?=
 =?utf-8?B?QTk4cUtmWVJleGJYMXJ6YUpsMDZmQ1EyNzBFai9haEVzdFFEUUo2eUZYbFJQ?=
 =?utf-8?B?VW9vRnZlNVhCYTJncUFac0ZtL01KUS9mS1I0b0lhdDNwbVNFb1VIMUhqUjFp?=
 =?utf-8?B?Z1J5STJ1N3h5dWZxQ3c3cFd3S1VFeHhJM0krYllNVCtMSGdSRHE0am05eXRG?=
 =?utf-8?B?K3hiY3NNUGljRU1CaHB2akp6cE5ZTTRhRXQxNVFGK1ZaT2hPYThlenoycUxT?=
 =?utf-8?B?VEtrbmVoVzlBU2lvWm4zQ2RaSVNJYjhJSWViVjdDVGdKdTFKeU45SXRVNzd1?=
 =?utf-8?B?alBzTzluZmdqTFMyN3BUY2dUMFBMZG1ZNDk4NWJKZUxMTXZjdHpYWklYenpE?=
 =?utf-8?B?L3V4SjN2QVluRVE5YUhUVmtnR0swRjROL0U0ZnpPL2x0aHB3Yy9DbWJxeldL?=
 =?utf-8?B?eVd2M0VleWhnRkdEZ3pDSDB2ZEtJMkFhbC9KT1l6Qkh1SDJ3N1FzdXBmM1BH?=
 =?utf-8?B?K1l3Y0hiNlN4ZXFHZnZBTHVHbkxUaVRucWtnSzhhc09hZDVpbkZHRUExZzlq?=
 =?utf-8?B?eUtadm1GdGVNazhucDFaczFJTjlwdFBaMnpwSDRrd0x2UWdzL3BIRTJiNENj?=
 =?utf-8?B?U2tQNHJ2cGZJamRwaEErODFxeEo3R3diVGdtcWpEUXE1NFdjN0lCMUpuVzdn?=
 =?utf-8?B?MUhPVGY1WlJXNWhucUhJTk4xU3d5bGROVlRHVVoyNlovditkN2UwMUJ6ZnZ6?=
 =?utf-8?B?NXBtRnAwT3NYdGJpdS9aZ0RITlJPNnBLblVoa3M4NGpKbGFqZWhDYmdWMkRz?=
 =?utf-8?B?dUEwaXBnZUVwY3hiSWpqRWJ1dDYyTWlxZEdZWGhuSjg0RlNoVUthcjdIK3Y0?=
 =?utf-8?B?Y0VyWVJPWXJSa3FvaHN6SkEyc3pjUTF1S2pwNGNmM1JWb1FJQ0hZRlp0aWhF?=
 =?utf-8?B?ajh3VzUzSVdnMXdZU29FODRJcHVqRHJVRFR3QjNhT3h6RWQ1SzhINVg1Mkd5?=
 =?utf-8?B?UWovYnJsNk5TeEhYNnRjWU1YK2VGK29md1FVbjN4UUZhMWtzcUtWRXV4U2du?=
 =?utf-8?B?MVh3OGc4R0tIVWlFL1BrTjRXK0xTTm5DR0s4WXZ1ZHFvQ3NrZHMrOGhwdDkv?=
 =?utf-8?B?ejJLSVJKdTJuTlVTSXFxSW5HSk1VZzcvaE5mcXZOUjc4N3FmcWNuRDM2eFdh?=
 =?utf-8?Q?8n/Zu6sXzA4HOmFuLhPd+U6yQOpEMHhlolK+cDDJK6Bm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7fd011-0fb2-472e-5886-08db0b2e4b51
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 06:16:06.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGe7MVPOESKommHObA7zNkT8+/a+52+bbOxKAth+PT0saaQfHKONd/c8UZNa4gD1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780
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
Cc: banackm@vmware.com, krastevm@vmware.com, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, mombasawalam@vmware.com,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.02.23 um 03:34 schrieb Zack Rusin:
> From: Zack Rusin <zackr@vmware.com>
>
> In change 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
> ttm stopped allocating dummy resources but vmwgfx was never ported to
> handle it. Make the driver treat null resources as initial creation and
> port code to handle null resources in general.
>
> Fixes kernel oops'es on boot with vmwgfx.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Christian König <christian.koenig@amd.com>

Sorry for the noise.

> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  3 ++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 18 ++++++++++++++----
>   2 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index 54e942df3b8e..71eeabf001c8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -837,7 +837,8 @@ void vmw_query_move_notify(struct ttm_buffer_object *bo,
>   	mutex_lock(&dev_priv->binding_mutex);
>   
>   	/* If BO is being moved from MOB to system memory */
> -	if (new_mem->mem_type == TTM_PL_SYSTEM &&
> +	if (old_mem &&
> +	    new_mem->mem_type == TTM_PL_SYSTEM &&
>   	    old_mem->mem_type == VMW_PL_MOB) {
>   		struct vmw_fence_obj *fence;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 4daebc5b9eb4..af8562c95cc3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -515,9 +515,13 @@ static int vmw_move(struct ttm_buffer_object *bo,
>   		    struct ttm_resource *new_mem,
>   		    struct ttm_place *hop)
>   {
> -	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->resource->mem_type);
> -	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
> -	int ret;
> +	struct ttm_resource_manager *new_man;
> +	struct ttm_resource_manager *old_man = NULL;
> +	int ret = 0;
> +
> +	new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
> +	if (bo->resource)
> +		old_man = ttm_manager_type(bo->bdev, bo->resource->mem_type);
>   
>   	if (new_man->use_tt && !vmw_memtype_is_system(new_mem->mem_type)) {
>   		ret = vmw_ttm_bind(bo->bdev, bo->ttm, new_mem);
> @@ -525,9 +529,15 @@ static int vmw_move(struct ttm_buffer_object *bo,
>   			return ret;
>   	}
>   
> +	if (!bo->resource || (bo->resource->mem_type == TTM_PL_SYSTEM &&
> +			      bo->ttm == NULL)) {
> +		ttm_bo_move_null(bo, new_mem);
> +		return 0;
> +	}
> +
>   	vmw_move_notify(bo, bo->resource, new_mem);
>   
> -	if (old_man->use_tt && new_man->use_tt) {
> +	if (old_man && old_man->use_tt && new_man->use_tt) {
>   		if (vmw_memtype_is_system(bo->resource->mem_type)) {
>   			ttm_bo_move_null(bo, new_mem);
>   			return 0;

