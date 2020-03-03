Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97B17713C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94816EA0E;
	Tue,  3 Mar 2020 08:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0676EA0E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:27:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m3so1877570wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=envAw8gA0RKTACMDEm2KbCUli5Pbd52qjambhk/W3oU=;
 b=PGV3dqbyiAEHWNcWW61Gm89zaeE6HqwphIxclYN26/ubHBrR/2WNRIZWxH47fHfodj
 ruzBVFTqVcQ/wb0B+h5PSdwttFrApcqJF+VI7NjA7nkrTSM3qZwzDQiZ14EsFgMqUFIM
 MJ7Mmnqp2n71+0O/EbqfeuFquv6fEz58a5Vjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=envAw8gA0RKTACMDEm2KbCUli5Pbd52qjambhk/W3oU=;
 b=C5Esix89HTiTNm8ZuOLs9wyFwArUsIjEHLnowG9rv7F0VcalUraSenqffrbd7vrPM5
 vG8G+I5zwVdL6VEttO+Ne7r4D8tMg0JvrE8p2KSOQ7937ulHxJ5pPOatG0LH6hJQ4tOx
 rSMdSBq4yDZjGlCAdtSqiPi2UOferLWzMTdId3ggtUtliGYiiWbT/HaWK0sTwmDskCC4
 YCqxjlVDwShJQ91bj1upLzA/IVGov1qAiziLF7YWh7YQAcf1sVge1vjmkvg0jCy5n4JD
 QxThrmgW6FEpDjgDj76qP1h/CcIL6eipMin/jpS7Xcq7doRPnWTrh5xu9gfl3O1dC7aA
 ZJ9Q==
X-Gm-Message-State: ANhLgQ1dUiZtgIWVypxk1awwFm73e8CQOfBNq6pIkCfakzU52VRcfNv7
 m1XVd2SoyjRLc4Vmetjsy/rXeQ==
X-Google-Smtp-Source: ADFU+vv7jQX7S+E+km6TFyF76Gbv8kOh0SVJ6E0GZadYOoWm3Fweewas3pR8oHG8XMV4wQklwawbFA==
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr3040178wmf.63.1583224049100; 
 Tue, 03 Mar 2020 00:27:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o16sm17607147wrj.5.2020.03.03.00.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 00:27:28 -0800 (PST)
Date: Tue, 3 Mar 2020 09:27:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Message-ID: <20200303082726.GL2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-10-daniel.vetter@ffwll.ch>
 <20200303074934.vlqxiye7lydnoykd@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303074934.vlqxiye7lydnoykd@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 08:49:34AM +0100, Gerd Hoffmann wrote:
> > @@ -575,9 +574,12 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
> >  
> >  	dev = &cirrus->dev;
> >  	ret = drm_dev_init(dev, &cirrus_driver, &pdev->dev);
> > -	if (ret)
> > -		goto err_free_cirrus;
> > +	if (ret) {
> > +		kfree(cirrus);
> > +		goto err_pci_release;
> > +	}
> >  	dev->dev_private = cirrus;
> > +	drmm_add_final_kfree(dev, cirrus);
> 
> That doesn't look like an error path improvement.
> With patch #30 applied it'll looks alot better though.
> So maybe squash the patches?

Breaks the patch set evolution, there's a _lot_ of dependencies in here to
make sure we never break anything interim. But yeah that's why I created
this entire series, since with just the first part it's really not any
better. I also have a pile more ideas on top, so hopefully once this lands
I can get around to them and make everything even better :-)

Cheers, Daniel

> 
> In any case:
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> cheers,
>   Gerd
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
