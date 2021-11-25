Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6539745DD58
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8DD6E82B;
	Thu, 25 Nov 2021 15:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C2D6E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 15:25:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c4so12397639wrd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 07:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=bgokrwfXdRB9SClU9n/nKdZVyUcKPx1fDzLulUzJIPU=;
 b=BktAf1OS+eudDpfgrdZDTSFFMA7Yx1oBn5NMzdoU7qIo8aNQ9mok4e2egctvZU1mko
 URk5CsZF+wfaS2PBAqP0GONNNyChiLkL+Cn3nlkbJubQzzbvN+ZxhxMH6RQhCRyrTmWO
 zzBIJ4Mhg0tjItLDamKowUeOk7aREzY9Rg5Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=bgokrwfXdRB9SClU9n/nKdZVyUcKPx1fDzLulUzJIPU=;
 b=hsn+zPWvQWy49K3wFfstWUX57Ys34IZzQtHfCXr4c+y+G5ksNqDt7dK9g4SBA4Ycgd
 yptHCoFwclvCdpj0yEmDRn7vWlqFQPLwCWPReRw8qqZEnjoA7InwoYrVGrWN5KqPMBnn
 DVviYMdqKAWJte6I/r9OpWcunQqiXA/D5zlRXxYFDoZLxH8DUCLkqkxIjBZ/ekbSXdEx
 HuguPIt6+/8MBBkn3f0tLfZVVWrdtVOtdzY7tDizni9jdkHnO7ufJxrSh6ES79WlSUB8
 t7IFhTeNeSSTwFCujY6aXr/m+ZHfdmfn+DpEl8W9xy609avV0k1EtZuQ+PCAl+uHEM/d
 tCMA==
X-Gm-Message-State: AOAM531+EbZltZsaK//AgGqh9ODqG6mQoxOSfP/MaO0p+Tr75LkQzSgk
 Cxy+nyudkhA0CZxFZfeUCRp7wg==
X-Google-Smtp-Source: ABdhPJwe8pptmsJdDF9M6JUSyrscCdaDaxsY8JQgVcoGOgo8XjGLEdr1e+oL4tgyhJgNNAWjvV0HCw==
X-Received: by 2002:a5d:6111:: with SMTP id v17mr7637482wrt.512.1637853908242; 
 Thu, 25 Nov 2021 07:25:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bg12sm4220870wmb.5.2021.11.25.07.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:25:07 -0800 (PST)
Date: Thu, 25 Nov 2021 16:25:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZ+q0ZlIRoq4nZMl@phenom.ffwll.local>
Mail-Followup-To: Brian Norris <briannorris@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Clark <robdclark@gmail.com>, linux-input@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <YZYXR4u6VBEi4qnM@phenom.ffwll.local> <YZap4zKo8D5eZc1y@google.com>
 <YZd17jm5Nkfu5YRO@phenom.ffwll.local> <YZf15Ir0LDjkYNF2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZf15Ir0LDjkYNF2@google.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@linux.ie>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 11:07:16AM -0800, Brian Norris wrote:
> Hi Daniel,
> 
> On Fri, Nov 19, 2021 at 11:01:18AM +0100, Daniel Vetter wrote:
> > On Thu, Nov 18, 2021 at 11:30:43AM -0800, Brian Norris wrote:
> > > On Thu, Nov 18, 2021 at 10:05:11AM +0100, Daniel Vetter wrote:
> > > > On Wed, Nov 17, 2021 at 02:48:40PM -0800, Brian Norris wrote:
> > > > > --- a/drivers/gpu/drm/Kconfig
> > > > > +++ b/drivers/gpu/drm/Kconfig
> > > > > @@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
> > > > >  
> > > > >  	  If in doubt, say "N".
> > > > >  
> > > > > +config DRM_INPUT_HELPER
> > > > > +	def_bool y
> > > > > +	depends on DRM_KMS_HELPER
> > > > > +	depends on INPUT
> > > > 
> > > > Uh please no configs for each thing, it just makes everything more
> > > > complex. Do we _really_ need this?
> > > 
> > > First, it's not a configurable option (a user will never see this nor
> > > have to answer Y/N to it); it only serves as an intermediary to express
> > > the CONFIG_INPUT dependency (which is necessary) without making
> > > DRM_KMS_HELPER fully depend on CONFIG_INPUT. (We should be able to run
> > > display stacks without the input subsystem.)
> > 
> > I'm not so much worried about the user cost, but the maintenance cost.
> > Kbuild config complexity is ridiculous, anything that adds even a bit is
> > really silly.
> > 
> > > The closest alternative I can think of with fewer Kconfig symbols is to
> > > just use CONFIG_INPUT directly in the code, to decide whether to provide
> > > the helpers or else just stub them out. But that has a problem of not
> > > properly expressing the =m vs. =y necessity: if, for example,
> > > CONFIG_DRM_KMS_HELPER=y and CONFIG_INPUT=m, then we'll have linker
> > > issues.
> > 
> > Usually this is done by providing static inline dummy implementations in
> > the headers. That avoids having to sprinkle new Kconfig symbols all over.
> 
> Right, I already did that, and I'm not sprinkling
> CONFIG_DRM_INPUT_HELPER much. (I do include one around the module
> parameter, because it doesn't make much sense to have the module
> parameter even exist, if the underlying feature is stubbed out.)
> 
> But that doesn't solve the problem in my last sentence, involving
> tristates. The "stub inline" approach only works well for boolean
> features -- either built-in, or disabled. Once your feature is in a
> module, you need to ensure that no built-in code depends on it.
> 
> Do you want DRM_KMS_HELPER to unconditionally depend on CONFIG_INPUT? If
> so, I can just add a 'select' or 'depend' and drop this intermediate
> symbol.
> If not, then what do you expect to happen with DRM_KMS_HELPER=y and
> CONFIG_INPUT=m?

Yeah just add the dependency. If you still want to keep it optional the
way to do it is to add

	depends on FOO || FOO=n

And then just have #if IS_ENABLED(FOO) around your inline wrappers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
