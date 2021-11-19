Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6514576E3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 20:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1425E6E2C0;
	Fri, 19 Nov 2021 19:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5043B6E2C0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 19:07:20 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id d64so7377072pgc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 11:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q3pdqezUF3Pzbcds/tqL9a3vuB+GIr/2xlMTkcoKHS8=;
 b=mieh92MqEyaCRT1FaPUo0Ylw+EopgdsnKvE4+uToiX40sIMRdGF/jjsiLqfKJxLdVO
 1fRUmjyYu8bdBz+e0CPr4nS8X319aCYzHjYTN0XLgWeb7Q6xZwp8w/3vzPdyc6+FdY41
 fhSH97XWGnCqD4JEnmC9bLib413QEcOEpe6jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q3pdqezUF3Pzbcds/tqL9a3vuB+GIr/2xlMTkcoKHS8=;
 b=mbkDWMuL5vMRkRyjgIvX67Zy/axnm51nzu2+iXSLSd9enR+07fx81wpD2upUP3EF8E
 zNOjlwy12JeCo8hPdTRkOeBPCDutsw2PkIziWiN6c8HkJ6iS6iMHrYVbK5cxWFfK9plP
 ziA23X+8IxP3sYrDmOv2aJmoohioyiQNqeOJcb8oLtOwQlU5wKpvvmF9f64Zk7IfOtjj
 pjGsj3yzQNUTubY41qFw9hcp3UIeqdqLIIk3tQoCEN6QETj0BIhSrMhYEPiuqdI82lv5
 le/3MhzBFOIGGTTgh9md6QhpeS7C0tSjO0EmKhurNxbDvkM/TlcGrNIJcA3m1BnvJo3h
 9G/A==
X-Gm-Message-State: AOAM5312aRKF2eVj8v2/h74egfpn/QEsamVqm93ykUoSO/poYgiOiNDi
 qFMi1vmf4rZjWrvRMMqql3RpfA==
X-Google-Smtp-Source: ABdhPJz/CalZQJnQBmz5Ruvzzp4xId7hvXSM5tnD56nv0ohBgcfA6CYqnztrKPcmtSPoDW8Mw331SQ==
X-Received: by 2002:a63:494f:: with SMTP id y15mr18817862pgk.257.1637348839767; 
 Fri, 19 Nov 2021 11:07:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:d418:2c22:1322:f27])
 by smtp.gmail.com with ESMTPSA id e7sm337651pgj.11.2021.11.19.11.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 11:07:18 -0800 (PST)
Date: Fri, 19 Nov 2021 11:07:16 -0800
From: Brian Norris <briannorris@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YZf15Ir0LDjkYNF2@google.com>
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <YZYXR4u6VBEi4qnM@phenom.ffwll.local> <YZap4zKo8D5eZc1y@google.com>
 <YZd17jm5Nkfu5YRO@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZd17jm5Nkfu5YRO@phenom.ffwll.local>
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

Hi Daniel,

On Fri, Nov 19, 2021 at 11:01:18AM +0100, Daniel Vetter wrote:
> On Thu, Nov 18, 2021 at 11:30:43AM -0800, Brian Norris wrote:
> > On Thu, Nov 18, 2021 at 10:05:11AM +0100, Daniel Vetter wrote:
> > > On Wed, Nov 17, 2021 at 02:48:40PM -0800, Brian Norris wrote:
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -79,9 +79,15 @@ config DRM_DEBUG_SELFTEST
> > > >  
> > > >  	  If in doubt, say "N".
> > > >  
> > > > +config DRM_INPUT_HELPER
> > > > +	def_bool y
> > > > +	depends on DRM_KMS_HELPER
> > > > +	depends on INPUT
> > > 
> > > Uh please no configs for each thing, it just makes everything more
> > > complex. Do we _really_ need this?
> > 
> > First, it's not a configurable option (a user will never see this nor
> > have to answer Y/N to it); it only serves as an intermediary to express
> > the CONFIG_INPUT dependency (which is necessary) without making
> > DRM_KMS_HELPER fully depend on CONFIG_INPUT. (We should be able to run
> > display stacks without the input subsystem.)
> 
> I'm not so much worried about the user cost, but the maintenance cost.
> Kbuild config complexity is ridiculous, anything that adds even a bit is
> really silly.
> 
> > The closest alternative I can think of with fewer Kconfig symbols is to
> > just use CONFIG_INPUT directly in the code, to decide whether to provide
> > the helpers or else just stub them out. But that has a problem of not
> > properly expressing the =m vs. =y necessity: if, for example,
> > CONFIG_DRM_KMS_HELPER=y and CONFIG_INPUT=m, then we'll have linker
> > issues.
> 
> Usually this is done by providing static inline dummy implementations in
> the headers. That avoids having to sprinkle new Kconfig symbols all over.

Right, I already did that, and I'm not sprinkling
CONFIG_DRM_INPUT_HELPER much. (I do include one around the module
parameter, because it doesn't make much sense to have the module
parameter even exist, if the underlying feature is stubbed out.)

But that doesn't solve the problem in my last sentence, involving
tristates. The "stub inline" approach only works well for boolean
features -- either built-in, or disabled. Once your feature is in a
module, you need to ensure that no built-in code depends on it.

Do you want DRM_KMS_HELPER to unconditionally depend on CONFIG_INPUT? If
so, I can just add a 'select' or 'depend' and drop this intermediate
symbol.
If not, then what do you expect to happen with DRM_KMS_HELPER=y and
CONFIG_INPUT=m?

Brian
