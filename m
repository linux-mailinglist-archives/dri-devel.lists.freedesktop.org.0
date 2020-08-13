Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC924386F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99446E1F1;
	Thu, 13 Aug 2020 10:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA166E1F1;
 Thu, 13 Aug 2020 10:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCf4kroZ2DwyP0ZO6PdmeWhGggFV70N4wVZdh4OdNruuD7uKMJFbPFnMA7Ue4XqL+T+l+c9Zj2nWI1k30ds9utZwsUtWCTvwifBXKrFrj0wZHQvm4K+E40GEO2Qxk/cD6UfAouuIDAvl84r9qQrwG219ZfPxpguY+2XcPYKgYC0Dwp0GKHk6AMUp77GIFpQuVcrHSWlMubWlSHjVenF+MwCKXWW7ZVfUFs3SkReb4ceSSSyWQnxlcrq1bkJolNdbbjoGkSROuBKJsmeakR3HaFJM/a5LiyQ9J6pt8XidhSTt0yDleVsH9J8Tg9qxJb5HKpHv9qf36IPNma1ahjualg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSz9nFAFbOIqhnQNzaxfckaYjKnndbAE2d455jWX5XY=;
 b=KtOEqcjZdYeT6JVQkbOgNJo6c8rTHDalZW6C7mkhHWeB4c2Jg9rfN1vxS5TAF2ghxISSWM0p8vsKZs7RuQCC8mHT+2+Ruz4G25Z5R3G6TxudCiYg5FklbQxnlFLj87pVbsQtJFoLl8Jv/hanTMq0kEITyFzTTH6+gkbAHlaBvoVmVCWIp0dj4c1nYxMOrT4/rjSnfDGLmpasDWUmPezt0HGNCjI/qd8/Wa3EpG+wVZNOzCcSxsKvTn2rAW04/vyZKnbOgWQgDWStDtbpvtbC2G/kZmvOpMxnOiHZRsvObpKCZL7jOgvwYJmGs33DUDADshIGPBVFl54eDwM963blyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSz9nFAFbOIqhnQNzaxfckaYjKnndbAE2d455jWX5XY=;
 b=X8Ct6egM7T1+gPF2CKvBDULTipuiCeXLdMXF3VKaURVao74Ip5jQlqS0MPkgFQQK0abLgRdotjPbD23UtIo02bhVmyzK2g2stp9X12TEokDoSfw9AWELKDt3fNeOVtgZQDG+M9uquP1SkvNQzuqB6fVui24No+xiX4yyXWOGrh4=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Thu, 13 Aug
 2020 10:24:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.015; Thu, 13 Aug 2020
 10:24:51 +0000
Subject: Re: [PATCH 12/20] drm/radeon: Introduce GEM object functions
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
 bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
 hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 abdiel.janulgue@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-13-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fb070238-b6ca-8e31-e559-51eda489915e@amd.com>
Date: Thu, 13 Aug 2020 12:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200813083644.31711-13-tzimmermann@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0010.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0010.eurprd09.prod.outlook.com (2603:10a6:200:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Thu, 13 Aug 2020 10:24:28 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 101aad94-1d38-44c5-10b7-08d83f731c56
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43913CE92770343995679E0783430@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEKDyXvpDX4n+lKIwJ+ppJ9UZuz82Mj0x2Q5vocfZKlzAxb8Jz5GrfKr/lbEzYfXumPpxDqqcw+MxuFTY/2kYqERp6+H/MrsE7GVcgtODTVju+1VTtz/bSXtheg608898CgRoJkHvUn1ix9ZThLGERH8Tc3byBocMdmDXhYTWQaLkrn5SjkP47iKK546xJOvDD8PYXxg9gWOprgS2gb5+TxKFp9jB87NsEvxzv5WfTvo7FWALWxy2ah9wzJNoiYn1ra6eF1gYIFjScBJkLBGO8aG5AivWyMjFyjOm1ur7bbqwbhwSUAsbrdG9+I2DnCpm5+3/cjrUWj14XuiNXZtRVw3T7lhL5iWnmkTngSEj570jUh3vmRPesMXXvL0hdhEpO2ZjOmmXx1WOpF4GWKieA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(31696002)(31686004)(8936002)(186003)(36756003)(8676002)(16526019)(83380400001)(4326008)(6666004)(478600001)(66476007)(66556008)(316002)(2616005)(86362001)(1191002)(6486002)(7366002)(52116002)(2906002)(5660300002)(7416002)(66946007)(7406005)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: T7kw9MLarij8HCkRocaLCVaHoKCDXDt5qa8IBPZzlS/yUJZqLQ3MkDc6Ej1qZYW+LiKYfdU33C57w3DC/RSbVnEsFb+VFQihae0fhozvDwJSNxWpDzhUtSykK3+QV8baOPJ3u5GHDelmeeKBHncrpBgEUxFYmBxGiYpHKMaAPsals0ocW8EM3QYnXF+wt9c7ydJRuust0HZuslSO0hhDlTGYLw+JlCEqFAzeoSCjvbN/NPzNNWAH5ZqJIBIn2RjGhEyDxBvFLS8nAzomgut9uTkdvdL8gs7QMqLeaTfhGEtWFRbIlzFuUwylwOHrskoWg6oMPLGPGlNLDEIBRv7S7QPdENNXA+GOllBgxTT/FNBtQTjiKDdBDt7sDROHj/rpBsU87xyLHeiRp3ajYKo0rx6vkYmEfYFYBHWfbugEjuEYMP/frdvzURKKhU9LTeaqAWVuhA3K6YSuLD5IOPCK3mZjGWf9Hci7VVbmI8F7qw6sQR0mS6aOPKWVOzikzKzDmG887K0W+FQSqD2vGdG92FuWLX5ShxT/DFReEzMa24D93xYuErf1vw2+P6p0wfm3guAnNX4DeXfr88kMO58W382SSX5t+stTMbipaK8Bj1fikjcHOIPZmyzMsY0PRhUxnNPJEEYhz+6ZO4icbyLt+P8UnEv4L1Yh429PAfEyT3mqJrasrurXTHHrG06xVyEw5O0kogIAmOpbkg2iDkfEYA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101aad94-1d38-44c5-10b7-08d83f731c56
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 10:24:50.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ijst7BhQzzE5Iy3kbq8alBEhjq/JvUNC0LXBPMBRguNwcSuP/pX2XLiKoVKv+bW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in radeon.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/radeon/radeon_drv.c    | 23 +----------------------
>   drivers/gpu/drm/radeon/radeon_object.c | 26 ++++++++++++++++++++++++++
>   2 files changed, 27 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 4cd30613fa1d..65061c949aee 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -124,13 +124,6 @@ void radeon_driver_irq_preinstall_kms(struct drm_device *dev);
>   int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
>   void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
>   irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
> -void radeon_gem_object_free(struct drm_gem_object *obj);
> -int radeon_gem_object_open(struct drm_gem_object *obj,
> -				struct drm_file *file_priv);
> -void radeon_gem_object_close(struct drm_gem_object *obj,
> -				struct drm_file *file_priv);
> -struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
> -					int flags);
>   extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int crtc,
>   				      unsigned int flags, int *vpos, int *hpos,
>   				      ktime_t *stime, ktime_t *etime,
> @@ -145,14 +138,9 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
>   int radeon_mode_dumb_create(struct drm_file *file_priv,
>   			    struct drm_device *dev,
>   			    struct drm_mode_create_dumb *args);
> -struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
>   struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
>   							struct dma_buf_attachment *,
>   							struct sg_table *sg);
> -int radeon_gem_prime_pin(struct drm_gem_object *obj);
> -void radeon_gem_prime_unpin(struct drm_gem_object *obj);
> -void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
> -void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   
>   /* atpx handler */
>   #if defined(CONFIG_VGA_SWITCHEROO)
> @@ -550,7 +538,7 @@ long radeon_drm_ioctl(struct file *filp,
>   	}
>   
>   	ret = drm_ioctl(filp, cmd, arg);
> -	
> +
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);
>   	return ret;
> @@ -609,22 +597,13 @@ static struct drm_driver kms_driver = {
>   	.irq_uninstall = radeon_driver_irq_uninstall_kms,
>   	.irq_handler = radeon_driver_irq_handler_kms,
>   	.ioctls = radeon_ioctls_kms,
> -	.gem_free_object_unlocked = radeon_gem_object_free,
> -	.gem_open_object = radeon_gem_object_open,
> -	.gem_close_object = radeon_gem_object_close,
>   	.dumb_create = radeon_mode_dumb_create,
>   	.dumb_map_offset = radeon_mode_dumb_mmap,
>   	.fops = &radeon_driver_kms_fops,
>   
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = radeon_gem_prime_export,
> -	.gem_prime_pin = radeon_gem_prime_pin,
> -	.gem_prime_unpin = radeon_gem_prime_unpin,
> -	.gem_prime_get_sg_table = radeon_gem_prime_get_sg_table,
>   	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
> -	.gem_prime_vmap = radeon_gem_prime_vmap,
> -	.gem_prime_vunmap = radeon_gem_prime_vunmap,
>   
>   	.name = DRIVER_NAME,
>   	.desc = DRIVER_DESC,
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index bb7582afd803..882390e15dfe 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -45,6 +45,19 @@ int radeon_ttm_init(struct radeon_device *rdev);
>   void radeon_ttm_fini(struct radeon_device *rdev);
>   static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
>   
> +void radeon_gem_object_free(struct drm_gem_object *obj);
> +int radeon_gem_object_open(struct drm_gem_object *obj,
> +				struct drm_file *file_priv);
> +void radeon_gem_object_close(struct drm_gem_object *obj,
> +				struct drm_file *file_priv);
> +struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
> +					int flags);
> +struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
> +int radeon_gem_prime_pin(struct drm_gem_object *obj);
> +void radeon_gem_prime_unpin(struct drm_gem_object *obj);
> +void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
> +void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +
>   /*
>    * To exclude mutual BO access we rely on bo_reserve exclusion, as all
>    * function are calling it.
> @@ -180,6 +193,18 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
>   	}
>   }
>   
> +static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
> +	.free = radeon_gem_object_free,
> +	.open = radeon_gem_object_open,
> +	.close = radeon_gem_object_close,
> +	.export = radeon_gem_prime_export,
> +	.pin = radeon_gem_prime_pin,
> +	.unpin = radeon_gem_prime_unpin,
> +	.get_sg_table = radeon_gem_prime_get_sg_table,
> +	.vmap = radeon_gem_prime_vmap,
> +	.vunmap = radeon_gem_prime_vunmap,
> +};
> +

Same comment as for amdgpu, please put that into radeon_gem.c instead.

Christian.

>   int radeon_bo_create(struct radeon_device *rdev,
>   		     unsigned long size, int byte_align, bool kernel,
>   		     u32 domain, u32 flags, struct sg_table *sg,
> @@ -209,6 +234,7 @@ int radeon_bo_create(struct radeon_device *rdev,
>   	bo = kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
>   	if (bo == NULL)
>   		return -ENOMEM;
> +	bo->tbo.base.funcs = &radeon_gem_object_funcs;
>   	drm_gem_private_object_init(rdev->ddev, &bo->tbo.base, size);
>   	bo->rdev = rdev;
>   	bo->surface_reg = -1;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
