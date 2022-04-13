Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D7B4FF1FA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A4510FF75;
	Wed, 13 Apr 2022 08:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8AA10FF7A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 08:32:33 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id k23so2444562ejd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lwIyJNNBgavXF+0okWsjIHB5D8UR32BcFASWc0GlyvA=;
 b=L2DI+qfcmOOPnT391oxcgwp2itusQVI5S0jdM9UPv5jDYII9WgrbqpVc/QO6294FmB
 RP6GR+6AA8kekYgBE35M8pmnD9uVVZL+rCJuXISGQrmcwNNOJFkfcphdUWCf2AsuOWbW
 bKrQ8kaIba51Kxc8hH2wk9v3wGjebzk5Mazis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lwIyJNNBgavXF+0okWsjIHB5D8UR32BcFASWc0GlyvA=;
 b=ch0+4YVI9hBQMaTZpaQWfPgiuwbp9MPJVBeQO5MHToEhhTI1DW5+RbL/jjO3ln7Tl+
 BP/hU+NzU3OARhP0BzLfSgr6Vb5hzPPW7GHlkR79XLYiPf/U3ewJwbdT3roUmSU0RUz0
 +DJ7vg4BTImM0UzbLFRh89Uqmg8E2v7N1H7sGy8YDPRtoD75f/4GMyHsJvK+QpE0TL93
 6XZK+zCit5ti/v7XYr7GuHBBj+equ3jZMHlwtWx4f8QBRBNa27sQcsCNmw6tonYz2308
 tYcolyyhjNvRo4b3sp2fMX3TIjPro5iW0n5UIoPuZPEpyEW0K6R/KkYVVQkA9UVX31GR
 QG5A==
X-Gm-Message-State: AOAM530JRLWedqait5hHMIb+e2VstakEhEJHV+CGLh9MXhW0nSaOU12w
 oZBF9yk2euG7utTuLDr7hCdi5Q==
X-Google-Smtp-Source: ABdhPJzoAV+RPSxJHAdqqVJC0BmA0xOSaQx1ypH5eFSOMcZYrxtKnMCpTAyvN/k851B052y+BmnCMg==
X-Received: by 2002:a17:906:698a:b0:6ce:b983:babf with SMTP id
 i10-20020a170906698a00b006ceb983babfmr39789147ejr.553.1649838752003; 
 Wed, 13 Apr 2022 01:32:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170906654700b006e886beb300sm3916574ejn.164.2022.04.13.01.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 01:32:31 -0700 (PDT)
Date: Wed, 13 Apr 2022 10:32:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <YlaKnRY/aON+EUOx@phenom.ffwll.local>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <acd0c8b6-b045-bab7-dc92-ea166b22c1c6@redhat.com>
 <dc3754a4-3f74-95bb-adae-56000a3756f5@redhat.com>
 <AQ3YD3wm6m_Knso5FAW-CKcokQqjDweExgrnV-f84VGkcOk8B0UcaooLiNqFMsHLOnhVnsnxC9kJMh_gY7z6rHlFaIx1OAZxSUfrOnd2jtY=@emersion.fr>
 <ca6eead3-13e7-2973-657d-48798c6cf89f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6eead3-13e7-2973-657d-48798c6cf89f@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 08, 2022 at 12:26:24PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/8/22 12:16, Simon Ser wrote:
> > Would it be an option to only support the KMS prop for Good devices,
> > and continue using the suboptimal existing sysfs API for Bad devices?
> > 
> > (I'm just throwing ideas around to see what sticks, feel free to ignore.)
> 
> Currently suid-root or pkexec helpers are used to deal with the
> /sys/class/backlight requires root rights issue. I really want to
> be able to disable these helpers at build time in e.g. GNOME once
> the new properties are supported in GNOME.  So that distros with
> a new enough kernel can reduce their attack surface this way.

Yeah but otoh perpetuating a bad interface forever isn't a great idea
either. I think the pragmatic plan here is
- Implement this properly on good devices, i.e. anything new.
- Do some runtime disabling in the pkexec helpers if they detect a modern
  system (we should be able to put a proper symlink into the drm sysfs
  connector directories, to make this easy to detect). It's not as great
  as doing this at compile time, but it's a step.
- Figure out a solution for the old crap. We can't really change anything
  with the load ordering for existing systems, so if the hacked-up compat
  libbacklight-backlight isn't an option then I guess we need some quirk
  list/extracted code which makes i915/nouveau/radeon driver load fail
  until the right backlight shows up. And that needs to be behind a
  Kconfig to avoid breaking existing systems.

Inflicting hotplug complications on all userspace (including uevent
handling for this hotpluggable backlight and everything) just because
fixing the old crap systems is work is imo really not a good idea. Much
better if we get to the correct future step-by-step.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
