Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39478BE6FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ED0112085;
	Tue,  7 May 2024 15:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LHkLJanU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C4C112085
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:09:16 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2e1fa2ff499so46554911fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715094555; x=1715699355; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ApmnaGazi/o+2qAXdIqqO3f0hkV/MV/lnHoUUZ1Ogfk=;
 b=LHkLJanUJAfeovW9rXMgxy+mzhg1aV85/5h4xZUHFscIdvFQPU1S61AM2MsCdQO93q
 I+ANSxzIGODw+TJ7MmD14iw5OQbrm0UzN65EBRVosFCP1yoUGwvSRCD2scZ1ACExUzEc
 Vzh0G8fddx8TYwhqmt8mzcailxnsZeHW+BnN2QgRWmf6qkcZ4mjXjgFuzn7RzVPIB0CO
 giCiGdP8T7JoSNnbMg6/TUwyepJURQ616Xz18pITmePr5FD2AIpjQWBZKucMZju7Z1Q4
 PR75ZBWrVPQIrKK2Nx031l0vv3OONNpuGK2TWypIrTLZCeYRvli7nGGMQ4dUTfb+99LQ
 H9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715094555; x=1715699355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApmnaGazi/o+2qAXdIqqO3f0hkV/MV/lnHoUUZ1Ogfk=;
 b=UYkk+FLpX4sjh40DpE64fUQE/vCtur62dZ769PyhgID2igb2WIBkIXBj4rBcwRpEv5
 qT5zEYk4Zn6v6ZY49u0BNAXv7V0YveQVzOleixG4y0Ptsik4pm1rnNGLA+S3Dejn88MG
 0Tb2XkQTeajIu01BlizeT4JHXz1oAbjgqSM4YNTgR0gTAcKbDGMzzcIPY0ngAOEdLu5s
 0ZPa4XOSG51uD7PQU/s4ARisJVMZlkw7X9GZc2kfSAc/bZRtZR6tutexCUQdNjdOWarJ
 h+c5vDyed7yD722kJGkQ9zZjoSrJgYXAIGE86VoP1BiH7HBN8eZnGerWf/oglV5Xh4kr
 wmEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqBpAtStA3HS1ZAmsbQCKv6wPku97ILdPw5shAO0kvJGRntihFZ9cxsXe8kXwn8hEtAN+cndpfgs/GNvZsPtpWZJ2rq1JiyopHv8HKY9mT
X-Gm-Message-State: AOJu0Ywl6/fVhXjL9wYQTdBESGP9aL6E1o6OD/TTLEPeJsjR6O3ccHNG
 mTG96qPqp4hxQU1XmmJpnwP3XAvxn2NAavBZFus5WSwDCKEhRWV6AfVco3XnfwI=
X-Google-Smtp-Source: AGHT+IFpsJSfGLwS1hXqc0H0trd4MGTiP4vo11gPFrTKC7JHOIUnEb9JodJJuvbqXdQX62FwbtE9XA==
X-Received: by 2002:a2e:9598:0:b0:2e2:3761:2ef5 with SMTP id
 38308e7fff4ca-2e3d956847dmr9646361fa.14.1715094554850; 
 Tue, 07 May 2024 08:09:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a2e8e30000000b002e35b79a00bsm935940ljk.124.2024.05.07.08.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 08:09:14 -0700 (PDT)
Date: Tue, 7 May 2024 18:09:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>, 
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
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

On Tue, May 07, 2024 at 04:34:24PM +0200, Hans de Goede wrote:
> Hi Dmitry,
> 
> On 5/7/24 3:32 PM, Dmitry Baryshkov wrote:
> > On Mon, May 06, 2024 at 01:49:17PM +0200, Hans de Goede wrote:
> >> Hi dma-buf maintainers, et.al.,
> >>
> >> Various people have been working on making complex/MIPI cameras work OOTB
> >> with mainline Linux kernels and an opensource userspace stack.
> >>
> >> The generic solution adds a software ISP (for Debayering and 3A) to
> >> libcamera. Libcamera's API guarantees that buffers handed to applications
> >> using it are dma-bufs so that these can be passed to e.g. a video encoder.
> >>
> >> In order to meet this API guarantee the libcamera software ISP allocates
> >> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> >> the Fedora COPR repo for the PoC of this:
> >> https://hansdegoede.dreamwidth.org/28153.html
> > 
> > Is there any reason for allocating DMA buffers for libcamera through
> > /dev/dma_heap/ rather than allocating them via corresponding media
> > device and then giving them away to DRM / VPU / etc?
> > 
> > At least this should solve the permission usecase: if the app can open
> > camera device, it can allocate a buffer.
> 
> This is with a software ISP, the input buffers with raw bayer data
> come from a v4l2 device, but the output buffers with the processed
> data are purely userspace managed in this case.

Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
providing data to VPU or DRM, then you should be able to get the buffer
from the data-consuming device. If the data is further processed by
a userspace app, then it should not require DMA memory at all.

My main concern is that dma-heaps is both too generic and too limiting
for the generic library implementation.

-- 
With best wishes
Dmitry
