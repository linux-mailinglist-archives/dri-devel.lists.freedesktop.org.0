Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78E529B80
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6C210EACC;
	Tue, 17 May 2022 07:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBF810EACC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652774028; x=1684310028;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X0XXCbYD3QcxNm0yCceltbuxdMJZQBfBt9Z1gVGHnHw=;
 b=STRcHWbd0UGSlDnUeCIGlhVUPLAFAsHOXrAwYhe5BPlvfx0/+LmJ0yOp
 V/vZjdqjDXIejiT8SGO8kRG82I34+SScsmunJHY7NoXrgzTdTl92mDtX0
 R2G9L+zUYUlkBJjbwJT4rFUpL+XqXkBxUy2s9kE3lakJK0D0YBQJbde+a
 +csosN7ZP3b6Uxy0cVgLGLeL9Y5h36fE6ft3HWcE4gyv7qNVb1H2Mriix
 5/MtpOtaCKkLW6feEcaEF1POPlkPRScQE+hMLlzQDUgbGLKNyeIc7CwGE
 flAnROkfs6HzFyq7RHCO8kOvA5HLlUEvnWTMYIQinIrBah0bbozzSz60A g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271045826"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="271045826"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:53:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="741654686"
Received: from psagan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.13])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:53:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Subject: Re: [PATCH] drm: Create support for Write-Only property blob
In-Reply-To: <20220510190823.1552920-1-markyacoub@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220510190823.1552920-1-markyacoub@chromium.org>
Date: Tue, 17 May 2022 10:53:39 +0300
Message-ID: <878rr0fvcs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: David Airlie <airlied@linux.ie>, markyacoub@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 May 2022, Mark Yacoub <markyacoub@chromium.org> wrote:
> [Why]
> User space might need to inject data into the kernel without allowing it
> to be read again by any user space.
> An example of where this is particularly useful is secret keys fetched
> by user space and injected into the kernel to enable content protection.

I think we're going to need more than an example in the commit
message. See Documentation/gpu/drm-uapi.rst.

BR,
Jani.


>
> [How]
> Create a DRM_MODE_CREATE_BLOB_WRITE_ONLY flag used by user space to
> create a blob and mark the blob as write only.
> On reading back the blob, data will be not be copied if it's a write
> only blob
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> ---
>  drivers/gpu/drm/drm_property.c | 3 ++-
>  include/drm/drm_property.h     | 2 ++
>  include/uapi/drm/drm_mode.h    | 6 ++++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index dfec479830e4..afedf7109d00 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -765,7 +765,7 @@ int drm_mode_getblob_ioctl(struct drm_device *dev,
>  	if (!blob)
>  		return -ENOENT;
>  
> -	if (out_resp->length == blob->length) {
> +	if (out_resp->length == blob->length && !blob->is_write_only) {
>  		if (copy_to_user(u64_to_user_ptr(out_resp->data),
>  				 blob->data,
>  				 blob->length)) {
> @@ -800,6 +800,7 @@ int drm_mode_createblob_ioctl(struct drm_device *dev,
>  		ret = -EFAULT;
>  		goto out_blob;
>  	}
> +	blob->is_write_only = out_resp->flags & DRM_MODE_CREATE_BLOB_WRITE_ONLY;
>  
>  	/* Dropping the lock between create_blob and our access here is safe
>  	 * as only the same file_priv can remove the blob; at this point, it is
> diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> index 65bc9710a470..700782f021b9 100644
> --- a/include/drm/drm_property.h
> +++ b/include/drm/drm_property.h
> @@ -205,6 +205,7 @@ struct drm_property {
>   * 	&drm_mode_config.property_blob_list.
>   * @head_file: entry on the per-file blob list in &drm_file.blobs list.
>   * @length: size of the blob in bytes, invariant over the lifetime of the object
> + * @is_write_only: user space can't read the blob data.
>   * @data: actual data, embedded at the end of this structure
>   *
>   * Blobs are used to store bigger values than what fits directly into the 64
> @@ -219,6 +220,7 @@ struct drm_property_blob {
>  	struct list_head head_global;
>  	struct list_head head_file;
>  	size_t length;
> +	bool is_write_only;
>  	void *data;
>  };
>  
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 0a0d56a6158e..de192d3813e9 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1107,6 +1107,9 @@ struct drm_format_modifier {
>  	__u64 modifier;
>  };
>  
> +#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
> +	(1 << 0) /* data of the blob can't be read by user space */
> +
>  /**
>   * struct drm_mode_create_blob - Create New blob property
>   *
> @@ -1120,6 +1123,9 @@ struct drm_mode_create_blob {
>  	__u32 length;
>  	/** @blob_id: Return: new property ID. */
>  	__u32 blob_id;
> +	/** Flags for special handling. */
> +	__u32 flags;
> +	__u32 pad;
>  };
>  
>  /**

-- 
Jani Nikula, Intel Open Source Graphics Center
