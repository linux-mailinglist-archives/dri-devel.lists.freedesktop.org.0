Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA051CB46
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3810F9BF;
	Thu,  5 May 2022 21:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C484B10F9BF;
 Thu,  5 May 2022 21:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786537; x=1683322537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bGKPoFs3oKrceGUWOKyLUpHxG8GVrtEbDeiLw6i4OsE=;
 b=Ogx1RR/KSM4Sx7QKQbIjMF55RcazwZ9gfe4YwtB6yW/UkAOSmWCfG0/X
 7OhWp5Kj1IZBOGNAdWvrye9IZuB3YPGeygCMKrI6s072gkzQjIDeyhNBV
 bCurPXekYJ36EjjWRcRLrliiBM4JujAPSRbiiCaVlGT5MPecRxETCYI8V
 j8sqJyl3D3JdJ8kW79OhEZ0UlkHV6hito/40dWRH8oemCRbYkI12UrDcp
 nku8q3XKvr3XhStGDA5rEz+TrUgXUKR4We2Mf6cXrC28kfzx7WZHUajJQ
 Gj4gwGJexSEetHKe8qd6DGB6EzyGiqhiHdqLdWcv+wlSQXzq67AnqJlYC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="255736560"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="255736560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:35:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="735163599"
Received: from blaesing-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.218.207])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:35:32 -0700
Date: Thu, 5 May 2022 23:35:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v5 1/2] module: update dependencies at
 try_module_get()
Message-ID: <YnRDIfthGJXdY23h@intel.intel>
References: <cover.1651348913.git.mchehab@kernel.org>
 <ad2a9fe66cf502e2e2e2325f1f04d0fae36aa82b.1651348913.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2a9fe66cf502e2e2e2325f1f04d0fae36aa82b.1651348913.git.mchehab@kernel.org>
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
Cc: mauro.chehab@linux.intel.com, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

[...]

> +static int ref_module_dependency(struct module *mod, struct module *this)
> +{
> +	int ret;
> +
> +	if (!this || !this->name)
> +		return -EINVAL;
> +
> +	if (mod == this)
> +		return 0;
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
> +#endif
> +
> +ret:
> +	mutex_unlock(&module_mutex);
> +	return ret;
> +}
> +
>  /* Clear the unload stuff of the module. */
>  static void module_unload_free(struct module *mod)
>  {
> @@ -841,24 +886,16 @@ void __module_get(struct module *module)
>  }
>  EXPORT_SYMBOL(__module_get);
>  
> -bool try_module_get(struct module *module)
> +bool try_module_get_owner(struct module *module, struct module *this)
>  {
> -	bool ret = true;
> +	int ret = __try_module_get(module);
>  
> -	if (module) {
> -		preempt_disable();
> -		/* Note: here, we can fail to get a reference */
> -		if (likely(module_is_live(module) &&
> -			   atomic_inc_not_zero(&module->refcnt) != 0))
> -			trace_module_get(module, _RET_IP_);
> -		else
> -			ret = false;
> +	if (ret)
> +		ref_module_dependency(module, this);

do we care about the return value here?

Andi

>  
> -		preempt_enable();
> -	}
>  	return ret;
>  }
> -EXPORT_SYMBOL(try_module_get);
> +EXPORT_SYMBOL(try_module_get_owner);
>  
>  void module_put(struct module *module)
>  {
> -- 
> 2.35.1
