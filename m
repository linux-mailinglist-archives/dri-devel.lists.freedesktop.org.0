Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AB956CA4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EA610E279;
	Mon, 19 Aug 2024 14:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="W/ESqR5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688FD10E279
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:05:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4280921baa2so6192425e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724076299; x=1724681099; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kv8f3RW+HxR8QlyhVkKrJm8gEX4NAM4TUJHTPKGIWgs=;
 b=W/ESqR5GzwBZuhmoX7hqvs0d6ShVPU+BXr1Bw3KAb9CcO8YkCOYlf4vN7X9dj8Azts
 NfY6ZMQaaXmdoGGBTrNNBHdOCgGzoHgbaAT60l2uxK89GPuaegr8Ony3KtsJhUQyqlBq
 pbfCFzlzluhxYHUnxF8NYv2lT2WiikEBVHE/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724076299; x=1724681099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kv8f3RW+HxR8QlyhVkKrJm8gEX4NAM4TUJHTPKGIWgs=;
 b=ThT0nbXAvKvWIhB8XpEOad7gTFEmrD1hkDGHZrmFJ2ItIhTpyWc32O3bXKGRmifDkr
 w2yCsRhvJFOrnugpDbOA31LC34WDf5DSQxexC/opEvmos9Pgu0qWZLD0cxuI9DO8EKJW
 lYNzxnaUkHPKtD6FZ7YpRZLrzpp9NTf11nPeD9298CeCR7lDR+KJfnKmzgYj2M5vvVsa
 /MyKJ0TjcKmE356VlbGbFrlyaH83CiRuf1B2IYebtmxVXpfeAsL2RtYUMlDKoshWTdVo
 QMkAga79W9H87pdqrajTwLieaaoZ3WiPMcY6rw1M1DUCuCRz4h3zzzrK2Eeu2e8HeKDJ
 g3oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYDixinBrxSAEwxVaNSSzrHzJfuHinenlJQbSbsEqwgWh9Ckj/z9lDZDujFgfwCT15a031ipiY0eO70Xt1LQX/q47abjmUxBHYzYRLhNtH
X-Gm-Message-State: AOJu0YyMOK82SvuU32l/K4jsUMHqY0rcwIshP/UNiQGYJBoftCUVRcJM
 MMMIhSEthe21KOSVs83ZZrxhNRJcB92ISUlamgD16401c+z4Sd5f0/PKaniVAGI=
X-Google-Smtp-Source: AGHT+IGw/0hMq569bvokR3Jo70vpCZ5IBiig8/jXidpcQwuZRdzJmMrwc1wHy7C87dxmBZkR/BzJKA==
X-Received: by 2002:a05:600c:3b27:b0:426:6cd1:d116 with SMTP id
 5b1f17b1804b1-429ed7e4dd7mr46828465e9.3.1724076298496; 
 Mon, 19 Aug 2024 07:04:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed794635sm109688395e9.42.2024.08.19.07.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 07:04:58 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:04:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/11] drm/sti/sti_hdmi: convert to struct drm_edid
Message-ID: <ZsNRB5fYKTYbTg2f@phenom.ffwll.local>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <dd1c232cb85d5e0815af73c918953fa3b852baa2.1715691257.git.jani.nikula@intel.com>
 <Znk6y4_attY361en@phenom.ffwll.local> <87jzgix7wd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzgix7wd.fsf@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 15, 2024 at 03:55:30PM +0300, Jani Nikula wrote:
> On Mon, 24 Jun 2024, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, May 14, 2024 at 03:55:08PM +0300, Jani Nikula wrote:
> >> Prefer the struct drm_edid based functions for reading the EDID and
> >> updating the connector.
> >> 
> >> The functional change is that the CEC physical address gets invalidated
> >> when the EDID could not be read.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> 
> >> ---
> >> 
> >> Cc: Alain Volmat <alain.volmat@foss.st.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/sti/sti_hdmi.c | 24 ++++++++++++++----------
> >>  1 file changed, 14 insertions(+), 10 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> >> index 500936d5743c..3b62ec2d742f 100644
> >> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> >> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> >> @@ -974,28 +974,32 @@ static const struct drm_bridge_funcs sti_hdmi_bridge_funcs = {
> >>  
> >>  static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
> >>  {
> >> +	const struct drm_display_info *info = &connector->display_info;
> >>  	struct sti_hdmi_connector *hdmi_connector
> >>  		= to_sti_hdmi_connector(connector);
> >>  	struct sti_hdmi *hdmi = hdmi_connector->hdmi;
> >> -	struct edid *edid;
> >> +	const struct drm_edid *drm_edid;
> >>  	int count;
> >>  
> >>  	DRM_DEBUG_DRIVER("\n");
> >>  
> >> -	edid = drm_get_edid(connector, hdmi->ddc_adapt);
> >> -	if (!edid)
> >> -		goto fail;
> >> +	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc_adapt);
> >
> > I think you can use drm_edid_read here since the ddc is correctly set up
> > with drm_connector_init_with_ddc()
> >
> >> +
> >> +	drm_edid_connector_update(connector, drm_edid);
> >>  
> >> -	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
> >> +	cec_notifier_set_phys_addr(hdmi->notifier,
> >> +				   connector->display_info.source_physical_address);
> >> +
> >> +	if (!drm_edid)
> >> +		goto fail;
> >
> > Unless I missed something, all the functions can cope with a NULL edid,
> > but this jump means in the failure case you'll return stack garbage in
> > count. Just drop this check?
> 
> Reviving an old thread... the goto fail path returns 0, not count.

Oops, I stand corrected. With just drm_edid_read used:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> BR,
> Jani.
> 
> 
> >
> >>  
> >> -	count = drm_add_edid_modes(connector, edid);
> >> -	drm_connector_update_edid_property(connector, edid);
> >> +	count = drm_edid_connector_add_modes(connector);
> >>  
> >>  	DRM_DEBUG_KMS("%s : %dx%d cm\n",
> >> -		      (connector->display_info.is_hdmi ? "hdmi monitor" : "dvi monitor"),
> >> -		      edid->width_cm, edid->height_cm);
> >> +		      info->is_hdmi ? "hdmi monitor" : "dvi monitor",
> >> +		      info->width_mm / 10, info->height_mm / 10);
> >>  
> >> -	kfree(edid);
> >> +	drm_edid_free(drm_edid);
> >>  	return count;
> >
> > With the two items addressed:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> >>  
> >>  fail:
> >> -- 
> >> 2.39.2
> >> 
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
