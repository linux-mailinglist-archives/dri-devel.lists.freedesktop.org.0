Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77D9401B37
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 14:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC9895F5;
	Mon,  6 Sep 2021 12:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A1895F5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 12:28:46 +0000 (UTC)
Date: Mon, 06 Sep 2021 12:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630931322;
 bh=vmU+T/xrgGb1gmsU027He64w7ty7p9WA2P8P6cNhQbA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=wmNCXk8y6j5RwvGgK/vYHCp6/FUP35KJO4Cc/uFPZa6AikMvyuw7C9vW0+Viw33TC
 m9xaNIaAqA6g9Cf4ZFAOUXq9Y0t9GEIxyGPlbhNCqPUNSFTCHuIBG6yjSWF0zG0DPd
 E2EYgf4O0aZA38Kow+af9h9Cydt2aBDwSpg2Z1UlvT328WLGD2b3r+g1CvxVDryjWv
 E1STaH3IsAyDD5BDDUZ4GWtJnJle97Oafv9gl59ItYovudoN21fFAMMOAKMaAUg/zi
 3uQzSm7GQbFG2Cp+LIiYeXNGfIbZKoEqpbA2TzUrVU6GMDkmc/TTaakL+flWVwtaAB
 ENY0gl0exLXIg==
To: Daniel Stone <daniels@collabora.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
Message-ID: <AqG6tXWB4u3qhQs6QV8AkOhbOhpAsenbzEKPlyG4IRBDtqevEHfx61dGX80b1U49N-nnoovcWzW1smGRlK6OhRrFkonCSFMalVxbhgdoNuE=@emersion.fr>
In-Reply-To: <20210905122742.86029-1-daniels@collabora.com>
References: <20210905122742.86029-1-daniels@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Since there's a lot of confusion around this, document both the rules
> and the best practice around negotiating, allocating, importing, and
> using buffers when crossing context/process/device/subsystem boundaries.
>
> This ties up all of dmabuf, formats and modifiers, and their usage.
>
> Signed-off-by: Daniel Stone <daniels@collabora.com>

Thanks a lot for this write-up! This looks very good to me, a few comments
below.

> ---
>
> This is just a quick first draft, inspired by:
>   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3197#note_104=
8637
>
> It's not complete or perfect, but I'm off to eat a roast then have a
> nice walk in the sun, so figured it'd be better to dash it off rather
> than let it rot on my hard drive.
>
>
>  .../gpu/exchanging-pixel-buffers.rst          | 285 ++++++++++++++++++
>  Documentation/gpu/index.rst                   |   1 +
>  2 files changed, 286 insertions(+)
>  create mode 100644 Documentation/gpu/exchanging-pixel-buffers.rst
>
> diff --git a/Documentation/gpu/exchanging-pixel-buffers.rst b/Documentati=
on/gpu/exchanging-pixel-buffers.rst
> new file mode 100644
> index 000000000000..75c4de13d5c8
> --- /dev/null
> +++ b/Documentation/gpu/exchanging-pixel-buffers.rst
> @@ -0,0 +1,285 @@
> +.. Copyright 2021 Collabora Ltd.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Exchanging pixel buffers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +As originally designed, the Linux graphics subsystem had extremely limit=
ed
> +support for sharing pixel-buffer allocations between processes, devices,=
 and
> +subsystems. Modern systems require extensive integration between all thr=
ee
> +classes; this document details how applications and kernel subsystems sh=
ould
> +approach this sharing for two-dimensional image data.
> +
> +It is written with reference to the DRM subsystem for GPU and display de=
vices,
> +V4L2 for media devices, and also to Vulkan, EGL and Wayland, for userspa=
ce
> +support, however any other subsystems should also follow this design and=
 advice.
> +
> +
> +Formats and modifiers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Each buffer must have an underlying format. This format describes the da=
ta which
> +can be stored and loaded for each pixel. Although each subsystem has its=
 own
> +format descriptions (e.g. V4L2 and fbdev), the `DRM_FORMAT_*` tokens sho=
uld be

RST uses double backticks for inline code blocks (applies to the whole docu=
ment).

> +reused wherever possible, as they are the standard descriptions used for
> +interchange.

Maybe mention that the canonical source of formats and modifiers can be fou=
nd
in include/uapi/drm/drm_fourcc.h.

> +Each `DRM_FORMAT_*` token describes the per-pixel data available, in ter=
ms of
> +the translation between one or more pixels in memory, and the color data
> +contained within that memory. The number and type of color channels are

Pekka uses the term "color value", which I find a bit better than repeating
"data".

> +described: whether they are RGB or YUV, integer or floating-point, the s=
ize
> +of each channel and their locations within the pixel memory, and the
> +relationship between color planes.
> +
> +For example, `DRM_FORMAT_ARGB8888` describes a format in which each pixe=
l has a
> +single 32-bit value in memory. Alpha, red, green, and blue, color channe=
ls are
> +available at 8-byte precision per channel, ordered respectively from mos=
t to
> +least significant bits in little-endian storage. As a more complex examp=
le,
> +`DRM_FORMAT_NV12` describes a format in which luma and chroma YUV sample=
s are
> +stored in separate memory planes, where the chroma plane is stored at ha=
lf the
> +resolution in both dimensions (i.e. one U/V chroma sample is stored for =
each 2x2
> +pixel grouping).
> +
> +Format modifiers describe a translation mechanism between these per-pixe=
l memory
> +samples, and the actual memory storage for the buffer. The most straight=
forward
> +modifier is `DRM_FORMAT_MOD_LINEAR`, describing a scheme in which each p=
ixel has
> +contiguous storage beginning at (0,0); each pixel's location in memory w=
ill be
> +`base + (y * stride) + (x * bpp)`. This is considered the baseline inter=
change
> +format, and most convenient for CPU access.

Hm, maybe in more simple terms we could explain that the pixels are stored
sequentially row-by-row from the top-left corner to the bottom-right one?

Maybe we can drop the "base" from the formula and say that each pixel's
location in memory will be at offset `y * stride + x * bpp`? Or maybe this =
is
confusing with offset being mentioned below as an additional parameter?

> +Modern hardware employs much more sophisticated access mechanisms, typic=
ally
> +making use of tiled access and possibly also compression. For example, t=
he
> +`DRM_FORMAT_MOD_VIVANTE_TILED` modifier describes memory storage where p=
ixels
> +are stored in 4x4 blocks arranged in row-major ordering, i.e. the first =
tile in
> +memory stores pixels (0,0) to (3,3) inclusive, and the second tile in me=
mory
> +stores pixels (4,0) to (7,3) inclusive.
> +
> +Some modifiers may modify the number of memory buffers required to store=
 the

Hm. I think that mentioning a "memory buffer" here is a bit confusing. It s=
eems
like this document is about exchanging "pixel buffers", each being composed=
 of
one or more "memory buffers". Maybe we can use "image" instead of "buffer" =
for
the higher-concept of "bunch of pixel values which can be displayed on scre=
en"?
That would align with user-space APIs like Vulkan and EGL.

> +data; for example, the `I915_FORMAT_MOD_Y_TILED_CCS` modifier adds a sec=
ond
> +memory buffer to RGB formats in which it stores data about the status of=
 every
> +tile, notably including whether the tile is fully populated with pixel d=
ata, or
> +can be expanded from a single solid color.

Is it a requirement that these two memory planes must be separate memory bu=
ffers
for I915_FORMAT_MOD_Y_TILED_CCS?

> +These extended layouts are highly vendor-specific, and even specific to
> +particular generations or configurations of devices per-vendor. For this=
 reason,
> +support of modifiers must be explicitly enumerated and negotiated by all=
 users
> +in order to ensure a compatible and optimal pipeline, as discussed below=
.
> +
> +
> +Dimensions and size
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Each pixel buffer must be accompanied by logical pixel dimensions. This =
refers
> +to the number of unique samples which can be extracted from, or stored t=
o, the
> +underlying memory storage. For example, even though a 1920x1080
> +`DRM_FORMAT_NV12` buffer has a luma plane containing 1920x1080 samples f=
or the Y
> +component, and 960x540 samples for the U and V components, the overall b=
uffer is
> +still described as having dimensions of 1920x1080.
> +
> +The in-memory storage of a buffer is not guaranteed to begin immediately=
 at the
> +base address of the underlying memory, nor is it guaranteed that the mem=
ory
> +storage is tightly clipped to either dimension.
> +
> +Each plane must therefore be described with an `offset` in bytes, which =
will be
> +added to the base address of the memory storage before performing any pe=
r-pixel
> +calculations. This may be used to combine multiple planes into a single =
pixel
> +buffer; for example, `DRM_FORMAT_NV12` may be stored in a single memory =
buffer
> +where the luma plane's storage begins immediately at the start of the bu=
ffer
> +with an offset of 0, and the chroma plane's storage begins after the off=
set of
> +the luma plane as expressed through its offset.

"and the chroma plane's storage follows, with its offset set to the size of=
 the
preceding luma plane"

is maybe a bit clearer?

> +Each plane must also have a `stride` in bytes, expressing the offset in =
memory
> +between two contiguous scanlines. For example, a `DRM_FORMAT_MOD_LINEAR`=
 buffer

Is "scanline" a better word than "row"? I personally find "row" a bit more
descriptive, but maybe "scanline" is technically more accurate.

> +with dimensions of 1000x1000 may have been allocated as if it were 1024x=
1000, in
> +order to allow for aligned access patterns. In this case, the buffer wil=
l still
> +be described with a width of 1000, however the stride will be `1024 * bp=
p`,
> +indicating that there are 24 pixels at the positive extreme of the x axi=
s whose
> +values are not significant.
> +
> +Buffers may also be padded further in the y dimension, simply by allocat=
ing a
> +larger area than would ordinarily be required. For example, many media d=
ecoders
> +are not able to natively output buffers of height 1080, but instead requ=
ire an
> +effective height of 1088 pixels. In this case, the buffer continues to b=
e
> +described as having a height of 1080, with the memory allocation for eac=
h buffer
> +being increased to account for the extra padding.
> +
> +
> +Enumeration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Every user of pixel buffers must be able to enumerate a set of supported=
 formats
> +and modifiers, described together. Within KMS, this is achieved with the
> +`IN_FORMATS` property on each DRM plane, listing the supported DRM forma=
ts, and
> +the modifiers supported for each format. In userspace, this is supported=
 through
> +the `EGL_EXT_image_dma_buf_import_modifiers` extension entrypoints for E=
GL, the
> +`VK_EXT_image_drm_format_modifier` extension for Vulkan, and the
> +`zwp_linux_dmabuf_v1` extension for Wayland.
> +
> +Each of these interfaces allows users to query a set of supported
> +format+modifier combinations.
> +
> +Negotiation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +It is the responsibility of userspace to negotiate an acceptable format+=
modifier
> +combination for its usage. This is performed through a simple intersecti=
on of
> +lists. For example, if a user wants to use Vulkan to render an image to =
be
> +displayed on a KMS plane, it must:
> +  - query KMS for the `IN_FORMATS` property for the given plane
> +  - query Vulkan for the supported formats for its physical device

=E2=80=A6 with the right VkImageUsageFlagBits and VkImageCreateFlagBits set=
? (Just to
make it clear the lists really depend on usage.)

> +  - intersect these formats to determine the most appropriate one
> +  - for this format, intersect the lists of supported modifiers for both=
 KMS and
> +    Vulkan, to obtain a final list of acceptable modifiers for that form=
at
> +
> +This intersection must be performed for all usages. For example, if the =
user
> +also wishes to encode the image to a video stream, it must query the med=
ia API
> +it intends to use for encoding for the set of modifiers it supports, and
> +additionally intersect against this list.
> +
> +If the intersection of all lists is an empty list, it is not possible to=
 share
> +buffers in this way, and an alternate strategy must be considered (e.g. =
using
> +CPU access routines to copy data between the different uses, with the
> +corresponding performance cost).
> +
> +The resulting modifier list is unsorted; the order is not significant.
> +
> +
> +Allocation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Once userspace has determined an appropriate format, and corresponding l=
ist of
> +acceptable modifiers, it must allocate the buffer. As there is no univer=
sal
> +buffer-allocation interface available at either kernel or userspace leve=
l, the
> +client makes an arbitrary choice of allocation interface such as Vulkan,=
 GBM, or
> +a media API.
> +
> +Each allocation request must take, at a minimum: the pixel format, a lis=
t of
> +acceptable modifiers, and the buffer's width and height. Each API may ex=
tend
> +this set of properties in different ways, such as allowing allocation in=
 more
> +than two dimensions, intended usage patterns, etc.
> +
> +The component which allocates the buffer will make an arbitrary choice o=
f what
> +it considers the 'best' modifier within the acceptable list for the requ=
ested
> +allocation, any padding required, and further properties of the underlyi=
ng
> +memory buffers such as whether they are stored in system or device-speci=
fic
> +memory, whether or not they are physically contiguous, and their cache m=
ode.
> +These properties of the memory buffer are not visible to userspace, howe=
ver the
> +`dma-heaps` API is an effort to address this.
> +
> +After allocation, the client must query the allocator to determine the a=
ctual
> +modifier selected for the buffer, as well as the per-plane offset and st=
ride.
> +Allocators are not permitted to vary the format in use, to select a modi=
fier not
> +provided within the acceptable list, nor to vary the pixel dimensions ot=
her than
> +the padding expressed through offset, stride, and size.
> +
> +
> +Import
> +=3D=3D=3D=3D=3D=3D
> +
> +To use a buffer within a different context, device, or subsystem, the us=
er
> +passes these parameters (format, modifier, width, height, and per-plane =
offset
> +and stride) to an importing API.
> +
> +Each memory plane is referred to by a buffer handle, which may be unique=
 or
> +duplicated within a buffer. For example, a `DRM_FORMAT_NV12` buffer may =
have the
> +luma and chroma buffers combined into a single memory buffer by use of t=
he
> +per-plane offset parameters, or they may be completely separate allocati=
ons in
> +memory. For this reason, each import and allocation API must provide a s=
eparate
> +handle for each plane.

Vulkan doesn't quite do this, by default it only allows one memory buffer p=
er
pixel buffer, and requires the driver to implement an additional extension =
when
the image is "disjoint". Later on, should we mention the inode as a way to
figure out whether all DMA-BUFs refer to the same memory buffer? Or maybe i=
t's
better to mention that in the Vulkan docs=E2=80=A6

> +Each kernel subsystem has its own types and interfaces for buffer manage=
ment.
> +DRM uses GEM buffer objects (BOs), V4L2 has its own references, etc. The=
se types
> +are not portable between contexts, processes, devices, or subsystems.
> +
> +To address this, `dma-buf` handles are used as the universal interchange=
 for
> +buffers. Subsystem-specific operations are used to export native buffer =
handles
> +to a `dma-buf` file descriptor, and to import those file descriptors int=
o a
> +native buffer handle. dma-buf file descriptors can be transferred betwee=
n
> +contexts, processes, devices, and subsystems.
> +
> +For example, a Wayland media player may use V4L2 to decode a video frame=
 into
> +a `DRM_FORMAT_NV12` buffer. This will result in two memory planes (luma =
and
> +chroma) being dequeued by the user from V4L2. These planes are then expo=
rted to
> +one dma-buf file descriptor per plane, these descriptors are then sent a=
long
> +with the metadata (format, modifier, width, height, per-plane offset and=
 stride)
> +to the Wayland server. The Wayland server will then import these file
> +descriptors as an EGLImage for use through EGL/OpenGL (ES), a VkImage fo=
r use
> +through Vulkan, or a `drm_fb` for use through KMS; each of these import
> +operations will take the same metadata and convert the dma-buf file desc=
riptors
> +into their native buffer handles.

It would be nice to mention that even if the intersected modifier list wasn=
't
empty, the import can fail if the buffer doesn't have the right constraints=
 for
the intended usage (e.g. bad alignment).

> +
> +Implicit modifiers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The concept of modifiers post-dates all of the subsystems mentioned abov=
e. As
> +such, it has been retrofitted into all of these APIs, and in order to en=
sure
> +backwards compatibility, support is needed for drivers and userspace whi=
ch do
> +not (yet) support modifiers.
> +
> +As an example, GBM is used to allocate buffers to be shared between EGL =
for
> +rendering and KMS for display. It has two entrypoints for allocating buf=
fers:
> +`gbm_bo_create` which only takes the format, width, height, and a usage =
token,
> +and `gbm_bo_create_with_modifiers` which extends this with a list of mod=
ifiers.
> +
> +In the latter case, the allocation is as discussed above, being provided=
 with a
> +list of acceptable modifiers that the implementation can choose from (or=
 fail if
> +it is not possible to allocate within those constraints). In the former =
case
> +where modifiers are not provided, the GBM implementation must make its o=
wn
> +choice as to what is likely to be the 'best' layout. Such a choice is en=
tirely
> +implementation-specific: some will internally use tiled layouts which ar=
e not
> +CPU-accessible if the implementation decides that is a good idea through
> +whatever heuristic. It is the implementation's responsibility to ensure =
that
> +this choice is appropriate.
> +
> +To support this case where the layout is not known because there is no a=
wareness
> +of modifiers, a special `DRM_FORMAT_MOD_INVALID` token has been defined.=
 This
> +pseudo-modifier declares that the layout is not known, and that the driv=
er
> +should use its own logic to determine what the underlying layout may be.

Just to drive the point home, maybe mention explicitly that INVALID !=3D LI=
NEAR?

> +There are four cases where this token may be used:
> +  - during enumeration, an interface may return `DRM_FORMAT_MOD_INVALID`=
, either
> +    as the sole member of a modifier list to declare that explicit modif=
iers are
> +    not supported, or as part of a larger list to declare that implicit =
modifiers
> +    may be used
> +  - during allocation, a user may supply `DRM_FORMAT_MOD_INVALID`, eithe=
r as the
> +    sole member of a modifier list (equivalent to not supplying a modifi=
er list
> +    at all) to declare that explicit modifiers are not supported and mus=
t not be
> +    used, or as part of a larger list to declare that an allocation usin=
g implicit
> +    modifiers is acceptable
> +  - in a post-allocation query, an implementation may return
> +    `DRM_FORMAT_MOD_INVALID` as the modifier of the allocated buffer to =
declare
> +    that the underlying layout is implementation-defined and that an exp=
licit
> +    modifier description is not available; per the above rules, this may=
 only be
> +    returned when the user has included `DRM_FORMAT_MOD_INVALID` as part=
 of the
> +    list of acceptable modifiers, or not provided a list
> +  - when importing a buffer, the user may supply `DRM_FORMAT_MOD_INVALID=
` as the
> +    buffer modifier (or not supply a modifier) to indicate that the modi=
fier is
> +    unknown for whatever reason; this is only acceptable when the buffer=
 has
> +    not been allocated with an explicit modifier

These are good rules, but only Wayland uses them. For instance GBM will ign=
ore
INVALID in modifier lists, and iirc KMS will error out if INVALID is suppli=
ed
at import time?

> +It follows from this that a buffer chain must be either fully implicit o=
r fully
> +explicit. For example, if a user wishes to allocate a buffer for use bet=
ween
> +GPU, display, and media, but the media API does not support modifiers, t=
hen the
> +user **must not** allocate the buffer with explicit modifiers and attemp=
t to
> +import the buffer into the media API with no modifier, but either perfor=
m the
> +allocation using implicit modifiers, or allocate the buffer for media us=
e
> +separately and copy between the two buffers.
> +
> +As one exception to the above, allocations may be 'upgraded' from implic=
it
> +to explicit modifiers. For example, if the buffer is allocated with
> +`gbm_bo_create` (taking no modifiers), the user may then query the modif=
ier with
> +`gbm_bo_get_modifier` and then use this modifier as an explicit modifier=
 token
> +if a valid modifier is returned.

Hm, I wonder if there's a good use-case for this upgrade? I feel like thing=
s
would be simpler without the exception.

> +When allocating buffers for exchange between different users and modifie=
rs are
> +not available, implementations are strongly encouraged to use
> +`DRM_FORMAT_MOD_LINEAR` for their allocation, as this is the universal b=
aseline
> +for exchange.

Maybe spell out that "users" may mean different APIs or different devices.
Sharing a pixel buffer between two separate devices via GBM will only work
if USE_LINEAR is provided.

> +Any new users - userspace programs and protocols, kernel subsystems, etc=
 -
> +wishing to exchange buffers must offer interoperability through dma-buf =
file
> +descriptors for memory planes, DRM format tokens to describe the format,=
 DRM
> +format modifiers to describe the layout in memory, at least width and he=
ight for
> +dimensions, and at least offset and stride for each memory plane.
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index b9c1214d8f23..cb12f2654ed7 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>     drm-kms
>     drm-kms-helpers
>     drm-uapi
> +   exchanging-pixel-buffers
>     driver-uapi
>     drm-client
>     drivers
> --
> 2.31.1
