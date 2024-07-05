Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B89289E7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 15:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630AD10EBA5;
	Fri,  5 Jul 2024 13:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dDk3L56E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3AD10EB99
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 13:41:31 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42111cf2706so2079225e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720186889; x=1720791689; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYq4Ghm/qD4X8g59+rt7/AyXTOqvB29s1gzm0udAON4=;
 b=dDk3L56EyFuJ96GiAp4DC9Q6Zf0+KOhXaOBzLCnpIqBX20sxzGoxP230jcubzGCXP+
 oTp0YdE5mXGlTAQKKRJULXN8umwffM4RYaPBi/cH4ZEWGo+V+OMBeZVI/bdjIAVY24jP
 QZkDCOEJXRW2YwDyU1WQoP7AOyG2pzn02CBoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720186889; x=1720791689;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hYq4Ghm/qD4X8g59+rt7/AyXTOqvB29s1gzm0udAON4=;
 b=A41upszzoWzGG8wbOnUQcanuehvcPJklLAsYiHZCrkvB4c0pW16If5f/KkqKk3CXU3
 Jyl1OaMOJWu/OGgVc0bwoeEwUObM9EpzO15nMtf6aHBo+w11cy2lDWRAehGxojYSwEf9
 0e0opNGCh2nLfb3VJxxDghPQAYQyR3tiYB2RqlMA+eXCmvGFL3YM9iwmZoAgEn3Dpjzq
 APuT3Iwno8j5DfUJonF28cXk+cDmMPEYHpybDvXBrhUdIzypMohk+uRZCjf2507Hwmfk
 P8BfWYL8QX8sZgE5RMrxhaJAS9GuWfCQNpXxazYliCi8M9Rz85LYmq67supY5qEyqAEb
 C+0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn7HFEOxGzff6NW/9RxBbZr71IfEaalYsNeLXQAnLnXdKk1x4945RdvKIngiF8gBu+aVDgxG+5VcuNErK35I84HfGpKNfEeKfQ8ibRcjeu
X-Gm-Message-State: AOJu0Yx12r/oyl/N6X+BmPCrbY1rzeltW5DK9Ic3t4wpNPXGtjX5lipn
 xi7WyBSt53BV2Ipe1bvaxnCxXbDfS/CFWEzl+vfU/b4U8K4DiEHOB1jeNYS6QeY=
X-Google-Smtp-Source: AGHT+IHy5I71tFmzj8hG6kRNj6VGoN9oGdPL1jjZSB9TbVRv2dFuN5Re/aCUVhXZIMsk78oJMav84A==
X-Received: by 2002:a5d:5f84:0:b0:367:2da6:aa1b with SMTP id
 ffacd0b85a97d-3679de74a63mr3125952f8f.7.1720186889172; 
 Fri, 05 Jul 2024 06:41:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367a0522ea3sm3762365f8f.27.2024.07.05.06.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 06:41:28 -0700 (PDT)
Date: Fri, 5 Jul 2024 15:41:26 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: drm/sti: mark it as Odd Fixes
Message-ID: <Zof4Bp82iu7hZsSZ@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240705100356.16760-1-krzysztof.kozlowski@linaro.org>
 <ZofW1v4uEFo9GscF@phenom.ffwll.local>
 <20240705-hysterical-beluga-of-courtesy-38b2e2@houat>
 <ff8b84c9-5bef-4cb9-a10b-b3bb1a017366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff8b84c9-5bef-4cb9-a10b-b3bb1a017366@linaro.org>
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

On Fri, Jul 05, 2024 at 01:33:38PM +0200, Krzysztof Kozlowski wrote:
> On 05/07/2024 13:22, Maxime Ripard wrote:
> > On Fri, Jul 05, 2024 at 01:19:50PM GMT, Daniel Vetter wrote:
> >> On Fri, Jul 05, 2024 at 12:03:56PM +0200, Krzysztof Kozlowski wrote:
> >>> Patches to STI DRM are not being picked up, so even though there is
> >>> maintainer activity, it seems that these drivers are not being actively
> >>> looked at.  Reflect this in maintainer status.
> >>
> >> Note that since the driver is in drm-misc, other committers can also pick
> >> up patches and push them. Both Neil and Dimtry have commit rights and
> >> should be able to pick up your patches for you, if they get stuck.
> > 
> > I've applied the patches.
> > 
> > I don't think we should merge this one though, a one-off mishap can happen.
> 
> Sure.
> 
> Folks, maybe then pattern in maintainers should be somehow changed or grew?
> 
> The recommendation to all submitters is to use get_maintainers.pl. b4
> also does it. In this particular case, using get_maintainers.pl or b4
> will result in patches not being picked up.

I think get_maintainers.pl is correct: You get the driver maintainer, plus
drm-misc maintainers as official fallback, plus Dave&me as fallback of
last resorts. So all correct.

What's special with the commit rights model is that other committers that
work all over the subsystem can also pick up the patches for you, so that
the drm-misc mainters don't become a bottleneck. But the ideal person
there are drm-misc committers who work in your team or company, or someone
else where you have some goodwill credits to spend with and ask them for a
favour. And there's just no way to model that and make sure the script
gives you the right suggestions.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
