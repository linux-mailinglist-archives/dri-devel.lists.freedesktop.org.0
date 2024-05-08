Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F68BF8A1
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41AE1134C3;
	Wed,  8 May 2024 08:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MINhatYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6884A1134C4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:36:12 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a599b74fd49so102015166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715157370; x=1715762170; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J7aS9he7xY72nZNIRe7yyrnZe3tp43pBLnMfxlD1rnU=;
 b=MINhatYQcoPO9i399oLB3SsVCSGxk+ajNC3MVWmp74TTzbyu9mdk9Bgc5TnFVqqlSS
 b1nILTn9ueLR2TwDBUDjbI3sQQ7TRhrEdmGlfEmHLiOYYzhe0B3t1nVKHgvoLODF8Cm3
 GiOtWMqqXOHGw5rrURfjE5NpjYSGR0fDFawts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715157370; x=1715762170;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7aS9he7xY72nZNIRe7yyrnZe3tp43pBLnMfxlD1rnU=;
 b=pPRDr9Aaz5hMR7IWCx1bCC91H6u4ZjVwkGzgf8Xjbvyh1ZgZTtz+CfGFZx/znHL1xe
 EGg9YcyNyqMFBxMRPOaPhp1ZHEEgTw1z4KoLrAoRhharKKf+VpUaMbNMWfjv8zL7COl6
 DzC7JjHIihgjJ2T/A+Pg83Jvf2WblJKPaERS5BKs1zhKgD2a2SNJbfyXGTPG96h3K3YV
 QflnSYQI+sWfFDwRqOghpUXggu4vXAzcO6yZvIhlSzoRq8MIc1sAjOH9PvNfj4cTwMtI
 DijA6blqL3bB9LVxNtpDjFFdPAID8aFD/OCpXcHtYujEDEvu384pkmqHQ/5nfykXVXtV
 aqUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlIocjW//dUvyrYf5URw/UfFXnx5J1FxyCTpmK0WOn3cpMP13fiWfdcnJ9+pOT293HhAh1XH2WJEC9p/0rUYij7yycOMwhleqQQCpdEKN9
X-Gm-Message-State: AOJu0Yw3UkD9ksjThIJTWYcENNZy/GpT7lRWrKSihpXqBLz10yoUZVgi
 vvc2/dbBIb//cfj7/rCnLe8sC+X2MI2Kr6XxrUgP0QgLltsqKZ9qrAks7jFRwuc=
X-Google-Smtp-Source: AGHT+IH9OKR3iRdAQokCHL9Wcm9g2S3grKMxIcHFTiTEbekRGm3HeABSdlBjlaSiS4k5yg1zHyrUcA==
X-Received: by 2002:a17:906:3113:b0:a59:c46b:c524 with SMTP id
 a640c23a62f3a-a59fb7107bcmr140268666b.0.1715157370636; 
 Wed, 08 May 2024 01:36:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gc21-20020a170906c8d500b00a59a7bac0easm5214354ejb.164.2024.05.08.01.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:36:10 -0700 (PDT)
Date: Wed, 8 May 2024 10:36:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
Mail-Followup-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
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

On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 07 mai 2024 à 21:36 +0300, Laurent Pinchart a écrit :
> > Shorter term, we have a problem to solve, and the best option we have
> > found so far is to rely on dma-buf heaps as a backend for the frame
> > buffer allocatro helper in libcamera for the use case described above.
> > This won't work in 100% of the cases, clearly. It's a stop-gap measure
> > until we can do better.
> 
> Considering the security concerned raised on this thread with dmabuf heap
> allocation not be restricted by quotas, you'd get what you want quickly with
> memfd + udmabuf instead (which is accounted already).
> 
> It was raised that distro don't enable udmabuf, but as stated there by Hans, in
> any cases distro needs to take action to make the softISP works. This
> alternative is easy and does not interfere in anyway with your future plan or
> the libcamera API. You could even have both dmabuf heap (for Raspbian) and the
> safer memfd+udmabuf for the distro with security concerns.
> 
> And for the long term plan, we can certainly get closer by fixing that issue
> with accounting. This issue also applied to v4l2 io-ops, so it would be nice to
> find common set of helpers to fix these exporters.

Yeah if this is just for softisp, then memfd + udmabuf is also what I was
about to suggest. Not just as a stopgap, but as the real official thing.

udmabuf does kinda allow you to pin memory, but we can easily fix that by
adding the right accounting and then either let mlock rlimits or cgroups
kernel memory limits enforce good behavior.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
