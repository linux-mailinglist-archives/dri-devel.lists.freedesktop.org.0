Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0034AAD6AEA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E28B10E7B3;
	Thu, 12 Jun 2025 08:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QwVsPb6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41E310E78C;
 Thu, 12 Jun 2025 08:36:34 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11261D6;
 Thu, 12 Jun 2025 10:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1749717385;
 bh=E53Iev0SGLzeW/a7DteuShKZBtYGyift8mXfiu1vDtI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QwVsPb6jF1V2tkBZRKjn38YpurCT5Z3TmPGNt3trSE+m474O/LtVvfXM7navf4kUb
 QeVoyUKACIUmqlvX1iLqNq0h9UG3a97+zxKMaXZUkWglp4jPmqKqCPniX76PybLYbJ
 /T1WYsJZkNSG4X9yanIOHTKpCmQ0mQPhU97ryPbE=
Message-ID: <f174e1f4-e4af-49fa-b62f-dddcfbf42d73@ideasonboard.com>
Date: Thu, 12 Jun 2025 11:36:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org
References: <20250311155120.442633-1-tzimmermann@suse.de>
 <20250311155120.442633-3-tzimmermann@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250311155120.442633-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 11/03/2025 17:47, Thomas Zimmermann wrote:
> Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> scanline pitch and allocation size. Implementations of struct
> drm_driver.dumb_create can call the new helper for their size
> computations.
> 
> There is currently quite a bit of code duplication among DRM's
> memory managers. Each calculates scanline pitch and buffer size
> from the given arguments, but the implementations are inconsistent
> in how they treat alignment and format support. Later patches will
> unify this code on top of drm_mode_size_dumb() as much as possible.
> 
> drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> the given color mode. This makes the dumb-buffer interface behave
> similar the kernel's video= parameter. Current per-driver implementations
> again likely have subtle differences or bugs in how they support color
> modes.
> 
> The dumb-buffer UAPI is only specified for known color modes. These
> values describe linear, single-plane RGB color formats or legacy index
> formats. Other values should not be specified. But some user space
> still does. So for unknown color modes, there are a number of known
> exceptions for which drm_mode_size_dumb() calculates the pitch from
> the bpp value, as before. All other values work the same but print
> an error.
> 
> v4:
> - use %u conversion specifier (Geert)
> - list DRM_FORMAT_Dn in UAPI docs (Geert)
> - avoid dmesg spamming with drm_warn_once() (Sima)
> - add more information about bpp special case (Sima)
> - clarify parameters for hardware alignment
> - add a TODO item for DUMB_CREATE2
> v3:
> - document the UAPI semantics
> - compute scanline pitch from for unknown color modes (Andy, Tomi)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/gpu/todo.rst         |  28 ++++++
>  drivers/gpu/drm/drm_dumb_buffers.c | 132 +++++++++++++++++++++++++++++
>  include/drm/drm_dumb_buffers.h     |  14 +++
>  include/uapi/drm/drm_mode.h        |  50 ++++++++++-
>  4 files changed, 223 insertions(+), 1 deletion(-)
>  create mode 100644 include/drm/drm_dumb_buffers.h
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index c57777a24e03..f1bd741b06dc 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -515,6 +515,34 @@ Contact: Douglas Anderson <dianders@chromium.org>
>  
>  Level: Starter
>  
> +Implement a new DUMB_CREATE2 ioctl
> +----------------------------------
> +
> +The current DUMB_CREATE ioctl is not well defined. Instead of a pixel and
> +framebuffer format, it only accepts a color mode of vague semantics. Assuming
> +a linear framebuffer, the color mode gives and idea of the supported pixel
> +format. But userspace effectively has to guess the correct values. It really
> +only works reliable with framebuffers in XRGB8888. Userspace has begun to
> +workaround these limitations by computing arbitrary format's buffer sizes and
> +calculating their sizes in terms of XRGB8888 pixels.
> +
> +One possible solution is a new ioctl DUMB_CREATE2. It should accept a DRM
> +format and a format modifier to resolve the color mode's ambiguity. As
> +framebuffers can be multi-planar, the new ioctl has to return the buffer size,
> +pitch and GEM handle for each individual color plane.
> +
> +In the first step, the new ioctl can be limited to the current features of
> +the existing DUMB_CREATE. Individual drivers can then be extended to support
> +multi-planar formats. Rockchip might require this and would be a good candidate.
> +
> +In addition to the kernel implementation, there must be user-space support
> +for the new ioctl. There's code in Mesa that might be able to use the new
> +call.
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>
> +
> +Level: Advanced
> +
>  
>  Core refactorings
>  =================
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index 9916aaf5b3f2..97cd3dcb79f1 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -25,6 +25,8 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_mode.h>
>  
> @@ -57,6 +59,136 @@
>   * a hardware-specific ioctl to allocate suitable buffer objects.
>   */
>  
> +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
> +			       unsigned long hw_pitch_align,
> +			       unsigned long hw_size_align)
> +{
> +	u32 pitch = args->pitch;
> +	u32 size;
> +
> +	if (!pitch)
> +		return -EINVAL;
> +
> +	if (hw_pitch_align)
> +		pitch = roundup(pitch, hw_pitch_align);
> +
> +	/* overflow checks for 32bit size calculations */
> +	if (args->height > U32_MAX / pitch)
> +		return -EINVAL;
> +

check_mul_overflow(args->height, pitch, &size)?

> +	if (!hw_size_align)
> +		hw_size_align = PAGE_SIZE;
> +	else if (!IS_ALIGNED(hw_size_align, PAGE_SIZE))
> +		return -EINVAL; /* TODO: handle this if necessary */
> +
> +	size = ALIGN(args->height * pitch, hw_size_align);
> +	if (!size)
> +		return -EINVAL;
> +
> +	args->pitch = pitch;
> +	args->size = size;
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> + * @dev: DRM device
> + * @args: Parameters for the dumb buffer
> + * @hw_pitch_align: Hardware scanline alignment in bytes
> + * @hw_size_align: Hardware buffer-size alignment in bytes
> + *
> + * The helper drm_mode_size_dumb() calculates the size of the buffer
> + * allocation and the scanline size for a dumb buffer. Callers have to
> + * set the buffers width, height and color mode in the argument @arg.
> + * The helper validates the correctness of the input and tests for
> + * possible overflows. If successful, it returns the dumb buffer's
> + * required scanline pitch and size in &args.
> + *
> + * The parameter @hw_pitch_align allows the driver to specifies an
> + * alignment for the scanline pitch, if the hardware requires any. The
> + * calculated pitch will be a multiple of the alignment. The parameter
> + * @hw_size_align allows to specify an alignment for buffer sizes. The
> + * provided alignment should represent requirements of the graphics
> + * hardware. drm_mode_size_dumb() handles GEM-related constraints
> + * automatically across all drivers and hardware. For example, the
> + * returned buffer size is always a multiple of PAGE_SIZE, which is
> + * required by mmap().
> + *
> + * Returns:
> + * Zero on success, or a negative error code otherwise.
> + */
> +int drm_mode_size_dumb(struct drm_device *dev,
> +		       struct drm_mode_create_dumb *args,
> +		       unsigned long hw_pitch_align,
> +		       unsigned long hw_size_align)
> +{
> +	u64 pitch = 0;
> +	u32 fourcc;
> +
> +	/*
> +	 * The scanline pitch depends on the buffer width and the color
> +	 * format. The latter is specified as a color-mode constant for
> +	 * which we first have to find the corresponding color format.
> +	 *
> +	 * Different color formats can have the same color-mode constant.
> +	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> +	 * It is possible to use different formats for dumb-buffer allocation
> +	 * and rendering as long as all involved formats share the same
> +	 * color-mode constant.
> +	 */
> +	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> +	if (fourcc != DRM_FORMAT_INVALID) {
> +		const struct drm_format_info *info = drm_format_info(fourcc);
> +
> +		if (!info)
> +			return -EINVAL;
> +		pitch = drm_format_info_min_pitch(info, 0, args->width);
> +	} else if (args->bpp) {
> +		/*
> +		 * Some userspace throws in arbitrary values for bpp and
> +		 * relies on the kernel to figure it out. In this case we
> +		 * fall back to the old method of using bpp directly. The
> +		 * over-commitment of memory from the rounding is acceptable
> +		 * for compatibility with legacy userspace. We have a number
> +		 * of deprecated legacy values that are explicitly supported.
> +		 */
> +		switch (args->bpp) {
> +		default:
> +			drm_warn_once(dev,
> +				      "Unknown color mode %u; guessing buffer size.\n",
> +				      args->bpp);
> +			fallthrough;
> +		/*
> +		 * These constants represent various YUV formats supported by
> +		 * drm_gem_afbc_get_bpp().
> +		 */
> +		case 12: // DRM_FORMAT_YUV420_8BIT
> +		case 15: // DRM_FORMAT_YUV420_10BIT
> +		case 30: // DRM_FORMAT_VUY101010
> +			fallthrough;
> +		/*
> +		 * Used by Mesa and Gstreamer to allocate NV formats and others
> +		 * as RGB buffers. Technically, XRGB16161616F formats are RGB,
> +		 * but the dumb buffers are not supposed to be used for anything
> +		 * beyond 32 bits per pixels.
> +		 */
> +		case 10: // DRM_FORMAT_NV{15,20,30}, DRM_FORMAT_P010
> +		case 64: // DRM_FORMAT_{XRGB,XBGR,ARGB,ABGR}16161616F
> +			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> +			break;
> +		}
> +	}
> +
> +	if (!pitch || pitch > U32_MAX)
> +		return -EINVAL;
> +
> +	args->pitch = pitch;
> +
> +	return drm_mode_align_dumb(args, hw_pitch_align, hw_size_align);
> +}
> +EXPORT_SYMBOL(drm_mode_size_dumb);
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>  			 struct drm_mode_create_dumb *args,
>  			 struct drm_file *file_priv)
> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> new file mode 100644
> index 000000000000..1f3a8236fb3d
> --- /dev/null
> +++ b/include/drm/drm_dumb_buffers.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DRM_DUMB_BUFFERS_H__
> +#define __DRM_DUMB_BUFFERS_H__
> +
> +struct drm_device;
> +struct drm_mode_create_dumb;
> +
> +int drm_mode_size_dumb(struct drm_device *dev,
> +		       struct drm_mode_create_dumb *args,
> +		       unsigned long hw_pitch_align,
> +		       unsigned long hw_size_align);
> +
> +#endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..efe8f5ad35ee 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
>   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>   * @height: buffer height in pixels
>   * @width: buffer width in pixels
> - * @bpp: bits per pixel
> + * @bpp: color mode
>   * @flags: must be zero
>   * @handle: buffer object handle
>   * @pitch: number of bytes between two consecutive lines
> @@ -1066,6 +1066,54 @@ struct drm_mode_crtc_page_flip_target {
>   *
>   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>   * the kernel fills @handle, @pitch and @size.
> + *
> + * The value of @bpp is a color-mode number describing a specific format
> + * or a variant thereof. The value often corresponds to the number of bits
> + * per pixel for most modes, although there are exceptions. Each color mode
> + * maps to a DRM format plus a number of modes with similar pixel layout.
> + * Framebuffer layout is always linear.
> + *
> + * Support for all modes and formats is optional. Even if dumb-buffer
> + * creation with a certain color mode succeeds, it is not guaranteed that
> + * the DRM driver supports any of the related formats. Most drivers support
> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> + * plane.
> + *
> + * +------------+------------------------+------------------------+
> + * | Color mode | Framebuffer format     | Compatible formats     |
> + * +============+========================+========================+
> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_BGRX8888 |
> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> + * |            |                        |  * DRM_FORMAT_XBGR8888 |
> + * +------------+------------------------+------------------------+
> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> + * +------------+------------------------+------------------------+
> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> + * +------------+------------------------+------------------------+
> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_BGRX1555 |
> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> + * |            |                        |  * DRM_FORMAT_XBGR1555 |
> + * +------------+------------------------+------------------------+
> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_D8       |
> + * |            |                        |  * DRM_FORMAT_R8       |
> + * +------------+------------------------+------------------------+
> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_D4       |
> + * |            |                        |  * DRM_FORMAT_R4       |
> + * +------------+------------------------+------------------------+
> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_D2       |
> + * |            |                        |  * DRM_FORMAT_R2       |
> + * +------------+------------------------+------------------------+
> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_D1       |
> + * |            |                        |  * DRM_FORMAT_R1       |
> + * +------------+------------------------+------------------------+
> + *
> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> + * legacy user space. Please don't use them in new code. Other modes
> + * are not support.
> + *
> + * Do not attempt to allocate anything but linear framebuffer memory
> + * with single-plane RGB data. Allocation of other framebuffer
> + * layouts requires dedicated ioctls in the respective DRM driver.
>   */
>  struct drm_mode_create_dumb {
>  	__u32 height;

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

