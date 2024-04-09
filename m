Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1689D35B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 09:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE32112B36;
	Tue,  9 Apr 2024 07:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKQxsUBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715A10E5DE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 07:37:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a51d05c50b2so254440166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712648256; x=1713253056; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=oeZX37alwhVBm66iueJmj96zOvfZbQdgLcxSPkunHuE=;
 b=hKQxsUBE3Rss53dJK11Hy8HYlhyFNRSIL8BEvWAx9+H8jI6g715hov9ETVHan7cj0d
 NOnEz1y7OTGXQzW24GDQCpANdDYeXhN6D7e7hmrgswiY5rnZEiP4n+1EMavHiBFd0zl+
 HL6IbYYDIJM7wCS/NxHX0G90+YdMfPZIswWIMXUkNJbGyUJ5KlI803xCfbQiEoLbIRnc
 Fs7bqSvRvCt3lf/R/P7eO7Zz+04oxCihrfG8VyTlnapVoXHkXBi7XxYEiiK4pDFWwzZP
 PyRJbAlLczArdTI+DxPTH9GJfVmnYBR10ZPJEJsaragwGvuHelpSdN8m2mVL32FVnhN9
 zTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712648256; x=1713253056;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oeZX37alwhVBm66iueJmj96zOvfZbQdgLcxSPkunHuE=;
 b=O8unUSCDfoMHVhHuSsqPrO5cxfLf0GGNJRuZepVBfzayM9u+1GXtxpu9c2XYBS2sm8
 08ofrTbuNx8/5ql1LWqXiNVzCgxZHXnR5bnunf5WAwB1/O6B9wfJfH6WUIUqiPXzr849
 N34mdcoJkV8OYWqPJv7SZ8nlRBL5UNGDFL4F2VI04qAGrUCuwWpPVb8ETd0dbpI7jv+q
 uf1wK6/J2s5RrIBkcL0Cn532QSZUy4OZDX0v4PDDcZ9mRxrw6mEcQo07Vb832GIms2cj
 FzW9ZOoJH6rkrg6zNc02HVxRhS+jLFjKOUBLIXVUyBHrd8rziIx+a+yLfrc5ETyJh7Ub
 l5eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUchHP7DjTkCCGWj7HX7votWPrOUcRan2inGTfIXHlBO4OgHFMIhpPMb+PTvkLVLsr0JfqwnVCHNQ+oR98VXDc+YhXZhFn/MDspylZY4Zr5
X-Gm-Message-State: AOJu0YzJZ1ZNkRVIlxXSH41vzRk85yNnpyrFCIieDPyg8jPOaX/lem+Z
 FW5fA8XJtzjHtYRDXcZQXrcffrATSTgFzv5ANaCbwEdC/njVGXcD
X-Google-Smtp-Source: AGHT+IGC9u6AdJJdmgz3Ddo1LVoNSbNdizV6+YvEnSzrTXf8auCvZmdmyCV946q1E5gu6YDtorI07Q==
X-Received: by 2002:a17:906:ae4a:b0:a51:b3cb:cdca with SMTP id
 lf10-20020a170906ae4a00b00a51b3cbcdcamr6859147ejb.26.1712648255795; 
 Tue, 09 Apr 2024 00:37:35 -0700 (PDT)
Received: from gmail.com (1F2EF1A5.nat.pool.telekom.hu. [31.46.241.165])
 by smtp.gmail.com with ESMTPSA id
 jw20-20020a170906e95400b00a51c5940247sm3368760ejb.213.2024.04.09.00.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 00:37:35 -0700 (PDT)
Date: Tue, 9 Apr 2024 09:37:32 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>,
 Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] tools/include: Sync uapi/drm/i915_drm.h with the
 kernel sources
Message-ID: <ZhTwPLliHXKPAJUQ@gmail.com>
References: <20240408185520.1550865-1-namhyung@kernel.org>
 <20240408185520.1550865-2-namhyung@kernel.org>
 <874jcb9etk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jcb9etk.fsf@intel.com>
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


* Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Mon, 08 Apr 2024, Namhyung Kim <namhyung@kernel.org> wrote:
> > To pick up changes from:
> >
> >    b112364867499 ("drm/i915: Add GuC submission interface version query")
> >    5cf0fbf763741 ("drm/i915: Add some boring kerneldoc")
> >
> > This should be used to beautify DRM syscall arguments and it addresses
> > these tools/perf build warnings:
> >
> >   Warning: Kernel ABI header differences:
> >     diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
> 
> All these years and I never realized there are header copies
> there. But... why copies?

It's better than all the alternatives we tried so far:

 - Symbolic links and direct #includes: this was the original approach but 
   was pushed back on from the kernel side, when tooling modified the 
   headers and broke them accidentally for kernel builds.

 - Duplicate self-defined ABI headers like glibc: double the maintenance 
   burden, double the chance for mistakes, plus there's no tech-driven 
   notification mechanism to look at new kernel side changes.

What we are doing now is a third option:

 - A software-enforced copy-on-write mechanism of kernel headers to 
   tooling, driven by non-fatal warnings on the tooling side build when 
   kernel headers get modified:

    Warning: Kernel ABI header differences:
      diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
      diff -u tools/include/uapi/linux/fs.h include/uapi/linux/fs.h
      diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
      ...

   The tooling policy is to always pick up the kernel side headers as-is, 
   and integate them into the tooling build. The warnings above serve as a 
   notification to tooling maintainers that there's changes on the kernel 
   side.

We've been using this for many years now, and it might seem hacky, but 
works surprisingly well.

Does this make sense to you?

Thanks,

	Ingo
