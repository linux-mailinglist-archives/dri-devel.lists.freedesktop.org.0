Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E362515CA1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 14:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752F210E05C;
	Sat, 30 Apr 2022 12:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF6110E02E;
 Sat, 30 Apr 2022 12:05:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D1A160AE6;
 Sat, 30 Apr 2022 12:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9E4C385AA;
 Sat, 30 Apr 2022 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651320303;
 bh=tWlItz5i5kXdXuKnvQvNpU5f7HV/eMhhZ4OfG79KfB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EWPWQ/+A8KiWNeEnnCkAKXMPSezGdtzp5Pu/mRwQ/MU866OQbmFsojF7i409gTuJu
 COUJKad1RdoM48RcXRCz1/y234ep+r8F5hVv3U8qnSyXd89g/SqzfONVpSS2CCu9eN
 CMKtf9Kko8TmVqrBl0bJ24rI3PoZ2XY2ikw7YirU=
Date: Sat, 30 Apr 2022 14:04:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/2] module: update dependencies at try_module_get()
Message-ID: <Ym0l6yeTWCCAeww8@kroah.com>
References: <cover.1651314499.git.mchehab@kernel.org>
 <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 30, 2022 at 11:30:58AM +0100, Mauro Carvalho Chehab wrote:
> Sometimes, device drivers are bound into each other via try_module_get(),
> making such references invisible when looking at /proc/modules or lsmod.
> 
> Add a function to allow setting up module references for such
> cases, and call it when try_module_get() is used.
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1651314499.git.mchehab@kernel.org/
> 
>  include/linux/module.h |  4 +++-
>  kernel/module/main.c   | 35 +++++++++++++++++++++++++++++++++--
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 46d4d5f2516e..836851baaad4 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -620,7 +620,9 @@ extern void __module_get(struct module *module);
>  
>  /* This is the Right Way to get a module: if it fails, it's being removed,
>   * so pretend it's not there. */
> -extern bool try_module_get(struct module *module);
> +extern bool __try_module_get(struct module *module, struct module *this);
> +
> +#define try_module_get(mod) __try_module_get(mod, THIS_MODULE)
>  
>  extern void module_put(struct module *module);
>  
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 05a42d8fcd7a..9f4416381e65 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -631,6 +631,35 @@ static int ref_module(struct module *a, struct module *b)
>  	return 0;
>  }
>  
> +static int ref_module_dependency(struct module *mod,
> +				       struct module *this)

This can be on one line, right?

> +{
> +	int ret;
> +
> +	if (!this || !this->name) {
> +		return -EINVAL;
> +	}

Did you run checkpatch on this?  Please do :)

> +
> +	if (mod == this)
> +		return 0;

How can this happen?

When people mistakenly call try_module_get(THIS_MODULE)?  We should
throw up a big warning when that happens anyway as that's always wrong.

But that's a different issue from this change, sorry for the noise.

> +
> +	mutex_lock(&module_mutex);
> +
> +	ret = ref_module(this, mod);
> +
> +#ifdef CONFIG_MODULE_UNLOAD
> +	if (ret)
> +		goto ret;
> +
> +	ret = sysfs_create_link(mod->holders_dir,
> +				&this->mkobj.kobj, this->name);

Meta comment, why do we only create links if we can unload things?

thanks,

greg k-h
