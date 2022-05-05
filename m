Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73F51C004
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57C310E333;
	Thu,  5 May 2022 12:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B086D10E2B1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:59:03 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g23so5096753edy.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=TdtdiuvZ8kL/hgc8dFK7GV8wDG6uaaKHXPWtyIXxhtg=;
 b=hXZ/pDovQSXNRx0IAnf+JAJh1h4umCs0GjzgB8qyT2sucQ6vbTH2Q+39inblU4gakn
 IzvRFdCufYweWPtGblHPsek8a2h/hJTuIlz34KfTJdFe6mtty2eOqXZb6oapAx2/iphd
 ChywpfpQhtj6kqglK59hJ6BWcHDmZSTO170x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=TdtdiuvZ8kL/hgc8dFK7GV8wDG6uaaKHXPWtyIXxhtg=;
 b=RlmXnFas+M1+mUtD/9zbk20frvEzASyOG9E3j1TrRUwwWW+t9T/pkA9xtdS4wzsVLi
 WZKmCpkM+B6TIw1WIthLjGTowHxkWdMaJqM7EejtafFlUs9WAxwqPpaeuatBOCAjilzN
 +epQ5fcUyUsN8jyakH3AJc5J4qLtnEMdj0NJC+kWqODeK2aqhRurMbMltd3H6n2xVKzq
 vM2UV27SHLssxtJgvYqTGxgiPtZrNPCbH91cr2hiB7GVqiwlyOf7rbf8q5LEwwSqtDO3
 CKf54ukhPRo/T8ImU3iPeL0CitBO4/GUEtBA5AwIGLAZd7QoR3PVNB6d2AGjYdpJfkpH
 9ACQ==
X-Gm-Message-State: AOAM532wlPDlQwSLhpSR447VCp2uSk64aavWN0+BRsJP7aQwonolyRXC
 Sz4/+3SzCZb2EYjLKUDb3qNd8tHvG613aA==
X-Google-Smtp-Source: ABdhPJyBYRoJ02j5Poqwbjoj0TCy918qe43XGFiHPEv1dUFaRY/4oF+mvaYj1nSndvSIV9S23+tVog==
X-Received: by 2002:a05:6402:4396:b0:427:f2dc:b11 with SMTP id
 o22-20020a056402439600b00427f2dc0b11mr13167491edc.298.1651755542198; 
 Thu, 05 May 2022 05:59:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j1-20020aa7de81000000b0042617ba63b3sm774202edv.61.2022.05.05.05.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:59:01 -0700 (PDT)
Date: Thu, 5 May 2022 14:58:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Message-ID: <YnPKE+6DE12IsOj4@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220503071540.471667-1-javierm@redhat.com>
 <20220503071540.471667-4-javierm@redhat.com>
 <YnJcaaDcIsJKhSwQ@phenom.ffwll.local>
 <bfb03d40-a023-12a9-9554-1b6e6c474134@redhat.com>
 <YnO+8hZ0ozPaZUEj@phenom.ffwll.local>
 <47d3a7f6-24f9-7d54-48bf-09ab9e40e2de@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47d3a7f6-24f9-7d54-48bf-09ab9e40e2de@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 02:45:27PM +0200, Javier Martinez Canillas wrote:
> Hello Daniel,
> 
> On 5/5/22 14:11, Daniel Vetter wrote:
> 
> [snip]
> 
> >>
> >> And while I agree with you that these midlayer flags are horrible, that is
> >> what any other fbdev that makes use of a firmware-provided framebuffer set,
> >> so simpledrm emulated fbdev shouldn't be the exception IMO.
> > 
> > So we discussed this a pile more on irc, and at least my take is that
> > people who run simpledrm but want to combine that with fbdev drivers and
> > expect it to all work nicely we can probably ignore. At least until all
> > this sysfb stuff is nicely unified, and at that point we shouldn't need
> > special flags anymore.
> 
> I'm OK with this take and happy to just drop this patch-set then. My worry
> was just that someone could complain that we broke their uncommon setup [0].
> 
> [0]: https://xkcd.com/1172/.

Since you have to explicitly enable simpledrm and that combo never
worked, we did not actually break anything.

Me, who has over a decade experience legalesing around the "no regression"
rule :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
