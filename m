Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6C6E1592
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 22:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EF110EC21;
	Thu, 13 Apr 2023 20:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C68710EC26
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 20:01:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2ef1e98d6bfso526122f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681416085; x=1684008085;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoVUNaZaM2XfpV6KT9jjTvveGKx0rUw/FJ3BSvzxFDA=;
 b=QeCMIubWV2ZxjUSHK/YaYnO6aOMuTOVF3qS7K8TyjovrtKBrfuYOPntlMgGyMFruap
 c2pdeQsFGbxIr4fcwVeuI0s1ofA8uh4RjAlceoeFGIgElrdzwRJLt3HV22O/VHwMWvPg
 g9WSb3e3rDnYTPjuzJDUr7MyGE1Sd0TR2PMXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681416085; x=1684008085;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LoVUNaZaM2XfpV6KT9jjTvveGKx0rUw/FJ3BSvzxFDA=;
 b=G+w4532od2MGwmCwL9PHZ2kP+5u9B86e0U1ZJRHfbonV6bIPagQkRv9+e5XVzmze+f
 W+AKQUBe8CDM/SmU43dQ+VoOvXlFUd458pk1v1YqwmTqYBqpWarC8grrfB/KiYNNlZnJ
 o4JnFf8ezLfrSVzw5UmgDe2xXivWTltj4kJVwyUizSR+iR6VaN6y1SN8eLGsTdYAD3pb
 6UsJKWUShQjcNMjJ7ylq79SbMqrZxQduYXiqZ/RGFFwHlbLVa5WZxbPk1bKoAIJmrRzC
 nzfDo1cCf/dSmIN+4x7TNBN2UMgHjq0t/AevcFwO6oLk9iazPCe0wIFTxc+x/KsgSbBA
 jC1Q==
X-Gm-Message-State: AAQBX9cCY89jMhcFaUa1llriqKkiT/VED3K8kUR5jKypy0RqhbZrnM69
 wFj9sTmarueuF+GBWEhJRHlfjtIxb0lXGvde+uk=
X-Google-Smtp-Source: AKy350Z+twkvFRjVeJgVSWcMWzX3CHPi3LHk5n6KqDKM64KPi/KoFdjY01LEeLcmORKirWVo8YW3iQ==
X-Received: by 2002:a05:600c:19cc:b0:3f0:80fe:212d with SMTP id
 u12-20020a05600c19cc00b003f080fe212dmr2932147wmq.3.1681416085158; 
 Thu, 13 Apr 2023 13:01:25 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l20-20020a7bc454000000b003ed2276cd0dsm2620041wmi.38.2023.04.13.13.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 13:01:24 -0700 (PDT)
Date: Thu, 13 Apr 2023 22:01:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Message-ID: <ZDhfkq92hbGc630z@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 09:20:23PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.04.23 um 20:56 schrieb Daniel Vetter:
> [...]
> > 
> > This should switch the existing code over to using drm_framebuffer instead
> > of fbdev:
> > 
> > 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index ef4eb8b12766..99ca69dd432f 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -647,22 +647,26 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
> >   static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
> >   					       struct drm_rect *clip)
> >   {
> > +	struct drm_fb_helper *helper = info->par;
> > +
> >   	off_t end = off + len;
> >   	u32 x1 = 0;
> >   	u32 y1 = off / info->fix.line_length;
> > -	u32 x2 = info->var.xres;
> > -	u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
> > +	u32 x2 = helper->fb->height;
> > +	unsigned stride = helper->fb->pitches[0];
> > +	u32 y2 = DIV_ROUND_UP(end, stride);
> > +	int bpp = drm_format_info_bpp(helper->fb->format, 0);
> 
> Please DONT do that. The code here is fbdev code and shouldn't bother about
> DRM data structures. Actually, it shouldn't be here: a number of fbdev
> drivers with deferred I/O contain similar code and the fbdev module should
> provide us with a helper. (I think I even had some patches somewhere.)

Well my thinking is that it's a drm driver, so if we have issue with limit
checks blowing up it makes more sense to check them against drm limits.
Plus a lot more people understand those than fbdev. They should all match
anyway, or if they dont, we have a bug. The thing is, if you change this
further to just pass the drm_framebuffer, then this 100% becomes a drm
function, which could be used by anything in drm really.

But also *shrug*.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
