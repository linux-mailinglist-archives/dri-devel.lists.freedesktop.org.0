Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6327B5202FE
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F21810F40F;
	Mon,  9 May 2022 16:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BF610EFA4;
 Mon,  9 May 2022 16:56:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62A69B8180F;
 Mon,  9 May 2022 16:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCA4C385B1;
 Mon,  9 May 2022 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652115387;
 bh=NT/NSm+ixv4NTnm+bzYUbh8NWftsy0GkupiwFftUrCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EtvoF8IpfrUKSdvwW8V1qeHxhWfkW598IrjNsAqteSHaADCcEdw4x8KXDr3TbpGco
 +yggH/xodb4xZyPEnEeIc8mWLqDjS4iXNJXSCuBQpOQ/fSanq8ns6RptBh90cQlffa
 ZydWP2ygHERY2FiBF7EYP2PUX0oJed77PI+PtGtAug8JPiOmVIAJvSdJSVF0l2WgT3
 wW5f+Mu+92KTr/DOaR7Nqi5mZ7fd/NZ7bLFFprVwVSRAaFOoxIjPeDgJTM5EOXSyV1
 crJcVua2rcdRuwnbPejGtAvrTv7VAS/uq+3pJDH8Q5DUtKss9HWmbgKe7fxadeJAws
 EJ34J+Ehy52jg==
Date: Mon, 9 May 2022 18:56:20 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/2] module: update dependencies at
 try_module_get()
Message-ID: <20220509185620.05567716@coco.lan>
In-Reply-To: <YnRDIfthGJXdY23h@intel.intel>
References: <cover.1651348913.git.mchehab@kernel.org>
 <ad2a9fe66cf502e2e2e2325f1f04d0fae36aa82b.1651348913.git.mchehab@kernel.org>
 <YnRDIfthGJXdY23h@intel.intel>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Em Thu, 5 May 2022 23:35:29 +0200
Andi Shyti <andi.shyti@linux.intel.com> escreveu:

> Hi Mauro,
> 
> [...]
> 
> > +static int ref_module_dependency(struct module *mod, struct module *this)
> > +{
> > +	int ret;
> > +
> > +	if (!this || !this->name)
> > +		return -EINVAL;
> > +
> > +	if (mod == this)
> > +		return 0;
> > +
> > +	mutex_lock(&module_mutex);
> > +
> > +	ret = ref_module(this, mod);
> > +
> > +#ifdef CONFIG_MODULE_UNLOAD
> > +	if (ret)
> > +		goto ret;
> > +
> > +	ret = sysfs_create_link(mod->holders_dir,
> > +				&this->mkobj.kobj, this->name);
> > +#endif
> > +
> > +ret:
> > +	mutex_unlock(&module_mutex);
> > +	return ret;
> > +}
> > +
> >  /* Clear the unload stuff of the module. */
> >  static void module_unload_free(struct module *mod)
> >  {
> > @@ -841,24 +886,16 @@ void __module_get(struct module *module)
> >  }
> >  EXPORT_SYMBOL(__module_get);
> >  
> > -bool try_module_get(struct module *module)
> > +bool try_module_get_owner(struct module *module, struct module *this)
> >  {
> > -	bool ret = true;
> > +	int ret = __try_module_get(module);
> >  
> > -	if (module) {
> > -		preempt_disable();
> > -		/* Note: here, we can fail to get a reference */
> > -		if (likely(module_is_live(module) &&
> > -			   atomic_inc_not_zero(&module->refcnt) != 0))
> > -			trace_module_get(module, _RET_IP_);
> > -		else
> > -			ret = false;
> > +	if (ret)
> > +		ref_module_dependency(module, this);  
> 
> do we care about the return value here?

I don't think it should care about the return value, as a failure to
create a sysfs node for the holder or to add it to the holders list
is not fatal: modules can still continue working without that.

Also, I opted to be conservative here: currently, not creating these
doesn't cause try_module_get() to fail. I'm not sure what would be the
impact if this starts to fail.

So, right now, I'm opting to just ignore the return value. Perhaps
in the future this could a warning (similarly to what sysfs create
link does).

Regards,
Mauro

> 
> Andi
> 
> >  
> > -		preempt_enable();
> > -	}
> >  	return ret;
> >  }
> > -EXPORT_SYMBOL(try_module_get);
> > +EXPORT_SYMBOL(try_module_get_owner);
> >  
> >  void module_put(struct module *module)
> >  {
> > -- 
> > 2.35.1  



Thanks,
Mauro
