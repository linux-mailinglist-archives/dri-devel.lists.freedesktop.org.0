Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849878BEAA9
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8BD10F9EF;
	Tue,  7 May 2024 17:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Gp/S+jeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8710F9EF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 17:37:03 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-346407b8c9aso1006663f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715103422; x=1715708222; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTbXjnapj66x1QFUTkR6VfpWY54bOGDZ0bq0kLD6kt4=;
 b=Gp/S+jeI6syTJX/5sWqw7wyPFTxvgvAnwZe9/NwSiXttydeIQNM3Qm2mybH7LGIvfX
 tqJ0NBzmhWhxd6pEjsqCNR6cJDyXtjMAntGEvnjkGQIPKjqJYQYzDGeuf/orZdu7xSfD
 JzQCIJE9PHLVltKSJe6+QyM86mKqDenvwu0dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715103422; x=1715708222;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iTbXjnapj66x1QFUTkR6VfpWY54bOGDZ0bq0kLD6kt4=;
 b=Awn73VAHxl9190P11Ga8mCuBfvaryW+gwpVz8w+oo2a3DROt5U9tGOSf8pBBXRNI9a
 w48RIZSXRyzvszRxg8OodMvzyNF+8etWtnX8iYxEe2XTGEsv2eV8aTXLkeRb7gkxPsFN
 Sj0VAk2CJcTUG3E1kVYJ8G4h3WdmuQpOXJqCjUJMI0NzVLgCSgbIqp7IE+yboGPfGSEm
 oy8xSlWGbl96z9WWQsRs7xJyxqwlX6Z4G/txiEMJAQB/MsXK5iWNP2XIjW5wv6BiMPeu
 Kg4uPr5wunNgC1u+BLo4E1gRpd0X0JlOJND7THypkXT94QhPjhblP5/73HjJZuOiwGOA
 QqjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEke5YiG4v7WcSrm8HUsLOjZSJl73h9AJHHHKF1JtVh15WlnnqyUd4TZmqyrAb5kA7YA3+16uo6dxrazKagx3D7Wq7DKgTvR36hjPjZ5bs
X-Gm-Message-State: AOJu0YxPQXYmyemsKj7h4jJyg9iQlUrCKc5P59yZLDmnI+17niLQYoTy
 SbMZmsts2s3+OKRjCrCa31AbFuj2IPVe/BB2E5X/B2Z+gMv9oWECBfxVIi0rwtg=
X-Google-Smtp-Source: AGHT+IGDlaVKfJNlzeSLiq8Rc1yJgYXIv7DO05/xB2F2BNXuulKK2r3ec8s1fdMs15n2a3dYFj8NMg==
X-Received: by 2002:a05:600c:3c89:b0:419:f241:6336 with SMTP id
 5b1f17b1804b1-41f71302f62mr3477335e9.1.1715103422111; 
 Tue, 07 May 2024 10:37:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c1c0d00b0041be58cdf83sm20294246wms.4.2024.05.07.10.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 10:37:01 -0700 (PDT)
Date: Tue, 7 May 2024 19:36:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Message-ID: <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
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

On Tue, May 07, 2024 at 04:15:05PM +0100, Bryan O'Donoghue wrote:
> On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > providing data to VPU or DRM, then you should be able to get the buffer
> > from the data-consuming device.
> 
> Because we don't necessarily know what the consuming device is, if any.

Well ... that's an entirely different issue. And it's unsolved.

Currently the approach is to allocate where the constraints are usually
most severe (like display, if you need that, or the camera module for
input) and then just pray the stack works out without too much copying.
All userspace (whether the generic glue or the userspace driver depends a
bit upon the exact api) does need to have a copy fallback for these
sharing cases, ideally with the copying accelerated by hw.

If you try to solve this by just preemptive allocating everything as cma
buffers, then you'll make the situation substantially worse (because now
you're wasting tons of cma memory where you might not even need it).
And without really solving the problem, since for some gpus that memory
might be unusable (because you cannot scan that out on any discrete gpu,
and sometimes not even on an integrated one).
-Sima

> Could be VPU, could be Zoom/Hangouts via pipewire, could for argument sake
> be GPU or DSP.
> 
> Also if we introduce a dependency on another device to allocate the output
> buffers - say always taking the output buffer from the GPU, then we've added
> another dependency which is more difficult to guarantee across different
> arches.
> 
> ---
> bod

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
