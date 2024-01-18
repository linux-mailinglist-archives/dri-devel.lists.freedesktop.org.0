Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBE6831AB2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 14:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33C510E76D;
	Thu, 18 Jan 2024 13:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBC510E76D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 13:38:00 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-55369c59708so2604396a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 05:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705585018; x=1706189818; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Aj8y73Bebsww2+2dhFtVM4rSmnDY8YtgyVB1QDwtZTY=;
 b=MNDgyfPLdoPDjbe/XnTkrAism3lZFjw9cVIzt415lbSbIZy+RPIWsIDdwqJakwEqtE
 l8PRbj21SgtB75flAm6OTy23psDhIpadp8bBkNoRezkjCJGXkBFk6w6nKrAEWN7rNWiw
 FF/16Z1QHOEArqc9iReHkR8zmIO0zxRMxHLHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705585018; x=1706189818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aj8y73Bebsww2+2dhFtVM4rSmnDY8YtgyVB1QDwtZTY=;
 b=R1eygr7X9OTreGCrMFtwpH45FAlEb+xSiu4zHDD8QsbfJWRbL1hgX4t08pcOImZAnV
 ItzHoTMfRmWxo3WzJCwUzKKszMMQ8i4lEbwmJtuSsLBYuQawphx/AHcsr5RyL0FARLqa
 Dy0JhXMXwawwSWnLOQ9rrUobOj3ZqVYRZMby8Wt1gKdLFoEqTA7hHD8W9RNZPAyfJvsS
 9mBIWgjYDBkskMalbDSZp+9xHNv+McLqkerkfefiesZVa8krJUxcwvqqVgRY/SDHQ3ir
 sfIApmMmi6dzvbrgkV09Vhq1RPV+3h/mi5gTKbeRty8zKQcBZ9Q27/j/Hg1kHQ8fvyn+
 5YLA==
X-Gm-Message-State: AOJu0YxLwJOam08fCPOUmF5zVAep7vZTLsF00nMaAYt/aNj/Nb4oxtzU
 FC/3rB/QbstcZPn5TNZVrbJkLX5SAYmUHgnnEa/trJAbrHPZ/JDi6TOZ4uSzmq4=
X-Google-Smtp-Source: AGHT+IFKD4YFUgAL1z9c6omSsdO7z8A7YVFMnUQZGcku8kafVAbuRRqsm5G5kz6q2wFZjlDsyPIxpQ==
X-Received: by 2002:a05:6402:717:b0:55a:41cb:6a9d with SMTP id
 w23-20020a056402071700b0055a41cb6a9dmr272379edx.4.1705585018382; 
 Thu, 18 Jan 2024 05:36:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a056402401200b00559e65bb529sm1872521eda.28.2024.01.18.05.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 05:36:57 -0800 (PST)
Date: Thu, 18 Jan 2024 14:36:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
Message-ID: <Zakpd3Q-OM-PlVGz@phenom.ffwll.local>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
 <ZaE_TPjzOeoMBM4f@phenom.ffwll.local>
 <31d0f162-421e-4b42-8b3f-bc3e6c852eb0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31d0f162-421e-4b42-8b3f-bc3e6c852eb0@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, Daniel Vetter <daniel@ffwll.ch>,
 javierm@redhat.com, mripard@kernel.org, gpiccoli@igalia.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 11:54:42AM +0100, Jocelyn Falempe wrote:
> On 12/01/2024 14:31, Daniel Vetter wrote:
> > You need to tie these nice kerneldocs into the overall documentation tree,
> > or they're not getting built. Please then also check that all the links
> > and formatting works correctly.
> 
> oh yes, I need to add it to the Documentation/drm/xx.rst.
> I'm not sure where drm panic fits there.
> If I move get_scanout_buffer() pointer to the drm_mode_config struct, adding
> drm_panic docs to drm-kms.rst makes sense ?

Yeah I think a section in the modeset docs (not the modeset helper docs,
this is fairly core concept imo) makes the most sense.

> > The locking here is busted. Which is why the atomic notifier chain is
> > special and uses atomic semantics - I would just avoid this issue and
> > directly register each drm_panic_device instead of trying to maintain a
> > drm-local list and getting the locking rules wrong.
> 
> It's a bit complex to get the drm_device pointer in the callback.
> I think I can add a "struct notifier_block" in the struct drm_mode_config,
> and use the container_of macro, to retrieve it.
> This also makes it easy to unregister.

Yeah if you register each drm_device separately you also need to embedded
the notifier chain into every single one. drm_mode_config sounds ok for
that to me.

I didn't realize that the kmsg_dumper api doesn't have some kind of void*
argument but you need to embed the notifier in the right place, in case
some of my other comments confused you.
-Sima

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
