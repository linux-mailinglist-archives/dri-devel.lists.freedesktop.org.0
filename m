Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B6696361
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 13:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE9510E8B8;
	Tue, 14 Feb 2023 12:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977C810E8B6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676377196; x=1707913196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JMo/e34bMv8SopjC0sgD2lbBl4hlNjeQhhJDaGnK3lY=;
 b=gCjCrXNLbeZQyqJS8wFjOqP6SJRX5IqIZ8Io1L57HqH+3gfkfUNuOb0G
 Swih1UOpzVWD22O7cZ1cn4Qjr0DY4XpipNbklv934LAssW/Z/gp5lEkQA
 pmmPWxrscqDfC5Ecelr4JWXbaGOpLWcMTpLqMmaCtNsozvZISAbxELoog
 KZTOIUUXIBnQ5LfjIbSfC4vZ/hUX5Cgf+0LENjIGlw2VWFqJamQRxnef8
 8dxcZw/21UYLClNrYxP1ELCiIZlcCjYlMpT/ZSyjw7C89mse5o2znq+Qc
 wbsxHa0XmJFANOzxRIRXaL4eaS5FN1TV2LxapbYkZgh6GXWXxFQcWhxmi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319177648"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="319177648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 04:19:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="812001958"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="812001958"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 04:19:53 -0800
Date: Tue, 14 Feb 2023 13:19:51 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <20230214121951.GD2824715@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209081838.45273-4-christian.koenig@amd.com>
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
Cc: jacek.lawrynowicz@linux.intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 daniel.vetter@ffwll.ch, Oded Gabbay <ogabbay@kernel.org>, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 maxime@cerno.tech, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
> -void drm_debugfs_late_register(struct drm_device *dev)
> -{
> -	struct drm_minor *minor = dev->primary;
> -	struct drm_debugfs_entry *entry, *tmp;
> -
> -	if (!minor)
> -		return;
> -
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, 0444,
> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> -		list_del(&entry->list);
> -	}
>  }
>  
>  int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>  	entry->file.data = data;
>  	entry->dev = dev;
>  
> -	mutex_lock(&dev->debugfs_mutex);
> -	list_add(&entry->list, &dev->debugfs_list);
> -	mutex_unlock(&dev->debugfs_mutex);
> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
> +			    &drm_debugfs_entry_fops);
> +
> +	/* TODO: This should probably only be a symlink */
> +	if (dev->render)
> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
> +				    entry, &drm_debugfs_entry_fops);

For accel we would need conditional check for DRM_MINOR_ACCEL here as
well.

With this change and one from first patch, drm_debugfs_add_file() should
work for accel as well. We could get rid of debugfs_init from accel_debugfs_init().

However we still need support for writable files. I think we can just
add helper for providing debugfs dir to drivers i.e:

struct dentry *accel_debugfs_dir(struct drm_device *drm) 
{
	return drm->accel->debugfs_root;
}

Then individual accel driver could create files with different permissions there.

Regards
Stanislaw

