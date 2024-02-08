Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49EF84E4F2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 17:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962C710E976;
	Thu,  8 Feb 2024 16:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Scgo93nB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7263E10E976
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 16:22:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33b3585518eso427682f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 08:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707409330; x=1708014130; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XVYrR1w3vjSLEoScIT9shiLJlnv8SX7Fv2WGLCdbXnE=;
 b=Scgo93nBo+cMS/wKo3zPSTnF6VbESaFOOV0mLk7cDPVcrkgG/QN3KJ95dNPsNKdFJI
 t514yjinLpLjuSY/FT09OoQ5QY5r96hzCZt+cvt+bFOuwmn2QpJqqVYQzw2G68arKnM3
 OqDlKvXtVscTK4Ojf/typDVfGOYc0p6TzTjrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707409330; x=1708014130;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XVYrR1w3vjSLEoScIT9shiLJlnv8SX7Fv2WGLCdbXnE=;
 b=eBeBoKsQYpNK/p+T03gHCn99XKQQvuHhQh/mm7T+5lMB281ejFXjCFeaU+hgCoZsmI
 BkELfLrluJFdTygAbGxp5HBTYkwr3Aqo9fWlGZH+Sv9gspVfftFCbeHlkjJ3QqC1L7A9
 P80kaU2jbvNB2sHylgm55y9rbXaqHGN03qcNSWXO9QmZfIVUHi3xf5J9G4VchQCGRprR
 ahqtYPuYg43QtNJxbX8xvWeu74ZRECTWg2iesZlcL544AdFAhuYFQRkxbyyuVItKN8MH
 KC3gbZyg+9Iaxvxqh7unelUUDpsS7vUelZmKBMwl0PoQbvTXBonvcKZTQg9cS4jCsl/b
 Ub+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW27KuoQMVr5Ierh1Ys8IsthDVWtXAES02L4wWnZJ77JDbXWUBkkuWaMbHFzG8S0Rk7bToL6NtLd7tCn7hZHEw8GNJb43vgnA9b9vqOPOk8
X-Gm-Message-State: AOJu0YzG9yCN8I6NnleGy1yWNXy0AeWZNowoCCPKfUM6QSnrmBIM2f+t
 eD7cn8k/GAcoaneN+iOs1nmD3Pc1CSW2qr871Ldh54XavyZyVCPG9miWof5PQNs=
X-Google-Smtp-Source: AGHT+IEpqehU2sVDFuwgY3aqU5z62RyBh8cI+JrmBZ279PiVdpM2i7TBb2Pa1dZbx27FcKxF6pwGGQ==
X-Received: by 2002:a5d:6a4f:0:b0:33b:48ed:be63 with SMTP id
 t15-20020a5d6a4f000000b0033b48edbe63mr5808547wrw.7.1707409329736; 
 Thu, 08 Feb 2024 08:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFwwJwK6EDEnyQPpTrLL90j2o7JHogJYT55y2wUz3v7seTLZhKVP9jydfNYqgKUYMdFzNnN5B7TaTBqYdiFd8SMoFT1Nd3CC/B+wL6+PSf
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cm20-20020a5d5f54000000b0033b46111d7csm3986258wrb.6.2024.02.08.08.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 08:22:09 -0800 (PST)
Date: Thu, 8 Feb 2024 17:22:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: xe vs amdgpu userptr handling
Message-ID: <ZcT_r8XfXQOmIQWo@phenom.ffwll.local>
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
 <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Wed, Feb 07, 2024 at 08:08:42AM -0300, Maíra Canal wrote:
> Adding another point to this discussion, would it make sense to somehow
> create a generic structure that all drivers, including shmem drivers, could
> use it?


So the issue is a bit that at least the userptr for shmem drivers I've
seen all just use pin_user_pages(FOLL_LONGTERM), which nails the memory in
place and makes it unshrinkable. I think that would be fairly easy to
integrate into shmem helpers, and might already be a win (to catch stuff
like userspace trying to share these). This memory probably should be
accounted against mlock rlimit, but that's an entire different can of
worms.

Going full dynamic cross driver is a lot more infrastructure, because your
command submission path needs to substantially change. I think that only
makes when you have a lot more cross-driver code and not just the bare
minimum buffer helpers, and I think gpuvm might be a good place to fit.
Since that already has the concepts around "prepare this entire vm", and
extending that is a lot more reasonable than building an entire new thing.

I'm on board with Dave and agree that we really shouldn't have a diverse
bouqet of driver specific implementations of all this, but I think
fundamentally we will end up with the above two flavours for various
reasons.

So which userptr do you mean?

Cheers, Sima

> 
> Best Regards,
> - Maíra
> 
> On 2/7/24 03:56, Dave Airlie wrote:
> > I'm just looking over the userptr handling in both drivers, and of
> > course they've chosen different ways to represent things. Again this
> > is a divergence that is just going to get more annoying over time and
> > eventually I'd like to make hmm/userptr driver independent as much as
> > possible, so we get consistent semantics in userspace.
> > 
> > AFAICS the main difference is that amdgpu builds the userptr handling
> > inside a GEM object in the kernel, whereas xe doesn't bother creating
> > a holding object and just handles things directly in the VM binding
> > code.
> > 
> > Is this just different thinking at different times here?
> > like since we have VM BIND in xe, it made sense not to bother creating
> > a gem object for userptrs?
> > or is there some other advantages to going one way or the other?
> > 
> > Dave.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
