Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7D927803
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 16:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2FA10EB17;
	Thu,  4 Jul 2024 14:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EYF4sDUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4506310EB13
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 14:14:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4264c77037cso495485e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720102497; x=1720707297; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KV8f3urbnL0W4JHhOO4E6PQhgD0QQN8jjx7QzVJNgoc=;
 b=EYF4sDUzSH14CBvn+L0glSRa8pemex+MU9YKaEHqpcT2Gvl42egysvLG7v7X+eTApV
 IXG7JrxdIXb7YQVltJ1vC0JuV66W6lQdNLCivIldi1S8H9lfCMjWlHxk8oUWWs/dROp4
 EXr7OC8bROi9y/Y9kPlh5Dh25+t6wWg014QJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720102497; x=1720707297;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KV8f3urbnL0W4JHhOO4E6PQhgD0QQN8jjx7QzVJNgoc=;
 b=flXVkZTGLvMuekVqAAqqdhc+Ul+w+LuF7FYNLHntPI1MDUluzZaUlbMDBA2hUU2x+X
 /kfs5EuALJif0JQqWoGwxuggMD5Q0l2aQOrtmtK6Udj/uIZeIWd4xO4SxpDEveR6wxGx
 aYSKf3x1klCgQ+kpb0tlSzzVvnlTuL6H9fm9Ir0xR6CratEpnue7Bd3sTnEnIRwqgSgf
 S6HpG6MrWF8uz0m+urfwHNOqNkZo9oaAlfW387p3tIs2sGDmtsnl5yP9CfNXHsNxf6Lc
 u7zauPV+jtg2WBwFBEW7YXHnC9t0t3buAqns06wMjRi/f/rcK40jd7V8cVOeIEEXhDkA
 RoIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYyxPhrg2/sMjWO5jNvort/56Kwwylgz0CqW8xYdaDBJ1aoOG3VqkaNQH4qosctUAz/R6cy62nvz1I0oagXMtD0f6cGETUpC32SMgz6vCn
X-Gm-Message-State: AOJu0Yw+prTVMATvTpqtABtvJiX9ePhwfhMKpjEViExjyeyw9WjzrZps
 VNa0xkiSU23Vq1Xl3dho9+u3SmlpsO5PTGQHrnI52vDH4eeLQAxeYO63iAdxR3Y=
X-Google-Smtp-Source: AGHT+IFeddE33psL+jiUnEoUFuSjjSFh34e7tWolDnotER37qRWufnHgTc8gmzxdvhHF0k73zVwD1w==
X-Received: by 2002:a05:600c:35d4:b0:426:4920:2846 with SMTP id
 5b1f17b1804b1-4264a46b0bbmr13426085e9.3.1720102497539; 
 Thu, 04 Jul 2024 07:14:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264aa07a95sm24251965e9.1.2024.07.04.07.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 07:14:57 -0700 (PDT)
Date: Thu, 4 Jul 2024 16:14:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <ZoauX9XzpUDpklFu@phenom.ffwll.local>
References: <87frss9ozs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frss9ozs.fsf@intel.com>
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

On Tue, Jul 02, 2024 at 11:28:39AM +0300, Jani Nikula wrote:
> 
> Hi Dave & Sima -
> 
> One early fix this week.
> 
> drm-intel-fixes-2024-07-02:
> drm/i915 fixes for v6.10-rc7:
> - Skip unnecessary MG programming, avoiding warnings (Imre)
> 
> BR,
> Jani.
> 
> The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:
> 
>   Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-07-02
> 
> for you to fetch changes up to f72383371e8c5d1d108532d7e395ff2c277233e5:
> 
>   drm/i915/display: For MTL+ platforms skip mg dp programming (2024-07-01 10:36:12 +0300)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> drm/i915 fixes for v6.10-rc7:
> - Skip unnecessary MG programming, avoiding warnings (Imre)
> 
> ----------------------------------------------------------------
> Imre Deak (1):
>       drm/i915/display: For MTL+ platforms skip mg dp programming
> 
>  drivers/gpu/drm/i915/display/intel_ddi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
