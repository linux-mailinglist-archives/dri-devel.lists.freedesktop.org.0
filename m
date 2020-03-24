Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2202C191BDC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 22:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8785289B01;
	Tue, 24 Mar 2020 21:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EA0899D6;
 Tue, 24 Mar 2020 21:20:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8BDE620029;
 Tue, 24 Mar 2020 22:20:48 +0100 (CET)
Date: Tue, 24 Mar 2020 22:20:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 21/51] drm: Use drmm_ for drm_dev_init cleanup
Message-ID: <20200324212046.GA24902@ravnborg.org>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-22-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323144950.3018436-22-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=AkVzOmc-mrFzkBrNKeIA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Mon, Mar 23, 2020 at 03:49:20PM +0100, Daniel Vetter wrote:
> Well for the simple stuff at least, vblank, gem and minor cleanup I
> want to further split up as a demonstration.
> 
> v2: We need to clear drm_device->dev otherwise the debug drm printing
> after our cleanup hook (e.g. in drm_manged_release) will chase
> released memory and result in a use-after-free. Not really pretty, but
> oh well.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 48 ++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index c80ebc6811b1..a710c53d13a8 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -580,6 +580,23 @@ static void drm_fs_inode_free(struct inode *inode)
>   *    used.
>   */
>  
> +static void drm_dev_init_release(struct drm_device *dev, void *res)
> +{
> +	drm_legacy_ctxbitmap_cleanup(dev);
> +	drm_legacy_remove_map_hash(dev);
> +	drm_fs_inode_free(dev->anon_inode);
> +
> +	put_device(dev->dev);
> +	/* Prevent use-after-free in drm_managed_release when debugging is
> +	 * enabled. Slightly awkward, but can't really be helped. */
> +	dev->dev = NULL;
> +	mutex_destroy(&dev->master_mutex);
> +	mutex_destroy(&dev->clientlist_mutex);
> +	mutex_destroy(&dev->filelist_mutex);
> +	mutex_destroy(&dev->struct_mutex);
> +	drm_legacy_destroy_members(dev);
> +}
> +
>  /**
>   * drm_dev_init - Initialise new DRM device
>   * @dev: DRM device
> @@ -647,11 +664,15 @@ int drm_dev_init(struct drm_device *dev,
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
>  
> +	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
> +	if (ret)
> +		return ret;
> +
>  	dev->anon_inode = drm_fs_inode_new();
>  	if (IS_ERR(dev->anon_inode)) {
>  		ret = PTR_ERR(dev->anon_inode);
>  		DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
> -		goto err_free;
> +		goto err;
>  	}
>  
>  	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> @@ -688,19 +709,12 @@ int drm_dev_init(struct drm_device *dev,
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
>  err_ctxbitmap:
> -	drm_legacy_ctxbitmap_cleanup(dev);
> -	drm_legacy_remove_map_hash(dev);
>  err_minors:
>  	drm_minor_free(dev, DRM_MINOR_PRIMARY);
>  	drm_minor_free(dev, DRM_MINOR_RENDER);
> -	drm_fs_inode_free(dev->anon_inode);
> -err_free:
> -	put_device(dev->dev);
> -	mutex_destroy(&dev->master_mutex);
> -	mutex_destroy(&dev->clientlist_mutex);
> -	mutex_destroy(&dev->filelist_mutex);
> -	mutex_destroy(&dev->struct_mutex);
> -	drm_legacy_destroy_members(dev);
> +err:
> +	drm_managed_release(dev);
If for example drmm_add_action() fails this will call the following
functions without their init parts called:

    drm_legacy_ctxbitmap_cleanup(dev);

        This function do:
	    mutex_lock(&dev->struct_mutex);
            idr_destroy(&dev->ctx_idr);
            mutex_unlock(&dev->struct_mutex);
        Use of struct_mutex - OK
	Call to idr_destroy() - I could not convince myself this was OK.
	But I did not look too deep into idr_destroy() - thsi is unknown
	land for me.

    drm_legacy_remove_map_hash(dev);

        This function do:
	    drm_ht_remove(&dev->map_hash); =>
	        if ((&dev->map_hash)->table) {

        ->table is NULL is init fucntion is not called - OK


    drm_fs_inode_free(dev->anon_inode);

      NOP if anon_inode is NULL - OK

So if idr_destroy() call is OK then error handling looks OK
and the patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

The error handling is even nicer later in this series.
But I looked only at this patch for now.

	Sam



> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_dev_init);
> @@ -763,20 +777,8 @@ void drm_dev_fini(struct drm_device *dev)
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
>  
> -	drm_legacy_ctxbitmap_cleanup(dev);
> -	drm_legacy_remove_map_hash(dev);
> -	drm_fs_inode_free(dev->anon_inode);
> -
>  	drm_minor_free(dev, DRM_MINOR_PRIMARY);
>  	drm_minor_free(dev, DRM_MINOR_RENDER);
> -
> -	put_device(dev->dev);
> -
> -	mutex_destroy(&dev->master_mutex);
> -	mutex_destroy(&dev->clientlist_mutex);
> -	mutex_destroy(&dev->filelist_mutex);
> -	mutex_destroy(&dev->struct_mutex);
> -	drm_legacy_destroy_members(dev);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
