Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBEA8CADEF
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A240210EB88;
	Tue, 21 May 2024 12:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PDYEXjZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569C10EB88
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:12:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5238a0486baso617012e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716293539; x=1716898339; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OxZi2jUdCHohJh9CFW9THnvKlpXtvUSrWlAxZCRE9qw=;
 b=PDYEXjZ2tdT4JDzXYYrkpVADLbPmha3xAkGkkKb3SeFWiCfTM8ww3uwcOwuphRsTmg
 FAfAh16M0CtvOMPo/w/7UWkUu/uE+sPzVh5IJXyL9Zf18g5oAtVusYoFkGqY8orQmkAi
 YgBzvarxdW5M6f8tNnAN6dG1aXqIjvP9z5sFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716293539; x=1716898339;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OxZi2jUdCHohJh9CFW9THnvKlpXtvUSrWlAxZCRE9qw=;
 b=cw60NzDIX1iL5nDPmDo7Mka/hqk/ySTlYTUjzeWJKNTz/6w5zCX9EIgD/+23Tu6md2
 ZCyyYjY/SsNAJuOPXg7X4EHK+J3fG/3pEzveaIPL7EEWOGet8luNF+tnLDo7ggQ6jCws
 XUHkvVodrpAspdJpDkgX0rI70shK8Z0CaJNkZCERJ1/E2JNtzkdd4EAQWUWBQDq9PKqF
 9OpjktCLy4iT2ENz9t+gyaijXLyhSkW2lxl5roMYgOHsVI6w6kuNGJ2u4pcv1GSKQB9N
 90oOj27SY/wVVLDx7I771NjFwB/6zH9tylulwCp3DR6QzadP3O3ZYz5CK3rrSA+DMm8/
 VTlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBTxno0BDMZbbJ61tWIMB9ub95SsrVaj0i1b6arGAwFd3yA3mmKFr1JqMBxq/+47GDilG9Y4l3n6jQy+vgPUemQrMn/JQX3MkY1faVPGqS
X-Gm-Message-State: AOJu0YxF85EA91MLayWXo5eyZi8ZVTZgNGMc2tRd4AJjfkE47amYqdqB
 +li/6iJ4InBSW7Q4mQWU6QHrs1gj9UnlxcjTavE01GwPCi1J7MeHpP5T26SjTjE=
X-Google-Smtp-Source: AGHT+IGRVhJKirVdP7yNCwkTehT+08uY6+K3fghXr0eHR1c/ui/sugCNgXZoZpMkjkoJQGkc0hNdyA==
X-Received: by 2002:a19:f604:0:b0:51f:d82:8e07 with SMTP id
 2adb3069b0e04-5220ff72b4cmr14733108e87.2.1716293539571; 
 Tue, 21 May 2024 05:12:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a615e5c1a3asm276777266b.71.2024.05.21.05.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 05:12:18 -0700 (PDT)
Date: Tue, 21 May 2024 14:12:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Oded Gabbay <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>,
 Lucas Stach <l.stach@pengutronix.de>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: DRM Accel BoF at Linux Plumbers
Message-ID: <ZkyPoIXBeBUqFJ48@phenom.ffwll.local>
Mail-Followup-To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Oded Gabbay <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
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

On Sat, May 18, 2024 at 10:46:01AM +0200, Tomeu Vizoso wrote:
> Hi,
> 
> I would like to use the chance at the next Plumbers to discuss the
> present challenges related to ML accelerators in mainline.
> 
> I'm myself more oriented towards edge-oriented deployments, and don't
> know enough about how these accelerators are being used in the cloud
> (and maybe desktop?) to tell if there is enough overlap to warrant a
> common BoF.
> 
> In any case, these are the topics I would like to discuss, some
> probably more relevant to the edge than to the cloud or desktop:
> 
> * What is stopping vendors from mainlining their drivers?
> 
> * How could we make it easier for them?
> 
> * Userspace API: how close are we from a common API that we can ask
> userspace drivers to implement? What can be done to further this goal?
> 
> * Automated testing: DRM CI can be used, but would be good to have a
> common test suite to run there. This is probably dependent on a common
> userspace API.
> 
> * Other shared userspace infrastructure (compiler, execution,
> synchronization, virtualization, ...)
> 
> * Firmware-mediated IP: what should we do about it, if anything?
> 
> * Any standing issues in DRM infra (GEM, gpu scheduler, DMABuf, etc)
> that are hurting accel drivers?
> 
> What do people think, should we have a drivers/accel-wide BoF at
> Plumbers? If so, what other topics should we have in the agenda?

Yeah sounds good, and I'll try to at least attend lpc this year since it's
rather close ... Might be good to explicitly ping teams of merged and
in-flight drivers we have in accel already.

I think the topic list is at least a good starting point.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
