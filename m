Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A179179AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2009810E7AB;
	Wed, 26 Jun 2024 07:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fG3kS6yf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3509610E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:28:42 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-363ba6070b1so232096f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719386920; x=1719991720; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZqNG77PcBYWk1qlqmdc1D97HuBROg9p8D0BaXqBlCPo=;
 b=fG3kS6yfti6EKwVE0Laekx5HWiQseaN/90blbhqwhUnyWE8rAk0zicma3UYIeg2xXo
 uR3I79RGM1sTn4RKcOz/L0EFX2vqTMbS/AqcBaTZTd+UGqmWFIwqqhfjb/oxlGHjsoAw
 lMylRt34QUwVkOLGmvjJAi2R8TQIE3cWR4Jv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719386920; x=1719991720;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZqNG77PcBYWk1qlqmdc1D97HuBROg9p8D0BaXqBlCPo=;
 b=flfGuvwF4K/rers43e7+M9kidSn1Hi49fElpZiepbYozpZ5zXlmQc/eMjfZc8H97Ma
 I/hBozxj6vixfIB5tCg8upJmFwHKTTGFsytrClhxOikPQz+vrN8amPUd0C0FBoJdC07Q
 78Y4CHiJT4+FlIr7HkJgSnhJckiJjyL27PyHZRK4SoF/rYwSn3Jd5HqvQZ9ljAztRA0Q
 2mOqhpuhzeZMizAec84hHWVkzMqtrgqLtoAxLfhSwfxXk0vSWHUY/1X5OzM7O5VP08y+
 2li4qEyJFoi+Je3u1/k7R5tPfJpo0pq7CwVpGT5K42KIVVKOEucj1fwj6Lv5XpC37ccM
 03GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYedYsKH9SPAM151HdOiNgqXCipwsxEsHTTGnDiRsou0q7Og9xjUQxTZl0TilQRczRO0E5OjMkqIhcXv42yAY/aMZglktCfNvkP8MvVV4V
X-Gm-Message-State: AOJu0YwKZv5vZLNeQJ+LtTDIfi1fqxqQVyEViUn++23TE7A2P0nemTYF
 ol4Ye533Ysbza/tB039hkQJRdnkDC5T16I4AKMf4F7L6YJYfj8oUwdYc0OswGek=
X-Google-Smtp-Source: AGHT+IGkwDomQEANyZ+eXIUVoM6FPDmgEQt/mHUtBowVFVCo5z8ux3/Xf7CVbrm5g5deo4x8C36TWw==
X-Received: by 2002:a5d:457a:0:b0:366:e496:1caa with SMTP id
 ffacd0b85a97d-366e4961e22mr5453532f8f.5.1719386920297; 
 Wed, 26 Jun 2024 00:28:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638e90ccbsm14947006f8f.59.2024.06.26.00.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:28:39 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:28:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Stone <daniel@fooishbar.org>,
 Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
Message-ID: <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
Mail-Followup-To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Daniel Stone <daniel@fooishbar.org>,
 Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
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

On Mon, Jun 17, 2024 at 07:01:05PM +0200, Tomeu Vizoso wrote:
> Hi Lucas,
> 
> Do you have any idea on how not to break userspace if we expose a render node?

So if you get a new chip with an incompatible 3d block, you already have
that issue. And I hope etnaviv userspace can cope.

Worst case you need to publish a fake extremely_fancy_3d_block to make
sure old mesa never binds against an NPU-only instance.

Or mesa just doesn't cope, in which case we need a etnaviv-v2-we_are_sorry
drm driver name, or something like that.
-Sima

> 
> Cheers,
> 
> Tomeu
> 
> On Wed, Jun 12, 2024 at 4:26 PM Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> >
> > On Mon, May 20, 2024 at 1:19 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, 20 May 2024 at 08:39, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > > > On Fri, May 10, 2024 at 10:34 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > > Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso:
> > > > > > If we expose a render node for NPUs without rendering capabilities, the
> > > > > > userspace stack will offer it to compositors and applications for
> > > > > > rendering, which of course won't work.
> > > > > >
> > > > > > Userspace is probably right in not questioning whether a render node
> > > > > > might not be capable of supporting rendering, so change it in the kernel
> > > > > > instead by exposing a /dev/accel node.
> > > > > >
> > > > > > Before we bring the device up we don't know whether it is capable of
> > > > > > rendering or not (depends on the features of its blocks), so first try
> > > > > > to probe a rendering node, and if we find out that there is no rendering
> > > > > > hardware, abort and retry with an accel node.
> > > > >
> > > > > On the other hand we already have precedence of compute only DRM
> > > > > devices exposing a render node: there are AMD GPUs that don't expose a
> > > > > graphics queue and are thus not able to actually render graphics. Mesa
> > > > > already handles this in part via the PIPE_CAP_GRAPHICS and I think we
> > > > > should simply extend this to not offer a EGL display on screens without
> > > > > that capability.
> > > >
> > > > The problem with this is that the compositors I know don't loop over
> > > > /dev/dri files, trying to create EGL screens and moving to the next
> > > > one until they find one that works.
> > > >
> > > > They take the first render node (unless a specific one has been
> > > > configured), and assumes it will be able to render with it.
> > > >
> > > > To me it seems as if userspace expects that /dev/dri/renderD* devices
> > > > can be used for rendering and by breaking this assumption we would be
> > > > breaking existing software.
> > >
> > > Mm, it's sort of backwards from that. Compositors just take a
> > > non-render DRM node for KMS, then ask GBM+EGL to instantiate a GPU
> > > which can work with that. When run in headless mode, we don't take
> > > render nodes directly, but instead just create an EGLDisplay or
> > > VkPhysicalDevice and work backwards to a render node, rather than
> > > selecting a render node and going from there.
> > >
> > > So from that PoV I don't think it's really that harmful. The only
> > > complication is in Mesa, where it would see an etnaviv/amdgpu/...
> > > render node and potentially try to use it as a device. As long as Mesa
> > > can correctly skip, there should be no userspace API implications.
> > >
> > > That being said, I'm not entirely sure what the _benefit_ would be of
> > > exposing a render node for a device which can't be used by any
> > > 'traditional' DRM consumers, i.e. GL/Vulkan/winsys.
> >
> > What I don't understand yet from Lucas proposal is how this isn't
> > going to break existing userspace.
> >
> > I mean, even if we find a good way of having userspace skip
> > non-rendering render nodes, what about existing userspace that isn't
> > able to do that? Any updates to newer kernels are going to break them.
> >
> > Regards,
> >
> > Tomeu

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
