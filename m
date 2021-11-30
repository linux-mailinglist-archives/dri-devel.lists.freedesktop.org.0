Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E078B463A3B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898076EC62;
	Tue, 30 Nov 2021 15:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D0E6EC4F;
 Tue, 30 Nov 2021 15:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+dWfHlmvTjc6MxVEPMdf3RVAyt3mstxdyLwQyZpR33tLy0inEp1VvyaB+UnkcqFHgPQ5USJngoBKNb7nuPCHOcgB52hk75EwbkeTm+Dta0q+l8xPc1LGSXTCzefSY0T6naC2bo8wVTZ4Eq8K+K9QsKx6ZX/SKeLYJWuTXT3OIHWbMjbY4pzLx1gzbhwEHqxWANOvxlTiQ2ufm+FFeQvL5uIDMMGuoecAFR/NCE2af6b4awiGPTwWAxIEKCWN4AnEUkrNhR0OH5a9HSeVlbXPOSaDKIYCekXecNBFLrR632Ck2tgh5J9yyt8qj7MCPxGTSmUxj1pAVwUkPvJV2WvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v0Q918wcq702KclNVz35QEtSKoMUT/sTP9pZN2P290=;
 b=b/Cn1TPJ2YsaWJC9e9aTDV2kmFajWCoXt77kxX7PhiroxBmfI89MpSHa29jh4n6fCuHPm7rv1Wsi1AnmNiyH+NDFLBC6nfgN3ej79kTzuYoJZqN5appspjS5lk6Ulxxgfuf95oobicnK7jhmEZupYbgEyYNjkSP8jegYk3h3CUSTEtm/IkMj76uzG3NDT7Z9HDemgPWw9CBZ5jw1jMLzx/8lsW819PX1MjAKCVUNl9Z3yaVdMASX2ZyJ1JJ1BXR/sfeku0vJEW+Ggorw62Cmsm/H0XJXjtWJljikOp9MU6XwqejD+TEG9fc+VvYgzxg6ITodatKsycUyG9SME9i41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9v0Q918wcq702KclNVz35QEtSKoMUT/sTP9pZN2P290=;
 b=1F8sghlkwMvfYx7Sr7Y7DAt4YITeYuBSo6cnLoED3sxlVhKIVAa14Bhh0Yhu9eRuEs1jBJJ+fLCnkpWDL5J1PgR5R3C4h8Sqdu0zgMqmF30FO7JcGd0BaZwpUYuCvV4YbJ164yaixPXWwk9u8kppsHp6MzCBeD2I6RaxdqFVSLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1408.namprd12.prod.outlook.com
 (2603:10b6:300:12::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 15:37:46 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Tue, 30 Nov 2021
 15:37:46 +0000
Subject: Re: [PATCH v2] drm/radeon/radeon_kms: Fix a NULL pointer dereference
 in radeon_driver_open_kms()
To: Zhou Qingyang <zhou1615@umn.edu>
References: <dc81cea8-f0f2-12c4-bb7b-a6e65dfe6f10@amd.com>
 <20211130153400.174047-1-zhou1615@umn.edu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f776cb6f-d599-a543-9177-dac7d08cf7d4@amd.com>
Date: Tue, 30 Nov 2021 16:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211130153400.174047-1-zhou1615@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6P193CA0076.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::17) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3]
 (2a02:908:1252:fb60:fa20:e17b:e063:b6d3) by
 AM6P193CA0076.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 15:37:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d80b2255-6b33-48bc-4ddb-08d9b4175b39
X-MS-TrafficTypeDiagnostic: MWHPR12MB1408:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1408801847D5C94DD9A55B1D83679@MWHPR12MB1408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJDffS7ukOBLlQ0nJrIjyVONZT3LqFBs/jWSpEpVG/4feZJyPfoxtdkilLAJ+T9sXMaUEfwepIW3FDENN6eNM15eTTbBfJdDZqeNmdT6x5/YLXoyFfHGsByGLe8ww08X+U0tpjqvgA6RpqB9h581YZZy1Owqpst28BstCogsWPyYMVB/Iy4H11iSOksrvxxdqtcHqALsklkYwUWr/wo1bxP5Sw0mhqnmhMPMjBEId8khWVulWIduQKFJaVjTUNjcheI9c8xRNTrX3S/8kR3zmY3rf3JmJh7sAgLa5fAUhwlwkHiHWKC6pxxl9z4CcIPsVEnEM/64MAVx8OeZBX2OJdvw6Cx3zD4DAoRpAwFjF7NJXUxmsgK9qKdm7nkQvopKWyTBS4c6zLlZYCV1Q36iqd1orSmeltFfyJVRYvk7Ws5STknp6XGHoGMROjne9KqA1MqX2eoTMY79v3bHwdqgbQcV9hCYw0DkMJjLnrM1VAqk2AX9Yf0IrpoTpkZXuDe/fGZwqIllF7e8gBI8hzDKRv+6gpGcHLwgMyTrGMgKmezhzNzNvmJIw9tnT9KroWY348yBSkpFiVXkNXvcRj6SLh4LNra633ExKwpPCNfbpLQWQV8SdhU93hRFERMkAXRJcyImPHlwH4A0ZDLkosYfB2DmPvNWYtgN8zqF2Xty2u0KkFLiLGU7magWA9TvDRnyx8ysluQj+852Rx65PCim2GyFrGYWghQVklygWXvV3ohaFZ+u7fq0/eSxtzCJTA0h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2616005)(38100700002)(31686004)(54906003)(316002)(186003)(2906002)(36756003)(6486002)(508600001)(86362001)(8936002)(31696002)(6666004)(66476007)(66946007)(8676002)(66556008)(4326008)(6916009)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNyNjcvRXJ6dlg2VCtEN2VWRllBdU9Fa0NuVkxhRHRtUkRuOE9TdzJ6R2R0?=
 =?utf-8?B?c2Vhd2ViTWhzY3FFRzAvMU50MEx5SktUeUtrbjFEenRkOGVvMThnRkpvOGkv?=
 =?utf-8?B?bThIbWdaYVdzeWloMjBJN2V6UVRlVzFyRWZRQk1CaytyN3M0WUdGMFpwSVFi?=
 =?utf-8?B?UmY0Tm80SDlYYk96Vzc4UjltdkJmejNUSnZqUFNIbGY1V3A2QzlUYkFURnZD?=
 =?utf-8?B?UXhKRTByVWN6S0dQT3VLak1DU3paR3lVTUFEQldwUHhTS2xjUGZtaTR4djVr?=
 =?utf-8?B?eTRrbXEwVm01ekMxVWRyWlcveE82c3VPb1k0UXpvV3luVFVCNURHenNQVVVX?=
 =?utf-8?B?WkZ0dVQ1YWY0NUp1K1RPUHRUc3JDSUR4Z2dLQ3ZQUHdTN0w1N2hiZzRVYmNu?=
 =?utf-8?B?SFh1N2djVENNa3ROV3VVRTZQMGErbzI4ekRoOGFpM1Q0ZnVSdktQZllNWCtN?=
 =?utf-8?B?cE42dW15d0I0L21oK0U1b0V4UGM1ZEljZVdtalpibExDMWJyOUtETEk2cXJI?=
 =?utf-8?B?SHBmOXM4UzdBS3VXQlZoRzNPRTVBdC9NUFc4YjhFK1ViNW5LZzdGUlZIRWhx?=
 =?utf-8?B?OXpPQ3NQM3NhYnl4Q1NJcHZPZ25nQjEwczl6bXFiWnlMVHloYTdTL3JOV3RH?=
 =?utf-8?B?NlF0UFlNTXNsKzdZcm5PN0ovaW8vM3FlUEFhSkhXekdlQllaQTBRNG1EdDZl?=
 =?utf-8?B?cU43U2tRbWhXQzdSVEVvR0Q1aWdiSFhrak5FR2NmTDI0KzVuUnJoWDVsTldH?=
 =?utf-8?B?UFpUb1ZkZm16OUI4SGRVbGtsZmVrb2FJWVBGclVuZ1h0Wi9wdGhOdWRrSGEv?=
 =?utf-8?B?dTFZQUpOWlU4RXdsQWt1d2hCQ3Evbk8xNGwzelM0MDJETXd0NVFwYk9HaUsy?=
 =?utf-8?B?bjg5NW8vZTcvb3pZYTRCVGkvaysxRTVJRFM1UnltSlY2QTJRRDMrcjN1U2Jr?=
 =?utf-8?B?TFZCalRGT0t1WjdrNTl0NGxqU3ltUDN3RVVnVDR5TUJPVFRXQzBwTEFrSXg2?=
 =?utf-8?B?UkVuZkpWMjdNSlhUblZKaXN2Wlpoa0dHbGZDU2tsVzZQbUNvQWRTVjRGQm8r?=
 =?utf-8?B?YTRjTmVzRWg5QjdJdzRrTnA1d1BqVFNkUGNaRHkyYnllNWx4TXNrak5YTFUv?=
 =?utf-8?B?TXlMMFhhb0JUblUzUkFVcm9VbytiUlA1enN4Sm81S3JqaEdTRUVTeVVoeERi?=
 =?utf-8?B?dUJOb3d3THUwNmY2a0l1bFFvbEwvTExHckxqaDhkN0twYlowSWFVdTRudGRl?=
 =?utf-8?B?a2lDN3puT3VzQ1pMWDl1eWd0Rm1uUm5TcnIxY3g3Qk56Z0phbjg3eGp4N3M2?=
 =?utf-8?B?UlZlK1J1QnlSbEUzSldVb0tveWpENi92ZzM3eGU4LzFLM2xtMHNFb2xFU0gr?=
 =?utf-8?B?VVMyZ2F5TmZ3WWRHYlE5ZVdrdWcvMGNGbVpUNzVaUkJXb21ZWFhzTzRTcko3?=
 =?utf-8?B?WmxyN1FIUFRoM0Q4dXp4MXVyYlR4NG5zWXJ3NlU5UjAvOFhQK2YrVGJ5aEgx?=
 =?utf-8?B?RmFqaUN5cjR6UXdmem5Oa1RyT1AvT0FibzM5TFVxWWZGTGROR1kvd0tsY3NO?=
 =?utf-8?B?ZTRleHNFUFE0RU93b0s2RjI4ZENPU0l1T0p5ek14cnh6a3V6Z0JYK05SV2cw?=
 =?utf-8?B?djQxdnNHeERQQk9zejFKYUtFLzhmdEplSkdSQXk2bUhBVmdvUUhMeTEwVzFT?=
 =?utf-8?B?cDU5bUVWWkdEeXBzVkwzU2x6MnVpMmpaQkJQWTBIbzRhQytFVGIzZjZSb1pL?=
 =?utf-8?B?b2JhbUY3bytyOTZJK3F4U3RjNHY5U2RFbzBTR0kyVEx2cy9uenlvOWxEUEtR?=
 =?utf-8?B?c2NWQUZPd3kyUGdjOHNEbVpxODlnZElrTTQ5QUlOVkRBeHowTkxVeXZKT0dz?=
 =?utf-8?B?V2U0MHY3UU1IRFJ2emNLMWRZczcrQW5KZlBCR1B2RkRGVWU1K1p3WDB3L3ZO?=
 =?utf-8?B?b2x1U245YTdHaHBKay8wbzRaaFQxMnltMDdoWHpSb215VG01MjcrZlBrc1BQ?=
 =?utf-8?B?Z1Z5bGJoOEE5SDZobjVBNXE2UGFQWldmd1NZTkQxa2RqRVBwTzl3bXZNQlc3?=
 =?utf-8?B?ZyticHI3UlFBOGl5R2xRZ1VaNk9ZVit4MHBVY2hOMndFNGZQVmxreWRMem1i?=
 =?utf-8?B?Z0xRZU9DaVNROGZObi9QOU5YRUduMFFLTmErNHJNcytYMitONG9zbmNjQUE1?=
 =?utf-8?Q?MU2/yuLMVVPdydc3fn1YzSE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80b2255-6b33-48bc-4ddb-08d9b4175b39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:37:46.0913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3crQEeUD+CtqD+oYyc9Dhhii3w9KIV9VWoLZu6GWYwFGPVrTNQ9JGWxaAIOag3j6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1408
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



Am 30.11.21 um 16:33 schrieb Zhou Qingyang:
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
> ---
> Changes in v2:
>    -  Improve the error handling into goto style
>
>   drivers/gpu/drm/radeon/radeon_kms.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index 482fb0ae6cb5..e49a9d160e52 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -649,6 +649,8 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   {
>   	struct radeon_device *rdev = dev->dev_private;
>   	int r;
> +	struct radeon_fpriv *fpriv;
> +	struct radeon_vm *vm;

Please keep variables like "i" or "r" declared last.

>   
>   	file_priv->driver_priv = NULL;
>   
> @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   
>   	/* new gpu have virtual address space support */
>   	if (rdev->family >= CHIP_CAYMAN) {
> -		struct radeon_fpriv *fpriv;
> -		struct radeon_vm *vm;
>   
>   		fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
>   		if (unlikely(!fpriv)) {
> @@ -673,34 +673,38 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   			vm = &fpriv->vm;
>   			r = radeon_vm_init(rdev, vm);
>   			if (r) {
> -				kfree(fpriv);
> -				goto out_suspend;
> +				goto out_fpriv;
>   			}
>   
>   			r = radeon_bo_reserve(rdev->ring_tmp_bo.bo, false);
>   			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> +				goto out_vm_fini;
>   			}
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
>   			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> +				goto out_vm_fini;
>   			}
>   		}
>   		file_priv->driver_priv = fpriv;
>   	}
>   

That here won't work.

> +out_vm_fini:
> +	radeon_vm_fini(rdev, vm);
> +out_fpriv:
> +	kfree(fpriv);

You are finishing the VM and freeing up the memory in the good case now 
as well.

Christian.

>   out_suspend:
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);

