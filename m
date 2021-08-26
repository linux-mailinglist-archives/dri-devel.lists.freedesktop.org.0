Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D143F84D8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C856E5A3;
	Thu, 26 Aug 2021 09:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C906E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:53:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h4so4064542wro.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ni1xy5Gepkk5NBQpOY3IACWkfMQ9OHRnfHvZ7VxtDs0=;
 b=EBbw5iuDgYoyjp0ztZeG08LqtiQBuGcd9QoDWNg0HwrHnneLUVjUgC7pGsSdoL6C3v
 uTJ9HDjYdICngR2YolnQ0jaIL+xRyz5Q9EFgSHRAwY9gqRpoLAagGbHUmySATzqhlDkh
 KTEbPFkHJh7n8Kyre+edSDiovcx7s92Q4Mgns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Ni1xy5Gepkk5NBQpOY3IACWkfMQ9OHRnfHvZ7VxtDs0=;
 b=dU0PMnmrBEE7TJmfvS4R5zBCDVsUiPjfkqJfj61EcKJUXdAZHxAqubAMQDShhf22y8
 sNtE6mJrzVar0+s/NFcMQUQ3KCzSYljPX85vJjGdZvrHVShNMXJ/dn5iC04su9D3jOXk
 toGnVJgIutxgoFVRluIR8H8AQtPvQMto8ObD4nRvrp5fLt7MMbYp7umKHEoVwlt4a7Iw
 HmL+p6ksL/GBw+hpzrwn7gkQIWVzHtkXi2kLo8c6eXFH6aDd/5F8Vtzb+dtov1EI+8Xa
 H5BcGDUUqz3mksuKkw9HzWa+sBppWd4n5SODQjGvp4mR1q95to0rLoNl0MlnkR70Lq0Y
 gyNQ==
X-Gm-Message-State: AOAM532cRFIBhZ1CmlfnCaoEp54a33wJjjtPjNap+ygbNILArs58tw6G
 j7qGasN2h8HG29Er2Sy4cEH40A==
X-Google-Smtp-Source: ABdhPJx1lz50jPKLRZSlFYgcMNWnHQNKvfoVO+OADtOF8BUg3znumuN3XCwj3fk80kP8jB86qYRwcQ==
X-Received: by 2002:a5d:47cd:: with SMTP id o13mr2937109wrc.246.1629971601523; 
 Thu, 26 Aug 2021 02:53:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o12sm2581867wro.51.2021.08.26.02.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:53:21 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:53:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com, matthew.auld@intel.com,
 dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 karthik.b.s@intel.com, jose.souza@intel.com,
 manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v8 1/7] drm: fix null ptr dereference in drm_master_release
Message-ID: <YSdkjvWN9RAijZJy@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com,
 tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826020122.1488002-2-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 10:01:16AM +0800, Desmond Cheong Zhi Xi wrote:
> drm_master_release can be called on a drm_file without a master, which
> results in a null ptr dereference of file_priv->master->magic_map. The
> three cases are:
> 
> 1. Error path in drm_open_helper
>   drm_open():
>     drm_open_helper():
>       drm_master_open():
>         drm_new_set_master(); <--- returns -ENOMEM,
>                                    drm_file.master not set
>       drm_file_free():
>         drm_master_release(); <--- NULL ptr dereference
>                                    (file_priv->master->magic_map)
> 
> 2. Error path in mock_drm_getfile
>   mock_drm_getfile():
>     anon_inode_getfile(); <--- returns error, drm_file.master not set
>     drm_file_free():
>       drm_master_release(); <--- NULL ptr dereference
>                                  (file_priv->master->magic_map)
> 
> 3. In drm_client_close, as drm_client_open doesn't set up a master
> 
> drm_file.master is set up in drm_open_helper through the call to
> drm_master_open, so we mirror it with a call to drm_master_release in
> drm_close_helper, and remove drm_master_release from drm_file_free to
> avoid the null ptr dereference.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess we should also have a cc: stable on this one? I think this bug
existed since pretty much forever, but maybe more prominent with the
drm_client stuff added a while ago.
-Daniel

> ---
>  drivers/gpu/drm/drm_file.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index ed25168619fc..90b62f360da1 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
>  
>  	drm_legacy_ctxbitmap_flush(dev, file);
>  
> -	if (drm_is_primary_client(file))
> -		drm_master_release(file);
> -
>  	if (dev->driver->postclose)
>  		dev->driver->postclose(dev, file);
>  
> @@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
>  	list_del(&file_priv->lhead);
>  	mutex_unlock(&dev->filelist_mutex);
>  
> +	if (drm_is_primary_client(file_priv))
> +		drm_master_release(file_priv);
> +
>  	drm_file_free(file_priv);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
