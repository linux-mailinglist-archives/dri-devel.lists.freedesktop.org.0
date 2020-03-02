Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259A17574F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7086E209;
	Mon,  2 Mar 2020 09:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39D86E209
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:39:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u9so4089600wml.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 01:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XgzH+GI4XDfUr3H6/RA0Cs7sjbBaxDHRlo7z/kRe9qg=;
 b=S8eSbxiR8KhyR/PvANc8GTTCW6eZ8D78AUHr4tW5BXcDfX3g6EjXnA7zjfp73zR2CA
 OSgUyxhV+d5d8G01XjfF1mvzU5WI77esC3+fZXZHDUxsL3izFZb9uw2ltqZa3IZbWOkm
 pLC0GLXWbupql6/Jhm/2R5dsAU+oIhXpmVbng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XgzH+GI4XDfUr3H6/RA0Cs7sjbBaxDHRlo7z/kRe9qg=;
 b=H01cC88Nnukfm/AeEQl+lFfXy35p7sJdNCN4TeYqtXswX9wt190ngxi00ogqyFEryr
 RhzaeKdpm4HLWW5dMS8soIxZDgvHvmH3tatrRiQK7Pv9tq8Y3prGHa6+TYv0VEc0ozI3
 dL0iBduUP9jRXt6ZPek0iDK3dEcaq04RDJLtqvV9rTap9/GCddZ1sgDLxC3Hhcf3j7+C
 oYLPg7NWPVV+1DAxBorV6CKKcPtnxzKb7YnJko0Lmuc4wnaYtZXOCyDsI5ydXkG8ZRWk
 7Se+ZVq8EkFB3PV71M+YcK26JRUvuuShG/SOzVZlN+gmi6xlQbfpPfkapILTa6C6+OaM
 fk8Q==
X-Gm-Message-State: APjAAAVc+C13tGju0J12vF3RFVOGy8ybb+upcgnowGq8H8KYWGz8rcqC
 4B4t8d2YH9dgW12jjVx4Xv27LA==
X-Google-Smtp-Source: APXvYqwGG7ZUAnm+xJwW+2iCcc942XaRsQ5WSdGQDCj2q/Z7fmgG2SX3kFoOhCTEgKahDc5jDIo2vQ==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr19977292wmh.155.1583141962345; 
 Mon, 02 Mar 2020 01:39:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q3sm25876359wrs.1.2020.03.02.01.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 01:39:21 -0800 (PST)
Date: Mon, 2 Mar 2020 10:39:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200302093919.GD2363188@phenom.ffwll.local>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
 <20200228224504.GA23961@ravnborg.org>
 <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
 <20200229111710.GB3674@ravnborg.org>
 <CAKMK7uEYxM8BAsp+DHUxw+qdE_B3J+ePAxC-j0V+v+J6trffgw@mail.gmail.com>
 <87blpfqffp.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87blpfqffp.fsf@intel.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:22:34AM +0200, Jani Nikula wrote:
> On Sat, 29 Feb 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Sat, Feb 29, 2020 at 12:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >> The header-check infrastructure was dropped again - see:
> >> fcbb8461fd2376ba3782b5b8bd440c929b8e4980
> >
> > Uh I'm disappoint :-/
> 
> To say the least. I thought it was a good *opt-in* feature for whoever
> wanted it. But the part that got the backlash was applying it to
> absolutely everything under include/. And then it got removed
> altogether. From one extreme to the other. Nuts.
> 
> > Adding Jani in case he missed this too. I guess maybe we should
> > resurrect it for drm again (and with a file pattern starting in a
> > .dot).
> 
> We have a local implementation in i915/Makefile again. It uses 'find' to
> find the headers which is fine in i915, but the parameters need to be
> adjusted for drm to not be recursive. -maxdepth 1 or something. Also
> need to add another local config option. Sad trombone.

Splitting this up into two threads.

Could we extend this to drm headers again too? Sad thrombones indeed, but
at least here we could still the proper fanfares ... Maybe something like
have the Makefile snippet in drivers/gpu and then keep a list of
directories (or file glob patterns probably better) in there that it
should check.

I really liked this entire idea very much.

Oh also maybe switch the temp files over to dotfiles, so Linus doesn't get
upset (which really I think is all  that Linus expected, but I guess
people just panic and revert).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
