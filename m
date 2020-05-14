Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB31D3F04
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 22:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8A86E393;
	Thu, 14 May 2020 20:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70A46E393
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 20:36:57 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C44120709
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589488617;
 bh=f1NuuVqza0Qs6n3g5b50kVYLmu7TLHdJRReJmIH2EDo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n6NfkBni9fWlwknht2a8iYmGpICIZhiXjy164/rv+EeUuZVCnescceoveoxdclJAZ
 SveUeYlE6nZGoaJkwNbakhGTjYImZojaunoOkgh6f78wIdDOAv4Rp63pRZU2i4KRyh
 FNlOk/EZauoM5sxMgsMkGGpwafHTo+lJO8AB9I6M=
Received: by mail-oi1-f175.google.com with SMTP id r25so247303oij.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:36:57 -0700 (PDT)
X-Gm-Message-State: AGi0PubG7nNa+PxnlFZMmjnfYGjr6YjQmBxgiiPCQS9lpxdRfkGwDnkC
 +LMqSRLJDWYblOqIPJl47al7giZqwB61Wppnog==
X-Google-Smtp-Source: APiQypLzeQ50wbEw/x0qOorKXKApWmznb9uVAvVf3txqiFIx4a7ajD0bNZdMRFtO25r7ZbwPeU03grSHsPhn5R41akU=
X-Received: by 2002:aca:1904:: with SMTP id l4mr32652485oii.106.1589488616799; 
 Thu, 14 May 2020 13:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
In-Reply-To: <20200514124050.GV206103@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 May 2020 15:36:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
Message-ID: <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, May 13, 2020 at 05:03:11PM +0200, Thomas Zimmermann wrote:
> > SHMEM-buffer backing storage is allocated from system memory; which is
> > typically cachable. Currently, only virtio uses cachable mappings; udl
> > uses its own vmap/mmap implementation for cachable mappings. Other
> > drivers default to writecombine mappings.
>
> I'm pretty sure this breaks all these drivers. quick grep on a few
> functions says this is used by lima, panfrost, v3d. And they definitely
> need uncached/wc stuff afaiui. Or I'm completely missing something?

Yes, that would be my guess. DMA is usually non-coherent on Arm.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
