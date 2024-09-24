Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C21984306
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241E10E6AD;
	Tue, 24 Sep 2024 10:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WYYMw28W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62C410E6AD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:06:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so7099042a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727172391; x=1727777191; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eDD1S5nlO1CXzwvB4ji+65j5J/BztHtz4bGD3A6G45I=;
 b=WYYMw28Wn7WoBX0WoplFORmVy0D8cAch1Kpmsp2HvrNjPxKzgne3T8kAkZqwu1baIz
 jnY7g/6swtRs/uQVvbzqW0K7I1X7Sa7FLjzcBfmhANlcpL8TB48B1SkMlfyjiYfTVww7
 JLKNyPkOdZDmoR0y44Vm9yegSInn5PUnFn6EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727172391; x=1727777191;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDD1S5nlO1CXzwvB4ji+65j5J/BztHtz4bGD3A6G45I=;
 b=rBEfM328zvuHNTqoSsZ1AhKDjgUXmid+p4TDdQ1kQ/ie2kycU7ffyjym1je8zCRZ4t
 oEqp+Gv+IlHjUjFoef9HaaNax46InrapkK7VeAawXzKTLIY4teddho4t4J8krBDEkHfd
 lgb/aQcMuTrdY5S2zrKadWO9y789X7dfyhsZ+wETCH1/mS6k+jrAfZFEF/HEY5hGI/KR
 a9mflUej6HezglC7kih/KA6ItY3xbchkLwaCr5F9zI9+WjpsDNSHpfST1nZb03Urkui+
 2QWSntKaRqSrj6NAjDFUTGqgTG4TNDYbR3CKh/aXD9MYgWchcrSB+cDYTruwNBgIaUTy
 w5Dg==
X-Gm-Message-State: AOJu0YwXp8ZTWcYRVDm2XO6+YuPqQcqFdC+KI2djnoo8fYfHG5LmTAxP
 050VsuXiQGRAcuagk1ZIh9HVu/ZHxjyUERAq1m1gBEKH/r6KwI4i8sBrZcYpJmww+rP6XeI3ksF
 k
X-Google-Smtp-Source: AGHT+IFo3ilPbqgDfq/DGleei74Oeqsyw5ng45qCATU2/WJbCw4dQY4/O4LRiibIAD1UxoCH/oa8ZQ==
X-Received: by 2002:a17:907:e25b:b0:a8a:91d1:5262 with SMTP id
 a640c23a62f3a-a90d56afa53mr1342398066b.28.1727172391072; 
 Tue, 24 Sep 2024 03:06:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f347fdsm66589266b.16.2024.09.24.03.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:06:30 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:06:28 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
Message-ID: <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
References: <cover.1726594684.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1726594684.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Tue, Sep 17, 2024 at 08:43:50PM +0300, Jani Nikula wrote:
> The tests consistently trigger WARNs in drm_framebuffer code. I'm not
> sure what the point is with type of belts and suspenders tests. The
> warnings *are* the way to flag erroneous API usage.
> 
> Warnings in turn trigger failures in CI. Filtering the warnings are
> error prone, and, crucially, would also filter actual errors in case the
> kunit tests are not run.
> 
> I acknowledge there may be complex test cases where you'd end up
> triggering warnings somewhere deep, but these are not it. These are
> simple.
> 
> Revert the tests, back to the drawing board.

Yeah I think long-term we might want a kunit framework so that we can
catch dmesg warnings we expect and test for those, without those warnings
actually going to dmesg. Similar to how the lockdep tests also reroute
locking validation, so that the expected positive tests don't wreak
lockdep for real.

But until that exists, we can't have tests that splat in dmesg when they
work as intended.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

> 
> BR,
> Jani.
> 
> 
> Cc: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> 
> Jani Nikula (2):
>   Revert "drm/tests: Add test for drm_framebuffer_free()"
>   Revert "drm/tests: Add test for drm_framebuffer_init()"
> 
>  drivers/gpu/drm/drm_framebuffer.c            |   1 -
>  drivers/gpu/drm/drm_mode_object.c            |   1 -
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 134 -------------------
>  3 files changed, 136 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
