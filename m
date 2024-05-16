Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B448C74E5
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87D910E49E;
	Thu, 16 May 2024 10:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YdyfVuO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A710310E49E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:56:32 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e20a4e9d96so14211fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715856990; x=1716461790; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CYCaZIYD32X8OWqTmuj/FbQa01MUdFxdF5XvoFGLFW0=;
 b=YdyfVuO7PbnD9gnljtOHclGKXgS8cmUQbcZMJxy07AcJdA+0ZI+79WmO7uzBnxrNo2
 hXOebKr40q3y6srSyCDAkhpIfr56GdZbm8MUis9k9IAz2qjmti550ko+8V12cLKtqRVL
 h4xHGmLZGS/jVkcLiWUwFqoSVe5HytRC2J+q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715856990; x=1716461790;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CYCaZIYD32X8OWqTmuj/FbQa01MUdFxdF5XvoFGLFW0=;
 b=lLK1xjjlkCWjXFwwFDb+RZ1s+XP9xJcHZ0y2bEPrhv8WjKo5J/nTfL2WH2Efz5AUr+
 uAiyIUUPoxbDE2ybImuU9jWi5QZ/IFTEPcymUWVNvwFaW4wRamQrR0VyQyRVO2AbmN3x
 zR84Vd0U+TXnzcgrIFtmkZspd1qoFxXgdmEPdlev29GPAuGvHlbpRYWnsrZSnBOFNZED
 ZgJLr/VoqMIWw/aOC5RwXUEOvS6rNZEIHo9APh+GFATynG/UjhK+g2+6cSCNLczQU/aV
 UmkyjW/IdDLDsq2/ue5smrY0euTI1OggIYTGw6tHohb/xY4PPHvVBgniOIZRU2Ukihn5
 3B8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdbv642joriiuN8Cv4eL72KcuHkCymFvV5HVXxPNzx25gG1EwH7S6AUwXK2AyXY5El9fDsPM+x9DZi0hKZHkjPAPYayfnniO/R11MCxnP0
X-Gm-Message-State: AOJu0YzmODTQNsxlYFdCKdEEGaWRtFUkc4n5PO7MH3Lo/KEZ7CclC5hW
 MG3HfhZdKA+E+f6K1RtKBPfphwZdpTlRh5Ql4aDot+NkHZq003Au/PRYth5jWOg=
X-Google-Smtp-Source: AGHT+IEjj4yl40IXE4RuRX4OV/v0GH5bFkfz02Pq4c/NaDR61cTtFuwAhcTUObONlIdIlDgvDa0lTA==
X-Received: by 2002:a2e:9b8b:0:b0:2e2:1647:8308 with SMTP id
 38308e7fff4ca-2e51fd4b33emr121987831fa.2.1715856990407; 
 Thu, 16 May 2024 03:56:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351c6f295e2sm6725490f8f.39.2024.05.16.03.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 03:56:29 -0700 (PDT)
Date: Thu, 16 May 2024 12:56:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <jstultz@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
Mail-Followup-To: John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> On Wed, May 15, 2024 at 6:57 AM Maxime Ripard <mripard@kernel.org> wrote:
> > This series is the follow-up of the discussion that John and I had a few
> > months ago here:
> >
> > https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com/
> >
> > The initial problem we were discussing was that I'm currently working on
> > a platform which has a memory layout with ECC enabled. However, enabling
> > the ECC has a number of drawbacks on that platform: lower performance,
> > increased memory usage, etc. So for things like framebuffers, the
> > trade-off isn't great and thus there's a memory region with ECC disabled
> > to allocate from for such use cases.
> >
> > After a suggestion from John, I chose to start using heap allocations
> > flags to allow for userspace to ask for a particular ECC setup. This is
> > then backed by a new heap type that runs from reserved memory chunks
> > flagged as such, and the existing DT properties to specify the ECC
> > properties.
> >
> > We could also easily extend this mechanism to support more flags, or
> > through a new ioctl to discover which flags a given heap supports.
> 
> Hey! Thanks for sending this along! I'm eager to see more heap related
> work being done upstream.
> 
> The only thing that makes me a bit hesitant, is the introduction of
> allocation flags (as opposed to a uniquely specified/named "ecc"
> heap).
> 
> We did talk about this earlier, and my earlier press that only if the
> ECC flag was general enough to apply to the majority of heaps then it
> makes sense as a flag, and your patch here does apply it to all the
> heaps. So I don't have an objection.
> 
> But it makes me a little nervous to add a new generic allocation flag
> for a feature most hardware doesn't support (yet, at least). So it's
> hard to weigh how common the actual usage will be across all the
> heaps.
> 
> I apologize as my worry is mostly born out of seeing vendors really
> push opaque feature flags in their old ion heaps, so in providing a
> flags argument, it was mostly intended as an escape hatch for
> obviously common attributes. So having the first be something that
> seems reasonable, but isn't actually that common makes me fret some.
> 
> So again, not an objection, just something for folks to stew on to
> make sure this is really the right approach.

Another good reason to go with full heap names instead of opaque flags on
existing heaps is that with the former we can use symlinks in sysfs to
specify heaps, with the latter we need a new idea. We haven't yet gotten
around to implement this anywhere, but it's been in the dma-buf/heap todo
since forever, and I like it as a design approach. So would be a good idea
to not toss it. With that display would have symlinks to cma-ecc and cma,
and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
SoC where the display needs contig memory for scanout.

> Another thing to discuss, that I didn't see in your mail: Do we have
> an open-source user of this new flag?

I think one option might be to just start using these internally, but not
sure the dma-api would understand a fallback cadence of allocators (afaik
you can specify specific cma regions already, but that doesn't really
covere the case where you can fall back to pages and iommu to remap to
contig dma space) ... And I don't think abandonding the dma-api for
allocating cma buffers is going to be a popular proposal.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
