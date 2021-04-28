Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71536DB24
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDDA6EBA7;
	Wed, 28 Apr 2021 15:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F42F6EBA6;
 Wed, 28 Apr 2021 15:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmBEMBjmCFq4XWlVU0xoeGzveVNx6LYwcZoyH7qTZA7IHsC9SHQG4gVqe6BQeaZZxGudYtL43QKnb1C0JXjll59U3lL6LEl6TTAjd7ijwocravJgZKhHr4CVOmvVofm+l+uasnSBVL3c0X7I80tPMoOUEuGtKXTsKeLQ6bkXHu6diqd+aVpcIfcTqc7ACs5AyXwNkh6wQo3GxTqXHkcLcGULjFp1MBNh6Ycwmb/nLVPo1gwZPKFVQ6tsKZJmm0juZRUCbJcMNHqwlXxO7VD3ItmO9sMR0MQUbl+msp75ckMpL9k3h7s3wGucfxDZvQYLsC2UK3OSB8hm+ldWZm8EDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUGeXho28BkmdAyVU8EqMcV/aJJTPz9GfM0PZkYHD8g=;
 b=clhm9vf7J20o8nixifHoTqS03sJ/3dETlYwT88TLHYN9FLCpBcwMgLhDvID0nEhfd0YIYZVPQpRDD6360yBS6z5x2TF22pdLf95X+OGJfcUk+ZIXFiIn/MxQGoUsuXQVwwX6TaFiB6eNzxt4fp2ec9Xwy89Qyfy4HDcZ1cTIl5v4R/gaSsmreqY42IZPSKlTpqUfnePVaE59wCI7HjKw0bkZvb93Po39Tio+7fwKaau6uYJMhfbISku+u7TXa0RILN1zLdHphgpRTfM2SIWnty+63652D2f81x0VyqiMH5nbLUJaDVj0gaza7dXnf4N7tN+LCpMKK7U8rHQlABlR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUGeXho28BkmdAyVU8EqMcV/aJJTPz9GfM0PZkYHD8g=;
 b=cOHUOTHaAMND4y5NpSZLTx2xkpJKPooZ8YIVK3mNuJcDC9sROcnD3Ch1W2e1ka/EgpdPo3vcP6b3aSyDMA/e0HbWt1kOVodoE6POQKBXFckDzZW07lwGWjavrYzjENXCEsY0llGsobz+ylW3SEuzAFSh85lriI89RzUnOQwN97A=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4622.namprd12.prod.outlook.com (2603:10b6:805:e2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:20:29 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:20:29 +0000
Subject: Re: [PATCH v5 19/27] drm/amdgpu: Finilise device fences on device
 remove.
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-20-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <79dccee7-2c17-6cb5-6ab8-1bdc8beee8e9@amd.com>
Date: Wed, 28 Apr 2021 11:20:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210428151207.1212258-20-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::35) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Wed, 28 Apr 2021 15:20:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8842eb-e38a-4f40-5576-08d90a592800
X-MS-TrafficTypeDiagnostic: SN6PR12MB4622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4622AA7CB26A6907291F2B88EA409@SN6PR12MB4622.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkcFzQpEdQgCUkywARJoKJiM9uOV+SYIKeSYe62qOCwup+GiP6wEGCvurQIMgPS/X9mFMaOpy6EZGnHX/U7fLfReRM8YXMfn1nY09ucjrjKKrLhGUJUMbBc+m3Iwt2j9+yADaMbtbodMDtCsk2y9OeR2FwhTO2dxHEHFyooZDh62Tw6jpT+LurmVo/qYQMd/MNA2xHPdb7D0WXtHHlYXIcrhfzaJqyJgdrxsSAZeTXnQGDaCwLOja3kQTAG5iXIMsK1/8bSCQ1TRECSIdKSp2qxSQ9WNACS1J8EZn7E+5aWz0y+O8WbpCyRwM8UADz4LY5nhSsr6Cf30YF1jF9LiELupJguWtriUjlcQ8A2QqwRyxGDU6/MvdslXUIs/FyQePuK9hGJaykC9jnY3ubTZwgQYtj4IbMKKN/QAMdIw5rnk7HdhSi2hisIj/jdE/klTJa8O/kVJi/ZkJLx+uqw8Po1Fxc3dlLPmvTAsRiVyU+zUQdVyFa49PZrvvH2UDHDCQ/fan1vpYCM2RIlOaX5swSOL9XcYFHdVh+nuFGf5OBzfE0MHeUnDyHZj7BDlPKDpUGsyvZEfic199//G1Sa2k9xvm0GxFhsvUZhH6bXcRoZtZHOecARiQGui/mvnTwjbIw0Wp9LPXPCYlQHCtbNaS0AsmgAPd/zuM1XkBhQP3ZEsMQlxwGEa+eyWbLysOXWs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(31686004)(8676002)(83380400001)(478600001)(316002)(36756003)(6636002)(2616005)(6486002)(4326008)(2906002)(16526019)(31696002)(44832011)(5660300002)(186003)(86362001)(52116002)(38100700002)(66556008)(66476007)(66946007)(53546011)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1crd2g5dyt0OElBUGU1Z0xYTmdBeUoxbnRWMVJuM2ZZMi9NU283Qm9tdGYx?=
 =?utf-8?B?YzZ6WjUvRzBIZHFlUXlpeXI2QVNuT0dGV0l0MVZMc1o3Rlg3TnpkZS9BM0d1?=
 =?utf-8?B?RHFGVVQrVkw0MGNzdCt2cEtxTnZ0bTJEdlRYN0ZWMkVEOWhPMlJyZ292UXhJ?=
 =?utf-8?B?U1MwUW4vN01nTWZKNUg4RG5Cckp0djkvb1ZERklJQ3FxazBKd1dseWVTMzNn?=
 =?utf-8?B?RVh1ZzNjVzg0U0pYdStlU0lSQXJQVXhyMUlodVpjNkhZazRBRUE1c3NodnRm?=
 =?utf-8?B?Tk01QllBaHUraE54SFJoY2VUOUswY2hhWHdxZUMyQ0lHV09ybEEwb1BpRDE1?=
 =?utf-8?B?Wm9qQXB6QVZQOGF1NnF5Y1hIVm10R0I0Q29jVEFpRzluTkkyNkpvNDJHbmRh?=
 =?utf-8?B?SFFCcjVHM2IwMldFUlRJQlBINmlIbjZrSHAxc0ttdnVjbnNzQ0h2Q2lzbm0w?=
 =?utf-8?B?T21mTWhZcDBFU2RiOE43aGJqU3dVSkN1WkhMd0hRd3lwTE1DbGxrS3JIOUVL?=
 =?utf-8?B?SDVmQW1XNzlEWW9palEzb1ZoeUlkZGJSQnFtbFVKSFdtSkJTUW5VbG5GRU9B?=
 =?utf-8?B?dnR5YnZsRy9ZTW5JVzdtQ0o5cHRCY1Y2ZWRiOVBETHJBL2pqcC9IampwNE9l?=
 =?utf-8?B?dU12M21HOTF6SDZWNmp6Z0wxMmpxVWpCbnBGWVZHV0h3ZHZGQUx3ckpCdEh1?=
 =?utf-8?B?a1lhbU1iUjAzUzZHdXprMjFXUEtZakpVZnR5cVFFd2R0U0UydldPa2VUNVlm?=
 =?utf-8?B?N1QzdFhLcWFkUW1HRFRnSkdyTGpXMTJieG5iaXdEd05PQXNFK1pCeTExa2tH?=
 =?utf-8?B?ZXZ3dHJPRU9QeGh6aWN5NTBsZVpXZitKL2JETTBDa3V1cHd1QnltNjR1RjJz?=
 =?utf-8?B?Y1poWW51SmpnVHFvejFyc0hzUVJMTEZ4VHhwY3U0TW1lOXkwUVZZMTVkYUcz?=
 =?utf-8?B?TlpuY2M5SHR5OXB6bFFYVWo5Q1NnWW5LWW50b1Y1V1ZNWU1wTUxINmR5SVQv?=
 =?utf-8?B?azVEKzdncStJSHlsSDd1NFdXazg2M1lQQjYxcG9wU2lKWW5ERWNDbDc1VXlW?=
 =?utf-8?B?S29zcXU5Ritza0Q4MEIrMnNvdzNVV3BnSG1QRWxqSEFnbkFCcXZreHdWQkk0?=
 =?utf-8?B?MkU0emg3QTd6YmtIblE0QzFvb245d1lVNE5Edzl4aUVJS1FKTDdJcnFOUHR1?=
 =?utf-8?B?ZDZvSjlIUnU2aFRMSndQTXZDTWZ0S2xkeEkzUHNmQzhuei9EQUhQQndsOVJo?=
 =?utf-8?B?bEdvL3JvNzE0bFFhQkFsNnVaUXNpanNneVFKbVp1QlRFL0hjTkt4b0pHRDBE?=
 =?utf-8?B?T1duR2M0OVBRdm10RDliZlR0Q1J6VWR4dU5EQ1pMNUc3SlFkYVZMY29oY0lp?=
 =?utf-8?B?emVGdUFmRERieFFvbEo3SUhEaXExSEJKNEIwYXlXdkpOS29aRGFHNzh3eFVB?=
 =?utf-8?B?Y2t1dk1CQVRFb0VWUGhhQXJPWVJmU1d0azhYcDF2bCtydXNNb3hJOENDbjR1?=
 =?utf-8?B?UGlsd2V4cnRiTjNuRmkzVXNnSVpMYk9Zd0lvazlKMHFXczViWEZ5b3FhdGdw?=
 =?utf-8?B?S0JCUWJFOW5zWTRacDVQdVVYMlJIdzZRY2MxaXhjRWcxaHNNSGh1UG1ESXhN?=
 =?utf-8?B?OHpVUTFCQ1RsRU5IQThibU91a3JHOG9hdklaSnlLbWc3ZUVMd1MxNUxBYmov?=
 =?utf-8?B?K2dRY1Z6bXZQYm1FM3ZaRVdaRDhvWStoN0xMUTA0eXVycFNRYm1EVWZEUVR4?=
 =?utf-8?B?RU9zYWo3VDdBTmxiOVFsN3hsaGNPSjFVc3Jua1pYVFIxY1Y4aHpjdnFPalN5?=
 =?utf-8?B?YjFDcmRiN1l4TkJyY0J2U01DMHRPK2VZTnlyVUdrWjI4OGx6TGhpdHRGLyth?=
 =?utf-8?Q?soyjYwAAGde5t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8842eb-e38a-4f40-5576-08d90a592800
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:20:29.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyPrBm8rU7wpq4NlFQg0lAiJgEVino1EGRBgQJ5IsegkoxlC3G9GFPIfOhWDoQf8+PsRDEZ0lPaOltceuKsgmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4622
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-04-28 11:11 a.m., Andrey Grodzovsky wrote:
> Make sure all fecens dependent on HW present are force signaled
> when handling device removal. This helpes later to scope all HW
> accesing code such as IOCTLs in drm_dev_enter/exit and use
> drm_dev_unplug as synchronization point past which we know HW
> will not be accessed anymore outside of pci remove driver callback.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 98 ++++++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 12 +--
>   4 files changed, 103 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 0db0ba4fba89..df6c5ed676b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1374,6 +1374,8 @@ void amdgpu_pci_resume(struct pci_dev *pdev);
>   bool amdgpu_device_cache_pci_state(struct pci_dev *pdev);
>   bool amdgpu_device_load_pci_state(struct pci_dev *pdev);
>   
> +void amdgpu_finilize_device_fences(struct drm_device *dev);
> +
>   #include "amdgpu_object.h"
>   
>   static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 33e8e9e1d1fe..55afc11c17e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3692,15 +3692,12 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   		amdgpu_virt_fini_data_exchange(adev);
>   	}
>   
> -	/* disable all interrupts */
> -	amdgpu_irq_disable_all(adev);
>   	if (adev->mode_info.mode_config_initialized){
>   		if (!amdgpu_device_has_dc_support(adev))
>   			drm_helper_force_disable_all(adev_to_drm(adev));
>   		else
>   			drm_atomic_helper_shutdown(adev_to_drm(adev));
>   	}
> -	amdgpu_fence_driver_fini_hw(adev);
>   
>   	if (adev->pm_sysfs_en)
>   		amdgpu_pm_sysfs_fini(adev);
> @@ -4567,14 +4564,19 @@ static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
>   	return true;
>   }
>   
> -static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
> +static void amdgpu_device_unlock_adev_imp(struct amdgpu_device *adev, bool skip_in_gpu_reset)
>   {
>   	amdgpu_vf_error_trans_all(adev);
>   	adev->mp1_state = PP_MP1_STATE_NONE;
> -	atomic_set(&adev->in_gpu_reset, 0);
> +	!skip_in_gpu_reset ? atomic_set(&adev->in_gpu_reset, 0) : 0;
>   	up_write(&adev->reset_sem);
>   }
>   
> +static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
> +{
> +	amdgpu_device_unlock_adev_imp(adev, false);
> +}
> +
>   /*
>    * to lockup a list of amdgpu devices in a hive safely, if not a hive
>    * with multiple nodes, it will be similar as amdgpu_device_lock_adev.
> @@ -5321,3 +5323,89 @@ bool amdgpu_device_load_pci_state(struct pci_dev *pdev)
>   }
>   
>   
> +static void amdgpu_finilize_schedulded_fences(struct amdgpu_ctx_mgr *mgr)
> +{
> +	struct amdgpu_ctx *ctx;
> +	struct idr *idp;
> +	uint32_t id, i, j;
> +
> +	idp = &mgr->ctx_handles;
> +
> +	idr_for_each_entry(idp, ctx, id) {
> +		for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
> +			for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
> +				struct drm_sched_entity *entity;
> +
> +				if (!ctx->entities[i][j])
> +					continue;
> +
> +				entity = &ctx->entities[i][j]->entity;
> +				drm_sched_entity_kill_jobs(entity);
> +			}
> +		}
> +	}
> +}
> +
> +/**
> + * amdgpu_finilize_device_fences() - Finilize all device fences
> + * @pdev: pointer to PCI device
> + *
> + * Will disable and finilise ISRs and will signal all fences
> + * that might hang if HW is gone
> + */
> +void amdgpu_finilize_device_fences(struct drm_device *dev)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(dev);
> +	struct drm_file *file;
> +
> +	/*
> +	 *  Block TDRs from further execution by setting adev->in_gpu_reset
> +	 *  instead of holding full reset lock in order to not deadlock
> +	 *  further ahead against any thread locking the reset lock when we
> +	 *  wait for it's completion
> +	 */
> +	while (!amdgpu_device_lock_adev(adev, NULL))
> +		amdgpu_cancel_all_tdr(adev);
> +	amdgpu_device_unlock_adev_imp(adev, true);
> +
> +
> +	/* disable all HW interrupts */
> +	amdgpu_irq_disable_all(adev);
> +
> +	/* stop and flush all in flight HW interrupts handlers */
> +	disable_irq(pci_irq_vector(adev->pdev, 0));
> +
> +	/*
> +	 * Stop SW GPU schedulers and force completion on all HW fences. Since
> +	 * in the prev. step all ISRs were disabled and completed the
> +	 * HW fence array is idle (no insertions or extractions) and so it's
> +	 * safe to iterate it bellow.
> +	 * After this step all HW fences in the system are signaled. As a result
> +	 * also all the scheduler 'finished' fences are also signaled.
> +	 */
> +	amdgpu_fence_driver_fini_hw(adev);
> +
> +	/*
> +	 * Reject any further jobs to any scheduler entity queue. After this
> +	 * step no new insertions and because schedulers are stopped also no
> +	 * new extractions.
> +	 */
> +	down_read(&adev->sched_fence_completion_sem);
> +	adev->stop_job_submissions = true;
> +	up_read(&adev->sched_fence_completion_sem);

FYI: Typo here - down_write and up_write obviously.

Andrey

> +
> +	/*
> +	 * Complete all scheduler 'scheduled' fences currently pending.
> +	 * It's OK if new contexts and sched entities are concurrently
> +	 * still created as they will fail in pushing jobs to SW queues
> +	 * and their schedule fences will be signaled with error
> +	 */
> +	mutex_lock(&adev->ddev.filelist_mutex);
> +	list_for_each_entry(file, &adev->ddev.filelist, lhead) {
> +		struct amdgpu_fpriv *fpriv = file->driver_priv;
> +		amdgpu_finilize_schedulded_fences(&fpriv->ctx_mgr);
> +	}
> +	mutex_unlock(&adev->ddev.filelist_mutex);
> +}
> +
> +
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index f799c40d7e72..8a19b8dd02ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1249,6 +1249,12 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>   {
>   	struct drm_device *dev = pci_get_drvdata(pdev);
>   
> +	/*
> +	 * Force completion of all device related fences that might hang us when
> +	 * synchronizing SRCU in the following step.
> +	 */
> +	amdgpu_finilize_device_fences(dev);
> +
>   	drm_dev_unplug(dev);
>   	amdgpu_driver_unload_kms(dev);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 2670201e78d3..af592b28cd35 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -526,7 +526,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
>    */
>   void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>   {
> -	int i, r;
> +	int i;
>   
>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>   		struct amdgpu_ring *ring = adev->rings[i];
> @@ -535,18 +535,10 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>   			continue;
>   
>   		/* Stop any new job submissions from sched before flushing the ring */
> -		/* TODO Handle amdgpu_job_submit_direct and amdgpu_amdkfd_submit_ib */
>   		if (!ring->no_scheduler)
>   			drm_sched_fini(&ring->sched);
>   
> -		/* You can't wait for HW to signal if it's gone */
> -		if (!drm_dev_is_unplugged(&adev->ddev))
> -			r = amdgpu_fence_wait_empty(ring);
> -		else
> -			r = -ENODEV;
> -		/* no need to trigger GPU reset as we are unloading */
> -		if (r)
> -			amdgpu_fence_driver_force_completion(ring);
> +		amdgpu_fence_driver_force_completion(ring);
>   
>   		if (ring->fence_drv.irq_src)
>   			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
