Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2C1A9BE1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABDB6E967;
	Wed, 15 Apr 2020 11:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDE16E967
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:13:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c195so14709952wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 04:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=wvwCnQfvn/D3yTYVIatgF0Dj2nXBoxZoBca6sT2p9Rc=;
 b=bGcv33xMQLgfNtUOfjjcX4of7mEIfkiQSif2zJ1xLMHNR6H3M6UkD8UjGS34zeJ5yr
 HYge7lRmvFENxlm0cAq8O9U3eVhyv9V389VRaPQX7cIwZ/yqbQgnOa7pFmd8FBaLbt0o
 4cg25hwscMQ1x9A9NldicpDAPR581llnFRQcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=wvwCnQfvn/D3yTYVIatgF0Dj2nXBoxZoBca6sT2p9Rc=;
 b=BXsv982lpBNuaDjTRNLWoBR6SehxZ1mafPI1CLZa/t2Wf6nMp+qjDBq+gZhR6QzpS1
 8gUZLcwVqk9Lcdk0+IFeRG2MqRUxrQZyZgUyzf/FZM4hGGwNpyZ+u/drBMTV5trOtsBc
 CyIOSaNrSHojglsu0v0Zl5vnYuQi0gK2kpaTpUATNvTJtV4z8CfK91bT22ga8fW5m+u/
 a+oZZjcHjnUJdjtSDrhp88NBqHU3HinERGob5HG8FpUWM2ue7aPrc88Ot0Dt6IiaFt5z
 7nTPdl6oibfwOzjpyyGL8APyo+ACcsfDm9r6KKF5vumCgf1VBMBokA0YHDujyncRNE0V
 Yo9Q==
X-Gm-Message-State: AGi0PuZQk7qLix3aNpGbZl58+9iSexD8g3vO4/1WYSV03T1501JiIBjV
 oSnDSRXTgwbIKszfYum9Vo1/EA==
X-Google-Smtp-Source: APiQypIahM+ZakKuCkW965ou0SjQzZmB10A4snEMgfEWVjOZaVHi9N4z5Cta4w/rqP+0WOLL49ymiw==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr4593858wma.24.1586949218840; 
 Wed, 15 Apr 2020 04:13:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm14212238wmj.45.2020.04.15.04.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 04:13:37 -0700 (PDT)
Date: Wed, 15 Apr 2020 13:13:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB
 quantization range" property
Message-ID: <20200415111336.GZ3456981@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Yussuf Khalil <dev@pp3345.net>, Simon Ser <contact@emersion.fr>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-6-dev@pp3345.net>
 <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
 <87ftd6mi3e.fsf@intel.com> <87d08amhy5.fsf@intel.com>
 <20200414123404.GT3456981@phenom.ffwll.local>
 <2cfe44c96818515939050ad19e9c248e50519be2.camel@pp3345.net>
 <87r1wp5hkq.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r1wp5hkq.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yussuf Khalil <dev@pp3345.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 10:33:25AM +0300, Jani Nikula wrote:
> On Tue, 14 Apr 2020, Yussuf Khalil <dev@pp3345.net> wrote:
> > On Tue, 2020-04-14 at 14:34 +0200, Daniel Vetter wrote:
> >> On Tue, Apr 14, 2020 at 02:21:06PM +0300, Jani Nikula wrote:
> >> > On Tue, 14 Apr 2020, Jani Nikula <jani.nikula@linux.intel.com>
> >> > wrote:
> >> > > On Mon, 13 Apr 2020, Simon Ser <contact@emersion.fr> wrote:
> >> > > > On Monday, April 13, 2020 11:40 PM, Yussuf Khalil <
> >> > > > dev@pp3345.net> wrote:
> >> > > > 
> >> > > > > DRM now has a globally available "RGB quantization range"
> >> > > > > connector
> >> > > > > property. i915's "Broadcast RGB" that fulfils the same
> >> > > > > purpose is now
> >> > > > > considered deprecated, so drop it in favor of the DRM
> >> > > > > property.
> >> > > > 
> >> > > > For a UAPI point-of-view, I'm not sure this is fine. Some user-
> >> > > > space
> >> > > > might depend on this property, dropping it would break such
> >> > > > user-space.
> >> > > 
> >> > > Agreed.
> >> > > 
> >> > > > Can we make this property deprecated but still keep it for
> >> > > > backwards
> >> > > > compatibility?
> >> > > 
> >> > > Would be nice to make the i915 specific property an "alias" for
> >> > > the new
> >> > > property, however I'm not sure how you'd make that happen.
> >> > > Otherwise
> >> > > juggling between the two properties is going to be a nightmare.
> >> > 
> >> > Ah, the obvious easy choice is to use the property and enum names
> >> > already being used by i915 and gma500, and you have no problem.
> >> > Perhaps
> >> > they're not the names you'd like, but then looking at the total
> >> > lack of
> >> > consistency across property naming makes them fit right in. ;)
> >> 
> >> Yeah if we don't have contradictory usage across drivers when
> >> modernizing
> >> these properties, then let's just stick with the names already there.
> >> It's
> >> not pretty, but works better since more userspace/internet howtos
> >> know how
> >> to use this stuff.
> >> -Daniel
> >
> > Note that i915's "Broadcast RGB" isn't the same as gma500's: i915 has an
> > "Automatic" option, whereas gma500 does not.
> 
> Adding "Automatic" option that just defaults to "Full" in gma500 does
> not break existing userspace, but allows for extending it to do more
> clever things later.

gma500 could keep it's own property, without the "Automatic" value. We've
done tricks like this for other properties too.

> > Also, radeon has a property called
> > "output_csc" that fulfills a similar purpose. Looking at the code, though, it
> > seems that radeon does not adhere to the standard correctly (or I am missing
> > something).
> >
> > An alternative would be to leave the existing driver-specific properties and
> > change them to be pseudo-aliases for the "RGB quantization range" property.
> > This can be done by letting the drivers read from and write to the new property
> > when user-space tries to read or modify the driver's property. This way we could
> > retain full backwards compatibility for all drivers equally.
> >
> > What do you think?
> 
> I'm obviously biased and predisposed to avoid adding extra complexity to
> i915 when it's not necessary. We'd have *two* connector properties for
> the same thing until the end of time, even if one is an alias for the
> other.

Yeah just pick one, and implement the others as aliases. Drivers can do
the aliases in their atomic_get/set_property functions pretty easily,
atomic properties aren't stored anywhere else than decoded (which was done
partially to make stuff like this work).

Coming up a new property name just so that everyone suffers equally feels
silly.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
