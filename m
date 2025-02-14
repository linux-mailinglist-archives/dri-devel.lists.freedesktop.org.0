Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01011A3620B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E0110E49E;
	Fri, 14 Feb 2025 15:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7V2VkwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4549E10E49E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:44:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso6424315e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739547859; x=1740152659; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j+d3zRv5P3gfitT19aXZo9yCUhUwKlCUptW0UeMXsxs=;
 b=B7V2VkwF9awffcMoEbQWloAvpT6uAZpVSXpT/8vCF6c1eW6L1VN7hCO0WitJypmlXb
 HAwW2RRYo08QXnHzhnz6Yil4GsYjlsd8RZPKU6m0rI43QMcCmdIv/Aks7ELj4o/52ZU4
 ZD3ggACYsurYQjF1QqtPrzHpgEd4nxT36amXi/YRi+CDx7VogKalzttN/x9tzDXSVuHr
 uJouK5HcCqFUuxCU99YPmkHjUSHflQQ6mhJPTklq4tUg07lyFfKtGmosHgr62eK38aY5
 CZu0g4I8D27ELkZIBdOBEeP8IU8XAZKqA9tMDEI32DqAdnRQxN3JWQgnFsojQzJ2QHfb
 A8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739547859; x=1740152659;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j+d3zRv5P3gfitT19aXZo9yCUhUwKlCUptW0UeMXsxs=;
 b=iATgAwQ0buKLq/+Ce0xYTRHbLSWefrdaU+CylZttePIClIIAgK9lqZtMb0nFji7sRH
 9GqtStWRHY5e7K5sxo5kWFS2uXdb+xN9Vq393cJDLADcHYoSgdWMHSch1YidgDdpOLsX
 OHOl3x+MbzmjGf6nIHTyjNkd0SekROuNp6wd7Y0YPc21QUTS/hBEGgD3VYJY20uTEref
 gUptu7BTXUHs6XXb8kTX6cR583gYqcqgw8WEvJSu2xLJzDmFBWB+PfnJUz8xAM8EuivH
 8xKp5U6DvdNEI0qkTmb45KH5NtdZ6UJtStUbvHdpbJk4/98/YD7wd9qboTOZiDQDzMMT
 NFtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcmq3jjkOxRGIDGABc6b/tGcn6+Zx8y+hI1lZ5GHKDqjiheXS3t9Hnyuv+x+2R07BQVuHkfKIrzMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3UxGd3VzVxTTKpP3Ik1TOUWL6R00PkHP4EBDVXX8FSy7t0hbG
 xbQuQEd6kw+hOypIPutcWWqbjyWYpe6MuDfO1HOryWv63nifHbJQ
X-Gm-Gg: ASbGncs/BIX5pigGM+3uJtlOxLB9eBuaQmMDOJCcJ9Q3+X1md2b09zo8U6u28XdEUdM
 uLrCXpfY3biVyEKEDHS2Y7fK9Q+rOohOzI2dQFeGtf6bkvtwlSVfPMrGqqYqOBfBEMESknp8fSE
 M0cmF3kH35KLaI2vKEp8oe6pIx1gcEqht+Z0urhp7AyaRps25IqbAfq7gA0Q+tVP/WFITAJFMXb
 FfS5GV2jINVH9GBffTVS2mFd9PkxZPRblpN77DUziIvFYaGiC5adKCltMPJEMwBDMJWLJRRzbRU
 A6YOlZ+445IZLsE=
X-Google-Smtp-Source: AGHT+IEPDbRl8m66IACo1TTA+yK/jZSJ/d+D7h5IGK7nYLNMQUiXFMMLindZv6/sZrNAAZ37oy1A1w==
X-Received: by 2002:a05:600c:3b1d:b0:439:6d7c:48fd with SMTP id
 5b1f17b1804b1-4396d7c5247mr10913135e9.4.1739547858283; 
 Fri, 14 Feb 2025 07:44:18 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dab74sm4993013f8f.32.2025.02.14.07.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:44:17 -0800 (PST)
Date: Fri, 14 Feb 2025 16:44:16 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, sylphrenadin@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Fix use after free and double free on init error
Message-ID: <Z69k0MLER7CYN5fx@fedora>
References: <20250212084912.3196-1-jose.exposito89@gmail.com>
 <bfc71d72-2f23-4c8c-b278-7e9aad3bf72d@suse.de>
 <3af06a6e-adb9-4e72-ab4d-23dbf37258b4@bootlin.com>
 <Z64LmAJlf-B6wQkL@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z64LmAJlf-B6wQkL@louis-chauvet-laptop>
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

On Thu, Feb 13, 2025 at 04:11:20PM +0100, Louis Chauvet wrote:
> On 12/02/25 - 15:06, Louis Chauvet wrote:
> > 
> > 
> > Le 12/02/2025 à 09:53, Thomas Zimmermann a écrit :
> > > 
> > > 
> > > Am 12.02.25 um 09:49 schrieb José Expósito:
> > > > If the driver initialization fails, the vkms_exit() function might
> > > > access an uninitialized or freed default_config pointer and it might
> > > > double free it.
> > > > 
> > > > Fix both possible errors by initializing default_config only when the
> > > > driver initialization succeeded.
> > > > 
> > > > Reported-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > Link: https://lore.kernel.org/all/Z5uDHcCmAwiTsGte@louis-chauvet-laptop/
> > > > Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
> > > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > 
> > > Reviewed-by: Thomas Zimmermann <tzimmremann@suse.de>
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > lore.kernel.org is broken currently, to avoid doing mistakes, I will wait
> > for it to be working again so I can apply your patch using dim+b4.
> > 
> > (I removed danvet.vetter@ffwl.ch from CC, the mail server rejected the mail)
> > 
> > Thanks!
> > Louis Chauvet
> 
> Hello,
> 
> I tried to apply the commit, but I have a strange issue:
> 
> 	$ dim push
> 	Enumerating objects: 13, done.
> 	Counting objects: 100% (13/13), done.
> 	Delta compression using up to 20 threads
> 	Compressing objects: 100% (7/7), done.
> 	Writing objects: 100% (7/7), 1.67 KiB | 113.00 KiB/s, done.
> 	Total 7 (delta 6), reused 0 (delta 0), pack-reused 0 (from 0)
> 	remote:
> 	remote: ========================================================================
> 	remote:
> 	remote:    Equinix is shutting down its operations with us on April 30, 2025.
> 	remote:    They have graciously supported us for almost 5 years, but all good
> 	remote:    things come to an end. Given the time frame, it's going to be hard
> 	remote:       to make a smooth transition of the cluster to somewhere else
> 	remote: ([TBD](https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/2011)).
> 	remote:     Please expect in the next months some hiccups in the service and
> 	remote:    probably at least a full week of downtime to transfer gitlab to a
> 	remote:                different place. All help is appreciated.
> 	remote:
> 	remote: ========================================================================
> 	remote:
> 	To gitlab.freedesktop.org:drm/misc/kernel.git
> 	   ff3881cc6a58..ed15511a773d  drm-misc-next -> drm-misc-next
> 	Pushing drm-misc-fixes to for-linux-next-fixes... Everything up-to-date
> 	Done.
> 	Out of merge window. Pushing drm-misc-next to for-linux-next... 
> 	remote:
> 	remote: ========================================================================
> 	remote:
> 	remote: ERROR: Internal API unreachable
> 	
> 	remote:
> 	remote: ========================================================================
> 	remote:
> 	fatal: Could not read from remote repository.
> 	
> 	Please make sure you have the correct access rights
> 	and the repository exists.
> 
> Is this expected?

I guess you managed to fix the issue. I git pull-ed this morning and
the patch was applied.

Jose
 
> Thanks,
> Louis Chauvet
> 
> > > Thanks for posting this patch separately.
> > > 
> > > Best regards
> > > Thomas
> > > 
> > > > ---
> > > >    drivers/gpu/drm/vkms/vkms_drv.c | 15 +++++++++------
> > > >    1 file changed, 9 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > index 7c142bfc3bd9..b6de91134a22 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > @@ -235,17 +235,19 @@ static int __init vkms_init(void)
> > > >    	if (!config)
> > > >    		return -ENOMEM;
> > > > -	default_config = config;
> > > > -
> > > >    	config->cursor = enable_cursor;
> > > >    	config->writeback = enable_writeback;
> > > >    	config->overlay = enable_overlay;
> > > >    	ret = vkms_create(config);
> > > > -	if (ret)
> > > > +	if (ret) {
> > > >    		kfree(config);
> > > > +		return ret;
> > > > +	}
> > > > -	return ret;
> > > > +	default_config = config;
> > > > +
> > > > +	return 0;
> > > >    }
> > > >    static void vkms_destroy(struct vkms_config *config)
> > > > @@ -269,9 +271,10 @@ static void vkms_destroy(struct vkms_config *config)
> > > >    static void __exit vkms_exit(void)
> > > >    {
> > > > -	if (default_config->dev)
> > > > -		vkms_destroy(default_config);
> > > > +	if (!default_config)
> > > > +		return;
> > > > +	vkms_destroy(default_config);
> > > >    	kfree(default_config);
> > > >    }
> > > 
> > 
> > -- 
> > Louis Chauvet, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > 
