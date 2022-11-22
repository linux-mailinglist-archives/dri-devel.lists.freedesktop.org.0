Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837336344DE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B854910E12C;
	Tue, 22 Nov 2022 19:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D958D10E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:50:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id f7so22103299edc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 11:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IK8SDZ/jZDyLJEsuxR9xFz2htJfz3q3gT5kjSS+oWR4=;
 b=Ikboz0C29tilFV0hIGZnqAFHVvjMHxJd7InyRfuuUNzPVIQJVPxl+VrH7NhH/ytm4G
 RWtJ1mNRaTbK+4nxOJGwbeGTQd2rBQaylYCLcPR4p+roHyKFHeGySiCf7z6+9reUN/KE
 Z35zUt6yUcHWUuMbzpCmLZk16iNI+2Px8gy2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IK8SDZ/jZDyLJEsuxR9xFz2htJfz3q3gT5kjSS+oWR4=;
 b=3ag4xqNSwCl610G9bEGMtxTPWcRKEf5TUlFu/N5kj8MFN/xN2xjjwK59uhflQ0V74t
 51lpL9oHGBPNy9QE3nJ8LpewHmR4vtW1l2bcDgsDlOZmUkqljbltz2MyVp+Qfagr6prI
 p+uRuoij5aOdqiiIoJwW5F3vwTNx5/g6CcWbTNGuz1uCloXL07JOkqMyEtJRz9B54rFo
 ewiai+F2NXX4KD6kD9XbR6mlq6IzJyox+AUJ2A/5Ob5RYuJpQjdE0sqXcfpSZPS3AJfY
 hMHi0/tnphkL7yjGjHVSST6vgeqjqYG987+OWFOVFZeEFDJdbQ7/5oGBd6S43UII5w4q
 pyFQ==
X-Gm-Message-State: ANoB5pk5JzKvLbgTOLzTMTH/j3LEWqrtx5VpPTbVkUFFnV8dVm899Lzc
 i+jjvK1shapWIockuf+Z8Vk16FeuY49Dq9NmI8TZ7w==
X-Google-Smtp-Source: AA0mqf7XUsswVblhhNThn/Wsg7nr0LQvlQk2QY03yhXme2ouSPPWSkV9vt2apDAQVVRdw98Fl27y+13qz8Y7qsxsG1Q=
X-Received: by 2002:a05:6402:28a9:b0:461:f5ce:a478 with SMTP id
 eg41-20020a05640228a900b00461f5cea478mr22342384edb.304.1669146634381; Tue, 22
 Nov 2022 11:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
In-Reply-To: <Y30kK6dsssSLJVgp@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Nov 2022 20:50:23 +0100
Message-ID: <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
> > You nuke all the ptes. Drivers that move have slightly more than a
> > bare struct file, they also have a struct address_space so that
> > invalidate_mapping_range() works.
>
> Okay, this is one of the ways that this can be made to work correctly,
> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
> was the DAX mistake)

Hence this patch, to enforce that no dma-buf exporter gets this wrong.
Which some did, and then blamed bug reporters for the resulting splats
:-) One of the things we've reverted was the ttm huge pte support,
since that doesn't have the pmd_special flag (yet) and so would let
gup_fast through.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
