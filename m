Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBB65EE7D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECC110E73D;
	Thu,  5 Jan 2023 14:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CCB10E73C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:13:10 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1412546wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CB2U7ORZQVHJP3U1BCVrtj9HL03d/PHb9pMKz75PlHg=;
 b=RHHOrw9xp7HL6GUNzWrsj6zyIE9owN/2dNyt3wyevxnWYIZIw5uB2FXvME9IpYI8L1
 ASkcg+mV17TGOMgvPoOiNCr5CgExiTzd0ues1wdeq871q4vK5ERXVGKu7jx5j6x+aXt6
 1ujUsOSxdzLdhEEqSk7VdwVgGvMqGXZoOpEF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CB2U7ORZQVHJP3U1BCVrtj9HL03d/PHb9pMKz75PlHg=;
 b=gaGlgM0VA4kLfgGAq8pgTn/KcFEQKDCGo0fiR++80gJx4ZWEedJUOl0T2CXC8CT5tk
 owmROr0XX4tPtPoXdZxU36MiWF3lV/ayfda91CzKmb5lVLYRfsCWUbsCq/7HW0Po9PXm
 PxnYAOeB3aRiXK3w2TQJV2/OnI18lmtpTp09eu12mcFmF0HiZ8ETc6/R8ed8TN+RPhWn
 qiVIZ1NqMJpz+tsu8SuBu3m1HwC2FoRxFn7D4C7hPk2H2muwTajmZ9On+dZfu9i8fmUW
 glD6O8qcIL8lYUeXLbdsY9T1cXInQ6oDPp0AVSHR4iE8nbRxeW/DutWrXxZZ2Wfnid7Y
 1Eag==
X-Gm-Message-State: AFqh2kqsVIKmOngMIr/g5kAbJfAjovww5sv/LNOFSdPhZSSluesZB0SX
 OMnhtKj7sOLQIJBkWhyK2Rf2eQ==
X-Google-Smtp-Source: AMrXdXvINDy/5jLvnWu/NUbKioDgIWciak2qulB+4kX9Ryqb8u07bvx0IKJl2xqsy1dTv5gzkdF5jA==
X-Received: by 2002:a05:600c:42d4:b0:3d0:6d39:c62e with SMTP id
 j20-20020a05600c42d400b003d06d39c62emr37036652wme.12.1672927989063; 
 Thu, 05 Jan 2023 06:13:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm2596986wmb.14.2023.01.05.06.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:13:07 -0800 (PST)
Date: Thu, 5 Jan 2023 15:13:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version
 of xchg
Message-ID: <Y7ba8UlkhjpJI4F0@phenom.ffwll.local>
Mail-Followup-To: David Laight <David.Laight@aculab.com>,
 'Jani Nikula' <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <f58ab17e5c6c4a4e8b0d687b44618c51@AcuMS.aculab.com>
 <Y7bK8drngH/NIlOa@phenom.ffwll.local> <875ydlw1p4.fsf@intel.com>
 <733cd0037bd14a269b54d701e1b80323@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <733cd0037bd14a269b54d701e1b80323@AcuMS.aculab.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: 'Andrzej Hajda' <andrzej.hajda@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 01:34:33PM +0000, David Laight wrote:
> From: Jani Nikula
> > Sent: 05 January 2023 13:28
> > 
> > On Thu, 05 Jan 2023, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Mon, Dec 12, 2022 at 09:38:12AM +0000, David Laight wrote:
> > >> From: Andrzej Hajda <andrzej.hajda@intel.com>
> > >> > Sent: 09 December 2022 15:49
> > >> >
> > >> > The pattern of setting variable with new value and returning old
> > >> > one is very common in kernel. Usually atomicity of the operation
> > >> > is not required, so xchg seems to be suboptimal and confusing in
> > >> > such cases. Since name xchg is already in use and __xchg is used
> > >> > in architecture code, proposition is to name the macro exchange.
> > >>
> > >> Dunno, if it is non-atomic then two separate assignment statements
> > >> is decidedly more obvious and needs less brain cells to process.
> > >> Otherwise someone will assume 'something clever' is going on
> > >> and the operation is atomic.
> > >
> > > Yes, this also my take. The i915 code that uses this to excess is decidely
> > > unreadable imo, and the macro should simply be replaced by open-coded
> > > versions.
> > >
> > > Not moved into shared headers where even more people can play funny games
> > > with it.
> > 
> > My stand in i915 has been that the local fetch_and_zero() needs to
> > go. Either replaced by a common helper in core kernel headers, or open
> > coded, I personally don't care, but the local version can't stay.
> > 
> > My rationale has been that fetch_and_zero() looks atomic and looks like
> > it comes from shared headers, but it's neither. It's deceptive. It
> > started small and harmless, but things like this just proliferate and
> > get copy-pasted all over the place.

Yeah the entire "is it atomic or not" is the issue on top here.

> > So here we are, with Andrzej looking to add the common helper. And the
> > same concerns crop up. What should it be called to make it clear that
> > it's not atomic? Is that possible?
> 
> old_value = read_write(variable, new_value);
> 
> But two statements are much clearer.

Yeah this is my point for fetch_and_zero or any of the other proposals.
We're essentially replacing these two lines:

	var = some->pointer->chase;
	some->pointer->chase = NULL;

with a macro. C is verbose, and sometimes painfully so, if the pointer
chase is really to onerous then I think that should be refactored with a
meaningfully locally name variable, not fancy macros wrapped around to
golf a few characters away.

But what about swap() you ask? That one needs a temp variable, and it does
make sense to hide that in a ({}) block in a macro. But for the above two
lines I really don't see a point outside of obfuscated C contexts.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
