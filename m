Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210D18CDDCD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 01:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E272610F5CC;
	Thu, 23 May 2024 23:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="e8bQxBIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8A210F5C6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 23:49:42 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6f8edddf756so276093b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 16:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716508182; x=1717112982;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KKTIZMa0JmE85/sUgVCxEijPsc7zQZf0OwmT+68PNCE=;
 b=e8bQxBIyY3QZkHTgIkCg/cLMBQ0KSFULEEhR9U7zcOboQLIOe+zPbIWiGQL01FFRaw
 cSDdbHjY7pyeDuVrvZ/YlKDyvnhvzPB97dZKqAmN8dKnb2nmKxK2GqIqWvdZtbl0kiXG
 yFVaCAg/0qSbrQSefHw8qUZ5ZURivhzZz4AGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716508182; x=1717112982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKTIZMa0JmE85/sUgVCxEijPsc7zQZf0OwmT+68PNCE=;
 b=vVbDWNYMtSf/acBJIEUPlSKbiJk9IhT4o/IOFCVfupf3n6TqH5OxhvC5SBizb5BaFZ
 27e7WPGF2//2HbAydjselkHa6fJcMRZZOyMDObjNG5awfXrAapbiAf3NEoVOBU3ZjjvO
 4HI64ZzkwZcX/biXqNTwdHwPjNMeDDra/xwe8XRRLbq1Vcw4Iz6P8OyCLTsUHRE44J4N
 vIi/1X0J3GeXHdBjOP/M/p7LuXb+PfWtijj+3QYAJI7XeQTV8G8eSCDcAZwyYUKedk6v
 zl0E+kXx09CVQ1YN5Rix9b1Zh07eh77M0AgjpPH2Cl45pN6pui+CBPTeDOsw78pdogga
 QPEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTPBGPPb+MbAO4RqtG3KolvMPFDdsOJnh/e0VER581AVqfDhJpKuuyek6ERY3yNELTU0pog7srq3Mq+pn+wsiBX88ydfvOfhiY298dWAjH
X-Gm-Message-State: AOJu0Yx4LHVifbiVi0kx49pCVTT9gysy8feWvvweKW8jvNGUWYDn9XCu
 /a2DtSLtjAzHZC5s6ekhhHWFUb2NAXp5+O5naLQAa5cxrsex6hMD6cTHhh+upQ==
X-Google-Smtp-Source: AGHT+IFwvaz7ljpkZVWoJ+KTTMMV23j/7/cYcbQaB2Rxkr6SF9rWXWdFPABprUFsD+c6NWHnigpUDA==
X-Received: by 2002:a05:6a00:4405:b0:6f8:e998:3c5c with SMTP id
 d2e1a72fcca58-6f8f4192fd7mr943315b3a.34.1716508181680; 
 Thu, 23 May 2024 16:49:41 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fc36e649sm162910b3a.95.2024.05.23.16.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 16:49:41 -0700 (PDT)
Date: Thu, 23 May 2024 16:49:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 kernel test robot <oliver.sang@intel.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: 2 GiB of relocations ought to be enough for
 anybody*
Message-ID: <202405231649.C7C39A2@keescook>
References: <20240521101201.18978-1-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521101201.18978-1-tursulin@igalia.com>
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

On Tue, May 21, 2024 at 11:12:01AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Kernel test robot reports i915 can hit a warn in kvmalloc_node which has
> a purpose of dissalowing crazy size kernel allocations. This was added in
> 7661809d493b ("mm: don't allow oversized kvmalloc() calls"):
> 
>        /* Don't even allow crazy sizes */
>        if (WARN_ON_ONCE(size > INT_MAX))
>                return NULL;
> 
> This would be kind of okay since i915 at one point dropped the need for
> making a shadow copy of the relocation list, but then it got re-added in
> fd1500fcd442 ("Revert "drm/i915/gem: Drop relocation slowpath".") a year
> after Linus added the above warning.
> 
> It is plausible that the issue was not seen until now because to trigger
> gem_exec_reloc test requires a combination of an relatively older
> generation hardware but with at least 8GiB of RAM installed. Probably even
> more depending on runtime checks.
> 
> Lets cap what we allow userspace to pass in using the matching limit.
> There should be no issue for real userspace since we are talking about
> "crazy" number of relocations which have no practical purpose.
> 
> *) Well IGT tests might get upset but they can be easily adjusted.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Thanks for fixing this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
