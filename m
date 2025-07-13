Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B3B032CA
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 22:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22ED10E030;
	Sun, 13 Jul 2025 20:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m6lBsyFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688AB10E030;
 Sun, 13 Jul 2025 20:00:07 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-558facbc19cso2880052e87.3; 
 Sun, 13 Jul 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752436805; x=1753041605; darn=lists.freedesktop.org;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=3Zgas8aX6pTElhKIx/IRpo2TOQqTHn8xnxc+EnP268I=;
 b=m6lBsyFEkYp4MOPizf0s+JAZ/aLxegaZPSQL++gEisKI1NWjaJkVCMiq497DeB40Si
 KF7EO4S+bv3haY6SJ79sN79OPOzs7Bu5E7CaRdEDQbSk5EAatsCBxf1EyIrxwOSW14IQ
 Kc88w2rcHtzc/XUPHIizR4d9s40izeqAms8LwW9jB837hrMlVBnYnLJFwsU0r8qdCUvm
 bnT5Sdfxx1ZL2tvJJX77bIOaV3UyDO3JI3tR3Du0d5Fmc2xMAo0WLRZmJG3iwhIjINBR
 /QaVGOQW8Y9tOOkOe3dxCKbR/zWY+1VYcGI/QLrfmyn9MJOR/t1Q5m/HPEehF5WwgF/Q
 x2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752436805; x=1753041605;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Zgas8aX6pTElhKIx/IRpo2TOQqTHn8xnxc+EnP268I=;
 b=EvaZdpVyhhLO9HMpRCpn7FwYk+TjcNBCmb6uGG3iq8Vc2Gxio9hFynBusTMlKij3ho
 M/la54HuXuvkaX54/3rrim9kIBTSwZivUzT7nsrRdLEGsbo+LUVkC2s2SbS9yPNehiN4
 Td9NswOtnMFd2xoHAT8dGtSxsdZsJv8d2mw2BqLYe9IYbEgUHSCGHAYSkqP6dvYbNK8j
 Mw4P9puURclycR5ZsikTwVcHOs1flW49gF8m3VvqPxFkOSMIcodoCoCMjSJqZnZYUaLC
 RkSN6mQXJTUrJN7xJ4UrZhQydX5+FTKWsDvAMckkGjHeUgtoz4OneFGQe4PXUlVD1z3+
 BX+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg6P2T0mimwJHepdD1Tl4qCZlw3mkanOK9KBo4PN32qOTeFFGz3PZpNq7yYUQzFPe9GB8TYysVfw==@lists.freedesktop.org,
 AJvYcCX1r5PXJLaCaTceIW/XYT9H1pBhV255csMYTbvH/oAOX+ZbnlL9oZBMNT9g7JJ9xXu/+86q9LDL4tQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMmDN68xgzoOVEgeyniAO8l/Pa82LoTAtVilZieVicv4hy3pZs
 pdmrAQjrzWQ80rCZsxfrnwZjRlRpqNRjEyyQAGsTPj7HmcuwDwDpIudR
X-Gm-Gg: ASbGncuKvy3gVnMZr7k8nfboWJvctMUitqS5ULK7qnze1FKzjkQudTU8amZQOmjWs3W
 rrLpD694iv+ocyER84VTr/7O1ivzeIrr0EGr5zwCUkoBEA+4er38rQnosUkaUm49Ds5US1CySNa
 VEXFuPV9xZqvwOdq+QXRW6rmIxDmm4qwLAIQazlHPqMa8Y7kplc8mGSHp9he+/wljWwPvyLHfsN
 eaUleaPfJLeDYnFZxlEeHMNubQo3ANhpYsHHP+MJhZCcVa3btuMG7mZKQdJvOMFCJRF9jEpqIK8
 wSRmrgf6CqEUR5y+dAWgDWpV/rXov7nR9OT6SPageIZLyd0wUjI5N6F1gacX5bEF3bMNCIICVTN
 qX/92cmjIECugww0LLjE=
X-Google-Smtp-Source: AGHT+IFxABxaGZ89qBgwZDV7CxOPxSBDB3o9rA665o+Vy3jYVVk1Wdz6wBebAWa65+qQwprfYTupWA==
X-Received: by 2002:a05:6512:3b9e:b0:553:510d:f46b with SMTP id
 2adb3069b0e04-55a046095e7mr2800438e87.32.1752436804901; 
 Sun, 13 Jul 2025 13:00:04 -0700 (PDT)
Received: from razdolb ([185.69.124.235]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b60827sm1689220e87.158.2025.07.13.13.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 13:00:03 -0700 (PDT)
References: <aG94uNDrL1MdHJPM@duo.ucw.cz>
User-agent: mu4e 1.10.9; emacs 30.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel list
 <linux-kernel@vger.kernel.org>, laurent.pinchart@ideasonboard.com,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, etnaviv@lists.freedesktop.org,
 phone-devel@vger.kernel.org
Subject: Re: DMA-BUFs always uncached on arm64, causing poor camera
 performance on Librem 5
Date: Sun, 13 Jul 2025 22:54:14 +0300
In-reply-to: <aG94uNDrL1MdHJPM@duo.ucw.cz>
Message-ID: <87tt3fdfpg.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
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


Hi, Pavel,

On 2025-07-10 at 10:24 +02, Pavel Machek <pavel@ucw.cz> wrote:

> [[PGP Signed Part:Undecided]]
> Hi!
>
> It seems that DMA-BUFs are always uncached on arm64... which is a
> problem.
>
> I'm trying to get useful camera support on Librem 5, and that includes
> recording vidos (and taking photos).

Earlier this year i tried to solve a similar issue on rkisp1 (Rockchip
3399), and done some measurements, showing that non-coherent buffers +
cache flushing for buffers is a viable approach [1]. Unfortunately, that
effort stalled, but maybe patch "[PATCH v4 1/2] media: videobuf2: Fix
dmabuf cache sync/flush in dma-contig" will be useful to you.

[1] https://lore.kernel.org/all/20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com/

> memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
> DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
> 760p video recording. Plus, copying full-resolution photo buffer takes
> more than 200msec!
>
> There's possibility to do some processing on GPU, and its implemented here:
>
> https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=heads
>
> but that hits the same problem in the end -- data is in DMA-BUF,
> uncached, and takes way too long to copy out.
>
> And that's ... wrong. DMA ended seconds ago, complete cache flush
> would be way cheaper than copying single frame out, and I still have
> to deal with uncached frames.
>
> So I have two questions:
>
> 1) Is my analysis correct that, no matter how I get frame from v4l and
> process it on GPU, I'll have to copy it from uncached memory in the
> end?
>
> 2) Does anyone have patches / ideas / roadmap how to solve that? It
> makes GPU unusable for computing, and camera basically unusable for
> video.
>
> Best regards,
> 								Pavel


--
Best regards,
Mikhail Rudenko
