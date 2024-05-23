Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357308CCF8C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C4110E2FD;
	Thu, 23 May 2024 09:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hSRINH6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684F110E2FD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:45:33 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-354f89a59b8so110697f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716457531; x=1717062331; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rua3OglaGtRzvLpfCStU07S245n5hB3FYrd8MuHxXyo=;
 b=hSRINH6VPEViBFBRgNY/s+TQvKcxx369WN+x3JXZt/ZDcyhasCivnyjVuwgxNlj8K2
 ykZ7EUncEo1+HsIoE3exAd/gMRlzb3uqfyAMNraPpLUPbQgO5tiZopTArZTxrvg2aP4G
 7xhd870VVinsxlkQwk8iU2p4HpKiIJikNJ64k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716457531; x=1717062331;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rua3OglaGtRzvLpfCStU07S245n5hB3FYrd8MuHxXyo=;
 b=EL9jxj07/4LjbE3NvtzJGylEbV7gRPNmiwkc3nSPoZKsyM1W0LplGRSUB5QRHM4nCU
 Jdw0C/JbL43BEJCT2hWjEJeaKThBptj3sls2kgH+/0kfpg7ITYZie5aaJC9XQGoLpxyp
 xpJI63X9BSI54XGz60i5TDlBoOFcqzaMj7xT1Ecw3cNizzHUj6bOYg1QQSDpSG94eISQ
 KuUVzo25BQyQC3oMv3hlllXgY0g70C3TOOQzGPSllVTkW/0wKYsAg5kbfAxEylQKPa1B
 sxpsgQk9ytMOIszHP/HTz3/Kn1NzMGnxjFCBel+p0TvV8lAOZ6iwEEX+n0TA/Eqw7SSz
 yGbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKvG8bDy69D9pUWbtCDa4a3ClLPyvmimtuhM9ZfGchNoDH7UQD0+uE0pkPGm4J0ghHoDqy/IYA/XOUFx79f9cuCPJWuJdgmDUjoMBkN1fA
X-Gm-Message-State: AOJu0YzKeMf2lpXG1leWU4KntxCzBzJnVu/fk3JkUKVYtePRoI5geAHW
 7wIZLAY5JPmLhJkmFF2FaLpjQWl63EeZWdF0B+W+99aAFob21+nzKXyOCZGbYog=
X-Google-Smtp-Source: AGHT+IG15s9jGPIJ1Tt73n14VxOUlfIOXJ5tvzDkW3ed8IqDv2vSAEij8VrZEa4QLVo3Rsx8X1k4gA==
X-Received: by 2002:a05:600c:511e:b0:41b:e58c:e007 with SMTP id
 5b1f17b1804b1-420fd386158mr32798045e9.4.1716457531398; 
 Thu, 23 May 2024 02:45:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f7b7f9sm20030635e9.27.2024.05.23.02.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:45:30 -0700 (PDT)
Date: Thu, 23 May 2024 11:45:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <Zk8QOB6F4pd__WvA@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <20240522-coral-fennec-from-uranus-fb7263@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522-coral-fennec-from-uranus-fb7263@houat>
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

On Wed, May 22, 2024 at 03:18:02PM +0200, Maxime Ripard wrote:
> On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > On Thu, May 16, 2024 at 3:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > > But it makes me a little nervous to add a new generic allocation flag
> > > > > for a feature most hardware doesn't support (yet, at least). So it's
> > > > > hard to weigh how common the actual usage will be across all the
> > > > > heaps.
> > > > >
> > > > > I apologize as my worry is mostly born out of seeing vendors really
> > > > > push opaque feature flags in their old ion heaps, so in providing a
> > > > > flags argument, it was mostly intended as an escape hatch for
> > > > > obviously common attributes. So having the first be something that
> > > > > seems reasonable, but isn't actually that common makes me fret some.
> > > > >
> > > > > So again, not an objection, just something for folks to stew on to
> > > > > make sure this is really the right approach.
> > > >
> > > > Another good reason to go with full heap names instead of opaque flags on
> > > > existing heaps is that with the former we can use symlinks in sysfs to
> > > > specify heaps, with the latter we need a new idea. We haven't yet gotten
> > > > around to implement this anywhere, but it's been in the dma-buf/heap todo
> > > > since forever, and I like it as a design approach. So would be a good idea
> > > > to not toss it. With that display would have symlinks to cma-ecc and cma,
> > > > and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
> > > > SoC where the display needs contig memory for scanout.
> > > 
> > > So indeed that is a good point to keep in mind, but I also think it
> > > might re-inforce the choice of having ECC as a flag here.
> > > 
> > > Since my understanding of the sysfs symlinks to heaps idea is about
> > > being able to figure out a common heap from a collection of devices,
> > > it's really about the ability for the driver to access the type of
> > > memory. If ECC is just an attribute of the type of memory (as in this
> > > patch series), it being on or off won't necessarily affect
> > > compatibility of the buffer with the device.  Similarly "uncached"
> > > seems more of an attribute of memory type and not a type itself.
> > > Hardware that can access non-contiguous "system" buffers can access
> > > uncached system buffers.
> > 
> > Yeah, but in graphics there's a wide band where "shit performance" is
> > defacto "not useable (as intended at least)".
> 
> Right, but "not useable" is still kind of usage dependent, which
> reinforces the need for flags (and possibly some way to discover what
> the heap supports).
> 
> Like, if I just want to allocate a buffer for a single writeback frame,
> then I probably don't have the same requirements than a compositor that
> needs to output a frame at 120Hz.
> 
> The former probably doesn't care about the buffer attributes aside that
> it's accessible by the device. The latter probably can't make any kind
> of compromise over what kind of memory characteristics it uses.
> 
> If we look into the current discussions we have, a compositor would
> probably need a buffer without ECC, non-secure, and probably wouldn't
> care about caching and being physically contiguous.
> 
> Libcamera's SoftISP would probably require that the buffer is cacheable,
> non-secure, without ECC and might ask for physically contiguous buffers.
> 
> As we add more memory types / attributes, I think being able to discover
> and enforce a particular set of flags will be more and more important,
> even more so if we tie heaps to devices, because it just gives a hint
> about the memory being reachable from the device, but as you said, you
> can still get a buffer with shit performance that won't be what you
> want.
> 
> > So if we limit the symlink idea to just making sure zero-copy access is
> > possible, then we might not actually solve the real world problem we need
> > to solve. And so the symlinks become somewhat useless, and we need to
> > somewhere encode which flags you need to use with each symlink.
> > 
> > But I also see the argument that there's a bit a combinatorial explosion
> > possible. So I guess the question is where we want to handle it ...
> > 
> > Also wondering whether we should get the symlink/allocator idea off the
> > ground first, but given that that hasn't moved in a decade it might be too
> > much. But then the question is, what userspace are we going to use for all
> > these new heaps (or heaps with new flags)?
> 
> For ECC here, the compositors are the obvious target. Which loops backs
> into the discussion with John. Do you consider dma-buf code have the
> same uapi requirements as DRM?

Imo yes, otherwise we'll get really funny stuff like people bypass drm's
userspace requirement for e.g. content protected buffers by just shipping
the feature in a dma-buf heap ... Been there, done that.

Also I think especially with interop across components there's a huge
difference between a quick test program toy and the real thing. And
dma-buf heaps are kinda all about cross component interop.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
