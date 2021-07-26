Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE13D6899
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 23:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59406E17B;
	Mon, 26 Jul 2021 21:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43976E17B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 21:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQG5qtEqxr3uDf0eUaw68SNJWlORBPUY60qdVaj67tQ3eb56HIeBaJq45bE4mPsToPnq/bRoHvMB9bp7fNspx2mNmqblpuj6HlU5PscuIlVFqbjrO7ObQrk15kswqtrFcEjpMKpeYs8IpdSzX4a6m4+WkzJPZECaEM+W7Kw/KkHdQVd+8OtCOlWLk5PPeEzPKsGUy7Fs3CkHU2VbLmaZKm/iJHjs1nBn0NTThbjOsQ57bpIErz5cduXFEzF6oj8y6109xaPVsxn7S+R1UuGOzEXwY3V94ShZemNkhQ6F52qbCSlFIa1O/mg1YKXMDmUEDDIxcbUxHHcO0eHWui15lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZM8EbsLVieL0GQpALDSkN/ZkVNJh0BQmNoHaGSK/Gs=;
 b=h4Zx3hHogc59PcUoq3mzNIRgU+yWxeP8ADaFdXvrAD5/XJDZapcEcjv+s++vlqztzfjRGhQMLgfiueA53XDOqKe9srvv21Arb9Crgr4dtFa265zTys3sG1L1nC9bpYTCjBEIL1wYoZEP9F0jB5+FDjU5jxXyqTJQPYaqNNb78HW2AtR5rFZKW717KP2CxK4eFY7KWlXjEhKodIUaKBpKmA4LlOAejkqi/KwDEgruMbhrSoDbL0lIyGG7wMTlPdDwRRMIEcOUqfdCKFdZ6/br5i5Y1f7TCnEgJHTBczrKKsaX/49Enn6r2ap9LU8MmO0ubKktZ2WBoYOO+p5L+wRCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZM8EbsLVieL0GQpALDSkN/ZkVNJh0BQmNoHaGSK/Gs=;
 b=qaVUUGhZGvEIx3qIGd93pPUIP60dZNkEmZASEWXC0sLV4GzvFwjVzvp3LYvEBFKqDxBC/JlVV6TslsXHiJsDA98kHifQFT07KBP5NhvreVvhidWDF44IVbphS3of0N9w7pBKjxXbns+zTpiHebtmw+oTRz7R4S1UuWO8soBvO1o=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 21:26:40 +0000
Received: from CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24]) by CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::a1f2:ad80:7e9f:db24%5]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 21:26:40 +0000
Date: Mon, 26 Jul 2021 17:26:36 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/5] drm/vkms: Map output framebuffer BOs with
 drm_gem_fb_vmap()
Message-ID: <20210726212636.3gj5oc7ubnqvlrpx@outlook.office365.com>
References: <20210725174438.24493-1-tzimmermann@suse.de>
 <20210725174438.24493-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725174438.24493-6-tzimmermann@suse.de>
X-ClientProxiedBy: BN6PR1701CA0001.namprd17.prod.outlook.com
 (2603:10b6:405:15::11) To CH2PR12MB5564.namprd12.prod.outlook.com
 (2603:10b6:610:65::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:991b:8d60:a76e:ef75)
 by BN6PR1701CA0001.namprd17.prod.outlook.com (2603:10b6:405:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Mon, 26 Jul 2021 21:26:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 156956e4-a497-477c-470c-08d9507c0ea6
X-MS-TrafficTypeDiagnostic: CH0PR12MB5106:
X-Microsoft-Antispam-PRVS: <CH0PR12MB51066F720DC2A6E7FBDA875298E89@CH0PR12MB5106.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ebjmCyjj8seqHfza816uLQjLY18MeBZ4jHJ3SrUlZkc6nc8KhrPh6U9wG6qlHlk6Dyp6/ZuWDV+HiGG1v4dlARDsJcffO00zOFauS2UKeRK/sEqRyyoU5Z0Q1vIFwfWlOpf50KPDb8Sp/WFdHVHB6Pr0cKTZPbrYN/wUsCGt/8Jy1SfniILgEcghmmThG2bGFP53A3Z2HjCBZNiEoyu0cvFUCC+waIhrZ+1SmCx/mwhkXrb9DCR7j5/Wqr2EQ5UUzI4ptwVprnMOUpQ7tiN9pnos/K4Au7aAeIV9xEO7Wrvkfu2q0m7GGdApLA9h9whdm41wPOyLHnMR9QMU+m/5IYoO5PuZJnWQVXGYrLID3oxS6JapW2NuNlRyGjpdS5Hmx9HmWgruU+aXCSzV4cbathqtycUYswsX0XY8q4GBrwkeb4GrLXWqwcURBWOmB+c2p9adrlWXK8Q9iKZXeHPGk4TZOVa/nx0ZnRdXy92Pfo/PmPzUmV3ChT7SvdfSougiT3sJgrkavi7geusXt8JhrSXDv7Ell38y2Hl3msXYwLE0CGVg+SxHBDmaTysPCmWu8WKBrXRsTtGR6qgVWE7uWAE6hLHP+6zQjuYJRKc55hPNHwYk6C3TEhRc0TqmWx6lrgKO5heVHE9Y0e6nc2QV+SthPUy6OTPcOq5sINR1wqWV0a+SxH2VQlS8kJFwW3nNQPc64nFMPmjGhSVDsdhhj7exWoyS6K4yfhIXFNuqsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5564.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(4326008)(6506007)(66476007)(8936002)(86362001)(66556008)(66946007)(9686003)(7416002)(478600001)(7696005)(186003)(52116002)(38100700002)(2906002)(5660300002)(83380400001)(8676002)(316002)(55016002)(1076003)(966005)(6666004)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dQbBkH/B0RHSY+b+gXXSuI+B9HcMCkZboqNHF34WnDr6MC3bcRizGFrwXcFx?=
 =?us-ascii?Q?yqIs1iHeppkgb2mf3LN95WYADPd5qi9v3Nk1Ky4X3MVNEAgztnLoV8D7l32v?=
 =?us-ascii?Q?NCkqh08jP+J8aS4kizTAi8TtLQpmIZz1pWssat9v5wlQ578Ne9dcu2ElGJmw?=
 =?us-ascii?Q?NthaKvdJjc8NfH3QXNnpEGPNOxoq6y54f+0YqEyMGIaaQpnW/5LRtHqT3LNQ?=
 =?us-ascii?Q?JzgPSQvFnEK45cKVEFLZ+W+VBpYrHcIfzxceVNXMyL48ZJgDUcIAZsBdVhp9?=
 =?us-ascii?Q?kyD9S9EKuwgWz617uHt1UQPYxD6KQayWEhe885/M3NtiWZzehWQ0YhD/1kjD?=
 =?us-ascii?Q?YCYcp5iA59y7mY6xOromq+S0ZCewZBQaS0EsJZ9M3PM+Qtvi2hNBPcONJwzd?=
 =?us-ascii?Q?V1Hhl7Wyo8nIqkOQmy+d0R1eRxVq9wtZzj/5jSOBSrBuBGIUzRpqNYNb01nv?=
 =?us-ascii?Q?0zxGdUG2Y9PojVLy6WJbmRYB2uCb+Dp5bTICj7mBwYuIV/PlVTYy7y28NjrG?=
 =?us-ascii?Q?XuWL9AtbzHtvUo7uQnizcXDzEumyiec99zGXgPo6r+qxxgH9DlTZToU3C2DX?=
 =?us-ascii?Q?L1nyMY1jFAgW4twoSksem0s0LxbyQYPZ2vJa35xh5nr7W7YgwNX4s9GRS2yg?=
 =?us-ascii?Q?lB6kmYAO39XGDl0I5me0CZ1fAldYSha7rghDbV35Xo4Y77WNOWuC8eauvD8o?=
 =?us-ascii?Q?tcp2tMgmylCigrt18kwlRrjz4WCXWS1myH2qckE9AOMJ6NvCByA+O1WkEe0+?=
 =?us-ascii?Q?D04M9ngI5SFS83FhJQpsptPZMvmJK44qKD8LzoJwf6xQbICKbdE7JARVZNGl?=
 =?us-ascii?Q?ujWHprpAk7dva04GKOANcOSVA3YElImnyS200YS+Cjdz9ZUjSuvpbP+wNCvg?=
 =?us-ascii?Q?SFyrecCvalMa4jxUc43of+ZAUE+0hnzcP++dh+dgG582lPDNbZkqrJ8dHTBJ?=
 =?us-ascii?Q?3UOiP/RyAi/3jtCbe5Jee37VNkj3y6by2hq5friIso30DB0EVu8LrXfuoKQA?=
 =?us-ascii?Q?02XmbzWCr82CrnRrNzXkRBo537XnaoRxGljLTT+cEn7yHMRsC7IVICk7CIch?=
 =?us-ascii?Q?E8Xh9xBc8qvn2XM56RTI7pT5rDMDEB1TZ/hYJMocTtowqNu6Oo3o7ZIG0HdA?=
 =?us-ascii?Q?JDjpfjsiagk5X3Ug7bE2y57horBiMVnge7kSBLv5uQ8ThusR3Abn22pmhTp5?=
 =?us-ascii?Q?xbn0V1eL7UWJnXHgAHM7wAJUAHq7eUb1ppNpLDYwdDUleeOYMFNNhUn3ozId?=
 =?us-ascii?Q?didbrG2dQiz5/arquJ5jwavQ9B2E6d9KLSIXX7M5AJVnTn83AiVbETid0D5P?=
 =?us-ascii?Q?V3DPWw/XXqCCqdhI6Eps36h4n0FOeWStIhz+NeMAMWDfXoP0BeSUBwvyy8rV?=
 =?us-ascii?Q?M3yjDd441QuoXG34tyaojU4jfXLI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156956e4-a497-477c-470c-08d9507c0ea6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 21:26:40.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLpp9jWxdCxxDlflXcs7jOmOqqsrGCfs6Su/tL/bZu+AYLo7EPe2XYJ/9jiDEYaAYWgoE/oY/+ZAtIcekfpIYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 melissa.srw@gmail.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/25, Thomas Zimmermann wrote:
> Abstract the framebuffer details by mappings its BOs with a call
> to drm_gem_fb_vmap(). Unmap with drm_gem_fb_vunamp().
> 
> Before, the output address with stored as raw pointer in the priv
> field of struct drm_writeback_job. Introduce the new type
> struct vkms_writeback_job, which holds the output mappings addresses
> while the writeback job is active.
> 
> The patchset also cleans up some internal casting an setup of the
> output addresses. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  6 +++++-
>  drivers/gpu/drm/vkms/vkms_writeback.c | 21 ++++++++++-----------
>  3 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index ead8fff81f30..49f109c3a2b3 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -257,7 +257,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		return;
>  
>  	if (wb_pending)
> -		vaddr_out = crtc_state->active_writeback;
> +		vaddr_out = crtc_state->active_writeback->map[0].vaddr;
>  
>  	ret = compose_active_planes(&vaddr_out, primary_composer,
>  				    crtc_state);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 8c731b6dcba7..8bc9e3f52e1f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -20,6 +20,10 @@
>  #define XRES_MAX  8192
>  #define YRES_MAX  8192
>  
> +struct vkms_writeback_job {
> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> +};
> +
>  struct vkms_composer {
>  	struct drm_framebuffer fb;
>  	struct drm_rect src, dst;
> @@ -57,7 +61,7 @@ struct vkms_crtc_state {
>  	int num_active_planes;
>  	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
> -	void *active_writeback;
> +	struct vkms_writeback_job *active_writeback;
>  
>  	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 0935686475a0..765bb85ba76c 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -65,21 +65,23 @@ static int vkms_wb_connector_get_modes(struct drm_connector *connector)
>  static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>  			       struct drm_writeback_job *job)
>  {
> -	struct drm_gem_object *gem_obj;
> -	struct dma_buf_map map;
> +	struct vkms_writeback_job *vkmsjob;
>  	int ret;
>  
>  	if (!job->fb)
>  		return 0;
>  
> -	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
> -	ret = drm_gem_shmem_vmap(gem_obj, &map);
> +	vkmsjob = kzalloc(sizeof(*vkmsjob), GFP_KERNEL);
> +	if (!vkmsjob)
> +		return -ENOMEM;
> +
> +	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map);
>  	if (ret) {
>  		DRM_ERROR("vmap failed: %d\n", ret);
>  		return ret;
>  	}
>  
> -	job->priv = map.vaddr;
> +	job->priv = vkmsjob;
>  
>  	return 0;
>  }
> @@ -87,18 +89,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>  static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  				struct drm_writeback_job *job)
>  {
> -	struct drm_gem_object *gem_obj;
> +	struct vkms_writeback_job *vkmsjob = job->priv;
>  	struct vkms_device *vkmsdev;
> -	struct dma_buf_map map;
>  
>  	if (!job->fb)
>  		return;
>  
> -	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
> -	dma_buf_map_set_vaddr(&map, job->priv);
> -	drm_gem_shmem_vunmap(gem_obj, &map);
> +	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
>  
> -	vkmsdev = drm_device_to_vkms_device(gem_obj->dev);
> +	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
>  	vkms_set_composer(&vkmsdev->output, false);
>  }
>  
> -- 
> 2.32.0
>

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> 

-- 
Rodrigo Siqueira
https://siqueira.tech
