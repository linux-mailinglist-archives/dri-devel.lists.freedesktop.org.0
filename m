Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9822449A0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 14:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10326EB31;
	Fri, 14 Aug 2020 12:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3866EB31
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 12:12:50 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id 93so7395087otx.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pealV+VydqDZW06bmrAL2YWzJvMklEWwyLNagmsldhI=;
 b=SshzTGVTX9qSp4jXsV9wNHDUrUp0DTAC7I1wEKGvJcu+kWKbql/3afrqqWf5m0DhfS
 3AhB0fxrKzQLTMmhw8HURKJZeQYmZ2sRJjjMexL45rjDuZBGRxkaak+c74FTfGiWIL4N
 4osh+nq1UXZGhhgnSm7T9BepqjYyjWlQTKP4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pealV+VydqDZW06bmrAL2YWzJvMklEWwyLNagmsldhI=;
 b=hihTDdqaqtxgtjGp7i9NM7OtpNOxu/1OK4wdkCSPmXsBIi21eWTYhc0oZ6OCx7B+MH
 z13q4NCTFTK4pJADDXszzOUS2cl6SLnMsLhBVKGQ9IZIg822DBmXz6CyoWs+tRwKX4Gt
 A9k2BqkkB2NGweZptF8IlnHPzDdADFnaP+1YRnAyGg3e2beAndVCtQUsC1ABN+NFLqnC
 GcFarUSn3LA+MRsbCRy4vtX0ONOI0mjpnGy2Nido6q8TCziua5pSTd2Z4QHAMRrUuBTo
 TybU51cf/yWKArha85OoQm49V/DAKZAdXGLsUci4kBACC7NC3pf+Y1tNr798GtWotGvz
 zmHg==
X-Gm-Message-State: AOAM532mvkW9R2q9YKIGa+lMLb45c8m303swjbNTIkaJiyVb6HXMvQso
 cuVOeFb5eotrwmvZgR5Orud0gGggSQOmtxOJ1e9m4w==
X-Google-Smtp-Source: ABdhPJzjIk+koLVPuyqLeA1q3XTupnXm3QaHEKeMDW+mnwE9sPDMUOhSRRI5znL0kjiqqjI+AojPRr1bQ3FPyNkRa/U=
X-Received: by 2002:a05:6830:1e71:: with SMTP id
 m17mr1780869otr.188.1597407169658; 
 Fri, 14 Aug 2020 05:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
In-Reply-To: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Aug 2020 14:12:38 +0200
Message-ID: <CAKMK7uEatNdZ64QmGXLY3GCqDquAr0rcTFF0006K7+L_vySYzg@mail.gmail.com>
Subject: Re: Role of DMA Heaps vs GEM in allocation
To: Mikko Perttunen <cyndis@kapsi.fi>
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 1:34 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> Hi,
>
> I'm currently working on a new UAPI for Host1x/TegraDRM (see first draft
> in thread "[RFC] Host1x/TegraDRM UAPI"[1]). One question that has come
> up is regarding the buffer allocation mechanism. Traditionally, DRM
> drivers provide custom GEM allocation IOCTLs. However, we now have DMA
> Heaps, which would be sufficient for TegraDRM's needs, so we could skip
> implementing any GEM IOCTLs in the TegraDRM UAPI, and rely on importing
> DMA-BUFs. This would mean less code on TegraDRM's side.
>
> However, one complication with using DMA Heaps is that it only provides
> DMA-BUF FDs, so it is possible that a user application could run out of
> free file descriptors if it is not adjusting its soft FD limit. This
> would especially be a problem for existing applications that might have
> worked with the traditional GEM model and didn't need to adjust their FD
> limits, but would then fail in some situations with the increased FD
> usage of DMA-BUF FDs.
>
> My question is then: what is the role of DMA Heaps? If it is to be used
> as a central allocator, should the FD issue be left to the application,
> or addressed somehow? Should it be considered a potential alternative
> for GEM allocations?

Atm no one knows. What's for sure is that dma-buf fd are meant to
establish sharing, and then once imported everywhere, closed again.
dma-buf heaps might or might be useful for sharing the cross-device
memory allocator problem (the rough idea is that in sysfs every device
lists all the heaps it can use, and then you pick the common one that
works for all devices). But that's for shared buffers only.

For an acceleration driver you want drm gem ids, because yes fd
limits. Also constantly having to reimport dma-buf for every cs ioctl
doesn't sound like a bright idea either, there's a reason we have the
drm_prime cache and all that stuff.

I have also no idea why you wouldn't want to use the existing drm
infrastructure, it's all there.

Cheers, Daniel

>
> Thanks,
> Mikko
>
> [1] https://www.spinics.net/lists/dri-devel/msg262021.html
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
