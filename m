Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC2858322
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5437010EC43;
	Fri, 16 Feb 2024 16:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SCqHLMjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C1E10EC3F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 16:57:20 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3bc21303a35so770164b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708102639; x=1708707439; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a54mBlPJQ0nr4LxEOnQe6E9J05YCJwMg6dbDW6Ogvwk=;
 b=SCqHLMjovb4SsRFlp7ZuO44arOtB+8C/BbN101rPMDxHXIOOraktu3C/tvxsTob8/1
 6ezDLXgffe42KNWadHP0uLuediN8AeuI0rCHiASzUOF+ToG5NaRs0VaM7K6xEnXTFn6W
 5r16HtH753y0huNElcX67CPFnHFyVoJm4Bys0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708102639; x=1708707439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a54mBlPJQ0nr4LxEOnQe6E9J05YCJwMg6dbDW6Ogvwk=;
 b=REMOGSFmIiAqYM3TduB4fn958AmIKKDCY+dayk0uKaWZsMJmfyxplkLaVPWlT+/L9j
 QFd0RUzrMFs5OsD2z6H8WTYe2ub8AsN8T8EK39XentgogTKRWYl47qjLQM/+dAwAHI6g
 URCsqC/3XAFWtfRjiTNTAIVskJpb0OpDqqumBdaDiJMeqCx3HmfuPHHtPQ+RzHf4uvXJ
 LhG1arGm0Y658M5c0Jbx16RaoYkqHPWMezRD062p0LQ/xl2f3xjXOdwt/PUqV9vUX1Ak
 Ntgy9KR8ladAi7ujOkC/65n1oSfOLG4lIbsmNtdoGxYSHEHjZVzPXmWBxukga7BctjwO
 HpCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR7s5PpgY/e/unhDuCCpMm/OCsFfYk7D2bWnTUQavN+H/EVaqYwH1mItB62TJu1PCgM1NMKdMCIGx4/upAi0cdKSVDbtGk8aWcPExuh4hc
X-Gm-Message-State: AOJu0YwingOUAUqax467kv8DbPldxpG5/dzV5Qa42V9f4jJ7uZHRSxPk
 N2CqhsnTR34/ILvNVGCrJuzjvx6XcRFs8ZBwc6Dpp629/L+bdayY3BvuZHhYGXsYmbL1gNeCEU6
 GhBs3tei/jwR2yJTtqrbDW/0Ese+PKsAhkYIFzQ==
X-Google-Smtp-Source: AGHT+IFZi9RDzwhwyq7Vgbb6tf8+xOs817Ulf+ClWV8voToU7JWM1HF+f6JVnrAvqqhyZKtEyjz2rl5PGCwyv6GOjVw=
X-Received: by 2002:a05:6870:b528:b0:21e:3794:9e24 with SMTP id
 v40-20020a056870b52800b0021e37949e24mr5556668oap.3.1708102639106; Fri, 16 Feb
 2024 08:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
 <ba987da3-b4aa-410c-95ae-434e94793d85@arm.com>
In-Reply-To: <ba987da3-b4aa-410c-95ae-434e94793d85@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Feb 2024 17:57:07 +0100
Message-ID: <CAKMK7uH=QKSyMgsOYCHMwE7iv6jQZRwUMcKq=HiXsBXBCv5BCQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] Always record job cycle and timestamp information
To: Steven Price <steven.price@arm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 14, 2024 at 01:52:05PM +0000, Steven Price wrote:
> Hi Adri=C3=A1n,
>
> On 14/02/2024 12:14, Adri=C3=A1n Larumbe wrote:
> > A driver user expressed interest in being able to access engine usage s=
tats
> > through fdinfo when debugfs is not built into their kernel. In the curr=
ent
> > implementation, this wasn't possible, because it was assumed even for
> > inflight jobs enabling the cycle counter and timestamp registers would
> > incur in additional power consumption, so both were kept disabled until
> > toggled through debugfs.
> >
> > A second read of the TRM made me think otherwise, but this is something
> > that would be best clarified by someone from ARM's side.
>
> I'm afraid I can't give a definitive answer. This will probably vary
> depending on implementation. The command register enables/disables
> "propagation" of the cycle/timestamp values. This propagation will cost
> some power (gates are getting toggled) but whether that power is
> completely in the noise of the GPU as a whole I can't say.
>
> The out-of-tree kbase driver only enables the counters for jobs
> explicitly marked (BASE_JD_REQ_PERMON) or due to an explicit connection
> from a profiler.
>
> I'd be happier moving the debugfs file to sysfs rather than assuming
> that the power consumption is small enough for all platforms.
>
> Ideally we'd have some sort of kernel interface for a profiler to inform
> the kernel what it is interested in, but I can't immediately see how to
> make that useful across different drivers. kbase's profiling support is
> great with our profiling tools, but there's a very strong connection
> between the two.

Yeah I'm not sure whether a magic (worse probably per-driver massively
different) file in sysfs is needed to enable gpu perf monitoring stats in
fdinfo.

I get that we do have a bit a gap because the linux perf pmu stuff is
global, and you want per-process, and there's kinda no per-process support
for perf stats for devices. But that's probably the direction we want to
go, not so much fdinfo. At least for hardware performance counters and
things like that.

Iirc the i915 pmu support had some integration for per-process support,
you might want to chat with Tvrtko for kernel side and Lionel for more
userspace side. At least if I'm not making a complete mess and my memory
is vaguely related to reality. Adding them both.

Cheers, Sima


>
> Steve
>
> > Adri=C3=A1n Larumbe (1):
> >   drm/panfrost: Always record job cycle and timestamp information
> >
> >  drivers/gpu/drm/panfrost/Makefile           |  2 --
> >  drivers/gpu/drm/panfrost/panfrost_debugfs.c | 21 ------------------
> >  drivers/gpu/drm/panfrost/panfrost_debugfs.h | 14 ------------
> >  drivers/gpu/drm/panfrost/panfrost_device.h  |  1 -
> >  drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 -----
> >  drivers/gpu/drm/panfrost/panfrost_job.c     | 24 ++++++++-------------
> >  drivers/gpu/drm/panfrost/panfrost_job.h     |  1 -
> >  7 files changed, 9 insertions(+), 59 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
> >  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
> >
> >
> > base-commit: 6b1f93ea345947c94bf3a7a6e668a2acfd310918
>

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
