Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34518514376
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 09:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CDB10FAE7;
	Fri, 29 Apr 2022 07:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E7F10FAE7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 07:54:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d5so9661420wrb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=m3+VWI4CFopJUrW0W/J3jbhF0AMueeAVUj1oVXfQZW4=;
 b=VvC9PUR/NSQ5SiqLBxcYHp2n5sEVkcB1hOTRiJAgpvc+JKWkhDbUIzZNNl8RJibkZV
 /g1PVHR/EFVZlUukYcYazjIxauAp5+9oA1eZAkV+Wh1T8TrZTfoRjZsMJBjaJbwiDJ58
 D92D+gCOXFepnW+TC8Qgz0XnLd5Si1ncBuwVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=m3+VWI4CFopJUrW0W/J3jbhF0AMueeAVUj1oVXfQZW4=;
 b=SDK5j5WTEjPkb3+h5pBIuaVfcSKsYB5Pub35IbNIvygGox3DPcDDtthUcREJ39qJbv
 ZjQ8/6zutTUU6Qv1AklFxAyzAbvm2lZR5u/gU5wffl9rESP8INq6JwEkjaaJVV6jLs76
 omQc3KBZJHwEAUAhL8RmnV3PzWcLGHVF74c2p6B6XiXGz1RC+g+zxokUlMVVuA5GnrLK
 UfH/H5xqBpU71NLT0JBev0OqOxD9oOmJgB4bvd9gceJISfhQxDz7fILsYwlHRR3qEMHD
 UeTRipYVF020RxhPi0th8Lj5N1r/UctbsBHp7KH5gZ64Dh2aqpG/kwC1O08+o+oDF2X9
 eKKg==
X-Gm-Message-State: AOAM533Q9fUnGFSZqfeQkJ374J7dR42FYoEquZqJCeteAI47243Bnmrp
 p90xGpwYsiTd9hcnOZXPIjLfBA==
X-Google-Smtp-Source: ABdhPJzALWE3X8Qp/b8LblTfj7IKWnFrmVWN4YU90qP7Bd5sPq3nkT1cduO0/x5y7t876IyYGeVW8A==
X-Received: by 2002:a05:6000:1ac9:b0:20a:f6a1:811c with SMTP id
 i9-20020a0560001ac900b0020af6a1811cmr6005839wry.100.1651218853362; 
 Fri, 29 Apr 2022 00:54:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c66-20020a1c3545000000b00393fc022e03sm1952641wma.12.2022.04.29.00.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 00:54:12 -0700 (PDT)
Date: Fri, 29 Apr 2022 09:54:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] module: add a function to add module references
Message-ID: <YmuZovuDaCYDDG4c@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, mauro.chehab@intel.com,
 Kai Vehmanen <kai.vehmanen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Dan Williams <dan.j.williams@intel.com>
References: <cover.1651212016.git.mchehab@kernel.org>
 <a078eb2e46d00ec59c8a91ea0afa5190730c9e58.1651212016.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a078eb2e46d00ec59c8a91ea0afa5190730c9e58.1651212016.git.mchehab@kernel.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Kai Vehmanen <kai.vehmanen@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Luis Chamberlain <mcgrof@kernel.org>, mauro.chehab@intel.com,
 Dan Williams <dan.j.williams@intel.com>, linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 07:31:15AM +0100, Mauro Carvalho Chehab wrote:
> Sometimes, device drivers are bound using indirect references,
> which is not visible when looking at /proc/modules or lsmod.
> 
> Add a function to allow setting up module references for such
> cases.
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

This sounds like duct tape at the wrong level. We should have a
device_link connecting these devices, and maybe device_link internally
needs to make sure the respective driver modules stay around for long
enough too. But open-coding this all over the place into every driver that
has some kind of cross-driver dependency sounds terrible.

Or maybe the bug is that the snd driver keeps accessing the hw/component
side when that is just plain gone. Iirc there's still fundamental issues
there on the sound side of things, which have been attempted to paper over
by timeouts and stuff like that in the past instead of enforcing a hard
link between the snd and i915 side.

Adding Greg for device model questions like this.
-Daniel

> ---
> 
> See [PATCH 0/2] at: https://lore.kernel.org/all/cover.1651212016.git.mchehab@kernel.org/
> 
>  include/linux/module.h |  7 +++++++
>  kernel/module/main.c   | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 46d4d5f2516e..be74f807e41d 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -596,6 +596,8 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
>  /* Search for module by name: must be in a RCU-sched critical section. */
>  struct module *find_module(const char *name);
>  
> +int module_add_named_dependency(const char *name, struct module *this);
> +
>  /* Returns 0 and fills in value, defined and namebuf, or -ERANGE if
>     symnum out of range. */
>  int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
> @@ -772,6 +774,11 @@ static inline int lookup_module_symbol_attrs(unsigned long addr, unsigned long *
>  	return -ERANGE;
>  }
>  
> +static inline int module_add_named_dependency(const char *name, struct module *this)
> +{
> +	return 0;
> +}
> +
>  static inline int module_get_kallsym(unsigned int symnum, unsigned long *value,
>  					char *type, char *name,
>  					char *module_name, int *exported)
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 05a42d8fcd7a..dbd577ccc38c 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -631,6 +631,37 @@ static int ref_module(struct module *a, struct module *b)
>  	return 0;
>  }
>  
> +int module_add_named_dependency(const char *name, struct module *this)
> +{
> +	struct module *mod;
> +	int ret;
> +
> +	if (!name || !this || !this->name) {
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&module_mutex);
> +	mod = find_module(name);
> +	if (!mod) {
> +		ret = -EINVAL;
> +		goto ret;
> +	}
> +
> +	ret = ref_module(this, mod);
> +	if (ret)
> +		goto ret;
> +
> +#ifdef CONFIG_MODULE_UNLOAD
> +	ret = sysfs_create_link(mod->holders_dir,
> +				&this->mkobj.kobj, this->name);
> +#endif
> +
> +ret:
> +	mutex_unlock(&module_mutex);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(module_add_named_dependency);
> +
>  /* Clear the unload stuff of the module. */
>  static void module_unload_free(struct module *mod)
>  {
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
