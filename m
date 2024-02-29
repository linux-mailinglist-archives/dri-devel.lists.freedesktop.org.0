Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278C86C7EB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0A110E489;
	Thu, 29 Feb 2024 11:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BhfnHngv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B725810E482
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:21:41 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51327cd65beso149071e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 03:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709205699; x=1709810499; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LFMt4Q4LhZoLiqGBr90yrOuPDsEwPF+TeoV9W3YSIpI=;
 b=BhfnHngvXGUyRX+HKC/4SloiEv7pcXqJXgS8hAQzO4muqj9J0ttk+JtNP/dk+Ywsul
 9Aq5M3IidPf+JjsWlk3BcrzaFxQ2HGTDXlw7vksdO+LyhfD/qV/LyUv7lCpG/OQuzVDl
 hCHhTRIzG1X60ektTylHLP3rJ2LBcnmXb9nQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709205699; x=1709810499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LFMt4Q4LhZoLiqGBr90yrOuPDsEwPF+TeoV9W3YSIpI=;
 b=q3x5Qimz3ysTpLXUbvnufu437TQ7f0UHE230oj0uWplizw2Vn+rZl8bL+PAMJBquik
 EXNqMWaYPbTKHO+Xk1meZRVef1yCLff0DoC54L3++kSNFXDEjIlLwMm9wzFunshZo3JZ
 FO3foCWGDpN1W7surLT25AL+/Jz9uxhdmj21vNH5KRtV+LK1xP58RztSi0TiJzwWzcoN
 nGulRD8Qpnk6hoi9nw3Mp3cdsawFrbBy4+W3ppxfpNkXq+dhB1HOntKeqaMRZO2a485m
 vZil3sTQPNRc2Uyk3IUtkVxybkIJ+ntUukVjVUgD3cBn7I7LHPJMiMa0idG25JocHHqM
 Uf/w==
X-Gm-Message-State: AOJu0YxqLRHCJg1IpPdoe77gv6dIWIlpfNUUrPV6BKbb0HG1il0m9dw/
 P0eGZa3Av9joL/skTIG4+gykAVq/jG2FWiaTpqaJ+AIldoQPpzSx8fVSk9Vxtug=
X-Google-Smtp-Source: AGHT+IFp2MYvSxEIY+WnHl+0HCmoinCtvXlSXMrHU0KVaYBd/NrslrYEAHevWfDYr97nuQmCw3DlCw==
X-Received: by 2002:a19:385b:0:b0:512:ed89:715a with SMTP id
 d27-20020a19385b000000b00512ed89715amr973823lfj.4.1709205699545; 
 Thu, 29 Feb 2024 03:21:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfca92000000b0033dcc0d1399sm1514281wrh.25.2024.02.29.03.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 03:21:39 -0800 (PST)
Date: Thu, 29 Feb 2024 12:21:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org, gpiccoli@igalia.com
Subject: Re: [PATCH v8 3/8] drm/panic: Add debugfs entry to test without
 triggering panic.
Message-ID: <ZeBowX0Rq-c7HGDh@phenom.ffwll.local>
References: <20240227100459.194478-1-jfalempe@redhat.com>
 <20240227100459.194478-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227100459.194478-4-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Tue, Feb 27, 2024 at 11:04:14AM +0100, Jocelyn Falempe wrote:
> Add a debugfs file, so you can test drm_panic without freezing
> your machine. This is unsafe, and should be enabled only for
> developer or tester.
> 
> to display the drm_panic screen, just run:
> echo 1 > /sys/kernel/debug/drm_panic/trigger
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig     |  9 +++++++
>  drivers/gpu/drm/drm_panic.c | 47 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c17d8a8f6877..8dcea29f595c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -125,6 +125,15 @@ config DRM_PANIC_BACKGROUND_COLOR
>  	depends on DRM_PANIC
>  	default 0x000000
>  
> +config DRM_PANIC_DEBUG
> +	bool "Add a debug fs entry to trigger drm_panic"
> +	depends on DRM_PANIC && DEBUG_FS
> +	help
> +	  Add drm_panic/trigger in the kernel debugfs, to force the panic
> +	  handler to write the panic message to the scanout buffer. This is
> +	  unsafe and should not be enabled on a production build.
> +	  If in doubt, say "N".
> +
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
>  	depends on STACKTRACE_SUPPORT
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index c9f386476ef9..c5d3f725c5f5 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -398,3 +398,50 @@ void drm_panic_unregister(struct drm_plane *plane)
>  }
>  EXPORT_SYMBOL(drm_panic_unregister);
>  
> +
> +/*
> + * DEBUG, This is currently unsafe.
> + * Also it will call all panic_notifier, since there is no way to filter and
> + * only call the drm_panic notifier.
> + */
> +#ifdef CONFIG_DRM_PANIC_DEBUG
> +#include <linux/debugfs.h>
> +
> +static struct dentry *debug_dir;
> +static struct dentry *debug_trigger;
> +
> +static ssize_t dbgfs_trigger_write(struct file *file, const char __user *user_buf,
> +				   size_t count, loff_t *ppos)
> +{
> +	bool run;
> +
> +	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run)
> +		atomic_notifier_call_chain(&panic_notifier_list, 0, "Test drm panic from debugfs");

Since this is just the general panic notifier it feels very misplaced in
the drm subsystem. I think moving that code into the core panic code makes
a lot more sense, then we'd also have all the right people on Cc: to
figure out how we can best recreate the correct calling context (like nmi
context or whatever) for best case simulation of panic code. John Ogness
definitely needs to see this and ack, wherever we put it.
-Sima

> +	return count;
> +}
> +
> +static const struct file_operations dbg_drm_panic_ops = {
> +	.owner = THIS_MODULE,
> +	.write = dbgfs_trigger_write,
> +};
> +
> +static int __init debugfs_start(void)
> +{
> +	debug_dir = debugfs_create_dir("drm_panic", NULL);
> +
> +	if (IS_ERR(debug_dir))
> +		return PTR_ERR(debug_dir);
> +	debug_trigger = debugfs_create_file("trigger", 0200, debug_dir,
> +					    NULL, &dbg_drm_panic_ops);
> +	return 0;
> +}
> +
> +static void __exit debugfs_end(void)
> +{
> +	debugfs_remove_recursive(debug_dir);
> +}
> +
> +module_init(debugfs_start);
> +module_exit(debugfs_end);
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
