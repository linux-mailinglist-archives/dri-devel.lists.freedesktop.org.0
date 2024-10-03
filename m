Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52698EE4B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0AC10E811;
	Thu,  3 Oct 2024 11:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="MDerJOB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3A010E811
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727955512; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kneEU5WkWJ7M8qSDSiSyfuvvlEnk6I5+NeOQJbbZSIjzYtYBFepORoBKMbBpB8Oa5p0oOYcbpHRCt+ZYbQkBiAT9pfdigv6DewuPdZMIyvR8DDuzAdLkp/Log7ZLSfBs/kdh1JccfDV2XujAsMuTkywTED3BJsgfiz9b7qPIGyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727955512;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=80oOBJ90RZjsAjivwL50rHDRZPA468mLSAz/lMSF0Rs=; 
 b=CO/vbSd5YvHie9iMRknSfx3+LYYMPmOqR8kvT3FbKZcQU5EAUXXvcWdedfLgvdw/U3eQT0wquD3Q/4gP9qA6KjnVfgK8huRi/B10OAC1okNdAlbTsUt3IvDKDMSHZ81E1eYQVxEDkxhl1Gc8V0RArUP+k8aVguuJCuLlwTpjXWg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727955512; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=80oOBJ90RZjsAjivwL50rHDRZPA468mLSAz/lMSF0Rs=;
 b=MDerJOB7jlGsqYe7k5TAPFCf1QdTLjWWYp1Zzc/T3rJWM4O5eyKT2GLg1QwxLGJr
 9o6rG/Wkrk8wo+HB1gjRyiKnwfg+aTz8gfrKQM6KW+gJQaTIk1xIJPR5SxB/cSJJkhP
 JDYfEjxROI/2DnSpPp3o/ZcN8Gzpmpm5uUM1hqdA=
Received: by mx.zohomail.com with SMTPS id 1727955510313671.7731952775321;
 Thu, 3 Oct 2024 04:38:30 -0700 (PDT)
Date: Thu, 3 Oct 2024 12:38:26 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Add missing OPP table refcnt decremental
Message-ID: <e33rx3l52arkfgno64l5dctibo647kx3cpjlwcm3lil6cvszrt@abhg2mbu7ec4>
References: <20241003002603.3177741-1-adrian.larumbe@collabora.com>
 <20241003091740.4e610f21@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241003091740.4e610f21@collabora.com>
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

On 03.10.2024 09:17, Boris Brezillon wrote:
> On Thu,  3 Oct 2024 01:25:37 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > Commit f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> > retrieves the OPP for the maximum device clock frequency, but forgets to
> > keep the reference count balanced by putting the returned OPP object. This
> > eventually leads to an OPP core warning when removing the device.
> > 
> > Fix it by putting OPP objects as many times as they're retrieved.
> > Also remove an unnecessary whitespace.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> 
> Reviewed-by: 
> 
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > index 2d30da38c2c3..c7d3f980f1e5 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > @@ -38,7 +38,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
> >  		return PTR_ERR(opp);
> >  	dev_pm_opp_put(opp);
> >  
> > -	err =  dev_pm_opp_set_rate(dev, *freq);
> > +	err = dev_pm_opp_set_rate(dev, *freq);
> >  	if (!err)
> >  		ptdev->pfdevfreq.current_frequency = *freq;
> >  
> > @@ -177,6 +177,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
> >  	 */
> >  	pfdevfreq->current_frequency = cur_freq;
> >  
> > +	dev_pm_opp_put(opp);
> > +
> 
> Shouldn't this be moved after the dev_pm_opp_set_opp() that's
> following?

Yes, right now it's in the wrong place, thanks for catching this.

> >  	/*
> >  	 * Set the recommend OPP this will enable and configure the regulator
> >  	 * if any and will avoid a switch off by regulator_late_cleanup()


Adrian Larumbe
