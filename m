Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6068C0165
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 17:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186B71130BD;
	Wed,  8 May 2024 15:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Z+WylXGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA8C1130BD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 15:49:15 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a59d5b112ecso30976066b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715183354; x=1715788154; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoDqdwsBKbW6uamNTf2oglOPRrPuT52r8TIKcUq8IZI=;
 b=Z+WylXGK20ogkvwcV94b9FZNA/Y44xWN2s68AhhHkIb5Mijci1nVpPPPLQPz36SGpa
 US9+WYlK6LWlfusPTI6sPCo4S/Gvux2GFzE9y8LN4IIfNVrE+B7vJoKErXbdGYyCe3ln
 DT3BzTnzxakTT7jfyUsdOJyCTwzvRCA1on6t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715183354; x=1715788154;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CoDqdwsBKbW6uamNTf2oglOPRrPuT52r8TIKcUq8IZI=;
 b=nnJatIFkNXdQVbRSKQVnLfZG2Tj6G5blAGoxAYbOwYBBUPHZDDNwDv1nbO4eFHolhx
 7EQRMEm6M614xSub3e7RawUokqHrAaKb0wwZTjcjtuEtbEGXTHzeJbMOpO+Bb6Aez32c
 kKPuKgnRvVEnWW30AQArUcaU4vrL1KuCKoZzATdqqv6IDGUvCpCVxdNBU//HF0i+iFvI
 NA6obghvLc1XmjCUAHlE/gVYrL9y17is2ts+VYIfgxIC2Vkb4QU5Pp2fGk4yllIRvI/J
 F5+iojdHtuNFMw1gl4sZFSy80SgU5quqPf0lejQWcx6selOrXyrfPoqF0+jrLKtNJSZS
 blOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOj0hY/hYs27bqmw2ZlbNG+NwSST8QtIyGJmHUV3LEAsRwGMYkamafrwABIc5JlAiIHQt3ucBwXcL3OJ/4SriTheLsnen6H7R+d8k2N/Lm
X-Gm-Message-State: AOJu0YywknXHz78epNurY+JuXY6/+0SWt1iCC/zG2maSwAQndm3LjAK6
 mD+jXh9C/AxDzo1iFdj5DqY/1jWtobx3kkNfsqq6h85Lx/sKvx4pYgVQXS9c5CE=
X-Google-Smtp-Source: AGHT+IHNn3Lgz5HYD12HsLRBBsnhqDUZ5S5EpU/nc5htxmMB22rLQkSpt/QiZ47OvSMSsvksPpaYBw==
X-Received: by 2002:a17:906:df14:b0:a59:bce9:8454 with SMTP id
 a640c23a62f3a-a59fb94f6d3mr192308366b.1.1715183353735; 
 Wed, 08 May 2024 08:49:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 uz14-20020a170907118e00b00a599adfd49dsm6452017ejb.64.2024.05.08.08.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 08:49:13 -0700 (PDT)
Date: Wed, 8 May 2024 17:49:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@redhat.com>,
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@redhat.com>,
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
 <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
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

On Wed, May 08, 2024 at 09:38:33AM +0100, Daniel Stone wrote:
> On Wed, 8 May 2024 at 09:33, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 08, 2024 at 06:46:53AM +0100, Daniel Stone wrote:
> > > That would have the unfortunate side effect of making sandboxed apps
> > > less efficient on some platforms, since they wouldn't be able to do
> > > direct scanout anymore ...
> >
> > I was assuming that everyone goes through pipewire, and ideally that is
> > the only one that can even get at these special chardev.
> >
> > If pipewire is only for sandboxed apps then yeah this aint great :-/
> 
> No, PipeWire is fine, I mean graphical apps.
> 
> Right now, if your platform requires CMA for display, then the app
> needs access to the GPU render node and the display node too, in order
> to allocate buffers which the compositor can scan out directly. If it
> only has access to the render nodes and not the display node, it won't
> be able to allocate correctly, so its content will need a composition
> pass, i.e. performance penalty for sandboxing. But if it can allocate
> correctly, then hey, it can exhaust CMA just like heaps can.
> 
> Personally I think we'd be better off just allowing access and
> figuring out cgroups later. It's not like the OOM story is great
> generally, and hey, you can get there with just render nodes ...

Imo the right fix is to ask the compositor to allocate the buffers in this
case, and then maybe have some kind of revoke/purge behaviour on these
buffers. Compositor has an actual idea of who's a candidate for direct
scanout after all, not the app. Or well at least force migrate the memory
from cma to shmem.

If you only whack cgroups on this issue you're still stuck in the world
where either all apps together can ddos the display or no one can
realistically direct scanout.

So yeah on the display side the problem isn't solved either, but we knew
that already.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
