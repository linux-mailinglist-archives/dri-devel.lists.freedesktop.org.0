Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136C515DB3
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 15:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49F710E144;
	Sat, 30 Apr 2022 13:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D3D10E144;
 Sat, 30 Apr 2022 13:38:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9088260B43;
 Sat, 30 Apr 2022 13:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA220C385AA;
 Sat, 30 Apr 2022 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651325904;
 bh=FzJFz5nQnOEB7AB6Bbc1j8nS92uMjFglrLsFGFrMKzw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jlSMgCulySK0sR8W6lTjvw+WKsHy9h2dvPSn/5YMc2Ov1/C/vSQeLPrh3/hxq3C2S
 3IgkIw0WSNTct9hBvrXmgMyELaYee9X3mtIvkZ2yTAPC2v3ej3vzF8gFH8UU44MXbw
 KAqWgwhvW5Kb+28/T9aQZOdeMKDQxhCoyaDM5Rc4HmIJ7hWl19h6P1Gfv/gEy6VuWa
 AFwi7dJptexzaE2VQYSiaVEgvKpTyAV4wyKOTlFHh6sphvpGPBihxxB6k6TaJew2RL
 kkHhZDiMzx49PBfmL29bVUZATY3SHGlyUfdYempi/ByrrXPMeyQ9uc+WWBkNDMAlQp
 uxkJBLqr/FN2w==
Date: Sat, 30 Apr 2022 14:38:14 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] module: update dependencies at try_module_get()
Message-ID: <20220430143814.7184bd93@sal.lan>
In-Reply-To: <Ym0l6yeTWCCAeww8@kroah.com>
References: <cover.1651314499.git.mchehab@kernel.org>
 <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
 <Ym0l6yeTWCCAeww8@kroah.com>
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

Em Sat, 30 Apr 2022 14:04:59 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Sat, Apr 30, 2022 at 11:30:58AM +0100, Mauro Carvalho Chehab wrote:

> Did you run checkpatch on this?  Please do :)
> 
> > +
> > +	if (mod == this)
> > +		return 0;  
> 
> How can this happen?
> When people mistakenly call try_module_get(THIS_MODULE)?  

Yes. There are lots of place where this is happening:

	$ git grep try_module_get\(THIS_MODULE|wc -l
	82

> We should
> throw up a big warning when that happens anyway as that's always wrong.
> 
> But that's a different issue from this change, sorry for the noise.

It sounds very weird to use try_module_get(THIS_MODULE).

We could add a WARN_ON() there - or something similar - but I would do it 
on a separate patch.

> 
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
> 
> Meta comment, why do we only create links if we can unload things?

Good question. I don't know for certain. This is the already existing 
pattern at add_usage_links() - see kernel/module/sysfs.c.

Also, lsmod uses sysfs links when showing dependencies.

Regards,
Mauro

