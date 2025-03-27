Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467DBA732BC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 13:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AA310E8BC;
	Thu, 27 Mar 2025 12:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tdr529ZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E2610E329;
 Thu, 27 Mar 2025 12:56:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABC755C5ECC;
 Thu, 27 Mar 2025 12:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C62C4CEE8;
 Thu, 27 Mar 2025 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743080182;
 bh=g1la9nueANrAHSnVCp23BqVbVTEKu21LLAlfti1rUaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdr529ZP3rNqB3jrIWHFb4c6u6vEHVwbwIUS/0nMQNDZjnO5I+gbBxg9CVZ+k0lFj
 GtmlzCyEghFszuAGG4svKv6V+xA0yWwdVcuU1fyezillAurfsfveNvF3Ve8bM6eYs5
 ShYKI0LsaWvgKyKBgsFRTktrhKATaIsC6jRuMg4pBCZuG/owGz/bQmq20FLIHmzyd0
 lAvKAmNKwQAoJRXbrqslJN0gV3cocHXtQrlYbnnf28CGJn+LC61DXPfmvazsV5wZoD
 8WM8ZJLOKbdzoVusNKBqNsa9+k/IhQ7+DQI6134Lq+HMG5apI8NvQUP+wnWb7W5lXN
 86HSdO0pEU5qQ==
Date: Thu, 27 Mar 2025 13:56:17 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: M Henning <mhenning@darkrefraction.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Message-ID: <Z-VK8eeA_7BURiBy@cassiopeiae>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com>
 <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
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

On Tue, Mar 25, 2025 at 07:40:56PM -0400, M Henning wrote:
> Okay, that sounds reasonable since I don't expect this to change very quickly.
> 
> Since I don't fully understand, is the suggestion here to:
> 1) add the interface as a function on nvkm_gr using the nvkm_gr_func
> vtable and store the actual data on r535_gr
> or
> 2) add the interface to NVIF (which IF?) and store the actual data on nvkm_gr
> ?

I think we want both.

1) I think the suggestion was to store the data directly in nvkm_gr, however the
   structure is indeed specific to r535, so I think, unfortunately, we need the
   vtable and store that data in r535_gr.

2) Yes, this should be passed through nvif. Unfortunately, I think it would need
   to be a whole new one (similar to the fifo one).

Maybe Ben can provide you some additional pointers one this? Mayber he can
suggest a shortcut, since he has patches queued to simplify the whole interface.

> 
> (Sorry, I don't understand how these layers are intended to fit together.))
> 
> On Thu, Mar 20, 2025 at 4:02 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Fri, Mar 21, 2025 at 05:57:55AM +1000, Ben Skeggs wrote:
> > > On 21/3/25 04:18, Danilo Krummrich wrote:
> > >
> > > > Hi Mel,
> > > >
> > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > >
> > > > > @@ -72,6 +75,9 @@ struct nvkm_device {
> > > > >                   bool armed;
> > > > >                   bool legacy_done;
> > > > >           } intr;
> > > > > +
> > > > > + bool has_zcull_info;
> > > > > + struct drm_nouveau_get_zcull_info zcull_info;
> > > > This is bypassing the nvif layer entirely. I think you should store the contents
> > > > of struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS in struct r535_gr and have an
> > > > nvif interface to access the data.
> > >
> > > I agree here, though nvkm_gr would be a better choice for a couple of
> > > reasons, not least that it's possible (and should be reasonably trivial) to
> > > support this on earlier GPUs - should someone desire to at a later point.
> >
> > I agree, if the interface is stable enough -- I don't know whether this is prone
> > to change or not.
