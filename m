Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858806DED09
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 09:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D293E10E6FB;
	Wed, 12 Apr 2023 07:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6CF10E716
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:55:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f080fc6994so3112905e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681286126;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MjkjPiJds6NhU+s5Yx2pUX02cx7dy7w1B7Hx/2j4ki8=;
 b=lowDSLhpYz5oAZVa6OxVSMTPZBY2GiCr24O1uNalYXG3eKNBAOYxCiWqUpmkcn77oJ
 QmDsidgKsWFNtDe0iS3VPBd4GWNjawEI50qkjOEGXGecLqTzn6YaQs4sjJkU59yjh+G/
 aJhze9GyXDwgGIwCURAA0Bm+4xpnoxynRkO5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681286126;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MjkjPiJds6NhU+s5Yx2pUX02cx7dy7w1B7Hx/2j4ki8=;
 b=zzI7zYEczIRkAPSm7PLjMhSvFyxfo0Vr8EcqTicZ9DqsW+kB/ZygTzlW4lnQf7VkU9
 D9YFH+vz9Dgk6I1ikZAhB1exJNLGRecYY9411+o1KJ/0RrNrcFkjI3nOeF3naEDBATgY
 4yAcz4gKgb5A40E1A6ErTwdEsKBLokaBxEvdUcjCvhoaE7n6kLT87NOlNYET3fVZzg7X
 46sizSmWiS0sFrCCX5fle8sNFUAN4z3IdZxwqWNapQNQKS6JawUSwjhFS3MFqFp73HRq
 aHjVhyd2M/g/YJmaOkWRfEZbrVkQN2nLy7qflMN4a8h2EX+ju/xM87lN/03UWAxSNv2n
 qmcg==
X-Gm-Message-State: AAQBX9dhiQRp/cVDkvpqRbJogSCd3dII7dhDr1RkvivZ8X/llzqLDAXU
 sTI/ZJmMhiln/yqBMdZB6zEQqvXT83kGo3euOmQ=
X-Google-Smtp-Source: AKy350YCD507ti6nJXcEWhQIA1OyqKMoRsMgrjJuXF/qJiryLyQVzwc6kBcMRP8haoB6i2piKpF90Q==
X-Received: by 2002:adf:f107:0:b0:2c7:660:9284 with SMTP id
 r7-20020adff107000000b002c706609284mr1303777wro.0.1681286126393; 
 Wed, 12 Apr 2023 00:55:26 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfe310000000b002f27a6a49d0sm5371170wrj.10.2023.04.12.00.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 00:55:25 -0700 (PDT)
Date: Wed, 12 Apr 2023 09:55:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 1/7] drm: Add common fdinfo helper
Message-ID: <ZDZj63TsCo/gd1pC@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christopher Healy <healych@amazon.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411225725.2032862-2-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 03:56:06PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Handle a bit of the boiler-plate in a single case, and make it easier to
> add some core tracked stats.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Thanks a lot for kicking this off. A few polish comments below, with those
addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_file.c | 39 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_drv.h      |  7 +++++++
>  include/drm/drm_file.h     |  4 ++++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index a51ff8cee049..37dfaa6be560 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -148,6 +148,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
>   */
>  struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  {
> +	static atomic_t ident = ATOMIC_INIT(0);

Maybe make this atomic64_t just to be sure?

>  	struct drm_device *dev = minor->dev;
>  	struct drm_file *file;
>  	int ret;
> @@ -156,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  	if (!file)
>  		return ERR_PTR(-ENOMEM);
>  
> +	/* Get a unique identifier for fdinfo: */
> +	file->client_id = atomic_inc_return(&ident) - 1;
>  	file->pid = get_pid(task_pid(current));
>  	file->minor = minor;
>  
> @@ -868,6 +871,42 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>  }
>  EXPORT_SYMBOL(drm_send_event);
>  
> +/**
> + * drm_fop_show_fdinfo - helper for drm file fops
> + * @seq_file: output stream
> + * @f: the device file instance
> + *
> + * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
> + * process using the GPU.

Please mention drm_driver.show_fd_info here too.

> + */
> +void drm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct drm_device *dev = file->minor->dev;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	/*
> +	 * ******************************************************************
> +	 * For text output format description please see drm-usage-stats.rst!
> +	 * ******************************************************************

Maybe move this into the kerneldoc comment above (perhaps with an
IMPORTANT: tag or something, and make it an actual link)?

Also in the drm-usage-stats.rst please put a link to this function and
that is must be used for implementing fd_info.

> +	 */
> +
> +	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
> +	drm_printf(&p, "drm-client-id:\t%u\n", file->client_id);
> +
> +	if (dev_is_pci(dev->dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
> +		drm_printf(&p, "drm-pdev:\t%04x:%02x:%02x.%d\n",
> +			   pci_domain_nr(pdev->bus), pdev->bus->number,
> +			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> +	}
> +
> +	if (dev->driver->show_fdinfo)
> +		dev->driver->show_fdinfo(&p, file);
> +}
> +EXPORT_SYMBOL(drm_fop_show_fdinfo);

Bit a bikeshed, but for consistency drop the _fop_? We don't have it for
any of the other drm fops and git grep doesn't show a naming conflict.

> +
>  /**
>   * mock_drm_getfile - Create a new struct file for the drm device
>   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 5b86bb7603e7..a883c6d3bcdf 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -401,6 +401,13 @@ struct drm_driver {
>  			       struct drm_device *dev, uint32_t handle,
>  			       uint64_t *offset);
>  
> +	/**
> +	 * @fdinfo:
> +	 *
> +	 * Print device specific fdinfo.  See drm-usage-stats.rst.

Please make this a link. I like links in kerneldoc :-)

> +	 */
> +	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
> +
>  	/** @major: driver major number */
>  	int major;
>  	/** @minor: driver minor number */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 0d1f853092ab..dfa995b787e1 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -258,6 +258,9 @@ struct drm_file {
>  	/** @pid: Process that opened this file. */
>  	struct pid *pid;
>  
> +	/** @client_id: A unique id for fdinfo */
> +	u32 client_id;
> +
>  	/** @magic: Authentication magic, see @authenticated. */
>  	drm_magic_t magic;
>  
> @@ -437,6 +440,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
>  void drm_send_event_timestamp_locked(struct drm_device *dev,
>  				     struct drm_pending_event *e,
>  				     ktime_t timestamp);
> +void drm_fop_show_fdinfo(struct seq_file *m, struct file *f);
>  
>  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>  
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
