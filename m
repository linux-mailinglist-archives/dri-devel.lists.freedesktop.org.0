Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F27464781
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 07:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E426E524;
	Wed,  1 Dec 2021 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E58D6E150;
 Wed,  1 Dec 2021 06:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpCBaRsDOUmMa3QsGPqi6sRrMNAkD1kZM75veHQjzdHa1tlB7kjocWSvT7t+ybjOH+Vo8X9I5uQh7ksn78mKtF6QpOYxdQy8903QbFirFGxxt131IqMYcI63jB3DXAbwCrYICf9kzkbLHbLtaokDZsWXRMFJwDWnmibYoSGklubnqsPZAGisMjqYdve7k6m3Zg7OO2HWo4z8Y9lQKaD2+kew/SQ8srJuZOIavUXfkif+4HA0eqp2//E7eu3sjxZJaXsrfe+XNDaEbXgtJAZY1gi2vY8wmxbtvq4piXCIMa9M3nbs32QfeYv8Z3MXFLqOkQqDNiXx5/74qIVEU4N9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIij64IrAbFNRuxPLyaxIwFazgNUlGd17V4wq+NGJmU=;
 b=ZVbwCgEcXREuu3RE4KNhWx1oDtd8tU3T65zff7P3Gt4MPVUH/Ff00RNgwWt8PLNuAsJkO47ATtxZk67vIXG+OGz3aiCvgiwAWkbAuKQNSgCKzrm8h4U4rMdewVOrnabBJfPQYQNFVQZ+w1z/4GHXtIR5wzUv4RNt/2pGrw3j9Fq9uXrapgsoIdJz2HV2ERXg0skQrFyiF9VMkFMSmKmG9CTIHCe1utyeXVVxYVz5pEyWcpLdjlF9d1KlCRFJ+L2+4Y4Gf2o+RAkgGbyHsXqhzmb4SalNPPZkcj1e9VsKCCVf7BTIeYA6pQ05FK1inGSUYtu2SBf7o9JgVb47Y2bBOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIij64IrAbFNRuxPLyaxIwFazgNUlGd17V4wq+NGJmU=;
 b=Uwj0RpFVTRJ8E5LFSJDEv6IYWUd3VystUmlzteiqQaUzqYi6yQE9Lu9wPOV5M3+k0Ojv+yVz14uxszk90mZWART7OnesbUFyVQas02U27H4TqZEdm/cwihaR2bgq0MjNJEbG2yeVH199946VQaRyeFmkRR3GIAy/edXr9yRwbAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0080.namprd12.prod.outlook.com
 (2603:10b6:301:54::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 06:57:28 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 06:57:28 +0000
Subject: Re: [PATCH v3] drm/radeon/radeon_kms: Fix a NULL pointer dereference
 in radeon_driver_open_kms()
To: Zhou Qingyang <zhou1615@umn.edu>
References: <f776cb6f-d599-a543-9177-dac7d08cf7d4@amd.com>
 <20211130155720.178214-1-zhou1615@umn.edu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5cbf735f-e672-556a-f8b3-9abe3c2018cf@amd.com>
Date: Wed, 1 Dec 2021 07:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211130155720.178214-1-zhou1615@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::19) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM6PR01CA0042.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 06:57:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 594bb628-cd0b-4fbf-a424-08d9b497d666
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0080:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0080086A81D6E8E04ABA012A83689@MWHPR1201MB0080.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oEVvWBuz3ZazbMrEfU7LNstxVXPptJ31vvc2hNjSCUBCUUG7TnHNst5WKsaqftqgHo39qAEfluL3w6CpJwV/eAUVjmW0z5rVQKwHYYsBBv+5pA4Cry4no7fwPPrXzQ0Vlr5aYj6sQMV3m0LGJbgzi5RUpVJBaHiRTLsDczmBhXb28mKwh6iC8Lmqfv50JO6OVu8Wx/8g9XNpVsPm8EfmI3MRrNo8N2NXQH44hVHoOMSyO3IAIB8TLc+pGYYxurqlN/nIZIr7araFlrI5LyBMjSCPBjCfRytmwSzD5pXfYx27gB6qA9bzD1v2vvVCr4Y/ldaaYy59wzOZbn3ddhkGbauJ8guOxErSCyaBbR3KB4R6Zg3AlGt53D7VS/LjfciICKVZ7VX4AN85GLHFBaP/PSiat2bQyiqV+xHM2B8czi5ycsLyOPwao8en92sWoy2C7b+Uj7iDk0Vtbj+/PmbKio2jw9sF0JBc/et3EJi+8lfrPwv9uYBCsbUKtZXgGDhz8hRVttQLddMi3QoE3apNNKFhl6L9BFJ5idS54YeXLpse/P0yC5dEXUNYCbfvkiH3vF3sjfvGAPshPk1ksa4bL6J6nQyHTXvG+XQFv4QbaZFoo3Bv+eWwB99dx3GFLtrUNCE9jYp+3v+aeX/z9c6H/EXa4YNMPVPfrHAUemp9PJ5r78JIrINKW5xmQosvCugkF/BE0aXeZXl3hgHXwwoXVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(508600001)(2616005)(83380400001)(26005)(86362001)(36756003)(956004)(6486002)(8936002)(4326008)(31696002)(2906002)(66556008)(66476007)(6666004)(6916009)(8676002)(66574015)(316002)(66946007)(31686004)(16576012)(38100700002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWR1WXUwQUh6VkRJYnhjQWhkUmlQTDRlaWF3d0lINnBBU3lqR0xzS0NvME5Q?=
 =?utf-8?B?LzVwM3Yxc1JaT0dkVmZrS3lXU210c0wyV21wRXNjL09uOUVrY2cxY1YydkVi?=
 =?utf-8?B?bkdXTVZ3TTk4azlZcWRUb3dQQW5LTm0vakZMdnpLTDV6V0JONjZKU1NkQTNX?=
 =?utf-8?B?SFI5dVRGQjZxM0xNNGZJYkVDeWNjaFlWWUo3UzcrVysxN2MwaVJna3BqT1p1?=
 =?utf-8?B?cHZNSHpaaGpUWFBOcS9NcXFwYlAyZDU1ckxkK1lWT0lSdFVkNDFWY0ZwdGVx?=
 =?utf-8?B?cGNRNXFMZTh1UHdidTF4d1ZpS0Y1Vm5uMmUrVndHVWI2em9aVG9hQkRURis5?=
 =?utf-8?B?M0JpLzg5bnh0MnNyK1YybjNKQlZBRWFveU1wbzFTQkhNUU5jWVh0UnFmRysw?=
 =?utf-8?B?UTJNVlBoWnJobWxNUlNQdmNJTzVNTEdWMmI3aW0xL016NDhjL2pUVXpxYmNQ?=
 =?utf-8?B?MXVFZjJrN1QwNVljQ2xZUGxTbHhPNytCTE5TUmxTZ2NSdGdBbWdaWElGQjJo?=
 =?utf-8?B?cDNZQUdEc1ltWloxNkRpWlJqYnIyZDZYQWxZYnZtck9GaTNDMkZvV2pYT1ZI?=
 =?utf-8?B?Y00rWGlhUVU0L0dWMUhHVlUzcHpRQjl3L2ZFcFM1eEhXN0I5N29XN3NNN1U5?=
 =?utf-8?B?cU82UTlLV0lCdmxBWW1yZzN2UFF6Wll4REd1YkZ5YjREcVNWY0Z0alRPNGoy?=
 =?utf-8?B?OUgzeW1aK1BENG53aVBXallNUzA2VGV1Ukt2Q2FZejIvTUQxditoMDBzZTZN?=
 =?utf-8?B?Qy9idDJSenlIbFRqWS92enVSL0NEYVEydVAxZnhYSjNtVHFjUnhpclVzZ2ls?=
 =?utf-8?B?dWxDUDh3SVM2dkJqUUhPMWFiVUw0R25yRzAxNXo3Q3NLRDFtdG5kOUtNUXR6?=
 =?utf-8?B?QTVxOVdxVU1DM25sMHN6UHl2enlLdW56VjJuTTFjYytieW9yUFV1aFRZL3FK?=
 =?utf-8?B?WGRlclYwamtreHlrZDZlSGJYc1hnVUo3UTFiK0s1cnlNVitxUThHT0gwM1Ux?=
 =?utf-8?B?L0F2SHhMSStLcDg5QUtJRE5OWkhHc2dHUW01TVdBZmY0Z0VLbmdGWng0Q01O?=
 =?utf-8?B?UWIyUnNrcWtpR3Y4bmMwbEZOcU1ybHVDeHh3WHpMcS80cmozU29VRk5WNVkr?=
 =?utf-8?B?M0FXVEs0cjhDRWtiaG15TmhZTkF6TlV4MWpVQkNSVXMrbW40bHZuSHNPSVA0?=
 =?utf-8?B?c3dkMTZNV1JHaDhMMTZaNVRGQ3F1TTNtUGdublB0RGVDUjBqYmp4V1NndE4z?=
 =?utf-8?B?bk9FR1dKMFluQzl1cUJhLzFIUlhlbzRTOUpnOGFoZFFqS0N2bUNUSVFOSk4v?=
 =?utf-8?B?U2wrdzRzZ1BtOStPa2J4UHJ0cUd4STlXdDlpd1laeGlzZkZzRXJvMldZR0FI?=
 =?utf-8?B?RVV5MkxiSjNUUm1tc3JuMEdRSWVYMTZ6SG84aDNPQ1prdEhibm54dDZZSWlC?=
 =?utf-8?B?Zm5SM3lVckxHWUlUbzgweEF6T0NCSDFTUTJHM24wVFU5MzBmTWs1MWxzanF3?=
 =?utf-8?B?WWVOQ1dEcjFDMStKWklaTkwvUkJMSEN5NVNZZWJZWGhUYmd6YUx1M0lRL25p?=
 =?utf-8?B?SG5Cc1FlNTZ5a2FGRHNHZ1BKV2tnM0NvY3JlUVVhd0s4YVVJYzF0OVQzTFd5?=
 =?utf-8?B?K0FOOFNNU0xFU3BXckRjWDUyWHpobkZyUTR1NzZzeWMyVUcweDJudklJT2lP?=
 =?utf-8?B?TE1OZThSTWUzbzRRRU53VGVaSTZ2UzN3RmVoVk8rSFBQWERZWUFzRWx1QURq?=
 =?utf-8?B?QTl1aXl4dG9jbHpHcDJQeWlQbWlkMkNFeloyZGhlclk1T1dCM0swRlprNlhl?=
 =?utf-8?B?ZU95UFQ1ekVJbkFzZUc2aUtXR2d5UVVIRVRjakRtV3EwMHdRakRLb3JjWkoz?=
 =?utf-8?B?T1VuejY2eUtHN0NJMHU5SW5kMktTYmV0emordUErMDVDYnlIRHZ1WFdYRjlj?=
 =?utf-8?B?SFhsdXZOM0U1OXFWMFlSclhHcmxtcEtzUFRKVGVCWHl5Y1NqV21vVlpUSWh1?=
 =?utf-8?B?U0J5b2dUVE16YVdhdmx4M2lLL3FRRlhmVE1vd2crUitGZk84SUlod2NUZ2VW?=
 =?utf-8?B?TlRQcUROV0dXRWdMRENNNnNmOGNkMndObDBXTDJxV1FKMDJxUWRQeVVtR0Y3?=
 =?utf-8?Q?kZXI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594bb628-cd0b-4fbf-a424-08d9b497d666
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 06:57:28.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FTR9LfTfjDRF7ZfEeXafXrfX+ozMm/BOLg/wNKJHkkK7XGZIcYxv7BIUrZTa+bT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0080
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.21 um 16:57 schrieb Zhou Qingyang:
> In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
> vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
> radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
> which could lead to a NULL pointer dereference on failure of
> radeon_vm_bo_add().
>
> Fix this bug by adding a check of vm->ib_bo_va.
>
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
> Builds with CONFIG_DRM_RADEON=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes in v3:
>    -  Fix the bug that good case will also be freed
>    -  Improve code style
>
> Changes in v2:
>    -  Improve the error handling into goto style
>
>   drivers/gpu/drm/radeon/radeon_kms.c | 35 ++++++++++++++++-------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index 482fb0ae6cb5..439f4d1fdd65 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -648,6 +648,8 @@ void radeon_driver_lastclose_kms(struct drm_device *dev)
>   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   {
>   	struct radeon_device *rdev = dev->dev_private;
> +	struct radeon_fpriv *fpriv;
> +	struct radeon_vm *vm;
>   	int r;
>   
>   	file_priv->driver_priv = NULL;
> @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   
>   	/* new gpu have virtual address space support */
>   	if (rdev->family >= CHIP_CAYMAN) {
> -		struct radeon_fpriv *fpriv;
> -		struct radeon_vm *vm;
>   
>   		fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
>   		if (unlikely(!fpriv)) {
> @@ -672,35 +672,38 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   		if (rdev->accel_working) {
>   			vm = &fpriv->vm;
>   			r = radeon_vm_init(rdev, vm);
> -			if (r) {
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_fpriv;
>   
>   			r = radeon_bo_reserve(rdev->ring_tmp_bo.bo, false);
> -			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_vm_fini;
>   
>   			/* map the ib pool buffer read only into
>   			 * virtual address space */
>   			vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
>   							rdev->ring_tmp_bo.bo);
> +			if (!vm->ib_bo_va) {
> +				r = -ENOMEM;
> +				goto out_vm_fini;
> +			}
> +
>   			r = radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
>   						  RADEON_VA_IB_OFFSET,
>   						  RADEON_VM_PAGE_READABLE |
>   						  RADEON_VM_PAGE_SNOOPED);
> -			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_vm_fini;
>   		}
>   		file_priv->driver_priv = fpriv;
>   	}
>   
> +out_vm_fini:
> +	if (r)
> +		radeon_vm_fini(rdev, vm);
> +out_fpriv:
> +	if (r)
> +		kfree(fpriv);
>   out_suspend:
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);

