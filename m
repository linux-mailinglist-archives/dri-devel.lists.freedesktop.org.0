Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B812966D1C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BBE10E07E;
	Mon, 16 Jan 2023 22:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62110E07E;
 Mon, 16 Jan 2023 22:25:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNbt7JCMhaqqqoPmm/o/aE9W1zONtvw5AQq0q8hUA5T6gqQGuewrVgCLRu/XgntJbigv3XG8KNB+nbGFs348EdJ6AlcTJ4JBOm6vzpuCsBE6CfQvsV+rDTiaQu9Q6Xc6RatvzpfM12I8Inbij7XjgplNWyZadenA17cg0Ij5+f4yrGO5h8Kph1z7NzuouhKJ1Val+kOc92hImcmiUPEISnuA65rr335pnSCOJ4C1Xf+tL60EOZPkrkVuTEiQzqPAwcvZu1FzYCFzwQ0r34VCNcQM7UDh12HXWmZLAn3FkwlPWBnb+PhX9bk9hKR0rTiExyQNDK4HXvOy/QpcDisuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goCMNH1KJizCK1kwJ+EMMUvSrSUqoduHc0LvFoh+OGY=;
 b=jvGw33k/0OaXJf39o/sg3K6OnsXX5UKLdgbYHtZh/3B32KivCThSq0WNuDZCavvlTDFpdAPa0d3PIhJH45E45wLd/IMLXoLf4iQU+R6Mg1GnE/qVe4oki38iEOjQzAQFc4Hle0OCF0UQn+wz+7bVLbvHRQKtrrnlQc6gbarc2VaG3Oe13WRGihns88Z3rnJoQZBQzRUstRWv+2BVQZO6H+9OVU0jLGjqIHA6BH93SoVloIvIhKSZBi6oUlNqUlcACj30fNt5LuVcOXgyaBsxyGpTGi72XrC1xPgks3uKIgzzs1diNu6zKm2bLli7Hv14121AqeIlHzygXuSgU1pT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goCMNH1KJizCK1kwJ+EMMUvSrSUqoduHc0LvFoh+OGY=;
 b=yoZHIAiOrRsmDNnesIHL6OJXbg+3OCXUxAp65ty1S1D37rdMbEoXU4ihnEqEHtvfQ8KV5kdm235YUXtGqBXpkcCwOHZStpDSLI88eU+UZXZBNhf6eraI5ck/87iEOLIxxQskxpnh6/wpUJ/+zlu1m6VKaOB+QN1gDCmjaRS/yoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA0PR12MB7003.namprd12.prod.outlook.com (2603:10b6:806:2c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 22:25:52 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%4]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 22:25:52 +0000
Message-ID: <a5dcfecc-dba5-262b-e0e8-fe0c0d905590@amd.com>
Date: Mon, 16 Jan 2023 17:25:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <SN1PR12MB2575C7B1393EBAE6D4DFF395E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SN1PR12MB2575C7B1393EBAE6D4DFF395E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:610:e7::33) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA0PR12MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 06855280-d40e-482e-03c1-08daf810a04d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4Z31H+fYwYIfDNfMGy5IN1AIfmiceiJyUhlyDUHs1C53LSn2XJJZKvCMCBIyqXUOmE11IdUSu08T0PMOIprjvTMIhVLR1JHw0SgK+sirM44BMekV8RXW/o3gVdEkiRN/EK+eAM8HNl7q5LgT+brvXHMmbg1xStuOLj7da5mduJimBl0fpOjWzr87JwmUUd3LFo9KSdpf9B8I97CpEZ5TCLQJ7lMxUIUmTVQIiloVEdRneit2NtZNnSHFPMPm1Y56rPG2YpcSAD2mMGufKSK1qlDs8v+fuvul3m7lhMuco9NK/LoT86xj1n2f5tNH6WzNV9ueEthEyZRiRHFi2ZJB6G/pPL5S1iBRb3x/s5/oO8JJEwdwc/lzRrpfFnvrKVTruLv4rcgJt/T59t4J8rqrL8yRTUKTLHv2iTIRrjwtq0gAxmf6gZsIBV+Q8WJEJmD+sAbhcJQKEHYvN8EC7GpsAd9B09B9z+U8MagUslxMT+mD9anEb3a9tWlqff/ppMPqGuN4ZCyktoNY/0HTTm+EM7SKdxhV6VSz7OP9Xm7Y6sd/Wz228I5AdsbfEyjkKJgON6hCikXQvJ5n/0RncdByMn+NVPqZnL3N1JSTqgfTqLDbnwZ8dFfk7fhLdYrmxHANYh7YKrsBWUjRbAn0E2TLbkszgTDDOAg3wOej4BRtvjVkJvt/U3FuRyldbHMuyO0ZKWOFneM0q3CmEG5CpuhrHE06LZEMsz6Ne1aC1fzL0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199015)(41300700001)(6512007)(478600001)(6486002)(38100700002)(31696002)(86362001)(316002)(110136005)(54906003)(2616005)(450100002)(36916002)(66476007)(66556008)(186003)(66946007)(26005)(4326008)(5660300002)(53546011)(6506007)(36756003)(2906002)(44832011)(8936002)(31686004)(83380400001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXl1SUNzbysrTktHR2NjcEcxQUpVNFNqRmtTVDd0ampoeDkwemVHaHdlLzZY?=
 =?utf-8?B?R2xRUDJpVHBFblplRTlrN0lKRUphV1hSNmlWMzJ3anRtT1laaUFvTHptWDRY?=
 =?utf-8?B?QVpkRCs0SGdCN1kxVm9SODlyanhjZHdPV3VYZUNWRDVHSVBWdmR5TGIvTkNU?=
 =?utf-8?B?SksrTlUwNW80b3FBOHE1VGtEQjF6NHh6TWJlOFR5MXEwTFdSQVZPd0FFZFlz?=
 =?utf-8?B?TDRYZGxXNFcxdGNrekMrVmErdjNGaUlINzhuYVJUZERLdUFaTWVZT21KQ05m?=
 =?utf-8?B?a28wbXlDZDNSTDhpUmZkMGdMbFBWaTNkODZlSXBLeWZMS1JobjhsTnZMWXBO?=
 =?utf-8?B?a2NtZzFWTDFjTzl5ZFN5R1ZZd1Fhc0tCcXJSR045L2hjbjNGRmZuUVk0Mnd2?=
 =?utf-8?B?YU1RVUUrS1U1amw3eHVyb2czWHNlbnpXc2dkSUxTSTJ3U0Jkdmxtb1pFblg5?=
 =?utf-8?B?RHNmUCsxYWdjOHFoL3dEdm9uQnpOdFluR0Q3VWZOUHRGK2crbVpUeGFBaUJi?=
 =?utf-8?B?citBbmh1YXBVUmNVbHdvTUtza2RZRkVXdlBqNTNiMTlqc1kzUWM5RFpqbktj?=
 =?utf-8?B?dzAybm1qUEd6OGJ2aFB4QkFTVXFKbGg3dkhXZ1I0N3cxd3Y5MGpGc0Q5K3A2?=
 =?utf-8?B?ZnBacVhxbU8rbnlBVXRkUHd3S1Y0aERYUEc0Z1R0ZmlHY0pqeFMralFVZHdC?=
 =?utf-8?B?UzkrbzJHV2R3dGlHdDNVdmZEL2V4Y2FLdFlzSU4wSGNBM1E5YVlLRExRVkRT?=
 =?utf-8?B?MGREVXVoZFBSRXRuMGhySjdlbUlKWmFteXEza3ovWXlLOFhLb3h1YS9oRjNN?=
 =?utf-8?B?Y01PZGNTT0pOSS9naHdFNXptdWxNTHU5QXlHU2YxeUppRUx4NmV2Q01DMzZS?=
 =?utf-8?B?VzdVak5CZnpReEkwdDNDbWR3UUFBL3pKTkdRaEhtMGFqTlFzRTEyWlpqSWp6?=
 =?utf-8?B?Y3NFZHRWeCt6MTQ5bnF5dHdxRzVIbU9PaUFzOEI4YnphLzdHbDk1WUhraW9K?=
 =?utf-8?B?MVY2ZmdieUpMcGNOb1JjbHVmZHdnd3R5THFBQ2tGL0JOc1ovekFaeFZKYjdI?=
 =?utf-8?B?MFpFSDBtaXE5Q3Foa2pxRS84RkFXcFFrWkdZQitvckN1TkpXRHBTWjBsdnZO?=
 =?utf-8?B?bTIwbHk5NUoweUJFQlVCR1RRWVdXTDVxNENHY3FEbXNIVkRRcVVaTHJnaG9o?=
 =?utf-8?B?UlpjOS9BUDIyRzNyR3hWeWRtaFpWb2hZMHpwWE1nRWZ5MnlpcllZTGh6WTNq?=
 =?utf-8?B?V2hGY0ZXMThPSS9kMldNTFk4dzdnck9YSmNDWnh2UmpxaHIwZ1Z5Sm5la0RC?=
 =?utf-8?B?YjN0UmVhM1d4RVhFSXpUSHZ0T0s2TTgvRGdwUUd6RG1ERGw1bFVuU0J6cnhX?=
 =?utf-8?B?aWNIUmN1WjRsOUxCNlJNakxsMEZndlZUMnlpUlk0V2FVY1h4OWRLS21PYlhD?=
 =?utf-8?B?dDl2dlBPOVBsV002MGt2cjRiSFBEcUpweW1TTEhMUE5XV0gyQlM1Q2hiWlhz?=
 =?utf-8?B?Y0o2cUJsc3dDYjlSdm5MbTJiOVljdEdpUUhaUm85eEI2bTdWcDZiQ0d0QVRT?=
 =?utf-8?B?ZGlJd1VIYXExWlk0bnhvUjF1bGtMR1FSUmovTXVac1d6T3VFOERtby94bGhv?=
 =?utf-8?B?OHBaM0xpcXdRQmVmUW9DNDhOMlpTTlM1Ykw2Z0g5TTV5ajhYS0ZxYjJ3TEYw?=
 =?utf-8?B?U2FsdVVPb1MramREeEkrTTVwU3ViNnoveVFmaXhiQ3J3T0JWU0M5dS9uU0JU?=
 =?utf-8?B?WTdLdXZ0NFVkVlJCSWppaEF4eHRSUEs5ZG9xd0Fsd2pjdzZpZTFBV0lDNXIy?=
 =?utf-8?B?a1g2SlhnUU16dmdXckw1YWo3NjlKMkcvdUlHUHVMdytMb0VQbnBsS0IrbS95?=
 =?utf-8?B?WWd4V01jemhGazFzSG01L0ovbDhNM3VlTEl2UGUxL3JHZHQwcWc0dFQ3bkpT?=
 =?utf-8?B?akJiTllsU2d5ckVPS0dCSkVyckJoaUpDL2hFc09zZ1FaSVJyTjFTQTBxUUFB?=
 =?utf-8?B?VTFjSlFZZkNKM0tKUEh1cUxSUXpLbG43RmlISmpuOTg2dnlJTWZMTFIvekJY?=
 =?utf-8?B?bVVxQnM5WFQ4OWJ3V09hUXoveUNodFdQeHVTVEdrZFR5MzlZdkttSGVFTHF2?=
 =?utf-8?Q?k+L+sarjrO5IPKWVbBFsXAYEF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06855280-d40e-482e-03c1-08daf810a04d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 22:25:52.1100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdUppNKYuzBU0a+NZP0sDbK72rBZqC7CVRxlf6x5oEVLYzMYOglakIyvvWqx1MYZUvsNc10yQ0p7CFOoKZQefA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7003
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
Cc: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-16 17:04, Errabolu, Ramesh wrote:
> [AMD Official Use Only - General]
>
> A minor comment, unrelated to the patch. The comments are inline.
>
> Regards,
> Ramesh
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Felix Kuehling
> Sent: Thursday, January 12, 2023 7:02 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Chen, Xiaogang <Xiaogang.Chen@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
>
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Use proper amdgpu_gem_prime_import function to handle all kinds of imports. Remember the dmabuf reference to enable proper multi-GPU attachment to multiple VMs without erroneously re-exporting the underlying BO multiple times.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++---------
>   1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 6f236ded5f12..e13c3493b786 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2209,30 +2209,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>          struct amdgpu_bo *bo;
>          int ret;
>
> -       if (dma_buf->ops != &amdgpu_dmabuf_ops)
> -               /* Can't handle non-graphics buffers */
> -               return -EINVAL;
> -
> -       obj = dma_buf->priv;
> -       if (drm_to_adev(obj->dev) != adev)
> -               /* Can't handle buffers from other devices */
> -               return -EINVAL;
> +       obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
> +       if (IS_ERR(obj))
> +               return PTR_ERR(obj);
>
>          bo = gem_to_amdgpu_bo(obj);
>          if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
> -                                   AMDGPU_GEM_DOMAIN_GTT)))
> +                                   AMDGPU_GEM_DOMAIN_GTT))) {
>                  /* Only VRAM and GTT BOs are supported */
> -               return -EINVAL;
> +               ret = -EINVAL;
> +               goto err_put_obj;
> +       }
>
>          *mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
> -       if (!*mem)
> -               return -ENOMEM;
> +       if (!*mem) {
> +               ret = -ENOMEM;
> +               goto err_put_obj;
> +       }
>
>          ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
> -       if (ret) {
> -               kfree(*mem);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_free_mem;
>
>          if (size)
>                  *size = amdgpu_bo_size(bo); @@ -2249,7 +2246,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>                  | KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>                  | KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
> Ramesh: Is it correct to assign WRITE & EXECUTABLE permissions to alloc_flags variable.

These flags affect GPUVM mappings of the BO. If we didn't set these 
flags, the imported BO would be read-only. The existing graphics-interop 
API (struct kfd_ioctl_import_dmabuf_args) doesn't have a way for user 
mode to provide these flags. Changing this would break the API.

Regards,
   Felix


>
> -       drm_gem_object_get(&bo->tbo.base);
> +       get_dma_buf(dma_buf);
> +       (*mem)->dmabuf = dma_buf;
>          (*mem)->bo = bo;
>          (*mem)->va = va;
>          (*mem)->domain = (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
> @@ -2261,6 +2259,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>          (*mem)->is_imported = true;
>
>          return 0;
> +
> +err_free_mem:
> +       kfree(*mem);
> +err_put_obj:
> +       drm_gem_object_put(obj);
> +       return ret;
>   }
>
>   /* Evict a userptr BO by stopping the queues if necessary
> --
> 2.34.1
