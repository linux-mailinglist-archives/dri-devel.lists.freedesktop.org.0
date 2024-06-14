Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491289086E9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9810E229;
	Fri, 14 Jun 2024 09:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="A6+f/lTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFBA10E229
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:01:50 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52c7f8a7d39so268583e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718355708; x=1718960508; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=homrb/iaTZHAEpkTeDp1JUblCP3dL4xeTSsCJNccRa4=;
 b=A6+f/lTxKA4M5UlImVRN+/kZxsJ7t8v7QFssatmHf17ulf9n2GBATMie+cz3sfEBz8
 CYNn2M3hKKa/V42Dv90nW19Er9LG9g4rsvb+vf9cg/MeUcG6Zrsx1wXnBlh9Sp6TAmdo
 UuLhovjRyo5ZFZbInyZemi7FNRmchVrRkXsSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718355708; x=1718960508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=homrb/iaTZHAEpkTeDp1JUblCP3dL4xeTSsCJNccRa4=;
 b=HV9SCqLqir77vlFILyiD8yCpCUK9eqH4m0ON5Z7B+tiNzWk3wV3kiRjtCAy8J3xx0m
 oyv2yxqx7C9E9SCY/m1GxHCG63hndvk0j+uz5xS+aFQ041UfEadNmZIhc0k74YdPzKPO
 roN050mpJgQ8KNLTVLV+F1aAz/ROw8wkkVsxrt4wbCl5ARgFglwBhCJd236fHRXSJy+f
 r2Yy1OS4YlUeNaFWcRSBS2Q+fZcWhWZh1/DOlH0fZLpl8+0RnSLZYjwx6WGYn1N6aHhF
 zNIksYt6brOF0ozefRKfOJDOZ+jxa124OlWkMytG02Mu8wghJ6mjF04+PRAv0UJBYXR0
 /t4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxp4kNO1SyYOCZUHQe6uTvP4Ct1Kg+GpTzyIKofoZIBAMWWmJO2Hx6sqTpjpm/TF/BNg1dULemyWoKoeG1i7fKSqLXZ5QiaX4FNUtnNm8e
X-Gm-Message-State: AOJu0YxfVbkIUttrPXDBVaT/OkCIDin4xY46JA7pIkiI100p38KuLb/m
 +L0kkVkRRiffsDkWFoQd8yUBwNwP2NxYgjTW7y/577CNgcKYW2jzKppPvHLXcP8=
X-Google-Smtp-Source: AGHT+IHI7uLTnCA/CmnZm0Lon4gHN2nYEBV2cztgtZkIHIBpPjR5k9Nz9VsC6ePHZcpbAsD3yb4Sgg==
X-Received: by 2002:a05:6512:39c4:b0:52c:a657:7e85 with SMTP id
 2adb3069b0e04-52ca6e99ff9mr1716148e87.3.1718355708328; 
 Fri, 14 Jun 2024 02:01:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602e802sm52177855e9.11.2024.06.14.02.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:01:47 -0700 (PDT)
Date: Fri, 14 Jun 2024 11:01:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <ZmwG-RwxAIsUMOYn@phenom.ffwll.local>
References: <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
 <20240228-nice-flat-cormorant-badff7@houat>
 <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
 <ZeBh3N4uttG53qhU@phenom.ffwll.local>
 <20240523-graceful-shellfish-of-development-db7bd8@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523-graceful-shellfish-of-development-db7bd8@houat>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, May 23, 2024 at 04:51:25PM +0200, Maxime Ripard wrote:
> Hi,
> 
> Reviving this thread because I'm not sure what the outcome was.
> 
> On Thu, Feb 29, 2024 at 11:52:12AM GMT, Daniel Vetter wrote:
> > > The only thing I'm saying is that this breaks the usual DRM requirements.
> > > If, as a maintainer, you're fine with breaking the rules and have a good
> > > motivation to do so, that's fine by me. Rules are meant to be broken from
> > > time to time depending on the situation. But please don't pretend that
> > > modetest/xrandr is valid user-space to pass the rules.
> > 
> > I think it bends it pretty badly, because people running native Xorg are
> > slowly going away, and the modetest hack does not clear the bar for "is it
> > a joke/test/demo hack" for me.
> > 
> > I think some weston (or whatever compositor you like) config file support
> > to set a bunch of "really only way to configure is by hand" output
> > properties would clear the bar here for me. Because that is a feature I
> > already mentioned that xrandr _does_ have, and which modetest hackery very
> > much does not.
> 
> The expectation (and general usage) for that property was that it was
> set by the kernel command line and then was forgotten about. Old TVs
> require one mode and that's it, so it doesn't make much sense to change
> it while the system is live, you just want the default to work.
>
> So it's not really a matter of "the user-space code should be open"
> here, there's no user-space code, and there will likely never be given
> that it's mostly used to deal with decades-old systems at this point.

Yeah if this is being used just with the kernel cmdline, then I guess
that's somewhat ok-ish. And TVs are horrible, so "massage your kernel
cmdline" is comparitively not a horrible interface :-P

Anyway, I guess this makes this an ack.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
