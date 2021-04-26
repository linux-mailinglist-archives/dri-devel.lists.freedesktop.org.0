Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA5C36B0FC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AA86E7D7;
	Mon, 26 Apr 2021 09:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A42589DB7;
 Mon, 26 Apr 2021 09:48:00 +0000 (UTC)
Date: Mon, 26 Apr 2021 09:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619430477;
 bh=RGp42g5AkFbBRTHfKb2ay/e4D0mGyWAUF4MYzjOlXck=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=s/MT4iKhj4Mer6wBjwyRiF4xbrLkmwDOe8izWgrUz+ZNumI97gNTuuw5vf4dbztul
 lBcrvJUYqKz9wi/xqK/N8C1m3z7HcufD71G1+hXAKwEnt9Eu5yaiQGvl9dloXwBJKd
 2YJn44JPqMjO9R1W+H99MPSBY+ppKGkYgMumzsXgvlJbQLNp5tFt4uWT6JiBThmDPW
 vvchRawj2eF9Rpl25z1OcJIWGctaua1ket9qKPdd2IFkHlpgb7DP71eKt+yE53n0az
 SxJf+T7srtClysjZex9O6ytR/6SeuJC1o0b5Skegu+xeLkGStrOrGmE44x7naxRIHQ
 CDI0NTV5SHkLQ==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Split render/display SoCs, Mesa's renderonly,
 and Wayland dmabuf hints
Message-ID: <aurl5CvR16-1g6666YVoAD59xPDW1u_VDaMT4IgXVp2R0-2lESoqW6B8S5F2KSCPDM8fNO6CxkTLx362HaMNFnSVJOeh2z-wsee8-z0JnW0=@emersion.fr>
In-Reply-To: <CAKMK7uEA5ZWfr=nCkB8aSwkO-trGEAxL1cfyz+iY1+92dRutiA@mail.gmail.com>
References: <a28f2wvjsZ0pMcKjyC4C5DgvT59Bn32JORf1DdTei3818_ZXYRGV19m5IpaWqELPeDNPSj2SRbMznfuCrCYmO0mLtpaxN5MprB3QRk3Isww=@emersion.fr>
 <CAPj87rO_DJtq6_XO400FK2u97CWXDo5Px21Q+svAPg8r+WEuCg@mail.gmail.com>
 <CAKMK7uEA5ZWfr=nCkB8aSwkO-trGEAxL1cfyz+iY1+92dRutiA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the feedback! Replying to both Daniels below.

On Tuesday, April 20th, 2021 at 1:14 PM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Tue, Apr 20, 2021 at 12:18 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> >> There are a few solutions:
> >>
> >> 1. Require compositors to discover the render device by trying to import
> >>    a buffer. For each available render device, the compositor would
> >>    allocate a buffer, export it as a DMA-BUF, import it to the
> >>    display-only device, then try to drmModeAddFB.
> >
> >
> > I don't think this is actually tractable? Assuming that 'allocate a buffer'
> > means 'obtain a gbm_device for the render node directly and allocate a
> > gbm_bo from it', even with compatible formats and modifiers this will fail
> > for more restrictive display hardware. imx-drm and pl111 (combined with vc4
> > on some Raspberry Pis) will fail this, since they'll take different
> > allocation paths when they're bound through kmsro vs. directly, accounting
> > for things like contiguous allocation. So we'd get false negatives on at
> > least some platforms.

Right. It would work for drivers using renderonly_create_gpu_import_for_resource,
but wouldn't work for drivers using renderonly_create_kms_dumb_buffer_for_resource.

Doing the reverse (creating a buffer on the display-only device, import it on
the render-only device) wouldn't work either, since some drivers will perform
DMA transfers under-the-hood without telling user-space. So the check would
succeed even if the pipeline is inefficient.

> >> 2. Allow compositors to query the render device magically opened by
> >>    kmsro. This could be done either via EGL_EXT_device_drm, or via a
> >>    new EGL extension.
> >
> > This would be my strong preference, and I don't entirely understand
> > anholt's pushback here. The way I see it, GBM is about allocation for
> > scanout, and EGL is about rendering. If, on a split GPU/display system, we
> > create a gbm_device from a KMS display-only device node, then creating an
> > EGLDisplay from that magically binds us to a completely different DRM GPU
> > node, and anything using that EGLDisplay will use that GPU device to
> > render.
> >
> > Being able to discover the GPU device node through the device query is
> > really useful, because it tells us exactly what implicit magic EGL did
> > under the hood, and about the device that EGL will use. Being able to
> > discover the display node is much less useful; it does tell us how GBM will
> > allocate buffers, but the user already knows which device is in use because
> > they supplied it to GBM. I see the display node as a property of GBM, and
> > the GPU node as a property of EGL, even if EGL does do (*waves hands*)
> > stuff under the hood to ensure the two are compatible.

GBM can be used for non-scanout allocation too. This is useful for clients that
want to have more control over the allocation parameters, the swapchain and
want to manage DMA-BUFs directly.

> > If we had EGL_EXT_explicit_device, things get even more weird, I think;
> > would the device query on an EGLDisplay created with a combination of a
> > gbm_device native display handle and an explicit EGLDevice handle return
> > the scanout device from GBM or the GPU device from EGL? On my reading, I'd
> > expect it to be the latter; if the queries returned very different things
> > based on whether GPU device selection was implicit (returning the KMS node)
> > or explicit (GPU node), that would definitely violate the principle of
> > least surprise.

Right now as implemented by Mesa, things are pretty weird indeed.
EGL_EXT_device_enumeration will only expose a list of one EGLDevice per DRM
render node, plus one EGLDevice for software rendering. If you create an
EGLDisplay from a gbm_device from a display-only device, then a new EGLDevice
for this display-only device gets created and is returned by
EGL_EXT_device_query.

It would make more sense to me to return the EGLDevice for the render-only
device in EGL_EXT_device_query. However that means we need to pass back this
information through Mesa's DRI interface and throught the Gallium interface.
That sounds pretty annoying, but was what I tried to suggest earlier here:

https://gitlab.freedesktop.org/mesa/mesa/-/issues/4178#note_815040

> >> 3. Allow compositors to query the kernel drivers to know which devices
> >>    are compatible with each other. Some uAPI to query a compatible
> >>    display device from a render-only device, or vice-versa, has been
> >>    suggested in the past.
> >
> >
> > What does 'compatible' mean? Would an Intel iGPU and and AMD dGPU be
> > compatible with each other? Would a Mali GPU bound to system memory through
> > AMBA be as compatible with the display controller as it would with an AMD
> > GPU on PCIE? I think a query which only exposed whether or not devices
> > could share dmabufs with each other is far too generic to be helpful for
> > the actual usecase we have, as well as not being useful enough for other
> > usecases ('well you _can_ use dmabufs from your AMD GPU on your Mali GPU,
> > but only if they were allocated in the right domain').

"Compatible" would mean that both devices can directly access the buffers
without doing any copy nor transfer. In other words, drivers using
kmsro/renderonly today would be compatible with each other.

> >> (1) has a number of limitations and gotchas. It requires allocating
> >> real buffers, this has a rather big cost for something done at
> >> compositor initialization time. It requires to select a buffer format
> >> and modifier compatible with both devices, so it can't be isolated in
> >> a simple function (and e.g. shared between all compositors in libdrm).
> >
> > We're already going to have to do throwaway allocations to make Intel's
> > tiled modes work; I'd rather not extend this out to doing throwaway
> > allocations across device combinations as well as modifier lists.
> >
> >> Some drivers will allow to drmModeAddFB buffers that can't be scanned
> >> out, and will only reject the buffer at atomic commit time.
> >
> > This is 100% a KMS driver bug and should be fixed there. It's not
> > catastrophic, since commits can fail for any reason or none at all and
> > compositors are expected to handle this, but they should absolutely be
> > rejecting buffers which can never be scanned out at all at AddFB time.

This is sometimes more tricky than expected. I was thinking of AMD here,
which has a "scanout" flag in the implicit buffer metadata, which indicates
whether a buffer can be scanned out. However the flag was introduced only
pretty recently and various code-paths still don't set it (old user-space,
dumb buffers iirc). This should be fixed, but in the meantime the kernel
needs to accept buffers that potentially can't be scanned out.

> Yup. Kernel is supposed to reject as early as possible, main points
> for scanning out something for display are
> - FD2HANDLE aka  dma-buf import. If it's not contig, but the device
> requires contig, it should fail here. This takes into account IOMMU,
> but hilariously there's some display IP where only half the CRTC are
> connected to an IOMMU, the other half needs physically contig memory
> ...
> - AddFB2, if you got any of the metadata combos wrong (like
> modifiers/fourcc, alignment and all that)
> - atomic TEST_ONLY for anything more specific for a given combo
> (running out of bw/special hw converters are the big ones)
>
> I think with more helper rollout we've gotten a lot better at this,
> but probably still lots of bugs around.
>
> >> (2) wouldn't work with non-EGL APIs such as Vulkan. Eric Anholt seemed
> >> pretty opposed to this idea, but I didn't fully understood why.
> >
> >
> > Well, Vulkan doesn't have GBM in the same way, right? In the Vulkan case,
> > we already know exactly what the GPU is, because it's the VkPhysicalDevice
> > you had to explicitly select to create the VkDevice etc; if you're using
> > GBM it's because you've _also_ created a gbm_device for the KMS node and
> > are allocating gbm_bos to import to VkDeviceMemory/VkImage, so you already
> > have both pieces of information. (If you're creating VkDeviceMemory/VkImage
> > in Vulkan then exporting dmabuf from there, since there's no way to specify
> > a target device, it's a blind guess as to whether it'll actually work for
> > KMS. Maybe it will! But maybe not.)

So far my plan for Vulkan was to create a GBM device for the DRM node used
by KMS, then select the VkPhysicalDevice that matches the DRM node (via
VK_EXT_physical_device_drm). Obviously that doesn't work for split
render/display SoCs, because there's no VkPhysicalDevice that matches the
display-only DRM node used for KMS. I also wouldn't want to pick _any_
VkPhysicalDevice, because that would be just a guessing game and can result
in very sub-optimal rendering pipelines.

The EGL query wouldn't be very helpful for Vulkan. A GBM query or a kernel
query would be much more useful.

> >> I don't know how feasible (3) is. The kernel drivers must be able to
> >> decide whether buffers coming from another driver can be scanned out,
> >> but how early can they give an answer? Can they give an answer solely
> >> based on a DRM node, and not a DMA-BUF?
> >
> >
> > Maybe! But maybe not.
>
> Just replying on this one: This feels a lot like the kernel should
> know about which mesa you have installed. Which really isn't the
> kernel's job.
>
> E.g. if you have a mesa without panfrost, then panfrost + some display
> kms thing is definitely not compatible. But if you have it installed,
> then they are. Feel free to make this arbitrarily more nasty with
> stuff like "mesa is there, supports the combo except not yet the
> specific afbc modifier combo you actually required".
>
> Unless I'm completely off this doesn't sound like something the kernel
> should be involved in at all.
>
> I think the one thing the kernel should provide here is which kind of
> backing storage types each device can work with, to cover stuff like
> cma vs scatter-gather shmem. The long-standing idea was to expose
> these as dma-buf heaps and then sprinkle some links in sysfs, but that
> idea is as far away from working code as ever.

I'm really not looking for a "please give me a guarantee that any buffer
allocated on device A will work on device B too". What I'm looking for is
much closer to the backing storage idea you're suggesting. Basically: if I
allocate a buffer on device A, and import it on device B, will this perform
any copy/transfer under the hood or not?

If any transfer is involved, I think the compositor should prefer allocating
an intermediate shadow buffer, and explicitly perform a blit.

> >> Feedback is welcome. Do you agree with the premise that compositors
> >> need access to the render node?
> >
> > Yes, strongly. Compositors may optimise for direct paths (e.g. direct
> > scanout of client buffers through KMS, directly providing client buffers to
> > media codecs for streaming) where possible. But they must always have a
> > 'device of last resort': if these optimal paths are not possible (your
> > codec doesn't like your client buffers, you can't do direct scanout because
> > a notification occluded your client content and you've run out of overlay
> > planes, you're on Intel and your display FIFO size is measured in bits),
> > the compositor needs to know that it can access the client buffers somehow.
> >
> > This is done by always importing into a GPU device - for most current
> > compositors as an EGLImage, for some others as a VkImage - and falling back
> > to GL composition paths, or GL blits, or even ReadPixels if strictly
> > necessary, so your client content continues to be accessible.
> >
> > There is no way to do this without telling the client what that GPU device
> > node is, so it can allocate accordingly. Thanks to the implicit device
> > selection performed when creating an EGLDisplay from a gbm_device, we
> > cannot currently discover what that device node is.
> >
> >>
> >> Do you have any other potential solution in mind?
> >
> >
> > I can't think of any right now, but am open to hearing them.
> >
> >>
> >> Which solution would you prefer?
> >
> >
> > For all the reasons above, strongly #2, i.e. that querying the DRM device
> > node from the EGLDevice returned by querying an EGLDisplay created from a
> > gbm_device, returns the GPU device's render node and not the KMS device's
> > primary node.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
