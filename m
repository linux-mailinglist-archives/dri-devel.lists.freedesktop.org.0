Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EB3928682
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4B310E27D;
	Fri,  5 Jul 2024 10:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="h4ng8XnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EA010E27D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:16:03 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-424a3d36c28so1574195e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720174562; x=1720779362; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e8YpnAFKaUJkZ9e7cjGVcNZMSDBPf7SKXmSIIUefUzk=;
 b=h4ng8XnUaYeQVnz00y2r9yRG/s0m/giZMe05BBOl+sh09PHXtoYgvKMnx0HxrHEt2w
 nM4fT+Y188mHaelH+NFh6qICVKERIkBZSkYu3RaSShTXJ2iPilRWxbbTN7YPU53Gm1Kr
 f/++V5U6HKYexiBD4W01sajyKw7aZmf9ORBAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720174562; x=1720779362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8YpnAFKaUJkZ9e7cjGVcNZMSDBPf7SKXmSIIUefUzk=;
 b=pXBHLimUMc4WouEsIw394ns1a5ux1uCXCIDMkN1a1TsLnZO+KE0O/j1xh/5eHgidoF
 6ZIcuDExdbtNV7AyU8sE5yZ2hoFyQbaOz1Tr2l0VlgCy4FfyDsz8Jz/EczCl0uYnWgSs
 VedJkAn/LEpRig1Y8c0PyC7E/5uHQTa8KriATqhnhNiMEr6gL3msz/XvLK+rROCkxitA
 ASbUHMnkSMINMQAr59PdkUTpXaPCn83sRRp6mckx4JfKpZTCXDJiK705nUZJpCh+78L5
 a/CPE8FfByBZ5b3OHY5NhGjtrLvF6NDbp+Dh5gL/c+7kzUGEUSfpNmHLlCn14YVSzZl0
 C1TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmwQ6UOjKCC1OeVNzD7FmGVWVhltk1og5xgCd3fnCvdIWoTny/hZnMmLwDQ+pNy8467tORtK0TF683av9437D0uPOuDs4vVynPeSOYx89M
X-Gm-Message-State: AOJu0Yy158Q2N8SkLDhmkp8/N+MVAsSNEGYctcVGke3iUwA0/q31dk5M
 tMenJ67goTmcbyVnN/gjfRXUNaUTONwy2dKhmKPEdV64i/9qKAufCjC/uJCfq0M=
X-Google-Smtp-Source: AGHT+IG5jC8qGYerMEa8mW9vXGn+mmSq/y2dFjrm5VbQTJ28UlrGH1KIdniCNnlSUf5lpbXwmBs8Bw==
X-Received: by 2002:a05:600c:35d2:b0:425:676f:f946 with SMTP id
 5b1f17b1804b1-4264a456e13mr29828265e9.4.1720174562074; 
 Fri, 05 Jul 2024 03:16:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a251ef5sm55535215e9.36.2024.07.05.03.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:16:01 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:15:58 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Tvrtko Ursulin <tursulin@igalia.com>
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
Subject: Re: [PULL] drm-intel-gt-next
Message-ID: <ZofH3gdKKXdg7TV7@phenom.ffwll.local>
References: <ZoZP6mUSergfzFMh@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoZP6mUSergfzFMh@linux>
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

On Thu, Jul 04, 2024 at 07:31:54AM +0000, Tvrtko Ursulin wrote:
> 
> Hi Dave, Sima,
> 
> The final pull for 6.11 is quite small and only contains a handful of
> fixes in areas such as stolen memory probing on ATS-M, GuC priority
> handling, out of memory reporting noise downgrade and fence register
> hanlding race condition reported by CI.
> 
> Regards,
> 
> Tvrtko
> 
> drm-intel-gt-next-2024-07-04:
> Driver Changes:
> 
> Fixes/improvements/new stuff:
> 
> - Downgrade stolen lmem setup warning [gem] (Jonathan Cavitt)
> - Evaluate GuC priority within locks [gt/uc] (Andi Shyti)
> - Fix potential UAF by revoke of fence registers [gt] (Janusz Krzysztofik)
> - Return NULL instead of '0' [gem] (Andi Shyti)
> - Use the correct format specifier for resource_size_t [gem] (Andi Shyti)
> - Suppress oom warning in favour of ENOMEM to userspace [gem] (Nirmoy Das)
> 
> Miscellaneous:
> 
> - Evaluate forcewake usage within locks [gt] (Andi Shyti)
> - Fix typo in comment [gt/uc] (Andi Shyti)
> The following changes since commit 79655e867ad6dfde2734c67c7704c0dd5bf1e777:
> 
>   drm/i915/mtl: Update workaround 14018575942 (2024-06-11 16:06:20 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-07-04
> 
> for you to fetch changes up to 3b85152cb167bd24fe84ceb91b719b5904ca354f:
> 
>   drm/i915/gem: Suppress oom warning in favour of ENOMEM to userspace (2024-06-28 00:11:01 +0200)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> Driver Changes:
> 
> Fixes/improvements/new stuff:
> 
> - Downgrade stolen lmem setup warning [gem] (Jonathan Cavitt)
> - Evaluate GuC priority within locks [gt/uc] (Andi Shyti)
> - Fix potential UAF by revoke of fence registers [gt] (Janusz Krzysztofik)
> - Return NULL instead of '0' [gem] (Andi Shyti)
> - Use the correct format specifier for resource_size_t [gem] (Andi Shyti)
> - Suppress oom warning in favour of ENOMEM to userspace [gem] (Nirmoy Das)
> 
> Miscellaneous:
> 
> - Evaluate forcewake usage within locks [gt] (Andi Shyti)
> - Fix typo in comment [gt/uc] (Andi Shyti)
> 
> ----------------------------------------------------------------
> Andi Shyti (5):
>       drm/i915/gt: debugfs: Evaluate forcewake usage within locks
>       drm/i915/gt/uc: Fix typo in comment
>       drm/i915/gt/uc: Evaluate GuC priority within locks
>       drm/i915/gem: Return NULL instead of '0'
>       drm/i915/gem: Use the correct format specifier for resource_size_t
> 
> Janusz Krzysztofik (1):
>       drm/i915/gt: Fix potential UAF by revoke of fence registers
> 
> Jonathan Cavitt (1):
>       drm/i915/gem: Downgrade stolen lmem setup warning
> 
> Nirmoy Das (1):
>       drm/i915/gem: Suppress oom warning in favour of ENOMEM to userspace
> 
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c        |  8 +++++--
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c      |  1 +
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c     |  4 ++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h       |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 ++++++++++++++---------
>  drivers/gpu/drm/i915/i915_scatterlist.c           |  8 +++----
>  6 files changed, 32 insertions(+), 18 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
