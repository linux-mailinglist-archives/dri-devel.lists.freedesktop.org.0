Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3735726B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 18:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8083889CD3;
	Wed,  7 Apr 2021 16:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA84189AB2;
 Wed,  7 Apr 2021 16:53:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ4zAckDhVpyYHMoyy6uRX583OwjVOAYMIKV70fIqoJCTgjoF+kF2ltytcTr2Lt3BNJWdgFPpluJFri5iA9G4pbBrUBvBjjpDrB7gP6x68FsGihUc579M9y277FyH/YBIj6jmxEbpwB6JByDFSAsuvj3CgUlnoAnFSOSJu9j8UQt3YnmVjbUoE1e6BPgt9mJ1/BpiPlVKc3Xlq5Efh0NrI3n6us1i1d0O8PcMfl8mI9ma48oYmhwDfIYWCyx7jd202xuXUutt3KfzBYxym0SNe4AuZ1t35+M7ZouWvXgb/PZl7TXjeUfaniTdNVQeZSgmXHK0sl/NSxuW5/O86Mhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSjBxdS6NQZVLNlKztCR9AVfymIlMoCy+bd4/Ne2Qsc=;
 b=JMmlnX+pC7Gqsh34OfNm2bHW5KdOchaKNGKcJUNEMkq86g7Gflkts9qSF8TFGvxd8k7vagcIGF772rwJfjWV+ahS4trtn83YSeOXAAgSx5BpZFDhay3rUlASKmbD9fzen1j6SWNew3YC3qxn/0XNezAf0mOFqyGPsCbxrAvTxiVyV8xMIFGdVOyfPqCvHdQmdjftJePOclP/zW20mHwD02BGiekJLB4ojC58zMQmujclY4fbfJO3ljK3IbWygh28F0jlpD86oBMIAHtOdisjJic/zwSF5Iwx3nJwTntrdZEnbSME1FyEbkiGDjkrHa86/tN2uQSf81iKd2hrHqtOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSjBxdS6NQZVLNlKztCR9AVfymIlMoCy+bd4/Ne2Qsc=;
 b=xzYWLxd3VrBObaVFOU2QPAs+x0uQmuoQ1GnSxIsNhtlWqp0gt1WEwBxmbBqSOvcwcjSxp58BcIV9smh1Y+LqrIKF8Gnzy7Um9zuEItQbMlb1fVbab0/NRiSLqeSyAeX9hUphKd/KvQkpYy5cwnkkl2dcTXUvKdbJW8u3c7kNA8U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6559.namprd05.prod.outlook.com (2603:10b6:208:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8; Wed, 7 Apr
 2021 16:52:59 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 16:52:59 +0000
Subject: Re: [PATCH 7/8] drm/vmwgfx: Inline vmw_verify_access()
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com, shashank.sharma@amd.com, sam@ravnborg.org,
 emil.velikov@collabora.com, Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-8-tzimmermann@suse.de>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <e9e0dc6a-31ef-14fc-c094-c7dd5d5292d2@vmware.com>
Date: Wed, 7 Apr 2021 12:52:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210406090903.7019-8-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL1PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:208:256::10) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0005.namprd13.prod.outlook.com (2603:10b6:208:256::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend
 Transport; Wed, 7 Apr 2021 16:52:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f0d5908-3300-4209-fdca-08d8f9e59996
X-MS-TrafficTypeDiagnostic: MN2PR05MB6559:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB6559300DCB0C28696D626867CE759@MN2PR05MB6559.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BP5FTPLssVdG4aI17Df4Pg/NGn0r21SV254MLoQ/N9eGlacvSThXkYs1j9Zf1Uvym0/fIN+WDY7UUo8u1ZLrVnwPPURRJx7P3bZ1TlSJFTgWM+geHyWtuDrgGBdi31JQKSCO+FD5PjH9osQGOXwfqNER/sDbYV0jSVtaoyJA2timPs10axRqmrxuX4VDSnOwMg/vzKBa3HLqa7Aw4ucKdwlSoPgLpm/8MZ2+sFZRrblqgUnrcB1nIBZsKZmoHMpbF5DKk9sk3uiuBv6nzqm/IEnHB+Q9++a8OWRjROpONy/KFnqqBBi0xa8O9xLesBQ4IoKVgdj/tO1RhdzwyamUC46h5XJ8GOzsnk4xwI3b059AZD3Bf7mYFO/E3bUPvsPm0Sw0NdJAxukTArCo4uMgDLZXZOejD3iGt64u6ShVA7+AGmW3ZvMOV2Y9D170p3Jnm9MywJrNCrXBcRGmwG9s6etVHkErcwU72E0TqslNvO57qkEL/mtcuQmzd2d8ily2X24Dcwjpm2CizD+0coP+O1dy6GsZjb70KKNL30iaTGXdIKzYv2M9/kAHFBg1LItJ9avwycgE+Op3aN+hk0uiU73emxqnbLTbhB3MuX2ovJfwbYzYBOuuils2E2nIiLHRXT+2zMT/hfxmYxKSQfdQh576Bv2lLBg07O2POyhjmRF+qdL8jyuNDJWmShnYwaoxT+8Au08PqZUejXXjG4C5DRaIEcaaFQmpps1cKpd+XI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(53546011)(7416002)(66946007)(478600001)(31686004)(6486002)(26005)(66556008)(66476007)(186003)(5660300002)(86362001)(921005)(956004)(16526019)(31696002)(316002)(2616005)(36756003)(4326008)(2906002)(16576012)(38100700001)(8676002)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHRXSSs3MngxSTI0Z04wSXA2N3NZMVJUVkYxZGhPc3RJbmVFN0RYNzJ3VEhZ?=
 =?utf-8?B?b2RpM1hNY2R1RE9LdFBMY25ONGJVeVlZbys4V0F0bkEvcTNFMnpuT204MEZW?=
 =?utf-8?B?STZWSTUycDFhV2pZSml1eUFURXAyVjdOck1pTkIrVndKZVluaFpxUjBFa1NX?=
 =?utf-8?B?L21mOUVYT2RoeTd6ckxNRHpPK3pOUWMyTlVTa2FuMFNPd3U0WDhNc3pkbHJR?=
 =?utf-8?B?SWQwSS95bWV3UXMvQnNIRm9DV0FldVZUWXJoNHFwK0JlV3dKY2JzY2RaSkZS?=
 =?utf-8?B?M1o5dk9TdzR2N29SWk1Eb0pIVjJmUTFEcllzVUNTTHlqRlVrTTlXaGVGVzVt?=
 =?utf-8?B?NXp6MWxreWNlejljZnkwck1UTlpWN1d5QkVJQkd5U3lTK0NXTVp5enJVL2VM?=
 =?utf-8?B?T3JaY1ZSTjUyS1NVVnhNS0d3bmhzRTBWK3RWeVRTdVpXYkJWajR6MUxrZCtI?=
 =?utf-8?B?RENuOUJPTHUwNjdhWko2aHhxbW9YT0R2VlVKMWMybjdkYjNCSW5FamlTMWlM?=
 =?utf-8?B?TUlMZmZJdEdkTmM4ZHlIRE8wcVh0eEJMZXVCUkhZMWk3SUxHdVRPVll2VUVH?=
 =?utf-8?B?UGhqQzV1SXFNVUphcTRCbmlEdlpuQkVpMVlmb3NuS2w5YTFtZU5iU1l3L3ZZ?=
 =?utf-8?B?NzNwV1Rsalo5aC92dU9sbkVWNEw5b00wL1ZSSkhES25JYnVkR0lzdHF4dUhu?=
 =?utf-8?B?djhvYVJLNkZ6V3ZBdG0wSFpUYnNVM0NaYXRicE8wMFVoYW5DZXUyNHhXVENk?=
 =?utf-8?B?YWcza1cwS3c3Vy83Q21wV0ZCT1JwbDA1bEF2dDU5NUVkTCtBUFpiTGNEV1hO?=
 =?utf-8?B?K3BsenE2WS9haDM5MzE3UEZoQXlBQlpMT0RqQlhKNXpMQVNyTW1DNUZuanl4?=
 =?utf-8?B?V2J4MDZVNjhFUkd0VmRaQm5WNUE1YjNGR0tsTDZ3TG5NUFo2RGNxbHl0N1h6?=
 =?utf-8?B?VWVZUm13VDlqSDlHRHVPbzV1TTJ6c3FtRWlkckNXeVNYTWpWUFp1Tit4STg0?=
 =?utf-8?B?SWQ0ZGIyUHd0NUZteWtuWmI5ZkdUWnZXOWVRNWc4OUJsdFo2TjR6YUtnOWNH?=
 =?utf-8?B?dExQQm1kbWx5bjJZdmdUbDdwNWl3ck4xVVlNakpPRVJNWjZsQkViWDdEa3B1?=
 =?utf-8?B?VTYya1prR0hYSVJBcGRLYnlORnk1UXkzR2JKV3NZa3d6bHlIMU5xcjhHWkJL?=
 =?utf-8?B?ZnJlS1VORHdLWjN5NW1kTTVreE8vTXlNVjBPbk9pdTczNjcwUGNna2VCUmxD?=
 =?utf-8?B?V01rV0RlcVBkU2tFZHR3U2Jta2RSUXhxVTBxaExwRG1iQ0FOalNyV2Z2Wnlv?=
 =?utf-8?B?d3VoZzNKcXg0TjJMVDB0a0pGdmMxR3ZDcWtRWnZ3cm1hNHgzRXNYL0tScjVG?=
 =?utf-8?B?QVc2czd3WWNGbTA2MXFUK1JNcVQ5ZFRzT2hSNWhGQlduQzB0aUJubmNqdk8z?=
 =?utf-8?B?bzd1dUZNWElVRW9UN0RBZ2R5QjNqMEtEVjZFZnR4UTFmUDVob2ZGZFhMY2ZQ?=
 =?utf-8?B?SVE0MzJtMlZXMW51UmlYN3Z0SFV4RWZsWm5lRnYxVVMwZFpzVFlpNERDYVZk?=
 =?utf-8?B?Wlc1V0dmZDkxWFZjWkhnRll4RjdKVG1NbXhZSncwWlNjenB4WjRDS1J6QjBi?=
 =?utf-8?B?ZHEzSTVTVGwvWmJ6bWdtL1I0RHlCS3ZOTkdXYXJBL3JBd0FEaFpyTm1xdDIr?=
 =?utf-8?B?LytvUFpaaTdkMzhZcUxuM3hpdFhHdWhzUi9WSnBMMzI1TzRHRC9MWG1aM1Jq?=
 =?utf-8?Q?DVy6mFU+SM67bOwGHYgMGKZbgz9tJMTtt/tIaKd?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0d5908-3300-4209-fdca-08d8f9e59996
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 16:52:59.7188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7Oq3jGMgUK5hDN7rf1P0kuGgvWVaI2XlSta1MAv+i06Ui5bOPEYg8yfmY1peZ2nSdk3MszxoaFgbB7mP575xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6559
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/21 5:09 AM, Thomas Zimmermann wrote:
> Vmwgfx is the only user of the TTM's verify_access callback. Inline
> the call and avoid the indirection through the function pointer.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 ---------
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   | 7 ++-----
>   2 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 2dc031fe4a90..a079734f9d68 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -658,14 +658,6 @@ static void vmw_evict_flags(struct ttm_buffer_object *bo,
>   	*placement = vmw_sys_placement;
>   }
>   
> -static int vmw_verify_access(struct ttm_buffer_object *bo, struct file *filp)
> -{
> -	struct ttm_object_file *tfile =
> -		vmw_fpriv((struct drm_file *)filp->private_data)->tfile;
> -
> -	return vmw_user_bo_verify_access(bo, tfile);
> -}
> -
>   static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
>   {
>   	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
> @@ -768,7 +760,6 @@ struct ttm_device_funcs vmw_bo_driver = {
>   	.eviction_valuable = ttm_bo_eviction_valuable,
>   	.evict_flags = vmw_evict_flags,
>   	.move = vmw_move,
> -	.verify_access = vmw_verify_access,
>   	.swap_notify = vmw_swap_notify,
>   	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
>   };
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> index 3eaad00668f2..2574d4707407 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> @@ -65,6 +65,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>   	};
>   	struct drm_file *file_priv = filp->private_data;
>   	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
> +	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
>   	struct ttm_device *bdev = &dev_priv->bdev;
>   	struct ttm_buffer_object *bo;
>   	int ret;
> @@ -76,11 +77,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>   	if (unlikely(!bo))
>   		return -EINVAL;
>   
> -	if (unlikely(!bo->bdev->funcs->verify_access)) {
> -		ret = -EPERM;
> -		goto out_unref;
> -	}
> -	ret = bo->bdev->funcs->verify_access(bo, filp);
> +	ret = vmw_user_bo_verify_access(bo, tfile);
>   	if (unlikely(ret != 0))
>   		goto out_unref;
>   

Looks great.

Reviewed-by: Zack Rusin <zackr@vmware.com>

z

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
