Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176CB8BA45A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 02:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCD611214A;
	Fri,  3 May 2024 00:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U/BTwfdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58310F92B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 00:10:19 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1e3c3aa8938so57489405ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 17:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714695019; x=1715299819;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yvQ96PVcBTjB1DlDAHvZFWsvHSveciEwekt2iZelkZw=;
 b=U/BTwfdPF7ldGAqXvOA1BTDXmxCX8bgMOu83khAFWYw9z0dyf+qoC/rydy6n6NOvK0
 X/p9elHu0R5Xt7Ppk6EtBoeaKxmouYsG7JP1Bzdw8FYZeSj3GVSD8Rm/Gtkk18FGnK33
 CBw9kWbD2L1sonTW2jFd6sW578pmRWEHsY/BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714695019; x=1715299819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvQ96PVcBTjB1DlDAHvZFWsvHSveciEwekt2iZelkZw=;
 b=SLEKWA8lWWj/YBXLKmddFzIN5jgXVoi1YOq8yR4yisEIUwT1fztLQa7OfCI/Q5M4RI
 ffAFk/UWv+mtfWE3thubf7WyQVVWkVKPUnJ9K62Jk2IqHW4aSAHB1+xExlRQXCD6/ro4
 b7de3t83k67pqSIM5h9Z9YSp495LKAJbNCI62HzAfHouG35bcX5yue1Mp8TIp93QOZi9
 GS4hgsGWoc+DLvE746+hRg/7OAL7gc64z2Tz9h3q3DRUSdeX80BQ+pm1JIp6ywjm8mlW
 LgkxgK4Js3KIyS11waQz88YkCAHnwdsq9nKtwynruIjQG3hUKFwTOvf3divXq5sYC54R
 WaSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKcQlHaPqrHPd1odzVc2fQcJmcktdCFxmrxqau44GDH/3NmGylvA8mloJ760kx9LlTxsPi0eyEh3xpevEnrT7Fl/vk/tCEyjZpQDG6qFEZ
X-Gm-Message-State: AOJu0Yx8JA2HRZZPj6Jor1gZ4TBK2d6OoTvDxJ1yZq1OHWz11sV2DZHP
 qcQhEGpqZ8Lyr6Wz4thJi6T2A12fEHPTxIsi1QqKqb995XovauRN0SAHAYT7cA==
X-Google-Smtp-Source: AGHT+IFkLXUnyQMj2OIKX8j+BzYHRt/RqitCOGt4Mqy98jeuCfO60gH63IL3cwkWZr8dM72N35IMEw==
X-Received: by 2002:a17:902:e747:b0:1e3:e380:8724 with SMTP id
 p7-20020a170902e74700b001e3e3808724mr1684558plf.48.1714695018965; 
 Thu, 02 May 2024 17:10:18 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a170902b58c00b001e4881fbec8sm1942415pls.36.2024.05.02.17.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 17:10:18 -0700 (PDT)
Date: Thu, 2 May 2024 17:10:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] fs: Convert struct file::f_count to refcount_long_t
Message-ID: <202405021708.267B02842@keescook>
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-5-keescook@chromium.org>
 <20240502224250.GM2118490@ZenIV> <202405021548.040579B1C@keescook>
 <20240502231228.GN2118490@ZenIV> <202405021620.C8115568@keescook>
 <20240502234152.GP2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502234152.GP2118490@ZenIV>
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

On Fri, May 03, 2024 at 12:41:52AM +0100, Al Viro wrote:
> On Thu, May 02, 2024 at 04:21:13PM -0700, Kees Cook wrote:
> > On Fri, May 03, 2024 at 12:12:28AM +0100, Al Viro wrote:
> > > On Thu, May 02, 2024 at 03:52:21PM -0700, Kees Cook wrote:
> > > 
> > > > As for semantics, what do you mean? Detecting dec-below-zero means we
> > > > catch underflow, and detected inc-from-zero means we catch resurrection
> > > > attempts. In both cases we avoid double-free, but we have already lost
> > > > to a potential dangling reference to a freed struct file. But just
> > > > letting f_count go bad seems dangerous.
> > > 
> > > Detected inc-from-zero can also mean an RCU lookup detecting a descriptor
> > > in the middle of getting closed.  And it's more subtle than that, actually,
> > > thanks to SLAB_TYPESAFE_BY_RCU for struct file.
> > 
> > But isn't that already handled by __get_file_rcu()? i.e. shouldn't it be
> > impossible for a simple get_file() to ever see a 0 f_count under normal
> > conditions?
> 
> For get_file() it is impossible.  The comment about semantics had been
> about the sane ways to recover if such crap gets detected.
> 
> __get_file_rcu() is a separate story - consider the comment in there: 
> 	* atomic_long_inc_not_zero() above provided a full memory
> 	* barrier when we acquired a reference.
>          *
>          * This is paired with the write barrier from assigning to the
>          * __rcu protected file pointer so that if that pointer still
>          * matches the current file, we know we have successfully
>          * acquired a reference to the right file.
> 
> and IIRC, refcount_t is weaker wrt barriers.

I think that was also fixed for refcount_t. I'll need to go dig out the
commit...

But anyway, there needs to be a general "oops I hit 0"-aware form of
get_file(), and it seems like it should just be get_file() itself...

-- 
Kees Cook
