Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084EF1E4BE7
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 19:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A103C6E370;
	Wed, 27 May 2020 17:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4806D6E370
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 17:30:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b6so29970720ljj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXtUXHnihi65Qkky3QBg/wO8Z4FKZ8HK0jwFU/d0C1U=;
 b=mAXh/LKAKtst4Z3OgR5OvCltmndxuNEjZQX+8dipX11S4NVUuzI1BduWwJIOd+6DbB
 6a+NxABiUGXEAf0RRGCvjxerV1sRnnXWb9tnLSD2EL0cWq62ZIoDDhmWb3h6DcFZKRnq
 vYqaWZiaXxv8mG5WFibpZalTRI7liMgwoPwfLPMs5bjBFbIiOiNdnugZKvOwMzZ6uSfX
 Vy6rNk6gQ584/+hDTLOf+SvZBSBIpqid54R/B5q4Kq+q9O1s9BbZ7hw3UWlJxyFPE8+o
 UZE1fx8or/NhVPUNdYyYiAIl2BUAVuY70wq7G5z+Y5QcQk6Lr81KS6MqXz1eHZwM3Q4k
 6Jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXtUXHnihi65Qkky3QBg/wO8Z4FKZ8HK0jwFU/d0C1U=;
 b=uTmYHTWxUBB4zYddbMJKFH62fi6FkfozXBHJQ7B9IA+GOsHTQ95V/syWe99CpstmrE
 8ubUT5Ol/yc9K/k8Y9S2EsFvuSt2LE060Pbz92Wf/LQYXOHsPXf/BO7o5MsP/cxRdI9L
 im+iw3bIQAxhtsA4b+LZpn9KnqfYcgxL/WuoLDIrOssPgWVVLQVbBDIqwXQkK30IAIaQ
 liLSDs0g6xmytYovMSPQBFaDU+7mgEQP8LapdO9vpFhxHyRWSkRItqlTu6H+w2p6mX+j
 sd3Di4Q9IGaiEVggrzmM/fouRNkh3l/k8rKYtk+QGoPKPISzcHcoBClxiVb0m/RytmUl
 OJxw==
X-Gm-Message-State: AOAM532ABAuD8MqtKQgnF8yrKPO5zTeFj2r/16yeKgA1pcQFbDbMBHxv
 f/G7EqA360lAxX1IJ1DbTesFeeimHwwstxJtkkjjig==
X-Google-Smtp-Source: ABdhPJxLtTyXye6ERqUE6zRYmVzfg6k8wpZJsO3V9z/mvydFM0oASGA02J46IB8UgDa1+yhgHxpCV04mqchdroj6ayc=
X-Received: by 2002:a2e:8ed3:: with SMTP id e19mr3799428ljl.367.1590600655617; 
 Wed, 27 May 2020 10:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <2c6a651cac6359cb0244a40d3b7a14e72918f169.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <2c6a651cac6359cb0244a40d3b7a14e72918f169.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 10:30:44 -0700
Message-ID: <CADaigPVObO=mS5zKmB7qKPgUke-mKz7xQ+N3hatkU7dEAAAOVQ@mail.gmail.com>
Subject: Re: [PATCH v3 040/105] drm/vc4: crtc: Turn pixelvalve reset into a
 function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The driver resets the pixelvalve FIFO in a number of occurences without
> always using the same sequence.
>
> Since this will be critical for BCM2711, let's move that sequence to a
> function so that we are consistent.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Patch 34-40 also r-b.

Going to take a little break, this is a lot to try to process at once.
Hopefully you can merge reviewed stuff to drm-misc and shorten the
series.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
