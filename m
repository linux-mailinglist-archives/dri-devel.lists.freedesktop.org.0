Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE31D831ABA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 14:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1C210E796;
	Thu, 18 Jan 2024 13:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F64910E796
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 13:39:59 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2cd7ebdd489so19496951fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 05:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705585138; x=1706189938; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y9EGaRXv4FZXlNtAuV0jC5k2fIUgJZIk8iD5hM2cVZw=;
 b=eTLh6WMDmgWLeYiOAKZyHP2mr9E5Cif0XwdC1E7Yp0PcJJRyfLe8NJKG0HsaLe31jW
 fPg4ginca3XvfLz5UD7Llkb1p9Iqsrd/yANlzkRcZdHkl8wbDugxRqXHrreMcq4S0mH/
 Befeyd9rWbXHNf6rtB7CZ1+7ZbTli/TJL50K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705585138; x=1706189938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9EGaRXv4FZXlNtAuV0jC5k2fIUgJZIk8iD5hM2cVZw=;
 b=sngxkDzEx6I4av3feRHDwWskzGiaUPBeeB13AiUW+764nf9H7by1Cddineg1tsmc/x
 xLelVTH+VQERTwC4Zm1Ateo7/xsaaJYaJdtFy029XQMkuBazc35PqK8RETo68ASbk6Mh
 VP1VltSmJbxrfnJKgH/loEdDgTwkECstJ/+2STd3rsbGeGw276gbuxlBNg7WGY1IOxlX
 iwBo/cE7Ar2FFS60k/anUGB0rKGRKfRHoM2Iduj21Hk1TbsdyGdROpjSZuHA9bS3PAca
 ISThvYZWRqGOGFjg3uqbOz7IHhuChRE+Phq+iNvkOnOBP4+QozyVJC1k0Q/lH4MBLaim
 R5og==
X-Gm-Message-State: AOJu0YyMi14n92RPpVsgnmwo+9EEFc+kZSGB0YxEuuR4Zwnobbg7RfX2
 I65pZw8SGlkdSHQYN6biNR3x5gM8VtpAZme1OsHcTmVMkyf8Rkv74G+EqOtggzo=
X-Google-Smtp-Source: AGHT+IH1UDUTiQj8lDq2UQBkQ6m5ZW2aU5v6p60MxYbOb7mjZCtslRlrbVw0DTd8i1afsec+EHIhBQ==
X-Received: by 2002:a2e:7a0a:0:b0:2cd:e03d:4a47 with SMTP id
 v10-20020a2e7a0a000000b002cde03d4a47mr1023787ljc.0.1705585137440; 
 Thu, 18 Jan 2024 05:38:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a056402195500b00557a2e4b585sm9504736edz.66.2024.01.18.05.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 05:38:56 -0800 (PST)
Date: Thu, 18 Jan 2024 14:38:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Message-ID: <Zakp7YbFeRlhhIwd@phenom.ffwll.local>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
 <ZaFBofhe217zCmWN@phenom.ffwll.local>
 <l3podaaakwaai7xuxaa7cdb5c4s7m6jc6pitepk6uk7o3knn2b@jg5a2hnla77z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l3podaaakwaai7xuxaa7cdb5c4s7m6jc6pitepk6uk7o3knn2b@jg5a2hnla77z>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 Daniel Vetter <daniel@ffwll.ch>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 02:56:17PM +0100, Maxime Ripard wrote:
> On Fri, Jan 12, 2024 at 02:41:53PM +0100, Daniel Vetter wrote:
> > > +		fb = plane->state->fb;
> > > +		/* Only support linear modifier */
> > > +		if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
> > > +			continue;
> > > +
> > > +		/* Check if color format is supported */
> > > +		if (!drm_panic_is_format_supported(fb->format->format))
> > > +			continue;
> > > +
> > > +		dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> > > +
> > > +		/* Buffer should be accessible from the CPU */
> > > +		if (dma_obj->base.import_attach)
> > 
> > This might be a bit too restrictive, since some drivers import dma-buf
> > including a vmap. So just checking for ->vaddr might be better. But can be
> > changed later on.
> > 
> > > +			continue;
> > > +
> > > +		/* Buffer should be already mapped to CPU */
> > 
> > I'd clarify this comment to state that vaddr is invariant over the
> > lifetime of the buffer and therefore needs no locking. Correct locking
> > that a) takes all the locks b) never ever stalls for one is absolutely
> > crucial for a panic handler that won't make the situation worse.
> 
> I think this comment was made to address buffers that are accessible to
> the CPU but don't have a CPU mapping (ie, created with
> DMA_ATTR_NO_KERNEL_MAPPING for example).

But then the NULL value of vaddr would also be invariant ...

My emphasis is more that we need to be really careful with all the locking
rules here in the panic handler and not just assume it's going to be safe.
I've stitched some tricky design together, but need to still move it from
the whiteboard to a patch.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
